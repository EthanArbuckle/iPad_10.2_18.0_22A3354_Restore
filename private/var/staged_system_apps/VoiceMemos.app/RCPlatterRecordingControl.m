@implementation RCPlatterRecordingControl

- (RCPlatterRecordingControl)initWithDiameter:(double)a3
{
  RCPlatterRecordingControl *v3;
  RCPlatterRecordingControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCPlatterRecordingControl;
  v3 = -[RCRecordingControl initWithDiameter:](&v6, "initWithDiameter:", a3);
  v4 = v3;
  if (v3)
    -[RCRecordingControl setRecordingControlState:animated:force:](v3, "setRecordingControlState:animated:force:", 2, 0, 0);
  return v4;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  -[RCRecordingControl diameter](self, "diameter");
  objc_msgSend(v3, "recordingControlHeightForDiameter:");
  v5 = v4;

  v6 = v5;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

@end
