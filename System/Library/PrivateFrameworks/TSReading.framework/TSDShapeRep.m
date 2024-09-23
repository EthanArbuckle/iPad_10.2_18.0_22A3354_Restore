@implementation TSDShapeRep

- (TSDShapeRep)initWithLayout:(id)a3 canvas:(id)a4
{
  TSDShapeRep *v4;
  TSDShapeRep *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDShapeRep;
  v4 = -[TSDRep initWithLayout:canvas:](&v7, sel_initWithLayout_canvas_, a3, a4);
  v5 = v4;
  if (v4)
  {
    if (!-[TSDShapeRep shapeInfo](v4, "shapeInfo") || !-[TSDShapeRep shapeLayout](v5, "shapeLayout"))
    {

      v5 = 0;
    }
    objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeInfo](v5, "shapeInfo"), "fill"), "addInterest");
  }
  return v5;
}

- (id)shapeInfo
{
  objc_opt_class();
  -[TSDRep info](self, "info");
  return (id)TSUDynamicCast();
}

- (id)shapeLayout
{
  objc_opt_class();
  -[TSDRep layout](self, "layout");
  return (id)TSUDynamicCast();
}

- (CGRect)frameInUnscaledCanvas
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  objc_super v9[3];
  objc_super v10;
  CGRect v11;

  v10.receiver = self;
  v10.super_class = (Class)TSDShapeRep;
  -[TSDRep frameInUnscaledCanvas](&v10, sel_frameInUnscaledCanvas);
  v4 = v3;
  v6 = v5;
  if (!self->mFrameInUnscaledCanvasIsValid)
  {
    v7 = -[TSDShapeRep shapeLayout](self, "shapeLayout");
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "transformInRoot");
    else
      memset(v9, 0, sizeof(v9));
    objc_msgSend(v8, "shapeFrameWithTransform:", v9);
    self->mFrameInUnscaledCanvasRelativeToSuper = CGRectOffset(v11, -v4, -v6);
    self->mFrameInUnscaledCanvasIsValid = 1;
  }
  return CGRectOffset(self->mFrameInUnscaledCanvasRelativeToSuper, v4, v6);
}

- (CGRect)layerFrameInScaledCanvas
{
  TSDCanvas *mCanvas;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect result;

  if (-[TSDShapeRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    mCanvas = self->super.super.mCanvas;
    -[TSDShapeRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
    -[TSDCanvas convertUnscaledToBoundsRect:](mCanvas, "convertUnscaledToBoundsRect:");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
    v13 = TSDAliasRoundedRectForScale(v5, v7, v9, v11, v12);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)TSDShapeRep;
    -[TSDRep layerFrameInScaledCanvas](&v17, sel_layerFrameInScaledCanvas);
  }
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)layerFrameInScaledCanvasRelativeToParent
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
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGRect result;

  v15.receiver = self;
  v15.super_class = (Class)TSDShapeRep;
  -[TSDRep layerFrameInScaledCanvasRelativeToParent](&v15, sel_layerFrameInScaledCanvasRelativeToParent);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[TSDShapeRep isInvisible](self, "isInvisible") && TSDRectHasNaNComponents())
  {
    v4 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v10 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDShapeRep;
  -[TSDRep layoutInRootChangedFrom:to:translatedOnly:](&v7, sel_layoutInRootChangedFrom_to_translatedOnly_, a3, a4);
  if (!a5)
    self->mFrameInUnscaledCanvasIsValid = 0;
}

- (BOOL)directlyManagesLayerContent
{
  _BOOL4 mDirectlyManagesLayerContent;
  BOOL result;
  id v5;
  objc_super v6;

  mDirectlyManagesLayerContent = self->mDirectlyManagesLayerContent;
  if (-[TSDShapeRep isInvisible](self, "isInvisible")
    || -[TSDShapeRep p_canApplyStrokeToLayer](self, "p_canApplyStrokeToLayer")
    && -[TSDShapeRep p_canApplyFillToLayer](self, "p_canApplyFillToLayer"))
  {
    result = 1;
    self->mDirectlyManagesLayerContent = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TSDShapeRep;
    result = -[TSDRep directlyManagesLayerContent](&v6, sel_directlyManagesLayerContent);
    self->mDirectlyManagesLayerContent = result;
    if (mDirectlyManagesLayerContent && !result)
    {
      v5 = -[TSDInteractiveCanvasController layerForRep:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self);
      objc_msgSend(v5, "setContents:", 0);
      objc_msgSend(v5, "setBackgroundColor:", 0);
      objc_msgSend(v5, "setBorderColor:", 0);
      objc_msgSend(v5, "setBorderWidth:", 0.0);
      objc_msgSend(v5, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);
      return self->mDirectlyManagesLayerContent;
    }
  }
  return result;
}

- (CGRect)clipRect
{
  objc_super v2;
  CGRect v3;

  v2.receiver = self;
  v2.super_class = (Class)TSDShapeRep;
  -[TSDStyledRep clipRect](&v2, sel_clipRect);
  return CGRectInset(v3, -1.0, -1.0);
}

- (void)willBeRemoved
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDShapeRep;
  -[TSDRep willBeRemoved](&v3, sel_willBeRemoved);
  objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeInfo](self, "shapeInfo"), "fill"), "removeInterest");
}

- (BOOL)p_beginApplyOpacity:(CGContext *)a3 forDrawingInOneStep:(BOOL)a4
{
  double v7;
  double x;
  double v10;
  double y;
  double v12;
  double width;
  double v14;
  double height;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v37 = *MEMORY[0x24BDAC8D0];
  -[TSDStyledRep opacity](self, "opacity");
  if (v7 >= 1.0)
    return 0;
  CGContextSetAlpha(a3, v7);
  if (a4)
    return 0;
  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](-[TSDRep layout](self, "layout"), "geometry"), "size");
  x = TSDRectWithSize();
  y = v10;
  width = v12;
  height = v14;
  v16 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
  if (v16)
  {
    v17 = v16;
    if (objc_msgSend(v16, "isFrame"))
    {
      objc_msgSend(v17, "coverageRect:", x, y, width, height);
      x = v18;
      y = v19;
      width = v20;
      height = v21;
    }
  }
  v22 = (void *)TSUProtocolCast();
  if (v22)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v23 = (void *)objc_msgSend(v22, "childReps", 0);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v33;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v27), "layout"), "frame");
          v41.origin.x = v28;
          v41.origin.y = v29;
          v41.size.width = v30;
          v41.size.height = v31;
          v38.origin.x = x;
          v38.origin.y = y;
          v38.size.width = width;
          v38.size.height = height;
          v39 = CGRectUnion(v38, v41);
          x = v39.origin.x;
          y = v39.origin.y;
          width = v39.size.width;
          height = v39.size.height;
          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v25);
    }
  }
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  CGContextBeginTransparencyLayerWithRect(a3, v40, 0);
  return 1;
}

- (void)p_endApplyOpacity:(CGContext *)a3 apply:(BOOL)a4
{
  if (a4)
    CGContextEndTransparencyLayer(a3);
}

- (void)addBitmapsToRenderingQualityInfo:(id)a3 inContext:(CGContext *)a4
{
  void *v7;

  objc_opt_class();
  objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill");
  v7 = (void *)TSUDynamicCast();
  if (v7)
    objc_msgSend(v7, "addBitmapsToRenderingQualityInfo:forShapeRep:inContext:", a3, self, a4);
}

- (void)recursivelyDrawChildrenInContext:(CGContext *)a3
{
  _BOOL8 v5;
  objc_super v6;

  v5 = -[TSDShapeRep p_beginApplyOpacity:forDrawingInOneStep:](self, "p_beginApplyOpacity:forDrawingInOneStep:", a3, 0);
  v6.receiver = self;
  v6.super_class = (Class)TSDShapeRep;
  -[TSDRep recursivelyDrawChildrenInContext:](&v6, sel_recursivelyDrawChildrenInContext_, a3);
  -[TSDShapeRep p_endApplyOpacity:apply:](self, "p_endApplyOpacity:apply:", a3, v5);
}

- (void)p_drawChildrenWithoutOpacityInContext:(CGContext *)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDShapeRep;
  -[TSDRep recursivelyDrawChildrenInContext:](&v3, sel_recursivelyDrawChildrenInContext_, a3);
}

- (void)drawInLayerContext:(CGContext *)a3
{
  -[TSDShapeRep p_drawInContext:withContent:withStroke:withOpacity:](self, "p_drawInContext:withContent:withStroke:withOpacity:", a3, 1, 1, 0);
}

- (BOOL)isEditingChildRep
{
  return 0;
}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  double v15;

  v8 = a8;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  if (!-[TSDShapeRep isInvisible](self, "isInvisible")
    || !v10 && (-[TSDStyledRep opacity](self, "opacity"), v15 == 0.0))
  {
    -[TSDShapeRep p_drawInContext:withContent:withStroke:withOpacity:](self, "p_drawInContext:withContent:withStroke:withOpacity:", a3, v12, v11, v10);
  }
  if (v8 && (!self->mShadowOnChildrenDisabled || !a7))
  {
    if (v10)
      -[TSDShapeRep recursivelyDrawChildrenInContext:](self, "recursivelyDrawChildrenInContext:", a3);
    else
      -[TSDShapeRep p_drawChildrenWithoutOpacityInContext:](self, "p_drawChildrenWithoutOpacityInContext:", a3);
  }
}

- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  _BOOL4 v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  id v24;
  id v25;
  _BOOL4 v26;
  TSDFrameRep *v27;
  TSDFrameRep *v28;
  id v29;
  int v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  id v43;
  uint64_t v44;
  int v45;
  id v46;
  _BOOL4 v47;
  CGAffineTransform v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  CGRect v53;
  CGRect v54;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v11 = -[TSDCanvas shouldSuppressBackgrounds](-[TSDRep canvas](self, "canvas"), "shouldSuppressBackgrounds");
  if (v11 != TSDCGContextHasBackgroundsSuppressed((uint64_t)a3))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeRep p_drawInContext:withContent:withStroke:withOpacity:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeRep.m"), 436, CFSTR("Canvas and CGContext disagree about whether we are suppressing backgrounds"));
  }
  v14 = -[TSDShapeRep shapeInfo](self, "shapeInfo");
  v15 = -[TSDShapeRep shapeLayout](self, "shapeLayout");
  v16 = objc_msgSend((id)objc_msgSend(v15, "path"), "CGPath");
  if ((v8 || v7) && v16)
  {
    CGContextSaveGState(a3);
    v17 = v6
       && -[TSDShapeRep p_beginApplyOpacity:forDrawingInOneStep:](self, "p_beginApplyOpacity:forDrawingInOneStep:", a3, -[TSDShapeRep p_drawsSelfInOneStep](self, "p_drawsSelfInOneStep"));
    objc_msgSend(v15, "pathBounds");
    v19 = v18;
    v21 = v20;
    CGContextTranslateCTM(a3, -v18, -v20);
    -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
    v23 = v22 * TSDCGContextAssociatedScreenScale((uint64_t)a3);
    v51 = *MEMORY[0x24BDBEFB0];
    v52 = v51;
    v24 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
    if (objc_msgSend(v24, "shouldRender"))
      v25 = v24;
    else
      v25 = 0;
    v49 = 0;
    v50 = 0;
    objc_msgSend(v15, "aliasPathForScale:adjustedStroke:adjustedPath:startDelta:endDelta:", &v50, &v49, &v52, &v51, v23, v25);
    v47 = v17;
    if (objc_msgSend(v15, "pathIsOpen"))
    {
      if (objc_msgSend(v14, "headLineEnd"))
        v26 = 1;
      else
        v26 = objc_msgSend(v14, "tailLineEnd") != 0;
    }
    else
    {
      v26 = 0;
    }
    v27 = 0;
    if (v7 && v50)
    {
      if (objc_msgSend(v50, "shouldRender") && objc_msgSend(v50, "isFrame"))
      {
        v28 = [TSDFrameRep alloc];
        v27 = -[TSDFrameRep initWithTSDFrame:](v28, "initWithTSDFrame:", v50);
      }
      else
      {
        v27 = 0;
      }
    }
    if (v8)
    {
      if (v27 && objc_msgSend(v50, "hasMask"))
      {
        CGContextSaveGState(a3);
        v29 = v50;
        objc_msgSend(v15, "pathBoundsWithoutStroke");
        objc_msgSend(v29, "coverageRect:");
        -[TSDFrameRep applyMaskForRectWithCoverage:toContext:](v27, "applyMaskForRectWithCoverage:toContext:", a3);
        -[TSDFrameRep blendMaskBeforeRenderingImageInContext:](v27, "blendMaskBeforeRenderingImageInContext:", a3);
        v30 = 1;
      }
      else
      {
        v30 = 0;
      }
      v31 = (void *)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill");
      if (v31)
      {
        v32 = v31;
        if (((objc_msgSend(v31, "isClear") | v11) & 1) == 0)
        {
          -[TSDRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
          v54 = CGRectOffset(v53, v19, v21);
          objc_msgSend(v32, "paintPath:naturalBounds:inContext:isPDF:", objc_msgSend(v49, "CGPath"), a3, -[TSDCanvas isDrawingIntoPDF](-[TSDRep canvas](self, "canvas"), "isDrawingIntoPDF"), v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);
        }
      }
      if (v30)
        CGContextRestoreGState(a3);
    }
    if (v7 && v50 && objc_msgSend(v50, "shouldRender"))
    {
      if (v27)
      {
        objc_msgSend(v15, "pathBoundsWithoutStroke");
        v34 = v33;
        v36 = v35;
        v38 = v37;
        v40 = v39;
        CGContextGetCTM(&v48, a3);
        -[TSDFrameRep frameRect:inContext:withTotalScale:](v27, "frameRect:inContext:withTotalScale:", a3, v34, v36, v38, v40, TSDTransformScale(&v48.a));
      }
      else
      {
        if (v26 && (objc_msgSend((id)objc_msgSend(v50, "color"), "alphaComponent"), v41 < 1.0))
        {
          CGContextSaveGState(a3);
          objc_msgSend((id)objc_msgSend(v50, "color"), "alphaComponent");
          CGContextSetAlpha(a3, v42);
          CGContextBeginTransparencyLayer(a3, 0);
          v43 = v50;
          if (v50 == v46)
          {
            v43 = (id)objc_msgSend(v46, "mutableCopy");
            v50 = v43;
          }
          v44 = objc_msgSend((id)objc_msgSend(v43, "color"), "colorWithAlphaComponent:", 1.0);
          objc_msgSend(v50, "setColor:", v44);
          v45 = 1;
        }
        else
        {
          v45 = 0;
        }
        objc_msgSend(v50, "paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:", objc_msgSend(v49, "CGPath"), 0, a3, 0, 0, 0);
        if (v26)
        {
          CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend((id)objc_msgSend(v50, "color"), "CGColor"));
          CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend((id)objc_msgSend(v50, "color"), "CGColor"));
          -[TSDShapeRep p_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:](self, "p_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:", 1, v50, a3, 0, v51);
          -[TSDShapeRep p_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:](self, "p_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:", 0, v50, a3, 0, v52);
        }
        if (v45)
        {
          CGContextEndTransparencyLayer(a3);
          CGContextRestoreGState(a3);
        }
      }
    }

    if (v6)
      -[TSDShapeRep p_endApplyOpacity:apply:](self, "p_endApplyOpacity:apply:", a3, v47);
    CGContextRestoreGState(a3);
  }
}

- (id)imageOfStroke:(CGRect *)a3
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGContext *v14;
  CGImage *Image;
  void *v16;

  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v9 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
  if (v9 && objc_msgSend(v9, "shouldRender"))
  {
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "frame");
    v5 = v10;
    v6 = v11;
    v7 = v12;
    v8 = v13;
    v14 = TSDBitmapContextCreate(11, v12);
    -[TSDShapeRep p_drawInContext:withContent:withStroke:withOpacity:](self, "p_drawInContext:withContent:withStroke:withOpacity:", v14, 0, 1, 0);
    Image = CGBitmapContextCreateImage(v14);
    v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C90], "imageWithCGImage:", Image);
    CGContextRelease(v14);
    CGImageRelease(Image);
  }
  else
  {
    v16 = 0;
  }
  a3->origin.x = v5;
  a3->origin.y = v6;
  a3->size.width = v7;
  a3->size.height = v8;
  return v16;
}

- (void)willUpdateLayer:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  float v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  TSDTilingLayer *v19;
  CALayer *mShadowLayer;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;

  v5 = -[TSDShapeRep shapeInfo](self, "shapeInfo");
  v6 = (void *)objc_msgSend(v5, "shadow");
  v7 = (void *)objc_msgSend(-[TSDShapeRep shapeInfo](self, "shapeInfo"), "fill");
  v8 = objc_msgSend(v7, "isOpaque");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 |= objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "imageData"), "filename"), "pathExtension"), "lowercaseString"), "isEqualToString:", CFSTR("jpg"));
  if (v7
    && v8
    && ((objc_msgSend(v5, "opacity"), v9 == 1.0) || fabs(v9 + -1.0) < 0.000000999999997)
    && (objc_msgSend((id)objc_msgSend(v5, "stroke"), "isFrame") & 1) == 0
    && (objc_msgSend((id)objc_msgSend(v5, "geometry"), "angle"), v10 == 0.0))
  {
    if (v6 && objc_msgSend(v6, "isEnabled"))
    {
      v11 = objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathSource");
      if (v11)
      {
        v12 = (void *)v11;
        -[TSDRep scaleToConvertNaturalToLayerRelative](self, "scaleToConvertNaturalToLayerRelative");
        v14 = v13;
        memset(&v39, 0, sizeof(v39));
        v15 = (void *)objc_msgSend(v5, "geometry");
        objc_msgSend((id)objc_msgSend(v5, "geometry"), "size");
        v17 = v16;
        objc_msgSend((id)objc_msgSend(v5, "geometry"), "size");
        if (v15)
          objc_msgSend(v15, "transformBasedOnRect:", 0.0, 0.0, v17, v18);
        else
          memset(&v39, 0, sizeof(v39));
        v37 = v39;
        memset(&v38, 0, sizeof(v38));
        CGAffineTransformScale(&v38, &v37, v14, v14);
        v21 = (void *)objc_msgSend((id)objc_msgSend(v12, "interiorWrapPath"), "copy");
        v37 = v38;
        objc_msgSend(v21, "transformUsingAffineTransform:", &v37);
        v22 = (void *)objc_msgSend(v5, "stroke");
        if (!objc_msgSend(v22, "shouldRender"))
          v22 = 0;
        v25 = 0.0;
        if (v22)
        {
          if ((objc_msgSend(v22, "isFrame") & 1) == 0)
          {
            objc_msgSend(v22, "width");
            v23 = v14 * v26;
            v25 = 1.0;
            if (v23 > 1.0)
            {
              TSURound();
              v25 = v23;
            }
          }
        }
        *(float *)&v23 = v14;
        *(float *)&v24 = v25;
        v27 = (void *)objc_msgSend(v21, "aliasedPathWithViewScale:effectiveStrokeWidth:", v23, v24);
        if (v25 > 0.0)
        {
          v28 = v25 * 0.5;
          v27 = (void *)objc_msgSend(v27, "bezierPathByOffsettingPath:joinStyle:withThreshold:", (int)objc_msgSend(v22, "join"), v28, 1.0);
          CGAffineTransformMakeTranslation(&v36, v28, v28);
          objc_msgSend(v27, "transformUsingAffineTransform:", &v36);
        }
        objc_msgSend(a3, "setShadowPath:", objc_msgSend(v27, "CGPath"));

        objc_msgSend(v6, "opacity");
        *(float *)&v29 = v29;
        objc_msgSend(a3, "setShadowOpacity:", v29);
        objc_msgSend(v6, "radius");
        objc_msgSend(a3, "setShadowRadius:", v14 * v30 * 0.5);
        objc_msgSend(a3, "setShadowColor:", objc_msgSend(v6, "color"));
        objc_msgSend(v6, "angle");
        v32 = v31;
        objc_msgSend((id)objc_msgSend(v5, "geometry"), "angle");
        v34 = v32 - v33;
        v37.a = 0.0;
        v37.b = 0.0;
        objc_msgSend(v6, "offset");
        TSDOriginRotate(&v37.a, v14 * v35, v34 * 0.0174532925);
        objc_msgSend(a3, "setShadowOffset:", v37.a, v37.b);
      }
    }
    else
    {
      LODWORD(v10) = 0;
      objc_msgSend(a3, "setShadowOpacity:", v10);
      objc_msgSend(a3, "setShadowPath:", 0);
    }
  }
  else if (v6 && objc_msgSend(v6, "isEnabled"))
  {
    if (!self->super.mShadowLayer)
    {
      v19 = objc_alloc_init(TSDTilingLayer);
      self->super.mShadowLayer = &v19->super;
      -[TSDTilingLayer setDelegate:](v19, "setDelegate:", self);
      -[CALayer setNeedsDisplay](self->super.mShadowLayer, "setNeedsDisplay");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[CALayer setTilingMode:](self->super.mShadowLayer, "setTilingMode:", 1);
    }
  }
  else
  {
    mShadowLayer = self->super.mShadowLayer;
    if (mShadowLayer)
    {
      -[CALayer setDelegate:](mShadowLayer, "setDelegate:", 0);

      self->super.mShadowLayer = 0;
    }
  }
}

- (void)didUpdateLayer:(id)a3
{
  double v5;
  double v6;
  float v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TSDShapeRep;
  -[TSDStyledRep didUpdateLayer:](&v16, sel_didUpdateLayer_);
  -[TSDStyledRep opacity](self, "opacity");
  v6 = v5;
  objc_msgSend(a3, "opacity");
  v8 = v7;
  if (v6 != v8)
  {
    *(float *)&v8 = v6;
    objc_msgSend(a3, "setOpacity:", v8);
  }
  if (-[TSDShapeRep isInvisible](self, "isInvisible"))
  {
    objc_msgSend(a3, "setContents:", 0);
  }
  else if (!-[TSDShapeRep directlyManagesLayerContent](self, "directlyManagesLayerContent")
         && (objc_msgSend(a3, "tilingSafeHasContents") & 1) == 0)
  {
    objc_msgSend(a3, "setNeedsDisplay");
  }
  if (-[TSDShapeRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    -[TSDRep scaleToConvertNaturalToLayerRelative](self, "scaleToConvertNaturalToLayerRelative");
    v10 = v9;
    if (-[TSDShapeRep p_canApplyFillToLayer](self, "p_canApplyFillToLayer"))
    {
      if (objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill"))
      {
        objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill"), "applyToCALayer:withScale:", a3, v10);
      }
      else
      {
        objc_msgSend(a3, "setContents:", 0);
        objc_msgSend(a3, "setBackgroundColor:", 0);
      }
    }
    if (-[TSDShapeRep p_canApplyStrokeToLayer](self, "p_canApplyStrokeToLayer"))
    {
      if (-[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke"))
      {
        -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
        v15 = 0;
        objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout", 0, 0, 0, 0, 0), "aliasPathForScale:adjustedStroke:adjustedPath:startDelta:endDelta:", &v15, &v14, &v13, &v12, v10 * v11);
        objc_msgSend(v15, "applyToRepRenderable:withScale:", +[TSDRenderable renderableFromLayer:](TSDRenderable, "renderableFromLayer:", a3), v10);
      }
      else
      {
        objc_msgSend(a3, "setBorderColor:", 0);
        objc_msgSend(a3, "setBorderWidth:", 0.0);
      }
    }
  }
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  int v7;
  double v8;
  double v9;
  uint64_t v10;
  _BOOL4 v14;
  id v15;
  uint64_t v16;
  CGContext *v17;
  _BYTE *Data;
  double v19;
  double v20;
  TSDMutableStroke *v21;
  TSDMutableStroke *v22;
  TSDMutableStroke *v23;
  double v24;
  double v25;
  double v26;
  CGPoint v28;

  y = a3.y;
  x = a3.x;
  v6 = -[TSDShapeRep shapeLayout](self, "shapeLayout");
  v7 = objc_msgSend(v6, "pathIsOpen");
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
  v9 = 40.0 / v8;
  -[TSDRep naturalBounds](self, "naturalBounds");
  if (v7)
    *(CGRect *)&v10 = CGRectInset(*(CGRect *)&v10, -v9, -v9);
  v28.x = x;
  v28.y = y;
  v14 = CGRectContainsPoint(*(CGRect *)&v10, v28);
  if (v14)
  {
    v15 = -[TSDShapeRep shapeInfo](self, "shapeInfo");
    v16 = objc_msgSend((id)objc_msgSend(v6, "path"), "CGPath");
    if (!v16)
    {
LABEL_25:
      LOBYTE(v14) = (_DWORD)v16 != 0;
      return v14;
    }
    v17 = TSDBitmapContextCreate(2, 1.0);
    Data = CGBitmapContextGetData(v17);
    objc_msgSend(v6, "pathBounds");
    CGContextTranslateCTM(v17, -v19, -v20);
    CGContextTranslateCTM(v17, -x, -y);
    if ((objc_msgSend(v6, "pathIsLineSegment") & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "blackColor"), "paintPath:inContext:", v16, v17);
      if (*Data)
      {
        LODWORD(v16) = 1;
LABEL_24:
        CGContextRelease(v17);
        goto LABEL_25;
      }
    }
    v21 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
    if (-[TSDStroke drawsOutsideStrokeBounds](v21, "drawsOutsideStrokeBounds"))
    {
      v22 = 0;
      if (!v7)
        goto LABEL_10;
    }
    else
    {
      v22 = objc_alloc_init(TSDMutableStroke);
      -[TSDMutableStroke width](v21, "width");
      -[TSDMutableStroke setWidth:](v22, "setWidth:");
      v21 = v22;
      if (!v7)
      {
LABEL_10:
        v23 = 0;
        if (!v21)
          goto LABEL_22;
        goto LABEL_16;
      }
    }
    v21 = (TSDMutableStroke *)-[TSDMutableStroke mutableCopy](v21, "mutableCopy");
    -[TSDMutableStroke width](v21, "width");
    if (v24 < v9)
      -[TSDMutableStroke setWidth:](v21, "setWidth:", v9);
    -[TSDMutableStroke setPattern:](v21, "setPattern:", +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern"));
    -[TSDMutableStroke setColor:](v21, "setColor:", objc_msgSend(MEMORY[0x24BEB3C40], "blackColor"));
    -[TSDMutableStroke setCap:](v21, "setCap:", 1);
    v23 = v21;
    if (!v21)
      goto LABEL_22;
LABEL_16:
    if (-[TSDStroke shouldRender](v21, "shouldRender"))
    {
      -[TSDStroke paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:](v21, "paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:", v16, 0, v17, 1, 0, 0);
      LODWORD(v16) = *Data != 0;
      if (*Data || ((v7 ^ 1) & 1) != 0)
        goto LABEL_23;
      if (objc_msgSend(v15, "headLineEnd") || objc_msgSend(v15, "tailLineEnd"))
      {
        CGContextSetStrokeColorWithColor(v17, (CGColorRef)-[TSUColor CGColor](-[TSDMutableStroke color](v21, "color"), "CGColor"));
        v25 = *MEMORY[0x24BDBEFB0];
        v26 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
        -[TSDShapeRep p_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:](self, "p_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:", 1, v21, v17, 1, *MEMORY[0x24BDBEFB0], v26);
        -[TSDShapeRep p_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:](self, "p_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:", 0, v21, v17, 1, v25, v26);
        LODWORD(v16) = *Data != 0;
LABEL_23:

        goto LABEL_24;
      }
    }
LABEL_22:
    LODWORD(v16) = 0;
    goto LABEL_23;
  }
  return v14;
}

- (BOOL)shouldExpandHitRegionWhenSmall
{
  id v2;

  v2 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
  if (v2)
    return objc_msgSend(v2, "shouldRender") ^ 1;
  else
    return 1;
}

- (double)shortestDistanceToPoint:(CGPoint)a3 countAsHit:(BOOL *)a4
{
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double result;
  CGPoint v17;
  CGRect v18;
  CGRect v19;

  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "stroke");
  if (v8)
  {
    objc_msgSend(v8, "width");
    v10 = v9 * 0.5;
  }
  else
  {
    v10 = 1.0;
  }
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
  if (6.0 / v11 > v10)
  {
    -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
    v10 = 6.0 / v12;
  }
  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](-[TSDRep layout](self, "layout"), "geometry"), "size");
  v18.origin.x = TSDRectWithSize();
  v19 = CGRectInset(v18, -v10, -v10);
  v17.x = x;
  v17.y = y;
  if (!CGRectContainsPoint(v19, v17))
    return 3.40282347e38;
  objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathBounds");
  v14 = TSDAddPoints(x, y, v13);
  objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "path"), "distanceToPoint:elementIndex:tValue:threshold:", 0, 0, v14, v15, 0.0);
  if (a4)
  {
    if (result < v10)
      *a4 = 1;
  }
  return result;
}

- (BOOL)intersectsUnscaledRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  TSDLayout *v9;
  char v10;
  _OWORD v12[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "i_wrapPath"), "copy");
  v9 = -[TSDRep layout](self, "layout");
  if (v9)
    -[TSDAbstractLayout transformInRoot](v9, "transformInRoot");
  else
    memset(v12, 0, sizeof(v12));
  objc_msgSend(v8, "transformUsingAffineTransform:", v12);
  v10 = objc_msgSend(v8, "intersectsRect:hasFill:", 1, x, y, width, height);

  return v10;
}

- (void)processChangedProperty:(int)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDShapeRep;
  -[TSDStyledRep processChangedProperty:](&v5, sel_processChangedProperty_);
  if ((a3 - 516) <= 0xA && ((1 << (a3 - 4)) & 0x4D3) != 0)
  {
    -[TSDStyledRep setNeedsDisplay](self, "setNeedsDisplay");
    if ((a3 - 517) <= 9 && ((1 << (a3 - 5)) & 0x261) != 0)
    {
      -[TSDRep invalidateKnobPositions](self, "invalidateKnobPositions");
      self->mFrameInUnscaledCanvasIsValid = 0;
      if (a3 == 526)
        -[TSDRep invalidateKnobs](self, "invalidateKnobs");
    }
  }
}

- (BOOL)isDraggable
{
  return 1;
}

- (CGRect)targetRectForEditMenu
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  v3 = *MEMORY[0x24BDBF070];
  v4 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF070] + 24);
  if (objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathIsLineSegment"))
  {
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "headPoint");
    v8 = v7;
    v10 = v9;
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "tailPoint");
    v12 = v11;
    v14 = v13;
    if (!-[TSDShapeRep i_editMenuOverlapsEndKnobs](self, "i_editMenuOverlapsEndKnobs"))
    {
      v15 = TSDMixPoints(v8, v10, v12, v14, 0.5);
      v3 = TSDRectWithCenterAndSize(v15, v16, 1.0);
      v4 = v17;
      v5 = v18;
      v6 = v19;
    }
  }
  v20 = v3;
  v21 = v4;
  v22 = v5;
  v23 = v6;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)shouldShowSelectionHighlight
{
  _BOOL4 v3;
  objc_super v5;

  if (!objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathIsLineSegment")
    || (v3 = -[TSDInteractiveCanvasController usesAlternateDrawableSelectionHighlight](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "usesAlternateDrawableSelectionHighlight")))
  {
    v5.receiver = self;
    v5.super_class = (Class)TSDShapeRep;
    LOBYTE(v3) = -[TSDStyledRep shouldShowSelectionHighlight](&v5, sel_shouldShowSelectionHighlight);
  }
  return v3;
}

- (BOOL)shouldHideSelectionHighlightDueToRectangularPath
{
  int v3;
  objc_super v5;

  v3 = objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "supportsResize");
  if (v3)
  {
    if (-[TSDShapeRep isInvisible](self, "isInvisible"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v5.receiver = self;
      v5.super_class = (Class)TSDShapeRep;
      LOBYTE(v3) = -[TSDStyledRep shouldHideSelectionHighlightDueToRectangularPath](&v5, sel_shouldHideSelectionHighlightDueToRectangularPath);
    }
  }
  return v3;
}

- (id)pathSourceForSelectionHighlightBehavior
{
  return (id)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathSource");
}

- (BOOL)canBeUsedForImageMask
{
  double v3;
  double v4;
  double v5;
  double v6;
  int v7;
  unsigned int v8;

  objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "path"), "bounds");
  v4 = v3;
  v6 = v5;
  v7 = objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "geometry"), "widthValid");
  if (v7)
  {
    v7 = objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "geometry"), "heightValid");
    if (v7)
    {
      if (-[TSDRep isPlaceholder](self, "isPlaceholder"))
      {
        LOBYTE(v7) = 0;
      }
      else
      {
        v8 = (v6 > 0.0) & ~objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "path"), "isLineSegment");
        if (v4 > 0.0)
          LOBYTE(v7) = v8;
        else
          LOBYTE(v7) = 0;
      }
    }
  }
  return v7;
}

- (unint64_t)enabledKnobMask
{
  objc_super v4;

  if ((objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathIsLineSegment") & 1) != 0)
    return 3072;
  if (!objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "supportsResize"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSDShapeRep;
  return -[TSDRep enabledKnobMask](&v4, sel_enabledKnobMask);
}

- (void)addSelectionKnobsToArray:(id)a3
{
  _BOOL4 v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  TSDKnob *v11;
  TSDKnob *v12;
  TSDKnob *v13;
  TSDKnob *v14;
  unint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t j;
  TSDKnob *v20;
  void *v21;
  TSDKnob *v22;
  uint64_t v23;
  double v24;
  double v25;
  TSDKnob *v26;
  TSDKnob *v27;
  objc_super v28;

  v5 = -[TSDShapeRep shouldShowSmartShapeKnobs](self, "shouldShowSmartShapeKnobs");
  v6 = -[TSDShapeRep shapeLayout](self, "shapeLayout");
  v7 = v6;
  if (v5)
  {
    v8 = objc_msgSend(v6, "numberOfControlKnobs");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        v11 = [TSDKnob alloc];
        objc_msgSend(v7, "getControlKnobPosition:", i + 12);
        v12 = -[TSDKnob initWithType:position:radius:tag:onRep:](v11, "initWithType:position:radius:tag:onRep:", 0, i + 12, self);
        objc_msgSend(a3, "addObject:", v12);

      }
    }
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v7, "pathSource");
    if (TSUDynamicCast())
    {
      v13 = [TSDKnob alloc];
      objc_msgSend(v7, "getControlKnobPosition:", 12);
      v14 = -[TSDKnob initWithType:position:radius:tag:onRep:](v13, "initWithType:position:radius:tag:onRep:", 0, 12, self);
      objc_msgSend(a3, "addObject:", v14);

    }
  }
  if (objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathIsLineSegment"))
  {
    v15 = -[TSDShapeRep enabledKnobMask](self, "enabledKnobMask");
    v16 = -[TSDInteractiveCanvasController defaultKnobTypeForRep:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "defaultKnobTypeForRep:", self);
    v17 = *MEMORY[0x24BDBEFB0];
    v18 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    for (j = 10; j != 12; ++j)
    {
      if ((TSDMaskForKnob(j) & v15) != 0)
      {
        v20 = -[TSDKnob initWithType:position:radius:tag:onRep:]([TSDKnob alloc], "initWithType:position:radius:tag:onRep:", v16, j, self, v17, v18, 15.0);
        objc_msgSend(a3, "addObject:", v20);

      }
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)TSDShapeRep;
  -[TSDRep addSelectionKnobsToArray:](&v28, sel_addSelectionKnobsToArray_, a3);
  if (-[TSDShapeRep shouldShowAdvancedGradientKnobs](self, "shouldShowAdvancedGradientKnobs"))
  {
    objc_opt_class();
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill");
    v21 = (void *)TSUDynamicCast();
    v22 = [TSDKnob alloc];
    if (objc_msgSend(v21, "gradientType") == 1)
      v23 = 25;
    else
      v23 = 24;
    v24 = *MEMORY[0x24BDBEFB0];
    v25 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v26 = -[TSDKnob initWithType:position:radius:tag:onRep:](v22, "initWithType:position:radius:tag:onRep:", 0, v23, self, *MEMORY[0x24BDBEFB0], v25, 15.0);
    objc_msgSend(a3, "addObject:", v26);

    v27 = -[TSDKnob initWithType:position:radius:tag:onRep:]([TSDKnob alloc], "initWithType:position:radius:tag:onRep:", 0, 26, self, v24, v25, 15.0);
    objc_msgSend(a3, "addObject:", v27);

  }
}

- (BOOL)shouldShowAdditionalKnobs
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;

  -[TSDRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v4 = v3;
  v6 = v5;
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
  v9 = TSDMultiplySizeScalar(v4, v6, v7) < 60.0 || v8 < 60.0;
  if (!v9
    && !-[TSDRep isPlaceholder](self, "isPlaceholder")
    && ((-[TSDShapeRep enabledKnobMask](self, "enabledKnobMask") & 0x200) != 0
     || (-[TSDShapeRep enabledKnobMask](self, "enabledKnobMask") & 0x80) != 0))
  {
    return !-[TSDRep isLocked](self, "isLocked");
  }
  else
  {
    return 0;
  }
}

- (BOOL)shouldShowAdvancedGradientKnobs
{
  return 0;
}

- (BOOL)shouldShowSmartShapeKnobs
{
  _BOOL4 v3;

  v3 = -[TSDShapeRep shouldShowAdditionalKnobs](self, "shouldShowAdditionalKnobs");
  if (v3)
    LOBYTE(v3) = objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "numberOfControlKnobs") != 0;
  return v3;
}

- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3
{
  objc_super v6;

  if ((unint64_t)objc_msgSend(a3, "tag") >= 0xC && (unint64_t)objc_msgSend(a3, "tag") < 0x11)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)TSDShapeRep;
  return -[TSDRep canUseSpecializedHitRegionForKnob:](&v6, sel_canUseSpecializedHitRegionForKnob_, a3);
}

- (BOOL)directlyManagesVisibilityOfKnob:(id)a3
{
  objc_super v6;

  if (objc_msgSend(a3, "tag") == 22)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)TSDShapeRep;
  return -[TSDRep directlyManagesVisibilityOfKnob:](&v6, sel_directlyManagesVisibilityOfKnob_, a3);
}

- (void)updatePositionsOfKnobs:(id)a3
{
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
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
  double v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  uint64_t v55;
  double v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  objc_super v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v72.receiver = self;
  v72.super_class = (Class)TSDShapeRep;
  -[TSDRep updatePositionsOfKnobs:](&v72, sel_updatePositionsOfKnobs_);
  v5 = -[TSDShapeRep shapeLayout](self, "shapeLayout");
  if (objc_msgSend(v5, "pathIsLineSegment"))
  {
    objc_msgSend(v5, "pathBounds");
    v7 = v6;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v69 != v10)
            objc_enumerationMutation(a3);
          v12 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "tag");
          v14 = objc_msgSend(v12, "tag");
          if (v13 == 11 || v14 == 10)
          {
            if (v13 == 11)
              objc_msgSend(v5, "headPoint");
            else
              objc_msgSend(v5, "tailPoint");
            objc_msgSend(v12, "setPosition:", TSDSubtractPoints(v16, v17, v7));
          }
        }
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
      }
      while (v9);
    }
  }
  if (-[TSDShapeRep shouldShowSmartShapeKnobs](self, "shouldShowSmartShapeKnobs")
    || (objc_opt_class(), objc_msgSend(v5, "pathSource"), TSUDynamicCast()))
  {
    -[TSDRep trackingBoundsForStandardKnobs](self, "trackingBoundsForStandardKnobs");
    v19 = v18;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v20 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v65 != v22)
            objc_enumerationMutation(a3);
          v24 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
          if ((unint64_t)objc_msgSend(v24, "tag") >= 0xC && (unint64_t)objc_msgSend(v24, "tag") <= 0x10)
          {
            objc_msgSend(v5, "getControlKnobPosition:", objc_msgSend(v24, "tag"));
            objc_msgSend(v24, "setPosition:", TSDAddPoints(v25, v26, v19));
          }
        }
        v21 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
      }
      while (v21);
    }
  }
  if (-[TSDShapeRep shouldShowAdvancedGradientKnobs](self, "shouldShowAdvancedGradientKnobs"))
  {
    objc_opt_class();
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill");
    v27 = (void *)TSUDynamicCast();
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "boundsForStandardKnobs");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    objc_msgSend(v27, "startPointForPath:andBounds:", objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "path"), v28, v30, v32, v34);
    v37 = v36;
    v39 = v38;
    objc_msgSend(v27, "endPointForPath:andBounds:", objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "path"), v29, v31, v33, v35);
    v41 = v40;
    v43 = v42;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v44 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    if (v44)
    {
      v45 = v44;
      v46 = TSDAddPoints(v41, v43, v29);
      v48 = v47;
      v49 = TSDAddPoints(v37, v39, v29);
      v51 = v50;
      v52 = *(_QWORD *)v61;
      do
      {
        for (k = 0; k != v45; ++k)
        {
          if (*(_QWORD *)v61 != v52)
            objc_enumerationMutation(a3);
          v54 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * k);
          v55 = objc_msgSend(v54, "tag");
          v56 = v49;
          v57 = v51;
          if (v55 != 24)
          {
            v58 = objc_msgSend(v54, "tag", v49, v51);
            v56 = v49;
            v57 = v51;
            if (v58 != 25)
            {
              v59 = objc_msgSend(v54, "tag", v49, v51);
              v56 = v46;
              v57 = v48;
              if (v59 != 26)
                continue;
            }
          }
          objc_msgSend(v54, "setPosition:", v56, v57);
        }
        v45 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v60, v73, 16, v56, v57);
      }
      while (v45);
    }
  }
}

- (id)additionalLayersOverLayer
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDShapeRep;
  return (id)objc_msgSend(-[TSDRep additionalLayersOverLayer](&v3, sel_additionalLayersOverLayer), "mutableCopy");
}

- (id)overlayLayers
{
  void *v3;
  id v4;
  void *v5;
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
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  CGFloat v27;
  TSDLayout *v28;
  CGFloat v29;
  CGPath *Mutable;
  CGAffineTransform v32;
  CGAffineTransform t2;
  CGAffineTransform v34;
  CGAffineTransform m;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)TSDShapeRep;
  v3 = (void *)objc_msgSend(-[TSDRep overlayLayers](&v36, sel_overlayLayers), "mutableCopy");
  if (-[TSDRep isSelectedIgnoringLocking](self, "isSelectedIgnoringLocking")
    && -[TSDShapeRep shouldShowAdvancedGradientKnobs](self, "shouldShowAdvancedGradientKnobs"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDE5758]);
    objc_msgSend(v4, "setFillColor:", 0);
    objc_msgSend(v4, "setStrokeColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithWhite:alpha:", 0.8, 0.66), "CGColor"));
    objc_msgSend(v4, "setLineWidth:", 1.0);
    objc_opt_class();
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill");
    v5 = (void *)TSUDynamicCast();
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "boundsForStandardKnobs");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v5, "startPointForPath:andBounds:", objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "path"), v6, v8, v10, v12);
    v15 = v14;
    v17 = v16;
    objc_msgSend(v5, "endPointForPath:andBounds:", objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "path"), v7, v9, v11, v13);
    v19 = v18;
    v21 = v20;
    v22 = TSDAddPoints(v15, v17, v7);
    v24 = v23;
    v25 = TSDAddPoints(v19, v21, v7);
    v27 = v26;
    memset(&m, 0, sizeof(m));
    v28 = -[TSDRep layout](self, "layout");
    if (v28)
      -[TSDAbstractLayout transformInRoot](v28, "transformInRoot");
    else
      memset(&m, 0, sizeof(m));
    -[TSDInteractiveCanvasController viewScale](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
    CGAffineTransformMakeScale(&t2, v29, v29);
    v32 = m;
    CGAffineTransformConcat(&v34, &v32, &t2);
    m = v34;
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, &m, v22, v24);
    CGPathAddLineToPoint(Mutable, &m, v25, v27);
    objc_msgSend(v4, "setPath:", Mutable);
    objc_msgSend(v3, "insertObject:atIndex:", v4, 0);

    CGPathRelease(Mutable);
  }
  return v3;
}

- (void)setShadowOnChildrenDisabled:(BOOL)a3
{
  if (self->mShadowOnChildrenDisabled != a3)
  {
    self->mShadowOnChildrenDisabled = a3;
    -[TSDStyledRep invalidateShadowLayer](self, "invalidateShadowLayer");
  }
}

- (void)invalidateEffectLayersForChildren
{
  if (!self->mShadowOnChildrenDisabled
    && (objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill"), "isOpaque") & 1) == 0)
  {
    -[TSDStyledRep invalidateShadowLayer](self, "invalidateShadowLayer");
  }
  -[CALayer setNeedsDisplay](-[TSDStyledRep reflectionLayer](self, "reflectionLayer"), "setNeedsDisplay");
}

- (BOOL)isInvisible
{
  id v3;
  void *v4;
  double v5;

  v3 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
  v4 = (void *)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill");
  if ((objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "isInvisible") & 1) != 0)
    return 1;
  -[TSDStyledRep opacity](self, "opacity");
  if (v5 == 0.0)
    return 1;
  if (v3 && (objc_msgSend(v3, "shouldRender") & 1) != 0)
    return 0;
  if (!v4)
    return 1;
  return objc_msgSend(v4, "isClear");
}

- (BOOL)canDrawInParallel
{
  return 1;
}

- (BOOL)isPathEditable
{
  return 0;
}

- (BOOL)canMakePathEditable
{
  return 1;
}

- (id)editablePathSource
{
  return (id)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "editablePathSource");
}

- (CGAffineTransform)naturalToEditablePathSpaceTransform
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  void *v9;
  __int128 v10;
  CGAffineTransform *result;
  __int128 v12;
  CGAffineTransform v13;
  CGAffineTransform t2;
  CGAffineTransform v15;

  -[TSDRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v6 = v5;
  v8 = v7;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  v9 = (void *)objc_msgSend(-[TSDShapeRep shapeInfo](self, "shapeInfo"), "pathSource");
  if (v9)
  {
    objc_msgSend(v9, "pathFlipTransform");
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  CGAffineTransformMakeTranslation(&t2, v6, v8);
  v10 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v13.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v13.c = v10;
  *(_OWORD *)&v13.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&v15, &v13, &t2);
  v12 = *(_OWORD *)&v15.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v15.a;
  *(_OWORD *)&retstr->c = v12;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v15.tx;
  return result;
}

- (BOOL)isEditingPath
{
  return 0;
}

+ (double)magicMoveAttributeMatchPercentBetweenOutgoingObject:(id)a3 incomingObject:(id)a4
{
  uint64_t v6;
  double result;
  double v8;
  int v9;
  double v10;

  v6 = objc_msgSend((id)objc_msgSend(a3, "shapeInfo"), "mixingTypeWithObject:", objc_msgSend(a4, "shapeInfo"));
  result = 0.0;
  if (v6 != 1)
  {
    if (v6 == 5)
      v8 = 1.0;
    else
      v8 = 0.0;
    if (TSDMixingTypeWithPossiblyNilObjects(objc_msgSend((id)objc_msgSend(a3, "shapeInfo", 0.0), "pathSource"), objc_msgSend((id)objc_msgSend(a4, "shapeInfo"), "pathSource")) != 1)v8 = v8 + 3.0;
    v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "shapeInfo"), "style"), "isEqual:", objc_msgSend((id)objc_msgSend(a4, "shapeInfo"), "style"));
    v10 = v8 + 1.0;
    if (!v9)
      v10 = v8;
    return v10 / 5.0;
  }
  return result;
}

- (void)p_drawLineEndForHead:(BOOL)a3 withDelta:(CGPoint)a4 andStroke:(id)a5 inContext:(CGContext *)a6 useFastDrawing:(BOOL)a7
{
  _BOOL8 v7;
  double x;
  _BOOL4 v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;

  v7 = a7;
  x = a4.x;
  v11 = a3;
  v12 = -[TSDShapeRep shapeLayout](self, "shapeLayout");
  v13 = v12;
  if (v11)
  {
    v14 = objc_msgSend(v12, "strokeHeadLineEnd");
    if (!v14)
      return;
    v15 = v14;
    objc_msgSend(v13, "headLineEndPoint");
    v17 = v16;
    v19 = v18;
    objc_msgSend(v13, "headLineEndAngle");
  }
  else
  {
    v21 = objc_msgSend(v12, "strokeTailLineEnd");
    if (!v21)
      return;
    v15 = v21;
    objc_msgSend(v13, "tailLineEndPoint");
    v17 = v22;
    v19 = v23;
    objc_msgSend(v13, "tailLineEndAngle");
  }
  v24 = v20;
  v25 = TSDAddPoints(v17, v19, x);
  v27 = v26;
  objc_msgSend(v13, "lineEndScale");
  objc_msgSend(a5, "paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:", v15, a6, v7, v25, v27, v24, v28);
}

- (void)p_beginDynamicallyResizingOrMovingLineEnd
{
  if (objc_msgSend(-[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke"), "shouldRender"))
    -[TSDStyledRep setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)p_endDynamicallyResizingOrMovingLineEnd
{
  if (objc_msgSend(-[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke"), "shouldRender"))
    -[TSDStyledRep setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)p_pathIsAxisAlignedRect
{
  id v3;
  id v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v3 = -[TSDShapeRep shapeInfo](self, "shapeInfo");
  v4 = -[TSDShapeRep shapeLayout](self, "shapeLayout");
  if (objc_msgSend(v4, "pathIsOpen"))
  {
    if (objc_msgSend(v3, "headLineEnd"))
      v5 = 1;
    else
      v5 = objc_msgSend(v3, "tailLineEnd") != 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)objc_msgSend(v4, "path");
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  if (!-[TSDRep isInDynamicOperation](self, "isInDynamicOperation"))
  {
    if (v4)
    {
      objc_msgSend(v4, "transformInRoot");
      if (!v5)
        goto LABEL_14;
      goto LABEL_12;
    }
LABEL_13:
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
    if (!v5)
      goto LABEL_14;
LABEL_12:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (!v4)
    goto LABEL_13;
  objc_msgSend(v4, "originalTransformInRoot");
  if (v5)
    goto LABEL_12;
LABEL_14:
  v7 = objc_msgSend(v6, "isRectangular");
  if (v7)
  {
    v9[0] = v10;
    v9[1] = v11;
    v9[2] = v12;
    LOBYTE(v7) = TSDIsTransformAxisAlignedUnflipped((double *)v9);
  }
  return v7;
}

- (BOOL)p_canApplyStrokeToLayer
{
  _BOOL4 v3;
  id v4;
  double v5;
  BOOL v6;

  v3 = -[TSDShapeRep p_pathIsAxisAlignedRect](self, "p_pathIsAxisAlignedRect");
  if (v3)
  {
    v4 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
    if (objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill"))
    {
      -[TSDStyledRep opacity](self, "opacity");
      v6 = v5 == 1.0;
      if (!v4)
        goto LABEL_8;
    }
    else
    {
      v6 = 1;
      if (!v4)
        goto LABEL_8;
    }
    if (objc_msgSend(v4, "shouldRender"))
    {
      LOBYTE(v3) = objc_msgSend(v4, "canApplyDirectlyToRepRenderable") & v6;
      return v3;
    }
LABEL_8:
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)p_canApplyFillToLayer
{
  int v3;
  void *v4;
  void *v5;

  v3 = -[TSDShapeRep p_pathIsAxisAlignedRect](self, "p_pathIsAxisAlignedRect");
  if (v3)
  {
    v4 = (void *)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill");
    if (v4 && (v5 = v4, (objc_msgSend(v4, "isClear") & 1) == 0))
      LOBYTE(v3) = objc_msgSend(v5, "canApplyToCALayer");
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)p_drawsSelfInOneStep
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  void *v10;

  v3 = -[TSDShapeRep shapeInfo](self, "shapeInfo");
  v4 = (void *)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "fill");
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "isClear") ^ 1;
  else
    v6 = 0;
  v7 = (void *)objc_msgSend(v3, "stroke");
  if (!objc_msgSend(v7, "shouldRender"))
    v7 = 0;
  if (v7)
    v8 = v6 ^ 1;
  else
    v8 = 1;
  if (objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathIsOpen"))
  {
    if (objc_msgSend(v3, "headLineEnd"))
      return 0;
    v9 = objc_msgSend(v3, "tailLineEnd") == 0;
  }
  else
  {
    v9 = 1;
  }
  if ((v8 & v9) != 1)
    return 0;
  if (v6)
  {
    v10 = v5;
    return objc_msgSend(v10, "drawsInOneStep");
  }
  if (v7)
  {
    v10 = v7;
    return objc_msgSend(v10, "drawsInOneStep");
  }
  return 1;
}

- (BOOL)canDrawShadowInOneStepWithChildren:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v4;
  void *v5;

  v3 = a3;
  v4 = -[TSDShapeRep p_drawsSelfInOneStep](self, "p_drawsSelfInOneStep");
  if (v4 && v3)
  {
    v5 = (void *)TSUProtocolCast();
    if (v5)
      LOBYTE(v4) = objc_msgSend((id)objc_msgSend(v5, "childReps"), "count") == 0;
    else
      LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)shouldShowShadow
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDShapeRep;
  v3 = -[TSDStyledRep shouldShowShadow](&v5, sel_shouldShowShadow);
  if (v3)
  {
    if (-[TSDCanvas shouldSuppressBackgrounds](-[TSDRep canvas](self, "canvas"), "shouldSuppressBackgrounds"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[TSDShapeRep shadowOnChildrenDisabled](self, "shadowOnChildrenDisabled");
  }
  return v3;
}

- (BOOL)i_editMenuOverlapsEndKnobs
{
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  TSDCanvas *v13;
  TSDCanvas *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  TSDCanvas *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  TSDCanvas *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGPoint v34;
  CGPoint v35;
  CGRect v36;
  CGRect v37;

  v3 = objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathIsLineSegment");
  if (v3)
  {
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "headPoint");
    v5 = v4;
    v7 = v6;
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "tailPoint");
    v10 = TSDMixPoints(v5, v7, v8, v9, 0.5);
    v12 = v11;
    v13 = -[TSDRep canvas](self, "canvas");
    v14 = -[TSDRep canvas](self, "canvas");
    -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", v10, v12);
    -[TSDCanvas convertUnscaledToBoundsPoint:](v14, "convertUnscaledToBoundsPoint:");
    -[TSDCanvas i_approximateScaledFrameOfEditingMenuAtPoint:](v13, "i_approximateScaledFrameOfEditingMenuAtPoint:");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v23 = -[TSDRep canvas](self, "canvas");
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "headPoint");
    -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
    -[TSDCanvas convertUnscaledToBoundsPoint:](v23, "convertUnscaledToBoundsPoint:");
    v25 = v24;
    v27 = v26;
    v28 = -[TSDRep canvas](self, "canvas");
    objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "tailPoint");
    -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
    -[TSDCanvas convertUnscaledToBoundsPoint:](v28, "convertUnscaledToBoundsPoint:");
    v30 = v29;
    v32 = v31;
    v36.origin.x = v16;
    v36.origin.y = v18;
    v36.size.width = v20;
    v36.size.height = v22;
    v34.x = v25;
    v34.y = v27;
    if (CGRectContainsPoint(v36, v34))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      v37.origin.x = v16;
      v37.origin.y = v18;
      v37.size.width = v20;
      v37.size.height = v22;
      v35.x = v30;
      v35.y = v32;
      LOBYTE(v3) = CGRectContainsPoint(v37, v35);
    }
  }
  return v3;
}

- (BOOL)shadowOnChildrenDisabled
{
  return self->mShadowOnChildrenDisabled;
}

@end
