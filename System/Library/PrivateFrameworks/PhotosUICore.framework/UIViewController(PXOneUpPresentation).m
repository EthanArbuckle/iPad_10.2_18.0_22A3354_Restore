@implementation UIViewController(PXOneUpPresentation)

- (PXOneUpPresentation)px_oneUpPresentation
{
  PXOneUpPresentation *v2;

  objc_getAssociatedObject(a1, (const void *)PXOneUpPresentationAssocationKey);
  v2 = (PXOneUpPresentation *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = -[PXOneUpPresentation initWithPresentingViewController:]([PXOneUpPresentation alloc], "initWithPresentingViewController:", a1);
    objc_setAssociatedObject(a1, (const void *)PXOneUpPresentationAssocationKey, v2, (void *)1);
  }
  return v2;
}

- (uint64_t)_pxswizzled_oneUpPresentation_viewWillAppear:()PXOneUpPresentation
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "px_oneUpPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerViewWillAppear:", a3);

  objc_msgSend(a1, "px_oneUpPresentationProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewControllerViewWillAppear:", a3);

  return objc_msgSend(a1, "_pxswizzled_oneUpPresentation_viewWillAppear:", a3);
}

- (uint64_t)_pxswizzled_oneUpPresentation_viewIsAppearing:()PXOneUpPresentation
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "px_oneUpPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerViewIsAppearing:", a3);

  objc_msgSend(a1, "px_oneUpPresentationProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewControllerViewIsAppearing:", a3);

  return objc_msgSend(a1, "_pxswizzled_oneUpPresentation_viewIsAppearing:", a3);
}

- (uint64_t)_pxswizzled_oneUpPresentation_viewDidAppear:()PXOneUpPresentation
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "_pxswizzled_oneUpPresentation_viewDidAppear:");
  objc_msgSend(a1, "px_oneUpPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerViewDidAppear:", a3);

  objc_msgSend(a1, "px_oneUpPresentationProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewControllerViewDidAppear:", a3);

  return objc_msgSend(a1, "px_setOneUpPresentationProxy:", 0);
}

- (id)px_oneUpPresentationProxy
{
  return objc_getAssociatedObject(a1, sel_px_oneUpPresentationProxy);
}

- (void)px_setOneUpPresentationProxy:()PXOneUpPresentation
{
  id value;

  value = a3;
  objc_msgSend((id)objc_opt_class(), "_px_prepareClassForOneUpPresentation");
  objc_setAssociatedObject(a1, sel_px_oneUpPresentationProxy, value, (void *)1);

}

- (void)px_enableOneUpPresentation
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "_px_prepareClassForOneUpPresentation");
  objc_msgSend(a1, "px_oneUpPresentation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 1);
  objc_msgSend(v2, "_updateImplementationDelegate");

}

+ (uint64_t)_px_prepareClassForOneUpPresentation
{
  return objc_msgSend(a1, "px_swizzleOnceAsSubclassOfClass:context:usingBlock:", objc_opt_class(), PXOneUpPresentationContext, &__block_literal_global_205762);
}

- (void)px_enableOneUpPresentationFromViewController:()PXOneUpPresentation
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_getAssociatedObject(a1, (const void *)PXOneUpPresentationAssocationKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXOneUpPresentation.m"), 900, CFSTR("-px_enableOneUpPresentationFromViewController: called after one up presentation was already enabled for %@. This is not supported, see <rdar://problem/42023978> for details."), a1);

  }
  objc_msgSend(v13, "px_oneUpPresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnabled");

  if ((v7 & 1) == 0)
    objc_msgSend(v13, "px_enableOneUpPresentation");
  objc_msgSend(v13, "px_oneUpPresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "originalPresentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "originalPresentingViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXOneUpPresentation.m"), 905, CFSTR("-px_enableOneUpPresentationFromViewController: called with parameter %@ whose one up presentation was originally enabled for a different presenting view controller that is still alive (%@). This is not supported, see <rdar://problem/42023978> for details."), v13, v12);

  }
  objc_msgSend(v8, "setOriginalPresentingViewController:", a1);
  objc_setAssociatedObject(a1, (const void *)PXOneUpPresentationAssocationKey, v8, (void *)1);

}

- (uint64_t)px_oneUpPresentationStyle
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_px_oneUpPresentationStyle);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (void)px_setOneUpPresentationStyle:()PXOneUpPresentation
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_px_oneUpPresentationStyle, v2, (void *)1);

}

- (void)_pxswizzled_oneUpPresentation_viewWillDisappear:()PXOneUpPresentation
{
  void *v5;
  id v6;

  objc_msgSend(a1, "_pxswizzled_oneUpPresentation_viewWillDisappear:");
  objc_msgSend(a1, "px_oneUpPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerViewWillDisappear:", a3);

  objc_msgSend(a1, "px_oneUpPresentationProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewControllerViewWillDisappear:", a3);

}

- (void)_pxswizzled_oneUpPresentation_viewDidDisappear:()PXOneUpPresentation
{
  void *v5;
  id v6;

  objc_msgSend(a1, "_pxswizzled_oneUpPresentation_viewDidDisappear:");
  objc_msgSend(a1, "px_oneUpPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewControllerViewDidDisappear:", a3);

  objc_msgSend(a1, "px_oneUpPresentationProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingViewControllerViewDidDisappear:", a3);

}

@end
