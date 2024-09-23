@implementation PTTapToTrackPrediction

- (PTTapToTrackPrediction)initWithRect:(CGRect)a3 confidence:(float)a4
{
  double height;
  double width;
  double y;
  double x;
  PTTapToTrackPrediction *v9;
  PTTapToTrackPrediction *v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)PTTapToTrackPrediction;
  v9 = -[PTTapToTrackPrediction init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    -[PTTapToTrackPrediction setRect:](v9, "setRect:", x, y, width, height);
    *(float *)&v11 = a4;
    -[PTTapToTrackPrediction setConfidence:](v10, "setConfidence:", v11);
  }
  return v10;
}

- (CGRect)rect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_rect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_rect, &v3, 32, 1, 0);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

@end
