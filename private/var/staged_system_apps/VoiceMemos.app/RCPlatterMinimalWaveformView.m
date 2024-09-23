@implementation RCPlatterMinimalWaveformView

- (unint64_t)numberOfSlices
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "platterMinimalViewSliceCount");

  return (unint64_t)v3;
}

@end
