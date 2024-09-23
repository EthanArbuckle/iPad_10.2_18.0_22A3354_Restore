@implementation BackTapRNNInput

- (BackTapRNNInput)initWithModel_input:(id)a3 history:(id)a4
{
  BackTapRNNInput *v4;
  BackTapRNNInput *v6;
  objc_super v8;
  id v9;
  id location[2];
  BackTapRNNInput *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)BackTapRNNInput;
  v11 = -[BackTapRNNInput init](&v8, sel_init);
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)&v11->_model_input, location[0]);
    objc_storeStrong((id *)&v11->_history, v9);
  }
  v6 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v6;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24F196870, a2, self);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  MLMultiArray *v5;
  void *v6;
  MLMultiArray *v7;
  id location[2];
  BackTapRNNInput *v9;
  id v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("model_input")) & 1) != 0)
  {
    v6 = (void *)MEMORY[0x24BDBFF98];
    v7 = -[BackTapRNNInput model_input](v9, "model_input");
    v10 = (id)objc_msgSend(v6, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("history")) & 1) != 0)
  {
    v4 = (void *)MEMORY[0x24BDBFF98];
    v5 = -[BackTapRNNInput history](v9, "history");
    v10 = (id)objc_msgSend(v4, "featureValueWithMultiArray:");

  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong(location, 0);
  return v10;
}

- (MLMultiArray)model_input
{
  return self->_model_input;
}

- (void)setModel_input:(id)a3
{
  objc_storeStrong((id *)&self->_model_input, a3);
}

- (MLMultiArray)history
{
  return self->_history;
}

- (void)setHistory:(id)a3
{
  objc_storeStrong((id *)&self->_history, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_model_input, 0);
}

@end
