@implementation STUIStatusBarFullBackgroundActivityItem

+ (STUIStatusBarIdentifier)detailDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("detailDisplayIdentifier"));
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  objc_super v19;

  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)STUIStatusBarFullBackgroundActivityItem;
  v7 = a3;
  -[STUIStatusBarBackgroundActivityItem applyUpdate:toDisplayItem:](&v19, sel_applyUpdate_toDisplayItem_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data", v19.receiver, v19.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundActivityEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v7, "dataChanged");
  if ((_DWORD)v9)
  {
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "detailDisplayIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v12)
    {
      objc_msgSend(v10, "detailString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEnabled"))
        v17 = objc_msgSend(v13, "length") != 0;
      else
        v17 = 0;
      objc_msgSend(v6, "setEnabled:", v17);
      if (!objc_msgSend(v6, "isEnabled"))
        goto LABEL_11;
      -[STUIStatusBarFullBackgroundActivityItem detailStringView](self, "detailStringView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setText:", v13);
    }
    else
    {
      objc_msgSend(v10, "backgroundActivityIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "backgroundDisplayIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 != v15)
      {
LABEL_11:

        goto LABEL_12;
      }
      +[STUIStatusBarActivityAction actionForBackgroundActivityWithIdentifier:](STUIStatusBarActivityAction, "actionForBackgroundActivityWithIdentifier:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAction:", v16);
    }

    goto LABEL_11;
  }
LABEL_12:

  return v8;
}

- (STUIStatusBarStringView)detailStringView
{
  STUIStatusBarStringView *detailStringView;

  detailStringView = self->_detailStringView;
  if (!detailStringView)
  {
    -[STUIStatusBarFullBackgroundActivityItem _create_detailStringView](self, "_create_detailStringView");
    detailStringView = self->_detailStringView;
  }
  return detailStringView;
}

- (void)_create_detailStringView
{
  STUIStatusBarStringView *v3;
  STUIStatusBarStringView *v4;
  STUIStatusBarStringView *detailStringView;

  v3 = [STUIStatusBarStringView alloc];
  v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  detailStringView = self->_detailStringView;
  self->_detailStringView = v4;

}

- (void)_create_backgroundView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarFullBackgroundActivityItem;
  -[STUIStatusBarBackgroundActivityItem _create_backgroundView](&v4, sel__create_backgroundView);
  -[STUIStatusBarBackgroundActivityItem backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerRadius:", 0.0);

}

- (id)viewForIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "detailDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[STUIStatusBarFullBackgroundActivityItem detailStringView](self, "detailStringView");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarFullBackgroundActivityItem;
    -[STUIStatusBarBackgroundActivityItem viewForIdentifier:](&v9, sel_viewForIdentifier_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "backgroundDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    _STUIStatusBar_BackgroundActivity_Log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFE2E000, v8, OS_LOG_TYPE_DEFAULT, "Adding full display background activity item view", buf, 2u);
    }

    +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:](STUIStatusBarAnimationFactory, "fadeAnimationWithDuration:", 0.5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "detailDisplayIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      _STUIStatusBar_BackgroundActivity_Log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CFE2E000, v9, OS_LOG_TYPE_DEFAULT, "Adding full display detail background activity item view", buf, 2u);
      }

      +[STUIStatusBarAnimationFactory noAnimation](STUIStatusBarAnimationFactory, "noAnimation");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)STUIStatusBarFullBackgroundActivityItem;
      -[STUIStatusBarBackgroundActivityItem additionAnimationForDisplayItemWithIdentifier:](&v12, sel_additionAnimationForDisplayItemWithIdentifier_, v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  v10 = (void *)v7;

  return v10;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "backgroundDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    _STUIStatusBar_BackgroundActivity_Log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Removing full display background activity item view";
LABEL_8:
      _os_log_impl(&dword_1CFE2E000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
    }
LABEL_9:

    +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:](STUIStatusBarAnimationFactory, "fadeAnimationWithDuration:", 0.5);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend((id)objc_opt_class(), "detailDisplayIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    _STUIStatusBar_BackgroundActivity_Log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Removing full display detail background activity item view";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v12.receiver = self;
  v12.super_class = (Class)STUIStatusBarFullBackgroundActivityItem;
  -[STUIStatusBarBackgroundActivityItem removalAnimationForDisplayItemWithIdentifier:](&v12, sel_removalAnimationForDisplayItemWithIdentifier_, v4);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v10 = (void *)v7;

  return v10;
}

- (void)setDetailStringView:(id)a3
{
  objc_storeStrong((id *)&self->_detailStringView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailStringView, 0);
}

@end
