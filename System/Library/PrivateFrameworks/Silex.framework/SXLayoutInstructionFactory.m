@implementation SXLayoutInstructionFactory

- (SXLayoutInstructionFactory)initWithPresentationAttributesProvider:(id)a3
{
  id v5;
  SXLayoutInstructionFactory *v6;
  SXLayoutInstructionFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXLayoutInstructionFactory;
  v6 = -[SXLayoutInstructionFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_presentationAttributesProvider, a3);

  return v7;
}

- (id)createInstructions
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[SXLayoutInstructionFactory presentationAttributesProvider](self, "presentationAttributesProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presentationMode");

  if (v4 != 1)
    return MEMORY[0x24BDBD1A8];
  v5 = (void *)objc_opt_new();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SXPresentationAttributesProvider)presentationAttributesProvider
{
  return self->_presentationAttributesProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationAttributesProvider, 0);
}

@end
