@implementation THWWebInfo

- (THWWebInfo)initWithContext:(id)a3 geometry:(id)a4 stageGeometry:(id)a5 sourceURL:(id)a6 drmContext:(id)a7 exposurePolicy:(int)a8 ignoreInfoPlist:(BOOL)a9 allowNetworkAccess:(BOOL)a10 autoplayConfig:(id)a11
{
  THWWebInfo *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)THWWebInfo;
  v15 = -[THWWebInfo initWithContext:geometry:](&v17, "initWithContext:geometry:", a3, a4);
  if (v15)
  {
    v15->_stageGeometry = (TSDInfoGeometry *)a5;
    v15->_sourceURL = (NSURL *)a6;
    v15->_drmContext = (PFDContext *)a7;
    v15->_exposurePolicy = a8;
    v15->_ignoreInfoPlist = a9;
    v15->_allowNetworkAccess = a10;
    v15->_autoplayConfig = (THWAutoplayConfig *)a11;
  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWWebInfo;
  -[THWWebInfo dealloc](&v3, "dealloc");
}

- (CGSize)idealWebSize
{
  CGSize *p_idealWebSize;
  double width;
  double height;
  double v5;
  NSData *v8;
  NSDictionary *v9;
  uint64_t v10;
  double v11;
  id v12;
  float v13;
  float v14;
  uint64_t v15;
  double v16;
  id v17;
  uint64_t v18;
  double v19;
  id v20;
  float v21;
  uint64_t v22;
  double v23;
  id v24;
  BOOL v25;
  double v26;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGSize result;

  p_idealWebSize = &self->_idealWebSize;
  width = self->_idealWebSize.width;
  height = self->_idealWebSize.height;
  v5 = CGSizeZero.height;
  if (width == CGSizeZero.width && height == v5)
  {
    if (!self->_ignoreInfoPlist)
    {
      v8 = +[NSData dataWithContentsOfURL:drmContext:error:](NSData, "dataWithContentsOfURL:drmContext:error:", -[NSURL URLByAppendingPathComponent:](-[NSURL URLByDeletingLastPathComponent](-[THWWebInfo sourceURL](self, "sourceURL"), "URLByDeletingLastPathComponent"), "URLByAppendingPathComponent:", CFSTR("Info.plist")), -[THWWebInfo drmContext](self, "drmContext"), 0);
      if (!v8)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebInfo idealWebSize]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebInfo.m"), 99, CFSTR("invalid nil value for '%s'"), "infoPlistData");
      v9 = +[NSDictionary dictionaryWithContentsOfPlistData:](NSDictionary, "dictionaryWithContentsOfPlistData:", v8);
      if (!v9)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWWebInfo idealWebSize]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Web/THWWebInfo.m"), 101, CFSTR("Expected a valid Info.plist inside web widget"));
      v10 = objc_opt_class(NSNumber);
      *(_QWORD *)&v11 = TSUDynamicCast(v10, -[NSDictionary objectForKey:](v9, "objectForKey:", CFSTR("Width"))).n128_u64[0];
      objc_msgSend(v12, "floatValue", v11);
      v14 = v13;
      if (v13 == 0.0)
      {
        v15 = objc_opt_class(NSString);
        *(_QWORD *)&v16 = TSUDynamicCast(v15, -[NSDictionary objectForKey:](v9, "objectForKey:", CFSTR("Width"))).n128_u64[0];
        v14 = (float)(int)objc_msgSend(v17, "intValue", v16);
      }
      v18 = objc_opt_class(NSNumber);
      *(_QWORD *)&v19 = TSUDynamicCast(v18, -[NSDictionary objectForKey:](v9, "objectForKey:", CFSTR("Height"))).n128_u64[0];
      objc_msgSend(v20, "floatValue", v19);
      if (v21 == 0.0)
      {
        v22 = objc_opt_class(NSString);
        *(_QWORD *)&v23 = TSUDynamicCast(v22, -[NSDictionary objectForKey:](v9, "objectForKey:", CFSTR("Height"))).n128_u64[0];
        v21 = (float)(int)objc_msgSend(v24, "intValue", v23);
      }
      v25 = v21 > 0.0;
      v26 = v21;
      if (v14 > 0.0 && v25)
      {
        height = v26;
        width = v14;
      }
    }
    if (width == CGSizeZero.width && height == v5)
    {
      v28 = -[THWWebInfo p_defaultImage](self, "p_defaultImage");
      if (v28)
      {
        objc_msgSend(v28, "size");
        width = v29;
        height = v30;
      }
      else
      {
        -[TSDInfoGeometry boundsBeforeRotation](-[THWWebInfo stageGeometry](self, "stageGeometry"), "boundsBeforeRotation");
        width = v31;
        height = v32;
      }
    }
    p_idealWebSize->width = width;
    p_idealWebSize->height = height;
  }
  v33 = width;
  v34 = height;
  result.height = v34;
  result.width = v33;
  return result;
}

- (TSUImage)defaultImage
{
  TSUImage *result;

  result = -[THWWebInfo p_defaultImage](self, "p_defaultImage");
  if (!result)
    return (TSUImage *)-[THWWebInfo p_placeholderImage](self, "p_placeholderImage");
  return result;
}

- (TSUImage)placeholderImage
{
  TSUImage *result;

  result = -[THWWebInfo p_placeholderImage](self, "p_placeholderImage");
  if (!result)
    return (TSUImage *)-[THWWebInfo p_defaultImage](self, "p_defaultImage");
  return result;
}

- (NSString)bookID
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = objc_opt_class(THDocumentRoot);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWWebInfo documentRoot](self, "documentRoot")).n128_u64[0];
  return (NSString *)objc_msgSend(objc_msgSend(v5, "bookDescription", v4), "annotationID");
}

- (NSURL)bookBundleURL
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = objc_opt_class(THDocumentRoot);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, -[THWWebInfo documentRoot](self, "documentRoot")).n128_u64[0];
  return (NSURL *)objc_msgSend(objc_msgSend(v5, "bookDescription", v4), "bookBundleUrl");
}

- (void)setPlaceholderInfo:(id)a3
{
  TSDInfo *placeholderInfo;

  placeholderInfo = self->_placeholderInfo;
  if (placeholderInfo != a3)
  {

    self->_placeholderInfo = (TSDInfo *)a3;
  }
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THWWebLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THWWebRep, a2);
}

- (id)p_loadImageWithFilename:(id)a3
{
  id result;
  NSData *v6;

  result = -[NSURL URLByAppendingPathComponent:](-[NSURL URLByDeletingLastPathComponent](-[THWWebInfo sourceURL](self, "sourceURL"), "URLByDeletingLastPathComponent"), "URLByAppendingPathComponent:", a3);
  if (result)
  {
    v6 = +[NSData dataWithContentsOfURL:drmContext:error:](NSData, "dataWithContentsOfURL:drmContext:error:", result, -[THWWebInfo drmContext](self, "drmContext"), 0);
    if (!v6)
      v6 = +[NSData dataWithContentsOfURL:drmContext:error:](NSData, "dataWithContentsOfURL:drmContext:error:", -[NSURL URLByAppendingPathComponent:](-[NSURL URLByDeletingLastPathComponent](-[THWWebInfo sourceURL](self, "sourceURL"), "URLByDeletingLastPathComponent"), "URLByAppendingPathComponent:", objc_msgSend(a3, "lowercaseString")), -[THWWebInfo drmContext](self, "drmContext"), 0);
    return +[TSUImage imageWithData:](TSUImage, "imageWithData:", v6);
  }
  return result;
}

- (id)p_defaultImage
{
  id result;

  if (TSUScreenScale(self, a2) <= 1.0)
    return -[THWWebInfo p_loadImageWithFilename:](self, "p_loadImageWithFilename:", CFSTR("Default.png"));
  result = -[THWWebInfo p_loadImageWithFilename:](self, "p_loadImageWithFilename:", CFSTR("Default@2x.png"));
  if (!result)
    return -[THWWebInfo p_loadImageWithFilename:](self, "p_loadImageWithFilename:", CFSTR("Default.png"));
  return result;
}

- (id)p_placeholderImage
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;
  id result;

  if (!self->_placeholderInfo)
    return 0;
  v3 = objc_opt_class(TSDImageInfo);
  *(_QWORD *)&v5 = TSUDynamicCast(v3, self->_placeholderInfo).n128_u64[0];
  if (!v4)
    return +[TSUImage imageWithCGImage:](TSUImage, "imageWithCGImage:", +[TSDImager CGImageForInfo:documentRoot:](TSDImager, "CGImageForInfo:documentRoot:", self->_placeholderInfo, -[THWWebInfo documentRoot](self, "documentRoot", v5)));
  v6 = v4;
  objc_msgSend(v4, "opacity", v5);
  if (*(float *)&v5 != 1.0
    || objc_msgSend(v6, "maskInfo")
    || objc_msgSend(v6, "reflection")
    || objc_msgSend(v6, "stroke") && (objc_msgSend(objc_msgSend(v6, "stroke"), "shouldRender") & 1) != 0)
  {
    return +[TSUImage imageWithCGImage:](TSUImage, "imageWithCGImage:", +[TSDImager CGImageForInfo:documentRoot:](TSDImager, "CGImageForInfo:documentRoot:", self->_placeholderInfo, -[THWWebInfo documentRoot](self, "documentRoot", v5)));
  }
  if (objc_msgSend(v6, "shadow") && (objc_msgSend(objc_msgSend(v6, "shadow"), "isEnabled") & 1) != 0)
    return +[TSUImage imageWithCGImage:](TSUImage, "imageWithCGImage:", +[TSDImager CGImageForInfo:documentRoot:](TSDImager, "CGImageForInfo:documentRoot:", self->_placeholderInfo, -[THWWebInfo documentRoot](self, "documentRoot", v5)));
  result = +[TSUImage imageWithImageData:](TSUImage, "imageWithImageData:", objc_msgSend(v6, "imageData"));
  if (!result)
    return +[TSUImage imageWithCGImage:](TSUImage, "imageWithCGImage:", +[TSDImager CGImageForInfo:documentRoot:](TSDImager, "CGImageForInfo:documentRoot:", self->_placeholderInfo, -[THWWebInfo documentRoot](self, "documentRoot", v5)));
  return result;
}

- (THWWidgetAdornmentInfo)adornmentInfo
{
  return self->_adornmentInfo;
}

- (void)setAdornmentInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)progressKitID
{
  return self->_progressKitID;
}

- (void)setProgressKitID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)progressKitSectionID
{
  return self->_progressKitSectionID;
}

- (void)setProgressKitSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (TSDInfoGeometry)stageGeometry
{
  return self->_stageGeometry;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (PFDContext)drmContext
{
  return self->_drmContext;
}

- (int)exposurePolicy
{
  return self->_exposurePolicy;
}

- (BOOL)allowNetworkAccess
{
  return self->_allowNetworkAccess;
}

- (THWAutoplayConfig)autoplayConfig
{
  return self->_autoplayConfig;
}

- (BOOL)ignoreInfoPlist
{
  return self->_ignoreInfoPlist;
}

- (void)setIgnoreInfoPlist:(BOOL)a3
{
  self->_ignoreInfoPlist = a3;
}

- (TSDInfo)placeholderInfo
{
  return self->_placeholderInfo;
}

@end
