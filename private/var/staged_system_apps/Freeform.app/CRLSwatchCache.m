@implementation CRLSwatchCache

+ (CRLSwatchCache)swatchCache
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100259590;
  block[3] = &unk_10122DC38;
  block[4] = a1;
  if (qword_101415288 != -1)
    dispatch_once(&qword_101415288, block);
  return (CRLSwatchCache *)(id)qword_101415280;
}

- (CGSize)shapeSwatchInset
{
  double v2;
  double v3;
  CGSize result;

  v2 = 8.0;
  v3 = 8.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (BOOL)applyFakeStrokeIfNeededForShape:(id)a3 backgroundAppearance:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  double v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stroke"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stroke"));
    if ((objc_msgSend(v7, "isNullStroke") & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stroke"));
      v8 = objc_msgSend(v9, "requiresOutlineOnBackgroundWithAppearance:", a4) ^ 1;

    }
  }
  else
  {
    v8 = 0;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fill"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fill"));
    v12 = objc_msgSend(v11, "requiresOutlineOnBackgroundWithAppearance:", a4) ^ 1;

  }
  else
  {
    v12 = 0;
  }

  if (((v8 | v12) & 1) == 0)
  {
    v13 = 0.0;
    if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
      v13 = 1.0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithWhite:alpha:](CRLColor, "colorWithWhite:alpha:", v13, 0.200000003));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStroke strokeWithColor:width:](CRLStroke, "strokeWithColor:width:", v14, 1.0));
    objc_msgSend(v5, "setStroke:", v15);

  }
  return (v8 | v12) ^ 1;
}

- (id)shapeItemWithPresetsForSize:(CGSize)a3 shapeType:(int64_t)a4 shapePathSource:(id)a5 angle:(double)a6 editingCoordinator:(id)a7 renderingContext:(id)a8
{
  double height;
  double width;
  id v15;
  id v16;
  id v17;
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
  unsigned __int8 v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  __double2 v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL4 v46;
  BOOL v47;
  void *v48;
  void *v49;
  unsigned int v50;
  uint64_t v51;
  void *v52;
  id v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  id v60;
  double v62;

  height = a3.height;
  width = a3.width;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  -[CRLSwatchCache shapeSwatchInset](self, "shapeSwatchInset");
  v19 = v18;
  v21 = v20;
  -[CRLSwatchCache swatchInsetForShapeType:](self, "swatchInsetForShapeType:", a4);
  v23 = sub_1000603D0(v19, v21, v22);
  v25 = v24;
  v26 = width - v23 * 2.0;
  v27 = height - v24 * 2.0;
  v28 = objc_msgSend(v17, "wantsRoundedCornersIfAppropriate");
  if (a4 == 3 && (v28 & 1) != 0)
  {
    v29 = objc_claimAutoreleasedReturnValue(+[CRLScalarPathSource roundedRectangleWithScalar:naturalSize:continuousCurve:](CRLScalarPathSource, "roundedRectangleWithScalar:naturalSize:continuousCurve:", 1, 5.0, width - v23 * 2.0, v27));

    v15 = (id)v29;
LABEL_4:
    objc_msgSend(v15, "naturalSize");
    objc_msgSend(v15, "scaleToNaturalSize:", sub_100062E78(0, v30, v31, v26 + 0.0, v27 + 0.0));
    objc_msgSend(v15, "naturalSize");
    v23 = v23 + (v26 - v32) * 0.5;
    objc_msgSend(v15, "naturalSize");
    v25 = v25 + (v27 - v33) * 0.5;
    a4 = 21;
    v34 = v15;
    goto LABEL_15;
  }
  if ((unint64_t)a4 <= 0x14)
  {
    if (((1 << a4) & 0x1D8006) != 0)
    {
      if (v26 >= v27)
        v35 = v27;
      else
        v35 = width - v23 * 2.0;
      v36 = __sincos_stret(a6 * 0.0174532925);
      v37 = fabs(v36.__sinval);
      v38 = fabs(v36.__cosval);
      if (v37 < v38)
        v37 = v38;
      v23 = width * 0.5 - v35 / v37 * 0.5;
      v25 = height * 0.5;
      goto LABEL_13;
    }
    if (a4 == 9)
    {
      v62 = -4.0;
LABEL_44:
      v23 = v23 + v62;
      goto LABEL_13;
    }
  }
  if ((unint64_t)(a4 - 13) <= 1)
  {
    v62 = -2.0;
    goto LABEL_44;
  }
  if (a4 == 21)
    goto LABEL_4;
  if (a4 == 12)
    v23 = v23 + 7.0;
LABEL_13:
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPathSource pathSourceForShapeType:naturalSize:](CRLPathSource, "pathSourceForShapeType:naturalSize:", a4));

  if (a4 == 4)
  {
    objc_opt_class(CRLScalarPathSource, v39);
    v41 = sub_100221D0C(v40, v34);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    objc_msgSend(v42, "setIsCurveContinuous:", 1);

    a4 = 4;
  }
LABEL_15:
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "boardItemFactory"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "makeShapeItemForShapeLibrarySwatchWithShapeType:pathSource:position:angleInDegrees:", a4, v34, v23, v25, a6));

  v46 = (unint64_t)(a4 - 1) < 0x14 && ((0xEC003u >> (a4 - 1)) & 1) != 0
     || a4 == 19
     || (a4 & 0xFFFFFFFFFFFFFFEFLL) == 2;
  v47 = objc_msgSend(v17, "backgroundAppearance") != (id)3 && objc_msgSend(v17, "backgroundAppearance") != (id)2;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stroke"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "color"));
  v50 = -[CRLSwatchCache p_shouldAddHighContrastBackgroundForShapeType:withStrokeColor:context:](self, "p_shouldAddHighContrastBackgroundForShapeType:withStrokeColor:context:", a4, v49, v17);

  if (v46 && !v47)
  {
    if ((v50 & 1) != 0)
      v51 = objc_claimAutoreleasedReturnValue(+[CRLColor canvas_darkInsertSwatchBackgroundColor](CRLColor, "canvas_darkInsertSwatchBackgroundColor"));
    else
      v51 = objc_claimAutoreleasedReturnValue(-[CRLSwatchCache p_darkBackgroundColorForBackgroundAppearance:](self, "p_darkBackgroundColorForBackgroundAppearance:", objc_msgSend(v17, "backgroundAppearance")));
    v52 = (void *)v51;
    v53 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stroke"));
    objc_msgSend(v53, "width");
    if (v54 < 2.0)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stroke"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "color"));
      objc_msgSend(v56, "contrastRatioWithColor:", v52);
      v58 = v57;

      if (v58 >= 6.0)
      {
LABEL_36:

        goto LABEL_37;
      }
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stroke"));
      v53 = objc_msgSend(v59, "mutableCopy");

      objc_msgSend(v53, "setWidth:", 2.0);
      v60 = objc_msgSend(v53, "copy");
      objc_msgSend(v44, "setStroke:", v60);

    }
    goto LABEL_36;
  }
LABEL_37:
  if (((v46 | objc_msgSend(v17, "wantsToRenderHighContrastBackground") ^ 1 | v50) & 1) == 0)
    +[CRLSwatchCache applyFakeStrokeIfNeededForShape:backgroundAppearance:](CRLSwatchCache, "applyFakeStrokeIfNeededForShape:backgroundAppearance:", v44, objc_msgSend(v17, "backgroundAppearance"));

  return v44;
}

- (id)imageForShapeWithSize:(CGSize)a3 imageScale:(double)a4 shapeType:(int64_t)a5 shapePathSource:(id)a6 angle:(double)a7 editingCoordinator:(id)a8 renderingContext:(id)a9
{
  double height;
  double width;
  id v17;
  id v18;
  void *v19;
  CRLCanvasImager *v20;
  void *v21;
  CRLCanvasImager *v22;
  void *v23;
  uint64_t v24;
  CGImage *v25;
  uint64_t v26;
  id v27;
  void *v28;
  CGImage *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  CGImage *v33;
  void *v34;
  void *v36;

  height = a3.height;
  width = a3.width;
  v17 = a9;
  v18 = a8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSwatchCache shapeItemWithPresetsForSize:shapeType:shapePathSource:angle:editingCoordinator:renderingContext:](self, "shapeItemWithPresetsForSize:shapeType:shapePathSource:angle:editingCoordinator:renderingContext:", a5, a6, v18, v17, width, height, a7));
  v20 = [CRLCanvasImager alloc];
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mainBoard"));

  v22 = -[CRLCanvasImager initWithBoard:renderForWideGamut:](v20, "initWithBoard:renderForWideGamut:", v21, objc_msgSend(v17, "rendersForWideGamut"));
  -[CRLCanvasImager setScaledImageSize:](v22, "setScaledImageSize:", sub_1000603DC(width, height, a4));
  sub_1000603DC(width, height, 1.0);
  -[CRLCanvasImager setUnscaledClipRect:](v22, "setUnscaledClipRect:", sub_10005FDDC());
  v36 = v19;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
  -[CRLCanvasImager setInfos:](v22, "setInfos:", v23);

  v25 = -[CRLCanvasImager newImage](v22, "newImage");
  if ((unint64_t)a5 <= 0x13 && ((1 << a5) & 0xC0004) != 0)
  {
    objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v24);
    v27 = sub_100221D0C(v26, v19);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = -[CRLSwatchCache p_newImageWithConnectionLineKnobsForShape:atScale:ofSize:overImage:](self, "p_newImageWithConnectionLineKnobsForShape:atScale:ofSize:overImage:", v28, v25, a4, width, height);

    CGImageRelease(v25);
    v25 = v29;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stroke"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "color"));
  v32 = -[CRLSwatchCache p_shouldAddHighContrastBackgroundForShapeType:withStrokeColor:context:](self, "p_shouldAddHighContrastBackgroundForShapeType:withStrokeColor:context:", a5, v31, v17);

  if (v32)
  {
    v33 = +[CRLSwatchCache newImageForDarkBackground:atScale:ofSize:inset:](CRLSwatchCache, "newImageForDarkBackground:atScale:ofSize:inset:", v25, a4, width, height, CGSizeZero.width, CGSizeZero.height);
    CGImageRelease(v25);
    v25 = v33;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:scale:orientation:](CRLImage, "imageWithCGImage:scale:orientation:", v25, 0, a4));
  CGImageRelease(v25);

  return v34;
}

- (BOOL)p_shouldAddHighContrastBackgroundForShapeType:(int64_t)a3 withStrokeColor:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  int v11;
  _BOOL4 v12;
  unsigned int v13;
  void *v14;
  void *v15;

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "wantsToRenderHighContrastBackground")
    && ((unint64_t)(a3 - 1) < 0x14 && ((0xEC003u >> (a3 - 1)) & 1) != 0
      ? (v11 = 0)
      : (a3 != 19 ? (v10 = (a3 & 0xFFFFFFFFFFFFFFEFLL) == 2) : (v10 = 1), v10 ? (v11 = 0) : (v11 = 1)),
        objc_msgSend(v9, "backgroundAppearance") != (id)3
      ? (v12 = objc_msgSend(v9, "backgroundAppearance") != (id)2)
      : (v12 = 0),
        ((v11 | v12) & 1) == 0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSwatchCache p_darkBackgroundColorForBackgroundAppearance:](self, "p_darkBackgroundColorForBackgroundAppearance:", objc_msgSend(v9, "backgroundAppearance")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor canvas_darkInsertSwatchBackgroundColor](CRLColor, "canvas_darkInsertSwatchBackgroundColor"));
    v13 = objc_msgSend(v8, "improvesContrastWhenDisplayedOverAlternateBackgroundColor:ratherThanStandardBackgroundColor:inScenario:", v15, v14, 1) ^ 1;

  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (id)p_darkBackgroundColorForBackgroundAppearance:(unint64_t)a3
{
  void *v3;
  void *v4;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor canvas_darkTranslucentSwatchBackground](CRLColor, "canvas_darkTranslucentSwatchBackground"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor crl_insertPaneBackgroundColor](UIColor, "crl_insertPaneBackgroundColor"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithUIColor:](CRLColor, "colorWithUIColor:", v4));

  }
  return v3;
}

- (id)imageForImageWithSize:(CGSize)a3 imageScale:(double)a4 imageInfo:(id)a5 editingCoordinator:(id)a6 renderForWideGamut:(BOOL)a7
{
  double height;
  double width;
  id v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CRLMaskInfo *v22;
  double v23;
  double v24;
  void *v25;
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
  double v36;
  void *v37;
  CRLCanvasInfoGeometry *v38;
  CRLMaskInfo *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  BOOL v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  CRLMaskInfo *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CRLCanvasInfoGeometry *v68;
  void *v69;
  void *v70;
  void *v71;
  CRLCanvasImager *v72;
  void *v73;
  CRLCanvasImager *v74;
  void *v75;
  CGImage *v76;
  void *v77;
  CRLCanvasInfoGeometry *v79;
  void *v80;
  double v81;
  double v82;
  _BOOL4 v83;
  double v85;
  void *v86;

  v83 = a7;
  height = a3.height;
  width = a3.width;
  v10 = a5;
  v85 = height;
  v12 = height + -20.0;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geometry"));
  objc_msgSend(v14, "size");
  v81 = v16;
  v82 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geometryWithMask"));
  objc_msgSend(v17, "size");
  v19 = v18;
  v21 = v20;

  v22 = (CRLMaskInfo *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "maskInfo"));
  if (!v22)
    v22 = (CRLMaskInfo *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "defaultMaskInfo"));
  v11 = width + -20.0;
  v23 = v11 + v11;
  v24 = v12 + v12;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskInfo geometry](v22, "geometry"));
  objc_msgSend(v25, "size");
  v28 = v26;
  v29 = v27;
  if (v21 <= v19)
  {

    v42 = v28 / v29;
    if (v28 / v29 <= width / v85)
    {
      v44 = v24 * v42;
      v41 = 20.0;
      v40 = (v23 - v44) * 0.5 + 20.0;
      v23 = v44;
    }
    else
    {
      v43 = v23 / v42;
      v40 = 20.0;
      v41 = (v24 - v43) * 0.5 + 20.0;
      v24 = v43;
    }
  }
  else
  {
    v30 = sub_100062DDC(v11 + v11, v24, v26, v27);
    v32 = v31;
    objc_msgSend(v25, "center");
    v34 = v33;
    v36 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[CRLScalarPathSource rectangleWithNaturalSize:](CRLScalarPathSource, "rectangleWithNaturalSize:", v30, v32));
    v38 = -[CRLCanvasInfoGeometry initWithCenter:size:]([CRLCanvasInfoGeometry alloc], "initWithCenter:size:", v34, v36, v30, v32);

    v39 = -[CRLMaskInfo initWithImageItem:geometry:pathSource:]([CRLMaskInfo alloc], "initWithImageItem:geometry:pathSource:", v10, v38, v37);
    v40 = 20.0;
    v41 = 20.0;
    v22 = v39;
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskInfo geometry](v22, "geometry"));
  objc_msgSend(v45, "size");
  v48 = v23 / v47;
  v49 = v47 <= 0.0;
  v50 = 1.0;
  if (v49)
    v48 = 1.0;
  if (v46 > 0.0)
    v50 = v24 / v46;
  if (v48 >= v50)
    v51 = v48;
  else
    v51 = v50;
  objc_msgSend(v45, "position");
  v54 = sub_1000603DC(v52, v53, v51);
  v56 = v55;
  v57 = objc_claimAutoreleasedReturnValue(+[CRLScalarPathSource rectangleWithNaturalSize:](CRLScalarPathSource, "rectangleWithNaturalSize:", v23, v24));
  v79 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v54, v56, v23, v24);
  v80 = (void *)v57;
  v58 = -[CRLMaskInfo initWithImageItem:geometry:pathSource:]([CRLMaskInfo alloc], "initWithImageItem:geometry:pathSource:", v10, v79, v57);
  v59 = sub_1000603DC(v82, v81, v51);
  v60 = v40 - v54;
  v61 = v41 - v56;
  v63 = sub_1000630C4(v59, v62);
  v65 = v64;
  v66 = sub_1000630C4(v60, v61);
  v68 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v66, v67, v63, v65);
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "thumbnailAssetPayload"));
  if (!v69)
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageAssetPayload"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "boardItemFactory"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "makeImageItemWithGeometry:imageData:thumbnailData:", v68, v69, 0));

  objc_msgSend(v71, "setMaskInfo:", v58);
  v72 = [CRLCanvasImager alloc];
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mainBoard"));

  v74 = -[CRLCanvasImager initWithBoard:renderForWideGamut:](v72, "initWithBoard:renderForWideGamut:", v73, v83);
  -[CRLCanvasImager setScaledImageSize:](v74, "setScaledImageSize:", sub_1000603DC(width, v85, a4));
  sub_1000603DC(width, v85, 2.0);
  -[CRLCanvasImager setUnscaledClipRect:](v74, "setUnscaledClipRect:", sub_10005FDDC());
  v86 = v71;
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v86, 1));
  -[CRLCanvasImager setInfos:](v74, "setInfos:", v75);

  v76 = -[CRLCanvasImager newImage](v74, "newImage");
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:scale:orientation:](CRLImage, "imageWithCGImage:scale:orientation:", v76, 0, a4));
  CGImageRelease(v76);

  return v77;
}

+ (CGImage)newImageForDarkBackground:(CGImage *)a3 atScale:(double)a4 ofSize:(CGSize)a5 inset:(CGSize)a6
{
  CGFloat height;
  CGFloat width;
  double v9;
  double v10;
  CGContext *v11;
  CGFloat x;
  CGFloat y;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  CGImage *Image;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a6.height;
  width = a6.width;
  v9 = sub_1000603DC(a5.width, a5.height, a4);
  v11 = sub_10040FA64(3, v9, v10);
  v19.origin.x = sub_10005FDDC();
  v20 = CGRectInset(v19, width, height);
  x = v20.origin.x;
  y = v20.origin.y;
  v14 = v20.size.width;
  v15 = v20.size.height;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor canvas_darkInsertSwatchBackgroundColor](CRLColor, "canvas_darkInsertSwatchBackgroundColor"));
  CGContextSetFillColorWithColor(v11, (CGColorRef)objc_msgSend(v16, "CGColor"));

  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = v14;
  v21.size.height = v15;
  CGContextFillRect(v11, v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = v14;
  v22.size.height = v15;
  CGContextDrawImage(v11, v22, a3);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  return Image;
}

- (CGImage)p_newImageWithConnectionLineKnobsForShape:(id)a3 atScale:(double)a4 ofSize:(CGSize)a5 overImage:(CGImage *)a6
{
  double height;
  double width;
  id v10;
  double v11;
  double v12;
  double v13;
  CGContext *v14;
  void *v15;
  void *v16;
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
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  CGFloat v49;
  CGImage *v50;
  CGImage *v51;
  CGImage *v52;
  CGImage *Image;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat rect;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  _QWORD v65[10];
  uint64_t v66;
  double *v67;
  uint64_t v68;
  void *v69;
  CGPoint v70;
  uint64_t v71;
  double *v72;
  uint64_t v73;
  void *v74;
  CGPoint v75;
  uint64_t v76;
  double *v77;
  uint64_t v78;
  void *v79;
  CGPoint v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  height = a5.height;
  width = a5.width;
  v10 = a3;
  v11 = sub_1000603DC(width, height, a4);
  v13 = v12;
  v14 = sub_10040FA64(3, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasKnob defaultSelectionKnobImage](CRLCanvasKnob, "defaultSelectionKnobImage"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasKnob greenKnobImage](CRLCanvasKnob, "greenKnobImage"));
  objc_msgSend(v15, "size");
  v18 = v17;
  v20 = v19;
  v76 = 0;
  v77 = (double *)&v76;
  v78 = 0x3010000000;
  v79 = &unk_1010E66AB;
  v80 = CGPointZero;
  v71 = 0;
  v72 = (double *)&v71;
  v73 = 0x3010000000;
  v74 = &unk_1010E66AB;
  v75 = v80;
  v66 = 0;
  v67 = (double *)&v66;
  v68 = 0x3010000000;
  v69 = &unk_1010E66AB;
  v70 = v80;
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_10025A8B4;
  v65[3] = &unk_1012484F0;
  v65[4] = &v76;
  v65[5] = &v71;
  v65[6] = &v66;
  *(double *)&v65[7] = a4;
  *(double *)&v65[8] = v11;
  *(double *)&v65[9] = v13;
  objc_msgSend(v10, "withTemporaryLayoutPerform:", v65);
  v21 = sub_10005FDDC();
  v63 = v22;
  v64 = v21;
  v61 = v24;
  v62 = v23;
  v25 = sub_1000603DC(v18, v20, a4);
  v26 = sub_10005FD98(v72[4], v72[5], v25);
  v28 = v27;
  v58 = v30;
  v59 = v29;
  v31 = sub_10005FD98(v77[4], v77[5], v25);
  v33 = v32;
  v55 = v35;
  v56 = v34;
  v36 = sub_10005FD98(v67[4], v67[5], v25);
  v38 = v37;
  v40 = v39;
  rect = v41;
  v42 = sub_1000630C4(v26, v28);
  v57 = v43;
  v44 = sub_1000630C4(v31, v33);
  v46 = v45;
  v47 = sub_1000630C4(v36, v38);
  v49 = v48;
  v81.origin.y = v63;
  v81.origin.x = v64;
  v81.size.height = v61;
  v81.size.width = v62;
  CGContextDrawImage(v14, v81, a6);
  v50 = (CGImage *)objc_msgSend(v15, "CGImageForContentsScale:", a4);
  v82.origin.x = v47;
  v82.origin.y = v49;
  v82.size.width = v40;
  v82.size.height = rect;
  CGContextDrawImage(v14, v82, v50);
  v51 = (CGImage *)objc_msgSend(v16, "CGImageForContentsScale:", a4);
  v83.origin.x = v42;
  v83.origin.y = v57;
  v83.size.height = v58;
  v83.size.width = v59;
  CGContextDrawImage(v14, v83, v51);
  v52 = (CGImage *)objc_msgSend(v15, "CGImageForContentsScale:", a4);
  v84.origin.x = v44;
  v84.origin.y = v46;
  v84.size.height = v55;
  v84.size.width = v56;
  CGContextDrawImage(v14, v84, v52);
  Image = CGBitmapContextCreateImage(v14);
  CGContextRelease(v14);
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v76, 8);

  return Image;
}

- (CGSize)swatchInsetForShapeType:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  if ((unint64_t)a3 > 0x14 || (v3 = 3.0, ((1 << a3) & 0x1D8006) == 0))
    v3 = 0.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)imageForMovieWithSize:(CGSize)a3 imageScale:(double)a4 movieInfo:(id)a5 editingCoordinator:(id)a6 renderForWideGamut:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;

  v7 = a7;
  height = a3.height;
  width = a3.width;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geometry"));
  objc_msgSend(v15, "size");
  v17 = v16;
  v19 = v18;

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10025AC3C;
  v24[3] = &unk_101248518;
  v25 = v13;
  v26 = v14;
  v20 = v14;
  v21 = v13;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSwatchCache imageForStyledItemWithSize:imageScale:editingCoordinator:renderForWideGamut:styledInfoAspectRatio:usingSwatchInfoFromBlock:](self, "imageForStyledItemWithSize:imageScale:editingCoordinator:renderForWideGamut:styledInfoAspectRatio:usingSwatchInfoFromBlock:", v20, v7, v24, width, height, a4, v17, v19));

  return v22;
}

- (id)imageForStyledItemWithSize:(CGSize)a3 imageScale:(double)a4 editingCoordinator:(id)a5 renderForWideGamut:(BOOL)a6 styledInfoAspectRatio:(CGSize)a7 usingSwatchInfoFromBlock:(id)a8
{
  _BOOL8 v9;
  double height;
  double width;
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
  double v25;
  double v26;
  uint64_t (**v27)(id, CRLCanvasInfoGeometry *);
  id v28;
  CRLCanvasInfoGeometry *v29;
  uint64_t v30;
  void *v31;
  CRLCanvasImager *v32;
  void *v33;
  CRLCanvasImager *v34;
  void *v35;
  CGImage *v36;
  void *v37;
  void *v39;

  v9 = a6;
  height = a3.height;
  width = a3.width;
  v14 = a3.width + -20.0 + a3.width + -20.0;
  v15 = a3.height + -20.0 + a3.height + -20.0;
  v16 = a7.width / a7.height;
  if (a7.width / a7.height <= width / height)
  {
    v20 = v15 * v16;
    v19 = 20.0;
    v18 = (v14 - v20) * 0.5 + 20.0;
    v14 = v20;
  }
  else
  {
    v17 = v14 / v16;
    v18 = 20.0;
    v19 = (v15 - v17) * 0.5 + 20.0;
    v15 = v17;
  }
  v21 = sub_1000630C4(v14, v15);
  v23 = v22;
  v24 = sub_1000630C4(v18, v19);
  v26 = v25;
  v27 = (uint64_t (**)(id, CRLCanvasInfoGeometry *))a8;
  v28 = a5;
  v29 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v24, v26, v21, v23);
  v30 = v27[2](v27, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

  v32 = [CRLCanvasImager alloc];
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "mainBoard"));

  v34 = -[CRLCanvasImager initWithBoard:renderForWideGamut:](v32, "initWithBoard:renderForWideGamut:", v33, v9);
  -[CRLCanvasImager setScaledImageSize:](v34, "setScaledImageSize:", sub_1000603DC(width, height, a4));
  sub_1000603DC(width, height, 2.0);
  -[CRLCanvasImager setUnscaledClipRect:](v34, "setUnscaledClipRect:", sub_10005FDDC());
  if (v31)
  {
    v39 = v31;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
    -[CRLCanvasImager setInfos:](v34, "setInfos:", v35);

  }
  v36 = -[CRLCanvasImager newImage](v34, "newImage");
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:scale:orientation:](CRLImage, "imageWithCGImage:scale:orientation:", v36, 0, a4));
  CGImageRelease(v36);

  return v37;
}

@end
