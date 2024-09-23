@implementation SiriSharedUIContentPlatterViewController

- (void)loadView
{
  SiriSharedUIContentPlatterView *v3;

  v3 = objc_alloc_init(SiriSharedUIContentPlatterView);
  -[SiriSharedUIContentPlatterViewController setView:](self, "setView:", v3);

}

- (void)setContentViewControllers:(id)a3
{
  NSArray *v5;
  NSArray *contentViewControllers;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  contentViewControllers = self->_contentViewControllers;
  if (contentViewControllers != v5)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = contentViewControllers;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v12, "removeFromParentViewController");
          objc_msgSend(v12, "view");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeFromSuperview");

          objc_msgSend(v12, "didMoveToParentViewController:", 0);
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->_contentViewControllers, a3);
    v14 = (void *)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = self->_contentViewControllers;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
          -[SiriSharedUIContentPlatterViewController addChildViewController:](self, "addChildViewController:", v20, (_QWORD)v23);
          objc_msgSend(v20, "didMoveToParentViewController:", self);
          objc_msgSend(v20, "view");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v17);
    }

    -[SiriSharedUIContentPlatterViewController contentPlatterView](self, "contentPlatterView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setContentViews:", v14);

  }
}

- (void)appendSeparatorToViewControllers:(id)a3 forNextViewController:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  SiriSharedUIContentPlatterSeparatorView *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  id v12;

  v12 = a4;
  v5 = (objc_class *)MEMORY[0x1E0DC3F20];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  v8 = objc_alloc_init(SiriSharedUIContentPlatterSeparatorView);
  objc_msgSend(v12, "aceObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

LABEL_4:
    -[SiriSharedUIContentPlatterSeparatorView setSeparatorType:](v8, "setSeparatorType:", 1);
    goto LABEL_5;
  }
  objc_msgSend(v12, "aceObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    goto LABEL_4;
LABEL_5:
  objc_msgSend(v7, "setView:", v8);
  objc_msgSend(v6, "addObject:", v7);

}

- (SiriSharedUIContentPlatterView)contentPlatterView
{
  void *v2;
  void *v3;
  SiriSharedUIContentPlatterView *v4;

  -[SiriSharedUIContentPlatterViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (BOOL)_canShowWhileLocked
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DA7A40], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSiriSafeForLockScreen");

  return v3;
}

- (NSArray)contentViewControllers
{
  return self->_contentViewControllers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewControllers, 0);
}

@end
