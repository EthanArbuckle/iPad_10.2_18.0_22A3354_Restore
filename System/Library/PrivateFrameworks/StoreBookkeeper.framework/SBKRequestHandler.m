@implementation SBKRequestHandler

- (SBKRequestHandler)initWithBagContext:(id)a3
{
  id v5;
  SBKRequestHandler *v6;
  SBKRequestHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKRequestHandler;
  v6 = -[SBKRequestHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bagContext, a3);

  return v7;
}

- (void)timeout
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKRequestHandler.m"), 26, CFSTR("Subclass must implement"));

}

- (void)cancel
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBKRequestHandler.m"), 31, CFSTR("Subclass must implement"));

}

- (SBKStoreURLBagContext)bagContext
{
  return self->_bagContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagContext, 0);
}

@end
