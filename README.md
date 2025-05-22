# 🦠 SIR Model Simulation in MATLAB

This project explores **epidemiological modeling** using **discrete-time SIR models** in MATLAB. It simulates how diseases spread through populations under varying assumptions, including total population changes and loss of immunity.

## 🔬 What’s Inside

- **Part 1 – Basic SIR Model**  
  Models the spread of a disease in a closed population using constant parameters.
  
- **Part 2 – Variable Population SIR Model**  
  Includes births, deaths, and infection-related mortality in the total population over time.

- **Part 3 – Immunity Loss SIR Model**  
  Adds the possibility of losing immunity, where recovered individuals may return to the susceptible group.

## 📈 Features

- Discrete updates using custom functions (no built-in solvers)
- Multi-part plotting with `plot()` and `linspace()`
- Variable control of transmission (`α`), recovery (`β`), death (`γ`), birth/death (`μ`), and immunity loss (`ω`)
- Visualizations:  
  - Time evolution of susceptible, infected, recovered, and total populations  
  - Phase plot: Infected vs. Susceptible

## 🧪 Topics Covered

- SIR (Susceptible-Infected-Recovered) modeling
- Epidemiology & population dynamics
- Discrete equation modeling
- Immunity waning models
- Parameter sensitivity

## 🚀 How to Run

1. Open MATLAB
2. Make sure `Project5.m` is in your working directory
3. Run it by typing:

```matlab
Project5
