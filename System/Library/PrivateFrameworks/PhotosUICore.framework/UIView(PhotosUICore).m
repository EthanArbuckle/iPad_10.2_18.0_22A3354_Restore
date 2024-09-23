@implementation UIView(PhotosUICore)

- (double)px_peripheryInsets
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
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
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  double v45;
  double v46;
  CGFloat v48;
  double v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  objc_msgSend(a1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "_peripheryInsets");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v8 = *MEMORY[0x1E0DC49E8];
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v14 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  objc_msgSend(v6, "bounds");
  v49 = v8;
  v16 = v10 + v15;
  v18 = v8 + v17;
  v20 = v19 - (v14 + v10);
  v22 = v21 - (v12 + v8);
  objc_msgSend(v6, "coordinateSpace");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "convertRect:toCoordinateSpace:", a1, v16, v18, v20, v22);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  objc_msgSend(a1, "bounds");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v50.origin.x = v25;
  v50.origin.y = v27;
  v50.size.width = v29;
  v50.size.height = v31;
  v57.origin.x = v33;
  v57.origin.y = v35;
  v48 = v37;
  v57.size.width = v37;
  v57.size.height = v39;
  v51 = CGRectIntersection(v50, v57);
  x = v51.origin.x;
  y = v51.origin.y;
  width = v51.size.width;
  height = v51.size.height;
  CGRectGetMinX(v51);
  v52.origin.x = v33;
  v52.origin.y = v35;
  v52.size.width = v37;
  v52.size.height = v39;
  CGRectGetMaxX(v52);
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  CGRectGetMaxX(v53);
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v54.size.height = height;
  MinY = CGRectGetMinY(v54);
  v55.origin.x = v33;
  v55.size.width = v48;
  v55.origin.y = v35;
  v55.size.height = v39;
  CGRectGetMaxY(v55);
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  CGRectGetMaxY(v56);
  v45 = v49;
  if (MinY < v49)
    v45 = MinY;
  v46 = fmax(v45, 0.0);

  return v46;
}

- (BOOL)px_intersectsWindowBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  _BOOL8 v24;
  CGRect v26;
  CGRect v27;

  objc_msgSend(a1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "frame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    objc_msgSend(a1, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertRect:fromView:", v11, v4, v6, v8, v10);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    objc_msgSend(v2, "bounds");
    v27.origin.x = v20;
    v27.origin.y = v21;
    v27.size.width = v22;
    v27.size.height = v23;
    v26.origin.x = v13;
    v26.origin.y = v15;
    v26.size.width = v17;
    v26.size.height = v19;
    v24 = CGRectIntersectsRect(v26, v27);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)px_addFullBoundsSubview:()PhotosUICore
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(a1, "addSubview:", v4);
  v15 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v4, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v7;
  objc_msgSend(a1, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v10;
  objc_msgSend(a1, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v14);

}

- (uint64_t)px_hasHiddenAncestor
{
  id v1;
  void *v2;
  int v3;
  char v4;
  uint64_t v5;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    v3 = 0;
    do
    {
      v4 = objc_msgSend(v2, "isHidden");
      if ((v4 & 1) != 0)
        break;
      objc_opt_class();
      v3 |= objc_opt_isKindOfClass();
      objc_msgSend(v2, "superview");
      v5 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v5;
    }
    while (v5);

  }
  else
  {
    LOBYTE(v3) = 0;
    v4 = 0;
  }
  return v4 & 1 | ((v3 & 1) == 0);
}

- (id)px_ancestorViewOfClass:()PhotosUICore
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__UIView_PhotosUICore__px_ancestorViewOfClass___block_invoke;
  v4[3] = &__block_descriptor_40_e16_B16__0__UIView_8lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "px_ancestorViewPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)px_ancestorViewPassingTest:()PhotosUICore
{
  id v4;
  uint64_t v5;

  v4 = a1;
  if (v4)
  {
    do
    {
      if (((*(uint64_t (**)(uint64_t, id))(a3 + 16))(a3, v4) & 1) != 0)
        break;
      objc_msgSend(v4, "superview");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v5;
    }
    while (v5);
  }
  return v4;
}

- (void)px_convertTransform:()PhotosUICore fromView:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void (**v13)(_QWORD *__return_ptr);
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  NSObject *v19;
  __int128 v20;
  CGAffineTransform v21;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v24;
  CGAffineTransform v25;
  _QWORD aBlock[4];
  id v27;
  CGAffineTransform buf;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(a1, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ancestorSharedWithLayer:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      PXAssertGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.a) = 138413058;
        *(_QWORD *)((char *)&buf.a + 4) = a1;
        WORD2(buf.b) = 2112;
        *(_QWORD *)((char *)&buf.b + 6) = v7;
        HIWORD(buf.c) = 2112;
        *(_QWORD *)&buf.d = v10;
        LOWORD(buf.tx) = 2112;
        *(_QWORD *)((char *)&buf.tx + 2) = v11;
        _os_log_error_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "Ancestor layer's delegate is not a UIView. self=%@ view=%@ ancestorLayer=%@ ancestorView=%@", (uint8_t *)&buf, 0x2Au);
      }

      goto LABEL_8;
    }
  }
  if (!v11)
  {
LABEL_8:
    v20 = a2[1];
    *(_OWORD *)a4 = *a2;
    *(_OWORD *)(a4 + 16) = v20;
    *(_OWORD *)(a4 + 32) = a2[2];
    goto LABEL_9;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__UIView_PhotosUICore__px_convertTransform_fromView___block_invoke;
  aBlock[3] = &unk_1E5149168;
  v27 = v11;
  v12 = v11;
  v13 = (void (**)(_QWORD *__return_ptr))_Block_copy(aBlock);
  memset(&buf, 0, sizeof(buf));
  ((void (**)(CGAffineTransform *__return_ptr))v13)[2](&buf);
  memset(&v25, 0, sizeof(v25));
  ((void (*)(CGAffineTransform *__return_ptr, void (**)(_QWORD *__return_ptr), void *))v13[2])(&v24, v13, a1);
  CGAffineTransformInvert(&v25, &v24);
  v14 = a2[1];
  *(_OWORD *)a4 = *a2;
  *(_OWORD *)(a4 + 16) = v14;
  v16 = *a2;
  v15 = a2[1];
  *(_OWORD *)(a4 + 32) = a2[2];
  t1 = buf;
  *(_OWORD *)&t2.a = v16;
  *(_OWORD *)&t2.c = v15;
  *(_OWORD *)&t2.tx = a2[2];
  CGAffineTransformConcat((CGAffineTransform *)a4, &t1, &t2);
  t2 = v25;
  v17 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)&v21.a = *(_OWORD *)a4;
  *(_OWORD *)&v21.c = v17;
  *(_OWORD *)&v21.tx = *(_OWORD *)(a4 + 32);
  CGAffineTransformConcat(&t1, &t2, &v21);
  v18 = *(_OWORD *)&t1.c;
  *(_OWORD *)a4 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a4 + 16) = v18;
  *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;

LABEL_9:
}

- (uint64_t)px_convertTransform:()PhotosUICore toView:
{
  __int128 v4;
  _OWORD v5[3];

  a4[1] = 0u;
  a4[2] = 0u;
  *a4 = 0u;
  if (a3)
  {
    v4 = a2[1];
    v5[0] = *a2;
    v5[1] = v4;
    v5[2] = a2[2];
    return objc_msgSend(a3, "px_convertTransform:fromView:", v5, result);
  }
  return result;
}

- (void)px_transferToSuperview:()PhotosUICore
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _OWORD v17[3];
  _OWORD v18[3];
  uint8_t buf[32];
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a1;
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "center");
    objc_msgSend(v4, "convertPoint:fromView:", v6);
    v8 = v7;
    v10 = v9;
    v20 = 0u;
    memset(buf, 0, sizeof(buf));
    if (v5)
    {
      objc_msgSend(v5, "transform");
      if (v4)
      {
LABEL_4:
        objc_msgSend(v4, "px_convertTransform:fromView:", v18, v6);
LABEL_10:
        objc_msgSend(v5, "setCenter:", v8, v10);
        v17[0] = *(_OWORD *)buf;
        v17[1] = *(_OWORD *)&buf[16];
        v17[2] = v20;
        objc_msgSend(v5, "setTransform:", v17);
        objc_msgSend(v4, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "flipsHorizontalAxis");

        if (v13)
        {
          objc_msgSend(v5, "layer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "flipsHorizontalAxis") ^ 1;
          objc_msgSend(v5, "layer");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setFlipsHorizontalAxis:", v15);

        }
        objc_msgSend(v4, "addSubview:", v5);
        goto LABEL_13;
      }
    }
    else
    {
      memset(v18, 0, sizeof(v18));
      if (v4)
        goto LABEL_4;
    }
    v20 = 0u;
    memset(buf, 0, sizeof(buf));
    goto LABEL_10;
  }
  PXAssertGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "requested to transfer orphaned view %@ to superview %@, which is undefined", buf, 0x16u);
  }

LABEL_13:
}

+ (uint64_t)px_animateView:()PhotosUICore toCenter:bounds:transform:withDuration:delay:usingSpringWithDamping:initialVelocity:options:completion:
{
  __int128 v20;
  _OWORD v22[3];
  _QWORD v23[8];

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __142__UIView_PhotosUICore__px_animateView_toCenter_bounds_transform_withDuration_delay_usingSpringWithDamping_initialVelocity_options_completion___block_invoke;
  v23[3] = &__block_descriptor_64_e27_v32__0d8___v___16___v__B_24l;
  *(double *)&v23[4] = a8;
  *(double *)&v23[5] = a9;
  v23[6] = a17;
  v23[7] = a13;
  v20 = a12[1];
  v22[0] = *a12;
  v22[1] = v20;
  v22[2] = a12[2];
  return objc_msgSend(a1, "_px_animateView:toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:", a11, v22, v23, a18, a19, a20);
}

+ (uint64_t)px_animateView:()PhotosUICore toCenter:bounds:transform:usingDefaultDampedSpringWithDelay:initialVelocity:options:completion:
{
  __int128 v18;
  _OWORD v20[3];
  _QWORD v21[6];

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __134__UIView_PhotosUICore__px_animateView_toCenter_bounds_transform_usingDefaultDampedSpringWithDelay_initialVelocity_options_completion___block_invoke;
  v21[3] = &__block_descriptor_48_e27_v32__0d8___v___16___v__B_24l;
  *(double *)&v21[4] = a8;
  v21[5] = a12;
  v18 = a11[1];
  v20[0] = *a11;
  v20[1] = v18;
  v20[2] = a11[2];
  return objc_msgSend(a1, "_px_animateView:toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:", a10, v20, v21, a16, a17, a18);
}

+ (void)_px_animateView:()PhotosUICore toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:
{
  id v28;
  id v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  NSObject *v39;
  uint64_t v40;
  id v41;
  double v42;
  double Width;
  double v44;
  double Height;
  double v46;
  double v47;
  double v48;
  double v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  NSObject *v53;
  id v54;
  __int128 v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  int v60;
  char v61;
  id v62;
  NSObject *v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  __int128 v73;
  _QWORD v74[4];
  NSObject *v75;
  _QWORD *v76;
  _QWORD v77[4];
  id v78;
  __int128 v79;
  double v80;
  double v81;
  double v82;
  _QWORD v83[4];
  NSObject *v84;
  _QWORD *v85;
  _QWORD v86[4];
  id v87;
  __int128 v88;
  double v89;
  double v90;
  double v91;
  _QWORD v92[4];
  NSObject *v93;
  _QWORD *v94;
  _QWORD v95[4];
  id v96;
  __int128 v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  __int128 v104;
  double v105;
  double v106;
  double v107;
  __int128 v108;
  CGAffineTransform t1;
  _QWORD v110[4];
  NSObject *v111;
  _QWORD *v112;
  _QWORD v113[4];
  id v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  _QWORD v119[4];
  NSObject *v120;
  _QWORD *v121;
  _QWORD v122[4];
  id v123;
  double v124;
  double v125;
  _QWORD v126[4];
  NSObject *v127;
  _QWORD *v128;
  _QWORD v129[4];
  id v130;
  double v131;
  double v132;
  _QWORD block[4];
  id v134;
  _QWORD *v135;
  _QWORD v136[3];
  char v137;
  CGAffineTransform v138;
  CGAffineTransform t2;
  uint64_t v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;

  v140 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v29 = a5;
  v30 = a6;
  if (v28)
  {
    if (v29)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIView+PhotosUICore.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view != nil"));

    if (v29)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIView+PhotosUICore.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("springAnimation != NULL"));

LABEL_3:
  objc_msgSend(v28, "center");
  v32 = v31;
  v34 = v33;
  objc_msgSend(v28, "bounds");
  v70 = v36;
  v71 = v35;
  v68 = v38;
  v69 = v37;
  memset(&v138, 0, sizeof(v138));
  if (v28)
    objc_msgSend(v28, "transform");
  v136[0] = 0;
  v136[1] = v136;
  v136[2] = 0x2020000000;
  v137 = 1;
  v39 = dispatch_group_create();
  dispatch_group_enter(v39);
  v40 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke;
  block[3] = &unk_1E5149038;
  v41 = v30;
  v134 = v41;
  v135 = v136;
  dispatch_group_notify(v39, MEMORY[0x1E0C80D38], block);
  if (a7 == v32)
  {
    a7 = v32;
    v42 = a8;
  }
  else
  {
    dispatch_group_enter(v39);
    v129[0] = v40;
    v129[1] = 3221225472;
    v129[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2;
    v129[3] = &unk_1E5149060;
    v130 = v28;
    v131 = a7;
    v132 = v34;
    v126[0] = v40;
    v126[1] = 3221225472;
    v126[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3;
    v126[3] = &unk_1E5149088;
    v128 = v136;
    v127 = v39;
    (*((void (**)(id, _QWORD *, _QWORD *, double))v29 + 2))(v29, v129, v126, a15 / (a7 - v32));

    v42 = a8;
  }
  if (v42 != v34)
  {
    dispatch_group_enter(v39);
    v122[0] = v40;
    v122[1] = 3221225472;
    v122[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4;
    v122[3] = &unk_1E5149060;
    v123 = v28;
    v124 = a7;
    v125 = v42;
    v119[0] = v40;
    v119[1] = 3221225472;
    v119[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5;
    v119[3] = &unk_1E5149088;
    v121 = v136;
    v120 = v39;
    (*((void (**)(id, _QWORD *, _QWORD *, double))v29 + 2))(v29, v122, v119, a16 / (v42 - v34));

  }
  v141.origin.x = a9;
  v141.origin.y = a10;
  v141.size.width = a11;
  v141.size.height = a12;
  v146.origin.y = v70;
  v146.origin.x = v71;
  v146.size.height = v68;
  v146.size.width = v69;
  if (!CGRectEqualToRect(v141, v146))
  {
    v142.origin.x = a9;
    v142.origin.y = a10;
    v142.size.width = a11;
    v142.size.height = a12;
    Width = CGRectGetWidth(v142);
    v143.origin.y = v70;
    v143.origin.x = v71;
    v143.size.height = v68;
    v143.size.width = v69;
    v44 = CGRectGetWidth(v143);
    v144.origin.x = a9;
    v144.origin.y = a10;
    v144.size.width = a11;
    v144.size.height = a12;
    Height = CGRectGetHeight(v144);
    v145.origin.y = v70;
    v145.origin.x = v71;
    v145.size.height = v68;
    v145.size.width = v69;
    v46 = Height / CGRectGetHeight(v145);
    v47 = 0.0;
    v48 = 0.0;
    if (Width / v44 != 1.0)
      v48 = a17 / (Width / v44 + -1.0);
    if (v46 != 1.0)
      v47 = a17 / (v46 + -1.0);
    v49 = (v48 + v47) * 0.5;
    dispatch_group_enter(v39);
    v113[0] = v40;
    v113[1] = 3221225472;
    v113[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6;
    v113[3] = &unk_1E51490B0;
    v114 = v28;
    v115 = a9;
    v116 = a10;
    v117 = a11;
    v118 = a12;
    v110[0] = v40;
    v110[1] = 3221225472;
    v110[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_7;
    v110[3] = &unk_1E5149088;
    v112 = v136;
    v111 = v39;
    (*((void (**)(id, _QWORD *, _QWORD *, double))v29 + 2))(v29, v113, v110, v49);

  }
  v50 = a4[1];
  *(_OWORD *)&t1.a = *a4;
  *(_OWORD *)&t1.c = v50;
  *(_OWORD *)&t1.tx = a4[2];
  t2 = v138;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v51 = *MEMORY[0x1E0C9D538];
    v107 = 0.0;
    v105 = 0.0;
    v106 = 0.0;
    v73 = v51;
    v108 = v51;
    t1 = v138;
    PXAffineTransformDecomposeTranslationScaleRotation();
    v104 = v73;
    v102 = 0.0;
    v103 = 0.0;
    v101 = 0.0;
    v52 = a4[1];
    *(_OWORD *)&t1.a = *a4;
    *(_OWORD *)&t1.c = v52;
    *(_OWORD *)&t1.tx = a4[2];
    PXAffineTransformDecomposeTranslationScaleRotation();
    if ((PXPointApproximatelyEqualToPoint() & 1) == 0)
    {
      PLUIGetLog();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        t1 = v138;
        NSStringFromCGAffineTransform(&t1);
        v54 = (id)objc_claimAutoreleasedReturnValue();
        v55 = a4[1];
        *(_OWORD *)&t1.a = *a4;
        *(_OWORD *)&t1.c = v55;
        *(_OWORD *)&t1.tx = a4[2];
        NSStringFromCGAffineTransform(&t1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(t2.a) = 138412546;
        *(_QWORD *)((char *)&t2.a + 4) = v54;
        WORD2(t2.b) = 2112;
        *(_QWORD *)((char *)&t2.b + 6) = v56;
        _os_log_impl(&dword_1A6789000, v53, OS_LOG_TYPE_DEFAULT, "animation of translational transforms is not supported (%@ => %@)", (uint8_t *)&t2, 0x16u);

      }
    }
    if (v103 != v107 || v102 != v106)
    {
      v57 = v102 / v106;
      v58 = 0.0;
      v59 = 0.0;
      if (v103 / v107 != 1.0)
        v59 = a17 / (v103 / v107 + -1.0);
      if (v57 != 1.0)
        v58 = a17 / (v57 + -1.0);
      v60 = PXFloatApproximatelyEqualToFloat();
      v61 = v60;
      v107 = v103;
      if (v60)
        v106 = v102;
      dispatch_group_enter(v39);
      v95[0] = v40;
      v95[1] = 3221225472;
      v95[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_18;
      v95[3] = &unk_1E51490D8;
      v62 = v28;
      v96 = v62;
      v97 = v108;
      v98 = v107;
      v99 = v106;
      v100 = v105;
      v92[0] = v40;
      v92[1] = 3221225472;
      v92[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2_19;
      v92[3] = &unk_1E5149088;
      v94 = v136;
      v63 = v39;
      v93 = v63;
      (*((void (**)(id, _QWORD *, _QWORD *, double))v29 + 2))(v29, v95, v92, v59);
      if ((v61 & 1) == 0)
      {
        v106 = v102;
        dispatch_group_enter(v63);
        v86[0] = v40;
        v86[1] = 3221225472;
        v86[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3_20;
        v86[3] = &unk_1E51490D8;
        v87 = v62;
        v88 = v108;
        v89 = v107;
        v90 = v106;
        v91 = v105;
        v83[0] = v40;
        v83[1] = 3221225472;
        v83[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4_21;
        v83[3] = &unk_1E5149088;
        v85 = v136;
        v84 = v63;
        (*((void (**)(id, _QWORD *, _QWORD *, double))v29 + 2))(v29, v86, v83, v58);

      }
    }
    if (v101 != v105)
    {
      v64 = v101 - v105;
      v105 = v101;
      v65 = a18 / v64;
      dispatch_group_enter(v39);
      v77[0] = v40;
      v77[1] = 3221225472;
      v77[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5_22;
      v77[3] = &unk_1E51490D8;
      v78 = v28;
      v79 = v108;
      v80 = v107;
      v81 = v106;
      v82 = v105;
      v74[0] = v40;
      v74[1] = 3221225472;
      v74[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6_23;
      v74[3] = &unk_1E5149088;
      v76 = v136;
      v75 = v39;
      (*((void (**)(id, _QWORD *, _QWORD *, double))v29 + 2))(v29, v77, v74, v65);

    }
  }
  dispatch_group_leave(v39);

  _Block_object_dispose(v136, 8);
}

+ (void)px_animateUsingDefaultDampedEaseInEaseOutWithDuration:()PhotosUICore animations:completion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a4;
  v8 = a5;
  if (px_animateUsingDefaultDampedEaseInEaseOutWithDuration_animations_completion__onceToken != -1)
    dispatch_once(&px_animateUsingDefaultDampedEaseInEaseOutWithDuration_animations_completion__onceToken, &__block_literal_global_301549);
  v9 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v10 = (void *)objc_msgSend(v9, "initWithDuration:timingParameters:", px_animateUsingDefaultDampedEaseInEaseOutWithDuration_animations_completion__timingParameters, a1);
  v11 = v10;
  if (v7)
    objc_msgSend(v10, "addAnimations:", v7);
  if (v8)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __100__UIView_PhotosUICore__px_animateUsingDefaultDampedEaseInEaseOutWithDuration_animations_completion___block_invoke_2;
    v12[3] = &unk_1E5149140;
    v13 = v8;
    objc_msgSend(v11, "addCompletion:", v12);

  }
  objc_msgSend(v11, "startAnimation");

}

+ (uint64_t)px_circularGlyphViewWithName:()PhotosUICore backgroundColor:
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "px_circularGlyphViewWithName:prefersMulticolor:backgroundColor:", a3, 0, a4);
}

+ (id)px_circularGlyphViewWithName:()PhotosUICore prefersMulticolor:backgroundColor:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;

  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationPreferringMulticolor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationByApplyingConfiguration:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageByApplyingSymbolConfiguration:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "size");
  v15 = v14;
  v17 = v16;
  v18 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTintColor:", v19);

  objc_msgSend(v18, "setFrame:", 0.0, 0.0, v15, v17);
  if ((a4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v8, "isEqual:", v20);

    if ((v21 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_tintedCircularImageWithColor:backgroundColor:", v22, v8);
      v23 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v23;
    }
  }
  objc_msgSend(v18, "setImage:", v13);

  return v18;
}

+ (id)px_contentLoadingView
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3698], "loadingConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36B0]), "initWithConfiguration:", v0);

  return v1;
}

@end
