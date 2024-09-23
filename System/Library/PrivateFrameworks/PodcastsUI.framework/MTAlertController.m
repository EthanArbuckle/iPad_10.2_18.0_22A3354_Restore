@implementation MTAlertController

- (MTAlertController)init
{
  MTAlertController *v2;
  MTAlertController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTAlertController;
  v2 = -[MTAlertController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MTAlertController setReplacesExistingAlert:](v2, "setReplacesExistingAlert:", 1);
    -[MTAlertController _setIgnoreAppSupportedOrientations:](v3, "_setIgnoreAppSupportedOrientations:", 1);
  }
  return v3;
}

- (void)presentAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  MTAlertController *v17;
  void (**v18)(_QWORD);
  BOOL v19;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x1E0DC3F20], "mt_rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mt_topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MTAlertController replacesExistingAlert](self, "replacesExistingAlert")
    && (objc_opt_class(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = v8;
    objc_msgSend(v9, "alertIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlertController alertIdentifier](self, "alertIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (v12)
    {
      if (v6)
        v6[2](v6);
    }
    else
    {
      objc_msgSend(v9, "presentingViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __48__MTAlertController_presentAnimated_completion___block_invoke;
      v15[3] = &unk_1EA0C5BA8;
      v16 = v13;
      v17 = self;
      v19 = v4;
      v18 = v6;
      v14 = v13;
      objc_msgSend(v14, "dismissViewControllerAnimated:completion:", v4, v15);

    }
  }
  else
  {
    objc_msgSend(v8, "presentViewController:animated:completion:", self, v4, v6);
  }

}

uint64_t __48__MTAlertController_presentAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (id)alertIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[MTAlertController title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTAlertController message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MTAlertController actions](self, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        objc_msgSend(v6, "appendString:", CFSTR(" "));
        objc_msgSend(v12, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (BOOL)replacesExistingAlert
{
  return self->_replacesExistingAlert;
}

- (void)setReplacesExistingAlert:(BOOL)a3
{
  self->_replacesExistingAlert = a3;
}

@end
