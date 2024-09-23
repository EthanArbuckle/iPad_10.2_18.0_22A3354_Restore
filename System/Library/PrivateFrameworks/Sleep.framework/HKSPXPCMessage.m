@implementation HKSPXPCMessage

- (HKSPXPCMessage)initWithIdentifier:(id)a3 block:(id)a4 options:(unint64_t)a5 errorHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  HKSPXPCMessage *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  id block;
  uint64_t v18;
  id errorHandler;
  HKSPXPCMessage *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HKSPXPCMessage;
  v13 = -[HKSPXPCMessage init](&v22, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    block = v13->_block;
    v13->_block = (id)v16;

    v13->_options = a5;
    v18 = objc_msgSend(v12, "copy");
    errorHandler = v13->_errorHandler;
    v13->_errorHandler = (id)v18;

    v20 = v13;
  }

  return v13;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (id)block
{
  return self->_block;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)description
{
  return (NSString *)-[HKSPXPCMessage descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", &stru_1E4E3E220);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPXPCMessage succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPXPCMessage descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPXPCMessage identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("identifier"));

  v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[HKSPXPCMessage options](self, "options") & 1, CFSTR("sync"));
  v8 = (id)objc_msgSend(v4, "appendBool:withName:", (-[HKSPXPCMessage options](self, "options") >> 1) & 1, CFSTR("retry"));
  return v4;
}

@end
