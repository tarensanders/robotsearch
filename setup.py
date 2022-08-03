from setuptools import find_packages, setup

install_requires = ['scipy==1.5.2',
					'numpy==1.16.1',
					'tensorflow==1.5.0',
					'scikit_learn==0.23.2',
					'keras==2.1.5',
					'h5py==2.7.1']

setup(name='robotsearch',
      author='Iain Marshall',
      author_email="mail@ijmarshall.com",
      version='0.1.3',
      install_requires=install_requires,
      entry_points = {
    	'console_scripts': [
        'robotsearch = robotsearch.__main__:main',
    	]},
      package_data={'robotsearch': ['data/rct/*.*']},
      packages=find_packages(),
)
