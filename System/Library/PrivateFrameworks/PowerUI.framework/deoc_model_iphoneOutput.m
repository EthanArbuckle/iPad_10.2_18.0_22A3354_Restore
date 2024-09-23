@implementation deoc_model_iphoneOutput

- (deoc_model_iphoneOutput)initWithNext_drain_is_significant:(int64_t)a3 classProbability:(id)a4
{
  id v7;
  deoc_model_iphoneOutput *v8;
  deoc_model_iphoneOutput *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)deoc_model_iphoneOutput;
  v8 = -[deoc_model_iphoneOutput init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_next_drain_is_significant = a3;
    objc_storeStrong((id *)&v8->_classProbability, a4);
  }

  return v9;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D44AF08);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("next_drain_is_significant")))
  {
    objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithInt64:", -[deoc_model_iphoneOutput next_drain_is_significant](self, "next_drain_is_significant"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("classProbability")))
  {
    v6 = (void *)MEMORY[0x24BDBFF98];
    -[deoc_model_iphoneOutput classProbability](self, "classProbability");
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

- (int64_t)next_drain_is_significant
{
  return self->_next_drain_is_significant;
}

- (void)setNext_drain_is_significant:(int64_t)a3
{
  self->_next_drain_is_significant = a3;
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
