@implementation UIBarCustomizationChiclet

void __43___UIBarCustomizationChiclet_initWithItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  _itemViewFromItem(a2, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __46___UIBarCustomizationChiclet_setLabelVisible___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double MidX;
  CGFloat v16;
  id v17;
  CGRect v18;
  CGRect v19;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", v3);

  objc_msgSend(*(id *)(a1 + 32), "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "platterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "convertRect:toView:", *(_QWORD *)(a1 + 32));
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v18.origin.x = v8;
  v18.origin.y = v10;
  v18.size.width = v12;
  v18.size.height = v14;
  MidX = CGRectGetMidX(v18);
  v19.origin.x = v8;
  v19.origin.y = v10;
  v19.size.width = v12;
  v19.size.height = v14;
  v16 = CGRectGetMaxY(v19) + 10.0;
  objc_msgSend(*(id *)(a1 + 32), "label");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCenter:", MidX, v16);

}

@end
