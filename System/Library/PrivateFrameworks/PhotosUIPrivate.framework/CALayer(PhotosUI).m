@implementation CALayer(PhotosUI)

- (uint64_t)pu_setPosition:()PhotosUI
{
  uint64_t result;
  double v7;
  double v8;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  result = objc_msgSend(a1, "position");
  if (a2 != v7 || a3 != v8)
  {
    if (PULayerReferenceBasicAnimation)
    {
      v10 = v7;
      v11 = v8;
      v12 = (void *)objc_msgSend((id)PULayerReferenceBasicAnimation, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v10 - a2, v11 - a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFromValue:", v13);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setToValue:", v14);

      objc_msgSend(v12, "setKeyPath:", CFSTR("position"));
      objc_msgSend(v12, "keyPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_pu_uniqueAnimationKeyWithProposedKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "addAnimation:forKey:", v12, v16);
    }
    return objc_msgSend(a1, "setPosition:", a2, a3);
  }
  return result;
}

- (uint64_t)pu_setTransform:()PhotosUI
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t result;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CATransform3D v30;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v33;

  memset(&v33, 0, sizeof(v33));
  objc_msgSend(a1, "transform");
  v5 = a3[5];
  *(_OWORD *)&a.m31 = a3[4];
  *(_OWORD *)&a.m33 = v5;
  v6 = a3[7];
  *(_OWORD *)&a.m41 = a3[6];
  *(_OWORD *)&a.m43 = v6;
  v7 = a3[1];
  *(_OWORD *)&a.m11 = *a3;
  *(_OWORD *)&a.m13 = v7;
  v8 = a3[3];
  *(_OWORD *)&a.m21 = a3[2];
  *(_OWORD *)&a.m23 = v8;
  b = v33;
  result = CATransform3DEqualToTransform(&a, &b);
  if ((result & 1) == 0)
  {
    if (PULayerReferenceBasicAnimation)
    {
      v10 = (void *)objc_msgSend((id)PULayerReferenceBasicAnimation, "mutableCopy");
      memset(&a, 0, sizeof(a));
      v11 = a3[5];
      *(_OWORD *)&b.m31 = a3[4];
      *(_OWORD *)&b.m33 = v11;
      v12 = a3[7];
      *(_OWORD *)&b.m41 = a3[6];
      *(_OWORD *)&b.m43 = v12;
      v13 = a3[1];
      *(_OWORD *)&b.m11 = *a3;
      *(_OWORD *)&b.m13 = v13;
      v14 = a3[3];
      *(_OWORD *)&b.m21 = a3[2];
      *(_OWORD *)&b.m23 = v14;
      CATransform3DInvert(&v30, &b);
      b = v33;
      CATransform3DConcat(&a, &b, &v30);
      b = a;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &b);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFromValue:", v15);

      v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      *(_OWORD *)&b.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      *(_OWORD *)&b.m33 = v16;
      v17 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      *(_OWORD *)&b.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      *(_OWORD *)&b.m43 = v17;
      v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      *(_OWORD *)&b.m11 = *MEMORY[0x1E0CD2610];
      *(_OWORD *)&b.m13 = v18;
      v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      *(_OWORD *)&b.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      *(_OWORD *)&b.m23 = v19;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &b);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setToValue:", v20);

      objc_msgSend(v10, "setKeyPath:", CFSTR("transform"));
      objc_msgSend(v10, "keyPath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_pu_uniqueAnimationKeyWithProposedKey:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "keyPath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToString:", v23);

      if ((v24 & 1) == 0)
      {
        PLUIGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(b.m11) = 0;
          _os_log_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_DEFAULT, "Additive animations of CALayer's transform will not always produce the expected results.", (uint8_t *)&b, 2u);
        }

      }
      objc_msgSend(a1, "addAnimation:forKey:", v10, v22);

    }
    v26 = a3[5];
    *(_OWORD *)&a.m31 = a3[4];
    *(_OWORD *)&a.m33 = v26;
    v27 = a3[7];
    *(_OWORD *)&a.m41 = a3[6];
    *(_OWORD *)&a.m43 = v27;
    v28 = a3[1];
    *(_OWORD *)&a.m11 = *a3;
    *(_OWORD *)&a.m13 = v28;
    v29 = a3[3];
    *(_OWORD *)&a.m21 = a3[2];
    *(_OWORD *)&a.m23 = v29;
    return objc_msgSend(a1, "setTransform:", &a);
  }
  return result;
}

- (id)_pu_uniqueAnimationKeyWithProposedKey:()PhotosUI
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "animationForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v4;
  if (v5)
  {
    v7 = 2;
    v8 = v4;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%ld"), v4, v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      ++v7;
      objc_msgSend(a1, "animationForKey:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v6;
    }
    while (v9);
  }

  return v6;
}

+ (void)pu_animateAlongsideView:()PhotosUI animations:
{
  void (**v8)(_QWORD);
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a4;
  if (v21)
  {
    if (!v8)
      goto LABEL_12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CALayer+PhotosUI.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view"));

    if (!v8)
      goto LABEL_12;
  }
  v9 = (void *)PULayerReferenceView;
  if (PULayerReferenceView)
    v10 = PULayerReferenceView == (_QWORD)v21;
  else
    v10 = 1;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CALayer+PhotosUI.m"), 36, CFSTR("nested calls to %@ with different views (%@ vs %@)"), v20, v21, PULayerReferenceView);

    v9 = (void *)PULayerReferenceView;
  }
  v11 = v9;
  if (v11)
  {
    v8[2](v8);
  }
  else
  {
    objc_msgSend(v21, "_pu_referenceBasicAnimationForCurrentAnimation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "setDelegate:", 0);
    objc_msgSend(v13, "setAdditive:", 1);
    objc_storeStrong((id *)&PULayerReferenceView, a3);
    v14 = (void *)PULayerReferenceBasicAnimation;
    PULayerReferenceBasicAnimation = (uint64_t)v13;
    v15 = v13;

    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);

    v8[2](v8);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    v16 = (void *)PULayerReferenceView;
    PULayerReferenceView = 0;

    v17 = (void *)PULayerReferenceBasicAnimation;
    PULayerReferenceBasicAnimation = 0;

  }
LABEL_12:

}

@end
