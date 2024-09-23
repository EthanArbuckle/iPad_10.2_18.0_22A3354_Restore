@implementation SBSpotlightSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSpotlightSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_opacityAnimationSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_opacityAnimationSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setResponse:](self->_opacityAnimationSettings, "setResponse:", 0.5);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_snappyOpacityAnimationSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_snappyOpacityAnimationSettings, "setDampingRatio:", 1.0);
  -[SBFFluidBehaviorSettings setResponse:](self->_snappyOpacityAnimationSettings, "setResponse:", 0.25);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_scaleAnimationSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_scaleAnimationSettings, "setDampingRatio:", 0.7);
  -[SBFFluidBehaviorSettings setResponse:](self->_scaleAnimationSettings, "setResponse:", 0.55);
  -[SBFFluidBehaviorSettings setDefaultValues](self->_snappyScaleAnimationSettings, "setDefaultValues");
  -[SBFFluidBehaviorSettings setDampingRatio:](self->_snappyScaleAnimationSettings, "setDampingRatio:", 0.68);
  -[SBFFluidBehaviorSettings setResponse:](self->_snappyScaleAnimationSettings, "setResponse:", 0.3);
  -[SBSpotlightSettings setAnchorPointY:](self, "setAnchorPointY:", 0.12);
  -[SBSpotlightSettings setHiddenScale:](self, "setHiddenScale:", 1.15);
  -[SBSpotlightSettings setHiddenBlurRadius:](self, "setHiddenBlurRadius:", 15.0);
  -[SBSpotlightSettings setMinTranslationToShowSpotlight:](self, "setMinTranslationToShowSpotlight:", 40.0);
  -[SBSpotlightSettings setMaxTranslationForSpotlightScale:](self, "setMaxTranslationForSpotlightScale:", 300.0);
  -[SBSpotlightSettings setSpotlightScaleRubberbandingMin:](self, "setSpotlightScaleRubberbandingMin:", 1.0);
  -[SBSpotlightSettings hiddenScale](self, "hiddenScale");
  -[SBSpotlightSettings setSpotlightScaleRubberbandingMax:](self, "setSpotlightScaleRubberbandingMax:");
  -[SBSpotlightSettings setSpotlightScaleRubberbandingRange:](self, "setSpotlightScaleRubberbandingRange:", 0.1);
  -[SBSpotlightSettings setMaxTranslationForHomeScreenScale:](self, "setMaxTranslationForHomeScreenScale:", 300.0);
  -[SBSpotlightSettings setHomeScreenScaleRubberbandingMin:](self, "setHomeScreenScaleRubberbandingMin:", 1.0);
  -[SBSpotlightSettings setHomeScreenScaleRubberbandingMax:](self, "setHomeScreenScaleRubberbandingMax:", 1.0);
  -[SBSpotlightSettings setHomeScreenScaleRubberbandingRange:](self, "setHomeScreenScaleRubberbandingRange:", 0.1);
  -[SBSpotlightSettings setMaxTranslationForDimmingView:](self, "setMaxTranslationForDimmingView:", 50.0);
  -[SBSpotlightSettings setDimmingViewRubberbandingMin:](self, "setDimmingViewRubberbandingMin:", 0.0);
  -[SBSpotlightSettings setDimmingViewRubberbandingMax:](self, "setDimmingViewRubberbandingMax:", 0.15);
  -[SBSpotlightSettings setDimmingViewRubberbandingRange:](self, "setDimmingViewRubberbandingRange:", 0.25);
  -[SBSpotlightSettings setSpotlightTranslationRubberbandingRange:](self, "setSpotlightTranslationRubberbandingRange:", 60.0);
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
  _QWORD v73[3];
  _QWORD v74[17];
  _QWORD v75[4];
  _QWORD v76[3];

  v76[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83070];
  v76[0] = v61;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v5);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Opacity Animation Settings"), CFSTR("opacityAnimationSettings"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Snappy Opacity Animation Settings"), CFSTR("snappyOpacityAnimationSettings"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Scale Animation Settings"), CFSTR("scaleAnimationSettings"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Snappy Scale Animation Settings"), CFSTR("snappyScaleAnimationSettings"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D83070];
  v75[0] = v60;
  v75[1] = v59;
  v75[2] = v58;
  v75[3] = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v7, CFSTR("Animations"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Anchor Point Y"), CFSTR("anchorPointY"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "between:and:", 0.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "precision:", 2);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Hidden Scale"), CFSTR("hiddenScale"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "between:and:", 0.0, 2.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "precision:", 2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Hidden Blur Radius"), CFSTR("hiddenBlurRadius"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "between:and:", 0.0, 100.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "precision:", 2);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Min Translation To Show Spotlight"), CFSTR("minTranslationToShowSpotlight"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "between:and:", 0.0, 1000.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "precision:", 2);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Max Translation For Spotlight Scale"), CFSTR("maxTranslationForSpotlightScale"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "between:and:", 0.0, 1000.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "precision:", 2);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Spotlight Scale Rubberbanding Min"), CFSTR("spotlightScaleRubberbandingMin"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "between:and:", 0.0, 1000.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "precision:", 2);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Spotlight Scale Rubberbanding Max"), CFSTR("spotlightScaleRubberbandingMax"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "between:and:", 0.0, 1000.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "precision:", 2);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Spotlight Scale Rubberbanding Range"), CFSTR("spotlightScaleRubberbandingRange"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "between:and:", 0.0, 1000.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "precision:", 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Max Translation For Home Screen Scale"), CFSTR("maxTranslationForHomeScreenScale"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "between:and:", 0.0, 1000.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "precision:", 2);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Scale Rubberbanding Min"), CFSTR("homeScreenScaleRubberbandingMin"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "between:and:", 0.0, 1000.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "precision:", 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Scale Rubberbanding Max"), CFSTR("homeScreenScaleRubberbandingMax"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "between:and:", 0.0, 1000.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "precision:", 2);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Scale Rubberbanding Range"), CFSTR("homeScreenScaleRubberbandingRange"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "between:and:", 0.0, 1000.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "precision:", 2);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Max Translation For Home Screen Dimming"), CFSTR("maxTranslationForDimmingView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "between:and:", 0.0, 1000.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "precision:", 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Dimming Rubberbanding Min"), CFSTR("dimmingViewRubberbandingMin"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "between:and:", 0.0, 1000.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "precision:", 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Dimming Rubberbanding Max"), CFSTR("dimmingViewRubberbandingMax"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "between:and:", 0.0, 1000.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "precision:", 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Dimming Rubberbanding Range"), CFSTR("dimmingViewRubberbandingRange"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "between:and:", 0.0, 1000.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "precision:", 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Spotlight Translation Rubberbanding Range"), CFSTR("spotlightTranslationRubberbandingRange"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "between:and:", 0.0, 1000.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "precision:", 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = (void *)MEMORY[0x1E0D83070];
  v74[0] = v70;
  v74[1] = v71;
  v74[2] = v68;
  v74[3] = v69;
  v74[4] = v66;
  v74[5] = v67;
  v74[6] = v65;
  v74[7] = v64;
  v74[8] = v55;
  v74[9] = v54;
  v74[10] = v63;
  v74[11] = v62;
  v74[12] = v53;
  v74[13] = v36;
  v74[14] = v52;
  v74[15] = v41;
  v74[16] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 17);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "sectionWithRows:title:", v46, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = (void *)MEMORY[0x1E0D83070];
  v73[0] = v72;
  v73[1] = v56;
  v73[2] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "moduleWithTitle:contents:", CFSTR("Spotlight"), v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  return v50;
}

- (SBFFluidBehaviorSettings)opacityAnimationSettings
{
  return self->_opacityAnimationSettings;
}

- (void)setOpacityAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_opacityAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)snappyOpacityAnimationSettings
{
  return self->_snappyOpacityAnimationSettings;
}

- (void)setSnappyOpacityAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_snappyOpacityAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)scaleAnimationSettings
{
  return self->_scaleAnimationSettings;
}

- (void)setScaleAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_scaleAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)snappyScaleAnimationSettings
{
  return self->_snappyScaleAnimationSettings;
}

- (void)setSnappyScaleAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_snappyScaleAnimationSettings, a3);
}

- (double)anchorPointY
{
  return self->_anchorPointY;
}

- (void)setAnchorPointY:(double)a3
{
  self->_anchorPointY = a3;
}

- (double)hiddenScale
{
  return self->_hiddenScale;
}

- (void)setHiddenScale:(double)a3
{
  self->_hiddenScale = a3;
}

- (double)hiddenBlurRadius
{
  return self->_hiddenBlurRadius;
}

- (void)setHiddenBlurRadius:(double)a3
{
  self->_hiddenBlurRadius = a3;
}

- (double)minTranslationToShowSpotlight
{
  return self->_minTranslationToShowSpotlight;
}

- (void)setMinTranslationToShowSpotlight:(double)a3
{
  self->_minTranslationToShowSpotlight = a3;
}

- (double)maxTranslationForSpotlightScale
{
  return self->_maxTranslationForSpotlightScale;
}

- (void)setMaxTranslationForSpotlightScale:(double)a3
{
  self->_maxTranslationForSpotlightScale = a3;
}

- (double)spotlightScaleRubberbandingMin
{
  return self->_spotlightScaleRubberbandingMin;
}

- (void)setSpotlightScaleRubberbandingMin:(double)a3
{
  self->_spotlightScaleRubberbandingMin = a3;
}

- (double)spotlightScaleRubberbandingMax
{
  return self->_spotlightScaleRubberbandingMax;
}

- (void)setSpotlightScaleRubberbandingMax:(double)a3
{
  self->_spotlightScaleRubberbandingMax = a3;
}

- (double)spotlightScaleRubberbandingRange
{
  return self->_spotlightScaleRubberbandingRange;
}

- (void)setSpotlightScaleRubberbandingRange:(double)a3
{
  self->_spotlightScaleRubberbandingRange = a3;
}

- (double)maxTranslationForHomeScreenScale
{
  return self->_maxTranslationForHomeScreenScale;
}

- (void)setMaxTranslationForHomeScreenScale:(double)a3
{
  self->_maxTranslationForHomeScreenScale = a3;
}

- (double)homeScreenScaleRubberbandingMin
{
  return self->_homeScreenScaleRubberbandingMin;
}

- (void)setHomeScreenScaleRubberbandingMin:(double)a3
{
  self->_homeScreenScaleRubberbandingMin = a3;
}

- (double)homeScreenScaleRubberbandingMax
{
  return self->_homeScreenScaleRubberbandingMax;
}

- (void)setHomeScreenScaleRubberbandingMax:(double)a3
{
  self->_homeScreenScaleRubberbandingMax = a3;
}

- (double)homeScreenScaleRubberbandingRange
{
  return self->_homeScreenScaleRubberbandingRange;
}

- (void)setHomeScreenScaleRubberbandingRange:(double)a3
{
  self->_homeScreenScaleRubberbandingRange = a3;
}

- (double)maxTranslationForDimmingView
{
  return self->_maxTranslationForDimmingView;
}

- (void)setMaxTranslationForDimmingView:(double)a3
{
  self->_maxTranslationForDimmingView = a3;
}

- (double)dimmingViewRubberbandingMin
{
  return self->_dimmingViewRubberbandingMin;
}

- (void)setDimmingViewRubberbandingMin:(double)a3
{
  self->_dimmingViewRubberbandingMin = a3;
}

- (double)dimmingViewRubberbandingMax
{
  return self->_dimmingViewRubberbandingMax;
}

- (void)setDimmingViewRubberbandingMax:(double)a3
{
  self->_dimmingViewRubberbandingMax = a3;
}

- (double)dimmingViewRubberbandingRange
{
  return self->_dimmingViewRubberbandingRange;
}

- (void)setDimmingViewRubberbandingRange:(double)a3
{
  self->_dimmingViewRubberbandingRange = a3;
}

- (double)spotlightTranslationRubberbandingRange
{
  return self->_spotlightTranslationRubberbandingRange;
}

- (void)setSpotlightTranslationRubberbandingRange:(double)a3
{
  self->_spotlightTranslationRubberbandingRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snappyScaleAnimationSettings, 0);
  objc_storeStrong((id *)&self->_scaleAnimationSettings, 0);
  objc_storeStrong((id *)&self->_snappyOpacityAnimationSettings, 0);
  objc_storeStrong((id *)&self->_opacityAnimationSettings, 0);
}

@end
