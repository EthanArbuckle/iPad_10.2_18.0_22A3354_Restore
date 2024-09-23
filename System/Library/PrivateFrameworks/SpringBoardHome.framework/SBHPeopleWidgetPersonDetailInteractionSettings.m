@implementation SBHPeopleWidgetPersonDetailInteractionSettings

- (void)setDefaultValues
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[SBHPeopleWidgetPersonDetailInteractionSettings setUsesCardStyle:](self, "setUsesCardStyle:", 1);
    -[SBHPeopleWidgetPersonDetailInteractionSettings setCardWidth:](self, "setCardWidth:", 375.0);
    -[SBHPeopleWidgetPersonDetailInteractionSettings setCardHeightPortrait:](self, "setCardHeightPortrait:", 700.0);
    -[SBHPeopleWidgetPersonDetailInteractionSettings setCardHeightLandscape:](self, "setCardHeightLandscape:", 660.0);
    -[SBHPeopleWidgetPersonDetailInteractionSettings setCardCornerRadius:](self, "setCardCornerRadius:", 22.0);
    -[SBHPeopleWidgetPersonDetailInteractionSettings setCardStyleHomeScreenScale:](self, "setCardStyleHomeScreenScale:", 0.96);
    -[SBHPeopleWidgetPersonDetailInteractionSettings setCardStyleHomeScreenAlpha:](self, "setCardStyleHomeScreenAlpha:", 0.9);
    -[SBHPeopleWidgetPersonDetailInteractionSettings setCardStyleDarkeningTintAlpha:](self, "setCardStyleDarkeningTintAlpha:", 0.32);
    -[SBHPeopleWidgetPersonDetailInteractionSettings setFullScreenHomeScreenScale:](self, "setFullScreenHomeScreenScale:", 0.96);
    -[SBHPeopleWidgetPersonDetailInteractionSettings setFullScreenHomeScreenAlpha:](self, "setFullScreenHomeScreenAlpha:", 0.4);
    -[SBHPeopleWidgetPersonDetailInteractionSettings setFullScreenDarkeningTintAlpha:](self, "setFullScreenDarkeningTintAlpha:", 0.32);
    -[SBHPeopleWidgetPersonDetailInteractionSettings zoomAnimationSettings](self, "zoomAnimationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDefaultValues");

    -[SBHPeopleWidgetPersonDetailInteractionSettings zoomAnimationSettings](self, "zoomAnimationSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDampingRatio:", 1.1);

    -[SBHPeopleWidgetPersonDetailInteractionSettings zoomAnimationSettings](self, "zoomAnimationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setResponse:", 0.25);

    -[SBHPeopleWidgetPersonDetailInteractionSettings zoomAnimationSettings](self, "zoomAnimationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRetargetImpulse:", 0.016);

    -[SBHPeopleWidgetPersonDetailInteractionSettings fadeOutAnimationSettings](self, "fadeOutAnimationSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDefaultValues");

    -[SBHPeopleWidgetPersonDetailInteractionSettings fadeOutAnimationSettings](self, "fadeOutAnimationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDampingRatio:", 1.1);

    -[SBHPeopleWidgetPersonDetailInteractionSettings fadeOutAnimationSettings](self, "fadeOutAnimationSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setResponse:", 0.18);

    -[SBHPeopleWidgetPersonDetailInteractionSettings fadeOutAnimationSettings](self, "fadeOutAnimationSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRetargetImpulse:", 0.016);
    v13 = 0.06;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");

    -[SBHPeopleWidgetPersonDetailInteractionSettings setUsesCardStyle:](self, "setUsesCardStyle:", 0);
    UIRoundToScale();
    -[SBHPeopleWidgetPersonDetailInteractionSettings setCardWidth:](self, "setCardWidth:");
    -[SBHPeopleWidgetPersonDetailInteractionSettings setCardHeightPortrait:](self, "setCardHeightPortrait:", 480.0);
    -[SBHPeopleWidgetPersonDetailInteractionSettings setCardHeightLandscape:](self, "setCardHeightLandscape:", 480.0);
    UIRoundToScale();
    -[SBHPeopleWidgetPersonDetailInteractionSettings setCardCornerRadius:](self, "setCardCornerRadius:");
    -[SBHPeopleWidgetPersonDetailInteractionSettings setCardStyleHomeScreenScale:](self, "setCardStyleHomeScreenScale:", 0.94);
    -[SBHPeopleWidgetPersonDetailInteractionSettings setCardStyleHomeScreenAlpha:](self, "setCardStyleHomeScreenAlpha:", 0.4);
    -[SBHPeopleWidgetPersonDetailInteractionSettings setCardStyleDarkeningTintAlpha:](self, "setCardStyleDarkeningTintAlpha:", 0.2);
    -[SBHPeopleWidgetPersonDetailInteractionSettings setFullScreenHomeScreenScale:](self, "setFullScreenHomeScreenScale:", 0.9);
    -[SBHPeopleWidgetPersonDetailInteractionSettings setFullScreenHomeScreenAlpha:](self, "setFullScreenHomeScreenAlpha:", 0.4);
    -[SBHPeopleWidgetPersonDetailInteractionSettings setFullScreenDarkeningTintAlpha:](self, "setFullScreenDarkeningTintAlpha:", 0.6);
    -[SBHPeopleWidgetPersonDetailInteractionSettings zoomAnimationSettings](self, "zoomAnimationSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDefaultValues");

    -[SBHPeopleWidgetPersonDetailInteractionSettings zoomAnimationSettings](self, "zoomAnimationSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDampingRatio:", 0.9);

    -[SBHPeopleWidgetPersonDetailInteractionSettings zoomAnimationSettings](self, "zoomAnimationSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setResponse:", 0.5);

    -[SBHPeopleWidgetPersonDetailInteractionSettings fadeOutAnimationSettings](self, "fadeOutAnimationSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDefaultValues");

    -[SBHPeopleWidgetPersonDetailInteractionSettings fadeOutAnimationSettings](self, "fadeOutAnimationSettings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDampingRatio:", 1.0);

    -[SBHPeopleWidgetPersonDetailInteractionSettings fadeOutAnimationSettings](self, "fadeOutAnimationSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setResponse:", 0.2);
    v13 = 0.1;
  }

  -[SBHPeopleWidgetPersonDetailInteractionSettings setPercentMargin:](self, "setPercentMargin:", v13);
  -[SBHPeopleWidgetPersonDetailInteractionSettings setFractionBetweenSourceAndContainerX:](self, "setFractionBetweenSourceAndContainerX:", 0.0);
  -[SBHPeopleWidgetPersonDetailInteractionSettings setFractionBetweenSourceAndContainerY:](self, "setFractionBetweenSourceAndContainerY:", 0.5);
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
  _QWORD v57[2];
  void *v58;
  _QWORD v59[18];

  v59[16] = *MEMORY[0x1E0C80C00];
  v42 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Card Style"), CFSTR("usesCardStyle"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v56;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Card Width"), CFSTR("cardWidth"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "between:and:", 1.0, 3000.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "precision:", 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v53;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Card Height (Portrait)"), CFSTR("cardHeightPortrait"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "between:and:", 1.0, 3000.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "precision:", 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v50;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Card Height (Landscape)"), CFSTR("cardHeightLandscape"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "between:and:", 1.0, 3000.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "precision:", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v47;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Card Corner Radius"), CFSTR("cardCornerRadius"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "between:and:", 1.0, 100.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "precision:", 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v59[4] = v44;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Card Home Screen Scale"), CFSTR("cardStyleHomeScreenScale"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "between:and:", 0.0, 1.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "precision:", 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v59[5] = v39;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Card Home Screen Alpha"), CFSTR("cardStyleHomeScreenAlpha"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "between:and:", 0.0, 1.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "precision:", 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v59[6] = v36;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Card Darkening Tint Alpha"), CFSTR("cardStyleDarkeningTintAlpha"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "between:and:", 0.0, 1.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "precision:", 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v59[7] = v33;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Scale"), CFSTR("fullScreenHomeScreenScale"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "between:and:", 0.0, 1.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "precision:", 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v59[8] = v30;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Home Screen Alpha"), CFSTR("fullScreenHomeScreenAlpha"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "between:and:", 0.0, 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "precision:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v59[9] = v27;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Darkening Tint Alpha"), CFSTR("fullScreenDarkeningTintAlpha"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "between:and:", 0.0, 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "precision:", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v59[10] = v24;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoom Animation Settings"), CFSTR("zoomAnimationSettings"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v59[11] = v23;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Fade Out Animation Settings"), CFSTR("fadeOutAnimationSettings"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v59[12] = v22;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Margin Percentage"), CFSTR("percentMargin"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "between:and:", 0.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "precision:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v59[13] = v4;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Center Fraction X"), CFSTR("fractionBetweenSourceAndContainerX"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "between:and:", 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "precision:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v59[14] = v7;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Center Fraction Y"), CFSTR("fractionBetweenSourceAndContainerY"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "between:and:", 0.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "precision:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v59[15] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "sectionWithRows:", v11);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:action:", CFSTR("Restore Defaults"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83078];
  v58 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sectionWithRows:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83078];
  v57[0] = v43;
  v57[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "moduleWithTitle:contents:", CFSTR("Person Detail Interaction"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)usesCardStyle
{
  return self->_usesCardStyle;
}

- (void)setUsesCardStyle:(BOOL)a3
{
  self->_usesCardStyle = a3;
}

- (double)cardWidth
{
  return self->_cardWidth;
}

- (void)setCardWidth:(double)a3
{
  self->_cardWidth = a3;
}

- (double)cardHeightPortrait
{
  return self->_cardHeightPortrait;
}

- (void)setCardHeightPortrait:(double)a3
{
  self->_cardHeightPortrait = a3;
}

- (double)cardHeightLandscape
{
  return self->_cardHeightLandscape;
}

- (void)setCardHeightLandscape:(double)a3
{
  self->_cardHeightLandscape = a3;
}

- (double)cardCornerRadius
{
  return self->_cardCornerRadius;
}

- (void)setCardCornerRadius:(double)a3
{
  self->_cardCornerRadius = a3;
}

- (double)cardStyleHomeScreenScale
{
  return self->_cardStyleHomeScreenScale;
}

- (void)setCardStyleHomeScreenScale:(double)a3
{
  self->_cardStyleHomeScreenScale = a3;
}

- (double)cardStyleHomeScreenAlpha
{
  return self->_cardStyleHomeScreenAlpha;
}

- (void)setCardStyleHomeScreenAlpha:(double)a3
{
  self->_cardStyleHomeScreenAlpha = a3;
}

- (double)cardStyleDarkeningTintAlpha
{
  return self->_cardStyleDarkeningTintAlpha;
}

- (void)setCardStyleDarkeningTintAlpha:(double)a3
{
  self->_cardStyleDarkeningTintAlpha = a3;
}

- (double)fullScreenHomeScreenScale
{
  return self->_fullScreenHomeScreenScale;
}

- (void)setFullScreenHomeScreenScale:(double)a3
{
  self->_fullScreenHomeScreenScale = a3;
}

- (double)fullScreenHomeScreenAlpha
{
  return self->_fullScreenHomeScreenAlpha;
}

- (void)setFullScreenHomeScreenAlpha:(double)a3
{
  self->_fullScreenHomeScreenAlpha = a3;
}

- (double)fullScreenDarkeningTintAlpha
{
  return self->_fullScreenDarkeningTintAlpha;
}

- (void)setFullScreenDarkeningTintAlpha:(double)a3
{
  self->_fullScreenDarkeningTintAlpha = a3;
}

- (SBFFluidBehaviorSettings)zoomAnimationSettings
{
  return self->_zoomAnimationSettings;
}

- (void)setZoomAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomAnimationSettings, a3);
}

- (SBFFluidBehaviorSettings)fadeOutAnimationSettings
{
  return self->_fadeOutAnimationSettings;
}

- (void)setFadeOutAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_fadeOutAnimationSettings, a3);
}

- (double)percentMargin
{
  return self->_percentMargin;
}

- (void)setPercentMargin:(double)a3
{
  self->_percentMargin = a3;
}

- (double)fractionBetweenSourceAndContainerX
{
  return self->_fractionBetweenSourceAndContainerX;
}

- (void)setFractionBetweenSourceAndContainerX:(double)a3
{
  self->_fractionBetweenSourceAndContainerX = a3;
}

- (double)fractionBetweenSourceAndContainerY
{
  return self->_fractionBetweenSourceAndContainerY;
}

- (void)setFractionBetweenSourceAndContainerY:(double)a3
{
  self->_fractionBetweenSourceAndContainerY = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeOutAnimationSettings, 0);
  objc_storeStrong((id *)&self->_zoomAnimationSettings, 0);
}

@end
