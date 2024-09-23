@implementation STUIStatusBarActivityItem_Split

+ (STUIStatusBarIdentifier)syncStartDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("syncStartDisplayIdentifier"));
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)STUIStatusBarActivityItem_Split;
  -[STUIStatusBarActivityItem applyUpdate:toDisplayItem:](&v20, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "dataChanged"))
  {
    objc_msgSend(v6, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activityEntry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "type");

    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "syncStartDisplayIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 == v13)
    {
      if (!-[STUIStatusBarActivityItem_SyncOnly _enableForType:](self, "_enableForType:", v11))
      {
        objc_msgSend(v7, "setEnabled:", 0);
        goto LABEL_9;
      }
      objc_msgSend(v7, "setViewAlpha:", 0.8);
      v17 = dbl_1CFEBFBE0[(v11 & 2) == 0];
      -[STUIStatusBarActivityItem_Split syncStartView](self, "syncStartView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAnimationDuration:", v17);

      -[STUIStatusBarActivityItem_Split syncStartView](self, "syncStartView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "startAnimating");
      goto LABEL_7;
    }
    objc_msgSend(v7, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "pillDisplayIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v15)
    {
      -[STUIStatusBarActivityItem_Split activityView](self, "activityView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setIsSlow:", (v11 >> 1) & 1);
LABEL_7:

    }
  }
LABEL_9:

  return v8;
}

- (UIEdgeInsets)activityIndicatorAlignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 2.66666667;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v2;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncStartView, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
}

+ (STUIStatusBarIdentifier)pillDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("pillDisplayIdentifier"));
}

- (STUIStatusBarActivityView)activityView
{
  STUIStatusBarActivityView *activityView;

  activityView = self->_activityView;
  if (!activityView)
  {
    -[STUIStatusBarActivityItem_Split _create_activityView](self, "_create_activityView");
    activityView = self->_activityView;
  }
  return activityView;
}

- (void)_create_activityView
{
  STUIStatusBarActivityView *v3;
  STUIStatusBarActivityView *v4;
  STUIStatusBarActivityView *activityView;

  v3 = [STUIStatusBarActivityView alloc];
  v4 = -[STUIStatusBarActivityView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  activityView = self->_activityView;
  self->_activityView = v4;

}

- (STUIStatusBarActivityIndicator)syncStartView
{
  STUIStatusBarActivityIndicator *syncStartView;

  syncStartView = self->_syncStartView;
  if (!syncStartView)
  {
    -[STUIStatusBarActivityItem_Split _create_syncStartView](self, "_create_syncStartView");
    syncStartView = self->_syncStartView;
  }
  return syncStartView;
}

- (void)_create_syncStartView
{
  STUIStatusBarActivityIndicator *v3;
  STUIStatusBarActivityIndicator *v4;
  STUIStatusBarActivityIndicator *syncStartView;

  v3 = [STUIStatusBarActivityIndicator alloc];
  v4 = -[STUIStatusBarActivityIndicator initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  syncStartView = self->_syncStartView;
  self->_syncStartView = v4;

  -[STUIStatusBarActivityIndicator setActivityIndicatorViewStyle:](self->_syncStartView, "setActivityIndicatorViewStyle:", 12);
}

- (id)viewForIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "syncStartDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[STUIStatusBarActivityItem_Split syncStartView](self, "syncStartView");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "pillDisplayIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[STUIStatusBarActivityItem_Split activityView](self, "activityView");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)STUIStatusBarActivityItem_Split;
      -[STUIStatusBarActivityItem viewForIdentifier:](&v10, sel_viewForIdentifier_, v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  v8 = (void *)v7;

  return v8;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;
  _QWORD v10[5];

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "pillDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__STUIStatusBarActivityItem_Split_additionAnimationForDisplayItemWithIdentifier___block_invoke;
    v10[3] = &unk_1E8D63958;
    v10[4] = self;
    +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v10);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarActivityItem_Split;
    -[STUIStatusBarItem additionAnimationForDisplayItemWithIdentifier:](&v9, sel_additionAnimationForDisplayItemWithIdentifier_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;
  _QWORD v10[5];

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "pillDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__STUIStatusBarActivityItem_Split_removalAnimationForDisplayItemWithIdentifier___block_invoke;
    v10[3] = &unk_1E8D63958;
    v10[4] = self;
    +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v10);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarActivityItem_Split;
    -[STUIStatusBarItem removalAnimationForDisplayItemWithIdentifier:](&v9, sel_removalAnimationForDisplayItemWithIdentifier_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (void)setActivityView:(id)a3
{
  objc_storeStrong((id *)&self->_activityView, a3);
}

- (void)setSyncStartView:(id)a3
{
  objc_storeStrong((id *)&self->_syncStartView, a3);
}

@end
