# swig path
export PATH=$PATH:/usr/local/share/swig/3.0.12:/usr/local/swig3/bin/
# train
python train.py --weights weights/yolov5m.pt --data data/yolov5obb_demo_split.yaml --batch-size 2 --device 0
# val
python val.py --data data/yolov5obb_demo_split.yaml --img 1024 --conf 0.01 --iou 0.4 --task 'test' --batch 16 --save-json  --device 1 --weights runs/train/exp3/weights/best.pt
python detect.py --source dataset/DOTAv1.5/val_split_rate1.0_subsize1024_gap200/images/ --imgsz 1024 --conf 0.01 --iou 0.4 --device 1 --weights runs/train/exp3/weights/best.pt
