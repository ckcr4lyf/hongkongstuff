# typhoon

This is a script I use to download typhoon paths from HKO once an hour. Basically I get the "image ID" for the typhoon from https://www.hko.gov.hk/en/wxinfo/currwx/tc_fixarea.htm , and then pass it to this guy.

## Timelapse video

The images can be concatenated to a video via ffmpeg, e.g. something like:

```
cat *.png | ffmpeg -framerate 6 -i - -c:v libx264 -crf 0 output2.mp4
```

Tune the framerate and CRF as you wish
