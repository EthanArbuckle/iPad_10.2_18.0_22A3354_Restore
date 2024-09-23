@implementation _UIStackedImageConfiguration

+ (id)newStandardConfiguration
{
  _UIStackedImageConfiguration *v2;
  void *v3;

  v2 = objc_alloc_init(_UIStackedImageConfiguration);
  -[_UIStackedImageConfiguration setMaximumParallaxImages:](v2, "setMaximumParallaxImages:", 5);
  -[_UIStackedImageConfiguration setMaximumParallaxDepth:](v2, "setMaximumParallaxDepth:", 60.0);
  -[_UIStackedImageConfiguration setOverlayDepth:](v2, "setOverlayDepth:", 1.0);
  -[_UIStackedImageConfiguration setOverlayFixedFrame:](v2, "setOverlayFixedFrame:", 0);
  -[_UIStackedImageConfiguration setZDepth:](v2, "setZDepth:", 900.0);
  -[_UIStackedImageConfiguration setAdjustMotionForSize:](v2, "setAdjustMotionForSize:", 1);
  -[_UIStackedImageConfiguration setRotationAmount:](v2, "setRotationAmount:", 0.08);
  -[_UIStackedImageConfiguration setScaleSizeIncrease:](v2, "setScaleSizeIncrease:", 70.0);
  -[_UIStackedImageConfiguration setPressedScaleAdjustment:](v2, "setPressedScaleAdjustment:", 0.5);
  -[_UIStackedImageConfiguration setTranslationOffset:](v2, "setTranslationOffset:", 12.0, 12.0);
  -[_UIStackedImageConfiguration setUnmaskedOverlayScaleFactor:](v2, "setUnmaskedOverlayScaleFactor:", 1.0);
  -[_UIStackedImageConfiguration setCornerRadius:](v2, "setCornerRadius:", 0.0);
  -[_UIStackedImageConfiguration setContinuousCornerRadiusEnabled:](v2, "setContinuousCornerRadiusEnabled:", 0.0);
  -[_UIStackedImageConfiguration setFlatImageContainsCornerRadius:](v2, "setFlatImageContainsCornerRadius:", 0);
  -[_UIStackedImageConfiguration setSpecularHighlightVerticalPosition:](v2, "setSpecularHighlightVerticalPosition:", 0.4);
  -[_UIStackedImageConfiguration setSpecularHighlightHorizontalPositionSensitivity:](v2, "setSpecularHighlightHorizontalPositionSensitivity:", 1.3);
  -[_UIStackedImageConfiguration setSpecularHighlightVerticalPositionSensitivity:](v2, "setSpecularHighlightVerticalPositionSensitivity:", 1.3);
  -[_UIStackedImageConfiguration setSpecularOpacity:](v2, "setSpecularOpacity:", 0.2);
  -[_UIStackedImageConfiguration setDefaultFocusedShadowOpacity:](v2, "setDefaultFocusedShadowOpacity:", 0.5);
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowOpacity:](v2, "setDefaultHighlightedShadowOpacity:", 0.5);
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowOpacity:](v2, "setDefaultUnfocusedShadowOpacity:", 0.2);
  -[_UIStackedImageConfiguration setFullBleedFocusedShadowOpacity:](v2, "setFullBleedFocusedShadowOpacity:", 0.55);
  -[_UIStackedImageConfiguration setFullBleedUnfocusedShadowOpacity:](v2, "setFullBleedUnfocusedShadowOpacity:", 0.15);
  -[_UIStackedImageConfiguration setFocusCursorShadowOpacityAdjustment:](v2, "setFocusCursorShadowOpacityAdjustment:", 0.2);
  -[_UIStackedImageConfiguration setDefaultFocusedShadowRadius:](v2, "setDefaultFocusedShadowRadius:", 35.0);
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowRadius:](v2, "setDefaultHighlightedShadowRadius:", 20.0);
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowRadius:](v2, "setDefaultUnfocusedShadowRadius:", 5.0);
  -[_UIStackedImageConfiguration setFullBleedFocusedShadowRadius:](v2, "setFullBleedFocusedShadowRadius:", 35.0);
  -[_UIStackedImageConfiguration setFullBleedUnfocusedShadowRadius:](v2, "setFullBleedUnfocusedShadowRadius:", 5.0);
  -[_UIStackedImageConfiguration setDefaultFocusedShadowVerticalOffset:](v2, "setDefaultFocusedShadowVerticalOffset:", 50.0);
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowVerticalOffset:](v2, "setDefaultHighlightedShadowVerticalOffset:", 22.0);
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowVerticalOffset:](v2, "setDefaultUnfocusedShadowVerticalOffset:", 6.0);
  -[_UIStackedImageConfiguration setDefaultSelectedShadowVerticalOffset:](v2, "setDefaultSelectedShadowVerticalOffset:", 6.0);
  -[_UIStackedImageConfiguration setUseSeparateUnfocusedShadowImage:](v2, "setUseSeparateUnfocusedShadowImage:", 1);
  -[_UIStackedImageConfiguration setPlaceholderImage:](v2, "setPlaceholderImage:", 0);
  -[_UIStackedImageConfiguration setAllowsNonOpaqueShadow:](v2, "setAllowsNonOpaqueShadow:", 0);
  -[_UIStackedImageConfiguration setBoostBrightness:](v2, "setBoostBrightness:", 1);
  -[_UIStackedImageConfiguration setHueShift:](v2, "setHueShift:", 0);
  -[_UIStackedImageConfiguration setDisableMask:](v2, "setDisableMask:", 0);
  -[_UIStackedImageConfiguration setFocusCursorEnabled:](v2, "setFocusCursorEnabled:", _AXSHighContrastFocusIndicatorsEnabled() != 0);
  -[_UIStackedImageConfiguration setFocusCursorBorderWidth:](v2, "setFocusCursorBorderWidth:", 8.0);
  -[_UIStackedImageConfiguration setRadiosityOffset:](v2, "setRadiosityOffset:", 10.0);
  -[_UIStackedImageConfiguration setRadiosityStrength:](v2, "setRadiosityStrength:", 0.0);
  +[_UIFocusAnimationConfiguration configurationWithStyle:](_UIFocusAnimationConfiguration, "configurationWithStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusingBaseDuration");
  -[_UIStackedImageConfiguration setShadowSelectionDuration:](v2, "setShadowSelectionDuration:");
  objc_msgSend(v3, "focusingBaseDuration");
  -[_UIStackedImageConfiguration setLayerSelectionDuration:](v2, "setLayerSelectionDuration:");
  objc_msgSend(v3, "unfocusingBaseDuration");
  -[_UIStackedImageConfiguration setShadowUnselectionDuration:](v2, "setShadowUnselectionDuration:");
  objc_msgSend(v3, "unfocusingBaseDuration");
  -[_UIStackedImageConfiguration setLayerUnselectionDuration:](v2, "setLayerUnselectionDuration:");
  objc_msgSend(v3, "minimumFocusDuration");
  -[_UIStackedImageConfiguration setMinimumFocusDuration:](v2, "setMinimumFocusDuration:");
  objc_msgSend(v3, "unfocusingRepositionBaseDuration");
  -[_UIStackedImageConfiguration setRepositionUnselectionDuration:](v2, "setRepositionUnselectionDuration:");
  -[_UIStackedImageConfiguration layerSelectionDuration](v2, "layerSelectionDuration");
  -[_UIStackedImageConfiguration setPressedDuration:](v2, "setPressedDuration:");
  -[_UIStackedImageConfiguration setUnpressedDuration:](v2, "setUnpressedDuration:", 0.25);
  -[_UIStackedImageConfiguration setFullBleedCenteredGrowth:](v2, "setFullBleedCenteredGrowth:", 0);
  -[_UIStackedImageConfiguration setFullBleedOffset:](v2, "setFullBleedOffset:", 30.0);

  return v2;
}

+ (id)newAppIconConfiguration
{
  id v2;

  v2 = +[_UIStackedImageConfiguration newStandardConfiguration](_UIStackedImageConfiguration, "newStandardConfiguration");
  objc_msgSend(v2, "setCornerRadius:", 30.0);
  objc_msgSend(v2, "setContinuousCornerRadiusEnabled:", 1.0);
  objc_msgSend(v2, "setSpecularHighlightVerticalPosition:", 0.5);
  objc_msgSend(v2, "setSpecularHighlightVerticalPositionSensitivity:", 2.5);
  objc_msgSend(v2, "setHueShift:", 1);
  objc_msgSend(v2, "setAdjustMotionForSize:", 0);
  objc_msgSend(v2, "setUnmaskedOverlayScaleFactor:", 0.9);
  objc_msgSend(v2, "setDefaultUnfocusedShadowRadius:", 12.0);
  objc_msgSend(v2, "setDefaultUnfocusedShadowOpacity:", 0.4);
  objc_msgSend(v2, "setDefaultUnfocusedShadowVerticalOffset:", 4.0);
  objc_msgSend(v2, "setDefaultFocusedShadowRadius:", 35.0);
  objc_msgSend(v2, "setDefaultFocusedShadowOpacity:", 0.3);
  objc_msgSend(v2, "setDefaultFocusedShadowVerticalOffset:", 50.0);
  objc_msgSend(v2, "setDefaultHighlightedShadowRadius:", 20.0);
  objc_msgSend(v2, "setDefaultHighlightedShadowOpacity:", 0.4);
  objc_msgSend(v2, "setDefaultHighlightedShadowVerticalOffset:", 20.0);
  objc_msgSend(v2, "setDefaultSelectedShadowVerticalOffset:", 4.0);
  return v2;
}

- (_UIStackedImageConfiguration)init
{
  _UIStackedImageConfiguration *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStackedImageConfiguration;
  v2 = -[_UIStackedImageConfiguration init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__highContrastFocusIndicatorChanged_, CFSTR("UIAccessibilityHighContrastFocusIndicatorChangedNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIAccessibilityHighContrastFocusIndicatorChangedNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIStackedImageConfiguration;
  -[_UIStackedImageConfiguration dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIStackedImageConfiguration *v4;
  void *v5;

  v4 = objc_alloc_init(_UIStackedImageConfiguration);
  -[_UIStackedImageConfiguration setMaximumParallaxImages:](v4, "setMaximumParallaxImages:", -[_UIStackedImageConfiguration maximumParallaxImages](self, "maximumParallaxImages"));
  -[_UIStackedImageConfiguration maximumParallaxDepth](self, "maximumParallaxDepth");
  -[_UIStackedImageConfiguration setMaximumParallaxDepth:](v4, "setMaximumParallaxDepth:");
  -[_UIStackedImageConfiguration overlayDepth](self, "overlayDepth");
  -[_UIStackedImageConfiguration setOverlayDepth:](v4, "setOverlayDepth:");
  -[_UIStackedImageConfiguration setOverlayFixedFrame:](v4, "setOverlayFixedFrame:", -[_UIStackedImageConfiguration overlayFixedFrame](self, "overlayFixedFrame"));
  -[_UIStackedImageConfiguration zDepth](self, "zDepth");
  -[_UIStackedImageConfiguration setZDepth:](v4, "setZDepth:");
  -[_UIStackedImageConfiguration setAdjustMotionForSize:](v4, "setAdjustMotionForSize:", -[_UIStackedImageConfiguration adjustMotionForSize](self, "adjustMotionForSize"));
  -[_UIStackedImageConfiguration rotationAmount](self, "rotationAmount");
  -[_UIStackedImageConfiguration setRotationAmount:](v4, "setRotationAmount:");
  -[_UIStackedImageConfiguration scaleSizeIncrease](self, "scaleSizeIncrease");
  -[_UIStackedImageConfiguration setScaleSizeIncrease:](v4, "setScaleSizeIncrease:");
  -[_UIStackedImageConfiguration pressedScaleAdjustment](self, "pressedScaleAdjustment");
  -[_UIStackedImageConfiguration setPressedScaleAdjustment:](v4, "setPressedScaleAdjustment:");
  -[_UIStackedImageConfiguration translationOffset](self, "translationOffset");
  -[_UIStackedImageConfiguration setTranslationOffset:](v4, "setTranslationOffset:");
  -[_UIStackedImageConfiguration unmaskedOverlayScaleFactor](self, "unmaskedOverlayScaleFactor");
  -[_UIStackedImageConfiguration setUnmaskedOverlayScaleFactor:](v4, "setUnmaskedOverlayScaleFactor:");
  -[_UIStackedImageConfiguration cornerRadius](self, "cornerRadius");
  -[_UIStackedImageConfiguration setCornerRadius:](v4, "setCornerRadius:");
  -[_UIStackedImageConfiguration isContinuousCornerRadiusEnabled](self, "isContinuousCornerRadiusEnabled");
  -[_UIStackedImageConfiguration setContinuousCornerRadiusEnabled:](v4, "setContinuousCornerRadiusEnabled:");
  -[_UIStackedImageConfiguration setFlatImageContainsCornerRadius:](v4, "setFlatImageContainsCornerRadius:", -[_UIStackedImageConfiguration flatImageContainsCornerRadius](self, "flatImageContainsCornerRadius"));
  -[_UIStackedImageConfiguration specularHighlightVerticalPosition](self, "specularHighlightVerticalPosition");
  -[_UIStackedImageConfiguration setSpecularHighlightVerticalPosition:](v4, "setSpecularHighlightVerticalPosition:");
  -[_UIStackedImageConfiguration specularHighlightHorizontalPositionSensitivity](self, "specularHighlightHorizontalPositionSensitivity");
  -[_UIStackedImageConfiguration setSpecularHighlightHorizontalPositionSensitivity:](v4, "setSpecularHighlightHorizontalPositionSensitivity:");
  -[_UIStackedImageConfiguration specularHighlightVerticalPositionSensitivity](self, "specularHighlightVerticalPositionSensitivity");
  -[_UIStackedImageConfiguration setSpecularHighlightVerticalPositionSensitivity:](v4, "setSpecularHighlightVerticalPositionSensitivity:");
  -[_UIStackedImageConfiguration specularOpacity](self, "specularOpacity");
  -[_UIStackedImageConfiguration setSpecularOpacity:](v4, "setSpecularOpacity:");
  -[_UIStackedImageConfiguration defaultFocusedShadowOpacity](self, "defaultFocusedShadowOpacity");
  -[_UIStackedImageConfiguration setDefaultFocusedShadowOpacity:](v4, "setDefaultFocusedShadowOpacity:");
  -[_UIStackedImageConfiguration defaultHighlightedShadowOpacity](self, "defaultHighlightedShadowOpacity");
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowOpacity:](v4, "setDefaultHighlightedShadowOpacity:");
  -[_UIStackedImageConfiguration defaultUnfocusedShadowOpacity](self, "defaultUnfocusedShadowOpacity");
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowOpacity:](v4, "setDefaultUnfocusedShadowOpacity:");
  -[_UIStackedImageConfiguration fullBleedFocusedShadowOpacity](self, "fullBleedFocusedShadowOpacity");
  -[_UIStackedImageConfiguration setFullBleedFocusedShadowOpacity:](v4, "setFullBleedFocusedShadowOpacity:");
  -[_UIStackedImageConfiguration fullBleedUnfocusedShadowOpacity](self, "fullBleedUnfocusedShadowOpacity");
  -[_UIStackedImageConfiguration setFullBleedUnfocusedShadowOpacity:](v4, "setFullBleedUnfocusedShadowOpacity:");
  -[_UIStackedImageConfiguration focusCursorShadowOpacityAdjustment](self, "focusCursorShadowOpacityAdjustment");
  -[_UIStackedImageConfiguration setFocusCursorShadowOpacityAdjustment:](v4, "setFocusCursorShadowOpacityAdjustment:");
  -[_UIStackedImageConfiguration defaultFocusedShadowRadius](self, "defaultFocusedShadowRadius");
  -[_UIStackedImageConfiguration setDefaultFocusedShadowRadius:](v4, "setDefaultFocusedShadowRadius:");
  -[_UIStackedImageConfiguration defaultHighlightedShadowRadius](self, "defaultHighlightedShadowRadius");
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowRadius:](v4, "setDefaultHighlightedShadowRadius:");
  -[_UIStackedImageConfiguration defaultUnfocusedShadowRadius](self, "defaultUnfocusedShadowRadius");
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowRadius:](v4, "setDefaultUnfocusedShadowRadius:");
  -[_UIStackedImageConfiguration fullBleedFocusedShadowRadius](self, "fullBleedFocusedShadowRadius");
  -[_UIStackedImageConfiguration setFullBleedFocusedShadowRadius:](v4, "setFullBleedFocusedShadowRadius:");
  -[_UIStackedImageConfiguration fullBleedUnfocusedShadowRadius](self, "fullBleedUnfocusedShadowRadius");
  -[_UIStackedImageConfiguration setFullBleedUnfocusedShadowRadius:](v4, "setFullBleedUnfocusedShadowRadius:");
  -[_UIStackedImageConfiguration defaultFocusedShadowVerticalOffset](self, "defaultFocusedShadowVerticalOffset");
  -[_UIStackedImageConfiguration setDefaultFocusedShadowVerticalOffset:](v4, "setDefaultFocusedShadowVerticalOffset:");
  -[_UIStackedImageConfiguration defaultHighlightedShadowVerticalOffset](self, "defaultHighlightedShadowVerticalOffset");
  -[_UIStackedImageConfiguration setDefaultHighlightedShadowVerticalOffset:](v4, "setDefaultHighlightedShadowVerticalOffset:");
  -[_UIStackedImageConfiguration defaultUnfocusedShadowVerticalOffset](self, "defaultUnfocusedShadowVerticalOffset");
  -[_UIStackedImageConfiguration setDefaultUnfocusedShadowVerticalOffset:](v4, "setDefaultUnfocusedShadowVerticalOffset:");
  -[_UIStackedImageConfiguration defaultSelectedShadowVerticalOffset](self, "defaultSelectedShadowVerticalOffset");
  -[_UIStackedImageConfiguration setDefaultSelectedShadowVerticalOffset:](v4, "setDefaultSelectedShadowVerticalOffset:");
  -[_UIStackedImageConfiguration setUseSeparateUnfocusedShadowImage:](v4, "setUseSeparateUnfocusedShadowImage:", -[_UIStackedImageConfiguration useSeparateUnfocusedShadowImage](self, "useSeparateUnfocusedShadowImage"));
  -[_UIStackedImageConfiguration placeholderImage](self, "placeholderImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStackedImageConfiguration setPlaceholderImage:](v4, "setPlaceholderImage:", v5);

  -[_UIStackedImageConfiguration setAllowsNonOpaqueShadow:](v4, "setAllowsNonOpaqueShadow:", -[_UIStackedImageConfiguration allowsNonOpaqueShadow](self, "allowsNonOpaqueShadow"));
  -[_UIStackedImageConfiguration setBoostBrightness:](v4, "setBoostBrightness:", -[_UIStackedImageConfiguration boostBrightness](self, "boostBrightness"));
  -[_UIStackedImageConfiguration setHueShift:](v4, "setHueShift:", -[_UIStackedImageConfiguration hueShift](self, "hueShift"));
  -[_UIStackedImageConfiguration setDisableMask:](v4, "setDisableMask:", -[_UIStackedImageConfiguration disableMask](self, "disableMask"));
  -[_UIStackedImageConfiguration setFocusCursorEnabled:](v4, "setFocusCursorEnabled:", -[_UIStackedImageConfiguration focusCursorEnabled](self, "focusCursorEnabled"));
  -[_UIStackedImageConfiguration focusCursorBorderWidth](self, "focusCursorBorderWidth");
  -[_UIStackedImageConfiguration setFocusCursorBorderWidth:](v4, "setFocusCursorBorderWidth:");
  -[_UIStackedImageConfiguration radiosityOffset](self, "radiosityOffset");
  -[_UIStackedImageConfiguration setRadiosityOffset:](v4, "setRadiosityOffset:");
  -[_UIStackedImageConfiguration radiosityStrength](self, "radiosityStrength");
  -[_UIStackedImageConfiguration setRadiosityStrength:](v4, "setRadiosityStrength:");
  -[_UIStackedImageConfiguration shadowSelectionDuration](self, "shadowSelectionDuration");
  -[_UIStackedImageConfiguration setShadowSelectionDuration:](v4, "setShadowSelectionDuration:");
  -[_UIStackedImageConfiguration shadowUnselectionDuration](self, "shadowUnselectionDuration");
  -[_UIStackedImageConfiguration setShadowUnselectionDuration:](v4, "setShadowUnselectionDuration:");
  -[_UIStackedImageConfiguration repositionUnselectionDuration](self, "repositionUnselectionDuration");
  -[_UIStackedImageConfiguration setRepositionUnselectionDuration:](v4, "setRepositionUnselectionDuration:");
  -[_UIStackedImageConfiguration layerSelectionDuration](self, "layerSelectionDuration");
  -[_UIStackedImageConfiguration setLayerSelectionDuration:](v4, "setLayerSelectionDuration:");
  -[_UIStackedImageConfiguration layerUnselectionDuration](self, "layerUnselectionDuration");
  -[_UIStackedImageConfiguration setLayerUnselectionDuration:](v4, "setLayerUnselectionDuration:");
  -[_UIStackedImageConfiguration minimumFocusDuration](self, "minimumFocusDuration");
  -[_UIStackedImageConfiguration setMinimumFocusDuration:](v4, "setMinimumFocusDuration:");
  -[_UIStackedImageConfiguration pressedDuration](self, "pressedDuration");
  -[_UIStackedImageConfiguration setPressedDuration:](v4, "setPressedDuration:");
  -[_UIStackedImageConfiguration unpressedDuration](self, "unpressedDuration");
  -[_UIStackedImageConfiguration setUnpressedDuration:](v4, "setUnpressedDuration:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
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
  BOOL v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  int v43;
  double v44;
  double v45;
  double v46;
  double v47;
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
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
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
  int v101;
  void *v103;
  void *v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  BOOL v143;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v32 = 0;
    goto LABEL_40;
  }
  v5 = v4;
  v6 = objc_msgSend(v5, "maximumParallaxImages");
  if (v6 == -[_UIStackedImageConfiguration maximumParallaxImages](self, "maximumParallaxImages"))
  {
    objc_msgSend(v5, "maximumParallaxDepth");
    v8 = v7;
    -[_UIStackedImageConfiguration maximumParallaxDepth](self, "maximumParallaxDepth");
    if (vabdd_f64(v8, v9) < 0.00000011920929)
    {
      objc_msgSend(v5, "overlayDepth");
      v11 = v10;
      -[_UIStackedImageConfiguration overlayDepth](self, "overlayDepth");
      if (vabdd_f64(v11, v12) < 0.00000011920929)
      {
        v13 = objc_msgSend(v5, "overlayFixedFrame");
        if (v13 == -[_UIStackedImageConfiguration overlayFixedFrame](self, "overlayFixedFrame"))
        {
          objc_msgSend(v5, "zDepth");
          v15 = v14;
          -[_UIStackedImageConfiguration zDepth](self, "zDepth");
          if (vabdd_f64(v15, v16) < 0.00000011920929)
          {
            v17 = objc_msgSend(v5, "adjustMotionForSize");
            if (v17 == -[_UIStackedImageConfiguration adjustMotionForSize](self, "adjustMotionForSize"))
            {
              objc_msgSend(v5, "rotationAmount");
              v19 = v18;
              -[_UIStackedImageConfiguration rotationAmount](self, "rotationAmount");
              if (vabdd_f64(v19, v20) < 0.00000011920929)
              {
                objc_msgSend(v5, "scaleSizeIncrease");
                v22 = v21;
                -[_UIStackedImageConfiguration scaleSizeIncrease](self, "scaleSizeIncrease");
                if (vabdd_f64(v22, v23) < 0.00000011920929)
                {
                  objc_msgSend(v5, "pressedScaleAdjustment");
                  v25 = v24;
                  -[_UIStackedImageConfiguration pressedScaleAdjustment](self, "pressedScaleAdjustment");
                  if (vabdd_f64(v25, v26) < 0.00000011920929)
                  {
                    objc_msgSend(v5, "translationOffset");
                    v28 = v27;
                    v30 = v29;
                    -[_UIStackedImageConfiguration translationOffset](self, "translationOffset");
                    v32 = 0;
                    if (v28 != v33 || v30 != v31)
                      goto LABEL_38;
                    objc_msgSend(v5, "unmaskedOverlayScaleFactor");
                    v35 = v34;
                    -[_UIStackedImageConfiguration unmaskedOverlayScaleFactor](self, "unmaskedOverlayScaleFactor");
                    if (vabdd_f64(v35, v36) < 0.00000011920929)
                    {
                      objc_msgSend(v5, "cornerRadius");
                      v38 = v37;
                      -[_UIStackedImageConfiguration cornerRadius](self, "cornerRadius");
                      if (vabdd_f64(v38, v39) < 0.00000011920929)
                      {
                        objc_msgSend(v5, "isContinuousCornerRadiusEnabled");
                        v41 = v40;
                        -[_UIStackedImageConfiguration isContinuousCornerRadiusEnabled](self, "isContinuousCornerRadiusEnabled");
                        if (v41 == v42)
                        {
                          v43 = objc_msgSend(v5, "flatImageContainsCornerRadius");
                          if (v43 == -[_UIStackedImageConfiguration flatImageContainsCornerRadius](self, "flatImageContainsCornerRadius"))
                          {
                            objc_msgSend(v5, "specularHighlightVerticalPosition");
                            v45 = v44;
                            -[_UIStackedImageConfiguration specularHighlightVerticalPosition](self, "specularHighlightVerticalPosition");
                            if (vabdd_f64(v45, v46) < 0.00000011920929)
                            {
                              objc_msgSend(v5, "specularHighlightHorizontalPositionSensitivity");
                              v48 = v47;
                              -[_UIStackedImageConfiguration specularHighlightHorizontalPositionSensitivity](self, "specularHighlightHorizontalPositionSensitivity");
                              if (vabdd_f64(v48, v49) < 0.00000011920929)
                              {
                                objc_msgSend(v5, "specularHighlightVerticalPositionSensitivity");
                                v51 = v50;
                                -[_UIStackedImageConfiguration specularHighlightVerticalPositionSensitivity](self, "specularHighlightVerticalPositionSensitivity");
                                if (vabdd_f64(v51, v52) < 0.00000011920929)
                                {
                                  objc_msgSend(v5, "specularOpacity");
                                  v54 = v53;
                                  -[_UIStackedImageConfiguration specularOpacity](self, "specularOpacity");
                                  if (vabdd_f64(v54, v55) < 0.00000011920929)
                                  {
                                    objc_msgSend(v5, "defaultFocusedShadowOpacity");
                                    v57 = v56;
                                    -[_UIStackedImageConfiguration defaultFocusedShadowOpacity](self, "defaultFocusedShadowOpacity");
                                    if (vabdd_f64(v57, v58) < 0.00000011920929)
                                    {
                                      objc_msgSend(v5, "defaultHighlightedShadowOpacity");
                                      v60 = v59;
                                      -[_UIStackedImageConfiguration defaultHighlightedShadowOpacity](self, "defaultHighlightedShadowOpacity");
                                      if (vabdd_f64(v60, v61) < 0.00000011920929)
                                      {
                                        objc_msgSend(v5, "defaultUnfocusedShadowOpacity");
                                        v63 = v62;
                                        -[_UIStackedImageConfiguration defaultUnfocusedShadowOpacity](self, "defaultUnfocusedShadowOpacity");
                                        if (vabdd_f64(v63, v64) < 0.00000011920929)
                                        {
                                          objc_msgSend(v5, "fullBleedFocusedShadowOpacity");
                                          v66 = v65;
                                          -[_UIStackedImageConfiguration fullBleedFocusedShadowOpacity](self, "fullBleedFocusedShadowOpacity");
                                          if (vabdd_f64(v66, v67) < 0.00000011920929)
                                          {
                                            objc_msgSend(v5, "fullBleedUnfocusedShadowOpacity");
                                            v69 = v68;
                                            -[_UIStackedImageConfiguration fullBleedUnfocusedShadowOpacity](self, "fullBleedUnfocusedShadowOpacity");
                                            if (vabdd_f64(v69, v70) < 0.00000011920929)
                                            {
                                              objc_msgSend(v5, "focusCursorShadowOpacityAdjustment");
                                              v72 = v71;
                                              -[_UIStackedImageConfiguration focusCursorShadowOpacityAdjustment](self, "focusCursorShadowOpacityAdjustment");
                                              if (vabdd_f64(v72, v73) < 0.00000011920929)
                                              {
                                                objc_msgSend(v5, "defaultFocusedShadowRadius");
                                                v75 = v74;
                                                -[_UIStackedImageConfiguration defaultFocusedShadowRadius](self, "defaultFocusedShadowRadius");
                                                if (vabdd_f64(v75, v76) < 0.00000011920929)
                                                {
                                                  objc_msgSend(v5, "defaultHighlightedShadowRadius");
                                                  v78 = v77;
                                                  -[_UIStackedImageConfiguration defaultHighlightedShadowRadius](self, "defaultHighlightedShadowRadius");
                                                  if (vabdd_f64(v78, v79) < 0.00000011920929)
                                                  {
                                                    objc_msgSend(v5, "defaultUnfocusedShadowRadius");
                                                    v81 = v80;
                                                    -[_UIStackedImageConfiguration defaultUnfocusedShadowRadius](self, "defaultUnfocusedShadowRadius");
                                                    if (vabdd_f64(v81, v82) < 0.00000011920929)
                                                    {
                                                      objc_msgSend(v5, "fullBleedFocusedShadowRadius");
                                                      v84 = v83;
                                                      -[_UIStackedImageConfiguration fullBleedFocusedShadowRadius](self, "fullBleedFocusedShadowRadius");
                                                      if (vabdd_f64(v84, v85) < 0.00000011920929)
                                                      {
                                                        objc_msgSend(v5, "fullBleedUnfocusedShadowRadius");
                                                        v87 = v86;
                                                        -[_UIStackedImageConfiguration fullBleedUnfocusedShadowRadius](self, "fullBleedUnfocusedShadowRadius");
                                                        if (vabdd_f64(v87, v88) < 0.00000011920929)
                                                        {
                                                          objc_msgSend(v5, "defaultFocusedShadowVerticalOffset");
                                                          v90 = v89;
                                                          -[_UIStackedImageConfiguration defaultFocusedShadowVerticalOffset](self, "defaultFocusedShadowVerticalOffset");
                                                          if (vabdd_f64(v90, v91) < 0.00000011920929)
                                                          {
                                                            objc_msgSend(v5, "defaultHighlightedShadowVerticalOffset");
                                                            v93 = v92;
                                                            -[_UIStackedImageConfiguration defaultHighlightedShadowVerticalOffset](self, "defaultHighlightedShadowVerticalOffset");
                                                            if (vabdd_f64(v93, v94) < 0.00000011920929)
                                                            {
                                                              objc_msgSend(v5, "defaultUnfocusedShadowVerticalOffset");
                                                              v96 = v95;
                                                              -[_UIStackedImageConfiguration defaultUnfocusedShadowVerticalOffset](self, "defaultUnfocusedShadowVerticalOffset");
                                                              if (vabdd_f64(v96, v97) < 0.00000011920929)
                                                              {
                                                                objc_msgSend(v5, "defaultSelectedShadowVerticalOffset");
                                                                v99 = v98;
                                                                -[_UIStackedImageConfiguration defaultSelectedShadowVerticalOffset](self, "defaultSelectedShadowVerticalOffset");
                                                                if (vabdd_f64(v99, v100) < 0.00000011920929)
                                                                {
                                                                  v101 = objc_msgSend(v5, "useSeparateUnfocusedShadowImage");
                                                                  if (v101 == -[_UIStackedImageConfiguration useSeparateUnfocusedShadowImage](self, "useSeparateUnfocusedShadowImage"))
                                                                  {
                                                                    objc_msgSend(v5, "placeholderImage");
                                                                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    -[_UIStackedImageConfiguration placeholderImage](self, "placeholderImage");
                                                                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    if (!objc_msgSend(v103, "isEqual:", v104))goto LABEL_58;
                                                                    v105 = objc_msgSend(v5, "allowsNonOpaqueShadow");
                                                                    if (v105 != -[_UIStackedImageConfiguration allowsNonOpaqueShadow](self, "allowsNonOpaqueShadow"))goto LABEL_58;
                                                                    v106 = objc_msgSend(v5, "boostBrightness");
                                                                    if (v106 != -[_UIStackedImageConfiguration boostBrightness](self, "boostBrightness"))goto LABEL_58;
                                                                    v107 = objc_msgSend(v5, "hueShift");
                                                                    if (v107 != -[_UIStackedImageConfiguration hueShift](self, "hueShift"))goto LABEL_58;
                                                                    v108 = objc_msgSend(v5, "disableMask");
                                                                    if (v108 != -[_UIStackedImageConfiguration disableMask](self, "disableMask"))goto LABEL_58;
                                                                    v109 = objc_msgSend(v5, "focusCursorEnabled");
                                                                    if (v109 != -[_UIStackedImageConfiguration focusCursorEnabled](self, "focusCursorEnabled"))goto LABEL_58;
                                                                    objc_msgSend(v5, "focusCursorBorderWidth");
                                                                    v111 = v110;
                                                                    -[_UIStackedImageConfiguration focusCursorBorderWidth](self, "focusCursorBorderWidth");
                                                                    if (vabdd_f64(v111, v112) >= 0.00000011920929)
                                                                      goto LABEL_58;
                                                                    objc_msgSend(v5, "radiosityOffset");
                                                                    v114 = v113;
                                                                    -[_UIStackedImageConfiguration radiosityOffset](self, "radiosityOffset");
                                                                    if (vabdd_f64(v114, v115) >= 0.00000011920929)
                                                                      goto LABEL_58;
                                                                    objc_msgSend(v5, "radiosityStrength");
                                                                    v117 = v116;
                                                                    -[_UIStackedImageConfiguration radiosityStrength](self, "radiosityStrength");
                                                                    if (vabdd_f64(v117, v118) >= 0.00000011920929)
                                                                      goto LABEL_58;
                                                                    objc_msgSend(v5, "shadowSelectionDuration");
                                                                    v120 = v119;
                                                                    -[_UIStackedImageConfiguration shadowSelectionDuration](self, "shadowSelectionDuration");
                                                                    if (vabdd_f64(v120, v121) >= 0.00000011920929)
                                                                      goto LABEL_58;
                                                                    objc_msgSend(v5, "shadowUnselectionDuration");
                                                                    v123 = v122;
                                                                    -[_UIStackedImageConfiguration shadowUnselectionDuration](self, "shadowUnselectionDuration");
                                                                    if (vabdd_f64(v123, v124) >= 0.00000011920929)
                                                                      goto LABEL_58;
                                                                    objc_msgSend(v5, "repositionUnselectionDuration");
                                                                    v126 = v125;
                                                                    -[_UIStackedImageConfiguration repositionUnselectionDuration](self, "repositionUnselectionDuration");
                                                                    if (vabdd_f64(v126, v127) >= 0.00000011920929)
                                                                      goto LABEL_58;
                                                                    objc_msgSend(v5, "layerSelectionDuration");
                                                                    v129 = v128;
                                                                    -[_UIStackedImageConfiguration layerSelectionDuration](self, "layerSelectionDuration");
                                                                    if (vabdd_f64(v129, v130) >= 0.00000011920929)
                                                                      goto LABEL_58;
                                                                    objc_msgSend(v5, "layerUnselectionDuration");
                                                                    v132 = v131;
                                                                    -[_UIStackedImageConfiguration layerUnselectionDuration](self, "layerUnselectionDuration");
                                                                    if (vabdd_f64(v132, v133) >= 0.00000011920929)
                                                                      goto LABEL_58;
                                                                    objc_msgSend(v5, "minimumFocusDuration");
                                                                    v135 = v134;
                                                                    -[_UIStackedImageConfiguration minimumFocusDuration](self, "minimumFocusDuration");
                                                                    if (vabdd_f64(v135, v136) < 0.00000011920929
                                                                      && (objc_msgSend(v5, "pressedDuration"),
                                                                          v138 = v137,
                                                                          -[_UIStackedImageConfiguration pressedDuration](self, "pressedDuration"), vabdd_f64(v138, v139) < 0.00000011920929))
                                                                    {
                                                                      objc_msgSend(v5, "unpressedDuration");
                                                                      v141 = v140;
                                                                      -[_UIStackedImageConfiguration unpressedDuration](self, "unpressedDuration");
                                                                      v143 = vabdd_f64(v141, v142) < 0.00000011920929;
                                                                    }
                                                                    else
                                                                    {
LABEL_58:
                                                                      v143 = 0;
                                                                    }

                                                                    v32 = v143;
                                                                    goto LABEL_38;
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v32 = 0;
LABEL_38:

LABEL_40:
  return v32;
}

- (_UIFocusAnimationConfiguration)focusAnimationConfiguration
{
  void *v3;

  +[_UIFocusAnimationConfiguration configurationWithStyle:](_UIFocusAnimationConfiguration, "configurationWithStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStackedImageConfiguration layerSelectionDuration](self, "layerSelectionDuration");
  objc_msgSend(v3, "setFocusingBaseDuration:");
  -[_UIStackedImageConfiguration layerUnselectionDuration](self, "layerUnselectionDuration");
  objc_msgSend(v3, "setUnfocusingBaseDuration:");
  -[_UIStackedImageConfiguration repositionUnselectionDuration](self, "repositionUnselectionDuration");
  objc_msgSend(v3, "setUnfocusingRepositionBaseDuration:");
  -[_UIStackedImageConfiguration minimumFocusDuration](self, "minimumFocusDuration");
  objc_msgSend(v3, "setMinimumFocusDuration:");
  return (_UIFocusAnimationConfiguration *)v3;
}

- (void)_highContrastFocusIndicatorChanged:(id)a3
{
  -[_UIStackedImageConfiguration setFocusCursorEnabled:](self, "setFocusCursorEnabled:", _AXSHighContrastFocusIndicatorsEnabled() != 0);
}

- (unint64_t)maximumParallaxImages
{
  return self->_maximumParallaxImages;
}

- (void)setMaximumParallaxImages:(unint64_t)a3
{
  self->_maximumParallaxImages = a3;
}

- (double)maximumParallaxDepth
{
  return self->_maximumParallaxDepth;
}

- (void)setMaximumParallaxDepth:(double)a3
{
  self->_maximumParallaxDepth = a3;
}

- (double)overlayDepth
{
  return self->_overlayDepth;
}

- (void)setOverlayDepth:(double)a3
{
  self->_overlayDepth = a3;
}

- (BOOL)overlayFixedFrame
{
  return self->_overlayFixedFrame;
}

- (void)setOverlayFixedFrame:(BOOL)a3
{
  self->_overlayFixedFrame = a3;
}

- (double)zDepth
{
  return self->_zDepth;
}

- (void)setZDepth:(double)a3
{
  self->_zDepth = a3;
}

- (BOOL)adjustMotionForSize
{
  return self->_adjustMotionForSize;
}

- (void)setAdjustMotionForSize:(BOOL)a3
{
  self->_adjustMotionForSize = a3;
}

- (double)rotationAmount
{
  return self->_rotationAmount;
}

- (void)setRotationAmount:(double)a3
{
  self->_rotationAmount = a3;
}

- (double)scaleSizeIncrease
{
  return self->_scaleSizeIncrease;
}

- (void)setScaleSizeIncrease:(double)a3
{
  self->_scaleSizeIncrease = a3;
}

- (double)pressedScaleAdjustment
{
  return self->_pressedScaleAdjustment;
}

- (void)setPressedScaleAdjustment:(double)a3
{
  self->_pressedScaleAdjustment = a3;
}

- (CGPoint)translationOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_translationOffset.x;
  y = self->_translationOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTranslationOffset:(CGPoint)a3
{
  self->_translationOffset = a3;
}

- (double)unmaskedOverlayScaleFactor
{
  return self->_unmaskedOverlayScaleFactor;
}

- (void)setUnmaskedOverlayScaleFactor:(double)a3
{
  self->_unmaskedOverlayScaleFactor = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)isContinuousCornerRadiusEnabled
{
  return self->_continuousCornerRadiusEnabled;
}

- (void)setContinuousCornerRadiusEnabled:(double)a3
{
  self->_continuousCornerRadiusEnabled = a3;
}

- (BOOL)flatImageContainsCornerRadius
{
  return self->_flatImageContainsCornerRadius;
}

- (void)setFlatImageContainsCornerRadius:(BOOL)a3
{
  self->_flatImageContainsCornerRadius = a3;
}

- (double)specularHighlightHorizontalPositionSensitivity
{
  return self->_specularHighlightHorizontalPositionSensitivity;
}

- (void)setSpecularHighlightHorizontalPositionSensitivity:(double)a3
{
  self->_specularHighlightHorizontalPositionSensitivity = a3;
}

- (double)specularHighlightVerticalPosition
{
  return self->_specularHighlightVerticalPosition;
}

- (void)setSpecularHighlightVerticalPosition:(double)a3
{
  self->_specularHighlightVerticalPosition = a3;
}

- (double)specularHighlightVerticalPositionSensitivity
{
  return self->_specularHighlightVerticalPositionSensitivity;
}

- (void)setSpecularHighlightVerticalPositionSensitivity:(double)a3
{
  self->_specularHighlightVerticalPositionSensitivity = a3;
}

- (double)specularOpacity
{
  return self->_specularOpacity;
}

- (void)setSpecularOpacity:(double)a3
{
  self->_specularOpacity = a3;
}

- (double)defaultFocusedShadowOpacity
{
  return self->_defaultFocusedShadowOpacity;
}

- (void)setDefaultFocusedShadowOpacity:(double)a3
{
  self->_defaultFocusedShadowOpacity = a3;
}

- (double)defaultHighlightedShadowOpacity
{
  return self->_defaultHighlightedShadowOpacity;
}

- (void)setDefaultHighlightedShadowOpacity:(double)a3
{
  self->_defaultHighlightedShadowOpacity = a3;
}

- (double)defaultUnfocusedShadowOpacity
{
  return self->_defaultUnfocusedShadowOpacity;
}

- (void)setDefaultUnfocusedShadowOpacity:(double)a3
{
  self->_defaultUnfocusedShadowOpacity = a3;
}

- (double)fullBleedFocusedShadowOpacity
{
  return self->_fullBleedFocusedShadowOpacity;
}

- (void)setFullBleedFocusedShadowOpacity:(double)a3
{
  self->_fullBleedFocusedShadowOpacity = a3;
}

- (double)fullBleedUnfocusedShadowOpacity
{
  return self->_fullBleedUnfocusedShadowOpacity;
}

- (void)setFullBleedUnfocusedShadowOpacity:(double)a3
{
  self->_fullBleedUnfocusedShadowOpacity = a3;
}

- (double)focusCursorShadowOpacityAdjustment
{
  return self->_focusCursorShadowOpacityAdjustment;
}

- (void)setFocusCursorShadowOpacityAdjustment:(double)a3
{
  self->_focusCursorShadowOpacityAdjustment = a3;
}

- (double)defaultFocusedShadowRadius
{
  return self->_defaultFocusedShadowRadius;
}

- (void)setDefaultFocusedShadowRadius:(double)a3
{
  self->_defaultFocusedShadowRadius = a3;
}

- (double)defaultHighlightedShadowRadius
{
  return self->_defaultHighlightedShadowRadius;
}

- (void)setDefaultHighlightedShadowRadius:(double)a3
{
  self->_defaultHighlightedShadowRadius = a3;
}

- (double)defaultUnfocusedShadowRadius
{
  return self->_defaultUnfocusedShadowRadius;
}

- (void)setDefaultUnfocusedShadowRadius:(double)a3
{
  self->_defaultUnfocusedShadowRadius = a3;
}

- (double)fullBleedFocusedShadowRadius
{
  return self->_fullBleedFocusedShadowRadius;
}

- (void)setFullBleedFocusedShadowRadius:(double)a3
{
  self->_fullBleedFocusedShadowRadius = a3;
}

- (double)fullBleedUnfocusedShadowRadius
{
  return self->_fullBleedUnfocusedShadowRadius;
}

- (void)setFullBleedUnfocusedShadowRadius:(double)a3
{
  self->_fullBleedUnfocusedShadowRadius = a3;
}

- (double)defaultFocusedShadowVerticalOffset
{
  return self->_defaultFocusedShadowVerticalOffset;
}

- (void)setDefaultFocusedShadowVerticalOffset:(double)a3
{
  self->_defaultFocusedShadowVerticalOffset = a3;
}

- (double)defaultHighlightedShadowVerticalOffset
{
  return self->_defaultHighlightedShadowVerticalOffset;
}

- (void)setDefaultHighlightedShadowVerticalOffset:(double)a3
{
  self->_defaultHighlightedShadowVerticalOffset = a3;
}

- (double)defaultUnfocusedShadowVerticalOffset
{
  return self->_defaultUnfocusedShadowVerticalOffset;
}

- (void)setDefaultUnfocusedShadowVerticalOffset:(double)a3
{
  self->_defaultUnfocusedShadowVerticalOffset = a3;
}

- (double)defaultSelectedShadowVerticalOffset
{
  return self->_defaultSelectedShadowVerticalOffset;
}

- (void)setDefaultSelectedShadowVerticalOffset:(double)a3
{
  self->_defaultSelectedShadowVerticalOffset = a3;
}

- (BOOL)useSeparateUnfocusedShadowImage
{
  return self->_useSeparateUnfocusedShadowImage;
}

- (void)setUseSeparateUnfocusedShadowImage:(BOOL)a3
{
  self->_useSeparateUnfocusedShadowImage = a3;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImage, a3);
}

- (BOOL)allowsNonOpaqueShadow
{
  return self->_allowsNonOpaqueShadow;
}

- (void)setAllowsNonOpaqueShadow:(BOOL)a3
{
  self->_allowsNonOpaqueShadow = a3;
}

- (BOOL)boostBrightness
{
  return self->_boostBrightness;
}

- (void)setBoostBrightness:(BOOL)a3
{
  self->_boostBrightness = a3;
}

- (BOOL)hueShift
{
  return self->_hueShift;
}

- (void)setHueShift:(BOOL)a3
{
  self->_hueShift = a3;
}

- (BOOL)disableMask
{
  return self->_disableMask;
}

- (void)setDisableMask:(BOOL)a3
{
  self->_disableMask = a3;
}

- (BOOL)focusCursorEnabled
{
  return self->_focusCursorEnabled;
}

- (void)setFocusCursorEnabled:(BOOL)a3
{
  self->_focusCursorEnabled = a3;
}

- (double)focusCursorBorderWidth
{
  return self->_focusCursorBorderWidth;
}

- (void)setFocusCursorBorderWidth:(double)a3
{
  self->_focusCursorBorderWidth = a3;
}

- (double)radiosityOffset
{
  return self->_radiosityOffset;
}

- (void)setRadiosityOffset:(double)a3
{
  self->_radiosityOffset = a3;
}

- (double)radiosityStrength
{
  return self->_radiosityStrength;
}

- (void)setRadiosityStrength:(double)a3
{
  self->_radiosityStrength = a3;
}

- (double)shadowSelectionDuration
{
  return self->_shadowSelectionDuration;
}

- (void)setShadowSelectionDuration:(double)a3
{
  self->_shadowSelectionDuration = a3;
}

- (double)shadowUnselectionDuration
{
  return self->_shadowUnselectionDuration;
}

- (void)setShadowUnselectionDuration:(double)a3
{
  self->_shadowUnselectionDuration = a3;
}

- (double)repositionUnselectionDuration
{
  return self->_repositionUnselectionDuration;
}

- (void)setRepositionUnselectionDuration:(double)a3
{
  self->_repositionUnselectionDuration = a3;
}

- (double)layerSelectionDuration
{
  return self->_layerSelectionDuration;
}

- (void)setLayerSelectionDuration:(double)a3
{
  self->_layerSelectionDuration = a3;
}

- (double)layerUnselectionDuration
{
  return self->_layerUnselectionDuration;
}

- (void)setLayerUnselectionDuration:(double)a3
{
  self->_layerUnselectionDuration = a3;
}

- (double)minimumFocusDuration
{
  return self->_minimumFocusDuration;
}

- (void)setMinimumFocusDuration:(double)a3
{
  self->_minimumFocusDuration = a3;
}

- (double)pressedDuration
{
  return self->_pressedDuration;
}

- (void)setPressedDuration:(double)a3
{
  self->_pressedDuration = a3;
}

- (double)unpressedDuration
{
  return self->_unpressedDuration;
}

- (void)setUnpressedDuration:(double)a3
{
  self->_unpressedDuration = a3;
}

- (BOOL)fullBleedCenteredGrowth
{
  return self->_fullBleedCenteredGrowth;
}

- (void)setFullBleedCenteredGrowth:(BOOL)a3
{
  self->_fullBleedCenteredGrowth = a3;
}

- (double)fullBleedOffset
{
  return self->_fullBleedOffset;
}

- (void)setFullBleedOffset:(double)a3
{
  self->_fullBleedOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
}

@end
