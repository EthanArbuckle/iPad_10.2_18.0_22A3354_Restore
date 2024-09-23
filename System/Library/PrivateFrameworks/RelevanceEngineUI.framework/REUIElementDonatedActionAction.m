@implementation REUIElementDonatedActionAction

- (REUIElementDonatedActionAction)initWithProperties:(id)a3
{
  id v5;
  REUIElementDonatedActionAction *v6;
  REUIElementDonatedActionAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REUIElementDonatedActionAction;
  v6 = -[REUIElementDonatedActionAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_properties, a3);

  return v7;
}

- (NSString)bundleIdentifier
{
  return -[REUIDonatedElementProperties bundleIdentifier](self->_properties, "bundleIdentifier");
}

- (NSString)appName
{
  return -[REUIDonatedElementProperties appName](self->_properties, "appName");
}

- (UIImage)appIcon
{
  return -[REUIDonatedElementProperties appIcon](self->_properties, "appIcon");
}

- (id)fullsizeAppIcon
{
  return -[REUIDonatedElementProperties fullsizeAppIcon](self->_properties, "fullsizeAppIcon");
}

- (void)dealloc
{
  objc_super v3;

  -[REUISiriActionsPerformer setDelegate:](self->_performer, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)REUIElementDonatedActionAction;
  -[REUIElementDonatedActionAction dealloc](&v3, sel_dealloc);
}

- (id)_newPerformer
{
  return 0;
}

- (id)siriActionsPerformerWantsAlertBackgroundImage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[REElementAction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[REElementAction delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intentActionWantsBackgroundImageForAlert:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)siriActionsPerformerWantsBackgroundViewToBlur:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[REElementAction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[REElementAction delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intentActionWantsBackgroundToBlurForAlert:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)siriActionsPerformerDidSucceed:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__REUIElementDonatedActionAction_siriActionsPerformerDidSucceed___block_invoke;
  block[3] = &unk_24CF79F88;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __65__REUIElementDonatedActionAction_siriActionsPerformerDidSucceed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "elementAction:didFinishTask:", *(_QWORD *)(a1 + 32), 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "performer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStrongDelegate:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setPerformer:", 0);
}

- (void)siriActionsPerformer:(id)a3 didFailWithError:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__REUIElementDonatedActionAction_siriActionsPerformer_didFailWithError___block_invoke;
  block[3] = &unk_24CF79F88;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __72__REUIElementDonatedActionAction_siriActionsPerformer_didFailWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "elementAction:didFinishTask:", *(_QWORD *)(a1 + 32), 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "performer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStrongDelegate:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setPerformer:", 0);
}

- (BOOL)siriActionsPerformer:(id)a3 wantsToPresentViewController:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;

  v5 = a4;
  -[REElementAction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();
  if ((v7 & 1) != 0)
  {
    -[REElementAction delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "elementAction:wantsViewControllerDisplayed:", self, v5);

  }
  return v7 & 1;
}

- (BOOL)siriActionsPerformer:(id)a3 wantsToDismissViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  objc_msgSend(a4, "dismissViewControllerAnimated:completion:", a5, a6);
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  void *v7;

  v5 = objc_alloc((Class)objc_opt_class());
  v6 = -[REUIDonatedElementProperties copyWithZone:](self->_properties, "copyWithZone:", a3);
  v7 = (void *)objc_msgSend(v5, "initWithProperties:", v6);

  return v7;
}

- (REUISiriActionsPerformer)performer
{
  return self->_performer;
}

- (void)setPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_performer, a3);
}

- (REUIDonatedElementProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_performer, 0);
}

@end
