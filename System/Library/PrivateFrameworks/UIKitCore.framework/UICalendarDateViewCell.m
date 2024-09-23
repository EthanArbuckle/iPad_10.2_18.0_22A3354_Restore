@implementation UICalendarDateViewCell

id __41___UICalendarDateViewCell_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a2, "_decorationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  objc_msgSend(v3, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v4, v5);
  return v3;
}

void __42___UICalendarDateViewCell_setHighlighted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _OWORD v6[8];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  objc_msgSend(*(id *)(a1 + 40), "highlightedCellBackgroundEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "setEffect:", v2);

  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v3, "highlightedContentTransform");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
  }
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[4] = v11;
  v6[5] = v12;
  v6[6] = v13;
  v6[7] = v14;
  v6[0] = v7;
  v6[1] = v8;
  v6[2] = v9;
  v6[3] = v10;
  objc_msgSend(v5, "setSublayerTransform:", v6);

}

void __42___UICalendarDateViewCell_setHighlighted___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[8];

  objc_msgSend(*(id *)(a1 + 40), "defaultCellBackgroundEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "setEffect:", v2);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v9[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v9[5] = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v9[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v9[7] = v6;
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v9[0] = *MEMORY[0x1E0CD2610];
  v9[1] = v7;
  v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v9[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v9[3] = v8;
  objc_msgSend(v4, "setSublayerTransform:", v9);

}

@end
