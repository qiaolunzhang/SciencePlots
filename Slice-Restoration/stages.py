import numpy as np
import matplotlib.pyplot as plt
import os

# seven_node_stages_equal_weight10_v1.csv


def get_seven_node_stages():
    stages = list(range(0, 11))
    objective_list = []
    objective_list.append(0)
    for i in range(1, 11):
        name = "seven_node_stages_equal_weight" + str(i) + "_v1.csv"
        name = os.path.join("results", name)
        try:
            with open(name, "r") as f:
                solve_time = f.readline()
                solve_time = float(solve_time)
                #print(solve_time)
                objective_list.append(solve_time)
        except Exception as e:
            print(e)
    return stages, objective_list


def plot_seven_node_stages():
    with plt.style.context(['science', 'ieee']):
        x_data, y_data = get_seven_node_stages()
        fig, ax = plt.subplots()
        ax.plot(x_data, y_data, label="ok")
        ax.legend(title='Objective value')
        ax.set(xlabel='Number of stages')
        ax.set(ylabel='Objective value')
        ax.autoscale(tight=True)
        fig.savefig('figures/fig2.pdf')
        fig.savefig('figures/fig2.jpg', dpi=300)


plot_seven_node_stages()