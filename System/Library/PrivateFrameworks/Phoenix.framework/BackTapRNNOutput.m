@implementation BackTapRNNOutput

- (BackTapRNNOutput)initWithOutput:(id)a3 updated_history:(id)a4
{
  BackTapRNNOutput *v4;
  BackTapRNNOutput *v6;
  objc_super v8;
  id v9;
  id location[2];
  BackTapRNNOutput *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)BackTapRNNOutput;
  v11 = -[BackTapRNNOutput init](&v8, sel_init);
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)&v11->_output, location[0]);
    objc_storeStrong((id *)&v11->_updated_history, v9);
  }
  v6 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v6;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24F196888, a2, self);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  MLMultiArray *v5;
  void *v6;
  MLMultiArray *v7;
  id location[2];
  BackTapRNNOutput *v9;
  id v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("output")) & 1) != 0)
  {
    v6 = (void *)MEMORY[0x24BDBFF98];
    v7 = -[BackTapRNNOutput output](v9, "output");
    v10 = (id)objc_msgSend(v6, "featureValueWithMultiArray:");

  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("updated_history")) & 1) != 0)
  {
    v4 = (void *)MEMORY[0x24BDBFF98];
    v5 = -[BackTapRNNOutput updated_history](v9, "updated_history");
    v10 = (id)objc_msgSend(v4, "featureValueWithMultiArray:");

  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong(location, 0);
  return v10;
}

- (MLMultiArray)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong((id *)&self->_output, a3);
}

- (MLMultiArray)updated_history
{
  return self->_updated_history;
}

- (void)setUpdated_history:(id)a3
{
  objc_storeStrong((id *)&self->_updated_history, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updated_history, 0);
  objc_storeStrong((id *)&self->_output, 0);
}

@end
