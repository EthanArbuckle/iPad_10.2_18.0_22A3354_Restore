@implementation ODDAlgorithm

- (int)type
{
  return self->mType;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ODDAlgorithm;
  -[ODDLayoutObject description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
