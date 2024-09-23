@implementation ScandiumRIrRatioModelOutput

- (ScandiumRIrRatioModelOutput)initWithIdentity:(id)a3
{
  id v5;
  ScandiumRIrRatioModelOutput *v6;
  ScandiumRIrRatioModelOutput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ScandiumRIrRatioModelOutput_0;
  v6 = -[ScandiumRIrRatioModelOutput init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_Identity, a3);

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516A1158);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Identity")))
  {
    v4 = (void *)MEMORY[0x24BDBFF98];
    -[ScandiumRIrRatioModelOutput Identity]_0(self, "Identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureValueWithMultiArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
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
