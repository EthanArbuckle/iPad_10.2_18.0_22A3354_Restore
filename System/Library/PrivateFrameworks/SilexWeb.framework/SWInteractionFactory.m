@implementation SWInteractionFactory

- (SWInteractionFactory)initWithNavigationManager:(id)a3
{
  id v5;
  SWInteractionFactory *v6;
  SWInteractionFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SWInteractionFactory;
  v6 = -[SWInteractionFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_navigationManager, a3);

  return v7;
}

- (id)interactionForDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  SWURLInteraction *v10;
  void *v11;
  SWInteraction *v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("interactable")) & 1) != 0)
  {
    v6 = 1;
LABEL_8:
    v12 = -[SWInteraction initWithType:]([SWInteraction alloc], "initWithType:", v6);
    goto LABEL_11;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("selectable")))
  {
    v6 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("URL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v10 = [SWURLInteraction alloc];
    -[SWInteractionFactory navigationManager](self, "navigationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SWURLInteraction initWithURL:navigationManager:](v10, "initWithURL:navigationManager:", v9, v11);

  }
  else
  {
    v12 = -[SWInteraction initWithType:]([SWInteraction alloc], "initWithType:", 0);
  }

LABEL_11:
  return v12;
}

- (SWNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationManager, 0);
}

@end
