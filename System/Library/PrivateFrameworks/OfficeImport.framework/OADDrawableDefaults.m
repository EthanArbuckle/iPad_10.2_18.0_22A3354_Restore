@implementation OADDrawableDefaults

- (BOOL)isEmpty
{
  return !self->mShapeDefaults && !self->mLineDefaults && !self->mTextDefaults;
}

- (void)addDefaults
{
  OADDrawableCategoryDefaults *v3;
  OADDrawableCategoryDefaults *mShapeDefaults;
  OADDrawableCategoryDefaults *v5;
  OADDrawableCategoryDefaults *mLineDefaults;
  OADDrawableCategoryDefaults *v7;
  OADDrawableCategoryDefaults *mTextDefaults;

  if (!self->mShapeDefaults)
  {
    v3 = -[OADDrawableCategoryDefaults initWithDefaults]([OADDrawableCategoryDefaults alloc], "initWithDefaults");
    mShapeDefaults = self->mShapeDefaults;
    self->mShapeDefaults = v3;

  }
  if (!self->mLineDefaults)
  {
    v5 = -[OADDrawableCategoryDefaults initWithDefaults]([OADDrawableCategoryDefaults alloc], "initWithDefaults");
    mLineDefaults = self->mLineDefaults;
    self->mLineDefaults = v5;

  }
  if (!self->mTextDefaults)
  {
    v7 = -[OADDrawableCategoryDefaults initWithDefaults]([OADDrawableCategoryDefaults alloc], "initWithDefaults");
    mTextDefaults = self->mTextDefaults;
    self->mTextDefaults = v7;

  }
}

- (id)addShapeDefaults
{
  OADDrawableCategoryDefaults *mShapeDefaults;
  OADDrawableCategoryDefaults *v4;
  OADDrawableCategoryDefaults *v5;

  mShapeDefaults = self->mShapeDefaults;
  if (!mShapeDefaults)
  {
    v4 = objc_alloc_init(OADDrawableCategoryDefaults);
    v5 = self->mShapeDefaults;
    self->mShapeDefaults = v4;

    mShapeDefaults = self->mShapeDefaults;
  }
  return mShapeDefaults;
}

- (id)addLineDefaults
{
  OADDrawableCategoryDefaults *mLineDefaults;
  OADDrawableCategoryDefaults *v4;
  OADDrawableCategoryDefaults *v5;

  mLineDefaults = self->mLineDefaults;
  if (!mLineDefaults)
  {
    v4 = objc_alloc_init(OADDrawableCategoryDefaults);
    v5 = self->mLineDefaults;
    self->mLineDefaults = v4;

    mLineDefaults = self->mLineDefaults;
  }
  return mLineDefaults;
}

- (id)addTextDefaults
{
  OADDrawableCategoryDefaults *mTextDefaults;
  OADDrawableCategoryDefaults *v4;
  OADDrawableCategoryDefaults *v5;

  mTextDefaults = self->mTextDefaults;
  if (!mTextDefaults)
  {
    v4 = objc_alloc_init(OADDrawableCategoryDefaults);
    v5 = self->mTextDefaults;
    self->mTextDefaults = v4;

    mTextDefaults = self->mTextDefaults;
  }
  return mTextDefaults;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADDrawableDefaults;
  -[OADDrawableDefaults description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (OADDrawableCategoryDefaults)shapeDefaults
{
  return self->mShapeDefaults;
}

- (void)setShapeDefaults:(id)a3
{
  objc_storeStrong((id *)&self->mShapeDefaults, a3);
}

- (OADDrawableCategoryDefaults)lineDefaults
{
  return self->mLineDefaults;
}

- (void)setLineDefaults:(id)a3
{
  objc_storeStrong((id *)&self->mLineDefaults, a3);
}

- (OADDrawableCategoryDefaults)textDefaults
{
  return self->mTextDefaults;
}

- (void)setTextDefaults:(id)a3
{
  objc_storeStrong((id *)&self->mTextDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTextDefaults, 0);
  objc_storeStrong((id *)&self->mLineDefaults, 0);
  objc_storeStrong((id *)&self->mShapeDefaults, 0);
}

@end
