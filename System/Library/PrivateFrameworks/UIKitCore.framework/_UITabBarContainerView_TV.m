@implementation _UITabBarContainerView_TV

- (_UITabBarContainerView_TV)initWithTabBar:(id)a3
{
  id v5;
  _UITabBarContainerView_TV *v6;
  _UITabBarContainerView_TV *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UITabBarContainerView_TV;
  v6 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tabBar, a3);
    -[UIView addSubview:](v7, "addSubview:", v5);
  }

  return v7;
}

- (id)preferredFocusEnvironments
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[_UITabBarContainerView_TV tabBar](self, "tabBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UITabBar)tabBar
{
  return self->_tabBar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBar, 0);
}

@end
