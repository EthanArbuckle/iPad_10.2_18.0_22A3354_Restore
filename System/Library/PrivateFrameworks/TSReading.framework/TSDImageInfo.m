@implementation TSDImageInfo

- (void)setThumbnailImageData:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mThumbnailImageData = (TSPData *)a3;
}

- (BOOL)interpretsUntaggedImageDataAsGeneric
{
  return self->mInterpretsUntaggedImageDataAsGeneric;
}

- (TSPData)enhancedImageData
{
  return self->mEnhancedImageData;
}

- (void)setEnhancedImageData:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mEnhancedImageData = (TSPData *)a3;
}

- (TSDImageInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 imageData:(id)a6 originalImageData:(id)a7
{
  TSDImageInfo *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSDImageInfo;
  v10 = -[TSDMediaInfo initWithContext:geometry:](&v14, sel_initWithContext_geometry_, a3, a4);
  if (v10)
  {
    if (!a5)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageInfo initWithContext:geometry:style:imageData:originalImageData:]");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 124, CFSTR("invalid nil value for '%s'"), "style");
    }
    -[TSDImageInfo setStyle:](v10, "setStyle:", a5);
    -[TSDImageInfo setImageData:](v10, "setImageData:", a6);
    -[TSDImageInfo defaultOriginalSize](v10, "defaultOriginalSize");
    -[TSDMediaInfo setOriginalSize:](v10, "setOriginalSize:");
    -[TSDImageInfo setOriginalImageData:](v10, "setOriginalImageData:", a7);
  }
  return v10;
}

- (TSDImageInfo)initWithContext:(id)a3 geometry:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageInfo initWithContext:geometry:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 138, CFSTR("call the designated initializer, please"));
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[TSDDrawableInfo clearBackPointerToParentInfoIfNeeded:](self->mMaskInfo, "clearBackPointerToParentInfoIfNeeded:", self);

  v3.receiver = self;
  v3.super_class = (Class)TSDImageInfo;
  -[TSDDrawableInfo dealloc](&v3, sel_dealloc);
}

- (id)copyWithContext:(id)a3 style:(id)a4
{
  char *v7;
  TSDMaskInfo *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSDImageInfo;
  v7 = -[TSDMediaInfo copyWithContext:](&v11, sel_copyWithContext_);
  *((_QWORD *)v7 + 21) = -[TSDImageInfo imageData](self, "imageData");
  *((_QWORD *)v7 + 23) = -[TSDImageInfo originalImageData](self, "originalImageData");
  objc_msgSend(v7, "setStyle:", a4);
  v8 = -[TSDImageInfo maskInfo](self, "maskInfo");
  if (v8)
  {
    v9 = -[TSDMaskInfo copyWithContext:](v8, "copyWithContext:", a3);
    objc_msgSend(v9, "setParentInfo:", v7);
    *((_QWORD *)v7 + 30) = v9;
  }
  if (-[TSDImageInfo instantAlphaPath](self, "instantAlphaPath"))
    *((_QWORD *)v7 + 31) = -[TSDBezierPath copy](-[TSDImageInfo instantAlphaPath](self, "instantAlphaPath"), "copy");
  *((_QWORD *)v7 + 22) = self->mThumbnailImageData;
  *((_QWORD *)v7 + 32) = -[TSDBezierPath copy](self->mTracedPath, "copy");
  *(CGSize *)(v7 + 264) = self->mNaturalSize;
  *((_QWORD *)v7 + 25) = -[TSDImageAdjustments copy](self->mImageAdjustments, "copy");
  *((_QWORD *)v7 + 26) = self->mAdjustedImageData;
  *((_QWORD *)v7 + 27) = self->mThumbnailAdjustedImageData;
  *((_QWORD *)v7 + 28) = self->mEnhancedImageData;
  return v7;
}

- (id)copyWithContext:(id)a3
{
  TSPObjectContext *v5;
  TSSStylesheet *v6;
  TSSStylesheet *v7;
  void *v8;
  uint64_t v9;
  TSSStyleMapper *v10;
  id v11;

  objc_msgSend(a3, "documentObject");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (TSPObjectContext *)a3;
LABEL_5:
    v6 = (TSSStylesheet *)-[TSPObject performSelector:](-[TSPObjectContext documentObject](v5, "documentObject"), "performSelector:", sel_stylesheet);
    goto LABEL_7;
  }
  -[TSPObjectContext documentObject](-[TSPObject context](self, "context"), "documentObject");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = -[TSPObject context](self, "context");
    goto LABEL_5;
  }
  v6 = -[TSSStyle stylesheet](self->mStyle, "stylesheet");
LABEL_7:
  v7 = v6;
  if (!v6)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageInfo copyWithContext:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 211, CFSTR("invalid nil value for '%s'"), "stylesheet");
  }
  v10 = -[TSSStyleMapper initWithTargetStylesheet:newStyleDOLCContext:]([TSSStyleMapper alloc], "initWithTargetStylesheet:newStyleDOLCContext:", v7, 0);
  objc_opt_class();
  -[TSSStyleMapper mappedStyleForStyle:](v10, "mappedStyleForStyle:", self->mStyle);
  v11 = -[TSDImageInfo copyWithContext:style:](self, "copyWithContext:style:", a3, TSUDynamicCast());

  return v11;
}

- (void)setExteriorTextWrap:(id)a3
{
  double v5;
  double v6;
  double v7;
  objc_super v8;

  -[TSDExteriorTextWrap alphaThreshold](-[TSDDrawableInfo exteriorTextWrap](self, "exteriorTextWrap"), "alphaThreshold");
  v6 = v5;
  v8.receiver = self;
  v8.super_class = (Class)TSDImageInfo;
  -[TSDDrawableInfo setExteriorTextWrap:](&v8, sel_setExteriorTextWrap_, a3);
  -[TSDExteriorTextWrap alphaThreshold](-[TSDDrawableInfo exteriorTextWrap](self, "exteriorTextWrap"), "alphaThreshold");
  if (v6 != v7)
  {

    self->mTracedPath = 0;
  }
}

- (Class)styleClass
{
  return (Class)objc_opt_class();
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (id)presetKind
{
  void *v3;
  void *v4;

  v3 = (void *)String;
  objc_opt_class();
  -[TSDImageInfo style](self, "style");
  v4 = (void *)TSUDynamicCast();
  if (v4)
    return (id)objc_msgSend(v4, "presetKind");
  else
    return v3;
}

- (TSDInfoGeometry)geometry
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDImageInfo;
  return -[TSDDrawableInfo geometry](&v3, sel_geometry);
}

- (TSDContainerInfo)parentInfo
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDImageInfo;
  return -[TSDDrawableInfo parentInfo](&v3, sel_parentInfo);
}

- (void)setParentInfo:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDImageInfo;
  -[TSDDrawableInfo setParentInfo:](&v3, sel_setParentInfo_, a3);
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDImageInfo;
  -[TSDDrawableInfo wasRemovedFromDocumentRoot:](&v3, sel_wasRemovedFromDocumentRoot_, a3);
}

- (id)childInfos
{
  if (self->mMaskInfo)
    return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:");
  else
    return (id)objc_msgSend(MEMORY[0x24BDBCE30], "array");
}

- (id)geometryWithMask
{
  TSDMaskInfo *mMaskInfo;

  mMaskInfo = self->mMaskInfo;
  if (mMaskInfo)
    return -[TSDInfoGeometry geometryWithParentGeometry:](-[TSDDrawableInfo geometry](mMaskInfo, "geometry"), "geometryWithParentGeometry:", -[TSDImageInfo geometry](self, "geometry"));
  else
    return -[TSDImageInfo geometry](self, "geometry");
}

- (CGAffineTransform)computeFullTransform
{
  CGAffineTransform *result;

  result = -[TSDImageInfo geometryWithMask](self, "geometryWithMask");
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform fullTransform](result, "fullTransform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (id)imageDatasForReducingFileSizeWithAssociatedHints
{
  TSPData *v3;
  id v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[TSDImageInfo originalImageData](self, "originalImageData");
  if (!v3)
    v3 = -[TSDImageInfo imageData](self, "imageData");
  v4 = objc_alloc(MEMORY[0x24BEB3CB8]);
  v6[0] = v3;
  return (id)objc_msgSend(v4, "initWithObjects:forKeys:", &unk_24D8FA2A8, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1));
}

- (CGSize)targetSizeForImageData:(id)a3 associatedHint:(id)a4
{
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[5];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  CGSize result;

  if ((objc_msgSend(CFSTR("misc"), "isEqualToString:", a4) & 1) == 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageInfo targetSizeForImageData:associatedHint:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 382, CFSTR("associated hint is wrong %@"), a4);
  }
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x3010000000;
  v16 = &unk_217C8B239;
  v17 = *MEMORY[0x24BDBF148];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__TSDImageInfo_targetSizeForImageData_associatedHint___block_invoke;
  v12[3] = &unk_24D82B618;
  v12[4] = &v13;
  -[TSDDrawableInfo performBlockWithTemporaryLayout:](self, "performBlockWithTemporaryLayout:", v12);
  v8 = v14[4];
  v9 = v14[5];
  _Block_object_dispose(&v13, 8);
  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

void __54__TSDImageInfo_targetSizeForImageData_associatedHint___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v5;

  objc_opt_class();
  objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "imageGeometry"), "size");
  v3 = TSDCeilSize(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(double *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 40) = v5;
}

- (id)mediaDisplayName
{
  return -[TSPData filename](-[TSDImageInfo imageData](self, "imageData"), "filename");
}

- (id)mediaFileType
{
  return -[TSPData type](-[TSDImageInfo imageData](self, "imageData"), "type");
}

- (void)setInterpretsUntaggedImageDataAsGeneric:(BOOL)a3
{
  if (self->mInterpretsUntaggedImageDataAsGeneric != a3)
  {
    -[TSPObject willModify](self, "willModify");
    self->mInterpretsUntaggedImageDataAsGeneric = a3;
  }
}

- (void)setImageData:(id)a3
{
  if (self->mImageData != a3)
  {
    -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 528);

    self->mImageData = (TSPData *)a3;
    -[TSDImageInfo setThumbnailImageData:](self, "setThumbnailImageData:", 0);

    self->mTracedPath = 0;
    self->mNaturalSize = (CGSize)*MEMORY[0x24BDBF148];
    -[TSDImageInfo setImageAdjustments:](self, "setImageAdjustments:", 0);
    -[TSDImageInfo setAdjustedImageData:](self, "setAdjustedImageData:", 0);
    -[TSDImageInfo setEnhancedImageData:](self, "setEnhancedImageData:", 0);
    -[TSDImageInfo setInterpretsUntaggedImageDataAsGeneric:](self, "setInterpretsUntaggedImageDataAsGeneric:", 0);
  }
}

- (id)i_thumbnailForImageData:(id)a3
{
  id result;

  result = TSDResampleImageData(a3, 0, 3, 256.0, 256.0);
  if (result == a3)
    return 0;
  return result;
}

- (void)setOriginalImageData:(id)a3
{
  if (self->mOriginalImageData != a3)
  {
    -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 528);
    -[TSPObject willModify](self, "willModify");

    self->mOriginalImageData = (TSPData *)a3;
  }
}

- (void)setStyle:(id)a3
{
  id v5;

  if (self->mStyle != a3)
  {
    -[TSDDrawableInfo willChangeProperties:](self, "willChangeProperties:", +[TSDMediaStyle properties](TSDMediaStyle, "properties"));
    -[TSPObject willModify](self, "willModify");
    v5 = a3;

    self->mStyle = (TSDMediaStyle *)a3;
  }
}

- (CGSize)originalSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  if (self->mMaskInfo)
  {
    -[TSDInfoGeometry size](-[TSDDrawableInfo geometry](self->mMaskInfo, "geometry"), "size");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TSDImageInfo;
    -[TSDMediaInfo originalSize](&v4, sel_originalSize);
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)defaultOriginalSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  if (self->mMaskInfo)
  {
    -[TSDInfoGeometry size](-[TSDDrawableInfo geometry](self->mMaskInfo, "geometry"), "size");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TSDImageInfo;
    -[TSDMediaInfo defaultOriginalSize](&v4, sel_defaultOriginalSize);
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)rawDataSize
{
  TSPData *v3;
  double v4;
  double v5;
  CGSize result;

  if (-[TSDImageInfo originalImageData](self, "originalImageData"))
    v3 = -[TSDImageInfo originalImageData](self, "originalImageData");
  else
    v3 = -[TSDImageInfo imageData](self, "imageData");
  objc_msgSend((id)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "temporaryProviderForData:shouldValidate:", v3, 1), "dpiAdjustedNaturalSize");
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setMaskInfo:(id)a3
{
  TSDMaskInfo *v5;

  if (self->mMaskInfo != a3)
  {
    -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 529);
    -[TSDDrawableInfo clearBackPointerToParentInfoIfNeeded:](self->mMaskInfo, "clearBackPointerToParentInfoIfNeeded:", self);

    v5 = (TSDMaskInfo *)a3;
    self->mMaskInfo = v5;
    -[TSDDrawableInfo setParentInfo:](v5, "setParentInfo:", self);
  }
}

- (void)setInstantAlphaPath:(id)a3
{
  if (self->mInstantAlphaPath != a3)
  {
    -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 530);

    self->mInstantAlphaPath = (TSDBezierPath *)a3;
  }
}

- (void)setImageAdjustments:(id)a3
{
  if ((unint64_t)a3 | (unint64_t)self->mImageAdjustments)
  {
    if ((objc_msgSend(a3, "isEqual:") & 1) == 0)
    {
      -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 531);

      self->mImageAdjustments = (TSDImageAdjustments *)objc_msgSend(a3, "copy");
      -[TSDImageInfo setAdjustedImageData:](self, "setAdjustedImageData:", 0);
    }
  }
}

- (void)setAdjustedImageData:(id)a3
{
  id v5;

  if (self->mAdjustedImageData != a3)
  {
    -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 528);

    self->mAdjustedImageData = (TSPData *)a3;
    if (a3 && -[TSPObjectContext documentObject](-[TSPObject context](self, "context"), "documentObject"))
    {
      if (objc_msgSend(a3, "isReadable"))
      {
        v5 = -[TSDImageInfo i_thumbnailForImageData:](self, "i_thumbnailForImageData:", a3);
LABEL_9:
        -[TSDImageInfo setThumbnailAdjustedImageData:](self, "setThumbnailAdjustedImageData:", v5);
        return;
      }
      objc_msgSend(a3, "addDownloadObserver:completionHandler:", self, &__block_literal_global_32);
    }
    v5 = 0;
    goto LABEL_9;
  }
}

void __37__TSDImageInfo_setAdjustedImageData___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  if (!a4)
  {
    v5 = objc_msgSend(a2, "i_thumbnailForImageData:");
    if (v5)
      objc_msgSend(a2, "setThumbnailAdjustedImageData:", v5);
  }
}

- (id)objectForProperty:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  switch(a3)
  {
    case 530:
      return -[TSDImageInfo instantAlphaPath](self, "instantAlphaPath");
    case 529:
      return -[TSDImageInfo maskInfo](self, "maskInfo");
    case 528:
      return -[TSDImageInfo imageData](self, "imageData");
  }
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)TSDImageInfo;
  return -[TSDStyledInfo objectForProperty:](&v6, sel_objectForProperty_);
}

- (BOOL)isMasked
{
  return -[TSDImageInfo maskInfo](self, "maskInfo") != 0;
}

- (BOOL)maskCanBeReset
{
  _BOOL4 v3;
  TSDInfoGeometry *v4;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v3 = -[TSDImageInfo isMasked](self, "isMasked");
  if (v3)
  {
    v4 = -[TSDDrawableInfo geometry](-[TSDImageInfo maskInfo](self, "maskInfo"), "geometry");
    -[TSDInfoGeometry position](v4, "position");
    if (v6 == *MEMORY[0x24BDBEFB0] && v5 == *(double *)(MEMORY[0x24BDBEFB0] + 8))
    {
      -[TSDInfoGeometry size](v4, "size");
      v9 = v8;
      v11 = v10;
      -[TSDInfoGeometry size](-[TSDImageInfo geometry](self, "geometry"), "size");
      LOBYTE(v3) = 1;
      if (v9 == v13 && v11 == v12)
      {
        -[TSDInfoGeometry angle](v4, "angle");
        LOBYTE(v3) = v14 != 0.0;
      }
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (id)defaultMaskInfoWithContext:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  TSDInfoGeometry *v20;
  TSDBezierPath *v21;
  TSDBezierPathSource *v22;
  TSDInfoGeometry *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  TSDBezierPath *v36;
  TSDMaskInfo *v37;
  CGAffineTransform v39;
  CGAffineTransform v40;

  if (-[TSDImageInfo instantAlphaPath](self, "instantAlphaPath"))
  {
    v5 = (void *)-[TSDBezierPath copy](-[TSDImageInfo instantAlphaPath](self, "instantAlphaPath"), "copy");
    -[TSDInfoGeometry size](-[TSDImageInfo geometry](self, "geometry"), "size");
    v7 = v6;
    v9 = v8;
    -[TSDImageInfo naturalSize](self, "naturalSize");
    memset(&v40, 0, sizeof(v40));
    CGAffineTransformMakeScale(&v40, v7 / v10, v9 / v11);
    v39 = v40;
    objc_msgSend(v5, "transformUsingAffineTransform:", &v39);
    objc_msgSend(v5, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v20 = -[TSDInfoGeometry initWithCenter:size:]([TSDInfoGeometry alloc], "initWithCenter:size:", TSDCenterOfRect(v13, v15, v17, v19));
    v21 = objc_alloc_init(TSDBezierPath);
    -[TSDBezierPath appendBezierPathWithRect:](v21, "appendBezierPathWithRect:", TSDRectWithSize());
    v22 = -[TSDBezierPathSource initWithBezierPath:]([TSDBezierPathSource alloc], "initWithBezierPath:", v21);

  }
  else
  {
    v23 = -[TSDImageInfo geometry](self, "geometry");
    -[TSDInfoGeometry center](v23, "center");
    v25 = v24;
    v27 = v26;
    -[TSDInfoGeometry position](v23, "position");
    v29 = TSDSubtractPoints(v25, v27, v28);
    v31 = v30;
    -[TSDInfoGeometry size](v23, "size");
    v33 = v32;
    v35 = v34;
    v36 = objc_alloc_init(TSDBezierPath);
    -[TSDBezierPath appendBezierPathWithRect:](v36, "appendBezierPathWithRect:", TSDRectWithSize());
    v22 = -[TSDBezierPathSource initWithBezierPath:]([TSDBezierPathSource alloc], "initWithBezierPath:", v36);

    v20 = -[TSDInfoGeometry initWithCenter:size:]([TSDInfoGeometry alloc], "initWithCenter:size:", v29, v31, v33, v35);
  }
  v37 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", a3, v20, v22);

  return v37;
}

- (id)defaultMaskInfo
{
  return -[TSDImageInfo defaultMaskInfoWithContext:](self, "defaultMaskInfoWithContext:", -[TSPObject context](self, "context"));
}

- (id)updatedMaskInfoGeometryForImageDraggedBy:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id result;
  void *v7;
  TSDInfoGeometry *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGAffineTransform v13;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v16;
  CGAffineTransform v17;

  y = a3.y;
  x = a3.x;
  result = -[TSDImageInfo maskInfo](self, "maskInfo");
  if (result)
  {
    v7 = (void *)objc_msgSend((id)objc_msgSend(result, "geometry"), "mutableCopy");
    memset(&v17, 0, sizeof(v17));
    v8 = -[TSDImageInfo geometry](self, "geometry");
    if (v8)
      -[TSDInfoGeometry transform](v8, "transform");
    else
      memset(&v17, 0, sizeof(v17));
    memset(&v16, 0, sizeof(v16));
    CGAffineTransformMakeTranslation(&t2, x, y);
    t1 = v17;
    CGAffineTransformConcat(&v16, &t1, &t2);
    objc_msgSend(v7, "position");
    v11 = v17.ty + v9 * v17.d + v17.b * v10;
    v12 = v17.tx + v9 * v17.c + v17.a * v10;
    t1 = v16;
    CGAffineTransformInvert(&v13, &t1);
    objc_msgSend(v7, "setPosition:", vaddq_f64(*(float64x2_t *)&v13.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v13.c, v11), *(float64x2_t *)&v13.a, v12)));
    return v7;
  }
  return result;
}

- (BOOL)isPDF
{
  NSString *v2;

  v2 = -[TSPData type](-[TSDImageInfo imageData](self, "imageData"), "type");
  return UTTypeConformsTo((CFStringRef)v2, (CFStringRef)objc_msgSend((id)*MEMORY[0x24BDF84E0], "identifier")) != 0;
}

- (BOOL)isValid
{
  return +[TSDImageProviderPool isValidImageData:](TSDImageProviderPool, "isValidImageData:", -[TSDImageInfo imageData](self, "imageData"));
}

- (BOOL)isOpaque
{
  objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", -[TSDImageInfo imageData](self, "imageData"), 0);
  objc_opt_class();
  return objc_msgSend((id)TSUDynamicCast(), "isOpaque");
}

- (CGPoint)centerForReplacingWithNewMedia
{
  double v2;
  double v3;
  CGPoint result;

  objc_msgSend(-[TSDImageInfo geometryWithMask](self, "geometryWithMask"), "center");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)updateGeometryToReplaceMediaInfo:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  TSDInfoGeometry *v10;
  TSDInfoGeometry *v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  TSPData *v23;
  TSDBezierPath *v24;
  TSDMaskInfo *v25;
  TSDMaskInfo *v26;
  id v27;

  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "geometry"), "copy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "maskInfo"))
  {
    v6 = (void *)objc_msgSend(a3, "maskInfo");
    v27 = (id)objc_msgSend((id)objc_msgSend(v6, "pathSource"), "copy");
    v7 = (void *)objc_msgSend(v6, "geometry");
    if (!v7)
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageInfo updateGeometryToReplaceMediaInfo:]");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 912, CFSTR("invalid nil value for '%s'"), "oldMaskGeometry");
    }
    v10 = (TSDInfoGeometry *)objc_msgSend(v7, "copy");
  }
  else
  {
    v11 = [TSDInfoGeometry alloc];
    objc_msgSend(v5, "size");
    v12 = TSDRectWithSize();
    v16 = TSDCenterOfRect(v12, v13, v14, v15);
    v18 = v17;
    objc_msgSend(a3, "originalSize");
    v10 = -[TSDInfoGeometry initWithCenter:size:](v11, "initWithCenter:size:", v16, v18, v19, v20);
    v27 = 0;
  }
  v21 = (void *)objc_msgSend(v5, "mutableCopy");
  v22 = (void *)-[TSDInfoGeometry mutableCopy](v10, "mutableCopy");
  v23 = -[TSDImageInfo imageData](self, "imageData");
  v24 = -[TSDImageInfo instantAlphaPath](self, "instantAlphaPath");
  -[TSDImageInfo naturalSize](self, "naturalSize");
  +[TSDImageInfo adjustIncomingImageGeometry:maskGeometry:forImageData:maskedWithInstantAlphaPath:withNaturalSize:forTargetImageGeometry:withTargetMaskGeometry:](TSDImageInfo, "adjustIncomingImageGeometry:maskGeometry:forImageData:maskedWithInstantAlphaPath:withNaturalSize:forTargetImageGeometry:withTargetMaskGeometry:", v21, v22, v23, v24, v5, v10);
  -[TSDMediaInfo setGeometry:](self, "setGeometry:", v21);
  if (v27)
    v25 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", -[TSPObject context](self, "context"), v10, v27);
  else
    v25 = -[TSDImageInfo defaultMaskInfo](self, "defaultMaskInfo");
  v26 = v25;
  -[TSDMaskInfo setGeometry:](v25, "setGeometry:", v22);
  -[TSDImageInfo setMaskInfo:](self, "setMaskInfo:", v26);

}

+ (void)adjustIncomingImageGeometry:(id)a3 maskGeometry:(id)a4 forImageData:(id)a5 maskedWithInstantAlphaPath:(id)a6 withNaturalSize:(CGSize)a7 forTargetImageGeometry:(id)a8 withTargetMaskGeometry:(id)a9
{
  double height;
  double width;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  float v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat x;
  CGFloat y;
  CGFloat v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  float64x2_t v60;
  float64x2_t v61;
  float64x2_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  TSDInfoGeometry *v71;
  double v72;
  double v73;
  void *v74;
  uint64_t v75;
  float v76;
  float v77;
  double v78;
  double v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  double v87;
  float64x2_t v88;
  double v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  double v93;
  double v94;
  void *v95;
  uint64_t v96;
  double v97;
  double v98;
  double v99;
  double v100;
  float64x2_t v101;
  float64x2_t v102;
  float64x2_t v103;
  float64x2_t v104;
  float64x2_t v105;
  float64x2_t v106;
  CGAffineTransform v107;
  CGAffineTransform v108;
  CGRect v109;
  CGRect v110;

  height = a7.height;
  width = a7.width;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v63 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v64 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDImageInfo adjustIncomingImageGeometry:maskGeometry:forImageData:maskedWithInstantAlphaPath:withNaturalSize:forTargetImageGeometry:withTargetMaskGeometry:]");
    objc_msgSend(v63, "handleFailureInFunction:file:lineNumber:description:", v64, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 956, CFSTR("invalid nil value for '%s'"), "newImageGeometry");
    if (a4)
    {
LABEL_3:
      if (a5)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  v65 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v66 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDImageInfo adjustIncomingImageGeometry:maskGeometry:forImageData:maskedWithInstantAlphaPath:withNaturalSize:forTargetImageGeometry:withTargetMaskGeometry:]");
  objc_msgSend(v65, "handleFailureInFunction:file:lineNumber:description:", v66, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 957, CFSTR("invalid nil value for '%s'"), "newMaskGeometry");
  if (a5)
  {
LABEL_4:
    if (a8)
      goto LABEL_5;
LABEL_18:
    v69 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v70 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDImageInfo adjustIncomingImageGeometry:maskGeometry:forImageData:maskedWithInstantAlphaPath:withNaturalSize:forTargetImageGeometry:withTargetMaskGeometry:]");
    objc_msgSend(v69, "handleFailureInFunction:file:lineNumber:description:", v70, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 960, CFSTR("invalid nil value for '%s'"), "targetImageGeometry");
    if (a9)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_17:
  v67 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v68 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDImageInfo adjustIncomingImageGeometry:maskGeometry:forImageData:maskedWithInstantAlphaPath:withNaturalSize:forTargetImageGeometry:withTargetMaskGeometry:]");
  objc_msgSend(v67, "handleFailureInFunction:file:lineNumber:description:", v68, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 958, CFSTR("invalid nil value for '%s'"), "newImageData");
  if (!a8)
    goto LABEL_18;
LABEL_5:
  if (a9)
    goto LABEL_6;
LABEL_19:
  v71 = [TSDInfoGeometry alloc];
  objc_msgSend(a8, "size");
  a9 = -[TSDInfoGeometry initWithPosition:size:](v71, "initWithPosition:size:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v72, v73);
LABEL_6:
  objc_msgSend(a9, "transformedBounds");
  v18 = v17;
  v20 = v19;
  v21 = (void *)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", a5, 0);
  v22 = v21;
  v23 = v20;
  v24 = v18;
  if (v21)
  {
    objc_msgSend(v21, "naturalSize");
    v24 = TSDFitOrFillSizeInSize(1, v25, v26, v18, v20);
    v23 = v27;
  }
  if (!a6)
    goto LABEL_21;
  if (width == *MEMORY[0x24BDBF148] && height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    v74 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v75 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDImageInfo adjustIncomingImageGeometry:maskGeometry:forImageData:maskedWithInstantAlphaPath:withNaturalSize:forTargetImageGeometry:withTargetMaskGeometry:]");
    objc_msgSend(v74, "handleFailureInFunction:file:lineNumber:description:", v75, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 982, CFSTR("instant alpha paths require non-zero natural sizes"));
LABEL_21:
    v76 = v24;
    v77 = v23;
    objc_msgSend(a3, "setSize:", fmaxf(v76, 1.0), fmaxf(v77, 1.0));
    objc_msgSend(a9, "center");
    if (a8)
    {
      v98 = v79;
      v100 = v78;
      objc_msgSend(a8, "transform");
      v79 = v98;
      v78 = v100;
      v81 = v101;
      v80 = v102;
      v82 = v103;
    }
    else
    {
      v82 = 0uLL;
      v81 = 0uLL;
      v80 = 0uLL;
    }
    objc_msgSend(a3, "setCenter:", vaddq_f64(v82, vmlaq_n_f64(vmulq_n_f64(v80, v79), v81, v78)));
    objc_msgSend(a3, "size");
    v83 = TSDRectWithSize();
    v87 = TSDCenterOfRect(v83, v84, v85, v86);
    goto LABEL_27;
  }
  objc_msgSend(v22, "naturalSize");
  v30 = v29;
  v32 = v31;
  CGAffineTransformMakeScale(&v108, v29 / width, v31 / height);
  objc_msgSend(a6, "transformUsingAffineTransform:", &v108);
  objc_msgSend(a6, "bounds");
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v41 = TSDFitOrFillSizeInSize(1, v37, v39, v18, v20);
  *(float *)&v42 = v42;
  v43 = fmaxf(v41, 1.0) / v38;
  v44 = fmaxf(*(float *)&v42, 1.0) / v40;
  objc_msgSend(a3, "setSize:", v30 * v43, v32 * v44);
  CGAffineTransformMakeScale(&v107, v43, v44);
  v109.origin.x = v34;
  v109.origin.y = v36;
  v109.size.width = v38;
  v109.size.height = v40;
  v110 = CGRectApplyAffineTransform(v109, &v107);
  x = v110.origin.x;
  y = v110.origin.y;
  v47 = v110.size.width;
  v48 = v110.size.height;
  v49 = TSDRectWithSize();
  v53 = TSDCenterOfRect(v49, v50, v51, v52);
  v55 = v54;
  v56 = TSDCenterOfRect(x, y, v47, v48);
  v57 = TSDSubtractPoints(v53, v55, v56);
  objc_msgSend(a9, "center");
  if (a8)
  {
    v97 = v59;
    v99 = v58;
    objc_msgSend(a8, "transform");
    v59 = v97;
    v58 = v99;
    v61 = v104;
    v60 = v105;
    v62 = v106;
  }
  else
  {
    v62 = 0uLL;
    v61 = 0uLL;
    v60 = 0uLL;
  }
  v88 = vaddq_f64(v62, vmlaq_n_f64(vmulq_n_f64(v60, v59), v61, v58));
  objc_msgSend(a3, "setCenter:", TSDAddPoints(v88.f64[0], v88.f64[1], v57));
  objc_msgSend(a3, "size");
  v89 = TSDRectWithSize();
  v93 = TSDCenterOfRect(v89, v90, v91, v92);
  v87 = TSDSubtractPoints(v93, v94, v57);
LABEL_27:
  objc_msgSend(a4, "setCenter:", v87);
  if (!objc_msgSend(a3, "heightValid") || (objc_msgSend(a3, "widthValid") & 1) == 0)
  {
    v95 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v96 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDImageInfo adjustIncomingImageGeometry:maskGeometry:forImageData:maskedWithInstantAlphaPath:withNaturalSize:forTargetImageGeometry:withTargetMaskGeometry:]");
    objc_msgSend(v95, "handleFailureInFunction:file:lineNumber:description:", v96, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 1030, CFSTR("returning an image geometry with invalid height/width."));
  }
}

- (TSDBezierPath)tracedPath
{
  void *v3;
  void *v4;
  CGImage *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  TSDBezierPath *mTracedPath;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  TSDBezierPath *v17;
  TSDBezierPath *v18;
  double MinX;
  CGFloat MinY;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  objc_sync_enter(self);
  if (!self->mTracedPath)
  {
    objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", -[TSDImageInfo imageData](self, "imageData"), 0);
    objc_opt_class();
    v3 = (void *)TSUDynamicCast();
    v4 = v3;
    if (v3)
    {
      v5 = (CGImage *)objc_msgSend(v3, "CGImageForNaturalSize");
      if (v5)
      {
        -[TSDExteriorTextWrap alphaThreshold](-[TSDDrawableInfo exteriorTextWrap](self, "exteriorTextWrap"), "alphaThreshold");
        self->mTracedPath = (TSDBezierPath *)+[TSDBezierPath tracedPathForImage:alphaThreshold:pointSpacing:](TSDBezierPath, "tracedPathForImage:alphaThreshold:pointSpacing:", v5);
        objc_msgSend(v4, "naturalSize");
        v7 = v6;
        v9 = v8;
        -[TSDImageInfo naturalSize](self, "naturalSize");
        mTracedPath = self->mTracedPath;
        if (mTracedPath && (v7 != v10 || v9 != v11))
        {
          CGAffineTransformMakeScale(&v25, v10 / v7, v11 / v9);
          -[TSDBezierPath transformUsingAffineTransform:](mTracedPath, "transformUsingAffineTransform:", &v25);
        }
        memset(&v24, 0, sizeof(v24));
        objc_msgSend(v4, "orientation");
        TSUImageOrientationTransform();
        memset(&v23, 0, sizeof(v23));
        if (!CGAffineTransformIsIdentity(&v23))
        {
          CGImageGetWidth(v5);
          CGImageGetHeight(v5);
          v26.origin.x = TSDRectWithSize();
          v23 = v24;
          v27 = CGRectApplyAffineTransform(v26, &v23);
          x = v27.origin.x;
          y = v27.origin.y;
          width = v27.size.width;
          height = v27.size.height;
          v17 = self->mTracedPath;
          v23 = v24;
          -[TSDBezierPath transformUsingAffineTransform:](v17, "transformUsingAffineTransform:", &v23);
          v18 = self->mTracedPath;
          v28.origin.x = x;
          v28.origin.y = y;
          v28.size.width = width;
          v28.size.height = height;
          MinX = CGRectGetMinX(v28);
          v29.origin.x = x;
          v29.origin.y = y;
          v29.size.width = width;
          v29.size.height = height;
          MinY = CGRectGetMinY(v29);
          CGAffineTransformMakeTranslation(&v22, -MinX, -MinY);
          -[TSDBezierPath transformUsingAffineTransform:](v18, "transformUsingAffineTransform:", &v22);
        }
      }
    }
    if (!self->mTracedPath)
    {
      -[TSDImageInfo naturalSize](self, "naturalSize");
      self->mTracedPath = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", TSDRectWithSize());
    }
  }
  objc_sync_exit(self);
  return self->mTracedPath;
}

- (CGSize)naturalSize
{
  CGSize *p_mNaturalSize;
  CGFloat v5;
  CGFloat v6;
  double width;
  double height;
  CGSize result;

  objc_sync_enter(self);
  p_mNaturalSize = &self->mNaturalSize;
  if (self->mNaturalSize.width == *MEMORY[0x24BDBF148]
    && self->mNaturalSize.height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    objc_msgSend((id)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "providerForData:shouldValidate:", -[TSDImageInfo imageData](self, "imageData"), 1), "naturalSize");
    p_mNaturalSize->width = v5;
    self->mNaturalSize.height = v6;
  }
  objc_sync_exit(self);
  width = p_mNaturalSize->width;
  height = self->mNaturalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGSize *p_mNaturalSize;

  height = a3.height;
  width = a3.width;
  p_mNaturalSize = &self->mNaturalSize;
  if (a3.width != self->mNaturalSize.width || a3.height != self->mNaturalSize.height)
  {
    objc_sync_enter(self);
    -[TSPObject willModify](self, "willModify");
    p_mNaturalSize->width = width;
    p_mNaturalSize->height = height;
    objc_sync_exit(self);
  }
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__TSDImageInfo_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __37__TSDImageInfo_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageInfo mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 1112, CFSTR("nil object after cast"));
  }
  if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "imageData"), "isEqual:", objc_msgSend(v2, "imageData")))return 1;
  v5 = TSDMixingTypeBestFromMixingTypes(5, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "geometry"), "mixingTypeWithObject:", objc_msgSend(v2, "geometry")));
  v6 = TSDMixingTypeBestFromMixingTypes(v5, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "imageStyle"), "mixingTypeWithObject:", objc_msgSend(v2, "imageStyle")));
  v7 = TSDMixingTypeWithPossiblyNilObjects(objc_msgSend(*(id *)(a1 + 40), "maskInfo"), objc_msgSend(v2, "maskInfo"));
  result = TSDMixingTypeBestFromMixingTypes(v6, v7);
  if (result == 3)
    return 2;
  return result;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__TSDImageInfo_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDImageInfo *__49__TSDImageInfo_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  TSDImageInfo *v6;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "geometry"), "mixedObjectWithFraction:ofObject:", objc_msgSend(v2, "geometry"), *(double *)(a1 + 48));
  v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "imageStyle"), "mixedObjectWithFraction:ofObject:", objc_msgSend(v2, "imageStyle"), *(double *)(a1 + 48));
  v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "maskInfo"), "mixedObjectWithFraction:ofObject:", objc_msgSend(v2, "maskInfo"), *(double *)(a1 + 48));
  v6 = -[TSDImageInfo initWithContext:geometry:style:imageData:originalImageData:]([TSDImageInfo alloc], "initWithContext:geometry:style:imageData:originalImageData:", objc_msgSend(*(id *)(a1 + 40), "context"), v3, v4, objc_msgSend(*(id *)(a1 + 40), "imageData"), 0);
  -[TSDImageInfo setMaskInfo:](v6, "setMaskInfo:", v5);
  return v6;
}

+ (id)bootstrapPropertyMapForPresetIndex:(unint64_t)a3 inTheme:(id)a4 alternate:(int)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  TSSPropertyMap *v10;
  TSDReflection *v11;
  double v12;
  TSDFrame *v13;
  TSSPropertyMap *v14;
  TSDFrame *v15;
  uint64_t v16;
  TSDDropShadow *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v7 = (void *)objc_msgSend(a4, "colors");
  if (!v7)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDImageInfo bootstrapPropertyMapForPresetIndex:inTheme:alternate:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m"), 1174, CFSTR("invalid nil value for '%s'"), "colors");
  }
  v10 = objc_alloc_init(TSSPropertyMap);
  if (a5 <= 5 && ((1 << a5) & 0x2B) != 0)
  {
    switch(a3)
    {
      case 1uLL:
        v11 = [TSDReflection alloc];
        v12 = 0.5;
        goto LABEL_9;
      case 2uLL:
        v17 = [TSDDropShadow alloc];
        v18 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 2), "CGColor");
        v19 = 270.0;
        v20 = 0.7;
        v21 = 10.0;
        v22 = 20.0;
        goto LABEL_16;
      case 3uLL:
        v23 = v7;
        v24 = 5;
        goto LABEL_18;
      case 4uLL:
        v25 = objc_msgSend(v7, "objectAtIndex:", 5);
        v26 = 2.0;
        goto LABEL_19;
      case 5uLL:
        v13 = -[TSDFrame initWithFrameName:]([TSDFrame alloc], "initWithFrameName:", CFSTR("Modern"));
        if (v13)
          goto LABEL_23;
        v27 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v28 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDImageInfo bootstrapPropertyMapForPresetIndex:inTheme:alternate:]");
        v29 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m");
        v30 = (void *)v27;
        v31 = v28;
        v32 = 1216;
        goto LABEL_22;
      default:
        return v10;
    }
  }
  switch(a3)
  {
    case 1uLL:
      v11 = [TSDReflection alloc];
      v12 = 0.27;
LABEL_9:
      v13 = -[TSDReflection initWithOpacity:](v11, "initWithOpacity:", v12);
      v14 = v10;
      v15 = v13;
      v16 = 519;
      goto LABEL_24;
    case 2uLL:
      v17 = [TSDDropShadow alloc];
      v18 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 2), "CGColor");
      v19 = 320.0;
      v20 = 0.59;
      v21 = 6.0;
      v22 = 7.0;
LABEL_16:
      v13 = -[TSDDropShadow initWithAngle:offset:radius:opacity:color:enabled:](v17, "initWithAngle:offset:radius:opacity:color:enabled:", v18, 1, v19, v21, v22, v20);
      v14 = v10;
      v15 = v13;
      v16 = 520;
      goto LABEL_24;
    case 3uLL:
      v23 = v7;
      v24 = 3;
LABEL_18:
      v25 = objc_msgSend(v23, "objectAtIndex:", v24);
      v26 = 1.0;
LABEL_19:
      -[TSSPropertyMap setObject:forProperty:](v10, "setObject:forProperty:", +[TSDStroke strokeWithColor:width:](TSDStroke, "strokeWithColor:width:", v25, v26), 517);
      return v10;
    case 5uLL:
      v13 = -[TSDFrame initWithFrameName:]([TSDFrame alloc], "initWithFrameName:", CFSTR("Modern"));
      if (!v13)
      {
        v33 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v34 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDImageInfo bootstrapPropertyMapForPresetIndex:inTheme:alternate:]");
        v29 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageInfo.m");
        v30 = (void *)v33;
        v31 = v34;
        v32 = 1260;
LABEL_22:
        objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, v29, v32, CFSTR("Modern frame in frames bundle is NULL!"));
      }
LABEL_23:
      v14 = v10;
      v15 = v13;
      v16 = 517;
LABEL_24:
      -[TSSPropertyMap setObject:forProperty:](v14, "setObject:forProperty:", v15, v16);

      break;
    default:
      return v10;
  }
  return v10;
}

+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5
{
  objc_msgSend(a1, "bootstrapPresetsOfKind:inTheme:alternate:reservedCount:", a3, a4, *(_QWORD *)&a5, 0);
}

+ (void)bootstrapPresetsOfKind:(id)a3 inTheme:(id)a4 alternate:(int)a5 reservedCount:(unint64_t)a6
{
  uint64_t v7;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  TSDMediaStyle *v15;
  id v16;

  v7 = *(_QWORD *)&a5;
  v10 = 6 - a6;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 6 - a6);
  if (a6 != 6)
  {
    v12 = 0;
    if (v10 <= 1)
      v13 = 1;
    else
      v13 = v10;
    do
    {
      v14 = TSDImageStyleIdentifierString(v12);
      v15 = -[TSSStyle initWithContext:]([TSDMediaStyle alloc], "initWithContext:", objc_msgSend(a4, "context"));
      -[TSSStyle setValuesForProperties:](v15, "setValuesForProperties:", objc_msgSend(a1, "bootstrapPropertyMapForPresetIndex:inTheme:alternate:", v12, a4, v7));
      objc_msgSend((id)objc_msgSend(a4, "stylesheet"), "addStyle:withIdentifier:", v15, v14);
      objc_msgSend(v11, "addObject:", v15);

      ++v12;
    }
    while (v13 != v12);
  }
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v11);
  objc_msgSend(a4, "setPresets:ofKind:", v16, String);

}

+ (id)presetKinds
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", String);
}

- (void)acceptVisitor:(id)a3
{
  objc_msgSend(a3, "visitTSDImageInfo:", self);
}

- (TSPData)imageData
{
  return self->mImageData;
}

- (TSPData)thumbnailImageData
{
  return self->mThumbnailImageData;
}

- (TSPData)originalImageData
{
  return self->mOriginalImageData;
}

- (id)style
{
  return self->mStyle;
}

- (TSDMaskInfo)maskInfo
{
  return self->mMaskInfo;
}

- (TSDBezierPath)instantAlphaPath
{
  return self->mInstantAlphaPath;
}

- (TSDImageAdjustments)imageAdjustments
{
  return self->mImageAdjustments;
}

- (TSPData)adjustedImageData
{
  return self->mAdjustedImageData;
}

- (TSPData)thumbnailAdjustedImageData
{
  return self->mThumbnailAdjustedImageData;
}

- (void)setThumbnailAdjustedImageData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

@end
