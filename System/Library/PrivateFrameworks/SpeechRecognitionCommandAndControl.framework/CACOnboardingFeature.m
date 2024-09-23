@implementation CACOnboardingFeature

- (CACOnboardingFeature)initWithTitleText:(id)a3 helperText:(id)a4 imageBundleName:(id)a5
{
  id v9;
  id v10;
  id v11;
  CACOnboardingFeature *v12;
  CACOnboardingFeature *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CACOnboardingFeature;
  v12 = -[CACOnboardingFeature init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_titleText, a3);
    objc_storeStrong((id *)&v13->_helperText, a4);
    objc_storeStrong((id *)&v13->_imageBundleName, a5);
  }

  return v13;
}

+ (id)featureWithTitleText:(id)a3 helperText:(id)a4
{
  id v5;
  id v6;
  CACOnboardingFeature *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CACOnboardingFeature initWithTitleText:helperText:imageBundleName:]([CACOnboardingFeature alloc], "initWithTitleText:helperText:imageBundleName:", v6, v5, 0);

  return v7;
}

+ (id)featureWithTitleText:(id)a3 helperText:(id)a4 imageBundleName:(id)a5
{
  id v7;
  id v8;
  id v9;
  CACOnboardingFeature *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CACOnboardingFeature initWithTitleText:helperText:imageBundleName:]([CACOnboardingFeature alloc], "initWithTitleText:helperText:imageBundleName:", v9, v8, v7);

  return v10;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
}

- (NSString)helperText
{
  return self->_helperText;
}

- (void)setHelperText:(id)a3
{
  objc_storeStrong((id *)&self->_helperText, a3);
}

- (NSString)imageBundleName
{
  return self->_imageBundleName;
}

- (void)setImageBundleName:(id)a3
{
  objc_storeStrong((id *)&self->_imageBundleName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageBundleName, 0);
  objc_storeStrong((id *)&self->_helperText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
