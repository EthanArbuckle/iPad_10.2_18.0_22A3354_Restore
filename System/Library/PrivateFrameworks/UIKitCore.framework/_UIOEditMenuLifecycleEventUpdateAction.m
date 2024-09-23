@implementation _UIOEditMenuLifecycleEventUpdateAction

- (_UIOEditMenuLifecycleEventUpdateAction)initWithMenuIdentifier:(id)a3 event:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  _UIOEditMenuLifecycleEventUpdateAction *v9;
  objc_super v11;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setObject:forSetting:", v6, 0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v8, 1);

  v11.receiver = self;
  v11.super_class = (Class)_UIOEditMenuLifecycleEventUpdateAction;
  v9 = -[_UIOEditMenuLifecycleEventUpdateAction initWithInfo:responder:](&v11, sel_initWithInfo_responder_, v7, 0);

  return v9;
}

- (id)identifier
{
  void *v2;
  void *v3;

  -[_UIOEditMenuLifecycleEventUpdateAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)lifecycleEvent
{
  void *v2;
  void *v3;
  int64_t v4;

  -[_UIOEditMenuLifecycleEventUpdateAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)handleClientActionToOverlayService:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "handleLifecycleEvent:", -[_UIOEditMenuLifecycleEventUpdateAction lifecycleEvent](self, "lifecycleEvent"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIOEditMenuLifecycleEventUpdateAction.m"), 47, CFSTR("Cannot handle response to unknown overlay service: %@"), v7);

  }
}

- (NSString)menuIdentifier
{
  return self->_menuIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuIdentifier, 0);
}

@end
