@implementation PFLCCurationPositionScore

- (PFLCCurationPositionScore)initWithCropScore:(double)a3 cropRect:(CGRect)a4 timeLabelRect:(CGRect)a5 classification:(unint64_t)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PFLCCurationPositionScore *result;
  objc_super v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)PFLCCurationPositionScore;
  result = -[PFLCCurationPositionScore init](&v13, sel_init);
  if (result)
  {
    result->_cropScore = a3;
    result->_cropRect.origin.x = x;
    result->_cropRect.origin.y = y;
    result->_cropRect.size.width = width;
    result->_cropRect.size.height = height;
    result->_timeLabelRect = a5;
    result->_classification = a6;
  }
  return result;
}

- (id)description
{
  void *v3;
  double cropScore;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  cropScore = self->_cropScore;
  _rectAsString(self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _rectAsString(self->_timeLabelRect.origin.x, self->_timeLabelRect.origin.y, self->_timeLabelRect.size.width, self->_timeLabelRect.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PositionScore[ crop=%.3f, rect=%@, time=%@, clas=%ld ]"), *(_QWORD *)&cropScore, v5, v6, self->_classification);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)cropScore
{
  return self->_cropScore;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)timeLabelRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_timeLabelRect.origin.x;
  y = self->_timeLabelRect.origin.y;
  width = self->_timeLabelRect.size.width;
  height = self->_timeLabelRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)classification
{
  return self->_classification;
}

@end
