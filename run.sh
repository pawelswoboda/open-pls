#! /bin/bash

time_out=10
random_seed=0
graph_file=data/graph-seed103001404-AM1.graphml
metis_file=`echo $graph_file | sed -e "s/graphml$/graph/g"`
weight_file=$metis_file.weights

echo "Converting graphml to METIS and weight files..."
python utils/graphml_to_metis2.py < $graph_file > $metis_file
python utils/graphml_to_weights.py < $graph_file > $weight_file

make
./bin/pls --algorithm=mwis --input-file=$metis_file --weighted --use-weight-file --timeout=$time_out --random-seed=$random_seed
