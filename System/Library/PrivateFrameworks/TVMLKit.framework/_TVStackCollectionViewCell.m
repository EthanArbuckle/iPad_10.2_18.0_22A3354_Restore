@implementation _TVStackCollectionViewCell

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVStackCollectionViewCell;
  -[_TVStackCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[_TVStackCollectionViewCell setViewController:](self, "setViewController:", 0);
  -[_TVStackCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", 0);
}

- (void)setViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  UIView **p_cellContentView;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  v5 = obj;
  if (WeakRetained == obj)
    goto LABEL_13;
  v6 = objc_storeWeak((id *)&self->_viewController, obj);

  v5 = obj;
  if (!obj)
    goto LABEL_13;
  objc_msgSend(obj, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  p_cellContentView = &self->_cellContentView;
  v9 = objc_loadWeakRetained((id *)&self->_cellContentView);

  if (v9 != v7)
  {
    v10 = objc_loadWeakRetained((id *)&self->_cellContentView);
    v11 = objc_loadWeakRetained((id *)&self->_stowedContentView);

    v12 = objc_loadWeakRetained((id *)&self->_cellContentView);
    v13 = v12;
    if (v10 == v11)
    {
      objc_msgSend(v12, "setHidden:", 1);
    }
    else
    {
      objc_msgSend(v12, "superview");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVStackCollectionViewCell contentView](self, "contentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 != v15)
      {
LABEL_9:
        objc_storeWeak((id *)&self->_cellContentView, v7);
        goto LABEL_10;
      }
      v13 = objc_loadWeakRetained((id *)&self->_cellContentView);
      objc_msgSend(v13, "removeFromSuperview");
    }

    goto LABEL_9;
  }
LABEL_10:
  v16 = objc_loadWeakRetained((id *)&self->_cellContentView);
  objc_msgSend(v16, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVStackCollectionViewCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 != v18)
  {
    v19 = objc_loadWeakRetained((id *)&self->_cellContentView);
    objc_msgSend(v19, "setHidden:", 0);

    -[_TVStackCollectionViewCell contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_loadWeakRetained((id *)p_cellContentView);
    objc_msgSend(v20, "addSubview:", v21);

  }
  v5 = obj;
LABEL_13:

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TVStackCollectionViewCell;
  -[_TVStackCollectionViewCell layoutSubviews](&v9, sel_layoutSubviews);
  -[_TVStackCollectionViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[_TVStackCollectionViewCell viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v4, v6);

}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[_TVStackCollectionViewCell viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_TVStackCollectionViewCell viewController](self, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  int64_t pressesEventDepth;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVStackCollectionViewCell;
  -[_TVStackCollectionViewCell pressesBegan:withEvent:](&v7, sel_pressesBegan_withEvent_, a3, a4);
  pressesEventDepth = self->_pressesEventDepth;
  self->_pressesEventDepth = pressesEventDepth + 1;
  if (!pressesEventDepth)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_cellContentView);
    objc_storeWeak((id *)&self->_stowedContentView, WeakRetained);

  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVStackCollectionViewCell;
  -[_TVStackCollectionViewCell pressesCancelled:withEvent:](&v5, sel_pressesCancelled_withEvent_, a3, a4);
  -[_TVStackCollectionViewCell _pressesDidEnd](self, "_pressesDidEnd");
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVStackCollectionViewCell;
  -[_TVStackCollectionViewCell pressesEnded:withEvent:](&v5, sel_pressesEnded_withEvent_, a3, a4);
  -[_TVStackCollectionViewCell _pressesDidEnd](self, "_pressesDidEnd");
}

- (void)_pressesDidEnd
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_222D98000, log, OS_LOG_TYPE_ERROR, "presses ended at depth 0", v1, 2u);
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_stowedContentView);
  objc_destroyWeak((id *)&self->_cellContentView);
}

@end
