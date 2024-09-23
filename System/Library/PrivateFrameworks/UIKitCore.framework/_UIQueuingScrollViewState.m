@implementation _UIQueuingScrollViewState

- (_UIQueuingScrollViewState)initWithTransitionDirection:(int64_t)a3 view:(id)a4 manual:(BOOL)a5 completion:(id)a6
{
  id v11;
  id v12;
  _UIQueuingScrollViewState *v13;
  _UIQueuingScrollViewState *v14;
  uint64_t v15;
  UIViewController *viewController;
  objc_super v18;

  v11 = a4;
  v12 = a6;
  if (!v11)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-[_UIQueuingScrollViewState initWithTransitionDirection:view:completion:] called without a valid view."));
  v18.receiver = self;
  v18.super_class = (Class)_UIQueuingScrollViewState;
  v13 = -[_UITransitionState initWithTransitionDirection:completion:](&v18, sel_initWithTransitionDirection_completion_, a3, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_view, a4);
    +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v14->_view);
    v15 = objc_claimAutoreleasedReturnValue();
    viewController = v14->_viewController;
    v14->_viewController = (UIViewController *)v15;

    v14->_manual = a5;
  }

  return v14;
}

- (BOOL)isCompatibleWithTransitionInDirection:(int64_t)a3
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIQueuingScrollViewState;
  -[_UITransitionState description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  if (self->_manual)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  -[_UIQueuingScrollViewState view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("; isManual: %@; view: %@>"), v5, v6);

  return v4;
}

- (UIView)view
{
  return self->_view;
}

- (BOOL)isManual
{
  return self->_manual;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
