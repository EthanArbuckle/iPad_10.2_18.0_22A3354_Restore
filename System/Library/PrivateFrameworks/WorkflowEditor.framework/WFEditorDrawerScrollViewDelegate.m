@implementation WFEditorDrawerScrollViewDelegate

- (WFEditorDrawerScrollViewDelegate)initWithDrawerItem:(id)a3 originalDelegate:(id)a4
{
  id v7;
  id v8;
  WFEditorDrawerScrollViewDelegate *v9;
  WFEditorDrawerScrollViewDelegate *v10;
  WFEditorDrawerScrollViewDelegate *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFEditorDrawerScrollViewDelegate;
  v9 = -[WFEditorDrawerScrollViewDelegate init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_drawerItem, a3);
    objc_storeWeak((id *)&v10->_originalDelegate, v8);
    v11 = v10;
  }

  return v10;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v4;
  char v5;
  void *v6;

  -[WFEditorDrawerScrollViewDelegate drawerItem](self, "drawerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[WFEditorDrawerScrollViewDelegate originalDelegate](self, "originalDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  return v5 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[WFEditorDrawerScrollViewDelegate drawerItem](self, "drawerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[WFEditorDrawerScrollViewDelegate drawerItem](self, "drawerItem");
  else
    -[WFEditorDrawerScrollViewDelegate originalDelegate](self, "originalDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "methodSignatureForSelector:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)forwardInvocation:(id)a3
{
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  -[WFEditorDrawerScrollViewDelegate drawerItem](self, "drawerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selector");
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFEditorDrawerScrollViewDelegate drawerItem](self, "drawerItem");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v6;
    objc_msgSend(v10, "invokeWithTarget:", v6);

    goto LABEL_6;
  }
  -[WFEditorDrawerScrollViewDelegate originalDelegate](self, "originalDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selector");
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[WFEditorDrawerScrollViewDelegate originalDelegate](self, "originalDelegate");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

}

- (WFDrawerItem)drawerItem
{
  return self->_drawerItem;
}

- (UIScrollViewDelegate)originalDelegate
{
  return (UIScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_originalDelegate);
}

- (void)setOriginalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_originalDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_originalDelegate);
  objc_storeStrong((id *)&self->_drawerItem, 0);
}

+ (id)findScrollViewInView:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "subviews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          NSClassFromString(CFSTR("UIFieldEditor"));
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v10 = v9;
LABEL_13:
            v11 = v10;
            goto LABEL_14;
          }
        }
        objc_msgSend(a1, "findScrollViewInView:", v9);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (v10)
          goto LABEL_13;
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_14:

  return v11;
}

@end
