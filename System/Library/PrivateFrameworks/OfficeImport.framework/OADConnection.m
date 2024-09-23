@implementation OADConnection

- (void)setDrawableId:(unsigned int)a3
{
  self->mDrawableId = a3;
}

- (void)setLocationIndex:(int)a3
{
  self->mLocationIndex = a3;
}

- (unsigned)drawableId
{
  return self->mDrawableId;
}

- (int)locationIndex
{
  return self->mLocationIndex;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADConnection;
  -[OADConnection description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
