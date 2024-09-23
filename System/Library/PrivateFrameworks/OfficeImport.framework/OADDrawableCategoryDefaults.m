@implementation OADDrawableCategoryDefaults

- (OADDrawableCategoryDefaults)init
{
  OADDrawableCategoryDefaults *v2;
  OADShapeProperties *v3;
  OADShapeProperties *mShapeProperties;
  OADTextBodyProperties *v5;
  OADTextBodyProperties *mTextBodyProperties;
  OADTextListStyle *v7;
  OADTextListStyle *mTextListStyle;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OADDrawableCategoryDefaults;
  v2 = -[OADDrawableCategoryDefaults init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(OADShapeProperties);
    mShapeProperties = v2->mShapeProperties;
    v2->mShapeProperties = v3;

    v5 = objc_alloc_init(OADTextBodyProperties);
    mTextBodyProperties = v2->mTextBodyProperties;
    v2->mTextBodyProperties = v5;

    v7 = objc_alloc_init(OADTextListStyle);
    mTextListStyle = v2->mTextListStyle;
    v2->mTextListStyle = v7;

  }
  return v2;
}

- (OADDrawableCategoryDefaults)initWithDefaults
{
  OADDrawableCategoryDefaults *v2;
  OADShapeProperties *v3;
  OADShapeProperties *mShapeProperties;
  OADTextBodyProperties *v5;
  OADTextBodyProperties *mTextBodyProperties;
  OADTextListStyle *v7;
  OADTextListStyle *mTextListStyle;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OADDrawableCategoryDefaults;
  v2 = -[OADDrawableCategoryDefaults init](&v10, sel_init);
  if (v2)
  {
    v3 = -[OADGraphicProperties initWithDefaults]([OADShapeProperties alloc], "initWithDefaults");
    mShapeProperties = v2->mShapeProperties;
    v2->mShapeProperties = v3;

    v5 = -[OADTextBodyProperties initWithDefaults]([OADTextBodyProperties alloc], "initWithDefaults");
    mTextBodyProperties = v2->mTextBodyProperties;
    v2->mTextBodyProperties = v5;

    v7 = -[OADTextListStyle initWithDefaults]([OADTextListStyle alloc], "initWithDefaults");
    mTextListStyle = v2->mTextListStyle;
    v2->mTextListStyle = v7;

  }
  return v2;
}

- (void)setShapeProperties:(id)a3
{
  objc_storeStrong((id *)&self->mShapeProperties, a3);
}

- (id)shapeProperties
{
  return self->mShapeProperties;
}

- (void)setTextBodyProperties:(id)a3
{
  objc_storeStrong((id *)&self->mTextBodyProperties, a3);
}

- (id)textBodyProperties
{
  return self->mTextBodyProperties;
}

- (void)setTextListStyle:(id)a3
{
  objc_storeStrong((id *)&self->mTextListStyle, a3);
}

- (id)textListStyle
{
  return self->mTextListStyle;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADDrawableCategoryDefaults;
  -[OADDrawableCategoryDefaults description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTextListStyle, 0);
  objc_storeStrong((id *)&self->mTextBodyProperties, 0);
  objc_storeStrong((id *)&self->mShapeProperties, 0);
}

@end
