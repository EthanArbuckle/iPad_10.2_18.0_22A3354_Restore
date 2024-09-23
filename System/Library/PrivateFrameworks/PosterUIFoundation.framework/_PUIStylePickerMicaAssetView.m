@implementation _PUIStylePickerMicaAssetView

- (_PUIStylePickerMicaAssetView)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  _PUIStylePickerMicaAssetView *v5;
  _PUIStylePickerMicaAssetView *v6;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)_PUIStylePickerMicaAssetView;
  v5 = -[_PUIStylePickerMicaAssetView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    v5->_iconSize.width = width;
    v5->_iconSize.height = height;
    -[_PUIStylePickerMicaAssetView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
  }
  return v6;
}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PUIStylePickerMicaAssetView;
  -[_PUIStylePickerMicaAssetView layoutSubviews](&v3, sel_layoutSubviews);
  -[_PUIStylePickerMicaAssetView _layoutPackageView](self, "_layoutPackageView");
}

- (void)updateAsset:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  BSUICAPackageView *packageView;
  void *v9;
  void *v10;
  BSUICAPackageView *v11;
  BSUICAPackageView *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[_PUIStylePickerMicaAssetView stateControllerDelegate](self, "stateControllerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  packageView = self->_packageView;
  if (packageView)
  {
    -[BSUICAPackageView setStateControllerDelegate:](packageView, "setStateControllerDelegate:", 0);
    -[BSUICAPackageView removeFromSuperview](self->_packageView, "removeFromSuperview");
  }
  if (objc_msgSend(v13, "length"))
  {
    if (!v6)
    {
      v9 = (void *)MEMORY[0x24BDD1488];
      objc_opt_self();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleForClass:", v10);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v11 = (BSUICAPackageView *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BF18]), "initWithPackageName:inBundle:", v13, v6);
    v12 = self->_packageView;
    self->_packageView = v11;

    -[_PUIStylePickerMicaAssetView addSubview:](self, "addSubview:", self->_packageView);
    -[_PUIStylePickerMicaAssetView _layoutPackageView](self, "_layoutPackageView");
    -[BSUICAPackageView setStateControllerDelegate:](self->_packageView, "setStateControllerDelegate:", v7);
  }

}

- (void)setIconSize:(CGSize)a3
{
  if (self->_iconSize.width != a3.width || self->_iconSize.height != a3.height)
  {
    self->_iconSize = a3;
    -[_PUIStylePickerMicaAssetView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[_PUIStylePickerMicaAssetView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[_PUIStylePickerMicaAssetView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CAStateControllerDelegate)stateControllerDelegate
{
  return (CAStateControllerDelegate *)-[BSUICAPackageView stateControllerDelegate](self->_packageView, "stateControllerDelegate");
}

- (void)setStateControllerDelegate:(id)a3
{
  -[BSUICAPackageView setStateControllerDelegate:](self->_packageView, "setStateControllerDelegate:", a3);
}

- (NSArray)publishedObjectNames
{
  return (NSArray *)-[BSUICAPackageView publishedObjectNames](self->_packageView, "publishedObjectNames");
}

- (id)publishedObjectWithName:(id)a3
{
  return (id)-[BSUICAPackageView publishedObjectWithName:](self->_packageView, "publishedObjectWithName:", a3);
}

- (BOOL)setState:(id)a3
{
  return -[BSUICAPackageView setState:](self->_packageView, "setState:", a3);
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  return -[BSUICAPackageView setState:animated:](self->_packageView, "setState:animated:", a3, a4);
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  void (**v11)(id, _QWORD);
  BSUICAPackageView *packageView;
  char v13;

  v8 = a4;
  v10 = a3;
  v11 = (void (**)(id, _QWORD))a6;
  packageView = self->_packageView;
  if (packageView)
  {
    v13 = -[BSUICAPackageView setState:animated:transitionSpeed:completion:](packageView, "setState:animated:transitionSpeed:completion:", v10, v8, v11, a5);
  }
  else
  {
    if (v11)
      v11[2](v11, 0);
    v13 = 0;
  }

  return v13;
}

- (BOOL)setState:(id)a3 onLayer:(id)a4 animated:(BOOL)a5 transitionSpeed:(double)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  BSUICAPackageView *packageView;
  char v16;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, _QWORD))a7;
  packageView = self->_packageView;
  if (packageView)
  {
    v16 = -[BSUICAPackageView setState:onLayer:animated:transitionSpeed:completion:](packageView, "setState:onLayer:animated:transitionSpeed:completion:", v12, v13, v9, v14, a6);
  }
  else
  {
    if (v14)
      v14[2](v14, 0);
    v16 = 0;
  }

  return v16;
}

- (void)_layoutPackageView
{
  -[_PUIStylePickerMicaAssetView intrinsicContentSize](self, "intrinsicContentSize");
  -[_PUIStylePickerMicaAssetView bounds](self, "bounds");
  UIRectCenteredRect();
  -[BSUICAPackageView setFrame:](self->_packageView, "setFrame:");
}

- (CGSize)iconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageView, 0);
}

@end
