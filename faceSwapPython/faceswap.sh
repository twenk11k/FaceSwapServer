. env/bin/activate

VIDEO_NAME='video1'
VIDEO_FULL_NAME=$VIDEO_NAME'.mp4'
FOLDER_INPUT='imgs/frames_'$VIDEO_NAME
FOLDER_APPEND='/video%0d.jpg'
FOLDER_OUTPUT='results/frames_'$VIDEO_NAME'_o'
OUTPUT_FILE_LOCATION='outputs/'$VIDEO_FULL_NAME
VIDEO_INPUT='videos/'$VIDEO_FULL_NAME
VIDEO_OUTPUT='videos/'$VIDEO_NAME'_0.mp4'
TIME_START=1135
LENGTH=5
FRAME=24
FRAME_END=$(($LENGTH*$FRAME))
SECOND=1
YOUTUBE_URL='https://www.youtube.com/watch?v=jicIk7YpfqI'
IMAGE_DST='imgs/dst.jpg'

youtube-dl -f 22 -o $VIDEO_INPUT $YOUTUBE_URL
ffmpeg -ss $TIME_START -i $VIDEO_INPUT -t $LENGTH $VIDEO_OUTPUT 
mkdir $FOLDER_INPUT
ffmpeg -i $VIDEO_OUTPUT -r $FRAME/$SECOND $FOLDER_INPUT$FOLDER_APPEND
mkdir $FOLDER_OUTPUT
python main.py --dst $IMAGE_DST --frame_end $FRAME_END --input_folder $FOLDER_INPUT --output_folder $FOLDER_OUTPUT --correct_color
deactivate
ffmpeg -framerate 24 -i $FOLDER_OUTPUT$FOLDER_APPEND -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" $OUTPUT_FILE_LOCATION
rm -r -f $FOLDER_INPUT
rm -r -f $FOLDER_OUTPUT










