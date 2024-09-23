@implementation UIViewController(PXExtendedTraitCollection)

- (void)px_enableExtendedTraitCollection
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "_px_prepareClassForExtendedTraitCollection");
  objc_msgSend(a1, "px_extendedTraitCollection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 1);

}

- (PXExtendedTraitCollection)px_extendedTraitCollection
{
  PXExtendedTraitCollection *v2;

  objc_getAssociatedObject(a1, (const void *)PXExtendedTraitCollectionAssociationKey);
  v2 = (PXExtendedTraitCollection *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = -[PXExtendedTraitCollection initWithViewController:]([PXExtendedTraitCollection alloc], "initWithViewController:", a1);
    objc_setAssociatedObject(a1, (const void *)PXExtendedTraitCollectionAssociationKey, v2, (void *)1);
  }
  return v2;
}

+ (void)_px_prepareClassForExtendedTraitCollection
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v2 = objc_opt_class();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __89__UIViewController_PXExtendedTraitCollection___px_prepareClassForExtendedTraitCollection__block_invoke_3;
  v3[3] = &unk_1E512D190;
  v4 = &__block_literal_global_142655;
  objc_msgSend(a1, "px_swizzleOnceAsSubclassOfClass:context:usingBlock:", v2, PXExtendedTraitCollectionContext, v3);

}

- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewWillAppear:()PXExtendedTraitCollection
{
  void *v5;

  objc_msgSend(a1, "px_extendedTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerViewWillAppear");

  return objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_viewWillAppear:", a3);
}

- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewIsAppearing:()PXExtendedTraitCollection
{
  void *v5;

  objc_msgSend(a1, "px_extendedTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerViewIsAppearing");

  return objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_viewIsAppearing:", a3);
}

- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewDidAppear:()PXExtendedTraitCollection
{
  void *v5;

  objc_msgSend(a1, "px_extendedTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerViewDidAppear");

  return objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_viewDidAppear:", a3);
}

- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewWillLayoutSubviews
{
  void *v2;

  objc_msgSend(a1, "px_extendedTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerViewWillLayoutSubviews");

  return objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_viewWillLayoutSubviews");
}

- (void)_pxswizzled_viewControllerTraitCollection_viewSafeAreaInsetsDidChange
{
  id v2;

  objc_msgSend(a1, "px_extendedTraitCollection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerViewSafeAreaInsetsDidChange");
  objc_msgSend(v2, "peripheryInsetsNeedsUpdate");
  objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_viewSafeAreaInsetsDidChange");

}

- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewLayoutMarginsDidChange
{
  void *v2;

  objc_msgSend(a1, "px_extendedTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerViewLayoutMarginsDidChange");

  return objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_viewLayoutMarginsDidChange");
}

- (void)_pxswizzled_viewControllerTraitCollection_didMoveToParentViewController:()PXExtendedTraitCollection
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "px_extendedTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerDidMoveToParentViewController:", v5);

  objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_didMoveToParentViewController:", v5);
}

- (uint64_t)_pxswizzled_viewControllerTraitCollection_viewDidLoad
{
  void *v2;

  objc_msgSend(a1, "px_extendedTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerViewDidLoad");

  return objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_viewDidLoad");
}

- (void)_pxswizzled_viewControllerTraitCollection_viewWillTransitionToSize:()PXExtendedTraitCollection withTransitionCoordinator:
{
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v8 = a5;
  objc_msgSend(a1, "px_extendedTraitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewControllerViewWillTransitionToSize:", a2, a3);
  objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_viewWillTransitionToSize:withTransitionCoordinator:", v8, a2, a3);
  objc_initWeak(&location, v9);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __140__UIViewController_PXExtendedTraitCollection___pxswizzled_viewControllerTraitCollection_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E512D1B8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v8, "animateAlongsideTransition:completion:", 0, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_pxswizzled_viewControllerTraitCollection_traitCollectionDidChange:()PXExtendedTraitCollection
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "px_extendedTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerTraitCollectionDidChange");

  objc_msgSend(a1, "_pxswizzled_viewControllerTraitCollection_traitCollectionDidChange:", v5);
}

+ (void)px_preloadExtendedTraitCollection
{
  void *v2;
  _QWORD v3[5];

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__UIViewController_PXExtendedTraitCollection__px_preloadExtendedTraitCollection__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  objc_msgSend(v2, "scheduleMainQueueTask:", v3);

}

@end
