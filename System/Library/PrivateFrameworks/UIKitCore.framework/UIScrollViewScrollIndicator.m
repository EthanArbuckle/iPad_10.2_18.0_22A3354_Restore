@implementation UIScrollViewScrollIndicator

void __56___UIScrollViewScrollIndicator__layoutFillViewAnimated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  id v35;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  if (objc_msgSend(*(id *)(a1 + 32), "expandedForDirectManipulation"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_visualStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "doesExpand");

    if (v11)
    {
      v12 = objc_msgSend(*(id *)(a1 + 32), "type");
      objc_msgSend(*(id *)(a1 + 32), "_visualStyle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "staticDimensionExpandedSize");
      v15 = v14;

      if (v12 == 1)
        v16 = v9;
      else
        v16 = v15;
      if (v12 == 1)
        v17 = v15;
      else
        v17 = v7;
      objc_msgSend(*(id *)(a1 + 32), "_offsetFillViewRectForExpandedState:", v3, v5, v17, v16);
      v3 = v18;
      v5 = v19;
      v7 = v20;
      v9 = v21;
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "type") == 1)
    v22 = v7;
  else
    v22 = v9;
  v23 = *(void **)(a1 + 32);
  objc_msgSend(v23, "roundedFillView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  v26 = v25;
  v28 = v27;
  if (objc_msgSend(v23, "type") != 1)
    v26 = v28;

  if (v22 != v26)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "type") == 1)
      v29 = v7;
    else
      v29 = v9;
    objc_msgSend(*(id *)(a1 + 32), "_visualStyle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fillViewCornerRadiusForStaticDimensionSize:", v29);
    v32 = v31;

    objc_msgSend(*(id *)(a1 + 32), "roundedFillView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setCornerRadius:", v32);

  }
  objc_msgSend(*(id *)(a1 + 32), "roundedFillView");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFrame:", v3, v5, v7, v9);

}

@end
