@implementation RCWaveformSnapshotGenerator

+ (id)snapshotForComposition:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v6;
  RCApplicationWaveformRenderer *v7;
  id v8;
  double y;
  void *v10;
  id v11;
  void *v12;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v7 = objc_alloc_init(RCApplicationWaveformRenderer);
  -[RCApplicationWaveformRenderer setIsPlayback:](v7, "setIsPlayback:", 1);
  v8 = objc_msgSend(objc_alloc((Class)RCCompositionWaveformDataSource), "initWithComposition:", v6);

  objc_msgSend(v8, "beginLoading");
  objc_msgSend(v8, "waitUntilFinished");
  y = CGPointZero.y;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationWaveformRenderer view](v7, "view"));
  objc_msgSend(v10, "setFrame:", CGPointZero.x, y, width, height);

  -[RCWaveformRenderer setDataSource:](v7, "setDataSource:", v8);
  v11 = -[RCWaveformRenderer rasterizeTimeRange:imageSize:afterScreenUpdates:](v7, "rasterizeTimeRange:imageSize:afterScreenUpdates:", 1, RCTimeRangeMake(0.0, 6.0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

@end
