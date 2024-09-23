@implementation UIStoryboardUnwindSegueTemplate

- (UIStoryboardUnwindSegueTemplate)initWithCoder:(id)a3
{
  id v4;
  UIStoryboardUnwindSegueTemplate *v5;
  void *v6;
  uint64_t v7;
  NSString *action;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIStoryboardUnwindSegueTemplate;
  v5 = -[UIStoryboardSegueTemplate initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAction"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    action = v5->_action;
    v5->_action = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIStoryboardUnwindSegueTemplate;
  v4 = a3;
  -[UIStoryboardSegueTemplate encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[UIStoryboardUnwindSegueTemplate action](self, "action", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UIAction"));

}

- (id)newDefaultPerformHandlerForSegue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD aBlock[4];
  id v11;
  id v12;
  id location;

  v3 = a3;
  objc_msgSend(v3, "sourceViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destinationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {
    v8 = &__block_literal_global_94_1;
  }
  else
  {
    v6 = -[_UIStoryboardUnwindChain initFromSourceViewController:toDestinationViewController:]([_UIStoryboardUnwindChain alloc], "initFromSourceViewController:toDestinationViewController:", v4, v5);
    objc_initWeak(&location, v3);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__UIStoryboardUnwindSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke_2;
    aBlock[3] = &unk_1E16B1500;
    objc_copyWeak(&v12, &location);
    v11 = v6;
    v7 = v6;
    v8 = _Block_copy(aBlock);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __68__UIStoryboardUnwindSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "modalAncestorContainingSourceViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__UIStoryboardUnwindSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke_3;
  v7[3] = &unk_1E16E3138;
  v8 = v3;
  v9 = WeakRetained;
  v5 = WeakRetained;
  v6 = v3;
  objc_msgSend(v4, "enumerateViewControllersFromModalAncestorUpToButNotIncludingDestination:", v7);

}

void __68__UIStoryboardUnwindSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(v8, "childModalViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v5)
  {
    v7 = v8;
    if (v6 && *(id *)(a1 + 32) != v8)
    {
      objc_msgSend(v8, "dismissViewControllerAnimated:completion:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
      v7 = v8;
    }
    objc_msgSend(v7, "unwindForSegue:towardsViewController:", *(_QWORD *)(a1 + 40), v5);
  }

}

- (id)_legacyUnwindExecutorForTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v4 = a3;
  -[UIStoryboardSegueTemplate viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFirstPopoverSeguePresentedControllerInUnwindingResponderChain(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "childModalViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    objc_msgSend(v6, "_sourceViewControllerIfPresentedViaPopoverSegue");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 != v4)
    {
      objc_msgSend(v4, "parentViewController");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  v8 = v4;
LABEL_6:
  v10 = v8;

  return v10;
}

- (id)instantiateOrFindDestinationViewControllerWithSender:(id)a3
{
  id v4;
  UIStoryboardUnwindSegueSource *v5;
  void *v6;
  NSString *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = [UIStoryboardUnwindSegueSource alloc];
  -[UIStoryboardSegueTemplate viewController](self, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStoryboardUnwindSegueTemplate action](self, "action");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIStoryboardUnwindSegueSource _initWithSourceViewController:action:sender:](v5, "_initWithSourceViewController:action:sender:", v6, NSSelectorFromString(v7), v4);

  objc_msgSend(v8, "_findDestination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)segueWithDestinationViewController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  int v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  objc_super v20;

  v5 = a3;
  -[UIStoryboardUnwindSegueTemplate action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboardUnwindSegueTemplate.m"), 435, CFSTR("Cannot perform an unwind without an unwind action"));

  }
  -[UIStoryboardUnwindSegueTemplate _legacyUnwindExecutorForTarget:](self, "_legacyUnwindExecutorForTarget:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 && (dyld_program_sdk_at_least() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboardUnwindSegueTemplate.m"), 442, CFSTR("Could not find a view controller to execute unwinding for %@"), v5);
    goto LABEL_14;
  }
  v8 = qword_1ECD80850;
  v9 = v7;
  if (v8 != -1)
    dispatch_once(&qword_1ECD80850, &__block_literal_global_122_0);
  v10 = (void *)objc_opt_class();

  v11 = objc_msgSend(v10, "isSubclassOfClass:", qword_1ECD80848);
  v12 = &qword_1ECD80840;
  if (v11)
    v12 = &qword_1ECD80848;
  if (!objc_msgSend(v10, "doesOverrideViewControllerMethod:inBaseClass:", _MergedGlobals_1228, *v12))
  {
    v20.receiver = self;
    v20.super_class = (Class)UIStoryboardUnwindSegueTemplate;
    -[UIStoryboardSegueTemplate segueWithDestinationViewController:](&v20, sel_segueWithDestinationViewController_, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStoryboardSegueTemplate viewController](self, "viewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboardUnwindSegueTemplate.m"), 453, CFSTR("Failed to create a segue for unwinding from %@ to %@"), v17, v5);

LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  -[UIStoryboardSegueTemplate viewController](self, "viewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStoryboardSegueTemplate identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "segueForUnwindingToViewController:fromViewController:identifier:", v5, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v15;
}

- (id)_perform:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIStoryboardUnwindSegueTemplate instantiateOrFindDestinationViewControllerWithSender:](self, "instantiateOrFindDestinationViewControllerWithSender:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UIStoryboardUnwindSegueTemplate _performWithDestinationViewController:sender:](self, "_performWithDestinationViewController:sender:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_performWithDestinationViewController:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  const char *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;

  v6 = a3;
  v7 = a4;
  -[UIStoryboardUnwindSegueTemplate action](self, "action");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = NSSelectorFromString(v8);

  -[UIStoryboardUnwindSegueTemplate segueWithDestinationViewController:](self, "segueWithDestinationViewController:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[UIStoryboardSegueTemplate viewController](self, "viewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "prepareForSegue:sender:", v10, v7);

    if (dyld_program_sdk_at_least())
      objc_msgSend(v6, v9, v10);
    else
      objc_msgSend(v6, sel_performSelector_withObject_, v9, v10);
    v12 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", -[UIStoryboardSegueTemplate animates](self, "animates"));
    objc_msgSend(v10, "perform");
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v12);
  }

  return v10;
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
}

@end
