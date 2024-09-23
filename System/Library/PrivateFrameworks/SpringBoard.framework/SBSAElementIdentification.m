@implementation SBSAElementIdentification

- (SBSAElementIdentification)initWithClientIdentifier:(id)a3 elementIdentifier:(id)a4
{
  id v6;
  id v7;
  SBSAElementIdentification *v8;
  uint64_t v9;
  NSString *clientIdentifier;
  uint64_t v11;
  NSString *elementIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSAElementIdentification;
  v8 = -[SBSAElementIdentification init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    elementIdentifier = v8->_elementIdentifier;
    v8->_elementIdentifier = (NSString *)v11;

  }
  return v8;
}

- (SBSAElementIdentification)initWithElementIdentification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBSAElementIdentification *v7;

  v4 = a3;
  objc_msgSend(v4, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBSAElementIdentification initWithClientIdentifier:elementIdentifier:](self, "initWithClientIdentifier:elementIdentifier:", v5, v6);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSString *clientIdentifier;
  uint64_t v7;
  id v8;
  void *v9;
  NSString *elementIdentifier;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  clientIdentifier = self->_clientIdentifier;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __37__SBSAElementIdentification_isEqual___block_invoke;
  v19[3] = &unk_1E8EA89D0;
  v8 = v4;
  v20 = v8;
  objc_msgSend(v5, "appendString:counterpart:", clientIdentifier, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  elementIdentifier = self->_elementIdentifier;
  v14 = v7;
  v15 = 3221225472;
  v16 = __37__SBSAElementIdentification_isEqual___block_invoke_2;
  v17 = &unk_1E8EA89D0;
  v18 = v8;
  v11 = v8;
  objc_msgSend(v9, "appendString:counterpart:", elementIdentifier, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v12, "isEqual", v14, v15, v16, v17);

  return v7;
}

uint64_t __37__SBSAElementIdentification_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
}

uint64_t __37__SBSAElementIdentification_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "elementIdentifier");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", self->_clientIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", self->_elementIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  return v6;
}

- (NSString)description
{
  return (NSString *)objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@: %p; clientIdentifier: %@; elementIdentifier: %@>"),
                                                       objc_opt_class(),
                                                       self,
                                                       self->_clientIdentifier,
                                                       self->_elementIdentifier));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithClientIdentifier:elementIdentifier:", self->_clientIdentifier, self->_elementIdentifier);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
