@implementation PXStoryClipLayout

- (PXStoryClipLayout)init
{
  PXStoryClipLayout *v2;
  PXStoryClipLayout *v3;
  CGPoint *v4;
  CGSize v5;
  CGSize v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CGSize v12;
  CGSize v13;
  CGSize v14;
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PXStoryClipLayout;
  v2 = -[PXGLayout init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_contentAlpha = 1.0;
    v4 = (CGPoint *)MEMORY[0x1E0C9D628];
    v5 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v2->_contentBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v2->_contentBounds.size = v5;
    v2->_useContentBoundsForContentEdgeInsets = 1;
    *(_OWORD *)&v2->_contentEdgeInsets.top.preRotationInset = PXStoryTiltedEdgeInsetsNull;
    *(_OWORD *)&v2->_contentEdgeInsets.top.postRotationInset = unk_1A7C0A488;
    *(_OWORD *)&v2->_contentEdgeInsets.bottom.postRotationInset = xmmword_1A7C0A4B8;
    *(_OWORD *)&v2->_contentEdgeInsets.right.rotationAngle = unk_1A7C0A4C8;
    *(_OWORD *)&v2->_contentEdgeInsets.left.rotationAngle = xmmword_1A7C0A498;
    *(_OWORD *)&v2->_contentEdgeInsets.bottom.preRotationInset = unk_1A7C0A4A8;
    v2->_manualContentsRectAmount = 0.0;
    v6 = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
    v2->_manualContentsRect.origin = *(CGPoint *)off_1E50B86D0;
    v2->_manualContentsRect.size = v6;
    v7 = MEMORY[0x1E0C9BAA8];
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v2->_contentsRectTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v2->_contentsRectTransform.c = v8;
    *(_OWORD *)&v2->_contentsRectTransform.tx = *(_OWORD *)(v7 + 32);
    v2->_contentScale = 1.0;
    v9 = *(_OWORD *)off_1E50B88F0;
    v10 = *((_OWORD *)off_1E50B88F0 + 1);
    *(_OWORD *)&v2->_contentsRectOverride.t.a = *(_OWORD *)off_1E50B88F0;
    *(_OWORD *)&v2->_contentsRectOverride.t.c = v10;
    v11 = *((_OWORD *)off_1E50B88F0 + 2);
    *(_OWORD *)&v2->_contentsRectOverride.t.tx = v11;
    v12 = (CGSize)v4[1];
    v2->_contentSpriteNormalizedFrameOverride.origin = *v4;
    v2->_contentSpriteNormalizedFrameOverride.size = v12;
    *(_OWORD *)&v2->_presentedKenBurnsAnimationCurrentRect.t.a = v9;
    *(_OWORD *)&v2->_presentedKenBurnsAnimationCurrentRect.t.c = v10;
    *(_OWORD *)&v2->_presentedKenBurnsAnimationCurrentRect.t.tx = v11;
    v2->_canShowColorNormalizedContent = 1;
    v2->_canShowTextLegibilityEffect = 1;
    v13 = (CGSize)v4[1];
    v2->_primaryDividerBounds.origin = *v4;
    v2->_primaryDividerBounds.size = v13;
    v14 = (CGSize)v4[1];
    v2->_secondaryDividerBounds.origin = *v4;
    v2->_secondaryDividerBounds.size = v14;
    v2->_offsetFromCurrentSegment = 0x7FFFFFFFFFFFFFFFLL;
    *(_OWORD *)&v2->_autoplayTimeRange.start.value = 0u;
    *(_OWORD *)&v2->_autoplayTimeRange.start.epoch = 0u;
    *(_OWORD *)&v2->_autoplayTimeRange.duration.timescale = 0u;
    v2->_contentSpriteIndex = 0;
    v2->_primaryDividerSpriteIndex = 1;
    v2->_secondaryDividerSpriteIndex = 2;
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isHUDEnabled");

    if (v16)
      v17 = 3;
    else
      v17 = -1;
    if (v16)
      v18 = 4;
    else
      v18 = 3;
    v3->_diagnosticHUDSpriteIndex = v17;
    -[PXGLayout addSpriteCount:withInitialState:](v3, "addSpriteCount:withInitialState:", v18, 0);
    -[PXStoryClipLayout _invalidateContent](v3, "_invalidateContent");
    -[PXGLayout setContentSource:](v3, "setContentSource:", v3);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_HUDTimer, "invalidate");
  -[NSProgress cancel](self->_textFrameProgress, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipLayout;
  -[PXGLayout dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; clipIdentifier:%ld>"),
    v5,
    self,
    -[PXStoryClip identifier](self->_clip, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (PXStoryAnimationController)animationController
{
  void *v2;
  void *v3;

  -[PXStoryClipLayout model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXStoryAnimationController *)v3;
}

- (void)setClip:(id)a3
{
  PXStoryClip *v5;
  PXStoryClip **p_clip;
  PXStoryClip *clip;
  PXStoryClip *v8;
  unsigned int v9;
  int v10;
  _DWORD v11[192];
  _BYTE v12[32];
  uint64_t v13;

  v5 = (PXStoryClip *)a3;
  p_clip = &self->_clip;
  clip = self->_clip;
  if (clip != v5)
  {
    v8 = clip;
    objc_storeStrong((id *)&self->_clip, a3);
    if ((-[PXStoryClip isVisuallyEqualToClip:](*p_clip, "isVisuallyEqualToClip:", v8) & 1) == 0)
    {
      -[PXStoryClipLayout _invalidateResource](self, "_invalidateResource");
      -[PXStoryClipLayout _invalidateAssetPresentationStyles](self, "_invalidateAssetPresentationStyles");
      -[PXStoryClipLayout _invalidateAnimations](self, "_invalidateAnimations");
      -[PXStoryClipLayout _invalidateHUD](self, "_invalidateHUD");
      -[PXStoryClipLayout _invalidateColorGradeKind](self, "_invalidateColorGradeKind");
      -[PXStoryClipLayout _invalidateColorNormalizationEffect](self, "_invalidateColorNormalizationEffect");
      -[PXStoryClipLayout _invalidateTextLegibilityEffect](self, "_invalidateTextLegibilityEffect");
      -[PXStoryClipLayout _invalidateSmartGradientAdjustment](self, "_invalidateSmartGradientAdjustment");
      -[PXStoryClipLayout _updateInactiveImageAdjustment](self, "_updateInactiveImageAdjustment");
      if (v8)
      {
        -[PXStoryClip info](v8, "info");
        v9 = v13;
      }
      else
      {
        bzero(v12, 0x300uLL);
        v9 = 0;
      }
      if (*p_clip)
      {
        -[PXStoryClip info](*p_clip, "info");
        v10 = v11[8];
      }
      else
      {
        bzero(v11, 0x300uLL);
        v10 = 0;
      }
      if (((v10 ^ v9) & 0xDLL) != 0)
        -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
    }

  }
}

- (void)setModel:(id)a3
{
  PXStoryModel *v5;
  PXStoryModel **p_model;
  PXStoryModel *model;
  BOOL v8;
  PXStoryModel *v9;

  v5 = (PXStoryModel *)a3;
  p_model = &self->_model;
  model = self->_model;
  if (model != v5)
  {
    v9 = v5;
    -[PXStoryModel unregisterChangeObserver:context:](model, "unregisterChangeObserver:context:", self, ModelObservationContext);
    objc_storeStrong((id *)&self->_model, a3);
    -[PXStoryModel registerChangeObserver:context:](*p_model, "registerChangeObserver:context:", self, ModelObservationContext);
    v8 = -[PXStoryModel viewMode](*p_model, "viewMode") == 3
      && (-[PXStoryModel thumbnailStyle](*p_model, "thumbnailStyle") == 1
       || -[PXStoryModel thumbnailStyle](*p_model, "thumbnailStyle") == 5);
    self->_isFeedThumbnail = v8;
    -[PXStoryClipLayout _invalidateColorGradeKind](self, "_invalidateColorGradeKind");
    -[PXStoryClipLayout _invalidateVideoPresentationController](self, "_invalidateVideoPresentationController");
    -[PXStoryClipLayout _invalidateVideoPresentationControllerState](self, "_invalidateVideoPresentationControllerState");
    -[PXStoryClipLayout _invalidateSegmentIdentifiers](self, "_invalidateSegmentIdentifiers");
    -[PXStoryClipLayout _invalidateIsSegmentVisible](self, "_invalidateIsSegmentVisible");
    -[PXStoryClipLayout _invalidateWantsHUD](self, "_invalidateWantsHUD");
    -[PXStoryClipLayout _invalidateHUD](self, "_invalidateHUD");
    -[PXStoryClipLayout _invalidateShouldAutoplay](self, "_invalidateShouldAutoplay");
    v5 = v9;
  }

}

- (void)setOverrideStyleInfo:(id)a3
{
  PXStoryStyleDescriptor *v5;
  char v6;
  PXStoryStyleDescriptor *v7;

  v7 = (PXStoryStyleDescriptor *)a3;
  v5 = self->_overrideStyleInfo;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryStyleDescriptor isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_overrideStyleInfo, a3);
      -[PXStoryClipLayout _invalidateColorGradeKind](self, "_invalidateColorGradeKind");
    }
  }

}

- (void)setClipTimeRange:(id *)a3
{
  $EB79B37EDD75B660E5EC336E3C45010D *p_clipTimeRange;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CMTimeRange v10;
  CMTimeRange range1;

  p_clipTimeRange = &self->_clipTimeRange;
  v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range1.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range1.start.epoch = v6;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v7 = *(_OWORD *)&self->_clipTimeRange.start.epoch;
  *(_OWORD *)&v10.start.value = *(_OWORD *)&self->_clipTimeRange.start.value;
  *(_OWORD *)&v10.start.epoch = v7;
  *(_OWORD *)&v10.duration.timescale = *(_OWORD *)&self->_clipTimeRange.duration.timescale;
  if (!CMTimeRangeEqual(&range1, &v10))
  {
    v8 = *(_OWORD *)&a3->var0.var0;
    v9 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&p_clipTimeRange->start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&p_clipTimeRange->duration.timescale = v9;
    *(_OWORD *)&p_clipTimeRange->start.value = v8;
    -[PXStoryClipLayout _invalidatePlayheadState](self, "_invalidatePlayheadState");
    -[PXStoryClipLayout _invalidateVideoPresentationControllerState](self, "_invalidateVideoPresentationControllerState");
    -[PXStoryClipLayout _invalidateSegmentIdentifiers](self, "_invalidateSegmentIdentifiers");
  }
}

- (void)setClippingInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_clippingInsets;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_clippingInsets = &self->_clippingInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_clippingInsets->top = top;
    p_clippingInsets->left = left;
    p_clippingInsets->bottom = bottom;
    p_clippingInsets->right = right;
    -[PXStoryClipLayout _invalidateEdgeMaskEffects](self, "_invalidateEdgeMaskEffects");
  }
}

- (void)setCanShowDynamicContent:(BOOL)a3
{
  if (self->_canShowDynamicContent != a3)
  {
    self->_canShowDynamicContent = a3;
    -[PXStoryClipLayout _invalidateAssetPresentationStyles](self, "_invalidateAssetPresentationStyles");
    -[PXStoryClipLayout _invalidateAnimations](self, "_invalidateAnimations");
  }
}

- (void)setCanShowColorNormalizedContent:(BOOL)a3
{
  if (self->_canShowColorNormalizedContent != a3)
  {
    self->_canShowColorNormalizedContent = a3;
    -[PXStoryClipLayout _invalidateColorNormalizationEffect](self, "_invalidateColorNormalizationEffect");
  }
}

- (void)setCanShowTextLegibilityEffect:(BOOL)a3
{
  if (self->_canShowTextLegibilityEffect != a3)
  {
    self->_canShowTextLegibilityEffect = a3;
    -[PXStoryClipLayout _invalidateTextLegibilityEffect](self, "_invalidateTextLegibilityEffect");
  }
}

- (void)setCanShowHUD:(BOOL)a3
{
  if (self->_canShowHUD != a3)
  {
    self->_canShowHUD = a3;
    -[PXStoryClipLayout _invalidateWantsHUD](self, "_invalidateWantsHUD");
  }
}

- (void)setCanAspectFitContent:(BOOL)a3
{
  if (self->_canAspectFitContent != a3)
  {
    self->_canAspectFitContent = a3;
    -[PXStoryClipLayout _invalidateContentMode](self, "_invalidateContentMode");
  }
}

- (void)setCornerRadius:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;

  if (v3 != self->_cornerRadius.var0.var0.topLeft
    || v4 != self->_cornerRadius.var0.var0.topRight
    || v5 != self->_cornerRadius.var0.var0.bottomLeft
    || v6 != self->_cornerRadius.var0.var0.bottomRight)
  {
    self->_cornerRadius.var0.var0.topLeft = v3;
    self->_cornerRadius.var0.var0.topRight = v4;
    self->_cornerRadius.var0.var0.bottomLeft = v5;
    self->_cornerRadius.var0.var0.bottomRight = v6;
    -[PXStoryClipLayout _invalidateContentStyle](self, "_invalidateContentStyle", *(_QWORD *)&a3.var0.var0.var0, *(_QWORD *)&a3.var0.var1[2]);
  }
}

- (void)setManualContentsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_manualContentsRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_manualContentsRect = &self->_manualContentsRect;
  if (!CGRectEqualToRect(self->_manualContentsRect, a3))
  {
    p_manualContentsRect->origin.x = x;
    p_manualContentsRect->origin.y = y;
    p_manualContentsRect->size.width = width;
    p_manualContentsRect->size.height = height;
    -[PXStoryClipLayout _invalidateEdgeMaskEffects](self, "_invalidateEdgeMaskEffects");
    -[PXStoryClipLayout _invalidateContentStyle](self, "_invalidateContentStyle");
  }
}

- (void)setManualContentsRectAmount:(double)a3
{
  if (self->_manualContentsRectAmount != a3)
  {
    self->_manualContentsRectAmount = a3;
    -[PXStoryClipLayout _invalidateEdgeMaskEffects](self, "_invalidateEdgeMaskEffects");
    -[PXStoryClipLayout _invalidateContentStyle](self, "_invalidateContentStyle");
  }
}

- (void)setContentAlpha:(float)a3
{
  _QWORD v5[5];
  float v6;

  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __37__PXStoryClipLayout_setContentAlpha___block_invoke;
    v5[3] = &unk_1E5144680;
    v5[4] = self;
    v6 = a3;
    -[PXGLayout performChangesWithLocalUpdate:](self, "performChangesWithLocalUpdate:", v5);
  }
}

- (void)setResource:(id)a3
{
  PXStoryResource **p_resource;
  PXStoryResource *v6;
  char v7;
  PXStoryResource *v8;
  void *v9;
  PXStoryResource *v10;

  v10 = (PXStoryResource *)a3;
  p_resource = &self->_resource;
  v6 = self->_resource;
  if (v6 == v10)
  {

LABEL_7:
    v8 = v10;
    goto LABEL_8;
  }
  v7 = -[PXStoryResource isEqual:](v10, "isEqual:", v6);

  v8 = v10;
  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_resource, a3);
    self->_resourceKind = -[PXStoryResource px_storyResourceKind](*p_resource, "px_storyResourceKind");
    -[PXStoryClipLayout _invalidateInactiveImageFilterAdjustment](self, "_invalidateInactiveImageFilterAdjustment");
    -[PXStoryClipLayout _invalidateDisplayAsset](self, "_invalidateDisplayAsset");
    -[PXStoryClipLayout _invalidateAssetPresentationStyles](self, "_invalidateAssetPresentationStyles");
    -[PXStoryClipLayout _invalidateVideoPresentationController](self, "_invalidateVideoPresentationController");
    -[PXStoryClipLayout _invalidateContentVersion](self, "_invalidateContentVersion");
    -[PXStoryClipLayout _invalidateWantsHUD](self, "_invalidateWantsHUD");
    if (self->_resourceKind == 3)
    {
      -[PXStoryResource px_storyResourceTextResourceInfo](*p_resource, "px_storyResourceTextResourceInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryClipLayout setCurrentTextResourceInfo:](self, "setCurrentTextResourceInfo:", v9);

    }
    else
    {
      -[PXStoryClipLayout setCurrentTextResourceInfo:](self, "setCurrentTextResourceInfo:", 0);
    }
    goto LABEL_7;
  }
LABEL_8:

}

- (void)setColorGradeKind:(int64_t)a3
{
  if (self->_colorGradeKind != a3)
  {
    self->_colorGradeKind = a3;
    -[PXStoryClipLayout _invalidateColorGradingEffect](self, "_invalidateColorGradingEffect");
  }
}

- (void)setCustomColorGradeKind:(int64_t)a3
{
  if (self->_customColorGradeKind != a3)
  {
    self->_customColorGradeKind = a3;
    -[PXStoryClipLayout _invalidateColorGradingEffect](self, "_invalidateColorGradingEffect");
    -[PXStoryClipLayout _invalidateColorNormalizationEffect](self, "_invalidateColorNormalizationEffect");
  }
}

- (void)setColorGradingEffect:(id)a3
{
  PXGColorGradingEffect *v5;
  BOOL v6;
  PXGColorGradingEffect *v7;

  v7 = (PXGColorGradingEffect *)a3;
  v5 = self->_colorGradingEffect;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXGColorGradingEffect isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_colorGradingEffect, a3);
      -[PXStoryClipLayout _invalidateCombinedEffect](self, "_invalidateCombinedEffect");
      -[PXStoryClipLayout _invalidateColorNormalizationEffect](self, "_invalidateColorNormalizationEffect");
    }
  }

}

- (void)setColorNormalizationEffect:(id)a3
{
  PXStoryColorNormalizationEffect *v5;
  BOOL v6;
  PXStoryColorNormalizationEffect *v7;

  v7 = (PXStoryColorNormalizationEffect *)a3;
  v5 = self->_colorNormalizationEffect;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXGColorGradingEffect isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_colorNormalizationEffect, a3);
      -[PXStoryClipLayout _invalidateCombinedEffect](self, "_invalidateCombinedEffect");
    }
  }

}

- (void)setTextLegibilityEffect:(id)a3
{
  PXGTextLegibilityEffect *v5;
  char v6;
  PXGTextLegibilityEffect *v7;

  v7 = (PXGTextLegibilityEffect *)a3;
  v5 = self->_textLegibilityEffect;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXGTextLegibilityEffect isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_textLegibilityEffect, a3);
      -[PXStoryClipLayout _invalidateCombinedEffect](self, "_invalidateCombinedEffect");
    }
  }

}

- (void)setTopEdgeMaskEffect:(id)a3
{
  PXGRegionMaskEffect *v5;
  char v6;
  PXGRegionMaskEffect *v7;

  v7 = (PXGRegionMaskEffect *)a3;
  v5 = self->_topEdgeMaskEffect;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXGRegionMaskEffect isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_topEdgeMaskEffect, a3);
      -[PXStoryClipLayout _invalidateCombinedEffect](self, "_invalidateCombinedEffect");
    }
  }

}

- (void)setLeftEdgeMaskEffect:(id)a3
{
  PXGRegionMaskEffect *v5;
  char v6;
  PXGRegionMaskEffect *v7;

  v7 = (PXGRegionMaskEffect *)a3;
  v5 = self->_leftEdgeMaskEffect;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXGRegionMaskEffect isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_leftEdgeMaskEffect, a3);
      -[PXStoryClipLayout _invalidateCombinedEffect](self, "_invalidateCombinedEffect");
    }
  }

}

- (void)setBottomEdgeMaskEffect:(id)a3
{
  PXGRegionMaskEffect *v5;
  char v6;
  PXGRegionMaskEffect *v7;

  v7 = (PXGRegionMaskEffect *)a3;
  v5 = self->_bottomEdgeMaskEffect;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXGRegionMaskEffect isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_bottomEdgeMaskEffect, a3);
      -[PXStoryClipLayout _invalidateCombinedEffect](self, "_invalidateCombinedEffect");
    }
  }

}

- (void)setRightEdgeMaskEffect:(id)a3
{
  PXGRegionMaskEffect *v5;
  char v6;
  PXGRegionMaskEffect *v7;

  v7 = (PXGRegionMaskEffect *)a3;
  v5 = self->_rightEdgeMaskEffect;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXGRegionMaskEffect isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_rightEdgeMaskEffect, a3);
      -[PXStoryClipLayout _invalidateCombinedEffect](self, "_invalidateCombinedEffect");
    }
  }

}

- (void)setLeftEdgeClippingMaskEffect:(id)a3
{
  PXGRegionMaskEffect *v5;
  char v6;
  PXGRegionMaskEffect *v7;

  v7 = (PXGRegionMaskEffect *)a3;
  v5 = self->_leftEdgeClippingMaskEffect;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXGRegionMaskEffect isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_leftEdgeClippingMaskEffect, a3);
      -[PXStoryClipLayout _invalidateCombinedEffect](self, "_invalidateCombinedEffect");
    }
  }

}

- (void)setRightEdgeClippingMaskEffect:(id)a3
{
  PXGRegionMaskEffect *v5;
  char v6;
  PXGRegionMaskEffect *v7;

  v7 = (PXGRegionMaskEffect *)a3;
  v5 = self->_rightEdgeClippingMaskEffect;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXGRegionMaskEffect isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_rightEdgeClippingMaskEffect, a3);
      -[PXStoryClipLayout _invalidateCombinedEffect](self, "_invalidateCombinedEffect");
    }
  }

}

- (void)setCombinedEffect:(id)a3
{
  PXGCombinedEffect *v5;
  char v6;
  PXGCombinedEffect *v7;

  v7 = (PXGCombinedEffect *)a3;
  v5 = self->_combinedEffect;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXGCombinedEffect isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_combinedEffect, a3);
      -[PXStoryClipLayout _invalidateContentStyle](self, "_invalidateContentStyle");
    }
  }

}

- (void)setSegmentIdentifiers:(id)a3
{
  NSIndexSet *v4;
  char v5;
  NSIndexSet *v6;
  NSIndexSet *segmentIdentifiers;
  NSIndexSet *v8;

  v8 = (NSIndexSet *)a3;
  v4 = self->_segmentIdentifiers;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSIndexSet isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSIndexSet *)-[NSIndexSet copy](v8, "copy");
      segmentIdentifiers = self->_segmentIdentifiers;
      self->_segmentIdentifiers = v6;

      -[PXStoryClipLayout _invalidateIsSegmentVisible](self, "_invalidateIsSegmentVisible");
      -[PXStoryClipLayout _invalidateHUD](self, "_invalidateHUD");
      -[PXStoryClipLayout _invalidateOffsetFromCurrentSegment](self, "_invalidateOffsetFromCurrentSegment");
    }
  }

}

- (void)setWantsHUD:(BOOL)a3
{
  id v4;

  if (self->_wantsHUD != a3)
  {
    self->_wantsHUD = a3;
    -[PXStoryClipLayout _invalidateHUD](self, "_invalidateHUD");
    if (self->_wantsHUD)
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "px_scheduledTimerWithTimeInterval:weakTarget:selector:userInfo:repeats:", self, sel__invalidateHUD, 0, 1, 1.0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryClipLayout setHUDTimer:](self, "setHUDTimer:", v4);

    }
    else
    {
      -[PXStoryClipLayout setHUDTimer:](self, "setHUDTimer:", 0);
    }
  }
}

- (void)setHUDTimer:(id)a3
{
  NSTimer *v5;
  NSTimer **p_HUDTimer;
  NSTimer *v7;

  v5 = (NSTimer *)a3;
  p_HUDTimer = &self->_HUDTimer;
  if (*p_HUDTimer != v5)
  {
    v7 = v5;
    -[NSTimer invalidate](*p_HUDTimer, "invalidate");
    objc_storeStrong((id *)p_HUDTimer, a3);
    v5 = v7;
  }

}

- (void)setIsSegmentVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[96];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_isSegmentVisible != a3)
  {
    v3 = a3;
    self->_isSegmentVisible = a3;
    if (self->_isFeedThumbnail)
    {
LABEL_15:
      -[PXStoryClipLayout _invalidateVideoPresentationControllerState](self, "_invalidateVideoPresentationControllerState");
      -[PXStoryClipLayout _invalidateAnimations](self, "_invalidateAnimations");
      -[PXStoryClipLayout _invalidateHUD](self, "_invalidateHUD");
      -[PXStoryClipLayout _invalidateContentMode](self, "_invalidateContentMode");
      -[PXStoryClipLayout _invalidateContentStyle](self, "_invalidateContentStyle");
      return;
    }
    -[PXStoryClipLayout model](self, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "log");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6;
    v8 = os_signpost_id_make_with_pointer(v7, self);
    v9 = v8;
    if (v3)
    {
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v7))
        goto LABEL_14;
      -[PXStoryClipLayout model](self, "model");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "logContext");
      -[PXStoryClipLayout clip](self, "clip");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "info");
        v14 = v17[0];
      }
      else
      {
        bzero(v17, 0x300uLL);
        v14 = 0;
      }
      -[PXStoryClipLayout model](self, "model");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeline");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v19 = v11;
      v20 = 2050;
      v21 = v14;
      v22 = 2114;
      v23 = v16;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PXStoryClipLayoutIsSegmentVisible", "Context=%{signpost.telemetry:string2}lu clipIdentifier=%{signpost.description:attribute, public}ld timeline=%{signpost.description:attribute, public}@", buf, 0x20u);

    }
    else
    {
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v7))
        goto LABEL_14;
      -[PXStoryClipLayout model](self, "model");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v19 = objc_msgSend(v10, "logContext");
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_END, v9, "PXStoryClipLayoutIsSegmentVisible", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
    }

LABEL_14:
    goto LABEL_15;
  }
}

- (void)setOffsetFromCurrentSegment:(int64_t)a3
{
  if (self->_offsetFromCurrentSegment != a3)
  {
    self->_offsetFromCurrentSegment = a3;
    -[PXStoryClipLayout _invalidatePlayheadState](self, "_invalidatePlayheadState");
  }
}

- (void)setShouldAspectFitContent:(BOOL)a3
{
  id v4;

  if (self->_shouldAspectFitContent != a3)
  {
    self->_shouldAspectFitContent = a3;
    -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
    -[PXStoryClipLayout _invalidateContentStyle](self, "_invalidateContentStyle");
    if (-[PXStoryClipLayout isSegmentVisible](self, "isSegmentVisible"))
    {
      -[PXGLayout createAnimation](self, "createAnimation");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDuration:", 0.2);

    }
  }
}

- (void)setIsPlayheadInVideoTimeRange:(BOOL)a3 isPlayheadInAudioTimeRange:(BOOL)a4 wasPlayheadMovedManually:(BOOL)a5 currentAudioVolume:(float)a6
{
  int v8;
  int v9;
  int isPlayheadInVideoTimeRange;
  int isPlayheadInAudioTimeRange;
  void *v13;
  void *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  os_signpost_id_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[96];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v8 = a4;
  v9 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  isPlayheadInVideoTimeRange = self->_isPlayheadInVideoTimeRange;
  if (isPlayheadInVideoTimeRange != a3)
    self->_isPlayheadInVideoTimeRange = a3;
  isPlayheadInAudioTimeRange = self->_isPlayheadInAudioTimeRange;
  if (isPlayheadInAudioTimeRange != a4)
  {
    self->_isPlayheadInAudioTimeRange = a4;
    -[PXStoryClipLayout model](self, "model");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "log");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v14;
    v16 = os_signpost_id_make_with_pointer(v15, self);
    v17 = v16;
    if (v8)
    {
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        -[PXStoryClipLayout model](self, "model");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v26, "logContext");
        -[PXStoryClipLayout clip](self, "clip");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v18;
        if (v18)
        {
          objc_msgSend(v18, "info");
          -[PXStoryClipLayout model](self, "model", v27[0]);
        }
        else
        {
          bzero(v27, 0x300uLL);
          -[PXStoryClipLayout model](self, "model", 0);
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeline");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v29 = v24;
        v30 = 2050;
        v31 = v23;
        v32 = 2114;
        v33 = v21;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PXStoryClipLayoutPlayheadInAudioTimeRange", "Context=%{signpost.telemetry:string2}lu clipIdentifier=%{signpost.description:attribute, public}ld timeline=%{signpost.description:attribute, public}@", buf, 0x20u);

      }
    }
    else if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      -[PXStoryClipLayout model](self, "model");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v29 = objc_msgSend(v19, "logContext");
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v15, OS_SIGNPOST_INTERVAL_END, v17, "PXStoryClipLayoutPlayheadInAudioTimeRange", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);

    }
  }
  if (self->_currentAudioVolume != a6)
  {
    self->_currentAudioVolume = a6;
    self->_wasPlayheadMovedManually = a5;
    -[PXStoryClipLayout _invalidateVideoPresentationControllerState](self, "_invalidateVideoPresentationControllerState");
LABEL_17:
    -[PXStoryClipLayout _invalidateMusicDucking](self, "_invalidateMusicDucking");
    return;
  }
  self->_wasPlayheadMovedManually = a5;
  if (isPlayheadInVideoTimeRange != v9 || isPlayheadInAudioTimeRange != v8)
  {
    -[PXStoryClipLayout _invalidateVideoPresentationControllerState](self, "_invalidateVideoPresentationControllerState");
    if (isPlayheadInAudioTimeRange != v8)
      goto LABEL_17;
  }
}

- (void)setDisplayAsset:(id)a3
{
  PXDisplayAsset *v5;
  PXDisplayAsset *displayAsset;
  PXDisplayAsset *v7;
  uint64_t v8;
  PXDisplayAsset *v9;

  v5 = (PXDisplayAsset *)a3;
  displayAsset = self->_displayAsset;
  if (displayAsset != v5)
  {
    v9 = v5;
    if (v5 && displayAsset)
    {
      v7 = displayAsset;
      v8 = -[PXDisplayAsset isContentEqualTo:](v9, "isContentEqualTo:", v7);
      if (!v8)
        v8 = -[PXDisplayAsset isContentEqualTo:](v7, "isContentEqualTo:", v9);

      objc_storeStrong((id *)&self->_displayAsset, a3);
      -[PXStoryClipLayout setIsReadyForAutoplay:](self, "setIsReadyForAutoplay:", 0);
      if (v8 != 2)
        -[PXStoryClipLayout _invalidateColorNormalizationEffect](self, "_invalidateColorNormalizationEffect");
    }
    else
    {
      objc_storeStrong((id *)&self->_displayAsset, a3);
      -[PXStoryClipLayout setIsReadyForAutoplay:](self, "setIsReadyForAutoplay:", 0);
    }
    -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
    v5 = v9;
  }

}

- (void)setContentsRectOverride:(id *)a3
{
  $994A55DD1B0CBEB82FDB96EE3E4BCE6C *p_contentsRectOverride;
  __int128 v6;
  __int128 v7;
  $994A55DD1B0CBEB82FDB96EE3E4BCE6C contentsRectOverride;
  $810C7C628FE0F9AC50A6216490AB88B8 v9;

  p_contentsRectOverride = &self->_contentsRectOverride;
  v9 = *a3;
  contentsRectOverride = self->_contentsRectOverride;
  if ((PXStoryRectEqualToRect() & 1) == 0)
  {
    v6 = *(_OWORD *)&a3->var0.a;
    v7 = *(_OWORD *)&a3->var0.tx;
    *(_OWORD *)&p_contentsRectOverride->t.c = *(_OWORD *)&a3->var0.c;
    *(_OWORD *)&p_contentsRectOverride->t.tx = v7;
    *(_OWORD *)&p_contentsRectOverride->t.a = v6;
    -[PXStoryClipLayout _invalidateContentStyle](self, "_invalidateContentStyle", *(_OWORD *)&contentsRectOverride.t.a, *(_OWORD *)&contentsRectOverride.t.c, *(_OWORD *)&contentsRectOverride.t.tx, *(_OWORD *)&v9.var0.a, *(_OWORD *)&v9.var0.c, *(_OWORD *)&v9.var0.tx);
  }
}

- (void)setContentSpriteNormalizedFrameOverride:(CGRect)a3 coordinateSystem:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentSpriteNormalizedFrameOverride;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentSpriteNormalizedFrameOverride = &self->_contentSpriteNormalizedFrameOverride;
  if (!CGRectEqualToRect(a3, self->_contentSpriteNormalizedFrameOverride)
    || self->_contentSpriteNormalizedFrameOverrideCoordinateSystem != a4)
  {
    p_contentSpriteNormalizedFrameOverride->origin.x = x;
    p_contentSpriteNormalizedFrameOverride->origin.y = y;
    p_contentSpriteNormalizedFrameOverride->size.width = width;
    p_contentSpriteNormalizedFrameOverride->size.height = height;
    self->_contentSpriteNormalizedFrameOverrideCoordinateSystem = a4;
    -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setShouldAutoplay:(BOOL)a3
{
  if (self->_shouldAutoplay != a3)
  {
    self->_shouldAutoplay = a3;
    if (a3)
      -[PXStoryClipLayout setIsReadyForAutoplay:](self, "setIsReadyForAutoplay:", 1);
    -[PXStoryClipLayout _invalidateVideoPresentationControllerState](self, "_invalidateVideoPresentationControllerState");
  }
}

- (void)setAutoplayTimeRange:(id *)a3
{
  $EB79B37EDD75B660E5EC336E3C45010D *p_autoplayTimeRange;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CMTimeRange v10;
  CMTimeRange range1;

  p_autoplayTimeRange = &self->_autoplayTimeRange;
  v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range1.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range1.start.epoch = v6;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v7 = *(_OWORD *)&self->_autoplayTimeRange.start.epoch;
  *(_OWORD *)&v10.start.value = *(_OWORD *)&self->_autoplayTimeRange.start.value;
  *(_OWORD *)&v10.start.epoch = v7;
  *(_OWORD *)&v10.duration.timescale = *(_OWORD *)&self->_autoplayTimeRange.duration.timescale;
  if (!CMTimeRangeEqual(&range1, &v10))
  {
    v8 = *(_OWORD *)&a3->var0.var0;
    v9 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&p_autoplayTimeRange->start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&p_autoplayTimeRange->duration.timescale = v9;
    *(_OWORD *)&p_autoplayTimeRange->start.value = v8;
    -[PXStoryClipLayout _invalidateVideoPresentationControllerState](self, "_invalidateVideoPresentationControllerState");
  }
}

- (void)setIsReadyForAutoplay:(BOOL)a3
{
  if (self->_isReadyForAutoplay != a3)
  {
    self->_isReadyForAutoplay = a3;
    -[PXStoryClipLayout _invalidateAssetPresentationStyles](self, "_invalidateAssetPresentationStyles");
    -[PXStoryClipLayout _invalidateVideoPresentationController](self, "_invalidateVideoPresentationController");
  }
}

- (void)setClippingAnimation:(id)a3
{
  PXStoryTiltedEdgeInsetsAnimation **p_clippingAnimation;
  PXStoryTiltedEdgeInsetsAnimation *v6;
  char v7;
  PXStoryTiltedEdgeInsetsAnimation *v8;

  v8 = (PXStoryTiltedEdgeInsetsAnimation *)a3;
  p_clippingAnimation = &self->_clippingAnimation;
  v6 = self->_clippingAnimation;
  if (v6 == v8)
  {

  }
  else
  {
    v7 = -[PXStoryTiltedEdgeInsetsAnimation isEqual:](v8, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      -[PXStoryTiltedEdgeInsetsAnimation unregisterChangeObserver:context:](*p_clippingAnimation, "unregisterChangeObserver:context:", self, ClippingAnimationObservationContext);
      objc_storeStrong((id *)&self->_clippingAnimation, a3);
      -[PXStoryTiltedEdgeInsetsAnimation registerChangeObserver:context:](*p_clippingAnimation, "registerChangeObserver:context:", self, ClippingAnimationObservationContext);
      -[PXStoryClipLayout _invalidateEdgeMaskEffects](self, "_invalidateEdgeMaskEffects");
    }
  }

}

- (void)setDisableClippingAnimation:(BOOL)a3
{
  if (self->_disableClippingAnimation != a3)
  {
    self->_disableClippingAnimation = a3;
    -[PXStoryClipLayout _invalidateAnimations](self, "_invalidateAnimations");
    -[PXStoryClipLayout _invalidateContentStyle](self, "_invalidateContentStyle");
  }
}

- (void)setKenBurnsAnimation:(id)a3
{
  PXStoryRectAnimation **p_kenBurnsAnimation;
  PXStoryRectAnimation *v6;
  char v7;
  PXStoryRectAnimation *v8;

  v8 = (PXStoryRectAnimation *)a3;
  p_kenBurnsAnimation = &self->_kenBurnsAnimation;
  v6 = self->_kenBurnsAnimation;
  if (v6 == v8)
  {

  }
  else
  {
    v7 = -[PXStoryRectAnimation isEqual:](v8, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      -[PXStoryRectAnimation unregisterChangeObserver:context:](*p_kenBurnsAnimation, "unregisterChangeObserver:context:", self, KenBurnsAnimationObservationContext);
      objc_storeStrong((id *)&self->_kenBurnsAnimation, a3);
      -[PXStoryRectAnimation registerChangeObserver:context:](*p_kenBurnsAnimation, "registerChangeObserver:context:", self, KenBurnsAnimationObservationContext);
      -[PXStoryClipLayout _invalidateContentStyle](self, "_invalidateContentStyle");
    }
  }

}

- (void)setRelativeZPositionAboveLegibilityGradients:(double)a3
{
  if (self->_relativeZPositionAboveLegibilityGradients != a3)
  {
    self->_relativeZPositionAboveLegibilityGradients = a3;
    -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setCurrentTextResourceInfo:(id)a3
{
  PXStoryTextResourceInfo *v5;
  BOOL v6;
  PXStoryTextResourceInfo *v7;

  v7 = (PXStoryTextResourceInfo *)a3;
  v5 = self->_currentTextResourceInfo;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXStoryTextResourceInfo isEqual:](v7, "isEqual:", v5);

    if (!v6)
    {
      objc_storeStrong((id *)&self->_currentTextResourceInfo, a3);
      -[PXStoryClipLayout setShouldObserveInternationalStyleTitlePreferences:](self, "setShouldObserveInternationalStyleTitlePreferences:", v7 != 0);
    }
  }

}

- (void)setShouldObserveInternationalStyleTitlePreferences:(BOOL)a3
{
  if (self->_shouldObserveInternationalStyleTitlePreferences != a3)
  {
    self->_shouldObserveInternationalStyleTitlePreferences = a3;
    if (a3)
      PXStoryTitleInternationalStyleRegisterPreferencesObserver(self);
    else
      PXStoryTitleInternationalStyleUnregisterPreferencesObserver(self);
  }
}

- (void)setTextResourceSpriteFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_textResourceSpriteFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_textResourceSpriteFrame = &self->_textResourceSpriteFrame;
  if (!CGRectEqualToRect(a3, self->_textResourceSpriteFrame))
  {
    p_textResourceSpriteFrame->origin.x = x;
    p_textResourceSpriteFrame->origin.y = y;
    p_textResourceSpriteFrame->size.width = width;
    p_textResourceSpriteFrame->size.height = height;
    -[PXStoryClipLayout _invalidateModelPresentedTextProperties](self, "_invalidateModelPresentedTextProperties");
    -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setTextFrameProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_textFrameProgress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  p_textFrameProgress = &self->_textFrameProgress;
  if (*p_textFrameProgress != v5)
  {
    v7 = v5;
    -[NSProgress cancel](*p_textFrameProgress, "cancel");
    objc_storeStrong((id *)p_textFrameProgress, a3);
    v5 = v7;
  }

}

- (void)entityManagerDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipLayout;
  -[PXGLayout entityManagerDidChange](&v3, sel_entityManagerDidChange);
  -[PXStoryClipLayout _invalidateColorGradingEffect](self, "_invalidateColorGradingEffect");
  -[PXStoryClipLayout _invalidateColorNormalizationEffect](self, "_invalidateColorNormalizationEffect");
  -[PXStoryClipLayout _invalidateTextLegibilityEffect](self, "_invalidateTextLegibilityEffect");
  -[PXStoryClipLayout _invalidateEdgeMaskEffects](self, "_invalidateEdgeMaskEffects");
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXGLayout referenceSize](self, "referenceSize");
  -[PXGLayout setContentSize:](self, "setContentSize:");
  -[PXStoryClipLayout _invalidateTextResourceSpriteFrame](self, "_invalidateTextResourceSpriteFrame");
  -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
}

- (void)displayScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipLayout;
  -[PXGLayout displayScaleDidChange](&v3, sel_displayScaleDidChange);
  -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
}

- (void)alphaDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipLayout;
  -[PXGLayout alphaDidChange](&v3, sel_alphaDidChange);
  -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
  -[PXStoryClipLayout _invalidateHUD](self, "_invalidateHUD");
}

- (void)contentSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipLayout;
  -[PXGLayout contentSizeDidChange](&v3, sel_contentSizeDidChange);
  -[PXStoryClipLayout _invalidateContentStyle](self, "_invalidateContentStyle");
  -[PXStoryClipLayout _invalidateEdgeMaskEffects](self, "_invalidateEdgeMaskEffects");
}

- (void)referenceDepthDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipLayout;
  -[PXGLayout referenceDepthDidChange](&v3, sel_referenceDepthDidChange);
  -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
}

- (void)setAssetPresentationStyles:(unint64_t)a3
{
  if (self->_assetPresentationStyles != a3)
  {
    self->_assetPresentationStyles = a3;
    -[PXStoryClipLayout _invalidateContentVersion](self, "_invalidateContentVersion");
    -[PXStoryClipLayout _invalidateVideoPresentationController](self, "_invalidateVideoPresentationController");
  }
}

- (void)setVideoPresentationController:(id)a3
{
  PXGDisplayAssetVideoPresentationController *v5;
  PXGDisplayAssetVideoPresentationController *v6;
  PXGDisplayAssetVideoPresentationController *v7;
  char v8;
  PXGDisplayAssetVideoPresentationController *v9;
  void *v10;
  PXGDisplayAssetVideoPresentationController *v11;
  _QWORD v12[4];
  PXGDisplayAssetVideoPresentationController *v13;
  PXGDisplayAssetVideoPresentationController *v14;

  v5 = (PXGDisplayAssetVideoPresentationController *)a3;
  v6 = self->_videoPresentationController;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXGDisplayAssetVideoPresentationController isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      v9 = self->_videoPresentationController;
      objc_storeStrong((id *)&self->_videoPresentationController, a3);
      -[PXStoryClipLayout _invalidateVideoPresentationControllerState](self, "_invalidateVideoPresentationControllerState");
      -[PXStoryClipLayout _invalidatePlayheadState](self, "_invalidatePlayheadState");
      -[PXStoryClipLayout model](self, "model");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __52__PXStoryClipLayout_setVideoPresentationController___block_invoke;
      v12[3] = &unk_1E51337A8;
      v13 = v9;
      v14 = v5;
      v11 = v9;
      objc_msgSend(v10, "performChanges:", v12);

    }
  }

}

- (id)_effectWithClass:(Class)a3 reusableInstance:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;

  v6 = a4;
  -[PXGLayout entityManager](self, "entityManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "entityManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != v7;

  }
  else
  {
    v9 = 1;
  }
  v10 = v6;
  if (v9)
  {
    v10 = v6;
    if (v7)
    {
      v10 = (void *)objc_msgSend([a3 alloc], "initWithEntityManager:", v7);

    }
  }

  return v10;
}

- (id)spriteReferenceForContentSprite
{
  return -[PXGLayout spriteReferenceForSpriteIndex:](self, "spriteReferenceForSpriteIndex:", self->_contentSpriteIndex);
}

- ($738B17BD11CC339B30296C0EA03CEC2B)contentSpriteEntity
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)-[PXGLayout entityForSpriteAtIndex:](self, "entityForSpriteAtIndex:", self->_contentSpriteIndex);
}

- (BOOL)_isDisplayingContentOfAsset:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (self->_resourceKind != 1)
    return 0;
  v4 = a3;
  -[PXStoryClipLayout displayAsset](self, "displayAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6;
}

- (BOOL)isDisplayingTitle
{
  return -[PXStoryClipLayout _isDisplayingTextResourceType:](self, "_isDisplayingTextResourceType:", 0);
}

- (BOOL)isDisplayingSubtitle
{
  return -[PXStoryClipLayout _isDisplayingTextResourceType:](self, "_isDisplayingTextResourceType:", 1);
}

- (BOOL)_isDisplayingTextResourceType:(int64_t)a3
{
  void *v4;
  BOOL v5;

  if (self->_resourceKind != 3)
    return 0;
  -[PXStoryClipLayout currentTextResourceInfo](self, "currentTextResourceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type") == a3;

  return v5;
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryClipLayout;
  -[PXGLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryClipLayout.m"), 874, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
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
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  objc_super v87;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("PXStoryClipLayout.m"), 878, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryClipLayout _updateResource](self, "_updateResource");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "handleFailureInFunction:file:lineNumber:description:", v86, CFSTR("PXStoryClipLayout.m"), 882, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXStoryClipLayout _updateColorGradeKind](self, "_updateColorGradeKind");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXStoryClipLayout.m"), 885, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXStoryClipLayout _updateColorGradingEffect](self, "_updateColorGradingEffect");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("PXStoryClipLayout.m"), 888, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20000uLL;
    if ((v7 & 0x20000) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFDFFFFLL;
      -[PXStoryClipLayout _updateDisplayAsset](self, "_updateDisplayAsset");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("PXStoryClipLayout.m"), 891, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x40000uLL;
    if ((v8 & 0x40000) != 0)
    {
      p_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFBFFFFLL;
      -[PXStoryClipLayout _updateShouldAutoplay](self, "_updateShouldAutoplay");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("PXStoryClipLayout.m"), 894, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x2000uLL;
    if ((v9 & 0x2000) != 0)
    {
      p_updateFlags->needsUpdate = v9 & 0xFFFFFFFFFFFFDFFFLL;
      -[PXStoryClipLayout _updateAssetPresentationStyles](self, "_updateAssetPresentationStyles");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("PXStoryClipLayout.m"), 897, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v10 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x4000uLL;
    if ((v10 & 0x4000) != 0)
    {
      p_updateFlags->needsUpdate = v10 & 0xFFFFFFFFFFFFBFFFLL;
      -[PXStoryClipLayout _updateVideoPresentationController](self, "_updateVideoPresentationController");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("PXStoryClipLayout.m"), 900, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v11 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v11 & 0x20) != 0)
    {
      p_updateFlags->needsUpdate = v11 & 0xFFFFFFFFFFFFFFDFLL;
      -[PXStoryClipLayout _updateSegmentIdentifiers](self, "_updateSegmentIdentifiers");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, CFSTR("PXStoryClipLayout.m"), 903, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v12 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x40uLL;
    if ((v12 & 0x40) != 0)
    {
      p_updateFlags->needsUpdate = v12 & 0xFFFFFFFFFFFFFFBFLL;
      -[PXStoryClipLayout _updateIsSegmentVisible](self, "_updateIsSegmentVisible");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, CFSTR("PXStoryClipLayout.m"), 906, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v13 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x800000uLL;
    if ((v13 & 0x800000) != 0)
    {
      p_updateFlags->needsUpdate = v13 & 0xFFFFFFFFFF7FFFFFLL;
      -[PXStoryClipLayout _updateOffsetFromCurrentSegment](self, "_updateOffsetFromCurrentSegment");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, CFSTR("PXStoryClipLayout.m"), 909, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v14 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x100000uLL;
    if ((v14 & 0x100000) != 0)
    {
      p_updateFlags->needsUpdate = v14 & 0xFFFFFFFFFFEFFFFFLL;
      -[PXStoryClipLayout _updatePlayheadState](self, "_updatePlayheadState");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, CFSTR("PXStoryClipLayout.m"), 912, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v15 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v15 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v15 & 0xFFFFFFFFFFFFFFF7;
      -[PXStoryClipLayout _updateVideoPresentationControllerState](self, "_updateVideoPresentationControllerState");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, CFSTR("PXStoryClipLayout.m"), 915, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v16 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x400000uLL;
    if ((v16 & 0x400000) != 0)
    {
      p_updateFlags->needsUpdate = v16 & 0xFFFFFFFFFFBFFFFFLL;
      -[PXStoryClipLayout _updateMusicDucking](self, "_updateMusicDucking");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, CFSTR("PXStoryClipLayout.m"), 918, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v17 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x200000uLL;
    if ((v17 & 0x200000) != 0)
    {
      p_updateFlags->needsUpdate = v17 & 0xFFFFFFFFFFDFFFFFLL;
      -[PXStoryClipLayout _updateContentMode](self, "_updateContentMode");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, CFSTR("PXStoryClipLayout.m"), 921, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v18 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x1000000uLL;
    if ((v18 & 0x1000000) != 0)
    {
      p_updateFlags->needsUpdate = v18 & 0xFFFFFFFFFEFFFFFFLL;
      -[PXStoryClipLayout _updateTextResourceSpriteFrame](self, "_updateTextResourceSpriteFrame");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v60, CFSTR("PXStoryClipLayout.m"), 924, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v19 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x2000000uLL;
    if ((v19 & 0x2000000) != 0)
    {
      p_updateFlags->needsUpdate = v19 & 0xFFFFFFFFFDFFFFFFLL;
      -[PXStoryClipLayout _updateModelPresentedTextProperties](self, "_updateModelPresentedTextProperties");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, CFSTR("PXStoryClipLayout.m"), 927, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v20 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v20 & 0x10) != 0)
    {
      p_updateFlags->needsUpdate = v20 & 0xFFFFFFFFFFFFFFEFLL;
      -[PXStoryClipLayout _updateContent](self, "_updateContent");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "handleFailureInFunction:file:lineNumber:description:", v64, CFSTR("PXStoryClipLayout.m"), 930, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v21 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x80uLL;
    if ((v21 & 0x80) != 0)
    {
      p_updateFlags->needsUpdate = v21 & 0xFFFFFFFFFFFFFF7FLL;
      -[PXStoryClipLayout _updateAnimations](self, "_updateAnimations");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "handleFailureInFunction:file:lineNumber:description:", v66, CFSTR("PXStoryClipLayout.m"), 933, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v22 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x100uLL;
    if ((v22 & 0x100) != 0)
    {
      p_updateFlags->needsUpdate = v22 & 0xFFFFFFFFFFFFFEFFLL;
      -[PXStoryClipLayout _updateEdgeMaskEffects](self, "_updateEdgeMaskEffects");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "handleFailureInFunction:file:lineNumber:description:", v68, CFSTR("PXStoryClipLayout.m"), 936, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v23 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x8000uLL;
    if ((v23 & 0x8000) != 0)
    {
      p_updateFlags->needsUpdate = v23 & 0xFFFFFFFFFFFF7FFFLL;
      -[PXStoryClipLayout _updateColorNormalizationEffect](self, "_updateColorNormalizationEffect");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "handleFailureInFunction:file:lineNumber:description:", v70, CFSTR("PXStoryClipLayout.m"), 939, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v24 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10000uLL;
    if ((v24 & 0x10000) != 0)
    {
      p_updateFlags->needsUpdate = v24 & 0xFFFFFFFFFFFEFFFFLL;
      -[PXStoryClipLayout _updateTextLegibilityEffect](self, "_updateTextLegibilityEffect");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "handleFailureInFunction:file:lineNumber:description:", v72, CFSTR("PXStoryClipLayout.m"), 942, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v25 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x200uLL;
    if ((v25 & 0x200) != 0)
    {
      p_updateFlags->needsUpdate = v25 & 0xFFFFFFFFFFFFFDFFLL;
      -[PXStoryClipLayout _updateCombinedEffect](self, "_updateCombinedEffect");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "handleFailureInFunction:file:lineNumber:description:", v74, CFSTR("PXStoryClipLayout.m"), 945, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v26 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x400uLL;
    if ((v26 & 0x400) != 0)
    {
      p_updateFlags->needsUpdate = v26 & 0xFFFFFFFFFFFFFBFFLL;
      -[PXStoryClipLayout _updateContentStyle](self, "_updateContentStyle");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "handleFailureInFunction:file:lineNumber:description:", v76, CFSTR("PXStoryClipLayout.m"), 948, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v27 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x800uLL;
    if ((v27 & 0x800) != 0)
    {
      p_updateFlags->needsUpdate = v27 & 0xFFFFFFFFFFFFF7FFLL;
      -[PXStoryClipLayout _updateWantsHUD](self, "_updateWantsHUD");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "handleFailureInFunction:file:lineNumber:description:", v78, CFSTR("PXStoryClipLayout.m"), 951, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v28 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x1000uLL;
    if ((v28 & 0x1000) != 0)
    {
      p_updateFlags->needsUpdate = v28 & 0xFFFFFFFFFFFFEFFFLL;
      -[PXStoryClipLayout _updateHUD](self, "_updateHUD");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "handleFailureInFunction:file:lineNumber:description:", v80, CFSTR("PXStoryClipLayout.m"), 954, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v29 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x80000uLL;
    if ((v29 & 0x80000) != 0)
    {
      p_updateFlags->needsUpdate = v29 & 0xFFFFFFFFFFF7FFFFLL;
      -[PXStoryClipLayout _updateSmartGradientAdjustment](self, "_updateSmartGradientAdjustment");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "handleFailureInFunction:file:lineNumber:description:", v82, CFSTR("PXStoryClipLayout.m"), 957, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v30 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x4000000uLL;
    if ((v30 & 0x4000000) != 0)
    {
      p_updateFlags->needsUpdate = v30 & 0xFFFFFFFFFBFFFFFFLL;
      -[PXStoryClipLayout _updateInactiveImageAdjustment](self, "_updateInactiveImageAdjustment");
      v30 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout update]");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "handleFailureInFunction:file:lineNumber:description:", v84, CFSTR("PXStoryClipLayout.m"), 960, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v87.receiver = self;
  v87.super_class = (Class)PXStoryClipLayout;
  -[PXGLayout update](&v87, sel_update);
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryClipLayout;
  -[PXGLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryClipLayout.m"), 966, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
}

- (void)_invalidateResource
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateResource]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 970, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateResource
{
  void *v3;
  id v4;

  -[PXStoryClipLayout clip](self, "clip");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryClipLayout setResource:](self, "setResource:", v3);

}

- (void)_invalidateAssetPresentationStyles
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x2000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x2000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateAssetPresentationStyles]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 978, CFSTR("invalidating %lu after it already has been updated"), 0x2000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 0x2000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateAssetPresentationStyles
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  uint64_t v13;
  unint64_t v14;

  -[PXStoryClipLayout resource](self, "resource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "px_storyResourceKind");

  if (v4 == 5)
    goto LABEL_9;
  if (v4 != 1)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_10;
  }
  -[PXStoryClipLayout clip](self, "clip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    bzero(&v13, 0x300uLL);
    goto LABEL_9;
  }
  v6 = v5;
  objc_msgSend(v5, "info");

  if (v14 - 3 >= 3)
  {
    if (v14 > 2)
      goto LABEL_6;
LABEL_9:
    v7 = 1;
    goto LABEL_10;
  }
  -[PXStoryClipLayout model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "disableVideoPlayback");

  if ((v10 & 1) != 0)
    goto LABEL_9;
  -[PXStoryClipLayout model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isExporting");

  if ((v12 & 1) != 0)
  {
    v7 = 2;
  }
  else if (-[PXStoryClipLayout canShowDynamicContent](self, "canShowDynamicContent"))
  {
    v7 = 3;
  }
  else if (-[PXStoryClipLayout isReadyForAutoplay](self, "isReadyForAutoplay"))
  {
    v7 = 3;
  }
  else
  {
    v7 = 1;
  }
LABEL_10:
  -[PXStoryClipLayout setAssetPresentationStyles:](self, "setAssetPresentationStyles:", v7);
}

- (void)_invalidateVideoPresentationController
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x4000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x4000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateVideoPresentationController]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 1027, CFSTR("invalidating %lu after it already has been updated"), 0x4000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 0x4000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateVideoPresentationController
{
  PXGDisplayAssetVideoPresentationController *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  PXGDisplayAssetVideoPresentationController *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  CMTimeFlags v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  char v21;
  void *v22;
  void *v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  PXVideoSessionManagerDisplayAssetOptions *v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  PXVideoSessionManagerDisplayAssetOptions *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  PXGDisplayAssetVideoPresentationController *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  os_signpost_id_t v49;
  os_signpost_id_t v50;
  uint64_t v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  char v58;
  __int128 v59;
  __int128 v60;
  void *v61;
  char v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  _QWORD v69[6];
  int v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  char v74;
  char v75;
  char v76;
  _OWORD v77[6];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[144];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  unint64_t v111;
  _BYTE buf[32];
  __int128 v113;
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  -[PXStoryClipLayout videoPresentationController](self, "videoPresentationController");
  v3 = (PXGDisplayAssetVideoPresentationController *)objc_claimAutoreleasedReturnValue();
  -[PXStoryClipLayout resource](self, "resource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[PXStoryClipLayout assetPresentationStyles](self, "assetPresentationStyles") & 2) != 0 && v4)
  {
    objc_msgSend(v4, "px_storyResourceDisplayAsset");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryClipLayout model](self, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v6;
    if (v3)
    {
      -[PXGDisplayAssetVideoPresentationController displayAsset](v3, "displayAsset");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 == v5)
      {

      }
      else
      {
        v9 = objc_msgSend(v7, "isEqual:", v5);

        if ((v9 & 1) == 0)
        {

          goto LABEL_11;
        }
      }
      -[PXGDisplayAssetVideoPresentationController videoSessionManager](v3, "videoSessionManager");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "videoSessionManager");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {

      }
      else
      {
        v13 = v12;
        v14 = objc_msgSend(v11, "isEqual:", v12);

        if ((v14 & 1) == 0)
          goto LABEL_11;
      }
      v10 = v3;
LABEL_53:

      goto LABEL_54;
    }
LABEL_11:
    v66 = objc_msgSend(v6, "isExporting");
    if ((v66 & 1) != 0)
      v15 = 0;
    else
      v15 = objc_msgSend(v6, "isAsync") ^ 1;
    v16 = -[PXStoryClipLayout isReadyForAutoplay](self, "isReadyForAutoplay");
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryClipLayout clip](self, "clip");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v88 = 0u;
    memset(v87, 0, sizeof(v87));
    v64 = v4;
    if (v18)
      objc_msgSend(v18, "info");
    else
      bzero(v87, 0x300uLL);
    v85 = 0u;
    v86 = 0u;
    v84 = 0u;
    -[PXStoryClipLayout clipTimeRange](self, "clipTimeRange");
    v20 = v111;
    v21 = *((_QWORD *)&v88 + 1) == 5 || v16;
    v65 = v19;
    v67 = v5;
    if ((v21 & 1) != 0)
    {
      v58 = 1;
    }
    else
    {
      -[PXStoryClipLayout segmentIdentifiers](self, "segmentIdentifiers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeline");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v22, "containsIndex:", objc_msgSend(v23, "firstSegmentIdentifier"));

      v19 = v65;
    }
    v24 = objc_msgSend(v17, "wantsAudioFromVideo");
    v25 = v15 & !v16;
    if (v20 < 2)
      v25 = 0;
    if (v24)
      v26 = v25;
    else
      v26 = 0;
    PXStoryClipVideoSegmentTimeRange(v19, &v81);
    *(_OWORD *)buf = v84;
    *(_OWORD *)&buf[16] = v85;
    v113 = v86;
    PXStoryClipSegmentPlaybackTimeRangeIncludingJLCuts(v19, (__int128 *)buf, v15, &v78);
    v27 = objc_alloc_init(PXVideoSessionManagerDisplayAssetOptions);
    -[PXVideoSessionManagerDisplayAssetOptions setIsAudioAllowed:](v27, "setIsAudioAllowed:", v26);
    if (-[PXStoryClipLayout shouldAutoplay](self, "shouldAutoplay"))
    {
      v28 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
      *(_OWORD *)buf = *MEMORY[0x1E0CA2E40];
      *(_OWORD *)&buf[16] = v28;
      v113 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
      -[PXVideoSessionManagerDisplayAssetOptions addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:](v27, "addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:", 3, buf, 1);
      v29 = 0;
    }
    else
    {
      if (objc_msgSend(v6, "isInline"))
        v29 = 5;
      else
        v29 = 4;
      if (v66)
      {
        v30 = objc_msgSend(v17, "exportVideoQuality");
        *(_OWORD *)buf = v81;
        *(_OWORD *)&buf[16] = v82;
        v113 = v83;
        -[PXVideoSessionManagerDisplayAssetOptions addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:](v27, "addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:", v30, buf, 0);
        v59 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
        *(_OWORD *)buf = *MEMORY[0x1E0CA2E40];
        v55 = *(_OWORD *)buf;
        *(_OWORD *)&buf[16] = v59;
        v113 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
        v53 = v113;
        -[PXVideoSessionManagerDisplayAssetOptions addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:](v27, "addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:", v30, buf, 1);
        *(_OWORD *)buf = v55;
        *(_OWORD *)&buf[16] = v59;
        v113 = v53;
        v31 = v27;
        v32 = v30;
      }
      else
      {
        if (*((_QWORD *)&v88 + 1) == 3)
        {
          v33 = objc_msgSend(v17, "livePhotoLocalVideoQuality");
          *(_OWORD *)buf = v81;
          *(_OWORD *)&buf[16] = v82;
          v113 = v83;
          -[PXVideoSessionManagerDisplayAssetOptions addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:networkAccessAllowed:](v27, "addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:networkAccessAllowed:", v33, buf, 0, 0);
        }
        *(_OWORD *)buf = v81;
        *(_OWORD *)&buf[16] = v82;
        v113 = v83;
        -[PXVideoSessionManagerDisplayAssetOptions addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:networkAccessAllowed:](v27, "addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:networkAccessAllowed:", 2, buf, 0, 0);
        v34 = objc_msgSend(v17, "videoQuality");
        *(_OWORD *)buf = v81;
        *(_OWORD *)&buf[16] = v82;
        v113 = v83;
        -[PXVideoSessionManagerDisplayAssetOptions addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:](v27, "addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:", v34, buf, 0);
        v60 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
        *(_OWORD *)buf = *MEMORY[0x1E0CA2E40];
        v56 = *(_OWORD *)buf;
        *(_OWORD *)&buf[16] = v60;
        v113 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
        v54 = v113;
        -[PXVideoSessionManagerDisplayAssetOptions addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:](v27, "addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:", 3, buf, 1);
        *(_OWORD *)buf = v56;
        *(_OWORD *)&buf[16] = v60;
        v113 = v54;
        v31 = v27;
        v32 = 3;
      }
      -[PXVideoSessionManagerDisplayAssetOptions addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:](v31, "addContentDeliveryStrategyWithDeliveryQuality:segmentTimeRange:streamingAllowed:", v32, buf, 0);
    }
    -[PXVideoSessionManagerDisplayAssetOptions setShouldStabilizeLivePhotosIfPossible:](v27, "setShouldStabilizeLivePhotosIfPossible:", objc_msgSend(v17, "videoInlineStabilization"));
    if (*((_QWORD *)&v88 + 1) == 3 && v16)
    {
      -[PXVideoSessionManagerDisplayAssetOptions setShouldCrossfadeLivePhotosWhenLooping:](v27, "setShouldCrossfadeLivePhotosWhenLooping:", 1);
      -[PXStoryClipLayout autoplayTimeRange](self, "autoplayTimeRange");
      v77[0] = v77[3];
      v77[1] = v77[4];
      v77[2] = v77[5];
      -[PXVideoSessionManagerDisplayAssetOptions setLivePhotoLoopTimeRange:](v27, "setLivePhotoLoopTimeRange:", v77);
      v36 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
      v78 = *MEMORY[0x1E0CA2E40];
      v79 = v36;
      v80 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    }
    -[PXStoryClipLayout model](self, "model");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "audioSession");
    v38 = objc_claimAutoreleasedReturnValue();

    v63 = v17;
    v62 = v26;
    v61 = (void *)v38;
    if (v38)
    {
      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D78290]), "initWithAudioSession:", v38);
      -[PXVideoSessionManagerDisplayAssetOptions setAudioSession:](v27, "setAudioSession:", v39);

    }
    else
    {
      -[PXVideoSessionManagerDisplayAssetOptions setAudioSession:](v27, "setAudioSession:", 0);
    }
    -[PXStoryClipLayout model](self, "model");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "configuration");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "videoPlaybackRate");
    v43 = v42;
    v44 = [PXGDisplayAssetVideoPresentationController alloc];
    -[PXGLayout layoutQueue](self, "layoutQueue");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "videoSessionManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXGDisplayAssetVideoPresentationController initWithDisplayAsset:accessQueue:videoSessionManager:options:loadingPriority:](v44, "initWithDisplayAsset:accessQueue:videoSessionManager:options:loadingPriority:", v67, v45, v46, v27, v29);

    objc_msgSend(v68, "log");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGDisplayAssetVideoPresentationController setLog:](v10, "setLog:", v47);

    objc_msgSend(v68, "log");
    v48 = (id)objc_claimAutoreleasedReturnValue();
    v49 = os_signpost_id_make_with_pointer(v48, self);
    if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v50 = v49;
      if (os_signpost_enabled(v48))
      {
        v57 = objc_msgSend(v68, "logContext");
        v51 = -[PXGDisplayAssetVideoPresentationController logContext](v10, "logContext");
        objc_msgSend(v67, "uuid");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = v57;
        *(_WORD *)&buf[12] = 2050;
        *(_QWORD *)&buf[14] = v51;
        *(_WORD *)&buf[22] = 2114;
        *(_QWORD *)&buf[24] = v52;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v48, OS_SIGNPOST_EVENT, v50, "PXStoryClipLayoutCreatedVideoPresentationController", "Context=%{signpost.telemetry:string2}lu videoPresentationControllerContext=%{public}llu, asset.uuid=%{public}@", buf, 0x20u);

      }
    }

    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __55__PXStoryClipLayout__updateVideoPresentationController__block_invoke;
    v69[3] = &unk_1E5116310;
    v69[4] = self;
    v74 = v66;
    v69[5] = v43;
    v75 = v62;
    v70 = 0;
    v76 = v58;
    v71 = v78;
    v72 = v79;
    v73 = v80;
    -[PXGDisplayAssetVideoPresentationController performChanges:](v10, "performChanges:", v69);

    v4 = v64;
    v5 = v67;
    goto LABEL_53;
  }

  v10 = 0;
LABEL_54:
  -[PXStoryClipLayout setVideoPresentationController:](self, "setVideoPresentationController:", v10);

}

- (void)_invalidateVideoPresentationControllerState
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateVideoPresentationControllerState]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 1132, CFSTR("invalidating %lu after it already has been updated"), 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 8;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateVideoPresentationControllerState
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  _QWORD v24[5];
  id v25;
  SEL v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  -[PXStoryClipLayout model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PXStoryClipLayout videoPresentationController](self, "videoPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v29 = 0uLL;
      v30 = 0;
      -[PXStoryClipLayout videoPresentationController](self, "videoPresentationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "actualTime");
      }
      else
      {
        v29 = 0uLL;
        v30 = 0;
      }

      if (objc_msgSend(v4, "isExporting"))
      {
        -[PXStoryClipLayout videoPresentationController](self, "videoPresentationController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __60__PXStoryClipLayout__updateVideoPresentationControllerState__block_invoke;
        v24[3] = &unk_1E5116338;
        v24[4] = self;
        v25 = v4;
        v26 = a2;
        v27 = v29;
        v28 = v30;
        objc_msgSend(v8, "performChanges:", v24);

      }
      else
      {
        v9 = (objc_msgSend(v4, "isActuallyPlaying") & 1) != 0
          || -[PXStoryClipLayout shouldAutoplay](self, "shouldAutoplay");
        v10 = -[PXStoryClipLayout isSegmentVisible](self, "isSegmentVisible");
        v11 = -[PXStoryClipLayout isPlayheadInAudioTimeRange](self, "isPlayheadInAudioTimeRange");
        objc_msgSend(v4, "log");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "logContext");
        -[PXStoryClipLayout videoPresentationController](self, "videoPresentationController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __60__PXStoryClipLayout__updateVideoPresentationControllerState__block_invoke_192;
        v16[3] = &unk_1E5116360;
        v21 = v10;
        v22 = v11;
        v23 = v9;
        v16[4] = self;
        v17 = v12;
        v18 = v13;
        v19 = v29;
        v20 = v30;
        v15 = v12;
        objc_msgSend(v14, "performChanges:", v16);

      }
    }
  }

}

- (void)_invalidateMusicDucking
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x400000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x400000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateMusicDucking]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 1247, CFSTR("invalidating %lu after it already has been updated"), 0x400000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 0x400000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateMusicDucking
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _BYTE v18[712];
  uint64_t v19;

  -[PXStoryClipLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExporting");
  v5 = objc_msgSend(v3, "isAsync");
  -[PXStoryClipLayout clip](self, "clip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "info");

    if (((v4 | v5) & 1) == 0 && v19 == 3)
    {
      v8 = -[PXStoryClipLayout isPlayheadInAudioTimeRange](self, "isPlayheadInAudioTimeRange");
      v12 = 0;
      v13 = &v12;
      v14 = 0x3032000000;
      v15 = __Block_byref_object_copy__2659;
      v16 = __Block_byref_object_dispose__2660;
      -[PXStoryClipLayout musicDuckingToken](self, "musicDuckingToken");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v9 = v13[5];
      if (v8)
      {
        if (!v9)
        {
          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __40__PXStoryClipLayout__updateMusicDucking__block_invoke;
          v11[3] = &unk_1E5142E50;
          v11[4] = self;
          objc_msgSend(v3, "performChanges:", v11);
        }
      }
      else if (v9)
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __40__PXStoryClipLayout__updateMusicDucking__block_invoke_2;
        v10[3] = &unk_1E5127198;
        v10[4] = self;
        v10[5] = &v12;
        objc_msgSend(v3, "performChanges:", v10);
      }
      _Block_object_dispose(&v12, 8);

    }
  }
  else
  {
    bzero(v18, 0x300uLL);
  }

}

- (void)_invalidateColorGradeKind
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateColorGradeKind]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 1274, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 2;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateColorGradeKind
{
  int64_t resourceKind;
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  resourceKind = self->_resourceKind;
  if ((unint64_t)(resourceKind - 2) >= 3)
  {
    if (resourceKind != 5 && resourceKind != 1)
    {
      v4 = 0;
      goto LABEL_14;
    }
    -[PXStoryClipLayout overrideStyleInfo](self, "overrideStyleInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v4 = objc_msgSend(v6, "customColorGradeKind");
      if (v4)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(v7, "originalColorGradeCategory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryClipLayout model](self, "model");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "colorGradingRepository");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v10, "colorGradeKindForColorGradeCategory:", v8);

    }
    else
    {
      -[PXStoryClipLayout model](self, "model");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v8, "colorGradeKind");
    }

    goto LABEL_13;
  }
  v4 = 1;
LABEL_14:
  -[PXStoryClipLayout setColorGradeKind:](self, "setColorGradeKind:", v4);
}

- (void)_invalidateColorNormalizationEffect
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x8000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x8000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateColorNormalizationEffect]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 1307, CFSTR("invalidating %lu after it already has been updated"), 0x8000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 0x8000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateColorNormalizationEffect
{
  void *v4;
  unint64_t v5;
  PXStoryColorNormalizationAdjustment *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  float v43;
  void *v44;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((self->_resourceKind | 4) == 5
    && -[PXStoryClipLayout canShowColorNormalizedContent](self, "canShowColorNormalizedContent"))
  {
    v5 = objc_msgSend(v4, "colorNormalizationMode");
  }
  else
  {
    v5 = 0;
  }
  if (-[PXStoryClipLayout _effectiveColorGradeKind](self, "_effectiveColorGradeKind") == 1
    && !objc_msgSend(v4, "enableColorNormalizationWithoutColorGrade"))
  {
    v5 = 0;
  }
  if (!objc_msgSend(v4, "colorNormalizationTechnique"))
  {
    if (v5)
    {
      if (v5 != 2)
      {
        if (v5 != 4)
        {
          objc_msgSend(v4, "setColorNormalizationMode:", 2);
          objc_msgSend(v4, "save");
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v5 > 4)
            v46 = CFSTR("??");
          else
            v46 = off_1E511DE98[v5];
          v47 = v46;
          objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayout.m"), 1353, CFSTR("%@ is not supported with PXStoryNormalizationTechniqueFragmentShaderLUT, resetting."), v47);

          abort();
        }
        +[PXStoryColorNormalizationAdjustment dummyNormalization](PXStoryColorNormalizationAdjustment, "dummyNormalization");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      -[PXStoryClipLayout clip](self, "clip");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "colorNormalization");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
LABEL_27:
        v24 = objc_opt_class();
        -[PXStoryClipLayout colorNormalizationEffect](self, "colorNormalizationEffect");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXStoryClipLayout _effectWithClass:reusableInstance:](self, "_effectWithClass:reusableInstance:", v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "assetNormalization");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 == v27)
          v28 = 0;
        else
          v28 = objc_msgSend(v7, "isEqual:", v27) ^ 1;

        objc_msgSend(v26, "setAssetNormalization:", v7);
        objc_msgSend(v4, "colorNormalizationIntensity");
        objc_msgSend(v26, "setIntensity:");

        v6 = 0;
        goto LABEL_42;
      }
      -[PXStoryClipLayout displayAsset](self, "displayAsset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PXStoryErrorCreateWithCodeDebugFormat(23, CFSTR("Missing color normalization data for asset %@"), v13, v14, v15, v16, v17, v18, (uint64_t)v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      PLStoryGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        PXStoryErrorDetailsDescription(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v21;
        _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "PXStoryClipLayout error: %{public}@", buf, 0xCu);

      }
      if (objc_msgSend(v4, "reportColorNormalizationErrors"))
      {
        -[PXStoryClipLayout model](self, "model");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorReporter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setError:forComponent:", v19, CFSTR("ColorNormalization"));

      }
    }
    v7 = 0;
    goto LABEL_27;
  }
  if (!v5)
  {
    v6 = 0;
    goto LABEL_39;
  }
  if (v5 != 4)
  {
    -[PXStoryClipLayout clip](self, "clip");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorNormalization");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (v5 != 3)
      {
        v6 = -[PXStoryColorNormalizationAdjustment initWithNormalization:]([PXStoryColorNormalizationAdjustment alloc], "initWithNormalization:", v9);
LABEL_38:

        goto LABEL_39;
      }
    }
    else
    {
      -[PXStoryClipLayout displayAsset](self, "displayAsset");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "uuid");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      PXStoryErrorCreateWithCodeDebugFormat(23, CFSTR("Missing color normalization data for asset %@"), v31, v32, v33, v34, v35, v36, (uint64_t)v30);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      PLStoryGetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        PXStoryErrorDetailsDescription(v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v39;
        _os_log_impl(&dword_1A6789000, v38, OS_LOG_TYPE_ERROR, "PXStoryClipLayout error: %{public}@", buf, 0xCu);

      }
      if (objc_msgSend(v4, "reportColorNormalizationErrors"))
      {
        -[PXStoryClipLayout model](self, "model");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "errorReporter");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setError:forComponent:", v37, CFSTR("ColorNormalization"));

      }
      if (v5 == 2)
      {
        v6 = 0;
        goto LABEL_38;
      }
    }
    -[PXStoryClipLayout displayAsset](self, "displayAsset");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXStoryColorNormalizationAdjustment autoAdjustmentForAsset:](PXStoryColorNormalizationAdjustment, "autoAdjustmentForAsset:", v42);
    v6 = (PXStoryColorNormalizationAdjustment *)objc_claimAutoreleasedReturnValue();

    goto LABEL_38;
  }
  +[PXStoryColorNormalizationAdjustment dummyAdjustment](PXStoryColorNormalizationAdjustment, "dummyAdjustment");
  v6 = (PXStoryColorNormalizationAdjustment *)objc_claimAutoreleasedReturnValue();
LABEL_39:
  if (objc_msgSend(v4, "colorNormalizationUseColorCube"))
    -[PXStoryColorNormalizationAdjustment setUseColorCube:](v6, "setUseColorCube:", 1);
  objc_msgSend(v4, "colorNormalizationIntensity");
  -[PXStoryColorNormalizationAdjustment setIntensity:](v6, "setIntensity:", v43);
  v28 = 0;
  v26 = 0;
LABEL_42:
  -[PXStoryClipLayout colorNormalizationEffect](self, "colorNormalizationEffect");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26 == v44)
  {
    if (v28)
      -[PXStoryClipLayout _invalidateCombinedEffect](self, "_invalidateCombinedEffect");
  }
  else
  {
    -[PXStoryClipLayout setColorNormalizationEffect:](self, "setColorNormalizationEffect:", v26);
  }
  -[PXStoryClipLayout setColorNormalizationAdjustment:](self, "setColorNormalizationAdjustment:", v6);

}

- (void)_invalidateTextLegibilityEffect
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x10000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateTextLegibilityEffect]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 1412, CFSTR("invalidating %lu after it already has been updated"), 0x10000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 0x10000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateTextLegibilityEffect
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  double v10;
  _BYTE v11[768];

  v3 = objc_opt_class();
  -[PXStoryClipLayout textLegibilityEffect](self, "textLegibilityEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryClipLayout _effectWithClass:reusableInstance:](self, "_effectWithClass:reusableInstance:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryClipLayout clip](self, "clip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "info");
    v8 = (v11[32] >> 3) & 1;
  }
  else
  {
    bzero(v11, 0x300uLL);
    v8 = 0;
  }

  v9 = -[PXStoryClipLayout canShowTextLegibilityEffect](self, "canShowTextLegibilityEffect");
  v10 = 0.0;
  if ((v9 & v8) != 0)
    v10 = 1.0;
  objc_msgSend(v5, "setAlpha:", v10);
  -[PXStoryClipLayout setTextLegibilityEffect:](self, "setTextLegibilityEffect:", v5);

}

- (void)_invalidateInactiveImageFilterAdjustment
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x4000000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x4000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateInactiveImageFilterAdjustment]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 1423, CFSTR("invalidating %lu after it already has been updated"), 0x4000000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 0x4000000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateInactiveImageAdjustment
{
  void *v3;
  void *v4;
  char IsEmpty;
  void *v6;
  PXStoryInactiveImageAdjustment *v7;

  -[PXStoryClipLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "shouldUseInactiveImageFilter") || self->_resourceKind != 1)
    goto LABEL_8;
  -[PXStoryClipLayout model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "viewMode") != 1)
  {

LABEL_8:
    goto LABEL_9;
  }
  -[PXGLayout contentSize](self, "contentSize");
  IsEmpty = PXSizeIsEmpty();

  if ((IsEmpty & 1) != 0)
  {
LABEL_9:
    -[PXStoryClipLayout setInactiveImageFilterAdjustment:](self, "setInactiveImageFilterAdjustment:", 0);
    return;
  }
  -[PXStoryClipLayout inactiveImageFilterAdjustment](self, "inactiveImageFilterAdjustment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(PXStoryInactiveImageAdjustment);
    -[PXStoryClipLayout setInactiveImageFilterAdjustment:](self, "setInactiveImageFilterAdjustment:", v7);

  }
}

- (void)_invalidateSmartGradientAdjustment
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x80000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x80000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateSmartGradientAdjustment]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 1444, CFSTR("invalidating %lu after it already has been updated"), 0x80000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 0x80000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateSmartGradientAdjustment
{
  void *v3;
  unint64_t v4;
  PXStorySmartGradientAdjustment *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[568];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[16];

  -[PXStoryClipLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "viewMode");

  -[PXGLayout contentSize](self, "contentSize");
  v5 = 0;
  if (v4 <= 5 && ((1 << v4) & 0x32) != 0)
  {
    if (self->_resourceKind == 5 && (PXSizeIsEmpty() & 1) == 0)
    {
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_alloc_init(PXStorySmartGradientAdjustment);
      -[PXStoryClipLayout clip](self, "clip");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
        objc_msgSend(v7, "info");
      else
        bzero(v23, 0x300uLL);
      objc_msgSend(v6, "backgroundQualityScale");
      PXSizeScale();
      -[PXStorySmartGradientAdjustment setTargetSize:](v5, "setTargetSize:");

      v21 = 0u;
      v22 = 0u;
      -[PXStoryClipLayout clip](self, "clip");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        objc_msgSend(v9, "info");
      else
        bzero(v15, 0x300uLL);
      v18 = *(_OWORD *)&v15[552];
      v19 = v16;
      v20 = v17;
      PXStoryRectDecompose();

      PXRectFlippedVertically();
      *(_QWORD *)&v21 = v11;
      *((_QWORD *)&v21 + 1) = v12;
      *(_QWORD *)&v22 = v13;
      *((_QWORD *)&v22 + 1) = v14;
      -[PXStorySmartGradientAdjustment setNormalizedSourceRect:](v5, "setNormalizedSourceRect:");
      -[PXStorySmartGradientAdjustment setUseSmartColor:](v5, "setUseSmartColor:", objc_msgSend(v6, "smartGradientUseSmartColor"));
      -[PXStorySmartGradientAdjustment setUseSimpleBlur:](v5, "setUseSimpleBlur:", objc_msgSend(v6, "smartGradientUseSimpleBlur"));
      objc_msgSend(v6, "smartGradientBlurRadius");
      -[PXStorySmartGradientAdjustment setSimpleBlurRadius:](v5, "setSimpleBlurRadius:");
      objc_msgSend(v6, "smartGradientExposureValue");
      -[PXStorySmartGradientAdjustment setSimpleBlurExposure:](v5, "setSimpleBlurExposure:");
      -[PXStorySmartGradientAdjustment setSimpleBlurRepeatEdges:](v5, "setSimpleBlurRepeatEdges:", objc_msgSend(v6, "smartGradientRepeatEdges"));
      objc_msgSend(v6, "smartGradientEdgeStretchFactor");
      -[PXStorySmartGradientAdjustment setSimpleBlurEdgeStretch:](v5, "setSimpleBlurEdgeStretch:");

    }
    else
    {
      v5 = 0;
    }
  }
  -[PXStoryClipLayout setSmartGradientAdjustment:](self, "setSmartGradientAdjustment:", v5);

}

- (void)_invalidateColorGradingEffect
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateColorGradingEffect]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 1486, CFSTR("invalidating %lu after it already has been updated"), 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 4;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (int64_t)_effectiveColorGradeKind
{
  int64_t v3;
  int64_t v4;
  void *v5;
  int v6;

  if (-[PXStoryClipLayout customColorGradeKind](self, "customColorGradeKind"))
    v3 = -[PXStoryClipLayout customColorGradeKind](self, "customColorGradeKind");
  else
    v3 = -[PXStoryClipLayout colorGradeKind](self, "colorGradeKind");
  v4 = v3;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "disableColorGrading");

  if (v6)
    return 1;
  else
    return v4;
}

- (void)_updateColorGradingEffect
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  void *v11;
  id v12;

  v3 = -[PXStoryClipLayout _effectiveColorGradeKind](self, "_effectiveColorGradeKind");
  -[PXStoryClipLayout model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorGradingRepository");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorLookupCubeForColorGradeKind:", v3);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_class();
  -[PXStoryClipLayout colorGradingEffect](self, "colorGradingEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryClipLayout _effectWithClass:reusableInstance:](self, "_effectWithClass:reusableInstance:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "colorLookupCube");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 == v9)
    v10 = 1;
  else
    v10 = objc_msgSend(v12, "isEqual:", v9);

  objc_msgSend(v8, "setColorLookupCube:", v12);
  -[PXStoryClipLayout colorGradingEffect](self, "colorGradingEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v11)
  {
    if ((v10 & 1) == 0)
      -[PXStoryClipLayout _invalidateCombinedEffect](self, "_invalidateCombinedEffect");
  }
  else
  {
    -[PXStoryClipLayout setColorGradingEffect:](self, "setColorGradingEffect:", v8);
  }

}

- (void)_invalidateDisplayAsset
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x20000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateDisplayAsset]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 1514, CFSTR("invalidating %lu after it already has been updated"), 0x20000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 0x20000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateDisplayAsset
{
  void *v3;
  id v4;

  if ((self->_resourceKind | 4) == 5)
  {
    -[PXStoryClipLayout resource](self, "resource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_storyResourceDisplayAsset");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  -[PXStoryClipLayout setDisplayAsset:](self, "setDisplayAsset:", v4);

}

- (void)_invalidateShouldAutoplay
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x40000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x40000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateShouldAutoplay]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 1528, CFSTR("invalidating %lu after it already has been updated"), 0x40000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 0x40000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateShouldAutoplay
{
  void *v3;
  _OWORD v4[3];
  __int128 v5;
  __int128 v6;
  __int128 v7;

  -[PXStoryClipLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryClipLayout setShouldAutoplay:](self, "setShouldAutoplay:", objc_msgSend(v3, "shouldAutoplayThumbnail"));
  if (v3)
  {
    objc_msgSend(v3, "thumbnailAutoplayTimeRange");
  }
  else
  {
    v6 = 0u;
    v7 = 0u;
    v5 = 0u;
  }
  v4[0] = v5;
  v4[1] = v6;
  v4[2] = v7;
  -[PXStoryClipLayout setAutoplayTimeRange:](self, "setAutoplayTimeRange:", v4);

}

- (void)_invalidateEdgeMaskEffects
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x100;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x100) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateEdgeMaskEffects]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 1538, CFSTR("invalidating %lu after it already has been updated"), 256);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 256;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateEdgeMaskEffects
{
  void *v3;
  uint64_t v4;
  double v5;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double x;
  double y;
  double width;
  double height;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  CGRect v54;

  if (!self->_isFeedThumbnail)
  {
    -[PXStoryClipLayout clippingAnimation](self, "clippingAnimation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryClipLayout contentEdgeInsets](self, "contentEdgeInsets");
    v4 = 0;
    if (INFINITY == 0.0)
    {
      if (v3)
      {
        objc_msgSend(v3, "currentEdgeInsets");
        v4 = v53;
      }
      else
      {
        v4 = 0;
      }
    }
    -[PXStoryClipLayout manualContentsRectAmount](self, "manualContentsRectAmount", v4);
    PXFloatByLinearlyInterpolatingFloats();
    v47 = v5;
    PXFloatByLinearlyInterpolatingFloats();
    v45 = v6;
    PXFloatByLinearlyInterpolatingFloats();
    v8 = v7;
    PXFloatByLinearlyInterpolatingFloats();
    v50 = v9;
    PXFloatByLinearlyInterpolatingFloats();
    v48 = v10;
    PXFloatByLinearlyInterpolatingFloats();
    v46 = v11;
    PXFloatByLinearlyInterpolatingFloats();
    v13 = v12;
    PXFloatByLinearlyInterpolatingFloats();
    v51 = v14;
    PXFloatByLinearlyInterpolatingFloats();
    v49 = v15;
    PXFloatByLinearlyInterpolatingFloats();
    v17 = v16;
    PXFloatByLinearlyInterpolatingFloats();
    v19 = v18;
    PXFloatByLinearlyInterpolatingFloats();
    v52 = v20;
    -[PXStoryClipLayout contentBounds](self, "contentBounds");
    x = v54.origin.x;
    y = v54.origin.y;
    width = v54.size.width;
    height = v54.size.height;
    if (CGRectIsNull(v54)
      || !-[PXStoryClipLayout useContentBoundsForContentEdgeInsets](self, "useContentBoundsForContentEdgeInsets"))
    {
      -[PXGLayout contentSize](self, "contentSize");
      PXRectWithOriginAndSize();
      x = v25;
      y = v26;
      width = v27;
      height = v28;
    }
    -[PXStoryClipLayout topEdgeMaskEffect](self, "topEdgeMaskEffect");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryClipLayout _maskEffectForEdge:tiltedInset:bounds:reusableInstance:](self, "_maskEffectForEdge:tiltedInset:bounds:reusableInstance:", 1, v29, v47, v45, v8, x, y, width, height);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryClipLayout setTopEdgeMaskEffect:](self, "setTopEdgeMaskEffect:", v30);

    -[PXStoryClipLayout leftEdgeMaskEffect](self, "leftEdgeMaskEffect");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryClipLayout _maskEffectForEdge:tiltedInset:bounds:reusableInstance:](self, "_maskEffectForEdge:tiltedInset:bounds:reusableInstance:", 0, v31, v50, v48, v46, x, y, width, height);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryClipLayout setLeftEdgeMaskEffect:](self, "setLeftEdgeMaskEffect:", v32);

    -[PXStoryClipLayout bottomEdgeMaskEffect](self, "bottomEdgeMaskEffect");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryClipLayout _maskEffectForEdge:tiltedInset:bounds:reusableInstance:](self, "_maskEffectForEdge:tiltedInset:bounds:reusableInstance:", 3, v33, v13, v51, v49, x, y, width, height);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryClipLayout setBottomEdgeMaskEffect:](self, "setBottomEdgeMaskEffect:", v34);

    -[PXStoryClipLayout rightEdgeMaskEffect](self, "rightEdgeMaskEffect");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryClipLayout _maskEffectForEdge:tiltedInset:bounds:reusableInstance:](self, "_maskEffectForEdge:tiltedInset:bounds:reusableInstance:", 2, v35, v17, v19, v52, x, y, width, height);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryClipLayout setRightEdgeMaskEffect:](self, "setRightEdgeMaskEffect:", v36);

    if (self->_resourceKind == 3)
    {
      v37 = *((double *)off_1E50B8020 + 1);
      v38 = *((double *)off_1E50B8020 + 3);
    }
    else
    {
      -[PXStoryClipLayout clippingInsets](self, "clippingInsets");
      v37 = v39;
      v38 = v40;
    }
    -[PXStoryClipLayout leftEdgeClippingMaskEffect](self, "leftEdgeClippingMaskEffect");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryClipLayout _maskEffectForEdge:tiltedInset:bounds:reusableInstance:](self, "_maskEffectForEdge:tiltedInset:bounds:reusableInstance:", 0, v41, v37, 0.0, 0.0, x, y, width, height);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryClipLayout setLeftEdgeClippingMaskEffect:](self, "setLeftEdgeClippingMaskEffect:", v42);

    -[PXStoryClipLayout rightEdgeClippingMaskEffect](self, "rightEdgeClippingMaskEffect");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryClipLayout _maskEffectForEdge:tiltedInset:bounds:reusableInstance:](self, "_maskEffectForEdge:tiltedInset:bounds:reusableInstance:", 2, v43, v38, 0.0, 0.0, x, y, width, height);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryClipLayout setRightEdgeClippingMaskEffect:](self, "setRightEdgeClippingMaskEffect:", v44);

  }
}

- (id)_maskEffectForEdge:(unsigned int)a3 tiltedInset:(id)a4 bounds:(CGRect)a5 reusableInstance:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  double var2;
  double var1;
  double var0;
  uint64_t v13;
  id v15;
  void *v16;
  void *v17;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  v13 = *(_QWORD *)&a3;
  v15 = a6;
  -[PXStoryClipLayout _effectWithClass:reusableInstance:](self, "_effectWithClass:reusableInstance:", objc_opt_class(), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (var0 == 0.0 && var1 == 0.0 && var2 == 0.0)
    v17 = 0;
  else
    v17 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B3778), "initWithEdge:tiltedInset:rect:", v13, var0, var1, var2, x, y, width, height);
  objc_msgSend(v16, "setRegion:", v17);

  return v16;
}

- (void)_invalidateCombinedEffect
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x200;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x200) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateCombinedEffect]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 1579, CFSTR("invalidating %lu after it already has been updated"), 512);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 512;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateCombinedEffect
{
  void *v3;
  id v4;
  void (**v5)(void *, void *);
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
  _QWORD aBlock[4];
  id v17;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__PXStoryClipLayout__updateCombinedEffect__block_invoke;
  aBlock[3] = &unk_1E5116388;
  v4 = v3;
  v17 = v4;
  v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[PXStoryClipLayout colorNormalizationEffect](self, "colorNormalizationEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6);

  -[PXStoryClipLayout colorGradingEffect](self, "colorGradingEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v7);

  -[PXStoryClipLayout textLegibilityEffect](self, "textLegibilityEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v8);

  -[PXStoryClipLayout topEdgeMaskEffect](self, "topEdgeMaskEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v9);

  -[PXStoryClipLayout leftEdgeMaskEffect](self, "leftEdgeMaskEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v10);

  -[PXStoryClipLayout bottomEdgeMaskEffect](self, "bottomEdgeMaskEffect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v11);

  -[PXStoryClipLayout rightEdgeMaskEffect](self, "rightEdgeMaskEffect");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v12);

  -[PXStoryClipLayout leftEdgeClippingMaskEffect](self, "leftEdgeClippingMaskEffect");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v13);

  -[PXStoryClipLayout rightEdgeClippingMaskEffect](self, "rightEdgeClippingMaskEffect");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v14);

  if (objc_msgSend(v4, "count"))
    v15 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B28D0), "initWithEffects:", v4);
  else
    v15 = 0;
  -[PXStoryClipLayout setCombinedEffect:](self, "setCombinedEffect:", v15);

}

- (void)_invalidateContentVersion
{
  ++self->_contentVersion;
  -[PXStoryClipLayout _invalidateTextResourceSpriteFrame](self, "_invalidateTextResourceSpriteFrame");
  -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
}

- (void)_invalidateContent
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x10;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 1615, CFSTR("invalidating %lu after it already has been updated"), 16);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 16;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)setContentBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentBounds;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentBounds = &self->_contentBounds;
  if (!CGRectEqualToRect(self->_contentBounds, a3))
  {
    p_contentBounds->origin.x = x;
    p_contentBounds->origin.y = y;
    p_contentBounds->size.width = width;
    p_contentBounds->size.height = height;
    -[PXStoryClipLayout _invalidateTextResourceSpriteFrame](self, "_invalidateTextResourceSpriteFrame");
    -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setUseContentBoundsForContentEdgeInsets:(BOOL)a3
{
  if (self->_useContentBoundsForContentEdgeInsets != a3)
  {
    self->_useContentBoundsForContentEdgeInsets = a3;
    -[PXStoryClipLayout _invalidateEdgeMaskEffects](self, "_invalidateEdgeMaskEffects");
  }
}

- (void)_invalidateTextResourceSpriteFrame
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x1000000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x1000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateTextResourceSpriteFrame]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 1636, CFSTR("invalidating %lu after it already has been updated"), 0x1000000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 0x1000000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateTextResourceSpriteFrame
{
  void *v4;
  void *v5;
  void *v6;
  double x;
  double y;
  double width;
  double height;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  char v30;
  double v31;
  double v32;
  char v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  id v45;
  id v46;
  void (**v47)(_QWORD);
  _BOOL4 IsEmpty;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  _QWORD block[4];
  id v59;
  id v60;
  void (**v61)(_QWORD);
  id v62;
  id location;
  _QWORD aBlock[4];
  id v65;
  id v66;
  id v67;
  _QWORD *v68;
  _QWORD *v69;
  uint64_t *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  unint64_t v75;
  double v76;
  _QWORD v77[4];
  id v78;
  PXStoryClipLayout *v79;
  id v80;
  _QWORD *v81;
  _QWORD *v82;
  _QWORD *v83;
  _QWORD *v84;
  uint64_t *v85;
  SEL v86;
  char v87[48];
  _QWORD v88[3];
  char v89;
  _QWORD v90[3];
  char v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  _QWORD v98[4];
  __int128 v99;
  __int128 v100;
  _QWORD v101[5];
  id v102;
  CGRect v103;
  CGRect v104;

  if (self->_resourceKind == 3)
  {
    -[PXStoryClipLayout currentTextResourceInfo](self, "currentTextResourceInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryClipLayout setCurrentTextResourceInfo:](self, "setCurrentTextResourceInfo:", v4);
    -[PXStoryClipLayout model](self, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeline");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout contentSize](self, "contentSize");
    -[PXStoryClipLayout contentBounds](self, "contentBounds");
    x = v103.origin.x;
    y = v103.origin.y;
    width = v103.size.width;
    height = v103.size.height;
    if (CGRectIsNull(v103))
    {
      PXRectWithOriginAndSize();
      x = v11;
      y = v12;
      width = v13;
      height = v14;
    }
    v101[0] = 0;
    v101[1] = v101;
    v101[2] = 0x3032000000;
    v101[3] = __Block_byref_object_copy__2659;
    v101[4] = __Block_byref_object_dispose__2660;
    v102 = 0;
    v98[0] = 0;
    v98[1] = v98;
    v98[2] = 0x4010000000;
    v98[3] = &unk_1A7E74EE7;
    v99 = 0u;
    v100 = 0u;
    v92 = 0;
    v93 = &v92;
    v94 = 0x3032000000;
    v95 = __Block_byref_object_copy__2659;
    v96 = __Block_byref_object_dispose__2660;
    v97 = 0;
    v90[0] = 0;
    v90[1] = v90;
    v90[2] = 0x2020000000;
    v91 = 0;
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x2020000000;
    v89 = 0;
    -[PXStoryClipLayout clipTimeRange](self, "clipTimeRange");
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke;
    v77[3] = &unk_1E51163B0;
    v81 = v98;
    v15 = v6;
    v78 = v15;
    v79 = self;
    v82 = v101;
    v83 = v90;
    v86 = a2;
    v84 = v88;
    v16 = v4;
    v80 = v16;
    v85 = &v92;
    objc_msgSend(v15, "enumerateClipsInTimeRange:rect:usingBlock:", v87, v77, x, y, width, height);
    -[PXGLayout referenceSize](self, "referenceSize");
    v18 = v17;
    v20 = v19;
    -[PXStoryClipLayout displayedTimelineOriginalSize](self, "displayedTimelineOriginalSize");
    v22 = v21;
    v24 = v23;
    v25 = objc_msgSend(v5, "thumbnailStyle");
    if (v18 >= v22)
      v26 = v20;
    else
      v26 = v24;
    if (v18 >= v22)
      v27 = v18;
    else
      v27 = v22;
    if ((unint64_t)(v25 - 5) < 0xFFFFFFFFFFFFFFFDLL)
    {
      height = v26;
      width = v27;
    }
    v28 = (void *)v93[5];
    -[PXStoryClipLayout relativeTextResourceInfo](self, "relativeTextResourceInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    -[PXStoryClipLayout textResourceContentSize](self, "textResourceContentSize");
    if (v31 == width)
    {
      -[PXStoryClipLayout textResourceContentSize](self, "textResourceContentSize");
      if (v32 == height)
      {
        v33 = -[PXStoryClipLayout textResourceContentVersion](self, "textResourceContentVersion") == self->_contentVersion
            ? v30
            : 0;
        if ((v33 & 1) != 0)
          goto LABEL_35;
      }
    }
    objc_msgSend(v5, "titleCategory");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[PXStoryClipLayout _titleKind](self, "_titleKind");
    objc_msgSend(v5, "extendedTraitCollection");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "snapshot");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "layoutSpec");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v16, "layoutScheme");
    v39 = MEMORY[0x1E0C809B0];
    if (v38 == 1)
    {
      objc_msgSend(v57, "distanceBetweenChapterTitleBaselineAndBottomWithoutChrome");
    }
    else
    {
      if (v35 != 8 && v35 != 4)
      {
        v41 = 0.0;
        if (v35 == 1)
        {
          objc_msgSend(v57, "scrubberVerticalPadding");
          v43 = v42;
          objc_msgSend(v57, "scrubberCurrentAssetSize");
          v41 = v43 + v44;
        }
        goto LABEL_26;
      }
      objc_msgSend(v57, "bottomTitleContentOffset");
    }
    v41 = v40;
LABEL_26:
    aBlock[0] = v39;
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke_2;
    aBlock[3] = &unk_1E51163D8;
    v65 = v16;
    v71 = x;
    v72 = y;
    v73 = width;
    v74 = height;
    v45 = v34;
    v66 = v45;
    v68 = v101;
    v75 = v35;
    v69 = v98;
    v70 = &v92;
    v46 = v37;
    v67 = v46;
    v76 = v41;
    v47 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[PXStoryClipLayout textResourceSpriteFrame](self, "textResourceSpriteFrame");
    IsEmpty = CGRectIsEmpty(v104);
    if ((v25 & 0xFFFFFFFFFFFFFFFBLL) == 1 && IsEmpty)
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "storyQueue");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v16;
      v52 = v15;
      if (_updateTextResourceSpriteFrame_onceToken != -1)
        dispatch_once(&_updateTextResourceSpriteFrame_onceToken, &__block_literal_global_2662);
      objc_initWeak(&location, self);
      v53 = _updateTextResourceSpriteFrame_workQueue;
      block[0] = v39;
      block[1] = 3221225472;
      block[2] = __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke_4;
      block[3] = &unk_1E5147230;
      v54 = v50;
      v59 = v54;
      v60 = v51;
      v61 = v47;
      v55 = v51;
      objc_copyWeak(&v62, &location);
      dispatch_async(v53, block);
      objc_destroyWeak(&v62);

      objc_destroyWeak(&location);
      v15 = v52;
      v16 = v56;
    }
    else
    {
      v47[2](v47);
      -[PXStoryClipLayout setTextResourceSpriteFrame:](self, "setTextResourceSpriteFrame:");
      v54 = 0;
    }
    -[PXStoryClipLayout setTextFrameProgress:](self, "setTextFrameProgress:", v54, v56);
    -[PXStoryClipLayout setTextResourceContentSize:](self, "setTextResourceContentSize:", width, height);
    -[PXStoryClipLayout setTextResourceContentVersion:](self, "setTextResourceContentVersion:", self->_contentVersion);
    -[PXStoryClipLayout setRelativeTextResourceInfo:](self, "setRelativeTextResourceInfo:", v93[5]);

LABEL_35:
    _Block_object_dispose(v88, 8);
    _Block_object_dispose(v90, 8);
    _Block_object_dispose(&v92, 8);

    _Block_object_dispose(v98, 8);
    _Block_object_dispose(v101, 8);

  }
}

- (void)_invalidateModelPresentedTextProperties
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x2000000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x2000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateModelPresentedTextProperties]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 1761, CFSTR("invalidating %lu after it already has been updated"), 0x2000000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 0x2000000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateModelPresentedTextProperties
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  -[PXStoryClipLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isExporting") & 1) == 0 && (objc_msgSend(v3, "isAsync") & 1) == 0)
  {
    -[PXStoryClipLayout currentTextResourceInfo](self, "currentTextResourceInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (self->_resourceKind == 3 && (!objc_msgSend(v4, "type") || objc_msgSend(v5, "type") == 1))
    {
      objc_msgSend(v5, "boundingRectPadding");
      PXEdgeInsetsMakeAll();
      -[PXStoryClipLayout textResourceSpriteFrame](self, "textResourceSpriteFrame");
      PXEdgeInsetsInsetRect();
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      -[PXGLayout rootLayout](self, "rootLayout");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "coordinateSpace");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B2338), "initWithRect:inCoordinateSpace:", v15, v7, v9, v11, v13);
      -[PXStoryClipLayout model](self, "model");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __56__PXStoryClipLayout__updateModelPresentedTextProperties__block_invoke;
      v19[3] = &unk_1E51337A8;
      v20 = v5;
      v21 = v16;
      v18 = v16;
      objc_msgSend(v17, "performChanges:", v19);

    }
  }

}

- (void)_updateContent
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[8];

  -[PXGLayout contentSize](self, "contentSize");
  v5 = v4;
  v7 = v6;
  v8 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__PXStoryClipLayout__updateContent__block_invoke;
  v9[3] = &unk_1E5116448;
  v9[4] = self;
  v9[5] = v5;
  v9[6] = v7;
  v9[7] = a2;
  -[PXGLayout modifySpritesInRange:fullState:](self, "modifySpritesInRange:fullState:", v8 << 32, v9);
  -[PXStoryClipLayout _invalidateContentStyle](self, "_invalidateContentStyle");
  -[PXStoryClipLayout _invalidateHUD](self, "_invalidateHUD");
}

- (void)_invalidateSegmentIdentifiers
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateSegmentIdentifiers]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 2012, CFSTR("invalidating %lu after it already has been updated"), 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 32;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateSegmentIdentifiers
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _BYTE v9[48];

  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[PXStoryClipLayout model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryClipLayout clipTimeRange](self, "clipTimeRange");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PXStoryClipLayout__updateSegmentIdentifiers__block_invoke;
  v7[3] = &unk_1E5116470;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "enumerateSegmentsInTimeRange:usingBlock:", v9, v7);

  -[PXStoryClipLayout setSegmentIdentifiers:](self, "setSegmentIdentifiers:", v6);
}

- (void)_invalidateIsSegmentVisible
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x40;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x40) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateIsSegmentVisible]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 2026, CFSTR("invalidating %lu after it already has been updated"), 64);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 64;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateIsSegmentVisible
{
  void *v3;
  void *v4;
  id v5;

  -[PXStoryClipLayout model](self, "model");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleSegmentIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryClipLayout segmentIdentifiers](self, "segmentIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryClipLayout setIsSegmentVisible:](self, "setIsSegmentVisible:", objc_msgSend(v3, "px_intersectsWithIndexSet:", v4));

}

- (void)_invalidateOffsetFromCurrentSegment
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x800000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x800000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateOffsetFromCurrentSegment]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 2034, CFSTR("invalidating %lu after it already has been updated"), 0x800000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 0x800000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateOffsetFromCurrentSegment
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[PXStoryClipLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeline");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PXStoryClipLayout model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "indexOfSegmentWithIdentifier:", objc_msgSend(v4, "currentSegmentIdentifier"));

  -[PXStoryClipLayout segmentIdentifiers](self, "segmentIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "indexOfSegmentWithIdentifier:", objc_msgSend(v6, "firstIndex"));

  -[PXStoryClipLayout setOffsetFromCurrentSegment:](self, "setOffsetFromCurrentSegment:", v7 - v5);
}

- (void)_invalidatePlayheadState
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x100000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x100000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidatePlayheadState]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 2045, CFSTR("invalidating %lu after it already has been updated"), 0x100000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 0x100000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updatePlayheadState
{
  double v3;

  -[PXStoryClipLayout clipTimeRange](self, "clipTimeRange");
  LODWORD(v3) = 0;
  -[PXStoryClipLayout setIsPlayheadInVideoTimeRange:isPlayheadInAudioTimeRange:wasPlayheadMovedManually:currentAudioVolume:](self, "setIsPlayheadInVideoTimeRange:isPlayheadInAudioTimeRange:wasPlayheadMovedManually:currentAudioVolume:", 0, 0, 0, v3);
}

- (void)_invalidateAnimations
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x80;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x80) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateAnimations]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 2126, CFSTR("invalidating %lu after it already has been updated"), 128);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 128;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateAnimations
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  char v14;
  uint8_t buf[16];

  -[PXStoryClipLayout clip](self, "clip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryClipLayout animationController](self, "animationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_resourceKind == 1)
  {
    v6 = -[PXStoryClipLayout canShowDynamicContent](self, "canShowDynamicContent");
    if (v6)
    {
      v7 = -[PXStoryClipLayout isSegmentVisible](self, "isSegmentVisible");
      LOBYTE(v6) = 0;
      if (v7)
      {
        if (v3)
        {
          v6 = objc_msgSend(v5, "wantsAnimations");
          if (v6)
          {
            if (!v4)
            {
              PXAssertGetLog();
              v8 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "missing animation controller", buf, 2u);
              }

              LOBYTE(v6) = 1;
            }
          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__PXStoryClipLayout__updateAnimations__block_invoke;
  v11[3] = &unk_1E5116510;
  v14 = v6;
  v11[4] = self;
  v12 = v3;
  v13 = v5;
  v9 = v5;
  v10 = v3;
  objc_msgSend(v4, "performChanges:", v11);

}

- (void)_invalidateContentMode
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x200000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x200000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateContentMode]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 2218, CFSTR("invalidating %lu after it already has been updated"), 0x200000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 0x200000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateContentMode
{
  _BOOL8 v3;
  id v4;

  if (-[PXStoryClipLayout isSegmentVisible](self, "isSegmentVisible"))
  {
    -[PXStoryClipLayout model](self, "model");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "shouldAspectFitCurrentSegment"))
      v3 = -[PXStoryClipLayout canAspectFitContent](self, "canAspectFitContent");
    else
      v3 = 0;
    -[PXStoryClipLayout setShouldAspectFitContent:](self, "setShouldAspectFitContent:", v3);

  }
  else
  {
    -[PXStoryClipLayout setShouldAspectFitContent:](self, "setShouldAspectFitContent:", 0);
  }
}

- (void)_invalidateContentStyle
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x400;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x400) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateContentStyle]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 2226, CFSTR("invalidating %lu after it already has been updated"), 1024);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1024;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateContentStyle
{
  void *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[3];
  _OWORD v28[3];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  int v36;
  int v37;
  int v38;
  int v39;
  _OWORD v40[6];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;

  -[PXStoryClipLayout kenBurnsAnimation](self, "kenBurnsAnimation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryClipLayout cornerRadius](self, "cornerRadius");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PXStoryClipLayout clip](self, "clip");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v23 = *((_OWORD *)off_1E50B8908 + 1);
  v25 = *(_OWORD *)off_1E50B8908;
  v50 = *(_OWORD *)off_1E50B8908;
  v51 = v23;
  v21 = *((_OWORD *)off_1E50B8908 + 2);
  v52 = v21;
  if (v3)
  {
    objc_msgSend(v3, "currentRect");
  }
  else if (v12 && self->_resourceKind == 1)
  {
    if (-[PXStoryClipLayout disableClippingAnimation](self, "disableClippingAnimation"))
    {
      objc_msgSend(v13, "resource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "px_storyResourceDisplayAsset");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXGLayout referenceSize](self, "referenceSize");
      PXSizeGetAspectRatio();
      objc_msgSend(v20, "bestCropRectForAspectRatio:");
      PXStoryRectFromCGRect();

    }
    else
    {
      objc_msgSend(v13, "info");
      v50 = v47;
      v51 = v48;
      v52 = v49;
    }
  }
  -[PXStoryClipLayout manualContentsRect](self, "manualContentsRect", v21, v23, v25);
  PXStoryRectFromCGRect();
  -[PXStoryClipLayout manualContentsRectAmount](self, "manualContentsRectAmount");
  v41 = v50;
  v42 = v51;
  v43 = v52;
  PXStoryRectLinearlyInterpolatingRects();
  -[PXStoryClipLayout contentsRectTransform](self, "contentsRectTransform");
  PXRectGetCenter();
  memset(&v40[3], 0, 48);
  PXStoryRectFromStoryRectApplyingTransformWithAnchorPoint();
  v44 = v50;
  v45 = v51;
  v46 = v52;
  if (-[PXStoryClipLayout shouldAspectFitContent](self, "shouldAspectFitContent"))
  {
    v44 = v26;
    v45 = v24;
    v46 = v22;
  }
  v40[0] = v44;
  v40[1] = v45;
  v40[2] = v46;
  -[PXStoryClipLayout setPreferredPresentedContentsRect:](self, "setPreferredPresentedContentsRect:", v40);
  v14 = *(_OWORD *)&self->_contentsRectOverride.t.c;
  v41 = *(_OWORD *)&self->_contentsRectOverride.t.a;
  v42 = v14;
  v43 = *(_OWORD *)&self->_contentsRectOverride.t.tx;
  if ((PXStoryRectIsNull() & 1) == 0)
  {
    v15 = *(_OWORD *)&self->_contentsRectOverride.t.c;
    v44 = *(_OWORD *)&self->_contentsRectOverride.t.a;
    v45 = v15;
    v46 = *(_OWORD *)&self->_contentsRectOverride.t.tx;
  }
  v16 = self->_contentSpriteIndex | 0x100000000;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __40__PXStoryClipLayout__updateContentStyle__block_invoke;
  v32[3] = &unk_1E5116538;
  v36 = v5;
  v37 = v7;
  v38 = v9;
  v39 = v11;
  v32[4] = self;
  v33 = v44;
  v34 = v45;
  v35 = v46;
  -[PXGLayout modifySpritesInRange:fullState:](self, "modifySpritesInRange:fullState:", v16, v32);
  -[PXGLayout contentSize](self, "contentSize");
  -[PXStoryClipLayout setPresentedKenBurnsAnimationContentSize:](self, "setPresentedKenBurnsAnimationContentSize:");
  if (-[PXStoryClipLayout isSegmentVisible](self, "isSegmentVisible"))
  {
    v29 = v50;
    v30 = v51;
    v17 = v52;
  }
  else
  {
    v18 = *((_OWORD *)off_1E50B88F0 + 1);
    v29 = *(_OWORD *)off_1E50B88F0;
    v30 = v18;
    v17 = *((_OWORD *)off_1E50B88F0 + 2);
  }
  v31 = v17;
  v28[0] = v29;
  v28[1] = v30;
  v28[2] = v17;
  -[PXStoryClipLayout setPresentedKenBurnsAnimationCurrentRect:](self, "setPresentedKenBurnsAnimationCurrentRect:", v28);
  v27[0] = v44;
  v27[1] = v45;
  v27[2] = v46;
  -[PXStoryClipLayout setPresentedContentsRect:](self, "setPresentedContentsRect:", v27);

}

- (void)setContentsRectTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_contentsRectTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform t1;

  p_contentsRectTransform = &self->_contentsRectTransform;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v7 = *(_OWORD *)&self->_contentsRectTransform.c;
  *(_OWORD *)&v10.a = *(_OWORD *)&self->_contentsRectTransform.a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&self->_contentsRectTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_contentsRectTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_contentsRectTransform->tx = v9;
    *(_OWORD *)&p_contentsRectTransform->a = v8;
    -[PXStoryClipLayout _invalidateContentStyle](self, "_invalidateContentStyle");
  }
}

- (void)setContentScale:(float)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_contentScale = a3;
    -[PXStoryClipLayout _invalidateContentStyle](self, "_invalidateContentStyle");
  }
}

- (void)setContentEdgeInsets:(id *)a3
{
  BOOL v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  if (self->_contentEdgeInsets.top.preRotationInset != a3->var0.var0
    || self->_contentEdgeInsets.top.rotationAngle != a3->var0.var1
    || self->_contentEdgeInsets.top.postRotationInset != a3->var0.var2)
  {
    goto LABEL_34;
  }
  v5 = self->_contentEdgeInsets.left.preRotationInset == a3->var1.var0
    && self->_contentEdgeInsets.left.rotationAngle == a3->var1.var1;
  v6 = v5 && self->_contentEdgeInsets.left.postRotationInset == a3->var1.var2;
  v7 = v6 && self->_contentEdgeInsets.bottom.preRotationInset == a3->var2.var0;
  v8 = v7 && self->_contentEdgeInsets.bottom.rotationAngle == a3->var2.var1;
  v9 = v8 && self->_contentEdgeInsets.bottom.postRotationInset == a3->var2.var2;
  v10 = v9 && self->_contentEdgeInsets.right.preRotationInset == a3->var3.var0;
  v11 = v10 && self->_contentEdgeInsets.right.rotationAngle == a3->var3.var1;
  if (!v11 || self->_contentEdgeInsets.right.postRotationInset != a3->var3.var2)
  {
LABEL_34:
    v13 = *(_OWORD *)&a3->var0.var2;
    *(_OWORD *)&self->_contentEdgeInsets.top.preRotationInset = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&self->_contentEdgeInsets.top.postRotationInset = v13;
    v14 = *(_OWORD *)&a3->var1.var1;
    v15 = *(_OWORD *)&a3->var2.var0;
    v16 = *(_OWORD *)&a3->var3.var1;
    *(_OWORD *)&self->_contentEdgeInsets.bottom.postRotationInset = *(_OWORD *)&a3->var2.var2;
    *(_OWORD *)&self->_contentEdgeInsets.right.rotationAngle = v16;
    *(_OWORD *)&self->_contentEdgeInsets.left.rotationAngle = v14;
    *(_OWORD *)&self->_contentEdgeInsets.bottom.preRotationInset = v15;
    -[PXStoryClipLayout _invalidateEdgeMaskEffects](self, "_invalidateEdgeMaskEffects");
  }
}

- (void)setPrimaryDividerBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_primaryDividerBounds;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_primaryDividerBounds = &self->_primaryDividerBounds;
  if (!CGRectEqualToRect(self->_primaryDividerBounds, a3))
  {
    p_primaryDividerBounds->origin.x = x;
    p_primaryDividerBounds->origin.y = y;
    p_primaryDividerBounds->size.width = width;
    p_primaryDividerBounds->size.height = height;
    -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setSecondaryDividerBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_secondaryDividerBounds;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_secondaryDividerBounds = &self->_secondaryDividerBounds;
  if (!CGRectEqualToRect(self->_secondaryDividerBounds, a3))
  {
    p_secondaryDividerBounds->origin.x = x;
    p_secondaryDividerBounds->origin.y = y;
    p_secondaryDividerBounds->size.width = width;
    p_secondaryDividerBounds->size.height = height;
    -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setPrimaryDividerScale:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGSize *p_primaryDividerScale;

  height = a3.height;
  width = a3.width;
  p_primaryDividerScale = &self->_primaryDividerScale;
  if ((PXSizeApproximatelyEqualToSize() & 1) == 0)
  {
    p_primaryDividerScale->width = width;
    p_primaryDividerScale->height = height;
    -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setSecondaryDividerScale:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGSize *p_secondaryDividerScale;

  height = a3.height;
  width = a3.width;
  p_secondaryDividerScale = &self->_secondaryDividerScale;
  if ((PXSizeApproximatelyEqualToSize() & 1) == 0)
  {
    p_secondaryDividerScale->width = width;
    p_secondaryDividerScale->height = height;
    -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setPrimaryDividerAlpha:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_primaryDividerAlpha = a3;
    -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setSecondaryDividerAlpha:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_secondaryDividerAlpha = a3;
    -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)_invalidateWantsHUD
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x800;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x800) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateWantsHUD]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 2347, CFSTR("invalidating %lu after it already has been updated"), 2048);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 2048;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateWantsHUD
{
  unint64_t v3;
  uint64_t v4;
  id v5;

  -[PXStoryClipLayout model](self, "model");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PXStoryClipLayout canShowHUD](self, "canShowHUD")
    && objc_msgSend(v5, "isHUDVisible")
    && self->_resourceKind == 1)
  {
    v3 = objc_msgSend(v5, "diagnosticHUDType");
    if (v3 <= 0x13)
      v4 = (0xC4000u >> v3) & 1;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  -[PXStoryClipLayout setWantsHUD:](self, "setWantsHUD:", v4);

}

- (void)_invalidateHUD
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  ++self->_HUDContentVersion;
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x1000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x1000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryClipLayout _invalidateHUD]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryClipLayout.m"), 2369, CFSTR("invalidating %lu after it already has been updated"), 4096);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 4096;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateHUD
{
  uint64_t diagnosticHUDSpriteIndex;
  _QWORD v3[5];

  diagnosticHUDSpriteIndex = self->_diagnosticHUDSpriteIndex;
  if ((_DWORD)diagnosticHUDSpriteIndex != -1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __31__PXStoryClipLayout__updateHUD__block_invoke;
    v3[3] = &unk_1E5127210;
    v3[4] = self;
    -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", diagnosticHUDSpriteIndex | 0x100000000, v3);
  }
}

- (unint64_t)_titleKind
{
  void *v3;
  unint64_t v4;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  int v15;

  -[PXStoryClipLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "thumbnailStyle") == 2)
  {
    v4 = 32;
  }
  else if (objc_msgSend(v3, "thumbnailStyle") == 3 || objc_msgSend(v3, "thumbnailStyle") == 4)
  {
    v4 = 64;
  }
  else if (objc_msgSend(v3, "thumbnailStyle") == 5)
  {
    v4 = 16;
  }
  else if (objc_msgSend(v3, "thumbnailStyle") == 1)
  {
    -[PXGLayout referenceSize](self, "referenceSize");
    v8 = v6 / v7;
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "feedCardWideLandscapeAspectRatio");
    v11 = v10 + -0.001;

    if (v8 <= v11)
      v4 = 4;
    else
      v4 = 8;
  }
  else if (objc_msgSend(v3, "viewMode") == 5 || objc_msgSend(v3, "options") == 1)
  {
    -[PXGLayout referenceSize](self, "referenceSize");
    if (v12 == v13)
      v4 = 256;
    else
      v4 = 128;
    if (objc_msgSend(v3, "prefersExportLayoutMatchesPlayback"))
      v4 = 512;
  }
  else
  {
    objc_msgSend(v3, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isPresentedForAirPlay");

    if (v15)
      v4 = 1024;
    else
      v4 = 1;
  }

  return v4;
}

- (PXStoryHUDViewConfiguration)HUDConfiguration
{
  PXStoryHUDViewConfiguration *HUDConfiguration;
  PXStoryHUDViewConfiguration *v4;
  PXStoryHUDViewConfiguration *v5;
  void *v6;

  HUDConfiguration = self->_HUDConfiguration;
  if (!HUDConfiguration)
  {
    v4 = objc_alloc_init(PXStoryHUDViewConfiguration);
    v5 = self->_HUDConfiguration;
    self->_HUDConfiguration = v4;

    -[PXStoryHUDViewConfiguration setTextRelativePosition:](self->_HUDConfiguration, "setTextRelativePosition:", 0.5, 0.5);
    objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryHUDViewConfiguration setTintColor:](self->_HUDConfiguration, "setTintColor:", v6);

    HUDConfiguration = self->_HUDConfiguration;
  }
  return HUDConfiguration;
}

- (id)_textForHUD
{
  void *v3;
  void *v4;

  if (-[PXStoryClipLayout wantsHUD](self, "wantsHUD"))
  {
    -[PXStoryClipLayout model](self, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryClipLayout diagnosticTextForHUDType:displaySize:](self, "diagnosticTextForHUDType:displaySize:", objc_msgSend(v3, "diagnosticHUDType"), 1920.0, 1080.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (CGRect)_normalizeRect:(CGRect)a3 coordinateSystem:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect v8;
  CGRect result;

  -[PXStoryClipLayout _referenceRectForNormalizedCoordinateSystem:](self, "_referenceRectForNormalizedCoordinateSystem:", a4);
  if (CGRectIsNull(v8))
  {
    v4 = *MEMORY[0x1E0C9D628];
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    PXRectNormalize();
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_denormalizeRect:(CGRect)a3 coordinateSystem:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect v8;
  CGRect result;

  -[PXStoryClipLayout _referenceRectForNormalizedCoordinateSystem:](self, "_referenceRectForNormalizedCoordinateSystem:", a4);
  if (CGRectIsNull(v8))
  {
    v4 = *MEMORY[0x1E0C9D628];
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    PXRectDenormalize();
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_referenceRectForNormalizedCoordinateSystem:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int16 v23[8];
  uint8_t buf[16];
  CGRect result;

  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  switch(a3)
  {
    case 2:
      -[PXStoryClipLayout timelineLayout](self, "timelineLayout");
      v9 = objc_claimAutoreleasedReturnValue();
      v8 = v9;
      if (v9)
      {
        -[NSObject contentSize](v9, "contentSize");
        PXRectWithOriginAndSize();
        -[PXGLayout convertRect:fromLayout:](self, "convertRect:fromLayout:", v8);
        v4 = v10;
        v5 = v11;
        v6 = v12;
        v7 = v13;
      }
      else
      {
        PXAssertGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          v23[0] = 0;
          _os_log_fault_impl(&dword_1A6789000, v18, OS_LOG_TYPE_FAULT, "missing timeline layout", (uint8_t *)v23, 2u);
        }

      }
      goto LABEL_12;
    case 1:
      -[PXGLayout contentSize](self, "contentSize");
      PXRectWithOriginAndSize();
      v4 = v14;
      v5 = v15;
      v6 = v16;
      v7 = v17;
      break;
    case 0:
      PXAssertGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1A6789000, v8, OS_LOG_TYPE_FAULT, "undefined normalized coordinate system", buf, 2u);
      }
LABEL_12:

      break;
  }
  v19 = v4;
  v20 = v5;
  v21 = v6;
  v22 = v7;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)_validateVideoPlaybackState
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[PXStoryClipLayout videoPresentationController](self, "videoPresentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "desiredPlayState") == 1 && objc_msgSend(v2, "actualPlayState") != 2)
  {
    PXAssertGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v2, "diagnosticDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_fault_impl(&dword_1A6789000, v3, OS_LOG_TYPE_FAULT, "[VideoPlayback] Video playback didn't start in time: %@", (uint8_t *)&v5, 0xCu);

    }
  }

}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  uint64_t v18;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
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
  int v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  int v62;
  uint64_t v63;
  void *v64;
  void *v65;
  int v66;
  const __CFString *v67;
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  const __CFString *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  __CFString *v83;
  __CFString *v84;
  __CFString *v85;
  __CFString *v86;
  int v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  void *v94;
  _BYTE v95[712];
  unint64_t v96;
  unint64_t v97;
  float v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  CMTime v103;
  uint64_t v104;
  int v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  int v110;
  uint64_t v111;
  __int128 v112[3];
  __int128 v113;
  uint64_t v114;
  uint64_t v115;
  int v116;
  int v117;
  uint64_t v118;
  _OWORD v119[3];
  _BYTE v120[40];
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128[7];
  CMTime v129;
  CMTime v130;
  _BYTE v131[552];
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _BYTE v138[64];

  if (!-[PXStoryClipLayout canShowHUD](self, "canShowHUD", a4.width, a4.height) || self->_resourceKind != 1)
    return 0;
  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PXStoryClipLayout model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryClipLayout displayAsset](self, "displayAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 18)
  {
    -[PXGLayout referenceSize](self, "referenceSize");
    v21 = v20;
    v23 = v22;
    objc_msgSend(v7, "timeline");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "originalSize");
    v26 = v25;
    v28 = v27;

    PXSizeDescription();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Clip Size: %@\n"), v29);

    PXSizeDescription();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Timeline Original Size: %@\n"), v30);

    objc_msgSend(v6, "appendFormat:", CFSTR("Scale: %3.0f%% x %3.0f%%\n"), v21 / v26 * 100.0, v23 / v28 * 100.0);
    if (v8)
    {
      -[PXStoryClipLayout clip](self, "clip");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
        objc_msgSend(v31, "info");
      else
        bzero(v131, 0x300uLL);
      v135 = v132;
      v136 = v133;
      v137 = v134;
      PXStoryRectDescription();
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("Source Contents Rect: %@\n"), v89);

      -[PXStoryClipLayout presentedContentsRect](self, "presentedContentsRect");
      PXStoryRectDescription();
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("Presented Contents Rect: %@\n"), v90);

      -[PXStoryClipLayout presentedContentsRect](self, "presentedContentsRect");
      objc_msgSend(v8, "pixelWidth");
      objc_msgSend(v8, "pixelHeight");
      PXRectWithOriginAndSize();
      PXStoryRectFromCGRect();
      PXStoryRectDenormalize();
      PXStoryRectDescription();
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("Visible Asset Rect: %@\n"), v91);

    }
    v88 = (void *)objc_msgSend(v6, "copy");
    goto LABEL_65;
  }
  if (a3 == 19)
  {
    if (-[PXStoryClipLayout isSegmentVisible](self, "isSegmentVisible"))
      v9 = CFSTR("Y");
    else
      v9 = CFSTR("N");
    objc_msgSend(v6, "appendFormat:", CFSTR("Segment Visible: %@\n"), v9);
    v10 = -[PXStoryClipLayout shouldAutoplay](self, "shouldAutoplay");
    v11 = CFSTR("⏸");
    if (v10)
      v11 = CFSTR("✅");
    objc_msgSend(v6, "appendFormat:", CFSTR("Autoplay: %@\n"), v11);
    -[PXStoryClipLayout autoplayTimeRange](self, "autoplayTimeRange");
    PXStoryTimeRangeDescription((uint64_t)v138);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Time Range: %@\n"), v12);

    objc_msgSend(v8, "playbackStyle");
    PXDisplayAssetPlaybackStyleDescription();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Asset Playback Style: %@\n"), v13);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v8;
      objc_msgSend(v14, "highlightVisibilityScore");
      objc_msgSend(v6, "appendFormat:", CFSTR("Asset Highlight Visibility Score: %0.2f\n"), v15);
      objc_msgSend(v14, "overallAestheticScore");
      objc_msgSend(v6, "appendFormat:", CFSTR("Asset Overall Aesthetic Score: %0.2f\n"), v16);
      objc_msgSend(v14, "curationScore");
      v18 = v17;

      objc_msgSend(v6, "appendFormat:", CFSTR("Asset Curation Score: %0.2f\n"), v18);
    }
  }
  else
  {
    -[PXStoryClipLayout clip](self, "clip");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Clip ID: %li\n"), objc_msgSend(v33, "identifier"));

    -[PXStoryClipLayout segmentIdentifiers](self, "segmentIdentifiers");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "px_shortDescription");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Segment ID: %@\n"), v35);

    if (-[PXStoryClipLayout isSegmentVisible](self, "isSegmentVisible"))
      v36 = CFSTR("Y");
    else
      v36 = CFSTR("N");
    objc_msgSend(v6, "appendFormat:", CFSTR("Segment Visible: %@\n"), v36);
  }
  -[PXStoryClipLayout colorGradeKind](self, "colorGradeKind");
  PFStoryColorGradeKindToString();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("Color Grade Kind: %@\n"), v37);

  if (-[PXStoryClipLayout customColorGradeKind](self, "customColorGradeKind"))
  {
    -[PXStoryClipLayout customColorGradeKind](self, "customColorGradeKind");
    PFStoryColorGradeKindToString();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Custom Color Grade Kind: %@\n"), v38);

  }
  -[PXStoryClipLayout colorNormalizationAdjustment](self, "colorNormalizationAdjustment");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[PXStoryClipLayout colorNormalizationAdjustment](self, "colorNormalizationAdjustment");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "adjustmentSummary");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Color Normalization Adjustment: %@\n"), v41);

    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v41) = objc_msgSend(v42, "debugShowColorNormalizationValues");

    if (!(_DWORD)v41)
      goto LABEL_30;
    -[PXStoryClipLayout colorNormalizationAdjustment](self, "colorNormalizationAdjustment");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "adjustmentDetails");
    v44 = objc_claimAutoreleasedReturnValue();
LABEL_28:
    v48 = (void *)v44;
    objc_msgSend(v6, "appendFormat:", CFSTR("%@\n"), v44);

    goto LABEL_29;
  }
  -[PXStoryClipLayout colorNormalizationEffect](self, "colorNormalizationEffect");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "effectSummary");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("Color Normalization Effect: %@\n"), v46);

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v43, "debugShowColorNormalizationValues"))
  {
    -[PXStoryClipLayout colorNormalizationEffect](self, "colorNormalizationEffect");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v47)
      goto LABEL_30;
    -[PXStoryClipLayout colorNormalizationEffect](self, "colorNormalizationEffect");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "effectDetails");
    v44 = objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
LABEL_29:

LABEL_30:
  -[PXStoryClipLayout clipTimeRange](self, "clipTimeRange");
  v130 = v129;
  PXStoryTimeDescription(&v130);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("Clip duration: %@\n"), v49);

  -[PXStoryClipLayout clip](self, "clip");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v50)
    objc_msgSend(v50, "info");
  else
    bzero(v120, 0x300uLL);
  v128[4] = v125;
  v128[5] = v126;
  v128[6] = v127;
  v128[0] = v121;
  v128[1] = v122;
  v128[2] = v123;
  v128[3] = v124;
  PXStoryDurationInfoDescription(v128);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("AEDL duration: %@\n"), v52);

  -[PXStoryClipLayout videoPresentationController](self, "videoPresentationController");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v53)
    goto LABEL_61;
  v93 = v8;
  v94 = v7;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v54, "debugShowVideoPlaybackDetails");

  -[PXStoryClipLayout clip](self, "clip");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  PXStoryClipVideoSegmentTimeRange(v55, v119);
  PXStoryTimeRangeDescription((uint64_t)v119);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("Video Range: %@\n"), v56);

  -[PXStoryClipLayout clip](self, "clip");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryClipLayout clipTimeRange](self, "clipTimeRange");
  PXStoryClipSegmentPlaybackTimeRangeIncludingJLCuts(v57, v112, 1u, &v113);
  v58 = HIDWORD(v113);
  v59 = v114;
  v60 = v115;
  v61 = v116;
  v62 = v117;
  v63 = v118;

  if ((v58 & 1) != 0 && (v62 & 1) != 0 && !v63 && (v60 & 0x8000000000000000) == 0)
  {
    v104 = v113;
    v105 = DWORD2(v113);
    v106 = v58;
    v107 = v59;
    v108 = v60;
    v109 = v61;
    v110 = v62;
    v111 = 0;
    PXStoryTimeRangeDescription((uint64_t)&v104);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Playback Range: %@\n"), v64);

  }
  v8 = v93;
  v7 = v94;
  if (v92)
  {
    objc_msgSend(v53, "actualTime");
    PXStoryTimeDescription(&v103);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Current time: %@\n"), v65);

    v66 = objc_msgSend(v53, "isReadyForImmediatePlayback");
    v67 = CFSTR("NO");
    if (v66)
      v67 = CFSTR("YES");
    objc_msgSend(v6, "appendFormat:", CFSTR("prerolled: %@\n"), v67);
    v68 = objc_msgSend(v53, "desiredPlayState");
    v69 = CFSTR("▶︎");
    if (!v68)
      v69 = CFSTR("❚❚");
    objc_msgSend(v6, "appendFormat:", CFSTR("desired: %@\n"), v69);
    v70 = objc_msgSend(v53, "actualPlayState");
    if ((unint64_t)(v70 - 1) > 3)
      v71 = CFSTR("?");
    else
      v71 = off_1E5116580[v70 - 1];
    objc_msgSend(v6, "appendFormat:", CFSTR("actual: %@\n"), v71);
  }
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "debugShowAudioPlaybackDetails");

  -[PXStoryClipLayout clip](self, "clip");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v74)
  {
    bzero(v95, 0x300uLL);
    v76 = 0;
    v77 = 0;
    v82 = 0.0;
    v78 = 0;
    v79 = 0;
    v80 = 0;
    v81 = 0;
    goto LABEL_52;
  }
  v75 = v74;
  objc_msgSend(v74, "info");
  v76 = v96;
  v77 = v97;
  v78 = v99;
  v79 = v100;
  v80 = v101;
  v81 = v102;
  v82 = v98;

  if (v96 <= 3)
  {
LABEL_52:
    v83 = off_1E51361C0[v76];
    goto LABEL_53;
  }
  v83 = CFSTR("??");
LABEL_53:
  v84 = v83;
  if (v77 > 0xA)
    v85 = CFSTR("?");
  else
    v85 = off_1E51361E0[v77];
  v86 = v85;
  objc_msgSend(v6, "appendFormat:", CFSTR("Audio: %@ (%@)\n"), v84, v86);

  if (v76 > 1)
    v87 = v73;
  else
    v87 = 0;
  if (v87 == 1)
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("Volume: %0.2f\n"), *(_QWORD *)&v82);
    objc_msgSend(v6, "appendFormat:", CFSTR("J&L Cuts: %0.2f/%0.2f\n"), v78, v79);
    objc_msgSend(v6, "appendFormat:", CFSTR("Fade in/out: %0.2f/%0.2f\n"), v80, v81);
  }
LABEL_61:
  v88 = (void *)objc_msgSend(v6, "copy");

LABEL_65:
  return v88;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  return 0;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  void *v4;
  void *v5;

  -[PXStoryClipLayout displayAsset](self, "displayAsset", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PXDisplayAssetFetchResultFromAsset();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return self->_resourceKind != 5;
}

- (id)adjustmentForDisplayAsset:(id)a3 spriteIndex:(unsigned int)a4 inLayout:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  if (self->_resourceKind == 5)
  {
    -[PXStoryClipLayout smartGradientAdjustment](self, "smartGradientAdjustment");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXStoryClipLayout inactiveImageFilterAdjustment](self, "inactiveImageFilterAdjustment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[PXStoryClipLayout inactiveImageFilterAdjustment](self, "inactiveImageFilterAdjustment");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PXStoryClipLayout colorNormalizationAdjustment](self, "colorNormalizationAdjustment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v12 = 0;
        goto LABEL_8;
      }
      -[PXStoryClipLayout colorNormalizationAdjustment](self, "colorNormalizationAdjustment");
      v9 = objc_claimAutoreleasedReturnValue();
    }
  }
  v12 = (void *)v9;
LABEL_8:

  return v12;
}

- (unint64_t)presentationIntentForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  void *v4;
  unint64_t v5;

  -[PXStoryClipLayout model](self, "model", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isInline"))
    v5 = 5;
  else
    v5 = 4;

  return v5;
}

- (BOOL)useLowMemoryDecodeInLayout:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[PXStoryClipLayout model](self, "model", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useLowMemoryMode");

  return v5;
}

- (BOOL)shouldApplyCleanApertureCropToStillImagesInLayout:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[PXStoryClipLayout model](self, "model", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = ((unint64_t)objc_msgSend(v4, "options") >> 1) & 1;

  return v5;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  -[PXStoryClipLayout attributedStringForSpriteAtIndex:inLayout:](self, "attributedStringForSpriteAtIndex:inLayout:", *(_QWORD *)&a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_1E5149688;
  v7 = v5;

  return v7;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  PXStoryClipLayout *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v7 = (PXStoryClipLayout *)a4;
  if (self->_contentSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayout.m"), 2650, CFSTR("Invalid index!"));

  }
  if (v7 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayout.m"), 2651, CFSTR("Invalid layout!"));

  }
  -[PXStoryClipLayout currentTextResourceInfo](self, "currentTextResourceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  PXStoryClipLayout *v7;
  void *v8;
  int64_t v9;
  void *v11;
  void *v12;

  v7 = (PXStoryClipLayout *)a4;
  if (self->_contentSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayout.m"), 2656, CFSTR("Invalid index!"));

  }
  if (v7 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayout.m"), 2657, CFSTR("Invalid layout!"));

  }
  -[PXStoryClipLayout currentTextResourceInfo](self, "currentTextResourceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "verticalAlignment");

  return v9;
}

- (int64_t)stringDrawingOptionsForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  PXStoryClipLayout *v7;
  void *v8;
  int64_t v9;
  void *v11;
  void *v12;

  v7 = (PXStoryClipLayout *)a4;
  if (self->_contentSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayout.m"), 2662, CFSTR("Invalid index!"));

  }
  if (v7 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayout.m"), 2663, CFSTR("Invalid layout!"));

  }
  -[PXStoryClipLayout currentTextResourceInfo](self, "currentTextResourceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "drawingOptions");

  return v9;
}

- (UIEdgeInsets)paddingForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  PXStoryClipLayout *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  UIEdgeInsets result;

  v7 = (PXStoryClipLayout *)a4;
  if (self->_contentSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayout.m"), 2668, CFSTR("Invalid index!"));

  }
  if (v7 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayout.m"), 2669, CFSTR("Invalid layout!"));

  }
  -[PXStoryClipLayout currentTextResourceInfo](self, "currentTextResourceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "boundingRectPadding");

  PXEdgeInsetsMake();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (id)drawingContextForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  PXStoryClipLayout *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v7 = (PXStoryClipLayout *)a4;
  if (self->_contentSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayout.m"), 2675, CFSTR("Invalid index!"));

  }
  if (v7 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayout.m"), 2676, CFSTR("Invalid layout!"));

  }
  -[PXStoryClipLayout currentTextResourceInfo](self, "currentTextResourceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "drawingContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGSize)attributedStringBoundingSizeForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  PXStoryClipLayout *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  CGSize result;

  v7 = (PXStoryClipLayout *)a4;
  if (self->_contentSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayout.m"), 2681, CFSTR("Invalid index!"));

  }
  if (v7 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayout.m"), 2682, CFSTR("Invalid layout!"));

  }
  -[PXStoryClipLayout currentTextResourceInfo](self, "currentTextResourceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "drawingContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "totalBounds");
  v11 = v10;
  v13 = v12;

  v14 = ceil(v11);
  v15 = ceil(v13);
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v7 = a4;
  if (self->_contentSpriteIndex == a3)
  {
    -[PXStoryClipLayout resource](self, "resource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_storyResourceColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (self->_primaryDividerSpriteIndex != a3 && self->_secondaryDividerSpriteIndex != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayout.m"), 2697, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v7 = a4;
  if (self->_diagnosticHUDSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayout.m"), 2707, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  objc_opt_class();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v9;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a4;
  if (self->_diagnosticHUDSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayout.m"), 2717, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  -[PXStoryClipLayout HUDConfiguration](self, "HUDConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryClipLayout _textForHUD](self, "_textForHUD");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

  return v9;
}

- (id)axSpriteIndexes
{
  void *v3;
  int64_t resourceKind;
  id v6;

  -[PXStoryClipLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "viewMode") == 3)
  {
    resourceKind = self->_resourceKind;
    if (resourceKind == 3)
    {

      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", self->_contentSpriteIndex);
    }

    if (resourceKind == 1)
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", self->_contentSpriteIndex);
  }
  else
  {

  }
  v6 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  return v6;
}

- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3
{
  return 0;
}

- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4
{
  id v5;
  void (**v6)(void *, uint64_t);
  void *v7;
  _BOOL4 v8;
  void *v9;
  _QWORD v10[13];
  _QWORD aBlock[5];

  v5 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PXStoryClipLayout_getDetailedPresentedPlacement_forItemReference___block_invoke;
  aBlock[3] = &unk_1E5126890;
  aBlock[4] = self;
  v6 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  objc_msgSend(v5, "displayedAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXStoryClipLayout _isDisplayingContentOfAsset:](self, "_isDisplayingContentOfAsset:", v7);

  if (v8)
  {
    -[PXStoryClipLayout presentedContentsRect](self, "presentedContentsRect");
    *(_OWORD *)v10 = *(_OWORD *)&v10[7];
    *(_OWORD *)&v10[2] = *(_OWORD *)&v10[9];
    *(_OWORD *)&v10[4] = *(_OWORD *)&v10[11];
    objc_msgSend(v5, "setDisplayedAssetContentsRect:", v10);
    -[PXStoryClipLayout itemPlacementSourceIdentifier](self, "itemPlacementSourceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerSourceIdentifier:", v9);

    v6[2](v6, 2);
    objc_msgSend(v5, "setNormalizedDisplayedAssetRect:");
  }
  else if (-[PXStoryClipLayout isDisplayingTitle](self, "isDisplayingTitle"))
  {
    v6[2](v6, 1);
    objc_msgSend(v5, "setNormalizedTitleRect:");
  }
  else if (-[PXStoryClipLayout isDisplayingSubtitle](self, "isDisplayingSubtitle"))
  {
    v6[2](v6, 1);
    objc_msgSend(v5, "setNormalizedSubtitleRect:");
  }

}

- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4
{
  id v6;
  id v7;
  __int128 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _OWORD v25[3];
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v6 = a3;
  v7 = a4;
  v8 = *((_OWORD *)off_1E50B88F0 + 1);
  v27 = *(_OWORD *)off_1E50B88F0;
  v28 = v8;
  v29 = *((_OWORD *)off_1E50B88F0 + 2);
  v9 = *MEMORY[0x1E0C9D628];
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (!v6)
    goto LABEL_9;
  objc_msgSend(v6, "displayedAsset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PXStoryClipLayout _isDisplayingContentOfAsset:](self, "_isDisplayingContentOfAsset:", v13);

  if (!v14)
  {
    if (-[PXStoryClipLayout isDisplayingTitle](self, "isDisplayingTitle"))
    {
      objc_msgSend(v6, "normalizedTitleRect");
LABEL_8:
      v9 = v21;
      v10 = v22;
      v11 = v23;
      v12 = v24;
      v20 = 1;
      goto LABEL_10;
    }
    if (-[PXStoryClipLayout isDisplayingSubtitle](self, "isDisplayingSubtitle"))
    {
      objc_msgSend(v6, "normalizedSubtitleRect");
      goto LABEL_8;
    }
LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v6, "displayedAssetContentsRect");
  -[PXStoryClipLayout itemPlacementSourceIdentifier](self, "itemPlacementSourceIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __67__PXStoryClipLayout_setDetailedPlacementOverride_forItemReference___block_invoke;
  v26[3] = &unk_1E5135CC0;
  v26[4] = self;
  objc_msgSend(v6, "adjustPreferredPlacementInSourceWithIdentifier:configuration:", v15, v26);

  objc_msgSend(v6, "normalizedDisplayedAssetRect");
  v9 = v16;
  v10 = v17;
  v11 = v18;
  v12 = v19;
  v20 = 2;
LABEL_10:
  v25[0] = v27;
  v25[1] = v28;
  v25[2] = v29;
  -[PXStoryClipLayout setContentsRectOverride:](self, "setContentsRectOverride:", v25);
  -[PXStoryClipLayout setContentSpriteNormalizedFrameOverride:coordinateSystem:](self, "setContentSpriteNormalizedFrameOverride:coordinateSystem:", v20, v9, v10, v11, v12);

}

- (void)setDisplayedTimelineOriginalSize:(CGSize)a3
{
  if (a3.width != self->_displayedTimelineOriginalSize.width
    || a3.height != self->_displayedTimelineOriginalSize.height)
  {
    self->_displayedTimelineOriginalSize = a3;
    -[PXStoryClipLayout _invalidateTextResourceSpriteFrame](self, "_invalidateTextResourceSpriteFrame");
  }
}

- (id)itemPlacementSourceIdentifier
{
  void *v2;
  void *v3;

  -[PXStoryClipLayout model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  if ((void *)ModelObservationContext == a5)
  {
    if ((a4 & 0x400000000) != 0 || (a4 & 0x1001000000000000) != 0 && self->_resourceKind == 3)
      -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
    if ((a4 & 0x10000000) != 0)
      -[PXStoryClipLayout _invalidateVideoPresentationControllerState](self, "_invalidateVideoPresentationControllerState");
    if ((a4 & 0x4000080000000) != 0)
      -[PXStoryClipLayout _invalidateShouldAutoplay](self, "_invalidateShouldAutoplay");
    if ((a4 & 0x1000000000) != 0)
      -[PXStoryClipLayout _invalidateContentMode](self, "_invalidateContentMode");
    if ((a4 & 1) != 0)
    {
      -[PXStoryClipLayout model](self, "model");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isExporting");

      if (v10)
        -[PXStoryClipLayout _invalidateVideoPresentationControllerState](self, "_invalidateVideoPresentationControllerState");
    }
    if ((a4 & 0x20) != 0)
      -[PXStoryClipLayout _invalidateOffsetFromCurrentSegment](self, "_invalidateOffsetFromCurrentSegment");
    if ((a4 & 0x840000000) != 0)
      -[PXStoryClipLayout _invalidatePlayheadState](self, "_invalidatePlayheadState");
    if ((a4 & 0x200) != 0)
    {
      -[PXStoryClipLayout _invalidateColorGradeKind](self, "_invalidateColorGradeKind");
      if (self->_resourceKind == 3)
        -[PXStoryClipLayout _invalidateContentVersion](self, "_invalidateContentVersion");
    }
    if ((a4 & 0x10000) != 0)
      -[PXStoryClipLayout _invalidateSmartGradientAdjustment](self, "_invalidateSmartGradientAdjustment");
    if ((a4 & 0x10) != 0)
    {
      -[PXStoryClipLayout _invalidateSegmentIdentifiers](self, "_invalidateSegmentIdentifiers");
      -[PXStoryClipLayout _invalidateOffsetFromCurrentSegment](self, "_invalidateOffsetFromCurrentSegment");
      -[PXStoryClipLayout currentTextResourceInfo](self, "currentTextResourceInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "type");

      if (v12 == 1)
        -[PXStoryClipLayout _invalidateTextResourceSpriteFrame](self, "_invalidateTextResourceSpriteFrame");
    }
    if ((a4 & 0x40) != 0)
      -[PXStoryClipLayout _invalidateIsSegmentVisible](self, "_invalidateIsSegmentVisible");
    if ((a4 & 0x1800000) != 0)
      -[PXStoryClipLayout _invalidateWantsHUD](self, "_invalidateWantsHUD");
    if ((a4 & 0x40) != 0)
    {
      -[PXStoryClipLayout _invalidateHUD](self, "_invalidateHUD");
      if ((a4 & 0x80000000000000) == 0)
      {
LABEL_38:
        if ((a4 & 0x200000000000000) == 0)
          goto LABEL_39;
        goto LABEL_45;
      }
    }
    else if ((a4 & 0x80000000000000) == 0)
    {
      goto LABEL_38;
    }
    -[PXStoryClipLayout _invalidateTextResourceSpriteFrame](self, "_invalidateTextResourceSpriteFrame");
    -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
    if ((a4 & 0x200000000000000) == 0)
    {
LABEL_39:
      if ((a4 & 0x40000000000000) == 0)
        goto LABEL_49;
      goto LABEL_46;
    }
LABEL_45:
    -[PXStoryClipLayout _invalidatePlayheadState](self, "_invalidatePlayheadState");
    if ((a4 & 0x40000000000000) == 0)
      goto LABEL_49;
LABEL_46:
    -[PXStoryClipLayout _invalidateInactiveImageFilterAdjustment](self, "_invalidateInactiveImageFilterAdjustment");
    -[PXStoryClipLayout _invalidateContentVersion](self, "_invalidateContentVersion");
    goto LABEL_49;
  }
  if ((void *)ClippingAnimationObservationContext == a5)
  {
    if ((a4 & 4) != 0)
      -[PXStoryClipLayout _invalidateEdgeMaskEffects](self, "_invalidateEdgeMaskEffects");
  }
  else if ((void *)KenBurnsAnimationObservationContext == a5)
  {
    if ((a4 & 4) != 0)
      -[PXStoryClipLayout _invalidateContentStyle](self, "_invalidateContentStyle");
  }
  else
  {
    if ((void *)FocusHintTranslationAnimatorObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryClipLayout.m"), 2880, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((a4 & 2) != 0)
      -[PXStoryClipLayout _invalidateContent](self, "_invalidateContent");
  }
LABEL_49:

}

- (void)internationalStyleTitlePreferencesDidChange
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  PXStoryClipLayout *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_resourceKind != 3)
  {
    PXAssertGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[PXStoryClipLayout internationalStyleTitlePreferencesDidChange]";
      v6 = 2112;
      v7 = self;
      _os_log_error_impl(&dword_1A6789000, v3, OS_LOG_TYPE_ERROR, "%s is called unexpectedly on clip layout %@", (uint8_t *)&v4, 0x16u);
    }

  }
  -[PXStoryClipLayout _invalidateContentVersion](self, "_invalidateContentVersion");
}

- (PXStoryClip)clip
{
  return self->_clip;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)clipTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[33].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[32].var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[33].var0.var3;
  return self;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (PXStoryStyleDescriptor)overrideStyleInfo
{
  return self->_overrideStyleInfo;
}

- (PXGLayout)timelineLayout
{
  return (PXGLayout *)objc_loadWeakRetained((id *)&self->_timelineLayout);
}

- (void)setTimelineLayout:(id)a3
{
  objc_storeWeak((id *)&self->_timelineLayout, a3);
}

- (UIEdgeInsets)clippingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_clippingInsets.top;
  left = self->_clippingInsets.left;
  bottom = self->_clippingInsets.bottom;
  right = self->_clippingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)canShowDynamicContent
{
  return self->_canShowDynamicContent;
}

- (BOOL)canShowColorNormalizedContent
{
  return self->_canShowColorNormalizedContent;
}

- (BOOL)canShowTextLegibilityEffect
{
  return self->_canShowTextLegibilityEffect;
}

- (BOOL)canShowHUD
{
  return self->_canShowHUD;
}

- (BOOL)canAspectFitContent
{
  return self->_canAspectFitContent;
}

- (int64_t)customColorGradeKind
{
  return self->_customColorGradeKind;
}

- (double)manualContentsRectAmount
{
  return self->_manualContentsRectAmount;
}

- (CGRect)manualContentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_manualContentsRect.origin.x;
  y = self->_manualContentsRect.origin.y;
  width = self->_manualContentsRect.size.width;
  height = self->_manualContentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (BOOL)disableClippingAnimation
{
  return self->_disableClippingAnimation;
}

- (double)relativeZPositionAboveLegibilityGradients
{
  return self->_relativeZPositionAboveLegibilityGradients;
}

- (float)contentAlpha
{
  return self->_contentAlpha;
}

- (CGRect)contentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentBounds.origin.x;
  y = self->_contentBounds.origin.y;
  width = self->_contentBounds.size.width;
  height = self->_contentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)useContentBoundsForContentEdgeInsets
{
  return self->_useContentBoundsForContentEdgeInsets;
}

- (CGAffineTransform)contentsRectTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[34].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[33].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[34].c;
  return self;
}

- (float)contentScale
{
  return self->_contentScale;
}

- ($AFFB3261E48324223FE33B3CF9FC7872)contentEdgeInsets
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self[20].var1.var1;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[20].var0.var2;
  *(_OWORD *)&retstr->var2.var0 = v3;
  v4 = *(_OWORD *)&self[20].var2.var2;
  *(_OWORD *)&retstr->var2.var2 = *(_OWORD *)&self[20].var2.var0;
  *(_OWORD *)&retstr->var3.var1 = v4;
  v5 = *(_OWORD *)&self[20].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[19].var3.var1;
  *(_OWORD *)&retstr->var0.var2 = v5;
  return self;
}

- (CGRect)primaryDividerBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_primaryDividerBounds.origin.x;
  y = self->_primaryDividerBounds.origin.y;
  width = self->_primaryDividerBounds.size.width;
  height = self->_primaryDividerBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)primaryDividerScale
{
  double width;
  double height;
  CGSize result;

  width = self->_primaryDividerScale.width;
  height = self->_primaryDividerScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)primaryDividerAlpha
{
  return self->_primaryDividerAlpha;
}

- (CGRect)secondaryDividerBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_secondaryDividerBounds.origin.x;
  y = self->_secondaryDividerBounds.origin.y;
  width = self->_secondaryDividerBounds.size.width;
  height = self->_secondaryDividerBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)secondaryDividerScale
{
  double width;
  double height;
  CGSize result;

  width = self->_secondaryDividerScale.width;
  height = self->_secondaryDividerScale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)secondaryDividerAlpha
{
  return self->_secondaryDividerAlpha;
}

- (CGSize)displayedTimelineOriginalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_displayedTimelineOriginalSize.width;
  height = self->_displayedTimelineOriginalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)contentPrefersPresentationTypeView
{
  return self->_contentPrefersPresentationTypeView;
}

- (void)setContentPrefersPresentationTypeView:(BOOL)a3
{
  self->_contentPrefersPresentationTypeView = a3;
}

- (PXStoryResource)resource
{
  return self->_resource;
}

- (unint64_t)assetPresentationStyles
{
  return self->_assetPresentationStyles;
}

- (PXGDisplayAssetVideoPresentationController)videoPresentationController
{
  return self->_videoPresentationController;
}

- (int64_t)colorGradeKind
{
  return self->_colorGradeKind;
}

- (PXGColorGradingEffect)colorGradingEffect
{
  return self->_colorGradingEffect;
}

- (PXStoryColorNormalizationEffect)colorNormalizationEffect
{
  return self->_colorNormalizationEffect;
}

- (PXGTextLegibilityEffect)textLegibilityEffect
{
  return self->_textLegibilityEffect;
}

- (PXStoryColorNormalizationAdjustment)colorNormalizationAdjustment
{
  return self->_colorNormalizationAdjustment;
}

- (void)setColorNormalizationAdjustment:(id)a3
{
  objc_storeStrong((id *)&self->_colorNormalizationAdjustment, a3);
}

- (PXGRegionMaskEffect)topEdgeMaskEffect
{
  return self->_topEdgeMaskEffect;
}

- (PXGRegionMaskEffect)leftEdgeMaskEffect
{
  return self->_leftEdgeMaskEffect;
}

- (PXGRegionMaskEffect)bottomEdgeMaskEffect
{
  return self->_bottomEdgeMaskEffect;
}

- (PXGRegionMaskEffect)rightEdgeMaskEffect
{
  return self->_rightEdgeMaskEffect;
}

- (PXGRegionMaskEffect)leftEdgeClippingMaskEffect
{
  return self->_leftEdgeClippingMaskEffect;
}

- (PXGRegionMaskEffect)rightEdgeClippingMaskEffect
{
  return self->_rightEdgeClippingMaskEffect;
}

- (PXGCombinedEffect)combinedEffect
{
  return self->_combinedEffect;
}

- (PXStorySmartGradientAdjustment)smartGradientAdjustment
{
  return self->_smartGradientAdjustment;
}

- (void)setSmartGradientAdjustment:(id)a3
{
  objc_storeStrong((id *)&self->_smartGradientAdjustment, a3);
}

- (PXGDisplayAssetAdjustment)inactiveImageFilterAdjustment
{
  return self->_inactiveImageFilterAdjustment;
}

- (void)setInactiveImageFilterAdjustment:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveImageFilterAdjustment, a3);
}

- (NSIndexSet)segmentIdentifiers
{
  return self->_segmentIdentifiers;
}

- (BOOL)isSegmentVisible
{
  return self->_isSegmentVisible;
}

- (int64_t)offsetFromCurrentSegment
{
  return self->_offsetFromCurrentSegment;
}

- (BOOL)isPlayheadInVideoTimeRange
{
  return self->_isPlayheadInVideoTimeRange;
}

- (BOOL)isPlayheadInAudioTimeRange
{
  return self->_isPlayheadInAudioTimeRange;
}

- (BOOL)wasPlayheadMovedManually
{
  return self->_wasPlayheadMovedManually;
}

- (float)currentAudioVolume
{
  return self->_currentAudioVolume;
}

- (id)musicDuckingToken
{
  return self->_musicDuckingToken;
}

- (void)setMusicDuckingToken:(id)a3
{
  objc_storeStrong(&self->_musicDuckingToken, a3);
}

- (PXDisplayAsset)displayAsset
{
  return self->_displayAsset;
}

- (CGSize)presentedKenBurnsAnimationContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_presentedKenBurnsAnimationContentSize.width;
  height = self->_presentedKenBurnsAnimationContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPresentedKenBurnsAnimationContentSize:(CGSize)a3
{
  self->_presentedKenBurnsAnimationContentSize = a3;
}

- ($810C7C628FE0F9AC50A6216490AB88B8)presentedKenBurnsAnimationCurrentRect
{
  __int128 v3;

  v3 = *(_OWORD *)&self[35].var0.a;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[34].var0.tx;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tx = *(_OWORD *)&self[35].var0.c;
  return self;
}

- (void)setPresentedKenBurnsAnimationCurrentRect:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->var0.c;
  v3 = *(_OWORD *)&a3->var0.tx;
  *(_OWORD *)&self->_presentedKenBurnsAnimationCurrentRect.t.a = *(_OWORD *)&a3->var0.a;
  *(_OWORD *)&self->_presentedKenBurnsAnimationCurrentRect.t.c = v4;
  *(_OWORD *)&self->_presentedKenBurnsAnimationCurrentRect.t.tx = v3;
}

- ($810C7C628FE0F9AC50A6216490AB88B8)preferredPresentedContentsRect
{
  __int128 v3;

  v3 = *(_OWORD *)&self[36].var0.a;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[35].var0.tx;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tx = *(_OWORD *)&self[36].var0.c;
  return self;
}

- (void)setPreferredPresentedContentsRect:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->var0.c;
  v3 = *(_OWORD *)&a3->var0.tx;
  *(_OWORD *)&self->_preferredPresentedContentsRect.t.a = *(_OWORD *)&a3->var0.a;
  *(_OWORD *)&self->_preferredPresentedContentsRect.t.c = v4;
  *(_OWORD *)&self->_preferredPresentedContentsRect.t.tx = v3;
}

- ($810C7C628FE0F9AC50A6216490AB88B8)presentedContentsRect
{
  __int128 v3;

  v3 = *(_OWORD *)&self[37].var0.a;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[36].var0.tx;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tx = *(_OWORD *)&self[37].var0.c;
  return self;
}

- (void)setPresentedContentsRect:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->var0.c;
  v3 = *(_OWORD *)&a3->var0.tx;
  *(_OWORD *)&self->_presentedContentsRect.t.a = *(_OWORD *)&a3->var0.a;
  *(_OWORD *)&self->_presentedContentsRect.t.c = v4;
  *(_OWORD *)&self->_presentedContentsRect.t.tx = v3;
}

- ($810C7C628FE0F9AC50A6216490AB88B8)contentsRectOverride
{
  __int128 v3;

  v3 = *(_OWORD *)&self[38].var0.a;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[37].var0.tx;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tx = *(_OWORD *)&self[38].var0.c;
  return self;
}

- (CGRect)contentSpriteNormalizedFrameOverride
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentSpriteNormalizedFrameOverride.origin.x;
  y = self->_contentSpriteNormalizedFrameOverride.origin.y;
  width = self->_contentSpriteNormalizedFrameOverride.size.width;
  height = self->_contentSpriteNormalizedFrameOverride.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)contentSpriteNormalizedFrameOverrideCoordinateSystem
{
  return self->_contentSpriteNormalizedFrameOverrideCoordinateSystem;
}

- (BOOL)shouldAutoplay
{
  return self->_shouldAutoplay;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)autoplayTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[39].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[38].var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[39].var0.var3;
  return self;
}

- (BOOL)isReadyForAutoplay
{
  return self->_isReadyForAutoplay;
}

- (PXStoryTiltedEdgeInsetsAnimation)clippingAnimation
{
  return self->_clippingAnimation;
}

- (PXStoryRectAnimation)kenBurnsAnimation
{
  return self->_kenBurnsAnimation;
}

- (BOOL)wantsHUD
{
  return self->_wantsHUD;
}

- (NSTimer)HUDTimer
{
  return self->_HUDTimer;
}

- (BOOL)shouldAspectFitContent
{
  return self->_shouldAspectFitContent;
}

- (BOOL)shouldObserveInternationalStyleTitlePreferences
{
  return self->_shouldObserveInternationalStyleTitlePreferences;
}

- (PXStoryTextResourceInfo)currentTextResourceInfo
{
  return self->_currentTextResourceInfo;
}

- (PXStoryTextResourceInfo)relativeTextResourceInfo
{
  return self->_relativeTextResourceInfo;
}

- (void)setRelativeTextResourceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_relativeTextResourceInfo, a3);
}

- (CGRect)textResourceSpriteFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_textResourceSpriteFrame.origin.x;
  y = self->_textResourceSpriteFrame.origin.y;
  width = self->_textResourceSpriteFrame.size.width;
  height = self->_textResourceSpriteFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)textResourceContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_textResourceContentSize.width;
  height = self->_textResourceContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTextResourceContentSize:(CGSize)a3
{
  self->_textResourceContentSize = a3;
}

- (unsigned)textResourceContentVersion
{
  return self->_textResourceContentVersion;
}

- (void)setTextResourceContentVersion:(unsigned __int8)a3
{
  self->_textResourceContentVersion = a3;
}

- (NSProgress)textFrameProgress
{
  return self->_textFrameProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFrameProgress, 0);
  objc_storeStrong((id *)&self->_relativeTextResourceInfo, 0);
  objc_storeStrong((id *)&self->_currentTextResourceInfo, 0);
  objc_storeStrong((id *)&self->_HUDTimer, 0);
  objc_storeStrong((id *)&self->_kenBurnsAnimation, 0);
  objc_storeStrong((id *)&self->_clippingAnimation, 0);
  objc_storeStrong((id *)&self->_displayAsset, 0);
  objc_storeStrong(&self->_musicDuckingToken, 0);
  objc_storeStrong((id *)&self->_segmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_inactiveImageFilterAdjustment, 0);
  objc_storeStrong((id *)&self->_smartGradientAdjustment, 0);
  objc_storeStrong((id *)&self->_combinedEffect, 0);
  objc_storeStrong((id *)&self->_rightEdgeClippingMaskEffect, 0);
  objc_storeStrong((id *)&self->_leftEdgeClippingMaskEffect, 0);
  objc_storeStrong((id *)&self->_rightEdgeMaskEffect, 0);
  objc_storeStrong((id *)&self->_bottomEdgeMaskEffect, 0);
  objc_storeStrong((id *)&self->_leftEdgeMaskEffect, 0);
  objc_storeStrong((id *)&self->_topEdgeMaskEffect, 0);
  objc_storeStrong((id *)&self->_colorNormalizationAdjustment, 0);
  objc_storeStrong((id *)&self->_textLegibilityEffect, 0);
  objc_storeStrong((id *)&self->_colorNormalizationEffect, 0);
  objc_storeStrong((id *)&self->_colorGradingEffect, 0);
  objc_storeStrong((id *)&self->_videoPresentationController, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_destroyWeak((id *)&self->_timelineLayout);
  objc_storeStrong((id *)&self->_overrideStyleInfo, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_clip, 0);
  objc_storeStrong((id *)&self->_HUDConfiguration, 0);
}

void __67__PXStoryClipLayout_setDetailedPlacementOverride_forItemReference___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _OWORD v5[3];
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "preferredPresentedContentsRect");
  }
  else
  {
    v7 = 0u;
    v8 = 0u;
    v6 = 0u;
  }
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  objc_msgSend(v3, "setDisplayedAssetContentsRect:", v5);

}

double __68__PXStoryClipLayout_getDetailedPresentedPlacement_forItemReference___block_invoke(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  unsigned int *v3;
  uint64_t v4;
  double v5;
  _QWORD v7[7];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x4010000000;
  v11 = &unk_1A7E74EE7;
  v2 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v12 = *MEMORY[0x1E0C9D628];
  v13 = v2;
  v3 = *(unsigned int **)(a1 + 32);
  v4 = v3[218] | 0x100000000;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__PXStoryClipLayout_getDetailedPresentedPlacement_forItemReference___block_invoke_2;
  v7[3] = &unk_1E5116560;
  v7[4] = v3;
  v7[5] = &v8;
  v7[6] = a2;
  objc_msgSend(v3, "enumerateSpritesInRange:usingBlock:", v4, v7);
  v5 = v9[4];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __68__PXStoryClipLayout_getDetailedPresentedPlacement_forItemReference___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  PXRectWithCenterAndSize();
  result = objc_msgSend(*(id *)(a1 + 32), "_normalizeRect:coordinateSystem:", *(_QWORD *)(a1 + 48));
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

uint64_t __31__PXStoryClipLayout__updateHUD__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  uint64_t result;
  double v9;

  result = objc_msgSend(*(id *)(a1 + 32), "wantsHUD");
  LODWORD(v9) = 0;
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "alpha", v9);
    *(float *)&v9 = v9;
  }
  *a4 = LODWORD(v9);
  *(_WORD *)(a5 + 32) = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 912);
  return result;
}

void __40__PXStoryClipLayout__updateContentStyle__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  __int128 v7;
  double v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v5 = *(_QWORD *)(a3 + 24);
  *(_OWORD *)(v5 + 36) = *(_OWORD *)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 32), "contentScale");
  *(_DWORD *)(v5 + 60) = v6;
  v7 = *(_OWORD *)(a1 + 56);
  v14 = *(_OWORD *)(a1 + 40);
  v15 = v7;
  v16 = *(_OWORD *)(a1 + 72);
  *(float *)&v8 = PXGSpriteStyleSetPXStoryContentsRect(v5);
  v9 = **(_DWORD **)(a3 + 8);
  objc_msgSend(*(id *)(a1 + 32), "entityManager", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "effectComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__PXStoryClipLayout__updateContentStyle__block_invoke_2;
  v12[3] = &unk_1E5126CC8;
  v13 = v9;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v11, "performChanges:", v12);

}

void __40__PXStoryClipLayout__updateContentStyle__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "combinedEffect");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v7, "effectId");
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "mutableEffectIds");

  *(_DWORD *)(v6 + 4 * *(unsigned int *)(a1 + 40)) = (_DWORD)v3;
}

void __38__PXStoryClipLayout__updateAnimations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  PXStoryRectAnimation *(*v23)(uint64_t);
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _BYTE v36[768];
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _BYTE v42[768];
  uint64_t v43;
  uint64_t v44;
  _QWORD aBlock[5];
  __int128 v46;
  uint64_t v47;
  _OWORD v48[2];
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  _OWORD __src[48];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "kenBurnsAnimation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "checkInAnimation:", v4);

  objc_msgSend(*(id *)(a1 + 32), "clippingAnimation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "checkInAnimation:", v5);

  if (*(_BYTE *)(a1 + 56))
  {
    memset(__src, 0, 512);
    v6 = *(void **)(a1 + 40);
    if (v6)
      objc_msgSend(v6, "info");
    else
      bzero(__src, 0x300uLL);
    objc_msgSend(*(id *)(a1 + 32), "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "movementAnimationCurve");

    if (v11 == 5)
    {
      objc_msgSend(*(id *)(a1 + 48), "movementAnimationLinearFraction");
      v13 = v12;
    }
    else
    {
      v13 = 0;
    }
    v50 = 0uLL;
    v51 = 0;
    v48[0] = __src[42];
    v48[1] = __src[43];
    v49 = *(_QWORD *)&__src[44];
    +[PXStoryTransitionFactory visibleOrderOutDurationForTransitionInfo:](PXStoryTransitionFactory, "visibleOrderOutDurationForTransitionInfo:", v48);
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__PXStoryClipLayout__updateAnimations__block_invoke_2;
    aBlock[3] = &unk_1E5116498;
    v46 = v50;
    v15 = *(_QWORD *)(a1 + 32);
    v47 = v51;
    aBlock[4] = v15;
    v16 = _Block_copy(aBlock);
    v7 = 0;
    if ((objc_msgSend(*(id *)(a1 + 32), "disableClippingAnimation") & 1) == 0)
    {
      ClippingAnimationIdentifierForClip(*(void **)(a1 + 40));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v14;
      v39[1] = 3221225472;
      v39[2] = __38__PXStoryClipLayout__updateAnimations__block_invoke_3;
      v39[3] = &unk_1E51164C0;
      memcpy(v42, __src, sizeof(v42));
      v40 = *(id *)(a1 + 40);
      v41 = v16;
      v43 = v11;
      v44 = v13;
      objc_msgSend(v3, "checkOutAnimationWithIdentifier:creationBlock:", v17, v39);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v32 = *(_OWORD *)((char *)&__src[38] + 8);
    v33 = *(_OWORD *)((char *)&__src[39] + 8);
    v34 = *(_OWORD *)((char *)&__src[40] + 8);
    v28 = *(_OWORD *)((char *)&__src[34] + 8);
    v29 = *(_OWORD *)((char *)&__src[35] + 8);
    v30 = *(_OWORD *)((char *)&__src[36] + 8);
    v35 = *((_QWORD *)&__src[41] + 1);
    v31 = *(_OWORD *)((char *)&__src[37] + 8);
    KenBurnsAnimationIdentifierForClip(*(void **)(a1 + 40));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v14;
    v22 = 3221225472;
    v23 = __38__PXStoryClipLayout__updateAnimations__block_invoke_4;
    v24 = &unk_1E51164E8;
    v19 = *(void **)(a1 + 40);
    v25 = *(_QWORD *)(a1 + 32);
    v26 = v19;
    memcpy(v36, __src, sizeof(v36));
    v27 = v16;
    v37 = v11;
    v38 = v13;
    v20 = v16;
    objc_msgSend(v3, "checkOutAnimationWithIdentifier:creationBlock:", v18, &v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setClippingAnimation:", v7, v21, v22, v23, v24, v25);
  objc_msgSend(*(id *)(a1 + 32), "setKenBurnsAnimation:", v8);

}

void __38__PXStoryClipLayout__updateAnimations__block_invoke_2(uint64_t a1@<X0>, CMTime *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  void *v7;
  void *v8;
  CMTime v9;
  CMTime v10;
  CMTime rhs;
  CMTime lhs;

  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  lhs = *a2;
  rhs = *(CMTime *)(a1 + 40);
  CMTimeAdd((CMTime *)a4, &lhs, &rhs);
  if (!objc_msgSend(*(id *)(a1 + 32), "offsetFromCurrentSegment") && a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "timeLeftInCurrentSegment");
    else
      memset(&v9, 0, sizeof(v9));
    lhs = *(CMTime *)a4;
    rhs = v9;
    CMTimeAdd(&v10, &lhs, &rhs);
    *(CMTime *)a4 = v10;

  }
}

PXStoryTiltedEdgeInsetsAnimation *__38__PXStoryClipLayout__updateAnimations__block_invoke_3(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  PXStoryTiltedEdgeInsetsAnimation *v13;
  void *v14;
  void (*v15)(_QWORD *__return_ptr);
  PXStoryTiltedEdgeInsetsAnimation *v16;
  _OWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v2 = *(_OWORD *)(a1 + 560);
  v3 = *(_OWORD *)(a1 + 576);
  v4 = *(_OWORD *)(a1 + 528);
  v42 = *(_OWORD *)(a1 + 544);
  v43 = v2;
  v44 = v3;
  v5 = *(_OWORD *)(a1 + 496);
  v6 = *(_OWORD *)(a1 + 512);
  v7 = *(_OWORD *)(a1 + 464);
  v38 = *(_OWORD *)(a1 + 480);
  v39 = v5;
  v40 = v6;
  v41 = v4;
  v8 = *(_OWORD *)(a1 + 432);
  v9 = *(_OWORD *)(a1 + 400);
  v34 = *(_OWORD *)(a1 + 416);
  v35 = v8;
  v10 = *(_OWORD *)(a1 + 432);
  v11 = *(_OWORD *)(a1 + 464);
  v36 = *(_OWORD *)(a1 + 448);
  v37 = v11;
  v12 = *(_OWORD *)(a1 + 400);
  v32 = *(_OWORD *)(a1 + 384);
  v33 = v12;
  v28 = v34;
  v29 = v10;
  v30 = v36;
  v31 = v7;
  v45 = *(_QWORD *)(a1 + 592);
  v26 = v32;
  v27 = v9;
  v13 = [PXStoryTiltedEdgeInsetsAnimation alloc];
  ClippingAnimationIdentifierForClip(*(void **)(a1 + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void (**)(_QWORD *__return_ptr))(*(_QWORD *)(a1 + 40) + 16);
  v19 = v44;
  *(_QWORD *)&v20 = v45;
  v15(v25);
  v21 = v28;
  v22 = v29;
  v23 = v30;
  v24 = v31;
  v19 = v26;
  v20 = v27;
  v18[2] = v40;
  v18[3] = v41;
  v18[4] = v42;
  v18[5] = v43;
  v18[0] = v38;
  v18[1] = v39;
  v16 = -[PXStoryTiltedEdgeInsetsAnimation initWithIdentifier:sourceEdgeInsets:targetEdgeInsets:duration:curveInfo:](v13, "initWithIdentifier:sourceEdgeInsets:targetEdgeInsets:duration:curveInfo:", v14, &v19, v18, v25, *(_QWORD *)(a1 + 816), *(_QWORD *)(a1 + 824));

  return v16;
}

PXStoryRectAnimation *__38__PXStoryClipLayout__updateAnimations__block_invoke_4(uint64_t a1)
{
  __int128 v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  __int128 v12;
  void *v13;
  void *v14;
  PXStoryRectAnimation *v15;
  void *v16;
  void (*v17)(_QWORD *__return_ptr);
  __int128 v18;
  PXStoryRectAnimation *v19;
  _OWORD v21[3];
  _QWORD v22[4];
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v2 = *((_OWORD *)off_1E50B88F0 + 1);
  v28 = *(_OWORD *)off_1E50B88F0;
  v29 = v2;
  v30 = *((_OWORD *)off_1E50B88F0 + 2);
  objc_msgSend(*(id *)(a1 + 32), "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isPerformingViewControllerTransition") & 1) != 0)
  {

  }
  else
  {
    v4 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "presentedKenBurnsAnimationContentSize");
    v6 = v5;
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "contentSize");
    LOBYTE(v4) = objc_msgSend((id)v4, "shouldContinueKenBurnsAnimationFromPreviousPresentedContentSize:toCurrentContentSize:", v6, v8, v9, v10);

    if ((v4 & 1) == 0)
      goto LABEL_8;
  }
  v11 = *(void **)(a1 + 32);
  if (v11)
  {
    objc_msgSend(v11, "presentedKenBurnsAnimationCurrentRect");
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v25 = 0u;
  }
  v28 = v25;
  v29 = v26;
  v30 = v27;
LABEL_8:
  v25 = v28;
  v26 = v29;
  v27 = v30;
  if (PXStoryRectIsNull())
  {
    v12 = *(_OWORD *)(a1 + 72);
    v28 = *(_OWORD *)(a1 + 56);
    v29 = v12;
    v30 = *(_OWORD *)(a1 + 88);
  }
  objc_msgSend(*(id *)(a1 + 32), "model");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "fixedSegmentDuration");
    if ((v23 & 0x100000000) != 0)
      objc_msgSend(v14, "usePreferredCropRectWhenVerticallyPanningLargeFaceAreasInPortraitAssets");
  }
  else
  {
    v22[3] = 0;
    v23 = 0;
    v24 = 0;
  }
  v15 = [PXStoryRectAnimation alloc];
  KenBurnsAnimationIdentifierForClip(*(void **)(a1 + 40));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(void (**)(_QWORD *__return_ptr))(*(_QWORD *)(a1 + 48) + 16);
  v25 = *(_OWORD *)(a1 + 152);
  *(_QWORD *)&v26 = *(_QWORD *)(a1 + 168);
  v17(v22);
  v25 = v28;
  v26 = v29;
  v27 = v30;
  v18 = *(_OWORD *)(a1 + 120);
  v21[0] = *(_OWORD *)(a1 + 104);
  v21[1] = v18;
  v21[2] = *(_OWORD *)(a1 + 136);
  v19 = -[PXStoryRectAnimation initWithIdentifier:sourceRect:targetRect:outerBounds:referenceSize:duration:curveInfo:](v15, "initWithIdentifier:sourceRect:targetRect:outerBounds:referenceSize:duration:curveInfo:", v16, &v25, v21, v22, *(_QWORD *)(a1 + 944), *(_QWORD *)(a1 + 952), *(double *)off_1E50B86D0, *((double *)off_1E50B86D0 + 1), *((double *)off_1E50B86D0 + 2), *((double *)off_1E50B86D0 + 3), *(double *)(a1 + 336), *(double *)(a1 + 344));

  return v19;
}

uint64_t __46__PXStoryClipLayout__updateSegmentIdentifiers__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a2 >= 1)
  {
    v14 = v7;
    v15 = v6;
    v16 = v5;
    v17 = v4;
    v18 = v8;
    v19 = v9;
    v11 = a2;
    v12 = result;
    do
    {
      v13 = *a4;
      a4 += 25;
      result = objc_msgSend(*(id *)(v12 + 32), "addIndex:", v13, v14, v15, v16, v17, v18, v19);
      --v11;
    }
    while (v11);
  }
  return result;
}

void __35__PXStoryClipLayout__updateContent__block_invoke(uint64_t a1)
{
  double v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  float64x2_t v25;
  float v26;
  void *v28;
  char v29;
  char v30;
  char v31;
  uint64_t v32;
  _QWORD *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  float64x2_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  float64x2_t v56;
  float32x2_t v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double MaxY;
  double v66;
  double v67;
  double v68;
  float32x2_t v69;
  int v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  float64x2_t v75;
  void *v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  float64x2_t v86;
  void *v87;
  void *v88;
  char v89;
  NSObject *v90;
  os_signpost_id_t v91;
  os_signpost_id_t v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  void *v96;
  float v97;
  uint64_t v98;
  double v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  NSObject *v103;
  NSObject *v104;
  void *v105;
  double v106;
  double v107;
  double v108;
  double v109;
  NSObject *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  unsigned int *v115;
  uint64_t v116;
  uint64_t v117;
  float v118;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v121;
  float64x2_t v122;
  uint64_t v123;
  uint64_t v124;
  _OWORD *v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint64_t v131;
  double v132;
  uint64_t v133;
  uint64_t v134;
  float v135;
  CGFloat v136;
  CGFloat v137;
  CGFloat v138;
  float64x2_t v139;
  _OWORD *v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  char v146;
  uint64_t v147;
  double v148;
  double v149;
  double v150;
  double v151;
  _DWORD *v152;
  unsigned int v153;
  CGFloat v154;
  CGFloat v155;
  CGFloat v156;
  CGFloat v157;
  _OWORD *v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  CGFloat v165;
  BOOL IsNull;
  float v167;
  uint64_t v168;
  float v169;
  CGFloat v170;
  CGFloat v171;
  CGFloat v172;
  float64x2_t v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  unsigned int v179;
  CGFloat v180;
  CGFloat v181;
  CGFloat v182;
  CGFloat v183;
  _OWORD *v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  CGFloat v191;
  BOOL v192;
  double v193;
  CGFloat v194;
  CGFloat v195;
  CGFloat v196;
  CGFloat v197;
  uint64_t v198;
  float v199;
  CGFloat v200;
  CGFloat v201;
  CGFloat v202;
  float64x2_t v203;
  double v204;
  double v205;
  double v206;
  double v207;
  CGFloat v208;
  int v209;
  float v210;
  CGFloat v211;
  CGFloat v212;
  double v213;
  CGFloat v214;
  float v215;
  float v216;
  void *v217;
  float v218;
  float32x2_t v219;
  double v220;
  float64x2_t v221;
  double v222;
  CGFloat v223;
  double v224;
  uint64_t v225;
  double v226;
  double v227;
  CGFloat v228;
  double v229;
  CGFloat v230;
  float64x2_t v231;
  CGFloat v232;
  CGFloat v233;
  CGFloat v234;
  _BYTE v235[768];
  char v236[16];
  float64x2_t v237;
  _BYTE v238[768];
  _OWORD __dst[48];
  char v240[16];
  float64x2_t v241;
  _QWORD __src[100];
  CGSize v243;
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;
  CGRect v251;
  CGRect v252;
  CGRect v253;
  CGRect v254;
  CGRect v255;
  CGRect v256;
  CGRect v257;
  CGRect v258;
  CGRect v259;
  CGRect v260;
  CGRect v261;
  CGRect v262;
  CGRect v263;
  CGRect v264;
  CGRect v265;

  v1 = MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v5 = v4;
  __src[97] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v4 + 32), "contentBounds", v1);
  x = v244.origin.x;
  y = v244.origin.y;
  width = v244.size.width;
  height = v244.size.height;
  if (CGRectIsNull(v244))
  {
    PXRectWithOriginAndSize();
    x = v10;
    y = v11;
    width = v12;
    height = v13;
  }
  objc_msgSend(*(id *)(v5 + 32), "alpha");
  v15 = v14;
  objc_msgSend(*(id *)(v5 + 32), "contentAlpha");
  v17 = v15 * v16;
  objc_msgSend(*(id *)(v5 + 32), "displayScale");
  *(float *)&v18 = v18;
  v218 = *(float *)&v18;
  objc_msgSend(*(id *)(v5 + 32), "referenceDepth");
  v20 = v19;
  objc_msgSend(*(id *)(v5 + 32), "model");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isExporting");

  objc_msgSend(*(id *)(v5 + 32), "clip");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  v209 = v22;
  if (v23)
  {
    objc_msgSend(v23, "info");
    v25 = v241;
  }
  else
  {
    bzero(v240, 0x300uLL);
    v25 = 0uLL;
  }
  v26 = v17;
  _D8 = vmul_n_f32(vcvt_f32_f64(v25), v218);

  objc_msgSend(*(id *)(v5 + 32), "model");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 16 * (objc_msgSend(v28, "viewMode") == 1);
  v30 = *((_BYTE *)off_1E50B83A0 + 70);
  objc_msgSend(v28, "timeline");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = 0;
  v33 = *(_QWORD **)(v5 + 32);
  v220 = 0.0;
  v210 = 0.0;
  v34 = 1.0;
  v211 = width;
  v212 = y;
  v214 = height;
  v229 = height;
  v227 = width;
  v224 = x;
  v226 = y;
  switch(v33[112])
  {
    case 1:
      objc_msgSend(v33, "clip");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      memset(__dst, 0, 512);
      if (v35)
        objc_msgSend(v35, "info");
      else
        bzero(__dst, 0x300uLL);
      if ((objc_msgSend(v28, "isPerformingViewControllerTransition") & 1) != 0
        || *(_BYTE *)(*(_QWORD *)(v5 + 32) + 913))
      {
        objc_msgSend(v217, "clipWithIdentifier:", objc_msgSend(v36, "identifier"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v80;
        if (v80)
        {
          objc_msgSend(v80, "info");
          memcpy(__dst, __src, sizeof(__dst));
        }

      }
      memcpy(__src, __dst, 0x300uLL);
      PXStoryMediaSizeForDisplayAssetClipInfo((uint64_t)__src);
      v228 = v83;
      v230 = v82;
      if (!*(_BYTE *)(*(_QWORD *)(v5 + 32) + 913))
      {
        if (v36)
        {
          objc_msgSend(v36, "info");
          if ((v238[32] & 2) != 0)
          {
            objc_msgSend(v28, "log");
            v90 = (id)objc_claimAutoreleasedReturnValue();
            v91 = os_signpost_id_make_with_pointer(v90, *(const void **)(v5 + 32));
            if (v91 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v92 = v91;
              if (os_signpost_enabled(v90))
              {
                v225 = objc_msgSend(v28, "logContext");
                v93 = *(_QWORD *)(v5 + 32);
                v243.height = v228;
                v243.width = v230;
                NSStringFromCGSize(v243);
                v94 = objc_claimAutoreleasedReturnValue();
                v95 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 32) + 888);
                LODWORD(__src[0]) = 134218754;
                *(_QWORD *)((char *)__src + 4) = v225;
                WORD2(__src[1]) = 2112;
                *(_QWORD *)((char *)&__src[1] + 6) = v93;
                HIWORD(__src[2]) = 2112;
                __src[3] = v94;
                v96 = (void *)v94;
                LOWORD(__src[4]) = 1024;
                *(_DWORD *)((char *)&__src[4] + 2) = v95;
                _os_signpost_emit_with_name_impl(&dword_1A6789000, v90, OS_SIGNPOST_EVENT, v92, "PXStoryClipLayoutReloadingKeyAsset", "Context=%{signpost.telemetry:string2}lu %@, mediaTargetSize=%@, contentVersion=%hhu", (uint8_t *)__src, 0x26u);

              }
            }

          }
        }
        else
        {
          bzero(v238, 0x300uLL);
        }
      }
      v220 = v20 * -0.2;
      objc_msgSend(*(id *)(v5 + 32), "displayAsset");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "aspectRatio");
      v34 = v85;

      v86.f64[0] = v230;
      v86.f64[1] = v228;
      _D8 = vcvt_f32_f64(v86);

      v32 = 0;
      v31 = 2;
      goto LABEL_50;
    case 2:
      goto LABEL_51;
    case 3:
      v215 = v26;
      objc_msgSend(v33, "textResourceSpriteFrame");
      v224 = v40;
      v226 = v41;
      v227 = v42;
      v229 = v43;
      objc_msgSend(*(id *)(v5 + 32), "relativeZPositionAboveLegibilityGradients");
      v44 = 0.4;
      if (v45 >= 0.4)
      {
        objc_msgSend(*(id *)(v5 + 32), "relativeZPositionAboveLegibilityGradients");
        v44 = v46;
      }
      v47.f64[0] = v227;
      v47.f64[1] = v229;
      v221 = v47;
      objc_msgSend(*(id *)(v5 + 32), "referenceSize");
      v49 = v48;
      v51 = v50;
      objc_msgSend(*(id *)(v5 + 32), "displayedTimelineOriginalSize");
      v53 = v52;
      v55 = v54;
      if (objc_msgSend(v28, "thumbnailStyle") == 2
        || objc_msgSend(v28, "thumbnailStyle") == 3
        || objc_msgSend(v28, "thumbnailStyle") == 4)
      {
        v56 = v221;
      }
      else
      {
        v56 = v221;
        if (v49 < v53)
        {
          v224 = v224 * (v49 / v53);
          v226 = v226 * (v51 / v55);
          v227 = v227 * (v49 / v53);
          v229 = v229 * (v51 / v55);
        }
      }
      v57 = vcvt_f32_f64(v56);
      objc_msgSend(*(id *)(v5 + 32), "currentTextResourceInfo");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v58, "layoutScheme") == 1)
      {
        objc_msgSend(v28, "layoutSpec");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "distanceBetweenChapterTitleBaselineAndBottomWithChrome");
        v61 = v60;
        objc_msgSend(v59, "distanceBetweenChapterTitleBaselineAndBottomWithoutChrome");
        if (v61 != v62)
        {
          v63 = *(double *)(v5 + 48);
          objc_msgSend(v59, "distanceBetweenChapterTitleBaselineAndBottomWithChrome");
          v222 = v63 - v64;
          v245.origin.x = v224;
          v245.origin.y = v226;
          v245.size.width = v227;
          v245.size.height = v229;
          MaxY = CGRectGetMaxY(v245);
          objc_msgSend(v58, "boundingRectPadding");
          v67 = MaxY - v66;
          objc_msgSend(v28, "chromeVisibilityFraction");
          v226 = v226 - v68 * fmax(v67 - v222, 0.0);
        }

      }
      width = v211;
      v220 = v44 * -v20;
      v69 = vmul_n_f32(v57, v218);
      v70 = objc_msgSend(*(id *)(v5 + 32), "shouldAspectFitContent");
      objc_msgSend(v28, "titleOpacity");
      v72 = 0.0;
      if (!v70)
        v72 = v215;
      _D8 = v69;
      v26 = v71 * v72;

      v30 = 3;
      v32 = 257;
      v31 = 3;
      y = v212;
      goto LABEL_51;
    case 4:
      objc_msgSend(v33, "resource");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "px_storyResourceColorType");
      if (v38 == 1)
      {
        v220 = v20 * -0.0;
      }
      else
      {
        v220 = 0.0;
        if (!v38)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v5 + 56), *(_QWORD *)(v5 + 32), CFSTR("PXStoryClipLayout.m"), 1892, CFSTR("Code which should be unreachable has been reached"));

          abort();
        }
      }

      v32 = 0;
      v31 = 5;
      __asm { FMOV            V8.2S, #1.0 }
      goto LABEL_50;
    case 5:
      objc_msgSend(v33, "clip");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v73;
      if (v73)
      {
        objc_msgSend(v73, "info");
        v75 = v237;
      }
      else
      {
        bzero(v236, 0x300uLL);
        v75 = 0uLL;
      }
      v231 = v75;

      objc_msgSend(*(id *)(v5 + 32), "clip");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v87;
      if (!v87)
      {
        bzero(v235, 0x300uLL);
        goto LABEL_48;
      }
      objc_msgSend(v87, "info");
      if ((v235[32] & 1) == 0)
      {
LABEL_48:

        goto LABEL_49;
      }
      v89 = objc_msgSend(*(id *)(v5 + 32), "shouldAspectFitContent");

      if ((v89 & 1) == 0)
      {
        v29 |= objc_msgSend(*(id *)(v5 + 32), "isSegmentVisible");
        v26 = 0.0;
      }
LABEL_49:
      v32 = 0;
      v220 = v20 * -0.1;
      _D8 = vcvt_f32_f64(v231);
      v31 = 2;
      v97 = v20 * -0.19;
      v210 = v97;
LABEL_50:
      v229 = height;
      v227 = width;
      v224 = x;
      v226 = y;
LABEL_51:
      v219 = _D8;
      v216 = v26;
      *(double *)(*(_QWORD *)(v5 + 32) + 904) = v34;
      objc_msgSend(*(id *)(v5 + 32), "contentSpriteNormalizedFrameOverride");
      v213 = v20;
      v208 = x;
      if (!CGRectIsNull(v246))
      {
        v204 = *MEMORY[0x1E0C9D628];
        v205 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v206 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v207 = *(double *)(MEMORY[0x1E0C9D628] + 24);
        v98 = objc_msgSend(*(id *)(v5 + 32), "contentSpriteNormalizedFrameOverrideCoordinateSystem");
        if (v98 == 2)
        {
          objc_msgSend(*(id *)(v5 + 32), "timelineLayout");
          v104 = objc_claimAutoreleasedReturnValue();
          v103 = v104;
          if (v104)
          {
            v105 = *(void **)(v5 + 32);
            -[NSObject contentSize](v104, "contentSize");
            PXRectWithOriginAndSize();
            objc_msgSend(v105, "convertRect:fromLayout:", v103);
            v100 = v106;
            y = v107;
            v101 = v108;
            v102 = v109;
          }
          else
          {
            PXAssertGetLog();
            v110 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_FAULT))
            {
              LOWORD(__dst[0]) = 0;
              _os_log_fault_impl(&dword_1A6789000, v110, OS_LOG_TYPE_FAULT, "missing timeline layout", (uint8_t *)__dst, 2u);
            }

            v101 = v206;
            v102 = v207;
            v100 = v204;
            y = v205;
          }
        }
        else
        {
          v99 = width;
          v100 = x;
          v101 = v99;
          v102 = v214;
          if (v98 == 1)
            goto LABEL_67;
          if (v98)
          {
            v100 = v204;
            y = v205;
            v101 = v206;
            v102 = v207;
            goto LABEL_67;
          }
          PXAssertGetLog();
          v103 = objc_claimAutoreleasedReturnValue();
          v101 = v206;
          v102 = v207;
          v100 = v204;
          y = v205;
          if (os_log_type_enabled(v103, OS_LOG_TYPE_FAULT))
          {
            LOWORD(__dst[0]) = 0;
            _os_log_fault_impl(&dword_1A6789000, v103, OS_LOG_TYPE_FAULT, "undefined sprite frame override coordinate system", (uint8_t *)__dst, 2u);
          }
        }

LABEL_67:
        v247.origin.x = v100;
        v247.origin.y = y;
        v247.size.width = v101;
        v247.size.height = v102;
        if (!CGRectIsNull(v247))
        {
          PXRectDenormalize();
          v224 = v111;
          v226 = v112;
          v227 = v113;
          v229 = v114;
        }
      }
      v115 = *(unsigned int **)(v5 + 32);
      v116 = v115[218];
      if ((_DWORD)v116 != -1)
      {
        v117 = v3[2] + 32 * v116;
        v118 = v220;
        v248.origin.x = v224;
        v248.origin.y = v226;
        v248.size.width = v227;
        v248.size.height = v229;
        MidX = CGRectGetMidX(v248);
        v249.origin.x = v224;
        v249.origin.y = v226;
        v249.size.width = v227;
        v249.size.height = v229;
        MidY = CGRectGetMidY(v249);
        v250.origin.x = v224;
        v250.origin.y = v226;
        v250.size.width = v227;
        v250.size.height = v229;
        v223 = CGRectGetWidth(v250);
        v251.origin.x = v224;
        v251.origin.y = v226;
        v251.size.width = v227;
        v251.size.height = v229;
        v121 = CGRectGetHeight(v251);
        v122.f64[0] = v223;
        v122.f64[1] = v121;
        *(CGFloat *)v117 = MidX;
        *(CGFloat *)(v117 + 8) = MidY;
        *(double *)(v117 + 16) = v118;
        *(float32x2_t *)(v117 + 24) = vcvt_f32_f64(v122);
        v123 = v3[4];
        *(_BYTE *)(v123 + 40 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 872) + 1) = v31;
        *(float32x2_t *)(v123 + 40 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 872) + 8) = v219;
        v124 = v3[4];
        *(_WORD *)(v124 + 40 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 872) + 32) = *(unsigned __int8 *)(*(_QWORD *)(v5 + 32) + 888);
        *(_QWORD *)(v124 + 40 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 872) + 24) = v32;
        *(_BYTE *)(v124 + 40 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 872) + 34) = v29;
        v125 = (_OWORD *)(v3[3] + 160 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 872));
        v126 = *((_OWORD *)off_1E50B83A0 + 1);
        *v125 = *(_OWORD *)off_1E50B83A0;
        v125[1] = v126;
        v127 = *((_OWORD *)off_1E50B83A0 + 5);
        v125[4] = *((_OWORD *)off_1E50B83A0 + 4);
        v125[5] = v127;
        v128 = *((_OWORD *)off_1E50B83A0 + 3);
        v125[2] = *((_OWORD *)off_1E50B83A0 + 2);
        v125[3] = v128;
        v129 = *((_OWORD *)off_1E50B83A0 + 9);
        v125[8] = *((_OWORD *)off_1E50B83A0 + 8);
        v125[9] = v129;
        v130 = *((_OWORD *)off_1E50B83A0 + 7);
        v125[6] = *((_OWORD *)off_1E50B83A0 + 6);
        v125[7] = v130;
        v131 = v3[3];
        *(float *)(v131 + 160 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 872)) = v216;
        *(float *)(v131 + 160 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 872) + 52) = v210;
        *(_BYTE *)(v131 + 160 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 872) + 70) = v30;
        v115 = *(unsigned int **)(v5 + 32);
      }
      v132 = v213;
      v133 = v115[219];
      if ((_DWORD)v133 != -1)
      {
        v134 = v3[2] + 32 * v133;
        v252.origin.x = v208;
        v252.origin.y = v212;
        v252.size.width = v211;
        v252.size.height = v214;
        v136 = CGRectGetMidX(v252);
        v253.origin.x = v208;
        v253.origin.y = v212;
        v253.size.width = v211;
        v253.size.height = v214;
        v137 = CGRectGetMidY(v253);
        v254.origin.x = v208;
        v254.origin.y = v212;
        v254.size.width = v211;
        v254.size.height = v214;
        v232 = CGRectGetWidth(v254);
        v255.origin.x = v208;
        v255.origin.y = v212;
        v255.size.width = v211;
        v255.size.height = v214;
        v138 = CGRectGetHeight(v255);
        v139.f64[0] = v232;
        v139.f64[1] = v138;
        *(CGFloat *)v134 = v136;
        *(CGFloat *)(v134 + 8) = v137;
        v135 = v213 * -0.9;
        *(double *)(v134 + 16) = v135;
        *(float32x2_t *)(v134 + 24) = vcvt_f32_f64(v139);
        v140 = (_OWORD *)(v3[3] + 160 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 876));
        v141 = *((_OWORD *)off_1E50B83A0 + 1);
        *v140 = *(_OWORD *)off_1E50B83A0;
        v140[1] = v141;
        v142 = *((_OWORD *)off_1E50B83A0 + 5);
        v140[4] = *((_OWORD *)off_1E50B83A0 + 4);
        v140[5] = v142;
        v143 = *((_OWORD *)off_1E50B83A0 + 3);
        v140[2] = *((_OWORD *)off_1E50B83A0 + 2);
        v140[3] = v143;
        v144 = *((_OWORD *)off_1E50B83A0 + 9);
        v140[8] = *((_OWORD *)off_1E50B83A0 + 8);
        v140[9] = v144;
        v145 = *((_OWORD *)off_1E50B83A0 + 7);
        v140[6] = *((_OWORD *)off_1E50B83A0 + 6);
        v140[7] = v145;
        if (v209)
          v146 = 0;
        else
          v146 = 10;
        v147 = v3[4];
        *(_BYTE *)(v147 + 40 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 876) + 1) = v146;
        *(_BYTE *)(v147 + 40 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 876)) = 1;
        *(_WORD *)(v147 + 40 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 876) + 32) = *(unsigned __int8 *)(*(_QWORD *)(v5 + 32) + 912);
        v115 = *(unsigned int **)(v5 + 32);
      }
      objc_msgSend(v115, "primaryDividerBounds");
      v152 = *(_DWORD **)(v5 + 32);
      v153 = v152[220];
      if (v153 != -1)
      {
        v154 = v148;
        v155 = v149;
        v156 = v150;
        v157 = v151;
        __asm { FMOV            V0.2S, #1.0 }
        *(_QWORD *)(v3[4] + 40 * v153 + 8) = _D0;
        *(_BYTE *)(v3[4] + 40 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 880) + 1) = 5;
        v159 = (_OWORD *)(v3[3] + 160 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 880));
        v160 = *((_OWORD *)off_1E50B83A0 + 7);
        v159[6] = *((_OWORD *)off_1E50B83A0 + 6);
        v159[7] = v160;
        v161 = *((_OWORD *)off_1E50B83A0 + 9);
        v159[8] = *((_OWORD *)off_1E50B83A0 + 8);
        v159[9] = v161;
        v162 = *((_OWORD *)off_1E50B83A0 + 3);
        v159[2] = *((_OWORD *)off_1E50B83A0 + 2);
        v159[3] = v162;
        v163 = *((_OWORD *)off_1E50B83A0 + 5);
        v159[4] = *((_OWORD *)off_1E50B83A0 + 4);
        v159[5] = v163;
        v164 = *((_OWORD *)off_1E50B83A0 + 1);
        *v159 = *(_OWORD *)off_1E50B83A0;
        v159[1] = v164;
        v165 = v154;
        *(CGFloat *)&v164 = v155;
        IsNull = CGRectIsNull(*(CGRect *)(&v150 - 2));
        v167 = 0.0;
        if (!IsNull)
        {
          v168 = v3[2] + 32 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 880);
          v256.origin.x = v154;
          v256.origin.y = v155;
          v256.size.width = v156;
          v256.size.height = v157;
          v170 = CGRectGetMidX(v256);
          v257.origin.x = v154;
          v257.origin.y = v155;
          v257.size.width = v156;
          v257.size.height = v157;
          v171 = CGRectGetMidY(v257);
          v258.origin.x = v154;
          v258.origin.y = v155;
          v258.size.width = v156;
          v258.size.height = v157;
          v233 = CGRectGetWidth(v258);
          v259.origin.x = v154;
          v259.origin.y = v155;
          v259.size.width = v156;
          v259.size.height = v157;
          v172 = CGRectGetHeight(v259);
          v173.f64[0] = v233;
          v173.f64[1] = v172;
          *(CGFloat *)v168 = v170;
          *(CGFloat *)(v168 + 8) = v171;
          v169 = v213 * -0.3;
          *(double *)(v168 + 16) = v169;
          *(float32x2_t *)(v168 + 24) = vcvt_f32_f64(v173);
          v132 = v213;
          objc_msgSend(*(id *)(v5 + 32), "primaryDividerAlpha");
          v167 = v174;
        }
        *(float *)(v3[3] + 160 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 880)) = v167;
        v152 = *(_DWORD **)(v5 + 32);
      }
      objc_msgSend(v152, "secondaryDividerBounds");
      v179 = *(_DWORD *)(*(_QWORD *)(v5 + 32) + 884);
      if (v179 != -1)
      {
        v180 = v175;
        v181 = v176;
        v182 = v177;
        v183 = v178;
        __asm { FMOV            V0.2S, #1.0 }
        *(_QWORD *)(v3[4] + 40 * v179 + 8) = _D0;
        *(_BYTE *)(v3[4] + 40 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 884) + 1) = 5;
        v185 = (_OWORD *)(v3[3] + 160 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 884));
        v186 = *((_OWORD *)off_1E50B83A0 + 7);
        v185[6] = *((_OWORD *)off_1E50B83A0 + 6);
        v185[7] = v186;
        v187 = *((_OWORD *)off_1E50B83A0 + 9);
        v185[8] = *((_OWORD *)off_1E50B83A0 + 8);
        v185[9] = v187;
        v188 = *((_OWORD *)off_1E50B83A0 + 3);
        v185[2] = *((_OWORD *)off_1E50B83A0 + 2);
        v185[3] = v188;
        v189 = *((_OWORD *)off_1E50B83A0 + 5);
        v185[4] = *((_OWORD *)off_1E50B83A0 + 4);
        v185[5] = v189;
        v190 = *((_OWORD *)off_1E50B83A0 + 1);
        *v185 = *(_OWORD *)off_1E50B83A0;
        v185[1] = v190;
        v191 = v180;
        *(CGFloat *)&v190 = v181;
        v192 = CGRectIsNull(*(CGRect *)(&v177 - 2));
        LODWORD(v193) = 0;
        if (!v192)
        {
          objc_msgSend(*(id *)(v5 + 32), "secondaryDividerScale", v193);
          v260.origin.x = v180;
          v260.origin.y = v181;
          v260.size.width = v182;
          v260.size.height = v183;
          CGRectGetWidth(v260);
          v261.origin.x = v180;
          v261.origin.y = v181;
          v261.size.width = v182;
          v261.size.height = v183;
          CGRectGetHeight(v261);
          PXRectWithSizeAlignedToRectEdges();
          v194 = v262.origin.x;
          v195 = v262.origin.y;
          v196 = v262.size.width;
          v197 = v262.size.height;
          v198 = v3[2] + 32 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 884);
          v200 = CGRectGetMidX(v262);
          v263.origin.x = v194;
          v263.origin.y = v195;
          v263.size.width = v196;
          v263.size.height = v197;
          v201 = CGRectGetMidY(v263);
          v264.origin.x = v194;
          v264.origin.y = v195;
          v264.size.width = v196;
          v264.size.height = v197;
          v234 = CGRectGetWidth(v264);
          v265.origin.x = v194;
          v265.origin.y = v195;
          v265.size.width = v196;
          v265.size.height = v197;
          v202 = CGRectGetHeight(v265);
          v203.f64[0] = v234;
          v203.f64[1] = v202;
          *(CGFloat *)v198 = v200;
          *(CGFloat *)(v198 + 8) = v201;
          v199 = v132 * -0.3;
          *(double *)(v198 + 16) = v199;
          *(float32x2_t *)(v198 + 24) = vcvt_f32_f64(v203);
          objc_msgSend(*(id *)(v5 + 32), "secondaryDividerAlpha");
          *(float *)&v193 = v193;
        }
        *(_DWORD *)(v3[3] + 160 * *(unsigned int *)(*(_QWORD *)(v5 + 32) + 884)) = LODWORD(v193);
      }

      return;
    default:
      goto LABEL_50;
  }
}

void __56__PXStoryClipLayout__updateModelPresentedTextProperties__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "type");
  if (v3 == 1)
  {
    objc_msgSend(v4, "setPresentedSubtitleFrame:", *(_QWORD *)(a1 + 40));
  }
  else if (!v3)
  {
    objc_msgSend(v4, "setPresentedTitleFrame:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(v4, "setTitleAlignment:", objc_msgSend(*(id *)(a1 + 32), "textAlignment"));

}

void __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _BYTE *a6)
{
  uint64_t i;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  if (a2 >= 1)
  {
    for (i = a2; i; --i)
    {
      v10 = a5[1];
      if (v10 == 3)
      {
        objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", *a5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "resource");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "px_storyResourceTextResourceInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v17, "type") == 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v17, "type") == 1;
        if (objc_msgSend(*(id *)(a1 + 48), "type") == 1 && !objc_msgSend(v17, "type"))
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v17);
      }
      else
      {
        if (v10 != 1)
          goto LABEL_10;
        v24 = *(_OWORD *)(a5 + 77);
        v25 = *(_OWORD *)(a5 + 79);
        v23 = *(_OWORD *)(a5 + 75);
        PXRectWithOriginAndSize();
        PXStoryRectFromCGRect();
        PXStoryRectDenormalize();
        PXStoryRectOuterBounds();
        v11 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
        v11[4] = v12;
        v11[5] = v13;
        v11[6] = v14;
        v11[7] = v15;
        objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", *a5, v23, v24, v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "resource");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "px_storyResourceDisplayAsset");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v18;

      }
LABEL_10:
      v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      if (v22)
      {
        LOBYTE(v22) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        if ((_BYTE)v22)
          LOBYTE(v22) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) != 0;
      }
      *a6 = v22;
      a5 += 96;
    }
  }
  *a6 = 1;
}

uint64_t __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  double *v4;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "simulateSlowTextLayout");

  if (v3)
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 1.0);
  v4 = *(double **)(*(_QWORD *)(a1 + 64) + 8);
  return objc_msgSend(*(id *)(a1 + 32), "attributedStringFrameInRect:titleCategory:displayAsset:currentAssetCropRect:kind:relativeTo:extendedTraitCollectionSnapshot:fixedBottomPadding:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 112), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), v4[4], v4[5], v4[6], v4[7], *(_QWORD *)(a1 + 120));
}

void __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke_4(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12[5];

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v2 = (*(double (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke_5;
    v10[3] = &unk_1E5116420;
    v9 = *(NSObject **)(a1 + 40);
    v11 = *(id *)(a1 + 32);
    objc_copyWeak(v12, (id *)(a1 + 56));
    v12[1] = *(id *)&v2;
    v12[2] = v4;
    v12[3] = v6;
    v12[4] = v8;
    dispatch_async(v9, v10);
    objc_destroyWeak(v12);

  }
}

void __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke_5(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id WeakRetained;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v2 = *(double *)(a1 + 48);
    v3 = *(double *)(a1 + 56);
    v4 = *(double *)(a1 + 64);
    v5 = *(double *)(a1 + 72);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setTextResourceSpriteFrame:", v2, v3, v4, v5);

  }
}

void __51__PXStoryClipLayout__updateTextResourceSpriteFrame__block_invoke_3()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("PXStoryClipLayout.TextSpriteFrame", v0);
  v2 = (void *)_updateTextResourceSpriteFrame_workQueue;
  _updateTextResourceSpriteFrame_workQueue = (uint64_t)v1;

}

uint64_t __42__PXStoryClipLayout__updateCombinedEffect__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

void __40__PXStoryClipLayout__updateMusicDucking__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "beginMusicDucking");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMusicDuckingToken:", v3);

}

uint64_t __40__PXStoryClipLayout__updateMusicDucking__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "endMusicDuckingWithToken:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setMusicDuckingToken:", 0);
}

void __60__PXStoryClipLayout__updateVideoPresentationControllerState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  CMTimeValue v8;
  CMTimeScale v9;
  CMTimeFlags v10;
  CMTimeEpoch v11;
  void *v12;
  uint64_t v13;
  CMTimeValue v14;
  CMTimeFlags v15;
  CMTimeEpoch v16;
  CMTimeScale v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  Float64 Seconds;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  _BYTE v33[152];
  uint64_t v34;
  __int128 v35;
  CMTimeEpoch v36;
  __int128 v37;
  CMTimeEpoch v38;
  CMTimeValue v39;
  CMTimeScale v40;
  CMTimeFlags v41;
  CMTimeEpoch v42;
  CMTimeRange v43;
  CMTime time2;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  CMTimeValue v48;
  CMTimeScale v49;
  CMTimeValue value;
  CMTimeScale timescale;
  CMTimeRange time1;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v43, 0, sizeof(v43));
  v5 = *(void **)(a1 + 32);
  if (v5)
    objc_msgSend(v5, "clipTimeRange");
  time1 = v43;
  PXStoryClipSegmentPlaybackTimeRangeIncludingJLCuts(v4, (__int128 *)&time1.start.value, 0, &v37);
  flags = HIDWORD(v37);
  epoch = v38;
  v8 = v39;
  v9 = v40;
  v10 = v41;
  v11 = v42;
  objc_msgSend(v3, "setDesiredPlayState:", 0);
  if (objc_msgSend(*(id *)(a1 + 32), "isSegmentVisible"))
  {
    memset(&lhs, 0, sizeof(lhs));
    v12 = *(void **)(a1 + 40);
    if (v12)
    {
      objc_msgSend(v12, "nominalPlaybackTime");
    }
    else
    {
      v35 = 0uLL;
      v36 = 0;
    }
    v32 = v4;
    time = v43.start;
    *(_OWORD *)&time1.start.value = v35;
    time1.start.epoch = v36;
    CMTimeSubtract(&lhs, &time1.start, &time);
    value = v37;
    timescale = DWORD2(v37);
    if ((flags & 1) == 0 || (v10 & 1) == 0 || v11 || v8 < 0)
    {
      v31 = v3;
      v17 = v9;
      v18 = flags & 1;
      memset(&time, 0, sizeof(time));
      objc_msgSend(*(id *)(a1 + 32), "videoPresentationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
        objc_msgSend(v19, "videoDuration");
      else
        memset(&time, 0, sizeof(time));

      v9 = v17;
      if ((time.flags & 1) != 0)
      {
        rhs = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        time2 = time;
        CMTimeRangeMake(&time1, &rhs, &time2);
        value = time1.start.value;
        flags = time1.start.flags;
        timescale = time1.start.timescale;
        epoch = time1.start.epoch;
        v8 = time1.duration.value;
        v9 = time1.duration.timescale;
        v10 = time1.duration.flags;
        v11 = time1.duration.epoch;
        v18 = time1.start.flags & 1;
      }
      v3 = v31;
      if (!v18)
        goto LABEL_36;
    }
    else
    {
      v11 = 0;
    }
    if ((v10 & 1) == 0
      || v11
      || v8 < 0
      || (time = lhs,
          rhs.value = value,
          rhs.timescale = timescale,
          rhs.flags = flags,
          rhs.epoch = epoch,
          CMTimeAdd(&time1.start, &time, &rhs),
          lhs = time1.start,
          (~v10 & 5) == 0))
    {
LABEL_36:
      +[PXStoryExportManager frequentSignpostLog](PXStoryExportManager, "frequentSignpostLog");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_signpost_id_make_with_pointer(v21, *(const void **)(a1 + 32));
      v23 = v21;
      v24 = v23;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        time1.start = lhs;
        Seconds = CMTimeGetSeconds(&time1.start);
        v26 = *(_QWORD *)(a1 + 40);
        LODWORD(time1.start.value) = 134218240;
        *(Float64 *)((char *)&time1.start.value + 4) = Seconds;
        LOWORD(time1.start.flags) = 2048;
        *(_QWORD *)((char *)&time1.start.flags + 2) = v26;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "StoryExportRequestSeekVideo", "Seeking video to %f with model %p", (uint8_t *)&time1, 0x16u);
      }

      if ((lhs.flags & 1) == 0)
      {
        PXAssertGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "displayAsset");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(time1.start.value) = 138412290;
          *(CMTimeValue *)((char *)&time1.start.value + 4) = (CMTimeValue)v30;
          _os_log_fault_impl(&dword_1A6789000, v27, OS_LOG_TYPE_FAULT, "Invalid seek time when exporting an asset: %@", (uint8_t *)&time1, 0xCu);

        }
      }
      time1.start = lhs;
      objc_msgSend(v3, "synchronouslySeekToDesiredTime:updatePixelBufferSource:", &time1, 1);
      v28 = v24;
      v29 = v28;
      v4 = v32;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        LOWORD(time1.start.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v29, OS_SIGNPOST_INTERVAL_END, v22, "StoryExportRequestSeekVideo", ", (uint8_t *)&time1, 2u);
      }

      goto LABEL_47;
    }
    if (v32)
    {
      objc_msgSend(v32, "info");
      if (v34 == 5)
      {
        rhs = lhs;
        time1.start.value = value;
        time1.start.timescale = timescale;
        time1.start.flags = flags;
        time1.start.epoch = epoch;
        time1.duration.value = v8;
        time1.duration.timescale = v9;
        time1.duration.flags = v10;
        time1.duration.epoch = 0;
        CMTimeFoldIntoRange(&time, &rhs, &time1);
LABEL_35:
        lhs = time;
        goto LABEL_36;
      }
    }
    else
    {
      bzero(v33, 0x300uLL);
    }
    rhs = lhs;
    time1.start.value = value;
    time1.start.timescale = timescale;
    time1.start.flags = flags;
    time1.start.epoch = epoch;
    time1.duration.value = v8;
    time1.duration.timescale = v9;
    time1.duration.flags = v10;
    time1.duration.epoch = 0;
    CMTimeClampToRange(&time, &rhs, &time1);
    goto LABEL_35;
  }
  if ((flags & 1) != 0)
  {
    value = v37;
    timescale = DWORD2(v37);
  }
  else
  {
    value = *MEMORY[0x1E0CA2E68];
    flags = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 12);
    timescale = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 8);
    epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  }
  v14 = *(_QWORD *)(a1 + 56);
  v13 = a1 + 56;
  v48 = v14;
  v15 = *(_DWORD *)(v13 + 12);
  v49 = *(_DWORD *)(v13 + 8);
  v16 = *(_QWORD *)(v13 + 16);
  if ((flags & 0x1F) != 3 && (v15 & 0x1F) != 3)
    goto LABEL_50;
  memset(&time1, 0, 24);
  lhs.value = value;
  lhs.timescale = timescale;
  lhs.flags = flags;
  lhs.epoch = epoch;
  rhs.value = *(_QWORD *)v13;
  rhs.timescale = *(_DWORD *)(v13 + 8);
  rhs.flags = v15;
  rhs.epoch = v16;
  CMTimeSubtract(&time, &lhs, &rhs);
  CMTimeAbsoluteValue(&time1.start, &time);
  CMTimeMake(&time2, 1, 1000000000);
  lhs = time1.start;
  if (CMTimeCompare(&lhs, &time2) > 0)
  {
LABEL_50:
    time1.start.value = value;
    time1.start.timescale = timescale;
    time1.start.flags = flags;
    time1.start.epoch = epoch;
    lhs.value = v48;
    lhs.timescale = v49;
    lhs.flags = v15;
    lhs.epoch = v16;
    if (CMTimeCompare(&time1.start, &lhs))
    {
      time1.start.value = value;
      time1.start.timescale = timescale;
      time1.start.flags = flags;
      time1.start.epoch = epoch;
      objc_msgSend(v3, "synchronouslySeekToDesiredTime:updatePixelBufferSource:", &time1, 1);
    }
  }
LABEL_47:

}

void __60__PXStoryClipLayout__updateVideoPresentationControllerState__block_invoke_192(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  int v7;
  dispatch_time_t v8;
  void *v9;
  NSObject *v10;
  CMTimeFlags v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  CMTime *v21;
  CMTimeFlags v22;
  CMTimeFlags v23;
  CMTimeEpoch v24;
  NSObject *v25;
  os_signpost_id_t v26;
  os_signpost_id_t v27;
  uint64_t v28;
  const __CFAllocator *v29;
  __CFString *v30;
  CMTimeEpoch v31;
  CMTime v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  _QWORD block[4];
  id v37;
  CMTime time2;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  CMTimeValue v42;
  CMTimeScale v43;
  CMTimeValue value;
  CMTimeScale timescale;
  _BYTE time1[32];
  __int128 v47;
  id location[4];
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "desiredPlayState");
  if (*(_BYTE *)(a1 + 80))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "wasPlayheadMovedManually");
    if (*(_BYTE *)(a1 + 80))
      goto LABEL_6;
  }
  else
  {
    v5 = 0;
  }
  if (!*(_BYTE *)(a1 + 81))
  {
    objc_msgSend(v3, "setDesiredPlayState:", 0);
    v11 = 1;
    goto LABEL_12;
  }
LABEL_6:
  if (*(_BYTE *)(a1 + 82))
  {
    if (objc_msgSend(v3, "desiredPlayState") != 1)
    {
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "detectVideoLags");

      if (v7)
      {
        objc_initWeak(location, *(id *)(a1 + 32));
        v8 = dispatch_time(0, 300000000);
        objc_msgSend(*(id *)(a1 + 32), "model");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "storyQueue");
        v10 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __60__PXStoryClipLayout__updateVideoPresentationControllerState__block_invoke_2;
        block[3] = &unk_1E5148D30;
        objc_copyWeak(&v37, location);
        dispatch_after(v8, v10, block);

        objc_destroyWeak(&v37);
        objc_destroyWeak(location);
      }
    }
  }
  objc_msgSend(v3, "setDesiredPlayState:", *(unsigned __int8 *)(a1 + 82));
  v11 = 0;
LABEL_12:
  if (objc_msgSend(v3, "desiredPlayState") != (v4 != 0))
  {
    v12 = *(id *)(a1 + 40);
    v13 = os_signpost_id_make_with_pointer(v12, *(const void **)(a1 + 32));
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        v15 = *(void **)(a1 + 48);
        v16 = (void *)objc_msgSend(v3, "desiredPlayState");
        LODWORD(location[0]) = 134218240;
        *(id *)((char *)location + 4) = v15;
        WORD2(location[1]) = 2050;
        *(id *)((char *)&location[1] + 6) = v16;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v12, OS_SIGNPOST_EVENT, v14, "PXStoryClipLayoutChangedVideoDesiredPlayState", "Context=%{signpost.telemetry:string2}lu desiredPlayState=%{signpost.description:attribute, public}ld", (uint8_t *)location, 0x16u);
      }
    }

  }
  if ((v5 | v11) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "clip");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    memset(location, 0, sizeof(location));
    v18 = *(void **)(a1 + 32);
    if (v18)
      objc_msgSend(v18, "clipTimeRange");
    *(_OWORD *)time1 = *(_OWORD *)location;
    *(_OWORD *)&time1[16] = *(_OWORD *)&location[2];
    v47 = v49;
    PXStoryClipSegmentPlaybackTimeRangeIncludingJLCuts(v17, (__int128 *)time1, v11, &v32);
    flags = v32.flags;
    epoch = v32.epoch;
    v21 = (CMTime *)MEMORY[0x1E0CA2E68];
    if ((v32.flags & 1) == 0 || (v34 & 1) == 0 || v35 || v33 < 0)
    {
      value = *MEMORY[0x1E0CA2E68];
      v22 = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 12);
      timescale = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 8);
      v31 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    }
    else
    {
      value = v32.value;
      timescale = v32.timescale;
      v31 = v32.epoch;
      v22 = v32.flags;
    }
    v42 = *(_QWORD *)(a1 + 56);
    v23 = *(_DWORD *)(a1 + 68);
    v43 = *(_DWORD *)(a1 + 64);
    v24 = *(_QWORD *)(a1 + 72);
    if ((v32.flags & 0x1F) != 3 && (v23 & 0x1F) != 3)
      goto LABEL_38;
    memset(time1, 0, 24);
    rhs.epoch = v24;
    lhs = v32;
    rhs.value = *(_QWORD *)(a1 + 56);
    rhs.timescale = *(_DWORD *)(a1 + 64);
    rhs.flags = v23;
    CMTimeSubtract(&time, &lhs, &rhs);
    CMTimeAbsoluteValue((CMTime *)time1, &time);
    CMTimeMake(&time2, 1, 1000000000);
    lhs = *(CMTime *)time1;
    if (CMTimeCompare(&lhs, &time2) > 0)
    {
LABEL_38:
      *(_QWORD *)time1 = v32.value;
      *(_DWORD *)&time1[8] = v32.timescale;
      *(_DWORD *)&time1[12] = flags;
      *(_QWORD *)&time1[16] = epoch;
      lhs.value = v42;
      lhs.timescale = v43;
      lhs.flags = v23;
      lhs.epoch = v24;
      if (CMTimeCompare((CMTime *)time1, &lhs))
      {
        v25 = *(id *)(a1 + 40);
        v26 = os_signpost_id_make_with_pointer(v25, *(const void **)(a1 + 32));
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v27 = v26;
          if (os_signpost_enabled(v25))
          {
            v28 = *(_QWORD *)(a1 + 48);
            v29 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            *(_QWORD *)time1 = value;
            *(_DWORD *)&time1[8] = timescale;
            *(_DWORD *)&time1[12] = v22;
            *(_QWORD *)&time1[16] = v31;
            v30 = (__CFString *)CMTimeCopyDescription(v29, (CMTime *)time1);
            *(_DWORD *)time1 = 134218242;
            *(_QWORD *)&time1[4] = v28;
            *(_WORD *)&time1[12] = 2114;
            *(_QWORD *)&time1[14] = v30;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v25, OS_SIGNPOST_EVENT, v27, "PXStoryClipLayoutChangedVideoDesiredTime", "Context=%{signpost.telemetry:string2}lu desiredTime=%{signpost.description:attribute, public}@", time1, 0x16u);

          }
        }

        *(_QWORD *)time1 = value;
        *(_DWORD *)&time1[8] = timescale;
        *(_DWORD *)&time1[12] = v22;
        *(_QWORD *)&time1[16] = v31;
        time = *v21;
        lhs = time;
        objc_msgSend(v3, "setDesiredTime:toleranceBefore:toleranceAfter:", time1, &time, &lhs);
      }
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "currentAudioVolume", v31);
  objc_msgSend(v3, "setVolume:withFade:", 0);

}

void __60__PXStoryClipLayout__updateVideoPresentationControllerState__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_validateVideoPlaybackState");

}

void __55__PXStoryClipLayout__updateVideoPresentationController__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  __int128 v7;
  void *v8;
  double v9;
  _OWORD v10[3];
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _BYTE v19[16];

  v3 = a2;
  objc_msgSend(v3, "setShouldDisplayPreviousNonNullPixelBuffer:", 1);
  objc_msgSend(v3, "setIsCrossfadingFromStillToVideoEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 913));
  objc_msgSend(v3, "setIsCleanApertureCompensationEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 913));
  objc_msgSend(v3, "setShouldDisableAutomaticPixelBufferUpdates:", *(unsigned __int8 *)(a1 + 100));
  objc_msgSend(*(id *)(a1 + 32), "clip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "info");
  else
    bzero(v19, 0x300uLL);
  objc_msgSend(*(id *)(a1 + 32), "displayScale");
  PXSizeScale();
  objc_msgSend(v3, "setTargetSize:");

  objc_msgSend(v3, "setDesiredPlaybackRate:", *(double *)(a1 + 40));
  if (*(_BYTE *)(a1 + 101))
  {
    LODWORD(v6) = *(_DWORD *)(a1 + 48);
    objc_msgSend(v3, "setVolume:withFade:", 0, v6);
  }
  if (*(_BYTE *)(a1 + 102))
  {
    objc_msgSend(v3, "setIsLoopingEnabled:", 1);
    v7 = *(_OWORD *)(a1 + 68);
    v10[0] = *(_OWORD *)(a1 + 52);
    v10[1] = v7;
    v10[2] = *(_OWORD *)(a1 + 84);
    objc_msgSend(v3, "setPlaybackTimeRange:", v10);
  }
  else if ((*(_DWORD *)(a1 + 64) & 0x1D) == 1)
  {
    v17 = *(_OWORD *)(a1 + 52);
    v18 = *(_QWORD *)(a1 + 68);
    v15 = *MEMORY[0x1E0CA2E68];
    v16 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v13 = v15;
    v14 = v16;
    objc_msgSend(v3, "setDesiredTime:toleranceBefore:toleranceAfter:", &v17, &v15, &v13);
    v11 = *(_OWORD *)(a1 + 52);
    v12 = *(_QWORD *)(a1 + 68);
    objc_msgSend(v3, "setPlaybackStartTime:", &v11);
  }
  objc_msgSend(*(id *)(a1 + 32), "mediaProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 1.0;
  objc_msgSend(v3, "prerollForImmediatePlaybackAtRate:withMediaProvider:", v8, v9);

}

void __52__PXStoryClipLayout_setVideoPresentationController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "removeVideoPresentationController:");
    v3 = v4;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v4, "addVideoPresentationController:");
    v3 = v4;
  }

}

uint64_t __37__PXStoryClipLayout_setContentAlpha___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 932) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateContent");
}

+ (BOOL)shouldContinueKenBurnsAnimationFromPreviousPresentedContentSize:(CGSize)a3 toCurrentContentSize:(CGSize)a4
{
  void *v4;
  long double v5;
  long double v6;
  double v7;
  char v8;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "allowsContinuousKenBurnsAnimations"))
  {
    PXSizeGetAspectRatioWithDefault();
    if (v5 > 0.0)
      log(v5);
    PXSizeGetAspectRatioWithDefault();
    if (v6 > 0.0)
      v6 = log(v6);
    objc_msgSend(v4, "continuousKenBurnsAnimationsTolerance", (double)v6);
    log(v7 + 1.0);
    log(1.0);
    v8 = PXFloatEqualToFloatWithTolerance();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
