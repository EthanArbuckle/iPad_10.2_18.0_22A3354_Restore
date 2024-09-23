@implementation UIView(IC)

- (uint64_t)ic_applyRoundedCornersWithRadius:()IC
{
  return objc_msgSend(a1, "ic_applyRoundedCorners:radius:", -1);
}

- (uint64_t)ic_hasCompactHeight
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ic_hasCompactHeight");

  return v2;
}

- (void)ic_applyRoundedCorners:()IC radius:
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(a1, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4 == -1)
  {
    objc_msgSend(v7, "setCornerRadius:", a2);
  }
  else
  {
    objc_msgSend(v7, "setCornerRadius:", 0.0);

    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DC3508];
    objc_msgSend(a1, "bounds");
    objc_msgSend(v9, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", a4);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "setPath:", objc_msgSend(v10, "CGPath"));
    objc_msgSend(a1, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMask:", v8);

  }
  v12 = *MEMORY[0x1E0CD2A68];
  objc_msgSend(a1, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerCurve:", v12);

  objc_msgSend(a1, "layer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMasksToBounds:", 1);

}

- (id)ic_appearanceInfo
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_appearanceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)ic_addAnchorsToFillSuperviewWithLeadingPadding:()IC trailingPadding:topPadding:bottomPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:
{
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(a1, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safeAreaLayoutGuide");
  v16 = objc_claimAutoreleasedReturnValue();
  if (a8)
    v17 = (void *)v16;
  else
    v17 = v15;
  v18 = (void *)v16;
  v36 = (void *)v16;
  objc_msgSend(v17, "topAnchor");
  v19 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v19;
  objc_msgSend(v17, "bottomAnchor");
  v20 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v20;
  if (a7)
    v21 = v18;
  else
    v21 = v15;
  objc_msgSend(v21, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(a1, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v19, a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v23;
  objc_msgSend(a1, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v20, -a5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v25;
  objc_msgSend(a1, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v32, a2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v27;
  objc_msgSend(a1, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v22, -a3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v30);

}

- (uint64_t)ic_addAnchorsToFillSuperviewWithLeadingPadding:()IC trailingPadding:verticalPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithLeadingPadding:trailingPadding:topPadding:bottomPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:", a3, a4, a5, a5);
}

- (BOOL)ic_inSidebar
{
  void *v2;
  _BOOL8 v3;
  void *v4;

  objc_msgSend(a1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_splitViewControllerContext") == 1)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "_splitViewControllerContext") == 2;

  }
  return v3;
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithHorizontalPadding:()IC verticalPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithLeadingPadding:trailingPadding:verticalPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:", a3, a3, a4);
}

+ (BOOL)ic_isRTL
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", 0) == 1;
}

- (id)ic_windowScene
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)ic_isRTL
{
  return objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection") == 1;
}

- (uint64_t)ic_hasCompactWidth
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ic_hasCompactWidth");

  return v2;
}

- (uint64_t)ic_directionalSafeAreaInsets
{
  objc_msgSend(a1, "ic_isRTL");
  return objc_msgSend(a1, "safeAreaInsets");
}

- (id)ic_viewControllerManager
{
  void *v1;
  uint64_t v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__39;
  v9 = __Block_byref_object_dispose__39;
  v10 = 0;
  v3 = MEMORY[0x1E0C809B0];
  performBlockOnMainThreadAndWait();
  objc_msgSend((id)v6[5], "ic_viewControllerManager", v3, 3221225472, __38__UIView_IC__ic_viewControllerManager__block_invoke, &unk_1E5C1D9D0, a1, &v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v5, 8);

  return v1;
}

- (uint64_t)ic_isInSecureWindow
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ic_isSecure");

    return v5;
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[UIView(IC) ic_isInSecureWindow].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    return 1;
  }
}

- (uint64_t)ic_crashIfWindowIsSecure
{
  uint64_t result;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = objc_msgSend(a1, "ic_isInSecureWindow");
  if ((_DWORD)result)
  {
    v2 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[UIView(IC) ic_crashIfWindowIsSecure].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

    return objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Attempted to show notes during unsecure session."));
  }
  return result;
}

- (id)ic_window
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_opt_class();
  objc_msgSend(a1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(a1, "ic_windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windows");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ic_firstObjectOfClass:", objc_opt_class());
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)ic_enclosingScrollView
{
  id v1;
  uint64_t v2;

  objc_msgSend(a1, "superview");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v1, "superview");
      v2 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v2;
      if (!v2)
        goto LABEL_6;
    }
    v1 = v1;
  }
LABEL_6:

  return v1;
}

- (uint64_t)ic_applyRoundedCorners
{
  return objc_msgSend(a1, "ic_applyRoundedCornersWithRadius:", 12.0);
}

- (uint64_t)ic_applyRoundedCorners:()IC
{
  return objc_msgSend(a1, "ic_applyRoundedCorners:radius:", 12.0);
}

- (void)ic_applyRoundedCornersWithTopLeadingRadius:()IC topTrailingRadius:bottomLeadingRadius:bottomTrailingRadius:
{
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  _QWORD v16[8];

  v10 = *MEMORY[0x1E0CD2A68];
  objc_msgSend(a1, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerCurve:", v10);

  v12 = objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection");
  if (v12 == 1)
    v13 = a3;
  else
    v13 = a2;
  if (v12 == 1)
  {
    a3 = a2;
    v14 = a4;
  }
  else
  {
    v14 = a5;
  }
  if (v12 != 1)
    a5 = a4;
  objc_msgSend(a1, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)v16 = a5;
  *(double *)&v16[1] = a5;
  *(double *)&v16[2] = v14;
  *(double *)&v16[3] = v14;
  *(double *)&v16[4] = a3;
  *(double *)&v16[5] = a3;
  *(double *)&v16[6] = v13;
  *(double *)&v16[7] = v13;
  objc_msgSend(v15, "setCornerRadii:", v16);

}

- (void)ic_applyRoundedCornersFromView:()IC
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _OWORD v14[4];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v4 = a3;
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cornerCurve");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerCurve:", v6);

  objc_msgSend(v4, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "cornerRadii");
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
  }
  objc_msgSend(a1, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v15;
  v14[1] = v16;
  v14[2] = v17;
  v14[3] = v18;
  objc_msgSend(v10, "setCornerRadii:", v14);

  objc_msgSend(v4, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "masksToBounds");
  objc_msgSend(a1, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMasksToBounds:", v12);

}

- (uint64_t)ic_removeRoundedCorners
{
  return objc_msgSend(a1, "ic_applyRoundedCornersWithRadius:", 0.0);
}

- (uint64_t)ic_applyShadow
{
  return objc_msgSend(a1, "ic_applyShadowWithRadius:opacity:offset:", 12.0, 0.04, 0.0, 4.0);
}

- (uint64_t)ic_applyShadowWithRadius:()IC opacity:offset:
{
  return objc_msgSend(a1, "ic_applyShadowWithRadius:opacity:offset:shadowPathIsBounds:", 1);
}

- (void)ic_applyShadowWithRadius:()IC opacity:offset:shadowPathIsBounds:
{
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  id v20;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = objc_msgSend(v13, "CGColor");
  objc_msgSend(a1, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShadowColor:", v14);

  objc_msgSend(a1, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setShadowRadius:", a2);

  objc_msgSend(a1, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a3 = a3;
  LODWORD(v18) = LODWORD(a3);
  objc_msgSend(v17, "setShadowOpacity:", v18);

  objc_msgSend(a1, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShadowOffset:", a4, a5);

  objc_msgSend(a1, "layer");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShadowPathIsBounds:", a7);

}

- (void)ic_removeShadow
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShadowColor:", 0);

  objc_msgSend(a1, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 0;
  objc_msgSend(v4, "setShadowOpacity:", v3);

}

- (uint64_t)ic_hasCompactSize
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ic_hasCompactSize");

  return v2;
}

- (uint64_t)ic_behavior
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ic_behavior");

  return v2;
}

- (id)ic_preferredContentSizeCategory
{
  NSString *v2;
  NSString *v3;
  void *v4;

  objc_msgSend(a1, "minimumContentSizeCategory");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "maximumContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryCompareToCategory(v2, v3))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(a1, "minimumContentSizeCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)setIc_preferredContentSizeCategory:()IC
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "setMinimumContentSizeCategory:", v4);
  objc_msgSend(a1, "setMaximumContentSizeCategory:", v4);

}

- (id)ic_imageRenderedFromLayer
{
  void *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC3828]);
  objc_msgSend(a1, "bounds");
  v7 = (void *)objc_msgSend(v4, "initWithSize:format:", v3, v5, v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__UIView_IC__ic_imageRenderedFromLayer__block_invoke;
  v10[3] = &unk_1E5C1D740;
  v10[4] = a1;
  objc_msgSend(v7, "imageWithActions:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)ic_imageRenderedFromViewHierarchyAfterScreenUpdates:()IC
{
  return objc_msgSend(a1, "ic_imageRenderedFromViewHierarchyAfterScreenUpdates:fallback:", a3, 0);
}

- (id)ic_imageRenderedFromViewHierarchyAfterScreenUpdates:()IC fallback:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  char v18;

  v6 = a4;
  objc_msgSend(a1, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0DC3828]);
  objc_msgSend(a1, "bounds");
  v12 = (void *)objc_msgSend(v9, "initWithSize:format:", v8, v10, v11);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__UIView_IC__ic_imageRenderedFromViewHierarchyAfterScreenUpdates_fallback___block_invoke;
  v16[3] = &unk_1E5C20B30;
  v18 = a3;
  v16[4] = a1;
  v17 = v6;
  v13 = v6;
  objc_msgSend(v12, "imageWithActions:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)ic_imageViewRenderedFromLayer
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(a1, "bounds");
  v3 = (void *)objc_msgSend(v2, "initWithFrame:");
  objc_msgSend(a1, "ic_imageRenderedFromLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

  return v3;
}

- (id)ic_imageViewRenderedFromViewHierarchy
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(a1, "bounds");
  v3 = (void *)objc_msgSend(v2, "initWithFrame:");
  objc_msgSend(a1, "ic_imageRenderedFromViewHierarchyAfterScreenUpdates:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

  return v3;
}

- (void)ic_removeAllConstraintsForSubview:()IC
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "constraints", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "firstItem");
        v12 = objc_claimAutoreleasedReturnValue();
        if ((id)v12 == v4)
        {

        }
        else
        {
          v13 = (void *)v12;
          objc_msgSend(v11, "secondItem");
          v14 = (id)objc_claimAutoreleasedReturnValue();

          if (v14 != v4)
            continue;
        }
        objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(a1, "removeConstraints:", v5);
}

- (uint64_t)ic_addAnchorsToFillSuperview
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithHorizontalPadding:", 0.0);
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithHorizontalPadding:()IC
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithHorizontalPadding:verticalPadding:usesSafeAreaLayoutGuide:", 0, a3, 0.0);
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithLeadingPadding:()IC trailingPadding:
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithLeadingPadding:trailingPadding:verticalPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:", 0, 0, a3, a4, 0.0);
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithVerticalPadding:()IC
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithHorizontalPadding:verticalPadding:usesSafeAreaLayoutGuide:", 0, 0.0, a3);
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithPadding:()IC
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithHorizontalPadding:verticalPadding:usesSafeAreaLayoutGuide:", 0, a3, a3);
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithHorizontalPadding:()IC verticalPadding:usesSafeAreaLayoutGuide:
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithHorizontalPadding:verticalPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:", a3, a3);
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithPaddingFromDirectionalEdgeInsets:()IC
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithPaddingFromDirectionalEdgeInsets:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:", 1, 1);
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithPaddingFromDirectionalEdgeInsets:()IC usesSafeAreaLayoutGuide:
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithPaddingFromDirectionalEdgeInsets:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:", a3, a3);
}

- (uint64_t)ic_addAnchorsToFillSuperviewWithPaddingFromDirectionalEdgeInsets:()IC usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:
{
  return objc_msgSend(a1, "ic_addAnchorsToFillSuperviewWithLeadingPadding:trailingPadding:topPadding:bottomPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:", a4, a6, a3, a5);
}

- (void)ic_addAnchorsToFillSuperviewLayoutMargins
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(a1, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutMarginsGuide");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(a1, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  objc_msgSend(a1, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bottomAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  objc_msgSend(a1, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v7;
  objc_msgSend(a1, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activateConstraints:", v11);

}

- (void)ic_addConstraintsToFillSuperview
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v1 = a1;
  objc_msgSend(v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  _NSDictionaryOfVariableBindings(CFSTR("view"), v1, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v2 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[view]|"), 0, 0, v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateConstraints:", v3);

  v4 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[view]|"), 0, 0, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activateConstraints:", v5);

}

- (id)ic_renderImage
{
  void *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC3828]);
  objc_msgSend(a1, "bounds");
  v7 = (void *)objc_msgSend(v4, "initWithSize:format:", v3, v5, v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __28__UIView_IC__ic_renderImage__block_invoke;
  v10[3] = &unk_1E5C1D740;
  v10[4] = a1;
  objc_msgSend(v7, "imageWithActions:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)ic_renderImageView
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(a1, "bounds");
  v3 = (void *)objc_msgSend(v2, "initWithFrame:");
  objc_msgSend(a1, "ic_renderImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v4);

  return v3;
}

+ (uint64_t)ic_animateWithDuration:()IC timingFunction:animations:
{
  return objc_msgSend(a1, "ic_animateWithDuration:timingFunction:animations:completion:", a3, a4, 0);
}

+ (void)ic_animateWithDuration:()IC timingFunction:animations:completion:
{
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v9 = a6;
  if (a5)
  {
    v10 = (void *)MEMORY[0x1E0CD28B0];
    v11 = a5;
    v12 = a4;
    objc_msgSend(v10, "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationTimingFunction:", v12);

    v13 = (void *)MEMORY[0x1E0DC3F10];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__UIView_IC__ic_animateWithDuration_timingFunction_animations_completion___block_invoke;
    v14[3] = &unk_1E5C1E830;
    v15 = v9;
    objc_msgSend(v13, "animateWithDuration:animations:completion:", v11, v14, a1);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }

}

+ (uint64_t)ic_animateUsingSpringWithDampingRatio:()IC response:animations:completion:
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, a5, a6, a1, a2, 0.0, 0.0, 0.0, 0.0);
}

- (void)ic_isInSecureWindow
{
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, a1, a3, "It is invalid to call ic_isInSecureWindow for views that don't have a window.", a5, a6, a7, a8, 0);
}

- (void)ic_crashIfWindowIsSecure
{
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, a1, a3, "Attempted to show notes during unsecure session.", a5, a6, a7, a8, 0);
}

@end
