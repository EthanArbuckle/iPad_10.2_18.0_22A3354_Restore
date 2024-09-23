@implementation UIKBStackViewController

- (void)loadView
{
  UIStackView *v3;
  UIStackView *v4;

  v3 = [UIStackView alloc];
  v4 = -[UIStackView initWithArrangedSubviews:](v3, "initWithArrangedSubviews:", MEMORY[0x1E0C9AA60]);
  -[UIViewController setView:](self, "setView:", v4);

}

- (void)addChildViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIKBStackViewController;
  v4 = a3;
  -[UIViewController addChildViewController:](&v7, sel_addChildViewController_, v4);
  -[UIKBStackViewController stackView](self, "stackView", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addArrangedSubview:", v6);

  objc_msgSend(v4, "didMoveToParentViewController:", self);
}

- (void)removeChildViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "willMoveToParentViewController:", 0);
  -[UIKBStackViewController stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeArrangedSubview:", v6);

  v7.receiver = self;
  v7.super_class = (Class)UIKBStackViewController;
  -[UIViewController removeChildViewController:](&v7, sel_removeChildViewController_, v4);

}

@end
