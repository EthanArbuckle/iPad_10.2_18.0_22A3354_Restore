@implementation SMUSystemDisplayLayoutMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong(&self->transitionHandler, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SMUSystemDisplayLayoutMonitor layoutMonitor](self, "layoutMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)SMUSystemDisplayLayoutMonitor;
  -[SMUSystemDisplayLayoutMonitor dealloc](&v4, sel_dealloc);
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

void __55__SMUSystemDisplayLayoutMonitor_initWithConfiguration___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "handleUpdatedLayout:transitionContext:", v7, v6);

}

+ (id)mainDisplayLayoutMonitor
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (SMUSystemDisplayLayoutMonitor)init
{
  void *v3;
  SMUSystemDisplayLayoutMonitor *v4;

  objc_msgSend(MEMORY[0x24BE38448], "configurationForDefaultMainDisplayMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SMUSystemDisplayLayoutMonitor initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (SMUSystemDisplayLayoutMonitor)initWithConfiguration:(id)a3
{
  id v4;
  SMUSystemDisplayLayoutMonitor *v5;
  uint64_t v6;
  FBSDisplayLayoutMonitor *layoutMonitor;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, void *, void *);
  void *v12;
  id v13;
  id location;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SMUSystemDisplayLayoutMonitor;
  v5 = -[SMUSystemDisplayLayoutMonitor init](&v15, sel_init);
  if (v5)
  {
    objc_initWeak(&location, v5);
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __55__SMUSystemDisplayLayoutMonitor_initWithConfiguration___block_invoke;
    v12 = &unk_24F555E90;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v4, "setTransitionHandler:", &v9);
    objc_msgSend(MEMORY[0x24BE38438], "monitorWithConfiguration:", v4, v9, v10, v11, v12);
    v6 = objc_claimAutoreleasedReturnValue();
    layoutMonitor = v5->_layoutMonitor;
    v5->_layoutMonitor = (FBSDisplayLayoutMonitor *)v6;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)handleUpdatedLayout:(id)a3 transitionContext:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[SMUSystemDisplayLayoutMonitor transitionHandler](self, "transitionHandler");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v12, "elements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      -[SMUSystemDisplayLayoutMonitor transitionHandler](self, "transitionHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "displayConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "elements");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v9)[2](v9, v10, v11);

    }
  }

}

- (id)transitionHandler
{
  return self->transitionHandler;
}

- (void)setTransitionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

+ (id)externalDisplayLayoutMonitorWithIdentity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    SBSCreateLayoutServiceEndpointForExternalDisplay();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE38448], "configurationWithEndpoint:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConfiguration:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)currentLayout
{
  void *v2;
  void *v3;
  void *v4;

  -[SMUSystemDisplayLayoutMonitor layoutMonitor](self, "layoutMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

@end
