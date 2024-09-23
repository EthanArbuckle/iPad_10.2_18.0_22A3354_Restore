@implementation U2HeadInput

- (U2HeadInput)initWithInput_mask:(id)a3 input_span_features:(id)a4 sequence_output:(id)a5
{
  id v9;
  id v10;
  id v11;
  U2HeadInput *v12;
  U2HeadInput *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)U2HeadInput;
  v12 = -[U2HeadInput init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_input_mask, a3);
    objc_storeStrong((id *)&v13->_input_span_features, a4);
    objc_storeStrong((id *)&v13->_sequence_output, a5);
  }

  return v13;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2515EDDD8);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("input_mask")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[U2HeadInput input_mask](self, "input_mask");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("input_span_features")))
  {
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[U2HeadInput input_span_features](self, "input_span_features");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("sequence_output")))
    {
      v8 = 0;
      goto LABEL_8;
    }
    v5 = (void *)MEMORY[0x24BDBFF98];
    -[U2HeadInput sequence_output](self, "sequence_output");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "featureValueWithMultiArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v8;
}

- (MLMultiArray)input_mask
{
  return self->_input_mask;
}

- (void)setInput_mask:(id)a3
{
  objc_storeStrong((id *)&self->_input_mask, a3);
}

- (MLMultiArray)input_span_features
{
  return self->_input_span_features;
}

- (void)setInput_span_features:(id)a3
{
  objc_storeStrong((id *)&self->_input_span_features, a3);
}

- (MLMultiArray)sequence_output
{
  return self->_sequence_output;
}

- (void)setSequence_output:(id)a3
{
  objc_storeStrong((id *)&self->_sequence_output, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequence_output, 0);
  objc_storeStrong((id *)&self->_input_span_features, 0);
  objc_storeStrong((id *)&self->_input_mask, 0);
}

@end
