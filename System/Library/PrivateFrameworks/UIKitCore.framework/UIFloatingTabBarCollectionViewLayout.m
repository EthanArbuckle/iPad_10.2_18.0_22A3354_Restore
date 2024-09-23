@implementation UIFloatingTabBarCollectionViewLayout

id __64___UIFloatingTabBarCollectionViewLayout_initWithFloatingTabBar___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(off_1E1679980, "estimatedDimension:", 80.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679980, "fractionalHeightDimension:", 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E16799A8, "sizeWithWidthDimension:heightDimension:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E1679998, "itemWithLayoutSize:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E1679990, "verticalGroupWithLayoutSize:subitems:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E16799A0, "sectionWithGroup:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentInsetsReference:", 1);
  objc_msgSend(v9, "setContentInsets:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  return v9;
}

void __91___UIFloatingTabBarCollectionViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v3 = a2;
  objc_msgSend(a1[4], "floatingTabBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outgoingExpandedGroupItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "floatingTabBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91___UIFloatingTabBarCollectionViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_2;
  v14[3] = &unk_1E16B1B50;
  v15 = a1[5];
  v16 = a1[6];
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __91___UIFloatingTabBarCollectionViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_3;
  v10[3] = &unk_1E16EA840;
  v11 = a1[5];
  v12 = v5;
  v13 = v3;
  v8 = v3;
  v9 = v5;
  objc_msgSend(v6, "_animateSelection:completion:", v14, v10);

}

void __91___UIFloatingTabBarCollectionViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "frame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  objc_msgSend(*(id *)(a1 + 40), "alpha");
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:");
  v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "setGroupItemMinimized:", objc_msgSend(*(id *)(a1 + 40), "isGroupItemMinimized"));

}

void __91___UIFloatingTabBarCollectionViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = *(id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(v8, "listItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v2;
    v5 = v3;
    if (v4 == v5)
    {

    }
    else
    {
      v6 = v5;
      if (!v4 || !v5)
      {

        goto LABEL_10;
      }
      v7 = objc_msgSend(v4, "isEqual:", v5);

      if (!v7)
        goto LABEL_11;
    }
    objc_msgSend(v8, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 0);
LABEL_10:

  }
LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
