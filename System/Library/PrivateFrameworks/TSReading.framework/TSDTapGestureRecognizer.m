@implementation TSDTapGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  TSDTapGestureRecognizer *v7;
  uint64_t v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;

  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "allTouches"), "count") < 2)
  {
    v12.receiver = self;
    v12.super_class = (Class)TSDTapGestureRecognizer;
    -[TSDTapGestureRecognizer touchesBegan:withEvent:](&v12, sel_touchesBegan_withEvent_, a3, a4);
    v9 = (void *)objc_msgSend(a3, "anyObject");
    if (!self->mSavedFirstTapLocation)
    {
      -[TSDTapGestureRecognizer locationInView:](self, "locationInView:", 0);
      self->mFirstTapLocation.x = v10;
      self->mFirstTapLocation.y = v11;
      self->mSavedFirstTapLocation = 1;
    }
    self->mTapCount = objc_msgSend(v9, "tapCount");
  }
  else
  {
    if (-[TSDTapGestureRecognizer state](self, "state"))
    {
      v7 = self;
      v8 = 4;
    }
    else
    {
      v7 = self;
      v8 = 5;
    }
    -[TSDTapGestureRecognizer setState:](v7, "setState:", v8);
  }
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDTapGestureRecognizer;
  -[TSDTapGestureRecognizer reset](&v3, sel_reset);
  self->mTapCount = 0;
  self->mFirstTapLocation = (CGPoint)*MEMORY[0x24BDBEFB0];
  self->mSavedFirstTapLocation = 0;
}

- (CGPoint)firstTapLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->mFirstTapLocation.x;
  y = self->mFirstTapLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (unint64_t)tapCount
{
  return self->mTapCount;
}

@end
