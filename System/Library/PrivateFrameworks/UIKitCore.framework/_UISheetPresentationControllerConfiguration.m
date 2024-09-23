@implementation _UISheetPresentationControllerConfiguration

- (void)_setWantsBottomAttached:(BOOL)a3
{
  self->__wantsBottomAttached = a3;
}

- (void)_setWidthFollowsPreferredContentSizeWhenEdgeAttached:(BOOL)a3
{
  self->__widthFollowsPreferredContentSizeWhenEdgeAttached = a3;
}

- (void)_setWantsFullScreen:(BOOL)a3
{
  self->__wantsFullScreen = a3;
}

- (void)_setWantsEdgeAttachedInCompactHeight:(BOOL)a3
{
  self->__wantsEdgeAttachedInCompactHeight = a3;
}

- (void)_setStandardAppearance:(id)a3
{
  objc_storeStrong((id *)&self->__standardAppearance, a3);
}

- (void)_setSelectedDetentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)_setPrefersScrollingResizesWhenDetentDirectionIsDown:(BOOL)a3
{
  self->__prefersScrollingResizesWhenDetentDirectionIsDown = a3;
}

- (void)_setPrefersScrollingExpandsToLargerDetentWhenScrolledToEdge:(BOOL)a3
{
  self->__prefersScrollingExpandsToLargerDetentWhenScrolledToEdge = a3;
}

- (void)_setPreferredCornerRadius:(double)a3
{
  self->__preferredCornerRadius = a3;
}

- (void)_setPeeksWhenFloating:(BOOL)a3
{
  self->__peeksWhenFloating = a3;
}

- (void)_setMode:(int64_t)a3
{
  self->__mode = a3;
}

- (void)_setInsetsPresentedViewForGrabber:(BOOL)a3
{
  self->__insetsPresentedViewForGrabber = a3;
}

- (void)_setGrabberTopSpacing:(double)a3
{
  self->__grabberTopSpacing = a3;
}

- (void)_setFloatingAppearance:(id)a3
{
  objc_storeStrong((id *)&self->__floatingAppearance, a3);
}

- (void)_setEdgeAttachedCompactHeightAppearance:(id)a3
{
  objc_storeStrong((id *)&self->__edgeAttachedCompactHeightAppearance, a3);
}

- (void)_setDetents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)_setDetentDirectionWhenFloating:(int64_t)a3
{
  self->__detentDirectionWhenFloating = a3;
}

- (void)_setCornerRadiusForPresentationAndDismissal:(double)a3
{
  self->__cornerRadiusForPresentationAndDismissal = a3;
}

- (void)_setAdditionalMinimumTopInset:(double)a3
{
  self->__additionalMinimumTopInset = a3;
}

- (void)_prefersGrabberVisible:(BOOL)a3
{
  self->__prefersGrabberVisible = a3;
}

- (_UISheetPresentationControllerConfiguration)init
{
  char *v2;
  char *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)_UISheetPresentationControllerConfiguration;
  v2 = -[_UISheetPresentationControllerConfiguration init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2[8] = 1;
    *(_OWORD *)(v2 + 24) = xmmword_186681FA0;
    _UIFallbackSheetMetrics();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)v3 + 5) = objc_msgSend(v4, "defaultMode");

    *((int64x2_t *)v3 + 3) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    _UIFallbackSheetMetrics();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredShadowOpacity");
    *((_QWORD *)v3 + 8) = v6;

    _UIFallbackSheetMetrics();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shadowRadius");
    *((_QWORD *)v3 + 9) = v8;

    +[UISheetPresentationControllerDetent largeDetent](UISheetPresentationControllerDetent, "largeDetent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v3 + 10);
    *((_QWORD *)v3 + 10) = v10;

    +[_UISheetPresentationControllerAppearance appearancePreferringDimmingVisible:](_UISheetPresentationControllerAppearance, "appearancePreferringDimmingVisible:", 1);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v3 + 12);
    *((_QWORD *)v3 + 12) = v12;

    *(_WORD *)(v3 + 15) = 257;
    v14 = *MEMORY[0x1E0C9D628];
    v15 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v3 + 136) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v3 + 152) = v15;
    *(_OWORD *)(v3 + 168) = v14;
    *(_OWORD *)(v3 + 184) = v15;
  }
  return (_UISheetPresentationControllerConfiguration *)v3;
}

- (void)_setHostParentStackAlignmentFrame:(CGRect)a3
{
  self->__hostParentStackAlignmentFrame = a3;
}

- (void)_setHostParentFullHeightUntransformedFrameForDepthLevel:(CGRect)a3
{
  self->__hostParentFullHeightUntransformedFrameForDepthLevel = a3;
}

- (void)_setHostParentDepthLevel:(double)a3
{
  self->__hostParentDepthLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__floatingAppearance, 0);
  objc_storeStrong((id *)&self->__edgeAttachedCompactHeightAppearance, 0);
  objc_storeStrong((id *)&self->__standardAppearance, 0);
  objc_storeStrong((id *)&self->__selectedDetentIdentifier, 0);
  objc_storeStrong((id *)&self->__detents, 0);
}

+ (_UISheetPresentationControllerConfiguration)_fullScreenConfiguration
{
  _UISheetPresentationControllerConfiguration *v2;

  v2 = objc_alloc_init(_UISheetPresentationControllerConfiguration);
  -[_UISheetPresentationControllerConfiguration _setWantsFullScreen:](v2, "_setWantsFullScreen:", 1);
  return v2;
}

- (BOOL)_isEqual:(id)a3 onlyCheckPropertiesRequiringFencing:(BOOL)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  int64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int64_t v42;
  int v43;
  int v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  BOOL v69;
  double v70;
  double v71;
  double v72;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    v8 = -[_UISheetPresentationControllerConfiguration _peeksWhenFloating](self, "_peeksWhenFloating");
    if (v8 != objc_msgSend(v7, "_peeksWhenFloating"))
      goto LABEL_27;
    v9 = -[_UISheetPresentationControllerConfiguration _wantsFullScreen](self, "_wantsFullScreen");
    if (v9 != objc_msgSend(v7, "_wantsFullScreen"))
      goto LABEL_27;
    v10 = -[_UISheetPresentationControllerConfiguration _wantsBottomAttached](self, "_wantsBottomAttached");
    if (v10 != objc_msgSend(v7, "_wantsBottomAttached"))
      goto LABEL_27;
    v11 = -[_UISheetPresentationControllerConfiguration _wantsEdgeAttachedInCompactHeight](self, "_wantsEdgeAttachedInCompactHeight");
    if (v11 != objc_msgSend(v7, "_wantsEdgeAttachedInCompactHeight"))
      goto LABEL_27;
    v12 = -[_UISheetPresentationControllerConfiguration _widthFollowsPreferredContentSizeWhenEdgeAttached](self, "_widthFollowsPreferredContentSizeWhenEdgeAttached");
    if (v12 != objc_msgSend(v7, "_widthFollowsPreferredContentSizeWhenEdgeAttached"))
      goto LABEL_27;
    v13 = -[_UISheetPresentationControllerConfiguration _prefersGrabberVisible](self, "_prefersGrabberVisible");
    if (v13 != objc_msgSend(v7, "_prefersGrabberVisible"))
      goto LABEL_27;
    -[_UISheetPresentationControllerConfiguration _grabberTopSpacing](self, "_grabberTopSpacing");
    v15 = v14;
    objc_msgSend(v7, "_grabberTopSpacing");
    if (v15 != v16)
      goto LABEL_27;
    -[_UISheetPresentationControllerConfiguration _additionalMinimumTopInset](self, "_additionalMinimumTopInset");
    v18 = v17;
    objc_msgSend(v7, "_additionalMinimumTopInset");
    if (v18 != v19)
      goto LABEL_27;
    v20 = -[_UISheetPresentationControllerConfiguration _insetsPresentedViewForGrabber](self, "_insetsPresentedViewForGrabber");
    if (v20 != objc_msgSend(v7, "_insetsPresentedViewForGrabber"))
      goto LABEL_27;
    v21 = -[_UISheetPresentationControllerConfiguration _mode](self, "_mode");
    if (v21 != objc_msgSend(v7, "_mode"))
      goto LABEL_27;
    -[_UISheetPresentationControllerConfiguration _cornerRadiusForPresentationAndDismissal](self, "_cornerRadiusForPresentationAndDismissal");
    v23 = v22;
    objc_msgSend(v7, "_cornerRadiusForPresentationAndDismissal");
    if (v23 != v24)
      goto LABEL_27;
    -[_UISheetPresentationControllerConfiguration _preferredCornerRadius](self, "_preferredCornerRadius");
    v26 = v25;
    objc_msgSend(v7, "_preferredCornerRadius");
    if (v26 != v27)
      goto LABEL_27;
    -[_UISheetPresentationControllerConfiguration _preferredShadowOpacity](self, "_preferredShadowOpacity");
    v29 = v28;
    objc_msgSend(v7, "_preferredShadowOpacity");
    if (v29 == v30
      && (-[_UISheetPresentationControllerConfiguration _shadowRadius](self, "_shadowRadius"),
          v32 = v31,
          objc_msgSend(v7, "_shadowRadius"),
          v32 == v33))
    {
      -[_UISheetPresentationControllerConfiguration _detents](self, "_detents");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_detents");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "isEqual:", v35))
      {
        -[_UISheetPresentationControllerConfiguration _selectedDetentIdentifier](self, "_selectedDetentIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_selectedDetentIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (UIEqual(v36, v37))
        {
          -[_UISheetPresentationControllerConfiguration _standardAppearance](self, "_standardAppearance");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "_standardAppearance");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = v38;
          if (UIEqual(v38, v39))
          {
            -[_UISheetPresentationControllerConfiguration _edgeAttachedCompactHeightAppearance](self, "_edgeAttachedCompactHeightAppearance");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "_edgeAttachedCompactHeightAppearance");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = v40;
            if (UIEqual(v40, v76))
            {
              -[_UISheetPresentationControllerConfiguration _floatingAppearance](self, "_floatingAppearance");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "_floatingAppearance");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = v41;
              if (!UIEqual(v41, v74))
                goto LABEL_36;
              v42 = -[_UISheetPresentationControllerConfiguration _detentDirectionWhenFloating](self, "_detentDirectionWhenFloating");
              if (v42 != objc_msgSend(v7, "_detentDirectionWhenFloating"))
                goto LABEL_36;
              v43 = -[_UISheetPresentationControllerConfiguration _prefersScrollingResizesWhenDetentDirectionIsDown](self, "_prefersScrollingResizesWhenDetentDirectionIsDown");
              if (v43 != objc_msgSend(v7, "_prefersScrollingResizesWhenDetentDirectionIsDown"))
                goto LABEL_36;
              v44 = -[_UISheetPresentationControllerConfiguration _prefersScrollingExpandsToLargerDetentWhenScrolledToEdge](self, "_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge");
              if (v44 != objc_msgSend(v7, "_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"))
                goto LABEL_36;
              -[_UISheetPresentationControllerConfiguration _hostParentStackAlignmentFrame](self, "_hostParentStackAlignmentFrame");
              v46 = v45;
              v48 = v47;
              v50 = v49;
              v52 = v51;
              objc_msgSend(v7, "_hostParentStackAlignmentFrame");
              v81.origin.x = v53;
              v81.origin.y = v54;
              v81.size.width = v55;
              v81.size.height = v56;
              v79.origin.x = v46;
              v79.origin.y = v48;
              v79.size.width = v50;
              v79.size.height = v52;
              if (CGRectEqualToRect(v79, v81))
              {
                -[_UISheetPresentationControllerConfiguration _hostParentFullHeightUntransformedFrameForDepthLevel](self, "_hostParentFullHeightUntransformedFrameForDepthLevel");
                v58 = v57;
                v60 = v59;
                v62 = v61;
                v64 = v63;
                objc_msgSend(v7, "_hostParentFullHeightUntransformedFrameForDepthLevel");
                v82.origin.x = v65;
                v82.origin.y = v66;
                v82.size.width = v67;
                v82.size.height = v68;
                v80.origin.x = v58;
                v80.origin.y = v60;
                v80.size.width = v62;
                v80.size.height = v64;
                v69 = CGRectEqualToRect(v80, v82);
              }
              else
              {
LABEL_36:
                v69 = 0;
              }

            }
            else
            {
              v69 = 0;
            }

          }
          else
          {
            v69 = 0;
          }

        }
        else
        {
          v69 = 0;
        }

      }
      else
      {
        v69 = 0;
      }

      if (a4)
        goto LABEL_30;
    }
    else
    {
LABEL_27:
      v69 = 0;
      if (a4)
      {
LABEL_30:

        goto LABEL_31;
      }
    }
    -[_UISheetPresentationControllerConfiguration _hostParentDepthLevel](self, "_hostParentDepthLevel");
    v71 = v70;
    objc_msgSend(v7, "_hostParentDepthLevel");
    if (v71 != v72)
      v69 = 0;
    goto LABEL_30;
  }
  v69 = 0;
LABEL_31:

  return v69;
}

- (BOOL)_shouldFenceChangeToConfiguration:(id)a3
{
  return !-[_UISheetPresentationControllerConfiguration _isEqual:onlyCheckPropertiesRequiringFencing:](self, "_isEqual:onlyCheckPropertiesRequiringFencing:", a3, 1);
}

- (BOOL)isEqual:(id)a3
{
  return -[_UISheetPresentationControllerConfiguration _isEqual:onlyCheckPropertiesRequiringFencing:](self, "_isEqual:onlyCheckPropertiesRequiringFencing:", a3, 0);
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[27];

  v32[25] = *MEMORY[0x1E0C80C00];
  +[UIDescriptionBuilder descriptionBuilderWithObject:](UIDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__peeksWhenFloating);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v30;
  NSStringFromSelector(sel__wantsFullScreen);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v29;
  NSStringFromSelector(sel__wantsBottomAttached);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v28;
  NSStringFromSelector(sel__wantsEdgeAttachedInCompactHeight);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v27;
  NSStringFromSelector(sel__widthFollowsPreferredContentSizeWhenEdgeAttached);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v26;
  NSStringFromSelector(sel__prefersGrabberVisible);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v25;
  NSStringFromSelector(sel__grabberTopSpacing);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v24;
  NSStringFromSelector(sel__additionalMinimumTopInset);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v23;
  NSStringFromSelector(sel__insetsPresentedViewForGrabber);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[8] = v20;
  NSStringFromSelector(sel__mode);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[9] = v19;
  NSStringFromSelector(sel__cornerRadiusForPresentationAndDismissal);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[10] = v18;
  NSStringFromSelector(sel__preferredCornerRadius);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[11] = v17;
  NSStringFromSelector(sel__preferredShadowOpacity);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[12] = v16;
  NSStringFromSelector(sel__shadowRadius);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[13] = v15;
  NSStringFromSelector(sel__detents);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[14] = v14;
  NSStringFromSelector(sel__selectedDetentIdentifier);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[15] = v13;
  NSStringFromSelector(sel__standardAppearance);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v32[16] = v2;
  NSStringFromSelector(sel__edgeAttachedCompactHeightAppearance);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32[17] = v3;
  NSStringFromSelector(sel__floatingAppearance);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32[18] = v4;
  NSStringFromSelector(sel__detentDirectionWhenFloating);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32[19] = v5;
  NSStringFromSelector(sel__prefersScrollingResizesWhenDetentDirectionIsDown);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[20] = v6;
  NSStringFromSelector(sel__prefersScrollingExpandsToLargerDetentWhenScrolledToEdge);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32[21] = v7;
  NSStringFromSelector(sel__hostParentDepthLevel);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[22] = v8;
  NSStringFromSelector(sel__hostParentStackAlignmentFrame);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32[23] = v9;
  NSStringFromSelector(sel__hostParentFullHeightUntransformedFrameForDepthLevel);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[24] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v11);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  return (NSString *)v22;
}

- (_UISheetPresentationControllerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _UISheetPresentationControllerConfiguration *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *detents;
  uint64_t v17;
  NSString *selectedDetentIdentifier;
  uint64_t v19;
  _UISheetPresentationControllerAppearance *standardAppearance;
  uint64_t v21;
  _UISheetPresentationControllerAppearance *edgeAttachedCompactHeightAppearance;
  uint64_t v23;
  _UISheetPresentationControllerAppearance *floatingAppearance;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_UISheetPresentationControllerConfiguration;
  v5 = -[_UISheetPresentationControllerConfiguration init](&v35, sel_init);
  if (v5)
  {
    v5->__peeksWhenFloating = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_peeksWhenFloating"));
    v5->__wantsFullScreen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_wantsFullScreen"));
    v5->__wantsBottomAttached = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_wantsBottomAttached"));
    v5->__wantsEdgeAttachedInCompactHeight = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_wantsEdgeAttachedInCompactHeight"));
    v5->__widthFollowsPreferredContentSizeWhenEdgeAttached = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_widthFollowsPreferredContentSizeWhenEdgeAttached"));
    v5->__prefersGrabberVisible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_prefersGrabberVisible"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_grabberTopSpacing"));
    v5->__grabberTopSpacing = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_additionalMinimumTopInset"));
    v5->__additionalMinimumTopInset = v7;
    v5->__insetsPresentedViewForGrabber = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_insetsPresentedViewForGrabber"));
    v5->__mode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_mode"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_cornerRadiusForPresentationAndDismissal"));
    v5->__cornerRadiusForPresentationAndDismissal = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_preferredCornerRadius"));
    v5->__preferredCornerRadius = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_preferredShadowOpacity"));
    v5->__preferredShadowOpacity = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_shadowRadius"));
    v5->__shadowRadius = v11;
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("_detents"));
    v15 = objc_claimAutoreleasedReturnValue();
    detents = v5->__detents;
    v5->__detents = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_selectedDetentIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    selectedDetentIdentifier = v5->__selectedDetentIdentifier;
    v5->__selectedDetentIdentifier = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_standardAppearance"));
    v19 = objc_claimAutoreleasedReturnValue();
    standardAppearance = v5->__standardAppearance;
    v5->__standardAppearance = (_UISheetPresentationControllerAppearance *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_edgeAttachedCompactHeightAppearance"));
    v21 = objc_claimAutoreleasedReturnValue();
    edgeAttachedCompactHeightAppearance = v5->__edgeAttachedCompactHeightAppearance;
    v5->__edgeAttachedCompactHeightAppearance = (_UISheetPresentationControllerAppearance *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_floatingAppearance"));
    v23 = objc_claimAutoreleasedReturnValue();
    floatingAppearance = v5->__floatingAppearance;
    v5->__floatingAppearance = (_UISheetPresentationControllerAppearance *)v23;

    v5->__detentDirectionWhenFloating = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_detentDirectionWhenFloating"));
    v5->__prefersScrollingResizesWhenDetentDirectionIsDown = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_prefersScrollingResizesWhenDetentDirectionIsDown"));
    v5->__prefersScrollingExpandsToLargerDetentWhenScrolledToEdge = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_hostParentDepthLevel"));
    v5->__hostParentDepthLevel = v25;
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("_hostParentStackAlignmentFrame"));
    v5->__hostParentStackAlignmentFrame.origin.x = v26;
    v5->__hostParentStackAlignmentFrame.origin.y = v27;
    v5->__hostParentStackAlignmentFrame.size.width = v28;
    v5->__hostParentStackAlignmentFrame.size.height = v29;
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("_hostParentFullHeightUntransformedFrameForDepthLevel"));
    v5->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.x = v30;
    v5->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.y = v31;
    v5->__hostParentFullHeightUntransformedFrameForDepthLevel.size.width = v32;
    v5->__hostParentFullHeightUntransformedFrameForDepthLevel.size.height = v33;
  }

  return v5;
}

- (_UISheetPresentationControllerConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  _UISheetPresentationControllerConfiguration *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *detents;
  uint64_t v15;
  NSString *selectedDetentIdentifier;
  uint64_t v17;
  _UISheetPresentationControllerAppearance *standardAppearance;
  uint64_t v19;
  _UISheetPresentationControllerAppearance *edgeAttachedCompactHeightAppearance;
  uint64_t v21;
  _UISheetPresentationControllerAppearance *floatingAppearance;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)_UISheetPresentationControllerConfiguration;
  v5 = -[_UISheetPresentationControllerConfiguration init](&v33, sel_init);
  if (v5)
  {
    v5->__peeksWhenFloating = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_peeksWhenFloating"));
    v5->__wantsFullScreen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_wantsFullScreen"));
    v5->__wantsBottomAttached = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_wantsBottomAttached"));
    v5->__wantsEdgeAttachedInCompactHeight = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_wantsEdgeAttachedInCompactHeight"));
    v5->__widthFollowsPreferredContentSizeWhenEdgeAttached = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_widthFollowsPreferredContentSizeWhenEdgeAttached"));
    v5->__prefersGrabberVisible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_prefersGrabberVisible"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_grabberTopSpacing"));
    v5->__grabberTopSpacing = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_additionalMinimumTopInset"));
    v5->__additionalMinimumTopInset = v7;
    v5->__insetsPresentedViewForGrabber = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_insetsPresentedViewForGrabber"));
    v5->__mode = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_mode"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_cornerRadiusForPresentationAndDismissal"));
    v5->__cornerRadiusForPresentationAndDismissal = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_preferredCornerRadius"));
    v5->__preferredCornerRadius = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_preferredShadowOpacity"));
    v5->__preferredShadowOpacity = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_shadowRadius"));
    v5->__shadowRadius = v11;
    v12 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v12, objc_opt_class(), CFSTR("_detents"));
    v13 = objc_claimAutoreleasedReturnValue();
    detents = v5->__detents;
    v5->__detents = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_selectedDetentIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    selectedDetentIdentifier = v5->__selectedDetentIdentifier;
    v5->__selectedDetentIdentifier = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_standardAppearance"));
    v17 = objc_claimAutoreleasedReturnValue();
    standardAppearance = v5->__standardAppearance;
    v5->__standardAppearance = (_UISheetPresentationControllerAppearance *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_edgeAttachedCompactHeightAppearance"));
    v19 = objc_claimAutoreleasedReturnValue();
    edgeAttachedCompactHeightAppearance = v5->__edgeAttachedCompactHeightAppearance;
    v5->__edgeAttachedCompactHeightAppearance = (_UISheetPresentationControllerAppearance *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_floatingAppearance"));
    v21 = objc_claimAutoreleasedReturnValue();
    floatingAppearance = v5->__floatingAppearance;
    v5->__floatingAppearance = (_UISheetPresentationControllerAppearance *)v21;

    v5->__detentDirectionWhenFloating = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_detentDirectionWhenFloating"));
    v5->__prefersScrollingResizesWhenDetentDirectionIsDown = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_prefersScrollingResizesWhenDetentDirectionIsDown"));
    v5->__prefersScrollingExpandsToLargerDetentWhenScrolledToEdge = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_hostParentDepthLevel"));
    v5->__hostParentDepthLevel = v23;
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("_hostParentStackAlignmentFrame"));
    v5->__hostParentStackAlignmentFrame.origin.x = v24;
    v5->__hostParentStackAlignmentFrame.origin.y = v25;
    v5->__hostParentStackAlignmentFrame.size.width = v26;
    v5->__hostParentStackAlignmentFrame.size.height = v27;
    objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("_hostParentFullHeightUntransformedFrameForDepthLevel"));
    v5->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.x = v28;
    v5->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.y = v29;
    v5->__hostParentFullHeightUntransformedFrameForDepthLevel.size.width = v30;
    v5->__hostParentFullHeightUntransformedFrameForDepthLevel.size.height = v31;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _peeksWhenFloating](self, "_peeksWhenFloating"), CFSTR("_peeksWhenFloating"));
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _wantsFullScreen](self, "_wantsFullScreen"), CFSTR("_wantsFullScreen"));
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _wantsBottomAttached](self, "_wantsBottomAttached"), CFSTR("_wantsBottomAttached"));
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _wantsEdgeAttachedInCompactHeight](self, "_wantsEdgeAttachedInCompactHeight"), CFSTR("_wantsEdgeAttachedInCompactHeight"));
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _widthFollowsPreferredContentSizeWhenEdgeAttached](self, "_widthFollowsPreferredContentSizeWhenEdgeAttached"), CFSTR("_widthFollowsPreferredContentSizeWhenEdgeAttached"));
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _prefersGrabberVisible](self, "_prefersGrabberVisible"), CFSTR("_prefersGrabberVisible"));
  -[_UISheetPresentationControllerConfiguration _grabberTopSpacing](self, "_grabberTopSpacing");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("_grabberTopSpacing"));
  -[_UISheetPresentationControllerConfiguration _additionalMinimumTopInset](self, "_additionalMinimumTopInset");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("_additionalMinimumTopInset"));
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _insetsPresentedViewForGrabber](self, "_insetsPresentedViewForGrabber"), CFSTR("_insetsPresentedViewForGrabber"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[_UISheetPresentationControllerConfiguration _mode](self, "_mode"), CFSTR("_mode"));
  -[_UISheetPresentationControllerConfiguration _cornerRadiusForPresentationAndDismissal](self, "_cornerRadiusForPresentationAndDismissal");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("_cornerRadiusForPresentationAndDismissal"));
  -[_UISheetPresentationControllerConfiguration _preferredCornerRadius](self, "_preferredCornerRadius");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("_preferredCornerRadius"));
  -[_UISheetPresentationControllerConfiguration _preferredShadowOpacity](self, "_preferredShadowOpacity");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("_preferredShadowOpacity"));
  -[_UISheetPresentationControllerConfiguration _shadowRadius](self, "_shadowRadius");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("_shadowRadius"));
  -[_UISheetPresentationControllerConfiguration _detents](self, "_detents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("_detents"));

  -[_UISheetPresentationControllerConfiguration _selectedDetentIdentifier](self, "_selectedDetentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("_selectedDetentIdentifier"));

  -[_UISheetPresentationControllerConfiguration _standardAppearance](self, "_standardAppearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("_standardAppearance"));

  -[_UISheetPresentationControllerConfiguration _edgeAttachedCompactHeightAppearance](self, "_edgeAttachedCompactHeightAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("_edgeAttachedCompactHeightAppearance"));

  -[_UISheetPresentationControllerConfiguration _floatingAppearance](self, "_floatingAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("_floatingAppearance"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[_UISheetPresentationControllerConfiguration _detentDirectionWhenFloating](self, "_detentDirectionWhenFloating"), CFSTR("_detentDirectionWhenFloating"));
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _prefersScrollingResizesWhenDetentDirectionIsDown](self, "_prefersScrollingResizesWhenDetentDirectionIsDown"), CFSTR("_prefersScrollingResizesWhenDetentDirectionIsDown"));
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _prefersScrollingExpandsToLargerDetentWhenScrolledToEdge](self, "_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"), CFSTR("_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"));
  -[_UISheetPresentationControllerConfiguration _hostParentDepthLevel](self, "_hostParentDepthLevel");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("_hostParentDepthLevel"));
  -[_UISheetPresentationControllerConfiguration _hostParentStackAlignmentFrame](self, "_hostParentStackAlignmentFrame");
  objc_msgSend(v9, "encodeCGRect:forKey:", CFSTR("_hostParentStackAlignmentFrame"));
  -[_UISheetPresentationControllerConfiguration _hostParentFullHeightUntransformedFrameForDepthLevel](self, "_hostParentFullHeightUntransformedFrameForDepthLevel");
  objc_msgSend(v9, "encodeCGRect:forKey:", CFSTR("_hostParentFullHeightUntransformedFrameForDepthLevel"));

}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _peeksWhenFloating](self, "_peeksWhenFloating"), CFSTR("_peeksWhenFloating"));
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _wantsFullScreen](self, "_wantsFullScreen"), CFSTR("_wantsFullScreen"));
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _wantsBottomAttached](self, "_wantsBottomAttached"), CFSTR("_wantsBottomAttached"));
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _wantsEdgeAttachedInCompactHeight](self, "_wantsEdgeAttachedInCompactHeight"), CFSTR("_wantsEdgeAttachedInCompactHeight"));
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _widthFollowsPreferredContentSizeWhenEdgeAttached](self, "_widthFollowsPreferredContentSizeWhenEdgeAttached"), CFSTR("_widthFollowsPreferredContentSizeWhenEdgeAttached"));
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _prefersGrabberVisible](self, "_prefersGrabberVisible"), CFSTR("_prefersGrabberVisible"));
  -[_UISheetPresentationControllerConfiguration _grabberTopSpacing](self, "_grabberTopSpacing");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("_grabberTopSpacing"));
  -[_UISheetPresentationControllerConfiguration _additionalMinimumTopInset](self, "_additionalMinimumTopInset");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("_additionalMinimumTopInset"));
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _insetsPresentedViewForGrabber](self, "_insetsPresentedViewForGrabber"), CFSTR("_insetsPresentedViewForGrabber"));
  objc_msgSend(v9, "encodeInt64:forKey:", -[_UISheetPresentationControllerConfiguration _mode](self, "_mode"), CFSTR("_mode"));
  -[_UISheetPresentationControllerConfiguration _cornerRadiusForPresentationAndDismissal](self, "_cornerRadiusForPresentationAndDismissal");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("_cornerRadiusForPresentationAndDismissal"));
  -[_UISheetPresentationControllerConfiguration _preferredCornerRadius](self, "_preferredCornerRadius");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("_preferredCornerRadius"));
  -[_UISheetPresentationControllerConfiguration _preferredShadowOpacity](self, "_preferredShadowOpacity");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("_preferredShadowOpacity"));
  -[_UISheetPresentationControllerConfiguration _shadowRadius](self, "_shadowRadius");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("_shadowRadius"));
  -[_UISheetPresentationControllerConfiguration _detents](self, "_detents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeCollection:forKey:", v4, CFSTR("_detents"));

  -[_UISheetPresentationControllerConfiguration _selectedDetentIdentifier](self, "_selectedDetentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("_selectedDetentIdentifier"));

  -[_UISheetPresentationControllerConfiguration _standardAppearance](self, "_standardAppearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("_standardAppearance"));

  -[_UISheetPresentationControllerConfiguration _edgeAttachedCompactHeightAppearance](self, "_edgeAttachedCompactHeightAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("_edgeAttachedCompactHeightAppearance"));

  -[_UISheetPresentationControllerConfiguration _floatingAppearance](self, "_floatingAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("_floatingAppearance"));

  objc_msgSend(v9, "encodeInt64:forKey:", -[_UISheetPresentationControllerConfiguration _detentDirectionWhenFloating](self, "_detentDirectionWhenFloating"), CFSTR("_detentDirectionWhenFloating"));
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _prefersScrollingResizesWhenDetentDirectionIsDown](self, "_prefersScrollingResizesWhenDetentDirectionIsDown"), CFSTR("_prefersScrollingResizesWhenDetentDirectionIsDown"));
  objc_msgSend(v9, "encodeBool:forKey:", -[_UISheetPresentationControllerConfiguration _prefersScrollingExpandsToLargerDetentWhenScrolledToEdge](self, "_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"), CFSTR("_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"));
  -[_UISheetPresentationControllerConfiguration _hostParentDepthLevel](self, "_hostParentDepthLevel");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("_hostParentDepthLevel"));
  -[_UISheetPresentationControllerConfiguration _hostParentStackAlignmentFrame](self, "_hostParentStackAlignmentFrame");
  objc_msgSend(v9, "encodeCGRect:forKey:", CFSTR("_hostParentStackAlignmentFrame"));
  -[_UISheetPresentationControllerConfiguration _hostParentFullHeightUntransformedFrameForDepthLevel](self, "_hostParentFullHeightUntransformedFrameForDepthLevel");
  objc_msgSend(v9, "encodeCGRect:forKey:", CFSTR("_hostParentFullHeightUntransformedFrameForDepthLevel"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BOOL)_peeksWhenFloating
{
  return self->__peeksWhenFloating;
}

- (BOOL)_wantsFullScreen
{
  return self->__wantsFullScreen;
}

- (BOOL)_wantsBottomAttached
{
  return self->__wantsBottomAttached;
}

- (BOOL)_wantsEdgeAttachedInCompactHeight
{
  return self->__wantsEdgeAttachedInCompactHeight;
}

- (BOOL)_widthFollowsPreferredContentSizeWhenEdgeAttached
{
  return self->__widthFollowsPreferredContentSizeWhenEdgeAttached;
}

- (BOOL)_prefersGrabberVisible
{
  return self->__prefersGrabberVisible;
}

- (double)_grabberTopSpacing
{
  return self->__grabberTopSpacing;
}

- (double)_additionalMinimumTopInset
{
  return self->__additionalMinimumTopInset;
}

- (BOOL)_insetsPresentedViewForGrabber
{
  return self->__insetsPresentedViewForGrabber;
}

- (int64_t)_mode
{
  return self->__mode;
}

- (double)_cornerRadiusForPresentationAndDismissal
{
  return self->__cornerRadiusForPresentationAndDismissal;
}

- (double)_preferredCornerRadius
{
  return self->__preferredCornerRadius;
}

- (double)_preferredShadowOpacity
{
  return self->__preferredShadowOpacity;
}

- (void)_setPreferredShadowOpacity:(double)a3
{
  self->__preferredShadowOpacity = a3;
}

- (double)_shadowRadius
{
  return self->__shadowRadius;
}

- (void)_setShadowRadius:(double)a3
{
  self->__shadowRadius = a3;
}

- (NSArray)_detents
{
  return self->__detents;
}

- (NSString)_selectedDetentIdentifier
{
  return self->__selectedDetentIdentifier;
}

- (_UISheetPresentationControllerAppearance)_standardAppearance
{
  return self->__standardAppearance;
}

- (_UISheetPresentationControllerAppearance)_edgeAttachedCompactHeightAppearance
{
  return self->__edgeAttachedCompactHeightAppearance;
}

- (_UISheetPresentationControllerAppearance)_floatingAppearance
{
  return self->__floatingAppearance;
}

- (int64_t)_detentDirectionWhenFloating
{
  return self->__detentDirectionWhenFloating;
}

- (BOOL)_prefersScrollingResizesWhenDetentDirectionIsDown
{
  return self->__prefersScrollingResizesWhenDetentDirectionIsDown;
}

- (BOOL)_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge
{
  return self->__prefersScrollingExpandsToLargerDetentWhenScrolledToEdge;
}

- (double)_hostParentDepthLevel
{
  return self->__hostParentDepthLevel;
}

- (CGRect)_hostParentStackAlignmentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__hostParentStackAlignmentFrame.origin.x;
  y = self->__hostParentStackAlignmentFrame.origin.y;
  width = self->__hostParentStackAlignmentFrame.size.width;
  height = self->__hostParentStackAlignmentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_hostParentFullHeightUntransformedFrameForDepthLevel
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.x;
  y = self->__hostParentFullHeightUntransformedFrameForDepthLevel.origin.y;
  width = self->__hostParentFullHeightUntransformedFrameForDepthLevel.size.width;
  height = self->__hostParentFullHeightUntransformedFrameForDepthLevel.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
