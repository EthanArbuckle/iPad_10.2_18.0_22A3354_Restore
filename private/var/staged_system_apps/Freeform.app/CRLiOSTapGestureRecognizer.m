@implementation CRLiOSTapGestureRecognizer

- (void)reset
{
  objc_super v2;

  self->_tapCount = 0;
  self->_firstTapLocation = CGPointZero;
  self->_savedFirstTapLocation = 0;
  self->_touchTypeForTap = 0;
  v2.receiver = self;
  v2.super_class = (Class)CRLiOSTapGestureRecognizer;
  -[CRLiOSTapGestureRecognizer reset](&v2, "reset");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  CRLiOSTapGestureRecognizer *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allTouches"));
  v9 = objc_msgSend(v8, "count");
  v10 = -[CRLiOSTapGestureRecognizer numberOfTouchesRequired](self, "numberOfTouchesRequired");

  if (v9 <= v10)
  {
    v17.receiver = self;
    v17.super_class = (Class)CRLiOSTapGestureRecognizer;
    -[CRLiOSTapGestureRecognizer touchesBegan:withEvent:](&v17, "touchesBegan:withEvent:", v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
    if (!self->_savedFirstTapLocation)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSTapGestureRecognizer view](self, "view"));
      -[CRLiOSTapGestureRecognizer locationInView:](self, "locationInView:", v14);
      self->_firstTapLocation.x = v15;
      self->_firstTapLocation.y = v16;

      self->_savedFirstTapLocation = 1;
    }
    self->_tapCount = (unint64_t)objc_msgSend(v13, "tapCount");
    self->_touchTypeForTap = (int64_t)objc_msgSend(v13, "type");

  }
  else
  {
    if (-[CRLiOSTapGestureRecognizer state](self, "state"))
    {
      v11 = self;
      v12 = 4;
    }
    else
    {
      v11 = self;
      v12 = 5;
    }
    -[CRLiOSTapGestureRecognizer setState:](v11, "setState:", v12);
  }

}

- (CGPoint)firstTapLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_firstTapLocation.x;
  y = self->_firstTapLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (unint64_t)tapCount
{
  return self->_tapCount;
}

- (int64_t)touchTypeForTap
{
  return self->_touchTypeForTap;
}

@end
