# typhoon

This is a script I use to download typhoon paths from HKO once an hour. Basically I get the "image ID" for the typhoon from https://www.hko.gov.hk/en/wxinfo/currwx/tc_fixarea.htm , and then pass it to this guy.

## Timelapse video

The images can be concatenated to a video via ffmpeg, e.g. something like:

```
cat *.png | ffmpeg -framerate 6 -i - -c:v libx264 -crf 0 output2.mp4
```

Tune the framerate and CRF as you wish


## Dupes

If you leave the script running too long (like I do) then you will download dupes once HKO stops updating the image. (Or there may be dupes if HKO updates it less often, e.g. every 2 or 6 hours).

To get rid of dupes we can hash the image and redirect all the unique ones via:

```
find . -maxdepth 1 -name "*.png" -print0 | xargs -0 shasum | sort | uniq -w 40 | awk '{print $2}' | sort > uniq.txt
```

And then tell ffmpeg to concat them via:

```
printf "file '%s'\n" $(cat uniq.txt) > list.txt
ffmpeg -f concat -safe 0 -r 6 -i list.txt -c:v libx264 -crf 0 -vf "fps=6,format=yuv420p" output.mp4
```
