@implementation _UIStatusBarFullBackgroundActivityItem

+ (_UIStatusBarIdentifier)detailDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("detailDisplayIdentifier"));
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_UIStatusBarFullBackgroundActivityItem;
  v7 = a3;
  -[_UIStatusBarBackgroundActivityItem applyUpdate:toDisplayItem:](&v20, sel_applyUpdate_toDisplayItem_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data", v20.receiver, v20.super_class);
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
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEnabled"))
        v17 = objc_msgSend(v16, "length") != 0;
      else
        v17 = 0;
      objc_msgSend(v6, "setEnabled:", v17);
      if (objc_msgSend(v6, "isEnabled"))
      {
        -[_UIStatusBarFullBackgroundActivityItem detailStringView](self, "detailStringView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setText:", v16);

      }
      goto LABEL_10;
    }
    v13 = objc_msgSend(v10, "type");
    objc_msgSend(v6, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "backgroundDisplayIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v15)
    {
      +[_UIStatusBarActivityAction actionForBackgroundActivityType:](_UIStatusBarActivityAction, "actionForBackgroundActivityType:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAction:", v16);
LABEL_10:

    }
  }

  return v8;
}

- (_UIStatusBarStringView)detailStringView
{
  _UIStatusBarStringView *detailStringView;

  detailStringView = self->_detailStringView;
  if (!detailStringView)
  {
    -[_UIStatusBarFullBackgroundActivityItem _create_detailStringView](self, "_create_detailStringView");
    detailStringView = self->_detailStringView;
  }
  return detailStringView;
}

- (void)_create_detailStringView
{
  _UIStatusBarStringView *v3;
  _UIStatusBarStringView *v4;
  _UIStatusBarStringView *detailStringView;

  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  detailStringView = self->_detailStringView;
  self->_detailStringView = v4;

}

- (void)_create_backgroundView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarFullBackgroundActivityItem;
  -[_UIStatusBarBackgroundActivityItem _create_backgroundView](&v4, sel__create_backgroundView);
  -[_UIStatusBarBackgroundActivityItem backgroundView](self, "backgroundView");
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
    -[_UIStatusBarFullBackgroundActivityItem detailStringView](self, "detailStringView");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarFullBackgroundActivityItem;
    -[_UIStatusBarBackgroundActivityItem viewForIdentifier:](&v9, sel_viewForIdentifier_, v4);
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
    _UIStatusBar_Log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "Adding full display background activity item view", buf, 2u);
    }

    +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:](_UIStatusBarAnimationFactory, "fadeAnimationWithDuration:", 0.5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "detailDisplayIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      _UIStatusBar_Log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Adding full display detail background activity item view", buf, 2u);
      }

      +[_UIStatusBarAnimationFactory noAnimation](_UIStatusBarAnimationFactory, "noAnimation");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)_UIStatusBarFullBackgroundActivityItem;
      -[_UIStatusBarBackgroundActivityItem additionAnimationForDisplayItemWithIdentifier:](&v12, sel_additionAnimationForDisplayItemWithIdentifier_, v4);
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
    _UIStatusBar_Log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Removing full display background activity item view";
LABEL_8:
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
    }
LABEL_9:

    +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:](_UIStatusBarAnimationFactory, "fadeAnimationWithDuration:", 0.5);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend((id)objc_opt_class(), "detailDisplayIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    _UIStatusBar_Log();
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
  v12.super_class = (Class)_UIStatusBarFullBackgroundActivityItem;
  -[_UIStatusBarBackgroundActivityItem removalAnimationForDisplayItemWithIdentifier:](&v12, sel_removalAnimationForDisplayItemWithIdentifier_, v4);
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
