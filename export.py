"""导出: python export.py n"""
import subprocess
import sys
from pathlib import Path

EXP_DIR = Path(__file__).parent / "exp"
sys.path.insert(0, str(EXP_DIR))
from student_info import NAME, STUDENT_ID
N = sys.argv[1]
output = f"商务数据分析理论与方法_{STUDENT_ID}_{NAME}_实验{N}.html"
nb = EXP_DIR / f"exp{N}.ipynb"

subprocess.run([
    sys.executable, "-m", "jupyter", "nbconvert",
    "--to", "html",
    "--TagRemovePreprocessor.remove_input_tags=hide-input",
    "--output", output,
    str(nb),
])
