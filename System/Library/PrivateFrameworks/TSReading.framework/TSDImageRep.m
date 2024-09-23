@implementation TSDImageRep

- (TSDImageRep)initWithLayout:(id)a3 canvas:(id)a4
{
  TSDImageRep *v4;
  TSDImageRep *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDImageRep;
  v4 = -[TSDRep initWithLayout:canvas:](&v8, sel_initWithLayout_canvas_, a3, a4);
  v5 = v4;
  if (v4)
  {
    if (-[TSDImageRep imageInfo](v4, "imageInfo"))
    {
      v6 = objc_msgSend(-[TSDImageRep imageInfo](v5, "imageInfo"), "imageData");
      if (v6)
        objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "addInterestInProviderForData:", v6);
      *(_QWORD *)&v5->mSizingStateReady = dispatch_queue_create("com.apple.iwork.TSDImageRepSizedImage", 0);
      *(_QWORD *)&v5->mBaseMaskLayoutTransform.ty = objc_alloc_init(MEMORY[0x24BDD1788]);
      v5->mHitTestCacheOnce = (int64_t)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v5->mUpdateFromLayoutBlocks = (NSMutableArray *)dispatch_semaphore_create(1);
      -[TSDImageRep p_updateDirectlyManagesLayerContentForLayer:](v5, "p_updateDirectlyManagesLayerContentForLayer:", 0);
    }
    else
    {

      v5 = 0;
    }
  }
  __dmb(0xBu);
  return v5;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  -[TSDImageRep p_disposeStrokeLayer](self, "p_disposeStrokeLayer");
  -[TSDImageRep p_disposeMaskLayer](self, "p_disposeMaskLayer");

  v3 = objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "imageData");
  if (v3)
    objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "removeInterestInProviderForData:", v3);

  CGPathRelease(*(CGPathRef *)&self->mSizedImageHasMaskBakedIn);
  dispatch_release(&self->mUpdateFromLayoutBlocks->super.super);

  CGImageRelease(self->mSizedImageAccessQueue);
  dispatch_release(*(dispatch_object_t *)&self->mSizingStateReady);
  CGImageRelease(self->mSizedImageMaskPath);
  self->mSizedImageMaskPath = 0;

  v4.receiver = self;
  v4.super_class = (Class)TSDImageRep;
  -[TSDMediaRep dealloc](&v4, sel_dealloc);
}

- (CGImage)imageRef
{
  return self->mSizedImageAccessQueue;
}

- (id)imageInfo
{
  objc_opt_class();
  -[TSDRep info](self, "info");
  return (id)TSUDynamicCast();
}

- (id)imageLayout
{
  objc_opt_class();
  -[TSDRep layout](self, "layout");
  return (id)TSUDynamicCast();
}

- (id)maskInfo
{
  return (id)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "maskInfo");
}

- (id)maskLayout
{
  return (id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout");
}

- (void)highlightImage
{
  BYTE1(self->mLastPictureFrameLayerTransform.ty) = 1;
  -[TSDInteractiveCanvasController layoutInvalidated](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
}

- (void)unhighlightImage
{
  BYTE1(self->mLastPictureFrameLayerTransform.ty) = 0;
  -[TSDInteractiveCanvasController layoutInvalidated](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
}

- (void)willBeRemoved
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDImageRep;
  -[TSDRep willBeRemoved](&v3, sel_willBeRemoved);
  -[NSRecursiveLock setStatus:](self->mLayerUpdateAndSizingStateLock, "setStatus:", 2);

  self->super.mFrameMaskLayer = 0;
  dispatch_semaphore_wait(&self->mUpdateFromLayoutBlocks->super.super, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)self->mHitTestCacheOnce, "removeAllObjects");
  dispatch_semaphore_signal(&self->mUpdateFromLayoutBlocks->super.super);
}

- (void)becameNotSelected
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSDImageRep;
  -[TSDRep becameNotSelected](&v2, sel_becameNotSelected);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  unsigned int v4;
  _BOOL8 v5;
  id v6;
  double v7;
  double v8;
  uint64_t v10;
  CGPoint point;
  double x;
  double y;
  CGAffineTransform v14;
  CGAffineTransform v15;
  char v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  v17.receiver = self;
  v17.super_class = (Class)TSDImageRep;
  x = a3.x;
  y = a3.y;
  v4 = -[TSDRep containsPoint:](&v17, sel_containsPoint_);
  if (!v4
    || !-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive")
    || (-[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y),
        !-[TSDMediaRep replaceButtonContainsPoint:](self, "replaceButtonContainsPoint:")))
  {
    v16 = 0;
    if (-[TSDImageRep p_hitCacheGetCachedValue:forPoint:](self, "p_hitCacheGetCachedValue:forPoint:", &v16, x, y))
    {
      LOBYTE(v5) = v16 != 0;
      return v5;
    }
    v6 = -[TSDImageRep imageLayout](self, "imageLayout");
    if (objc_msgSend(v6, "maskLayout") && (v4 & (objc_msgSend(v6, "maskIntersectsImage") ^ 1) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      if ((v4 & 1) != 0)
        goto LABEL_11;
      if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode"))
      {
        if (v6)
          objc_msgSend(v6, "layoutToImageTransform");
        else
          memset(&v14, 0, sizeof(v14));
        CGAffineTransformInvert(&v15, &v14);
        point = (CGPoint)vaddq_f64(*(float64x2_t *)&v15.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v15.c, y), *(float64x2_t *)&v15.a, x));
        objc_msgSend((id)objc_msgSend(v6, "imageGeometry"), "size");
        v19.origin.x = TSDRectWithSize();
        if (CGRectContainsPoint(v19, point))
        {
LABEL_11:
          if (containsPoint__ctx_once != -1)
            dispatch_once(&containsPoint__ctx_once, &__block_literal_global_31);
          CGContextSaveGState((CGContextRef)containsPoint__ctx);
          v18.origin.x = 0.0;
          v18.origin.y = 0.0;
          v18.size.width = 1.0;
          v18.size.height = 1.0;
          CGContextClearRect((CGContextRef)containsPoint__ctx, v18);
          CGContextTranslateCTM((CGContextRef)containsPoint__ctx, -x, -y);
          LOWORD(v10) = 256;
          -[TSDImageRep p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:](self, "p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:", containsPoint__ctx, 1, 1, objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode") ^ 1, objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInInstantAlphaMode") ^ 1, 0, 1.0, v10);
          CGContextRestoreGState((CGContextRef)containsPoint__ctx);
          v7 = x;
          v8 = y;
          v5 = *(_BYTE *)containsPoint__data != 0;
          goto LABEL_21;
        }
      }
      v5 = 0;
    }
    v7 = x;
    v8 = y;
LABEL_21:
    -[TSDImageRep p_hitCacheSetCachedValue:forPoint:](self, "p_hitCacheSetCachedValue:forPoint:", v5, v7, v8);
    return v5;
  }
  LOBYTE(v5) = 1;
  return v5;
}

void *__29__TSDImageRep_containsPoint___block_invoke()
{
  void *result;

  containsPoint__ctx = (uint64_t)TSDBitmapContextCreate(2, 1.0);
  result = CGBitmapContextGetData((CGContextRef)containsPoint__ctx);
  containsPoint__data = (uint64_t)result;
  return result;
}

- (int)dragTypeAtCanvasPoint:(CGPoint)a3
{
  double y;
  double x;
  int result;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  id v19;
  objc_super *v20;
  void *v21;
  id v22;
  char v23;
  double v24;
  double point;
  CGPoint pointa;
  objc_super v27;
  TSDImageRep *v28;
  _OWORD v29[3];
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGPoint v32;
  CGRect v33;
  CGRect v34;

  y = a3.y;
  x = a3.x;
  if (-[TSDMediaRep replaceButtonContainsPoint:](self, "replaceButtonContainsPoint:"))
    return 0;
  if (!objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode"))
    goto LABEL_8;
  if ((objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskIntersectsImage") & 1) != 0)
    goto LABEL_8;
  -[TSDRep naturalBounds](self, "naturalBounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[TSDRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", x, y);
  v32.x = v15;
  v32.y = v16;
  v33.origin.x = v8;
  v33.origin.y = v10;
  v33.size.width = v12;
  v33.size.height = v14;
  if (!CGRectContainsPoint(v33, v32))
  {
LABEL_8:
    v27.receiver = self;
    v20 = &v27;
LABEL_9:
    v20->super_class = (Class)TSDImageRep;
    return -[objc_super dragTypeAtCanvasPoint:](v20, sel_dragTypeAtCanvasPoint_, x, y);
  }
  -[TSDRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", x, y);
  v24 = v18;
  point = v17;
  v19 = -[TSDImageRep imageLayout](self, "imageLayout");
  if (v19)
    objc_msgSend(v19, "layoutToImageTransform");
  else
    memset(&v30, 0, sizeof(v30));
  CGAffineTransformInvert(&v31, &v30);
  pointa = (CGPoint)vaddq_f64(*(float64x2_t *)&v31.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v31.c, v24), *(float64x2_t *)&v31.a, point));
  if (objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"))
  {
    v21 = (void *)objc_msgSend((id)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"), "copy");
    v22 = -[TSDImageRep imageLayout](self, "imageLayout");
    if (v22)
      objc_msgSend(v22, "imageDataToVisualSizeTransform");
    else
      memset(v29, 0, sizeof(v29));
    objc_msgSend(v21, "transformUsingAffineTransform:", v29);
    v23 = objc_msgSend(v21, "containsPoint:", pointa);

    if ((v23 & 1) == 0)
      return 0;
    goto LABEL_19;
  }
  objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometry"), "size");
  v34.origin.x = TSDRectWithSize();
  result = CGRectContainsPoint(v34, pointa);
  if (result)
  {
LABEL_19:
    v28 = self;
    v20 = (objc_super *)&v28;
    goto LABEL_9;
  }
  return result;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)shouldShowSelectionHighlight
{
  objc_super v4;

  if ((objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode") & 1) != 0)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSDImageRep;
  return -[TSDStyledRep shouldShowSelectionHighlight](&v4, sel_shouldShowSelectionHighlight);
}

- (id)pathSourceForSelectionHighlightBehavior
{
  return (id)objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout"), "pathSource");
}

- (void)processChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDImageRep;
  -[TSDRep processChanges:](&v3, sel_processChanges_, a3);
}

- (void)processChangedProperty:(int)a3
{
  _BOOL4 v5;
  NSObject *v6;
  _QWORD block[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDImageRep;
  -[TSDMediaRep processChangedProperty:](&v8, sel_processChangedProperty_);
  if (a3 == 517)
  {
    -[TSDMediaRep i_updateFrameRep](self, "i_updateFrameRep");
    v5 = 0;
    goto LABEL_3;
  }
  v5 = a3 == 529;
  if (a3 > 527)
  {
    if (a3 == 528)
    {
      -[TSDImageRep p_invalidateSizedImage](self, "p_invalidateSizedImage");
LABEL_23:
      -[TSDStyledRep setNeedsDisplay](self, "setNeedsDisplay");
      LOBYTE(self->mFrameInUnscaledCanvasRelativeToSuper.size.height) = 0;
      -[TSDCanvas layoutInvalidated](self->super.super.super.mCanvas, "layoutInvalidated");
      goto LABEL_24;
    }
    if (a3 != 530)
    {
      if (a3 != 529)
        goto LABEL_24;
LABEL_3:
      -[TSDImageRep p_disposeStrokeLayer](self, "p_disposeStrokeLayer");
      -[TSDRep invalidateKnobs](self, "invalidateKnobs");
      if (v5)
        objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "invalidateAlignmentFrame");
      if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskEditMode")
        || !objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "maskInfo"))
      {
        if (!v5)
          goto LABEL_23;
      }
      else
      {
        objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskWasApplied");
        if (!v5)
          goto LABEL_23;
      }
      goto LABEL_22;
    }
    -[TSDImageRep p_disposeStrokeLayer](self, "p_disposeStrokeLayer");
    objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout"), "invalidatePath");
    -[TSDLayout invalidateSize](-[TSDRep layout](self, "layout"), "invalidateSize");
LABEL_22:
    v6 = *(NSObject **)&self->mSizingStateReady;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__TSDImageRep_processChangedProperty___block_invoke;
    block[3] = &unk_24D829278;
    block[4] = self;
    dispatch_sync(v6, block);
    goto LABEL_23;
  }
  if (a3 == 512)
    goto LABEL_22;
  if (a3 == 513 && -[TSDImageRep shouldShowSmartMaskKnobs](self, "shouldShowSmartMaskKnobs"))
    -[TSDRep invalidateKnobs](self, "invalidateKnobs");
LABEL_24:
  -[TSDImageRep p_invalidateHitTestCache](self, "p_invalidateHitTestCache");
}

void __38__TSDImageRep_processChangedProperty___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BOOL4 v3;
  int v4;
  int v5;
  void *v6;
  char v7;
  _QWORD v8[7];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 704) || *(_QWORD *)(v2 + 680))
  {
    if (*(_BYTE *)(v2 + 736))
    {
      v3 = 1;
    }
    else if (*(_QWORD *)(v2 + 680))
    {
      v3 = objc_msgSend(*(id *)(v2 + 680), "maskPath") != 0;
      v2 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v3 = 0;
    }
    v4 = *(unsigned __int8 *)(v2 + 737);
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v5 = objc_msgSend((id)objc_msgSend((id)v2, "imageLayout"), "isDynamicallyChangingImageAdjustments");
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "imageInfo");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __38__TSDImageRep_processChangedProperty___block_invoke_2;
    v8[3] = &unk_24D82BBB0;
    v9 = v3;
    v8[4] = *(_QWORD *)(a1 + 32);
    v8[5] = &v14;
    v8[6] = &v10;
    objc_msgSend(v6, "performBlockWithTemporaryLayout:", v8);
    if (!*((_BYTE *)v11 + 24))
    {
      if (v3)
      {
        v7 = v5 ^ 1;
        if (!v4)
          v7 = 1;
        if (*((_BYTE *)v15 + 24) && (v7 & 1) != 0)
          goto LABEL_10;
      }
      else if (!v4 || ((v5 ^ 1) & 1) != 0)
      {
        goto LABEL_10;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "p_invalidateSizedImageFromQueue");
LABEL_10:
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
}

void __38__TSDImageRep_processChangedProperty___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGPath *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (objc_msgSend(v2, "maskLayout")
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "maskLayout"), "pathSource"), "isRectangular")
    || (v3 = objc_msgSend((id)objc_msgSend(v2, "imageInfo"), "instantAlphaPath")) != 0)
  {
    LOBYTE(v3) = objc_msgSend(v2, "maskIntersectsImage");
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) && *(_BYTE *)(a1 + 56))
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v4 + 744) && !objc_msgSend(*(id *)(v4 + 680), "maskPath"))
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageRep processChangedProperty:]_block_invoke_2");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 910, CFSTR("Need some mask path if comparing masks"));
    }
    v7 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v7 + 704))
    {
      v8 = *(_QWORD *)(v7 + 728);
    }
    else
    {
      v8 = objc_msgSend((id)objc_msgSend((id)v7, "p_validatedBitmapImageProvider"), "orientation");
      v7 = *(_QWORD *)(a1 + 32);
    }
    v9 = +[TSDImageRep p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:](TSDImageRep, "p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:", v2, v8, *(double *)(v7 + 712), *(double *)(v7 + 720));
    if (!v9)
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageRep processChangedProperty:]_block_invoke_2");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 914, CFSTR("invalid nil value for '%s'"), "newBakingMaskPath");
    }
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(v12 + 744);
    if (!v13)
      v13 = objc_msgSend(*(id *)(v12 + 680), "maskPath");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = !-[TSDBezierPath isEqual:](+[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", v13), "isEqual:", +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", v9));
    CGPathRelease(v9);
  }
}

- (void)updateFromLayout
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __int128 v7;
  _BOOL4 v8;
  int v9;
  __int128 v10;
  __int128 v11;
  void *mHitTestCacheOnce;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)TSDImageRep;
  -[TSDRep updateFromLayout](&v24, sel_updateFromLayout);
  if (-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive")
    && !-[TSDInteractiveCanvasController isInDynamicOperation](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "isInDynamicOperation"))
  {
    v3 = -[TSDImageRep imageLayout](self, "imageLayout");
    v4 = objc_msgSend(v3, "maskLayout");
    memset(&v23, 0, sizeof(v23));
    if (v3)
      objc_msgSend(v3, "layoutToImageTransform");
    v5 = (void *)objc_msgSend(v3, "imageGeometryInRoot");
    v6 = (void *)objc_msgSend((id)v4, "geometryInRoot");
    t1 = v23;
    v7 = *(_OWORD *)&self->mLastLayoutToImageTransform.b;
    *(_OWORD *)&t2.a = *(_OWORD *)&self->mLastMaskGeometryInRoot;
    *(_OWORD *)&t2.c = v7;
    *(_OWORD *)&t2.tx = *(_OWORD *)&self->mLastLayoutToImageTransform.d;
    v8 = CGAffineTransformEqualToTransform(&t1, &t2);
    if (v4
      && ((objc_msgSend(v5, "isEqual:", *(_QWORD *)&self->super.mLastPictureFrameLayerRect.size.height) & 1) == 0
        ? (LOBYTE(v4) = objc_msgSend(v5, "differsInMoreThanTranslationFrom:", *(_QWORD *)&self->super.mLastPictureFrameLayerRect.size.height)): (LOBYTE(v4) = 0), (objc_msgSend(v6, "isEqual:", self->mLastImageGeometryInRoot) & 1) == 0))
    {
      v9 = objc_msgSend(v6, "differsInMoreThanTranslationFrom:", self->mLastImageGeometryInRoot);
      if (!v8)
      {
LABEL_15:
        -[TSDStyledRep setNeedsDisplay](self, "setNeedsDisplay");
        LOBYTE(self->mFrameInUnscaledCanvasRelativeToSuper.size.height) = 0;
        -[TSDRep invalidateKnobPositions](self, "invalidateKnobPositions");
LABEL_16:

        *(_QWORD *)&self->super.mLastPictureFrameLayerRect.size.height = objc_msgSend(v5, "copy");
        self->mLastImageGeometryInRoot = (TSDLayoutGeometry *)objc_msgSend(v6, "copy");
        v10 = *(_OWORD *)&v23.tx;
        v11 = *(_OWORD *)&v23.a;
        *(_OWORD *)&self->mLastLayoutToImageTransform.b = *(_OWORD *)&v23.c;
        *(_OWORD *)&self->mLastLayoutToImageTransform.d = v10;
        *(_OWORD *)&self->mLastMaskGeometryInRoot = v11;
        goto LABEL_17;
      }
    }
    else
    {
      v9 = 0;
      if (!v8)
        goto LABEL_15;
    }
    if ((v4 & 1) == 0 && !v9)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_17:
  dispatch_semaphore_wait(&self->mUpdateFromLayoutBlocks->super.super, 0xFFFFFFFFFFFFFFFFLL);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  mHitTestCacheOnce = (void *)self->mHitTestCacheOnce;
  v13 = objc_msgSend(mHitTestCacheOnce, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(mHitTestCacheOnce);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i) + 16))();
      }
      v14 = objc_msgSend(mHitTestCacheOnce, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }
  objc_msgSend((id)self->mHitTestCacheOnce, "removeAllObjects");
  dispatch_semaphore_signal(&self->mUpdateFromLayoutBlocks->super.super);
}

- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDImageRep;
  -[TSDRep layoutInRootChangedFrom:to:translatedOnly:](&v7, sel_layoutInRootChangedFrom_to_translatedOnly_, a3, a4);
  if (!a5)
    LOBYTE(self->mFrameInUnscaledCanvasRelativeToSuper.size.height) = 0;
}

- (id)overlayLayers
{
  void *v3;
  TSDInteractiveCanvasController *v4;
  TSDInteractiveCanvasController *v5;
  id v6;
  CGColor *DeviceRGB;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  TSDLayout *v18;
  double v19;
  CGPath *v20;
  CGAffineTransform v22;
  CGAffineTransform t2;
  CGAffineTransform v24;
  CGAffineTransform v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)TSDImageRep;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[TSDMediaRep overlayLayers](&v26, sel_overlayLayers));
  v4 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
  if (BYTE1(self->mLastPictureFrameLayerTransform.ty))
  {
    v5 = v4;
    v6 = objc_alloc_init(MEMORY[0x24BDE5758]);
    DeviceRGB = (CGColor *)TSUCGColorCreateDeviceRGB();
    objc_msgSend(v6, "setFillColor:", DeviceRGB);
    CGColorRelease(DeviceRGB);
    objc_msgSend(v6, "setLineWidth:", 1.0);
    objc_msgSend(v6, "setStrokeColor:", 0);
    -[TSDCanvas viewScale](self->super.super.super.mCanvas, "viewScale");
    v9 = v8;
    -[TSDImageRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    memset(&v25, 0, sizeof(v25));
    v18 = -[TSDRep layout](self, "layout");
    if (v18)
      -[TSDAbstractLayout transformInRoot](v18, "transformInRoot");
    else
      memset(&v25, 0, sizeof(v25));
    CGAffineTransformMakeScale(&t2, v9, v9);
    v22 = v25;
    CGAffineTransformConcat(&v24, &v22, &t2);
    v25 = v24;
    -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
    v20 = TSDCreateAADefeatedRectPath((uint64_t)&v25, v11, v13, v15, v17, 1.0, v19);
    objc_msgSend(v6, "setPath:", v20);
    CGPathRelease(v20);
    objc_msgSend(v6, "setDelegate:", v5);
    objc_msgSend(v3, "addObject:", v6);

  }
  return v3;
}

- (id)hitRepChrome:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  id v7;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)TSDImageRep;
  v6 = -[TSDRep hitRepChrome:](&v9, sel_hitRepChrome_);
  if (-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive"))
  {
    if (-[TSDRep isSelected](self, "isSelected")
      && -[TSDImageRep shouldShowMediaReplaceUI](self, "shouldShowMediaReplaceUI")
      && (-[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y),
          -[TSDMediaRep replaceButtonContainsPoint:](self, "replaceButtonContainsPoint:")))
    {
      return self;
    }
    else if (-[TSDRep shouldDisplayHyperlinkUI](self, "shouldDisplayHyperlinkUI"))
    {
      v7 = -[TSDRep knobForTag:](self, "knobForTag:", 33);
      -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y);
      if (objc_msgSend(v7, "isHitByUnscaledPoint:andRep:", self))
        return self;
    }
  }
  return v6;
}

- (BOOL)wantsToDistortWithImagerContext
{
  double v3;
  objc_super v5;

  if (TSUPhoneUI())
  {
    TSUScreenScale();
    if (v3 == 1.0)
      return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)TSDImageRep;
  return -[TSDRep wantsToDistortWithImagerContext](&v5, sel_wantsToDistortWithImagerContext);
}

- (CGRect)boundsForStandardKnobs
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskEditMode") == 3)
  {
    objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometry"), "size");
    v3 = TSDRectWithSize();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TSDImageRep;
    -[TSDRep boundsForStandardKnobs](&v7, sel_boundsForStandardKnobs);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGPoint)positionOfStandardKnob:(id)a3 forBounds:(CGRect)a4
{
  double v5;
  double v6;
  id v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  objc_super v19;
  CGPoint result;

  v19.receiver = self;
  v19.super_class = (Class)TSDImageRep;
  -[TSDRep positionOfStandardKnob:forBounds:](&v19, sel_positionOfStandardKnob_forBounds_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v14 = v6;
  v15 = v5;
  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskEditMode") == 3
    && (-[TSDLayout layoutState](-[TSDRep layout](self, "layout"), "layoutState") != 4
     || objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskScaleMode")))
  {
    v7 = -[TSDImageRep imageLayout](self, "imageLayout");
    if (v7)
    {
      objc_msgSend(v7, "layoutToImageTransform");
      v8 = v16;
      v9 = v17;
      v10 = v18;
    }
    else
    {
      v10 = 0uLL;
      v8 = 0uLL;
      v9 = 0uLL;
    }
    v11 = vaddq_f64(v10, vmlaq_n_f64(vmulq_n_f64(v9, v14), v8, v15));
    v14 = v11.f64[1];
    v15 = v11.f64[0];
  }
  v13 = v14;
  v12 = v15;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGRect)boundsForHighlightLayer
{
  char **v3;
  TSDImageRep **v4;
  double v5;
  double v6;
  double v7;
  double v8;
  TSDImageRep *v9;
  TSDImageRep *v10;
  CGRect result;

  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskEditMode") == 3)
  {
    v10 = self;
    v3 = &selRef_boundsForStandardKnobs;
    v4 = &v10;
  }
  else
  {
    v9 = self;
    v3 = &selRef_boundsForHighlightLayer;
    v4 = &v9;
  }
  v4[1] = (TSDImageRep *)TSDImageRep;
  objc_msgSendSuper2((objc_super *)v4, *v3, v9);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGAffineTransform)transformForHighlightLayer
{
  CGAffineTransform *result;

  if (self->super.super.super.mKnobTracker
    && objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskEditMode") != 3)
  {
    result = (CGAffineTransform *)self->super.super.super.mKnobTracker;
    if (result)
      return (CGAffineTransform *)-[CGAffineTransform transformInRootForStandardKnobs](result, "transformInRootForStandardKnobs");
  }
  else
  {
    result = -[TSDRep layout](self, "layout");
    if (result)
      return (CGAffineTransform *)-[CGAffineTransform transformInRoot](result, "transformInRoot");
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (BOOL)shouldAllowReplacementFromPaste
{
  objc_super v4;

  if ((objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode") & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)TSDImageRep;
  return -[TSDMediaRep shouldAllowReplacementFromPaste](&v4, sel_shouldAllowReplacementFromPaste);
}

- (BOOL)isDraggable
{
  return 1;
}

- (BOOL)shouldShowDragHUD
{
  return objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode") ^ 1;
}

- (CGPoint)centerForRotation
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode"))
  {
    objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "centerForRotationInMaskMode");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TSDImageRep;
    -[TSDRep centerForRotation](&v5, sel_centerForRotation);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)contentsLayer
{
  id result;

  result = *(id *)&self->mFrameInUnscaledCanvasIsValid;
  if (!result)
    return -[TSDInteractiveCanvasController layerForRep:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self);
  return result;
}

- (void)drawInLayerContext:(CGContext *)a3
{
  uint64_t v3;

  LOWORD(v3) = 0;
  -[TSDImageRep p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:](self, "p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:", a3, 1, 1, 1, 1, 1, 1.0, v3);
}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  double v13;
  uint64_t v14;

  v9 = a5;
  v10 = a4;
  v13 = 1.0;
  if (a6)
    -[TSDStyledRep opacity](self, "opacity", a3, a4, a5, a6, a7, a8, 1.0);
  LOWORD(v14) = a7;
  -[TSDImageRep p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:](self, "p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:", a3, v10, v9, 1, 1, 0, v13, v14);
}

- (id)imageOfStroke:(CGRect *)a3
{
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  id v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  const CGPath *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGContext *v22;
  CGImage *Image;
  uint64_t v25;
  CGRect v26;

  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v9 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
  if (v9 && (v10 = v9, objc_msgSend(v9, "shouldRender")))
  {
    v11 = -[TSDImageRep imageLayout](self, "imageLayout");
    objc_msgSend((id)objc_msgSend(v11, "imageGeometry"), "size");
    if (objc_msgSend(v11, "pathToStroke"))
    {
      TSDPathBoundsIncludingStroke((CGPathRef)objc_msgSend(v11, "pathToStroke"), v10);
      v5 = v12;
      v6 = v13;
      v7 = v14;
      v8 = v15;
    }
    else
    {
      v26.origin.x = TSDRectWithSize();
      v17 = CGPathCreateWithRect(v26, 0);
      TSDPathBoundsIncludingStroke(v17, v10);
      v5 = v18;
      v6 = v19;
      v7 = v20;
      v8 = v21;
      CGPathRelease(v17);
    }
    v22 = TSDBitmapContextCreate(11, v7);
    CGContextTranslateCTM(v22, -fmax(v5, 0.0), -fmax(v6, 0.0));
    LOWORD(v25) = 0;
    -[TSDImageRep p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:](self, "p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:", v22, 0, 1, 0, 0, 0, 1.0, v25);
    Image = CGBitmapContextCreateImage(v22);
    v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C90], "imageWithCGImage:", Image);
    CGContextRelease(v22);
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

- (BOOL)canDrawInParallel
{
  return 1;
}

- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(double)a6 withMask:(BOOL)a7 withIAMask:(BOOL)a8 forLayer:(BOOL)a9 forShadow:(BOOL)a10 forHitTest:(BOOL)a11
{
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v15;
  _BOOL4 v16;
  int v19;
  TSDStroke *v20;
  TSDStroke *v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  _BOOL4 v27;
  int v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  void *v38;
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
  double v52;
  TSDBezierPath *v53;
  double v54;
  id v55;
  id v56;
  id v57;
  double v58;
  NSObject *v59;
  CGImage *v60;
  double MinY;
  CGFloat MaxY;
  BOOL v63;
  int v64;
  double v65;
  id v66;
  void *v67;
  uint64_t v68;
  id v69;
  id v70;
  CGImage *v71;
  CGImage *v72;
  double v73;
  CGFloat v74;
  CGImage *v75;
  const CGPath *v76;
  const CGPath *v77;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  TSDStroke *v82;
  uint64_t v83;
  uint64_t v84;
  CALayer *mFrameMaskLayer;
  double v86;
  CALayer *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  CALayer *v92;
  unsigned int v93;
  uint64_t v94;
  _BOOL4 v95;
  TSDStroke *v96;
  int v97;
  CGAffineTransform v98;
  CGAffineTransform v99;
  CGAffineTransform v100;
  CGAffineTransform v101;
  CGAffineTransform v102;
  CGAffineTransform v103;
  CGAffineTransform v104;
  CGAffineTransform v105;
  _QWORD block[8];
  CGAffineTransform v107;
  _OWORD v108[3];
  _OWORD v109[3];
  CGAffineTransform v110;
  CGAffineTransform v111;
  CGAffineTransform transform;
  CGAffineTransform v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect PathBoundingBox;

  v11 = a9;
  v12 = a8;
  v13 = a7;
  v15 = a5;
  v16 = a4;
  if ((objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout"), "isInvisible") & 1) != 0)
    return;
  v19 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("TSDSuppressImageInterpolation"));
  if (v11 && v19)
    CGContextSetInterpolationQuality(a3, kCGInterpolationNone);
  -[TSDMediaRep i_updateFrameRep](self, "i_updateFrameRep");
  v20 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
  v21 = v20;
  v95 = v11;
  if (v20)
  {
    if (-[TSDStroke shouldRender](v20, "shouldRender"))
    {
      if (-[TSDCanvas shouldSuppressBackgrounds](-[TSDRep canvas](self, "canvas"), "shouldSuppressBackgrounds")
        && !-[TSDStroke isFrame](v21, "isFrame"))
      {
        v21 = (TSDStroke *)(id)-[TSDStroke mutableCopy](v21, "mutableCopy");
        -[TSDStroke setColor:](v21, "setColor:", objc_msgSend(MEMORY[0x24BEB3C40], "blackColor"));
      }
      if (v21
        && a11
        && !-[TSDStroke isFrame](v21, "isFrame")
        && !-[TSDStroke prefersToApplyToShapeRenderableDuringManipulation](v21, "prefersToApplyToShapeRenderableDuringManipulation"))
      {
        v96 = [TSDStroke alloc];
        v94 = -[TSDStroke color](v21, "color");
        -[TSDStroke width](v21, "width");
        v23 = v22;
        v93 = -[TSDStroke cap](v21, "cap");
        v24 = -[TSDStroke join](v21, "join");
        v25 = -[TSDStroke pattern](v21, "pattern");
        -[TSDStroke miterLimit](v21, "miterLimit");
        v21 = -[TSDStroke initWithColor:width:cap:join:pattern:miterLimit:](v96, "initWithColor:width:cap:join:pattern:miterLimit:", v94, v93, v24, v25, v23, v26);
      }
    }
    else
    {
      v21 = 0;
    }
  }
  v27 = a6 < 1.0 && v15;
  v28 = v27 && v16;
  if (v27 && v16 && (CGContextSaveGState(a3), CGContextSetAlpha(a3, a6), v21))
  {
    CGContextBeginTransparencyLayer(a3, 0);
    v97 = 1;
  }
  else
  {
    v97 = 0;
  }
  CGContextSaveGState(a3);
  v29 = -[TSDImageRep imageLayout](self, "imageLayout");
  objc_msgSend((id)objc_msgSend(v29, "imageGeometry"), "size");
  v30 = TSDRectWithSize();
  v32 = v31;
  v34 = v33;
  v36 = v35;
  if (v16)
  {
    v37 = objc_msgSend(v29, "maskLayout");
    if (!v13)
      goto LABEL_38;
    v38 = (void *)v37;
    if (!self->super.mFrameMaskLayer || !-[TSDStroke hasMask](v21, "hasMask"))
    {
LABEL_34:
      if (v38)
      {
        memset(&v113, 0, sizeof(v113));
        if (v29)
          objc_msgSend(v29, "layoutToMaskTransform");
        objc_msgSend(v38, "pathBounds");
        v110 = v113;
        CGAffineTransformTranslate(&transform, &v110, -v51, -v52);
        v113 = transform;
        v53 = +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", objc_msgSend(v38, "path"));
        transform = v113;
        -[TSDBezierPath transformUsingAffineTransform:](v53, "transformUsingAffineTransform:", &transform);
        LODWORD(v54) = 0;
        CGContextAddPath(a3, (CGPathRef)objc_msgSend(-[TSDBezierPath aliasedPathInContext:effectiveStrokeWidth:](v53, "aliasedPathInContext:effectiveStrokeWidth:", a3, v54), "CGPath"));
        CGContextClip(a3);
      }
LABEL_38:
      if (objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath") && v12)
      {
        v55 = (id)objc_msgSend((id)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"), "copy");
        v56 = -[TSDImageRep imageLayout](self, "imageLayout");
        if (v56)
          objc_msgSend(v56, "imageDataToVisualSizeTransform");
        else
          memset(v109, 0, sizeof(v109));
        objc_msgSend(v55, "transformUsingAffineTransform:", v109);
        v57 = -[TSDImageRep imageLayout](self, "imageLayout");
        if (v57)
          objc_msgSend(v57, "layoutToImageTransform");
        else
          memset(v108, 0, sizeof(v108));
        objc_msgSend(v55, "transformUsingAffineTransform:", v108);
        LODWORD(v58) = 0;
        CGContextAddPath(a3, (CGPathRef)objc_msgSend((id)objc_msgSend(v55, "aliasedPathInContext:effectiveStrokeWidth:", a3, v58), "CGPath"));
        CGContextClip(a3);
      }
      if (v29)
        objc_msgSend(v29, "layoutToImageTransform");
      else
        memset(&v107, 0, sizeof(v107));
      CGContextConcatCTM(a3, &v107);
      CGContextSaveGState(a3);
      if (v13 && self->super.mFrameMaskLayer && -[TSDStroke hasMask](v21, "hasMask"))
        -[CALayer blendMaskBeforeRenderingImageInContext:](self->super.mFrameMaskLayer, "blendMaskBeforeRenderingImageInContext:", a3);
      v113.a = 0.0;
      *(_QWORD *)&v113.b = &v113;
      *(_OWORD *)&v113.c = 0x2020000000uLL;
      transform.a = 0.0;
      *(_QWORD *)&transform.b = &transform;
      *(_QWORD *)&transform.c = 0x2020000000;
      transform.d = 0.0;
      v110.a = 0.0;
      *(_QWORD *)&v110.b = &v110;
      *(_QWORD *)&v110.c = 0x2020000000;
      LOBYTE(v110.d) = 0;
      v59 = *(NSObject **)&self->mSizingStateReady;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __116__TSDImageRep_p_drawInContext_withContent_withStroke_withOpacity_withMask_withIAMask_forLayer_forShadow_forHitTest___block_invoke;
      block[3] = &unk_24D82BBD8;
      block[4] = self;
      block[5] = &v113;
      block[6] = &transform;
      block[7] = &v110;
      dispatch_sync(v59, block);
      if ((a10 || a11) && (objc_msgSend(v29, "hasAlpha") & 1) == 0)
      {
        CGContextSetRGBFillColor(a3, 0.0, 0.0, 0.0, 1.0);
        v117.origin.x = v30;
        v117.origin.y = v32;
        v117.size.width = v34;
        v117.size.height = v36;
        CGContextFillRect(a3, v117);
LABEL_79:
        v75 = *(CGImage **)(*(_QWORD *)&v113.b + 24);
        if (v75)
          CGImageRelease(v75);
        _Block_object_dispose(&v110, 8);
        _Block_object_dispose(&transform, 8);
        _Block_object_dispose(&v113, 8);
        CGContextRestoreGState(a3);
        goto LABEL_82;
      }
      if (*(_QWORD *)(*(_QWORD *)&v113.b + 24))
      {
        if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isDynamicallyChangingImageAdjustments"))
        {
          CGImageRelease(*(CGImageRef *)(*(_QWORD *)&v113.b + 24));
          v60 = -[TSDImageRep p_newImageByApplyingAdjustmentsToImage:alreadyEnhanced:](self, "p_newImageByApplyingAdjustmentsToImage:alreadyEnhanced:", *(_QWORD *)(*(_QWORD *)&v113.b + 24), *(unsigned __int8 *)(*(_QWORD *)&v110.b + 24));
          *(_QWORD *)(*(_QWORD *)&v113.b + 24) = v60;
        }
        v114.origin.x = v30;
        v114.origin.y = v32;
        v114.size.width = v34;
        v114.size.height = v36;
        MinY = CGRectGetMinY(v114);
        v115.origin.x = v30;
        v115.origin.y = v32;
        v115.size.width = v34;
        v115.size.height = v36;
        MaxY = CGRectGetMaxY(v115);
        CGContextTranslateCTM(a3, 0.0, MinY + MaxY);
        CGContextScaleCTM(a3, 1.0, -1.0);
        TSUImageOrientationTransform();
        CGContextConcatCTM(a3, &v105);
        v116.origin.x = v30;
        v116.origin.y = v32;
        v116.size.width = v34;
        v116.size.height = v36;
        CGContextDrawImage(a3, v116, *(CGImageRef *)(*(_QWORD *)&v113.b + 24));
        goto LABEL_79;
      }
      v63 = -[TSDInteractiveCanvasController i_inPrintPreviewMode](-[TSDCanvas canvasController](-[TSDRep canvas](self, "canvas"), "canvasController"), "i_inPrintPreviewMode");
      v64 = objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "isInBackground");
      if (!v63
        && -[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive")
        && (-[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale"), v65 < 0.5)
        || v95 && self->mLayerUpdateAndSizingStateLock
        || ((-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive") | v64 ^ 1) & 1) == 0)
      {
        v70 = -[TSDImageRep p_validatedThumbnailImageProvider](self, "p_validatedThumbnailImageProvider");
        if (v70)
        {
          v71 = (CGImage *)objc_msgSend(v70, "CGImageForSize:inContext:orLayer:", a3, 0, v34, v36);
          if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isDynamicallyChangingImageAdjustments"))
          {
            v71 = -[TSDImageRep p_newImageByApplyingAdjustmentsToImage:alreadyEnhanced:](self, "p_newImageByApplyingAdjustmentsToImage:alreadyEnhanced:", v71, 0);
            v72 = v71;
          }
          v118.origin.x = v30;
          v118.origin.y = v32;
          v118.size.width = v34;
          v118.size.height = v36;
          v73 = CGRectGetMinY(v118);
          v119.origin.x = v30;
          v119.origin.y = v32;
          v119.size.width = v34;
          v119.size.height = v36;
          v74 = CGRectGetMaxY(v119);
          CGContextTranslateCTM(a3, 0.0, v73 + v74);
          CGContextScaleCTM(a3, 1.0, -1.0);
          TSUImageOrientationTransform();
          CGContextConcatCTM(a3, &v104);
          v120.origin.x = v30;
          v120.origin.y = v32;
          v120.size.width = v34;
          v120.size.height = v36;
          CGContextDrawImage(a3, v120, v71);
          goto LABEL_79;
        }
        v69 = -[TSDImageRep p_validatedImageProvider](self, "p_validatedImageProvider");
      }
      else
      {
        v66 = -[TSDImageRep p_validatedImageProvider](self, "p_validatedImageProvider");
        if (!objc_msgSend(v66, "isError")
          || !-[TSDImageRep p_validatedThumbnailImageProvider](self, "p_validatedThumbnailImageProvider"))
        {
          goto LABEL_78;
        }
        if ((objc_msgSend(-[TSDImageRep p_imageData](self, "p_imageData"), "isLengthLikelyToBeGreaterThan:", TSDImageMaxAllowedDataLength()) & 1) == 0)
        {
          v67 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v68 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageRep p_drawInContext:withContent:withStroke:withOpacity:withMask:withIAMask:forLayer:forShadow:forHitTest:]");
          objc_msgSend(v67, "handleFailureInFunction:file:lineNumber:description:", v68, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 1993, CFSTR("Invalid image data %@! Rendering thumbnail data."), objc_msgSend(-[TSDImageRep p_imageData](self, "p_imageData"), "filename"));
        }
        v69 = -[TSDImageRep p_validatedThumbnailImageProvider](self, "p_validatedThumbnailImageProvider");
      }
      v66 = v69;
LABEL_78:
      objc_msgSend(v66, "drawImageInContext:rect:", a3, v30, v32, v34, v36);
      goto LABEL_79;
    }
    if (objc_msgSend(v29, "hasMaskingPath"))
    {
      TSDPathBoundsIncludingStroke((CGPathRef)objc_msgSend(v29, "pathToStroke"), v21);
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v46 = v45;
      if (v29)
      {
        objc_msgSend(v29, "layoutToMaskTransform");
LABEL_33:
        v113 = transform;
        CGContextConcatCTM(a3, &transform);
        -[CALayer applyMaskForRectWithCoverage:toContext:](self->super.mFrameMaskLayer, "applyMaskForRectWithCoverage:toContext:", a3, v40, v42, v44, v46);
        transform = v113;
        CGAffineTransformInvert(&v111, &transform);
        CGContextConcatCTM(a3, &v111);
        goto LABEL_34;
      }
    }
    else
    {
      -[TSDStroke coverageRect:](v21, "coverageRect:", v30, v32, v34, v36);
      v40 = v47;
      v42 = v48;
      v44 = v49;
      v46 = v50;
      if (v29)
      {
        objc_msgSend(v29, "layoutToImageTransform");
        goto LABEL_33;
      }
    }
    memset(&transform, 0, sizeof(transform));
    goto LABEL_33;
  }
LABEL_82:
  CGContextRestoreGState(a3);
  if (!v15 || !v21 || v95 && -[TSDImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
    goto LABEL_113;
  CGContextSaveGState(a3);
  if (objc_msgSend(v29, "pathToStroke"))
  {
    v76 = (const CGPath *)objc_msgSend(v29, "pathToStroke");
    if (!v76)
      goto LABEL_112;
    v77 = v76;
    PathBoundingBox = CGPathGetPathBoundingBox(v76);
    x = PathBoundingBox.origin.x;
    y = PathBoundingBox.origin.y;
    width = PathBoundingBox.size.width;
    height = PathBoundingBox.size.height;
    if (-[TSDStroke isFrame](v21, "isFrame"))
    {
      if (objc_msgSend(v29, "shouldRenderFrameStroke"))
      {
        if (v29)
          objc_msgSend(v29, "layoutToMaskTransform");
        else
          memset(&v103, 0, sizeof(v103));
        CGContextConcatCTM(a3, &v103);
        mFrameMaskLayer = self->super.mFrameMaskLayer;
        CGContextGetCTM(&v102, a3);
        v86 = TSDTransformScale(&v102.a);
        v87 = mFrameMaskLayer;
        v88 = x;
        v89 = y;
        v90 = width;
        v91 = height;
LABEL_111:
        -[CALayer frameRect:inContext:withTotalScale:](v87, "frameRect:inContext:withTotalScale:", a3, v88, v89, v90, v91, v86);
        goto LABEL_112;
      }
      goto LABEL_112;
    }
    if (v29)
      objc_msgSend(v29, "layoutToMaskTransform");
    else
      memset(&v101, 0, sizeof(v101));
    CGContextConcatCTM(a3, &v101);
    v82 = v21;
    v83 = (uint64_t)v77;
LABEL_105:
    -[TSDStroke paintPath:inContext:](v82, "paintPath:inContext:", v83, a3);
    goto LABEL_112;
  }
  if (!-[TSDStroke isFrame](v21, "isFrame"))
  {
    if (v29)
      objc_msgSend(v29, "layoutToImageTransform");
    else
      memset(&v98, 0, sizeof(v98));
    CGContextConcatCTM(a3, &v98);
    v84 = objc_msgSend(v29, "pathToStroke");
    if (!v84)
    {
      -[TSDStroke paintRect:inContext:](v21, "paintRect:inContext:", a3, v30, v32, v34, v36);
      goto LABEL_112;
    }
    v83 = v84;
    v82 = v21;
    goto LABEL_105;
  }
  if (objc_msgSend(v29, "shouldRenderFrameStroke"))
  {
    if (v29)
      objc_msgSend(v29, "layoutToImageTransform");
    else
      memset(&v100, 0, sizeof(v100));
    CGContextConcatCTM(a3, &v100);
    v92 = self->super.mFrameMaskLayer;
    CGContextGetCTM(&v99, a3);
    v86 = TSDTransformScale(&v99.a);
    v87 = v92;
    v88 = v30;
    v89 = v32;
    v90 = v34;
    v91 = v36;
    goto LABEL_111;
  }
LABEL_112:
  CGContextRestoreGState(a3);
LABEL_113:
  if (v97)
    CGContextEndTransparencyLayer(a3);
  if (v28)
    CGContextRestoreGState(a3);
}

CGImage *__116__TSDImageRep_p_drawInContext_withContent_withStroke_withOpacity_withMask_withIAMask_forLayer_forShadow_forHitTest___block_invoke(_QWORD *a1)
{
  CGImage *result;

  result = *(CGImage **)(a1[4] + 704);
  if (result)
  {
    result = CGImageRetain(result);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 728);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_BYTE *)(a1[4] + 737);
  }
  return result;
}

- (void)addBitmapsToRenderingQualityInfo:(id)a3 inContext:(CGContext *)a4
{
  id v6;
  id v7;

  v6 = -[TSDImageRep p_validatedBitmapImageProvider](self, "p_validatedBitmapImageProvider", a3, a4);
  if (v6)
  {
    v7 = v6;
    -[TSDImageRep p_desiredSizedImageSize](self, "p_desiredSizedImageSize");
    objc_msgSend(a3, "cacheProvider:ofSize:", v7);
  }
}

- (void)didCreateLayer:(id)a3
{
  -[TSDImageRep p_generateSizedImageIfNecessary](self, "p_generateSizedImageIfNecessary");
  -[TSDImageRep p_takeSizedImageFromStateIfReady](self, "p_takeSizedImageFromStateIfReady");
  LOBYTE(self->mLastPictureFrameLayerTransform.ty) = -[TSDImageRep p_directlyManagesContentForLayer:](self, "p_directlyManagesContentForLayer:", a3);
}

- (BOOL)directlyManagesLayerContent
{
  return LOBYTE(self->mLastPictureFrameLayerTransform.ty);
}

- (void)p_updateDirectlyManagesLayerContentForLayer:(id)a3
{
  int ty_low;
  _BOOL4 v5;
  _BOOL4 v6;

  ty_low = LOBYTE(self->mLastPictureFrameLayerTransform.ty);
  v5 = -[TSDImageRep p_directlyManagesContentForLayer:](self, "p_directlyManagesContentForLayer:", a3);
  LOBYTE(self->mLastPictureFrameLayerTransform.ty) = v5;
  if (!ty_low || v5)
  {
    if (ty_low)
      v6 = 0;
    else
      v6 = v5;
    if (v6)
    {
      if (-[TSDCanvas isCanvasInteractive](self->super.super.super.mCanvas, "isCanvasInteractive"))
        objc_msgSend(-[TSDInteractiveCanvasController layerForRep:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self), "setContents:", 0);
    }
  }
  else
  {
    -[TSDStyledRep setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (CGImage)p_imageForDirectlyManagedLayer:(id)a3
{
  CGImage *v5;
  NSObject *v6;
  int v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  if (-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive")
    && -[TSDInteractiveCanvasController shouldSuppressRendering](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "shouldSuppressRendering"))
  {
    v5 = 0;
  }
  else
  {
    v6 = *(NSObject **)&self->mSizingStateReady;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __46__TSDImageRep_p_imageForDirectlyManagedLayer___block_invoke;
    v9[3] = &unk_24D82BC00;
    v9[4] = self;
    v9[5] = a3;
    v9[6] = &v14;
    v9[7] = &v10;
    dispatch_sync(v6, v9);
    v7 = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isDynamicallyChangingImageAdjustments");
    v5 = (CGImage *)v15[3];
    if (v7)
    {
      v5 = -[TSDImageRep p_newImageByApplyingAdjustmentsToImage:alreadyEnhanced:](self, "p_newImageByApplyingAdjustmentsToImage:alreadyEnhanced:", v5, *((unsigned __int8 *)v11 + 24));
      v15[3] = (uint64_t)v5;
    }
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v5;
}

_QWORD *__46__TSDImageRep_p_imageForDirectlyManagedLayer___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *result;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[88];
  if (v3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  else
  {
    objc_msgSend(v2, "p_desiredSizedImageSize");
    v6 = v5;
    v8 = v7;
    result = *(_QWORD **)(a1 + 32);
    if (result[85])
    {
      if (objc_msgSend(result, "p_validatedBitmapImageProvider") && (v9 = v6 * v8, v6 * v8 < 4096.0 * 4096.0))
      {
        result = (_QWORD *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "p_validatedBitmapImageProvider", v9), "CGImageForSize:inContext:orLayer:", 0, *(_QWORD *)(a1 + 40), v6, v8);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
      }
      else
      {
        result = (_QWORD *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "p_validatedThumbnailImageProvider", v9), "CGImageForSize:inContext:orLayer:", 0, *(_QWORD *)(a1 + 40), v6, v8);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      }
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      result = (_QWORD *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "p_validatedBitmapImageProvider"), "CGImageForSize:inContext:orLayer:", 0, *(_QWORD *)(a1 + 40), v6, v8);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        result = (_QWORD *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "p_validatedThumbnailImageProvider"), "CGImageForNaturalSize");
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      }
    }
  }
  return result;
}

- (int64_t)p_orientationForDirectlyManagedLayer
{
  NSObject *v3;
  int64_t v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = *(NSObject **)&self->mSizingStateReady;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__TSDImageRep_p_orientationForDirectlyManagedLayer__block_invoke;
  block[3] = &unk_24D82BC28;
  block[4] = self;
  block[5] = &v11;
  block[6] = &v7;
  dispatch_sync(v3, block);
  if (*((_BYTE *)v8 + 24))
  {
    v4 = v12[3];
  }
  else
  {
    v4 = objc_msgSend(-[TSDImageRep p_validatedBitmapImageProvider](self, "p_validatedBitmapImageProvider"), "orientation");
    v12[3] = v4;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

_QWORD *__51__TSDImageRep_p_orientationForDirectlyManagedLayer__block_invoke(uint64_t a1)
{
  _QWORD *result;
  double v3;
  double v4;

  result = *(_QWORD **)(a1 + 32);
  if (result[88])
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result[91];
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (result[85])
  {
    result = (_QWORD *)objc_msgSend((id)objc_msgSend(result, "imageInfo"), "naturalSize");
    if (v3 * v4 >= 4096.0 * 4096.0)
    {
      result = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "p_validatedThumbnailImageProvider");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result != 0;
    }
  }
  return result;
}

- (BOOL)p_directlyManagesContentForLayer:(id)a3
{
  CGImage *v4;
  id v5;
  int v6;
  double v7;

  v4 = -[TSDImageRep p_imageForDirectlyManagedLayer:](self, "p_imageForDirectlyManagedLayer:", a3);
  if (v4)
  {
    v5 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
    if (!objc_msgSend(v5, "shouldRender"))
      v5 = 0;
    if (-[TSDLayout isStrokeBeingManipulated](-[TSDRep layout](self, "layout"), "isStrokeBeingManipulated"))
    {
      v6 = objc_msgSend(v5, "prefersToApplyToShapeRenderableDuringManipulation");
      if (!v5)
        goto LABEL_9;
    }
    else
    {
      v6 = 0;
      if (!v5)
      {
LABEL_9:
        LOBYTE(v4) = 1;
        return (char)v4;
      }
    }
    if ((v6 & objc_msgSend(v5, "canApplyToShapeRenderable") & 1) != 0)
      goto LABEL_9;
    LODWORD(v4) = objc_msgSend(v5, "prefersToApplyToShapeRenderableDuringManipulation");
    if ((_DWORD)v4)
    {
      -[TSDStyledRep opacity](self, "opacity");
      if (v7 == 1.0)
        LOBYTE(v4) = objc_msgSend(v5, "canApplyToShapeRenderable");
      else
        LOBYTE(v4) = 0;
    }
  }
  return (char)v4;
}

- (CGImage)p_newImageByApplyingAdjustmentsToImage:(CGImage *)a3 alreadyEnhanced:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  void *v10;
  TSDImageAdjuster *v11;
  CGImage *v12;
  uint64_t v14;

  v4 = a4;
  v7 = (void *)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageAdjustments");
  v8 = (uint64_t)v7;
  v14 = 0;
  if (v4)
  {
    v8 = objc_msgSend(v7, "imageAdjustmentsWithoutEnhance");
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v7, "enhance"))
    goto LABEL_7;
  v9 = (uint64_t *)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "enhancedImageData");
  if (v9)
  {
    objc_opt_class();
    objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "temporaryProviderForData:shouldValidate:", v9, 1);
    v10 = (void *)TSUDynamicCast();
    if (!v10)
      goto LABEL_7;
    v14 = objc_msgSend(v10, "CGImageForNaturalSize");
    v9 = &v14;
  }
LABEL_8:
  v11 = -[TSDImageAdjuster initWithImageAdjustments:]([TSDImageAdjuster alloc], "initWithImageAdjustments:", v8);
  v12 = -[TSDImageAdjuster newFilteredImageForImage:enhancedImage:](v11, "newFilteredImageForImage:enhancedImage:", a3, v9);

  return v12;
}

- (CGRect)frameInUnscaledCanvas
{
  double v3;
  double x;
  double v5;
  double y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  id v11;
  const CGPath *v12;
  CGPath *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGAffineTransform v26;
  CGAffineTransform v27[2];
  objc_super v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  v28.receiver = self;
  v28.super_class = (Class)TSDImageRep;
  -[TSDRep frameInUnscaledCanvas](&v28, sel_frameInUnscaledCanvas);
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  v11 = -[TSDImageRep imageLayout](self, "imageLayout");
  if (objc_msgSend(v11, "maskLayout") && objc_msgSend(v11, "pathToStroke"))
  {
    if (!LOBYTE(self->mFrameInUnscaledCanvasRelativeToSuper.size.height))
    {
      memset(&v27[1], 0, sizeof(CGAffineTransform));
      if (v11)
        objc_msgSend(v11, "layoutToMaskTransform");
      v12 = (const CGPath *)objc_msgSend(v11, "pathToStroke");
      v27[0] = v27[1];
      v13 = TSDCreateTransformedPath(v12, v27);
      TSDPathBoundsIncludingStroke(v13, -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke"));
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      CGPathRelease(v13);
      if (v11)
        objc_msgSend(v11, "transformInRoot");
      else
        memset(&v26, 0, sizeof(v26));
      v29.origin.x = v15;
      v29.origin.y = v17;
      v29.size.width = v19;
      v29.size.height = v21;
      v30 = CGRectApplyAffineTransform(v29, &v26);
      *(CGRect *)&self->mLastLayoutToImageTransform.ty = CGRectOffset(v30, -x, -y);
      LOBYTE(self->mFrameInUnscaledCanvasRelativeToSuper.size.height) = 1;
    }
    v31 = CGRectOffset(*(CGRect *)&self->mLastLayoutToImageTransform.ty, x, y);
    x = v31.origin.x;
    y = v31.origin.y;
    width = v31.size.width;
    height = v31.size.height;
  }
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)p_getAliasedValuesForMaskToBoundsDirectLayerFrame:(CGRect *)a3 transform:(CGAffineTransform *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v18;
  _OWORD v19[3];

  v7 = (void *)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "pureGeometry");
  if (v7)
    objc_msgSend(v7, "fullTransform");
  else
    memset(v19, 0, sizeof(v19));
  v8 = (void *)objc_msgSend(+[TSDLayoutGeometry geometryFromFullTransform:](TSDLayoutGeometry, "geometryFromFullTransform:", v19), "mutableCopy");
  memset(&v18, 0, sizeof(v18));
  v9 = (void *)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometry");
  if (v9)
    objc_msgSend(v9, "transform");
  else
    memset(&t1, 0, sizeof(t1));
  v10 = (void *)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "pureGeometry");
  if (v10)
    objc_msgSend(v10, "transform");
  else
    memset(&v15, 0, sizeof(v15));
  CGAffineTransformInvert(&t2, &v15);
  CGAffineTransformConcat(&v18, &t1, &t2);
  memset(&v14, 0, sizeof(v14));
  v11 = (void *)objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout"), "pureGeometry");
  if (v11)
    objc_msgSend(v11, "transform");
  else
    memset(&v13, 0, sizeof(v13));
  v12 = v18;
  CGAffineTransformConcat(&v14, &v13, &v12);
  v12 = v14;
  objc_msgSend(v8, "transformBy:", &v12);
  -[TSDRep computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:](self, "computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:", a3, a4, v8);

}

- (void)updateLayerGeometryFromLayout:(id)a3
{
  uint64_t v5;
  CGAffineTransform v6;
  CGAffineTransform t1;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;

  if (-[TSDImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    v5 = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometry");
    v11 = 0u;
    v12 = 0u;
    memset(&v10, 0, sizeof(v10));
    if (-[TSDImageRep p_shouldRenderWithMaskToBounds](self, "p_shouldRenderWithMaskToBounds"))
    {
      -[TSDImageRep p_getAliasedValuesForMaskToBoundsDirectLayerFrame:transform:](self, "p_getAliasedValuesForMaskToBoundsDirectLayerFrame:transform:", &v11, &v10);
      v9 = v10;
      -[TSDRep antiAliasDefeatLayerFrame:forTransform:](self, "antiAliasDefeatLayerFrame:forTransform:", &v11, &v9);
    }
    else
    {
      -[TSDRep computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:](self, "computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:", &v11, &v10, v5);
      -[TSDImageRep p_orientationForDirectlyManagedLayer](self, "p_orientationForDirectlyManagedLayer");
      memset(&v9, 0, sizeof(v9));
      TSUImageOrientationTransform();
      memset(&t1, 0, sizeof(t1));
      v6 = v10;
      CGAffineTransformConcat(&v8, &t1, &v6);
      v10 = v8;
      -[TSDRep antiAliasDefeatLayerTransform:forFrame:](self, "antiAliasDefeatLayerTransform:forFrame:", &v10, v11, v12);
    }
    v9 = v10;
    objc_msgSend(a3, "setIfDifferentFrame:orTransform:", &v9, v11, v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TSDImageRep;
    -[TSDRep updateLayerGeometryFromLayout:](&v13, sel_updateLayerGeometryFromLayout_, a3);
  }
  -[TSDImageRep p_invalidateHitTestCache](self, "p_invalidateHitTestCache");
}

- (void)willUpdateLayer:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  char v11;
  int v12;
  char v13;
  CAShapeLayer *v14;
  CAShapeLayer *mStrokeLayer;
  double v16;
  double v17;
  CALayer *mFrameMaskLayer;
  CAShapeLayer *mMaskLayer;
  CALayer *mTapToReplaceLayer;
  double v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  CAShapeLayer *v25;
  _QWORD block[7];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  objc_super v31;

  -[TSDImageRep p_generateSizedImageIfNecessary](self, "p_generateSizedImageIfNecessary");
  objc_msgSend(*(id *)&self->mBaseMaskLayoutTransform.ty, "lock");
  v31.receiver = self;
  v31.super_class = (Class)TSDImageRep;
  -[TSDStyledRep willUpdateLayer:](&v31, sel_willUpdateLayer_, a3);
  -[TSDImageRep p_takeSizedImageFromStateIfReady](self, "p_takeSizedImageFromStateIfReady");
  -[TSDImageRep p_updateDirectlyManagesLayerContentForLayer:](self, "p_updateDirectlyManagesLayerContentForLayer:", a3);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  if (!-[TSDImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
    goto LABEL_28;
  v5 = -[TSDImageRep imageLayout](self, "imageLayout");
  v6 = *(NSObject **)&self->mSizingStateReady;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__TSDImageRep_willUpdateLayer___block_invoke;
  block[3] = &unk_24D82B208;
  block[5] = self;
  block[6] = &v27;
  block[4] = v5;
  dispatch_sync(v6, block);
  if (*((_BYTE *)v28 + 24))
    -[TSDImageRep p_createMaskLayerForLayer:](self, "p_createMaskLayerForLayer:", a3);
  v7 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
  v8 = v7;
  if (v7
    && objc_msgSend(v7, "shouldRender")
    && (!objc_msgSend(v8, "isFrame") || objc_msgSend(v5, "shouldRenderFrameStroke")))
  {
    v9 = objc_msgSend(v8, "isFrame");
    if (v9 && objc_msgSend(v8, "hasMask"))
    {
      v10 = objc_msgSend(v5, "shouldRenderFrameStroke");
      v11 = v10;
      if (*((_BYTE *)v28 + 24))
        v12 = 0;
      else
        v12 = v10;
      if (v12 == 1)
      {
        v11 = 1;
        *((_BYTE *)v28 + 24) = 1;
        -[TSDImageRep p_createMaskLayerForLayer:](self, "p_createMaskLayerForLayer:", a3);
      }
    }
    else
    {
      v11 = 0;
    }
    if (!self->super.mMaskLayer)
    {
      v14 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
      self->super.mMaskLayer = v14;
      -[CAShapeLayer setDelegate:](v14, "setDelegate:", self);
      -[CAShapeLayer setFillColor:](self->super.mMaskLayer, "setFillColor:", 0);
      if (v9)
      {
        mStrokeLayer = self->super.mStrokeLayer;
        if (mStrokeLayer)
        {
          -[CAShapeLayer removeFromSuperlayer](mStrokeLayer, "removeFromSuperlayer");
          self->super.mStrokeLayer = 0;
        }
        -[TSDMediaRep i_updateFrameRep](self, "i_updateFrameRep");
        -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
        v17 = v16;
        mFrameMaskLayer = self->super.mFrameMaskLayer;
        mMaskLayer = self->super.mMaskLayer;
        mTapToReplaceLayer = self->super.mTapToReplaceLayer;
        -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
        self->super.mStrokeLayer = (CAShapeLayer *)-[CALayer applyToCALayer:withRepLayer:maskLayer:viewScale:](mFrameMaskLayer, "applyToCALayer:withRepLayer:maskLayer:viewScale:", mMaskLayer, a3, mTapToReplaceLayer, v17 * v21);
        v22 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
        *(_OWORD *)&self->super.mFrameRep = *MEMORY[0x24BDBF090];
        *(_OWORD *)&self->super.mLastPictureFrameLayerRect.origin.y = v22;
        v23 = MEMORY[0x24BDBD8B8];
        v24 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
        *(_OWORD *)&self->mMaskSublayer = *MEMORY[0x24BDBD8B8];
        *(_OWORD *)&self->mLastPictureFrameLayerTransform.b = v24;
        *(_OWORD *)&self->mLastPictureFrameLayerTransform.d = *(_OWORD *)(v23 + 32);
      }
    }
    v13 = 1;
  }
  else
  {
    v13 = 0;
    v11 = 0;
  }
  if (*((_BYTE *)v28 + 24))
  {
    if ((v11 & 1) == 0)
    {
      v25 = self->super.mStrokeLayer;
      if (v25)
      {
        -[CAShapeLayer removeFromSuperlayer](v25, "removeFromSuperlayer");
        self->super.mStrokeLayer = 0;
      }
    }
  }
  if ((v13 & 1) == 0)
LABEL_28:
    -[TSDImageRep p_disposeStrokeLayer](self, "p_disposeStrokeLayer");
  if (!*((_BYTE *)v28 + 24))
    -[TSDImageRep p_disposeMaskLayer](self, "p_disposeMaskLayer");
  _Block_object_dispose(&v27, 8);
}

uint64_t __31__TSDImageRep_willUpdateLayer___block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;

  v3 = (objc_msgSend(*(id *)(a1 + 32), "maskLayout")
     || (result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "imageInfo"), "instantAlphaPath")) != 0)
    && ((result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "imageLayout"), "isInMaskEditMode"), (result & 1) != 0)
     || (result = objc_msgSend(*(id *)(a1 + 40), "p_shouldRenderWithMaskToBounds"), (result & 1) == 0))
    && *(_BYTE *)(*(_QWORD *)(a1 + 40) + 736) == 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (void)didUpdateLayer:(id)a3
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  CAShapeLayer *v37;
  CGFloat x;
  CGFloat y;
  int *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  void *v49;
  double tx;
  double ty;
  double v52;
  double v53;
  double v54;
  double v55;
  int v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CAShapeLayer *mIAMaskLayer;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CAShapeLayer *mMaskPathLayer;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  double v79;
  double v80;
  double v81;
  double v82;
  float v83;
  double v84;
  double v85;
  _OWORD v86[2];
  double v87;
  double v88;
  CGAffineTransform v89;
  CGAffineTransform v90;
  CGAffineTransform v91;
  CGAffineTransform v92;
  CGAffineTransform v93;
  CGAffineTransform v94;
  CGAffineTransform v95;
  _OWORD v96[2];
  CGAffineTransform v97;
  CGAffineTransform v98;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v101;
  CGAffineTransform v102;
  CGAffineTransform v103;
  CGAffineTransform v104;
  CGAffineTransform v105;
  CGAffineTransform v106;
  _OWORD v107[3];
  _QWORD block[6];
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  void (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  CGImage *v114;
  objc_super v115;
  CGRect v116;
  CGRect PathBoundingBox;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;

  v115.receiver = self;
  v115.super_class = (Class)TSDImageRep;
  -[TSDStyledRep didUpdateLayer:](&v115, sel_didUpdateLayer_);
  v5 = -[TSDImageRep imageLayout](self, "imageLayout");
  v6 = -[TSDImageRep maskLayout](self, "maskLayout");
  if (!-[TSDImageRep p_shouldRenderWithMaskToBounds](self, "p_shouldRenderWithMaskToBounds"))
  {
    v7 = *(void **)&self->mFrameInUnscaledCanvasIsValid;
    if (v7)
    {
      objc_msgSend(v7, "removeFromSuperlayer");

      *(_QWORD *)&self->mFrameInUnscaledCanvasIsValid = 0;
      objc_msgSend(a3, "setMasksToBounds:", 0);
    }
  }
  if (-[TSDImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    v109 = 0;
    v110 = &v109;
    v111 = 0x3052000000;
    v112 = __Block_byref_object_copy__12;
    v113 = __Block_byref_object_dispose__12;
    v114 = 0;
    v114 = -[TSDImageRep p_imageForDirectlyManagedLayer:](self, "p_imageForDirectlyManagedLayer:", a3);
    v8 = *(NSObject **)&self->mSizingStateReady;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __30__TSDImageRep_didUpdateLayer___block_invoke;
    block[3] = &unk_24D82A6F8;
    block[4] = self;
    block[5] = &v109;
    dispatch_sync(v8, block);
    v9 = objc_msgSend(a3, "contents");
    if (v9 != v110[5])
      objc_msgSend(a3, "setContents:");
    v10 = (void *)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometryInRoot");
    if (v10)
      objc_msgSend(v10, "transform");
    else
      memset(v107, 0, sizeof(v107));
    if (TSDIsTransformAxisAligned((double *)v107))
    {
      if (objc_msgSend(a3, "edgeAntialiasingMask"))
        objc_msgSend(a3, "setEdgeAntialiasingMask:", 0);
    }
    else if (objc_msgSend(a3, "edgeAntialiasingMask") != 15)
    {
      objc_msgSend(a3, "setEdgeAntialiasingMask:", 15);
    }
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "BOOLForKey:", CFSTR("TSDSuppressImageInterpolation")))v11 = CFSTR("nearest");
    else
      v11 = CFSTR("linear");
    objc_msgSend(a3, "setMagnificationFilter:", v11);
    v12 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
    v13 = v12;
    if (v12
      && objc_msgSend(v12, "shouldRender")
      && (!objc_msgSend(v13, "isFrame") || objc_msgSend(v5, "shouldRenderFrameStroke")))
    {
      -[TSDImageRep p_updateStrokeLayerForStroke:repLayer:](self, "p_updateStrokeLayerForStroke:repLayer:", v13, a3);
    }
    if (!v6 && !objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"))
      goto LABEL_67;
    if (-[TSDImageRep p_shouldRenderWithMaskToBounds](self, "p_shouldRenderWithMaskToBounds"))
    {
      if (!*(_QWORD *)&self->mFrameInUnscaledCanvasIsValid)
        *(_QWORD *)&self->mFrameInUnscaledCanvasIsValid = objc_alloc_init(MEMORY[0x24BDE56D0]);
      if ((objc_msgSend((id)objc_msgSend(a3, "sublayers"), "containsObject:", *(_QWORD *)&self->mFrameInUnscaledCanvasIsValid) & 1) == 0)objc_msgSend(a3, "addSublayer:", *(_QWORD *)&self->mFrameInUnscaledCanvasIsValid);
      objc_msgSend(a3, "setMasksToBounds:", 1);
      objc_msgSend(*(id *)&self->mFrameInUnscaledCanvasIsValid, "setContents:", v110[5]);
      objc_msgSend(a3, "setContents:", 0);
      -[TSDRep scaleToConvertNaturalToLayerRelative](self, "scaleToConvertNaturalToLayerRelative");
      v85 = v14;
      objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometry"), "size");
      v16 = v15;
      v18 = v17;
      -[TSDImageRep p_orientationForDirectlyManagedLayer](self, "p_orientationForDirectlyManagedLayer");
      TSDMultiplySizeScalar(v16, v18, v85);
      v19 = TSDRectWithSize();
      v21 = v20;
      v23 = v22;
      v25 = v24;
      memset(&v106, 0, sizeof(v106));
      TSUImageOrientationTransform();
      memset(&v105, 0, sizeof(v105));
      v116.origin.x = v19;
      v116.origin.y = v21;
      v116.size.width = v23;
      v116.size.height = v25;
      CGRectApplyAffineTransform(v116, &v105);
      v26 = TSDRectWithSize();
      v28 = v27;
      v30 = v29;
      v32 = v31;
      memset(&v105, 0, sizeof(v105));
      v33 = (void *)objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout"), "pureGeometry");
      if (v33)
        objc_msgSend(v33, "transform");
      else
        memset(&v104, 0, sizeof(v104));
      CGAffineTransformInvert(&v105, &v104);
      memset(&v103, 0, sizeof(v103));
      CGAffineTransformMakeTranslation(&v103, v16 * -0.5, v18 * -0.5);
      memset(&v102, 0, sizeof(v102));
      t1 = v103;
      t2 = v106;
      CGAffineTransformConcat(&v101, &t1, &t2);
      t1 = v103;
      CGAffineTransformInvert(&v98, &t1);
      CGAffineTransformConcat(&v102, &v101, &v98);
      t2 = v102;
      v97 = v105;
      CGAffineTransformConcat(&t1, &t2, &v97);
      *(_OWORD *)&v105.a = *(_OWORD *)&t1.a;
      *(_OWORD *)&v105.c = *(_OWORD *)&t1.c;
      *(float64x2_t *)&v105.tx = vmulq_n_f64(*(float64x2_t *)&t1.tx, v85);
      *(_OWORD *)&t2.a = *(_OWORD *)&t1.a;
      *(_OWORD *)&t2.c = *(_OWORD *)&t1.c;
      *(_OWORD *)&t2.tx = *(_OWORD *)&v105.tx;
      TSDTransformConvertForNewOrigin(&t2, &t1, v30 * 0.5, v32 * 0.5);
      v105 = t1;
      objc_msgSend(*(id *)&self->mFrameInUnscaledCanvasIsValid, "setBounds:", v26, v28, v30, v32);
      memset(v96, 0, sizeof(v96));
      memset(&t1, 0, sizeof(t1));
      -[TSDImageRep p_getAliasedValuesForMaskToBoundsDirectLayerFrame:transform:](self, "p_getAliasedValuesForMaskToBoundsDirectLayerFrame:transform:", v96, &t1);
      memset(&t2, 0, sizeof(t2));
      CGAffineTransformMakeTranslation(&v95, *(CGFloat *)v96, *((CGFloat *)v96 + 1));
      v97 = t1;
      CGAffineTransformConcat(&t2, &v97, &v95);
      memset(&v97, 0, sizeof(v97));
      v94 = v105;
      v93 = t2;
      CGAffineTransformConcat(&v97, &v94, &v93);
      -[TSDRep antiAliasDefeatLayerTransform:forFrame:](self, "antiAliasDefeatLayerTransform:forFrame:", &v97, v26, v28, v30, v32);
      v94 = t1;
      -[TSDRep antiAliasDefeatLayerFrame:forTransform:](self, "antiAliasDefeatLayerFrame:forTransform:", v96, &v94);
      memset(&v94, 0, sizeof(v94));
      CGAffineTransformMakeTranslation(&v92, *(CGFloat *)v96, *((CGFloat *)v96 + 1));
      v93 = t1;
      CGAffineTransformConcat(&v94, &v93, &v92);
      v93 = v94;
      CGAffineTransformInvert(&v91, &v93);
      v90 = v97;
      CGAffineTransformConcat(&v93, &v90, &v91);
      v105 = v93;
      objc_msgSend(*(id *)&self->mFrameInUnscaledCanvasIsValid, "setIfDifferentFrame:orTransform:", &v93, v26, v28, v30, v32);
      if (-[CAShapeLayer mask](self->super.mStrokeLayer, "mask"))
        -[CAShapeLayer setMask:](self->super.mStrokeLayer, "setMask:", 0);
      goto LABEL_67;
    }
    if (-[TSDImageRep p_shouldMaskWithFrameLayers](self, "p_shouldMaskWithFrameLayers"))
    {
      -[CALayer setPath:](self->super.mTapToReplaceLayer, "setPath:", 0);
      if (-[CAShapeLayer mask](self->super.mStrokeLayer, "mask")
        && (-[CAShapeLayer mask](self->super.mStrokeLayer, "mask"), objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
      {
        v34 = (void *)-[CAShapeLayer mask](self->super.mStrokeLayer, "mask");
      }
      else
      {
        v34 = (void *)objc_msgSend(MEMORY[0x24BDE5758], "layer");
        objc_msgSend(v34, "setBackgroundColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "blackColor"), "CGColor"));
        -[CAShapeLayer setMask:](self->super.mStrokeLayer, "setMask:", v34);
      }
      if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "pathToStroke"))
      {
        PathBoundingBox = CGPathGetPathBoundingBox((CGPathRef)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "pathToStroke"));
        x = PathBoundingBox.origin.x;
        y = PathBoundingBox.origin.y;
      }
      else
      {
        x = *MEMORY[0x24BDBF090];
        y = *(double *)(MEMORY[0x24BDBF090] + 8);
      }
      v41 = TSDRectWithSize();
      v43 = v42;
      objc_msgSend(-[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke"), "coverageRect:", v41, v42, v44, v45);
      v47 = TSDSubtractPoints(v41, v43, v46);
      memset(&v106, 0, sizeof(v106));
      CGAffineTransformMakeTranslation(&v106, v47, v48);
      memset(&v105, 0, sizeof(v105));
      if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout"))
      {
        v49 = (void *)objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout"), "geometry");
        if (v49)
          objc_msgSend(v49, "transform");
        else
          memset(&v103, 0, sizeof(v103));
        v105 = v103;
      }
      else
      {
        CGAffineTransformMakeTranslation(&v105, x, y);
      }
      v102 = v105;
      memset(&v103, 0, sizeof(v103));
      CGAffineTransformInvert(&v89, &v102);
      v102 = v106;
      CGAffineTransformConcat(&v103, &v89, &v102);
      *(_OWORD *)&v102.a = *(_OWORD *)&v103.a;
      *(_OWORD *)&v102.c = *(_OWORD *)&v103.c;
      tx = v103.tx;
      ty = v103.ty;
      -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
      v53 = v52;
      -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
      v55 = v54;
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
      v86[0] = *(_OWORD *)&v102.a;
      v86[1] = *(_OWORD *)&v102.c;
      v87 = tx * v53;
      v88 = ty * v55;
      objc_msgSend(v34, "setAffineTransform:", v86);
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      v56 = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode");
      if (!v56)
        goto LABEL_66;
      -[TSDImageRep p_updateMaskSublayersForMaskEditMode](self, "p_updateMaskSublayersForMaskEditMode");
      -[TSDImageRep p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:](self, "p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:", self->mIAMaskLayer, a3, 1, 0);
      -[TSDImageRep p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:](self, "p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:", self->mMaskPathLayer, a3, 0, 1);
      if ((objc_msgSend(v5, "isInInstantAlphaMode") & 1) == 0)
        -[TSDImageRep p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:](self, "p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:", self->mContentsLayer, a3, 1, 0);
      if (!objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"))
        objc_msgSend(v34, "setPath:", 0);
      else
LABEL_66:
        -[TSDImageRep p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:](self, "p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:", v34, a3, v56 ^ 1u, 1);
      goto LABEL_67;
    }
    v35 = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode");
    if (!v35)
    {
      if (!LOBYTE(self->mSizedImageOrientation))
      {
        v40 = &OBJC_IVAR___TSDMediaRep_mMaskLayer;
LABEL_59:
        -[TSDImageRep p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:](self, "p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:", *(Class *)((char *)&self->super.super.super.super.isa + *v40), a3, 1, v35 ^ 1u);
      }
LABEL_67:
      if (self->super.mTapToReplaceLayer)
      {
        objc_msgSend(MEMORY[0x24BDE57D8], "begin");
        objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
        objc_msgSend(a3, "bounds");
        v58 = v57;
        v60 = v59;
        v62 = v61;
        v64 = v63;
        -[CALayer frame](self->super.mTapToReplaceLayer, "frame");
        v122.origin.x = v65;
        v122.origin.y = v66;
        v122.size.width = v67;
        v122.size.height = v68;
        v118.origin.x = v58;
        v118.origin.y = v60;
        v118.size.width = v62;
        v118.size.height = v64;
        if (!CGRectEqualToRect(v118, v122))
          -[CALayer setFrame:](self->super.mTapToReplaceLayer, "setFrame:", v58, v60, v62, v64);
        mIAMaskLayer = self->mIAMaskLayer;
        if (mIAMaskLayer)
        {
          -[CAShapeLayer frame](mIAMaskLayer, "frame");
          v123.origin.x = v70;
          v123.origin.y = v71;
          v123.size.width = v72;
          v123.size.height = v73;
          v119.origin.x = v58;
          v119.origin.y = v60;
          v119.size.width = v62;
          v119.size.height = v64;
          if (!CGRectEqualToRect(v119, v123))
            -[CAShapeLayer setFrame:](self->mIAMaskLayer, "setFrame:", v58, v60, v62, v64);
        }
        mMaskPathLayer = self->mMaskPathLayer;
        if (mMaskPathLayer)
        {
          -[CAShapeLayer frame](mMaskPathLayer, "frame");
          v124.origin.x = v75;
          v124.origin.y = v76;
          v124.size.width = v77;
          v124.size.height = v78;
          v120.origin.x = v58;
          v120.origin.y = v60;
          v120.size.width = v62;
          v120.size.height = v64;
          if (!CGRectEqualToRect(v120, v124))
            -[CAShapeLayer setFrame:](self->mMaskPathLayer, "setFrame:", v58, v60, v62, v64);
        }
        objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      }
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      _Block_object_dispose(&v109, 8);
      goto LABEL_78;
    }
    -[TSDImageRep p_updateMaskSublayersForMaskEditMode](self, "p_updateMaskSublayersForMaskEditMode");
    if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInInstantAlphaMode"))
    {
      v36 = objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath");
      v37 = self->mIAMaskLayer;
      if (!v36)
      {
        -[CAShapeLayer setPath:](self->mIAMaskLayer, "setPath:", 0);
        goto LABEL_57;
      }
    }
    else
    {
      -[TSDImageRep p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:](self, "p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:", self->mIAMaskLayer, a3, 1, 0);
      v37 = self->mMaskPathLayer;
    }
    -[TSDImageRep p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:](self, "p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:", v37, a3, 0, 1);
LABEL_57:
    if ((objc_msgSend(v5, "isInInstantAlphaMode") & 1) == 0)
    {
      v40 = &OBJC_IVAR___TSDImageRep_mMaskPathLayer;
      goto LABEL_59;
    }
    goto LABEL_67;
  }
  if (objc_msgSend(a3, "edgeAntialiasingMask") != 15)
    objc_msgSend(a3, "setEdgeAntialiasingMask:", 15);
LABEL_78:
  v79 = *MEMORY[0x24BDBEFB0];
  v80 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(a3, "contentsRect");
  v125.size.width = 1.0;
  v125.size.height = 1.0;
  v125.origin.x = v79;
  v125.origin.y = v80;
  if (!CGRectEqualToRect(v121, v125))
    objc_msgSend(a3, "setContentsRect:", v79, v80, 1.0, 1.0);
  -[TSDStyledRep opacity](self, "opacity");
  v82 = v81;
  objc_msgSend(a3, "opacity");
  v84 = v83;
  if (v82 != v84)
  {
    *(float *)&v84 = v82;
    objc_msgSend(a3, "setOpacity:", v84);
  }
  objc_msgSend(*(id *)&self->mBaseMaskLayoutTransform.ty, "unlock");
}

uint64_t __30__TSDImageRep_didUpdateLayer___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  v3 = a1 + 32;
  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 8) + 8) + 40) != *(_QWORD *)(result + 704))
  {
    if (*(_QWORD *)(result + 680))
    {
      result = objc_msgSend((id)result, "p_shouldBakeMaskIntoSizedImage");
      if ((_DWORD)result)
      {
        result = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
        if ((result & 1) == 0)
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
      }
    }
  }
  return result;
}

- (BOOL)p_shouldMaskWithFrameLayers
{
  id v3;
  void *v4;

  v3 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
  if (v3
    && (v4 = v3, objc_msgSend(v3, "shouldRender"))
    && objc_msgSend(v4, "isFrame")
    && objc_msgSend(v4, "hasMask"))
  {
    return objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "shouldRenderFrameStroke");
  }
  else
  {
    return 0;
  }
}

- (void)p_updateMaskLayer:(id)a3 forRepLayer:(id)a4 shouldIncludeMask:(BOOL)a5 shouldIncludeInstantAlpha:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  CGFloat v15;
  const CGPath *MutableCopy;
  __int128 v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  CGFloat v24;
  CGFloat v25;
  id v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  CGFloat v38;
  void *v39;
  uint64_t v40;
  CGPath *v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  _OWORD v52[3];
  CGAffineTransform v53;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v56;
  CGAffineTransform v57;

  v6 = a6;
  v7 = a5;
  v11 = (void *)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout");
  if (!-[TSDImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageRep p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 2730, CFSTR("Updating mask layer for a non-directly managed layer!"));
  }
  if (a3 && !-[TSDImageRep p_shouldRenderWithMaskToBounds](self, "p_shouldRenderWithMaskToBounds"))
  {
    -[TSDRep scaleToConvertNaturalToLayerRelative](self, "scaleToConvertNaturalToLayerRelative");
    v15 = v14;
    MutableCopy = 0;
    v17 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v57.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v57.c = v17;
    *(_OWORD *)&v57.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    if (v11 && v7)
    {
      objc_msgSend(v11, "pathBounds");
      CGAffineTransformMakeTranslation(&v57, -v18, -v19);
      objc_msgSend(v11, "transform");
      t1 = v57;
      CGAffineTransformConcat(&v56, &t1, &t2);
      v57 = v56;
      CGAffineTransformMakeScale(&v53, v15, v15);
      t1 = v57;
      CGAffineTransformConcat(&v56, &t1, &v53);
      v57 = v56;
      MutableCopy = CGPathCreateMutableCopy((CGPathRef)objc_msgSend(v11, "path"));
    }
    if (objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath") && v6)
    {
      v20 = (void *)objc_msgSend((id)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"), "copy");
      v21 = -[TSDImageRep imageLayout](self, "imageLayout");
      if (v21)
        objc_msgSend(v21, "imageDataToVisualSizeTransform");
      else
        memset(v52, 0, sizeof(v52));
      objc_msgSend(v20, "transformUsingAffineTransform:", v52);
      if (MutableCopy)
      {
        if (v11)
          objc_msgSend(v11, "affineTransformForTightPathBounds");
        else
          memset(&v50, 0, sizeof(v50));
        CGAffineTransformInvert(&v51, &v50);
        objc_msgSend(v20, "transformUsingAffineTransform:", &v51);
        objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "pathBoundsWithoutStroke");
        CGAffineTransformMakeTranslation(&v49, v24, v25);
        objc_msgSend(v20, "transformUsingAffineTransform:", &v49);
        v26 = -[TSDBezierPath intersectBezierPath:](+[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", MutableCopy), "intersectBezierPath:", v20);
        if (!v26)
        {
          v27 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v28 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageRep p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:]");
          objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 2764, CFSTR("invalid nil value for '%s'"), "maskBezierPath");
        }
        CGPathRelease(MutableCopy);
        MutableCopy = (const CGPath *)objc_msgSend(v26, "CGPath");
      }
      else
      {
        CGAffineTransformMakeScale(&v48, v15, v15);
        objc_msgSend(v20, "transformUsingAffineTransform:", &v48);
        MutableCopy = (const CGPath *)objc_msgSend(v20, "CGPath");
        if (!MutableCopy)
        {
          v22 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageRep p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:]");
          objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 2772, CFSTR("invalid nil value for '%s'"), "maskPath");
          MutableCopy = 0;
        }
      }
      CGPathRetain(MutableCopy);

    }
    if (-[TSDImageRep p_orientationForDirectlyManagedLayer](self, "p_orientationForDirectlyManagedLayer"))
    {
      objc_msgSend(a4, "bounds");
      v29 = TSDRectWithSize();
      v31 = v30;
      v33 = v32;
      v35 = v34;
      memset(&v56, 0, sizeof(v56));
      TSUImageOrientationTransform();
      v36 = TSDCenterOfRect(v29, v31, v33, v35);
      v38 = v37;
      memset(&t1, 0, sizeof(t1));
      CGAffineTransformMakeTranslation(&v47, -v36, -v37);
      CGAffineTransformMakeTranslation(&v45, v36, v38);
      v44 = v56;
      CGAffineTransformConcat(&v46, &v44, &v45);
      CGAffineTransformConcat(&t1, &v47, &v46);
      v44 = t1;
      CGAffineTransformInvert(&v43, &v44);
      v42 = v57;
      CGAffineTransformConcat(&v44, &v42, &v43);
      v57 = v44;
    }
    if (!MutableCopy)
    {
      if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskIntersectsImage"))
      {
        v39 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v40 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageRep p_updateMaskLayer:forRepLayer:shouldIncludeMask:shouldIncludeInstantAlpha:]");
        objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 2794, CFSTR("maskPath is nil when it should not be"));
      }
    }
    v56 = v57;
    v41 = TSDCreateTransformedPath(MutableCopy, &v56);
    objc_msgSend(a3, "setPath:", v41);
    CGPathRelease(v41);
    CGPathRelease(MutableCopy);
  }
}

- (void)p_updateStrokeLayerForStroke:(id)a3 repLayer:(id)a4
{
  id v7;
  id v8;
  double v9;
  double v10;
  __int128 v11;
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
  double v25;
  double v26;
  float v27;
  double v28;
  const CGPath *v29;
  double x;
  double y;
  double width;
  double height;
  double v34;
  double v35;
  double v36;
  double v37;
  TSDFrameRep *v38;
  TSDFrameRep *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  TSDMutableLayoutGeometry *v46;
  TSDMutableLayoutGeometry *v47;
  TSDMutableLayoutGeometry *v48;
  uint64_t v49;
  CGPath *Mutable;
  const CGPath *v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
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
  CALayer *v74;
  CAShapeLayer *v75;
  CALayer *v76;
  __int128 v77;
  CAShapeLayer *mMaskLayer;
  uint64_t v79;
  CAShapeLayer *v80;
  double v81;
  double v82;
  CGAffineTransform *v83;
  double tx;
  double ty;
  void *v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  CALayer *mFrameMaskLayer;
  CAShapeLayer *v91;
  CALayer *mTapToReplaceLayer;
  __int128 v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  CGAffineTransform v103;
  CGAffineTransform v104;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v107;
  CGAffineTransform v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _OWORD v113[3];
  CGAffineTransform v114;
  _OWORD v115[3];
  __int128 v116;
  __int128 v117;
  CGAffineTransform v118;
  CGRect PathBoundingBox;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v7 = -[TSDImageRep imageLayout](self, "imageLayout");
  v8 = -[TSDImageRep maskLayout](self, "maskLayout");
  -[TSDRep scaleToConvertNaturalToLayerRelative](self, "scaleToConvertNaturalToLayerRelative");
  v10 = v9;
  v117 = 0u;
  memset(&v118, 0, sizeof(v118));
  v116 = 0u;
  -[TSDRep computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:](self, "computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:", &v116, &v118, objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometry"));
  v11 = v117;
  v12 = TSDRectWithSize();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = TSDCenterOfRect(*(CGFloat *)&v116, *((CGFloat *)&v116 + 1), *(CGFloat *)&v11, *((CGFloat *)&v11 + 1));
  v21 = v20;
  -[CAShapeLayer position](self->super.mMaskLayer, "position");
  if (v23 != v19 || v22 != v21)
    -[CAShapeLayer setPosition:](self->super.mMaskLayer, "setPosition:", v19, v21);
  -[TSDStyledRep opacity](self, "opacity");
  v26 = v25;
  -[CAShapeLayer opacity](self->super.mMaskLayer, "opacity");
  v28 = v27;
  if (v26 != v28)
  {
    *(float *)&v28 = v26;
    -[CAShapeLayer setOpacity:](self->super.mMaskLayer, "setOpacity:", v28);
  }
  if (!objc_msgSend(a3, "isFrame"))
  {
    -[CAShapeLayer setBounds:](self->super.mMaskLayer, "setBounds:", v12, v14, v16, v18);
    objc_msgSend(a3, "applyToRepRenderable:withScale:", +[TSDRenderable renderableFromLayer:](TSDRenderable, "renderableFromLayer:", self->super.mMaskLayer), v10);
    v49 = objc_msgSend(v7, "pathToStroke");
    Mutable = (CGPath *)v49;
    if (v8)
    {
      if (!v49)
      {
        mMaskLayer = self->super.mMaskLayer;
        v79 = 1;
        goto LABEL_26;
      }
      memset(&v108, 0, sizeof(v108));
      objc_msgSend(v8, "transform");
      CGAffineTransformMakeScale(&t2, v10, v10);
      CGAffineTransformConcat(&v108, &t1, &t2);
      v107 = v108;
      v51 = Mutable;
    }
    else
    {
      if (!v49)
      {
        Mutable = CGPathCreateMutable();
        v122.origin.x = v12;
        v122.origin.y = v14;
        v122.size.width = v16;
        v122.size.height = v18;
        CGPathAddRect(Mutable, 0, v122);
        goto LABEL_24;
      }
      memset(&v108, 0, sizeof(v108));
      CGAffineTransformMakeScale(&v108, v10, v10);
      v51 = (const CGPath *)objc_msgSend(v7, "pathToStroke");
      v107 = v108;
    }
    Mutable = TSDCreateTransformedPath(v51, &v107);
LABEL_24:
    mMaskLayer = self->super.mMaskLayer;
    v79 = 0;
LABEL_26:
    -[CAShapeLayer setHidden:](mMaskLayer, "setHidden:", v79);
    -[CAShapeLayer setPath:](self->super.mMaskLayer, "setPath:", Mutable);
    CGPathRelease(Mutable);
    goto LABEL_27;
  }
  v102 = v10;
  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "hasMaskingPath"))
  {
    v29 = (const CGPath *)objc_msgSend(v7, "pathToStroke");
    if (!v29)
      goto LABEL_27;
    PathBoundingBox = CGPathGetPathBoundingBox(v29);
    x = PathBoundingBox.origin.x;
    y = PathBoundingBox.origin.y;
    width = PathBoundingBox.size.width;
    height = PathBoundingBox.size.height;
    v34 = TSDRectWithSize();
    v98 = v35;
    v100 = v34;
    v94 = v37;
    v96 = v36;
    objc_msgSend(a3, "coverageRectWithoutAdornment:");
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v46 = [TSDMutableLayoutGeometry alloc];
    v47 = v46;
    if (v8)
    {
      v48 = -[TSDLayoutGeometry initWithFrame:](v46, "initWithFrame:", *(double *)&v39, v41, v43, v45);
      if (v7)
        objc_msgSend(v7, "layoutToMaskTransform");
      else
        memset(v115, 0, sizeof(v115));
      v83 = (CGAffineTransform *)v115;
    }
    else
    {
      objc_msgSend(a3, "coverageRectWithoutAdornment:", x, y, width, height);
      v48 = -[TSDLayoutGeometry initWithFrame:](v47, "initWithFrame:");
      objc_msgSend(a3, "coverageRect:", x, y, width, height);
      if (v81 > 0.0)
        v81 = 0.0;
      if (v82 > 0.0)
        v82 = 0.0;
      CGAffineTransformMakeTranslation(&v114, -v81, -v82);
      v83 = &v114;
    }
    -[TSDMutableLayoutGeometry transformBy:](v48, "transformBy:", v83);
    if (v7)
      objc_msgSend(v7, "transform");
    else
      memset(v113, 0, sizeof(v113));
    -[TSDMutableLayoutGeometry transformBy:](v48, "transformBy:", v113);
    v111 = 0u;
    v112 = 0u;
    -[TSDRep computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:](self, "computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:", &v111, &v118, v48);

    -[CAShapeLayer setPosition:](self->super.mMaskLayer, "setPosition:", TSDCenterOfRect(*(CGFloat *)&v111, *((CGFloat *)&v111 + 1), *(CGFloat *)&v112, *((CGFloat *)&v112 + 1)));
    -[CAShapeLayer setBounds:](self->super.mMaskLayer, "setBounds:", TSDRectWithSize());
    if ((objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode") & 1) != 0
      || !-[TSDImageRep p_shouldRenderWithMaskToBounds](self, "p_shouldRenderWithMaskToBounds")
      || objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"))
    {
      if (v8)
      {
        objc_msgSend(v8, "transform");
        v109 = *(_OWORD *)&v108.a;
        v110 = *(_OWORD *)&v108.c;
        tx = v102 * v108.tx;
        ty = v102 * v108.ty;
LABEL_53:
        *(_QWORD *)&v123.origin.x = v39;
        v123.origin.y = v41;
        v123.size.width = v43;
        v123.size.height = v45;
        if (!CGRectEqualToRect(v123, *(CGRect *)&self->super.mFrameRep))
          goto LABEL_55;
        *(_OWORD *)&v108.a = v109;
        *(_OWORD *)&v108.c = v110;
        v108.tx = tx;
        v108.ty = ty;
        v89 = *(_OWORD *)&self->mLastPictureFrameLayerTransform.b;
        *(_OWORD *)&v107.a = *(_OWORD *)&self->mMaskSublayer;
        *(_OWORD *)&v107.c = v89;
        *(_OWORD *)&v107.tx = *(_OWORD *)&self->mLastPictureFrameLayerTransform.d;
        if (!CGAffineTransformEqualToTransform(&v108, &v107))
        {
LABEL_55:
          -[TSDMediaRep i_updateFrameRep](self, "i_updateFrameRep");
          mFrameMaskLayer = self->super.mFrameMaskLayer;
          v91 = self->super.mMaskLayer;
          mTapToReplaceLayer = self->super.mTapToReplaceLayer;
          *(_OWORD *)&v108.a = v109;
          *(_OWORD *)&v108.c = v110;
          v108.tx = tx;
          v108.ty = ty;
          -[CALayer updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:](mFrameMaskLayer, "updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:", v91, a4, mTapToReplaceLayer, &v108, v100, v98, v96, v94, v102);
          self->super.mFrameRep = v39;
          self->super.mLastPictureFrameLayerRect.origin.x = v41;
          self->super.mLastPictureFrameLayerRect.origin.y = v43;
          self->super.mLastPictureFrameLayerRect.size.width = v45;
          v93 = v110;
          *(_OWORD *)&self->mMaskSublayer = v109;
          *(_OWORD *)&self->mLastPictureFrameLayerTransform.b = v93;
          self->mLastPictureFrameLayerTransform.d = tx;
          self->mLastPictureFrameLayerTransform.tx = ty;
        }
        goto LABEL_27;
      }
      if (objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"))
      {
        CGAffineTransformMakeTranslation(&v108, v102 * x, v102 * y);
        v109 = *(_OWORD *)&v108.a;
        v110 = *(_OWORD *)&v108.c;
        tx = v108.tx;
        ty = v108.ty;
        goto LABEL_53;
      }
      v86 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v87 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageRep p_updateStrokeLayerForStroke:repLayer:]");
      objc_msgSend(v86, "handleFailureInFunction:file:lineNumber:description:", v87, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 2887, CFSTR("This path should never be hit! Something is wrong with rendering the frame."));
    }
    v88 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v109 = *MEMORY[0x24BDBD8B8];
    v110 = v88;
    tx = *(double *)(MEMORY[0x24BDBD8B8] + 32);
    ty = *(double *)(MEMORY[0x24BDBD8B8] + 40);
    goto LABEL_53;
  }
  v52 = TSDMultiplyRectScalar(v12, v14, v16, v18, 1.0 / v10);
  v54 = v53;
  v56 = v55;
  v58 = v57;
  objc_msgSend(a3, "coverageRectWithoutAdornment:");
  v59 = v120.origin.x;
  v60 = v120.origin.y;
  v61 = v120.size.width;
  v62 = v120.size.height;
  if (!CGRectEqualToRect(v120, *(CGRect *)&self->super.mFrameRep))
  {
    v99 = v54;
    v101 = v52;
    v95 = v58;
    v97 = v56;
    v63 = TSDCenterOfRect(v52, v54, v56, v58);
    v65 = TSDSubtractPoints(v63, v64, v59);
    -[CAShapeLayer setAnchorPoint:](self->super.mMaskLayer, "setAnchorPoint:", v65 / v61, v66 / v62);
    TSDMultiplySizeScalar(v61, v62, v102);
    v67 = TSDRectWithSize();
    v69 = v68;
    v71 = v70;
    v73 = v72;
    -[CAShapeLayer bounds](self->super.mMaskLayer, "bounds");
    v124.origin.x = v67;
    v124.origin.y = v69;
    v124.size.width = v71;
    v124.size.height = v73;
    if (!CGRectEqualToRect(v121, v124))
      -[CAShapeLayer setBounds:](self->super.mMaskLayer, "setBounds:", v67, v69, v71, v73);
    -[TSDMediaRep i_updateFrameRep](self, "i_updateFrameRep");
    v74 = self->super.mFrameMaskLayer;
    v75 = self->super.mMaskLayer;
    v76 = self->super.mTapToReplaceLayer;
    v77 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v108.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v108.c = v77;
    *(_OWORD *)&v108.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    -[CALayer updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:](v74, "updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:", v75, a4, v76, &v108, v101, v99, v97, v95, v102);
    *(double *)&self->super.mFrameRep = v59;
    self->super.mLastPictureFrameLayerRect.origin.x = v60;
    self->super.mLastPictureFrameLayerRect.origin.y = v61;
    self->super.mLastPictureFrameLayerRect.size.width = v62;
  }
LABEL_27:
  v80 = self->super.mMaskLayer;
  if (v80)
    -[CAShapeLayer affineTransform](v80, "affineTransform");
  else
    memset(&v104, 0, sizeof(v104));
  v108 = v118;
  if (!CGAffineTransformEqualToTransform(&v104, &v108))
  {
    v103 = v118;
    -[CAShapeLayer setAffineTransform:](self->super.mMaskLayer, "setAffineTransform:", &v103);
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (id)additionalLayersOverLayer
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  CAShapeLayer *mMaskLayer;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TSDImageRep;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[TSDMediaRep additionalLayersOverLayer](&v18, sel_additionalLayersOverLayer));
  if (self->super.mMaskLayer)
  {
    v4 = -[TSDMediaRep visibleMediaReplaceButtonLayer](self, "visibleMediaReplaceButtonLayer");
    v5 = objc_msgSend(v3, "indexOfObject:", v4);
    mMaskLayer = self->super.mMaskLayer;
    if (!v4 || (v6 = v5, v5 == 0x7FFFFFFFFFFFFFFFLL))
      objc_msgSend(v3, "addObject:", mMaskLayer, v6);
    else
      objc_msgSend(v3, "insertObject:atIndex:", mMaskLayer, v5);
  }
  if (self->mContentsLayer)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    v16 = 0u;
    v17 = 0u;
    v15 = 0u;
    v8 = (void *)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometryInRoot");
    if (v8)
    {
      objc_msgSend(v8, "transform");
    }
    else
    {
      v16 = 0u;
      v17 = 0u;
      v15 = 0u;
    }
    -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
    *(double *)&v17 = v9 * *(double *)&v17;
    -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
    *((double *)&v17 + 1) = v10 * *((double *)&v17 + 1);
    if (-[TSDRep parentRep](self, "parentRep"))
    {
      -[TSDRep layerFrameInScaledCanvas](-[TSDRep parentRep](self, "parentRep"), "layerFrameInScaledCanvas");
      *(double *)&v17 = *(double *)&v17 - v11;
      *((double *)&v17 + 1) = *((double *)&v17 + 1) - v12;
    }
    v14[0] = v15;
    v14[1] = v16;
    v14[2] = v17;
    -[CALayer setAffineTransform:](self->mContentsLayer, "setAffineTransform:", v14);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    objc_msgSend(v3, "addObject:", self->mContentsLayer);
  }
  return v3;
}

- (void)viewScaleDidChange
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDImageRep;
  -[TSDStyledRep viewScaleDidChange](&v5, sel_viewScaleDidChange);
  v3 = -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, "shouldRender"))
    {
      if (objc_msgSend(v4, "isFrame"))
      {
        -[TSDImageRep p_disposeStrokeLayer](self, "p_disposeStrokeLayer");
        if (objc_msgSend(v4, "hasMask"))
          -[TSDImageRep p_disposeMaskLayer](self, "p_disposeMaskLayer");
      }
    }
  }
}

- (id)textureForContext:(id)a3
{
  objc_super v6;

  if ((objc_msgSend(-[TSDImageRep p_imageProvider](self, "p_imageProvider"), "isError") & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)TSDImageRep;
  return -[TSDStyledRep textureForContext:](&v6, sel_textureForContext_, a3);
}

+ (double)magicMoveAttributeMatchPercentBetweenOutgoingObject:(id)a3 incomingObject:(id)a4
{
  void *v4;
  void *v5;
  int v6;
  double result;
  double v8;
  double v9;
  uint64_t v10;
  double v11;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  objc_opt_class();
  v5 = (void *)TSUDynamicCast();
  v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "imageInfo"), "imageData"), "isEqual:", objc_msgSend((id)objc_msgSend(v5, "imageInfo"), "imageData"));
  result = 0.0;
  if (v6)
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "imageInfo", 0.0), "imageData"), "isEqual:", objc_msgSend((id)objc_msgSend(v5, "imageInfo"), "imageData")))v8 = 1.0;
    else
      v8 = 0.0;
    v9 = v8
       + (double)TSDMixingTypeWithPossiblyNilObjects(objc_msgSend((id)objc_msgSend(v4, "imageInfo"), "maskInfo"), objc_msgSend((id)objc_msgSend(v5, "imageInfo"), "maskInfo"))/ 5.0* 0.1;
    v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "imageInfo"), "imageStyle"), "mixingTypeWithObject:", objc_msgSend((id)objc_msgSend(v5, "imageInfo"), "imageStyle"));
    v11 = v9 + 1.0;
    if (v10 != 5)
      v11 = v9;
    return v11 / 2.1;
  }
  return result;
}

- (id)p_imageData
{
  id result;

  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isDynamicallyChangingImageAdjustments"))
  {
    if (!objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageAdjustments"), "enhance"))return (id)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "imageData");
    result = (id)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "enhancedImageData");
    if (!result)
      return (id)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "imageData");
  }
  else
  {
    result = (id)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "adjustedImageData");
    if (!result)
      return (id)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "imageData");
  }
  return result;
}

- (id)p_imageProvider
{
  return (id)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", -[TSDImageRep p_imageData](self, "p_imageData"), 0);
}

- (id)p_validatedImageProvider
{
  return (id)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", -[TSDImageRep p_imageData](self, "p_imageData"), 1);
}

- (id)p_validatedBitmapImageProvider
{
  objc_opt_class();
  -[TSDImageRep p_validatedImageProvider](self, "p_validatedImageProvider");
  return (id)TSUDynamicCast();
}

- (id)p_validatedThumbnailImageProvider
{
  return 0;
}

- (void)p_disposeStrokeLayer
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;

  if (self->super.mMaskLayer)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    -[CAShapeLayer setDelegate:](self->super.mMaskLayer, "setDelegate:", 0);

    self->super.mMaskLayer = 0;
    v3 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    *(_OWORD *)&self->super.mFrameRep = *MEMORY[0x24BDBF090];
    *(_OWORD *)&self->super.mLastPictureFrameLayerRect.origin.y = v3;
    v4 = MEMORY[0x24BDBD8B8];
    v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&self->mMaskSublayer = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&self->mLastPictureFrameLayerTransform.b = v5;
    *(_OWORD *)&self->mLastPictureFrameLayerTransform.d = *(_OWORD *)(v4 + 32);
    -[CAShapeLayer removeFromSuperlayer](self->super.mStrokeLayer, "removeFromSuperlayer");
    self->super.mStrokeLayer = 0;
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

- (void)p_disposeMaskLayer
{
  if (self->super.mTapToReplaceLayer)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    -[CAShapeLayer removeFromSuperlayer](self->mIAMaskLayer, "removeFromSuperlayer");

    self->mIAMaskLayer = 0;
    -[CAShapeLayer removeFromSuperlayer](self->mMaskPathLayer, "removeFromSuperlayer");

    self->mMaskPathLayer = 0;
    -[CALayer removeFromSuperlayer](self->super.mTapToReplaceLayer, "removeFromSuperlayer");
    -[CALayer setDelegate:](self->super.mTapToReplaceLayer, "setDelegate:", 0);

    self->super.mTapToReplaceLayer = 0;
    -[CAShapeLayer removeFromSuperlayer](self->super.mStrokeLayer, "removeFromSuperlayer");
    self->super.mStrokeLayer = 0;
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

- (void)p_createMaskLayerForLayer:(id)a3
{
  CALayer *v5;

  if (!self->super.mTapToReplaceLayer)
  {
    v5 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
    self->super.mTapToReplaceLayer = v5;
    -[CALayer setDelegate:](v5, "setDelegate:", self);
    -[CALayer setAnchorPoint:](self->super.mTapToReplaceLayer, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    objc_msgSend(a3, "setMask:", self->super.mTapToReplaceLayer);
  }
}

- (void)p_updateMaskSublayersForMaskEditMode
{
  id v3;
  CAShapeLayer *v4;
  double v5;
  CAShapeLayer *v6;

  v3 = -[TSDInteractiveCanvasController layerForRep:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self);
  if (!self->super.mTapToReplaceLayer)
    -[TSDImageRep p_createMaskLayerForLayer:](self, "p_createMaskLayerForLayer:", v3);
  if (!self->mIAMaskLayer)
  {
    v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
    self->mIAMaskLayer = v4;
    -[CALayer addSublayer:](self->super.mTapToReplaceLayer, "addSublayer:", v4);
  }
  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInInstantAlphaMode"))
  {
    -[CAShapeLayer setMask:](self->mIAMaskLayer, "setMask:", 0);

    self->mMaskPathLayer = 0;
    -[CALayer removeFromSuperlayer](self->mContentsLayer, "removeFromSuperlayer");

    self->mContentsLayer = 0;
    if (objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"))
      v5 = 0.25;
    else
      v5 = 1.0;
    -[CAShapeLayer setBackgroundColor:](self->mIAMaskLayer, "setBackgroundColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, v5), "CGColor"));
    goto LABEL_18;
  }
  -[CAShapeLayer setBackgroundColor:](self->mIAMaskLayer, "setBackgroundColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.5), "CGColor"));
  if (self->mMaskPathLayer)
    goto LABEL_9;
  if (objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"))
  {
    v6 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
    self->mMaskPathLayer = v6;
    -[CAShapeLayer setMask:](self->mIAMaskLayer, "setMask:", v6);
  }
  else if (self->mMaskPathLayer)
  {
LABEL_9:
    if (!objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"))
    {
      -[CAShapeLayer setMask:](self->mIAMaskLayer, "setMask:", 0);

      self->mMaskPathLayer = 0;
    }
  }
  if (!self->mContentsLayer)
  {
    self->mContentsLayer = (CALayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
    -[CALayer setStrokeColor:](self->mContentsLayer, "setStrokeColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.392156869, 0.392156869, 0.392156869, 1.0), "CGColor"));
    -[CALayer setFillColor:](self->mContentsLayer, "setFillColor:", 0);
    -[CALayer setLineWidth:](self->mContentsLayer, "setLineWidth:", 1.0);
    -[CALayer setLineDashPattern:](self->mContentsLayer, "setLineDashPattern:", &unk_24D8FA290);
  }
LABEL_18:
  -[CALayer setPath:](self->super.mTapToReplaceLayer, "setPath:", 0);
}

- (BOOL)p_drawsInOneStep
{
  id v3;
  int v4;
  _BOOL4 v5;
  NSObject *v6;
  BOOL v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = -[TSDImageRep imageInfo](self, "imageInfo");
  v4 = objc_msgSend((id)objc_msgSend(v3, "stroke"), "shouldRender");
  if (objc_msgSend(v3, "maskInfo"))
    v5 = 1;
  else
    v5 = objc_msgSend(v3, "instantAlphaPath") != 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = *(NSObject **)&self->mSizingStateReady;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __31__TSDImageRep_p_drawsInOneStep__block_invoke;
  v9[3] = &unk_24D82A6F8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);
  v7 = 0;
  if (((v4 | v5) & 1) == 0)
    v7 = *((_BYTE *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

_QWORD *__31__TSDImageRep_p_drawsInOneStep__block_invoke(uint64_t a1)
{
  _QWORD *result;
  BOOL v3;
  double v4;

  result = (_QWORD *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "imageLayout"), "hasAlpha");
  if (!(_DWORD)result
    || (result = *(_QWORD **)(a1 + 32), result[88])
    || objc_msgSend((id)objc_msgSend(result, "canvas"), "isCanvasInteractive")
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "canvas"), "viewScale"), v4 < 0.5)
    && (result = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "p_validatedThumbnailImageProvider")) != 0)
  {
    v3 = 1;
  }
  else
  {
    result = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "p_validatedBitmapImageProvider");
    v3 = result != 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)shouldShowShadow
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDImageRep;
  v3 = -[TSDStyledRep shouldShowShadow](&v5, sel_shouldShowShadow);
  if (v3)
    LOBYTE(v3) = !-[TSDCanvas shouldSuppressBackgrounds](-[TSDRep canvas](self, "canvas"), "shouldSuppressBackgrounds");
  return v3;
}

- (CGSize)p_desiredSizedImageSize
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
  BOOL v17;
  double v18;
  double v19;
  CGSize result;

  objc_msgSend(-[TSDImageRep p_validatedImageProvider](self, "p_validatedImageProvider"), "naturalSize");
  v4 = v3;
  v6 = v5;
  objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometry"), "size");
  v8 = v7;
  v10 = v9;
  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  v12 = v11;
  -[TSDRep scaleToConvertNaturalToLayerRelative](self, "scaleToConvertNaturalToLayerRelative");
  v14 = TSDMultiplySizeScalar(v8, v10, v12 * v13);
  v16 = v15;
  if ((objc_msgSend(-[TSDImageRep p_imageProvider](self, "p_imageProvider"), "isError") & 1) != 0
    || (v14 <= v4 ? (v17 = v16 <= v6) : (v17 = 0), v17))
  {
    v4 = v14;
  }
  else
  {
    -[TSDImageRep p_imageProvider](self, "p_imageProvider");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = TSDShrinkSizeToFitInSize(v14, v16, 2048.0, 2048.0);
  }
  v18 = TSDCeilSize(v4);
  result.height = v19;
  result.width = v18;
  return result;
}

- (BOOL)p_okayToGenerateSizedImage
{
  _BOOL4 v3;

  v3 = -[TSDInteractiveCanvasController shouldResampleImages](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "shouldResampleImages");
  if (v3)
    LOBYTE(v3) = !-[TSDInteractiveCanvasController shouldSuppressRendering](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "shouldSuppressRendering")&& self->mUpdateFromLayoutBlocksLock == 0;
  return v3;
}

- (void)pushDisableImageSizing
{
  ++self->mUpdateFromLayoutBlocksLock;
}

- (void)popDisableImageSizing
{
  OS_dispatch_semaphore *mUpdateFromLayoutBlocksLock;
  OS_dispatch_semaphore *v3;

  mUpdateFromLayoutBlocksLock = self->mUpdateFromLayoutBlocksLock;
  if (mUpdateFromLayoutBlocksLock)
  {
    v3 = (OS_dispatch_semaphore *)((char *)mUpdateFromLayoutBlocksLock - 1);
    self->mUpdateFromLayoutBlocksLock = v3;
    if (!v3)
      -[TSDInteractiveCanvasController invalidateLayers](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "invalidateLayers");
  }
}

- (void)p_generateSizedImageIfNecessary
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[8];

  if (-[TSDImageRep p_okayToGenerateSizedImage](self, "p_okayToGenerateSizedImage"))
  {
    v3 = -[TSDImageRep p_imageProvider](self, "p_imageProvider");
    if (objc_msgSend(v3, "isValid"))
    {
      if ((objc_msgSend(v3, "isError") & 1) == 0)
      {
        -[TSDImageRep p_desiredSizedImageSize](self, "p_desiredSizedImageSize");
        v4 = *(NSObject **)&self->mSizingStateReady;
        v7[0] = MEMORY[0x24BDAC760];
        v7[1] = 3221225472;
        v7[2] = __46__TSDImageRep_p_generateSizedImageIfNecessary__block_invoke;
        v7[3] = &unk_24D82BC50;
        v7[6] = v5;
        v7[7] = v6;
        v7[4] = self;
        v7[5] = v3;
        dispatch_sync(v4, v7);
      }
    }
  }
}

uint64_t __46__TSDImageRep_p_generateSizedImageIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v4;
  uint64_t result;
  int v6;
  int v7;
  int v8;
  BOOL v9;
  double v10;
  double v11;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 704))
  {
    if (*(double *)(a1 + 48) != *(double *)(v2 + 712) || *(double *)(a1 + 56) != *(double *)(v2 + 720))
      goto LABEL_9;
    v4 = *(unsigned __int8 *)(v2 + 736);
    result = objc_msgSend((id)v2, "p_shouldBakeMaskIntoSizedImage");
    if (v4 == (_DWORD)result)
      return result;
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v2 + 704))
    {
LABEL_9:
      v6 = *(unsigned __int8 *)(v2 + 736);
      v7 = objc_msgSend((id)v2, "p_shouldBakeMaskIntoSizedImage");
      v2 = *(_QWORD *)(a1 + 32);
      if (v6 != v7)
      {

        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 680) = 0;
        CGImageRelease(*(CGImageRef *)(*(_QWORD *)(a1 + 32) + 704));
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 704) = 0;
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 736) = 0;
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 737) = 0;
        v2 = *(_QWORD *)(a1 + 32);
        if (*(_QWORD *)(v2 + 744))
        {
          CGPathRelease(*(CGPathRef *)(v2 + 744));
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 744) = 0;
          v2 = *(_QWORD *)(a1 + 32);
        }
      }
    }
  }
  if (!*(_QWORD *)(v2 + 680))
    goto LABEL_14;
  v8 = objc_msgSend(*(id *)(v2 + 680), "status");
  v2 = *(_QWORD *)(a1 + 32);
  if (v8)
    goto LABEL_14;
  objc_msgSend(*(id *)(v2 + 680), "desiredSize");
  if (v11 == *(double *)(a1 + 48) && v10 == *(double *)(a1 + 56))
  {
    v13 = *(_QWORD *)(a1 + 40);
    if (v13 == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 680), "provider"))
    {
      v2 = *(_QWORD *)(a1 + 32);
LABEL_14:
      if (*(_QWORD *)(v2 + 752)
        && (*(double *)(a1 + 48) == *(double *)(v2 + 760)
          ? (v9 = *(double *)(a1 + 56) == *(double *)(v2 + 768))
          : (v9 = 0),
            v9))
      {
        objc_msgSend((id)v2, "p_takeSizedImageFromCache");
      }
      else if (!*(_QWORD *)(v2 + 680))
      {
        objc_msgSend((id)v2, "p_startSizing");
      }
      return objc_msgSend(*(id *)(a1 + 40), "flushIfInterestLessThan:", 2);
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 680), "setStatus:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "flushIfInterestLessThan:", 2);
}

+ (CGPath)p_newPathToBakeIntoSizedImageForSize:(CGSize)a3 withImageLayout:(id)a4 orientation:(int64_t)a5
{
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPath *v15;
  const CGPath *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGAffineTransform v27;
  _OWORD v28[3];
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v36;

  height = a3.height;
  width = a3.width;
  v8 = (void *)objc_msgSend(a4, "maskLayout");
  v25 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v26 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v36.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v36.c = v25;
  v24 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v36.tx = v24;
  objc_msgSend((id)objc_msgSend(a4, "imageGeometry"), "size");
  v10 = width / v9;
  objc_msgSend((id)objc_msgSend(a4, "imageGeometry"), "size");
  v12 = height / v11;
  if (v8)
  {
    objc_msgSend(v8, "pathBounds");
    CGAffineTransformMakeTranslation(&t2, -v13, -v14);
    *(_OWORD *)&t1.a = v26;
    *(_OWORD *)&t1.c = v25;
    *(_OWORD *)&t1.tx = v24;
    CGAffineTransformConcat(&v36, &t1, &t2);
    if (a4)
      objc_msgSend(a4, "layoutToMaskTransform");
    else
      memset(&v33, 0, sizeof(v33));
    v32 = v36;
    CGAffineTransformConcat(&t1, &v32, &v33);
    v36 = t1;
    if (a4)
      objc_msgSend(a4, "layoutToImageTransform");
    else
      memset(&v30, 0, sizeof(v30));
    CGAffineTransformInvert(&v31, &v30);
    v32 = v36;
    CGAffineTransformConcat(&t1, &v32, &v31);
    v36 = t1;
    CGAffineTransformMakeScale(&v29, v10, v12);
    v32 = v36;
    CGAffineTransformConcat(&t1, &v32, &v29);
    v36 = t1;
    v16 = (const CGPath *)objc_msgSend(v8, "path");
    t1 = v36;
    v15 = TSDCreateTransformedPath(v16, &t1);
  }
  else
  {
    v15 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(a4, "imageInfo"), "instantAlphaPath"))
  {
    v17 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "imageInfo"), "instantAlphaPath"), "copy");
    if (a4)
      objc_msgSend(a4, "imageDataToVisualSizeTransform");
    else
      memset(v28, 0, sizeof(v28));
    objc_msgSend(v17, "transformUsingAffineTransform:", v28);
    CGAffineTransformMakeScale(&v27, v10, v12);
    objc_msgSend(v17, "transformUsingAffineTransform:", &v27);
    if (v15)
    {
      v18 = -[TSDBezierPath intersectBezierPath:](+[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", v15), "intersectBezierPath:", v17);
      if (!v18)
      {
        v19 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDImageRep p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:]");
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 3608, CFSTR("invalid nil value for '%s'"), "maskBezierPath");
      }
      CGPathRelease(v15);
      v15 = (CGPath *)objc_msgSend(v18, "CGPath");
    }
    else
    {
      v15 = (CGPath *)objc_msgSend(v17, "CGPath");
      if (!v15)
      {
        v21 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDImageRep p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:]");
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 3614, CFSTR("invalid nil value for '%s'"), "maskPath");
        v15 = 0;
      }
    }
    CGPathRetain(v15);

  }
  return v15;
}

- (void)wideGamutValueDidChange
{
  objc_super v3;

  -[TSDImageRep p_invalidateSizedImage](self, "p_invalidateSizedImage");
  -[TSDImageRep p_generateSizedImageIfNecessary](self, "p_generateSizedImageIfNecessary");
  -[TSDImageRep p_takeSizedImageFromStateIfReady](self, "p_takeSizedImageFromStateIfReady");
  v3.receiver = self;
  v3.super_class = (Class)TSDImageRep;
  -[TSDRep wideGamutValueDidChange](&v3, sel_wideGamutValueDidChange);
}

- (void)p_startSizing
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat height;
  CGPath *v10;
  const CGPath *v11;

  if (self->mLayerUpdateAndSizingStateLock)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageRep p_startSizing]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 3637, CFSTR("expected nil value for '%s'"), "mSizingState");
  }
  -[TSDImageRep p_desiredSizedImageSize](self, "p_desiredSizedImageSize");
  v6 = v5;
  v8 = v7;
  if (-[TSDImageRep p_shouldBakeMaskIntoSizedImage](self, "p_shouldBakeMaskIntoSizedImage"))
  {
    if (self->mSizedImageAccessQueue)
      height = self->mSizedImageSize.height;
    else
      height = COERCE_DOUBLE(objc_msgSend(-[TSDImageRep p_validatedBitmapImageProvider](self, "p_validatedBitmapImageProvider"), "orientation"));
    v10 = +[TSDImageRep p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:](TSDImageRep, "p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:", -[TSDImageRep imageLayout](self, "imageLayout"), *(_QWORD *)&height, v6, v8);
  }
  else
  {
    v10 = 0;
  }
  LOBYTE(self->mSizingState) = 0;
  self->mLayerUpdateAndSizingStateLock = (NSRecursiveLock *)-[TSDImageRepSizingState initWithDesiredSize:provider:maskPath:wideGamutCanvas:]([TSDImageRepSizingState alloc], "initWithDesiredSize:provider:maskPath:wideGamutCanvas:", -[TSDImageRep p_imageProvider](self, "p_imageProvider"), v10, -[TSDCanvas canvasIsWideGamut](-[TSDRep canvas](self, "canvas"), "canvasIsWideGamut"), v6, v8);
  -[NSRecursiveLock setSizedImageIncludesAdjustments:](self->mLayerUpdateAndSizingStateLock, "setSizedImageIncludesAdjustments:", objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isDynamicallyChangingImageAdjustments") ^ 1);
  if (v10)
  {
    v11 = *(const CGPath **)&self->mSizedImageHasMaskBakedIn;
    if (v11)
      CGPathRelease(v11);
    *(_QWORD *)&self->mSizedImageHasMaskBakedIn = v10;
  }
  -[TSDImageRep p_generateSizedImage:](self, "p_generateSizedImage:", self->mLayerUpdateAndSizingStateLock);
  -[TSDInteractiveCanvasController layoutInvalidated](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
}

- (void)p_generateSizedImage:(id)a3
{
  objc_msgSend(a3, "generateSizedImage");
  objc_msgSend(*(id *)&self->mBaseMaskLayoutTransform.ty, "lock");
  if (self->mLayerUpdateAndSizingStateLock == a3)
    LOBYTE(self->mSizingState) = 1;
  objc_msgSend(*(id *)&self->mBaseMaskLayoutTransform.ty, "unlock");
}

- (void)i_willEnterForeground
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDImageRep;
  -[TSDRep i_willEnterForeground](&v3, sel_i_willEnterForeground);
  if (-[NSRecursiveLock status](self->mLayerUpdateAndSizingStateLock, "status") == 1)
  {

    self->mLayerUpdateAndSizingStateLock = 0;
    -[TSDImageRep p_generateSizedImageIfNecessary](self, "p_generateSizedImageIfNecessary");
  }
}

- (void)p_takeSizedImageFromStateIfReady
{
  if (self->mLayerUpdateAndSizingStateLock)
  {
    objc_msgSend(*(id *)&self->mBaseMaskLayoutTransform.ty, "lock");
    if (LOBYTE(self->mSizingState))
    {
      LOBYTE(self->mSizingState) = 0;
      -[TSDImageRep p_takeSizedImageFromState](self, "p_takeSizedImageFromState");
    }
    objc_msgSend(*(id *)&self->mBaseMaskLayoutTransform.ty, "unlock");
  }
}

- (BOOL)p_takeSizedImageFromState:(id)a3
{
  int v5;
  char v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  int v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[7];
  _QWORD block[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v5 = objc_msgSend(a3, "status");
  if (v5)
  {
    if (v5 == 1)
LABEL_3:
      *((_BYTE *)v25 + 24) = 1;
  }
  else
  {
    if (!objc_msgSend(a3, "sizedImage"))
      goto LABEL_4;
    -[TSDImageRep p_desiredSizedImageSize](self, "p_desiredSizedImageSize");
    v9 = v8;
    v11 = v10;
    objc_msgSend(a3, "desiredSize");
    if (v9 != v13)
      goto LABEL_3;
    if (v11 != v12)
      goto LABEL_3;
    v14 = -[TSDImageRep p_imageProvider](self, "p_imageProvider");
    if (v14 != (id)objc_msgSend(a3, "provider"))
      goto LABEL_3;
    v15 = *(NSObject **)&self->mSizingStateReady;
    v16 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__TSDImageRep_p_takeSizedImageFromState___block_invoke;
    block[3] = &unk_24D82A5C8;
    block[4] = self;
    block[5] = a3;
    dispatch_sync(v15, block);
    v17 = -[TSDInteractiveCanvasController layerForRep:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self);
    -[TSDImageRep p_updateDirectlyManagesLayerContentForLayer:](self, "p_updateDirectlyManagesLayerContentForLayer:", v17);
    v18 = *(NSObject **)&self->mSizingStateReady;
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __41__TSDImageRep_p_takeSizedImageFromState___block_invoke_2;
    v22[3] = &unk_24D82BC78;
    v22[5] = v17;
    v22[6] = &v24;
    v22[4] = self;
    dispatch_sync(v18, v22);
    if (-[TSDImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
    {
      if (-[TSDStyledRep shadowLayer](self, "shadowLayer") || -[TSDStyledRep reflectionLayer](self, "reflectionLayer"))
      {
        v19 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
        if (v19 == -[TSDInteractiveCanvasController currentlyWaitingOnThreadedLayoutAndRender](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "currentlyWaitingOnThreadedLayoutAndRender"))
        {
          v20 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageRep p_takeSizedImageFromState:]");
          objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 3753, CFSTR("Can't take sized image from state from the main thread while we are doing threaded layout and rendering if image has a shadow or reflection!"));
        }
        -[TSDStyledRep invalidateShadowLayer](self, "invalidateShadowLayer");
        -[CALayer setNeedsDisplay](-[TSDStyledRep reflectionLayer](self, "reflectionLayer"), "setNeedsDisplay");
      }
    }
    else
    {
      -[TSDStyledRep setNeedsDisplay](self, "setNeedsDisplay");
    }
  }
LABEL_4:
  v6 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  return v6;
}

uint64_t __41__TSDImageRep_p_takeSizedImageFromState___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  CGImageRelease(*(CGImageRef *)(*(_QWORD *)(a1 + 32) + 704));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 704) = CGImageRetain((CGImageRef)objc_msgSend(*(id *)(a1 + 40), "sizedImage"));
  v2 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 712);
  objc_msgSend(*(id *)(a1 + 40), "desiredSize");
  *v2 = v3;
  v2[1] = v4;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 728) = objc_msgSend(*(id *)(a1 + 40), "sizedImageOrientation");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 736) = objc_msgSend(*(id *)(a1 + 40), "sizedImageHasMask");
  result = objc_msgSend(*(id *)(a1 + 40), "sizedImageIncludesAdjustments");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 737) = result;
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 736))
  {
    if (!*(_QWORD *)(v6 + 744))
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageRep p_takeSizedImageFromState:]_block_invoke");
      return objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageRep.m"), 3723, CFSTR("invalid nil value for '%s'"), "mSizedImageMaskPath");
    }
  }
  return result;
}

_BYTE *__41__TSDImageRep_p_takeSizedImageFromState___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  _BYTE *result;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[88])
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v2 = *(_QWORD **)(a1 + 32);
  }
  result = (_BYTE *)objc_msgSend(v2, "directlyManagesLayerContent");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 40), "setContents:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 704));
    result = *(_BYTE **)(a1 + 32);
    if (result[736])
      return (_BYTE *)objc_msgSend(result, "p_disposeMaskLayer");
  }
  return result;
}

- (void)p_takeSizedImageFromState
{
  _BOOL4 v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = -[TSDImageRep p_takeSizedImageFromState:](self, "p_takeSizedImageFromState:", self->mLayerUpdateAndSizingStateLock);

  self->mLayerUpdateAndSizingStateLock = 0;
  LOBYTE(self->mSizingState) = 0;
  if (v3)
  {
    if (objc_msgSend(-[TSDImageRep p_imageProvider](self, "p_imageProvider"), "isValid"))
    {
      v4 = *(NSObject **)&self->mSizingStateReady;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __40__TSDImageRep_p_takeSizedImageFromState__block_invoke;
      block[3] = &unk_24D829278;
      block[4] = self;
      dispatch_sync(v4, block);
    }
  }
}

uint64_t __40__TSDImageRep_p_takeSizedImageFromState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_startSizing");
}

- (void)p_invalidateSizedImage
{
  NSObject *v2;
  _QWORD block[5];

  v2 = *(NSObject **)&self->mSizingStateReady;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__TSDImageRep_p_invalidateSizedImage__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = self;
  dispatch_sync(v2, block);
}

uint64_t __37__TSDImageRep_p_invalidateSizedImage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_invalidateSizedImageFromQueue");
}

- (void)p_invalidateSizedImageFromQueue
{
  const CGPath *v3;

  self->mLayerUpdateAndSizingStateLock = 0;
  CGImageRelease(self->mSizedImageAccessQueue);
  self->mSizedImageAccessQueue = 0;
  LOBYTE(self->mSizedImageOrientation) = 0;
  BYTE1(self->mSizedImageOrientation) = 0;
  v3 = *(const CGPath **)&self->mSizedImageHasMaskBakedIn;
  if (v3)
  {
    CGPathRelease(v3);
    *(_QWORD *)&self->mSizedImageHasMaskBakedIn = 0;
  }
}

- (BOOL)p_shouldBakeMaskIntoSizedImage
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
  void *v16;
  uint64_t v17;

  objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "naturalSize");
  v4 = v3;
  v6 = v5;
  objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "imageGeometry"), "size");
  v8 = v7;
  v10 = v9;
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
  v12 = v11;
  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  if (v4 < TSDMultiplySizeScalar(v8, v10, v12 * v13) || v6 < v14)
    goto LABEL_10;
  objc_opt_class();
  -[TSDLayout stroke](-[TSDRep layout](self, "layout"), "stroke");
  v16 = (void *)TSUDynamicCast();
  if (-[TSDImageRep maskLayout](self, "maskLayout")
    || (v17 = objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath")) != 0)
  {
    if ((objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode") & 1) != 0
      || (objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout"), "hasSmartPath") & 1) != 0
      || -[TSDImageRep p_shouldRenderWithMaskToBounds](self, "p_shouldRenderWithMaskToBounds"))
    {
LABEL_10:
      LOBYTE(v17) = 0;
      return v17;
    }
    if (v16 && objc_msgSend(v16, "hasMask"))
      LOBYTE(v17) = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "shouldRenderFrameStroke") ^ 1;
    else
      LOBYTE(v17) = 1;
  }
  return v17;
}

- (BOOL)p_shouldRenderWithMaskToBounds
{
  if (!-[TSDImageRep directlyManagesLayerContent](self, "directlyManagesLayerContent")
    || (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode") & 1) != 0
    || objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "instantAlphaPath"))
  {
    return 0;
  }
  else
  {
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout"), "pathSource"), "isRectangular");
  }
}

- (void)p_takeSizedImageFromCache
{
  CGImageRelease(self->mSizedImageAccessQueue);
  self->mSizedImageAccessQueue = CGImageRetain(self->mSizedImageMaskPath);
  *(_OWORD *)&self->mSizedImage = *(_OWORD *)&self->mCachedSizedImage;
  self->mSizedImageSize.height = self->mCachedSizedImageSize.height;
}

- (void)cacheImageAtCurrentSize
{
  CGImageRelease(self->mSizedImageMaskPath);
  self->mSizedImageMaskPath = CGImageRetain(self->mSizedImageAccessQueue);
  *(_OWORD *)&self->mCachedSizedImage = *(_OWORD *)&self->mSizedImage;
  self->mCachedSizedImageSize.height = self->mSizedImageSize.height;
}

- (id)newCachedSizedImage
{
  TSDImageRepCachedSizedImage *v3;
  NSObject *v4;
  _QWORD v6[6];

  v3 = objc_alloc_init(TSDImageRepCachedSizedImage);
  v4 = *(NSObject **)&self->mSizingStateReady;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__TSDImageRep_newCachedSizedImage__block_invoke;
  v6[3] = &unk_24D82A5C8;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(v4, v6);
  return v3;
}

uint64_t __34__TSDImageRep_newCachedSizedImage__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setImageRef:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 704));
  objc_msgSend(*(id *)(a1 + 32), "setImageMaskPath:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 744));
  objc_msgSend(*(id *)(a1 + 32), "setImageSize:", *(double *)(*(_QWORD *)(a1 + 40) + 712), *(double *)(*(_QWORD *)(a1 + 40) + 720));
  objc_msgSend(*(id *)(a1 + 32), "setImageOrientation:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 728));
  objc_msgSend(*(id *)(a1 + 32), "setImageHasMaskBakedIn:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 736));
  return objc_msgSend(*(id *)(a1 + 32), "setImageHasAdjustmentsBakedImage:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 737));
}

- (id)newCachedSizedImageWithNaturalSize
{
  id v2;
  void *v3;
  TSDImageRepCachedSizedImage *v4;

  v2 = -[TSDImageRep p_validatedBitmapImageProvider](self, "p_validatedBitmapImageProvider");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = objc_alloc_init(TSDImageRepCachedSizedImage);
  -[TSDImageRepCachedSizedImage setImageRef:](v4, "setImageRef:", objc_msgSend(v3, "CGImageForNaturalSize"));
  objc_msgSend(v3, "naturalSize");
  -[TSDImageRepCachedSizedImage setImageSize:](v4, "setImageSize:");
  -[TSDImageRepCachedSizedImage setImageOrientation:](v4, "setImageOrientation:", objc_msgSend(v3, "orientation"));
  return v4;
}

- (void)useCachedSizedImage:(id)a3
{
  NSObject *v3;
  _QWORD v4[6];

  v3 = *(NSObject **)&self->mSizingStateReady;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__TSDImageRep_useCachedSizedImage___block_invoke;
  v4[3] = &unk_24D82A5C8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(v3, v4);
}

uint64_t __35__TSDImageRep_useCachedSizedImage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 704);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 704) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(const void **)(v2 + 744);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 744) = 0;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 704) = CGImageRetain((CGImageRef)objc_msgSend(*(id *)(a1 + 40), "imageRef"));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 744) = CGPathRetain((CGPathRef)objc_msgSend(*(id *)(a1 + 40), "imageMaskPath"));
  v5 = (_QWORD *)(*(_QWORD *)(a1 + 32) + 712);
  objc_msgSend(*(id *)(a1 + 40), "imageSize");
  *v5 = v6;
  v5[1] = v7;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 728) = objc_msgSend(*(id *)(a1 + 40), "imageOrientation");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 736) = objc_msgSend(*(id *)(a1 + 40), "imageHasMaskBakedIn");
  result = objc_msgSend(*(id *)(a1 + 40), "imageHasAdjustmentsBakedImage");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 737) = result;
  return result;
}

- (void)generateSizedImageOnBackgroundThread
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat height;
  CGPath *v8;
  TSDImageRepSizingState *v9;
  NSObject *global_queue;
  _QWORD v11[6];

  -[TSDImageRep p_desiredSizedImageSize](self, "p_desiredSizedImageSize");
  v4 = v3;
  v6 = v5;
  if (-[TSDImageRep p_shouldBakeMaskIntoSizedImage](self, "p_shouldBakeMaskIntoSizedImage"))
  {
    if (self->mSizedImageAccessQueue)
      height = self->mSizedImageSize.height;
    else
      height = COERCE_DOUBLE(objc_msgSend(-[TSDImageRep p_validatedBitmapImageProvider](self, "p_validatedBitmapImageProvider"), "orientation"));
    v8 = +[TSDImageRep p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:](TSDImageRep, "p_newPathToBakeIntoSizedImageForSize:withImageLayout:orientation:", -[TSDImageRep imageLayout](self, "imageLayout"), *(_QWORD *)&height, v4, v6);
  }
  else
  {
    v8 = 0;
  }
  v9 = -[TSDImageRepSizingState initWithDesiredSize:provider:maskPath:wideGamutCanvas:]([TSDImageRepSizingState alloc], "initWithDesiredSize:provider:maskPath:wideGamutCanvas:", -[TSDImageRep p_imageProvider](self, "p_imageProvider"), v8, -[TSDCanvas canvasIsWideGamut](-[TSDRep canvas](self, "canvas"), "canvasIsWideGamut"), v4, v6);
  CGPathRelease(v8);
  global_queue = dispatch_get_global_queue(-2, 0);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__TSDImageRep_generateSizedImageOnBackgroundThread__block_invoke;
  v11[3] = &unk_24D82A5C8;
  v11[4] = v9;
  v11[5] = self;
  dispatch_async(global_queue, v11);

}

void __51__TSDImageRep_generateSizedImageOnBackgroundThread__block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  int8x16_t v3;

  objc_msgSend(*(id *)(a1 + 32), "generateSizedImage");
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __51__TSDImageRep_generateSizedImageOnBackgroundThread__block_invoke_2;
  v2[3] = &unk_24D82A5C8;
  v3 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
}

void __51__TSDImageRep_generateSizedImageOnBackgroundThread__block_invoke_2(uint64_t a1)
{
  int v2;
  double *v3;
  double *v4;
  double v5;
  double v6;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];

  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenRemoved") & 1) != 0)
    return;
  v2 = objc_msgSend(*(id *)(a1 + 32), "p_takeSizedImageFromState:", *(_QWORD *)(a1 + 40));
  v3 = *(double **)(a1 + 32);
  if (!v2)
  {
    objc_msgSend((id)objc_msgSend(v3, "interactiveCanvasController"), "invalidateLayers");
    return;
  }
  if (!*((_QWORD *)v3 + 88))
  {
LABEL_10:
    if (objc_msgSend((id)objc_msgSend(v3, "p_imageProvider"), "isValid"))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(NSObject **)(v8 + 696);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __51__TSDImageRep_generateSizedImageOnBackgroundThread__block_invoke_3;
      block[3] = &unk_24D829278;
      block[4] = v8;
      dispatch_sync(v9, block);
    }
    return;
  }
  v4 = v3 + 89;
  objc_msgSend(v3, "p_desiredSizedImageSize");
  if (*v4 != v6 || v4[1] != v5)
  {
    v3 = *(double **)(a1 + 32);
    goto LABEL_10;
  }
}

_QWORD *__51__TSDImageRep_generateSizedImageOnBackgroundThread__block_invoke_3(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[85])
    return (_QWORD *)objc_msgSend(result, "p_startSizing");
  return result;
}

- (BOOL)shouldShowSmartMaskKnobs
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  void *v8;

  v3 = objc_msgSend(-[TSDImageRep maskLayout](self, "maskLayout"), "maskInfo");
  if (v3 == objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "maskInfo"))
  {
    v4 = objc_msgSend(-[TSDImageRep maskLayout](self, "maskLayout"), "hasSmartPath");
  }
  else
  {
    objc_msgSend((id)objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo"), "maskInfo"), "pathSource");
    objc_opt_class();
    v8 = &unk_254F765B8;
    v4 = TSUClassAndProtocolCast() != 0;
  }
  v5 = objc_msgSend(-[TSDImageRep imageInfo](self, "imageInfo", v8), "isMasked");
  LOBYTE(v6) = 0;
  if (v5)
  {
    if (v4)
    {
      v6 = -[TSDRep isSelected](self, "isSelected");
      if (v6)
      {
        if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode")
          && objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskEditMode") != 2)
        {
          LOBYTE(v6) = 0;
        }
        else
        {
          LOBYTE(v6) = objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInInstantAlphaMode") ^ 1;
        }
      }
    }
  }
  return v6;
}

- (BOOL)shouldCreateSelectionKnobs
{
  objc_super v4;

  if ((objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInInstantAlphaMode") & 1) != 0)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSDImageRep;
  return -[TSDRep shouldCreateSelectionKnobs](&v4, sel_shouldCreateSelectionKnobs);
}

- (void)updatePositionsOfKnobs:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  id v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  double v16;
  double v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v25.receiver = self;
  v25.super_class = (Class)TSDImageRep;
  -[TSDMediaRep updatePositionsOfKnobs:](&v25, sel_updatePositionsOfKnobs_);
  if (-[TSDImageRep shouldShowSmartMaskKnobs](self, "shouldShowSmartMaskKnobs"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(a3);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v9, "tag") >= 0xC && (unint64_t)objc_msgSend(v9, "tag") <= 0x10)
          {
            objc_msgSend(-[TSDImageRep maskLayout](self, "maskLayout"), "getControlKnobPosition:", objc_msgSend(v9, "tag"));
            v16 = v11;
            v17 = v10;
            v12 = -[TSDImageRep imageLayout](self, "imageLayout");
            if (v12)
            {
              objc_msgSend(v12, "layoutToMaskTransform");
              v13 = v18;
              v14 = v19;
              v15 = v20;
            }
            else
            {
              v19 = 0u;
              v20 = 0u;
              v15 = 0uLL;
              v13 = 0uLL;
              v14 = 0uLL;
              v18 = 0u;
            }
            objc_msgSend(v9, "setPosition:", vaddq_f64(v15, vmlaq_n_f64(vmulq_n_f64(v14, v16), v13, v17)));
          }
        }
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v6);
    }
  }
}

- (void)addKnobsToArray:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  double v8;
  double v9;
  id v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  TSDKnob *v14;
  double v15;
  double v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)TSDImageRep;
  -[TSDMediaRep addKnobsToArray:](&v20, sel_addKnobsToArray_);
  if (-[TSDImageRep shouldShowSmartMaskKnobs](self, "shouldShowSmartMaskKnobs"))
  {
    v5 = objc_msgSend(-[TSDImageRep maskLayout](self, "maskLayout"), "numberOfControlKnobs");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        objc_msgSend(-[TSDImageRep maskLayout](self, "maskLayout"), "getControlKnobPosition:", i + 12);
        v15 = v9;
        v16 = v8;
        v10 = -[TSDImageRep imageLayout](self, "imageLayout");
        if (v10)
        {
          objc_msgSend(v10, "layoutToMaskTransform");
          v11 = v17;
          v12 = v18;
          v13 = v19;
        }
        else
        {
          v18 = 0u;
          v19 = 0u;
          v13 = 0uLL;
          v11 = 0uLL;
          v12 = 0uLL;
          v17 = 0u;
        }
        v14 = -[TSDKnob initWithType:position:radius:tag:onRep:]([TSDKnob alloc], "initWithType:position:radius:tag:onRep:", 0, i + 12, self, vaddq_f64(v13, vmlaq_n_f64(vmulq_n_f64(v12, v15), v11, v16)), 15.0);
        objc_msgSend(a3, "addObject:", v14);

      }
    }
  }
}

- (double)additionalRotationForKnobOrientation
{
  double v3;
  double v4;
  void *v5;
  objc_super v7[3];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDImageRep;
  -[TSDRep additionalRotationForKnobOrientation](&v8, sel_additionalRotationForKnobOrientation);
  v4 = v3;
  if (objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode")
    && objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskEditMode") == 3)
  {
    v5 = (void *)objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "maskLayout");
    if (v5)
      objc_msgSend(v5, "transform");
    else
      memset(v7, 0, sizeof(v7));
    return v4 - TSDTransformAngle((double *)v7);
  }
  return v4;
}

- (BOOL)shouldShowMediaReplaceUI
{
  objc_super v4;

  if ((objc_msgSend(-[TSDImageRep imageLayout](self, "imageLayout"), "isInMaskEditMode") & 1) != 0)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSDImageRep;
  return -[TSDMediaRep shouldShowMediaReplaceUI](&v4, sel_shouldShowMediaReplaceUI);
}

- (void)p_invalidateHitTestCache
{
  objc_msgSend((id)self->mCachedSizedImageOrientation, "removeAllObjects");
}

- (BOOL)p_hitCacheGetCachedValue:(BOOL *)a3 forPoint:(CGPoint)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend((id)self->mCachedSizedImageOrientation, "objectForKey:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", a4.x, a4.y));
  v6 = v5;
  if (v5)
    *a3 = objc_msgSend(v5, "BOOLValue");
  return v6 != 0;
}

- (void)p_hitCacheSetCachedValue:(BOOL)a3 forPoint:(CGPoint)a4
{
  double y;
  double x;
  _BOOL8 v6;
  NSCache **p_mHitTestCache;
  void *mCachedSizedImageOrientation;
  uint64_t v10;
  _QWORD block[5];

  y = a4.y;
  x = a4.x;
  v6 = a3;
  p_mHitTestCache = &self->mHitTestCache;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__TSDImageRep_p_hitCacheSetCachedValue_forPoint___block_invoke;
  block[3] = &unk_24D829278;
  block[4] = self;
  if (*p_mHitTestCache != (NSCache *)-1)
    dispatch_once((dispatch_once_t *)p_mHitTestCache, block);
  mCachedSizedImageOrientation = (void *)self->mCachedSizedImageOrientation;
  v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  objc_msgSend(mCachedSizedImageOrientation, "setObject:forKey:", v10, objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x, y));
}

id __49__TSDImageRep_p_hitCacheSetCachedValue_forPoint___block_invoke(uint64_t a1)
{
  id result;

  result = objc_alloc_init(MEMORY[0x24BDBCE40]);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 784) = result;
  return result;
}

@end
