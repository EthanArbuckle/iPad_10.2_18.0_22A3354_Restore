@implementation PKCompactNavigationContainedNavigationWrapperViewController

- (PKCompactNavigationContainedNavigationWrapperViewController)initWithWrappedViewController:(id)a3 type:(int64_t)a4
{

  return 0;
}

- (PKCompactNavigationContainedNavigationWrapperViewController)initWithWrappedViewController:(id)a3 parentViewController:(id)a4
{
  id v6;
  PKCompactNavigationContainedNavigationWrapperViewController *v7;
  PKCompactNavigationContainedNavigationWrapperViewController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PKCompactNavigationContainedNavigationWrapperViewController;
  v7 = -[PKWrapperViewController initWithWrappedViewController:type:](&v10, sel_initWithWrappedViewController_type_, a3, 1);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_parentViewController, v6);

  return v8;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id WeakRetained;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  objc_super v24;
  UIEdgeInsets result;

  v6 = a3;
  -[PKWrapperViewController wrappedViewController](self, "wrappedViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v6)
  {

LABEL_3:
    v24.receiver = self;
    v24.super_class = (Class)PKCompactNavigationContainedNavigationWrapperViewController;
    -[PKCompactNavigationContainedNavigationWrapperViewController _edgeInsetsForChildViewController:insetsAreAbsolute:](&v24, sel__edgeInsetsForChildViewController_insetsAreAbsolute_, v6, a4);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    WeakRetained = 0;
    goto LABEL_4;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);

  if (!WeakRetained)
    goto LABEL_3;
  if (a4)
    *a4 = 1;
  v9 = *MEMORY[0x1E0DC49E8];
  v11 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v13 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v15 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (self->_useParentSafeAreaInsets)
  {
    objc_msgSend(WeakRetained, "viewIfLoaded");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "safeAreaInsets");
      v13 = fmax(v23, v13);
    }

  }
LABEL_4:

  v17 = v9;
  v18 = v11;
  v19 = v13;
  v20 = v15;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (BOOL)useParentSafeAreaInsets
{
  return self->_useParentSafeAreaInsets;
}

- (void)setUseParentSafeAreaInsets:(BOOL)a3
{
  self->_useParentSafeAreaInsets = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);
}

@end
