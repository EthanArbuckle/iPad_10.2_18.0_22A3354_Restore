@implementation UIStoryboardPopoverPresentationSegueTemplate

- (UIStoryboardPopoverPresentationSegueTemplate)initWithCoder:(id)a3
{
  id v4;
  UIStoryboardPopoverPresentationSegueTemplate *v5;
  void *v6;
  uint64_t v7;
  NSArray *passthroughViews;
  uint64_t v9;
  UIBarButtonItem *anchorBarButtonItem;
  uint64_t v11;
  UIView *anchorView;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIStoryboardPopoverPresentationSegueTemplate;
  v5 = -[UIStoryboardSegueTemplate initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_permittedArrowDirections = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIPermittedArrowDirections"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIPassthroughViews"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    passthroughViews = v5->_passthroughViews;
    v5->_passthroughViews = (NSArray *)v7;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAnchorBarButtonItem"));
    v9 = objc_claimAutoreleasedReturnValue();
    anchorBarButtonItem = v5->_anchorBarButtonItem;
    v5->_anchorBarButtonItem = (UIBarButtonItem *)v9;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAnchorView"));
    v11 = objc_claimAutoreleasedReturnValue();
    anchorView = v5->_anchorView;
    v5->_anchorView = (UIView *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIStoryboardPopoverPresentationSegueTemplate;
  v4 = a3;
  -[UIStoryboardSegueTemplate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_permittedArrowDirections, CFSTR("UIPermittedArrowDirections"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_passthroughViews, CFSTR("UIPassthroughViews"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchorBarButtonItem, CFSTR("UIAnchorBarButtonItem"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchorView, CFSTR("UIAnchorView"));

}

- (id)newDefaultPrepareHandlerForSegue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD aBlock[4];
  id v13;
  id v14;
  id v15[2];
  id location;

  v4 = a3;
  -[UIStoryboardPopoverPresentationSegueTemplate anchorView](self, "anchorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStoryboardPopoverPresentationSegueTemplate anchorBarButtonItem](self, "anchorBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIStoryboardPopoverPresentationSegueTemplate permittedArrowDirections](self, "permittedArrowDirections");
  objc_initWeak(&location, v4);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__UIStoryboardPopoverPresentationSegueTemplate_newDefaultPrepareHandlerForSegue___block_invoke;
  aBlock[3] = &unk_1E16E2FF0;
  objc_copyWeak(v15, &location);
  v13 = v5;
  v14 = v6;
  v15[1] = v7;
  v8 = v6;
  v9 = v5;
  v10 = _Block_copy(aBlock);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  return v10;
}

void __81__UIStoryboardPopoverPresentationSegueTemplate_newDefaultPrepareHandlerForSegue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "destinationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setModalPresentationStyle:", 7);

  objc_msgSend(WeakRetained, "destinationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popoverPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setSourceView:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setSourceItem:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setPermittedArrowDirections:", *(_QWORD *)(a1 + 56));

}

- (id)newDefaultPerformHandlerForSegue:(id)a3
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];
  id v12[2];
  BOOL v13;
  id location;

  v5 = a3;
  -[UIStoryboardPopoverPresentationSegueTemplate anchorBarButtonItem](self, "anchorBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = 1;
  }
  else
  {
    -[UIStoryboardPopoverPresentationSegueTemplate anchorView](self, "anchorView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 != 0;

  }
  objc_initWeak(&location, v5);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__UIStoryboardPopoverPresentationSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke;
  aBlock[3] = &unk_1E16E3018;
  objc_copyWeak(v12, &location);
  v13 = v7;
  v12[1] = (id)a2;
  aBlock[4] = self;
  v9 = _Block_copy(aBlock);
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  return v9;
}

void __81__UIStoryboardPopoverPresentationSegueTemplate_newDefaultPerformHandlerForSegue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "sourceViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "destinationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setSegueResponsibleForModalPresentation:", WeakRetained);
  objc_msgSend(v3, "_setSourceViewControllerIfPresentedViaPopoverSegue:", v2);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v2, "presentViewController:animated:completion:", v3, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("UIStoryboardPopoverPresentationSegueTemplate.m"), 70, CFSTR("A popover segue must have either an anchorBarButtonItem or an anchorView."));

  }
}

- (unint64_t)permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (void)setPermittedArrowDirections:(unint64_t)a3
{
  self->_permittedArrowDirections = a3;
}

- (NSArray)passthroughViews
{
  return self->_passthroughViews;
}

- (void)setPassthroughViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIView)anchorView
{
  return self->_anchorView;
}

- (void)setAnchorView:(id)a3
{
  objc_storeStrong((id *)&self->_anchorView, a3);
}

- (UIBarButtonItem)anchorBarButtonItem
{
  return self->_anchorBarButtonItem;
}

- (void)setAnchorBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_anchorBarButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorBarButtonItem, 0);
  objc_storeStrong((id *)&self->_anchorView, 0);
  objc_storeStrong((id *)&self->_passthroughViews, 0);
}

@end
