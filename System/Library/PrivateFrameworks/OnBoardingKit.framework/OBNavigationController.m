@implementation OBNavigationController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBNavigationController;
  -[OBNavigationController viewDidLoad](&v4, sel_viewDidLoad);
  -[OBNavigationController navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setHidesShadow:", 1);

}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ob_applyAutomaticScrollToEdgeBehavior");

  v8.receiver = self;
  v8.super_class = (Class)OBNavigationController;
  -[OBNavigationController pushViewController:animated:](&v8, sel_pushViewController_animated_, v6, v4);

}

- (void)setViewControllers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "navigationItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ob_applyAutomaticScrollToEdgeBehavior");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  v10.receiver = self;
  v10.super_class = (Class)OBNavigationController;
  -[OBNavigationController setViewControllers:](&v10, sel_setViewControllers_, v4);

}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t result;
  void *v4;
  void *v5;
  unint64_t v6;
  objc_super v7;

  result = self->_supportedInterfaceOrientations;
  if (!result)
  {
    -[OBNavigationController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[OBNavigationController presentingViewController](self, "presentingViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "supportedInterfaceOrientations");

      return v6;
    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)OBNavigationController;
      return -[OBNavigationController supportedInterfaceOrientations](&v7, sel_supportedInterfaceOrientations);
    }
  }
  return result;
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_supportedInterfaceOrientations = a3;
}

@end
