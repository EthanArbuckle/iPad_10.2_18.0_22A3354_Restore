@implementation CRLImageResamplingOperation

- (CRLImageResamplingOperation)initWithImageProvider:(id)a3 desiredSize:(CGSize)a4 assetOwner:(id)a5
{
  double height;
  double width;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  CRLImageResamplingOperation *v15;
  CRLImageResamplingOperation *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *v22;
  void *v23;
  objc_super v25;
  CGSize v26;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a5;
  if (!v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241C80);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E07F70();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241CA0);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation initWithImageProvider:desiredSize:assetOwner:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 41, 0, "Invalid parameter not satisfying: %{public}s", "imageProvider != nil");

  }
  v25.receiver = self;
  v25.super_class = (Class)CRLImageResamplingOperation;
  v15 = -[CRLImageResamplingOperation init](&v25, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->mImageProvider, a3);
    v16->mDesiredSize.width = width;
    v16->mDesiredSize.height = height;
    objc_storeStrong((id *)&v16->mAssetOwner, a5);
    if (CRLWPShapeLayout.columnsAreLeftToRight.getter())
    {
      if (width * height > (double)sub_10040EA9C())
      {
        v17 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101241CC0);
        v18 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E07E80(v18, v17, width, height);
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101241CE0);
        v19 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation initWithImageProvider:desiredSize:assetOwner:]"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"));
        v26.width = width;
        v26.height = height;
        v22 = NSStringFromCGSize(v26);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 47, 0, "Should not be resampling an image to this size %{public}@ on a platform with memory limits!", v23);

      }
    }
  }

  return v16;
}

- (CRLImageResamplingOperation)init
{
  unsigned int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  unsigned int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v2 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101241D00);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLImageResamplingOperation init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m";
    v17 = 1024;
    v18 = 55;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101241D20);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v12 = v2;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 55, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLImageResamplingOperation init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (void)setDesiredAlternateSizeIfConvertedToPNG:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  height = a3.height;
  width = a3.width;
  -[CRLImageResamplingOperation desiredSize](self, "desiredSize");
  if (width <= v6 && (-[CRLImageResamplingOperation desiredSize](self, "desiredSize"), height <= v7))
  {
    self->mDesiredAlternateSizeIfConvertedToPNG.width = width;
    self->mDesiredAlternateSizeIfConvertedToPNG.height = height;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241D40);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E08000();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241D60);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation setDesiredAlternateSizeIfConvertedToPNG:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 66, 0, "Should not provide a size that is larger than our default size!");

  }
}

- (id)performResampleOperationWithResampleOptions:(unint64_t)a3 bitmapContextOptions:(unint64_t)a4
{
  char v4;
  char v5;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v35;
  __CFString *v36;
  void *v37;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v38;
  CGImageSource *v39;
  CGImageSource *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  void *v58;
  UTType *v59;
  UTType *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  char v66;
  double v67;
  void *v68;
  const __CFDictionary *v69;
  CGImage *ThumbnailAtIndex;
  char v71;
  char v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  CGImage *v78;
  CGContext *v79;
  CGImage *v80;
  void *v81;
  id v82;
  char v83;
  CGInterpolationQuality v84;
  double v85;
  CFStringRef Type;
  double v87;
  void *v88;
  int v89;
  void *v90;
  uint64_t v91;
  const __CFDictionary *v92;
  __CFData *v93;
  __CFString *v94;
  CGImageDestination *v95;
  void *v96;
  const __CFDictionary *v97;
  void *v98;
  __CFDictionary *Mutable;
  const __CFDictionary *v100;
  const void *Value;
  const void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  id v109;
  const __CFDictionary *v110;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v111;
  _TtP8Freeform14CRLAssetOwning_ *mAssetOwner;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  _TtC8Freeform27CRLPreinsertionAssetWrapper *v117;
  void *v119;
  CGImage *ImageAtIndex;
  double v121;
  double v122;
  CGFloat v123;
  double v124;
  CGFloat v125;
  double v126;
  CGFloat v127;
  double MinY;
  CGFloat MaxY;
  uint64_t v130;
  const __CFDictionary *cf;
  void *v132;
  void *v133;
  UTType *v134;
  void *v135;
  CGImageSource *isrc;
  char v137;
  int v138;
  unsigned int v139;
  const __CFDictionary *v140;
  id v141;
  CGAffineTransform transform;
  CFStringRef v143;
  void *v144;
  const __CFString *v145;
  void *v146;
  _QWORD v147[3];
  _QWORD v148[3];
  CGRect v149;
  CGRect v150;
  CGRect v151;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageResamplingOperation imageProvider](self, "imageProvider"));
  objc_msgSend(v7, "naturalSize");
  v9 = v8;
  v11 = v10;

  if ((v5 & 8) != 0)
  {
    -[CRLImageResamplingOperation desiredAlternateSizeIfConvertedToPNG](self, "desiredAlternateSizeIfConvertedToPNG");
    if (v13 != CGSizeZero.width || v12 != CGSizeZero.height)
    {
      v15 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241D80);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
        sub_100E08380();

      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241DA0);
      v17 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
        sub_100E081AC(v15, v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation performResampleOperationWithResampleOptions:bitmapContextOptions:]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 81, 0, "Should not specify an alternate size if a precise size is required!");

    }
  }
  v20 = v5 & 1;
  -[CRLImageResamplingOperation desiredSize](self, "desiredSize");
  v25 = sub_100060C18(v21, v22, 1.0);
  v26 = v24;
  if ((v5 & 8) == 0)
  {
    v25 = sub_100062E78(0, v9, v11, v25, v24);
    v26 = v27;
  }
  if ((v5 & 1) != 0)
    v28 = 0.5;
  else
    v28 = 0.699999988;
  *(_QWORD *)&v29 = objc_opt_class(CRLBitmapImageProvider, v23).n128_u64[0];
  v31 = v30;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageResamplingOperation imageProvider](self, "imageProvider", v29));
  v33 = sub_100221D0C(v31, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

  if ((v5 & 2) == 0 && !v34)
  {
    v35 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CRLImageResamplingOperation imageProvider](self, "imageProvider"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString imageData](v36, "imageData"));
    v38 = -[CRLPreinsertionAssetWrapper initWithAlreadyInsertedAsset:owner:](v35, "initWithAlreadyInsertedAsset:owner:", v37, self->mAssetOwner);
    goto LABEL_141;
  }
  v39 = (CGImageSource *)objc_msgSend(v34, "CGImageSource");
  isrc = v39;
  if (v39 && (v40 = v39, CGImageSourceGetStatus(v39) == kCGImageStatusComplete))
  {
    v110 = CGImageSourceCopyPropertiesAtIndex(v40, 0, 0);
    if (v110)
    {
      cf = v110;
      v137 = 1;
      v139 = CFDictionaryGetValue(v110, kCGImagePropertyHasAlpha) == kCFBooleanTrue;
      goto LABEL_27;
    }
    v137 = 1;
  }
  else
  {
    v137 = 0;
  }
  cf = 0;
  v139 = objc_msgSend(v34, "isOpaque") ^ 1;
LABEL_27:
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageResamplingOperation displayName](self, "displayName"));
  v36 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stringByDeletingPathExtension"));

  if (!v36 || !-[__CFString length](v36, "length"))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageResamplingOperation imageProvider](self, "imageProvider"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "imageData"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "filename"));
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stringByDeletingPathExtension"));

    if (v45 && -[__CFString length](v45, "length"))
    {
      v36 = v45;
    }
    else
    {

      v36 = CFSTR("image");
    }
  }
  v135 = v34;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageResamplingOperation displayName](self, "displayName"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "pathExtension"));

  if (!v37 || !objc_msgSend(v37, "length"))
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageResamplingOperation imageProvider](self, "imageProvider"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "imageData"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "filename"));
    v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "pathExtension"));

    v37 = (void *)v50;
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithTag:tagClass:conformingToType:](UTType, "typeWithTag:tagClass:conformingToType:", v37, UTTagClassFilenameExtension, 0));
  v132 = v51;
  if (!v51)
  {
    v52 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241DC0);
    v53 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_ERROR))
      sub_100E082F0();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241DE0);
    v54 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_ERROR))
      sub_100E081AC(v52, v54);

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation performResampleOperationWithResampleOptions:bitmapContextOptions:]"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v55, v56, 129, 0, "invalid nil value for '%{public}s'", "utTypeForOriginalFile");

    v51 = 0;
  }
  if ((objc_msgSend(v51, "conformsToType:", UTTypeJPEG) & 1) != 0)
  {
    v57 = 1;
  }
  else
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes highEfficiencyImageUTTypes](CRLIngestionTypes, "highEfficiencyImageUTTypes"));
    if ((objc_msgSend(v51, "crl_conformsToAnyUTType:", v58) & 1) != 0)
      v57 = 1;
    else
      v57 = objc_msgSend(v51, "conformsToType:", UTTypeWebP);

  }
  if (v139 | v57 ^ 1)
    v59 = UTTypePNG;
  else
    v59 = UTTypeJPEG;
  v60 = v59;
  if (-[UTType isEqual:](v60, "isEqual:", UTTypePNG))
  {
    -[CRLImageResamplingOperation desiredAlternateSizeIfConvertedToPNG](self, "desiredAlternateSizeIfConvertedToPNG");
    if (v62 != CGSizeZero.width || v61 != CGSizeZero.height)
    {
      -[CRLImageResamplingOperation desiredAlternateSizeIfConvertedToPNG](self, "desiredAlternateSizeIfConvertedToPNG");
      v25 = sub_100062E78(0, v9, v11, v63, v64);
      v26 = v65;
    }
  }
  v130 = objc_claimAutoreleasedReturnValue(-[UTType preferredFilenameExtension](v60, "preferredFilenameExtension"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathExtension:](v36, "stringByAppendingPathExtension:"));
  v134 = v60;
  v66 = v137 ^ 1;
  if ((v5 & 0x18) != 0)
    v66 = 1;
  if ((v66 & 1) != 0 || v25 >= v9 || v26 >= v11)
    goto LABEL_150;
  v147[0] = kCGImageSourceCreateThumbnailFromImageAlways;
  v147[1] = kCGImageSourceCreateThumbnailWithTransform;
  v148[0] = &__kCFBooleanTrue;
  v148[1] = &__kCFBooleanTrue;
  v147[2] = kCGImageSourceThumbnailMaxPixelSize;
  v67 = v25 >= v26 ? v25 : v26;
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v67));
  v148[2] = v68;
  v69 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v148, v147, 3));

  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(isrc, 0, v69);
  if (!ThumbnailAtIndex)
  {
LABEL_150:
    v71 = v4 | 2;
    if (!v139)
      v71 = v4;
    v72 = v71 | (4 * v20);
    v73 = sub_100063090(v25);
    v75 = v74;
    if ((v137 & 1) == 0)
      goto LABEL_151;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageResamplingOperation imageProvider](self, "imageProvider"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "imageData"));
    v78 = (CGImage *)objc_msgSend(v77, "newCGImage");

    v79 = sub_10040FEFC(v78, v72, v73, v75);
    v80 = v78;
    v60 = v134;
    CGImageRelease(v80);
    if (!v79)
    {
LABEL_151:
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageResamplingOperation imageProvider](self, "imageProvider"));
      v82 = objc_msgSend(v81, "imageGamut");

      v83 = v82 == (id)2 ? v72 : v72 | 0x20;
      v79 = sub_10040FA64(v83, v73, v75);
      if (!v79)
        goto LABEL_104;
    }
    v84 = v20 ? kCGInterpolationNone : kCGInterpolationLow;
    CGContextSetInterpolationQuality(v79, v84);
    if (v139)
    {
      v73 = v25;
      v85 = v26;
    }
    else
    {
      v85 = v75;
    }
    if (isrc
      && ((Type = CGImageSourceGetType(isrc), v9 / v73 >= v11 / v85) ? (v87 = v9 / v73) : (v87 = v11 / v85),
          objc_msgSend(v135, "isValid")
       && (v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeJPEG, "identifier")),
           v89 = CFEqual(Type, v88),
           v88,
           v89)
       && v87 >= 2.0))
    {
      if (v87 >= 8.0)
      {
        v91 = 8;
        v90 = v135;
      }
      else
      {
        v90 = v135;
        if (v87 >= 4.0)
          v91 = 4;
        else
          v91 = 2;
      }
      v145 = CFSTR("kCGImageSourceSubsampleFactor");
      v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v91));
      v146 = v119;
      v92 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1));

      ImageAtIndex = CGImageSourceCreateImageAtIndex(isrc, 0, v92);
      v121 = sub_10005FDDC();
      v123 = v122;
      v125 = v124;
      v127 = v126;
      CGContextSaveGState(v79);
      v149.origin.x = v121;
      v149.origin.y = v123;
      v149.size.width = v125;
      v149.size.height = v127;
      MinY = CGRectGetMinY(v149);
      v150.origin.x = v121;
      v150.origin.y = v123;
      v150.size.width = v125;
      v150.size.height = v127;
      MaxY = CGRectGetMaxY(v150);
      CGContextTranslateCTM(v79, 0.0, MinY + MaxY);
      CGContextScaleCTM(v79, 1.0, -1.0);
      sub_1003F6270((CGAffineTransform *)objc_msgSend(v90, "orientation"), 1, (uint64_t)&transform, v121, v123, v125, v127);
      CGContextConcatCTM(v79, &transform);
      v151.origin.x = v121;
      v151.origin.y = v123;
      v151.size.width = v125;
      v151.size.height = v127;
      CGContextDrawImage(v79, v151, ImageAtIndex);
      if (ImageAtIndex)
        CFRelease(ImageAtIndex);
      CGContextRestoreGState(v79);
      v60 = v134;
    }
    else
    {
      v92 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[CRLImageResamplingOperation imageProvider](self, "imageProvider"));
      -[__CFDictionary drawImageInContext:rect:](v92, "drawImageInContext:rect:", v79, sub_10005FDDC());
    }

    ThumbnailAtIndex = CGBitmapContextCreateImage(v79);
    CGContextRelease(v79);
    if (!ThumbnailAtIndex)
    {
LABEL_104:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241E00);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0808C();
      v34 = v135;
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241E20);
      v103 = (void *)v130;
      v104 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v104);
      v93 = (__CFData *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation performResampleOperationWithResampleOptions:bitmapContextOptions:]"));
      v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v93, v105, 239, 0, "invalid nil value for '%{public}s'", "resampledImage");

      v38 = 0;
      v106 = v132;
      goto LABEL_138;
    }
  }
  v93 = (__CFData *)objc_alloc_init((Class)NSMutableData);
  v94 = (__CFString *)objc_claimAutoreleasedReturnValue(-[UTType identifier](v60, "identifier"));
  v95 = CGImageDestinationCreateWithData(v93, v94, 1uLL, 0);

  if (v95)
  {
    v143 = kCGImageDestinationLossyCompressionQuality;
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v28));
    v144 = v96;
    v97 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1));

    v98 = v97;
    CGImageDestinationSetProperties(v95, v97);
    if ((v137 & 1) != 0)
    {
      v140 = v97;
      Mutable = CFDictionaryCreateMutable(0, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionaryAddValue(Mutable, kCGImageDestinationLossyCompressionQuality, +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v28));
      v100 = CGImageSourceCopyPropertiesAtIndex(isrc, 0, 0);
      if (CFDictionaryContainsKey(v100, kCGImagePropertyDPIWidth))
      {
        Value = CFDictionaryGetValue(v100, kCGImagePropertyDPIWidth);
        CFDictionaryAddValue(Mutable, kCGImagePropertyDPIWidth, Value);
      }
      v34 = v135;
      if (CFDictionaryContainsKey(v100, kCGImagePropertyDPIHeight))
      {
        v102 = CFDictionaryGetValue(v100, kCGImagePropertyDPIHeight);
        CFDictionaryAddValue(Mutable, kCGImagePropertyDPIHeight, v102);
      }
      CGImageDestinationAddImage(v95, ThumbnailAtIndex, Mutable);
      if (v100)
        CFRelease(v100);
      v98 = v140;
      if (Mutable)
        CFRelease(Mutable);
    }
    else
    {
      CGImageDestinationAddImage(v95, ThumbnailAtIndex, 0);
      v34 = v135;
    }
    CGImageDestinationFinalize(v95);
    CFRelease(v95);
    v111 = [_TtC8Freeform27CRLPreinsertionAssetWrapper alloc];
    mAssetOwner = self->mAssetOwner;
    v141 = 0;
    v38 = -[CRLPreinsertionAssetWrapper initWithData:filename:owner:error:](v111, "initWithData:filename:owner:error:", v93, v133, mAssetOwner, &v141);
    v109 = v141;
    if (!v38)
    {
      v138 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241E80);
      v113 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v113, OS_LOG_TYPE_ERROR))
        sub_100E0824C((uint64_t)v109, v138);

      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241EA0);
      v34 = v135;
      v114 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v114, OS_LOG_TYPE_ERROR))
        sub_100E081AC(v138, v114);

      v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation performResampleOperationWithResampleOptions:bitmapContextOptions:]"));
      v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v115, v116, 282, 0, "Error %@ creating pre-insertion asset wrapper for data.", v109);

      v106 = v132;
      v103 = (void *)v130;
      goto LABEL_137;
    }
    v106 = v132;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241E40);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0811C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241E60);
    v106 = v132;
    v107 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v107);
    v108 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageResamplingOperation performResampleOperationWithResampleOptions:bitmapContextOptions:]"));
    v109 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLImageResamplingOperation.m"));
    v98 = (void *)v108;
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v108, v109, 244, 0, "invalid nil value for '%{public}s'", "destination");
    v38 = 0;
    v34 = v135;
  }
  v103 = (void *)v130;
LABEL_137:

  CFRelease(ThumbnailAtIndex);
LABEL_138:

  if (cf)
    CFRelease(cf);

LABEL_141:
  v117 = v38;

  return v117;
}

- (CRLImageProvider)imageProvider
{
  return self->mImageProvider;
}

- (void)setImageProvider:(id)a3
{
  objc_storeStrong((id *)&self->mImageProvider, a3);
}

- (CGSize)desiredSize
{
  double width;
  double height;
  CGSize result;

  width = self->mDesiredSize.width;
  height = self->mDesiredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDesiredSize:(CGSize)a3
{
  self->mDesiredSize = a3;
}

- (NSString)displayName
{
  return self->mDisplayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CGSize)desiredAlternateSizeIfConvertedToPNG
{
  double width;
  double height;
  CGSize result;

  width = self->mDesiredAlternateSizeIfConvertedToPNG.width;
  height = self->mDesiredAlternateSizeIfConvertedToPNG.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDisplayName, 0);
  objc_storeStrong((id *)&self->mAssetOwner, 0);
  objc_storeStrong((id *)&self->mImageProvider, 0);
}

@end
