@implementation CRLCollaboratorCursorHUDPosition

- (CRLCollaboratorCursorHUDPosition)initWithPosition:(CGPoint)a3 direction:(unint64_t)a4
{
  CGFloat y;
  CGFloat x;
  CRLCollaboratorCursorHUDPosition *result;
  objc_super v8;

  y = a3.y;
  x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)CRLCollaboratorCursorHUDPosition;
  result = -[CRLCollaboratorCursorHUDPosition init](&v8, "init");
  if (result)
  {
    result->mPosition.x = x;
    result->mPosition.y = y;
    result->mDirection = a4;
    result->mAllowedToFlip = 1;
  }
  return result;
}

- (CRLCollaboratorCursorHUDPosition)init
{
  return -[CRLCollaboratorCursorHUDPosition initWithPosition:direction:](self, "initWithPosition:direction:", 2, CGPointZero.x, CGPointZero.y);
}

- (id)description
{
  unint64_t mDirection;
  uint64_t v4;
  Class v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  mDirection = self->mDirection;
  if (mDirection > 4)
    v4 = 0;
  else
    v4 = (uint64_t)*(&off_10124A870 + mDirection);
  objc_opt_class(self, a2);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = NSStringFromCGPoint(self->mPosition);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)v9;
  if (self->mAllowedToFlip)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p pos=%@ direction=%@ allowedToFlip %@>"), v7, self, v9, v4, v11));

  return v12;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->mPosition.x;
  y = self->mPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->mPosition = a3;
}

- (unint64_t)direction
{
  return self->mDirection;
}

- (void)setDirection:(unint64_t)a3
{
  self->mDirection = a3;
}

- (BOOL)allowedToFlip
{
  return self->mAllowedToFlip;
}

- (void)setAllowedToFlip:(BOOL)a3
{
  self->mAllowedToFlip = a3;
}

@end
