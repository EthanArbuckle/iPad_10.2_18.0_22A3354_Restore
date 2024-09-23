@implementation UINavigationParallaxTransition

uint64_t __73___UINavigationParallaxTransition_animatePreemptionSnapshotsWithContext___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "fromViewControllerHandoffData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetFrame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");

  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.9);
}

uint64_t __73___UINavigationParallaxTransition_animatePreemptionSnapshotsWithContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

id __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  char v32;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_2;
  v11[3] = &unk_1E16C2AC8;
  v12 = *(id *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v13 = v2;
  v14 = v3;
  v22 = *(_QWORD *)(a1 + 112);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 120);
  v15 = v5;
  v23 = v6;
  v7 = *(id *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 128);
  v16 = v7;
  v24 = v8;
  v17 = *(id *)(a1 + 72);
  v25 = *(_OWORD *)(a1 + 136);
  v31 = *(_BYTE *)(a1 + 232);
  v26 = *(_OWORD *)(a1 + 152);
  v18 = *(id *)(a1 + 80);
  v19 = *(id *)(a1 + 88);
  v27 = *(_OWORD *)(a1 + 168);
  v28 = *(_OWORD *)(a1 + 184);
  v29 = *(_OWORD *)(a1 + 200);
  v20 = *(id *)(a1 + 96);
  v21 = *(id *)(a1 + 104);
  v32 = *(_BYTE *)(a1 + 233);
  v30 = *(_OWORD *)(a1 + 216);
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
  v9 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 8) + 40);

  return v9;
}

uint64_t __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double *v65;
  uint64_t v66;
  _UIParallaxDimmingView *v67;
  double *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  _UIParallaxDimmingView *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id *v86;
  _QWORD *v87;
  _QWORD *v88;
  uint64_t v89;
  id *v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  UIView *v104;
  uint64_t v105;
  void *v106;
  double v107;
  double v108;
  _QWORD *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  UIView *v114;
  uint64_t v115;
  void *v116;
  void *v117;

  objc_msgSend(*(id *)(a1 + 32), "_setInCustomTransition:", 1);
  objc_msgSend(*(id *)(a1 + 40), "_setInCustomTransition:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "setBackgroundColor:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 88), "setBackgroundColor:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "initialFrameForViewController:", *(_QWORD *)(a1 + 32));
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 112) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  if (CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 32), *MEMORY[0x1E0C9D648]))
  {
    objc_msgSend(*(id *)(a1 + 56), "frame");
    v7 = *(_QWORD **)(*(_QWORD *)(a1 + 112) + 8);
    v7[4] = v8;
    v7[5] = v9;
    v7[6] = v10;
    v7[7] = v11;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "finalFrameForViewController:", *(_QWORD *)(a1 + 40));
  v12 = *(_QWORD **)(*(_QWORD *)(a1 + 120) + 8);
  v12[4] = v13;
  v12[5] = v14;
  v12[6] = v15;
  v12[7] = v16;
  objc_msgSend(*(id *)(a1 + 64), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 56));
  objc_msgSend(*(id *)(a1 + 72), "bounds");
  v17 = *(_QWORD **)(*(_QWORD *)(a1 + 128) + 8);
  v17[4] = v18;
  v17[5] = v19;
  v17[6] = v20;
  v17[7] = v21;
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
  v24 = *(_OWORD *)(v23 + 48);
  *(_OWORD *)(v22 + 32) = *(_OWORD *)(v23 + 32);
  *(_OWORD *)(v22 + 48) = v24;
  objc_msgSend(*(id *)(a1 + 48), "gapBetweenViews");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24) = v25;
  objc_msgSend(*(id *)(a1 + 48), "parallaxOffset");
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
  v28 = *(unsigned __int8 *)(a1 + 232);
  v29 = *(_QWORD *)(*(_QWORD *)(a1 + 152) + 8);
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
  v31 = *(_OWORD *)(v30 + 48);
  *(_OWORD *)(v29 + 32) = *(_OWORD *)(v30 + 32);
  *(_OWORD *)(v29 + 48) = v31;
  v32 = *(_QWORD *)(*(_QWORD *)(a1 + 152) + 8);
  v33 = *(double *)(v32 + 48);
  if (v27 != 2)
  {
    v41 = v33 - v26 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24);
    v42 = *(double *)(v32 + 32);
    if (!v28)
    {
      *(double *)(v32 + 32) = v42 - v41;
      v51 = *(_QWORD *)(*(_QWORD *)(a1 + 160) + 8);
      v52 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
      v53 = *(_OWORD *)(v52 + 48);
      *(_OWORD *)(v51 + 32) = *(_OWORD *)(v52 + 32);
      *(_OWORD *)(v51 + 48) = v53;
      v39 = *(_QWORD *)(*(_QWORD *)(a1 + 160) + 8);
      v40 = *(double *)(v39 + 48);
      goto LABEL_11;
    }
    *(double *)(v32 + 32) = v42 + v41;
    v43 = *(_QWORD *)(*(_QWORD *)(a1 + 160) + 8);
    v44 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
    v45 = *(_OWORD *)(v44 + 48);
    *(_OWORD *)(v43 + 32) = *(_OWORD *)(v44 + 32);
    *(_OWORD *)(v43 + 48) = v45;
    v39 = *(_QWORD *)(*(_QWORD *)(a1 + 160) + 8);
    v46 = *(double *)(v39 + 48);
LABEL_9:
    v50 = *(double *)(v39 + 32) - (v46 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24));
    goto LABEL_12;
  }
  v34 = v33 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24);
  v35 = *(double *)(v32 + 32);
  if (!v28)
  {
    *(double *)(v32 + 32) = v35 + v34;
    v47 = *(_QWORD *)(*(_QWORD *)(a1 + 160) + 8);
    v48 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
    v49 = *(_OWORD *)(v48 + 48);
    *(_OWORD *)(v47 + 32) = *(_OWORD *)(v48 + 32);
    *(_OWORD *)(v47 + 48) = v49;
    v39 = *(_QWORD *)(*(_QWORD *)(a1 + 160) + 8);
    v46 = *(double *)(v39 + 48) - v26;
    goto LABEL_9;
  }
  *(double *)(v32 + 32) = v35 - v34;
  v36 = *(_QWORD *)(*(_QWORD *)(a1 + 160) + 8);
  v37 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
  v38 = *(_OWORD *)(v37 + 48);
  *(_OWORD *)(v36 + 32) = *(_OWORD *)(v37 + 32);
  *(_OWORD *)(v36 + 48) = v38;
  v39 = *(_QWORD *)(*(_QWORD *)(a1 + 160) + 8);
  v40 = *(double *)(v39 + 48) - v26;
LABEL_11:
  v50 = *(double *)(v39 + 32) + v40 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24);
LABEL_12:
  *(double *)(v39 + 32) = v50;
  v54 = *(void **)(a1 + 80);
  if (v54)
  {
    objc_msgSend(v54, "frame");
  }
  else
  {
    v59 = *(double **)(*(_QWORD *)(a1 + 128) + 8);
    v55 = v59[4];
    v56 = v59[5];
    v57 = v59[6];
    v58 = v59[7];
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 88), "setFrame:", v55, v56, v57, v58);
  v60 = *(void **)(a1 + 88);
  if (v60)
  {
    objc_msgSend(v60, "frame");
  }
  else
  {
    v65 = *(double **)(*(_QWORD *)(a1 + 160) + 8);
    v61 = v65[4];
    v62 = v65[5];
    v63 = v65[6];
    v64 = v65[7];
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "setFrame:", v61, v62, v63, v64);
  v66 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(v66 + 112))
    goto LABEL_31;
  v67 = [_UIParallaxDimmingView alloc];
  v68 = *(double **)(*(_QWORD *)(a1 + 136) + 8);
  objc_msgSend(*(id *)(a1 + 48), "overrideDimmingColor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = -[_UIParallaxDimmingView initWithFrame:overrideDimmingColor:](v67, "initWithFrame:overrideDimmingColor:", v69, v68[4], v68[5], v68[6], v68[7]);
  v71 = *(_QWORD *)(a1 + 48);
  v72 = *(void **)(v71 + 80);
  *(_QWORD *)(v71 + 80) = v70;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 48) == 2)
  {
    v73 = *(void **)(a1 + 88);
    if (!v73)
    {
      v74 = 1.0;
      goto LABEL_24;
    }
LABEL_23:
    objc_msgSend(v73, "dimmingAmount");
LABEL_24:
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 24) = v74;
    v75 = 1.0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 48) == 2)
      v75 = 0.0;
    goto LABEL_28;
  }
  v73 = *(void **)(a1 + 80);
  if (v73)
    goto LABEL_23;
  v75 = 1.0;
LABEL_28:
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 176) + 8) + 24) = v75;
  v76 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 48), "contentDimmingView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setBackgroundDimmingAmount:", v76);

  v78 = [_UIParallaxDimmingView alloc];
  v79 = 64;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 48) == 2)
    v79 = 56;
  v80 = -[_UIParallaxDimmingView initViewWrappingView:withLeftBorder:shouldReverseLayoutDirection:](v78, "initViewWrappingView:withLeftBorder:shouldReverseLayoutDirection:", *(_QWORD *)(a1 + v79), *(unsigned __int8 *)(a1 + 232), 9.0);
  v81 = *(_QWORD *)(a1 + 48);
  v82 = *(void **)(v81 + 72);
  *(_QWORD *)(v81 + 72) = v80;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 184) + 8) + 24) = 0x3FF0000000000000;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 8) + 24) = 0;
  v66 = *(_QWORD *)(a1 + 48);
LABEL_31:
  objc_msgSend(*(id *)(v66 + 72), "_updateLeftEdgeFade:", *(unsigned __int8 *)(a1 + 232));
  v83 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(v83 + 48) == 2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 8) + 40), *(id *)(a1 + 64));
    v84 = *(_QWORD *)(a1 + 48);
    v85 = *(_QWORD *)(v84 + 112);
    v86 = (id *)(v84 + 72);
    if (v85)
      v86 = (id *)(a1 + 56);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 8) + 40), *v86);
    objc_msgSend(*(id *)(a1 + 96), "insertSubview:atIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 8) + 40), 0);
    objc_msgSend(*(id *)(a1 + 104), "insertSubview:atIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 8) + 40), 0);
    objc_msgSend(*(id *)(a1 + 72), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96));
    v87 = *(_QWORD **)(a1 + 48);
    if (!v87[14])
    {
      objc_msgSend(*(id *)(a1 + 72), "addSubview:", v87[10]);
      v87 = *(_QWORD **)(a1 + 48);
    }
    v88 = v87 + 11;
  }
  else
  {
    v89 = *(_QWORD *)(v83 + 112);
    v90 = (id *)(v83 + 72);
    if (v89)
      v90 = (id *)(a1 + 64);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 8) + 40), *v90);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 8) + 40), *(id *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 96), "insertSubview:atIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 8) + 40), 0);
    objc_msgSend(*(id *)(a1 + 104), "insertSubview:atIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 208) + 8) + 40), 0);
    objc_msgSend(*(id *)(a1 + 72), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88));
    v91 = *(_QWORD **)(a1 + 48);
    if (!v91[14])
    {
      objc_msgSend(*(id *)(a1 + 72), "addSubview:", v91[10]);
      v91 = *(_QWORD **)(a1 + 48);
    }
    v88 = v91 + 12;
  }
  objc_msgSend(*(id *)(a1 + 72), "addSubview:", *v88);
  v92 = *(_QWORD *)(a1 + 48);
  if ((*(_BYTE *)(a1 + 233) || *(_BYTE *)(v92 + 40)) && !*(_QWORD *)(v92 + 112))
  {
    v93 = *(_QWORD *)(v92 + 48);
    objc_msgSend(*(id *)(a1 + 72), "bounds");
    v94 = *(_QWORD **)(*(_QWORD *)(a1 + 216) + 8);
    v94[4] = v95;
    v94[5] = v96;
    v94[6] = v97;
    v94[7] = v98;
    if (v93 == 2)
    {
      *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 48) = CGRectGetMinX(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8)
                                                                                              + 32));
      if (*(_BYTE *)(a1 + 232))
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 32) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136)
                                                                                             + 8)
                                                                                 + 48);
      objc_msgSend(*(id *)(a1 + 72), "bounds");
      v99 = *(_QWORD **)(*(_QWORD *)(a1 + 224) + 8);
      v99[4] = v100;
      v99[5] = v101;
      v99[6] = v102;
      v99[7] = v103;
      v104 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 56));
      v105 = *(_QWORD *)(a1 + 48);
      v106 = *(void **)(v105 + 104);
      *(_QWORD *)(v105 + 104) = v104;

      objc_msgSend(*(id *)(a1 + 72), "insertSubview:belowSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 104), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 104), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96));
      if (*(_BYTE *)(a1 + 232))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "frame");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "setFrame:", v107 - v108);
      }
    }
    else
    {
      *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 48) = CGRectGetMinX(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8)
                                                                                              + 32));
      objc_msgSend(*(id *)(a1 + 72), "bounds");
      v109 = *(_QWORD **)(*(_QWORD *)(a1 + 224) + 8);
      v109[4] = v110;
      v109[5] = v111;
      v109[6] = v112;
      v109[7] = v113;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 224) + 8) + 48) = 0;
      if (*(_BYTE *)(a1 + 232))
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 224) + 8) + 32) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128)
                                                                                             + 8)
                                                                                 + 48);
      v114 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 216) + 8) + 56));
      v115 = *(_QWORD *)(a1 + 48);
      v116 = *(void **)(v115 + 104);
      *(_QWORD *)(v115 + 104) = v114;

      objc_msgSend(*(id *)(a1 + 72), "insertSubview:belowSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 104), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 104), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88));
      if (*(_BYTE *)(a1 + 232))
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 32) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 152)
                                                                                             + 8)
                                                                                 + 32)
                                                                     - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 152)
                                                                                             + 8)
                                                                                 + 48);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 104), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 80));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 104), "setClipsToBounds:", 1);
  }
  -[UIViewController _parentViewController](*(id **)(a1 + 40));
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  if (v117)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "finalFrameForViewController:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "_updateContentOverlayInsetsFromParentForNavigationTransitionWithFinalRectInParent:");
  }
  objc_msgSend(*(id *)(a1 + 104), "bounds");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 144), "setFrame:");
  objc_msgSend(*(id *)(a1 + 104), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 144));
  objc_msgSend(*(id *)(a1 + 96), "bounds");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 152), "setFrame:");
  return objc_msgSend(*(id *)(a1 + 96), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 152));
}

void __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_3(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  id v5;
  double v6;
  double v7;
  __int128 v8;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  CAFrameRateRange v12;

  v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v12.minimum;
  maximum = v12.maximum;
  preferred = v12.preferred;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_4;
  v9[3] = &unk_1E16C2B18;
  v9[4] = *(_QWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 56);
  v8 = *(_OWORD *)(a1 + 40);
  v5 = (id)v8;
  v10 = v8;
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048616, v9, COERCE_DOUBLE(__PAIR64__(DWORD1(v8), LODWORD(minimum))), v6, v7);

}

void __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_4(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56));
  v2 = *(id **)(a1 + 32);
  if (v2[13])
  {
    objc_msgSend(v2[13], "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 56));
    v2 = *(id **)(a1 + 32);
  }
  objc_msgSend(v2, "contentDimmingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "crossFade");

  objc_msgSend(*(id *)(a1 + 32), "borderDimmingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "crossFade");

  objc_msgSend(*(id *)(a1 + 40), "_hostingNavigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "_hostingNavigationBar");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsLayout");

  }
}

void __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_5(uint64_t a1)
{
  int v2;
  double *v3;
  double *v4;
  double *v5;
  double *v6;
  double *v7;
  id *v8;
  double *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  id *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;

  v2 = objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled");
  if (v2)
  {
    v3 = *(double **)(*(_QWORD *)(a1 + 88) + 8);
    v4 = v3 + 4;
    v5 = v3 + 5;
    v6 = v3 + 6;
    v7 = v3 + 7;
    v8 = (id *)(a1 + 40);
  }
  else
  {
    v9 = *(double **)(*(_QWORD *)(a1 + 96) + 8);
    v4 = v9 + 4;
    v5 = v9 + 5;
    v6 = v9 + 6;
    v7 = v9 + 7;
    v8 = (id *)(a1 + 48);
  }
  objc_msgSend(*v8, "setFrame:", *v4, *v5, *v6, *v7);
  objc_msgSend(*(id *)(a1 + 40), "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1.0;
  objc_msgSend(v10, "setSpeed:", v11);

  objc_msgSend(*(id *)(a1 + 48), "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1.0;
  objc_msgSend(v12, "setSpeed:", v13);

  objc_msgSend(*(id *)(a1 + 56), "_setInCustomTransition:", 0);
  objc_msgSend(*(id *)(a1 + 64), "_setInCustomTransition:", 0);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_6;
  v24[3] = &unk_1E16B47A8;
  v25 = *(id *)(a1 + 72);
  v14 = *(id *)(a1 + 40);
  v15 = *(void **)(a1 + 72);
  v16 = *(_QWORD *)(a1 + 80);
  v26 = v14;
  v27 = v16;
  objc_msgSend(v15, "_window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "windowScene");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView _performBlockWithoutAutomaticallyUpdatingFirstResponder:forScene:]((uint64_t)UIView, v24, v18);

  v19 = objc_msgSend(*(id *)(a1 + 48), "_safeAreaInsetsFrozen");
  if (v2 && _UIViewDirtiesDelegateContentInsetsForGeometryChange())
    objc_msgSend(*(id *)(a1 + 48), "_setSafeAreaInsetsFrozen:", 1);
  objc_msgSend(*(id *)(a1 + 72), "insertSubview:belowSubview:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 80) + 96));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 80) + 96), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 80) + 88), "removeFromSuperview");
  v20 = *(_QWORD **)(a1 + 80);
  if (!v20[14])
  {
    objc_msgSend(v20, "contentDimmingView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 80), "borderDimmingView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeFromSuperview");

    v23 = *(id **)(a1 + 80);
    if (v23[13])
    {
      objc_msgSend(v23[13], "removeFromSuperview");
      v23 = *(id **)(a1 + 80);
    }
    objc_msgSend(v23, "setClipUnderView:", 0);
    objc_msgSend(*(id *)(a1 + 80), "setBorderDimmingView:", 0);
    objc_msgSend(*(id *)(a1 + 80), "setContentDimmingView:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", v2 ^ 1u);
  objc_msgSend(*(id *)(a1 + 80), "setTransitionContext:", 0);
  objc_msgSend(*(id *)(a1 + 48), "_setSafeAreaInsetsFrozen:updateForUnfreeze:", v19, 0);

}

uint64_t __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertSubview:belowSubview:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88));
}

uint64_t __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_7(uint64_t a1, double a2)
{
  __int128 v4;
  __int128 v5;
  _QWORD v7[4];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  double v14;
  CAFrameRateRange v15;

  v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_8;
  v7[3] = &unk_1E16C2B68;
  v14 = a2;
  v4 = *(_OWORD *)(a1 + 48);
  v8 = *(_OWORD *)(a1 + 32);
  v9 = v4;
  v5 = *(_OWORD *)(a1 + 80);
  v10 = *(_OWORD *)(a1 + 64);
  v11 = v5;
  v12 = *(_OWORD *)(a1 + 96);
  v13 = *(_QWORD *)(a1 + 112);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048616, v7, *(double *)&v15.minimum, *(double *)&v15.maximum, *(double *)&v15.preferred);
}

void __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_8(uint64_t a1)
{
  CGFloat *v2;
  double *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double MinX;
  double Width;
  double v13;
  double Height;
  CGFloat *v15;
  double *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD *v28;
  CGFloat *v29;
  double *v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  double MinY;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat rect;
  double recta;
  double rectb;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  double v64;
  id v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  v46 = *(double *)(a1 + 120);
  v2 = *(CGFloat **)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(double **)(*(_QWORD *)(a1 + 48) + 8);
  v4 = v2[4];
  v5 = v2[5];
  v6 = v2[6];
  v66.size.height = v2[7];
  v7 = v3[4];
  v8 = v3[5];
  rect = v66.size.height;
  v9 = v3[6];
  v10 = v3[7];
  v59 = v7;
  v62 = v10;
  v66.origin.x = v4;
  v66.origin.y = v5;
  v66.size.width = v6;
  MinX = CGRectGetMinX(v66);
  v67.origin.x = v7;
  v67.origin.y = v8;
  v67.size.width = v9;
  v67.size.height = v10;
  v51 = (1.0 - v46) * MinX + v46 * CGRectGetMinX(v67);
  v68.origin.x = v4;
  v68.origin.y = v5;
  v68.size.width = v6;
  v68.size.height = rect;
  MinY = CGRectGetMinY(v68);
  v69.origin.x = v7;
  v69.origin.y = v8;
  v69.size.width = v9;
  v69.size.height = v10;
  v50 = (1.0 - v46) * MinY + v46 * CGRectGetMinY(v69);
  v70.origin.x = v4;
  v70.origin.y = v5;
  v70.size.width = v6;
  v70.size.height = rect;
  Width = CGRectGetWidth(v70);
  v71.origin.x = v7;
  v71.origin.y = v8;
  v71.size.width = v9;
  v71.size.height = v10;
  v13 = (1.0 - v46) * Width + v46 * CGRectGetWidth(v71);
  v72.origin.x = v4;
  v72.origin.y = v5;
  v72.size.width = v6;
  v72.size.height = rect;
  Height = CGRectGetHeight(v72);
  v73.origin.y = v8;
  v73.origin.x = v59;
  v73.size.width = v9;
  v73.size.height = v62;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setFrame:", v51, v50, v13, (1.0 - v46) * Height + v46 * CGRectGetHeight(v73));
  v15 = *(CGFloat **)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(double **)(*(_QWORD *)(a1 + 64) + 8);
  v18 = v15[4];
  v17 = v15[5];
  v74.size.width = v15[6];
  v19 = v15[7];
  v60 = v74.size.width;
  v20 = v16[4];
  v21 = v16[5];
  v23 = v16[6];
  v22 = v16[7];
  v63 = *(double *)(a1 + 120);
  v74.origin.x = v18;
  v74.origin.y = v17;
  v74.size.height = v19;
  v47 = v19;
  v24 = CGRectGetMinX(v74);
  v75.origin.x = v20;
  v45 = v21;
  v75.origin.y = v21;
  v75.size.width = v23;
  v75.size.height = v22;
  v57 = (1.0 - v63) * v24 + v63 * CGRectGetMinX(v75);
  v76.origin.x = v18;
  v76.origin.y = v17;
  v76.size.width = v60;
  v76.size.height = v19;
  v25 = CGRectGetMinY(v76);
  v77.origin.x = v20;
  v77.origin.y = v21;
  v77.size.width = v23;
  v77.size.height = v22;
  recta = (1.0 - v63) * v25 + v63 * CGRectGetMinY(v77);
  v78.origin.x = v18;
  v78.origin.y = v17;
  v78.size.width = v60;
  v78.size.height = v47;
  v26 = CGRectGetWidth(v78);
  v79.origin.x = v20;
  v79.origin.y = v21;
  v79.size.width = v23;
  v79.size.height = v22;
  v52 = (1.0 - v63) * v26 + v63 * CGRectGetWidth(v79);
  v80.origin.x = v18;
  v80.origin.y = v17;
  v80.size.width = v60;
  v80.size.height = v47;
  v27 = CGRectGetHeight(v80);
  v81.origin.x = v20;
  v81.origin.y = v21;
  v81.size.width = v23;
  v81.size.height = v22;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setFrame:", v57, recta, v52, (1.0 - v63) * v27 + v63 * CGRectGetHeight(v81));
  v28 = *(_QWORD **)(a1 + 32);
  if (v28[13])
  {
    v29 = *(CGFloat **)(*(_QWORD *)(a1 + 72) + 8);
    v30 = *(double **)(*(_QWORD *)(a1 + 80) + 8);
    v32 = v29[4];
    v31 = v29[5];
    v82.size.width = v29[6];
    v33 = v29[7];
    v61 = v82.size.width;
    v34 = v30[4];
    v35 = v30[5];
    v37 = v30[6];
    v36 = v30[7];
    v64 = *(double *)(a1 + 120);
    v82.origin.x = v32;
    v82.origin.y = v31;
    v82.size.height = v33;
    v48 = v33;
    v38 = CGRectGetMinX(v82);
    v83.origin.x = v34;
    v45 = v35;
    v83.origin.y = v35;
    v83.size.width = v37;
    v83.size.height = v36;
    v58 = (1.0 - v64) * v38 + v64 * CGRectGetMinX(v83);
    v84.origin.x = v32;
    v84.origin.y = v31;
    v84.size.width = v61;
    v84.size.height = v33;
    v39 = CGRectGetMinY(v84);
    v85.origin.x = v34;
    v85.origin.y = v35;
    v85.size.width = v37;
    v85.size.height = v36;
    rectb = (1.0 - v64) * v39 + v64 * CGRectGetMinY(v85);
    v86.origin.x = v32;
    v86.origin.y = v31;
    v86.size.width = v61;
    v86.size.height = v48;
    v40 = CGRectGetWidth(v86);
    v87.origin.x = v34;
    v87.origin.y = v35;
    v87.size.width = v37;
    v87.size.height = v36;
    v53 = (1.0 - v64) * v40 + v64 * CGRectGetWidth(v87);
    v88.origin.x = v32;
    v88.origin.y = v31;
    v88.size.width = v61;
    v88.size.height = v48;
    v41 = CGRectGetHeight(v88);
    v89.origin.x = v34;
    v89.origin.y = v35;
    v89.size.width = v37;
    v89.size.height = v36;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setFrame:", v58, rectb, v53, (1.0 - v64) * v41 + v64 * CGRectGetHeight(v89));
    v28 = *(_QWORD **)(a1 + 32);
  }
  v42 = (1.0 - *(double *)(a1 + 120)) * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24)
      + *(double *)(a1 + 120) * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
  objc_msgSend(v28, "contentDimmingView", *(_QWORD *)&v45);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setBackgroundDimmingAmount:", v42);

  v44 = (1.0 - *(double *)(a1 + 120)) * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24)
      + *(double *)(a1 + 120) * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "borderDimmingView");
  v65 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setBackgroundDimmingAmount:", v44);

}

void __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_9(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  CAFrameRateRange v10;

  v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v10.minimum;
  maximum = v10.maximum;
  preferred = v10.preferred;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_10;
  v8[3] = &unk_1E16B1B28;
  v9 = *(id *)(a1 + 32);
  *(float *)&v5 = minimum;
  *(float *)&v6 = maximum;
  *(float *)&v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048616, v8, v5, v6, v7);

}

uint64_t __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", 100.0, 0.0, 1.0, 1.0);
}

uint64_t __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_11(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a2;
  objc_opt_self();
  if (fluidPresentationTransitionsEnabled == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "transitionDuration:", *(_QWORD *)(a1 + 40));
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_14;
    v9[3] = &unk_1E16C0E38;
    v10 = v5;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v8, 0, v6, v9);

    v6 = v10;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "transitionDuration:", *(_QWORD *)(a1 + 40));
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", *(_QWORD *)(a1 + 48), v6, v5);
  }

}

uint64_t __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81___UINavigationParallaxTransition__animateOrCreatePropertyAnimatorForTransition___block_invoke_15(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __61___UINavigationParallaxTransition__stopTransitionImmediately__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishAnimationAtPosition:", 0);
}

@end
