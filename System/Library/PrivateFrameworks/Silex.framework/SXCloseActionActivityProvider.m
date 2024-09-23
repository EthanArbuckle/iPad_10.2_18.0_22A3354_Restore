@implementation SXCloseActionActivityProvider

- (id)initWithViewControllerPresenting:(void *)a3 handler:
{
  id v6;
  id v7;
  id *v8;
  objc_super v10;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SXCloseActionActivityProvider;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (id)activityGroupForAction:(id)a3
{
  SXActionActivityGroup *v4;
  SXBlockActionActivity *v5;
  void *v6;
  void *v7;
  SXBlockActionActivity *v8;
  _QWORD v10[5];

  v4 = -[SXActionActivityGroup initWithTitle:]([SXActionActivityGroup alloc], "initWithTitle:", 0);
  v5 = [SXBlockActionActivity alloc];
  SXBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Close"), &stru_24D68E0F8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__SXCloseActionActivityProvider_activityGroupForAction___block_invoke;
  v10[3] = &unk_24D688798;
  v10[4] = self;
  v8 = -[SXBlockActionActivity initWithLabel:type:block:](v5, "initWithLabel:type:block:", v7, 0, v10);
  -[SXActionActivityGroup addActivity:](v4, "addActivity:", v8);

  return v4;
}

void __56__SXCloseActionActivityProvider_activityGroupForAction___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[2];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(_QWORD *)(v2 + 8);
  else
    v3 = 0;
  v4 = v1;
  objc_msgSend(v4, "handleCloseActionOnPresenter:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_viewControllerPresenting, 0);
}

@end
