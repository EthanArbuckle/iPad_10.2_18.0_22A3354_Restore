@implementation TGTextGenerationPrompt

- (TGTextGenerationPrompt)initWithInstructionText:(id)a3
{
  id v4;
  TGTextGenerationPrompt *v5;
  uint64_t v6;
  NSString *instructionText;
  void *v8;
  uint64_t v9;
  NSString *description;
  objc_super v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TGTextGenerationPrompt;
  v5 = -[TGTextGenerationPrompt init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    instructionText = v5->_instructionText;
    v5->_instructionText = (NSString *)v6;

    v13 = CFSTR("instructionText");
    v14[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v9 = objc_claimAutoreleasedReturnValue();
    description = v5->_description;
    v5->_description = (NSString *)v9;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TGTextGenerationPrompt *v4;
  void *v5;
  TGTextGenerationPrompt *v6;
  void *v7;

  v4 = [TGTextGenerationPrompt alloc];
  -[TGTextGenerationPrompt instructionText](self, "instructionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TGTextGenerationPrompt initWithInstructionText:](v4, "initWithInstructionText:", v5);

  -[TGTextGenerationPrompt contextText](self, "contextText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGTextGenerationPrompt setContextText:](v6, "setContextText:", v7);

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TGMutableTextGenerationPrompt *v4;
  void *v5;
  TGMutableTextGenerationPrompt *v6;
  void *v7;

  v4 = [TGMutableTextGenerationPrompt alloc];
  -[TGTextGenerationPrompt instructionText](self, "instructionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TGTextGenerationPrompt initWithInstructionText:](v4, "initWithInstructionText:", v5);

  -[TGTextGenerationPrompt contextText](self, "contextText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGTextGenerationPrompt setContextText:](v6, "setContextText:", v7);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[TGTextGenerationPrompt instructionText](self, "instructionText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[TGTextGenerationPrompt contextText](self, "contextText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
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
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[TGTextGenerationPrompt instructionText](self, "instructionText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "instructionText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[TGTextGenerationPrompt contextText](self, "contextText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contextText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = TGTextGenerationEqualAllowingNil(v9, v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSString)instructionText
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)contextText
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContextText:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextText, 0);
  objc_storeStrong((id *)&self->_instructionText, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end
