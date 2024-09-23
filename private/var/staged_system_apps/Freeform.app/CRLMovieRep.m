@implementation CRLMovieRep

+ (void)initialize
{
  CRLWidthLimitedQueue *v2;
  void *v3;

  if ((id)objc_opt_class(CRLMovieRep, a2) == a1)
  {
    v2 = -[CRLWidthLimitedQueue initWithLimit:]([CRLWidthLimitedQueue alloc], "initWithLimit:", 10);
    v3 = (void *)qword_101414D98;
    qword_101414D98 = (uint64_t)v2;

  }
}

- (CRLMovieRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v6;
  CRLMovieRep *v7;
  CRLMovieRep *v8;
  void *v9;
  NSUUID *v10;
  NSUUID *downloadObserverIdentifier;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CRLMovieRep;
  v7 = -[CRLCanvasRep initWithLayout:canvas:](&v13, "initWithLayout:canvas:", a3, v6);
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](v7, "movieItem"));

    if (v9)
    {
      v10 = (NSUUID *)objc_alloc_init((Class)NSUUID);
      downloadObserverIdentifier = v8->_downloadObserverIdentifier;
      v8->_downloadObserverIdentifier = v10;

      if (objc_msgSend(v6, "isCanvasInteractive"))
      {
        -[CRLMovieRep p_listenForAssetChangesIfAppropriate](v8, "p_listenForAssetChangesIfAppropriate");
        -[CRLMovieRep p_startOrStopLoopingStickerIfNecessary](v8, "p_startOrStopLoopingStickerIfNecessary");
      }
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

- (_TtC8Freeform12CRLMovieItem)movieItem
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  v3 = objc_opt_class(_TtC8Freeform12CRLMovieItem, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v5 = sub_100221D0C(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (_TtC8Freeform12CRLMovieItem *)v6;
}

- (id)movieLayout
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  v3 = objc_opt_class(CRLMovieLayout, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v5 = sub_100221D0C(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (self->_hideControlsTimeoutTimer)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234C80);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF59F0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234CA0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 218, 0, "expected nil value for '%{public}s'", "_hideControlsTimeoutTimer");

  }
  -[CRLCanvasRenderable setDelegate:](self->_playerStrokeRenderable, "setDelegate:", 0);
  -[CRLCanvasRenderable setDelegate:](self->_playerRenderable, "setDelegate:", 0);
  v6.receiver = self;
  v6.super_class = (Class)CRLMovieRep;
  -[CRLCanvasRep dealloc](&v6, "dealloc");
}

- (void)updateFromLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLMovieRep;
  -[CRLCanvasRep updateFromLayout](&v3, "updateFromLayout");
  -[CRLMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
}

- (id)p_posterImageProvider
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "posterImageAssetPayload"));
  if (v6)
  {
    v7 = objc_opt_class(CRLBitmapImageProvider, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "providerForAsset:shouldValidate:", v6, 1));
    v9 = sub_100221D0C(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)p_drawPosterImageInContext:(CGContext *)a3 forShadowOrHitTest:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _TtC8Freeform33CRLUndownloadedAssetDrawingHelper *v38;
  void *v39;
  void *v40;
  _TtC8Freeform33CRLUndownloadedAssetDrawingHelper *v41;
  void *v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v4 = a4;
  CGContextSaveGState(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaRep mediaLayout](self, "mediaLayout"));
  objc_msgSend(v7, "boundsForStandardKnobs");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  memset(&v45, 0, sizeof(v45));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaRep mediaLayout](self, "mediaLayout"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "geometryInRoot"));
  v18 = v17;
  if (v17)
    objc_msgSend(v17, "transform");
  else
    memset(&v45, 0, sizeof(v45));

  v44 = v45;
  if (sub_100079384(&v44.a))
  {
    v44 = v45;
    v46.origin.x = v9;
    v46.origin.y = v11;
    v46.size.width = v13;
    v46.size.height = v15;
    v47 = CGRectApplyAffineTransform(v46, &v44);
    x = v47.origin.x;
    y = v47.origin.y;
    width = v47.size.width;
    height = v47.size.height;
    v23 = sub_1004121D0((uint64_t)a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v24, "viewScale");
    v26 = v23 * v25;

    v27 = sub_100063150(x, y, width, height, v26);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v44 = v45;
    CGAffineTransformInvert(&v43, &v44);
    v48.origin.x = v27;
    v48.origin.y = v29;
    v48.size.width = v31;
    v48.size.height = v33;
    v49 = CGRectApplyAffineTransform(v48, &v43);
    v9 = v49.origin.x;
    v11 = v49.origin.y;
    v13 = v49.size.width;
    v15 = v49.size.height;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_posterImageProvider](self, "p_posterImageProvider"));
  if (v34)
  {
    CGContextSaveGState(a3);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_pathForRoundedCornerMaskWithBounds:](self, "p_pathForRoundedCornerMaskWithBounds:", v9, v11, v13, v15));
    v36 = v35;
    if (v35)
    {
      CGContextAddPath(a3, (CGPathRef)objc_msgSend(objc_retainAutorelease(v35), "CGPath"));
      CGContextClip(a3);
    }
    if (v4 && objc_msgSend(v34, "isOpaque"))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
      CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v37, "CGColor"));

      v50.origin.x = v9;
      v50.origin.y = v11;
      v50.size.width = v13;
      v50.size.height = v15;
      CGContextFillRect(a3, v50);
    }
    else
    {
      objc_msgSend(v34, "drawImageInContext:rect:", a3, v9, v11, v13, v15);
    }
    CGContextRestoreGState(a3);

  }
  else if (-[CRLMovieRep shouldShowLoadingUI](self, "shouldShowLoadingUI"))
  {
    v38 = [_TtC8Freeform33CRLUndownloadedAssetDrawingHelper alloc];
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "posterImageAssetPayload"));
    v41 = -[CRLUndownloadedAssetDrawingHelper initWithRep:asset:](v38, "initWithRep:asset:", self, v40);

    -[CRLUndownloadedAssetDrawingHelper drawInContext:](v41, "drawInContext:", a3);
  }
  else if (v4)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
    CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v42, "CGColor"));

    v51.origin.x = v9;
    v51.origin.y = v11;
    v51.size.width = v13;
    v51.size.height = v15;
    CGContextFillRect(a3, v51);
  }
  CGContextRestoreGState(a3);

}

- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(double)a6 forShadowOrHitTest:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  _BOOL4 v19;
  int v20;
  int v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  unsigned int v32;
  id v33;

  v7 = a7;
  v9 = a5;
  v10 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledRep styledLayout](self, "styledLayout"));
  v14 = objc_msgSend(v13, "isInvisible");

  if ((v14 & 1) != 0)
    return;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stroke"));

  if (v33)
  {
    if (!objc_msgSend(v33, "shouldRender"))
    {
      v18 = 0;
      goto LABEL_8;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v17 = objc_msgSend(v16, "shouldSuppressBackgrounds");

    if (v17)
    {
      v18 = objc_msgSend(v33, "mutableCopy");

      v33 = (id)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
      objc_msgSend(v18, "setColor:");
LABEL_8:

      v33 = v18;
    }
  }
  else
  {
    v33 = 0;
  }
  v19 = a6 < 1.0 && v9;
  v20 = v19 && v10;
  if (v19 && v10 && (CGContextSaveGState(a3), CGContextSetAlpha(a3, a6), v33))
  {
    CGContextBeginTransparencyLayer(a3, 0);
    v21 = 1;
  }
  else
  {
    v21 = 0;
  }
  CGContextSaveGState(a3);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaRep mediaLayout](self, "mediaLayout"));
  objc_msgSend(v22, "boundsForStandardKnobs");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  if (v10)
    -[CRLMovieRep p_drawPosterImageInContext:forShadowOrHitTest:](self, "p_drawPosterImageInContext:forShadowOrHitTest:", a3, v7);
  CGContextRestoreGState(a3);
  if (v9 && v33)
  {
    CGContextSaveGState(a3);
    objc_msgSend(v33, "paintRect:inContext:", a3, v24, v26, v28, v30);
    CGContextRestoreGState(a3);
  }
  if (!v7)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    if (objc_msgSend(v31, "isCanvasInteractive"))
    {

    }
    else
    {
      v32 = -[CRLMovieRep p_playButtonFitsInFrame](self, "p_playButtonFitsInFrame");

      if (v32)
      {
        CGContextSaveGState(a3);
        -[CRLMovieRep p_drawPlayButtonForNonInteractiveCanvasInContext:](self, "p_drawPlayButtonForNonInteractiveCanvasInContext:", a3);
        CGContextRestoreGState(a3);
      }
    }
  }
  if (v21)
    CGContextEndTransparencyLayer(a3);
  if (v20)
    CGContextRestoreGState(a3);

}

- (void)p_drawPlayButtonForNonInteractiveCanvasInContext:(CGContext *)a3
{
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
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  void *v40;
  CGImage *v41;
  id v42;
  CGRect v43;
  CGRect v44;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaRep mediaLayout](self, "mediaLayout"));
  objc_msgSend(v5, "boundsForStandardKnobs");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CRLMovieRep positionOfPlayKnobForBounds:viewScale:](self, "positionOfPlayKnobForBounds:viewScale:", v7, v9, v11, v13, 1.0);
  v16 = sub_10005FD98(v14, v15, 48.0);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLMovieRep CRLMovieButtonFillColor](CRLMovieRep, "CRLMovieButtonFillColor"));
  CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v23, "CGColor"));

  v43.origin.x = v16;
  v43.origin.y = v18;
  v43.size.width = v20;
  v43.size.height = v22;
  CGContextFillEllipseInRect(a3, v43);
  v24 = sub_100061400(v16, v18, v20, v22);
  v26 = v25;
  v27 = v24 + 2.88;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithSystemImageNamed:pointSize:](CRLImage, "imageWithSystemImageNamed:pointSize:", CFSTR("play.fill"), 22.0));
  objc_msgSend(v28, "size");
  v30 = v29;
  v32 = v31;
  v33 = sub_10005FD98(v27, v26, v29);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor"));
  v42 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "compositedImageWithColor:alpha:blendMode:", v40, 20, 1.0));

  v41 = (CGImage *)objc_msgSend(v42, "CGImageForSize:inContext:orContentsScaleProvider:", a3, 0, v30, v32);
  v44.origin.x = v33;
  v44.origin.y = v35;
  v44.size.width = v37;
  v44.size.height = v39;
  CGContextDrawImage(a3, v44, v41);

}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8 keepingChildrenPassingTest:(id)a9
{
  _BOOL8 v9;
  char v10;
  _BOOL8 v11;
  double v14;

  v9 = a7;
  v10 = a5;
  v11 = a4;
  v14 = 1.0;
  if (a6)
    -[CRLStyledRep opacity](self, "opacity", a3, a4, a5, a6, a7, a8, 1.0);
  -[CRLMovieRep p_drawInContext:withContent:withStroke:withOpacity:forShadowOrHitTest:](self, "p_drawInContext:withContent:withStroke:withOpacity:forShadowOrHitTest:", a3, v11, v10 & 1, v9, a7, a8, v14);
}

- (void)willBeRemoved
{
  void *v3;
  CRLMovieKnob *playButtonKnob;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[2];
  id (*v12)(uint64_t);
  void *v13;
  CRLMovieRep *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CRLMovieRep;
  -[CRLCanvasRep willBeRemoved](&v15, "willBeRemoved");
  -[CRLMovieRep p_cancelUpdatingUIStateForMoviePlayability](self, "p_cancelUpdatingUIStateForMoviePlayability");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  v12 = sub_1000BE900;
  v13 = &unk_10122D110;
  v14 = self;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    v12((uint64_t)block);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  -[CRLMovieRep p_invalidateHideControlsTimeoutTimer](self, "p_invalidateHideControlsTimeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob renderable](self->_playButtonKnob, "renderable"));
  objc_msgSend(v3, "setDelegate:", 0);

  playButtonKnob = self->_playButtonKnob;
  self->_playButtonKnob = 0;

  if (!self->_downloadObserverIdentifier)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234CC0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF5A7C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234CE0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep willBeRemoved]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 422, 0, "invalid nil value for '%{public}s'", "_downloadObserverIdentifier");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "store"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetManager"));
  objc_msgSend(v10, "removeAllDownloadObserversWithIdentifier:", self->_downloadObserverIdentifier);

}

- (BOOL)directlyManagesLayerContent
{
  unsigned int v3;
  char v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;

  v3 = -[CRLMovieRep shouldShowLoadingUI](self, "shouldShowLoadingUI");
  v4 = v3 ^ 1;
  if (self->_directlyManagesLayerContent != (v3 ^ 1))
  {
    self->_directlyManagesLayerContent = v4;
    if (v3)
    {
      -[CRLMovieRep setNeedsDisplay](self, "setNeedsDisplay");
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      v6 = objc_msgSend(v5, "isCanvasInteractive");

      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "renderableForRep:", self));

        objc_msgSend(v8, "setContents:", 0);
      }
    }
  }
  return v4;
}

- (void)p_disposeStrokeRenderable
{
  CRLCanvasRenderable *playerStrokeRenderable;
  CRLCanvasRenderable *v4;

  playerStrokeRenderable = self->_playerStrokeRenderable;
  if (playerStrokeRenderable)
  {
    -[CRLCanvasRenderable setDelegate:](playerStrokeRenderable, "setDelegate:", 0);
    v4 = self->_playerStrokeRenderable;
    self->_playerStrokeRenderable = 0;

  }
}

- (void)p_setupPlayerLayerIfNecessary
{
  CRLCanvasRenderable *v3;
  CRLCanvasRenderable *playerRenderable;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  CRLCanvasRenderable *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  void *v26;
  void *v27;
  _OWORD v28[3];
  __int128 v29;
  __int128 v30;
  __int128 v31;

  if (!self->_playerRenderable)
  {
    v3 = (CRLCanvasRenderable *)-[CRLCanvasRenderableMediaPlayerController newRenderable](self->_playerController, "newRenderable");
    playerRenderable = self->_playerRenderable;
    self->_playerRenderable = v3;

    -[CRLCanvasRenderable setDelegate:](self->_playerRenderable, "setDelegate:", self);
    -[CRLCanvasRenderable setHidden:](self->_playerRenderable, "setHidden:", 1);
    v6 = objc_opt_class(CRLAVPlayerRenderable, v5);
    v7 = sub_100221D0C(v6, self->_playerRenderable);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v8)
    {
      self->_playerLayerShouldBeDisplayed = 0;
      objc_msgSend(v8, "addReadyToDisplayObserver:options:context:", self, 5, off_1013D92D0);
      v10 = 1;
    }
    else
    {
      v10 = 0;
      self->_playerLayerShouldBeDisplayed = 1;
    }
    self->_currentlyObservingPlayerLayer = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geometry"));
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "transformBasedOnPoint:centeredAtPoint:", CGPointZero.x, CGPointZero.y, CGPointZero.x, CGPointZero.y);
    }
    else
    {
      v30 = 0u;
      v31 = 0u;
      v29 = 0u;
    }
    v14 = self->_playerRenderable;
    v28[0] = v29;
    v28[1] = v30;
    v28[2] = v31;
    -[CRLCanvasRenderable setAffineTransform:](v14, "setAffineTransform:", v28);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "geometry"));
    objc_msgSend(v17, "size");
    objc_msgSend(v15, "convertUnscaledToBoundsRect:", sub_10005FDDC());
    -[CRLCanvasRenderable setBounds:](self->_playerRenderable, "setBounds:");

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "geometry"));
    objc_msgSend(v20, "frame");
    objc_msgSend(v18, "convertUnscaledToBoundsPoint:", sub_100061400(v21, v22, v23, v24));
    -[CRLCanvasRenderable setPosition:](self->_playerRenderable, "setPosition:");

    -[CRLStyledRep opacity](self, "opacity");
    *(float *)&v25 = v25;
    -[CRLCanvasRenderable setOpacity:](self->_playerRenderable, "setOpacity:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self->_playerRenderable, "layer"));
    -[CRLMovieRep p_applyRoundedCornersTo:](self, "p_applyRoundedCornersTo:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v27, "invalidateContentLayersForRep:", self);

  }
}

- (BOOL)p_cornerRadiusValueIsSignificant
{
  void *v2;
  float v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
  objc_msgSend(v2, "cornerRadius");
  v4 = v3 >= 0.001;

  return v4;
}

- (void)p_updateRoundedCornersForPlayerRenderableIfNeeded
{
  void *v3;
  unsigned int v4;
  id v5;

  if (self->_playerRenderable)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    v4 = objc_msgSend(v3, "hasRoundedCorners");

    v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self->_playerRenderable, "layer"));
    if (v4)
      -[CRLMovieRep p_applyRoundedCornersTo:](self, "p_applyRoundedCornersTo:", v5);
    else
      -[CRLMovieRep p_removeRoundedCornersFrom:](self, "p_removeRoundedCornersFrom:", v5);

  }
}

- (void)p_applyRoundedCornersTo:(id)a3
{
  void *v4;
  float v5;
  double v6;
  void *v7;
  double v8;
  id v9;

  v9 = a3;
  if (-[CRLMovieRep p_cornerRadiusValueIsSignificant](self, "p_cornerRadiusValueIsSignificant"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    objc_msgSend(v4, "cornerRadius");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v7, "viewScale");
    objc_msgSend(v9, "setCornerRadius:", v8 * v6);

    objc_msgSend(v9, "setMasksToBounds:", 1);
    objc_msgSend(v9, "setCornerCurve:", kCACornerCurveContinuous);
  }

}

- (void)p_removeRoundedCornersFrom:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setCornerRadius:", 0.0);
  objc_msgSend(v3, "setMasksToBounds:", 0);

}

- (id)p_pathForRoundedCornerMaskWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  float v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[CRLMovieRep p_cornerRadiusValueIsSignificant](self, "p_cornerRadiusValueIsSignificant"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    objc_msgSend(v8, "cornerRadius");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithContinuousCornerRoundedRect:cornerRadius:](CRLBezierPath, "bezierPathWithContinuousCornerRoundedRect:cornerRadius:", x, y, width, height, v9));

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self->_playerStrokeRenderable, "layer"));

  if (v7 == v6)
  {
    -[CRLMovieRep p_drawStrokeInContext:](self, "p_drawStrokeInContext:", a4);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLMovieRep;
    -[CRLMovieRep drawLayer:inContext:](&v8, "drawLayer:inContext:", v6, a4);
  }

}

- (id)p_shapeRenderableForPlayerStroke
{
  uint64_t v3;

  v3 = objc_opt_class(CRLCanvasShapeRenderable, a2);
  return sub_100221D0C(v3, self->_playerStrokeRenderable);
}

- (id)p_playerStrokeRenderable
{
  return self->_playerStrokeRenderable;
}

- (void)p_setupTilingPlayerStrokeRenderable
{
  CRLCanvasRenderable *v3;
  CRLCanvasRenderable *playerStrokeRenderable;
  CRLCanvasRenderable *v5;

  if (!self->_playerStrokeRenderable)
  {
    v3 = (CRLCanvasRenderable *)objc_claimAutoreleasedReturnValue(+[CRLTilingRenderable renderable](CRLTilingRenderable, "renderable"));
    playerStrokeRenderable = self->_playerStrokeRenderable;
    self->_playerStrokeRenderable = v3;
    v5 = v3;

    -[CRLCanvasRenderable setDelegate:](v5, "setDelegate:", self);
    -[CRLCanvasRenderable setNeedsDisplay](v5, "setNeedsDisplay");

  }
}

- (void)p_setupShapePlayerStrokeRenderable
{
  CRLCanvasRenderable *v3;
  CRLCanvasRenderable *playerStrokeRenderable;
  CRLCanvasRenderable *v5;

  if (!self->_playerStrokeRenderable)
  {
    v3 = (CRLCanvasRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
    playerStrokeRenderable = self->_playerStrokeRenderable;
    self->_playerStrokeRenderable = v3;
    v5 = v3;

    -[CRLCanvasRenderable setDelegate:](v5, "setDelegate:", self);
    -[CRLCanvasRenderable setFillColor:](v5, "setFillColor:", 0);

  }
}

- (BOOL)p_needsTilingForStroke:(id)a3
{
  id v4;
  uint64_t v5;
  char isKindOfClass;
  uint64_t v7;

  v4 = a3;
  if (-[CRLCanvasRep isBeingResized](self, "isBeingResized"))
  {
    isKindOfClass = 0;
  }
  else
  {
    v7 = objc_opt_class(CRLSmartStroke, v5);
    isKindOfClass = objc_opt_isKindOfClass(v4, v7);
  }

  return isKindOfClass & 1;
}

- (void)p_setupPlayerStrokeRenderables:(BOOL)a3
{
  if (a3)
    -[CRLMovieRep p_setupTilingPlayerStrokeRenderable](self, "p_setupTilingPlayerStrokeRenderable");
  else
    -[CRLMovieRep p_setupShapePlayerStrokeRenderable](self, "p_setupShapePlayerStrokeRenderable");
}

- (void)p_checkAndSyncTilingState:(BOOL)a3
{
  _BOOL4 v3;
  CRLCanvasRenderable *playerStrokeRenderable;
  uint64_t v6;

  v3 = a3;
  playerStrokeRenderable = self->_playerStrokeRenderable;
  v6 = objc_opt_class(CRLTilingRenderable, a2);
  if ((objc_opt_isKindOfClass(playerStrokeRenderable, v6) & 1) != v3)
    -[CRLMovieRep p_disposeStrokeRenderable](self, "p_disposeStrokeRenderable");
}

- (void)p_setupStrokeRenderables:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[CRLMovieRep p_checkAndSyncTilingState:](self, "p_checkAndSyncTilingState:");
  -[CRLMovieRep p_setupPlayerStrokeRenderables:](self, "p_setupPlayerStrokeRenderables:", v3);
}

- (void)p_commonDrawStrokeInContext:(CGContext *)a3
{
  void *v5;
  double v6;
  CGFloat v7;

  CGContextSaveGState(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v5, "viewScale");
  v7 = v6;

  CGContextScaleCTM(a3, v7, v7);
  -[CRLMovieRep p_drawInContext:withContent:withStroke:withOpacity:forShadowOrHitTest:](self, "p_drawInContext:withContent:withStroke:withOpacity:forShadowOrHitTest:", a3, 0, 1, 0, 0.0);
  CGContextRestoreGState(a3);
}

- (void)p_drawStrokeInContext:(CGContext *)a3
{
  -[CRLMovieRep p_commonDrawStrokeInContext:](self, "p_commonDrawStrokeInContext:", a3);
}

- (CGRect)p_strokeFrameForRenderableFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stroke"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v10, "viewScale");
  v12 = v11;

  objc_msgSend(v9, "renderedWidth");
  v14 = v12 * (v13 * -0.5);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  CGRectInset(v26, v14, v14);
  v15 = sub_10005FDDC();
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)p_arrangeRenderableVisibility:(id)a3
{
  CRLCanvasRenderable *playerRenderable;
  CRLCanvasRenderable *v5;
  CRLCanvasRenderable *v6;

  v6 = (CRLCanvasRenderable *)a3;
  if (self->_playerLayerShouldBeDisplayed && !self->_needsTeardownPlayerController)
  {
    -[CRLCanvasRenderable setHidden:](self->_playerRenderable, "setHidden:", 0);
    -[CRLCanvasRenderable setHidden:](v6, "setHidden:", 1);
    playerRenderable = self->_playerRenderable;
  }
  else
  {
    -[CRLCanvasRenderable setHidden:](v6, "setHidden:", 0);
    -[CRLCanvasRenderable setHidden:](self->_playerRenderable, "setHidden:", 1);
    playerRenderable = v6;
  }
  v5 = playerRenderable;
  if (!-[CRLCanvasRenderable isEqual:](v5, "isEqual:", self->_renderableToStroke))
  {
    -[CRLMovieRep p_disposeStrokeRenderable](self, "p_disposeStrokeRenderable");
    objc_storeStrong((id *)&self->_renderableToStroke, playerRenderable);
  }

}

- (void)willUpdateRenderable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLMovieRep;
  v4 = a3;
  -[CRLCanvasRep willUpdateRenderable:](&v7, "willUpdateRenderable:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout", v7.receiver, v7.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stroke"));

  -[CRLMovieRep p_arrangeRenderableVisibility:](self, "p_arrangeRenderableVisibility:", v4);
  if (-[CRLMediaRep i_shouldRenderStroke:](self, "i_shouldRenderStroke:", v6))
    -[CRLMovieRep p_setupStrokeRenderables:](self, "p_setupStrokeRenderables:", -[CRLMovieRep p_needsTilingForStroke:](self, "p_needsTilingForStroke:", v6));
  else
    -[CRLMovieRep p_disposeStrokeRenderable](self, "p_disposeStrokeRenderable");

}

- (void)didUpdateRenderable:(id)a3
{
  CRLCanvasRenderable *v4;
  _QWORD *v5;
  double v6;
  double v7;
  float v8;
  double v9;
  CRLCanvasRenderable *playerRenderable;
  float v11;
  double v12;
  void *v13;
  void *v14;
  CRLCanvasRenderable *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  dispatch_queue_global_t global_queue;
  NSObject *v24;
  CRLCanvasRenderable *v25;
  void *v26;
  void **v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  CRLCanvasRenderable *v32;
  CRLMovieRep *v33;
  uint64_t *v34;
  uint64_t v35;
  double *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  objc_super v41;
  _QWORD v42[6];

  v4 = (CRLCanvasRenderable *)a3;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000BF820;
  v42[3] = &unk_10122D110;
  v42[4] = self;
  v5 = objc_retainBlock(v42);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v5);
  v41.receiver = self;
  v41.super_class = (Class)CRLMovieRep;
  -[CRLCanvasRep didUpdateRenderable:](&v41, "didUpdateRenderable:", v4);
  -[CRLCanvasRenderable crl_ignoreAccessibilityInvertColorsIfNeeded](v4, "crl_ignoreAccessibilityInvertColorsIfNeeded");
  -[CRLStyledRep opacity](self, "opacity");
  v7 = v6;
  if (-[CRLMovieRep shouldShowLoadingUI](self, "shouldShowLoadingUI")
    && !-[CRLMovieRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    v7 = 1.0;
  }
  -[CRLCanvasRenderable opacity](v4, "opacity");
  v9 = v8;
  if (v7 != v9)
  {
    *(float *)&v9 = v7;
    -[CRLCanvasRenderable setOpacity:](v4, "setOpacity:", v9);
  }
  playerRenderable = self->_playerRenderable;
  if (playerRenderable)
  {
    -[CRLCanvasRenderable opacity](playerRenderable, "opacity");
    v12 = v11;
    if (v7 != v12)
    {
      *(float *)&v12 = v7;
      -[CRLCanvasRenderable setOpacity:](self->_playerRenderable, "setOpacity:", v12);
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stroke"));

  if (-[CRLMediaRep i_shouldRenderStroke:](self, "i_shouldRenderStroke:", v14))
  {
    v15 = v4;
    if (self->_playerLayerShouldBeDisplayed)
      v15 = self->_playerRenderable;
    -[CRLMovieRep p_updateStrokeRenderablesForStroke:repRenderable:](self, "p_updateStrokeRenderablesForStroke:repRenderable:", v14, v15);
  }
  -[CRLMediaRep updateSpatialLabel](self, "updateSpatialLabel");
  if (-[CRLMovieRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_posterImageProvider](self, "p_posterImageProvider"));
    if (v16)
    {
      v35 = 0;
      v36 = (double *)&v35;
      v37 = 0x3010000000;
      v39 = 0;
      v40 = 0;
      v38 = &unk_1010E66AB;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "geometry"));
      objc_msgSend(v19, "size");
      objc_msgSend(v17, "convertUnscaledToBoundsSize:");
      v39 = v20;
      v40 = v21;

      v22 = objc_msgSend(v16, "cachedCGImageOfNearestSizeOrNULLPreferringSize:withContentsScaleProvider:", v4, v36[4], v36[5]);
      if (v22)
        -[CRLCanvasRenderable setContents:](v4, "setContents:", v22);
      global_queue = dispatch_get_global_queue(0, 0);
      v24 = objc_claimAutoreleasedReturnValue(global_queue);
      v27 = _NSConcreteStackBlock;
      v28 = 3221225472;
      v29 = sub_1000BF828;
      v30 = &unk_101234D30;
      v31 = v16;
      v34 = &v35;
      v25 = v4;
      v32 = v25;
      v33 = self;
      dispatch_async(v24, &v27);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](v25, "layer", v27, v28, v29, v30));
      -[CRLMovieRep p_applyRoundedCornersTo:](self, "p_applyRoundedCornersTo:", v26);

      _Block_object_dispose(&v35, 8);
    }

  }
  +[CATransaction commit](CATransaction, "commit");

}

- (BOOL)shouldDisplayAsSpatial
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
  if (objc_msgSend(v3, "isSpatial"))
    v4 = !-[CRLMovieRep isPlaying](self, "isPlaying");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)p_setPositionAndBoundsIfDifferent:(id)a3 position:(CGPoint)a4 bounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  id v18;
  CGRect v19;
  CGRect v20;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.y;
  v10 = a4.x;
  v18 = a3;
  objc_msgSend(v18, "position");
  if (v12 != v10 || v11 != v9)
    objc_msgSend(v18, "setPosition:", v10, v9);
  objc_msgSend(v18, "bounds");
  v20.origin.x = v14;
  v20.origin.y = v15;
  v20.size.width = v16;
  v20.size.height = v17;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  if (!CGRectEqualToRect(v19, v20))
    objc_msgSend(v18, "setBounds:", x, y, width, height);

}

- (void)updateRenderableGeometryFromLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRLCanvasRenderable *playerRenderable;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;

  v4 = a3;
  if (-[CRLMovieRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v11 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieLayout](self, "movieLayout"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pureGeometry"));
    -[CRLCanvasRep computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:](self, "computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:", &v14, &v11, v6);
    -[CRLCanvasRep antiAliasDefeatLayerTransform:forFrame:](self, "antiAliasDefeatLayerTransform:forFrame:", &v11, v14, v15);
    v8 = v11;
    v9 = v12;
    v10 = v13;
    objc_msgSend(v4, "setIfDifferentFrame:orTransform:", &v8, v14, v15);
    if (self->_playerRenderable)
    {
      +[CATransaction begin](CATransaction, "begin");
      +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
      playerRenderable = self->_playerRenderable;
      v8 = v11;
      v9 = v12;
      v10 = v13;
      -[CRLCanvasRenderable setIfDifferentFrame:orTransform:](playerRenderable, "setIfDifferentFrame:orTransform:", &v8, v14, v15);
      +[CATransaction commit](CATransaction, "commit");
    }

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CRLMovieRep;
    -[CRLCanvasRep updateRenderableGeometryFromLayout:](&v16, "updateRenderableGeometryFromLayout:", v4);
  }

}

- (void)p_applyBasicStroke:(id)a3 toRenderable:(id)a4 bounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  CGPath *Mutable;
  CGRect v17;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v13, "viewScale");
  v15 = v14;

  objc_msgSend(v11, "setBounds:", x, y, width, height);
  objc_msgSend(v12, "applyToShapeRenderable:withScale:", v11, v15);

  Mutable = CGPathCreateMutable();
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  CGPathAddRect(Mutable, 0, v17);
  objc_msgSend(v11, "setHidden:", 0);
  objc_msgSend(v11, "setPath:", Mutable);

  CGPathRelease(Mutable);
}

- (void)p_updateStrokeRenderablesForStroke:(id)a3 repRenderable:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  __int128 v10;
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
  double v24;
  float v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  CGAffineTransform v32;
  CGAffineTransform t2;
  CGAffineTransform t1;
  __int128 v35;
  __int128 v36;
  CGAffineTransform v37;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_playerStrokeRenderable](self, "p_playerStrokeRenderable"));
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v7 = -[CRLMovieRep p_needsTilingForStroke:](self, "p_needsTilingForStroke:", v5);
  v36 = 0u;
  memset(&v37, 0, sizeof(v37));
  v35 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pureGeometry"));
  -[CRLCanvasRep computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:](self, "computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:", &v35, &v37, v9);

  v10 = v36;
  v11 = sub_10005FDDC();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = sub_100061400(*(CGFloat *)&v35, *((CGFloat *)&v35 + 1), *(CGFloat *)&v10, *((CGFloat *)&v10 + 1));
  v20 = v19;
  objc_msgSend(v6, "position");
  if (v22 == v18 && v21 == v20)
  {
    if (v6)
    {
LABEL_4:
      objc_msgSend(v6, "affineTransform");
      goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend(v6, "setPosition:", v18, v20);
    if (v6)
      goto LABEL_4;
  }
  memset(&t1, 0, sizeof(t1));
LABEL_7:
  t2 = v37;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v32 = v37;
    objc_msgSend(v6, "setAffineTransform:", &v32);
  }
  -[CRLStyledRep opacity](self, "opacity");
  v24 = v23;
  objc_msgSend(v6, "opacity");
  v26 = v25;
  if (v24 != v26)
  {
    *(float *)&v26 = v24;
    objc_msgSend(v6, "setOpacity:", v26);
  }
  -[CRLMovieRep p_strokeFrameForRenderableFrame:](self, "p_strokeFrameForRenderableFrame:", v11, v13, v15, v17);
  -[CRLMovieRep p_setPositionAndBoundsIfDifferent:position:bounds:](self, "p_setPositionAndBoundsIfDifferent:position:bounds:", v6, v18, v20, v27, v28, v29, v30);
  if ((v7 & 1) == 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_shapeRenderableForPlayerStroke](self, "p_shapeRenderableForPlayerStroke"));
    -[CRLMovieRep p_applyBasicStroke:toRenderable:bounds:](self, "p_applyBasicStroke:toRenderable:bounds:", v5, v31, v11, v13, v15, v17);

  }
  +[CATransaction commit](CATransaction, "commit");

}

- (void)drawInLayerContext:(CGContext *)a3
{
  -[CRLMovieRep p_drawInContext:withContent:withStroke:withOpacity:forShadowOrHitTest:](self, "p_drawInContext:withContent:withStroke:withOpacity:forShadowOrHitTest:", a3, 1, 1, 0, 1.0);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null](NSNull, "null", a3, a4);
}

- (void)processChangedProperty:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLMovieRep;
  -[CRLStyledRep processChangedProperty:](&v8, "processChangedProperty:");
  if ((uint64_t)a3 > 39)
  {
    switch(a3)
    {
      case '(':
        -[CRLMovieRep setNeedsDisplay](self, "setNeedsDisplay");
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
        objc_msgSend(v5, "invalidateContentLayersForRep:", self);

        -[CRLMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
        -[CRLMovieRep p_listenForAssetChangesIfAppropriate](self, "p_listenForAssetChangesIfAppropriate");
        break;
      case ')':
        -[CRLMovieRep p_updateStartTime](self, "p_updateStartTime");
        break;
      case '*':
        -[CRLMovieRep p_updateEndTime](self, "p_updateEndTime");
        break;
      case ',':
        -[CRLMovieRep p_updateVolume](self, "p_updateVolume");
        break;
      case '-':
        -[CRLMovieRep p_updateRoundedCornersForPlayerRenderableIfNeeded](self, "p_updateRoundedCornersForPlayerRenderableIfNeeded");
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
        objc_msgSend(v7, "invalidateContentLayersForRep:", self);

        goto LABEL_14;
      case '4':
        -[CRLMovieRep p_startOrStopLoopingStickerIfNecessary](self, "p_startOrStopLoopingStickerIfNecessary");
        -[CRLMovieRep p_updateLoopingSettingForMoviePlaybackIfNeeded](self, "p_updateLoopingSettingForMoviePlaybackIfNeeded");
        break;
      default:
        return;
    }
    return;
  }
  switch(a3)
  {
    case 0xFuLL:
      -[CRLMovieRep p_disposeStrokeRenderable](self, "p_disposeStrokeRenderable");
      goto LABEL_14;
    case 0x10uLL:
LABEL_14:
      -[CRLMovieRep setNeedsDisplay](self, "setNeedsDisplay");
      return;
    case 0x12uLL:
      -[CRLMovieRep p_setNeedsTeardownPlayerControllerOnUpdateRenderable](self, "p_setNeedsTeardownPlayerControllerOnUpdateRenderable");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      objc_msgSend(v6, "invalidateContentLayersForRep:", self);

      -[CRLMovieRep p_listenForAssetChangesIfAppropriate](self, "p_listenForAssetChangesIfAppropriate");
      -[CRLMovieRep p_stopUpdatingUIStateForMoviePlayability](self, "p_stopUpdatingUIStateForMoviePlayability");
      -[CRLMovieRep p_updateUIStateForMoviePlayability](self, "p_updateUIStateForMoviePlayability");
      -[CRLMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
      break;
  }
}

- (BOOL)p_shouldStopPlayingWhenDeselected
{
  return !-[CRLMovieRep p_isLoopingSticker](self, "p_isLoopingSticker");
}

- (void)becameSelected
{
  _QWORD block[2];
  id (*v4)(uint64_t);
  void *v5;
  CRLMovieRep *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLMovieRep;
  -[CRLCanvasRep becameSelected](&v7, "becameSelected");
  if (-[CRLMovieRep p_shouldPlayerControllerExistThroughoutSelection](self, "p_shouldPlayerControllerExistThroughoutSelection"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    v4 = sub_1000C018C;
    v5 = &unk_10122D110;
    v6 = self;
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
      v4((uint64_t)block);
    else
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    -[CRLMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
  }
}

- (void)becameNotSelected
{
  objc_super v3;

  if (-[CRLMovieRep p_shouldStopPlayingWhenDeselected](self, "p_shouldStopPlayingWhenDeselected"))
  {
    -[CRLMovieRep p_setNeedsTeardownPlayerControllerOnUpdateRenderable](self, "p_setNeedsTeardownPlayerControllerOnUpdateRenderable");
    -[CRLMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
  }
  v3.receiver = self;
  v3.super_class = (Class)CRLMovieRep;
  -[CRLCanvasRep becameNotSelected](&v3, "becameNotSelected");
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 1;
}

- (BOOL)shouldShowSelectionHighlight
{
  return 0;
}

- (void)screenScaleDidChange
{
  CRLMovieKnob *playButtonKnob;
  objc_super v4;

  playButtonKnob = self->_playButtonKnob;
  self->_playButtonKnob = 0;

  v4.receiver = self;
  v4.super_class = (Class)CRLMovieRep;
  -[CRLCanvasRep screenScaleDidChange](&v4, "screenScaleDidChange");
}

- (BOOL)manuallyControlsMiniFormatter
{
  if (self->_isPlayable && -[CRLMovieRep p_playButtonFitsInFrame](self, "p_playButtonFitsInFrame"))
    return -[CRLMovieRep isPlaying](self, "isPlaying");
  else
    return 0;
}

- (id)p_selectionPath
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[CRLCanvasRep isSelected](self, "isSelected");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPathWithInfo:", v8));

  }
  return v7;
}

- (void)toggleMiniFormatter
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layerHost"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "miniFormatterPresenter"));
  v6 = objc_msgSend(v5, "isPresentingMiniFormatter");

  if (v6)
    -[CRLMovieRep p_hideMiniFormatter](self, "p_hideMiniFormatter");
  else
    -[CRLMovieRep p_showMiniFormatter](self, "p_showMiniFormatter");
}

- (void)p_showMiniFormatter
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  if ((objc_msgSend(v6, "documentIsSharedReadOnly") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layerHost"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "miniFormatterPresenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_selectionPath](self, "p_selectionPath"));
    objc_msgSend(v4, "presentMiniFormatterForSelectionPath:", v5);

  }
}

- (void)p_hideMiniFormatter
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "miniFormatterPresenter"));
  objc_msgSend(v4, "dismissMiniFormatterForRep:", self);

}

- (BOOL)p_isMiniFormatterShowing
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "miniFormatterPresenter"));
  v5 = objc_msgSend(v4, "isPresentingMiniFormatter");

  return v5;
}

- (BOOL)p_miniFormatterIsPresentingSecondLayer
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "miniFormatterPresenter"));
  v5 = objc_msgSend(v4, "isPresentingSecondLayerPopover");

  return v5;
}

- (BOOL)noKnobTogglePlayAndMiniFormatter
{
  if (!self->_isPlayable || -[CRLMovieRep p_playButtonFitsInFrame](self, "p_playButtonFitsInFrame"))
    return 0;
  if (-[CRLCanvasRep isSelected](self, "isSelected"))
    -[CRLMovieRep i_togglePlayPauseTriggeredFromKnob](self, "i_togglePlayPauseTriggeredFromKnob");
  return 1;
}

- (id)pauseButtonImage
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithSystemImageNamed:pointSize:](CRLImage, "imageWithSystemImageNamed:pointSize:", CFSTR("pause.fill"), 22.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "compositedImageWithColor:alpha:blendMode:", v4, 20, 1.0));

  -[CRLMovieRep p_positionPauseButtonImage](self, "p_positionPauseButtonImage");
  return v5;
}

- (void)p_addPlayButtonToKnobs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_playButtonKnob](self, "p_playButtonKnob"));
  objc_msgSend(v4, "crl_addObjects:", v5, 0);

  -[CRLMovieRep p_updateUIStateForMoviePlayability](self, "p_updateUIStateForMoviePlayability");
  -[CRLMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");

}

- (void)addKnobsToArray:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLMovieRep;
  v4 = a3;
  -[CRLCanvasRep addKnobsToArray:](&v5, "addKnobsToArray:", v4);
  -[CRLMovieRep p_addPlayButtonToKnobs:](self, "p_addPlayButtonToKnobs:", v4, v5.receiver, v5.super_class);

}

- (unint64_t)enabledKnobMask
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLMovieRep;
  v3 = -[CRLCanvasRep enabledKnobMask](&v5, "enabledKnobMask");
  if (-[CRLCanvasRep shouldCreateKnobs](self, "shouldCreateKnobs")
    && -[CRLCanvasRep isSelected](self, "isSelected")
    && !-[CRLMovieRep p_playButtonFitsInFrame](self, "p_playButtonFitsInFrame"))
  {
    return v3 & 0x28A;
  }
  return v3;
}

- (id)newTrackerForKnob:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  CRLCanvasButtonKnobTracker *v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v6 = objc_opt_class(CRLMovieKnob, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = -[CRLCanvasButtonKnobTracker initWithRep:knob:]([CRLCanvasButtonKnobTracker alloc], "initWithRep:knob:", self, v4);
    -[CRLCanvasButtonKnobTracker setTarget:](v7, "setTarget:", self);
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_playButtonKnob](self, "p_playButtonKnob"));

    if (v8 == v4)
      -[CRLCanvasButtonKnobTracker setAction:](v7, "setAction:", "i_togglePlayPauseTriggeredFromKnob");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLMovieRep;
    v7 = -[CRLCanvasRep newTrackerForKnob:](&v10, "newTrackerForKnob:", v4);
  }

  return v7;
}

- (void)p_showControls
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "posterImageAssetPayload"));
  v5 = objc_msgSend(v4, "needsDownload");

  if (-[CRLMovieRep p_playButtonFitsInFrame](self, "p_playButtonFitsInFrame")
    && (v5 & 1) == 0
    && !-[CRLMovieRep p_isLoopingSticker](self, "p_isLoopingSticker"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_playButtonKnob](self, "p_playButtonKnob"));
    objc_msgSend(v6, "setHidden:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_playButtonKnob](self, "p_playButtonKnob"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "renderable"));
    objc_msgSend(v8, "removeAnimationForKey:", CFSTR("hidden"));

    v15 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
    LODWORD(v9) = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9));
    objc_msgSend(v15, "setFromValue:", v10);

    LODWORD(v11) = 1.0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11));
    objc_msgSend(v15, "setToValue:", v12);

    objc_msgSend(v15, "setDuration:", 0.2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_playButtonKnob](self, "p_playButtonKnob"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "renderable"));
    objc_msgSend(v14, "addAnimation:forKey:", v15, CFSTR("hidden"));

  }
}

- (void)i_hidePlayButtonIndependently
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_playButtonKnob](self, "p_playButtonKnob"));
  objc_msgSend(v3, "setHidden:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_playButtonKnob](self, "p_playButtonKnob"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderable"));
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("hidden"));

  v12 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  LODWORD(v6) = 1.0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
  objc_msgSend(v12, "setFromValue:", v7);

  LODWORD(v8) = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
  objc_msgSend(v12, "setToValue:", v9);

  objc_msgSend(v12, "setDuration:", 0.2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_playButtonKnob](self, "p_playButtonKnob"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "renderable"));
  objc_msgSend(v11, "addAnimation:forKey:", v12, CFSTR("hidden"));

}

- (void)p_hideControls
{
  -[CRLMovieRep i_hidePlayButtonIndependently](self, "i_hidePlayButtonIndependently");
  if (!-[CRLMovieRep p_miniFormatterIsPresentingSecondLayer](self, "p_miniFormatterIsPresentingSecondLayer"))
  {
    if (-[CRLMovieRep manuallyControlsMiniFormatter](self, "manuallyControlsMiniFormatter"))
      -[CRLMovieRep p_hideMiniFormatter](self, "p_hideMiniFormatter");
  }
}

- (void)toggleShowingControls
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[CRLMovieRep p_isPresentingMiniFormatterOrPlayButtonVisible](self, "p_isPresentingMiniFormatterOrPlayButtonVisible"))
  {
    -[CRLMovieRep p_hideControls](self, "p_hideControls");
  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasEditor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectionPathWithInfo:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editorController"));
    objc_msgSend(v6, "setSelectionPath:", v5);

    -[CRLMovieRep p_invalidateHideControlsTimeoutTimer](self, "p_invalidateHideControlsTimeoutTimer");
    -[CRLMovieRep p_showControls](self, "p_showControls");
    -[CRLMovieRep p_showMiniFormatter](self, "p_showMiniFormatter");

  }
}

- (void)p_invalidateHideControlsTimeoutTimer
{
  NSTimer *hideControlsTimeoutTimer;

  -[NSTimer invalidate](self->_hideControlsTimeoutTimer, "invalidate");
  hideControlsTimeoutTimer = self->_hideControlsTimeoutTimer;
  self->_hideControlsTimeoutTimer = 0;

}

- (void)p_hideControlsWithDelay:(double)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  NSTimer *v8;
  NSTimer *hideControlsTimeoutTimer;
  _QWORD v10[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));
  v7 = objc_msgSend(v6, "isLassoSelectionForMixedTypeEnabledInDrawingMode");

  if (!self->_hideControlsTimeoutTimer && (v7 & 1) == 0)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000C0D0C;
    v10[3] = &unk_101234D78;
    v10[4] = self;
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v10, a3));
    hideControlsTimeoutTimer = self->_hideControlsTimeoutTimer;
    self->_hideControlsTimeoutTimer = v8;

  }
}

- (BOOL)p_isPresentingMiniFormatterOrPlayButtonVisible
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "miniFormatterPresenter"));
  v5 = objc_msgSend(v4, "isPresentingMiniFormatter");

  return v5;
}

- (BOOL)p_isMovieKnob:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;

  v3 = a3;
  v5 = objc_opt_class(CRLMovieKnob, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  return isKindOfClass & 1;
}

- (BOOL)directlyManagesVisibilityOfKnob:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[CRLMovieRep p_isMovieKnob:](self, "p_isMovieKnob:", v4))
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLMovieRep;
    v5 = -[CRLCanvasRep directlyManagesVisibilityOfKnob:](&v7, "directlyManagesVisibilityOfKnob:", v4);
  }

  return v5;
}

- (void)handleFadeOutForZoom
{
  objc_super v3;

  -[CRLMovieRep i_hidePlayButtonIndependently](self, "i_hidePlayButtonIndependently");
  v3.receiver = self;
  v3.super_class = (Class)CRLMovieRep;
  -[CRLMediaRep handleFadeOutForZoom](&v3, "handleFadeOutForZoom");
}

- (void)handleFadeInForZoom
{
  objc_super v3;

  -[CRLMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
  v3.receiver = self;
  v3.super_class = (Class)CRLMovieRep;
  -[CRLMediaRep handleFadeInForZoom](&v3, "handleFadeInForZoom");
}

- (void)didEndZooming
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self->_playerRenderable, "layer"));
  -[CRLMovieRep p_applyRoundedCornersTo:](self, "p_applyRoundedCornersTo:", v3);

}

- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[CRLMovieRep p_isMovieKnob:](self, "p_isMovieKnob:", v4))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLMovieRep;
    v5 = -[CRLCanvasRep canUseSpecializedHitRegionForKnob:](&v7, "canUseSpecializedHitRegionForKnob:", v4);
  }

  return v5;
}

- (CGPoint)positionOfPlayKnobForBounds:(CGRect)a3 viewScale:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinX;
  double MaxY;
  double MaxX;
  double v12;
  int v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MinX = CGRectGetMinX(a3);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MaxY = CGRectGetMaxY(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MaxX = CGRectGetMaxX(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v12 = CGRectGetMaxY(v20);
  v13 = sub_1003A91F4();
  v14 = MaxX - 36.0 / a4;
  if (v13)
    v15 = MaxY;
  else
    v15 = v12;
  if (v13)
    v14 = 36.0 / a4 + MinX;
  v16 = v15 - 36.0 / a4;
  result.y = v16;
  result.x = v14;
  return result;
}

- (CGPoint)positionOfStandardKnob:(id)a3 forBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGPoint result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)CRLMovieRep;
  v9 = a3;
  -[CRLCanvasRep positionOfStandardKnob:forBounds:](&v21, "positionOfStandardKnob:forBounds:", v9, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_playButtonKnob](self, "p_playButtonKnob", v21.receiver, v21.super_class));

  if (v14 == v9)
  {
    if (!-[CRLMovieRep p_playButtonFitsInFrame](self, "p_playButtonFitsInFrame"))
      -[CRLMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v15, "viewScale");
    -[CRLMovieRep positionOfPlayKnobForBounds:viewScale:](self, "positionOfPlayKnobForBounds:viewScale:", x, y, width, height, v16);
    v11 = v17;
    v13 = v18;

  }
  v19 = v11;
  v20 = v13;
  result.y = v20;
  result.x = v19;
  return result;
}

- (void)documentEditabilityDidChange
{
  void *v3;
  unsigned int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLMovieRep;
  -[CRLCanvasRep documentEditabilityDidChange](&v5, "documentEditabilityDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = objc_msgSend(v3, "editingDisabled");

  if (v4)
    -[CRLMovieRep p_teardownPlayerController](self, "p_teardownPlayerController");
  -[CRLMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
}

- (id)playButtonImage
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithSystemImageNamed:pointSize:](CRLImage, "imageWithSystemImageNamed:pointSize:", CFSTR("play.fill"), 22.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "compositedImageWithColor:alpha:blendMode:", v4, 20, 1.0));

  -[CRLMovieRep p_positionPlayButtonImage](self, "p_positionPlayButtonImage");
  return v5;
}

- (id)p_playButtonKnob
{
  CRLMovieKnob *playButtonKnob;
  CRLMovieKnob *v4;
  void *v5;
  void *v6;
  CRLMovieKnob *v7;
  CRLMovieKnob *v8;

  playButtonKnob = self->_playButtonKnob;
  if (!playButtonKnob)
  {
    v4 = [CRLMovieKnob alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep playButtonImage](self, "playButtonImage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLMovieRep CRLMovieButtonFillColor](CRLMovieRep, "CRLMovieButtonFillColor"));
    v7 = -[CRLMovieKnob initWithImage:radius:backgroundColor:onRep:](v4, "initWithImage:radius:backgroundColor:onRep:", v5, v6, self, 24.0);
    v8 = self->_playButtonKnob;
    self->_playButtonKnob = v7;

    if (!self->_isPlayable)
      -[CRLCanvasButtonKnob setEnabled:](self->_playButtonKnob, "setEnabled:", 0);
    -[CRLMovieRep p_positionPlayButtonImage](self, "p_positionPlayButtonImage");
    -[CRLMovieKnob setHidden:](self->_playButtonKnob, "setHidden:", 0);
    playButtonKnob = self->_playButtonKnob;
  }
  return playButtonKnob;
}

- (void)p_usePauseButtonKnobImage
{
  void *v3;
  id v4;

  if (!self->_playButtonShowingPause)
  {
    self->_playButtonShowingPause = 1;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLMovieRep pauseButtonImage](self, "pauseButtonImage"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_playButtonKnob](self, "p_playButtonKnob"));
    objc_msgSend(v3, "setImage:", v4);

  }
}

- (void)p_usePlayButtonKnobImage
{
  void *v3;
  id v4;

  if (self->_playButtonShowingPause)
  {
    self->_playButtonShowingPause = 0;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLMovieRep playButtonImage](self, "playButtonImage"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_playButtonKnob](self, "p_playButtonKnob"));
    objc_msgSend(v3, "setImage:", v4);

  }
}

- (void)p_hidePlayPauseButtonKnob
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_playButtonKnob](self, "p_playButtonKnob"));
  objc_msgSend(v2, "setHidden:", 1);

}

- (void)p_updateUsePlayPauseButtonToMatchIsPlaying:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[CRLMovieRep p_isLoopingSticker](self, "p_isLoopingSticker"))
  {
    -[CRLMovieRep p_hidePlayPauseButtonKnob](self, "p_hidePlayPauseButtonKnob");
  }
  else if (v3)
  {
    -[CRLMovieRep p_usePauseButtonKnobImage](self, "p_usePauseButtonKnobImage");
  }
  else
  {
    -[CRLMovieRep p_usePlayButtonKnobImage](self, "p_usePlayButtonKnobImage");
  }
}

- (void)p_positionPlayButtonImage
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob renderable](self->_playButtonKnob, "renderable"));
  objc_msgSend(v3, "bounds");
  v8 = sub_100061400(v4, v5, v6, v7);
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasButtonKnob imageRenderable](self->_playButtonKnob, "imageRenderable"));
  objc_msgSend(v11, "setPosition:", v8 + 2.88, v10);

  +[CATransaction commit](CATransaction, "commit");
}

- (void)p_positionPauseButtonImage
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob renderable](self->_playButtonKnob, "renderable"));
  objc_msgSend(v3, "bounds");
  v8 = sub_100061400(v4, v5, v6, v7);
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasButtonKnob imageRenderable](self->_playButtonKnob, "imageRenderable"));
  objc_msgSend(v11, "setPosition:", v8, v10);

  +[CATransaction commit](CATransaction, "commit");
}

- (void)p_updateUIStateForMoviePlayability
{
  AVAsset **p_assetForPlayability;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  _QWORD v16[5];

  if (!self->_didCheckPlayability)
  {
    p_assetForPlayability = &self->_assetForPlayability;
    if (!self->_assetForPlayability)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "movieAssetPayload"));

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000C18F4;
      v16[3] = &unk_10122D110;
      v16[4] = self;
      v6 = objc_retainBlock(v16);
      if (v5)
      {
        if (objc_msgSend(v5, "needsDownload"))
        {
          self->_isPlayable = 0;
          self->_didCheckPlayability = 1;
        }
        else
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "type"));
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
          v9 = +[CRLAnimatedGIFController canInitWithDataType:](CRLAnimatedGIFController, "canInitWithDataType:", v8);

          if (!v9)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "AVAssetAndReturnError:", 0));
            self->_didCheckPlayability = 1;
            objc_storeStrong((id *)p_assetForPlayability, v10);
            self->_isPlayable = 0;
            v11 = (void *)qword_101414D98;
            v13[0] = _NSConcreteStackBlock;
            v13[1] = 3221225472;
            v13[2] = sub_1000C1A14;
            v13[3] = &unk_101234DA0;
            v13[4] = self;
            v14 = v10;
            v15 = v6;
            v12 = v10;
            objc_msgSend(v11, "performAsync:", v13);

            goto LABEL_10;
          }
          self->_didCheckPlayability = 1;
          self->_isPlayable = objc_msgSend(v5, "needsDownload") ^ 1;
        }
        ((void (*)(_QWORD *))v6[2])(v6);
      }
LABEL_10:

    }
  }
}

- (void)p_stopUpdatingUIStateForMoviePlayability
{
  AVAsset *assetForPlayability;

  -[AVAsset cancelLoading](self->_assetForPlayability, "cancelLoading");
  assetForPlayability = self->_assetForPlayability;
  self->_assetForPlayability = 0;

  self->_didCheckPlayability = 0;
}

- (void)p_cancelUpdatingUIStateForMoviePlayability
{
  -[CRLMovieRep p_stopUpdatingUIStateForMoviePlayability](self, "p_stopUpdatingUIStateForMoviePlayability");
  self->_didCancelUpdatingPlayButtonVisibility = 1;
}

- (BOOL)p_shouldAllowPlaybackWhenEditingDisabled
{
  return -[CRLCanvasRep everAllowedToBeSelectedAsADrawable](self, "everAllowedToBeSelectedAsADrawable");
}

- (BOOL)p_playButtonFitsInFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  if ((objc_msgSend(v3, "isCanvasInteractive") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    -[CRLCanvasRep naturalBounds](self, "naturalBounds");
    objc_msgSend(v4, "convertUnscaledToBoundsSize:", v5, v6);
    v8 = v7;
    v10 = v9;

  }
  else
  {
    -[CRLCanvasRep naturalBounds](self, "naturalBounds");
    v8 = v11;
    v10 = v12;
  }

  return v10 >= 72.0 && v8 >= 72.0;
}

- (void)p_updatePlayButtonVisibility
{
  _BOOL4 didCancelUpdatingPlayButtonVisibility;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  unsigned int v22;
  int v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  unsigned __int8 v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  CRLMovieRep *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  unsigned int v39;
  id v40;

  v40 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  if (objc_msgSend(v40, "isCanvasInteractive"))
  {
    didCancelUpdatingPlayButtonVisibility = self->_didCancelUpdatingPlayButtonVisibility;

    if (didCancelUpdatingPlayButtonVisibility)
      return;
    v40 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "editorController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "modelsForSelectionPath:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    if (objc_msgSend(v6, "count") == (id)1)
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
    else
      v38 = 0;
    v37 = -[CRLMovieRep p_playButtonFitsInFrame](self, "p_playButtonFitsInFrame");
    if (-[CRLMovieRep p_isLoopingSticker](self, "p_isLoopingSticker"))
    {
      if (objc_msgSend(v40, "editingDisabled"))
        v8 = !-[CRLMovieRep p_shouldAllowPlaybackWhenEditingDisabled](self, "p_shouldAllowPlaybackWhenEditingDisabled");
      else
        v8 = 1;
    }
    else
    {
      v8 = 0;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layerHost"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asiOSCVC"));
    v39 = objc_msgSend(v11, "isCurrentlyInQuickSelectMode");

    v13 = objc_opt_class(CRLiOSCanvasViewController, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layerHost"));
    v16 = sub_100221D0C(v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));
    if ((objc_opt_respondsToSelector(v18, "allowsMoviePlayButton") & 1) != 0)
      v19 = objc_msgSend(v18, "allowsMoviePlayButton") ^ 1;
    else
      v19 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "editingCoordinator"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "followCoordinator"));
    v22 = objc_msgSend(v21, "isFollowing");

    v23 = 0;
    if (((v8 | v39) & 1) != 0 || (v19 & 1) != 0)
      goto LABEL_21;
    if (!self->_didCheckPlayability)
      goto LABEL_20;
    v23 = 0;
    if (-[CRLMovieRep isPlaying](self, "isPlaying") || ((v37 ^ 1) & 1) != 0)
      goto LABEL_21;
    if (!self->_isChangingDynamicVisibleTimeCount)
    {
      v35 = (CRLMovieRep *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep repForSelecting](self, "repForSelecting"));
      if (v35 == self)
      {
        v23 = 1;
      }
      else
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep repForSelecting](self, "repForSelecting"));
        if (v36)
          v23 = 0;
        else
          v23 = v22;

      }
    }
    else
    {
LABEL_20:
      v23 = 0;
    }
LABEL_21:
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_playButtonKnob](self, "p_playButtonKnob"));
    v25 = objc_msgSend(v24, "isHidden");

    if (v23 == v25)
    {
      -[CRLMovieRep p_updateUsePlayPauseButtonToMatchIsPlaying:](self, "p_updateUsePlayPauseButtonToMatchIsPlaying:", -[CRLMovieRep isPlaying](self, "isPlaying"));
      -[CRLMovieRep p_invalidateHideControlsTimeoutTimer](self, "p_invalidateHideControlsTimeoutTimer");
      v26 = v38;
      if (v23)
      {
        -[CRLMovieRep p_showControls](self, "p_showControls");
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
        objc_msgSend(v27, "invalidateContentLayersForRep:", self);

      }
      else
      {
        if (v38 == v7)
        {
          v30 = 0;
        }
        else
        {
          v28 = objc_msgSend(v38, "repClass");
          v30 = objc_msgSend(v28, "isSubclassOfClass:", objc_opt_class(CRLMovieRep, v29));
        }
        if (v37
          && (v30 & 1) == 0
          && self->_didCheckPlayability
          && ((v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_playButtonKnob](self, "p_playButtonKnob")),
               v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "renderable")),
               v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "superlayer")),
               v33,
               v32,
               v31,
               !v33)
            ? (v34 = 1)
            : (v34 = v39),
              (v34 & 1) == 0))
        {
          -[CRLMovieRep p_hideControlsWithDelay:](self, "p_hideControlsWithDelay:", 3.25);
        }
        else
        {
          -[CRLMovieRep p_hideControls](self, "p_hideControls");
        }
      }
    }
    else
    {
      v26 = v38;
      if (v23)
      {
        if (self->_hideControlsTimeoutTimer)
        {
          -[CRLMovieRep p_invalidateHideControlsTimeoutTimer](self, "p_invalidateHideControlsTimeoutTimer");
          -[CRLMovieRep p_updateUsePlayPauseButtonToMatchIsPlaying:](self, "p_updateUsePlayPauseButtonToMatchIsPlaying:", -[CRLMovieRep isPlaying](self, "isPlaying"));
        }
      }
    }
    -[CRLMediaRep updateSpatialLabel](self, "updateSpatialLabel");

  }
}

- (CRLMediaPlayerController)playerControllerForcingCreationIfNotPreExisting
{
  -[CRLMovieRep p_setupPlayerControllerIfNecessary](self, "p_setupPlayerControllerIfNecessary");
  return self->_playerController;
}

- (void)pausePlaybackIfNeeded
{
  if (-[CRLMovieRep isPlaying](self, "isPlaying"))
    -[CRLMovieRep p_togglePlaying](self, "p_togglePlaying");
}

- (void)stopPlaybackIfNeeded
{
  void *v3;

  if (!-[CRLMovieRep p_isLoopingSticker](self, "p_isLoopingSticker"))
  {
    if (self->_playerController)
    {
      -[CRLMovieRep p_setNeedsTeardownPlayerControllerOnUpdateRenderable](self, "p_setNeedsTeardownPlayerControllerOnUpdateRenderable");
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v3, "invalidateContentLayersForRep:", self);

    }
    -[CRLMovieRep p_invalidateHideControlsTimeoutTimer](self, "p_invalidateHideControlsTimeoutTimer");
  }
}

- (void)playerController:(id)a3 playbackDidFailWithError:(id)a4
{
  id v5;
  __CFRunLoop *Main;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  CRLMovieRep *v11;
  id v12;

  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_1000C233C;
  v10 = &unk_10122D3D8;
  v11 = self;
  v12 = a4;
  v5 = v12;
  Main = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, kCFRunLoopDefaultMode, &v7);
  CFRunLoopWakeUp(Main);
  -[CRLMovieRep p_updateUsePlayPauseButtonToMatchIsPlaying:](self, "p_updateUsePlayPauseButtonToMatchIsPlaying:", 0, v7, v8, v9, v10, v11);
  -[CRLMovieRep p_invalidateHideControlsTimeoutTimer](self, "p_invalidateHideControlsTimeoutTimer");

}

- (void)playbackDidStopForPlayerController:(id)a3
{
  id v4;

  -[CRLMovieRep p_setNeedsTeardownPlayerControllerOnUpdateRenderable](self, "p_setNeedsTeardownPlayerControllerOnUpdateRenderable", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v4, "invalidateContentLayersForRep:", self);

}

- (id)nowPlayingTitleWithPlaybackController:(id)a3
{
  void *v3;
  void *v4;

  if (self->_playerController == a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)nowPlayingImageProviderWithPlaybackController:(id)a3
{
  if (self->_playerController == a3)
    return (id)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_posterImageProvider](self, "p_posterImageProvider"));
  else
    return 0;
}

- (BOOL)isPlaying
{
  CRLCanvasRenderableMediaPlayerController *playerController;

  playerController = self->_playerController;
  if (playerController)
    LOBYTE(playerController) = -[CRLCanvasRenderableMediaPlayerController isPlaying](playerController, "isPlaying");
  return (char)playerController;
}

- (void)p_playTriggeredFromKnob
{
  void *v3;

  if (-[CRLMovieRep isPlayable](self, "isPlayable"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep playerControllerForcingCreationIfNotPreExisting](self, "playerControllerForcingCreationIfNotPreExisting"));
    objc_msgSend(v3, "setPlaying:", 1);

    -[CRLMovieRep p_updateUsePlayPauseButtonToMatchIsPlaying:](self, "p_updateUsePlayPauseButtonToMatchIsPlaying:", 1);
    -[CRLMovieRep p_updateLoopingSettingForMoviePlaybackIfNeeded](self, "p_updateLoopingSettingForMoviePlaybackIfNeeded");
  }
}

- (void)p_pauseTriggeredFromKnob
{
  -[CRLMovieRep pausePlaybackIfNeeded](self, "pausePlaybackIfNeeded");
}

- (void)i_togglePlayPauseTriggeredFromKnob
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;

  if (!-[CRLCanvasRep isSelected](self, "isSelected"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasEditor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPathWithInfo:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
    objc_msgSend(v7, "setSelectionPath:", v6);

  }
  if (-[CRLMovieRep isPlaying](self, "isPlaying"))
    -[CRLMovieRep p_pauseTriggeredFromKnob](self, "p_pauseTriggeredFromKnob");
  else
    -[CRLMovieRep p_playTriggeredFromKnob](self, "p_playTriggeredFromKnob");
  v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "freehandDrawingToolkit"));
  v9 = objc_msgSend(v8, "isLassoSelectionForMixedTypeEnabledInDrawingMode");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvasEditor"));
    objc_msgSend(v10, "hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected");

  }
}

- (void)p_togglePlaying
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[CRLMovieRep isPlayable](self, "isPlayable"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep playerControllerForcingCreationIfNotPreExisting](self, "playerControllerForcingCreationIfNotPreExisting"));
    v4 = objc_msgSend(v3, "isPlaying") ^ 1;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep playerControllerForcingCreationIfNotPreExisting](self, "playerControllerForcingCreationIfNotPreExisting"));
    objc_msgSend(v5, "setPlaying:", v4);

    -[CRLMovieRep p_updateUsePlayPauseButtonToMatchIsPlaying:](self, "p_updateUsePlayPauseButtonToMatchIsPlaying:", v4);
    -[CRLMovieRep p_invalidateHideControlsTimeoutTimer](self, "p_invalidateHideControlsTimeoutTimer");
  }
}

- (void)updateUI_toMatchPlayer
{
  void *v3;
  _BOOL8 v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep playerControllerForcingCreationIfNotPreExisting](self, "playerControllerForcingCreationIfNotPreExisting"));
  objc_msgSend(v3, "updatePlayingToMatchPlayer");

  v4 = -[CRLMovieRep isPlaying](self, "isPlaying");
  self->_playerLayerShouldBeDisplayed = v4;
  -[CRLMovieRep p_updateUsePlayPauseButtonToMatchIsPlaying:](self, "p_updateUsePlayPauseButtonToMatchIsPlaying:", v4);
  -[CRLMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v5, "invalidateContentLayersForRep:", self);

}

- (BOOL)p_shouldPlayerControllerExistThroughoutSelection
{
  return 0;
}

- (void)p_setupPlayerControllerIfNecessary
{
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
  unsigned int v16;
  CRLAnimatedGIFController *v17;
  CRLCanvasRenderableMediaPlayerController *playerController;
  void *v19;
  void *v20;
  void *v21;
  CRLAVPlayerController *v22;
  CRLCanvasRenderableMediaPlayerController *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  CRLCanvasRenderableMediaPlayerController *v27;
  void *v28;
  double v29;
  double v30;
  NSObject *v31;
  NSObject *observationTokenForPlayingStatus;
  void *v33;
  id v34;
  void *v35;
  CRLCanvasRenderableMediaPlayerController *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  CRLMovieRep *v40;
  uint8_t buf[4];
  CRLMovieRep *v42;
  __int16 v43;
  CRLCanvasRenderableMediaPlayerController *v44;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234DE8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF5C94();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234E08);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep p_setupPlayerControllerIfNecessary]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1752, 0, "This operation must only be performed on the main thread.");

  }
  if (!self->_playerController)
  {
    if (!self->_isPlayable)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101234E28);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF5C14();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101234E48);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep p_setupPlayerControllerIfNecessary]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1754, 0, "Setting up player controller when movie isn't playable!");

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "movieAssetPayload"));

    if (objc_msgSend(v10, "needsDownload"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101234E68);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF5B94();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101234E88);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep p_setupPlayerControllerIfNecessary]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1756, 0, "Setting up player controller for data that needs to be downloaded!");

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
    v16 = +[CRLAnimatedGIFController canInitWithDataType:](CRLAnimatedGIFController, "canInitWithDataType:", v15);

    if (v16)
    {
      -[CRLMovieRep willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("playerController"));
      v17 = -[CRLAnimatedGIFController initWithData:delegate:]([CRLAnimatedGIFController alloc], "initWithData:delegate:", v10, self);
      playerController = self->_playerController;
      self->_playerController = (CRLCanvasRenderableMediaPlayerController *)v17;

      -[CRLMovieRep didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("playerController"));
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "makeAVAssetAndReturnError:", 0));

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", v20));
        -[CRLMovieRep willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("playerController"));
        v22 = -[CRLAVPlayerController initWithPlayerItem:delegate:]([CRLAVPlayerController alloc], "initWithPlayerItem:delegate:", v21, self);
        v23 = self->_playerController;
        self->_playerController = (CRLCanvasRenderableMediaPlayerController *)v22;

        -[CRLMovieRep didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("playerController"));
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101234EA8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF5B08();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101234EC8);
        v24 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v24);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep p_setupPlayerControllerIfNecessary]"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v25, 1763, 0, "invalid nil value for '%{public}s'", "asset");

      }
    }
    if (qword_10147E5C8 != -1)
      dispatch_once(&qword_10147E5C8, &stru_101234EE8);
    v26 = off_1013DB560;
    if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
    {
      v27 = self->_playerController;
      *(_DWORD *)buf = 134218240;
      v42 = self;
      v43 = 2048;
      v44 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "movie rep %p creating player controller %p", buf, 0x16u);
    }
    -[CRLMovieRep p_updateStartTime](self, "p_updateStartTime");
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    objc_msgSend(v28, "endTime");
    v30 = v29;

    if (v30 != 0.0)
      -[CRLMovieRep p_updateEndTime](self, "p_updateEndTime");
    -[CRLMovieRep p_updateVolume](self, "p_updateVolume");
    v31 = objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderableMediaPlayerController crl_addObserver:forKeyPath:options:context:](self->_playerController, "crl_addObserver:forKeyPath:options:context:", self, CFSTR("playing"), 4, off_1013D92D8));
    observationTokenForPlayingStatus = self->_observationTokenForPlayingStatus;
    self->_observationTokenForPlayingStatus = v31;

    -[CRLCanvasRenderableMediaPlayerController addObservationToken:](self->_playerController, "addObservationToken:", self->_observationTokenForPlayingStatus);
    -[CRLMovieRep p_setupPlayerLayerIfNecessary](self, "p_setupPlayerLayerIfNecessary");
    v39 = CFSTR("CRLInteractiveCanvasControllerMediaRepKey");
    v40 = self;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
    v34 = objc_msgSend(v33, "mutableCopy");
    v35 = v34;
    v36 = self->_playerController;
    if (v36)
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v36, CFSTR("CRLInteractiveCanvasControllerPlayerControllerKey"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v37, "postNotificationName:object:userInfo:", CFSTR("CRLInteractiveCanvasControllerDidUpdateMoviePlayerControllerNotification"), v38, v35);

  }
}

- (void)p_teardownPlayerController
{
  void *v3;
  void *v4;
  void *v5;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234F08);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF5D14();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234F28);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep p_teardownPlayerController]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1801, 0, "This operation must only be performed on the main thread.");

  }
  -[CRLMovieRep p_setNeedsTeardownPlayerControllerOnUpdateRenderable](self, "p_setNeedsTeardownPlayerControllerOnUpdateRenderable");
  -[CRLMovieRep p_teardownPlayerControllerIfNeeded](self, "p_teardownPlayerControllerIfNeeded");
}

- (void)p_setNeedsTeardownPlayerControllerOnUpdateRenderable
{
  self->_needsTeardownPlayerController = 1;
}

- (void)p_teardownPlayerControllerIfNeeded
{
  unint64_t isChangingDynamicVisibleTimeCount;
  int *v4;
  CRLCanvasRenderableMediaPlayerController *playerController;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  CRLCanvasRenderableMediaPlayerController *v10;
  unsigned int v11;
  CRLCanvasRenderableMediaPlayerController *v12;
  NSObject *observationTokenForPlayingStatus;
  uint64_t v14;
  objc_class *v15;
  id v16;
  void *v17;
  NSObject *v18;
  CRLCanvasRenderableMediaPlayerController *v19;
  CRLCanvasRenderableMediaPlayerController *v20;
  CRLCanvasRenderable *renderableToStroke;
  CRLCanvasRenderable *playerRenderable;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  CRLMovieRep *v27;
  uint8_t buf[4];
  CRLMovieRep *v29;
  __int16 v30;
  CRLCanvasRenderableMediaPlayerController *v31;

  isChangingDynamicVisibleTimeCount = self->_isChangingDynamicVisibleTimeCount;
  if (isChangingDynamicVisibleTimeCount && self->_needsTeardownPlayerController)
  {
    LOBYTE(isChangingDynamicVisibleTimeCount) = 1;
    v4 = &OBJC_IVAR___CRLMovieRep__delayTearingDownPlayerController;
LABEL_33:
    *((_BYTE *)&self->super.super.super.super.isa + *v4) = isChangingDynamicVisibleTimeCount;
    goto LABEL_34;
  }
  playerController = self->_playerController;
  if (playerController && self->_needsTeardownPlayerController)
  {
    if (self->_delayTearingDownPlayerController)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101234F48);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF5D94();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101234F68);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep p_teardownPlayerControllerIfNeeded]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1815, 0, "Attempting to tear down the player controller with inconsistent flag/dynamic time state");

      playerController = self->_playerController;
    }
    v9 = -[CRLCanvasRenderableMediaPlayerController isPlaying](playerController, "isPlaying");
    v10 = self->_playerController;
    if (v9)
    {
      -[CRLCanvasRenderableMediaPlayerController setPlaying:](v10, "setPlaying:", 0);
    }
    else
    {
      v11 = -[CRLCanvasRenderableMediaPlayerController isFastReversing](v10, "isFastReversing");
      v12 = self->_playerController;
      if (v11)
      {
        -[CRLCanvasRenderableMediaPlayerController setFastReversing:](v12, "setFastReversing:", 0);
      }
      else if (-[CRLCanvasRenderableMediaPlayerController isFastForwarding](v12, "isFastForwarding"))
      {
        -[CRLCanvasRenderableMediaPlayerController setFastForwarding:](self->_playerController, "setFastForwarding:", 0);
      }
    }
    -[CRLCanvasRenderableMediaPlayerController crl_removeObserverForToken:](self->_playerController, "crl_removeObserverForToken:", self->_observationTokenForPlayingStatus);
    -[CRLCanvasRenderableMediaPlayerController removeObservationToken:](self->_playerController, "removeObservationToken:", self->_observationTokenForPlayingStatus);
    observationTokenForPlayingStatus = self->_observationTokenForPlayingStatus;
    self->_observationTokenForPlayingStatus = 0;

    if (self->_currentlyObservingPlayerLayer)
    {
      v15 = (objc_class *)objc_opt_class(CRLAVPlayerRenderable, v14);
      v16 = sub_1002223BC(v15, self->_playerRenderable);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      objc_msgSend(v17, "removeReadyToDisplayObserver:context:", self, off_1013D92D0);

    }
    -[CRLMovieRep willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("playerController"));
    -[CRLCanvasRenderableMediaPlayerController teardown](self->_playerController, "teardown");
    if (qword_10147E5C8 != -1)
      dispatch_once(&qword_10147E5C8, &stru_101234F88);
    v18 = off_1013DB560;
    if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
    {
      v19 = self->_playerController;
      *(_DWORD *)buf = 134218240;
      v29 = self;
      v30 = 2048;
      v31 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "movie rep %p clearing player controller %p in p_teardownPlayerController", buf, 0x16u);
    }
    v20 = self->_playerController;
    self->_playerController = 0;

    -[CRLMovieRep didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("playerController"));
    self->_playerLayerShouldBeDisplayed = 0;
    if (-[CRLCanvasRenderable isEqual:](self->_renderableToStroke, "isEqual:", self->_playerRenderable))
    {
      renderableToStroke = self->_renderableToStroke;
      self->_renderableToStroke = 0;

    }
    -[CRLMovieRep p_invalidateHideControlsTimeoutTimer](self, "p_invalidateHideControlsTimeoutTimer");
    -[CRLMovieRep p_updateUsePlayPauseButtonToMatchIsPlaying:](self, "p_updateUsePlayPauseButtonToMatchIsPlaying:", 0);
    -[CRLCanvasRenderable setDelegate:](self->_playerRenderable, "setDelegate:", 0);
    playerRenderable = self->_playerRenderable;
    self->_playerRenderable = 0;

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v26 = CFSTR("CRLInteractiveCanvasControllerMediaRepKey");
    v27 = self;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    objc_msgSend(v23, "postNotificationName:object:userInfo:", CFSTR("CRLInteractiveCanvasControllerDidUpdateMoviePlayerControllerNotification"), v24, v25);

    isChangingDynamicVisibleTimeCount = self->_isChangingDynamicVisibleTimeCount;
  }
  if (!isChangingDynamicVisibleTimeCount)
  {
    v4 = &OBJC_IVAR___CRLMovieRep__needsTeardownPlayerController;
    goto LABEL_33;
  }
LABEL_34:
  -[CRLMediaRep updateSpatialLabel](self, "updateSpatialLabel");
}

- (void)p_updateVolume
{
  int v3;
  int v4;
  double v5;
  id v6;

  if (self->_playerController)
  {
    -[CRLMovieRep volume](self, "volume");
    v4 = v3;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLMovieRep playerControllerForcingCreationIfNotPreExisting](self, "playerControllerForcingCreationIfNotPreExisting"));
    LODWORD(v5) = v4;
    objc_msgSend(v6, "setVolume:", v5);

  }
}

- (void)p_updateStartTime
{
  void *v3;
  double v4;
  double v5;
  id v6;

  if (self->_playerController)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    objc_msgSend(v3, "startTime");
    v5 = v4;

    v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLMovieRep playerControllerForcingCreationIfNotPreExisting](self, "playerControllerForcingCreationIfNotPreExisting"));
    objc_msgSend(v6, "setStartTime:", v5);

  }
}

- (void)p_updateEndTime
{
  void *v3;
  double v4;
  double v5;
  id v6;

  if (self->_playerController)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    objc_msgSend(v3, "endTime");
    v5 = v4;

    v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLMovieRep playerControllerForcingCreationIfNotPreExisting](self, "playerControllerForcingCreationIfNotPreExisting"));
    objc_msgSend(v6, "setEndTime:", v5);

  }
}

- (void)p_startOrStopLoopingStickerIfNecessary
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  CRLCanvasRenderableMediaPlayerController *playerController;
  _BOOL4 v12;
  int v13;
  void *v14;
  void *v15;
  id v16;

  v16 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  if ((objc_msgSend(v16, "isCanvasInteractive") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    v4 = objc_msgSend(v3, "isAnimatedImage");

    if (v4)
    {
      if (self->_isPlayable)
      {
        if (!+[NSThread isMainThread](NSThread, "isMainThread"))
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101234FA8);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DF5E14();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101234FC8);
          v5 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep p_startOrStopLoopingStickerIfNecessary]"));
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1903, 0, "This operation must only be performed on the main thread.");

        }
        if (self->_currentlyDrawingPencilKitStroke)
        {
          v8 = 0;
        }
        else
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
          v8 = objc_msgSend(v9, "isLooping");

        }
        v10 = -[CRLMovieRep isPlaying](self, "isPlaying");
        playerController = self->_playerController;
        if (playerController)
          v12 = -[CRLCanvasRenderableMediaPlayerController repeatMode](playerController, "repeatMode") != (id)1;
        else
          v12 = 1;
        v13 = v10 ^ 1 | v12;
        if (v8)
        {
          if (v13)
          {
            -[CRLMovieRep p_setupPlayerControllerIfNecessary](self, "p_setupPlayerControllerIfNecessary");
            -[CRLCanvasRenderableMediaPlayerController setRepeatMode:](self->_playerController, "setRepeatMode:", 1);
            -[CRLCanvasRenderableMediaPlayerController setPlaying:](self->_playerController, "setPlaying:", 1);
            self->_playerLayerShouldBeDisplayed = 1;
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "renderableForRep:", self));
            -[CRLMovieRep p_arrangeRenderableVisibility:](self, "p_arrangeRenderableVisibility:", v15);

          }
        }
        else if ((v13 & 1) == 0)
        {
          -[CRLMovieRep stopPlaybackIfNeeded](self, "stopPlaybackIfNeeded");
          -[CRLMovieRep p_showControls](self, "p_showControls");
        }
      }
      else
      {
        -[CRLMovieRep p_updateUIStateForMoviePlayability](self, "p_updateUIStateForMoviePlayability");
      }
    }
  }
  else
  {

  }
}

- (void)p_updateLoopingSettingForMoviePlaybackIfNeeded
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned int v6;

  if (self->_playerController)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    v4 = objc_msgSend(v3, "isAnimatedImage");

    if ((v4 & 1) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
      v6 = objc_msgSend(v5, "isLooping");

      -[CRLCanvasRenderableMediaPlayerController setRepeatMode:](self->_playerController, "setRepeatMode:", v6);
    }
  }
}

- (BOOL)p_isLoopingSticker
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
  if (objc_msgSend(v3, "isAnimatedImage"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    v5 = objc_msgSend(v4, "isLooping");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)additionalRenderablesOverRenderable
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc_init((Class)NSMutableArray);
  -[CRLMovieRep p_startOrStopLoopingStickerIfNecessary](self, "p_startOrStopLoopingStickerIfNecessary");
  if (self->_playerRenderable)
    objc_msgSend(v3, "addObject:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep p_playerStrokeRenderable](self, "p_playerStrokeRenderable"));
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  v8.receiver = self;
  v8.super_class = (Class)CRLMovieRep;
  v5 = -[CRLMediaRep additionalRenderablesOverRenderable](&v8, "additionalRenderablesOverRenderable");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  return v3;
}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLMovieRep;
  -[CRLStyledRep setNeedsDisplay](&v3, "setNeedsDisplay");
  -[CRLMovieRep p_disposeStrokeRenderable](self, "p_disposeStrokeRenderable");
}

- (void)p_listenForAssetChangesIfAppropriate
{
  NSUUID *downloadObserverIdentifier;
  void *v4;
  void *v5;
  void *v6;
  NSUUID *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];

  downloadObserverIdentifier = self->_downloadObserverIdentifier;
  if (!downloadObserverIdentifier)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101234FE8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF5E94();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235008);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep p_listenForAssetChangesIfAppropriate]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1977, 0, "invalid nil value for '%{public}s'", "_downloadObserverIdentifier");

    downloadObserverIdentifier = self->_downloadObserverIdentifier;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000C4040;
  v13[3] = &unk_101235058;
  v13[4] = self;
  v13[5] = downloadObserverIdentifier;
  v7 = downloadObserverIdentifier;
  v8 = objc_retainBlock(v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "movieAssetPayload"));
  ((void (*)(_QWORD *, void *))v8[2])(v8, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "posterImageAssetPayload"));
  ((void (*)(_QWORD *, void *))v8[2])(v8, v12);

}

- (void)p_handleAssetPreparationCompletionForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  CRLMovieRep *v14;

  v4 = a3;
  if (!-[CRLCanvasRep hasBeenRemoved](self, "hasBeenRemoved"))
  {
    -[CRLMovieRep setNeedsDisplay](self, "setNeedsDisplay");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v5, "invalidateContentLayersForRep:", self);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "movieAssetPayload"));

    if (v7 == v4)
    {
      -[CRLMovieRep p_stopUpdatingUIStateForMoviePlayability](self, "p_stopUpdatingUIStateForMoviePlayability");
      -[CRLMovieRep p_updateUIStateForMoviePlayability](self, "p_updateUIStateForMoviePlayability");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      v13 = CFSTR("CRLInteractiveCanvasControllerMediaRepKey");
      v14 = self;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
      objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("CRLInteractiveCanvasControllerDidLoadAssetForMediaRepNotification"), v11, v12);

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "posterImageAssetPayload"));

      if (v9 == v4)
        -[CRLMovieRep p_showControls](self, "p_showControls");
    }
    -[CRLMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
  }

}

- (id)visuallySignificantDataSet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "posterImageAssetPayload"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "movieAssetPayload"));

  v7 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 2);
  v8 = v7;
  if (v4)
    objc_msgSend(v7, "addObject:", v4);
  if (v6)
    objc_msgSend(v8, "addObject:", v6);
  if (objc_msgSend(v8, "count"))
    v9 = v8;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v10 = v9;

  return v10;
}

- (BOOL)shouldShowLoadingUI
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "posterImageAssetPayload"));
  if (objc_msgSend(v4, "needsDownload"))
    v5 = !self->_playerLayerShouldBeDisplayed;
  else
    v5 = 0;

  return v5;
}

- (id)dynamicResizeDidBegin
{
  id v3;
  objc_super v5;

  -[CRLMovieRep p_disposeStrokeRenderable](self, "p_disposeStrokeRenderable");
  v5.receiver = self;
  v5.super_class = (Class)CRLMovieRep;
  v3 = -[CRLCanvasRep dynamicResizeDidBegin](&v5, "dynamicResizeDidBegin");
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CRLMovieRep p_disposeStrokeRenderable](self, "p_disposeStrokeRenderable");
  v5.receiver = self;
  v5.super_class = (Class)CRLMovieRep;
  -[CRLCanvasRep dynamicResizeDidEndWithTracker:](&v5, "dynamicResizeDidEndWithTracker:", v4);

}

- (id)resizedGeometryForTransform:(CGAffineTransform *)a3
{
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  CGAffineTransform v9;
  CGAffineTransform t1;
  CGAffineTransform v11;

  memset(&v11, 0, sizeof(v11));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalPureGeometry"));
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "fullTransform");
  else
    memset(&t1, 0, sizeof(t1));
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v9.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v9.c = v7;
  *(_OWORD *)&v9.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v11, &t1, &v9);

  v9 = v11;
  return (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:](CRLCanvasInfoGeometry, "geometryFromFullTransform:", &v9));
}

- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3
{
  id v4;
  objc_super v5;

  -[CRLMovieRep p_disposeStrokeRenderable](self, "p_disposeStrokeRenderable", a3);
  v5.receiver = self;
  v5.super_class = (Class)CRLMovieRep;
  v4 = -[CRLCanvasRep dynamicResizeDidBegin](&v5, "dynamicResizeDidBegin");
}

- (void)dynamicFreeTransformDidEndWithTracker:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CRLMovieRep p_disposeStrokeRenderable](self, "p_disposeStrokeRenderable");
  v5.receiver = self;
  v5.super_class = (Class)CRLMovieRep;
  -[CRLCanvasRep dynamicFreeTransformDidEndWithTracker:](&v5, "dynamicFreeTransformDidEndWithTracker:", v4);

}

- (double)visibleTime
{
  void *v2;
  double v3;
  double v4;

  if (self->_isChangingDynamicVisibleTimeCount)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep playerControllerForcingCreationIfNotPreExisting](self, "playerControllerForcingCreationIfNotPreExisting"));
    objc_msgSend(v2, "absoluteCurrentTime");
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
    objc_msgSend(v2, "posterTime");
  }
  v4 = v3;

  return v4;
}

- (double)absoluteCurrentTime
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep playerControllerForcingCreationIfNotPreExisting](self, "playerControllerForcingCreationIfNotPreExisting"));
  objc_msgSend(v2, "absoluteCurrentTime");
  v4 = v3;

  return v4;
}

- (void)dynamicVisibleTimeChangeDidBegin
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t isChangingDynamicVisibleTimeCount;
  void *v7;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235078);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF5F20();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235098);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep dynamicVisibleTimeChangeDidBegin]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 2087, 0, "Dynamic poster time changes can only be made on the main thread");

  }
  isChangingDynamicVisibleTimeCount = self->_isChangingDynamicVisibleTimeCount;
  self->_isChangingDynamicVisibleTimeCount = isChangingDynamicVisibleTimeCount + 1;
  if (!isChangingDynamicVisibleTimeCount)
  {
    -[CRLMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep playerControllerForcingCreationIfNotPreExisting](self, "playerControllerForcingCreationIfNotPreExisting"));
    objc_msgSend(v7, "beginScrubbing");

  }
}

- (void)dynamicVisibleTimeUpdateToValue:(double)a3 withTolerance:(double)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a5;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012350B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF6020();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012350D8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep dynamicVisibleTimeUpdateToValue:withTolerance:completionHandler:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 2097, 0, "Dynamic poster time changes can only be made on the main thread");

  }
  if (!self->_isChangingDynamicVisibleTimeCount)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012350F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF5FA0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235118);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep dynamicVisibleTimeUpdateToValue:withTolerance:completionHandler:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 2098, 0, "A dynamic poster time change must be in progress");

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep playerControllerForcingCreationIfNotPreExisting](self, "playerControllerForcingCreationIfNotPreExisting"));
  objc_msgSend(v15, "scrubToTime:withTolerance:completionHandler:", v8, a3, a4);

}

- (void)dynamicVisibleTimeChangeDidEnd
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t isChangingDynamicVisibleTimeCount;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235138);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF6120();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235158);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep dynamicVisibleTimeChangeDidEnd]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 2104, 0, "Dynamic poster time changes can only be made on the main thread");

  }
  isChangingDynamicVisibleTimeCount = self->_isChangingDynamicVisibleTimeCount;
  if (!isChangingDynamicVisibleTimeCount)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235178);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF60A0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101235198);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieRep dynamicVisibleTimeChangeDidEnd]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 2105, 0, "Mismatch between starting and ending dynamic visible poster time changes");

    isChangingDynamicVisibleTimeCount = self->_isChangingDynamicVisibleTimeCount;
  }
  v10 = isChangingDynamicVisibleTimeCount - 1;
  self->_isChangingDynamicVisibleTimeCount = v10;
  if (!v10)
  {
    -[CRLCanvasRenderableMediaPlayerController cancelPendingSeeks](self->_playerController, "cancelPendingSeeks");
    -[CRLCanvasRenderableMediaPlayerController endScrubbing](self->_playerController, "endScrubbing");
    -[CRLMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
    if (self->_delayTearingDownPlayerController)
    {
      self->_delayTearingDownPlayerController = 0;
      -[CRLMovieRep p_teardownPlayerController](self, "p_teardownPlayerController");
    }
  }
}

- (float)volume
{
  void *v3;
  float v4;
  float v5;

  if (self->_isChangingDynamicVolume)
    return self->_dynamicVolume;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieRep movieItem](self, "movieItem"));
  objc_msgSend(v3, "volume");
  v5 = v4;

  return v5;
}

- (void)dynamicVolumeChangeDidBegin
{
  float v3;

  -[CRLMovieRep volume](self, "volume");
  self->_dynamicVolume = v3;
  self->_isChangingDynamicVolume = 1;
}

- (void)dynamicVolumeUpdateToValue:(float)a3
{
  self->_dynamicVolume = a3;
  -[CRLMovieRep p_updateVolume](self, "p_updateVolume");
}

- (void)dynamicVolumeChangeDidEnd
{
  self->_isChangingDynamicVolume = 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  objc_class *v17;
  id v18;
  void *v19;
  void *v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (off_1013D92D8 == a6)
  {
    -[CRLMovieRep p_updatePlayButtonVisibility](self, "p_updatePlayButtonVisibility");
    -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  }
  else if (off_1013D92D0 == a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", NSKeyValueChangeNewKey));
    v15 = objc_msgSend(v14, "BOOLValue");

    if (v15)
    {
      v17 = (objc_class *)objc_opt_class(CRLAVPlayerRenderable, v16);
      v18 = sub_1002223BC(v17, self->_playerRenderable);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      objc_msgSend(v19, "removeReadyToDisplayObserver:context:", self, off_1013D92D0);
      self->_currentlyObservingPlayerLayer = 0;
      self->_playerLayerShouldBeDisplayed = 1;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v20, "invalidateContentLayersForRep:", self);

    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)CRLMovieRep;
    -[CRLMovieRep observeValueForKeyPath:ofObject:change:context:](&v21, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

+ (id)CRLMovieButtonFillColor
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1000C5308;
  v10 = sub_1000C5318;
  v11 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 1));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C5320;
  v5[3] = &unk_1012351C0;
  v5[4] = &v6;
  +[UITraitCollection crl_withTraitCollectionAsCurrent:performBlock:](UITraitCollection, "crl_withTraitCollectionAsCurrent:performBlock:", v2, v5);
  v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  _BOOL4 v5;

  if (-[CRLMovieRep noKnobTogglePlayAndMiniFormatter](self, "noKnobTogglePlayAndMiniFormatter", a4, a3.x, a3.y))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = -[CRLMovieRep isPlaying](self, "isPlaying");
    if (v5)
    {
      -[CRLMovieRep toggleShowingControls](self, "toggleShowingControls");
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  -[CRLMovieRep enterPreviewMode](self, "enterPreviewMode", a4, a3.x, a3.y);
  return 1;
}

- (void)willBeginEyedropperMode
{
  objc_super v3;

  if (-[CRLMovieRep isPlaying](self, "isPlaying"))
  {
    -[CRLMovieRep p_togglePlaying](self, "p_togglePlaying");
    -[CRLMovieRep p_setNeedsTeardownPlayerControllerOnUpdateRenderable](self, "p_setNeedsTeardownPlayerControllerOnUpdateRenderable");
  }
  v3.receiver = self;
  v3.super_class = (Class)CRLMovieRep;
  -[CRLCanvasRep willBeginEyedropperMode](&v3, "willBeginEyedropperMode");
}

- (void)prepareForPencilKitSnapshotting
{
  -[CRLMovieRep p_stopPlaybackForPencilKitIfNeeded](self, "p_stopPlaybackForPencilKitIfNeeded");
}

- (void)didBeginPencilKitStroke
{
  self->_currentlyDrawingPencilKitStroke = 1;
  -[CRLMovieRep p_stopPlaybackForPencilKitIfNeeded](self, "p_stopPlaybackForPencilKitIfNeeded");
}

- (void)p_stopPlaybackForPencilKitIfNeeded
{
  void *v3;
  id v4;

  if (-[CRLMovieRep isPlaying](self, "isPlaying"))
    -[CRLMovieRep p_togglePlaying](self, "p_togglePlaying");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderableForRep:", self));
  self->_playerLayerShouldBeDisplayed = 0;
  -[CRLMovieRep p_arrangeRenderableVisibility:](self, "p_arrangeRenderableVisibility:", v3);
  -[CRLMovieRep p_teardownPlayerController](self, "p_teardownPlayerController");

}

- (void)didFinishPencilKitStroke
{
  void *v3;
  id v4;

  self->_currentlyDrawingPencilKitStroke = 0;
  if (-[CRLMovieRep p_isLoopingSticker](self, "p_isLoopingSticker"))
  {
    self->_playerLayerShouldBeDisplayed = 1;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderableForRep:", self));
    -[CRLMovieRep p_arrangeRenderableVisibility:](self, "p_arrangeRenderableVisibility:", v3);
    -[CRLMovieRep p_startOrStopLoopingStickerIfNecessary](self, "p_startOrStopLoopingStickerIfNecessary");

  }
}

- (BOOL)isPlayable
{
  return self->_isPlayable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadObserverIdentifier, 0);
  objc_storeStrong((id *)&self->_hideControlsTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_playButtonKnob, 0);
  objc_storeStrong((id *)&self->_observationTokenForPlayingStatus, 0);
  objc_storeStrong((id *)&self->_assetForPlayability, 0);
  objc_storeStrong((id *)&self->_playerStrokeRenderable, 0);
  objc_storeStrong((id *)&self->_renderableToStroke, 0);
  objc_storeStrong((id *)&self->_playerRenderable, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
}

- (BOOL)wantsToHandleDoubleTapsWhenLocked
{
  return 1;
}

- (void)prepareForPreview
{
  CRLMovieRep *v2;

  v2 = self;
  if (-[CRLMovieRep isPlaying](v2, "isPlaying"))
    -[CRLMovieRep pausePlaybackIfNeeded](v2, "pausePlaybackIfNeeded");

}

- (void)enterPreviewMode
{
  CRLMovieRep *v2;

  v2 = self;
  -[CRLMovieRep prepareForPreview](v2, "prepareForPreview");
  sub_100D469E8();

}

@end
