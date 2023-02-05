# RobotSearch

> **Note**
> This is a lightly edited fork of the [original repo](https://github.com/ijmarshall/robotsearch).

Welcome to RobotSearch, software for filtering RCTs from a search result as described in [our paper](https://doi.org/10.1002/jrsm.1287) in the Journal of Research Synthesis Methods.

[Marshall I, Storr AN, Kuiper J, Thomas J, Wallace BC. Machine Learning for Identifying Randomized Controlled Trials: an evaluation and practitioner's guide. Res Syn Meth. 2018. https://doi.org/10.1002/jrsm.1287](https://doi.org/10.1002/jrsm.1287)

We offer RobotSearch free of charge, but we'd be most grateful if you would cite us if you use it. We're academics, and thrive on links and citations! Getting RobotSearch widely used and cited helps us obtain the funding to maintain the project and make RobotSearch better.

It also makes your methods transparent to your readers, and not least we'd love to see where RobotSearch is used! :)

## Installation instructions

### Docker image (recommended)

1. To use the docker image you'll need to [install Docker](https://docs.docker.com/get-docker/)
2. Pull the repo onto your machine, using whatever method you like for this.
3. `cd` your way into the cloned repo.
4. Build the docker image with `docker build -t robotsearch .`. Expect this to take a couple of minutes.
5. Run the app with `./start.sh`. You don't need to run the docker image - `./start.sh` will take care of this.
6. Navigate to [http://localhost:5050](http://localhost:5050) in your browser to use the app.
7. When finished, use `docker stop robotsearch` to stop the container.

### Python package

1. To use as a Python package you will need an install of conda. [Miniconda](https://docs.conda.io/en/latest/miniconda.html) is a good choice.
2. Pull the repo onto your machine, using whatever method you like for this.
3. `cd` your way into the cloned repo.
4. Run `conda env create -f tmp/rs_env.yml` to create the environment with the required packages.
5. Activate the conda environment `conda activate robotsearch`.
6. Run `python setup.py install`.
7. You should now be able to run `robotsearch path_to_ris` to convert files, or import as a module.

## How it works

RobotSearch uses machine learning as an alternative to string-based study design filters.

It works with MEDLINE searches exported from either PubMed or Ovid.

1. You should conduct your search as normal (NB do not use any search terms or filters to restrict to RCTs at this stage!).
2. Then export your results in RIS format (see more detailed instrutions below on how to do this in PubMed and Ovid)
3. From the Command Prompt/Terminal, run the robotsearch command:
`robotsearch my_file.ris`
4. Your search results will be saved as `my_file_robotreviewer_RCTs.ris`

## Changing settings

By default, RobotSearch runs a *sensitive* search (i.e. very high likelihood that *all* RCTs will be retrieved, at expense of sometimes including non-RCTs) - this is suitable for a systematic review.

To run a *precise* search (i.e. the retrieved articles have a very high likelihood of being RCTs, but at the expense of missing a tiny proportion), run with an extra `-p` flag, e.g.:

`robotsearch my_file.ris -p`

## Exporting from PubMed

![How to export from PubMed](pubmed_export.png)

1. Select 'Send to' (located in the upper left of the search results)
2. Under 'Choose Destination' select File
3. Under 'Format', select 'MEDLINE' from the pulldown menu
4. Click the 'Create File' button

## Exporting from Ovid

![1. Exporting from Ovid - select 'All' in the top left, then click the Export text](ovid_export1.png)
![2. Exporting from Ovid - select 'EndNote' as the export format, then select 'Custom Fields', and click the 'Select Fields' button](ovid_export2.png) (**Endnote** format includes the 'publication type' field, the **RIS** format does not)
![2. Exporting from Ovid - select the following 3 fields to export: *ab*: Abstract, *pt*: Publication Type, and *ti*: Title](ovid_export3.png)

1. Click the tickbox next to **'All'** above the search results on the left hand side.
2. Click on Export
3. In the **'Export to'** pulldown menu, select 'RIS'
4. Under **'Select Fields to Display'** select 'Custom Fields', then click the 'Select Fields' button
5. In the **Select Fields** box, select the following fields: *ab*: Abstract, *pt*: Publication Type, and *ti*: Title. You may deselect any others.
6. Click 'Save' in the bottom left
7. Click 'Export Citation(s)' in the bottom right
8. The citations will be exported, but there may be a wait of a minute or two.

## Testing

RobotSearch has a optional test mode, which runs through a standardised search result, and double checks that the software is returning the same results as in the validation study. NB this takes around 5--10 minutes to run, depending on the speed of your machine.

To run this, type:

`robotsearch -t`

## Contributing/Using our machine learning in other tools

We would love software developers, and people who make biblographic databases to integrate this method into their systems. All the software is open source under the GNU GPL v3. Please contact us ([mail@ijmarshall.com](mailto:mail@ijmarshall.com)) to discuss further.

We also welcome contributions from the community; please contact us (or submit an issue via Github) if you are interested in improving the software.

## Using RobotSearch as a Python module

RobotSearch may be called as a Python module, from within the root directory. See the [example IPython notebook](https://github.com/ijmarshall/robotsearch/blob/master/Calling%20RobotSearch%20as%20a%20Python%20module.ipynb) for how to do this.

## Acknowledgements

This work is dependent on the work of the [Cochrane Crowd](http://crowd.cochrane.org/index.html), for whom we'd like to express enormous gratitude for their work, and in making their data available for training our machine learning models.

## Support

This work is supported by: National Institutes of Health (NIH) under the National Library of Medicine, grant R01-LM012086-01A1, "Semi-Automating Data Extraction for Systematic Reviews", and by NIH grant 5UH2CA203711-02, "Crowdsourcing Mark-up of the Medical Literature to Support Evidence-Based Medicine and Develop Automated Annotation Capabilities", and the UK Medical Research Council (MRC), through its Skills Development Fellowship program, grant MR/N015185/1

## Cite

If you use RobotSearch, we'd love it if you could cite our paper, and also let us know! (you can email mail@ijmarshall.com)

[Marshall IJ, Noel-Storr A, Kuiper J, Thomas J, Wallace BC. Machine Learning for Identifying Randomized Controlled Trials: an evaluation and practitioner's guide. Res Syn Meth. 2018. https://doi.org/10.1002/jrsm.1287](https://doi.org/10.1002/jrsm.1287)
