@implementation OADAdjustRect

- (OADAdjustRect)initWithLeft:(OADAdjustCoord)a3 top:(OADAdjustCoord)a4 right:(OADAdjustCoord)a5 bottom:(OADAdjustCoord)a6
{
  OADAdjustRect *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)OADAdjustRect;
  result = -[OADAdjustRect init](&v11, sel_init);
  if (result)
  {
    result->mLeft = a3;
    result->mTop = a4;
    result->mRight = a5;
    result->mBottom = a6;
  }
  return result;
}

- (OADAdjustCoord)left
{
  return self->mLeft;
}

- (OADAdjustCoord)right
{
  return self->mRight;
}

- (OADAdjustCoord)top
{
  return self->mTop;
}

- (OADAdjustCoord)bottom
{
  return self->mBottom;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADAdjustRect;
  -[OADAdjustRect description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
