@implementation SBSwitcherChamoisLayoutAttributes

- (double)stageInterItemSpacing
{
  return self->_stageInterItemSpacing;
}

- (double)partiallyOccludedStageScaleForItemWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;

  height = a3.height;
  width = a3.width;
  -[SBSwitcherChamoisLayoutAttributes settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "stageOccludedAppScaleFactor");
    v9 = v8;
  }
  else
  {
    v9 = 1.0;
  }
  if (width == self->_containerBounds.size.width && height == self->_containerBounds.size.height)
  {
    -[SBSwitcherChamoisLayoutAttributes stageStatusBarClearingAppScale](self, "stageStatusBarClearingAppScale");
    v12 = v13;
  }
  else
  {
    -[SBSwitcherChamoisLayoutAttributes stageOccludedAppScale](self, "stageOccludedAppScale");
    v12 = v9 * v11;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  SBSwitcherChamoisLayoutAttributes *v4;
  SBSwitcherChamoisLayoutAttributes *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  _BOOL4 requiresFullScreen;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  unint64_t numberOfRowsWhileInApp;
  _BOOL4 prefersStripHidden;
  _BOOL4 prefersDockHidden;
  _BOOL4 usesStripAreaForOverlapping;
  void *v20;
  void *v21;
  char v22;
  CGRect v24;

  v4 = (SBSwitcherChamoisLayoutAttributes *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SBSwitcherChamoisLayoutAttributes containerBounds](v5, "containerBounds");
      v24.origin.x = v6;
      v24.origin.y = v7;
      v24.size.width = v8;
      v24.size.height = v9;
      if (CGRectEqualToRect(self->_containerBounds, v24))
      {
        requiresFullScreen = self->_requiresFullScreen;
        if (requiresFullScreen == -[SBSwitcherChamoisLayoutAttributes requiresFullScreen](v5, "requiresFullScreen"))
        {
          -[SBSwitcherChamoisLayoutAttributes defaultWindowSize](v5, "defaultWindowSize");
          v12 = 0;
          if (self->_defaultWindowSize.width != v13)
            goto LABEL_44;
          if (self->_defaultWindowSize.height != v11)
            goto LABEL_44;
          -[SBSwitcherChamoisLayoutAttributes minimumDefaultWindowSize](v5, "minimumDefaultWindowSize");
          v12 = 0;
          if (self->_minimumDefaultWindowSize.width != v15 || self->_minimumDefaultWindowSize.height != v14)
            goto LABEL_44;
          -[SBSwitcherChamoisLayoutAttributes maximumWindowHeightWithDock](v5, "maximumWindowHeightWithDock");
          if (BSFloatEqualToFloat())
          {
            -[SBSwitcherChamoisLayoutAttributes maximumWindowWidthForOverlapping](v5, "maximumWindowWidthForOverlapping");
            if (BSFloatEqualToFloat())
            {
              -[SBSwitcherChamoisLayoutAttributes minimumWindowWidth](v5, "minimumWindowWidth");
              if (BSFloatEqualToFloat())
              {
                -[SBSwitcherChamoisLayoutAttributes containerPerspective](v5, "containerPerspective");
                if (BSFloatEqualToFloat())
                {
                  -[SBSwitcherChamoisLayoutAttributes screenEdgePadding](v5, "screenEdgePadding");
                  if (BSFloatEqualToFloat())
                  {
                    -[SBSwitcherChamoisLayoutAttributes stripWidth](v5, "stripWidth");
                    if (BSFloatEqualToFloat())
                    {
                      -[SBSwitcherChamoisLayoutAttributes stripVerticalEdgeSpacing](v5, "stripVerticalEdgeSpacing");
                      if (BSFloatEqualToFloat())
                      {
                        -[SBSwitcherChamoisLayoutAttributes stripInterItemSpacing](v5, "stripInterItemSpacing");
                        if (BSFloatEqualToFloat())
                        {
                          -[SBSwitcherChamoisLayoutAttributes stripTiltAngle](v5, "stripTiltAngle");
                          if (BSFloatEqualToFloat())
                          {
                            -[SBSwitcherChamoisLayoutAttributes stripIconLength](v5, "stripIconLength");
                            if (BSFloatEqualToFloat())
                            {
                              -[SBSwitcherChamoisLayoutAttributes stripStackDistance](v5, "stripStackDistance");
                              if (BSFloatEqualToFloat())
                              {
                                -[SBSwitcherChamoisLayoutAttributes stripCardScale](v5, "stripCardScale");
                                if (BSFloatEqualToFloat())
                                {
                                  -[SBSwitcherChamoisLayoutAttributes stripCornerRadii](v5, "stripCornerRadii");
                                  if (BSFloatEqualToFloat())
                                  {
                                    -[SBSwitcherChamoisLayoutAttributes stageCornerRadii](v5, "stageCornerRadii");
                                    if (BSFloatEqualToFloat())
                                    {
                                      -[SBSwitcherChamoisLayoutAttributes stageInterItemSpacing](v5, "stageInterItemSpacing");
                                      if (BSFloatEqualToFloat())
                                      {
                                        -[SBSwitcherChamoisLayoutAttributes stageOccludedAppScale](v5, "stageOccludedAppScale");
                                        if (BSFloatEqualToFloat())
                                        {
                                          -[SBSwitcherChamoisLayoutAttributes stageStatusBarClearingAppScale](v5, "stageStatusBarClearingAppScale");
                                          if (BSFloatEqualToFloat())
                                          {
                                            -[SBSwitcherChamoisLayoutAttributes stageOcclusionDodgingPeekLength](v5, "stageOcclusionDodgingPeekLength");
                                            if (BSFloatEqualToFloat())
                                            {
                                              -[SBSwitcherChamoisLayoutAttributes stageOcclusionDodgingPeekScale](v5, "stageOcclusionDodgingPeekScale");
                                              if (BSFloatEqualToFloat())
                                              {
                                                numberOfRowsWhileInApp = self->_numberOfRowsWhileInApp;
                                                if (numberOfRowsWhileInApp == -[SBSwitcherChamoisLayoutAttributes numberOfRowsWhileInApp](v5, "numberOfRowsWhileInApp"))
                                                {
                                                  prefersStripHidden = self->_prefersStripHidden;
                                                  if (prefersStripHidden == -[SBSwitcherChamoisLayoutAttributes prefersStripHidden](v5, "prefersStripHidden"))
                                                  {
                                                    prefersDockHidden = self->_prefersDockHidden;
                                                    if (prefersDockHidden == -[SBSwitcherChamoisLayoutAttributes prefersDockHidden](v5, "prefersDockHidden"))
                                                    {
                                                      usesStripAreaForOverlapping = self->_usesStripAreaForOverlapping;
                                                      if (usesStripAreaForOverlapping == -[SBSwitcherChamoisLayoutAttributes usesStripAreaForOverlapping](v5, "usesStripAreaForOverlapping"))
                                                      {
                                                        -[SBSwitcherChamoisLayoutAttributes gridWidths](v5, "gridWidths");
                                                        v20 = (void *)objc_claimAutoreleasedReturnValue();
                                                        if (BSEqualArrays())
                                                        {
                                                          -[SBSwitcherChamoisLayoutAttributes gridHeights](v5, "gridHeights");
                                                          v21 = (void *)objc_claimAutoreleasedReturnValue();
                                                          if (BSEqualArrays()
                                                            && (-[SBSwitcherChamoisLayoutAttributes switcherHorizontalEdgeSpacing](v5, "switcherHorizontalEdgeSpacing"), BSFloatEqualToFloat())&& (-[SBSwitcherChamoisLayoutAttributes switcherHorizontalInterItemSpacing](v5, "switcherHorizontalInterItemSpacing"), BSFloatEqualToFloat())&& (-[SBSwitcherChamoisLayoutAttributes switcherVerticalEdgeSpacing](v5, "switcherVerticalEdgeSpacing"), BSFloatEqualToFloat())&& (-[SBSwitcherChamoisLayoutAttributes switcherVerticalInterItemSpacing](v5, "switcherVerticalInterItemSpacing"), BSFloatEqualToFloat())&& (-[SBSwitcherChamoisLayoutAttributes switcherHeightForIconAndLabelsUnderEachPile](v5, "switcherHeightForIconAndLabelsUnderEachPile"), BSFloatEqualToFloat())
                                                            && (-[SBSwitcherChamoisLayoutAttributes switcherPileCardMinimumPeekAmount](v5, "switcherPileCardMinimumPeekAmount"), BSFloatEqualToFloat()))
                                                          {
                                                            -[SBSwitcherChamoisLayoutAttributes switcherPileCompactingFactor](v5, "switcherPileCompactingFactor");
                                                            v22 = BSFloatEqualToFloat();
                                                          }
                                                          else
                                                          {
                                                            v22 = 0;
                                                          }

                                                        }
                                                        else
                                                        {
                                                          v22 = 0;
                                                        }

                                                        v12 = v22;
                                                        goto LABEL_44;
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
      v12 = 0;
LABEL_44:

      goto LABEL_45;
    }
    v12 = 0;
  }
LABEL_45:

  return v12;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_defaultWindowSize.width + self->_defaultWindowSize.height * 13.0);
}

- (NSString)description
{
  return (NSString *)-[SBSwitcherChamoisLayoutAttributes descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", &stru_1E8EC7EC0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSwitcherChamoisLayoutAttributes descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherChamoisLayoutAttributes defaultWindowSize](self, "defaultWindowSize");
  v5 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("defaultWindowSize"));
  -[SBSwitcherChamoisLayoutAttributes minimumDefaultWindowSize](self, "minimumDefaultWindowSize");
  v6 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("minimumDefaultWindowSize"));
  -[SBSwitcherChamoisLayoutAttributes gridWidths](self, "gridWidths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("gridWidths"));

  -[SBSwitcherChamoisLayoutAttributes gridHeights](self, "gridHeights");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("gridHeights"));

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSwitcherChamoisLayoutAttributes succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setContainerBounds:", self->_containerBounds.origin.x, self->_containerBounds.origin.y, self->_containerBounds.size.width, self->_containerBounds.size.height);
  objc_msgSend(v4, "setRequiresFullScreen:", self->_requiresFullScreen);
  objc_msgSend(v4, "setDefaultWindowSize:", self->_defaultWindowSize.width, self->_defaultWindowSize.height);
  objc_msgSend(v4, "setMinimumDefaultWindowSize:", self->_minimumDefaultWindowSize.width, self->_minimumDefaultWindowSize.height);
  objc_msgSend(v4, "setMaximumWindowHeightWithDock:", self->_maximumWindowHeightWithDock);
  objc_msgSend(v4, "setMaximumWindowWidthForOverlapping:", self->_maximumWindowWidthForOverlapping);
  objc_msgSend(v4, "setMinimumWindowWidth:", self->_minimumWindowWidth);
  objc_msgSend(v4, "setContainerPerspective:", self->_containerPerspective);
  objc_msgSend(v4, "setScreenEdgePadding:", self->_screenEdgePadding);
  objc_msgSend(v4, "setStripWidth:", self->_stripWidth);
  objc_msgSend(v4, "setStripVerticalEdgeSpacing:", self->_stripVerticalEdgeSpacing);
  objc_msgSend(v4, "setStripInterItemSpacing:", self->_stripInterItemSpacing);
  objc_msgSend(v4, "setStripTiltAngle:", self->_stripTiltAngle);
  objc_msgSend(v4, "setStripIconLength:", self->_stripIconLength);
  objc_msgSend(v4, "setStripStackDistance:", self->_stripStackDistance);
  objc_msgSend(v4, "setStripCardScale:", self->_stripCardScale);
  objc_msgSend(v4, "setStripCornerRadii:", self->_stripCornerRadii);
  objc_msgSend(v4, "setStageCornerRadii:", self->_stageCornerRadii);
  objc_msgSend(v4, "setStageInterItemSpacing:", self->_stageInterItemSpacing);
  objc_msgSend(v4, "setStageOccludedAppScale:", self->_stageOccludedAppScale);
  objc_msgSend(v4, "setStageStatusBarClearingAppScale:", self->_stageStatusBarClearingAppScale);
  objc_msgSend(v4, "setStageOcclusionDodgingPeekLength:", self->_stageOcclusionDodgingPeekLength);
  objc_msgSend(v4, "setStageOcclusionDodgingPeekScale:", self->_stageOcclusionDodgingPeekScale);
  objc_msgSend(v4, "setNumberOfRowsWhileInApp:", self->_numberOfRowsWhileInApp);
  objc_msgSend(v4, "setPrefersStripHidden:", self->_prefersStripHidden);
  objc_msgSend(v4, "setPrefersDockHidden:", self->_prefersDockHidden);
  objc_msgSend(v4, "setUsesStripAreaForOverlapping:", self->_usesStripAreaForOverlapping);
  objc_msgSend(v4, "setGridWidths:", self->_gridWidths);
  objc_msgSend(v4, "setGridHeights:", self->_gridHeights);
  objc_msgSend(v4, "setSwitcherHorizontalEdgeSpacing:", self->_switcherHorizontalEdgeSpacing);
  objc_msgSend(v4, "setSwitcherHorizontalInterItemSpacing:", self->_switcherHorizontalInterItemSpacing);
  objc_msgSend(v4, "setSwitcherVerticalEdgeSpacing:", self->_switcherVerticalEdgeSpacing);
  objc_msgSend(v4, "setSwitcherVerticalInterItemSpacing:", self->_switcherVerticalInterItemSpacing);
  objc_msgSend(v4, "setSwitcherHeightForIconAndLabelsUnderEachPile:", self->_switcherHeightForIconAndLabelsUnderEachPile);
  objc_msgSend(v4, "setSwitcherPileCardMinimumPeekAmount:", self->_switcherPileCardMinimumPeekAmount);
  objc_msgSend(v4, "setSwitcherPileCompactingFactor:", self->_switcherPileCompactingFactor);
  return v4;
}

- (BOOL)requiresFullScreen
{
  return self->_requiresFullScreen;
}

- (void)setRequiresFullScreen:(BOOL)a3
{
  self->_requiresFullScreen = a3;
}

- (CGSize)defaultWindowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultWindowSize.width;
  height = self->_defaultWindowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDefaultWindowSize:(CGSize)a3
{
  self->_defaultWindowSize = a3;
}

- (CGSize)minimumDefaultWindowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumDefaultWindowSize.width;
  height = self->_minimumDefaultWindowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinimumDefaultWindowSize:(CGSize)a3
{
  self->_minimumDefaultWindowSize = a3;
}

- (double)maximumWindowHeightWithDock
{
  return self->_maximumWindowHeightWithDock;
}

- (void)setMaximumWindowHeightWithDock:(double)a3
{
  self->_maximumWindowHeightWithDock = a3;
}

- (double)maximumWindowWidthForOverlapping
{
  return self->_maximumWindowWidthForOverlapping;
}

- (void)setMaximumWindowWidthForOverlapping:(double)a3
{
  self->_maximumWindowWidthForOverlapping = a3;
}

- (double)minimumWindowWidth
{
  return self->_minimumWindowWidth;
}

- (void)setMinimumWindowWidth:(double)a3
{
  self->_minimumWindowWidth = a3;
}

- (double)containerPerspective
{
  return self->_containerPerspective;
}

- (void)setContainerPerspective:(double)a3
{
  self->_containerPerspective = a3;
}

- (double)screenEdgePadding
{
  return self->_screenEdgePadding;
}

- (void)setScreenEdgePadding:(double)a3
{
  self->_screenEdgePadding = a3;
}

- (SBSwitcherChamoisSnapPaddingSettings)snapPaddingSettings
{
  return self->_snapPaddingSettings;
}

- (void)setSnapPaddingSettings:(id)a3
{
  self->_snapPaddingSettings = (SBSwitcherChamoisSnapPaddingSettings *)a3;
}

- (double)stripWidth
{
  return self->_stripWidth;
}

- (void)setStripWidth:(double)a3
{
  self->_stripWidth = a3;
}

- (double)stripVerticalEdgeSpacing
{
  return self->_stripVerticalEdgeSpacing;
}

- (void)setStripVerticalEdgeSpacing:(double)a3
{
  self->_stripVerticalEdgeSpacing = a3;
}

- (double)stripInterItemSpacing
{
  return self->_stripInterItemSpacing;
}

- (void)setStripInterItemSpacing:(double)a3
{
  self->_stripInterItemSpacing = a3;
}

- (double)stripTiltAngle
{
  return self->_stripTiltAngle;
}

- (void)setStripTiltAngle:(double)a3
{
  self->_stripTiltAngle = a3;
}

- (double)stripIconLength
{
  return self->_stripIconLength;
}

- (void)setStripIconLength:(double)a3
{
  self->_stripIconLength = a3;
}

- (double)stripStackDistance
{
  return self->_stripStackDistance;
}

- (void)setStripStackDistance:(double)a3
{
  self->_stripStackDistance = a3;
}

- (double)stripCardScale
{
  return self->_stripCardScale;
}

- (void)setStripCardScale:(double)a3
{
  self->_stripCardScale = a3;
}

- (double)stripCornerRadii
{
  return self->_stripCornerRadii;
}

- (void)setStripCornerRadii:(double)a3
{
  self->_stripCornerRadii = a3;
}

- (double)stageCornerRadii
{
  return self->_stageCornerRadii;
}

- (void)setStageCornerRadii:(double)a3
{
  self->_stageCornerRadii = a3;
}

- (void)setStageInterItemSpacing:(double)a3
{
  self->_stageInterItemSpacing = a3;
}

- (double)stageOccludedAppScale
{
  return self->_stageOccludedAppScale;
}

- (void)setStageOccludedAppScale:(double)a3
{
  self->_stageOccludedAppScale = a3;
}

- (double)stageStatusBarClearingAppScale
{
  return self->_stageStatusBarClearingAppScale;
}

- (void)setStageStatusBarClearingAppScale:(double)a3
{
  self->_stageStatusBarClearingAppScale = a3;
}

- (double)stageOcclusionDodgingPeekLength
{
  return self->_stageOcclusionDodgingPeekLength;
}

- (void)setStageOcclusionDodgingPeekLength:(double)a3
{
  self->_stageOcclusionDodgingPeekLength = a3;
}

- (double)stageOcclusionDodgingPeekScale
{
  return self->_stageOcclusionDodgingPeekScale;
}

- (void)setStageOcclusionDodgingPeekScale:(double)a3
{
  self->_stageOcclusionDodgingPeekScale = a3;
}

- (unint64_t)numberOfRowsWhileInApp
{
  return self->_numberOfRowsWhileInApp;
}

- (void)setNumberOfRowsWhileInApp:(unint64_t)a3
{
  self->_numberOfRowsWhileInApp = a3;
}

- (BOOL)prefersStripHidden
{
  return self->_prefersStripHidden;
}

- (void)setPrefersStripHidden:(BOOL)a3
{
  self->_prefersStripHidden = a3;
}

- (BOOL)prefersDockHidden
{
  return self->_prefersDockHidden;
}

- (void)setPrefersDockHidden:(BOOL)a3
{
  self->_prefersDockHidden = a3;
}

- (BOOL)usesStripAreaForOverlapping
{
  return self->_usesStripAreaForOverlapping;
}

- (void)setUsesStripAreaForOverlapping:(BOOL)a3
{
  self->_usesStripAreaForOverlapping = a3;
}

- (NSArray)gridWidths
{
  return self->_gridWidths;
}

- (void)setGridWidths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSArray)gridHeights
{
  return self->_gridHeights;
}

- (void)setGridHeights:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (double)switcherHorizontalEdgeSpacing
{
  return self->_switcherHorizontalEdgeSpacing;
}

- (void)setSwitcherHorizontalEdgeSpacing:(double)a3
{
  self->_switcherHorizontalEdgeSpacing = a3;
}

- (double)switcherHorizontalInterItemSpacing
{
  return self->_switcherHorizontalInterItemSpacing;
}

- (void)setSwitcherHorizontalInterItemSpacing:(double)a3
{
  self->_switcherHorizontalInterItemSpacing = a3;
}

- (double)switcherVerticalEdgeSpacing
{
  return self->_switcherVerticalEdgeSpacing;
}

- (void)setSwitcherVerticalEdgeSpacing:(double)a3
{
  self->_switcherVerticalEdgeSpacing = a3;
}

- (double)switcherVerticalInterItemSpacing
{
  return self->_switcherVerticalInterItemSpacing;
}

- (void)setSwitcherVerticalInterItemSpacing:(double)a3
{
  self->_switcherVerticalInterItemSpacing = a3;
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

- (CGRect)containerBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_containerBounds.origin.x;
  y = self->_containerBounds.origin.y;
  width = self->_containerBounds.size.width;
  height = self->_containerBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContainerBounds:(CGRect)a3
{
  self->_containerBounds = a3;
}

- (SBSwitcherChamoisSettings)settings
{
  return (SBSwitcherChamoisSettings *)objc_loadWeakRetained((id *)&self->_settings);
}

- (void)setSettings:(id)a3
{
  objc_storeWeak((id *)&self->_settings, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settings);
  objc_storeStrong((id *)&self->_gridHeights, 0);
  objc_storeStrong((id *)&self->_gridWidths, 0);
}

@end
