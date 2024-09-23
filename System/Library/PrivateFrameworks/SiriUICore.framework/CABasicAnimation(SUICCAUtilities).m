@implementation CABasicAnimation(SUICCAUtilities)

- (uint64_t)_suic_updateForAdditiveAnimationFromScalar:()SUICCAUtilities toScalar:
{
  return objc_msgSend(a1, "_suic_updateForAdditiveAnimationFromScalar:toScalar:withLayerScalar:", a3, a4, a4);
}

- (void)_suic_updateForAdditiveAnimationFromScalar:()SUICCAUtilities toScalar:withLayerScalar:
{
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2 - a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setFromValue:", v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3 - a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setToValue:", v8);

}

- (uint64_t)_suic_updateForAdditiveAnimationFromPoint:()SUICCAUtilities toPoint:
{
  return objc_msgSend(a1, "_suic_updateForAdditiveAnimationFromPoint:toPoint:withLayerPoint:", a3, a4, a5, a6, a5, a6);
}

- (void)_suic_updateForAdditiveAnimationFromPoint:()SUICCAUtilities toPoint:withLayerPoint:
{
  double v8;
  double v9;
  void *v10;
  id v11;

  v8 = a4 - a6;
  v9 = a5 - a7;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", a2 - a6, a3 - a7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setFromValue:", v10);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setToValue:", v11);

}

- (uint64_t)_suic_updateForAdditiveAnimationFromSize:()SUICCAUtilities toSize:
{
  return objc_msgSend(a1, "_suic_updateForAdditiveAnimationFromSize:toSize:withLayerSize:", a3, a4, a5, a6, a5, a6);
}

- (void)_suic_updateForAdditiveAnimationFromSize:()SUICCAUtilities toSize:withLayerSize:
{
  double v8;
  double v9;
  void *v10;
  id v11;

  v8 = a4 - a6;
  v9 = a5 - a7;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", a2 - a6, a3 - a7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setFromValue:", v10);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setToValue:", v11);

}

- (uint64_t)_suic_updateForAdditiveAnimationFromTransform:()SUICCAUtilities toTransform:
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v18[8];
  _OWORD v19[2];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[8];

  v4 = a3[5];
  v26[4] = a3[4];
  v26[5] = v4;
  v5 = a3[7];
  v26[6] = a3[6];
  v26[7] = v5;
  v6 = a3[1];
  v26[0] = *a3;
  v26[1] = v6;
  v7 = a3[3];
  v26[2] = a3[2];
  v26[3] = v7;
  v8 = a4[5];
  v9 = a4[3];
  v22 = a4[4];
  v23 = v8;
  v10 = a4[5];
  v11 = a4[7];
  v24 = a4[6];
  v25 = v11;
  v12 = a4[1];
  v19[0] = *a4;
  v19[1] = v12;
  v13 = a4[3];
  v15 = *a4;
  v14 = a4[1];
  v20 = a4[2];
  v21 = v13;
  v18[4] = v22;
  v18[5] = v10;
  v16 = a4[7];
  v18[6] = v24;
  v18[7] = v16;
  v18[0] = v15;
  v18[1] = v14;
  v18[2] = v20;
  v18[3] = v9;
  return objc_msgSend(a1, "_suic_updateForAdditiveAnimationFromTransform:toTransform:withLayerTransform:", v26, v19, v18);
}

- (void)_suic_updateForAdditiveAnimationFromTransform:()SUICCAUtilities toTransform:withLayerTransform:
{
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BOOL4 v21;
  _OWORD *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *v47;
  void *v48;
  CATransform3D v49;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v52;
  CATransform3D v53;

  memset(&v53, 0, sizeof(v53));
  v9 = a5[5];
  *(_OWORD *)&v52.m31 = a5[4];
  *(_OWORD *)&v52.m33 = v9;
  v10 = a5[7];
  *(_OWORD *)&v52.m41 = a5[6];
  *(_OWORD *)&v52.m43 = v10;
  v11 = a5[1];
  *(_OWORD *)&v52.m11 = *a5;
  *(_OWORD *)&v52.m13 = v11;
  v12 = a5[3];
  *(_OWORD *)&v52.m21 = a5[2];
  *(_OWORD *)&v52.m23 = v12;
  CATransform3DInvert(&v53, &v52);
  memset(&v52, 0, sizeof(v52));
  v13 = a3[5];
  *(_OWORD *)&a.m31 = a3[4];
  *(_OWORD *)&a.m33 = v13;
  v14 = a3[7];
  *(_OWORD *)&a.m41 = a3[6];
  *(_OWORD *)&a.m43 = v14;
  v15 = a3[1];
  *(_OWORD *)&a.m11 = *a3;
  *(_OWORD *)&a.m13 = v15;
  v16 = a3[3];
  *(_OWORD *)&a.m21 = a3[2];
  *(_OWORD *)&a.m23 = v16;
  v17 = a5[5];
  *(_OWORD *)&b.m31 = a5[4];
  *(_OWORD *)&b.m33 = v17;
  v18 = a5[7];
  *(_OWORD *)&b.m41 = a5[6];
  *(_OWORD *)&b.m43 = v18;
  v19 = a5[1];
  *(_OWORD *)&b.m11 = *a5;
  *(_OWORD *)&b.m13 = v19;
  v20 = a5[3];
  *(_OWORD *)&b.m21 = a5[2];
  *(_OWORD *)&b.m23 = v20;
  v21 = CATransform3DEqualToTransform(&a, &b);
  v22 = (_OWORD *)MEMORY[0x1E0CD2610];
  if (v21)
  {
    v23 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&v52.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v52.m33 = v23;
    v24 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v52.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v52.m43 = v24;
    v25 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v52.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v52.m13 = v25;
    v26 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v52.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v52.m23 = v26;
  }
  else
  {
    a = v53;
    v27 = a3[5];
    *(_OWORD *)&b.m31 = a3[4];
    *(_OWORD *)&b.m33 = v27;
    v28 = a3[7];
    *(_OWORD *)&b.m41 = a3[6];
    *(_OWORD *)&b.m43 = v28;
    v29 = a3[1];
    *(_OWORD *)&b.m11 = *a3;
    *(_OWORD *)&b.m13 = v29;
    v30 = a3[3];
    *(_OWORD *)&b.m21 = a3[2];
    *(_OWORD *)&b.m23 = v30;
    CATransform3DConcat(&v52, &a, &b);
  }
  memset(&a, 0, sizeof(a));
  v31 = a4[5];
  *(_OWORD *)&b.m31 = a4[4];
  *(_OWORD *)&b.m33 = v31;
  v32 = a4[7];
  *(_OWORD *)&b.m41 = a4[6];
  *(_OWORD *)&b.m43 = v32;
  v33 = a4[1];
  *(_OWORD *)&b.m11 = *a4;
  *(_OWORD *)&b.m13 = v33;
  v34 = a4[3];
  *(_OWORD *)&b.m21 = a4[2];
  *(_OWORD *)&b.m23 = v34;
  v35 = a5[5];
  *(_OWORD *)&v49.m31 = a5[4];
  *(_OWORD *)&v49.m33 = v35;
  v36 = a5[7];
  *(_OWORD *)&v49.m41 = a5[6];
  *(_OWORD *)&v49.m43 = v36;
  v37 = a5[1];
  *(_OWORD *)&v49.m11 = *a5;
  *(_OWORD *)&v49.m13 = v37;
  v38 = a5[3];
  *(_OWORD *)&v49.m21 = a5[2];
  *(_OWORD *)&v49.m23 = v38;
  if (CATransform3DEqualToTransform(&b, &v49))
  {
    v39 = v22[5];
    *(_OWORD *)&a.m31 = v22[4];
    *(_OWORD *)&a.m33 = v39;
    v40 = v22[7];
    *(_OWORD *)&a.m41 = v22[6];
    *(_OWORD *)&a.m43 = v40;
    v41 = v22[1];
    *(_OWORD *)&a.m11 = *v22;
    *(_OWORD *)&a.m13 = v41;
    v42 = v22[3];
    *(_OWORD *)&a.m21 = v22[2];
    *(_OWORD *)&a.m23 = v42;
  }
  else
  {
    b = v53;
    v43 = a4[5];
    *(_OWORD *)&v49.m31 = a4[4];
    *(_OWORD *)&v49.m33 = v43;
    v44 = a4[7];
    *(_OWORD *)&v49.m41 = a4[6];
    *(_OWORD *)&v49.m43 = v44;
    v45 = a4[1];
    *(_OWORD *)&v49.m11 = *a4;
    *(_OWORD *)&v49.m13 = v45;
    v46 = a4[3];
    *(_OWORD *)&v49.m21 = a4[2];
    *(_OWORD *)&v49.m23 = v46;
    CATransform3DConcat(&a, &b, &v49);
  }
  b = v52;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &b);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setFromValue:", v47);

  b = a;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &b);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setToValue:", v48);

}

@end
