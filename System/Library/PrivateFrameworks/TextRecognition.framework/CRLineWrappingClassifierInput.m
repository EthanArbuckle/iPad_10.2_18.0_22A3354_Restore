@implementation CRLineWrappingClassifierInput

- (CRLineWrappingClassifierInput)initWithFeatures:(id)a3
{
  id v5;

  v5 = a3;
  if (self)
    objc_storeStrong((id *)&self->_features, a3);

  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E993F770);
}

- (id)featureValueForName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", self->_features);
}

- (MLMultiArray)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
}

@end
