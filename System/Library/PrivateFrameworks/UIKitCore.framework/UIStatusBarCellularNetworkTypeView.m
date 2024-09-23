@implementation UIStatusBarCellularNetworkTypeView

uint64_t __53___UIStatusBarCellularNetworkTypeView_setFixedWidth___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  _QWORD v5[5];

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "widthConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", v2);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53___UIStatusBarCellularNetworkTypeView_setFixedWidth___block_invoke_2;
  v5[3] = &unk_1E16B1B28;
  v5[4] = *(_QWORD *)(a1 + 32);
  return +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.5);
}

void __53___UIStatusBarCellularNetworkTypeView_setFixedWidth___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "superview");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutSubviews");

}

void __109___UIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setHidden:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setHidden:", 0);
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(a1 + 40), "substringFromIndex:", *(_QWORD *)(a1 + 64));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setText:", v2);

    v3 = *(void **)(a1 + 48);
    if (v3)
    {
      objc_msgSend(v3, "attributesAtIndex:effectiveRange:", *(_QWORD *)(a1 + 64), 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setFont:", v4);

      objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setTextColor:", v5);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "fontForStyle:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "fontStyle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setFont:", v6);

      objc_msgSend(*(id *)(a1 + 56), "textColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setTextColor:");
    }

  }
}

void __109___UIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  char v10;

  v6[2] = __109___UIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_3;
  v6[3] = &unk_1E16BD778;
  v2 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = v2;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v10 = *(_BYTE *)(a1 + 72);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __109___UIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_9;
  v5[3] = &unk_1E16B7A60;
  v4 = *(_QWORD *)(a1 + 64);
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = v4;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v5, 0.5);

}

void __109___UIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 416))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(v1 + 432), "setAttributedText:");
      objc_msgSend(*(id *)(a1 + 40), "attributesAtIndex:effectiveRange:", 0, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)off_1E1678D90;
      objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)off_1E1678D98;
      objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(*(id *)(v1 + 432), "setText:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "applyStyleAttributes:", *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 56), "fontForStyle:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "fontStyle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "textColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)off_1E1678D90;
      v6 = *(_QWORD *)off_1E1678D98;
    }
    v8 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = *(_QWORD *)off_1E1678E60;
    v13[1] = v4;
    v14[0] = &unk_1E1A962C0;
    v14[1] = v5;
    v13[2] = v6;
    v14[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithString:attributes:", v9, v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "_setAttributedText:", v11);

    v12 = 1.0;
    if (!*(_BYTE *)(a1 + 64))
      v12 = 0.0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", v12);

  }
}

uint64_t __109___UIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_9(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 416))
  {
    v2 = result;
    objc_msgSend(*(id *)(v1 + 440), "setHidden:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 448), "setHidden:", 1);
    result = objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 432), "setAlpha:", 1.0);
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 424) = *(_QWORD *)(v2 + 40);
    *(_BYTE *)(*(_QWORD *)(v2 + 32) + 416) = 0;
  }
  return result;
}

@end
