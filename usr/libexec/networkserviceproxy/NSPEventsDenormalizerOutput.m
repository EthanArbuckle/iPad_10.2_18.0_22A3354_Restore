@implementation NSPEventsDenormalizerOutput

- (NSPEventsDenormalizerOutput)initWithIdentity:(id)a3
{
  id v5;
  NSPEventsDenormalizerOutput *v6;
  NSPEventsDenormalizerOutput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSPEventsDenormalizerOutput;
  v6 = -[NSPEventsDenormalizerOutput init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_Identity, a3);

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000FF908);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Identity")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsDenormalizerOutput Identity](self, "Identity"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (MLMultiArray)Identity
{
  return self->_Identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_Identity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Identity, 0);
}

@end
