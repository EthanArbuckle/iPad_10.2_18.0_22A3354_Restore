@implementation CRLPKStrokeConverter

+ (id)pencilKitStrokesFromPath:(id)a3 inkStroke:(id)a4 strokePathCompactData:(id)a5 maskPath:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  float v28;
  CGFloat v29;
  float v30;
  __int128 v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *i;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  unint64_t v45;
  unsigned int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id obj;
  id v56;
  CGAffineTransform v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  _BYTE v65[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v56 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "color"));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UIColor"));

  objc_msgSend(v10, "width");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "inkType"));
  +[CRLPencilKitInkStroke unadjustedStrokeWidthFromAdjustedWidth:forInkType:](CRLPencilKitInkStroke, "unadjustedStrokeWidthFromAdjustedWidth:forInkType:", v17, v16);
  v19 = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "inkType"));
  +[PKInkingTool _weightForWidth:type:](PKInkingTool, "_weightForWidth:type:", v20, v19);
  v22 = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "inkType"));
  v52 = (void *)v14;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[PKInk inkWithIdentifier:color:weight:](PKInk, "inkWithIdentifier:color:weight:", v23, v14, v22));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_sixChannelVersion"));

  objc_msgSend(v10, "width");
  v27 = v26;
  memset(&v64, 0, sizeof(v64));
  if (v11)
  {
    objc_msgSend(v11, "renderScaleX");
    v29 = v28;
    objc_msgSend(v11, "renderScaleY");
    CGAffineTransformMakeScale(&v64, v29, v30);
  }
  else
  {
    v31 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v64.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v64.c = v31;
    *(_OWORD *)&v64.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  v54 = v9;
  v32 = objc_msgSend(v9, "copy");
  v62 = v64;
  CGAffineTransformInvert(&v63, &v62);
  objc_msgSend(v32, "transformUsingAffineTransform:", &v63);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "inkType"));
  v53 = v10;
  v51 = v32;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPKStrokePathConverter strokePathsFromBezierPath:baseWidth:strokePathCompactData:inkType:isFountainPenInkV2:](CRLPKStrokePathConverter, "strokePathsFromBezierPath:baseWidth:strokePathCompactData:inkType:isFountainPenInkV2:", v32, v11, v33, objc_msgSend(v10, "isFountainPenInkV2"), v27));

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v34;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(_QWORD *)v59 != v37)
          objc_enumerationMutation(obj);
        v39 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
        if (v12)
        {
          v40 = (id)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", objc_msgSend(objc_retainAutorelease(v12), "CGPath")));
          if (v40)
          {
            v62 = v64;
            CGAffineTransformInvert(&v57, &v62);
            objc_msgSend(v40, "transformUsingAffineTransform:", &v57);
            v40 = objc_retainAutorelease(v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", objc_msgSend(v40, "CGPath")));
          }
          else
          {
            v41 = 0;
          }
        }
        else
        {
          v41 = 0;
          v40 = 0;
        }
        v42 = objc_alloc((Class)PKStroke);
        v43 = objc_msgSend(v11, "randomSeed");
        v62 = v64;
        v44 = objc_msgSend(v42, "initWithInk:strokePath:transform:mask:randomSeed:", v25, v39, &v62, v41, v43);
        v45 = (unint64_t)objc_msgSend(v44, "_flags");
        v46 = objc_msgSend(v11, "shouldSolveMath");
        v47 = 0x20000000000;
        if (!v46)
          v47 = 0;
        objc_msgSend(v44, "_setFlags:", v47 | v45 & 0xFFFFFDFFFFFFFFFFLL);
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "renderGroupID"));
        objc_msgSend(v44, "_setRenderGroupID:", v48);

        objc_msgSend(v11, "anchorPointForTexture");
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "crl_copyWithNewAnchorPointForTexture:"));
        objc_msgSend(v56, "addObject:", v49);

      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    }
    while (v36);
  }

  return v56;
}

+ (id)pathFromPKStroke:(id)a3 startingAtPointIndex:(unint64_t)a4 endingAtPointIndex:(unint64_t)a5 pencilKitStrokePathData:(id *)a6
{
  id v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
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
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  char *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  _OWORD v66[3];
  _OWORD v67[3];
  _OWORD v68[3];
  _QWORD v69[2];

  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
  v11 = (char *)objc_msgSend(v10, "count");

  if ((unint64_t)v11 < a4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F330);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0406C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F350);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokeConverter pathFromPKStroke:startingAtPointIndex:endingAtPointIndex:pencilKitStrokePathData:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokeConverter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 111, 0, "Out-of-bounds startingAtPointIndex parameter.");

  }
  if ((unint64_t)v11 < a5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F370);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E03FEC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F390);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokeConverter pathFromPKStroke:startingAtPointIndex:endingAtPointIndex:pencilKitStrokePathData:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokeConverter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 112, 0, "Out-of-bounds endingAtPointIndex parameter.");

  }
  if ((unint64_t)(v11 - 1) < a4)
    a4 = (unint64_t)(v11 - 1);
  if ((unint64_t)(v11 - 1) < a5)
    a5 = (unint64_t)(v11 - 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
  v19 = objc_msgSend(v18, "count");

  if ((unint64_t)v19 <= 1)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
      v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", 0));

    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123F3B0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E03F6C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123F3D0);
      v24 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokeConverter pathFromPKStroke:startingAtPointIndex:endingAtPointIndex:pencilKitStrokePathData:]"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokeConverter.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 121, 0, "Unable to convert a PKStroke with no points. Using fallback values.");

      v23 = objc_msgSend(objc_alloc((Class)PKStrokePoint), "initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:", CGPointZero.x, CGPointZero.y, 0.0, 5.0, 5.0, 1.0, 1.0, 0.0, 0);
    }
    v27 = objc_alloc((Class)PKStrokePoint);
    objc_msgSend(v23, "location");
    v29 = v28 + 0.1;
    objc_msgSend(v23, "location");
    v31 = v30;
    objc_msgSend(v23, "timeOffset");
    v33 = v32 + 0.01;
    objc_msgSend(v23, "size");
    v35 = v34;
    v37 = v36;
    objc_msgSend(v23, "opacity");
    v39 = v38;
    objc_msgSend(v23, "force");
    v41 = v40;
    objc_msgSend(v23, "azimuth");
    v43 = v42;
    objc_msgSend(v23, "altitude");
    v45 = objc_msgSend(v27, "initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:", v29, v31, v33, v35, v37, v39, v41, v43, v44);
    v46 = objc_alloc((Class)PKStrokePath);
    v69[0] = v23;
    v69[1] = v45;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 2));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "creationDate"));
    v50 = objc_msgSend(v46, "initWithControlPoints:creationDate:", v47, v49);

    v51 = objc_alloc((Class)PKStroke);
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ink"));
    if (v9)
      objc_msgSend(v9, "transform");
    else
      memset(v68, 0, sizeof(v68));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mask"));
    v54 = objc_msgSend(v51, "initWithInk:strokePath:transform:mask:randomSeed:", v52, v50, v68, v53, objc_msgSend(v9, "randomSeed"));

    a5 = 1;
    v9 = v54;
  }
  if (a6)
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[CRLPKStrokePathConverter strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:](CRLPKStrokePathConverter, "strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:", v9, a4, a5));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mask"));

  if (v55)
  {
    v56 = objc_alloc((Class)PKStroke);
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ink"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
    if (v9)
      objc_msgSend(v9, "transform");
    else
      memset(v67, 0, sizeof(v67));
    v63 = objc_msgSend(v56, "initWithInk:strokePath:transform:mask:randomSeed:", v57, v58, v67, 0, objc_msgSend(v9, "randomSeed"));

    v62 = v63;
  }
  else
  {
    if (!a4)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
      v60 = (char *)objc_msgSend(v59, "count") - 1;

      if ((char *)a5 == v60)
      {
        v61 = objc_msgSend(v9, "_newPathRepresentation");
        goto LABEL_53;
      }
    }
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_substrokeWithRange:", a4, a5 - a4 + 1));
    v63 = v62;
  }
  v61 = objc_msgSend(v62, "_newPathRepresentation");

LABEL_53:
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", v61));
  if (v9)
    objc_msgSend(v9, "transform");
  else
    memset(v66, 0, sizeof(v66));
  objc_msgSend(v64, "transformUsingAffineTransform:", v66);
  if (v61)
    CFRelease(v61);

  return v64;
}

+ (id)pathFromPKStroke:(id)a3 pencilKitStrokePathData:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPKStrokeConverter pathFromPKStroke:startingAtPointIndex:endingAtPointIndex:pencilKitStrokePathData:](CRLPKStrokeConverter, "pathFromPKStroke:startingAtPointIndex:endingAtPointIndex:pencilKitStrokePathData:", v5, 0, (char *)objc_msgSend(v6, "count") - 1, a4));

  return v7;
}

@end
