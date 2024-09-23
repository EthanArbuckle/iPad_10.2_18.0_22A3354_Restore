@implementation SBHAdjustableRootIconListLayoutProvider

- (id)layoutForIconLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBHIconGridSizeClassSet *v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v42;
  objc_super v43;
  _QWORD v44[4];
  id v45;
  id v46;
  objc_super v47;

  v4 = a3;
  if (layoutForIconLocation__onceToken != -1)
    dispatch_once(&layoutForIconLocation__onceToken, &__block_literal_global_55);
  if (SBIconLocationGroupContainsLocation((void *)layoutForIconLocation__sAdjustableLocationGroup, v4))
  {
    v47.receiver = self;
    v47.super_class = (Class)SBHAdjustableRootIconListLayoutProvider;
    -[SBHDefaultIconListLayoutProvider layoutForIconLocation:](&v47, sel_layoutForIconLocation_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rootFolderSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_isKindOfClass();

    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationRoot")) & 1) != 0
      || objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationRootWithWidgets")))
    {
      objc_msgSend(v7, "portraitLayoutInsets");
      objc_msgSend(v9, "portraitLayoutInsets");
      UIEdgeInsetsAdd();
      objc_msgSend(v7, "setPortraitLayoutInsets:");
      objc_msgSend(v7, "landscapeLayoutInsets");
      objc_msgSend(v9, "landscapeLayoutInsets");
      UIEdgeInsetsAdd();
      objc_msgSend(v7, "setLandscapeLayoutInsets:");
      objc_msgSend(v7, "portraitAdditionalWidgetLayoutInsets");
      objc_msgSend(v9, "portraitAdditionalWidgetLayoutInsets");
      UIEdgeInsetsAdd();
      objc_msgSend(v7, "setPortraitAdditionalWidgetLayoutInsets:");
      objc_msgSend(v7, "landscapeAdditionalWidgetLayoutInsets");
      objc_msgSend(v9, "landscapeAdditionalWidgetLayoutInsets");
      UIEdgeInsetsAdd();
      objc_msgSend(v7, "setLandscapeAdditionalWidgetLayoutInsets:");
      objc_msgSend(v7, "setLayoutInsetsEnforcementAxis:", objc_msgSend(v9, "layoutInsetsEnforcementAxis") | objc_msgSend(v7, "layoutInsetsEnforcementAxis"));
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationDock")))
    {
      objc_msgSend(v7, "portraitLayoutInsets");
      objc_msgSend(v9, "portraitLayoutInsets");
      UIEdgeInsetsAdd();
      objc_msgSend(v9, "dockAdditionalIconInsets");
      UIEdgeInsetsAdd();
      objc_msgSend(v7, "setPortraitLayoutInsets:");
    }
    v11 = -[SBHIconGridSizeClassSet initWithGridSizeClassGroup:]([SBHIconGridSizeClassSet alloc], "initWithGridSizeClassGroup:", CFSTR("SBHIconGridSizeClassGroupAll"));
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __65__SBHAdjustableRootIconListLayoutProvider_layoutForIconLocation___block_invoke_2;
    v44[3] = &unk_1E8D8B540;
    v12 = v7;
    v45 = v12;
    v13 = v9;
    v46 = v13;
    -[SBHIconGridSizeClassSet enumerateGridSizeClassesUsingBlock:](v11, "enumerateGridSizeClassesUsingBlock:", v44);

    objc_msgSend(v12, "rootFolderVisualConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dockPlatterInsets");
    objc_msgSend(v14, "dockBackgroundViewInsets");
    UIEdgeInsetsAdd();
    v42 = v15;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    objc_msgSend(v14, "dockListViewInsets");
    UIEdgeInsetsAdd();
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    objc_msgSend(v14, "dockViewHeight");
    v31 = v30;
    objc_msgSend(v13, "dockViewHeight");
    objc_msgSend(v14, "setDockViewHeight:", v31 + v32);
    objc_msgSend(v14, "dockBackgroundViewCornerRadius");
    v34 = v33;
    objc_msgSend(v13, "dockCornerRadius");
    objc_msgSend(v14, "setDockBackgroundViewCornerRadius:", v34 + v35);
    objc_msgSend(v14, "setDockListViewInsets:", v23, v25, v27, v29);
    objc_msgSend(v14, "setDockBackgroundViewInsets:", v42, v17, v19, v21);
    objc_msgSend(v14, "pageControlVerticalOffset");
    v37 = v36;
    objc_msgSend(v13, "pageControlVerticalOffset");
    objc_msgSend(v14, "setPageControlVerticalOffset:", v37 + v38);
    objc_opt_self();
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void *)objc_msgSend(objc_alloc((Class)v39), "initWithLayoutConfiguration:", v12);
  }
  else
  {
    v43.receiver = self;
    v43.super_class = (Class)SBHAdjustableRootIconListLayoutProvider;
    -[SBHDefaultIconListLayoutProvider layoutForIconLocation:](&v43, sel_layoutForIconLocation_, v4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v40;
}

void __65__SBHAdjustableRootIconListLayoutProvider_layoutForIconLocation___block_invoke()
{
  void *v0;

  v0 = (void *)layoutForIconLocation__sAdjustableLocationGroup;
  layoutForIconLocation__sAdjustableLocationGroup = (uint64_t)CFSTR("AdjustableLocationGroup");

  SBIconLocationGroupAddLocation(CFSTR("AdjustableLocationGroup"), CFSTR("SBIconLocationRoot"));
  SBIconLocationGroupAddLocation(CFSTR("AdjustableLocationGroup"), CFSTR("SBIconLocationRootWithWidgets"));
  SBIconLocationGroupAddLocation(CFSTR("AdjustableLocationGroup"), CFSTR("SBIconLocationDock"));
}

void __65__SBHAdjustableRootIconListLayoutProvider_layoutForIconLocation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v3 = *(void **)(a1 + 32);
  v14 = a2;
  objc_msgSend(v3, "iconImageInfoForGridSizeClass:", v14);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 40), "iconImageSizeForGridSizeClass:", v14);
  objc_msgSend(*(id *)(a1 + 32), "setIconImageInfo:forGridSizeClass:", v14, v5 + v13, v7 + v12, v9, v11);

}

@end
