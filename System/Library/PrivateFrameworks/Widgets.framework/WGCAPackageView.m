@implementation WGCAPackageView

void __92___WGCAPackageView_loadPackageViewWithContentsOfURL_publishedObjectViewClassMap_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v9 = v7;
  if (!v6)
    objc_msgSend(v7, "setArchiveURL:", *(_QWORD *)(a1 + 32));
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v6);

}

BOOL __65___WGCAPackageView__supportsPushingBottomCornerRadiusToSubviews___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v5;
  _BOOL4 v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id WeakRetained;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;

  v5 = a2;
  if ((objc_msgSend(v5, "isHidden") & 1) == 0)
  {
    objc_msgSend(v5, "alpha");
    v6 = v7 == 0.0;
    if (!a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  v6 = 1;
  if (a3)
LABEL_5:
    *a3 = !v6;
LABEL_6:
  if (v6)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v8 = a1 + 32;
    *(_BYTE *)(*(_QWORD *)(v9 + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(v5, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      v13 = objc_msgSend(v5, "wg_supportsBottomCornerRadiusGivenRootView:withCornerRadius:supportedCorners:", WeakRetained, 0, *(double *)(a1 + 48));
      v14 = *(_QWORD *)(a1 + 32);
      v8 = a1 + 32;
      *(_BYTE *)(*(_QWORD *)(v14 + 8) + 24) = v13;

    }
    else
    {
      v15 = *(_QWORD *)(a1 + 32);
      v8 = a1 + 32;
      *(_BYTE *)(*(_QWORD *)(v15 + 8) + 24) = 1;
    }

  }
  v16 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 24) == 0;

  return v16;
}

uint64_t __47___WGCAPackageView__setContinuousCornerRadius___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v5;
  BOOL v6;
  double v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  uint64_t v13;

  v5 = a2;
  if ((objc_msgSend(v5, "isHidden") & 1) != 0)
  {
    v6 = 1;
    if (!a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v5, "alpha");
  v6 = v7 == 0.0;
  if (a3)
LABEL_5:
    *a3 = !v6;
LABEL_6:
  if (!v6)
  {
    objc_msgSend(v5, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v13 = 0;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(v5, "wg_supportsBottomCornerRadiusGivenRootView:withCornerRadius:supportedCorners:", WeakRetained, &v13, *(double *)(a1 + 40));

      if (v13)
      {
        objc_msgSend(v5, "_setContinuousCornerRadius:", *(double *)(a1 + 40));
        objc_msgSend(v5, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setMaskedCorners:", v13);

      }
    }
  }

  return 0;
}

@end
