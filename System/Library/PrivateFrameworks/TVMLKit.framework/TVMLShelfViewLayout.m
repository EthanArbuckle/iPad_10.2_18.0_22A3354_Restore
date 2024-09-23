@implementation TVMLShelfViewLayout

void __74___TVMLShelfViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  _OWORD v23[9];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BDD1968];
  v6 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "cellMetrics");
    v8 = *((double *)&v24 + 1);
    v7 = *(double *)&v24;
    v10 = *((double *)&v25 + 1);
    v9 = *(double *)&v25;
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = 0.0;
    v9 = 0.0;
    v8 = 0.0;
    v7 = 0.0;
    v23[8] = 0u;
  }
  objc_msgSend(v4, "valueWithUIEdgeInsets:", v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forTVViewStyle:", v11, CFSTR("padding"));

  v12 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "size");
  +[_TVLockupFactory updateViewLayoutForCell:forSize:](_TVLockupFactory, "updateViewLayoutForCell:forSize:", v12);
  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "center");
  objc_msgSend(v13, "setCenter:");
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v15 = v14;
  v17 = v16;
  objc_msgSend(*(id *)(a1 + 48), "size");
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", v15, v17, v18, v19);
  v20 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "alpha");
  objc_msgSend(v20, "setAlpha:");
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(void **)(a1 + 48);
  if (v22)
    objc_msgSend(v22, "transform3D");
  else
    memset(v23, 0, 128);
  objc_msgSend(v21, "setTransform:", v23);

  if (v3)
    v3[2](v3, 1);

}

@end
