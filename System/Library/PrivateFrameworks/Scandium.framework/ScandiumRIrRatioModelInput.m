@implementation ScandiumRIrRatioModelInput

- (ScandiumRIrRatioModelInput)initWithIr:(id)a3 red:(id)a4
{
  id v7;
  id v8;
  ScandiumRIrRatioModelInput *v9;
  ScandiumRIrRatioModelInput *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ScandiumRIrRatioModelInput_0;
  v9 = -[ScandiumRIrRatioModelInput init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ir, a3);
    objc_storeStrong((id *)&v10->_red, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516A1140);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("ir")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[ScandiumRIrRatioModelInput ir]_0(self, "ir");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("red")))
    {
      v8 = 0;
      goto LABEL_7;
    }
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[ScandiumRIrRatioModelInput red]_0(self, "red");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "featureValueWithMultiArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

- (MLMultiArray)ir
{
  return self->_ir;
}

- (void)setIr:(id)a3
{
  objc_storeStrong((id *)&self->_ir, a3);
}

- (MLMultiArray)red
{
  return self->_red;
}

- (void)setRed:(id)a3
{
  objc_storeStrong((id *)&self->_red, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_red, 0);
  objc_storeStrong((id *)&self->_ir, 0);
}

@end
