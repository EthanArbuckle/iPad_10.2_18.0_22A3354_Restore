@implementation OBViewUtilities

+ (void)updateNavigationBarWithNavigationItem:(id)a3 forHeaderView:(id)a4 inScrollView:(id)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void (**v25)(_QWORD);
  id v26;
  void (**v27)(_QWORD);
  void *v28;
  double v29;
  double v30;
  void *v31;
  _QWORD v32[4];
  void (**v33)(_QWORD);
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  BOOL v41;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "headerLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v10, "headerLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", &stru_1E37AB0D0);

    if ((v17 & 1) == 0)
    {
      v18 = +[OBViewUtilities _navigationBarTitleShouldShowForHeaderView:inScrollView:](OBViewUtilities, "_navigationBarTitleShouldShowForHeaderView:inScrollView:", v10, v11);
      objc_msgSend(v10, "headerLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v18)
      {
        objc_msgSend(v19, "text");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTitle:", v21);

      }
      else
      {
        objc_msgSend(v19, "setAlpha:", 1.0);
      }

      v22 = MEMORY[0x1E0C809B0];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __93__OBViewUtilities_updateNavigationBarWithNavigationItem_forHeaderView_inScrollView_animated___block_invoke;
      v38[3] = &unk_1E37AAB48;
      v41 = v18;
      v23 = v10;
      v39 = v23;
      v24 = v9;
      v40 = v24;
      v25 = (void (**)(_QWORD))MEMORY[0x19AEC5320](v38);
      v34[0] = v22;
      v34[1] = 3221225472;
      v34[2] = __93__OBViewUtilities_updateNavigationBarWithNavigationItem_forHeaderView_inScrollView_animated___block_invoke_2;
      v34[3] = &unk_1E37AA978;
      v35 = v23;
      v26 = v11;
      v36 = v26;
      v37 = v24;
      v27 = (void (**)(_QWORD))MEMORY[0x19AEC5320](v34);
      objc_msgSend(v26, "panGestureRecognizer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "velocityInView:", v26);
      v30 = v29;

      if (v6 && v30 > -300.0)
      {
        v31 = (void *)MEMORY[0x1E0DC3F10];
        v32[0] = v22;
        v32[1] = 3221225472;
        v32[2] = __93__OBViewUtilities_updateNavigationBarWithNavigationItem_forHeaderView_inScrollView_animated___block_invoke_3;
        v32[3] = &unk_1E37AAB70;
        v33 = v27;
        objc_msgSend(v31, "animateWithDuration:delay:options:animations:completion:", 4, v25, v32, 0.25, 0.0);

      }
      else
      {
        v25[2](v25);
        v27[2](v27);
      }

    }
  }
  else
  {

  }
}

void __93__OBViewUtilities_updateNavigationBarWithNavigationItem_forHeaderView_inScrollView_animated___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;

  v2 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "headerLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v3, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 40), "titleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1.0;
  }
  else
  {
    objc_msgSend(v3, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(a1 + 40), "titleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0.0;
  }
  v7 = v5;
  objc_msgSend(v5, "setAlpha:", v6);

}

uint64_t __93__OBViewUtilities_updateNavigationBarWithNavigationItem_forHeaderView_inScrollView_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = +[OBViewUtilities _navigationBarTitleShouldShowForHeaderView:inScrollView:](OBViewUtilities, "_navigationBarTitleShouldShowForHeaderView:inScrollView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 48), "setTitle:", 0);
  return result;
}

uint64_t __93__OBViewUtilities_updateNavigationBarWithNavigationItem_forHeaderView_inScrollView_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)shouldUpdateNavigationBarWithNavigationItem:(id)a3 forHeaderView:(id)a4 inScrollView:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  double v21;
  int v22;
  BOOL v23;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "headerLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  objc_msgSend(v8, "convertRect:fromView:", v9);
  v12 = v11;

  objc_msgSend(v8, "safeAreaInsets");
  v14 = v13;
  objc_msgSend(v8, "contentOffset");
  v16 = v14 + v15 > 0.0 && v14 + v15 > v12;
  v17 = objc_msgSend(v7, "_backgroundHidden");
  v18 = +[OBViewUtilities _navigationBarTitleShouldShowForHeaderView:inScrollView:](OBViewUtilities, "_navigationBarTitleShouldShowForHeaderView:inScrollView:", v9, v8);

  objc_msgSend(v7, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v7, "titleView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "alpha");
    v22 = v21 == 0.0;

  }
  else
  {
    v22 = 0;
  }

  v23 = v17 == v16 || v22 == v18;
  return v23;
}

+ (BOOL)_navigationBarTitleShouldShowForHeaderView:(id)a3 inScrollView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double MaxY;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v26;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "headerLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  objc_msgSend(v5, "convertRect:fromView:", v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v26.origin.x = v9;
  v26.origin.y = v11;
  v26.size.width = v13;
  v26.size.height = v15;
  MaxY = CGRectGetMaxY(v26);
  objc_msgSend(v6, "headerLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "font");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "descender");
  v20 = MaxY + v19;

  objc_msgSend(v5, "safeAreaInsets");
  v22 = v21;
  objc_msgSend(v5, "contentOffset");
  v24 = v23;

  return v22 + v24 > 0.0 && v22 + v24 >= v20;
}

+ (id)pointImageOfColor:(id)a3
{
  id v3;
  void *v4;
  CGSize v6;
  CGRect v7;

  v3 = a3;
  v6.width = 1.0;
  v6.height = 1.0;
  UIGraphicsBeginImageContext(v6);
  objc_msgSend(v3, "set");

  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.width = 1.0;
  v7.size.height = 1.0;
  UIRectFill(v7);
  UIGraphicsGetImageFromCurrentImageContext();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v4;
}

+ (BOOL)shouldUseAccessibilityLayout
{
  void *v2;
  NSString *v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E0DC48F0]) > NSOrderedSame;
  return (char)v2;
}

+ (int64_t)activeInterfaceOrientationForView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFrontBoard"))
  {

LABEL_4:
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "activeInterfaceOrientation");
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.springboard"));

  if (v7)
    goto LABEL_4;
  objc_msgSend(v3, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windows");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filteredArrayUsingPredicate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v16, "interfaceOrientation");

    goto LABEL_6;
  }
  objc_msgSend(v3, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "interfaceOrientation");
LABEL_5:
  v10 = v9;
LABEL_6:

  return v10;
}

uint64_t __53__OBViewUtilities_activeInterfaceOrientationForView___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isKeyWindow");
}

@end
