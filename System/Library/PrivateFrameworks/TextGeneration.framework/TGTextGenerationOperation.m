@implementation TGTextGenerationOperation

- (TGTextGenerationOperation)initWithPrompt:(id)a3
{
  id v4;
  TGTextGenerationOperation *v5;
  uint64_t v6;
  TGTextGenerationPrompt *prompt;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *description;
  objc_super v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TGTextGenerationOperation;
  v5 = -[TGTextGenerationOperation init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    prompt = v5->_prompt;
    v5->_prompt = (TGTextGenerationPrompt *)v6;

    v14 = CFSTR("prompt");
    -[TGTextGenerationOperation prompt](v5, "prompt");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = objc_claimAutoreleasedReturnValue();
    description = v5->_description;
    v5->_description = (NSString *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TGTextGenerationOperation *v4;
  void *v5;
  TGTextGenerationOperation *v6;
  void *v7;

  v4 = [TGTextGenerationOperation alloc];
  -[TGTextGenerationOperation prompt](self, "prompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TGTextGenerationOperation initWithPrompt:](v4, "initWithPrompt:", v5);

  -[TGTextGenerationOperation outputConstraint](self, "outputConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGTextGenerationOperation setOutputConstraint:](v6, "setOutputConstraint:", v7);

  -[TGTextGenerationOperation setProduceOutputStream:](v6, "setProduceOutputStream:", -[TGTextGenerationOperation shouldProduceOutputStream](self, "shouldProduceOutputStream"));
  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TGMutableTextGenerationOperation *v4;
  void *v5;
  TGMutableTextGenerationOperation *v6;
  void *v7;

  v4 = [TGMutableTextGenerationOperation alloc];
  -[TGTextGenerationOperation prompt](self, "prompt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TGTextGenerationOperation initWithPrompt:](v4, "initWithPrompt:", v5);

  -[TGTextGenerationOperation outputConstraint](self, "outputConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGTextGenerationOperation setOutputConstraint:](v6, "setOutputConstraint:", v7);

  -[TGTextGenerationOperation setProduceOutputStream:](v6, "setProduceOutputStream:", -[TGTextGenerationOperation shouldProduceOutputStream](self, "shouldProduceOutputStream"));
  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[TGTextGenerationOperation prompt](self, "prompt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[TGTextGenerationOperation outputConstraint](self, "outputConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6 ^ -[TGTextGenerationOperation shouldProduceOutputStream](self, "shouldProduceOutputStream");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  int v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[TGTextGenerationOperation prompt](self, "prompt");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prompt");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[TGTextGenerationOperation outputConstraint](self, "outputConstraint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "outputConstraint");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (TGTextGenerationEqualAllowingNil(v9, v10))
      {
        v11 = -[TGTextGenerationOperation shouldProduceOutputStream](self, "shouldProduceOutputStream");
        v12 = v11 ^ objc_msgSend(v6, "shouldProduceOutputStream") ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }

    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (id)description
{
  return objc_getProperty(self, a2, 16, 1);
}

- (TGTextGenerationPrompt)prompt
{
  return (TGTextGenerationPrompt *)objc_getProperty(self, a2, 24, 1);
}

- (TGTextGenerationOutputConstraint)outputConstraint
{
  return (TGTextGenerationOutputConstraint *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOutputConstraint:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)shouldProduceOutputStream
{
  return self->_produceOutputStream;
}

- (void)setProduceOutputStream:(BOOL)a3
{
  self->_produceOutputStream = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputConstraint, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end
