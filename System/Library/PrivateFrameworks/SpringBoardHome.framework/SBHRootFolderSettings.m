@implementation SBHRootFolderSettings

- (NSString)description
{
  return (NSString *)-[SBHRootFolderSettings descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHRootFolderSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBHRootFolderSettings setAdjustableLayoutEnabled:](self, "setAdjustableLayoutEnabled:", 0);
  -[SBHRootFolderSettings setPortraitTopLayoutInset:](self, "setPortraitTopLayoutInset:", 0.0);
  -[SBHRootFolderSettings setPortraitBottomLayoutInset:](self, "setPortraitBottomLayoutInset:", 0.0);
  -[SBHRootFolderSettings setPortraitSideLayoutInset:](self, "setPortraitSideLayoutInset:", 0.0);
  -[SBHRootFolderSettings setPortraitWidgetOvershoot:](self, "setPortraitWidgetOvershoot:", 0.0);
  -[SBHRootFolderSettings setLandscapeTopLayoutInset:](self, "setLandscapeTopLayoutInset:", 0.0);
  -[SBHRootFolderSettings setLandscapeBottomLayoutInset:](self, "setLandscapeBottomLayoutInset:", 0.0);
  -[SBHRootFolderSettings setLandscapeSideLayoutInset:](self, "setLandscapeSideLayoutInset:", 0.0);
  -[SBHRootFolderSettings setLandscapeWidgetOvershoot:](self, "setLandscapeWidgetOvershoot:", 0.0);
  -[SBHRootFolderSettings setDockAdditionalIconInset:](self, "setDockAdditionalIconInset:", 0.0);
  -[SBHRootFolderSettings setDockCornerRadius:](self, "setDockCornerRadius:", 0.0);
  -[SBHRootFolderSettings setDockMargin:](self, "setDockMargin:", 0.0);
  -[SBHRootFolderSettings setDockVerticalPadding:](self, "setDockVerticalPadding:", 0.0);
  -[SBHRootFolderSettings setPageControlVerticalOffset:](self, "setPageControlVerticalOffset:", 0.0);
  -[SBHRootFolderSettings setDefaultIconSize:](self, "setDefaultIconSize:", 0.0);
  -[SBHRootFolderSettings setSmallWidgetHeight:](self, "setSmallWidgetHeight:", 0.0);
  -[SBHRootFolderSettings setMediumWidgetWidth:](self, "setMediumWidgetWidth:", 0.0);
  -[SBHRootFolderSettings setLargeIconHeight:](self, "setLargeIconHeight:", 0.0);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[6];
  void *v45;
  _QWORD v46[4];
  _QWORD v47[5];
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Adjustable Layout"), CFSTR("adjustableLayoutEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Portrait Top Inset"), CFSTR("portraitTopLayoutInset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v5;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Portrait Bottom Inset"), CFSTR("portraitBottomLayoutInset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v6;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Portrait Side Insets"), CFSTR("portraitSideLayoutInset"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v7;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Portrait Widget Overshoot"), CFSTR("portraitWidgetOvershoot"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  __49__SBHRootFolderSettings_settingsControllerModule__block_invoke(v10, v9);
  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v9, CFSTR("Portrait Insets Adjustments"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Landscape Top Inset"), CFSTR("landscapeTopLayoutInset"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v11;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Landscape Bottom Inset"), CFSTR("landscapeBottomLayoutInset"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v12;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Landscape Side Insets"), CFSTR("landscapeSideLayoutInset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v13;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Landscape Widget Overshoot"), CFSTR("landscapeWidgetOvershoot"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  __49__SBHRootFolderSettings_settingsControllerModule__block_invoke(v16, v15);
  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v15, CFSTR("Landscape Insets Adjustments"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Dock Additional Icon Inset"), CFSTR("dockAdditionalIconInset"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v17;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Dock Corner Radius"), CFSTR("dockCornerRadius"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v18;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Dock External Margin"), CFSTR("dockMargin"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v19;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Dock Vertical Padding"), CFSTR("dockVerticalPadding"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = v20;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Page Control Vertical Offset"), CFSTR("pageControlVerticalOffset"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v47[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  __49__SBHRootFolderSettings_settingsControllerModule__block_invoke(v23, v22);
  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v22, CFSTR("Dock Adjustments"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Icon Size"), CFSTR("defaultIconSize"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v25;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Small Widget Height"), CFSTR("smallWidgetHeight"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v26;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Medium Widget Width"), CFSTR("mediumWidgetWidth"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v27;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Large Widget Height"), CFSTR("largeIconHeight"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  __49__SBHRootFolderSettings_settingsControllerModule__block_invoke(v30, v29);
  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v29, CFSTR("Icon Size Adjustments"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "rowWithTitle:action:", CFSTR("Restore Defaults"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)MEMORY[0x1E0D83078];
  v44[0] = v43;
  v44[1] = v42;
  v44[2] = v24;
  v44[3] = v31;
  v44[4] = v41;
  v44[5] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 6);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "moduleWithTitle:contents:", CFSTR("Root Folder"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

void __49__SBHRootFolderSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "setMaxValue:", 1000.0);
        objc_msgSend(v7, "setMinValue:", -1000.0);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (UIEdgeInsets)portraitLayoutInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  -[SBHRootFolderSettings portraitTopLayoutInset](self, "portraitTopLayoutInset");
  v4 = v3;
  -[SBHRootFolderSettings portraitBottomLayoutInset](self, "portraitBottomLayoutInset");
  v6 = v5;
  -[SBHRootFolderSettings portraitSideLayoutInset](self, "portraitSideLayoutInset");
  v8 = v7;
  v9 = v4;
  v10 = v6;
  v11 = v8;
  result.right = v11;
  result.bottom = v10;
  result.left = v8;
  result.top = v9;
  return result;
}

- (UIEdgeInsets)portraitAdditionalWidgetLayoutInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[SBHRootFolderSettings portraitWidgetOvershoot](self, "portraitWidgetOvershoot");
  v3 = -v2;
  v4 = 0.0;
  v5 = 0.0;
  v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)landscapeLayoutInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  -[SBHRootFolderSettings landscapeTopLayoutInset](self, "landscapeTopLayoutInset");
  v4 = v3;
  -[SBHRootFolderSettings landscapeBottomLayoutInset](self, "landscapeBottomLayoutInset");
  v6 = v5;
  -[SBHRootFolderSettings landscapeSideLayoutInset](self, "landscapeSideLayoutInset");
  v8 = v7;
  v9 = v4;
  v10 = v6;
  v11 = v8;
  result.right = v11;
  result.bottom = v10;
  result.left = v8;
  result.top = v9;
  return result;
}

- (UIEdgeInsets)landscapeAdditionalWidgetLayoutInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[SBHRootFolderSettings landscapeWidgetOvershoot](self, "landscapeWidgetOvershoot");
  v3 = -v2;
  v4 = 0.0;
  v5 = 0.0;
  v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

- (unint64_t)layoutInsetsEnforcementAxis
{
  double v2;
  double v3;
  double v4;
  _BOOL4 v5;
  double v6;

  -[SBHRootFolderSettings portraitAdditionalWidgetLayoutInsets](self, "portraitAdditionalWidgetLayoutInsets");
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8) != v4;
  if (*MEMORY[0x1E0DC49E8] != v6)
    v5 = 1;
  if (*(double *)(MEMORY[0x1E0DC49E8] + 24) != v3)
    v5 = 1;
  return (v5 | ~(*(double *)(MEMORY[0x1E0DC49E8] + 16) == v2)) & 1;
}

- (UIEdgeInsets)dockAdditionalIconInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[SBHRootFolderSettings dockAdditionalIconInset](self, "dockAdditionalIconInset");
  v3 = v2;
  v4 = 0.0;
  v5 = 0.0;
  v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)dockPlatterInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[SBHRootFolderSettings dockMargin](self, "dockMargin");
  v3 = v2;
  v4 = 0.0;
  v5 = v3;
  v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

- (double)dockViewHeight
{
  double v3;
  double v4;
  double v5;

  -[SBHRootFolderSettings dockVerticalPadding](self, "dockVerticalPadding");
  v4 = v3;
  -[SBHRootFolderSettings dockMargin](self, "dockMargin");
  return v5 + v4 * 2.0;
}

- (CGSize)iconImageSizeForGridSizeClass:(id)a3
{
  __CFString *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v4 = (__CFString *)a3;
  -[SBHRootFolderSettings defaultIconSize](self, "defaultIconSize");
  v6 = v5;
  -[SBHRootFolderSettings smallWidgetHeight](self, "smallWidgetHeight");
  v8 = v7;
  -[SBHRootFolderSettings mediumWidgetWidth](self, "mediumWidgetWidth");
  v10 = v9;
  -[SBHRootFolderSettings largeIconHeight](self, "largeIconHeight");
  if (CFSTR("SBHIconGridSizeClassDefault") == v4)
  {
    v13 = v6;
  }
  else
  {
    v12 = v11;
    v13 = v6;
    if ((-[__CFString isEqualToString:](v4, "isEqualToString:") & 1) == 0)
    {
      if (CFSTR("SBHIconGridSizeClassSmall") == v4 || (-[__CFString isEqualToString:](v4, "isEqualToString:") & 1) != 0)
      {
        v6 = v8;
        v13 = v8;
      }
      else
      {
        if (CFSTR("SBHIconGridSizeClassMedium") == v4
          || (-[__CFString isEqualToString:](v4, "isEqualToString:") & 1) != 0)
        {
          v6 = v8;
        }
        else
        {
          if (CFSTR("SBHIconGridSizeClassLarge") != v4
            && !-[__CFString isEqualToString:](v4, "isEqualToString:"))
          {
            v13 = *MEMORY[0x1E0C9D820];
            v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
            goto LABEL_7;
          }
          v6 = v12;
        }
        v13 = v10;
      }
    }
  }
LABEL_7:

  v14 = v13;
  v15 = v6;
  result.height = v15;
  result.width = v14;
  return result;
}

- (BOOL)shouldRebuildLayoutOnChangesToValueForKey:(id)a3
{
  return objc_msgSend(&unk_1E8E175B8, "containsObject:", a3);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHRootFolderSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHRootFolderSettings descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  SBHRootFolderSettings *v14;

  v4 = a3;
  -[SBHRootFolderSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SBHScreenTypeForCurrentDevice();
  SBHStringForScreenType(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v7, CFSTR("layout"));

  v8 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBHRootFolderSettings isAdjustableLayoutEnabled](self, "isAdjustableLayoutEnabled"), CFSTR("adjustableLayoutEnabled"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__SBHRootFolderSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E8D84EF0;
  v9 = v5;
  v13 = v9;
  v14 = self;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v12);

  v10 = v9;
  return v10;
}

id __63__SBHRootFolderSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "portraitTopLayoutInset");
  v3 = (id)objc_msgSend(v2, "appendFloat:withName:", CFSTR("portraitTopLayoutInset"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "portraitBottomLayoutInset");
  v5 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("portraitBottomLayoutInset"));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "portraitSideLayoutInset");
  v7 = (id)objc_msgSend(v6, "appendFloat:withName:", CFSTR("portraitSideLayoutInset"));
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "portraitWidgetOvershoot");
  v9 = (id)objc_msgSend(v8, "appendFloat:withName:", CFSTR("portraitWidgetOvershoot"));
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "landscapeTopLayoutInset");
  v11 = (id)objc_msgSend(v10, "appendFloat:withName:", CFSTR("landscapeTopLayoutInset"));
  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "landscapeBottomLayoutInset");
  v13 = (id)objc_msgSend(v12, "appendFloat:withName:", CFSTR("landscapeBottomLayoutInset"));
  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "landscapeSideLayoutInset");
  v15 = (id)objc_msgSend(v14, "appendFloat:withName:", CFSTR("landscapeSideLayoutInset"));
  v16 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "landscapeWidgetOvershoot");
  v17 = (id)objc_msgSend(v16, "appendFloat:withName:", CFSTR("landscapeWidgetOvershoot"));
  v18 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dockAdditionalIconInset");
  v19 = (id)objc_msgSend(v18, "appendFloat:withName:", CFSTR("dockAdditionalIconInset"));
  v20 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dockCornerRadius");
  v21 = (id)objc_msgSend(v20, "appendFloat:withName:", CFSTR("dockCornerRadius"));
  v22 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dockMargin");
  v23 = (id)objc_msgSend(v22, "appendFloat:withName:", CFSTR("dockMargin"));
  v24 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dockVerticalPadding");
  v25 = (id)objc_msgSend(v24, "appendFloat:withName:", CFSTR("dockVerticalPadding"));
  v26 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pageControlVerticalOffset");
  v27 = (id)objc_msgSend(v26, "appendFloat:withName:", CFSTR("pageControlVerticalOffset"));
  v28 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "defaultIconSize");
  v29 = (id)objc_msgSend(v28, "appendFloat:withName:", CFSTR("defaultIconSize"));
  v30 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "smallWidgetHeight");
  v31 = (id)objc_msgSend(v30, "appendFloat:withName:", CFSTR("smallWidgetHeight"));
  v32 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "mediumWidgetWidth");
  v33 = (id)objc_msgSend(v32, "appendFloat:withName:", CFSTR("mediumWidgetWidth"));
  v34 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "largeIconHeight");
  return (id)objc_msgSend(v34, "appendFloat:withName:", CFSTR("largeIconHeight"));
}

- (BOOL)isAdjustableLayoutEnabled
{
  return self->_adjustableLayoutEnabled;
}

- (void)setAdjustableLayoutEnabled:(BOOL)a3
{
  self->_adjustableLayoutEnabled = a3;
}

- (double)portraitTopLayoutInset
{
  return self->_portraitTopLayoutInset;
}

- (void)setPortraitTopLayoutInset:(double)a3
{
  self->_portraitTopLayoutInset = a3;
}

- (double)portraitBottomLayoutInset
{
  return self->_portraitBottomLayoutInset;
}

- (void)setPortraitBottomLayoutInset:(double)a3
{
  self->_portraitBottomLayoutInset = a3;
}

- (double)portraitSideLayoutInset
{
  return self->_portraitSideLayoutInset;
}

- (void)setPortraitSideLayoutInset:(double)a3
{
  self->_portraitSideLayoutInset = a3;
}

- (double)portraitWidgetOvershoot
{
  return self->_portraitWidgetOvershoot;
}

- (void)setPortraitWidgetOvershoot:(double)a3
{
  self->_portraitWidgetOvershoot = a3;
}

- (double)landscapeTopLayoutInset
{
  return self->_landscapeTopLayoutInset;
}

- (void)setLandscapeTopLayoutInset:(double)a3
{
  self->_landscapeTopLayoutInset = a3;
}

- (double)landscapeBottomLayoutInset
{
  return self->_landscapeBottomLayoutInset;
}

- (void)setLandscapeBottomLayoutInset:(double)a3
{
  self->_landscapeBottomLayoutInset = a3;
}

- (double)landscapeSideLayoutInset
{
  return self->_landscapeSideLayoutInset;
}

- (void)setLandscapeSideLayoutInset:(double)a3
{
  self->_landscapeSideLayoutInset = a3;
}

- (double)landscapeWidgetOvershoot
{
  return self->_landscapeWidgetOvershoot;
}

- (void)setLandscapeWidgetOvershoot:(double)a3
{
  self->_landscapeWidgetOvershoot = a3;
}

- (double)dockAdditionalIconInset
{
  return self->_dockAdditionalIconInset;
}

- (void)setDockAdditionalIconInset:(double)a3
{
  self->_dockAdditionalIconInset = a3;
}

- (double)dockCornerRadius
{
  return self->_dockCornerRadius;
}

- (void)setDockCornerRadius:(double)a3
{
  self->_dockCornerRadius = a3;
}

- (double)dockMargin
{
  return self->_dockMargin;
}

- (void)setDockMargin:(double)a3
{
  self->_dockMargin = a3;
}

- (double)dockVerticalPadding
{
  return self->_dockVerticalPadding;
}

- (void)setDockVerticalPadding:(double)a3
{
  self->_dockVerticalPadding = a3;
}

- (double)pageControlVerticalOffset
{
  return self->_pageControlVerticalOffset;
}

- (void)setPageControlVerticalOffset:(double)a3
{
  self->_pageControlVerticalOffset = a3;
}

- (double)defaultIconSize
{
  return self->_defaultIconSize;
}

- (void)setDefaultIconSize:(double)a3
{
  self->_defaultIconSize = a3;
}

- (double)smallWidgetHeight
{
  return self->_smallWidgetHeight;
}

- (void)setSmallWidgetHeight:(double)a3
{
  self->_smallWidgetHeight = a3;
}

- (double)mediumWidgetWidth
{
  return self->_mediumWidgetWidth;
}

- (void)setMediumWidgetWidth:(double)a3
{
  self->_mediumWidgetWidth = a3;
}

- (double)largeIconHeight
{
  return self->_largeIconHeight;
}

- (void)setLargeIconHeight:(double)a3
{
  self->_largeIconHeight = a3;
}

@end
