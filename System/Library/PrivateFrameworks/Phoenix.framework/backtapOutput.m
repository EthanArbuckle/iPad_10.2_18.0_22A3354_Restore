@implementation backtapOutput

- (backtapOutput)initWithModel_output:(id)a3
{
  backtapOutput *v3;
  backtapOutput *v5;
  objc_super v6;
  id location[2];
  backtapOutput *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)backtapOutput;
  v8 = -[backtapOutput init](&v6, sel_init);
  objc_storeStrong((id *)&v8, v8);
  if (v8)
    objc_storeStrong((id *)&v8->_model_output, location[0]);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24F1968B8, a2, self);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  MLMultiArray *v5;
  id location[2];
  backtapOutput *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("model_output")) & 1) != 0)
  {
    v4 = (void *)MEMORY[0x24BDBFF98];
    v5 = -[backtapOutput model_output](v7, "model_output");
    v8 = (id)objc_msgSend(v4, "featureValueWithMultiArray:");

  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong(location, 0);
  return v8;
}

- (MLMultiArray)model_output
{
  return self->_model_output;
}

- (void)setModel_output:(id)a3
{
  objc_storeStrong((id *)&self->_model_output, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model_output, 0);
}

@end
