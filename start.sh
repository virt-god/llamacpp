#!/usr/bin/bash

# activates conda env with llama-cpp-python
eval "$(conda shell.bash hook)"
conda activate llama

#python -m llama_cpp.server --h # uncomment this line for options

# list contents of models dir with selectable options
select choice in $(ls models)
do
    if [ "$choice" == "" ]; then
        echo "models dir is empty"
        break
    fi

    if [ "$choice" != "" ]; then
        echo "You selected $choice"
        break
    fi
done

# runs llama-cpp-python server
python -m llama_cpp.server \
    --model models/$choice \
    --n_gpu_layers 35 \
    --n_threads 16 \
    --n_ctx 6144 \
    --port "8001"
