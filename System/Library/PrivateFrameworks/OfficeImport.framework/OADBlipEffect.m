@implementation OADBlipEffect

- (OADBlipEffect)initWithType:(int)a3
{
  OADBlipEffect *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADBlipEffect;
  result = -[OADBlipEffect init](&v5, sel_init);
  if (result)
    result->mType = a3;
  return result;
}

- (unint64_t)hash
{
  return self->mType;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int mType;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    mType = self->mType;
    v6 = mType == objc_msgSend(v4, "type");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)type
{
  return self->mType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADBlipEffect;
  -[OADBlipEffect description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
