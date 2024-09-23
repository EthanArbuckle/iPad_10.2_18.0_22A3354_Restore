@implementation PXGViewControllerItemPlacementInterpolator

- (PXGViewControllerItemPlacementInterpolator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewControllerItemPlacementInterpolator.m"), 45, CFSTR("%s is not available as initializer"), "-[PXGViewControllerItemPlacementInterpolator init]");

  abort();
}

- (PXGViewControllerItemPlacementInterpolator)initWithSourcePlacement:(id)a3 targetPlacement:(id)a4 layering:(int64_t)a5 containerView:(id)a6 duration:(double)a7
{
  id v13;
  id v14;
  id v15;
  PXGViewControllerItemPlacementInterpolator *v16;
  PXGViewControllerItemPlacementInterpolator *v17;
  id *p_sourcePlacement;
  id *p_targetPlacement;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  CAMediaTimingFunction *mainTimingFunction;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  CAMediaTimingFunction *secondaryTimingFunction;
  PXGItemPlacement *sourcePlacement;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGSize v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  int IsValid;
  void *v43;
  char v44;
  BOOL alwaysHideSource;
  void *v46;
  void *v47;
  int v48;
  char v49;
  int v50;
  int v51;
  unint64_t v52;
  _BOOL4 v53;
  double v54;
  double v55;
  double v56;
  double v57;
  BOOL v58;
  uint64_t v59;
  CAMediaTimingFunction *fadeTimingFunction;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v68.receiver = self;
  v68.super_class = (Class)PXGViewControllerItemPlacementInterpolator;
  v16 = -[PXGViewControllerItemPlacementInterpolator init](&v68, sel_init);
  v17 = v16;
  if (v16)
  {
    p_sourcePlacement = (id *)&v16->_sourcePlacement;
    objc_storeStrong((id *)&v16->_sourcePlacement, a3);
    p_targetPlacement = (id *)&v17->_targetPlacement;
    objc_storeStrong((id *)&v17->_targetPlacement, a4);
    v17->_layering = a5;
    objc_storeStrong((id *)&v17->_containerView, a6);
    v17->_duration = a7;
    LODWORD(v20) = 1043207291;
    LODWORD(v21) = 1045220557;
    LODWORD(v22) = 1.0;
    LODWORD(v23) = 1043207291;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v20, v23, v21, v22);
    v24 = objc_claimAutoreleasedReturnValue();
    mainTimingFunction = v17->_mainTimingFunction;
    v17->_mainTimingFunction = (CAMediaTimingFunction *)v24;

    LODWORD(v26) = 1051260355;
    LODWORD(v27) = 1059816735;
    LODWORD(v28) = 0;
    LODWORD(v29) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v26, v28, v27, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    secondaryTimingFunction = v17->_secondaryTimingFunction;
    v17->_secondaryTimingFunction = (CAMediaTimingFunction *)v30;

    sourcePlacement = v17->_sourcePlacement;
    if (sourcePlacement)
    {
      -[PXGItemPlacement rectInCoordinateSpace:velocity:](sourcePlacement, "rectInCoordinateSpace:velocity:", v17->_containerView, &v17->_sourceRectVelocity);
      v17->_sourceRect.origin.x = v33;
      v17->_sourceRect.origin.y = v34;
      v17->_sourceRect.size.width = v35;
      v17->_sourceRect.size.height = v36;
    }
    else
    {
      v37 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      v17->_sourceRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      v17->_sourceRect.size = v37;
    }
    -[PXGItemPlacement rectInCoordinateSpace:velocity:](v17->_targetPlacement, "rectInCoordinateSpace:velocity:", v17->_containerView, 0);
    v17->_targetRect.origin.x = v38;
    v17->_targetRect.origin.y = v39;
    v17->_targetRect.size.width = v40;
    v17->_targetRect.size.height = v41;
    IsValid = PXRectIsValid();
    if (IsValid)
      LOBYTE(IsValid) = PXRectIsValid();
    v17->_hasValidGeometry = IsValid;
    objc_msgSend(off_1E50B5CD0, "sharedInstance");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_alwaysHideSource = objc_msgSend(v43, "hideSummaryContentDuringTransition");
    v44 = objc_msgSend(v43, "hideDetailContentDuringTransition");
    v17->_alwaysHideTarget = v44;
    if (v17->_layering == 1)
    {
      alwaysHideSource = v17->_alwaysHideSource;
      v17->_alwaysHideSource = v44;
      v17->_alwaysHideTarget = alwaysHideSource;
    }
    objc_msgSend(*p_sourcePlacement, "displayedAsset");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_targetPlacement, "displayedAsset");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "isEqual:", v47);

    if (!v48)
      goto LABEL_14;
    if (*p_sourcePlacement)
    {
      objc_msgSend(*p_sourcePlacement, "displayedAssetContentsRect");
    }
    else
    {
      v66 = 0u;
      v67 = 0u;
      v65 = 0u;
    }
    if ((PXStoryRectIsNull() & 1) == 0)
    {
      if (*p_targetPlacement)
      {
        objc_msgSend(*p_targetPlacement, "displayedAssetContentsRect");
      }
      else
      {
        v63 = 0u;
        v64 = 0u;
        v62 = 0u;
      }
      v49 = PXStoryRectIsNull() ^ 1;
    }
    else
    {
LABEL_14:
      v49 = 0;
    }
    v17->_animatesDisplayedAssetContentsRect = v49;
    v17->_allowsAdjustedTargetPlacement = v17->_layering == -1;
    -[PXGItemPlacement cornerRadius](v17->_sourcePlacement, "cornerRadius", v62, v63, v64, v65, v66, v67);
    if ((PXGCornerRadiusIsNull() & 1) != 0)
    {
      LOBYTE(v50) = 0;
    }
    else
    {
      objc_msgSend(*p_targetPlacement, "cornerRadius");
      v50 = PXGCornerRadiusIsNull() ^ 1;
    }
    v17->_animatesCornerRadius = v50;
    if (!v48
      || (objc_msgSend(*p_sourcePlacement, "normalizedDisplayedAssetRect"), CGRectIsNull(v69))
      || (objc_msgSend(*p_targetPlacement, "normalizedDisplayedAssetRect"), CGRectIsNull(v70)))
    {
      LOBYTE(v51) = 0;
      v52 = 0x1E0CD2000uLL;
    }
    else
    {
      objc_msgSend(*p_sourcePlacement, "normalizedDisplayedAssetRect");
      v52 = 0x1E0CD2000;
      if (PXRectApproximatelyEqualToRect())
      {
        objc_msgSend(*p_targetPlacement, "normalizedDisplayedAssetRect");
        v51 = PXRectApproximatelyEqualToRect() ^ 1;
      }
      else
      {
        LOBYTE(v51) = 1;
      }
    }
    v17->_animatesNormalizedDisplayedAssetRect = v51;
    -[PXGItemPlacement normalizedTitleRect](v17->_sourcePlacement, "normalizedTitleRect");
    if (CGRectIsNull(v71))
    {
      LOBYTE(v53) = 0;
    }
    else
    {
      objc_msgSend(*p_targetPlacement, "normalizedTitleRect");
      v53 = !CGRectIsNull(v72);
    }
    v17->_animatesNormalizedTitleRect = v53;
    -[PXGItemPlacement normalizedSubtitleRect](v17->_sourcePlacement, "normalizedSubtitleRect");
    if (CGRectIsNull(v73))
    {
      v58 = 0;
    }
    else
    {
      objc_msgSend(*p_targetPlacement, "normalizedSubtitleRect");
      v58 = !CGRectIsNull(v74);
    }
    v17->_animatesNormalizedSubtitleRect = v58;
    if (v17->_animatesNormalizedDisplayedAssetRect)
    {
      if (v17->_layering == -1)
      {
        LODWORD(v54) = 0;
        LODWORD(v55) = 1.0;
        LODWORD(v56) = 0.5;
        LODWORD(v57) = 1.0;
      }
      else
      {
        LODWORD(v54) = 1.0;
        LODWORD(v55) = 1.0;
        LODWORD(v56) = 1.0;
        LODWORD(v57) = 0.5;
      }
      objc_msgSend(*(id *)(v52 + 2000), "functionWithControlPoints::::", v54, v55, v56, v57);
      v59 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(v52 + 2000), "functionWithName:", *MEMORY[0x1E0CD3058]);
      v59 = objc_claimAutoreleasedReturnValue();
    }
    fadeTimingFunction = v17->_fadeTimingFunction;
    v17->_fadeTimingFunction = (CAMediaTimingFunction *)v59;

  }
  return v17;
}

- (id)adjustedPlacement:(id)a3
{
  PXGItemPlacement *v4;
  PXGItemPlacement *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t layering;
  float v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  PXGItemPlacement *v22;
  PXGItemPlacement *v23;
  float v24;
  double v25;
  uint64_t v26;
  __int128 v27;
  PXGItemPlacement *v28;
  void *v29;
  uint64_t v30;
  PXGItemPlacement *sourcePlacement;
  int v32;
  int v33;
  int v34;
  int v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  PXGItemPlacement *v57;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  int v69;
  int v70;
  int v71;
  int v72;
  uint64_t v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  double v79;
  _QWORD v80[5];
  PXGItemPlacement *v81;
  double v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;

  v4 = (PXGItemPlacement *)a3;
  v5 = v4;
  if (!self->_hasValidGeometry)
  {
    v23 = v4;
    goto LABEL_38;
  }
  -[PXGViewControllerItemPlacementInterpolator time](self, "time");
  v7 = v6 / self->_duration;
  if (v7 < 0.0)
    v7 = 0.0;
  v8 = 1.0;
  v9 = fmin(v7, 1.0);
  *(float *)&v7 = v9;
  -[CAMediaTimingFunction _solveForInput:](self->_mainTimingFunction, "_solveForInput:", v7);
  v11 = v10;
  v12 = v10;
  PXRectDerivativeIntegrate();
  v59 = v12;
  PXRectByLinearlyInterpolatingRects();
  v77 = v14;
  v78 = v13;
  v75 = v16;
  v76 = v15;
  layering = self->_layering;
  if (self->_sourcePlacement == v5)
  {
    if (layering != -1)
    {
      *(float *)&v13 = v11;
      -[CAMediaTimingFunction _solveForInput:](self->_fadeTimingFunction, "_solveForInput:", v13, *(_QWORD *)&v12);
      v8 = 1.0 - v24;
    }
    if (v9 < 0.332)
    {
      v25 = v9 / 0.332;
      *(float *)&v25 = v9 / 0.332;
      -[CAMediaTimingFunction _solveForInput:](self->_secondaryTimingFunction, "_solveForInput:", v25);
    }
    -[PXGItemPlacement chromeAlpha](self->_sourcePlacement, "chromeAlpha", *(_QWORD *)&v59);
    v20 = 0;
    PXFloatByLinearlyInterpolatingFloats();
    if (self->_alwaysHideSource)
      v8 = 0.0;
    else
      v20 = v26;
    v22 = -[PXGItemPlacement initWithContext:configuration:]([PXGItemPlacement alloc], "initWithContext:configuration:", 0, &__block_literal_global_84192);
  }
  else
  {
    if (layering == -1)
    {
      *(float *)&v13 = v11;
      -[CAMediaTimingFunction _solveForInput:](self->_fadeTimingFunction, "_solveForInput:", v13, *(_QWORD *)&v12);
      v8 = v18;
    }
    if (v9 >= 0.332)
    {
      v19 = (v9 + -0.332) / 0.668;
      *(float *)&v19 = v19;
      -[CAMediaTimingFunction _solveForInput:](self->_secondaryTimingFunction, "_solveForInput:", v19);
    }
    -[PXGItemPlacement chromeAlpha](self->_targetPlacement, "chromeAlpha", *(_QWORD *)&v59);
    v20 = 0;
    PXFloatByLinearlyInterpolatingFloats();
    v22 = 0;
    if (self->_alwaysHideTarget)
      v8 = 0.0;
    else
      v20 = v21;
  }
  v27 = *((_OWORD *)off_1E50B88F0 + 1);
  v116 = *(_OWORD *)off_1E50B88F0;
  v117 = v27;
  v118 = *((_OWORD *)off_1E50B88F0 + 2);
  if (self->_animatesDisplayedAssetContentsRect)
  {
    v28 = self->_targetPlacement;
    v29 = v28;
    if (self->_allowsAdjustedTargetPlacement)
    {
      -[PXGItemPlacement adjustedPreferredPlacement](v28, "adjustedPreferredPlacement");
      v30 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)v30;
    }
    sourcePlacement = self->_sourcePlacement;
    if (sourcePlacement)
    {
      -[PXGItemPlacement displayedAssetContentsRect](sourcePlacement, "displayedAssetContentsRect");
      if (v29)
      {
LABEL_24:
        objc_msgSend(v29, "displayedAssetContentsRect");
LABEL_27:
        PXStoryRectLinearlyInterpolatingRects();

        goto LABEL_28;
      }
    }
    else
    {
      v114 = 0u;
      v115 = 0u;
      v113 = 0u;
      if (v29)
        goto LABEL_24;
    }
    v111 = 0u;
    v112 = 0u;
    v110 = 0u;
    goto LABEL_27;
  }
LABEL_28:
  v73 = v20;
  v74 = v8;
  v79 = v12;
  if (self->_animatesCornerRadius)
  {
    -[PXGItemPlacement cornerRadius](self->_sourcePlacement, "cornerRadius");
    -[PXGItemPlacement cornerRadius](self->_targetPlacement, "cornerRadius");
    v60 = v12;
    PXGCornerRadiusByLinearlyInterpolatingCornerRadii();
    v71 = v33;
    v72 = v32;
    v69 = v35;
    v70 = v34;
  }
  else
  {
    v71 = *((_DWORD *)off_1E50B8240 + 1);
    v72 = *(_DWORD *)off_1E50B8240;
    v69 = *((_DWORD *)off_1E50B8240 + 3);
    v70 = *((_DWORD *)off_1E50B8240 + 2);
  }
  v36 = *MEMORY[0x1E0C9D628];
  v37 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v39 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v38 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v40 = v38;
  v41 = v39;
  v42 = v37;
  v43 = *MEMORY[0x1E0C9D628];
  if (self->_animatesNormalizedDisplayedAssetRect)
  {
    -[PXGItemPlacement normalizedDisplayedAssetRect](self->_sourcePlacement, "normalizedDisplayedAssetRect", v43, v37, v39, v38);
    PXRectDenormalize();
    -[PXGItemPlacement normalizedDisplayedAssetRect](self->_targetPlacement, "normalizedDisplayedAssetRect");
    PXRectDenormalize();
    v60 = v79;
    PXRectByLinearlyInterpolatingRects();
    PXRectNormalize();
  }
  v65 = v43;
  v66 = v42;
  v67 = v41;
  v68 = v40;
  v44 = v36;
  v45 = v37;
  v46 = v39;
  v47 = v38;
  if (self->_animatesNormalizedTitleRect)
  {
    -[PXGItemPlacement normalizedTitleRect](self->_sourcePlacement, "normalizedTitleRect", v36, v37, v39, v38);
    -[PXGItemPlacement normalizedTitleRect](self->_targetPlacement, "normalizedTitleRect");
    v60 = v79;
    PXRectByLinearlyInterpolatingRects();
  }
  v61 = v47;
  v62 = v46;
  v63 = v45;
  v64 = v44;
  if (self->_animatesNormalizedSubtitleRect)
  {
    -[PXGItemPlacement normalizedSubtitleRect](self->_sourcePlacement, "normalizedSubtitleRect");
    -[PXGItemPlacement normalizedSubtitleRect](self->_targetPlacement, "normalizedSubtitleRect");
    v60 = v79;
    PXRectByLinearlyInterpolatingRects();
    v36 = v48;
    v37 = v49;
    v39 = v50;
    v38 = v51;
  }
  -[PXGItemPlacement scrubberAlpha](self->_sourcePlacement, "scrubberAlpha", *(_QWORD *)&v60);
  -[PXGItemPlacement scrubberAlpha](self->_targetPlacement, "scrubberAlpha");
  PXFloatByLinearlyInterpolatingFloats();
  v53 = v52;
  -[PXGItemPlacement legibilityOverlayAlpha](self->_sourcePlacement, "legibilityOverlayAlpha");
  -[PXGItemPlacement legibilityOverlayAlpha](self->_targetPlacement, "legibilityOverlayAlpha");
  PXFloatByLinearlyInterpolatingFloats();
  v55 = v54;
  -[PXGItemPlacement soundVolume](self->_sourcePlacement, "soundVolume");
  -[PXGItemPlacement soundVolume](self->_targetPlacement, "soundVolume");
  PXFloatByLinearlyInterpolatingFloats();
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  *(float *)&v56 = v56;
  v80[2] = __64__PXGViewControllerItemPlacementInterpolator_adjustedPlacement___block_invoke_2;
  v80[3] = &unk_1E5123600;
  v82 = v78;
  v83 = v77;
  v84 = v76;
  v85 = v75;
  v86 = v74;
  v87 = v116;
  v88 = v117;
  v89 = v118;
  v105 = v72;
  v106 = v71;
  v107 = v70;
  v108 = v69;
  v90 = v65;
  v91 = v66;
  v92 = v67;
  v93 = v68;
  v94 = v64;
  v95 = v63;
  v96 = v62;
  v97 = v61;
  v98 = v36;
  v99 = v37;
  v100 = v39;
  v101 = v38;
  v102 = v73;
  v103 = v53;
  v104 = v55;
  v109 = LODWORD(v56);
  v80[4] = self;
  v81 = v22;
  v57 = v22;
  v23 = -[PXGItemPlacement copyWithConfiguration:](v5, "copyWithConfiguration:", v80);

LABEL_38:
  return v23;
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeTimingFunction, 0);
  objc_storeStrong((id *)&self->_secondaryTimingFunction, 0);
  objc_storeStrong((id *)&self->_mainTimingFunction, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_targetPlacement, 0);
  objc_storeStrong((id *)&self->_sourcePlacement, 0);
}

void __64__PXGViewControllerItemPlacementInterpolator_adjustedPlacement___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  __int128 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _OWORD v11[6];

  v3 = a2;
  objc_msgSend(v3, "setRect:velocity:inCoordinateSpace:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)off_1E50B8610, *((double *)off_1E50B8610 + 1), *((double *)off_1E50B8610 + 2), *((double *)off_1E50B8610 + 3));
  objc_msgSend(v3, "setAlpha:", *(double *)(a1 + 80));
  v4 = *(_OWORD *)(a1 + 104);
  v11[3] = *(_OWORD *)(a1 + 88);
  v11[4] = v4;
  v11[5] = *(_OWORD *)(a1 + 120);
  if ((PXStoryRectIsNull() & 1) == 0)
  {
    v5 = *(_OWORD *)(a1 + 104);
    v11[0] = *(_OWORD *)(a1 + 88);
    v11[1] = v5;
    v11[2] = *(_OWORD *)(a1 + 120);
    objc_msgSend(v3, "setDisplayedAssetContentsRect:", v11);
  }
  if ((PXGCornerRadiusIsNull() & 1) == 0)
  {
    LODWORD(v6) = *(_DWORD *)(a1 + 256);
    LODWORD(v7) = *(_DWORD *)(a1 + 260);
    LODWORD(v8) = *(_DWORD *)(a1 + 264);
    LODWORD(v9) = *(_DWORD *)(a1 + 268);
    objc_msgSend(v3, "setCornerRadius:", v6, v7, v8, v9);
  }
  if (!CGRectIsNull(*(CGRect *)(a1 + 136)))
    objc_msgSend(v3, "setNormalizedDisplayedAssetRect:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));
  if (!CGRectIsNull(*(CGRect *)(a1 + 168)))
    objc_msgSend(v3, "setNormalizedTitleRect:", *(double *)(a1 + 168), *(double *)(a1 + 176), *(double *)(a1 + 184), *(double *)(a1 + 192));
  if (!CGRectIsNull(*(CGRect *)(a1 + 200)))
    objc_msgSend(v3, "setNormalizedSubtitleRect:", *(double *)(a1 + 200), *(double *)(a1 + 208), *(double *)(a1 + 216), *(double *)(a1 + 224));
  objc_msgSend(v3, "setChromeAlpha:", *(double *)(a1 + 232));
  objc_msgSend(v3, "setScrubberAlpha:", *(double *)(a1 + 240));
  objc_msgSend(v3, "setLegibilityOverlayAlpha:", *(double *)(a1 + 248));
  LODWORD(v10) = *(_DWORD *)(a1 + 272);
  objc_msgSend(v3, "setSoundVolume:", v10);
  objc_msgSend(v3, "setOtherItemsPlacement:", *(_QWORD *)(a1 + 40));

}

uint64_t __64__PXGViewControllerItemPlacementInterpolator_adjustedPlacement___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setChromeAlpha:", 0.0);
}

@end
