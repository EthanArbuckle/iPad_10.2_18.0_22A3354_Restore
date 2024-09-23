@implementation SBSwitcherChamoisSettings

- (id)layoutAttributesForWindowScene:(id)a3 interfaceOrientation:(int64_t)a4 requiresFullScreen:(BOOL)a5 floatingDockHeight:(double)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  int v12;
  _BOOL8 v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double Width;
  double Height;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v7 = a5;
  v10 = a3;
  objc_msgSend(v10, "switcherController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isChamoisWindowingUIEnabled");

  if (v12)
  {
    v13 = -[SBSwitcherChamoisSettings _shouldPreferStripHiddenForWindowScene:interfaceOrientation:](self, "_shouldPreferStripHiddenForWindowScene:interfaceOrientation:", v10, a4);
    v14 = -[SBSwitcherChamoisSettings _shouldPreferDockHiddenForWindowScene:](self, "_shouldPreferDockHiddenForWindowScene:", v10);
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }
  objc_msgSend(v10, "screen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = *MEMORY[0x1E0C9D538];
  v26 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v12 && !objc_msgSend(v10, "isMainDisplayWindowScene"))
  {
    v46.origin.x = v18;
    v46.origin.y = v20;
    v46.size.width = v22;
    v46.size.height = v24;
    Width = CGRectGetWidth(v46);
    v47.origin.x = v18;
    v47.origin.y = v20;
    v47.size.width = v22;
    v47.size.height = v24;
    Height = CGRectGetHeight(v47);
    v43 = a6;
    if (Width >= Height)
      v33 = Width;
    else
      v33 = Height;
    v48.origin.x = v18;
    v48.origin.y = v20;
    v48.size.width = v22;
    v48.size.height = v24;
    v34 = CGRectGetWidth(v48);
    v49.origin.x = v18;
    v49.origin.y = v20;
    v49.size.width = v22;
    v49.size.height = v24;
    v35 = CGRectGetHeight(v49);
    if (v34 >= v35)
      v24 = v35;
    else
      v24 = v34;
    -[SBSwitcherChamoisSettings _statusBarHeight](self, "_statusBarHeight");
    v29 = v36;
    v22 = v33;
    a6 = v43;
LABEL_17:
    v30 = objc_msgSend(v10, "isExternalDisplayWindowScene") ^ 1;
    goto LABEL_18;
  }
  if ((unint64_t)(a4 - 1) >= 2)
  {
    v44.origin.x = v18;
    v44.origin.y = v20;
    v44.size.width = v22;
    v44.size.height = v24;
    v27 = CGRectGetHeight(v44);
    v45.origin.x = v18;
    v45.origin.y = v20;
    v45.size.width = v22;
    v45.size.height = v24;
    v24 = CGRectGetWidth(v45);
    v22 = v27;
  }
  -[SBSwitcherChamoisSettings _statusBarHeight](self, "_statusBarHeight");
  v29 = v28;
  if (v12)
    goto LABEL_17;
  v30 = 1;
LABEL_18:
  objc_msgSend(v15, "nativeBounds");
  -[SBSwitcherChamoisSettings layoutAttributesForContainerBounds:nativeContainerReferencePixelBounds:interfaceOrientation:floatingDockHeight:statusBarHeight:requiresFullScreen:prefersStripHidden:prefersDockHidden:isEmbeddedDisplay:](self, "layoutAttributesForContainerBounds:nativeContainerReferencePixelBounds:interfaceOrientation:floatingDockHeight:statusBarHeight:requiresFullScreen:prefersStripHidden:prefersDockHidden:isEmbeddedDisplay:", a4, v7, v13, v14, v30, v25, v26, v22, v24, v37, v38, v39, v40, *(_QWORD *)&a6, v29);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (id)layoutAttributesForContainerBounds:(CGRect)a3 nativeContainerReferencePixelBounds:(CGRect)a4 interfaceOrientation:(int64_t)a5 floatingDockHeight:(double)a6 statusBarHeight:(double)a7 requiresFullScreen:(BOOL)a8 prefersStripHidden:(BOOL)a9 prefersDockHidden:(BOOL)a10 isEmbeddedDisplay:(BOOL)a11
{
  _BOOL8 v11;
  CGFloat y;
  CGFloat x;
  double height;
  double v16;
  CGFloat v17;
  CGFloat v18;
  _BOOL4 v20;
  _BOOL4 v21;
  int v22;
  int *v23;
  int *v24;
  int *v25;
  int *v26;
  int *v27;
  int *v28;
  int *v29;
  BOOL v30;
  _BOOL8 v31;
  _BOOL8 v32;
  _BOOL8 v33;
  double v34;
  double v35;
  uint64_t v36;
  unint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  unint64_t v47;
  void *v48;
  _BOOL4 v49;
  double v50;
  SBSwitcherChamoisSettings *v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  SBSwitcherChamoisSettings *v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  SBSwitcherChamoisLayoutAttributes *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  SBSwitcherChamoisLayoutAttributes *cachedChamoisLayoutAttributes;
  double v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  BOOL v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  unint64_t v107;
  _BOOL4 v108;
  void *v109;
  _BOOL4 v110;
  double v111;
  CGFloat width;
  double v113;
  _BOOL4 v114;
  CGFloat rect2;
  double rect2a;
  double v117;
  double v118;
  CGRect v119;
  CGRect v120;

  v11 = a11;
  v108 = a10;
  v110 = a9;
  v114 = a8;
  rect2 = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  height = a3.size.height;
  v16 = a3.size.width;
  v17 = a3.origin.y;
  v18 = a3.origin.x;
  v20 = (unint64_t)(a5 - 1) < 2;
  v21 = (unint64_t)(self->_cachedChamoisLayoutAttributes_interfaceOrientation - 1) < 2;
  v22 = SBFIsChamoisStripDisabledWhenHiddenAvailable();
  v23 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
  v24 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
  v25 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
  v26 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
  v27 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
  v28 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
  v29 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
  v117 = v18;
  v118 = v17;
  if (!self->_cachedChamoisLayoutAttributes)
  {
    v31 = v11;
    v32 = v108;
    goto LABEL_16;
  }
  v119.origin.x = v18;
  v119.origin.y = v17;
  v119.size.width = v16;
  v119.size.height = height;
  if (!CGRectEqualToRect(self->_cachedChamoisLayoutAttributes_containerBounds, v119)
    || (v120.origin.x = x,
        v120.origin.y = y,
        v120.size.width = width,
        v120.size.height = rect2,
        ((!CGRectEqualToRect(self->_cachedChamoisLayoutAttributes_nativeContainerReferencePixelBounds, v120) | v20 ^ v21) & 1) != 0)
    || !BSFloatEqualToFloat()
    || !BSFloatEqualToFloat())
  {
    v31 = v11;
    v32 = v108;
    v29 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
    v28 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
    v27 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
    v26 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
    v25 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
LABEL_14:
    v24 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
    v23 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
    goto LABEL_16;
  }
  v25 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
  if (self->_cachedChamoisLayoutAttributes_requiresFullScreen != v114)
  {
    v31 = v11;
    v32 = v108;
    v29 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
    v28 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
    v27 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
    v26 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
    goto LABEL_14;
  }
  v26 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
  if (self->_cachedChamoisLayoutAttributes_prefersStripHidden != v110)
  {
    v31 = v11;
    v32 = v108;
    v29 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
    v28 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
    v27 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
    goto LABEL_14;
  }
  v27 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
  if (self->_cachedChamoisLayoutAttributes_prefersDockHidden != v108)
  {
    v31 = v11;
    v32 = v108;
    v29 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
    v28 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
    goto LABEL_14;
  }
  v28 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
  v30 = self->_cachedChamoisLayoutAttributes_isEmbeddedDisplay == v11;
  v31 = v11;
  v32 = v108;
  v29 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
  v24 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
  v23 = &OBJC_IVAR___SBChargingSystemApertureElementProvider__elementIdentifier;
  if (v30 && self->_cachedChamoisLayoutAttributes_stripDisabledWhenHidden == v22)
    return self->_cachedChamoisLayoutAttributes;
LABEL_16:
  self->_cachedChamoisLayoutAttributes_containerBounds.origin.x = v18;
  self->_cachedChamoisLayoutAttributes_containerBounds.origin.y = v17;
  self->_cachedChamoisLayoutAttributes_containerBounds.size.width = v16;
  self->_cachedChamoisLayoutAttributes_containerBounds.size.height = height;
  self->_cachedChamoisLayoutAttributes_nativeContainerReferencePixelBounds.origin.x = x;
  self->_cachedChamoisLayoutAttributes_nativeContainerReferencePixelBounds.origin.y = y;
  self->_cachedChamoisLayoutAttributes_nativeContainerReferencePixelBounds.size.width = width;
  self->_cachedChamoisLayoutAttributes_nativeContainerReferencePixelBounds.size.height = rect2;
  self->_cachedChamoisLayoutAttributes_interfaceOrientation = a5;
  *(double *)((char *)&self->super.super.isa + v23[241]) = a6;
  *(double *)((char *)&self->super.super.isa + v24[242]) = a7;
  *((_BYTE *)&self->super.super.isa + v25[243]) = v114;
  v33 = v110;
  *((_BYTE *)&self->super.super.isa + v26[244]) = v110;
  *((_BYTE *)&self->super.super.isa + v27[245]) = v32;
  *((_BYTE *)&self->super.super.isa + v28[246]) = v31;
  *((_BYTE *)&self->super.super.isa + v29[247]) = v22;
  v34 = dbl_1D0E8B840[v16 > 1681.0];
  v35 = fmax(a7, 24.0);
  if (v31)
  {
    -[SBSwitcherChamoisSettings embeddedDisplaySnapPaddingSettings](self, "embeddedDisplaySnapPaddingSettings");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = -[SBSwitcherChamoisSettings numberOfRowsWhileInAppOnEmbeddedDisplay](self, "numberOfRowsWhileInAppOnEmbeddedDisplay");
  }
  else
  {
    -[SBSwitcherChamoisSettings externalDisplaySnapPaddingSettings](self, "externalDisplaySnapPaddingSettings");
    v36 = objc_claimAutoreleasedReturnValue();
    if (height >= (double)-[SBSwitcherChamoisSettings externalDisplayHighResVerticalResolution](self, "externalDisplayHighResVerticalResolution"))v37 = -[SBSwitcherChamoisSettings numberOfRowsWhileInAppOnExternalDisplayHighRes](self, "numberOfRowsWhileInAppOnExternalDisplayHighRes");
    else
      v37 = -[SBSwitcherChamoisSettings numberOfRowsWhileInAppOnExternalDisplay](self, "numberOfRowsWhileInAppOnExternalDisplay");
  }
  if (v37 <= 4)
    v38 = 32.0;
  else
    v38 = 64.0;
  if (v37 <= 4)
    v39 = 44.0;
  else
    v39 = 64.0;
  v103 = v38;
  v104 = v39;
  v107 = v37;
  -[SBSwitcherChamoisSettings _stripCardScaleForContainerBounds:screenEdgePadding:stripVerticalEdgeSpacing:stripInterItemSpacing:floatingDockHeight:numberOfRows:](self, "_stripCardScaleForContainerBounds:screenEdgePadding:stripVerticalEdgeSpacing:stripInterItemSpacing:floatingDockHeight:numberOfRows:", v37, v117, v118, v16, height, v35);
  if ((v110 & v22) != 0)
    v41 = 0.0;
  else
    v41 = 1.13446401;
  v105 = v40;
  v106 = v34;
  v102 = v41;
  -[SBSwitcherChamoisSettings _stripWidthForContainerBounds:screenEdgePadding:stripStackDistance:stripCardScale:stripTiltAngle:containerPerspective:](self, "_stripWidthForContainerBounds:screenEdgePadding:stripStackDistance:stripCardScale:stripTiltAngle:containerPerspective:", v117, v118, v16, height, v35, 60.0, *(_QWORD *)&v34);
  v43 = v42;
  if (v31)
  {
    v44 = v16 - v42;
    v45 = -v35;
    v99 = height - a6 + v35 * -2.0;
    v101 = v99;
  }
  else
  {
    v44 = *MEMORY[0x1E0C9D820];
    v101 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v45 = -v35;
    v99 = height - a6 + v35 * -2.0;
  }
  if (v16 <= 1920.0)
    v46 = 320.0;
  else
    v46 = 414.0;
  v47 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v110 && v32;
  rect2a = height;
  v109 = (void *)v36;
  if (v110 && v32)
  {
    v50 = 10.0;
    v51 = self;
    v52 = v16;
LABEL_40:
    -[SBSwitcherChamoisSettings _gridWidthsForSafeWidth:minimumWidth:stageInterItemSpacing:](v51, "_gridWidthsForSafeWidth:minimumWidth:stageInterItemSpacing:", v52, v46, v50);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObjectsFromArray:", v53);
LABEL_41:

    goto LABEL_42;
  }
  if (v110)
  {
    v52 = v16 + v45 * 2.0;
    v50 = 10.0;
    v51 = self;
    goto LABEL_40;
  }
  if (v31)
  {
    -[SBSwitcherChamoisSettings _gridWidthsForSafeWidth:minimumWidth:stageInterItemSpacing:](self, "_gridWidthsForSafeWidth:minimumWidth:stageInterItemSpacing:", v16 + v45 * 2.0, v46, 10.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObjectsFromArray:", v59);
  }
  else
  {
    v86 = (v16 - v44) * 0.5;
    if (v43 < v86)
      v86 = v43;
    -[SBSwitcherChamoisSettings _gridWidthsForSafeWidth:minimumWidth:stageInterItemSpacing:](self, "_gridWidthsForSafeWidth:minimumWidth:stageInterItemSpacing:", v16 - v86 - v35, v46, 10.0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObjectsFromArray:", v87);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 + v45 * 2.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObject:", v59);
  }

  if (v44 != 0.0)
  {
    v88 = objc_msgSend(v48, "count");
    if (v88)
    {
      v89 = v88;
      v100 = v45;
      v90 = v43;
      v91 = 0;
      v92 = -1;
      v93 = 1.79769313e308;
      do
      {
        objc_msgSend(v48, "objectAtIndex:", v91);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "doubleValue");
        v96 = v95;

        v97 = vabdd_f64(v96, v44);
        if (v97 < v93)
        {
          v93 = v97;
          v92 = v91;
        }
        ++v91;
      }
      while (v89 != v91);
      v98 = v92 != -1 && v93 < 44.0;
      v33 = v110;
      v43 = v90;
      v45 = v100;
      if (v98)
        objc_msgSend(v48, "removeObjectAtIndex:", v92);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v44);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObject:", v53);
    v47 = 0x1E0C99000;
    goto LABEL_41;
  }
LABEL_42:
  v113 = v43;
  v111 = round(v99);
  objc_msgSend(v48, "sortUsingSelector:", sel_compare_);
  objc_msgSend(*(id *)(v47 + 3560), "array");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v55 = 10.0;
    v56 = self;
    v57 = rect2a;
  }
  else
  {
    if (!v32)
    {
      -[SBSwitcherChamoisSettings _gridHeightsForSafeHeight:minimumHeight:stageInterItemSpacing:](self, "_gridHeightsForSafeHeight:minimumHeight:stageInterItemSpacing:", v111, 480.0, 10.0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "addObjectsFromArray:", v60);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", rect2a + v45 * 2.0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "addObject:", v58);
      goto LABEL_50;
    }
    v57 = rect2a + v45 * 2.0;
    v55 = 10.0;
    v56 = self;
  }
  -[SBSwitcherChamoisSettings _gridHeightsForSafeHeight:minimumHeight:stageInterItemSpacing:](v56, "_gridHeightsForSafeHeight:minimumHeight:stageInterItemSpacing:", v57, 480.0, v55);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObjectsFromArray:", v58);
LABEL_50:

  objc_msgSend(v54, "sortUsingSelector:", sel_compare_);
  v61 = objc_msgSend(v54, "count");
  if (v32)
  {
    v62 = -1;
  }
  else
  {
    v63 = objc_msgSend(v54, "count");
    v62 = -2;
    if (v63 == 1)
      v62 = -1;
  }
  objc_msgSend(v54, "objectAtIndex:", v62 + v61);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "doubleValue");
  v66 = v65;

  v67 = v16 + v113 * -2.0;
  v68 = 1590.0;
  v69 = fmax(v16 * 0.65, 1590.0);
  if (v67 >= v69)
    v67 = v69;
  if (v44 >= v67)
    v67 = v44;
  v70 = v35 + v35;
  if (v32)
    v70 = 0.0;
  v71 = v16 - v70;
  if (v33 && v31)
    v72 = v71;
  else
    v72 = v67;
  if (!BSFloatGreaterThanFloat())
    v68 = v72;
  -[SBSwitcherChamoisSettings _nearestGridSizeForSize:gridWidths:gridHeights:bounds:](self, "_nearestGridSizeForSize:gridWidths:gridHeights:bounds:", v48, v54, v68, v66, v117, v118, v16, rect2a);
  v74 = v73;
  v76 = v75;
  -[SBSwitcherChamoisSettings _nearestGridSizeForSize:gridWidths:gridHeights:bounds:](self, "_nearestGridSizeForSize:gridWidths:gridHeights:bounds:", v48, v54, v68, rect2a, v117, v118, v16, rect2a);
  v78 = v77;
  v79 = (SBSwitcherChamoisLayoutAttributes *)objc_opt_new();
  -[SBSwitcherChamoisLayoutAttributes setSettings:](v79, "setSettings:", self);
  -[SBSwitcherChamoisLayoutAttributes setContainerBounds:](v79, "setContainerBounds:", v117, v118, v16, rect2a);
  -[SBSwitcherChamoisLayoutAttributes setRequiresFullScreen:](v79, "setRequiresFullScreen:", v114);
  -[SBSwitcherChamoisLayoutAttributes setDefaultWindowSize:](v79, "setDefaultWindowSize:", v74, v76);
  -[SBSwitcherChamoisLayoutAttributes setMinimumDefaultWindowSize:](v79, "setMinimumDefaultWindowSize:", v44, v101);
  -[SBSwitcherChamoisLayoutAttributes setMaximumWindowHeightWithDock:](v79, "setMaximumWindowHeightWithDock:", v111);
  -[SBSwitcherChamoisLayoutAttributes setMaximumWindowWidthForOverlapping:](v79, "setMaximumWindowWidthForOverlapping:", v78);
  -[SBSwitcherChamoisLayoutAttributes setMinimumWindowWidth:](v79, "setMinimumWindowWidth:", v46);
  -[SBSwitcherChamoisLayoutAttributes setContainerPerspective:](v79, "setContainerPerspective:", v106);
  -[SBSwitcherChamoisLayoutAttributes setScreenEdgePadding:](v79, "setScreenEdgePadding:", v35);
  -[SBSwitcherChamoisLayoutAttributes setSnapPaddingSettings:](v79, "setSnapPaddingSettings:", v109);
  -[SBSwitcherChamoisLayoutAttributes setStripWidth:](v79, "setStripWidth:", v113);
  -[SBSwitcherChamoisLayoutAttributes setStripVerticalEdgeSpacing:](v79, "setStripVerticalEdgeSpacing:", v103);
  -[SBSwitcherChamoisLayoutAttributes setStripInterItemSpacing:](v79, "setStripInterItemSpacing:", v104);
  -[SBSwitcherChamoisLayoutAttributes setStripTiltAngle:](v79, "setStripTiltAngle:", v102);
  v80 = 40.0;
  if (v16 <= 1681.0)
    v80 = 30.0;
  -[SBSwitcherChamoisLayoutAttributes setStripIconLength:](v79, "setStripIconLength:", v80);
  -[SBSwitcherChamoisLayoutAttributes setStripStackDistance:](v79, "setStripStackDistance:", 60.0);
  -[SBSwitcherChamoisLayoutAttributes setStripCardScale:](v79, "setStripCardScale:", v105);
  -[SBSwitcherChamoisLayoutAttributes setStripCornerRadii:](v79, "setStripCornerRadii:", 10.0);
  -[SBSwitcherChamoisLayoutAttributes setStageCornerRadii:](v79, "setStageCornerRadii:", 18.0);
  -[SBSwitcherChamoisLayoutAttributes setStageInterItemSpacing:](v79, "setStageInterItemSpacing:", 10.0);
  -[SBSwitcherChamoisLayoutAttributes setStageOccludedAppScale:](v79, "setStageOccludedAppScale:", -12.0 / rect2a + 1.0);
  -[SBSwitcherChamoisLayoutAttributes setStageStatusBarClearingAppScale:](v79, "setStageStatusBarClearingAppScale:", 1.0 - (a7 + a7) / rect2a);
  -[SBSwitcherChamoisLayoutAttributes setStageOcclusionDodgingPeekLength:](v79, "setStageOcclusionDodgingPeekLength:", 44.0);
  -[SBSwitcherChamoisLayoutAttributes setStageOcclusionDodgingPeekScale:](v79, "setStageOcclusionDodgingPeekScale:", 0.9);
  -[SBSwitcherChamoisLayoutAttributes setNumberOfRowsWhileInApp:](v79, "setNumberOfRowsWhileInApp:", v107);
  -[SBSwitcherChamoisLayoutAttributes setPrefersStripHidden:](v79, "setPrefersStripHidden:", v33);
  -[SBSwitcherChamoisLayoutAttributes setPrefersDockHidden:](v79, "setPrefersDockHidden:", v32);
  -[SBSwitcherChamoisLayoutAttributes setUsesStripAreaForOverlapping:](v79, "setUsesStripAreaForOverlapping:", v31);
  -[SBSwitcherChamoisLayoutAttributes setGridWidths:](v79, "setGridWidths:", v48);
  -[SBSwitcherChamoisLayoutAttributes setGridHeights:](v79, "setGridHeights:", v54);
  v81 = round(rect2a * 0.0625);
  -[SBSwitcherChamoisLayoutAttributes setSwitcherHorizontalEdgeSpacing:](v79, "setSwitcherHorizontalEdgeSpacing:", v81);
  -[SBSwitcherChamoisLayoutAttributes setSwitcherVerticalEdgeSpacing:](v79, "setSwitcherVerticalEdgeSpacing:", round(rect2a * 0.10546875));
  -[SBSwitcherChamoisLayoutAttributes setSwitcherHorizontalInterItemSpacing:](v79, "setSwitcherHorizontalInterItemSpacing:", v81);
  -[SBSwitcherChamoisLayoutAttributes setSwitcherVerticalInterItemSpacing:](v79, "setSwitcherVerticalInterItemSpacing:", round(rect2a * 0.0859375));
  if (v16 > 1920.0)
  {
    -[SBSwitcherChamoisLayoutAttributes switcherHorizontalEdgeSpacing](v79, "switcherHorizontalEdgeSpacing");
    -[SBSwitcherChamoisLayoutAttributes setSwitcherHorizontalEdgeSpacing:](v79, "setSwitcherHorizontalEdgeSpacing:", round(v82 * 1.5));
    -[SBSwitcherChamoisLayoutAttributes switcherVerticalEdgeSpacing](v79, "switcherVerticalEdgeSpacing");
    -[SBSwitcherChamoisLayoutAttributes setSwitcherVerticalEdgeSpacing:](v79, "setSwitcherVerticalEdgeSpacing:", round(v83 * 1.5));
  }
  -[SBSwitcherChamoisSettings switcherHeightForIconAndLabelsUnderEachPile](self, "switcherHeightForIconAndLabelsUnderEachPile");
  -[SBSwitcherChamoisLayoutAttributes setSwitcherHeightForIconAndLabelsUnderEachPile:](v79, "setSwitcherHeightForIconAndLabelsUnderEachPile:");
  -[SBSwitcherChamoisSettings switcherPileCardMinimumPeekAmount](self, "switcherPileCardMinimumPeekAmount");
  -[SBSwitcherChamoisLayoutAttributes setSwitcherPileCardMinimumPeekAmount:](v79, "setSwitcherPileCardMinimumPeekAmount:");
  -[SBSwitcherChamoisSettings switcherPileCompactingFactor](self, "switcherPileCompactingFactor");
  -[SBSwitcherChamoisLayoutAttributes setSwitcherPileCompactingFactor:](v79, "setSwitcherPileCompactingFactor:");
  cachedChamoisLayoutAttributes = self->_cachedChamoisLayoutAttributes;
  self->_cachedChamoisLayoutAttributes = v79;

  return self->_cachedChamoisLayoutAttributes;
}

- (double)_statusBarHeight
{
  if (_statusBarHeight_onceToken != -1)
    dispatch_once(&_statusBarHeight_onceToken, &__block_literal_global_47_4);
  return *(double *)&_statusBarHeight___statusBarHeight;
}

- (unint64_t)maximumNumberOfAppsOnStage
{
  return self->_maximumNumberOfAppsOnStage;
}

- (SBSwitcherChamoisSettings)initWithDefaultValues
{
  SBSwitcherChamoisSettings *v2;
  SBSwitcherChamoisSettings *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSwitcherChamoisSettings;
  v2 = -[PTSettings initWithDefaultValues](&v5, sel_initWithDefaultValues);
  v3 = v2;
  if (v2)
    -[SBSwitcherChamoisSettings _observeAppSwitcherDefaults](v2, "_observeAppSwitcherDefaults");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BSDefaultObserver invalidate](self->_appSwitcherDefaultsObserver, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSwitcherChamoisSettings;
  -[PTSettings dealloc](&v3, sel_dealloc);
}

- (id)_gridWidthsForSafeWidth:(double)a3 minimumWidth:(double)a4 stageInterItemSpacing:(double)a5
{
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;

  v8 = (void *)objc_opt_new();
  v9 = vcvtmd_s64_f64((a3 + a5) / (a4 + a5));
  v10 = a3 - a5;
  if (v9 < 1)
  {
LABEL_11:
    v25 = floor((a4 + a4) * 0.5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v25 + v25) * 0.5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v26);

    v27 = floor((v10 - a4 + v10 - a4) * 0.5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v27 + v27) * 0.5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v28);

    goto LABEL_12;
  }
  v11 = 0;
  v12 = floor((v10 * 0.5 + v10 * 0.5) * 0.5);
  v13 = (v12 + v12) * 0.5;
  while (1)
  {
    v14 = v9 + v11;
    if (v9 + v11 == 2)
    {
      v20 = (void *)MEMORY[0x1E0CB37E8];
      v22 = v13;
      goto LABEL_8;
    }
    if (v14 == 1)
      break;
    v15 = floor((a3 - (double)(v9 + v11 - 1) * a5) / (double)v14);
    v16 = floor((v15 + v15) * 0.5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v16 + v16) * 0.5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v17);

    v18 = floor((v10 - v15 + v10 - v15) * 0.5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v18 + v18) * 0.5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v19);

    if (v11)
      goto LABEL_9;
    v20 = (void *)MEMORY[0x1E0CB37E8];
    v21 = floor((a3 - v15 * 0.5 + a3 - v15 * 0.5) * 0.5);
    v22 = (v21 + v21) * 0.5;
LABEL_8:
    objc_msgSend(v20, "numberWithDouble:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v23);

LABEL_9:
    --v11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v24);

  if (v9 < 3)
    goto LABEL_11;
LABEL_12:
  objc_msgSend(v8, "sortUsingSelector:", sel_compare_);
  v29 = (void *)objc_opt_new();
  if (objc_msgSend(v8, "count") >= 3)
  {
    v30 = 0;
    v31 = a4 * 0.75;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "doubleValue");
      v34 = v33;

      objc_msgSend(v8, "objectAtIndexedSubscript:", ++v30);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "doubleValue");
      v37 = v36;

      v38 = v37 - v34;
      if (v37 - v34 > v31)
      {
        v39 = floor(((v34 + v37) * 0.5 + (v34 + v37) * 0.5) * 0.5);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v39 + v39) * 0.5);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v40);

      }
    }
    while (v30 < objc_msgSend(v8, "count", v38) - 2);
  }
  objc_msgSend(v8, "addObjectsFromArray:", v29);
  objc_msgSend(v8, "sortUsingSelector:", sel_compare_);

  return v8;
}

- (id)_gridHeightsForSafeHeight:(double)a3 minimumHeight:(double)a4 stageInterItemSpacing:(double)a5
{
  void *v8;
  double v9;
  double v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= a4)
  {
    v9 = (a3 + (a3 - a5) * -0.5) * 0.25;
    do
    {
      v10 = floor((a3 + a3) * 0.5);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v10 + v10) * 0.5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v11);

      a3 = a3 - v9;
    }
    while (a3 >= a4);
  }
  return v8;
}

- (CGSize)_nearestGridSizeForSize:(CGSize)a3 gridWidths:(id)a4 gridHeights:(id)a5 bounds:(CGRect)a6
{
  double height;
  double width;
  double v9;
  double v10;
  id v11;
  id v12;
  uint64_t v13;
  double v14;
  unint64_t v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  int v30;
  double v31;
  double v32;
  CGSize result;

  height = a6.size.height;
  width = a6.size.width;
  v9 = a3.height;
  v10 = a3.width;
  v11 = a4;
  v12 = a5;
  v13 = MEMORY[0x1E0C9D820];
  v14 = *MEMORY[0x1E0C9D820];
  if (objc_msgSend(v11, "count"))
  {
    v15 = 0;
    v16 = 1.79769313e308;
    do
    {
      objc_msgSend(v11, "objectAtIndex:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      v19 = v18;

      v20 = vabdd_f64(v19, v10);
      if (v20 < v16)
      {
        v14 = v19;
        v16 = v20;
      }
      ++v15;
    }
    while (v15 < objc_msgSend(v11, "count"));
  }
  v21 = *(double *)(v13 + 8);
  if (objc_msgSend(v12, "count"))
  {
    v22 = 0;
    v23 = 1.79769313e308;
    do
    {
      objc_msgSend(v12, "objectAtIndex:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "doubleValue");
      v26 = v25;

      v27 = vabdd_f64(v26, v9);
      if (v27 < v23)
      {
        v21 = v26;
        v23 = v27;
      }
      ++v22;
    }
    while (v22 < objc_msgSend(v12, "count"));
  }
  objc_msgSend(v11, "lastObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "doubleValue");
  if ((BSFloatEqualToFloat() & 1) != 0)
  {
    objc_msgSend(v12, "lastObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v30 = BSFloatEqualToFloat();

    if (v30)
    {
      v21 = height;
      v14 = width;
    }
  }
  else
  {

  }
  v31 = v14;
  v32 = v21;
  result.height = v32;
  result.width = v31;
  return result;
}

- (double)_stripWidthForContainerBounds:(CGRect)a3 screenEdgePadding:(double)a4 stripStackDistance:(double)a5 stripCardScale:(double)a6 stripTiltAngle:(double)a7 containerPerspective:(double)a8
{
  unint64_t v10;
  double v11;
  uint64_t v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v27;
  CATransform3D v28;
  CATransform3D v29;

  v10 = 0;
  v11 = a3.size.width * 0.5;
  v13 = MEMORY[0x1E0CD2610];
  v14 = 0.0;
  while (v14 == 0.0 || BSFloatGreaterThanFloat() && v10 <= 9)
  {
    -[SBSwitcherChamoisSettings numberOfVisibleItemsPerGroup](self, "numberOfVisibleItemsPerGroup");
    memset(&v29, 0, sizeof(v29));
    CATransform3DMakeScale(&v29, a6, a6, 1.0);
    memset(&v28, 0, sizeof(v28));
    CATransform3DMakeRotation(&v28, a7, 0.0, 1.0, 0.0);
    memset(&v27, 0, sizeof(v27));
    a = v29;
    b = v28;
    CATransform3DConcat(&v27, &a, &b);
    a = v27;
    CAPointApplyTransform();
    v16 = *(_OWORD *)(v13 + 48);
    *(_OWORD *)&a.m21 = *(_OWORD *)(v13 + 32);
    *(_OWORD *)&a.m23 = v16;
    *(_OWORD *)&a.m31 = *(_OWORD *)(v13 + 64);
    a.m33 = *(CGFloat *)(v13 + 80);
    v17 = *(_OWORD *)(v13 + 16);
    *(_OWORD *)&a.m11 = *(_OWORD *)v13;
    *(_OWORD *)&a.m13 = v17;
    v18 = *(_OWORD *)(v13 + 112);
    *(_OWORD *)&a.m41 = *(_OWORD *)(v13 + 96);
    *(_OWORD *)&a.m43 = v18;
    a.m34 = -1.0 / a8;
    CAPointApplyTransform();
    v21 = round(v11 + v19 / v20 + a4);
    v22 = floor((v21 + v21) * 0.5);
    v14 = (v22 + v22) * 0.5;
    ++v10;
  }
  return v14;
}

- (double)_stripCardScaleForContainerBounds:(CGRect)a3 screenEdgePadding:(double)a4 stripVerticalEdgeSpacing:(double)a5 stripInterItemSpacing:(double)a6 floatingDockHeight:(double)a7 numberOfRows:(unint64_t)a8
{
  return fmin(a3.size.height - a7 - a4 - a5 - (a4 + a5) - a6 * ((double)a8 + -1.0), 876.0)
       / (a3.size.height
        * (double)a8);
}

uint64_t __45__SBSwitcherChamoisSettings__statusBarHeight__block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", 0, 1);
  _statusBarHeight___statusBarHeight = v1;
  return result;
}

- (BOOL)_shouldPreferStripHiddenForWindowScene:(id)a3 interfaceOrientation:(int64_t)a4
{
  int v5;
  int *v6;

  v5 = objc_msgSend(a3, "isMainDisplayWindowScene");
  v6 = &OBJC_IVAR___SBSwitcherChamoisSettings__cachedChamoisHideStripsExternal;
  if (v5)
    v6 = &OBJC_IVAR___SBSwitcherChamoisSettings__cachedChamoisHideStrips;
  return *((_BYTE *)&self->super.super.isa + *v6);
}

- (BOOL)_shouldPreferDockHiddenForWindowScene:(id)a3
{
  int v4;
  int *v5;

  v4 = objc_msgSend(a3, "isMainDisplayWindowScene");
  v5 = &OBJC_IVAR___SBSwitcherChamoisSettings__cachedChamoisHideDockExternal;
  if (v4)
    v5 = &OBJC_IVAR___SBSwitcherChamoisSettings__cachedChamoisHideDock;
  return *((_BYTE *)&self->super.super.isa + *v5);
}

- (void)_observeAppSwitcherDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BSDefaultObserver *v11;
  BSDefaultObserver *appSwitcherDefaultsObserver;
  _QWORD v13[4];
  id v14;
  id location;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appSwitcherDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "chamoisHideStrips");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "chamoisHideStripsExternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "chamoisHideDock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "chamoisHideDockExternal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C80D38];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__SBSwitcherChamoisSettings__observeAppSwitcherDefaults__block_invoke;
  v13[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v4, "observeDefaults:onQueue:withBlock:", v9, MEMORY[0x1E0C80D38], v13);
  v11 = (BSDefaultObserver *)objc_claimAutoreleasedReturnValue();
  appSwitcherDefaultsObserver = self->_appSwitcherDefaultsObserver;
  self->_appSwitcherDefaultsObserver = v11;

  -[SBSwitcherChamoisSettings _updateCachedAppSwitcherDefaults](self, "_updateCachedAppSwitcherDefaults");
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __56__SBSwitcherChamoisSettings__observeAppSwitcherDefaults__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCachedAppSwitcherDefaults");

}

- (void)_updateCachedAppSwitcherDefaults
{
  void *v3;
  id v4;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appSwitcherDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  self->_cachedChamoisHideStrips = objc_msgSend(v4, "chamoisHideStrips");
  self->_cachedChamoisHideStripsExternal = objc_msgSend(v4, "chamoisHideStripsExternal");
  self->_cachedChamoisHideDock = objc_msgSend(v4, "chamoisHideDock");
  self->_cachedChamoisHideDockExternal = objc_msgSend(v4, "chamoisHideDockExternal");

}

- (void)setDefaultValues
{
  SBSwitcherChamoisSnapPaddingSettings *v3;
  SBSwitcherChamoisSnapPaddingSettings *v4;
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
  objc_super v19;
  CAFrameRateRange v20;
  CAFrameRateRange v21;
  CAFrameRateRange v22;
  CAFrameRateRange v23;
  CAFrameRateRange v24;

  v19.receiver = self;
  v19.super_class = (Class)SBSwitcherChamoisSettings;
  -[PTSettings setDefaultValues](&v19, sel_setDefaultValues);
  -[SBSwitcherChamoisSettings setNumberOfVisibleItemsPerGroup:](self, "setNumberOfVisibleItemsPerGroup:", 3);
  -[SBSwitcherChamoisSettings setNumberOfRowsWhileInAppOnEmbeddedDisplay:](self, "setNumberOfRowsWhileInAppOnEmbeddedDisplay:", 4);
  -[SBSwitcherChamoisSettings setNumberOfRowsWhileInAppOnExternalDisplay:](self, "setNumberOfRowsWhileInAppOnExternalDisplay:", 4);
  -[SBSwitcherChamoisSettings setNumberOfRowsWhileInAppOnExternalDisplayHighRes:](self, "setNumberOfRowsWhileInAppOnExternalDisplayHighRes:", 5);
  -[SBSwitcherChamoisSettings setExternalDisplayHighResVerticalResolution:](self, "setExternalDisplayHighResVerticalResolution:", 1440);
  -[SBSwitcherChamoisSettings setStripsHoverRevealZoneWidthType:](self, "setStripsHoverRevealZoneWidthType:", 0);
  -[SBSwitcherChamoisSettings setStripsHoverRevealZoneWidthFixed:](self, "setStripsHoverRevealZoneWidthFixed:", 5.0);
  -[SBSwitcherChamoisSettings setStripsHoverRevealZoneWidthScale:](self, "setStripsHoverRevealZoneWidthScale:", 0.15);
  -[SBSwitcherChamoisSettings setPinWindowEdgeForResizeMargin:](self, "setPinWindowEdgeForResizeMargin:", 88.0);
  -[SBSwitcherChamoisSettings setMaximumNumberOfAppsOnStage:](self, "setMaximumNumberOfAppsOnStage:", 4);
  -[SBSwitcherChamoisSettings setStripDropZoneMultiplier:](self, "setStripDropZoneMultiplier:", 0.5);
  -[SBSwitcherChamoisSettings setUseLeadingWindowEdgeForDropZoneCalculations:](self, "setUseLeadingWindowEdgeForDropZoneCalculations:", 0);
  -[SBSwitcherChamoisSettings setRejectDropsWhenStageIsFull:](self, "setRejectDropsWhenStageIsFull:", 0);
  -[SBSwitcherChamoisSettings setAllowTrueMaximizeForAllApps:](self, "setAllowTrueMaximizeForAllApps:", 0);
  -[SBSwitcherChamoisSettings setRasterizeScaledApps:](self, "setRasterizeScaledApps:", 0);
  -[SBSwitcherChamoisSettings setChangeFocusOnClickDown:](self, "setChangeFocusOnClickDown:", 1);
  -[SBSwitcherChamoisSettings setBlurWallpaperInApps:](self, "setBlurWallpaperInApps:", 0);
  -[SBSwitcherChamoisSettings setUseLowFatigueStripAnimation:](self, "setUseLowFatigueStripAnimation:", 0);
  -[SBSwitcherChamoisSettings setTapWallpaperToGoHome:](self, "setTapWallpaperToGoHome:", 0);
  -[SBSwitcherChamoisSettings setStageOccludedAppScaleFactor:](self, "setStageOccludedAppScaleFactor:", 1.0);
  v3 = -[SBSwitcherChamoisSnapPaddingSettings initWithDefaultValues]([SBSwitcherChamoisSnapPaddingSettings alloc], "initWithDefaultValues");
  -[SBSwitcherChamoisSettings setEmbeddedDisplaySnapPaddingSettings:](self, "setEmbeddedDisplaySnapPaddingSettings:", v3);

  v4 = -[SBSwitcherChamoisSnapPaddingSettings initWithDefaultValues]([SBSwitcherChamoisSnapPaddingSettings alloc], "initWithDefaultValues");
  -[SBSwitcherChamoisSettings setExternalDisplaySnapPaddingSettings:](self, "setExternalDisplaySnapPaddingSettings:", v4);

  -[SBSwitcherChamoisSettings setSwitcherHeightForIconAndLabelsUnderEachPile:](self, "setSwitcherHeightForIconAndLabelsUnderEachPile:", 60.0);
  -[SBSwitcherChamoisSettings setSwitcherPileCardMinimumPeekAmount:](self, "setSwitcherPileCardMinimumPeekAmount:", 25.0);
  -[SBSwitcherChamoisSettings setSwitcherPileCompactingFactor:](self, "setSwitcherPileCompactingFactor:", 0.6);
  -[SBSwitcherChamoisSettings setSwitcherCornerRadius:](self, "setSwitcherCornerRadius:", 10.0);
  -[SBSwitcherChamoisSettings setRimShadowOpacity:](self, "setRimShadowOpacity:", 0.15);
  -[SBSwitcherChamoisSettings setRimShadowRadius:](self, "setRimShadowRadius:", 0.5);
  -[SBSwitcherChamoisSettings setDiffuseShadowOpacity:](self, "setDiffuseShadowOpacity:", 0.35);
  -[SBSwitcherChamoisSettings setDiffuseShadowRadius:](self, "setDiffuseShadowRadius:", 70.0);
  -[SBSwitcherChamoisSettings setDiffuseShadowOffset:](self, "setDiffuseShadowOffset:", 0.0, 35.0);
  -[SBSwitcherChamoisSettings liveResizeDuringDragLayoutAnimationSettings](self, "liveResizeDuringDragLayoutAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrackingDampingRatio:", 1.0);

  -[SBSwitcherChamoisSettings liveResizeDuringDragLayoutAnimationSettings](self, "liveResizeDuringDragLayoutAnimationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTrackingResponse:", 0.325);

  -[SBSwitcherChamoisSettings liveResizeDuringDragLayoutAnimationSettings](self, "liveResizeDuringDragLayoutAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v7, "setFrameRateRange:highFrameRateReason:", 1114144, *(double *)&v20.minimum, *(double *)&v20.maximum, *(double *)&v20.preferred);

  -[SBSwitcherChamoisSettings liveResizeAfterReleaseLayoutAnimationSettings](self, "liveResizeAfterReleaseLayoutAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTrackingDampingRatio:", 0.92);

  -[SBSwitcherChamoisSettings liveResizeAfterReleaseLayoutAnimationSettings](self, "liveResizeAfterReleaseLayoutAnimationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTrackingResponse:", 0.6);

  -[SBSwitcherChamoisSettings liveResizeAfterReleaseLayoutAnimationSettings](self, "liveResizeAfterReleaseLayoutAnimationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v10, "setFrameRateRange:highFrameRateReason:", 1114144, *(double *)&v21.minimum, *(double *)&v21.maximum, *(double *)&v21.preferred);

  -[SBSwitcherChamoisSettings windowDragAnimationSettings](self, "windowDragAnimationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDefaultValues");

  -[SBSwitcherChamoisSettings windowDragAnimationSettings](self, "windowDragAnimationSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDampingRatio:", 0.92);

  -[SBSwitcherChamoisSettings windowDragAnimationSettings](self, "windowDragAnimationSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setResponse:", 0.457);

  -[SBSwitcherChamoisSettings windowDragAnimationSettings](self, "windowDragAnimationSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTrackingDampingRatio:", 0.92);

  -[SBSwitcherChamoisSettings windowDragAnimationSettings](self, "windowDragAnimationSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTrackingResponse:", 0.1);

  -[SBSwitcherChamoisSettings windowDragAnimationSettings](self, "windowDragAnimationSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v16, "setFrameRateRange:highFrameRateReason:", 1114144, *(double *)&v22.minimum, *(double *)&v22.maximum, *(double *)&v22.preferred);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v17, "setResponse:", 0.5);
  objc_msgSend(v17, "setDampingRatio:", 1.0);
  v23 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v17, "setFrameRateRange:highFrameRateReason:", 1114144, *(double *)&v23.minimum, *(double *)&v23.maximum, *(double *)&v23.preferred);
  -[SBSwitcherChamoisSettings setAppToAppLayoutSettings:](self, "setAppToAppLayoutSettings:", v17);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
  objc_msgSend(v18, "setResponse:", 0.25);
  objc_msgSend(v18, "setDampingRatio:", 1.1);
  objc_msgSend(v18, "setRetargetImpulse:", 0.016);
  v24 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v18, "setFrameRateRange:highFrameRateReason:", 1114144, *(double *)&v24.minimum, *(double *)&v24.maximum, *(double *)&v24.preferred);
  -[SBSwitcherChamoisSettings setStageFocusChangeSettings:](self, "setStageFocusChangeSettings:", v18);
  -[SBSwitcherChamoisSettings setHomeGestureMinimumYDistanceForHomeOrAppSwitcher:](self, "setHomeGestureMinimumYDistanceForHomeOrAppSwitcher:", 20.0);

}

+ (id)settingsControllerModule
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  _QWORD v108[7];
  void *v109;
  _QWORD v110[3];
  void *v111;
  _QWORD v112[2];
  _QWORD v113[3];
  _QWORD v114[3];
  _QWORD v115[12];

  v115[10] = *MEMORY[0x1E0C80C00];
  v106 = (void *)MEMORY[0x1E0D83070];
  v2 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_maximumNumberOfAppsOnStage);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:valueKeyPath:", CFSTR("Maximum Number Of Apps On Stage"), v103);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "between:and:", 4.0, 8.0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "precision:", 0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = v94;
  v3 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_stripDropZoneMultiplier);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Drop Into Strip Zone Width Multiplier"), v92);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "between:and:", 0.0, 1.0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "precision:", 2);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v115[1] = v89;
  v4 = (void *)MEMORY[0x1E0D83100];
  NSStringFromSelector(sel_useLeadingWindowEdgeForDropZoneCalculations);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Use Leading Window Edge For Drop Zone Calculations"), v88);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v115[2] = v87;
  v5 = (void *)MEMORY[0x1E0D83100];
  NSStringFromSelector(sel_rejectDropsWhenStageIsFull);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:valueKeyPath:", CFSTR("Reject Drops When Stage Is Full"), v86);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v115[3] = v85;
  v6 = (void *)MEMORY[0x1E0D83100];
  NSStringFromSelector(sel_allowTrueMaximizeForAllApps);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("Allow True Maximize For All Apps"), v84);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v115[4] = v83;
  v7 = (void *)MEMORY[0x1E0D83100];
  NSStringFromSelector(sel_rasterizeScaledApps);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("Rasterize Scaled Apps"), v82);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v115[5] = v8;
  v9 = (void *)MEMORY[0x1E0D83100];
  NSStringFromSelector(sel_changeFocusOnClickDown);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:valueKeyPath:", CFSTR("Change Focus on Click Down"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v115[6] = v11;
  v12 = (void *)MEMORY[0x1E0D83100];
  NSStringFromSelector(sel_blurWallpaperInApps);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:valueKeyPath:", CFSTR("Blur Wallpaper In Apps"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v115[7] = v14;
  v15 = (void *)MEMORY[0x1E0D83100];
  NSStringFromSelector(sel_useLowFatigueStripAnimation);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowWithTitle:valueKeyPath:", CFSTR("Use Low Fatigue Strip Animation"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v115[8] = v17;
  v18 = (void *)MEMORY[0x1E0D83100];
  NSStringFromSelector(sel_tapWallpaperToGoHome);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rowWithTitle:valueKeyPath:", CFSTR("Tap on Wallpaper to go Home"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v115[9] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "sectionWithRows:title:", v21, CFSTR("Layout and Policy"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  v104 = (void *)MEMORY[0x1E0D83070];
  v22 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_switcherHeightForIconAndLabelsUnderEachPile);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rowWithTitle:valueKeyPath:", CFSTR("Switcher Height for Icons and Labels Under Each Pile"), v101);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "between:and:", 0.0, 200.0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "precision:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v114[0] = v23;
  v24 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_switcherPileCardMinimumPeekAmount);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rowWithTitle:valueKeyPath:", CFSTR("Switcher Pile Card Peek Amount"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "between:and:", 0.0, 300.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "precision:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v114[1] = v28;
  v29 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_switcherPileCompactingFactor);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rowWithTitle:valueKeyPath:", CFSTR("Pile Compacting Factor"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "between:and:", 0.0, 1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "precision:", 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v114[2] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "sectionWithRows:title:", v34, CFSTR("Swticher Layout"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0D83070];
  v36 = (void *)MEMORY[0x1E0D83050];
  NSStringFromSelector(sel_stageOccludedAppScaleFactor);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rowWithTitle:valueKeyPath:", CFSTR("Stage Occluded App Scale Factor"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "between:and:", 0.5, 2.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "precision:", 4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v40;
  v41 = (void *)MEMORY[0x1E0D83040];
  NSStringFromSelector(sel_embeddedDisplaySnapPaddingSettings);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "rowWithTitle:childSettingsKeyPath:", CFSTR("Embedded Display Snap Padding Settings"), v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v113[1] = v43;
  v44 = (void *)MEMORY[0x1E0D83040];
  NSStringFromSelector(sel_externalDisplaySnapPaddingSettings);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "rowWithTitle:childSettingsKeyPath:", CFSTR("External Display Snap Padding Settings"), v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v113[2] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 3);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sectionWithRows:title:", v47, CFSTR("Stage Layout"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = (void *)MEMORY[0x1E0D83070];
  v49 = (void *)MEMORY[0x1E0D83040];
  NSStringFromSelector(sel_liveResizeDuringDragLayoutAnimationSettings);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "rowWithTitle:childSettingsKeyPath:", CFSTR("Live Resize During Drag Layout Settings"), v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v112[0] = v51;
  v52 = (void *)MEMORY[0x1E0D83040];
  NSStringFromSelector(sel_liveResizeAfterReleaseLayoutAnimationSettings);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "rowWithTitle:childSettingsKeyPath:", CFSTR("Live Resize After Release Layout Settings"), v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v112[1] = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 2);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "sectionWithRows:title:", v55, CFSTR("Live Resize Animation Settings"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = (void *)MEMORY[0x1E0D83070];
  v57 = (void *)MEMORY[0x1E0D83040];
  NSStringFromSelector(sel_windowDragAnimationSettings);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "rowWithTitle:childSettingsKeyPath:", CFSTR("Window Drag Settings"), v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "sectionWithRows:title:", v60, CFSTR("Window Drag Gesture Settings"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = (void *)MEMORY[0x1E0D83070];
  v62 = (void *)MEMORY[0x1E0D83040];
  NSStringFromSelector(sel_appToAppLayoutSettings);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "rowWithTitle:childSettingsKeyPath:", CFSTR("App To App Layout Settings"), v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v64;
  v65 = (void *)MEMORY[0x1E0D83040];
  NSStringFromSelector(sel_appToAppOpacitySettings);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "rowWithTitle:childSettingsKeyPath:", CFSTR("App To App Opacity Settings"), v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v110[1] = v67;
  v68 = (void *)MEMORY[0x1E0D83040];
  NSStringFromSelector(sel_stageFocusChangeSettings);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "rowWithTitle:childSettingsKeyPath:", CFSTR("Stage Focus Change Settings"), v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v110[2] = v70;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 3);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "sectionWithRows:title:", v71, CFSTR("Animation Settings"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = (void *)MEMORY[0x1E0D83070];
  v73 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "rowWithTitle:action:", CFSTR("Restore Defaults"), v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v75;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v109, 1);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "sectionWithRows:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = (void *)MEMORY[0x1E0D83070];
  v108[0] = v107;
  v108[1] = v105;
  v108[2] = v102;
  v108[3] = v99;
  v108[4] = v96;
  v108[5] = v93;
  v108[6] = v77;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 7);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "moduleWithTitle:contents:", CFSTR("Sydro Windowing"), v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  return v80;
}

- (unint64_t)numberOfVisibleItemsPerGroup
{
  return self->_numberOfVisibleItemsPerGroup;
}

- (void)setNumberOfVisibleItemsPerGroup:(unint64_t)a3
{
  self->_numberOfVisibleItemsPerGroup = a3;
}

- (unint64_t)numberOfRowsWhileInAppOnEmbeddedDisplay
{
  return self->_numberOfRowsWhileInAppOnEmbeddedDisplay;
}

- (void)setNumberOfRowsWhileInAppOnEmbeddedDisplay:(unint64_t)a3
{
  self->_numberOfRowsWhileInAppOnEmbeddedDisplay = a3;
}

- (unint64_t)numberOfRowsWhileInAppOnExternalDisplay
{
  return self->_numberOfRowsWhileInAppOnExternalDisplay;
}

- (void)setNumberOfRowsWhileInAppOnExternalDisplay:(unint64_t)a3
{
  self->_numberOfRowsWhileInAppOnExternalDisplay = a3;
}

- (unint64_t)numberOfRowsWhileInAppOnExternalDisplayHighRes
{
  return self->_numberOfRowsWhileInAppOnExternalDisplayHighRes;
}

- (void)setNumberOfRowsWhileInAppOnExternalDisplayHighRes:(unint64_t)a3
{
  self->_numberOfRowsWhileInAppOnExternalDisplayHighRes = a3;
}

- (unint64_t)externalDisplayHighResVerticalResolution
{
  return self->_externalDisplayHighResVerticalResolution;
}

- (void)setExternalDisplayHighResVerticalResolution:(unint64_t)a3
{
  self->_externalDisplayHighResVerticalResolution = a3;
}

- (unint64_t)stripsHoverRevealZoneWidthType
{
  return self->_stripsHoverRevealZoneWidthType;
}

- (void)setStripsHoverRevealZoneWidthType:(unint64_t)a3
{
  self->_stripsHoverRevealZoneWidthType = a3;
}

- (double)stripsHoverRevealZoneWidthFixed
{
  return self->_stripsHoverRevealZoneWidthFixed;
}

- (void)setStripsHoverRevealZoneWidthFixed:(double)a3
{
  self->_stripsHoverRevealZoneWidthFixed = a3;
}

- (double)stripsHoverRevealZoneWidthScale
{
  return self->_stripsHoverRevealZoneWidthScale;
}

- (void)setStripsHoverRevealZoneWidthScale:(double)a3
{
  self->_stripsHoverRevealZoneWidthScale = a3;
}

- (double)pinWindowEdgeForResizeMargin
{
  return self->_pinWindowEdgeForResizeMargin;
}

- (void)setPinWindowEdgeForResizeMargin:(double)a3
{
  self->_pinWindowEdgeForResizeMargin = a3;
}

- (void)setMaximumNumberOfAppsOnStage:(unint64_t)a3
{
  self->_maximumNumberOfAppsOnStage = a3;
}

- (double)stripDropZoneMultiplier
{
  return self->_stripDropZoneMultiplier;
}

- (void)setStripDropZoneMultiplier:(double)a3
{
  self->_stripDropZoneMultiplier = a3;
}

- (BOOL)useLeadingWindowEdgeForDropZoneCalculations
{
  return self->_useLeadingWindowEdgeForDropZoneCalculations;
}

- (void)setUseLeadingWindowEdgeForDropZoneCalculations:(BOOL)a3
{
  self->_useLeadingWindowEdgeForDropZoneCalculations = a3;
}

- (BOOL)rejectDropsWhenStageIsFull
{
  return self->_rejectDropsWhenStageIsFull;
}

- (void)setRejectDropsWhenStageIsFull:(BOOL)a3
{
  self->_rejectDropsWhenStageIsFull = a3;
}

- (BOOL)allowTrueMaximizeForAllApps
{
  return self->_allowTrueMaximizeForAllApps;
}

- (void)setAllowTrueMaximizeForAllApps:(BOOL)a3
{
  self->_allowTrueMaximizeForAllApps = a3;
}

- (BOOL)rasterizeScaledApps
{
  return self->_rasterizeScaledApps;
}

- (void)setRasterizeScaledApps:(BOOL)a3
{
  self->_rasterizeScaledApps = a3;
}

- (BOOL)changeFocusOnClickDown
{
  return self->_changeFocusOnClickDown;
}

- (void)setChangeFocusOnClickDown:(BOOL)a3
{
  self->_changeFocusOnClickDown = a3;
}

- (BOOL)blurWallpaperInApps
{
  return self->_blurWallpaperInApps;
}

- (void)setBlurWallpaperInApps:(BOOL)a3
{
  self->_blurWallpaperInApps = a3;
}

- (BOOL)useLowFatigueStripAnimation
{
  return self->_useLowFatigueStripAnimation;
}

- (void)setUseLowFatigueStripAnimation:(BOOL)a3
{
  self->_useLowFatigueStripAnimation = a3;
}

- (BOOL)tapWallpaperToGoHome
{
  return self->_tapWallpaperToGoHome;
}

- (void)setTapWallpaperToGoHome:(BOOL)a3
{
  self->_tapWallpaperToGoHome = a3;
}

- (double)stageOccludedAppScaleFactor
{
  return self->_stageOccludedAppScaleFactor;
}

- (void)setStageOccludedAppScaleFactor:(double)a3
{
  self->_stageOccludedAppScaleFactor = a3;
}

- (SBSwitcherChamoisSnapPaddingSettings)embeddedDisplaySnapPaddingSettings
{
  return (SBSwitcherChamoisSnapPaddingSettings *)objc_getProperty(self, a2, 272, 1);
}

- (void)setEmbeddedDisplaySnapPaddingSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (SBSwitcherChamoisSnapPaddingSettings)externalDisplaySnapPaddingSettings
{
  return (SBSwitcherChamoisSnapPaddingSettings *)objc_getProperty(self, a2, 280, 1);
}

- (void)setExternalDisplaySnapPaddingSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (double)switcherHeightForIconAndLabelsUnderEachPile
{
  return self->_switcherHeightForIconAndLabelsUnderEachPile;
}

- (void)setSwitcherHeightForIconAndLabelsUnderEachPile:(double)a3
{
  self->_switcherHeightForIconAndLabelsUnderEachPile = a3;
}

- (double)switcherPileCardMinimumPeekAmount
{
  return self->_switcherPileCardMinimumPeekAmount;
}

- (void)setSwitcherPileCardMinimumPeekAmount:(double)a3
{
  self->_switcherPileCardMinimumPeekAmount = a3;
}

- (double)switcherPileCompactingFactor
{
  return self->_switcherPileCompactingFactor;
}

- (void)setSwitcherPileCompactingFactor:(double)a3
{
  self->_switcherPileCompactingFactor = a3;
}

- (double)switcherCornerRadius
{
  return self->_switcherCornerRadius;
}

- (void)setSwitcherCornerRadius:(double)a3
{
  self->_switcherCornerRadius = a3;
}

- (double)rimShadowOpacity
{
  return self->_rimShadowOpacity;
}

- (void)setRimShadowOpacity:(double)a3
{
  self->_rimShadowOpacity = a3;
}

- (double)rimShadowRadius
{
  return self->_rimShadowRadius;
}

- (void)setRimShadowRadius:(double)a3
{
  self->_rimShadowRadius = a3;
}

- (double)diffuseShadowOpacity
{
  return self->_diffuseShadowOpacity;
}

- (void)setDiffuseShadowOpacity:(double)a3
{
  self->_diffuseShadowOpacity = a3;
}

- (double)diffuseShadowRadius
{
  return self->_diffuseShadowRadius;
}

- (void)setDiffuseShadowRadius:(double)a3
{
  self->_diffuseShadowRadius = a3;
}

- (CGSize)diffuseShadowOffset
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_diffuseShadowOffset, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setDiffuseShadowOffset:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_diffuseShadowOffset, &v3, 16, 1, 0);
}

- (SBFFluidBehaviorSettings)liveResizeDuringDragLayoutAnimationSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 352, 1);
}

- (void)setLiveResizeDuringDragLayoutAnimationSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (SBFFluidBehaviorSettings)liveResizeAfterReleaseLayoutAnimationSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 360, 1);
}

- (void)setLiveResizeAfterReleaseLayoutAnimationSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (SBFFluidBehaviorSettings)windowDragAnimationSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 368, 1);
}

- (void)setWindowDragAnimationSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (SBFFluidBehaviorSettings)appToAppLayoutSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 376, 1);
}

- (void)setAppToAppLayoutSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (SBFFluidBehaviorSettings)appToAppOpacitySettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 384, 1);
}

- (void)setAppToAppOpacitySettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (SBFFluidBehaviorSettings)stageFocusChangeSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 392, 1);
}

- (void)setStageFocusChangeSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (double)homeGestureMinimumYDistanceForHomeOrAppSwitcher
{
  return self->_homeGestureMinimumYDistanceForHomeOrAppSwitcher;
}

- (void)setHomeGestureMinimumYDistanceForHomeOrAppSwitcher:(double)a3
{
  self->_homeGestureMinimumYDistanceForHomeOrAppSwitcher = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stageFocusChangeSettings, 0);
  objc_storeStrong((id *)&self->_appToAppOpacitySettings, 0);
  objc_storeStrong((id *)&self->_appToAppLayoutSettings, 0);
  objc_storeStrong((id *)&self->_windowDragAnimationSettings, 0);
  objc_storeStrong((id *)&self->_liveResizeAfterReleaseLayoutAnimationSettings, 0);
  objc_storeStrong((id *)&self->_liveResizeDuringDragLayoutAnimationSettings, 0);
  objc_storeStrong((id *)&self->_externalDisplaySnapPaddingSettings, 0);
  objc_storeStrong((id *)&self->_embeddedDisplaySnapPaddingSettings, 0);
  objc_storeStrong((id *)&self->_appSwitcherDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_cachedChamoisLayoutAttributes, 0);
}

@end
