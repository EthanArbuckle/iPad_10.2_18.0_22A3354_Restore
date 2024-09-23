@implementation UIStoryboardReplaceSegueTemplate

- (UIStoryboardReplaceSegueTemplate)initWithCoder:(id)a3
{
  id v4;
  UIStoryboardReplaceSegueTemplate *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIStoryboardReplaceSegueTemplate;
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
  v5.super_class = (Class)UIStoryboardReplaceSegueTemplate;
  v4 = a3;
  -[UIStoryboardSegueTemplate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIStoryboardReplaceSegueTemplate destinationContainmentContext](self, "destinationContainmentContext", v5.receiver, v5.super_class), CFSTR("UIDestinationContainmentContext"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIStoryboardReplaceSegueTemplate splitViewControllerIndex](self, "splitViewControllerIndex"), CFSTR("UISplitViewControllerIndex"));

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
  v9[2] = __69__UIStoryboardReplaceSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke;
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

void __69__UIStoryboardReplaceSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v18 = WeakRetained;
  if (*(_QWORD *)(a1 + 48) != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("UIStoryboardReplaceSegueTemplate.m"), 41, CFSTR("Unknown push segue destination (%ld) encountered."), *(_QWORD *)(a1 + 48));

    WeakRetained = v18;
  }
  objc_msgSend(WeakRetained, "sourceViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "splitViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v18, "sourceViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "destinationViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", v12, v13, CFSTR("UIStoryboardReplaceSegueTemplate.m"), 44, CFSTR("Could not find a split view controller ancestor for '%@', while performing a split view controller replace segue (identifier '%@') with destination '%@'"), v14, v15, v16);

  }
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v7 = *(_QWORD *)(a1 + 64);
  if (v7 >= objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("UIStoryboardReplaceSegueTemplate.m"), 47, CFSTR("Unexpected number of view controllers (%ld) for split view controller '%@'. Expected at least %ld view controllers to be present, to perform a replace segue for index %ld."), objc_msgSend(v6, "count"), v4, *(_QWORD *)(a1 + 64) + 1, *(_QWORD *)(a1 + 64));

  }
  v8 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v18, "destinationViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v8, v9);

  objc_msgSend(v4, "setViewControllers:", v6);
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
