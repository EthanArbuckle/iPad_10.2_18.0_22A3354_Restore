@implementation CRLAudioRep

- (CRLAudioRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v6;
  CRLAudioRep *v7;
  CRLAudioRep *v8;
  void *v9;
  NSUUID *v10;
  NSUUID *downloadObserverIdentifier;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CRLAudioRep;
  v7 = -[CRLCanvasRep initWithLayout:canvas:](&v13, "initWithLayout:canvas:", a3, v6);
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](v7, "movieItem"));

    if (v9)
    {
      v10 = (NSUUID *)objc_alloc_init((Class)NSUUID);
      downloadObserverIdentifier = v8->_downloadObserverIdentifier;
      v8->_downloadObserverIdentifier = v10;

      if (objc_msgSend(v6, "isCanvasInteractive"))
        -[CRLAudioRep p_listenForAssetChangesIfAppropriate](v8, "p_listenForAssetChangesIfAppropriate");
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
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLMovieItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return (_TtC8Freeform12CRLMovieItem *)v8;
}

- (id)imageProviderForAlbumArt
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "posterImageAssetPayload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
  if (v3)
  {
    *(_QWORD *)&v6 = objc_opt_class(CRLBitmapImageProvider, v4).n128_u64[0];
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "providerForAsset:shouldValidate:", v3, 1, v6));
    v10 = sub_100221D0C(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)hasAlbumArt
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep imageProviderForAlbumArt](self, "imageProviderForAlbumArt"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)drawAlbumArtInContext:(CGContext *)a3 rect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep imageProviderForAlbumArt](self, "imageProviderForAlbumArt"));
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "drawImageInContext:rect:", a3, x, y, width, height);

  return v10 != 0;
}

- (double)p_unscaledPlayButtonAndMinPaddingHeight
{
  double v2;

  -[CRLAudioRep p_playButtonSize](self, "p_playButtonSize");
  return v2 + 20.0;
}

- (double)p_playButtonAndMinPaddingHeight:(BOOL)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;

  -[CRLAudioRep p_unscaledPlayButtonAndMinPaddingHeight](self, "p_unscaledPlayButtonAndMinPaddingHeight");
  v6 = v5;
  if (!a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v7, "convertUnscaledToBoundsLength:", v6);
    v6 = v8;

  }
  return v6;
}

- (double)p_playButtonAndTitleHeightWithRepSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;

  height = a3.height;
  width = a3.width;
  -[CRLAudioRep p_playButtonAndMinPaddingHeight:](self, "p_playButtonAndMinPaddingHeight:", 1);
  v7 = v6;
  if (!-[CRLAudioRep hasAlbumArt](self, "hasAlbumArt"))
  {
    -[CRLAudioRep p_titleTextHeightWithSize:](self, "p_titleTextHeightWithSize:", width, height);
    return v7 + v8;
  }
  return v7;
}

- (BOOL)i_playButtonFitsInFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[CRLCanvasRep naturalBounds](self, "naturalBounds");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v7, "convertUnscaledToBoundsSize:", v4, v6);
  v9 = v8;
  v11 = v10;

  -[CRLAudioRep p_playButtonAndTitleHeightWithRepSize:](self, "p_playButtonAndTitleHeightWithRepSize:", v9, v11);
  return v12 <= v11;
}

- (void)drawInContext:(CGContext *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  float v15;
  void *v16;
  unsigned __int8 v17;
  unsigned int v18;
  CRLAngleGradientFill *v19;
  void *v20;
  void *v21;
  CRLAngleGradientFill *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
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
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  void *v57;
  void *v58;
  CGImage *v59;
  void *v60;
  void *v61;
  unsigned int v62;
  void *v63;
  void *v64;
  id v65;
  _QWORD v66[10];
  char v67;
  CGRect v68;
  CGRect v69;

  v65 = (id)objc_claimAutoreleasedReturnValue(-[CRLMediaRep mediaLayout](self, "mediaLayout"));
  objc_msgSend(v65, "boundsForStandardKnobs");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  CGContextSaveGState(a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor"));
  CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v13, "CGColor"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
  objc_msgSend(v14, "cornerRadius");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithContinuousCornerRoundedRect:cornerRadius:](CRLBezierPath, "bezierPathWithContinuousCornerRoundedRect:cornerRadius:", v6, v8, v10, v12, v15));

  if (v16)
  {
    CGContextAddPath(a3, (CGPathRef)objc_msgSend(objc_retainAutorelease(v16), "CGPath"));
    CGContextClip(a3);
  }
  v17 = -[CRLAudioRep drawAlbumArtInContext:rect:](self, "drawAlbumArtInContext:rect:", a3, v6, v8, v10, v12);
  v18 = -[CRLAudioRep i_playButtonFitsInFrame](self, "i_playButtonFitsInFrame");
  if ((v17 & 1) == 0)
  {
    v19 = [CRLAngleGradientFill alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithR:G:B:](CRLColor, "colorWithR:G:B:", 242, 242, 247));
    v22 = -[CRLAngleGradientFill initWithStartColor:endColor:type:angle:](v19, "initWithStartColor:endColor:type:angle:", v20, v21, 0, -1.57079633);

    -[CRLAngleGradientFill paintRect:inContext:](v22, "paintRect:inContext:", a3, v6, v8, v10, v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 1));
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_1004A1420;
    v66[3] = &unk_101262388;
    v66[4] = self;
    v67 = v18;
    *(double *)&v66[5] = v6;
    *(double *)&v66[6] = v8;
    *(double *)&v66[7] = v10;
    *(double *)&v66[8] = v12;
    v66[9] = a3;
    +[UITraitCollection crl_withTraitCollectionAsCurrent:performBlock:](UITraitCollection, "crl_withTraitCollectionAsCurrent:performBlock:", v23, v66);

  }
  if (v16)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stroke"));

    objc_msgSend(v25, "paintPath:inContext:", objc_msgSend(objc_retainAutorelease(v16), "CGPath"), a3);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v27 = v18 & ~objc_msgSend(v26, "isCanvasInteractive");

  if (v27 == 1)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep p_playButtonKnob](self, "p_playButtonKnob"));
    -[CRLAudioRep positionOfStandardKnob:forBounds:](self, "positionOfStandardKnob:forBounds:", v28, v6, v8, v10, v12);
    v30 = v29;
    v32 = v31;

    v33 = sub_10005FD98(v30, v32, 48.0);
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[CRLMovieRep CRLMovieButtonFillColor](CRLMovieRep, "CRLMovieButtonFillColor"));
    CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v40, "CGColor"));

    v68.origin.x = v33;
    v68.origin.y = v35;
    v68.size.width = v37;
    v68.size.height = v39;
    CGContextFillEllipseInRect(a3, v68);
    v41 = sub_100061400(v33, v35, v37, v39);
    v43 = v42;
    v44 = v41 + 2.88;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithSystemImageNamed:pointSize:](CRLImage, "imageWithSystemImageNamed:pointSize:", CFSTR("play.fill"), 22.0));
    objc_msgSend(v45, "size");
    v47 = v46;
    v49 = v48;
    v50 = sub_10005FD98(v44, v43, v46);
    v52 = v51;
    v54 = v53;
    v56 = v55;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "compositedImageWithColor:alpha:blendMode:", v57, 20, 1.0));

    v59 = (CGImage *)objc_msgSend(v58, "CGImageForSize:inContext:orContentsScaleProvider:", a3, 0, v47, v49);
    v69.origin.x = v50;
    v69.origin.y = v52;
    v69.size.width = v54;
    v69.size.height = v56;
    CGContextDrawImage(a3, v69, v59);

  }
  CGContextRestoreGState(a3);
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "posterImageAssetPayload"));
  v62 = objc_msgSend(v61, "needsDownload");

  if (v62)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "posterImageAssetPayload"));
    sub_100412654(a3, v64);

  }
}

- (void)viewScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLAudioRep;
  -[CRLCanvasRep viewScaleDidChange](&v3, "viewScaleDidChange");
  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
}

- (void)willBeRemoved
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD block[2];
  id (*v10)(uint64_t);
  void *v11;
  CRLAudioRep *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRLAudioRep;
  -[CRLCanvasRep willBeRemoved](&v13, "willBeRemoved");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  v10 = sub_1004A19D4;
  v11 = &unk_10122D110;
  v12 = self;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    v10((uint64_t)block);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (!self->_downloadObserverIdentifier)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012623A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3AE4C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012623C8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRep willBeRemoved]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLAudioRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 409, 0, "invalid nil value for '%{public}s'", "_downloadObserverIdentifier");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "store"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetManager"));
  objc_msgSend(v8, "removeAllDownloadObserversWithIdentifier:", self->_downloadObserverIdentifier);

}

- (BOOL)directlyManagesLayerContent
{
  return 0;
}

- (int64_t)preferredReplacingInterfaceKind
{
  return 1;
}

- (BOOL)shouldShowMediaReplaceUI
{
  return 0;
}

- (id)unscaledPathToIncludeForSystemPreviewOutline
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
  void *v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v18[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geometry"));
  objc_msgSend(v4, "size");

  v5 = sub_10005FDDC();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
  objc_msgSend(v12, "cornerRadius");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithContinuousCornerRoundedRect:cornerRadius:](CRLBezierPath, "bezierPathWithContinuousCornerRoundedRect:cornerRadius:", v5, v7, v9, v11, v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "transformInRoot");
  else
    memset(v18, 0, sizeof(v18));
  objc_msgSend(v14, "transformUsingAffineTransform:", v18);

  return v14;
}

- (void)p_setUpAudioImageRenderablePath:(CGSize)a3
{
  CGMutablePathRef Mutable;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;

  Mutable = CGPathCreateMutable();
  CFAutorelease(Mutable);
  CGPathAddArc(Mutable, 0, 22.0, 22.0, 22.0, -1.57079633, 4.71238898, 0);
  -[CRLCanvasRenderable bounds](self->_audioImageRenderable, "bounds");
  -[CRLCanvasRenderable setPosition:](self->_progressRenderable, "setPosition:", sub_100061400(v5, v6, v7, v8));
  -[CRLCanvasRenderable setBounds:](self->_progressRenderable, "setBounds:", sub_10005FDDC());
  -[CRLCanvasShapeRenderable setPath:](self->_progressRenderable, "setPath:", Mutable);
}

- (void)p_updateAudioImageRenerableAndTrack
{
  -[CRLAudioRep p_playButtonSize](self, "p_playButtonSize");
  -[CRLAudioRep p_setUpAudioImageRenderablePath:](self, "p_setUpAudioImageRenderablePath:");
}

- (void)p_setUpRenderables
{
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  CRLCanvasShapeRenderable *v12;
  CRLCanvasShapeRenderable *audioImageRenderable;
  void *v14;
  void *v15;
  CRLCanvasShapeRenderable *v16;
  CRLCanvasShapeRenderable *progressRenderable;
  void *v18;
  void *v19;
  void *v20;
  CRLCanvasRenderable *v21;
  CRLCanvasRenderable *playPauseRenderable;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  id v28;

  v28 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  -[CRLAudioRep p_playButtonSize](self, "p_playButtonSize");
  v4 = v3;
  *(_QWORD *)&v6 = objc_opt_class(CRLCanvasShapeRenderable, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep p_playButtonKnob](self, "p_playButtonKnob", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "renderable"));
  v11 = sub_100221D0C(v8, v10);
  v12 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(v11);
  audioImageRenderable = self->_audioImageRenderable;
  self->_audioImageRenderable = v12;

  -[CRLCanvasRenderable setBounds:](self->_audioImageRenderable, "setBounds:", sub_10005FDDC());
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor"));
  -[CRLCanvasRenderable setBackgroundColor:](self->_audioImageRenderable, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor clearColor](CRLColor, "clearColor"));
  -[CRLCanvasShapeRenderable setFillColor:](self->_audioImageRenderable, "setFillColor:", objc_msgSend(v15, "CGColor"));

  -[CRLCanvasRenderable setCornerRadius:](self->_audioImageRenderable, "setCornerRadius:", v4 * 0.5);
  -[CRLCanvasRenderable setDelegate:](self->_audioImageRenderable, "setDelegate:", v28);
  v16 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
  progressRenderable = self->_progressRenderable;
  self->_progressRenderable = v16;

  -[CRLCanvasShapeRenderable setLineWidth:](self->_progressRenderable, "setLineWidth:", 4.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tintColor](UIColor, "tintColor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithUIColor:](CRLColor, "colorWithUIColor:", v18));
  -[CRLCanvasShapeRenderable setStrokeColor:](self->_progressRenderable, "setStrokeColor:", objc_msgSend(v19, "CGColor"));

  -[CRLCanvasShapeRenderable setFillColor:](self->_progressRenderable, "setFillColor:", 0);
  -[CRLCanvasShapeRenderable setStrokeEnd:](self->_progressRenderable, "setStrokeEnd:", 0.0);
  -[CRLCanvasRenderable setHidden:](self->_progressRenderable, "setHidden:", 1);
  -[CRLCanvasRenderable setDelegate:](self->_progressRenderable, "setDelegate:", v28);
  -[CRLCanvasRenderable addSubrenderable:](self->_audioImageRenderable, "addSubrenderable:", self->_progressRenderable);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep p_playButtonKnob](self, "p_playButtonKnob"));
  v21 = (CRLCanvasRenderable *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "imageRenderable"));
  playPauseRenderable = self->_playPauseRenderable;
  self->_playPauseRenderable = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep p_playButtonImage](self, "p_playButtonImage"));
  objc_msgSend(v23, "size");
  -[CRLCanvasRenderable setBounds:](self->_playPauseRenderable, "setBounds:", sub_10005FDDC());
  -[CRLCanvasRenderable setDelegate:](self->_playPauseRenderable, "setDelegate:", v28);
  -[CRLCanvasRenderable bounds](self->_audioImageRenderable, "bounds");
  -[CRLCanvasRenderable setPosition:](self->_playPauseRenderable, "setPosition:", sub_100061400(v24, v25, v26, v27));

}

- (id)additionalRenderablesOverRenderable
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLAudioRep;
  v3 = -[CRLMediaRep additionalRenderablesOverRenderable](&v7, "additionalRenderablesOverRenderable");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[CRLAudioRep p_updatePlayabilityIfNecessary](self, "p_updatePlayabilityIfNecessary");
  if (!self->_audioImageRenderable)
    -[CRLAudioRep p_setUpRenderables](self, "p_setUpRenderables");
  -[CRLAudioRep p_updateAudioImageRenerableAndTrack](self, "p_updateAudioImageRenerableAndTrack");
  -[CRLAudioRep p_updatePlayPauseButton](self, "p_updatePlayPauseButton");
  +[CATransaction commit](CATransaction, "commit");
  return v5;
}

- (void)becameSelected
{
  objc_super v3;

  if (-[CRLAudioRep p_shouldPlayerControllerExistThroughoutSelection](self, "p_shouldPlayerControllerExistThroughoutSelection"))
  {
    -[CRLAudioRep p_setUpPlayerControllerIfNecessary](self, "p_setUpPlayerControllerIfNecessary");
  }
  else
  {
    -[CRLAudioRep p_updatePlayabilityIfNecessary](self, "p_updatePlayabilityIfNecessary");
  }
  v3.receiver = self;
  v3.super_class = (Class)CRLAudioRep;
  -[CRLCanvasRep becameSelected](&v3, "becameSelected");
}

- (void)becameNotSelected
{
  objc_super v3;
  _QWORD block[2];
  id (*v5)(uint64_t);
  void *v6;
  CRLAudioRep *v7;

  if (-[CRLAudioRep p_shouldStopPlayingWhenDeselected](self, "p_shouldStopPlayingWhenDeselected"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    v5 = sub_1004A203C;
    v6 = &unk_10122D110;
    v7 = self;
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
      v5((uint64_t)block);
    else
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  v3.receiver = self;
  v3.super_class = (Class)CRLAudioRep;
  -[CRLCanvasRep becameNotSelected](&v3, "becameNotSelected");
}

- (void)documentEditabilityDidChange
{
  void *v3;
  unsigned int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLAudioRep;
  -[CRLCanvasRep documentEditabilityDidChange](&v5, "documentEditabilityDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  if (objc_msgSend(v3, "editingDisabled"))
  {
    v4 = -[CRLAudioRep isPlaying](self, "isPlaying");

    if (!v4)
      return;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep playerControllerForcingCreationIfNotPreExisting](self, "playerControllerForcingCreationIfNotPreExisting"));
    objc_msgSend(v3, "setPlaying:", 0);
  }

}

- (BOOL)shouldAllowReplacementFromPaste
{
  return 0;
}

- (BOOL)shouldAllowReplacementFromDrop
{
  return 0;
}

- (void)p_addPlayButtonToKnobs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLAudioRep p_playButtonKnob](self, "p_playButtonKnob"));
  objc_msgSend(v4, "crl_addObjects:", v5, 0);

  -[CRLAudioRep p_updatePlayabilityIfNecessary](self, "p_updatePlayabilityIfNecessary");
}

- (void)addKnobsToArray:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLAudioRep;
  v4 = a3;
  -[CRLCanvasRep addKnobsToArray:](&v5, "addKnobsToArray:", v4);
  -[CRLAudioRep p_addPlayButtonToKnobs:](self, "p_addPlayButtonToKnobs:", v4, v5.receiver, v5.super_class);

}

- (unint64_t)enabledKnobMask
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLAudioRep;
  v3 = -[CRLCanvasRep enabledKnobMask](&v5, "enabledKnobMask");
  if (-[CRLCanvasRep shouldCreateKnobs](self, "shouldCreateKnobs")
    && -[CRLCanvasRep isSelected](self, "isSelected")
    && !-[CRLAudioRep i_playButtonFitsInFrame](self, "i_playButtonFitsInFrame"))
  {
    return v3 & 0x28A;
  }
  return v3;
}

- (void)p_playTriggeredFromKnob
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;

  if (-[CRLAudioRep isPlayable](self, "isPlayable"))
    -[CRLAudioRep i_togglePlayback](self, "i_togglePlayback");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "freehandDrawingToolkit"));
  v4 = objc_msgSend(v3, "isLassoSelectionForMixedTypeEnabledInDrawingMode");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasEditor"));
    objc_msgSend(v5, "hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected");

  }
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
  objc_opt_class(CRLMovieKnob, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = -[CRLCanvasButtonKnobTracker initWithRep:knob:]([CRLCanvasButtonKnobTracker alloc], "initWithRep:knob:", self, v4);
    -[CRLCanvasButtonKnobTracker setTarget:](v7, "setTarget:", self);
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLAudioRep p_playButtonKnob](self, "p_playButtonKnob"));

    if (v8 == v4)
      -[CRLCanvasButtonKnobTracker setAction:](v7, "setAction:", "p_playTriggeredFromKnob");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLAudioRep;
    v7 = -[CRLCanvasRep newTrackerForKnob:](&v10, "newTrackerForKnob:", v4);
  }

  return v7;
}

- (BOOL)directlyManagesVisibilityOfKnob:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLAudioRep p_playButtonKnob](self, "p_playButtonKnob"));

  if (v5 == v4)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLAudioRep;
    v6 = -[CRLCanvasRep directlyManagesVisibilityOfKnob:](&v8, "directlyManagesVisibilityOfKnob:", v4);
  }

  return v6;
}

- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLAudioRep p_playButtonKnob](self, "p_playButtonKnob"));

  if (v5 == v4)
  {
    v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLAudioRep;
    v6 = -[CRLCanvasRep canUseSpecializedHitRegionForKnob:](&v8, "canUseSpecializedHitRegionForKnob:", v4);
  }

  return v6;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  objc_super v45;
  CGPoint result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CRLAudioRep;
  -[CRLCanvasRep positionOfStandardKnob:forBounds:](&v45, "positionOfStandardKnob:forBounds:", v9, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[CRLAudioRep p_playButtonKnob](self, "p_playButtonKnob"));

  if (v14 == v9 && -[CRLAudioRep i_playButtonFitsInFrame](self, "i_playButtonFitsInFrame"))
  {
    -[CRLCanvasRep naturalBounds](self, "naturalBounds");
    v42 = v16;
    v43 = v15;
    v18 = v17;
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v21, "convertUnscaledToBoundsSize:", v18, v20);
    v23 = v22;
    v25 = v24;

    -[CRLAudioRep p_playButtonAndTitleHeightWithRepSize:](self, "p_playButtonAndTitleHeightWithRepSize:", v23, v25);
    v27 = v26;
    if (!-[CRLAudioRep hasAlbumArt](self, "hasAlbumArt"))
    {
      -[CRLAudioRep p_creatorTextHeightWithRect:](self, "p_creatorTextHeightWithRect:", v43, v42, v18, v20);
      v29 = v27 + v28;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      objc_msgSend(v30, "viewScale");
      v44 = v25;
      v32 = v29 * v31;

      if (v32 < v44)
        v27 = v29;
    }
    v33 = fmin((v20 - v27) * 0.5 + 10.0, 24.0);
    v11 = sub_100260E54(8, x, y, width, height);
    v35 = v34;
    objc_msgSend(v9, "radius");
    v37 = v35 - v36;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v38, "viewScale");
    v13 = v37 - v33 / v39;

  }
  v40 = v11;
  v41 = v13;
  result.y = v41;
  result.x = v40;
  return result;
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
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep p_playButtonImage](self, "p_playButtonImage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLMovieRep CRLMovieButtonFillColor](CRLMovieRep, "CRLMovieButtonFillColor"));
    v7 = -[CRLMovieKnob initWithImage:radius:backgroundColor:onRep:](v4, "initWithImage:radius:backgroundColor:onRep:", v5, v6, self, 24.0);
    v8 = self->_playButtonKnob;
    self->_playButtonKnob = v7;

    playButtonKnob = self->_playButtonKnob;
  }
  return playButtonKnob;
}

- (void)p_hidePlayButton
{
  void *v3;
  void *v4;
  id v5;

  if (!-[CRLMovieKnob isHidden](self->_playButtonKnob, "isHidden"))
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[CRLMovieKnob setHidden:](self->_playButtonKnob, "setHidden:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob renderable](self->_playButtonKnob, "renderable"));
    objc_msgSend(v3, "removeAnimationForKey:", CFSTR("hidden"));

    v5 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
    objc_msgSend(v5, "setFromValue:", &off_1012CCD88);
    objc_msgSend(v5, "setToValue:", &off_1012CCD98);
    objc_msgSend(v5, "setDuration:", 0.2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob renderable](self->_playButtonKnob, "renderable"));
    objc_msgSend(v4, "addAnimation:forKey:", v5, CFSTR("hidden"));

    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)p_showPlayButton
{
  void *v3;
  void *v4;
  id v5;

  if (-[CRLMovieKnob isHidden](self->_playButtonKnob, "isHidden"))
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[CRLMovieKnob setHidden:](self->_playButtonKnob, "setHidden:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob renderable](self->_playButtonKnob, "renderable"));
    objc_msgSend(v3, "removeAnimationForKey:", CFSTR("hidden"));

    v5 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
    objc_msgSend(v5, "setFromValue:", &off_1012CCD98);
    objc_msgSend(v5, "setToValue:", &off_1012CCD88);
    objc_msgSend(v5, "setDuration:", 0.2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnob renderable](self->_playButtonKnob, "renderable"));
    objc_msgSend(v4, "addAnimation:forKey:", v5, CFSTR("hidden"));

    +[CATransaction commit](CATransaction, "commit");
  }
}

- (CGSize)p_playButtonSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 48.0;
  v3 = 48.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)p_playButtonImage
{
  -[CRLAudioRep p_positionPlayButtonImage](self, "p_positionPlayButtonImage");
  return +[CRLImage imageWithSystemImageNamed:pointSize:](CRLImage, "imageWithSystemImageNamed:pointSize:", CFSTR("play.fill"), 22.0);
}

- (id)p_pauseButtonImage
{
  -[CRLAudioRep p_positionPauseButtonImage](self, "p_positionPauseButtonImage");
  return +[CRLImage imageWithSystemImageNamed:pointSize:](CRLImage, "imageWithSystemImageNamed:pointSize:", CFSTR("pause.fill"), 22.0);
}

- (id)p_unpauseButtonImage
{
  -[CRLAudioRep p_positionPlayButtonImage](self, "p_positionPlayButtonImage");
  return -[CRLAudioRep p_playButtonImage](self, "p_playButtonImage");
}

- (void)p_positionPlayButtonImage
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[CRLCanvasRenderable bounds](self->_audioImageRenderable, "bounds");
  -[CRLCanvasRenderable setPosition:](self->_playPauseRenderable, "setPosition:", sub_100061400(v3, v4, v5, v6) + 2.88);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)p_positionPauseButtonImage
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[CRLCanvasRenderable bounds](self->_audioImageRenderable, "bounds");
  -[CRLCanvasRenderable setPosition:](self->_playPauseRenderable, "setPosition:", sub_100061400(v3, v4, v5, v6));
  +[CATransaction commit](CATransaction, "commit");
}

- (void)p_updatePlayabilityIfNecessary
{
  AVAsset **p_assetForPlayabilityCheck;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  CRLAudioRep *v11;
  _QWORD *v12;
  _QWORD v13[5];

  if (!self->_didCheckPlayability)
  {
    p_assetForPlayabilityCheck = &self->_assetForPlayabilityCheck;
    if (!self->_assetForPlayabilityCheck)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "movieAssetPayload"));

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1004A2BE4;
      v13[3] = &unk_10122D110;
      v13[4] = self;
      v6 = objc_retainBlock(v13);
      if (v5)
      {
        if (objc_msgSend(v5, "needsDownload"))
        {
          self->_isPlayable = 0;
          self->_didCheckPlayability = 1;
          ((void (*)(_QWORD *))v6[2])(v6);
        }
        else
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "AVAssetAndReturnError:", 0));
          objc_storeStrong((id *)p_assetForPlayabilityCheck, v7);
          self->_isPlayable = 0;
          v9[0] = _NSConcreteStackBlock;
          v9[1] = 3221225472;
          v9[2] = sub_1004A2CBC;
          v9[3] = &unk_101234DA0;
          v10 = v7;
          v11 = self;
          v12 = v6;
          v8 = v7;
          objc_msgSend(v8, "loadValuesAsynchronouslyForKeys:completionHandler:", &off_1012CBA88, v9);

        }
      }

    }
  }
}

- (void)p_cancelPlayabilityCheck
{
  AVAsset *assetForPlayabilityCheck;

  -[AVAsset cancelLoading](self->_assetForPlayabilityCheck, "cancelLoading");
  assetForPlayabilityCheck = self->_assetForPlayabilityCheck;
  self->_assetForPlayabilityCheck = 0;

  self->_didCheckPlayability = 0;
}

- (BOOL)isPlaying
{
  CRLAVPlayerController *playerController;

  playerController = self->_playerController;
  if (playerController)
    LOBYTE(playerController) = -[CRLAVPlayerController isPlaying](playerController, "isPlaying");
  return (char)playerController;
}

- (double)absoluteCurrentTime
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep playerControllerForcingCreationIfNotPreExisting](self, "playerControllerForcingCreationIfNotPreExisting"));
  objc_msgSend(v2, "absoluteCurrentTime");
  v4 = v3;

  return v4;
}

- (void)processChangedProperty:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLAudioRep;
  -[CRLStyledRep processChangedProperty:](&v5, "processChangedProperty:");
  if ((uint64_t)a3 <= 41)
  {
    if (a3 == 18)
    {
      if (self->_playerController)
        -[CRLAudioRep p_teardownPlayerController](self, "p_teardownPlayerController");
      -[CRLAudioRep p_cancelPlayabilityCheck](self, "p_cancelPlayabilityCheck");
      -[CRLAudioRep p_updatePlayabilityIfNecessary](self, "p_updatePlayabilityIfNecessary");
      -[CRLAudioRep p_listenForAssetChangesIfAppropriate](self, "p_listenForAssetChangesIfAppropriate");
    }
    else if (a3 == 41)
    {
      -[CRLAudioRep p_updateStartTime](self, "p_updateStartTime");
    }
  }
  else
  {
    switch(a3)
    {
      case '*':
        -[CRLAudioRep p_updateEndTime](self, "p_updateEndTime");
        break;
      case ',':
        -[CRLAudioRep p_updateVolume](self, "p_updateVolume");
        break;
      case '4':
        -[CRLAudioRep p_updateIsLooping](self, "p_updateIsLooping");
        break;
    }
  }
}

- (void)p_updateVolume
{
  -[CRLAudioRep volume](self, "volume");
  -[CRLAVPlayerController setVolume:](self->_playerController, "setVolume:");
}

- (void)p_updateStartTime
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
  objc_msgSend(v3, "startTime");
  v5 = v4;

  -[CRLAVPlayerController setStartTime:](self->_playerController, "setStartTime:", v5);
}

- (void)p_updateEndTime
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
  objc_msgSend(v3, "endTime");
  v5 = v4;

  -[CRLAVPlayerController setEndTime:](self->_playerController, "setEndTime:", v5);
}

- (void)p_updateIsLooping
{
  void *v3;
  unsigned int v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
  v4 = objc_msgSend(v3, "isLooping");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLAudioRep playerControllerForcingCreationIfNotPreExisting](self, "playerControllerForcingCreationIfNotPreExisting"));
  objc_msgSend(v5, "setRepeatMode:", v4);

}

- (BOOL)shouldBecomeSelectedWhenPlaying
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasEditor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v6 = objc_msgSend(v4, "isLayoutSelectable:", v5);

  if (v6)
    v7 = objc_msgSend(v3, "editingDisabled") ^ 1;
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (BOOL)p_shouldStopPlayingWhenDeselected
{
  return 1;
}

- (BOOL)noKnobTogglePlayAndMiniFormatter
{
  _BOOL4 v3;

  if (self->_isPlayable && !-[CRLAudioRep i_playButtonFitsInFrame](self, "i_playButtonFitsInFrame"))
  {
    v3 = -[CRLCanvasRep isSelected](self, "isSelected");
    if (v3)
    {
      -[CRLAudioRep p_togglePlayPause](self, "p_togglePlayPause");
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 1;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  -[CRLAudioRep enterPreviewMode](self, "enterPreviewMode", a4, a3.x, a3.y);
  return 1;
}

- (BOOL)p_togglePlayPause
{
  _BOOL8 v3;
  void *v4;

  v3 = -[CRLAudioRep isPlaying](self, "isPlaying") ^ 1;
  if (self->_isPlayable)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep playerControllerForcingCreationIfNotPreExisting](self, "playerControllerForcingCreationIfNotPreExisting"));
    objc_msgSend(v4, "setPlaying:", v3);

  }
  return v3;
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
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPathWithInfo:", v8));

  }
  return v7;
}

- (BOOL)shouldShowSelectionHighlight
{
  return 0;
}

- (BOOL)shouldHideSelectionHighlightDueToRectangularPath
{
  return 0;
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

- (BOOL)shouldShowDownloadProgressIndicator
{
  return 0;
}

- (id)downloadProgressPlaceholderImage
{
  return 0;
}

- (BOOL)canDrawDownloadProgressPlaceholderImage
{
  return 0;
}

- (void)p_updatePlayPauseButton
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unint64_t playbackState;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CRLAudioRep *v15;
  id v16;

  v3 = -[CRLAudioRep i_playButtonFitsInFrame](self, "i_playButtonFitsInFrame");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layerHost"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asiOSCVC"));
  v7 = objc_msgSend(v6, "isCurrentlyInQuickSelectMode");

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  if ((v3 & 1) != 0)
    -[CRLAudioRep p_showPlayButton](self, "p_showPlayButton");
  else
    -[CRLAudioRep p_hidePlayButton](self, "p_hidePlayButton");
  playbackState = self->_playbackState;
  switch(playbackState)
  {
    case 2uLL:
      v16 = (id)objc_claimAutoreleasedReturnValue(-[CRLAudioRep p_unpauseButtonImage](self, "p_unpauseButtonImage"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor"));
      -[CRLCanvasRenderable setBackgroundColor:](self->_audioImageRenderable, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));
LABEL_10:
      v12 = 0;
      goto LABEL_11;
    case 1uLL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep p_pauseButtonImage](self, "p_pauseButtonImage"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor"));
      -[CRLCanvasRenderable setBackgroundColor:](self->_audioImageRenderable, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "compositedImageWithColor:alpha:blendMode:", v11, 20, 1.0));

      goto LABEL_10;
    case 0uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLMovieRep CRLMovieButtonFillColor](CRLMovieRep, "CRLMovieButtonFillColor"));
      -[CRLCanvasRenderable setBackgroundColor:](self->_audioImageRenderable, "setBackgroundColor:", objc_msgSend(v9, "CGColor"));

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep p_playButtonImage](self, "p_playButtonImage"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor"));
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "compositedImageWithColor:alpha:blendMode:", v11, 20, 1.0));

      v12 = 1;
LABEL_11:

      -[CRLCanvasRenderable setHidden:](self->_progressRenderable, "setHidden:", v12);
      goto LABEL_13;
  }
  v16 = 0;
LABEL_13:
  -[CRLCanvasButtonKnob setImage:](self->_playButtonKnob, "setImage:", v16);
  if (self->_isPlayable)
  {
    v15 = (CRLAudioRep *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep repForSelecting](self, "repForSelecting"));
    -[CRLCanvasButtonKnob setEnabled:](self->_playButtonKnob, "setEnabled:", v15 == self);

  }
  else
  {
    -[CRLCanvasButtonKnob setEnabled:](self->_playButtonKnob, "setEnabled:", 0);
  }
  -[CRLCanvasButtonKnob setEnabled:](self->_playButtonKnob, "setEnabled:", -[CRLCanvasButtonKnob isEnabled](self->_playButtonKnob, "isEnabled") & (v7 ^ 1));
  +[CATransaction commit](CATransaction, "commit");

}

- (void)p_setUpSpinnerAnimationIfNeeded
{
  CRLCanvasRenderable *spinnerRenderable;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  id v10;

  spinnerRenderable = self->_spinnerRenderable;
  if (spinnerRenderable)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable animationForKey:](spinnerRenderable, "animationForKey:", CFSTR("spin")));

    if (!v4)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.rotation")));
      objc_msgSend(v10, "setDelegate:", 0);
      objc_msgSend(v10, "setDuration:", 1.0);
      LODWORD(v5) = 0;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
      objc_msgSend(v10, "setFromValue:", v6);

      LODWORD(v7) = 1086918619;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
      objc_msgSend(v10, "setToValue:", v8);

      LODWORD(v9) = 1203982336;
      objc_msgSend(v10, "setRepeatCount:", v9);
      -[CRLCanvasRenderable addAnimation:forKey:](self->_spinnerRenderable, "addAnimation:forKey:", v10, CFSTR("spin"));

    }
  }
}

- (id)dataForUpdateUploadIndicator
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "movieAssetPayload"));

  if (v3)
  {
    v6 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  }
  else
  {
    v4 = &__NSArray0__struct;
  }

  return v4;
}

- (double)uploadIndicatorInset
{
  return 2.0;
}

- (float)volume
{
  void *v3;
  float v4;
  float v5;

  if (self->_isChangingDynamicVolume)
    return self->_dynamicVolume;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
  objc_msgSend(v3, "volume");
  v5 = v4;

  return v5;
}

- (void)dynamicVolumeChangeDidBegin
{
  float v3;

  -[CRLAudioRep volume](self, "volume");
  self->_dynamicVolume = v3;
  self->_isChangingDynamicVolume = 1;
}

- (void)dynamicVolumeUpdateToValue:(float)a3
{
  self->_dynamicVolume = a3;
  -[CRLAudioRep p_updateVolume](self, "p_updateVolume");
}

- (void)dynamicVolumeChangeDidEnd
{
  self->_isChangingDynamicVolume = 0;
}

- (BOOL)p_shouldPlayerControllerExistThroughoutSelection
{
  return 0;
}

- (void)p_setUpPlayerControllerIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CRLAVPlayerController *v17;
  CRLAVPlayerController *playerController;
  void *v19;
  NSObject *v20;
  CRLAVPlayerController *v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  CRLAVPlayerController *v26;
  void *v27;
  void *v28;
  CRLMediaPlayerTimeController *v29;
  CRLMediaPlayerTimeController *timeController;
  NSObject *v31;
  const __CFString *v32;
  CRLAudioRep *v33;
  uint8_t buf[4];
  CRLAudioRep *v35;
  __int16 v36;
  CRLAVPlayerController *v37;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012623E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3B074();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262408);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRep p_setUpPlayerControllerIfNecessary]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLAudioRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1228, 0, "This operation must only be performed on the main thread.");

  }
  if (!self->_playerController)
  {
    if (!self->_isPlayable)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101262428);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3AFF4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101262448);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRep p_setUpPlayerControllerIfNecessary]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLAudioRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1230, 0, "Setting up player controller when audio isn't playable!");

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "movieAssetPayload"));
    v11 = objc_msgSend(v10, "needsDownload");

    if (v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101262468);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3AF74();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101262488);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRep p_setUpPlayerControllerIfNecessary]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLAudioRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 1232, 0, "Setting up player controller for data that needs to be downloaded!");

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "makeAVAssetAndReturnError:", 0));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", v15));
      v17 = -[CRLAVPlayerController initWithPlayerItem:delegate:]([CRLAVPlayerController alloc], "initWithPlayerItem:delegate:", v16, self);
      playerController = self->_playerController;
      self->_playerController = v17;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012624A8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3AEE0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012624C8);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRep p_setUpPlayerControllerIfNecessary]"));
      playerController = (CRLAVPlayerController *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLAudioRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, playerController, 1235, 0, "invalid nil value for '%{public}s'", "asset");
    }

    if (self->_playerController)
    {
      if (qword_10147E5C8 != -1)
        dispatch_once(&qword_10147E5C8, &stru_101262508);
      v20 = off_1013DB560;
      if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->_playerController;
        *(_DWORD *)buf = 134218240;
        v35 = self;
        v36 = 2048;
        v37 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "audio rep %p making audio player controller %p", buf, 0x16u);
      }
      -[CRLAudioRep p_updateStartTime](self, "p_updateStartTime");
      -[CRLAudioRep p_updateIsLooping](self, "p_updateIsLooping");
      objc_msgSend(v9, "endTime");
      if (v22 != 0.0)
        -[CRLAudioRep p_updateEndTime](self, "p_updateEndTime");
      -[CRLAudioRep p_updateVolume](self, "p_updateVolume");
      -[CRLAVPlayerController addObserver:forKeyPath:options:context:](self->_playerController, "addObserver:forKeyPath:options:context:", self, CFSTR("playing"), 4, off_1013DC750);
      v32 = CFSTR("CRLInteractiveCanvasControllerMediaRepKey");
      v33 = self;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
      v24 = objc_msgSend(v23, "mutableCopy");
      v25 = v24;
      v26 = self->_playerController;
      if (v26)
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("CRLInteractiveCanvasControllerPlayerControllerKey"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v27, "postNotificationName:object:userInfo:", CFSTR("CRLInteractiveCanvasControllerDidUpdateMoviePlayerControllerNotification"), v28, v25);

      v29 = -[CRLMediaPlayerTimeController initWithPlayerController:]([CRLMediaPlayerTimeController alloc], "initWithPlayerController:", self->_playerController);
      timeController = self->_timeController;
      self->_timeController = v29;

      -[CRLMediaPlayerTimeController startObservingTime](self->_timeController, "startObservingTime");
      -[CRLAVPlayerController addObserver:forKeyPath:options:context:](self->_playerController, "addObserver:forKeyPath:options:context:", self, CFSTR("duration"), 4, off_1013DC758);
      -[CRLMediaPlayerTimeController addObserver:forKeyPath:options:context:](self->_timeController, "addObserver:forKeyPath:options:context:", self, CFSTR("currentTime"), 0, off_1013DC760);

    }
    else
    {
      if (qword_10147E5C8 != -1)
        dispatch_once(&qword_10147E5C8, &stru_1012624E8);
      v31 = off_1013DB560;
      if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "audio rep attempted to set up the playerController but was unable to.", buf, 2u);
      }
    }

  }
}

- (void)p_teardownPlayerController
{
  void *v3;
  void *v4;
  void *v5;
  CRLMediaPlayerTimeController *timeController;
  NSObject *v7;
  CRLAVPlayerController *playerController;
  CRLAVPlayerController *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  CRLAudioRep *v14;
  uint8_t buf[4];
  CRLAudioRep *v16;
  __int16 v17;
  CRLAVPlayerController *v18;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262528);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3B0F4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101262548);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRep p_teardownPlayerController]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLAudioRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1278, 0, "This operation must only be performed on the main thread.");

  }
  if (self->_playerController)
  {
    -[CRLMediaPlayerTimeController stopObservingTime](self->_timeController, "stopObservingTime");
    -[CRLMediaPlayerTimeController removeObserver:forKeyPath:](self->_timeController, "removeObserver:forKeyPath:", self, CFSTR("currentTime"));
    timeController = self->_timeController;
    self->_timeController = 0;

    if (-[CRLAVPlayerController isPlaying](self->_playerController, "isPlaying"))
      -[CRLAVPlayerController setPlaying:](self->_playerController, "setPlaying:", 0);
    -[CRLAVPlayerController removeObserver:forKeyPath:](self->_playerController, "removeObserver:forKeyPath:", self, CFSTR("duration"));
    -[CRLAVPlayerController removeObserver:forKeyPath:](self->_playerController, "removeObserver:forKeyPath:", self, CFSTR("playing"));
    -[CRLAVPlayerController teardown](self->_playerController, "teardown");
    if (qword_10147E5C8 != -1)
      dispatch_once(&qword_10147E5C8, &stru_101262568);
    v7 = off_1013DB560;
    if (os_log_type_enabled((os_log_t)off_1013DB560, OS_LOG_TYPE_DEFAULT))
    {
      playerController = self->_playerController;
      *(_DWORD *)buf = 134218240;
      v16 = self;
      v17 = 2048;
      v18 = playerController;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "audio rep %p clearing player controller %p in p_teardownPlayerController", buf, 0x16u);
    }
    v9 = self->_playerController;
    self->_playerController = 0;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v13 = CFSTR("CRLInteractiveCanvasControllerMediaRepKey");
    v14 = self;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("CRLInteractiveCanvasControllerDidUpdateMoviePlayerControllerNotification"), v11, v12);

  }
  if (self->_playbackState)
  {
    self->_playbackState = 0;
    -[CRLAudioRep p_updatePlayPauseButton](self, "p_updatePlayPauseButton");
  }
}

- (CRLMediaPlayerController)playerControllerForcingCreationIfNotPreExisting
{
  -[CRLAudioRep p_setUpPlayerControllerIfNecessary](self, "p_setUpPlayerControllerIfNecessary");
  return (CRLMediaPlayerController *)self->_playerController;
}

- (void)pausePlaybackIfNeeded
{
  if (-[CRLAudioRep isPlaying](self, "isPlaying"))
    -[CRLAudioRep i_togglePlayback](self, "i_togglePlayback");
}

- (void)playerController:(id)a3 playbackDidFailWithError:(id)a4
{
  id v4;
  __CFRunLoop *Main;
  _QWORD v6[5];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1004A4708;
  v6[3] = &unk_10122D3D8;
  v6[4] = self;
  v7 = a4;
  v4 = v7;
  Main = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, kCFRunLoopDefaultMode, v6);
  CFRunLoopWakeUp(Main);

}

- (void)playbackDidStopForPlayerController:(id)a3
{
  -[CRLAudioRep p_teardownPlayerController](self, "p_teardownPlayerController", a3);
  self->_playbackState = 0;
}

- (id)nowPlayingTitleWithPlaybackController:(id)a3
{
  void *v3;
  void *v4;

  if (self->_playerController == a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
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
    return (id)objc_claimAutoreleasedReturnValue(-[CRLAudioRep imageProviderForAlbumArt](self, "imageProviderForAlbumArt"));
  else
    return 0;
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
      dispatch_once(&qword_10147E370, &stru_101262588);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3B174();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012625A8);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRep p_listenForAssetChangesIfAppropriate]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLAudioRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1362, 0, "invalid nil value for '%{public}s'", "_downloadObserverIdentifier");

    downloadObserverIdentifier = self->_downloadObserverIdentifier;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1004A4A80;
  v13[3] = &unk_101235058;
  v13[4] = self;
  v13[5] = downloadObserverIdentifier;
  v7 = downloadObserverIdentifier;
  v8 = objc_retainBlock(v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "movieAssetPayload"));
  ((void (*)(_QWORD *, void *))v8[2])(v8, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
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
  void *v9;
  void *v10;
  const __CFString *v11;
  CRLAudioRep *v12;

  v4 = a3;
  if (!-[CRLCanvasRep hasBeenRemoved](self, "hasBeenRemoved"))
  {
    -[CRLStyledRep setNeedsDisplay](self, "setNeedsDisplay");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v5, "invalidateContentLayersForRep:", self);

    -[CRLAudioRep p_updateDownloadSpinnerState](self, "p_updateDownloadSpinnerState");
    -[CRLAudioRep p_cancelPlayabilityCheck](self, "p_cancelPlayabilityCheck");
    -[CRLAudioRep p_updatePlayabilityIfNecessary](self, "p_updatePlayabilityIfNecessary");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep movieItem](self, "movieItem"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "movieAssetPayload"));

    if (v7 == v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      v11 = CFSTR("CRLInteractiveCanvasControllerMediaRepKey");
      v12 = self;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
      objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("CRLInteractiveCanvasControllerDidLoadAssetForMediaRepNotification"), v9, v10);

    }
  }

}

- (void)p_updateDownloadSpinnerState
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v3, "invalidateContentLayersForRep:", self);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  objc_super v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_1013DC750 == a6)
  {
    v13 = -[CRLAudioRep shouldBecomeSelectedWhenPlaying](self, "shouldBecomeSelectedWhenPlaying");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep playerControllerForcingCreationIfNotPreExisting](self, "playerControllerForcingCreationIfNotPreExisting"));
    v15 = objc_msgSend(v14, "isPlaying");

    if (v15)
    {
      if (!-[CRLCanvasRep isSelected](self, "isSelected") && ((v13 ^ 1) & 1) == 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAudioRep p_selectionPath](self, "p_selectionPath"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "editorController"));
        objc_msgSend(v18, "setSelectionPath:", v16);

      }
      self->_playbackState = 1;
    }
    else if (self->_playbackState == 1)
    {
      self->_playbackState = 2;
      -[CRLMediaPlayerTimeController currentTime](self->_timeController, "currentTime");
      v25 = v24;
      -[CRLMediaPlayerTimeController updateInterval](self->_timeController, "updateInterval");
      v27 = v25 + v26;
      -[CRLAVPlayerController duration](self->_playerController, "duration");
      if (v27 > v28)
        self->_playbackState = 0;
    }
    -[CRLAudioRep p_updatePlayPauseButton](self, "p_updatePlayPauseButton");
  }
  else if (off_1013DC758 == a6)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v19, "contentsScale");
    v21 = v20 * 138.230077;

    -[CRLAVPlayerController duration](self->_playerController, "duration");
    v23 = v22 / (v21 * 4.0);
    if (v23 < 0.0166666667)
      v23 = 0.0166666667;
    -[CRLMediaPlayerTimeController setUpdateInterval:](self->_timeController, "setUpdateInterval:", v23);
  }
  else if (off_1013DC760 == a6)
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[CRLMediaPlayerTimeController currentTime](self->_timeController, "currentTime");
    v30 = v29;
    -[CRLAVPlayerController duration](self->_playerController, "duration");
    -[CRLCanvasShapeRenderable setStrokeEnd:](self->_progressRenderable, "setStrokeEnd:", v30 / v31);
    +[CATransaction commit](CATransaction, "commit");
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)CRLAudioRep;
    -[CRLAudioRep observeValueForKeyPath:ofObject:change:context:](&v32, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)p_workspaceDidActivate:(id)a3
{
  -[CRLAudioRep p_setUpSpinnerAnimationIfNeeded](self, "p_setUpSpinnerAnimationIfNeeded", a3);
}

- (CRLCanvasShapeRenderable)audioImageRenderable
{
  return self->_audioImageRenderable;
}

- (BOOL)isPlayable
{
  return self->_isPlayable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioImageRenderable, 0);
  objc_storeStrong((id *)&self->_downloadObserverIdentifier, 0);
  objc_storeStrong((id *)&self->_progressRenderable, 0);
  objc_storeStrong((id *)&self->_playPauseRenderable, 0);
  objc_storeStrong((id *)&self->_spinnerRenderable, 0);
  objc_storeStrong((id *)&self->_playButtonKnob, 0);
  objc_storeStrong((id *)&self->_assetForPlayabilityCheck, 0);
  objc_storeStrong((id *)&self->_timeController, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
}

- (double)ifFitsDrawTitleWithContext:(CGContext *)a3 rect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *v9;
  CRLAudioRep *v10;
  double v11;
  double v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = self;
  sub_1004BEA78(v9, x, y, width, height);
  v12 = v11;

  return v12;
}

- (double)ifFitsDrawCreatorWithContext:(CGContext *)a3 rect:(CGRect)a4 topPadding:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *v11;
  CRLAudioRep *v12;
  double v13;
  double v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = self;
  sub_1004BED88(v11, x, y, width, height, a5);
  v14 = v13;

  return v14;
}

- (double)p_creatorTextHeightWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CRLAudioRep *v7;
  double v8;
  double v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1004BF0AC(x, y, width, height);
  v9 = v8;

  return v9;
}

- (double)p_titleTextHeightWithSize:(CGSize)a3
{
  double height;
  double width;
  CRLAudioRep *v5;
  double v6;
  double v7;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1004BF3C0(width, height);
  v7 = v6;

  return v7;
}

- (BOOL)wantsToHandleDoubleTapsWhenLocked
{
  return 1;
}

- (void)prepareForPreview
{
  CRLAudioRep *v2;

  v2 = self;
  if (-[CRLAudioRep isPlaying](v2, "isPlaying"))
    -[CRLAudioRep pausePlaybackIfNeeded](v2, "pausePlaybackIfNeeded");

}

- (void)enterPreviewMode
{
  CRLAudioRep *v2;

  v2 = self;
  -[CRLAudioRep prepareForPreview](v2, "prepareForPreview");
  sub_100D46764();

}

@end
