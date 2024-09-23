@implementation ICPlatterRecordingControl

- (ICPlatterRecordingControl)initWithDiameter:(double)a3
{
  ICPlatterRecordingControl *v3;
  ICPlatterRecordingControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICPlatterRecordingControl;
  v3 = -[ICRecordingControl initWithDiameter:](&v6, sel_initWithDiameter_, a3);
  v4 = v3;
  if (v3)
    -[ICRecordingControl setRecordingControlState:animated:force:](v3, "setRecordingControlState:animated:force:", 2, 0, 0);
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[ICRecordingControl diameter](self, "diameter");
  v3 = v2 + -2.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

@end
