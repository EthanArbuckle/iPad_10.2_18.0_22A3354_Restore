@implementation _UITabSidebarBottomBarWrapperView

- (_UITabSidebarBottomBarWrapperView)initWithView:(id)a3 intrinsicContentSizeInvalidationHandler:(id)a4
{
  id v8;
  id v9;
  void *v10;
  _UITabSidebarBottomBarWrapperView *v11;
  _UITabSidebarBottomBarWrapperView *v12;
  uint64_t v13;
  id intrinsicContentSizeInvalidationHandler;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabSidebarBottomBarWrapperView.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabSidebarBottomBarWrapperView.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationHandler != nil"));

LABEL_3:
  objc_msgSend(v8, "frame");
  v18.receiver = self;
  v18.super_class = (Class)_UITabSidebarBottomBarWrapperView;
  v11 = -[UIView initWithFrame:](&v18, sel_initWithFrame_);
  v12 = v11;
  if (v11)
  {
    -[UIView bounds](v11, "bounds");
    objc_msgSend(v8, "setFrame:");
    -[UIView addSubview:](v12, "addSubview:", v8);
    objc_storeStrong((id *)&v12->_view, a3);
    v13 = objc_msgSend(v10, "copy");
    intrinsicContentSizeInvalidationHandler = v12->_intrinsicContentSizeInvalidationHandler;
    v12->_intrinsicContentSizeInvalidationHandler = (id)v13;

  }
  return v12;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UITabSidebarBottomBarWrapperView;
  -[UIView layoutSubviews](&v16, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[_UITabSidebarBottomBarWrapperView layoutWithinSafeArea](self, "layoutWithinSafeArea"))
  {
    -[UIView safeAreaInsets](self, "safeAreaInsets");
    v4 = v4 + v11;
    v6 = v6 + v12;
    v8 = v8 - (v11 + v13);
    v10 = v10 - (v12 + v14);
  }
  -[_UITabSidebarBottomBarWrapperView view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v4, v6, v8, v10);

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  CGSize result;

  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_view, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITabSidebarBottomBarWrapperView;
  -[UIView _intrinsicContentSizeInvalidatedForChildView:](&v4, sel__intrinsicContentSizeInvalidatedForChildView_, a3);
  (*((void (**)(void))self->_intrinsicContentSizeInvalidationHandler + 2))();
}

- (UIView)view
{
  return self->_view;
}

- (BOOL)layoutWithinSafeArea
{
  return self->_layoutWithinSafeArea;
}

- (void)setLayoutWithinSafeArea:(BOOL)a3
{
  self->_layoutWithinSafeArea = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong(&self->_intrinsicContentSizeInvalidationHandler, 0);
}

@end
