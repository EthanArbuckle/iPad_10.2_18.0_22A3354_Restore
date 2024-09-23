@implementation _UISearchControllerLimitedUIShieldViewController

- (void)dealloc
{
  id dismissAction;
  objc_super v4;

  dismissAction = self->_dismissAction;
  self->_dismissAction = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UISearchControllerLimitedUIShieldViewController;
  -[UIViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  _UISearchControllerLimitedAccessView *v3;
  _UISearchControllerLimitedAccessView *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = [_UISearchControllerLimitedAccessView alloc];
  v4 = -[_UISearchControllerLimitedAccessView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[_UISearchControllerLimitedUIShieldViewController setLimitedAccessView:](self, "setLimitedAccessView:", v4);

  -[_UISearchControllerLimitedUIShieldViewController limitedAccessView](self, "limitedAccessView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__backButtonPressed_, 0x2000);

  -[_UISearchControllerLimitedUIShieldViewController limitedAccessView](self, "limitedAccessView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController setView:](self, "setView:", v7);

}

- (void)_backButtonPressed:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[_UISearchControllerLimitedUIShieldViewController dismissAction](self, "dismissAction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UISearchControllerLimitedUIShieldViewController dismissAction](self, "dismissAction");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (id)dismissAction
{
  return self->_dismissAction;
}

- (void)setDismissAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (_UISearchControllerLimitedAccessView)limitedAccessView
{
  return self->_limitedAccessView;
}

- (void)setLimitedAccessView:(id)a3
{
  objc_storeStrong((id *)&self->_limitedAccessView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitedAccessView, 0);
  objc_storeStrong(&self->_dismissAction, 0);
}

@end
