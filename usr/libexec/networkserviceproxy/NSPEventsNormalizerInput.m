@implementation NSPEventsNormalizerInput

- (NSPEventsNormalizerInput)initWithNormalizer_input:(id)a3
{
  id v5;
  NSPEventsNormalizerInput *v6;
  NSPEventsNormalizerInput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSPEventsNormalizerInput;
  v6 = -[NSPEventsNormalizerInput init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_normalizer_input, a3);

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000FF920);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("normalizer_input")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsNormalizerInput normalizer_input](self, "normalizer_input"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (MLMultiArray)normalizer_input
{
  return self->_normalizer_input;
}

- (void)setNormalizer_input:(id)a3
{
  objc_storeStrong((id *)&self->_normalizer_input, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizer_input, 0);
}

@end
