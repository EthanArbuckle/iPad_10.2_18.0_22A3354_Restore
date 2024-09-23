@implementation spotlight_l3_1Output

- (spotlight_l3_1Output)initWithY:(id)a3 id_features:(id)a4
{
  id v7;
  id v8;
  spotlight_l3_1Output *v9;
  spotlight_l3_1Output *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)spotlight_l3_1Output;
  v9 = -[spotlight_l3_1Output init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_y, a3);
    objc_storeStrong((id *)&v10->_id_features, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6E9B338);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("y")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[spotlight_l3_1Output y](self, "y");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("id_features")))
    {
      v8 = 0;
      goto LABEL_7;
    }
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[spotlight_l3_1Output id_features](self, "id_features");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "featureValueWithMultiArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

- (MLMultiArray)y
{
  return self->_y;
}

- (void)setY:(id)a3
{
  objc_storeStrong((id *)&self->_y, a3);
}

- (MLMultiArray)id_features
{
  return self->_id_features;
}

- (void)setId_features:(id)a3
{
  objc_storeStrong((id *)&self->_id_features, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_id_features, 0);
  objc_storeStrong((id *)&self->_y, 0);
}

@end
