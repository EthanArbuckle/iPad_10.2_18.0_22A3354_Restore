@implementation SWPreferredSizeManager

- (SWPreferredSizeManager)initWithMessageHandlerManager:(id)a3 logger:(id)a4
{
  id v6;
  id v7;
  SWPreferredSizeManager *v8;
  SWPreferredSizeManager *v9;
  void *v10;
  SWPreferredSizeManager *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)SWPreferredSizeManager;
    v8 = -[SWPreferredSizeManager init](&v13, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_logger, a4);
      +[SWWeakMessageHandler handlerWithMessageHandler:](SWWeakMessageHandler, "handlerWithMessageHandler:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addMessageHandler:name:", v10, CFSTR("preferredSize"));

    }
    self = v9;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  float v15;
  float v16;
  void *v17;
  void (**v18)(double, double);
  id v19;

  v5 = a3;
  objc_msgSend(v5, "body");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("height"));
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "body");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("width"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SWPreferredSizeManager logger](self, "logger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "log:", v12);

  objc_opt_class();
  v13 = 0.0;
  v14 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "floatValue");
    v14 = roundf(v15);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v19, "floatValue");
    v13 = roundf(v16);
  }
  -[SWPreferredSizeManager preferredSizeBlock](self, "preferredSizeBlock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[SWPreferredSizeManager preferredSizeBlock](self, "preferredSizeBlock");
    v18 = (void (**)(double, double))objc_claimAutoreleasedReturnValue();
    v18[2](v14, v13);

  }
}

- (id)preferredSizeBlock
{
  return self->preferredSizeBlock;
}

- (void)onPreferredSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SWLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong(&self->preferredSizeBlock, 0);
}

@end
