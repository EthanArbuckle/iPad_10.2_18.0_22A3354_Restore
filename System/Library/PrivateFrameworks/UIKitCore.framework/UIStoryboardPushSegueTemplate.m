@implementation UIStoryboardPushSegueTemplate

- (UIStoryboardPushSegueTemplate)initWithCoder:(id)a3
{
  id v4;
  UIStoryboardPushSegueTemplate *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIStoryboardPushSegueTemplate;
  v5 = -[UIStoryboardSegueTemplate initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_destinationContainmentContext = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIDestinationContainmentContext"));
    v5->_splitViewControllerIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UISplitViewControllerIndex"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIStoryboardPushSegueTemplate;
  v4 = a3;
  -[UIStoryboardSegueTemplate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIStoryboardPushSegueTemplate destinationContainmentContext](self, "destinationContainmentContext", v5.receiver, v5.super_class), CFSTR("UIDestinationContainmentContext"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIStoryboardPushSegueTemplate splitViewControllerIndex](self, "splitViewControllerIndex"), CFSTR("UISplitViewControllerIndex"));

}

- (id)newDefaultPerformHandlerForSegue:(id)a3
{
  void *destinationContainmentContext;
  void *splitViewControllerIndex;
  void *v7;
  _QWORD v9[5];
  id v10[4];
  id location;

  destinationContainmentContext = (void *)self->_destinationContainmentContext;
  splitViewControllerIndex = (void *)self->_splitViewControllerIndex;
  objc_initWeak(&location, a3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__UIStoryboardPushSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke;
  v9[3] = &unk_1E16E3068;
  objc_copyWeak(v10, &location);
  v10[1] = destinationContainmentContext;
  v10[2] = (id)a2;
  v9[4] = self;
  v10[3] = splitViewControllerIndex;
  v7 = _Block_copy(v9);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  return v7;
}

void __66__UIStoryboardPushSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    if (v4 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("UIStoryboardPushSegueTemplate.m"), 53, CFSTR("Unknown push segue destination (%ld) encountered."), *(_QWORD *)(a1 + 48));

LABEL_14:
      objc_msgSend(v3, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("Push segues can only be used when the source controller is managed by an instance of UINavigationController.");
      if (v23)
      {
        v25 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v3, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("Could not find a navigation controller for segue '%@'. %@"), v26, CFSTR("Push segues can only be used when the source controller is managed by an instance of UINavigationController."));
        v24 = (const __CFString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v24, 0);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v27);
    }
    objc_msgSend(WeakRetained, "sourceViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "splitViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 56);
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "sourceViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "destinationViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("UIStoryboardPushSegueTemplate.m"), 42, CFSTR("Could not find a split view controller ancestor for '%@', while performing a split view controller replace segue (identifier '%@') with destination '%@'"), v13, v14, v15);

    }
    objc_msgSend(v6, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 64);
    if (v8 >= objc_msgSend(v7, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("UIStoryboardPushSegueTemplate.m"), 45, CFSTR("Unexpected number of view controllers (%ld) for split view controller '%@'. Expected at least %ld view controllers to be present, to perform a push segue for index %ld."), objc_msgSend(v7, "count"), v6, *(_QWORD *)(a1 + 64) + 1, *(_QWORD *)(a1 + 64));

    }
    objc_msgSend(v7, "objectAtIndex:", *(_QWORD *)(a1 + 64));
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 56);
      v19 = *(_QWORD *)(a1 + 32);
      v20 = objc_opt_class();
      objc_msgSend(v3, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", v18, v19, CFSTR("UIStoryboardPushSegueTemplate.m"), 48, CFSTR("Expected a navigation controller, but got an instance of '%@' instead, while performing a split view controller push segue (identifier '%@') for index #%ld"), v20, v21, *(_QWORD *)(a1 + 64));

    }
  }
  else
  {
    objc_msgSend(WeakRetained, "sourceViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationController");
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (!v28)
    goto LABEL_14;
  objc_msgSend(v3, "destinationViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "pushViewController:animated:", v9, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));

}

- (int64_t)destinationContainmentContext
{
  return self->_destinationContainmentContext;
}

- (void)setDestinationContainmentContext:(int64_t)a3
{
  self->_destinationContainmentContext = a3;
}

- (int64_t)splitViewControllerIndex
{
  return self->_splitViewControllerIndex;
}

- (void)setSplitViewControllerIndex:(int64_t)a3
{
  self->_splitViewControllerIndex = a3;
}

@end
