@implementation backtapInput

- (backtapInput)initWithModel_input:(id)a3
{
  backtapInput *v3;
  backtapInput *v5;
  objc_super v6;
  id location[2];
  backtapInput *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)backtapInput;
  v8 = -[backtapInput init](&v6, sel_init);
  objc_storeStrong((id *)&v8, v8);
  if (v8)
    objc_storeStrong((id *)&v8->_model_input, location[0]);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24F1968A0, a2, self);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  MLMultiArray *v5;
  id location[2];
  backtapInput *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("model_input")) & 1) != 0)
  {
    v4 = (void *)MEMORY[0x24BDBFF98];
    v5 = -[backtapInput model_input](v7, "model_input");
    v8 = (id)objc_msgSend(v4, "featureValueWithMultiArray:");

  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong(location, 0);
  return v8;
}

- (MLMultiArray)model_input
{
  return self->_model_input;
}

- (void)setModel_input:(id)a3
{
  objc_storeStrong((id *)&self->_model_input, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model_input, 0);
}

@end
