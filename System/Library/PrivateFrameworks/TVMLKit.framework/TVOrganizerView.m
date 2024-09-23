@implementation TVOrganizerView

double __55___TVOrganizerView_tv_alignmentInsetsForExpectedWidth___block_invoke(double a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
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
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 == v12)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 == v15)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;

  objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "doubleValue");
  v25 = v24;

  if (v13 && a1 + fmax(v19, v25) * -2.0 >= v22)
  {
    v28 = floor((a1 - v22) * 0.5);
    objc_msgSend(v13, "components");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "components");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lastObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
    v27 = 0;
    if (v19 <= v25)
      v28 = a1 - (v22 + v25);
    else
      v28 = v19;
  }
  if (v10)
  {
    objc_msgSend(v10, "components");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstObject");
    v32 = objc_claimAutoreleasedReturnValue();

    v28 = 0.0;
    if (!v26)
    {
      objc_msgSend(v10, "components");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "lastObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v27 = (void *)v32;
  }
  if (v16)
  {
    if (!v27)
    {
      objc_msgSend(v16, "components");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v16, "components");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "lastObject");
    v36 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)v36;
  }
  objc_msgSend(v27, "tv_margin");
  v38 = v28 + v37;
  objc_msgSend(v27, "tv_alignmentInsetsForExpectedWidth:", 0.0);
  v40 = v38 + v39;
  objc_msgSend(v26, "tv_margin");
  objc_msgSend(v26, "tv_alignmentInsetsForExpectedWidth:", 0.0);

  return v40;
}

void __34___TVOrganizerView_layoutSubviews__block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4)
{
  void *v6;
  id v7;
  CGRect v8;
  CGRect v9;

  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    v7 = a2;
    objc_msgSend(v6, "addSubview:", v7);
    v8.origin.x = 0.0;
    v8.origin.y = 0.0;
    v8.size.width = a3;
    v8.size.height = a4;
    v9 = CGRectIntegral(v8);
    objc_msgSend(v7, "setBounds:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);

  }
}

void __34___TVOrganizerView_layoutSubviews__block_invoke_2(double *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;

  v25 = a2;
  v7 = a3;
  v8 = a4;
  if (v25)
  {
    objc_msgSend(v25, "center");
    v10 = v9;
    v11 = a1[5] + a1[8];
    objc_msgSend(v25, "bounds");
    objc_msgSend(v25, "setCenter:", v10, v11 + v12 * 0.5);
  }
  if (v7)
  {
    objc_msgSend(v7, "center");
    v14 = v13;
    objc_msgSend(v25, "bounds");
    v16 = v15;
    objc_msgSend(v7, "bounds");
    v18 = v17;
    objc_msgSend(v8, "bounds");
    v20 = 0.0;
    if (v18 > a1[13] + fmax(v16, v19) * -2.0)
      v20 = (v16 - v19) * 0.5;
    objc_msgSend(v7, "setCenter:", v14, a1[15] + a1[5] + a1[7] * 0.5 + v20);
  }
  if (v8)
  {
    objc_msgSend(v8, "center");
    v22 = v21;
    v23 = a1[5] + a1[7] - a1[10];
    objc_msgSend(v8, "bounds");
    objc_msgSend(v8, "setCenter:", v22, v23 + v24 * -0.5);
  }

}

void __34___TVOrganizerView_layoutSubviews__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;

  v24 = a2;
  v7 = a3;
  v8 = a4;
  if (v24)
  {
    objc_msgSend(v24, "center");
    v10 = v9;
    v11 = *(double *)(a1 + 48) + *(double *)(a1 + 88);
    objc_msgSend(v24, "bounds");
    objc_msgSend(v24, "setCenter:", v11 + v12 * 0.5, v10);
  }
  if (v7)
  {
    objc_msgSend(v7, "center");
    v14 = v13;
    objc_msgSend(v7, "bounds");
    v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v16 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v17 = *(double *)(a1 + 112) + fmax(v15, v16) * -2.0;
    v18 = (v15 - v16) * 0.5;
    if (v19 <= v17)
      v18 = 0.0;
    objc_msgSend(v7, "setCenter:", *(double *)(a1 + 128) + *(double *)(a1 + 48) + *(double *)(a1 + 64) * 0.5 + v18, v14);
  }
  if (v8)
  {
    objc_msgSend(v8, "center");
    v21 = v20;
    v22 = *(double *)(a1 + 48) + *(double *)(a1 + 64) - *(double *)(a1 + 104);
    objc_msgSend(v8, "bounds");
    objc_msgSend(v8, "setCenter:", v22 + v23 * -0.5, v21);
  }

}

void __66___TVOrganizerView_setSelected_animated_withAnimationCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  double v7;
  _QWORD v8[4];
  id v9;
  char v10;

  v3 = a2;
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v5 && *(_BYTE *)(a1 + 40))
  {
    v6 = *(_BYTE *)(a1 + 41) == 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66___TVOrganizerView_setSelected_animated_withAnimationCoordinator___block_invoke_2;
    v8[3] = &unk_24EB852F8;
    v9 = v3;
    v10 = *(_BYTE *)(a1 + 41);
    objc_msgSend(v5, "addCoordinatedAnimationsForAnimation:animations:completion:", v6, v8, 0);

  }
  else
  {
    v7 = 1.0;
    if (!*(_BYTE *)(a1 + 41))
      v7 = 0.0;
    objc_msgSend(v3, "setAlpha:", v7);
  }

}

uint64_t __66___TVOrganizerView_setSelected_animated_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

@end
