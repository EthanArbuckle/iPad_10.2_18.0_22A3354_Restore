@implementation TSDImager

+ (CGImage)CGImageForInfo:(id)a3 documentRoot:(id)a4
{
  id v5;
  CGImage *v6;

  v5 = objc_msgSend(objc_alloc((Class)TSDImager), "initWithDocumentRoot:", a4);
  v6 = (CGImage *)objc_msgSend(v5, "CGImageForInfo:", a3);

  return v6;
}

+ (id)imageForInfo:(id)a3 layoutRect:(CGRect *)a4 contentsScale:(double)a5 documentRoot:(id)a6
{
  id v9;
  CGImage *v10;
  CGImage *v11;
  id v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  TSUImage *v29;
  CGFloat rect;
  CGFloat rect_8;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v9 = objc_msgSend(objc_alloc((Class)TSDImager), "initWithDocumentRoot:", a6);
  objc_msgSend(v9, "setInfos:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3));
  objc_msgSend(v9, "setViewScale:", a5);
  v10 = (CGImage *)objc_msgSend(v9, "newImage");
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(v9, "p_layoutForInfo:", a3);
    if (v12)
    {
      if (a4)
      {
        v13 = v12;
        objc_msgSend(v12, "frameForCulling");
        v15 = v14;
        rect = v14;
        rect_8 = v16;
        v18 = v17;
        v20 = v19;
        objc_msgSend(v13, "frame");
        x = v33.origin.x;
        y = v33.origin.y;
        width = v33.size.width;
        height = v33.size.height;
        CGRectGetMinX(v33);
        v34.origin.x = v15;
        v34.origin.y = v18;
        v34.size.width = v20;
        v34.size.height = rect_8;
        CGRectGetMinX(v34);
        v35.origin.x = x;
        v35.origin.y = y;
        v35.size.width = width;
        v35.size.height = height;
        CGRectGetMinY(v35);
        v36.origin.x = rect;
        v36.origin.y = v18;
        v36.size.width = v20;
        v36.size.height = rect_8;
        CGRectGetMinY(v36);
        v37.origin.x = x;
        v37.origin.y = y;
        v37.size.width = width;
        v37.size.height = height;
        CGRectGetWidth(v37);
        v38.origin.x = x;
        v38.origin.y = y;
        v38.size.width = width;
        v38.size.height = height;
        CGRectGetHeight(v38);
        a4->origin.x = TSDRoundedRect(v25);
        a4->origin.y = v26;
        a4->size.width = v27;
        a4->size.height = v28;
      }
    }
    else
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSDImager(THAdditions) imageForInfo:layoutRect:contentsScale:documentRoot:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSDImager_THAdditions.m"), 64, CFSTR("invalid nil value for '%s'"), "layout");
    }
    objc_msgSend(v9, "viewScale");
    v29 = +[TSUImage imageWithCGImage:scale:orientation:](TSUImage, "imageWithCGImage:scale:orientation:", v11, 0);
    CGImageRelease(v11);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSDImager(THAdditions) imageForInfo:layoutRect:contentsScale:documentRoot:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSDImager_THAdditions.m"), 80, CFSTR("failed to generate image of shape info"));
    v29 = 0;
  }

  return v29;
}

+ (CGImage)CGImageOfSize:(CGSize)a3 forInfo:(id)a4 documentRoot:(id)a5
{
  double height;
  double width;
  id v8;
  CGImage *v9;

  height = a3.height;
  width = a3.width;
  v8 = objc_msgSend(objc_alloc((Class)TSDImager), "initWithDocumentRoot:", a5);
  v9 = (CGImage *)objc_msgSend(v8, "CGImageOfSize:forInfo:", a4, width, height);

  return v9;
}

+ (id)imageSizedForShapeWithSinglePixelStroke:(id)a3 contentsScale:(double)a4 documentRoot:(id)a5
{
  id v7;
  id v8;

  v7 = objc_msgSend(objc_alloc((Class)TSDImager), "initWithDocumentRoot:", a5);
  v8 = objc_msgSend(v7, "imageSizedForShapeWithSinglePixelStroke:contentsScale:", a3, a4);

  return v8;
}

- (CGImage)CGImageForInfo:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = -[TSDImager infos](self, "infos");
  v6 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a3, 0);
  -[TSDImager setInfos:](self, "setInfos:", v6);
  v7 = -[TSDImager newImage](self, "newImage");
  -[TSDImager setInfos:](self, "setInfos:", v5);

  v8 = v7;
  return (CGImage *)v7;
}

- (CGImage)CGImageOfSize:(CGSize)a3 forInfo:(id)a4
{
  -[TSDImager setScaledImageSize:](self, "setScaledImageSize:", a3.width, a3.height);
  return -[TSDImager CGImageForInfo:](self, "CGImageForInfo:", a4);
}

- (id)imageSizedForShapeWithSinglePixelStroke:(id)a3 contentsScale:(double)a4
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  CGImage *v12;

  -[TSDImager setUnscaledClipRect:](self, "setUnscaledClipRect:", TSDRectWithSize(objc_msgSend(objc_msgSend(objc_msgSend(a3, "pathSource"), "bezierPath"), "bounds")));
  -[TSDImager setViewScale:](self, "setViewScale:", a4);
  v7 = objc_msgSend(a3, "geometry");
  v8 = objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v8, "setPosition:", 0.5, 0.5);
  objc_msgSend(v7, "size");
  v10 = v9 + -1.0;
  objc_msgSend(v7, "size");
  objc_msgSend(v8, "setSize:", v10, v11 + -1.0);
  objc_msgSend(a3, "setGeometry:", v8);

  v12 = -[TSDImager CGImageForInfo:](self, "CGImageForInfo:", a3);
  objc_msgSend(a3, "setGeometry:", v7);

  -[TSDImager viewScale](self, "viewScale");
  return +[TSUImage imageWithCGImage:scale:orientation:](TSUImage, "imageWithCGImage:scale:orientation:", v12, 0);
}

+ (id)imageForStorage:(id)a3 maxWidth:(double)a4 lines:(id *)a5 contentsScale:(double)a6 documentRoot:(id)a7
{
  return objc_msgSend(a1, "imageForStorage:maxWidth:lines:layoutRect:useCullingRect:maxLines:allowsLastLineTruncation:contentsScale:documentRoot:", a3, a5, 0, 0, 0, 0, a4, a6, a7);
}

+ (id)imageForStorage:(id)a3 maxWidth:(double)a4 lines:(id *)a5 layoutRect:(CGRect *)a6 useCullingRect:(BOOL)a7 maxLines:(unint64_t)a8 allowsLastLineTruncation:(BOOL)a9 contentsScale:(double)a10 documentRoot:(id)a11
{
  _BOOL8 v12;
  _BOOL8 v14;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  __objc2_class **v23;
  id v24;
  id v25;

  v12 = a9;
  v14 = a7;
  v19 = objc_msgSend(objc_alloc((Class)TSSStylesheet), "initWithContext:", objc_msgSend(a3, "context"));
  v20 = +[TSWPShapeStyle defaultStyleWithContext:](TSWPShapeStyle, "defaultStyleWithContext:", objc_msgSend(a3, "context"));
  objc_msgSend(v20, "setValue:forProperty:", +[TSDStroke emptyStroke](TSDStroke, "emptyStroke"), 517);
  objc_msgSend(v20, "setIntValue:forProperty:", a8, 155);
  objc_msgSend(v19, "addStyle:", v20);
  v22 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithWidth:", a4);
  v23 = off_424EE0;
  if (!v14)
    v23 = (__objc2_class **)TSWPShapeInfo_ptr;
  v24 = objc_msgSend(objc_alloc((Class)objc_opt_class(*v23, v21)), "initWithContext:geometry:style:wpStorage:", objc_msgSend(a3, "context"), v22, v20, a3);
  objc_msgSend(v24, "setAllowsLastLineTruncation:", v12);
  v25 = objc_msgSend(a1, "imageForShapeInfo:viewScale:screenScale:lines:layoutRect:useCullingRect:documentRoot:", v24, a5, a6, v14, a11, 1.0, a10);

  return v25;
}

+ (id)imageForShapeInfo:(id)a3 viewScale:(double)a4 screenScale:(double)a5 lines:(id *)a6 documentRoot:(id)a7
{
  return objc_msgSend(a1, "imageForShapeInfo:viewScale:screenScale:lines:layoutRect:useCullingRect:documentRoot:", a3, a6, 0, 0, a7, a4, a5);
}

+ (id)imageForShapeInfo:(id)a3 viewScale:(double)a4 screenScale:(double)a5 lines:(id *)a6 layoutRect:(CGRect *)a7 useCullingRect:(BOOL)a8 documentRoot:(id)a9
{
  _BOOL4 v9;
  id v15;
  CGImage *v16;
  uint64_t v17;
  CGImage *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  TSUImage *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;

  v9 = a8;
  v15 = objc_msgSend(objc_alloc((Class)TSDImager), "initWithDocumentRoot:", a9);
  objc_msgSend(v15, "setInfos:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3));
  objc_msgSend(v15, "setViewScale:", a4 * a5);
  v16 = (CGImage *)objc_msgSend(v15, "newImage");
  if (v16)
  {
    v18 = v16;
    v19 = objc_opt_class(TSWPShapeRep, v17);
    v21 = (void *)TSUDynamicCast(v19, objc_msgSend(v15, "p_repForInfo:", a3));
    if (!v21)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSDImager(THAdditions) imageForShapeInfo:viewScale:screenScale:lines:layoutRect:useCullingRect:documentRoot:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSDImager_THAdditions.m"), 211, CFSTR("invalid nil value for '%s'"), "shapeRep");
    v22 = objc_opt_class(THWPRep, v20);
    v23 = (void *)TSUDynamicCast(v22, objc_msgSend(v21, "containedRep"));
    if (!v23)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSDImager(THAdditions) imageForShapeInfo:viewScale:screenScale:lines:layoutRect:useCullingRect:documentRoot:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSDImager_THAdditions.m"), 214, CFSTR("invalid nil value for '%s'"), "wpRep");
    if (a6)
      *a6 = objc_msgSend(v23, "allLines");
    if (a7)
    {
      if (v9)
        objc_msgSend(objc_msgSend(v21, "layout"), "frameForCulling");
      a7->origin.x = TSDRoundedRect(objc_msgSend(objc_msgSend(v21, "layout"), "frame"));
      a7->origin.y = v25;
      a7->size.width = v26;
      a7->size.height = v27;
    }
    v24 = +[TSUImage imageWithCGImage:scale:orientation:](TSUImage, "imageWithCGImage:scale:orientation:", v18, 0, a5);
    CGImageRelease(v18);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSDImager(THAdditions) imageForShapeInfo:viewScale:screenScale:lines:layoutRect:useCullingRect:documentRoot:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSDImager_THAdditions.m"), 234, CFSTR("failed to generate image of shape info"));
    v24 = 0;
  }

  return v24;
}

- (id)p_layoutForInfo:(id)a3
{
  id v4;

  v4 = objc_msgSend(-[TSDImager canvas](self, "canvas"), "layoutController");
  if (!v4)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSDImager(THPrivateAdditions) p_layoutForInfo:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSDImager_THAdditions.m"), 250, CFSTR("invalid nil value for '%s'"), "layoutController");
  return objc_msgSend(v4, "layoutForInfo:", a3);
}

- (id)p_repForInfo:(id)a3
{
  id v4;

  v4 = -[TSDImager p_layoutForInfo:](self, "p_layoutForInfo:", a3);
  if (!v4)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSDImager(THPrivateAdditions) p_repForInfo:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSDImager_THAdditions.m"), 258, CFSTR("invalid nil value for '%s'"), "layout");
  return objc_msgSend(-[TSDImager canvas](self, "canvas"), "repForLayout:", v4);
}

@end
