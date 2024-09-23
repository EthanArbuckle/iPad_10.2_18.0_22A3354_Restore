@implementation UIFontPickerViewController

- (UIFontPickerViewController)initWithCoder:(id)a3
{
  void *v4;
  UIFontPickerViewController *v5;

  objc_msgSend(a3, "decodeObjectForKey:", CFSTR("UIFontPickerViewControllerConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIFontPickerViewController initWithConfiguration:](self, "initWithConfiguration:", v4);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIFontPickerViewController;
  v4 = a3;
  -[UIViewController encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[UIFontPickerViewController configuration](self, "configuration", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UIFontPickerViewControllerConfiguration"));

}

- (UIFontPickerViewController)initWithConfiguration:(UIFontPickerViewControllerConfiguration *)configuration
{
  UIFontPickerViewControllerConfiguration *v4;
  UIFontPickerViewController *v5;
  uint64_t v6;
  UIFontPickerViewControllerConfiguration *v7;
  objc_super v9;

  v4 = configuration;
  v9.receiver = self;
  v9.super_class = (Class)UIFontPickerViewController;
  v5 = -[UIViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = -[UIFontPickerViewControllerConfiguration copy](v4, "copy");
    v7 = v5->_configuration;
    v5->_configuration = (UIFontPickerViewControllerConfiguration *)v6;

    -[UIFontPickerViewController _commonFontPickerViewControllerInit](v5, "_commonFontPickerViewControllerInit");
  }

  return v5;
}

- (id)_initWithConfiguration:(id)a3
{
  id v4;
  UIFontPickerViewController *v5;
  uint64_t v6;
  UIFontPickerViewControllerConfiguration *configuration;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIFontPickerViewController;
  v5 = -[UIViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (UIFontPickerViewControllerConfiguration *)v6;

    -[UIFontPickerViewController _commonFontPickerViewControllerInit](v5, "_commonFontPickerViewControllerInit");
  }

  return v5;
}

- (void)_commonFontPickerViewControllerInit
{
  _UIFontPickerSceneHostingImpl *v3;
  _UIFontPickerViewHostingImpl *hostingImpl;

  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", 480.0, 640.0);
  -[UIViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 2);
  v3 = objc_alloc_init(_UIFontPickerSceneHostingImpl);
  hostingImpl = self->_hostingImpl;
  self->_hostingImpl = (_UIFontPickerViewHostingImpl *)v3;

  -[_UIFontPickerViewHostingImpl setDelegateFontPickerViewController:](self->_hostingImpl, "setDelegateFontPickerViewController:", self);
  -[_UIFontPickerViewHostingImpl setupRemoteHosting](self->_hostingImpl, "setupRemoteHosting");
}

- (UIFontPickerViewController)init
{
  void *v3;
  UIFontPickerViewController *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[UIFontPickerViewController initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (void)setSelectedFontDescriptor:(UIFontDescriptor *)selectedFontDescriptor
{
  UIFontDescriptor *v4;
  UIFontDescriptor *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = selectedFontDescriptor;
  -[UIFontPickerViewController selectedFontDescriptor](self, "selectedFontDescriptor");
  v5 = (UIFontDescriptor *)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[UIFontPickerViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("selectedFontDescriptor"));
    if (v4)
    {
      v7[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIFontPickerViewController _setSelectedFontDescriptors:](self, "_setSelectedFontDescriptors:", v6);

    }
    else
    {
      -[UIFontPickerViewController _setSelectedFontDescriptors:](self, "_setSelectedFontDescriptors:", 0);
    }
    -[UIFontPickerViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("selectedFontDescriptor"));
  }

}

- (UIFontDescriptor)selectedFontDescriptor
{
  void *selectedFontDescriptors;

  selectedFontDescriptors = self->__selectedFontDescriptors;
  if (selectedFontDescriptors)
  {
    selectedFontDescriptors = (void *)objc_msgSend(selectedFontDescriptors, "count");
    if (selectedFontDescriptors)
    {
      -[NSArray firstObject](self->__selectedFontDescriptors, "firstObject");
      selectedFontDescriptors = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return (UIFontDescriptor *)selectedFontDescriptors;
}

- (void)_setSelectedFontDescriptors:(id)a3
{
  _UIFontPickerViewHostingImpl *hostingImpl;
  void *v6;
  NSArray *v7;

  v7 = (NSArray *)a3;
  if (self->__selectedFontDescriptors != v7)
  {
    -[UIFontPickerViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_selectedFontDescriptors"));
    hostingImpl = self->_hostingImpl;
    -[UIFontPickerViewController selectedFontDescriptor](self, "selectedFontDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFontPickerViewHostingImpl setRemoteSelectedFontDescriptors:scrollToVisible:](hostingImpl, "setRemoteSelectedFontDescriptors:scrollToVisible:", v7, v6 == 0);

    objc_storeStrong((id *)&self->__selectedFontDescriptors, a3);
    -[UIFontPickerViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_selectedFontDescriptors"));
  }

}

- (BOOL)_isContainedInRemoteSheet
{
  void *v3;
  void *v4;
  char v5;

  -[UIViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[UIViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EDF66B78);

  return v5;
}

- (BOOL)_parentIsInPopoverPresentation
{
  void *v3;
  void *v4;
  char v5;

  -[UIViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[UIViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isInPopoverPresentation");

  return v5;
}

- (BOOL)_shouldShowNavigationBarForCurrentParentVC
{
  _BOOL4 v3;

  v3 = -[UIFontPickerViewController _isContainedInRemoteSheet](self, "_isContainedInRemoteSheet");
  if (v3)
    LOBYTE(v3) = !-[UIFontPickerViewController _parentIsInPopoverPresentation](self, "_parentIsInPopoverPresentation");
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  _UIFontPickerViewHostingImpl *hostingImpl;
  uint64_t v5;
  _UIFontPickerViewHostingImpl *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIFontPickerViewController;
  -[UIViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  hostingImpl = self->_hostingImpl;
  if (self->_presentingViewController)
    v5 = 0;
  else
    v5 = -[UIFontPickerViewController _shouldShowNavigationBarForCurrentParentVC](self, "_shouldShowNavigationBarForCurrentParentVC") ^ 1;
  -[_UIFontPickerViewHostingImpl setHideNavigationBar:](hostingImpl, "setHideNavigationBar:", v5);
  v6 = self->_hostingImpl;
  -[UIViewController sheetPresentationController](self, "sheetPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFontPickerViewHostingImpl setShowsGrabber:](v6, "setShowsGrabber:", objc_msgSend(v7, "prefersGrabberVisible"));

}

- (void)_viewControllerPresentationDidInitiate
{
  objc_super v2;

  self->_presentingViewController = 1;
  v2.receiver = self;
  v2.super_class = (Class)UIFontPickerViewController;
  -[UIViewController _viewControllerPresentationDidInitiate](&v2, sel__viewControllerPresentationDidInitiate);
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  objc_super v4;

  self->_presentingViewController = 0;
  v4.receiver = self;
  v4.super_class = (Class)UIFontPickerViewController;
  -[UIViewController dismissViewControllerWithTransition:completion:](&v4, sel_dismissViewControllerWithTransition_completion_, *(_QWORD *)&a3, a4);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_pickerDidSelectFont:(id)a3
{
  _UIFontPickerFontInfo *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id WeakRetained;
  id v13;
  void *v14;
  void *v15;

  v13 = a3;
  v4 = -[_UIFontPickerFontInfo initWithFontDescriptor:]([_UIFontPickerFontInfo alloc], "initWithFontDescriptor:", v13);
  _UIFontPickerPersistToRecentsForSuite(v4, 0);
  -[UIFontPickerViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if (self->_presentingViewController && (v6 & 1) == 0)
    -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[UIFontPickerViewController setSelectedFontDescriptor:](self, "setSelectedFontDescriptor:", v13);
  -[UIFontPickerViewController selectedFontDescriptor](self, "selectedFontDescriptor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postscriptName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *(_QWORD *)off_1E167DBE0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v8;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  AnalyticsSendEventLazy();

  if ((v6 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "fontPickerViewControllerDidPickFont:", self);

  }
}

- (void)_pickerDidCancel
{
  UIFontPickerViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  _BOOL4 presentingViewController;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  presentingViewController = self->_presentingViewController;
  if (self->_presentingViewController && (v5 & 1) == 0)
  {
    -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    presentingViewController = self->_presentingViewController;
  }
  if (!(presentingViewController | v5 & 1)
    && -[UIFontPickerViewController _shouldShowNavigationBarForCurrentParentVC](self, "_shouldShowNavigationBarForCurrentParentVC"))
  {
    -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  if ((v5 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "fontPickerViewControllerDidCancel:", self);

  }
}

- (NSString)debugDescription
{
  return (NSString *)-[UIFontPickerViewController debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", &stru_1E16EDF20);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UIFontPickerViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFontPickerViewControllerConfiguration succinctDescription](self->_configuration, "succinctDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("configuration"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIFontPickerViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIFontPickerViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  UIFontPickerViewController *v13;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__UIFontPickerViewController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E16B1B50;
  v7 = v6;
  v12 = v7;
  v13 = self;
  v8 = (id)objc_msgSend(v7, "modifyBody:", v11);
  v9 = v7;

  return v9;
}

void __68__UIFontPickerViewController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__UIFontPickerViewController_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __68__UIFontPickerViewController_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;
  id v8;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 976), CFSTR("configuration"));
  objc_msgSend(*(id *)(a1 + 40), "selectedFontDescriptor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v8, "postscriptName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v4, CFSTR("selectedFont"));

  }
  v5 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 992));
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", WeakRetained, CFSTR("delegate"));

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (BOOL)_presentingViewController
{
  return self->_presentingViewController;
}

- (NSArray)_selectedFontDescriptors
{
  return self->__selectedFontDescriptors;
}

- (UIFontPickerViewControllerConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__selectedFontDescriptors, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostingImpl, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
