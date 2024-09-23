@implementation UIDragSetDownAnimation

void __53___UIDragSetDownAnimation_updateVisibleDroppedItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
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
  double v20[4];
  __int128 v21;
  __int128 v22;
  double v23[4];
  __int128 v24;
  __int128 v25;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "_window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(void **)(*(_QWORD *)(a1 + 40) + 56) != v7)
  {
    objc_msgSend(v6, "center");
    objc_msgSend(v7, "convertPoint:fromWindow:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
    objc_msgSend(v6, "setCenter:");
    objc_msgSend(v7, "convertPoint:fromWindow:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    v9 = v8;
    v11 = v10;
    v24 = 0u;
    v25 = 0u;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    if (v6)
    {
      objc_msgSend(v6, "velocity3D", 0.0, 0.0);
      v13 = *((double *)&v24 + 1);
      v14 = *(double *)&v24;
    }
    objc_msgSend(v7, "convertPoint:fromWindow:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), v14, v13);
    v23[2] = 0.0;
    v23[3] = 0.0;
    v23[0] = v15 - v9;
    v23[1] = v16 - v11;
    objc_msgSend(v6, "setVelocity3D:", v23);
    v21 = 0u;
    v22 = 0u;
    v17 = 0.0;
    if (v6)
    {
      objc_msgSend(v6, "targetVelocity3D", 0.0);
      v12 = *((double *)&v21 + 1);
      v17 = *(double *)&v21;
    }
    objc_msgSend(v7, "convertPoint:fromWindow:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), v17, v12);
    v20[2] = 0.0;
    v20[3] = 0.0;
    v20[0] = v18 - v9;
    v20[1] = v19 - v11;
    objc_msgSend(v6, "setTargetVelocity3D:", v20);
  }
  objc_msgSend(v5, "updateDroppedItem:", v6);

}

void __32___UIDragSetDownAnimation_begin__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_allItemAnimationsCompleted");

}

uint64_t __68___UIDragSetDownAnimation_defaultSingleItemAnimationForPlatterView___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CATransform3D v19;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v22;
  CATransform3D v23;
  CATransform3D v24;
  CATransform3D v25;
  CGRect v26;
  CGRect v27;

  memset(&v25, 0, sizeof(v25));
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anchorPoint");
  v4 = v3;
  v6 = v5;

  v7 = *(void **)(a1 + 32);
  if (v4 == 0.5 && v6 == 0.5)
  {
    if (v7)
      objc_msgSend(v7, "transform3D");
    else
      memset(&a, 0, sizeof(a));
    CATransform3DMakeScale(&b, 1.5, 1.5, 1.5);
    CATransform3DConcat(&v25, &a, &b);
  }
  else
  {
    objc_msgSend(v7, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anchorPoint");
    v11 = v10 + -0.5;
    objc_msgSend(*(id *)(a1 + 32), "frame");
    v12 = v11 * CGRectGetWidth(v26);

    objc_msgSend(*(id *)(a1 + 32), "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "anchorPoint");
    v15 = v14 + -0.5;
    objc_msgSend(*(id *)(a1 + 32), "frame");
    v16 = v15 * CGRectGetHeight(v27);

    v17 = *(void **)(a1 + 32);
    if (v17)
      objc_msgSend(v17, "transform3D");
    else
      memset(&v24, 0, sizeof(v24));
    CATransform3DTranslate(&v25, &v24, -v12, -v16, 0.0);
    v22 = v25;
    CATransform3DScale(&v23, &v22, 1.5, 1.5, 1.5);
    v25 = v23;
    v22 = v23;
    CATransform3DTranslate(&v23, &v22, v12, v16, 0.0);
    v25 = v23;
  }
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v19 = v25;
  return objc_msgSend(*(id *)(a1 + 32), "setTransform3D:", &v19);
}

uint64_t __67___UIDragSetDownAnimation_defaultMultiItemAnimationForPlatterView___block_invoke(uint64_t a1)
{
  uint32_t v2;
  void *v3;
  void *v4;
  uint32_t v5;
  double v6;
  uint32_t v7;
  double v8;
  double v9;
  double v10;
  CATransform3D v12;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v15;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = arc4random();
  v3 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v3, "transform3D");
  else
    memset(&a, 0, sizeof(a));
  CATransform3DMakeScale(&b, (double)v2 / 4294967300.0 + (double)v2 / 4294967300.0 + (1.0 - (double)v2 / 4294967300.0) * 1.5, (double)v2 / 4294967300.0 + (double)v2 / 4294967300.0 + (1.0 - (double)v2 / 4294967300.0) * 1.5, (double)v2 / 4294967300.0 + (double)v2 / 4294967300.0 + (1.0 - (double)v2 / 4294967300.0) * 1.5);
  CATransform3DConcat(&v15, &a, &b);
  v4 = *(void **)(a1 + 32);
  v12 = v15;
  objc_msgSend(v4, "setTransform3D:", &v12);
  v5 = arc4random();
  v6 = (double)v5 / 4294967300.0 * 30.0 - (1.0 - (double)v5 / 4294967300.0) * 30.0;
  v7 = arc4random();
  v8 = (double)v7 / 4294967300.0 * 30.0 - (1.0 - (double)v7 / 4294967300.0) * 30.0;
  objc_msgSend(*(id *)(a1 + 32), "center");
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", v9 + v6, v10 + v8);
}

uint64_t __62___UIDragSetDownAnimation_defaultDropAnimationForPlatterView___block_invoke(uint64_t a1)
{
  void *v2;
  CATransform3D v4;
  CATransform3D v5;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  CATransform3DMakeScale(&v5, 0.33, 0.33, 0.33);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform3D:", &v4);
}

@end
