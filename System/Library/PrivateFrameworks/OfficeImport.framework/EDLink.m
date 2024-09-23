@implementation EDLink

+ (id)linkWithType:(int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:", *(_QWORD *)&a3);
}

- (EDLink)initWithType:(int)a3
{
  EDLink *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EDLink;
  result = -[EDLink init](&v5, sel_init);
  if (result)
    result->mType = a3;
  return result;
}

- (int)type
{
  return self->mType;
}

- (id)externalNames
{
  EDCollection *mExternalNames;
  EDCollection *v4;
  EDCollection *v5;

  mExternalNames = self->mExternalNames;
  if (!mExternalNames)
  {
    v4 = objc_alloc_init(EDCollection);
    v5 = self->mExternalNames;
    self->mExternalNames = v4;

    mExternalNames = self->mExternalNames;
  }
  return mExternalNames;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDLink;
  -[EDLink description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mExternalNames, 0);
}

@end
