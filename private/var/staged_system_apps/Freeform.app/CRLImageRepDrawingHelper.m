@implementation CRLImageRepDrawingHelper

- (CRLImageRepDrawingHelper)initWithRep:(id)a3
{
  id v4;
  CRLImageRepDrawingHelper *v5;
  CRLImageRepDrawingHelper *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *sizedImageAccessQueue;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLImageRepDrawingHelper;
  v5 = -[CRLImageRepDrawingHelper init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_rep, v4);
    v7 = dispatch_queue_create("com.apple.freeform.CRLImageRepDrawingHelper.sizedImage", 0);
    sizedImageAccessQueue = v6->_sizedImageAccessQueue;
    v6->_sizedImageAccessQueue = (OS_dispatch_queue *)v7;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_sizedImage);
  CGPathRelease(self->_sizedImageMaskPath);
  v3.receiver = self;
  v3.super_class = (Class)CRLImageRepDrawingHelper;
  -[CRLImageRepDrawingHelper dealloc](&v3, "dealloc");
}

- (void)teardown
{
  NSObject *sizedImageAccessQueue;
  _QWORD block[5];

  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100413244;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_sync(sizedImageAccessQueue, block);
}

- (CGRect)imageRectInContext:(CGContext *)a3
{
  void *v5;
  void *v6;
  double v7;
  double x;
  double v9;
  double y;
  double v11;
  double width;
  double v13;
  double height;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper rep](self, "rep"));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "imageDrawingHelperImageRect:", self);
    x = v7;
    y = v9;
    width = v11;
    height = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper rep](self, "rep"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "canvas"));
    if (objc_msgSend(v16, "isDrawingIntoPDF"))
    {

    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper rep](self, "rep"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "canvas"));
      v22 = objc_msgSend(v21, "isPrinting");

      if ((v22 & 1) == 0)
      {
        -[CRLImageRepDrawingHelper p_antialiasingDefeatedRectForRect:inContext:](self, "p_antialiasingDefeatedRectForRect:inContext:", a3, x, y, width, height);
        x = v23;
        y = v24;
        width = v25;
        height = v26;
      }
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C198);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E312F0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C1B8);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper imageRectInContext:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 83, 0, "invalid nil value for '%{public}s'", "rep");

    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v27 = x;
  v28 = y;
  v29 = width;
  v30 = height;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (void)drawInContext:(CGContext *)a3 forLayer:(BOOL)a4 forShadowOrHitTest:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v9;
  NSObject *sizedImageAccessQueue;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  double MinY;
  CGFloat MaxY;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  _TtC8Freeform38CRLImageUndownloadedAssetDrawingHelper *v35;
  void *v36;
  _TtC8Freeform38CRLImageUndownloadedAssetDrawingHelper *v37;
  void *v38;
  void *v39;
  id v40;
  CGImage *v41;
  double v42;
  CGFloat v43;
  CGAffineTransform v44;
  _QWORD v45[6];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  CGAffineTransform transform;
  _QWORD block[7];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v5 = a5;
  v6 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper rep](self, "rep"));
  if (v9)
  {
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 0;
    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = 0;
    sizedImageAccessQueue = self->_sizedImageAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100413BA4;
    block[3] = &unk_101246F58;
    block[4] = self;
    block[5] = &v56;
    block[6] = &v52;
    dispatch_sync(sizedImageAccessQueue, block);
    -[CRLImageRepDrawingHelper imageRectInContext:](self, "imageRectInContext:", a3);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    if (!v5 || (objc_msgSend(v9, "imageDrawingHelperImageHasAlpha:", self) & 1) != 0)
    {
      if (v57[3] && !-[CRLImageRepDrawingHelper imagePrefersDrawing](self, "imagePrefersDrawing"))
      {
        v61.origin.x = v12;
        v61.origin.y = v14;
        v61.size.width = v16;
        v61.size.height = v18;
        MinY = CGRectGetMinY(v61);
        v62.origin.x = v12;
        v62.origin.y = v14;
        v62.size.width = v16;
        v62.size.height = v18;
        MaxY = CGRectGetMaxY(v62);
        CGContextTranslateCTM(a3, 0.0, MinY + MaxY);
        CGContextScaleCTM(a3, 1.0, -1.0);
        sub_1003F6270((CGAffineTransform *)v53[3], 1, (uint64_t)&transform, v12, v14, v16, v18);
        CGContextConcatCTM(a3, &transform);
        v63.origin.x = v12;
        v63.origin.y = v14;
        v63.size.width = v16;
        v63.size.height = v18;
        CGContextDrawImage(a3, v63, (CGImageRef)v57[3]);
        goto LABEL_34;
      }
      if (!-[CRLImageRepDrawingHelper shouldShowLoadingUI](self, "shouldShowLoadingUI"))
      {
        v46 = 0;
        v47 = &v46;
        v48 = 0x2020000000;
        v49 = 0;
        v23 = self->_sizedImageAccessQueue;
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_100413BF0;
        v45[3] = &unk_10122C5F0;
        v45[4] = self;
        v45[5] = &v46;
        dispatch_sync(v23, v45);
        if (-[CRLImageRepDrawingHelper p_canDrawThumbnailAsSizedImage](self, "p_canDrawThumbnailAsSizedImage")
          || v6 && *((_BYTE *)v47 + 24))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_validatedThumbnailImageProvider](self, "p_validatedThumbnailImageProvider"));
          if (v24 && !-[CRLImageRepDrawingHelper imagePrefersDrawing](self, "imagePrefersDrawing"))
          {
            v41 = (CGImage *)objc_msgSend(v24, "CGImageForSize:inContext:orContentsScaleProvider:", a3, 0, v16, v18);
            v64.origin.x = v12;
            v64.origin.y = v14;
            v64.size.width = v16;
            v64.size.height = v18;
            v42 = CGRectGetMinY(v64);
            v65.origin.x = v12;
            v65.origin.y = v14;
            v65.size.width = v16;
            v65.size.height = v18;
            v43 = CGRectGetMaxY(v65);
            CGContextTranslateCTM(a3, 0.0, v42 + v43);
            CGContextScaleCTM(a3, 1.0, -1.0);
            sub_1003F6270((CGAffineTransform *)v53[3], 1, (uint64_t)&v44, v12, v14, v16, v18);
            CGContextConcatCTM(a3, &v44);
            v66.origin.x = v12;
            v66.origin.y = v14;
            v66.size.width = v16;
            v66.size.height = v18;
            CGContextDrawImage(a3, v66, v41);
          }
          else
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_validatedImageProvider](self, "p_validatedImageProvider"));
            objc_msgSend(v25, "drawImageInContext:rect:", a3, v12, v14, v16, v18);

          }
        }
        else
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_validatedImageProvider](self, "p_validatedImageProvider"));
          if (objc_msgSend(v24, "isError"))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_validatedThumbnailImageProvider](self, "p_validatedThumbnailImageProvider"));
            v39 = v38;
            if (v38)
            {
              v40 = v38;

              v24 = v40;
            }

          }
          objc_msgSend(v24, "drawImageInContext:rect:", a3, v12, v14, v16, v18);
        }

        _Block_object_dispose(&v46, 8);
        goto LABEL_34;
      }
      if (!v5)
      {
        *(_QWORD *)&v29 = objc_opt_class(CRLImageRep, v19).n128_u64[0];
        v31 = v30;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper rep](self, "rep", v29));
        v33 = sub_100221D0C(v31, v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

        v35 = [_TtC8Freeform38CRLImageUndownloadedAssetDrawingHelper alloc];
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper imageDataForDrawing](self, "imageDataForDrawing"));
        v37 = -[CRLImageUndownloadedAssetDrawingHelper initWithImageRep:asset:](v35, "initWithImageRep:asset:", v34, v36);

        -[CRLImageUndownloadedAssetDrawingHelper drawInConext:withOriginalImageRect:](v37, "drawInConext:withOriginalImageRect:", a3, v12, v14, v16, v18);
        goto LABEL_34;
      }
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
    CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v26, "CGColor"));

    v60.origin.x = v12;
    v60.origin.y = v14;
    v60.size.width = v16;
    v60.size.height = v18;
    CGContextFillRect(a3, v60);
LABEL_34:
    CGImageRelease((CGImageRef)v57[3]);
    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v56, 8);
    goto LABEL_35;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125C1D8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E3141C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125C1F8);
  v20 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E3137C(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper drawInContext:forLayer:forShadowOrHitTest:]"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 101, 0, "invalid nil value for '%{public}s'", "rep");

LABEL_35:
}

- (CGRect)p_antialiasingDefeatedRectForRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper rep](self, "rep"));
  v11 = v10;
  if (v10)
  {
    memset(&v36, 0, sizeof(v36));
    objc_msgSend(v10, "imageDrawingHelperImageTransformInRootForAntialiasingDefeat:", self);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C218);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E314A8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C238);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_antialiasingDefeatedRectForRect:inContext:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 184, 0, "invalid nil value for '%{public}s'", "rep");

    memset(&v36, 0, sizeof(v36));
  }
  v35 = v36;
  if (sub_100079384(&v35.a))
  {
    v35 = v36;
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v38 = CGRectApplyAffineTransform(v37, &v35);
    v15 = v38.origin.x;
    v16 = v38.origin.y;
    v17 = v38.size.width;
    v18 = v38.size.height;
    v19 = sub_1004121D0((uint64_t)a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvas"));
    objc_msgSend(v20, "viewScale");
    v22 = v21;

    v23 = sub_100063150(v15, v16, v17, v18, v19 * v22);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v35 = v36;
    CGAffineTransformInvert(&v34, &v35);
    v39.origin.x = v23;
    v39.origin.y = v25;
    v39.size.width = v27;
    v39.size.height = v29;
    v40 = CGRectApplyAffineTransform(v39, &v34);
    x = v40.origin.x;
    y = v40.origin.y;
    width = v40.size.width;
    height = v40.size.height;
  }

  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (BOOL)p_canDrawThumbnailAsSizedImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper rep](self, "rep"));
  v4 = v3;
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C258);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E31534();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C278);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_canDrawThumbnailAsSizedImage]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 207, 0, "invalid nil value for '%{public}s'", "rep");
    v7 = 0;
    goto LABEL_16;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvas"));
  if (objc_msgSend(v5, "isCanvasInteractive"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_validatedBitmapImageProvider](self, "p_validatedBitmapImageProvider"));
    if ((objc_msgSend(v6, "isError") & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v6, "naturalSize");
      v10 = v9;
      v12 = v11;
      v13 = sub_10040EB4C();
      v15 = sub_1000603DC(v13, v14, 0.5);
      v7 = v10 * v12 >= v15 * v16;
    }
LABEL_16:

    goto LABEL_17;
  }
  v7 = 0;
LABEL_17:

  return v7;
}

- (id)contentsRecipeForDirectlyManagedRenderable:(id)a3
{
  return -[CRLImageRepDrawingHelper p_contentsRecipeForDirectlyManagedRenderable:requiringProperlySizedImage:](self, "p_contentsRecipeForDirectlyManagedRenderable:requiringProperlySizedImage:", a3, 1);
}

- (BOOL)canRenderDirectlyManagedForRenderable:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_contentsRecipeForDirectlyManagedRenderable:requiringProperlySizedImage:](self, "p_contentsRecipeForDirectlyManagedRenderable:requiringProperlySizedImage:", a3, 0));
  v4 = v3 != 0;

  return v4;
}

- (id)p_contentsRecipeForDirectlyManagedRenderable:(id)a3 requiringProperlySizedImage:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *sizedImageAccessQueue;
  CRLImageRepLayerContentsRecipe *v9;
  CRLImageRepLayerContentsRecipe *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  _QWORD *v20;
  BOOL v21;
  _QWORD v22[3];
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper rep](self, "rep"));
  if (v7)
  {
    -[CRLImageRepDrawingHelper p_takeSizedImageFromStateIfReady](self, "p_takeSizedImageFromStateIfReady");
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v23 = 1;
    sizedImageAccessQueue = self->_sizedImageAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004144F4;
    block[3] = &unk_10125C2E0;
    block[4] = self;
    v17 = &v32;
    v18 = &v28;
    v19 = &v24;
    v21 = a4;
    v16 = v6;
    v20 = v22;
    dispatch_sync(sizedImageAccessQueue, block);
    if (v33[3])
    {
      v9 = [CRLImageRepLayerContentsRecipe alloc];
      v10 = -[CRLImageRepLayerContentsRecipe initWithImage:orientation:hasBakedMask:](v9, "initWithImage:orientation:hasBakedMask:", v33[3], v29[3], *((unsigned __int8 *)v25 + 24));
    }
    else
    {
      v10 = 0;
    }

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C298);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E31660();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C2B8);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E315C0(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_contentsRecipeForDirectlyManagedRenderable:requiringProperlySizedImage:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 245, 0, "invalid nil value for '%{public}s'", "rep");

    v10 = 0;
  }

  return v10;
}

- (_TtC8Freeform8CRLAsset)imageDataForDrawing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper rep](self, "rep"));
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C300);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E316EC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C320);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper imageDataForDrawing]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 300, 0, "invalid nil value for '%{public}s'", "rep");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageDrawingHelperImageData:", self));
  if ((objc_msgSend(v7, "needsDownload") & 1) != 0
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAsset null](_TtC8Freeform8CRLAsset, "null")),
        v8,
        v7 == v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageDrawingHelperThumbnailImageData:", self));
    v10 = v9;
    if (v9)
    {
      v11 = v9;

      v7 = v11;
    }

  }
  return (_TtC8Freeform8CRLAsset *)v7;
}

- (BOOL)drawsError
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_validatedImageProvider](self, "p_validatedImageProvider"));
  v3 = objc_msgSend(v2, "isError");

  return v3;
}

- (BOOL)drawsBitmap
{
  NSObject *sizedImageAccessQueue;
  BOOL v4;
  unsigned int v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004149C0;
  v9[3] = &unk_10122C5F0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(sizedImageAccessQueue, v9);
  if (!*((_BYTE *)v11 + 24))
  {
    v5 = -[CRLImageRepDrawingHelper p_canDrawThumbnailAsSizedImage](self, "p_canDrawThumbnailAsSizedImage");
    if (v5
      && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_validatedThumbnailImageProvider](self, "p_validatedThumbnailImageProvider"))) != 0)
    {
      v4 = 1;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_validatedBitmapImageProvider](self, "p_validatedBitmapImageProvider"));
      v4 = v7 != 0;

      if (!v5)
        goto LABEL_9;
      v6 = 0;
    }

    goto LABEL_9;
  }
  v4 = 1;
LABEL_9:
  _Block_object_dispose(&v10, 8);
  return v4;
}

- (BOOL)imagePrefersDrawing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char isKindOfClass;
  double v21;
  BOOL v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper rep](self, "rep"));
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C340);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E31778();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C360);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper imagePrefersDrawing]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 330, 0, "invalid nil value for '%{public}s'", "rep");

  }
  -[CRLImageRepDrawingHelper p_imagePixelSize](self, "p_imagePixelSize");
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_validatedImageProvider](self, "p_validatedImageProvider"));
  objc_msgSend(v11, "naturalSize");
  v13 = v12;
  v15 = v14;

  v16 = v8 <= v13 && v10 <= v15;
  v22 = 0;
  if (!v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_imageProvider](self, "p_imageProvider"));
    objc_opt_class(CRLPDFImageProvider, v18);
    isKindOfClass = objc_opt_isKindOfClass(v17, v19);

    if ((isKindOfClass & 1) != 0)
    {
      if (v8 > sub_10040EB4C() || (sub_10040EB4C(), v10 > v21))
        v22 = 1;
    }
  }

  return v22;
}

- (BOOL)shouldShowLoadingUI
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper imageDataForDrawing](self, "imageDataForDrawing"));
  v3 = objc_msgSend(v2, "needsDownload");

  return v3;
}

- (CGSize)p_imagePixelSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper rep](self, "rep"));
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C380);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E31804();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C3A0);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_imagePixelSize]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 358, 0, "invalid nil value for '%{public}s'", "rep");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvas"));
  objc_msgSend(v3, "imageDrawingHelperImageRect:", self);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "viewScale");
  v13 = v12;
  objc_msgSend(v7, "contentsScale");
  v15 = sub_1000603DC(v9, v11, v13 * v14);
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (id)p_imageProvider
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper imageDataForDrawing](self, "imageDataForDrawing"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "providerForAsset:shouldValidate:", v4, 0));

  return v5;
}

- (id)p_validatedImageProvider
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper imageDataForDrawing](self, "imageDataForDrawing"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "providerForAsset:shouldValidate:", v4, 1));

  return v5;
}

- (id)p_validatedBitmapImageProvider
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLBitmapImageProvider, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_validatedImageProvider](self, "p_validatedImageProvider", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)p_validatedThumbnailImageProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper rep](self, "rep"));
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C3C0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E31890();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C3E0);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_validatedThumbnailImageProvider]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 393, 0, "invalid nil value for '%{public}s'", "rep");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageDrawingHelperThumbnailImageData:", self));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "providerForAsset:shouldValidate:", v7, 1));

  objc_opt_class(CRLBitmapImageProvider, v10);
  v12 = sub_100221D0C(v11, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (BOOL)isDesiredImageSizePerceptuallyMuchBiggerThanGeneratedImageSize
{
  CRLImageRepDrawingHelper *v2;
  NSObject *sizedImageAccessQueue;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v2 = self;
  -[CRLImageRepDrawingHelper p_desiredSizedImageSize](self, "p_desiredSizedImageSize");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  sizedImageAccessQueue = v2->_sizedImageAccessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004152B8;
  v7[3] = &unk_10125C408;
  v7[4] = v2;
  v7[5] = &v8;
  v7[6] = v4;
  v7[7] = v5;
  dispatch_sync(sizedImageAccessQueue, v7);
  LOBYTE(v2) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

- (void)generateSizedImageIfNeeded
{
  void *v3;
  void *v4;
  NSObject *sizedImageAccessQueue;
  id v6;
  void **v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  CRLImageRepDrawingHelper *v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_imageProvider](self, "p_imageProvider"));
  if (objc_msgSend(v3, "isValid") && (objc_msgSend(v3, "isError") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_desiredSizedImageDescription](self, "p_desiredSizedImageDescription"));
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    sizedImageAccessQueue = self->_sizedImageAccessQueue;
    v7 = _NSConcreteStackBlock;
    v8 = 3221225472;
    v9 = sub_10041546C;
    v10 = &unk_101234D08;
    v11 = self;
    v6 = v4;
    v12 = v6;
    v13 = v3;
    v14 = &v15;
    dispatch_sync(sizedImageAccessQueue, &v7);
    if (*((_BYTE *)v16 + 24))
      -[CRLImageRepDrawingHelper p_startGeneratingSizedImage](self, "p_startGeneratingSizedImage", v7, v8, v9, v10, v11, v12);

    _Block_object_dispose(&v15, 8);
  }

}

- (id)p_desiredSizedImageDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  TSDSizedImageDescription *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper rep](self, "rep"));
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C428);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3191C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C448);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_desiredSizedImageDescription]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 459, 0, "invalid nil value for '%{public}s'", "rep");

  }
  -[CRLImageRepDrawingHelper p_desiredSizedImageSize](self, "p_desiredSizedImageSize");
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvas"));
  v12 = objc_msgSend(v11, "canvasIsWideGamut");

  v13 = -[TSDSizedImageDescription initWithSize:isWideGamut:hasBakedMask:]([TSDSizedImageDescription alloc], "initWithSize:isWideGamut:hasBakedMask:", v12, objc_msgSend(v3, "imageDrawingHelperShouldBakeMaskIntoSizedImage:", self), v8, v10);
  return v13;
}

- (CGSize)p_desiredSizedImageSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  unint64_t v18;
  double v19;
  double v20;
  void *v21;
  unsigned __int8 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  char isKindOfClass;
  double v32;
  double v33;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper rep](self, "rep"));
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C468);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E319A8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C488);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_desiredSizedImageSize]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 470, 0, "invalid nil value for '%{public}s'", "rep");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_validatedImageProvider](self, "p_validatedImageProvider"));
  objc_msgSend(v7, "naturalSize");
  v9 = v8;
  v11 = v10;

  -[CRLImageRepDrawingHelper p_imagePixelSize](self, "p_imagePixelSize");
  v13 = v12;
  v15 = v14;
  v16 = v11;
  v17 = v9;
  if (CRLWPShapeLayout.columnsAreLeftToRight.getter())
  {
    v16 = v11;
    v17 = v9;
    if (v9 * v11 > (double)sub_10040EA9C())
    {
      v18 = sub_10040EA9C();
      v19 = sub_100062E58(v9, v11, (double)v18);
      v17 = sub_100061064(v19);
      v16 = v20;
    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_imageProvider](self, "p_imageProvider"));
  v22 = objc_msgSend(v21, "isError");

  if ((v22 & 1) != 0 || v13 <= v17 && v15 <= v16)
  {
    v9 = v13;
  }
  else
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_imageProvider](self, "p_imageProvider"));
    objc_opt_class(CRLPDFImageProvider, v29);
    isKindOfClass = objc_opt_isKindOfClass(v28, v30);

    if ((isKindOfClass & 1) != 0)
    {
      v32 = sub_10040EB4C();
      v9 = sub_100062E10(v13, v15, v32, v33);
    }
  }
  v23 = sub_100063090(v9);
  v25 = v24;

  v26 = v23;
  v27 = v25;
  result.height = v27;
  result.width = v26;
  return result;
}

- (void)p_prepareToGenerateSizedImageWithDescription:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id sizedImageOrientation;
  CGPath *v18;
  void *v19;
  CRLImageRepSizingState *v20;
  void *v21;
  CRLImageRepSizingState *v22;
  CRLImageRepSizingState *sizingState;

  v4 = a3;
  v5 = self->_sizedImageAccessQueue;
  if (v5 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper rep](self, "rep"));
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C4A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E31AC0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C4C8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_prepareToGenerateSizedImageWithDescription:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 517, 0, "invalid nil value for '%{public}s'", "rep");

  }
  if (self->_sizingState)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C4E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E31A34();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C508);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_prepareToGenerateSizedImageWithDescription:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 519, 0, "expected nil value for '%{public}s'", "_sizingState");

  }
  objc_msgSend(v4, "size");
  v14 = v13;
  v16 = v15;
  if ((objc_msgSend(v4, "hasBakedMask") & 1) != 0)
  {
    if (self->_sizedImage)
    {
      sizedImageOrientation = (id)self->_sizedImageOrientation;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_validatedBitmapImageProvider](self, "p_validatedBitmapImageProvider"));
      sizedImageOrientation = objc_msgSend(v19, "orientation");

    }
    v18 = (CGPath *)objc_msgSend(v6, "imageDrawingHelper:newMaskPathForSizedImageWithSize:orientation:", self, sizedImageOrientation, v14, v16);
  }
  else
  {
    v18 = 0;
  }
  v20 = [CRLImageRepSizingState alloc];
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_imageProvider](self, "p_imageProvider"));
  v22 = -[CRLImageRepSizingState initWithDesiredSize:provider:maskPath:wideGamutCanvas:](v20, "initWithDesiredSize:provider:maskPath:wideGamutCanvas:", v21, v18, objc_msgSend(v4, "isWideGamut"), v14, v16);
  sizingState = self->_sizingState;
  self->_sizingState = v22;

  if (v18)
  {
    CGPathRelease(self->_sizedImageMaskPath);
    self->_sizedImageMaskPath = v18;
  }

}

- (void)p_startGeneratingSizedImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  CRLImageRepSizingState *sizingState;
  CRLImageRepSizingState *v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  CRLImageRepSizingState *v12;
  _QWORD block[4];
  id v14;
  CRLImageRepDrawingHelper *v15;
  CRLImageRepSizingState *v16;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_sizedImageAccessQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper rep](self, "rep"));
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C528);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E31B4C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C548);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper p_startGeneratingSizedImage]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 540, 0, "invalid nil value for '%{public}s'", "rep");

  }
  v7 = objc_msgSend(v3, "imageDrawingHelperShouldGenerateSizedImageSynchronously:", self);
  sizingState = self->_sizingState;
  if ((v7 & 1) != 0)
  {
    if (-[CRLImageRepDrawingHelper p_generateSizedImage:](self, "p_generateSizedImage:", sizingState))
      objc_msgSend(v3, "imageDrawingHelper:didGenerateSizedImageSynchronously:", self, 1);
  }
  else
  {
    v9 = sizingState;
    global_queue = dispatch_get_global_queue(-2, 0);
    v11 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004161CC;
    block[3] = &unk_10122D3B0;
    v14 = v3;
    v15 = self;
    v16 = v9;
    v12 = v9;
    dispatch_async(v11, block);

  }
}

- (BOOL)p_generateSizedImage:(id)a3
{
  id v4;
  NSObject *sizedImageAccessQueue;
  id v6;
  _QWORD block[4];
  id v9;
  CRLImageRepDrawingHelper *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_sizedImageAccessQueue);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(v4, "generateSizedImage");
  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10041636C;
  block[3] = &unk_101251518;
  v9 = v4;
  v10 = self;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(sizedImageAccessQueue, block);
  LOBYTE(v4) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

- (void)p_takeSizedImageFromStateIfReady
{
  NSObject *sizedImageAccessQueue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_sizedImageAccessQueue);
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100416450;
  v4[3] = &unk_10122C6A0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(sizedImageAccessQueue, v4);
  if (*((_BYTE *)v6 + 24))
    -[CRLImageRepDrawingHelper p_retryGeneratingSizedImageIfPossible](self, "p_retryGeneratingSizedImageIfPossible");
  _Block_object_dispose(&v5, 8);
}

- (void)p_retryGeneratingSizedImageIfPossible
{
  NSObject *sizedImageAccessQueue;
  id v4;
  _QWORD block[5];

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper p_imageProvider](self, "p_imageProvider"));
  if (objc_msgSend(v4, "isValid"))
  {
    sizedImageAccessQueue = self->_sizedImageAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004167FC;
    block[3] = &unk_10122D110;
    block[4] = self;
    dispatch_sync(sizedImageAccessQueue, block);
    -[CRLImageRepDrawingHelper p_startGeneratingSizedImage](self, "p_startGeneratingSizedImage");
  }

}

- (CGImage)sizedImage
{
  NSObject *sizedImageAccessQueue;
  const void *v4;
  CGImage *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[CRLImageRepDrawingHelper p_takeSizedImageFromStateIfReady](self, "p_takeSizedImageFromStateIfReady");
  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100416904;
  v7[3] = &unk_10122C5F0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(sizedImageAccessQueue, v7);
  v4 = (const void *)v9[3];
  if (v4)
  {
    CFAutorelease(v4);
    v5 = (CGImage *)v9[3];
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)invalidateSizedImage
{
  NSObject *sizedImageAccessQueue;
  _QWORD block[5];

  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100416990;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_sync(sizedImageAccessQueue, block);
}

- (void)invalidateSizedImageIfItHasBakedMask
{
  NSObject *sizedImageAccessQueue;
  _QWORD block[5];

  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004169F0;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_sync(sizedImageAccessQueue, block);
}

- (void)invalidateSizedImageIfNeededForBakedMaskPathFromBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *sizedImageAccessQueue;
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[5];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageRepDrawingHelper rep](self, "rep"));
  if (v5)
  {
    sizedImageAccessQueue = self->_sizedImageAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100416C74;
    block[3] = &unk_101231F00;
    block[4] = self;
    v11 = v4;
    dispatch_sync(sizedImageAccessQueue, block);

  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C5A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E31C64();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C5C8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepDrawingHelper invalidateSizedImageIfNeededForBakedMaskPathFromBlock:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepDrawingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 691, 0, "invalid nil value for '%{public}s'", "rep");

  }
}

- (void)p_invalidateSizedImageOnAccessQueue
{
  OS_dispatch_queue *v3;
  CRLImageRepSizingState *sizingState;
  TSDSizedImageDescription *sizedImageDescription;

  v3 = self->_sizedImageAccessQueue;
  if (v3 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread](NSThread, "isMainThread"))
    dispatch_assert_queue_V2((dispatch_queue_t)v3);

  sizingState = self->_sizingState;
  self->_sizingState = 0;

  CGImageRelease(self->_sizedImage);
  sizedImageDescription = self->_sizedImageDescription;
  self->_sizedImage = 0;
  self->_sizedImageDescription = 0;

  CGPathRelease(self->_sizedImageMaskPath);
  self->_sizedImageMaskPath = 0;
}

- (BOOL)isGeneratingSizedImageWithBakedMask
{
  NSObject *sizedImageAccessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100417040;
  v5[3] = &unk_10122C5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sizedImageAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)retryGeneratingSizedImageIfNeeded
{
  NSObject *sizedImageAccessQueue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  sizedImageAccessQueue = self->_sizedImageAccessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100417138;
  v4[3] = &unk_10122C6A0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(sizedImageAccessQueue, v4);
  if (*((_BYTE *)v6 + 24))
    -[CRLImageRepDrawingHelper generateSizedImageIfNeeded](self, "generateSizedImageIfNeeded");
  _Block_object_dispose(&v5, 8);
}

- (CRLImageRepDrawingDataSource)rep
{
  return (CRLImageRepDrawingDataSource *)objc_loadWeakRetained((id *)&self->_rep);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rep);
  objc_storeStrong((id *)&self->_sizedImageDescription, 0);
  objc_storeStrong((id *)&self->_sizingState, 0);
  objc_storeStrong((id *)&self->_sizedImageAccessQueue, 0);
}

@end
