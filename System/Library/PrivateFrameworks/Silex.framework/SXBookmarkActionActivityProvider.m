@implementation SXBookmarkActionActivityProvider

- (id)initWithBookmarkManager:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)SXBookmarkActionActivityProvider;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (id)activityGroupForAction:(id)a3
{
  id v4;
  SXActionActivityGroup *v5;
  SXBlockActionActivity *v6;
  void *v7;
  void *v8;
  SXBlockActionActivity *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  SXBookmarkActionActivityProvider *v15;
  id v16;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = -[SXActionActivityGroup initWithTitle:]([SXActionActivityGroup alloc], "initWithTitle:", 0);
    v6 = [SXBlockActionActivity alloc];
    SXBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Open"), &stru_24D68E0F8, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __59__SXBookmarkActionActivityProvider_activityGroupForAction___block_invoke;
    v14 = &unk_24D6875A0;
    v15 = self;
    v16 = v4;
    v9 = -[SXBlockActionActivity initWithLabel:type:block:](v6, "initWithLabel:type:block:", v8, 0, &v11);
    -[SXActionActivityGroup addActivity:](v5, "addActivity:", v9, v11, v12, v13, v14, v15);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __59__SXBookmarkActionActivityProvider_activityGroupForAction___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  _QWORD *v3;
  id v4;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[1];
  v2 = *(void **)(a1 + 40);
  v3 = v1;
  objc_msgSend(v2, "bookmark");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyBookmark:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkManager, 0);
}

@end
