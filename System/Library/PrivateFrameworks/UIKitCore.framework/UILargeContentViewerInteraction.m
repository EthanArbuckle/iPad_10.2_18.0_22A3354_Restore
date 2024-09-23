@implementation UILargeContentViewerInteraction

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (UILargeContentViewerInteraction)init
{
  return -[UILargeContentViewerInteraction initWithDelegate:](self, "initWithDelegate:", 0);
}

+ (BOOL)isEnabled
{
  return _MergedGlobals_1272;
}

+ (void)initialize
{
  if (initialize_onceToken_1 != -1)
    dispatch_once(&initialize_onceToken_1, &__block_literal_global_586);
}

- (void)didMoveToView:(id)a3
{
  id WeakRetained;
  UIAccessibilityHUDGestureManager *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_view, obj);
    if (obj)
    {
      v5 = -[UIAccessibilityHUDGestureManager initWithView:delegate:]([UIAccessibilityHUDGestureManager alloc], "initWithView:delegate:", obj, self);
      objc_msgSend(obj, "_setLargeContentViewerGestureManager:", v5);

    }
  }

}

- (void)willMoveToView:(id)a3
{
  UIView **p_view;
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;

  p_view = &self->_view;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_view);

  if (WeakRetained != v4)
  {
    v6 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v6, "_largeContentViewerGestureManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_invalidate");

    v8 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v8, "_setLargeContentViewerGestureManager:", 0);

  }
}

void __45__UILargeContentViewerInteraction_initialize__block_invoke()
{
  NSString *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v0 = (NSString *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_1272 = UIContentSizeCategoryIsAccessibilityCategory(v0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", CFSTR("UIContentSizeCategoryDidChangeNotification"), 0, v1, &__block_literal_global_92_1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD81D68;
  qword_1ECD81D68 = v2;

}

- (UILargeContentViewerInteraction)initWithDelegate:(id)delegate
{
  id v4;
  UILargeContentViewerInteraction *v5;
  UILargeContentViewerInteraction *v6;
  objc_super v8;

  v4 = delegate;
  v8.receiver = self;
  v8.super_class = (Class)UILargeContentViewerInteraction;
  v5 = -[UILargeContentViewerInteraction init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

void __45__UILargeContentViewerInteraction_initialize__block_invoke_2()
{
  NSString *v0;
  int IsAccessibilityCategory;
  id v2;

  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v0 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v0);

  if (_MergedGlobals_1272 != IsAccessibilityCategory)
  {
    _MergedGlobals_1272 = IsAccessibilityCategory;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("UILargeContentViewerInteractionEnabledStatusDidChangeNotification"), 0);

  }
}

- (UIGestureRecognizer)gestureRecognizerForExclusionRelationship
{
  void *v2;
  void *v3;
  void *v4;

  -[UILargeContentViewerInteraction view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_largeContentViewerGestureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_recognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIGestureRecognizer *)v4;
}

- (id)_itemAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;

  y = a3.y;
  x = a3.x;
  -[UILargeContentViewerInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
    -[UILargeContentViewerInteraction view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_largeContentViewerItemAtPoint:", x, y);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[UILargeContentViewerInteraction delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "largeContentViewerInteraction:itemAtPoint:", self, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "showsLargeContentViewer") & 1) == 0)
  {
    v10 = 0;
LABEL_5:

    v9 = (void *)v10;
  }
  return v9;
}

- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4
{
  void *v4;
  UIAccessibilityHUDItem *v5;
  UIAccessibilityHUDItem *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[UILargeContentViewerInteraction _itemAtPoint:](self, "_itemAtPoint:", a3, a4.x, a4.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "accessibilityHUDRepresentation");
    v5 = (UIAccessibilityHUDItem *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_7;
  }
  else
  {
    v5 = 0;
  }
  if (v4)
  {
    v6 = [UIAccessibilityHUDItem alloc];
    objc_msgSend(v4, "largeContentTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "largeContentImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "largeContentImageInsets");
    v5 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:](v6, "initWithTitle:image:imageInsets:scaleImage:", v7, v8, objc_msgSend(v4, "scalesLargeContentImage"), v9, v10, v11, v12);

  }
LABEL_7:

  return v5;
}

- (void)_accessibilityHUDGestureManager:(id)a3 gestureLiftedAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  id v12;

  y = a4.y;
  x = a4.x;
  v12 = a3;
  -[UILargeContentViewerInteraction _itemAtPoint:](self, "_itemAtPoint:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILargeContentViewerInteraction delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[UILargeContentViewerInteraction delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "largeContentViewerInteraction:didEndOnItem:atPoint:", self, v7, x, y);
LABEL_6:

    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
    if (objc_msgSend(v10, "isEnabled"))
    {
      objc_msgSend(v12, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "convertPoint:fromView:", v11, x, y);
      objc_msgSend(v10, "_activateForAccessibilityHUDLiftAtPoint:");

    }
    goto LABEL_6;
  }
LABEL_7:

}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (id)_viewControllerForAccessibilityHUDGestureManager:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[UILargeContentViewerInteraction delegate](self, "delegate", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    goto LABEL_4;
  -[UILargeContentViewerInteraction delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewControllerForLargeContentViewerInteraction:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise:format:", v10, CFSTR("A non-nil view controller must be returned from %@"), v11);

LABEL_4:
    v8 = 0;
  }
  return v8;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
}

@end
