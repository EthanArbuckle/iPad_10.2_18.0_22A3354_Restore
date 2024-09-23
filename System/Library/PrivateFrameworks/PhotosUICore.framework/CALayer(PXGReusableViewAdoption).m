@implementation CALayer(PXGReusableViewAdoption)

- (void)pxg_addToScrollViewController:()PXGReusableViewAdoption
{
  uint64_t v4;
  id v5;

  v4 = _PXGDisabledLayerActions_onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&_PXGDisabledLayerActions_onceToken, &__block_literal_global_424);
  objc_msgSend(a1, "setActions:", _PXGDisabledLayerActions_disabledActions);
  objc_msgSend(a1, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  objc_msgSend(v5, "addFloatingSublayer:forAxis:", a1, 1);

}

- (uint64_t)pxg_isChildOfScrollViewController:()PXGReusableViewAdoption
{
  return objc_msgSend(a3, "isFloatingSublayer:", a1);
}

- (void)pxg_addToHostingView:()PXGReusableViewAdoption
{
  uint64_t v4;
  id v5;

  v4 = _PXGDisabledLayerActions_onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&_PXGDisabledLayerActions_onceToken, &__block_literal_global_424);
  objc_msgSend(a1, "setActions:", _PXGDisabledLayerActions_disabledActions);
  objc_msgSend(a1, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  objc_msgSend(v5, "addHostedLayer:", a1);

}

- (void)pxg_insertIntoView:()PXGReusableViewAdoption atIndex:
{
  id v6;

  objc_msgSend(a3, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSublayer:atIndex:", a1, a4);

}

- (BOOL)pxg_isChildOfView:()PXGReusableViewAdoption
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "superlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 == v6;
}

- (BOOL)pxg_hasSuperview
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "superlayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)pxg_becomeReusable
{
  __int128 v2;
  double v3;
  double v4;
  double v5;
  double v6;
  _OWORD v8[3];

  objc_msgSend(a1, "setHidden:", 1);
  objc_msgSend(a1, "setContents:", 0);
  objc_msgSend(a1, "setDelegate:", 0);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v2;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(a1, "setAffineTransform:", v8);
  v3 = *(double *)off_1E50B86D0;
  v4 = *((double *)off_1E50B86D0 + 1);
  v5 = *((double *)off_1E50B86D0 + 2);
  v6 = *((double *)off_1E50B86D0 + 3);
  objc_msgSend(a1, "setContentsRect:", *(double *)off_1E50B86D0, v4, v5, v6);
  return objc_msgSend(a1, "setContentsCenter:", v3, v4, v5, v6);
}

- (uint64_t)pxg_prepareForReuse
{
  return objc_msgSend(a1, "setHidden:", 0);
}

- (void)pxg_configureWithTexture:()PXGReusableViewAdoption geometry:info:style:textureInfo:resizableCapInsets:reusableViewInfo:screenScale:separateLayers:
{
  id v21;
  id v22;
  double v23;
  double v24;
  float v25;
  float v26;
  id v27;
  void *v28;
  uint64_t v29;
  double v30;
  float v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v37;
  double v38;
  double v39;
  float v40;
  double v41;
  float v42;
  float v43;
  float v44;
  float v45;
  uint64_t v46;
  unint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  CGImage *v67;
  double v68;
  double v69;
  double v70;
  float v72;
  float64x2_t v73;
  CGAffineTransform v74;
  CGAffineTransform v75;
  CGAffineTransform v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  v21 = a8;
  v22 = a13;
  v24 = *(double *)a9;
  v23 = *(double *)(a9 + 8);
  LODWORD(v72) = *(_QWORD *)(a9 + 24);
  LODWORD(v25) = HIDWORD(*(_QWORD *)(a9 + 24));
  objc_opt_class();
  v26 = 1.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = v21;
    objc_msgSend(a1, "contents");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "imageRef");

    if (v28 != (void *)v29)
      objc_msgSend(a1, "setContents:", objc_msgSend(v27, "imageRef"));
    objc_msgSend(a1, "contentsScale");
    if (v30 != a6)
      objc_msgSend(a1, "setContentsScale:", a6);
    objc_msgSend(v27, "alpha");
    v26 = v31;

  }
  v69 = a6;
  v32 = v72;
  v33 = v25;
  objc_msgSend(a1, "position", *(_QWORD *)&v69);
  if (v35 != v24 || v34 != v23)
    objc_msgSend(a1, "setPosition:", v24, v23);
  objc_msgSend(a1, "bounds");
  v80.origin.x = 0.0;
  v80.origin.y = 0.0;
  v80.size.width = v72;
  v80.size.height = v33;
  if (!CGRectEqualToRect(v77, v80))
    objc_msgSend(a1, "setBounds:", 0.0, 0.0, v32, v33);
  v37 = -*(double *)(a9 + 16);
  objc_msgSend(a1, "zPosition");
  if (v38 != v37)
    objc_msgSend(a1, "setZPosition:", v37);
  objc_msgSend(a1, "opacity");
  if (*(float *)&v39 != a11->f32[0])
  {
    *(float *)&v39 = v26 * a11->f32[0];
    objc_msgSend(a1, "setOpacity:", v39);
  }
  v40 = fmaxf(fmaxf(a11[4].f32[1], a11[5].f32[0]), fmaxf(a11[5].f32[1], a11[6].f32[0]));
  objc_msgSend(a1, "cornerRadius");
  if (v41 != v40)
  {
    objc_msgSend(a1, "setCornerRadius:", v40);
    objc_msgSend(a1, "setMasksToBounds:", v40 != 0.0);
  }
  v43 = a11[4].f32[1];
  v42 = a11[5].f32[0];
  v45 = a11[5].f32[1];
  v44 = a11[6].f32[0];
  if (fmaxf(fmaxf(v43, v42), fmaxf(v45, v44)) == 0.0)
  {
    v47 = 15;
  }
  else
  {
    v46 = 15;
    if (v43 == 0.0)
      v46 = 14;
    if (v42 == 0.0)
      v46 &= ~2uLL;
    if (v45 == 0.0)
      v47 = v46 & 0xFFFFFFFFFFFFFFFBLL;
    else
      v47 = v46;
    if (v44 == 0.0)
      v47 &= 7u;
  }
  if (objc_msgSend(a1, "maskedCorners") != v47)
    objc_msgSend(a1, "setMaskedCorners:", v47);
  v73 = vcvtq_f64_f32(a11[9]);
  objc_msgSend(a1, "anchorPoint");
  if (v49 != v73.f64[0] || v48 != v73.f64[1])
    objc_msgSend(a1, "setAnchorPoint:", *(_OWORD *)&v73, v48);
  objc_msgSend(v22, "rotation");
  v50 = a11[7].f32[0];
  if (v51 != v50)
  {
    v52 = a11[7].f32[1];
LABEL_40:
    memset(&v76, 0, sizeof(v76));
    CGAffineTransformMakeScale(&v75, v52, v52);
    CGAffineTransformRotate(&v76, &v75, v50);
    v74 = v76;
    objc_msgSend(a1, "setAffineTransform:", &v74);
    objc_msgSend(a1, "setAllowsEdgeAntialiasing:", a11[7].f32[0] != 0.0);
    objc_msgSend(v22, "setRotation:", a11[7].f32[0]);
    objc_msgSend(v22, "setScale:", a11[7].f32[1]);
    goto LABEL_41;
  }
  objc_msgSend(v22, "scale");
  v54 = v53;
  v52 = a11[7].f32[1];
  if (v54 != v52)
  {
    v50 = a11[7].f32[0];
    goto LABEL_40;
  }
LABEL_41:
  if (a2 == *(float *)off_1E50B8290
    && a3 == *((float *)off_1E50B8290 + 1)
    && a4 == *((float *)off_1E50B8290 + 2)
    && a5 == *((float *)off_1E50B8290 + 3))
  {
    PXRectDenormalize();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v21, "pixelSize");
    PXRectWithAspectRatioFittingRect();
    PXRectNormalize();
    v56 = v55;
    v58 = v57;
    v60 = v59;
    v62 = v61;
    objc_msgSend(a1, "contentsRect");
    v81.origin.x = v56;
    v81.origin.y = v58;
    v81.size.width = v60;
    v81.size.height = v62;
    if (!CGRectEqualToRect(v78, v81))
    {
      objc_msgSend(a1, "setContentsRect:", v56, v58, v60, v62);
      v63 = *(double *)off_1E50B86D0;
      v64 = *((double *)off_1E50B86D0 + 1);
      v65 = *((double *)off_1E50B86D0 + 2);
      v66 = *((double *)off_1E50B86D0 + 3);
LABEL_53:
      objc_msgSend(a1, "setContentsCenter:", v63, v64, v65, v66);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v67 = (CGImage *)objc_msgSend(v21, "imageRef");
      v32 = (double)CGImageGetWidth(v67) / v70;
      v33 = (double)CGImageGetHeight(v67) / v70;
    }
    v68 = a5;
    v63 = a3 / v32;
    v64 = a2 / v33;
    v65 = (v32 - v68 - a3) / v32;
    v66 = (v33 - a4 - a2) / v33;
    objc_msgSend(a1, "contentsCenter");
    v82.origin.x = v63;
    v82.origin.y = v64;
    v82.size.width = v65;
    v82.size.height = v66;
    if (!CGRectEqualToRect(v79, v82))
    {
      objc_msgSend(a1, "setContentsRect:", *(double *)off_1E50B86D0, *((double *)off_1E50B86D0 + 1), *((double *)off_1E50B86D0 + 2), *((double *)off_1E50B86D0 + 3));
      goto LABEL_53;
    }
  }

}

- (uint64_t)pxg_shiftPosition:()PXGReusableViewAdoption
{
  uint64_t result;

  result = objc_msgSend(a1, "isFloating");
  if ((result & 1) == 0)
  {
    objc_msgSend(a1, "position");
    PXPointAdd();
    return objc_msgSend(a1, "setPosition:");
  }
  return result;
}

- (uint64_t)shouldReuseWhenInvisible
{
  return 0;
}

- (uint64_t)shouldReloadForUserData:()PXGReusableViewAdoption
{
  return 0;
}

- (uint64_t)isFloating
{
  return 0;
}

@end
