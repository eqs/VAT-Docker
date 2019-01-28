#!/bin/bash

wget http://images.cocodataset.org/annotations/annotations_trainval2017.zip
unzip annotations_trainval2017.zip
python -m annotation_tools.db_dataset_utils \
	--action load \
	--dataset ./annotations/person_keypoints_val2017.json \
	--normalize

