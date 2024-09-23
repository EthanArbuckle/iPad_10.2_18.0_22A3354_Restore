@implementation U2HeadOutput

- (U2HeadOutput)initWithTop_arg_ids:(id)a3 arg_conf_scores:(id)a4 intent_scores:(id)a5 safety_head_scores:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  U2HeadOutput *v15;
  U2HeadOutput *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)U2HeadOutput;
  v15 = -[U2HeadOutput init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_top_arg_ids, a3);
    objc_storeStrong((id *)&v16->_arg_conf_scores, a4);
    objc_storeStrong((id *)&v16->_intent_scores, a5);
    objc_storeStrong((id *)&v16->_safety_head_scores, a6);
  }

  return v16;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2515EDDF0);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("top_arg_ids")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[U2HeadOutput top_arg_ids](self, "top_arg_ids");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("arg_conf_scores")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[U2HeadOutput arg_conf_scores](self, "arg_conf_scores");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("intent_scores")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[U2HeadOutput intent_scores](self, "intent_scores");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("safety_head_scores")))
    {
      v8 = 0;
      goto LABEL_10;
    }
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[U2HeadOutput safety_head_scores](self, "safety_head_scores");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "featureValueWithMultiArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v8;
}

- (MLMultiArray)top_arg_ids
{
  return self->_top_arg_ids;
}

- (void)setTop_arg_ids:(id)a3
{
  objc_storeStrong((id *)&self->_top_arg_ids, a3);
}

- (MLMultiArray)arg_conf_scores
{
  return self->_arg_conf_scores;
}

- (void)setArg_conf_scores:(id)a3
{
  objc_storeStrong((id *)&self->_arg_conf_scores, a3);
}

- (MLMultiArray)intent_scores
{
  return self->_intent_scores;
}

- (void)setIntent_scores:(id)a3
{
  objc_storeStrong((id *)&self->_intent_scores, a3);
}

- (MLMultiArray)safety_head_scores
{
  return self->_safety_head_scores;
}

- (void)setSafety_head_scores:(id)a3
{
  objc_storeStrong((id *)&self->_safety_head_scores, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safety_head_scores, 0);
  objc_storeStrong((id *)&self->_intent_scores, 0);
  objc_storeStrong((id *)&self->_arg_conf_scores, 0);
  objc_storeStrong((id *)&self->_top_arg_ids, 0);
}

@end
