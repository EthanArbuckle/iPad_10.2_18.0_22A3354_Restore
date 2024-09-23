@implementation TSDSwatchCache

+ (id)swatchCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__TSDSwatchCache_swatchCache__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = a1;
  if (swatchCache_sSwatchCacheOnce != -1)
    dispatch_once(&swatchCache_sSwatchCacheOnce, block);
  return (id)swatchCache_sSwatchCache;
}

id __29__TSDSwatchCache_swatchCache__block_invoke(uint64_t a1)
{
  id result;

  result = objc_alloc_init(*(Class *)(a1 + 32));
  swatchCache_sSwatchCache = (uint64_t)result;
  return result;
}

- (TSDSwatchCache)init
{
  TSDSwatchCache *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDSwatchCache;
  v2 = -[TSDSwatchCache init](&v4, sel_init);
  if (v2)
    v2->mOperationQueue = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue cancelAllOperations](self->mOperationQueue, "cancelAllOperations");

  v3.receiver = self;
  v3.super_class = (Class)TSDSwatchCache;
  -[TSDSwatchCache dealloc](&v3, sel_dealloc);
}

- (void)warmStyle:(id)a3 withFillProperty:(int)a4 documentRoot:(id)a5
{
  TSDStyleWarmingOperation *v6;

  v6 = -[TSDStyleWarmingOperation initWithStyle:property:accessController:]([TSDStyleWarmingOperation alloc], "initWithStyle:property:accessController:", a3, *(_QWORD *)&a4, objc_msgSend(a5, "accessController"));
  -[NSOperationQueue addOperation:](self->mOperationQueue, "addOperation:", v6);

}

- (CGSize)shapeSwatchInset
{
  uint64_t v2;
  double v3;
  double v4;
  CGSize result;

  if (!TSUPhoneUI()
    || (v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "keyWindow"), "windowScene"), "interfaceOrientation"), v3 = 4.0, (unint64_t)(v2 - 5) <= 0xFFFFFFFFFFFFFFFDLL))
  {
    v3 = 8.0;
  }
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)applyFakeShadowForWhitePresetsIfNecessary:(id)a3 documentRoot:(id)a4
{
  id v6;

  if ((objc_msgSend((id)objc_msgSend(a3, "fill"), "isNearlyWhite")
     && (objc_msgSend((id)objc_msgSend(a3, "stroke"), "isNullStroke") & 1) != 0
     || objc_msgSend(a3, "stroke") && objc_msgSend((id)objc_msgSend(a3, "stroke"), "isNearlyWhite"))
    && (!objc_msgSend(a3, "shadow") || (objc_msgSend((id)objc_msgSend(a3, "shadow"), "isEnabled") & 1) == 0))
  {
    v6 = (id)objc_msgSend((id)objc_msgSend(a3, "style"), "copyWithContext:", objc_msgSend(a4, "context"));
    objc_msgSend(v6, "setBoxedValue:forProperty:", +[TSDShadow shadowWithAngle:offset:radius:opacity:color:enabled:](TSDShadow, "shadowWithAngle:offset:radius:opacity:color:enabled:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "blackColor"), "CGColor"), 1, 0.0, 0.0, 4.0, 0.45), 520);
    objc_msgSend(a3, "setStyle:", v6);
  }
}

- (id)imageForShapePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 shapeType:(int)a6 angle:(double)a7 documentRoot:(id)a8
{
  uint64_t v10;
  double height;
  double width;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  int v21;
  void *v22;
  int v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  BOOL v30;
  double v31;
  double v32;
  double v33;
  TSDInfoGeometry *v34;
  double v35;
  unsigned int v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  TSDInfoGeometry *v45;
  void *v46;
  TSDImager *v47;
  CGImage *v48;
  CGImage *v49;
  void *v50;
  double v52;
  double v53;
  double v54;

  v10 = *(_QWORD *)&a6;
  height = a4.height;
  width = a4.width;
  objc_opt_class();
  v15 = (id)objc_msgSend((id)TSUDynamicCast(), "copyWithContext:", objc_msgSend(a8, "context"));
  -[TSDSwatchCache shapeSwatchInset](self, "shapeSwatchInset");
  v17 = v16;
  v19 = v18;
  v20 = objc_msgSend(v15, "boxedValueForProperty:", 520);
  if (!v20 || v20 == objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(v15, "constrainShadowForSwatchGeneration");
    v21 = 1;
  }
  v22 = (void *)objc_msgSend(v15, "boxedValueForProperty:", 517);
  if (!v22 || v22 == (void *)objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend(v15, "constrainStrokeForSwatchGeneration");
    v23 = 1;
  }
  v24 = objc_msgSend(v15, "boxedObjectForProperty:", 519);
  if (v24 && v24 != objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    objc_msgSend(v15, "fadeReflectionForSwatchGeneration");
  if ((v21 & 1) != 0 || v10 <= 0x13 && ((1 << v10) & 0xC0004) != 0)
  {
    v17 = v17 + 3.0;
    v19 = v19 + 3.0;
  }
  v25 = width - v17 * 2.0;
  v26 = height - v19 * 2.0;
  if (v23)
  {
    v54 = 1.0;
    if (objc_msgSend(v22, "isFrame"))
    {
      v27 = (void *)objc_msgSend(v15, "boxedValueForProperty:", 517);
      objc_msgSend(v27, "coverageRect:", TSDRectWithSize());
      v30 = v29 - width <= v17 + v17 && v28 - height <= v19 + v19;
      if (!v30
        || (objc_msgSend(v27, "coverageRect:", TSDRectWithSize()),
            (objc_msgSend(v27, "shouldRenderForSizeIncludingCoverage:", v52, v53) & 1) == 0))
      {
        v54 = 2.0;
        v25 = TSDMultiplySizeScalar(width - v17 * 2.0, height - v19 * 2.0, 2.0);
        v26 = v31;
        v17 = TSDMultiplySizeScalar(v17, v19, 2.0);
        v19 = v32;
      }
    }
  }
  else
  {
    v54 = 1.0;
  }
  objc_msgSend(v15, "fixImageFillTechniqueForSwatchOfSize:", v25, v26);
  if (v10 > 0x13)
    goto LABEL_34;
  if (((1 << v10) & 0xD8006) == 0)
  {
    if ((_DWORD)v10 == 9)
    {
      v35 = 0.0;
      if (v21)
        v35 = 3.0;
      v25 = v25 + 8.0;
      v33 = v26 + v35 * -2.0;
      v17 = v17 + -4.0;
      v19 = v35 + v19;
      goto LABEL_49;
    }
LABEL_34:
    v36 = v10 - 13;
    v37 = 7.0;
    if (v21)
      v37 = 9.0;
    v38 = v25 - v37;
    v39 = v26 + 0.0;
    v40 = v37 + v17;
    if ((_DWORD)v10 != 12)
    {
      v38 = v25;
      v39 = v26;
      v40 = v17;
    }
    v41 = 4.0;
    if (v21)
      v41 = 2.0;
    v42 = v25 + v41 * 2.0;
    v43 = v26 + v41 * 2.0;
    v44 = v17 - v41;
    if (v36 <= 1)
      v25 = v42;
    else
      v25 = v38;
    if (v36 <= 1)
      v33 = v43;
    else
      v33 = v39;
    if (v36 <= 1)
      v17 = v44;
    else
      v17 = v40;
    goto LABEL_49;
  }
  v19 = v26 * 0.5 + v19;
  if (a7 != 0.0)
  {
    v25 = hypot(v25, v26);
    v17 = 0.0;
  }
  v33 = 0.0;
  v34 = -[TSDInfoGeometry initWithPosition:size:angle:]([TSDInfoGeometry alloc], "initWithPosition:size:angle:", v17, v19, v25, 0.0, a7);
  if (!v34)
LABEL_49:
    v34 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v17, v19, v25, v33);
  v45 = v34;
  v46 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:geometry:style:pathSource:", objc_msgSend(a8, "context"), v34, v15, +[TSDPathSource pathSourceForShapeType:naturalSize:](TSDPathSource, "pathSourceForShapeType:naturalSize:", v10, v25, v33));
  if ((_DWORD)v10 == 15)
  {
    objc_msgSend(v46, "setHeadLineEnd:", +[TSDLineEnd openArrow](TSDLineEnd, "openArrow"));
    objc_msgSend(v46, "setTailLineEnd:", +[TSDLineEnd simpleArrow](TSDLineEnd, "simpleArrow"));
  }
  else if ((_DWORD)v10 == 16)
  {
    objc_msgSend(v46, "setHeadLineEnd:", +[TSDLineEnd simpleArrow](TSDLineEnd, "simpleArrow"));
  }
  -[TSDSwatchCache applyFakeShadowForWhitePresetsIfNecessary:documentRoot:](self, "applyFakeShadowForWhitePresetsIfNecessary:documentRoot:", v46, a8);
  v47 = -[TSDImager initWithDocumentRoot:]([TSDImager alloc], "initWithDocumentRoot:", a8);
  -[TSDImager setScaledImageSize:](v47, "setScaledImageSize:", TSDMultiplySizeScalar(width, height, a5));
  TSDMultiplySizeScalar(width, height, v54);
  -[TSDImager setUnscaledClipRect:](v47, "setUnscaledClipRect:", TSDRectWithSize());
  -[TSDImager setInfos:](v47, "setInfos:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v46));
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v48 = -[TSDImager newImage](v47, "newImage");
  if (v10 <= 0x13 && ((1 << v10) & 0xC0004) != 0)
  {
    objc_opt_class();
    v49 = -[TSDSwatchCache p_newImageWithConnectionLineKnobsForShape:atScale:ofSize:overImage:](self, "p_newImageWithConnectionLineKnobsForShape:atScale:ofSize:overImage:", TSUDynamicCast(), v48, a5, width, height);
    CGImageRelease(v48);
    v48 = v49;
  }
  v50 = (void *)objc_msgSend(MEMORY[0x24BEB3C90], "imageWithCGImage:scale:orientation:", v48, 0, a5);
  CGImageRelease(v48);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

  return v50;
}

- (id)imageForImagePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 imageInfo:(id)a6 shouldClipVertically:(BOOL)a7 documentRoot:(id)a8
{
  double height;
  CGFloat width;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  BOOL v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;
  float v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  float v42;
  double v43;
  TSDMaskInfo *v44;
  TSDInfoGeometry *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  id v55;
  TSDInfoGeometry *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  TSDInfoGeometry *v66;
  double v67;
  TSDInfoGeometry *v68;
  double v69;
  double v70;
  double v71;
  BOOL v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  id v80;
  TSDInfoGeometry *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  uint64_t v88;
  TSDInfoGeometry *v89;
  id v90;
  TSDImageInfo *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  CGFloat v97;
  double v98;
  CGFloat v99;
  void *v100;
  TSDImager *v101;
  double v102;
  uint64_t v103;
  double v104;
  CGImage *v105;
  void *v106;
  double v108;
  double v109;
  double v111;
  double v112;
  CGAffineTransform v113;

  height = a4.height;
  width = a4.width;
  v14 = TSUPhoneUI();
  v112 = width;
  v15 = 3.0;
  if (v14)
    v16 = 3.0;
  else
    v16 = 2.0;
  v17 = 30.0;
  if (v14)
    v17 = 8.0;
  v18 = v17 + (v112 - v112) * 0.5;
  if (!v14)
    v15 = 1.0;
  v19 = v15 * (v17 + (height - height) * 0.25);
  v20 = v16 * (v112 - v17);
  v21 = v16 * (height - v17);
  objc_opt_class();
  v22 = (id)objc_msgSend((id)TSUDynamicCast(), "copyWithContext:", objc_msgSend(a8, "context"));
  objc_msgSend((id)objc_msgSend(a6, "geometry"), "size");
  v24 = v23;
  v111 = v25;
  objc_opt_class();
  objc_msgSend(v22, "valueForProperty:", 517);
  v26 = (void *)TSUDynamicCast();
  if (v26)
  {
    objc_msgSend(v26, "coverageRect:", v18, v19, v20, v21);
    v29 = v28 < 0.0;
    *(float *)&v28 = v28;
    v30 = roundf(*(float *)&v28);
    v31 = v19 - v30;
    v32 = v21 + v30;
    if (v29)
      v21 = v32;
    if (v29)
      v19 = v31;
    v33 = v27 < 0.0;
    v34 = v27;
    v35 = roundf(v34);
    v36 = v18 - v35;
    v37 = v20 + v35;
    if (v33)
      v20 = v37;
    if (v33)
      v18 = v36;
  }
  objc_opt_class();
  objc_msgSend(v22, "valueForProperty:", 520);
  if (TSUDynamicCast())
  {
    objc_msgSend(v22, "constrainShadowForSwatchGeneration");
    objc_opt_class();
    objc_msgSend(v22, "valueForProperty:", 520);
    v38 = (void *)TSUDynamicCast();
    if (objc_msgSend(v38, "isDropShadow"))
    {
      objc_msgSend(v38, "shadowBoundsForRect:", v18, v19, v20, v21);
      v29 = v40 < 0.0;
      *(float *)&v40 = v40;
      v41 = v21 + roundf(*(float *)&v40);
      if (v29)
        v21 = v41;
      v29 = v39 < 0.0;
      v42 = v39;
      v43 = v20 + roundf(v42);
      if (v29)
        v20 = v43;
    }
  }
  v44 = (TSDMaskInfo *)objc_msgSend(a6, "maskInfo");
  v108 = v16;
  v109 = height;
  if (v44)
  {
    if (a7)
      goto LABEL_31;
  }
  else
  {
    if (!objc_msgSend(a6, "instantAlphaPath"))
    {
      if (a7)
        goto LABEL_38;
      v44 = 0;
      goto LABEL_42;
    }
    v44 = (TSDMaskInfo *)objc_msgSend(a6, "defaultMaskInfoWithContext:", objc_msgSend(a8, "context"));
    if (a7)
    {
LABEL_31:
      if (v44)
      {
        v45 = -[TSDDrawableInfo geometry](v44, "geometry");
        -[TSDInfoGeometry size](v45, "size");
        v48 = TSDScaleSizeWithinSize(v20, v21, v46, v47);
        v50 = v49;
        -[TSDInfoGeometry center](v45, "center");
        v52 = v51;
        v54 = v53;
        v55 = +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:", v48, v50);
        v56 = [TSDInfoGeometry alloc];
        v57 = v52;
        v58 = v54;
        v59 = v48;
        v60 = v50;
        goto LABEL_39;
      }
LABEL_38:
      v63 = TSDScaleSizeWithinSize(v20, v21, v24, v111);
      v65 = v64;
      v55 = +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:", v63);
      v56 = [TSDInfoGeometry alloc];
      v57 = v24 * 0.5;
      v58 = v111 * 0.5;
      v59 = v63;
      v60 = v65;
LABEL_39:
      v66 = -[TSDInfoGeometry initWithCenter:size:](v56, "initWithCenter:size:", v57, v58, v59, v60);
      v44 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", objc_msgSend(a8, "context"), v66, v55);

      if (!v44)
        goto LABEL_56;
      goto LABEL_47;
    }
  }
  if (v44)
  {
    -[TSDInfoGeometry size](-[TSDDrawableInfo geometry](v44, "geometry"), "size");
    goto LABEL_43;
  }
LABEL_42:
  v62 = v111;
  v61 = v24;
LABEL_43:
  v67 = v61 / v62;
  if (v67 <= v112 / height)
  {
    v20 = v21 * v67;
    if (!v44)
      goto LABEL_56;
  }
  else
  {
    v21 = v20 / v67;
    if (!v44)
      goto LABEL_56;
  }
LABEL_47:
  v68 = -[TSDDrawableInfo geometry](v44, "geometry");
  -[TSDInfoGeometry size](v68, "size");
  v71 = v20 / v70;
  v72 = v70 <= 0.0;
  v73 = 1.0;
  if (v72)
    v71 = 1.0;
  if (v69 > 0.0)
    v73 = v21 / v69;
  if (v71 <= v73)
    v74 = v73;
  else
    v74 = v71;
  -[TSDInfoGeometry position](v68, "position");
  v77 = TSDMultiplyPointScalar(v75, v76, v74);
  v79 = v78;
  v80 = +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:", v20, v21);
  v81 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v77, v79, v20, v21);
  v44 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", objc_msgSend(a8, "context"), v81, v80);

LABEL_56:
  v82 = TSDRoundedSize();
  v84 = v83;
  v85 = TSDRoundedPoint();
  v87 = v86;
  v88 = objc_msgSend(v22, "boxedObjectForProperty:", 519);
  if (v88 && v88 != objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    objc_msgSend(v22, "fadeReflectionForSwatchGeneration");
  v89 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v85, v87, v82, v84);
  v90 = (id)objc_msgSend(a6, "thumbnailImageData");
  if (!v90)
    v90 = -[TSDSwatchCache p_thumbnailImageDataForImageData:](self, "p_thumbnailImageDataForImageData:", objc_msgSend(a6, "imageData"));
  v91 = -[TSDImageInfo initWithContext:geometry:style:imageData:originalImageData:]([TSDImageInfo alloc], "initWithContext:geometry:style:imageData:originalImageData:", objc_msgSend(a8, "context"), v89, v22, v90, 0);
  -[TSDImageInfo setMaskInfo:](v91, "setMaskInfo:", v44);
  if (objc_msgSend(a6, "instantAlphaPath"))
  {
    objc_msgSend((id)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "temporaryProviderForData:shouldValidate:", v90, 1), "naturalSize");
    v93 = v92;
    v95 = v94;
    objc_msgSend(a6, "naturalSize");
    v97 = v93 / v96;
    v99 = v95 / v98;
    v100 = (void *)objc_msgSend((id)objc_msgSend(a6, "instantAlphaPath"), "copy");
    CGAffineTransformMakeScale(&v113, v97, v99);
    objc_msgSend(v100, "transformUsingAffineTransform:", &v113);
    -[TSDImageInfo setInstantAlphaPath:](v91, "setInstantAlphaPath:", v100);

  }
  v101 = -[TSDImager initWithDocumentRoot:]([TSDImager alloc], "initWithDocumentRoot:", a8);
  -[TSDImager setScaledImageSize:](v101, "setScaledImageSize:", TSDMultiplySizeScalar(v112, v109, a5));
  v102 = TSDMultiplySizeScalar(v112, v109, v108);
  -[TSDImager setUnscaledClipRect:](v101, "setUnscaledClipRect:", TSDRectWithOriginAndSize(v103, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v102, v104));
  -[TSDImager setInfos:](v101, "setInfos:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v91));
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v105 = -[TSDImager newImage](v101, "newImage");
  v106 = (void *)objc_msgSend(MEMORY[0x24BEB3C90], "imageWithCGImage:scale:orientation:", v105, 0, a5);
  CGImageRelease(v105);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

  return v106;
}

- (id)imageForShapePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 shapeType:(int)a7 angle:(double)a8 documentRoot:(id)a9
{
  uint64_t v10;
  double height;
  double width;
  double y;
  double x;
  double v16;
  double v17;
  id v19;
  uint64_t v20;
  _BOOL4 v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  TSDMutableInfoGeometry *v41;
  id v42;
  void *v43;
  TSDImager *v44;
  CGImage *v45;
  CGImage *v46;
  void *v47;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double MinY;
  double MaxX;
  double v68;
  double MinX;
  double v70;
  double v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  double MaxY;
  CGFloat rect;
  CGFloat v78;
  CGFloat v79;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;

  v10 = *(_QWORD *)&a7;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v16 = a4.height;
  v17 = a4.width;
  objc_opt_class();
  v19 = (id)objc_msgSend((id)TSUDynamicCast(), "copyWithContext:", objc_msgSend(a9, "context"));
  v20 = objc_msgSend(v19, "boxedValueForProperty:", 520);
  if (v20)
  {
    if (v20 == objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    {
      LODWORD(v20) = 0;
    }
    else
    {
      objc_msgSend(v19, "constrainShadowForSwatchGeneration");
      LODWORD(v20) = 1;
    }
  }
  objc_msgSend(v19, "fixImageFillTechniqueForSwatchOfSize:", width, height);
  v21 = (v10 & 0xFFFFFFEF) == 2 || v10 == 19;
  if (v10 > 0x13)
    goto LABEL_41;
  if (((1 << v10) & 0x18002) != 0)
  {
    v28 = hypot(width, height);
    v82.origin.x = x;
    v82.origin.y = y;
    v82.size.width = width;
    v82.size.height = height;
    y = CGRectGetMidY(v82);
    v83.origin.x = x;
    v83.origin.y = y;
    v83.size.width = width;
    v83.size.height = height;
    x = CGRectGetMidX(v83) + v28 * -0.5;
    height = 0.0;
    width = v28;
    goto LABEL_15;
  }
  if (((1 << v10) & 0xC0004) != 0)
  {
    v22 = 6.0;
    v23 = 6.0;
LABEL_12:
    v24 = x;
    v25 = y;
    v26 = width;
LABEL_13:
    v27 = height;
    v81 = CGRectInset(*(CGRect *)&v24, v22, v23);
    x = v81.origin.x;
    y = v81.origin.y;
    width = v81.size.width;
    height = v81.size.height;
    goto LABEL_15;
  }
  if ((_DWORD)v10 == 9)
  {
    x = 0.0;
    if ((_DWORD)v20)
    {
      v24 = 0.0;
      v22 = 4.0;
      v23 = 0.0;
      v25 = y;
      v26 = v17;
      goto LABEL_13;
    }
    width = v17;
  }
  else
  {
LABEL_41:
    if ((v10 - 13) > 1)
    {
      if ((_DWORD)v10 == 12)
      {
        objc_msgSend((id)objc_msgSend(+[TSDPathSource pathSourceForShapeType:naturalSize:](TSDPathSource, "pathSourceForShapeType:naturalSize:", 12, width, height), "bezierPath"), "bounds");
        v72 = v52;
        v54 = x + v53;
        v73 = x + v53;
        v74 = v55;
        v75 = y + v56;
        v71 = TSDRectWithSize();
        v78 = v58;
        v79 = v57;
        rect = v59;
        v84.origin.x = v54;
        v84.size.width = v74;
        v84.origin.y = v75;
        v84.size.height = v72;
        MinX = CGRectGetMinX(v84);
        v85.origin.x = v71;
        v85.size.width = v78;
        v85.origin.y = v79;
        v85.size.height = rect;
        v70 = MinX - CGRectGetMinX(v85);
        v86.origin.x = v73;
        v86.size.width = v74;
        v86.origin.y = v75;
        v86.size.height = v72;
        MaxX = CGRectGetMaxX(v86);
        v87.origin.x = v71;
        v87.size.width = v78;
        v87.origin.y = v79;
        v87.size.height = rect;
        v68 = MaxX - CGRectGetMaxX(v87);
        v88.origin.x = v73;
        v88.size.width = v74;
        v88.origin.y = v75;
        v88.size.height = v72;
        MinY = CGRectGetMinY(v88);
        v89.origin.x = v71;
        v89.size.width = v78;
        v89.origin.y = v79;
        v89.size.height = rect;
        v60 = MinY - CGRectGetMinY(v89);
        v90.origin.x = v73;
        v90.size.width = v74;
        v90.origin.y = v75;
        v90.size.height = v72;
        MaxY = CGRectGetMaxY(v90);
        v91.origin.x = v71;
        v91.size.width = v78;
        v91.origin.y = v79;
        v91.size.height = rect;
        v61 = MaxY - CGRectGetMaxY(v91);
        v62 = x - fmin(v70, 0.0);
        v63 = v70;
        v64 = -0.0;
        if (v70 >= 0.0)
          v63 = -0.0;
        v65 = width + v63 - fmax(v68, 0.0);
        y = y - fmin(v60, 0.0);
        if (v60 < 0.0)
          v64 = v60;
        height = height + v64 - fmax(v61, 0.0);
        if ((_DWORD)v20)
          x = v62 + 4.0;
        else
          x = v62;
        if ((_DWORD)v20)
          width = v65 + -4.0;
        else
          width = v65;
      }
    }
    else
    {
      x = TSDRectWithSize();
      y = v49;
      width = v50;
      height = v51;
      if ((_DWORD)v20)
      {
        v22 = 4.0;
        v23 = 4.0;
        goto LABEL_12;
      }
    }
  }
LABEL_15:
  objc_opt_class();
  objc_msgSend(v19, "valueForProperty:", 517);
  v29 = (void *)TSUDynamicCast();
  if (v29)
  {
    if (v10 > 0x13 || (v30 = 2.0, ((1 << v10) & 0xD8006) == 0))
      objc_msgSend(v29, "width", v30, *(_QWORD *)&MinY);
    if (v30 >= width)
      v31 = width;
    else
      v31 = v30;
    if (v30 >= height)
      v30 = height;
    x = x + v31;
    width = width - v31 * 2.0;
    y = y + v30;
    height = height - v30 * 2.0;
  }
  v32 = TSDRoundedRect(x, y, width, height);
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v39 = objc_msgSend(v19, "boxedObjectForProperty:", 519);
  if (v39 && v39 != objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    objc_msgSend(v19, "fadeReflectionForSwatchGeneration");
  if (v21)
    v40 = 0.0;
  else
    v40 = a8;
  v41 = -[TSDInfoGeometry initWithPosition:size:angle:]([TSDMutableInfoGeometry alloc], "initWithPosition:size:angle:", v32, v34, v36, v38, v40);
  -[TSDInfoGeometry size](v41, "size");
  v42 = +[TSDPathSource pathSourceForShapeType:naturalSize:](TSDPathSource, "pathSourceForShapeType:naturalSize:", v10);
  objc_msgSend(v42, "naturalSize");
  -[TSDMutableInfoGeometry setSize:](v41, "setSize:");
  v43 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:geometry:style:pathSource:", objc_msgSend(a9, "context"), v41, v19, v42);
  if ((_DWORD)v10 == 15)
  {
    objc_msgSend(v43, "setHeadLineEnd:", +[TSDLineEnd openArrow](TSDLineEnd, "openArrow"));
    objc_msgSend(v43, "setTailLineEnd:", +[TSDLineEnd simpleArrow](TSDLineEnd, "simpleArrow"));
  }
  else if ((_DWORD)v10 == 16)
  {
    objc_msgSend(v43, "setHeadLineEnd:", +[TSDLineEnd simpleArrow](TSDLineEnd, "simpleArrow"));
  }
  -[TSDSwatchCache applyFakeShadowForWhitePresetsIfNecessary:documentRoot:](self, "applyFakeShadowForWhitePresetsIfNecessary:documentRoot:", v43, a9, *(_QWORD *)&MinY);
  v44 = -[TSDImager initWithDocumentRoot:]([TSDImager alloc], "initWithDocumentRoot:", a9);
  -[TSDImager setScaledImageSize:](v44, "setScaledImageSize:", TSDMultiplySizeScalar(v17, v16, a5));
  -[TSDImager setUnscaledClipRect:](v44, "setUnscaledClipRect:", 0.0, 0.0, v17, v16);
  -[TSDImager setInfos:](v44, "setInfos:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v43));
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v45 = -[TSDImager newImage](v44, "newImage");
  if (v10 <= 0x13 && ((1 << v10) & 0xC0004) != 0)
  {
    objc_opt_class();
    v46 = -[TSDSwatchCache p_newImageWithConnectionLineKnobsForShape:atScale:ofSize:overImage:](self, "p_newImageWithConnectionLineKnobsForShape:atScale:ofSize:overImage:", TSUDynamicCast(), v45, a5, v17, v16);
    CGImageRelease(v45);
    v45 = v46;
  }
  v47 = (void *)objc_msgSend(MEMORY[0x24BEB3C90], "imageWithCGImage:scale:orientation:", v45, 0, a5);
  CGImageRelease(v45);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

  return v47;
}

- (CGImage)p_newImageWithConnectionLineKnobsForShape:(id)a3 atScale:(double)a4 ofSize:(CGSize)a5 overImage:(CGImage *)a6
{
  double v9;
  uint64_t v10;
  uint64_t v11;
  CGContext *v12;
  void *v13;
  void *v14;
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
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  CGFloat v38;
  CGImage *v39;
  CGImage *v40;
  CGImage *v41;
  CGImage *Image;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat rect;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  _QWORD v54[10];
  uint64_t v55;
  double *v56;
  uint64_t v57;
  void *v58;
  __int128 v59;
  uint64_t v60;
  double *v61;
  uint64_t v62;
  void *v63;
  __int128 v64;
  uint64_t v65;
  double *v66;
  uint64_t v67;
  void *v68;
  __int128 v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v9 = TSDMultiplySizeScalar(a5.width, a5.height, a4);
  v11 = v10;
  v12 = TSDBitmapContextCreate(3, v9);
  v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C90], "imageNamed:inBundle:", CFSTR("sf-ios-canvas-knob-blue"), TSDBundle());
  v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C90], "imageNamed:inBundle:", CFSTR("sf-ios-canvas-knob-green"), TSDBundle());
  objc_msgSend(v13, "size");
  v16 = v15;
  v18 = v17;
  v65 = 0;
  v66 = (double *)&v65;
  v67 = 0x3010000000;
  v68 = &unk_217C8B239;
  v69 = *MEMORY[0x24BDBEFB0];
  v60 = 0;
  v61 = (double *)&v60;
  v62 = 0x3010000000;
  v63 = &unk_217C8B239;
  v64 = v69;
  v55 = 0;
  v56 = (double *)&v55;
  v57 = 0x3010000000;
  v58 = &unk_217C8B239;
  v59 = v69;
  v54[0] = MEMORY[0x24BDAC760];
  v54[1] = 3221225472;
  v54[2] = __85__TSDSwatchCache_p_newImageWithConnectionLineKnobsForShape_atScale_ofSize_overImage___block_invoke;
  v54[3] = &unk_24D82C240;
  v54[4] = &v65;
  v54[5] = &v60;
  v54[6] = &v55;
  *(double *)&v54[7] = a4;
  *(double *)&v54[8] = v9;
  v54[9] = v11;
  objc_msgSend(a3, "performBlockWithTemporaryLayout:", v54);
  v19 = TSDRectWithSize();
  v52 = v20;
  v53 = v19;
  v50 = v22;
  v51 = v21;
  v23 = TSDMultiplySizeScalar(v16, v18, a4);
  TSDRectWithCenterAndSize(v61[4], v61[5], v23);
  v47 = v25;
  v48 = v24;
  TSDRectWithCenterAndSize(v66[4], v66[5], v23);
  v44 = v27;
  v45 = v26;
  TSDRectWithCenterAndSize(v56[4], v56[5], v23);
  v29 = v28;
  rect = v30;
  v31 = TSDRoundedPoint();
  v46 = v32;
  v33 = TSDRoundedPoint();
  v35 = v34;
  v36 = TSDRoundedPoint();
  v38 = v37;
  v70.origin.y = v52;
  v70.origin.x = v53;
  v70.size.height = v50;
  v70.size.width = v51;
  CGContextDrawImage(v12, v70, a6);
  v39 = (CGImage *)objc_msgSend(v13, "CGImageForContentsScale:", a4);
  v71.origin.x = v36;
  v71.origin.y = v38;
  v71.size.width = v29;
  v71.size.height = rect;
  CGContextDrawImage(v12, v71, v39);
  v40 = (CGImage *)objc_msgSend(v14, "CGImageForContentsScale:", a4);
  v72.origin.x = v31;
  v72.origin.y = v46;
  v72.size.height = v47;
  v72.size.width = v48;
  CGContextDrawImage(v12, v72, v40);
  v41 = (CGImage *)objc_msgSend(v13, "CGImageForContentsScale:", a4);
  v73.origin.x = v33;
  v73.origin.y = v35;
  v73.size.height = v44;
  v73.size.width = v45;
  CGContextDrawImage(v12, v73, v41);
  Image = CGBitmapContextCreateImage(v12);
  CGContextRelease(v12);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v65, 8);
  return Image;
}

CGFloat __85__TSDSwatchCache_p_newImageWithConnectionLineKnobsForShape_atScale_ofSize_overImage___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  uint64_t v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  CGFloat v21;
  CGFloat v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  uint64_t v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat result;
  CGAffineTransform v33;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v36;
  CGAffineTransform v37;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  objc_msgSend(v2, "tailPoint");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  objc_msgSend(v2, "getControlKnobPosition:", 12);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v8;
  objc_msgSend(v2, "headPoint");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v9 + 32) = v10;
  *(_QWORD *)(v9 + 40) = v11;
  memset(&v37, 0, sizeof(v37));
  if (v2)
    objc_msgSend(v2, "transformInRoot");
  CGAffineTransformMakeScale(&t2, *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 56));
  t1 = v37;
  CGAffineTransformConcat(&v36, &t1, &t2);
  v37 = v36;
  v12 = TSDRectWithSize();
  TSDAffineTransformForFlips(0, 1, (uint64_t)&v33, v12, v13, v14, v15);
  t1 = v37;
  CGAffineTransformConcat(&v36, &t1, &v33);
  v37 = v36;
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v17 = *(double *)(v16 + 32);
  v18 = *(double *)(v16 + 40);
  v19 = *(_OWORD *)&v36.a;
  v20 = *(_OWORD *)&v36.c;
  v21 = v36.tx + v18 * v36.c + v36.a * v17;
  v22 = v36.ty + v18 * v36.d + v36.b * v17;
  *(CGFloat *)(v16 + 32) = v21;
  *(CGFloat *)(v16 + 40) = v22;
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v24 = *(double *)(v23 + 32);
  v25 = *(double *)(v23 + 40);
  v26 = *(double *)&v20 * v25 + *(double *)&v19 * v24;
  v27 = v37.ty + *((double *)&v20 + 1) * v25 + *((double *)&v19 + 1) * v24;
  *(double *)(v23 + 32) = v37.tx + v26;
  *(CGFloat *)(v23 + 40) = v27;
  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v29 = *(double *)(v28 + 32);
  v30 = *(double *)(v28 + 40);
  v31 = v37.tx + *(double *)&v20 * v30 + *(double *)&v19 * v29;
  result = v37.ty + *((double *)&v20 + 1) * v30 + *((double *)&v19 + 1) * v29;
  *(CGFloat *)(v28 + 32) = v31;
  *(CGFloat *)(v28 + 40) = result;
  return result;
}

- (id)imageForImagePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 imageInfo:(id)a7 shouldClipVertically:(BOOL)a8 documentRoot:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  double v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  TSDMaskInfo *v38;
  TSDInfoGeometry *v39;
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
  TSDMaskInfo *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  TSDInfoGeometry *v59;
  id v60;
  TSDImageInfo *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  void *v70;
  TSDImager *v71;
  double v72;
  uint64_t v73;
  double v74;
  CGImage *v75;
  void *v76;
  double v79;
  double v80;
  double v81;
  double v82;
  CGAffineTransform v84;
  CGRect v85;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v15 = a4.height;
  v81 = a4.width;
  if (a4.width < CGRectGetMaxX(a6)
    || (v85.origin.x = x, v85.origin.y = y, v85.size.width = width, v85.size.height = height, v15 < CGRectGetMaxY(v85)))
  {
    v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDSwatchCache imageForImagePreset:imageSize:imageScale:swatchFrame:imageInfo:shouldClipVertically:documentRoot:]");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSwatchCache.m"), 1059, CFSTR("imageSize must enclose swatchFrame"));
  }
  v18 = TSDMultiplyRectScalar(x, y, width, height, 2.0);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_opt_class();
  v25 = (id)objc_msgSend((id)TSUDynamicCast(), "copyWithContext:", objc_msgSend(a9, "context"));
  objc_msgSend((id)objc_msgSend(a7, "geometry"), "size");
  v79 = v27;
  v80 = v26;
  v28 = objc_msgSend(v25, "boxedValueForProperty:", 520);
  if (v28 && v28 != objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    objc_msgSend(v25, "constrainShadowForSwatchGeneration");
  v82 = v15;
  v29 = (void *)objc_msgSend(a7, "maskInfo");
  if (!v29)
    v29 = (void *)objc_msgSend(a7, "defaultMaskInfoWithContext:", objc_msgSend(a9, "context"));
  v30 = (void *)objc_msgSend(v29, "geometry");
  objc_msgSend(v30, "size");
  v33 = TSDScaleSizeWithinSize(v22, v24, v31, v32);
  v35 = v34;
  objc_msgSend(v30, "center");
  v38 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", objc_msgSend(a9, "context"), -[TSDInfoGeometry initWithCenter:size:]([TSDInfoGeometry alloc], "initWithCenter:size:", v36, v37, v33, v35), +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:", v33, v35));
  if (v38)
  {
    v39 = -[TSDDrawableInfo geometry](v38, "geometry");
    -[TSDInfoGeometry size](v39, "size");
    v41 = v22 / v40;
    v43 = v24 / v42;
    if (v41 <= v43)
      v44 = v43;
    else
      v44 = v41;
    -[TSDInfoGeometry position](v39, "position");
    v47 = TSDMultiplyPointScalar(v45, v46, v44);
    v49 = v48;
    v50 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", objc_msgSend(a9, "context"), -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v47, v48, v22, v24), +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:", v22, v24));
    v22 = v80 * v44;
    v24 = v79 * v44;
    v18 = v18 - v47;
    v20 = v20 - v49;
  }
  else
  {
    v50 = 0;
  }
  v51 = TSDRoundedRect(v18, v20, v22, v24);
  v53 = v52;
  v55 = v54;
  v57 = v56;
  v58 = objc_msgSend(v25, "boxedObjectForProperty:", 519);
  if (v58 && v58 != objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    objc_msgSend(v25, "fadeReflectionForSwatchGeneration");
  v59 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v51, v53, v55, v57);
  v60 = (id)objc_msgSend(a7, "thumbnailImageData");
  if (!v60)
    v60 = -[TSDSwatchCache p_thumbnailImageDataForImageData:](self, "p_thumbnailImageDataForImageData:", objc_msgSend(a7, "imageData"));
  v61 = -[TSDImageInfo initWithContext:geometry:style:imageData:originalImageData:]([TSDImageInfo alloc], "initWithContext:geometry:style:imageData:originalImageData:", objc_msgSend(a9, "context"), v59, v25, v60, 0);
  -[TSDImageInfo setMaskInfo:](v61, "setMaskInfo:", v50);
  if (objc_msgSend(a7, "instantAlphaPath"))
  {
    objc_msgSend((id)objc_msgSend(+[TSDImageProviderPool sharedPool](TSDImageProviderPool, "sharedPool"), "temporaryProviderForData:shouldValidate:", v60, 1), "naturalSize");
    v63 = v62;
    v65 = v64;
    objc_msgSend(a7, "naturalSize");
    v67 = v63 / v66;
    v69 = v65 / v68;
    v70 = (void *)objc_msgSend((id)objc_msgSend(a7, "instantAlphaPath"), "copy");
    CGAffineTransformMakeScale(&v84, v67, v69);
    objc_msgSend(v70, "transformUsingAffineTransform:", &v84);
    -[TSDImageInfo setInstantAlphaPath:](v61, "setInstantAlphaPath:", v70);

  }
  v71 = -[TSDImager initWithDocumentRoot:]([TSDImager alloc], "initWithDocumentRoot:", a9);
  -[TSDImager setScaledImageSize:](v71, "setScaledImageSize:", TSDMultiplySizeScalar(v81, v82, a5));
  v72 = TSDMultiplySizeScalar(v81, v82, 2.0);
  -[TSDImager setUnscaledClipRect:](v71, "setUnscaledClipRect:", TSDRectWithOriginAndSize(v73, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v72, v74));
  -[TSDImager setInfos:](v71, "setInfos:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v61));
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v75 = -[TSDImager newImage](v71, "newImage");
  v76 = (void *)objc_msgSend(MEMORY[0x24BEB3C90], "imageWithCGImage:scale:orientation:", v75, 0, a5);
  CGImageRelease(v75);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

  return v76;
}

- (CGSize)imageSizeForPreset:(id)a3 swatchSize:(CGSize)a4
{
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
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
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGSize result;

  v4 = TSDRectWithSize();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_opt_class();
  v11 = (void *)TSUDynamicCast();
  v12 = (id)objc_msgSend(v11, "copyWithContext:", objc_msgSend(v11, "context"));
  if (v12)
  {
    v13 = v12;
    v14 = TSDMultiplyRectScalar(v4, v6, v8, v10, 2.0);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_opt_class();
    objc_msgSend(v13, "valueForProperty:", 517);
    v21 = (void *)TSUDynamicCast();
    if (v21)
    {
      v22 = v21;
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v21, "frameSpec"), "frameName"), "isEqualToString:", CFSTR("Renaissance 1")) & 1) == 0)
      {
        objc_msgSend(v22, "coverageRect:", v14, v16, v18, v20);
        v14 = v23;
        v16 = v24;
        v18 = v25;
        v20 = v26;
      }
    }
    objc_opt_class();
    objc_msgSend(v13, "valueForProperty:", 519);
    TSUDynamicCast();
    objc_opt_class();
    objc_msgSend(v13, "valueForProperty:", 520);
    if (TSUDynamicCast())
    {
      objc_msgSend(v13, "constrainShadowForSwatchGeneration");
      objc_opt_class();
      objc_msgSend(v13, "valueForProperty:", 520);
      objc_msgSend((id)TSUDynamicCast(), "shadowBoundsForRect:", v14, v16, v18, v20);
      v14 = v27;
      v16 = v28;
      v18 = v29;
      v20 = v30;
    }
    TSDMultiplyRectScalar(v14, v16, v18, v20, 0.5);
    v8 = v31;
    v10 = v32;
  }
  v33 = v8;
  v34 = v10;
  result.height = v34;
  result.width = v33;
  return result;
}

- (id)p_maskInfoForMovieInfo:(id)a3 context:(id)a4
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
  id v18;
  TSDInfoGeometry *v19;
  TSDMaskInfo *v20;

  v5 = (void *)objc_msgSend(a3, "geometry");
  objc_msgSend(v5, "center");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "position");
  v11 = TSDSubtractPoints(v7, v9, v10);
  v13 = v12;
  objc_msgSend(v5, "size");
  v15 = v14;
  v17 = v16;
  v18 = +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:");
  v19 = -[TSDInfoGeometry initWithCenter:size:]([TSDInfoGeometry alloc], "initWithCenter:size:", v11, v13, v15, v17);
  v20 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", a4, v19, v18);

  return v20;
}

- (id)p_thumbnailImageDataForImageData:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  if (p_thumbnailImageDataForImageData__sOnce != -1)
    dispatch_once(&p_thumbnailImageDataForImageData__sOnce, &__block_literal_global_41);
  v4 = (void *)p_thumbnailImageDataForImageData__sCache;
  objc_sync_enter((id)p_thumbnailImageDataForImageData__sCache);
  v5 = (id)objc_msgSend((id)p_thumbnailImageDataForImageData__sCache, "objectForKey:", a3);
  objc_sync_exit(v4);
  if (a3 && !v5)
    v5 = TSDResampleImageData(a3, 0, 0, 256.0, 256.0);
  if (!v5 || v5 == a3)
    return a3;
  v6 = (void *)p_thumbnailImageDataForImageData__sCache;
  objc_sync_enter((id)p_thumbnailImageDataForImageData__sCache);
  objc_msgSend((id)p_thumbnailImageDataForImageData__sCache, "setObject:forKey:", v5, a3);
  objc_sync_exit(v6);
  return v5;
}

uint64_t __51__TSDSwatchCache_p_thumbnailImageDataForImageData___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x24BEB3CA0]), "initWithMaxSize:", 1);
  p_thumbnailImageDataForImageData__sCache = result;
  return result;
}

- (id)imageForMoviePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 movieInfo:(id)a7 shouldClipVertically:(BOOL)a8 documentRoot:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  double v15;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  id v32;
  void *v33;
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
  double v44;
  double v45;
  TSDMaskInfo *v46;
  double v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  TSDInfoGeometry *v53;
  TSDImageInfo *v54;
  TSDImager *v55;
  double v56;
  uint64_t v57;
  double v58;
  CGImage *v59;
  void *v60;
  double v62;
  double v63;
  double v64;
  CGRect v66;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v15 = a4.height;
  v63 = a4.width;
  if (a4.width < CGRectGetMaxX(a6)
    || (v66.origin.x = x, v66.origin.y = y, v66.size.width = width, v66.size.height = height, v15 < CGRectGetMaxY(v66)))
  {
    v17 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDSwatchCache imageForMoviePreset:imageSize:imageScale:swatchFrame:movieInfo:shouldClipVertically:documentRoot:]");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSwatchCache.m"), 1392, CFSTR("imageSize must enclose swatchFrame"));
  }
  v19 = TSDMultiplyRectScalar(x, y, width, height, 2.0);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_opt_class();
  v26 = (id)objc_msgSend((id)TSUDynamicCast(), "copyWithContext:", objc_msgSend(a9, "context"));
  objc_msgSend((id)objc_msgSend(a7, "geometry"), "size");
  v28 = v27;
  v30 = v29;
  v31 = objc_msgSend(v26, "boxedValueForProperty:", 520);
  if (v31 && v31 != objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    objc_msgSend(v26, "constrainShadowForSwatchGeneration");
  v64 = v15;
  v32 = -[TSDSwatchCache p_maskInfoForMovieInfo:context:](self, "p_maskInfoForMovieInfo:context:", a7, objc_msgSend(a9, "context"));
  if (v32)
  {
    v33 = (void *)objc_msgSend(v32, "geometry");
    objc_msgSend(v33, "size");
    v35 = v23 / v34;
    v37 = v25 / v36;
    if (v35 <= v37)
      v38 = v37;
    else
      v38 = v35;
    objc_msgSend(v33, "position");
    v62 = v19;
    v41 = v21;
    v42 = v28;
    v43 = TSDMultiplyPointScalar(v39, v40, v38);
    v45 = v44;
    v46 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", objc_msgSend(a9, "context"), -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v43, v44, v23, v25), +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:", v23, v25));
    v23 = v42 * v38;
    v47 = v41;
    v25 = v30 * v38;
    v19 = v62 - v43;
    v21 = v47 - v45;
  }
  else
  {
    v46 = 0;
  }
  v48 = objc_msgSend(v26, "boxedObjectForProperty:", 519);
  if (v48 && v48 != objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    objc_msgSend(v26, "fadeReflectionForSwatchGeneration");
  v49 = TSDRoundedRect(v19, v21, v23, v25);
  v53 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v49, v50, v51, v52);
  v54 = -[TSDImageInfo initWithContext:geometry:style:imageData:originalImageData:]([TSDImageInfo alloc], "initWithContext:geometry:style:imageData:originalImageData:", objc_msgSend(a9, "context"), v53, v26, -[TSDSwatchCache p_thumbnailImageDataForImageData:](self, "p_thumbnailImageDataForImageData:", objc_msgSend(a7, "posterImageData")), 0);
  -[TSDImageInfo setMaskInfo:](v54, "setMaskInfo:", v46);
  v55 = -[TSDImager initWithDocumentRoot:]([TSDImager alloc], "initWithDocumentRoot:", a9);
  -[TSDImager setScaledImageSize:](v55, "setScaledImageSize:", TSDMultiplySizeScalar(v63, v64, a5));
  v56 = TSDMultiplySizeScalar(v63, v64, 2.0);
  -[TSDImager setUnscaledClipRect:](v55, "setUnscaledClipRect:", TSDRectWithOriginAndSize(v57, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v56, v58));
  -[TSDImager setInfos:](v55, "setInfos:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v54));
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v59 = -[TSDImager newImage](v55, "newImage");
  v60 = (void *)objc_msgSend(MEMORY[0x24BEB3C90], "imageWithCGImage:scale:orientation:", v59, 0, a5);
  CGImageRelease(v59);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

  return v60;
}

- (id)imageForMoviePreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 movieInfo:(id)a6 shouldClipVertically:(BOOL)a7 documentRoot:(id)a8
{
  double height;
  double width;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  BOOL v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;
  float v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  float v41;
  double v42;
  float v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  id v49;
  TSDInfoGeometry *v50;
  TSDMaskInfo *v51;
  TSDInfoGeometry *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  id v63;
  TSDInfoGeometry *v64;
  TSDMaskInfo *v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  TSDInfoGeometry *v72;
  TSDImageInfo *v73;
  TSDImager *v74;
  double v75;
  uint64_t v76;
  double v77;
  CGImage *v78;
  void *v79;
  double v81;
  double v82;
  double v83;
  double v85;

  height = a4.height;
  width = a4.width;
  v14 = TSUPhoneUI();
  v15 = 3.0;
  if (v14)
    v16 = 3.0;
  else
    v16 = 2.0;
  v17 = 30.0;
  if (v14)
    v17 = 8.0;
  v18 = v17 + (width - width) * 0.5;
  if (!v14)
    v15 = 1.0;
  v19 = v15 * (v17 + (height - height) * 0.25);
  v20 = v16 * (width - v17);
  v21 = v16 * (height - v17);
  objc_opt_class();
  v22 = (id)objc_msgSend((id)TSUDynamicCast(), "copyWithContext:", objc_msgSend(a8, "context"));
  objc_msgSend((id)objc_msgSend(a6, "geometry"), "size");
  v24 = v23;
  v85 = v25;
  objc_opt_class();
  objc_msgSend(v22, "valueForProperty:", 517);
  v26 = (void *)TSUDynamicCast();
  if (v26)
  {
    objc_msgSend(v26, "coverageRect:", v18, v19, v20, v21);
    v29 = v28 < 0.0;
    *(float *)&v28 = v28;
    v30 = roundf(*(float *)&v28);
    v31 = v19 - v30;
    v32 = v21 + v30;
    if (v29)
      v21 = v32;
    if (v29)
      v19 = v31;
    v33 = v27 < 0.0;
    v34 = v27;
    v35 = roundf(v34);
    v36 = v18 - v35;
    v37 = v20 + v35;
    if (v33)
      v20 = v37;
    if (v33)
      v18 = v36;
  }
  objc_opt_class();
  objc_msgSend(v22, "valueForProperty:", 520);
  if (TSUDynamicCast()
    && (objc_msgSend(v22, "constrainShadowForSwatchGeneration"),
        objc_opt_class(),
        objc_msgSend(v22, "valueForProperty:", 520),
        v38 = (void *)TSUDynamicCast(),
        objc_msgSend(v38, "isDropShadow")))
  {
    objc_msgSend(v38, "shadowBoundsForRect:", v18, v19, v20, v21);
    if (v40 < 0.0)
    {
      v41 = v40;
      v21 = v21 + roundf(v41);
    }
    v42 = v85;
    if (v39 < 0.0)
    {
      v43 = v39;
      v20 = v20 + roundf(v43);
    }
  }
  else
  {
    v42 = v85;
  }
  v82 = width;
  v83 = height;
  v81 = v16;
  if (a7)
  {
    v44 = v24;
    v45 = v42;
    v46 = TSDScaleSizeWithinSize(v20, v21, v24, v42);
    v48 = v47;
    v49 = +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:", v46, *(_QWORD *)&v44, *(_QWORD *)&v81);
    v50 = -[TSDInfoGeometry initWithCenter:size:]([TSDInfoGeometry alloc], "initWithCenter:size:", v44 * 0.5, v45 * 0.5, v46, v48);
    v51 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", objc_msgSend(a8, "context"), v50, v49);

    if (v51)
    {
      v52 = -[TSDDrawableInfo geometry](v51, "geometry");
      -[TSDInfoGeometry size](v52, "size");
      v54 = v20 / v53;
      v56 = v21 / v55;
      if (v54 <= v56)
        v57 = v56;
      else
        v57 = v54;
      -[TSDInfoGeometry position](v52, "position");
      v60 = TSDMultiplyPointScalar(v58, v59, v57);
      v62 = v61;
      v63 = +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:", v20, v21);
      v64 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v60, v62, v20, v21);
      v65 = -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", objc_msgSend(a8, "context"), v64, v63);

    }
    else
    {
      v65 = 0;
    }
  }
  else
  {
    v65 = 0;
  }
  v66 = objc_msgSend(v22, "boxedObjectForProperty:", 519);
  if (v66 && v66 != objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    objc_msgSend(v22, "fadeReflectionForSwatchGeneration");
  v67 = TSDRoundedPoint();
  v69 = v68;
  v70 = TSDRoundedSize();
  v72 = -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", v67, v69, v70, v71);
  v73 = -[TSDImageInfo initWithContext:geometry:style:imageData:originalImageData:]([TSDImageInfo alloc], "initWithContext:geometry:style:imageData:originalImageData:", objc_msgSend(a8, "context"), v72, v22, -[TSDSwatchCache p_thumbnailImageDataForImageData:](self, "p_thumbnailImageDataForImageData:", objc_msgSend(a6, "posterImageData")), 0);
  -[TSDImageInfo setMaskInfo:](v73, "setMaskInfo:", v65);
  v74 = -[TSDImager initWithDocumentRoot:]([TSDImager alloc], "initWithDocumentRoot:", a8);
  -[TSDImager setScaledImageSize:](v74, "setScaledImageSize:", TSDMultiplySizeScalar(v82, v83, a5));
  v75 = TSDMultiplySizeScalar(v82, v83, v81);
  -[TSDImager setUnscaledClipRect:](v74, "setUnscaledClipRect:", TSDRectWithOriginAndSize(v76, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v75, v77));
  -[TSDImager setInfos:](v74, "setInfos:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v73));
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v78 = -[TSDImager newImage](v74, "newImage");
  v79 = (void *)objc_msgSend(MEMORY[0x24BEB3C90], "imageWithCGImage:scale:orientation:", v78, 0, a5);
  CGImageRelease(v78);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

  return v79;
}

@end
