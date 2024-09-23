@implementation PTUIPushViewControllerRowAction

+ (id)actionWithViewControllerCreator:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = objc_msgSend(v3, "copy");

  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (BOOL)deselectsRowOnSuccess
{
  return 0;
}

- (id)defaultHandler
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__PTUIPushViewControllerRowAction_defaultHandler__block_invoke;
  v3[3] = &unk_24C435A48;
  v3[4] = self;
  return (id)MEMORY[0x20BD36E44](v3, a2);
}

uint64_t __49__PTUIPushViewControllerRowAction_defaultHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (v7
    && ((*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    objc_msgSend(v6, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 1;
    objc_msgSend(v10, "pushViewController:animated:", v9, 1);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)viewControllerCreator
{
  return self->_viewControllerCreator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewControllerCreator, 0);
}

@end
