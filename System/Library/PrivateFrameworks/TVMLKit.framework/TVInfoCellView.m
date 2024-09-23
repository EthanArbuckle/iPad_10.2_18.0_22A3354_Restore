@implementation TVInfoCellView

double __48___TVInfoCellView_sizeThatFits_withHeaderWidth___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  double result;

  v5 = a2;
  objc_msgSend(v5, "tv_margin");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "tv_sizeThatFits:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v11 = v10;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v11
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  if (a3)
    v7 = fmax(fmax(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), v7), *(double *)(a1 + 64));
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v7 + *(double *)(v12 + 24);
  *(double *)(v12 + 24) = result;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
  return result;
}

double __48___TVInfoCellView_sizeThatFits_withHeaderWidth___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double result;

  v5 = a2;
  objc_msgSend(v5, "tv_margin");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "tv_sizeThatFits:", *(double *)(a1 + 56), 0.0);
  v11 = v10;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);
  if (a3)
  {
    v12 = fmax(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v7);
    v7 = *(double *)(a1 + 72);
  }
  else
  {
    v12 = *(double *)(*(_QWORD *)(a1 + 32) + 488);
  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = fmax(v12, v7) + *(double *)(v13 + 24);
  *(double *)(v13 + 24) = result;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
  return result;
}

void __33___TVInfoCellView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  id v20;
  CGRect v21;
  CGRect v22;

  v20 = a2;
  objc_msgSend(v20, "tv_margin");
  v9 = v8;
  if (*(_BYTE *)(a1 + 104))
    v10 = v7;
  else
    v10 = v6;
  if (a3)
  {
    v11 = fmax(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v5);
    v5 = *(double *)(a1 + 64);
  }
  else
  {
    v11 = *(double *)(a1 + 56);
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = fmax(v11, v5)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);
  objc_msgSend(v20, "tv_itemWidth");
  v13 = v12;
  if (v12 == 0.0)
    v13 = *(double *)(a1 + 72);
  objc_msgSend(v20, "tv_sizeThatFits:", v13, 0.0);
  v15 = v14;
  v17 = v16;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 416))
    v10 = *(double *)(a1 + 88);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & (v15 < v13)) != 0)
    v13 = v15;
  v18 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v19 = v17;
  if (v17 + v18 - *(double *)(a1 + 96) > 2.22044605e-16)
  {
    v10 = *MEMORY[0x24BDBF090];
    v18 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v19 = *(double *)(MEMORY[0x24BDBF090] + 24);
    objc_msgSend(v20, "setHidden:", 1);
  }
  v21.origin.x = v10;
  v21.origin.y = v18;
  v21.size.width = v13;
  v21.size.height = v19;
  v22 = CGRectIntegral(v21);
  objc_msgSend(v20, "setFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v17
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;

}

@end
