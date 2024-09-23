@implementation UIViewController(PXImageModulationManager)

- (uint64_t)px_enableImageModulation
{
  void *v2;

  v2 = (void *)objc_opt_class();
  objc_msgSend(v2, "px_swizzleOnceAsSubclassOfClass:context:usingBlock:", objc_opt_class(), px_enableImageModulation_PXImageModulationContext, &__block_literal_global_264_147941);
  return objc_msgSend(a1, "px_setImageModulationEnabled:", 1);
}

- (id)px_imageModulationManager
{
  id v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_getAssociatedObject(a1, (const void *)PXImageModulationManagerAssociationKey);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "viewIfLoaded");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "px_imageModulationManager");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      if (!v2)
      {
LABEL_5:

        return v2;
      }
    }
    else
    {
      objc_msgSend(a1, "parentViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "px_imageModulationManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v2 = v7;
      }
      else
      {
        objc_msgSend(a1, "presentingViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "px_imageModulationManager");
        v2 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (!v2)
        goto LABEL_5;
    }
    objc_setAssociatedObject(a1, (const void *)PXImageModulationManagerAssociationKey, v2, (void *)1);
    goto LABEL_5;
  }
  return v2;
}

- (uint64_t)_px_windowMatchesImageModulationManager:()PXImageModulationManager
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(a1, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "viewIfLoaded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v10 = v9 == 0;
  else
    v10 = 1;
  v12 = v10 || v6 == v9;

  return v12;
}

- (double)px_HDRFocus
{
  return 0.0;
}

- (void)px_setNeedsHDRFocusUpdate
{
  id v1;

  objc_msgSend(a1, "px_imageModulationManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsHDRFocusUpdate");

}

- (double)px_imageModulationIntensity
{
  return 0.0;
}

- (void)px_setNeedsImageModulationIntensityUpdate
{
  id v1;

  objc_msgSend(a1, "px_imageModulationManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsImageModulationIntensityUpdate");

}

- (uint64_t)_pxswizzled_imageModulation_viewWillAppear:()PXImageModulationManager
{
  objc_msgSend(a1, "_pxswizzled_imageModulation_viewWillAppear:");
  return objc_msgSend(a1, "_px_viewAppearanceDidChange");
}

- (uint64_t)_pxswizzled_imageModulation_viewWillDisappear:()PXImageModulationManager
{
  objc_msgSend(a1, "_pxswizzled_imageModulation_viewWillDisappear:");
  return objc_msgSend(a1, "_px_viewAppearanceDidChange");
}

- (uint64_t)_pxswizzled_imageModulation_viewDidDisappear:()PXImageModulationManager
{
  objc_msgSend(a1, "_pxswizzled_imageModulation_viewDidDisappear:");
  return objc_msgSend(a1, "_px_viewAppearanceDidChange");
}

- (void)_px_viewAppearanceDidChange
{
  void *v1;
  id v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(a1, "px_imageModulationManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__UIViewController_PXImageModulationManager___px_viewAppearanceDidChange__block_invoke;
  v3[3] = &unk_1E51479C8;
  v4 = v1;
  v2 = v1;
  objc_msgSend(v2, "performChanges:", v3);

}

@end
