@implementation deoc_seriesOutput

- (deoc_seriesOutput)initWithTarget:(int64_t)a3 classProbability:(id)a4
{
  id v7;
  deoc_seriesOutput *v8;
  deoc_seriesOutput *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)deoc_seriesOutput;
  v8 = -[deoc_seriesOutput init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_target = a3;
    objc_storeStrong((id *)&v8->_classProbability, a4);
  }

  return v9;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D44AD58);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("target")))
  {
    objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithInt64:", -[deoc_seriesOutput target](self, "target"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("classProbability")))
  {
    v6 = (void *)MEMORY[0x24BDBFF98];
    -[deoc_seriesOutput classProbability](self, "classProbability");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "featureValueWithDictionary:error:", v7, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)target
{
  return self->_target;
}

- (void)setTarget:(int64_t)a3
{
  self->_target = a3;
}

- (NSDictionary)classProbability
{
  return self->_classProbability;
}

- (void)setClassProbability:(id)a3
{
  objc_storeStrong((id *)&self->_classProbability, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classProbability, 0);
}

@end
