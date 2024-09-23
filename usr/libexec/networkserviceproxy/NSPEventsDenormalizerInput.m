@implementation NSPEventsDenormalizerInput

- (NSPEventsDenormalizerInput)initWithDenormalizer_input:(id)a3
{
  id v5;
  NSPEventsDenormalizerInput *v6;
  NSPEventsDenormalizerInput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSPEventsDenormalizerInput;
  v6 = -[NSPEventsDenormalizerInput init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_denormalizer_input, a3);

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000FF8F0);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("denormalizer_input")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsDenormalizerInput denormalizer_input](self, "denormalizer_input"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (MLMultiArray)denormalizer_input
{
  return self->_denormalizer_input;
}

- (void)setDenormalizer_input:(id)a3
{
  objc_storeStrong((id *)&self->_denormalizer_input, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denormalizer_input, 0);
}

@end
