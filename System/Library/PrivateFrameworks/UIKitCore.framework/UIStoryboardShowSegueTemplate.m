@implementation UIStoryboardShowSegueTemplate

- (UIStoryboardShowSegueTemplate)initWithCoder:(id)a3
{
  id v4;
  UIStoryboardShowSegueTemplate *v5;
  void *v6;
  uint64_t v7;
  NSString *action;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIStoryboardShowSegueTemplate;
  v5 = -[UIStoryboardSegueTemplate initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIActionName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    action = v5->_action;
    v5->_action = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIStoryboardShowSegueTemplate;
  v4 = a3;
  -[UIStoryboardSegueTemplate encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[UIStoryboardShowSegueTemplate action](self, "action", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UIActionName"));

}

- (id)newDefaultPerformHandlerForSegue:(id)a3
{
  id v4;
  NSString *v5;
  SEL v6;
  void *v7;
  _QWORD aBlock[4];
  id v10[2];
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  if (self->_action)
  {
    -[UIStoryboardShowSegueTemplate action](self, "action");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = NSSelectorFromString(v5);

  }
  else
  {
    v6 = sel_showViewController_sender_;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__UIStoryboardShowSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke;
  aBlock[3] = &unk_1E16C0530;
  objc_copyWeak(v10, &location);
  v10[1] = (id)v6;
  v7 = _Block_copy(aBlock);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

  return v7;
}

void __66__UIStoryboardShowSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sourceViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "destinationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_showViewController:withAction:sender:", v3, v4, v5);

}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
}

@end
