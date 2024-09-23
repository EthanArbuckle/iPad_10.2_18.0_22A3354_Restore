@implementation SXActionActivityManager

- (SXActionActivityManager)init
{
  SXActionActivityManager *v2;
  uint64_t v3;
  NSMutableDictionary *activityProviders;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXActionActivityManager;
  v2 = -[SXActionActivityManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    activityProviders = v2->_activityProviders;
    v2->_activityProviders = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)registerActionActivityProvider:(id)a3 actionType:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = a3;
      -[SXActionActivityManager activityProviders](self, "activityProviders");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, v6);

    }
  }
}

- (id)activityGroupForAction:(id)a3
{
  return -[SXActionActivityManager activityGroupForAction:sourceView:sourceRect:](self, "activityGroupForAction:sourceView:sourceRect:", a3, 0, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
}

- (id)activityGroupForAction:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v12 = a3;
  -[SXActionActivityManager activityProviderForAction:](self, "activityProviderForAction:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "activityGroupForAction:sourceView:sourceRect:", v12, v11, x, y, width, height);
  else
    objc_msgSend(v13, "activityGroupForAction:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)previewActivityForAction:(id)a3
{
  return -[SXActionActivityManager previewActivityForAction:sourceView:sourceRect:](self, "previewActivityForAction:sourceView:sourceRect:", a3, 0, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
}

- (id)previewActivityForAction:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  -[SXActionActivityManager activityProviderForAction:](self, "activityProviderForAction:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "previewActivityForAction:sourceView:sourceRect:", v11, v12, x, y, width, height);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v15 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v13, "previewActivityForAction:", v11);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;
LABEL_7:

  return v15;
}

- (id)activityProviderForAction:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "type");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (a3 && v5)
  {
    -[SXActionActivityManager activityProviders](self, "activityProviders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (NSMutableDictionary)activityProviders
{
  return self->_activityProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityProviders, 0);
}

@end
