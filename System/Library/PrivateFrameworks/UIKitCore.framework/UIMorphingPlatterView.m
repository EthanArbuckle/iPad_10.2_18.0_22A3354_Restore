@implementation UIMorphingPlatterView

void __54___UIMorphingPlatterView__prepareAnimatableProperties__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_modelUpdates");

}

void __54___UIMorphingPlatterView__prepareAnimatableProperties__block_invoke_2(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CGFloat v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id WeakRetained;
  CGRect v37;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!objc_msgSend(WeakRetained, "shouldMorphContents"))
    goto LABEL_13;
  objc_msgSend(WeakRetained, "platterWidth");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentationValue");
  v3 = v2;

  objc_msgSend(WeakRetained, "platterHeight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationValue");
  v6 = v5;

  if ((objc_msgSend(WeakRetained, "allowsElasticMorph") & 1) == 0)
  {
    if (objc_msgSend(WeakRetained, "preferredMorphingAxis") == 1)
    {
      objc_msgSend(WeakRetained, "platterHeight");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "platterWidth");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = __54___UIMorphingPlatterView__prepareAnimatableProperties__block_invoke_3(v7, v8);
LABEL_7:

      goto LABEL_8;
    }
    if (objc_msgSend(WeakRetained, "preferredMorphingAxis") == 2)
    {
      objc_msgSend(WeakRetained, "platterWidth");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "platterHeight");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = __54___UIMorphingPlatterView__prepareAnimatableProperties__block_invoke_3(v7, v8);
      goto LABEL_7;
    }
  }
LABEL_8:
  objc_msgSend(WeakRetained, "collapsedClippingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v3, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setPresentationValue:forKey:", v10, CFSTR("bounds"));

  objc_msgSend(WeakRetained, "expandedClippingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", 0.0, 0.0, v3, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setPresentationValue:forKey:", v12, CFSTR("bounds"));

  objc_msgSend(WeakRetained, "platterWidth");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentationValue");
  v15 = v14 * 0.5;
  objc_msgSend(WeakRetained, "platterHeight");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentationValue");
  v18 = v17 * 0.5;

  objc_msgSend(WeakRetained, "collapsedClippingView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v15, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setPresentationValue:forKey:", v20, CFSTR("position"));

  objc_msgSend(WeakRetained, "expandedClippingView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v15, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_setPresentationValue:forKey:", v22, CFSTR("position"));

  v37.origin.x = 0.0;
  v37.origin.y = 0.0;
  v37.size.width = v3;
  v37.size.height = v6;
  v23 = CGRectGetWidth(v37) * 0.5;
  objc_msgSend(WeakRetained, "collapsedTransformView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v23, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_setPresentationValue:forKey:", v25, CFSTR("position"));

  objc_msgSend(WeakRetained, "expandedTransformView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v23, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_setPresentationValue:forKey:", v27, CFSTR("position"));

  objc_msgSend(WeakRetained, "expansionProgress");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "presentationValue");
  v30 = v29;

  if ((objc_msgSend(WeakRetained, "alwaysCompact") & 1) == 0)
  {
    v31 = fmax(fmin(v30 / 0.65, 1.0), 0.0);
    objc_msgSend(WeakRetained, "collapsedClippingView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_setPresentationValue:forKey:", v33, CFSTR("opacity"));

    if (objc_msgSend(WeakRetained, "bothViewsAreLikelyOpaque"))
      v31 = 1.0;
    objc_msgSend(WeakRetained, "expandedClippingView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_setPresentationValue:forKey:", v35, CFSTR("opacity"));

  }
  objc_msgSend(WeakRetained, "_updateShadowsWithExpansionProgress:contentBounds:center:forPresentation:", 1, v30, 0.0, 0.0, v3, v6, v15, v18);
LABEL_13:

}

double __54___UIMorphingPlatterView__prepareAnimatableProperties__block_invoke_3(void *a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  double v6;
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
  int v17;
  double v18;
  double v19;
  double v20;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v4, "lastModelValueChangeWasPositive");
  objc_msgSend(v4, "presentationValue");
  v7 = v6;
  objc_msgSend(v4, "presentationValue");
  v9 = v8;
  objc_msgSend(v4, "value");
  v11 = v10;

  if (v9 >= v11)
    v12 = v9;
  else
    v12 = v11;
  if (v9 >= v11)
    v13 = v11;
  else
    v13 = v9;
  if (v5)
    v12 = v13;
  v14 = v7 / v12;
  objc_msgSend(v3, "value");
  v16 = v15 * v14;
  objc_msgSend(v3, "presentationValue");
  v17 = objc_msgSend(v3, "lastModelValueChangeWasPositive");
  objc_msgSend(v3, "presentationValue");
  if (v18 >= v16)
    v19 = v16;
  else
    v19 = v18;
  if (v18 < v16)
    v18 = v16;
  if (v17)
    v20 = v19;
  else
    v20 = v18;

  return v20;
}

void __43___UIMorphingPlatterView__updatePathShadow__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double x;
  double v10;
  double y;
  double v12;
  double width;
  double v14;
  double height;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  int v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  _UIPlatterSoftShadowView *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  CGRect recta;
  __int128 v89;
  __int128 v90;
  CGAffineTransform v91;
  CGAffineTransform v92;
  uint64_t v93;
  unsigned __int8 v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;

  objc_msgSend(*(id *)(a1 + 32), "pathShadowView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pathShadowView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 32), "setPathShadowView:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "collapsedPreview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "appliesShadow"))
  {
    objc_msgSend(*(id *)(a1 + 32), "collapsedPreview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "bounds");
    x = v8;
    y = v10;
    width = v12;
    height = v14;
    objc_msgSend(v5, "effectiveShadowPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");

    if (v17)
    {
      v18 = v5;
      objc_msgSend(v18, "effectiveShadowPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "visiblePath");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19 == v20 && (objc_msgSend(v19, "_isRoundedRect") & 1) != 0)
      {
        objc_msgSend(v19, "_cornerRadius");
        v22 = v21;

        if (v22 <= 20.0)
          goto LABEL_8;
      }
      else
      {

      }
LABEL_13:
      objc_msgSend(v5, "effectiveShadowPath");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visiblePath");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31 == v32)
      {
        objc_msgSend(v17, "bounds");
        v34 = v33;
        v36 = v35;
        v38 = v37;
        v40 = v39;
        CGAffineTransformMakeTranslation(&v92, -v33, -v35);
        objc_msgSend(v17, "applyTransform:", &v92);
        v95.origin.x = v34;
        v95.origin.y = v36;
        v95.size.width = v38;
        v95.size.height = v40;
        v96 = CGRectOffset(v95, v34, v36);
        x = v96.origin.x;
        y = v96.origin.y;
        width = v96.size.width;
        height = v96.size.height;
      }
      objc_msgSend(v17, "bounds");
      if (!CGRectIsEmpty(v97))
      {
        objc_msgSend(*(id *)(a1 + 32), "shadowSettings");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          v42 = objc_msgSend(objc_retainAutorelease(v17), "CGPath");
          objc_msgSend(*(id *)(a1 + 32), "layer");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setShadowPath:", v42);

          objc_msgSend(*(id *)(a1 + 32), "shadowSettings");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "shadowColor");
          v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v46 = objc_msgSend(v45, "CGColor");
          objc_msgSend(*(id *)(a1 + 32), "layer");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setShadowColor:", v46);

          objc_msgSend(*(id *)(a1 + 32), "shadowSettings");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "shadowOffset");
          v50 = v49;
          v52 = v51;
          objc_msgSend(*(id *)(a1 + 32), "layer");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setShadowOffset:", v50, v52);

          objc_msgSend(*(id *)(a1 + 32), "shadowSettings");
          v54 = (_UIPlatterSoftShadowView *)objc_claimAutoreleasedReturnValue();
          -[_UIPlatterSoftShadowView shadowRadius](v54, "shadowRadius");
          v56 = v55;
          objc_msgSend(*(id *)(a1 + 32), "layer");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setShadowRadius:", v56);
        }
        else
        {
          v54 = -[_UIPlatterSoftShadowView initWithFrame:shadowPath:]([_UIPlatterSoftShadowView alloc], "initWithFrame:shadowPath:", v17, x, y, width, height);
          objc_msgSend(*(id *)(a1 + 32), "collapsedPreview");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "size");
          v60 = v59 * 0.5;
          objc_msgSend(*(id *)(a1 + 32), "collapsedPreview");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "size");
          v63 = v62 * 0.5;

          v98.origin.x = x;
          v98.origin.y = y;
          v98.size.width = width;
          v98.size.height = height;
          v64 = v60 / CGRectGetWidth(v98);
          v99.origin.x = x;
          v99.origin.y = y;
          v99.size.width = width;
          v99.size.height = height;
          v65 = v63 / CGRectGetHeight(v99);
          -[UIView layer](v54, "layer");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "setAnchorPoint:", v64, v65);

          -[UIView bounds](v54, "bounds");
          v68 = v67;
          recta.origin.x = v67;
          recta.origin.y = v69;
          v71 = v70;
          v73 = v72;
          objc_msgSend(*(id *)(a1 + 32), "bounds");
          v74 = v100.origin.x;
          v75 = v100.origin.y;
          v76 = v100.size.width;
          v77 = v100.size.height;
          v78 = CGRectGetWidth(v100);
          v101.origin.x = v68;
          v101.origin.y = v71;
          v101.size.width = v73;
          v101.size.height = recta.origin.y;
          v79 = v78 / CGRectGetWidth(v101);
          v102.origin.x = v74;
          v102.origin.y = v75;
          v102.size.width = v76;
          v102.size.height = v77;
          v80 = CGRectGetHeight(v102);
          v103.origin.x = recta.origin.x;
          v103.origin.y = v71;
          v103.size.width = v73;
          v103.size.height = recta.origin.y;
          v81 = CGRectGetHeight(v103);
          CGAffineTransformMakeScale(&v91, v79, v80 / v81);
          recta.size = *(CGSize *)&v91.a;
          v89 = *(_OWORD *)&v91.c;
          v90 = *(_OWORD *)&v91.tx;
          -[UIView setTransform:](v54, "setTransform:", &recta.size);
          objc_msgSend(*(id *)(a1 + 32), "bounds");
          -[UIView setCenter:](v54, "setCenter:", v83 + v82 * 0.5, v85 + v84 * 0.5);
          if (objc_msgSend(v5, "_previewMode") == 5)
          {
            -[_UIPlatterSoftShadowView setNeedsPunchOut:](v54, "setNeedsPunchOut:", 0);
          }
          else
          {
            objc_msgSend(v5, "backgroundColor");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIPlatterSoftShadowView setNeedsPunchOut:](v54, "setNeedsPunchOut:", objc_msgSend(v86, "_isOpaque") ^ 1);

          }
          objc_msgSend(*(id *)(a1 + 32), "insertSubview:atIndex:", v54, 0);
          objc_msgSend(*(id *)(a1 + 32), "setPathShadowView:", v54);
          if (*(_BYTE *)(a1 + 40))
            v87 = 0.0;
          else
            v87 = 1.0;
          objc_msgSend(*(id *)(a1 + 32), "pathShadowView");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setAlpha:", v87);
        }

      }
      goto LABEL_27;
    }
LABEL_8:
    v94 = 0;
    v93 = 0;
    v23 = objc_msgSend(*(id *)(a1 + 32), "alwaysCompact");
    v24 = *(void **)(a1 + 32);
    if (v23)
      objc_msgSend(v24, "_expandedCornerRadius:maskedCorners:ignoreLiftScale:", &v94, &v93, 1);
    else
      objc_msgSend(v24, "_collapsedCornerRadius:maskedCorners:", &v94, &v93);
    v26 = v25;
    objc_msgSend(*(id *)(a1 + 32), "collapsedPreview");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "size");
    +[UIBezierPath _roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:](UIBezierPath, "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", v93, 16, v94, 0.0, 0.0, v28, v29, v26);
    v30 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v30;
    goto LABEL_13;
  }
LABEL_27:

}

uint64_t __64___UIMorphingPlatterView__installShadowViewForStyleIfNecessary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertSubview:atIndex:", *(_QWORD *)(a1 + 40), 0);
}

void __99___UIMorphingPlatterView__updateShadowsWithExpansionProgress_contentBounds_center_forPresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v5 = a2;
  objc_msgSend(v22, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = objc_msgSend(v5, "integerValue");

  if (v14 == 3)
  {
    v7 = *(double *)(a1 + 40);
    v9 = *(double *)(a1 + 48);
    v11 = *(double *)(a1 + 56);
    v13 = *(double *)(a1 + 64);
  }
  else if (v14 == 2)
  {
    objc_msgSend(v22, "frameWithContentWithFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    v11 = v15;
    v13 = v16;
    v9 = 0.0;
    v7 = 0.0;
  }
  if (v14 == objc_msgSend(*(id *)(a1 + 32), "expandedShadowStyle"))
  {
    v17 = (double *)(a1 + 72);
  }
  else
  {
    if (v14 != objc_msgSend(*(id *)(a1 + 32), "collapsedShadowStyle"))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "expanded"))
        v18 = 1.0 - *(double *)(a1 + 88);
      else
        v18 = *(double *)(a1 + 88);
      goto LABEL_13;
    }
    v17 = (double *)(a1 + 80);
  }
  v18 = *v17;
LABEL_13:
  if (*(_BYTE *)(a1 + 112))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v7, v9, v11, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_setPresentationValue:forKey:", v19, CFSTR("bounds"));

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", *(double *)(a1 + 96), *(double *)(a1 + 104));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_setPresentationValue:forKey:", v20, CFSTR("position"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_setPresentationValue:forKey:", v21, CFSTR("opacity"));

  }
  else
  {
    objc_msgSend(v22, "setBounds:", v7, v9, v11, v13);
    objc_msgSend(v22, "setCenter:", *(double *)(a1 + 96), *(double *)(a1 + 104));
    objc_msgSend(v22, "setAlpha:", v18);
  }

}

@end
