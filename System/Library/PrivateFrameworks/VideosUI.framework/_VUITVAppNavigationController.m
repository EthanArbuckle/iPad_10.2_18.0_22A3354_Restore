@implementation _VUITVAppNavigationController

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  -[_VUITVAppNavigationController viewControllers](self, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_oldControllerCountBeforeTransition = objc_msgSend(v7, "count");

  v8.receiver = self;
  v8.super_class = (Class)_VUITVAppNavigationController;
  -[_VUITVAppNavigationController setViewControllers:animated:](&v8, sel_setViewControllers_animated_, v6, v4);

}

- (void)_handleMaxStackDepth
{
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[_VUITVAppNavigationController viewControllers](self, "viewControllers");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v9, "count");
  v4 = v9;
  if (v9 && v3 >= 4 && v3 >= self->_maxNavControllerStackDepth)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v9, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, 0);

    objc_msgSend(v9, "subarrayWithRange:", 2, v3 - 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

    -[_VUITVAppNavigationController setViewControllers:](self, "setViewControllers:", v7);
    v4 = v9;
  }

}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  -[_VUITVAppNavigationController _handleMaxStackDepth](self, "_handleMaxStackDepth");
  -[_VUITVAppNavigationController viewControllers](self, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_oldControllerCountBeforeTransition = objc_msgSend(v7, "count");

  v8.receiver = self;
  v8.super_class = (Class)_VUITVAppNavigationController;
  -[_VUITVAppNavigationController pushViewController:animated:](&v8, sel_pushViewController_animated_, v6, v4);

}

- (void)_notifyObserversOfViewControllerChange:(unint64_t)a3 animated:(BOOL)a4
{
  void (**v6)(void *, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11[2];
  BOOL v12;
  id location;

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81___VUITVAppNavigationController__notifyObserversOfViewControllerChange_animated___block_invoke;
  v10[3] = &unk_1E9F9F2B8;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v12 = a4;
  v6 = (void (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(v10);
  v6[2](v6, v7, v8, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)setMaxNavControllerStackDepth:(unint64_t)a3
{
  NSObject *v4;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3 < 3)
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 134217984;
      v6 = a3;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_INFO, "_VUITVAppNavigationController:: New max navigation controller stack depth is ignored as the value %lu is less than the minimum stack depth.", (uint8_t *)&v5, 0xCu);
    }

  }
  else
  {
    self->_maxNavControllerStackDepth = a3;
  }
}

- (_VUITVAppNavigationController)initWithRootViewController:(id)a3
{
  _VUITVAppNavigationController *v3;
  _VUITVAppNavigationController *v4;
  uint64_t v5;
  NSHashTable *observers;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_VUITVAppNavigationController;
  v3 = -[_VUITVAppNavigationController initWithRootViewController:](&v9, sel_initWithRootViewController_, a3);
  v4 = v3;
  if (v3)
  {
    v8.receiver = v3;
    v8.super_class = (Class)_VUITVAppNavigationController;
    -[_VUITVAppNavigationController setDelegate:](&v8, sel_setDelegate_, v3);
    v4->_oldControllerCountBeforeTransition = 1;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v4->_observers;
    v4->_observers = (NSHashTable *)v5;

    v4->_maxNavControllerStackDepth = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v4;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  -[_VUITVAppNavigationController title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[_VUITVAppNavigationController title](self, "title");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v4)
    {
      v7.receiver = self;
      v7.super_class = (Class)_VUITVAppNavigationController;
      -[_VUITVAppNavigationController setTitle:](&v7, sel_setTitle_, v4);
    }
  }

}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_VUITVAppNavigationController;
  -[_VUITVAppNavigationController loadView](&v4, sel_loadView);
  -[_VUITVAppNavigationController navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setHidesShadow:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_VUITVAppNavigationController;
  -[_VUITVAppNavigationController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 2)
    -[_VUITVAppNavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", 1);
}

- (void)setDelegate:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "Warning: Changing TVNavigationController's UINavigationControllerDelegate is not recommended because it is itself the delegate in order to implement its UIViewController (NavigationAdditions)", v1, 2u);
}

- (void)setDelegate:(id)a3
{
  _VUITVAppNavigationController *v4;
  _VUITVAppNavigationController *v5;
  NSObject *v6;

  v4 = (_VUITVAppNavigationController *)a3;
  v5 = v4;
  if (v4 == self)
  {
    objc_storeWeak((id *)&v4->_externalDelegate, 0);
  }
  else
  {
    objc_storeWeak((id *)&self->_externalDelegate, v4);
    if (v5)
    {
      self->_externalDelegateImplementsDidShow = objc_opt_respondsToSelector() & 1;
      self->_externalDelegateImplementsAnimationController = objc_opt_respondsToSelector() & 1;
    }
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_VUITVAppNavigationController setDelegate:].cold.1(v6);

  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v7 = (void *)MEMORY[0x1E0CB37D0];
  v8 = a3;
  objc_msgSend(v7, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("VUITVAppNavigationWillDisplayViewControllerNotification"), v8);

  -[_VUITVAppNavigationController _notifyObserversOfViewControllerChange:animated:](self, "_notifyObserversOfViewControllerChange:animated:", self->_oldControllerCountBeforeTransition, v5);
  -[_VUITVAppNavigationController viewControllers](self, "viewControllers");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  self->_oldControllerCountBeforeTransition = objc_msgSend(v10, "count");

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("VUITVAppNavigationDidDisplayViewControllerNotification"), v13);

  -[_VUITVAppNavigationController _notifyObserversOfViewControllerChange:animated:](self, "_notifyObserversOfViewControllerChange:animated:", self->_oldControllerCountBeforeTransition, v5);
  -[_VUITVAppNavigationController viewControllers](self, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_oldControllerCountBeforeTransition = objc_msgSend(v10, "count");

  -[_VUITVAppNavigationController externalDelegate](self, "externalDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && self->_externalDelegateImplementsDidShow)
    objc_msgSend(v11, "navigationController:didShowViewController:animated:", v13, v8, v5);

}

- (id)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v7;

  v3 = a3;
  -[_VUITVAppNavigationController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_oldControllerCountBeforeTransition = objc_msgSend(v5, "count");

  v7.receiver = self;
  v7.super_class = (Class)_VUITVAppNavigationController;
  -[_VUITVAppNavigationController popViewControllerAnimated:](&v7, sel_popViewControllerAnimated_, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  -[_VUITVAppNavigationController viewControllers](self, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_oldControllerCountBeforeTransition = objc_msgSend(v7, "count");

  v10.receiver = self;
  v10.super_class = (Class)_VUITVAppNavigationController;
  -[_VUITVAppNavigationController popToViewController:animated:](&v10, sel_popToViewController_animated_, v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v7;

  v3 = a3;
  -[_VUITVAppNavigationController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_oldControllerCountBeforeTransition = objc_msgSend(v5, "count");

  v7.receiver = self;
  v7.super_class = (Class)_VUITVAppNavigationController;
  -[_VUITVAppNavigationController popToRootViewControllerAnimated:](&v7, sel_popToRootViewControllerAnimated_, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[_VUITVAppNavigationController externalDelegate](self, "externalDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && self->_externalDelegateImplementsAnimationController)
  {
    objc_msgSend(v13, "navigationController:animationControllerForOperation:fromViewController:toViewController:", v10, a4, v11, v12);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v16 = (void *)v15;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "selectedViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "customAnimatorForNavigationControllerOperation:toViewController:", a4, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "selectedViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "customAnimatorForNavigationControllerOperation:fromViewController:", a4, v11);
    v19 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v19;
  }
  if (!v16)
  {
    objc_msgSend(v11, "customAnimatorForNavigationControllerOperation:toViewController:", a4, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(v12, "customAnimatorForNavigationControllerOperation:fromViewController:", a4, v11);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
  }
LABEL_12:

  return v16;
}

- (UIViewController)currentViewController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_VUITVAppNavigationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_VUITVAppNavigationController viewControllers](self, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (UIViewController *)v5;
}

- (void)dismissAllModals:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[4];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[_VUITVAppNavigationController vuiPresentedViewController](self, "vuiPresentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50___VUITVAppNavigationController_dismissAllModals___block_invoke;
    v6[3] = &unk_1E9F98E68;
    v7 = v4;
    -[_VUITVAppNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v6);

  }
  else
  {
    v4[2](v4);
  }

}

- (void)vui_setViewControllers:(id)a3 animated:(BOOL)a4
{
  if (a3)
    -[_VUITVAppNavigationController setViewControllers:animated:](self, "setViewControllers:animated:", a3, a4);
}

- (id)vui_rootViewController
{
  void *v2;
  void *v3;

  -[_VUITVAppNavigationController viewControllers](self, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)vui_addControllerObserver:(id)a3
{
  if (a3)
    -[NSHashTable addObject:](self->_observers, "addObject:");
}

- (void)vui_removeControllerObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (unint64_t)maxNavControllerStackDepth
{
  return self->_maxNavControllerStackDepth;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (unint64_t)oldControllerCountBeforeTransition
{
  return self->_oldControllerCountBeforeTransition;
}

- (void)setOldControllerCountBeforeTransition:(unint64_t)a3
{
  self->_oldControllerCountBeforeTransition = a3;
}

- (UINavigationControllerDelegate)externalDelegate
{
  return (UINavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_externalDelegate);
}

- (void)setExternalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_externalDelegate, a3);
}

- (BOOL)externalDelegateImplementsDidShow
{
  return self->_externalDelegateImplementsDidShow;
}

- (void)setExternalDelegateImplementsDidShow:(BOOL)a3
{
  self->_externalDelegateImplementsDidShow = a3;
}

- (BOOL)externalDelegateImplementsAnimationController
{
  return self->_externalDelegateImplementsAnimationController;
}

- (void)setExternalDelegateImplementsAnimationController:(BOOL)a3
{
  self->_externalDelegateImplementsAnimationController = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_externalDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
