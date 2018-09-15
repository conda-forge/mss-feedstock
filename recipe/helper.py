import os
try:
     import conda
except ImportError:
     print(os.getenv('PROJ_LIB'))
     conda = None
     
if conda is not None or os.getenv('CONDA_PREFIX') is None:
    conda_file_dir = conda.__file__
    conda_dir = conda_file_dir.split('lib')[0]
    proj_lib = os.path.join(os.path.join(conda_dir, 'share'), 'proj')
    os.environ['PROJ_LIB'] = proj_lib
    print(proj_lib)

