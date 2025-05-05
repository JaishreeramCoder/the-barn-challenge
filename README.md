# The BARN Challenge

This repository contains code and analysis for the BARN ICRA Navigation Challenge using a LICS-based model in a Singularity container.

---

## 🔧 Installation

1. **Install Singularity** (version ≥ 3.6.3 and ≤ 4.02):
   Follow the official guide: [https://sylabs.io/guides/3.0/user-guide/installation.html](https://sylabs.io/guides/3.0/user-guide/installation.html)

2. **Clone the repository**:

   ```bash
   git clone https://github.com/JaishreeramCoder/the-barn-challenge.git
   cd the-barn-challenge
   ```

3. **Build the Singularity image** (requires `sudo`):

   ```bash
   sudo singularity build --notest nav_competition_image.sif Singularityfile.def
   ```

---

## 🚀 Running Simulations

All experiments are executed inside the Singularity container:

```bash
./singularity_run.sh /path/to/nav_competition_image.sif python3 run.py --world_idx 0
```

* `--world_idx`: index of the BARN environment (0–359)
* `--out` (optional): path to output log (default: `out.txt`)

To sweep **all 360** environments:

```bash
chmod +x run_all_worlds.sh
./run_all_worlds.sh
```

This will generate `results/out.txt` containing one line per world.

---

## 📊 Results Logging Format

Each line in `results/out.txt` has 6 space-separated fields:

```
world_idx  success  collided  timeout  actual_time(s)  nav_metric
```

* **world\_idx**: integer 0–359
* **success**: 1 if goal reached, else 0
* **collided**: 1 if collision occurred, else 0
* **timeout**: 1 if time limit reached (≥100 s), else 0
* **actual\_time(s)**: runtime in seconds
* **nav\_metric**: efficiency score (0 on failure)

---

## 📈 Data Analysis

All analysis scripts and the Jupyter notebook are included under `analysis/`. Key steps:

1. **Summary Tables**

   * Split into two tables:

     * **Runs & Outcome %** (Runs, Success %, Collision %, Timeout %)
     * **Average Metrics** (Avg nav\_metric, Avg actual\_time)
   * Rendered with Matplotlib’s table API.

2. **Stacked Bar Chart**

   * Shows Success/Collision/Timeout percentages for **Static** (world\_idx < 300) vs **Dynamic** (world\_idx ≥ 300) environments.

3. **Additional Plots**

   * **Line Plot**: `nav_metric` vs `world_idx` to identify hard maps.

---

## 📂 Repository Structure

```
├── run.py                 # main runner
├── singularity_run.sh     # wrapper to invoke Singularity
├── run_all_worlds.sh      # batch execution script
├── results/
│   └── out.txt            # raw logs
├── analysis/
│   ├── analysis.ipynb     # Jupyter notebook
│   └── plots/             # generated figures
└── README.md
```

---

For questions or contributions, please open an issue on GitHub.