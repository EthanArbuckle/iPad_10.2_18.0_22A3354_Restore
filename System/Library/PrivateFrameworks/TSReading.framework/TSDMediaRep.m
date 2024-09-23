@implementation TSDMediaRep

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(*(id *)&self->mIsZooming, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)TSDMediaRep;
  -[TSDStyledRep dealloc](&v3, sel_dealloc);
}

- (TSDMediaInfo)mediaInfo
{
  objc_opt_class();
  -[TSDRep info](self, "info");
  return (TSDMediaInfo *)TSUDynamicCast();
}

- (TSDMediaLayout)mediaLayout
{
  objc_opt_class();
  -[TSDRep layout](self, "layout");
  return (TSDMediaLayout *)TSUDynamicCast();
}

- (void)processChangedProperty:(int)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDMediaRep;
  -[TSDStyledRep processChangedProperty:](&v5, sel_processChangedProperty_);
  if (a3 == 527)
    -[TSDInteractiveCanvasController invalidateLayers](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "invalidateLayers");
}

- (void)willBeginZooming
{
  *((_BYTE *)&self->super.mFlags + 4) = 1;
  if (-[TSDMediaRep shouldShowMediaReplaceUI](self, "shouldShowMediaReplaceUI"))
    -[TSDInteractiveCanvasController layoutInvalidated](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
}

- (void)didEndZooming
{
  *((_BYTE *)&self->super.mFlags + 4) = 0;
  if (-[TSDMediaRep shouldShowMediaReplaceUI](self, "shouldShowMediaReplaceUI"))
    -[TSDInteractiveCanvasController layoutInvalidated](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
}

- (id)overlayLayers
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDMediaRep;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[TSDRep overlayLayers](&v5, sel_overlayLayers));
  if (-[TSDRep isSelected](self, "isSelected")
    && -[TSDMediaRep shouldShowMediaReplaceUI](self, "shouldShowMediaReplaceUI"))
  {
    -[TSDMediaRep p_addLayerForReplaceButtonToArray:](self, "p_addLayerForReplaceButtonToArray:", v3);
  }
  return v3;
}

- (id)additionalLayersOverLayer
{
  TSDInteractiveCanvasController *v3;
  void *v4;
  objc_super v6;

  v3 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
  v6.receiver = self;
  v6.super_class = (Class)TSDMediaRep;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[TSDRep additionalLayersOverLayer](&v6, sel_additionalLayersOverLayer));
  if (!*((_BYTE *)&self->super.mFlags + 4)
    && !-[TSDInteractiveCanvasController inReadMode](v3, "inReadMode")
    && -[TSDMediaRep shouldShowMediaReplaceUI](self, "shouldShowMediaReplaceUI")
    && !-[TSDRep isSelected](self, "isSelected"))
  {
    if (!v4)
      v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    -[TSDMediaRep p_addLayerForReplaceButtonToArray:](self, "p_addLayerForReplaceButtonToArray:", v4);
  }
  return v4;
}

- (BOOL)canResetMediaSize
{
  return !-[TSDDrawableInfo isLocked](-[TSDMediaRep mediaInfo](self, "mediaInfo"), "isLocked");
}

- (BOOL)shouldCreateKnobs
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDMediaRep;
  return -[TSDRep shouldCreateKnobs](&v4, sel_shouldCreateKnobs)
      || -[TSDMediaRep shouldShowMediaReplaceUI](self, "shouldShowMediaReplaceUI");
}

- (void)addKnobsToArray:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMediaRep;
  -[TSDRep addKnobsToArray:](&v3, sel_addKnobsToArray_, a3);
}

- (void)updatePositionsOfKnobs:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMediaRep;
  -[TSDRep updatePositionsOfKnobs:](&v3, sel_updatePositionsOfKnobs_, a3);
}

- (CGPoint)positionOfHyperlinkKnob
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGPoint result;

  v12.receiver = self;
  v12.super_class = (Class)TSDMediaRep;
  -[TSDRep positionOfHyperlinkKnob](&v12, sel_positionOfHyperlinkKnob);
  v4 = v3;
  v6 = v5;
  if (-[TSDMediaRep shouldShowMediaReplaceUI](self, "shouldShowMediaReplaceUI"))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C90], "imageNamed:inBundle:", CFSTR("sf-mac_canvas_btn_placeholder-small-N"), TSDBundle()), "size");
    v8 = v7;
    -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
    v4 = v4 - v8 / v9;
  }
  v10 = v4;
  v11 = v6;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)isPlaceholder
{
  return -[TSDMediaInfo isPlaceholder](-[TSDMediaRep mediaInfo](self, "mediaInfo"), "isPlaceholder");
}

- (BOOL)shouldShowMediaReplaceUI
{
  TSDMediaInfo *v3;
  TSDInteractiveCanvasController *v4;
  TSDInteractiveCanvasControllerDelegate *v5;
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  TSDInteractiveCanvasController *v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v3 = -[TSDMediaRep mediaInfo](self, "mediaInfo");
  v4 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
  v5 = -[TSDInteractiveCanvasController delegate](v4, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:imageReplaceBadgeBehaviorForRep:](v5, "interactiveCanvasController:imageReplaceBadgeBehaviorForRep:", v4, self);
  else
    v6 = 0;
  v7 = -[TSDMediaInfo wasMediaReplaced](v3, "wasMediaReplaced");
  v8 = v6 != 2 && v7;
  v9 = -[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive");
  if (v9)
  {
    v9 = -[TSDLayout isInTopLevelContainerForEditing](-[TSDRep layout](self, "layout"), "isInTopLevelContainerForEditing");
    if (v9)
    {
      if (!-[TSDMediaInfo isPlaceholder](v3, "isPlaceholder") || v8)
      {
        LOBYTE(v9) = 0;
      }
      else
      {
        v10 = -[TSDRep isLocked](self, "isLocked");
        LOBYTE(v9) = 0;
        if (!v10 && v6 != 1)
        {
          -[TSDMediaRep p_replaceButtonSize](self, "p_replaceButtonSize");
          v13 = TSDAddSizes(v11, v12, 3.0);
          v15 = v14;
          v16 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
          -[TSDRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
          -[TSDInteractiveCanvasController convertUnscaledToBoundsSize:](v16, "convertUnscaledToBoundsSize:", v17, v18);
          LOBYTE(v9) = v15 <= v20 && v13 <= v19;
        }
      }
    }
  }
  return v9;
}

- (id)currentReplaceButtonImage
{
  return (id)objc_msgSend(MEMORY[0x24BEB3C90], "imageNamed:inBundle:", CFSTR("sf-canvas-placeholder"), TSDBundle());
}

- (id)currentReplaceButtonHighlightedImage
{
  return (id)objc_msgSend(MEMORY[0x24BEB3C90], "imageNamed:inBundle:", CFSTR("sf-canvas-placeholder-P"), TSDBundle());
}

- (BOOL)replaceButtonContainsPoint:(CGPoint)a3
{
  double y;
  double x;
  int v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;

  y = a3.y;
  x = a3.x;
  v6 = -[TSDMediaRep shouldShowMediaReplaceUI](self, "shouldShowMediaReplaceUI");
  if (v6)
  {
    v7 = -[TSDMediaRep p_tapToReplaceLayer](self, "p_tapToReplaceLayer");
    -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "convertUnscaledToBoundsPoint:", x, y);
    objc_msgSend(v7, "convertPoint:fromLayer:", -[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), v8, v9);
    v11 = v10;
    v13 = v12;
    v6 = objc_msgSend(v7, "containsPoint:");
    if (v6)
    {
      -[TSDMediaRep p_replaceButtonSize](self, "p_replaceButtonSize");
      v15 = v14 * 0.5;
      objc_msgSend(v7, "bounds");
      v20 = TSDCenterOfRect(v16, v17, v18, v19);
      LOBYTE(v6) = v15 > TSDDistance(v20, v21, v11, v13);
    }
  }
  return v6;
}

- (id)p_tapToReplaceLayer
{
  id v3;

  v3 = -[TSDMediaRep currentReplaceButtonImage](self, "currentReplaceButtonImage");
  if (!*(_QWORD *)&self->mIsZooming)
    *(_QWORD *)&self->mIsZooming = objc_alloc_init(TSDNoDefaultImplicitActionLayer);
  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  objc_msgSend(*(id *)&self->mIsZooming, "setContents:", objc_msgSend(v3, "CGImageForContentsScale:"));
  objc_msgSend(v3, "size");
  objc_msgSend(*(id *)&self->mIsZooming, "setBounds:", TSDRectWithSize());
  return *(id *)&self->mIsZooming;
}

- (void)p_addLayerForReplaceButtonToArray:(id)a3
{
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[TSDMediaRep p_updateTapToReplaceLayerPosition](self, "p_updateTapToReplaceLayerPosition");
  objc_msgSend(a3, "addObject:", -[TSDMediaRep p_tapToReplaceLayer](self, "p_tapToReplaceLayer"));
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (CGSize)p_replaceButtonSize
{
  _BOOL4 v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  CGSize result;

  v3 = -[TSDRep shouldDisplayHyperlinkUI](self, "shouldDisplayHyperlinkUI");
  v5 = *MEMORY[0x24BDBF148];
  v4 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v3)
  {
    v6 = sTapToReplaceButtonImageSmallSize_0;
    v7 = sTapToReplaceButtonImageSmallSize_1;
    if (*(double *)&sTapToReplaceButtonImageSmallSize_0 == v5 && *(double *)&sTapToReplaceButtonImageSmallSize_1 == v4)
    {
      objc_msgSend(-[TSDMediaRep currentReplaceButtonImage](self, "currentReplaceButtonImage", *(double *)&sTapToReplaceButtonImageSmallSize_0, *(double *)&sTapToReplaceButtonImageSmallSize_1, v4), "size");
      sTapToReplaceButtonImageSmallSize_0 = v6;
      sTapToReplaceButtonImageSmallSize_1 = v7;
    }
  }
  else
  {
    v6 = sTapToReplaceButtonImageSize_0;
    v7 = sTapToReplaceButtonImageSize_1;
    if (*(double *)&sTapToReplaceButtonImageSize_0 == v5 && *(double *)&sTapToReplaceButtonImageSize_1 == v4)
    {
      objc_msgSend(-[TSDMediaRep currentReplaceButtonImage](self, "currentReplaceButtonImage", *(double *)&sTapToReplaceButtonImageSize_0, *(double *)&sTapToReplaceButtonImageSize_1, v4), "size");
      sTapToReplaceButtonImageSize_0 = v6;
      sTapToReplaceButtonImageSize_1 = v7;
    }
  }
  result.height = *(double *)&v7;
  result.width = *(double *)&v6;
  return result;
}

- (CGPoint)p_scaledPositionOfImageReplaceKnob
{
  TSDInteractiveCanvasController *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double MaxX;
  double v15;
  double v16;
  double v17;
  double MaxY;
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
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGPoint result;
  CGRect v42;
  CGRect v43;

  v3 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
  -[TSDRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
  v13 = v12;
  v42.origin.x = v5;
  v42.origin.y = v7;
  v42.size.width = v9;
  v42.size.height = v11;
  MaxX = CGRectGetMaxX(v42);
  -[TSDMediaRep p_replaceButtonSize](self, "p_replaceButtonSize");
  v16 = -1.0 / v13;
  v17 = MaxX + -1.0 / v13 * (v15 * 0.5 + 3.0);
  v43.origin.x = v5;
  v43.origin.y = v7;
  v43.size.width = v9;
  v43.size.height = v11;
  MaxY = CGRectGetMaxY(v43);
  -[TSDMediaRep p_replaceButtonSize](self, "p_replaceButtonSize");
  -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", v17, MaxY + v16 * (v19 * 0.5 + 3.0));
  v21 = v20;
  v23 = v22;
  -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v3, "convertUnscaledToBoundsPoint:");
  v25 = v24;
  v27 = v26;
  if (-[TSDRep parentRep](self, "parentRep"))
  {
    -[TSDRep convertNaturalPointFromUnscaledCanvas:](-[TSDRep parentRep](self, "parentRep"), "convertNaturalPointFromUnscaledCanvas:", v21, v23);
    -[TSDRep convertNaturalPointToLayerRelative:](-[TSDRep parentRep](self, "parentRep"), "convertNaturalPointToLayerRelative:", v28, v29);
    v25 = v30;
    v27 = v31;
  }
  -[TSDMediaRep p_replaceButtonSize](self, "p_replaceButtonSize");
  v32 = TSDRectWithSize();
  v36 = TSDCenterOfRect(v32, v33, v34, v35);
  TSDSubtractPoints(v25, v27, v36);
  v37 = TSDRoundedPoint();
  v39 = TSDAddPoints(v37, v38, v36);
  result.y = v40;
  result.x = v39;
  return result;
}

- (void)p_updateTapToReplaceLayerPosition
{
  TSDInteractiveCanvasController *v3;
  id v4;
  TSDAbstractLayout *v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v3 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
  v4 = -[TSDMediaRep p_tapToReplaceLayer](self, "p_tapToReplaceLayer");
  -[TSDMediaRep p_scaledPositionOfImageReplaceKnob](self, "p_scaledPositionOfImageReplaceKnob");
  objc_msgSend(v4, "setPosition:");
  if (-[TSDAbstractLayout parent](-[TSDRep layout](self, "layout"), "parent")
    && -[TSDRep isSelected](self, "isSelected"))
  {
    v5 = -[TSDAbstractLayout parent](-[TSDRep layout](self, "layout"), "parent");
    if (v5)
    {
      -[TSDAbstractLayout transformInRoot](v5, "transformInRoot");
      v6 = v13;
      v7 = v14;
      v8 = v15;
    }
    else
    {
      v8 = 0uLL;
      v14 = 0u;
      v15 = 0u;
      v13 = 0u;
      v6 = 0uLL;
      v7 = 0uLL;
    }
    -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v3, "convertUnscaledToBoundsPoint:", vaddq_f64(v8, vmlaq_n_f64(vmulq_n_f64(v7, *(double *)(MEMORY[0x24BDBEFB0] + 8)), v6, *MEMORY[0x24BDBEFB0])), *(_OWORD *)&v13, *(_OWORD *)&v14, *(_OWORD *)&v15);
    v10 = v9;
    objc_msgSend(-[TSDMediaRep p_tapToReplaceLayer](self, "p_tapToReplaceLayer"), "position");
    objc_msgSend(v4, "setPosition:", TSDAddPoints(v11, v12, v10));
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)i_updateFrameRep
{
  id v3;
  CALayer *mFrameMaskLayer;
  uint64_t v5;
  CALayer *v6;
  CALayer *v7;

  v3 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
  if (-[TSDMediaRep i_shouldRenderStroke:](self, "i_shouldRenderStroke:", v3)
    && objc_msgSend(v3, "isFrame"))
  {
    mFrameMaskLayer = self->mFrameMaskLayer;
    if (!mFrameMaskLayer)
    {
LABEL_6:
      self->mFrameMaskLayer = (CALayer *)-[TSDFrameRep initWithTSDFrame:]([TSDFrameRep alloc], "initWithTSDFrame:", v3);
      return;
    }
    v5 = -[CALayer frame](mFrameMaskLayer, "frame");
    v6 = self->mFrameMaskLayer;
    if ((id)v5 != v3)
    {

      self->mFrameMaskLayer = 0;
      goto LABEL_6;
    }
    if (!v6)
      goto LABEL_6;
  }
  else
  {
    v7 = self->mFrameMaskLayer;
    if (v7)
    {

      self->mFrameMaskLayer = 0;
    }
  }
}

- (BOOL)i_shouldRenderStroke:(id)a3
{
  id v5;
  int v6;

  v5 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  LOBYTE(v6) = 0;
  if (a3)
  {
    if (v5 != a3)
    {
      v6 = objc_msgSend(a3, "shouldRender");
      if (v6)
      {
        if (objc_msgSend(a3, "isFrame"))
          LOBYTE(v6) = -[TSDMediaLayout shouldRenderFrameStroke](-[TSDMediaRep mediaLayout](self, "mediaLayout"), "shouldRenderFrameStroke");
        else
          LOBYTE(v6) = 1;
      }
    }
  }
  return v6;
}

@end
