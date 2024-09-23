@implementation OADTableBackground

- (void)setFill:(id)a3
{
  objc_storeStrong((id *)&self->mFill, a3);
}

- (void)setEffects:(id)a3
{
  objc_storeStrong((id *)&self->mEffects, a3);
}

- (id)fill
{
  return self->mFill;
}

- (id)effects
{
  return self->mEffects;
}

- (BOOL)hasEffects
{
  return self->mEffects != 0;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTableBackground;
  -[OADTableBackground description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_storeStrong((id *)&self->mFill, 0);
}

@end
