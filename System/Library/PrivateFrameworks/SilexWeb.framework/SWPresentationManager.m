@implementation SWPresentationManager

- (SWPresentationManager)initWithWebContentScriptsManager:(id)a3 messageHandlerManager:(id)a4 documentStateProvider:(id)a5 logger:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SWPresentationManager *v15;
  SWPresentationManager *v16;
  id *p_isa;
  NSNumber *heightValue;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = 0;
  if (v11 && v12 && v13)
  {
    v25.receiver = self;
    v25.super_class = (Class)SWPresentationManager;
    v16 = -[SWPresentationManager init](&v25, sel_init);
    p_isa = (id *)&v16->super.isa;
    if (v16)
    {
      heightValue = v16->_heightValue;
      v16->_heightValue = 0;

      objc_storeStrong(p_isa + 4, a3);
      objc_storeStrong(p_isa + 5, a6);
      +[SWWeakMessageHandler handlerWithMessageHandler:](SWWeakMessageHandler, "handlerWithMessageHandler:", p_isa);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addMessageHandler:name:", v19, CFSTR("presentable"));

      +[SWWeakMessageHandler handlerWithMessageHandler:](SWWeakMessageHandler, "handlerWithMessageHandler:", p_isa);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addMessageHandler:name:", v20, CFSTR("update"));

      objc_initWeak(&location, p_isa);
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __109__SWPresentationManager_initWithWebContentScriptsManager_messageHandlerManager_documentStateProvider_logger___block_invoke;
      v22[3] = &unk_24DA0B7C0;
      objc_copyWeak(&v23, &location);
      objc_msgSend(v13, "onLoad:", v22);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
    self = p_isa;
    v15 = self;
  }

  return v15;
}

void __109__SWPresentationManager_initWithWebContentScriptsManager_messageHandlerManager_documentStateProvider_logger___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void (**v3)(void);
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)WeakRetained[6];
  WeakRetained[6] = 0;

  objc_msgSend(WeakRetained, "loadBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(WeakRetained, "loadBlock");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (double)height
{
  NSNumber *heightValue;
  float v3;

  heightValue = self->_heightValue;
  if (!heightValue)
    return 0.0;
  -[NSNumber floatValue](heightValue, "floatValue");
  return v3;
}

- (void)refresh
{
  void *v3;
  SWRefreshScript *v4;

  v4 = objc_alloc_init(SWRefreshScript);
  -[SWPresentationManager scriptsManager](self, "scriptsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeScript:completion:", v4, 0);

}

- (void)setPresentationState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SWPresentationStateScript *v10;
  void *v11;
  NSNumber *heightValue;

  if (self->_presentationState != a3)
  {
    -[SWPresentationManager logger](self, "logger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[SWPresentationManager descriptionForPresentationState:](self, "descriptionForPresentationState:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWPresentationManager descriptionForPresentationState:](self, "descriptionForPresentationState:", self->_presentationState);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("PresentationManager: Setting presentation state to %@ from %@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "log:", v9);

    self->_presentationState = a3;
    v10 = -[SWPresentationStateScript initWithPresentationState:]([SWPresentationStateScript alloc], "initWithPresentationState:", a3);
    -[SWPresentationManager scriptsManager](self, "scriptsManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "executeScript:completion:", v10, 0);

  }
  if (a3 == 2)
  {
    heightValue = self->_heightValue;
    self->_heightValue = 0;

  }
}

- (void)prepareForLegacyResize
{
  NSNumber *heightValue;

  heightValue = self->_heightValue;
  self->_heightValue = 0;

}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  double v13;
  NSNumber *v14;
  NSNumber *heightValue;
  void *v16;
  void (**v17)(__n128);
  __n128 v18;
  void *v19;
  int v20;
  void *v21;
  __n128 v22;
  id v23;

  v23 = a3;
  objc_msgSend(v23, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("height"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SWPresentationManager logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v23, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "log:", v10);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "floatValue");
    v12 = roundf(v11);
    if (!self->_heightValue || (-[SWPresentationManager height](self, "height"), v13 != v12))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
      v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      heightValue = self->_heightValue;
      self->_heightValue = v14;

      -[SWPresentationManager presentableBlock](self, "presentableBlock");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[SWPresentationManager presentableBlock](self, "presentableBlock");
        v17 = (void (**)(__n128))objc_claimAutoreleasedReturnValue();
        v18.n128_f64[0] = v12;
        v17[2](v18);
LABEL_9:

      }
    }
  }
  else
  {
    objc_msgSend(v23, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("presentable"));

    if (v20)
    {
      -[SWPresentationManager presentableBlock](self, "presentableBlock");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[SWPresentationManager presentableBlock](self, "presentableBlock");
        v17 = (void (**)(__n128))objc_claimAutoreleasedReturnValue();
        v22.n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
        v17[2](v22);
        goto LABEL_9;
      }
    }
  }

}

- (id)descriptionForPresentationState:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("unknown");
  if (a3 == 1)
    v3 = CFSTR("presented");
  if (a3 == 2)
    return CFSTR("not presented");
  else
    return (id)v3;
}

- (unint64_t)presentationState
{
  return self->_presentationState;
}

- (id)loadBlock
{
  return self->loadBlock;
}

- (void)onLoad:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)presentableBlock
{
  return self->presentableBlock;
}

- (void)onPresentable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SWScriptsManager)scriptsManager
{
  return self->_scriptsManager;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (NSNumber)heightValue
{
  return self->_heightValue;
}

- (void)setHeightValue:(id)a3
{
  objc_storeStrong((id *)&self->_heightValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightValue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_scriptsManager, 0);
  objc_storeStrong(&self->presentableBlock, 0);
  objc_storeStrong(&self->loadBlock, 0);
}

@end
