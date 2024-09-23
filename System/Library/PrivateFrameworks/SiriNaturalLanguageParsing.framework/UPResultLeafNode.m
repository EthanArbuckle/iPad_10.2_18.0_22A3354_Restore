@implementation UPResultLeafNode

- (UPResultLeafNode)initWithLabel:(id)a3 andText:(id)a4 andSemanticValue:(id)a5
{
  id v9;
  id v10;
  UPResultLeafNode *v11;
  UPResultLeafNode *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UPResultLeafNode;
  v11 = -[UPResultNode initWithLabel:](&v14, sel_initWithLabel_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_text, a4);
    objc_storeStrong((id *)&v12->_semanticValue, a5);
  }

  return v12;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("label");
  -[UPResultNode label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("text");
  -[UPResultLeafNode text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("semanticValue");
  -[UPResultLeafNode semanticValue](self, "semanticValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  if (!v5)
  if (!v3)

  return v9;
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)semanticValue
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticValue, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
