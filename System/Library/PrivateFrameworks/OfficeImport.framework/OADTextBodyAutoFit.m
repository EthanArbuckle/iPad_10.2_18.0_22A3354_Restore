@implementation OADTextBodyAutoFit

- (OADTextBodyAutoFit)initWithType:(unsigned __int8)a3
{
  OADTextBodyAutoFit *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADTextBodyAutoFit;
  result = -[OADTextBodyAutoFit init](&v5, sel_init);
  if (result)
    result->mType = a3;
  return result;
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

- (unsigned)type
{
  return self->mType;
}

- (unint64_t)hash
{
  return self->mType;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTextBodyAutoFit;
  -[OADTextBodyAutoFit description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
