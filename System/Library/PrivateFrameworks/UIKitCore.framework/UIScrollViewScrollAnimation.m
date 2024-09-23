@implementation UIScrollViewScrollAnimation

- (BOOL)revealsVerticalScrollIndicator
{
  return self->_revealsVerticalScrollIndicator;
}

- (BOOL)revealsHorizontalScrollIndicator
{
  return self->_revealsHorizontalScrollIndicator;
}

- (void)adjustForContentOffsetDelta:(CGPoint)a3
{
  CGFloat v3;
  CGFloat v4;

  if (self->_adjustsForContentOffsetDelta)
  {
    v3 = a3.y + self->_originalOffset.y;
    self->_originalOffset.x = a3.x + self->_originalOffset.x;
    self->_originalOffset.y = v3;
    v4 = a3.y + self->_targetOffset.y;
    self->_targetOffset.x = a3.x + self->_targetOffset.x;
    self->_targetOffset.y = v4;
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIAnimation target](self, "target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_clearContentOffsetAnimation:", self);

  v4.receiver = self;
  v4.super_class = (Class)UIScrollViewScrollAnimation;
  -[UIScrollViewScrollAnimation dealloc](&v4, sel_dealloc);
}

- (void)setProgress:(float)a3
{
  void *v5;
  double y;
  double x;
  double v8;
  double v9;
  double accuracy;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  -[UIAnimation target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  x = self->_targetOffset.x;
  y = self->_targetOffset.y;
  v22 = v5;
  if (self->_targetOffsetValidAtStart)
  {
    if (objc_msgSend(v5, "_isAutomaticContentOffsetAdjustmentEnabled"))
    {
      objc_msgSend(v22, "_adjustedContentOffsetForContentOffset:", x, y);
      x = v8;
      y = v9;
    }
    v5 = v22;
  }
  accuracy = self->_accuracy;
  v11 = self->_originalOffset.x;
  v12 = a3;
  v13 = (x - v11) * a3;
  if (accuracy == 1.0)
  {
    v15 = round(v13);
    v16 = self->_originalOffset.y;
    v19 = round((y - v16) * v12);
  }
  else
  {
    v14 = floor(v13);
    v15 = v14 + round(accuracy * (v13 - v14)) / accuracy;
    v16 = self->_originalOffset.y;
    v17 = (y - v16) * v12;
    v18 = floor(v17);
    v19 = v18 + round(accuracy * (v17 - v18)) / accuracy;
  }
  v20 = v11 + v15;
  v21 = v16 + v19;
  objc_msgSend(v5, "_skipNextStartOffsetAdjustment");
  objc_msgSend(v22, "setContentOffset:", v20, v21);

}

- (float)progressForFraction:(float)a3
{
  float result;
  CABasicAnimation *customAnimation;
  void *v7;
  void *v8;
  double v9;
  float v10;
  double v11;
  double v12;
  objc_super v13;

  result = 1.0;
  if (a3 != 1.0)
  {
    customAnimation = self->_customAnimation;
    if (customAnimation)
    {
      -[CABasicAnimation timingFunction](customAnimation, "timingFunction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[CABasicAnimation timingFunction](self->_customAnimation, "timingFunction");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v9 = a3;
        objc_msgSend(v8, "_solveForInput:", v9);
        a3 = v10;

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *(float *)&v11 = a3;
        -[CABasicAnimation _solveForInput:](self->_customAnimation, "_solveForInput:", v11);
      }
      else
      {
        return a3;
      }
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)UIScrollViewScrollAnimation;
      *(float *)&v12 = a3;
      -[UIAnimation progressForFraction:](&v13, sel_progressForFraction_, v12);
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customAnimation, 0);
}

- (void)setRevealsHorizontalScrollIndicator:(BOOL)a3
{
  self->_revealsHorizontalScrollIndicator = a3;
}

- (void)setRevealsVerticalScrollIndicator:(BOOL)a3
{
  self->_revealsVerticalScrollIndicator = a3;
}

@end
