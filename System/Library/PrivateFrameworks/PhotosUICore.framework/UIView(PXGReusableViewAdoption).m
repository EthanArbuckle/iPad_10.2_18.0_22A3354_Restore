@implementation UIView(PXGReusableViewAdoption)

- (BOOL)pxg_hasSuperview
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)shouldReloadForUserData:()PXGReusableViewAdoption
{
  return 0;
}

- (void)pxg_configureWithTexture:()PXGReusableViewAdoption geometry:info:style:textureInfo:resizableCapInsets:reusableViewInfo:screenScale:separateLayers:
{
  id v13;
  id v14;
  id v15;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  float v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  _BOOL8 v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  float v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  float v75;
  float v76;
  float v77;
  float v78;
  uint64_t v79;
  unint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  objc_class *v85;
  void *v86;
  void *v87;
  void *v88;
  objc_class *v89;
  void *v90;
  objc_class *v91;
  void *v92;
  float64x2_t v93;
  CGAffineTransform v94;
  CGAffineTransform v95;
  CGAffineTransform v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  v13 = a3;
  v14 = a8;
  v15 = a1;
  PXRectWithCenterAndSize();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = -*(double *)(a4 + 16);
  if (!v13)
    goto LABEL_9;
  v25 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = (objc_class *)objc_opt_class();
    NSStringFromClass(v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "px_descriptionForAssertionMessage");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("PXGViewRenderer.m"), 972, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("texture"), v86, v87);

  }
  objc_msgSend(v25, "payload");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = (objc_class *)objc_opt_class();
    NSStringFromClass(v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("PXGViewRenderer.m"), 973, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("payloadTexture.payload"), v90);
LABEL_54:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = (objc_class *)objc_opt_class();
    NSStringFromClass(v91);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "px_descriptionForAssertionMessage");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("PXGViewRenderer.m"), 973, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("payloadTexture.payload"), v90, v92);

    goto LABEL_54;
  }
LABEL_6:
  objc_msgSend(v15, "userData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "userData");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27 != v28)
  {
    objc_msgSend(v26, "userData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUserData:", v29);

  }
LABEL_9:
  objc_msgSend(v15, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "zPosition");
  v32 = v31;

  if (v32 != v24)
  {
    objc_msgSend(v15, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setZPosition:", v24);

  }
  objc_msgSend(v15, "_outermostLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "zPosition");
  v36 = v35;

  if (v36 != v24)
  {
    objc_msgSend(v15, "_outermostLayer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setZPosition:", v24);

  }
  objc_msgSend(v15, "alpha");
  v38 = a6->f32[0];
  if (v39 != a6->f32[0])
  {
    objc_msgSend(v15, "setAlpha:");
    v38 = a6->f32[0];
  }
  if (objc_msgSend(v15, "isHidden") != (v38 == 0.0))
    objc_msgSend(v15, "setHidden:", v38 == 0.0);
  PXRectGetCenter();
  v41 = v40;
  v43 = v42;
  objc_msgSend(v15, "center");
  if (v41 != v45 || v43 != v44)
    objc_msgSend(v15, "setCenter:", v41, v43);
  objc_msgSend(v15, "bounds");
  if (v21 != v48 || v23 != v47)
    objc_msgSend(v15, "setBounds:", 0.0, 0.0, v21, v23);
  v93 = vcvtq_f64_f32(a6[9]);
  objc_msgSend(v15, "layer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "anchorPoint");
  v51 = v50;
  v53 = v52;

  if (v51 != v93.f64[0] || v53 != v93.f64[1])
  {
    objc_msgSend(v15, "layer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setAnchorPoint:", *(_OWORD *)&v93);

  }
  objc_msgSend(v14, "rotation");
  v55 = a6[7].f32[0];
  if (v56 == v55)
  {
    objc_msgSend(v14, "scale");
    v59 = v58;
    v57 = a6[7].f32[1];
    if (v59 == v57)
      goto LABEL_33;
    v55 = a6[7].f32[0];
  }
  else
  {
    v57 = a6[7].f32[1];
  }
  memset(&v96, 0, sizeof(v96));
  CGAffineTransformMakeScale(&v95, v57, v57);
  CGAffineTransformRotate(&v96, &v95, v55);
  v94 = v96;
  objc_msgSend(v15, "setTransform:", &v94);
  v60 = a6[7].f32[0] != 0.0;
  objc_msgSend(v15, "layer");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setAllowsEdgeAntialiasing:", v60);

  objc_msgSend(v14, "setRotation:", a6[7].f32[0]);
  objc_msgSend(v14, "setScale:", a6[7].f32[1]);
LABEL_33:
  v62 = a6[2].f32[1];
  v63 = a6[3].f32[0];
  v64 = a6[3].f32[1];
  v65 = a6[4].f32[0];
  v97.origin.x = v62;
  v97.origin.y = v63;
  v97.size.width = v64;
  v97.size.height = v65;
  v99.origin.x = v17;
  v99.origin.y = v19;
  v99.size.width = v21;
  v99.size.height = v23;
  if (CGRectContainsRect(v97, v99))
  {
    v66 = *MEMORY[0x1E0C9D5E0];
    v67 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v68 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v69 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  }
  else
  {
    v98.origin.x = v62;
    v98.origin.y = v63;
    v98.size.width = v64;
    v98.size.height = v65;
    *(CGRect *)&v66 = CGRectOffset(v98, -v17, -v19);
  }
  objc_msgSend(v15, "setClippingRect:", v66, v67, v68, v69);
  v70 = fmaxf(fmaxf(a6[4].f32[1], a6[5].f32[0]), fmaxf(a6[5].f32[1], a6[6].f32[0]));
  objc_msgSend(v15, "layer");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "cornerRadius");
  v73 = v72;

  if (v73 != v70)
  {
    objc_msgSend(v15, "layer");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setCornerRadius:", v70);

    objc_msgSend(v15, "setClipsToBounds:", v70 != 0.0);
  }
  v76 = a6[4].f32[1];
  v75 = a6[5].f32[0];
  v78 = a6[5].f32[1];
  v77 = a6[6].f32[0];
  if (fmaxf(fmaxf(v76, v75), fmaxf(v78, v77)) == 0.0)
  {
    v80 = 15;
  }
  else
  {
    v79 = 15;
    if (v76 == 0.0)
      v79 = 14;
    if (v75 == 0.0)
      v79 &= ~2uLL;
    if (v78 == 0.0)
      v80 = v79 & 0xFFFFFFFFFFFFFFFBLL;
    else
      v80 = v79;
    if (v77 == 0.0)
      v80 &= 7u;
  }
  objc_msgSend(v15, "layer");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "maskedCorners");

  if (v82 != v80)
  {
    objc_msgSend(v15, "layer");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setMaskedCorners:", v80);

  }
}

- (void)pxg_addToScrollViewController:()PXGReusableViewAdoption
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *MEMORY[0x1E0CD2A68];
  v6 = a3;
  objc_msgSend(a1, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerCurve:", v4);

  objc_msgSend(v6, "addSubview:", a1);
}

- (uint64_t)pxg_isChildOfScrollViewController:()PXGReusableViewAdoption
{
  return objc_msgSend(a3, "isSubview:", a1);
}

- (void)pxg_addToHostingView:()PXGReusableViewAdoption
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *MEMORY[0x1E0CD2A68];
  v6 = a3;
  objc_msgSend(a1, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerCurve:", v4);

  objc_msgSend(v6, "addHostedView:", a1);
}

- (uint64_t)pxg_insertIntoView:()PXGReusableViewAdoption atIndex:
{
  return objc_msgSend(a3, "insertSubview:atIndex:", a1);
}

- (BOOL)pxg_isChildOfView:()PXGReusableViewAdoption
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "superview");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (void)pxg_becomeReusable
{
  __int128 v2;
  id v3;
  _OWORD v4[3];

  objc_msgSend(a1, "setHidden:", 1);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(a1, "setTransform:", v4);
  v3 = a1;
  objc_msgSend(v3, "setUserData:", 0);
  objc_msgSend(v3, "becomeReusable");

}

- (uint64_t)pxg_prepareForReuse
{
  objc_msgSend(a1, "setHidden:", 0);
  return objc_msgSend(a1, "prepareForReuse");
}

- (uint64_t)pxg_shiftPosition:()PXGReusableViewAdoption
{
  uint64_t result;

  result = objc_msgSend(a1, "isFloating");
  if ((result & 1) == 0)
  {
    objc_msgSend(a1, "center");
    PXPointAdd();
    return objc_msgSend(a1, "setCenter:");
  }
  return result;
}

- (uint64_t)shouldReuseWhenInvisible
{
  return 0;
}

- (uint64_t)isFloating
{
  return 0;
}

@end
