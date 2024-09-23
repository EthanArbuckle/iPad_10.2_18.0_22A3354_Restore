@implementation UIFlocker

void __21___UIFlocker_install__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  double (**v20)(_QWORD, _QWORD, _QWORD, double, double);
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int HaveAllBeenCommitted;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _OWORD v85[3];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;

  v3 = a2;
  v87 = 0u;
  v88 = 0u;
  v86 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  objc_msgSend(v5, "size");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v5, "target");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "center");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v5, "target");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "container");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v6;
  objc_msgSend(v16, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v18, "userInterfaceIdiom"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "convertPointBetweenViews");
  v20 = (double (**)(_QWORD, _QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = ((double (**)(_QWORD, id, id, double, double))v20)[2](v20, v16, v17, v12, v14);
    v23 = v22;
    goto LABEL_25;
  }
  v80 = v15;
  v24 = v16;
  v25 = v17;
  objc_msgSend(v24, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v25;
  objc_msgSend(v25, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v26;
  objc_msgSend(v26, "presentationLayer");
  v28 = objc_claimAutoreleasedReturnValue();
  v81 = v27;
  if (v28)
  {
    v29 = (void *)v28;
    objc_msgSend(v27, "presentationLayer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30 || (_UILayerAncestorsHaveAllBeenCommitted(v26) & 1) == 0)
    {

      goto LABEL_9;
    }
    v76 = v24;
    HaveAllBeenCommitted = _UILayerAncestorsHaveAllBeenCommitted(v81);

    if (HaveAllBeenCommitted)
    {
      objc_msgSend(v26, "presentationLayer");
      v32 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v81, "presentationLayer");
      v29 = v81;
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = (void *)v32;
      v24 = v76;
LABEL_9:

      goto LABEL_10;
    }
    v24 = v76;
  }
LABEL_10:
  objc_msgSend(v24, "_window");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "_window");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "windowScene");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "windowScene");
  v36 = objc_claimAutoreleasedReturnValue();
  v78 = v35;
  v79 = v33;
  if (v33 == v34)
  {
    v50 = v81;
    v49 = v82;
    v51 = a1;
    v52 = v34;
    v53 = (void *)v36;
    objc_msgSend(v82, "convertPoint:toLayer:", v81, v12, v14);
    v48 = v53;
    v34 = v52;
    a1 = v51;
    v21 = v54;
    v23 = v55;
    goto LABEL_24;
  }
  v77 = v24;
  if (!v36 || !v35 || v35 == (void *)v36)
  {
    objc_msgSend(v33, "layer", v36);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v56;
    objc_msgSend(v56, "presentationLayer");
    v58 = objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      v59 = (void *)v58;
      objc_msgSend(v57, "presentationLayer");
      v60 = v57;
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v61)
      {
        v64 = v74;
        v24 = v77;
        v49 = v82;
        v57 = v60;
        goto LABEL_23;
      }
      objc_msgSend(v74, "presentationLayer");
      v62 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v60, "presentationLayer");
      v63 = objc_claimAutoreleasedReturnValue();

      v64 = (void *)v62;
      v57 = (void *)v63;
      v24 = v77;
    }
    else
    {
      v64 = v56;
      v24 = v77;
    }
    v49 = v82;
LABEL_23:
    v75 = v64;
    objc_msgSend(v49, "convertPoint:toLayer:", v12, v14);
    v50 = v81;
    objc_msgSend(v81, "convertPoint:fromLayer:", v57);
    v21 = v65;
    v23 = v66;

    v48 = v73;
    goto LABEL_24;
  }
  v37 = (void *)v36;
  objc_msgSend(v35, "screen");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "fixedCoordinateSpace");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "convertPoint:fromCoordinateSpace:", v77, v12, v14);
  v41 = v40;
  v43 = v42;

  objc_msgSend(v37, "screen");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "fixedCoordinateSpace");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "convertPoint:fromCoordinateSpace:", v45, v41, v43);
  v21 = v46;
  v23 = v47;

  v24 = v77;
  v48 = v37;
  v50 = v81;
  v49 = v82;
LABEL_24:

  v15 = v80;
LABEL_25:

  objc_msgSend(v5, "target");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v67;
  if (v67)
  {
    objc_msgSend(v67, "transform");
  }
  else
  {
    v90 = 0u;
    v91 = 0u;
    v89 = 0u;
  }
  v86 = v89;
  v87 = v90;
  v88 = v91;

  objc_msgSend(v5, "view");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setCollapsedShadowStyle:", 0);
  objc_msgSend(v69, "setExpandedShadowStyle:", 1);
  objc_msgSend(v69, "setBounds:", 0.0, 0.0, v8, v10);
  -[UIView _setCenter3D:](v69, v21, v23, 0.0);
  v85[0] = v86;
  v85[1] = v87;
  v85[2] = v88;
  objc_msgSend(v69, "setTransform:", v85);
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "insertSubview:belowSubview:", v69, *(_QWORD *)(a1 + 40));

  objc_msgSend(v69, "setNeedsLayout");
  objc_msgSend(v69, "layoutIfNeeded");
  v71 = *(void **)(a1 + 32);
  objc_msgSend(v69, "collapsedPreview");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "_installGhostPortalForPreview:", v72);

}

uint64_t __19___UIFlocker_flock__block_invoke(_QWORD *a1)
{
  _QWORD v3[7];
  CAFrameRateRange v4;

  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __19___UIFlocker_flock__block_invoke_2;
  v3[3] = &unk_1E16B4E70;
  v3[4] = a1[4];
  v3[5] = a1[5];
  v3[6] = a1[6];
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

void __19___UIFlocker_flock__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  void *v43;
  double v44;
  double v45;
  unint64_t v46;
  unsigned int v47;
  double v48;
  void *v49;
  void *v50;
  uint64_t v51;
  unint64_t v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  void *v65;
  unint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  unint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i;
  void *v76;
  uint64_t v77;
  id v78;
  id v79;
  __int128 v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  _OWORD v86[3];
  _QWORD v87[4];
  id v88;
  uint64_t v89;
  id v90;
  BOOL v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _OWORD v96[3];
  _OWORD v97[3];
  _OWORD v98[3];
  _OWORD v99[3];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_primaryPlatterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExpandedShadowIntensity:", *(double *)(a1 + 40));
  objc_msgSend(v2, "setExpanded:", 1);
  objc_msgSend(v2, "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v81 = v4;
  v82 = v5;
  v7 = v6;
  v84 = v8;
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeAreaInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v9, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "verticalSizeClass");

  if (v19 == 1)
  {
    v20 = v11;
  }
  else
  {
    v17 = v17 + 0.0;
    v15 = v15 + 20.0;
    v13 = v13 + 0.0;
    v20 = v11 + 20.0;
  }
  v21 = v9;
  objc_msgSend(v21, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "userInterfaceIdiom");

  _UIContextMenuGetPlatformMetrics(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIViewController _horizontalContentMarginForView:](UIViewController, "_horizontalContentMarginForView:", v21);
  v26 = v25;
  objc_msgSend(v24, "contentSpacingForContainer");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
    v26 = (*(double (**)(uint64_t, id))(v27 + 16))(v27, v21);

  v29 = fmax(v20, 20.0);
  v30 = fmax(v13, v26);

  v31 = v82 - (v30 + fmax(v17, v26));
  v32 = v84 - (fmax(v15, 20.0) + v29);

  objc_msgSend(v2, "traitCollection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "userInterfaceIdiom");

  LODWORD(v33) = objc_msgSend(*(id *)(a1 + 32), "settings") & 1;
  objc_msgSend(v2, "bounds");
  v85 = v81 + v30;
  v35 = v7 + v29;
  v36 = v7 + v29;
  v37 = v31;
  v38 = v32;
  _randomPlatterTransform((uint64_t)v99, 0, (int)v33, v34, v39, v40, v41, v42, v85, v36, v31, v32);
  v98[0] = v99[0];
  v98[1] = v99[1];
  v98[2] = v99[2];
  objc_msgSend(v2, "setTransform:", v98);
  objc_msgSend(v2, "layer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "zPosition");
  v45 = v44;

  v46 = objc_msgSend(*(id *)(a1 + 32), "itemCount");
  v47 = 5;
  if (v46 < 5)
    v47 = v46;
  v48 = (double)(v47 >> 1) * 3.0;
  if (v45 > 0.0)
  {
    objc_msgSend(v2, "layer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setZPosition:", v45 + v48);

  }
  objc_msgSend(*(id *)(a1 + 32), "secondaryPlatterViews");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "count");

  if (v51)
  {
    v52 = 0;
    v53 = 0;
    v83 = v45 - v48;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "secondaryPlatterViews");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectAtIndexedSubscript:", v52);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "view");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v56, "setExpandedShadowIntensity:", *(double *)(a1 + 40));
      objc_msgSend(v56, "setExpanded:", 1);
      objc_msgSend(v2, "center");
      objc_msgSend(v56, "setCenter:");
      objc_msgSend(v56, "bounds");
      v58 = v57;
      v60 = v59;
      v62 = v61;
      v64 = v63;
      objc_msgSend(v56, "traitCollection");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      _randomPlatterTransform((uint64_t)v97, 1, 1, objc_msgSend(v65, "userInterfaceIdiom"), v58, v60, v62, v64, v85, v35, v37, v38);
      v96[0] = v97[0];
      v96[1] = v97[1];
      v96[2] = v97[2];
      objc_msgSend(v56, "setTransform:", v96);

      v66 = *(_QWORD *)(a1 + 48);
      if (v66 < 6 || v52 < 3 || v66 - 2 <= v52)
      {
        objc_msgSend(v56, "layoutIfNeeded");
        if (v45 > 0.0)
        {
          objc_msgSend(v56, "layer");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setZPosition:", v83 + (double)v53 * 3.0);

        }
        ++v53;
      }
      else
      {
        objc_msgSend(v56, "setAlpha:", 0.0);
        if (v45 > 0.0)
        {
          objc_msgSend(v56, "layer");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setZPosition:", v45);

        }
      }

      ++v52;
      objc_msgSend(*(id *)(a1 + 32), "secondaryPlatterViews");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "count");

    }
    while (v70 > v52);
  }
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "ghostPortals");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v93;
    do
    {
      for (i = 0; i != v73; ++i)
      {
        if (*(_QWORD *)v93 != v74)
          objc_enumerationMutation(v71);
        objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * i), "setAlpha:", 0.5);
      }
      v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
    }
    while (v73);
  }

  objc_msgSend(*(id *)(a1 + 32), "badge");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __19___UIFlocker_flock__block_invoke_3;
  v87[3] = &unk_1E16B4030;
  v77 = *(_QWORD *)(a1 + 32);
  v88 = v76;
  v89 = v77;
  v91 = v45 > 0.0;
  v90 = v2;
  v78 = v2;
  v79 = v76;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v87);
  v80 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v86[0] = *MEMORY[0x1E0C9BAA8];
  v86[1] = v80;
  v86[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v79, "setTransform:", v86);
  objc_msgSend(v79, "setAlpha:", 1.0);

}

void __19___UIFlocker_flock__block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  id v27;

  objc_msgSend(*(id *)(a1 + 40), "_badgeCenter");
  objc_msgSend(*(id *)(a1 + 32), "setCenter:");
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 48), "layer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "zPosition");
    v4 = v3 + 3.0;
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setZPosition:", v4);

  }
  objc_msgSend(*(id *)(a1 + 48), "shadowSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shadowColor");
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShadowColor:", v8);

    objc_msgSend(*(id *)(a1 + 48), "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shadowOffset");
    v12 = v11;
    v14 = v13;
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShadowOffset:", v12, v14);

    objc_msgSend(*(id *)(a1 + 48), "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shadowRadius");
    v18 = v17;
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setShadowRadius:", v18);

    objc_msgSend(*(id *)(a1 + 48), "layer");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "shadowOpacity");
    LODWORD(v18) = v20;
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = LODWORD(v18);
    objc_msgSend(v21, "setShadowOpacity:", v22);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setShadowOffset:", 0.0, 1.0);

    objc_msgSend(*(id *)(a1 + 32), "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setShadowRadius:", 2.0);

    objc_msgSend(*(id *)(a1 + 32), "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = 1050253722;
    v27 = v25;
    objc_msgSend(v25, "setShadowOpacity:", v26);
  }

}

void __37___UIFlocker_unflockToDrag_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "unflockPreviewProvider");
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, uint64_t))v6)[2](v6, v13, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = 2 * *(unsigned __int8 *)(a1 + 48);
  }
  else
  {
    v7 = v13;
    v8 = 1;
  }
  objc_msgSend(v5, "collapsedPreview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_getGhostPortal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIUnflockItemAnimation animationWithPlatterView:destination:positionReferenceView:type:](_UIUnflockItemAnimation, "animationWithPlatterView:destination:positionReferenceView:type:", v5, v7, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
}

void __37___UIFlocker_unflockToDrag_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_primaryPlatterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didTearOffForDrag");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "secondaryPlatterViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "didTearOffForDrag");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "badge");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 1);

}

void __37___UIFlocker_unflockToDrag_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "makeObjectsPerformSelector:", sel_play);
  CGAffineTransformMakeScale(&v5, 0.0, 0.0);
  objc_msgSend(*(id *)(a1 + 40), "badge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  objc_msgSend(v2, "setTransform:", &v4);

  objc_msgSend(*(id *)(a1 + 40), "badge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

uint64_t __37___UIFlocker_unflockToDrag_animated___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "makeObjectsPerformSelector:", sel_removeFromSuperview);
  return objc_msgSend(*(id *)(a1 + 40), "makeObjectsPerformSelector:", sel_complete);
}

uint64_t __37___UIFlocker_unflockToDrag_animated___block_invoke_5(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __37___UIFlocker_unflockToDrag_animated___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "complete");
}

@end
