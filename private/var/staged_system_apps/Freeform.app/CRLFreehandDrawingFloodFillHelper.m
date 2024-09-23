@implementation CRLFreehandDrawingFloodFillHelper

+ (id)fillablePathFromPaths:(id)a3 atFillPoint:(CGPoint)a4 withConnectionThreshold:(double)a5 pathsUsedForFilling:(id *)a6
{
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat width;
  CGFloat height;
  CRLBezierHitTester *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  void *v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  unsigned int v59;
  void *v60;
  void *v61;
  void *v62;
  NSString *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  double v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  _BYTE v86[128];
  _BYTE v87[128];
  CGPoint v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;

  y = a4.y;
  x = a4.x;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crl_arrayOfObjectsPassingTest:", &stru_10125E3B0));

  if (!objc_msgSend(v12, "count"))
    goto LABEL_30;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_bitmapFillablePathFromPaths:atFillPoint:allowOverflowingPath:", v12, 1, x, y));
  v14 = v13;
  if (!v13 || !objc_msgSend(v13, "containsElementsOtherThanMoveAndClose"))
  {

LABEL_30:
    v49 = 0;
    goto LABEL_31;
  }
  objc_msgSend(v14, "bounds");
  v90 = CGRectInset(v89, -20.0, -20.0);
  v15 = v90.origin.x;
  v16 = v90.origin.y;
  width = v90.size.width;
  height = v90.size.height;
  v19 = -[CRLBezierHitTester initWithBucketSize:]([CRLBezierHitTester alloc], "initWithBucketSize:", 10.0);
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v20 = v12;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v77 != v22)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v24, "bounds");
        v95.origin.x = v25;
        v95.origin.y = v26;
        v95.size.width = v27;
        v95.size.height = v28;
        v91.origin.x = v15;
        v91.origin.y = v16;
        v91.size.width = width;
        v91.size.height = height;
        if (CGRectIntersectsRect(v91, v95))
          -[CRLBezierHitTester addPath:filled:](v19, "addPath:filled:", v24, 0);
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
    }
    while (v21);
  }

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierHitTester pathsCrossingPath:withSearchThreshold:](v19, "pathsCrossingPath:withSearchThreshold:", v14, 20.0));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "allObjects"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_connectionPathsForFillableAreas:withConnectionThreshold:", v29, a5));

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "allObjects"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "arrayByAddingObjectsFromArray:", v71));

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_bitmapFillablePathFromPaths:atFillPoint:allowOverflowingPath:", v70, 0, x, y));
  v32 = v31;
  if (v31 && objc_msgSend(v31, "containsElementsOtherThanMoveAndClose"))
  {
    v67 = v32;
    objc_msgSend(v32, "bounds");
    v93 = CGRectInset(v92, -20.0, -20.0);
    v33 = v93.origin.x;
    v34 = v93.origin.y;
    v35 = v93.size.width;
    v36 = v93.size.height;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v37 = v71;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v73;
      do
      {
        for (j = 0; j != v38; j = (char *)j + 1)
        {
          if (*(_QWORD *)v73 != v39)
            objc_enumerationMutation(v37);
          v41 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v41, "bounds");
          v96.origin.x = v42;
          v96.origin.y = v43;
          v96.size.width = v44;
          v96.size.height = v45;
          v94.origin.x = v33;
          v94.origin.y = v34;
          v94.size.width = v35;
          v94.size.height = v36;
          if (CGRectIntersectsRect(v94, v96))
            -[CRLBezierHitTester addPath:filled:](v19, "addPath:filled:", v41, 0);
        }
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
      }
      while (v38);
    }

    v32 = v67;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierHitTester pathsCrossingPath:withSearchThreshold:](v19, "pathsCrossingPath:withSearchThreshold:", v67, 20.0));
    v68 = v46;
    if (a6)
    {
      *a6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "allObjects"));
      v46 = v68;
    }
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "allObjects"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathBooleanOperationHelper pathByFloodFillingPaths:atFillPoint:](CRLBezierPathBooleanOperationHelper, "pathByFloodFillingPaths:atFillPoint:", x, y));
    v48 = v47;
    if (v47 && (objc_msgSend(v47, "containsElementsOtherThanMoveAndClose") & 1) != 0)
    {
      v49 = v48;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125E3D0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E34E1C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125E3F0);
      v51 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingFloodFillHelper fillablePathFromPaths:atFillPoint:withConnectionThreshold:pathsUsedForFilling:]"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingFloodFillHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v52, v53, 115, 0, "Failed to flood fill paths with Clipper. Falling back to a smoothed bitmap path.");

      if (qword_10147E618 != -1)
        dispatch_once(&qword_10147E618, &stru_10125E410);
      if (os_log_type_enabled((os_log_t)off_1013DC600, OS_LOG_TYPE_DEBUG))
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "crl_arrayByMappingObjectsUsingBlock:", &stru_10125E450));
        if (qword_10147E618 != -1)
          dispatch_once(&qword_10147E618, &stru_10125E470);
        v55 = off_1013DC600;
        if (os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_DEBUG))
        {
          v88.x = x;
          v88.y = y;
          v63 = NSStringFromCGPoint(v88);
          v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
          *(_DWORD *)buf = 134218498;
          v81 = a5;
          v82 = 2112;
          v83 = v64;
          v84 = 2112;
          v85 = v54;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v55, OS_LOG_TYPE_DEBUG, "Flood fill failure:\nthreshold=%f\nfillPoint=%@\npaths=\n%@\n", buf, 0x20u);

        }
      }
      v49 = (id)objc_claimAutoreleasedReturnValue(+[CRLBezierPath smoothBezierPath:withThreshold:](CRLBezierPath, "smoothBezierPath:withThreshold:", v67, 2.0));

      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "bezierPathByOffsettingPath:joinStyle:", objc_msgSend(v49, "lineJoinStyle"), 0.25));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "bezierPathByRemovingRedundantElements"));
      v57 = v56;
      if (v56
        && (v58 = v56, v59 = objc_msgSend(v56, "containsElementsOtherThanMoveAndClose"), v57 = v58, v59))
      {
        v60 = v49;
        v49 = v58;
      }
      else
      {
        v58 = v57;
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125E490);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E34D9C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125E4B0);
        v61 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingFloodFillHelper fillablePathFromPaths:atFillPoint:withConnectionThreshold:pathsUsedForFilling:]"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingFloodFillHelper.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v60, v62, 134, 0, "Failed to re-outset the path to return. Returning the slightly inset version.");

      }
    }

  }
  else
  {
    v49 = 0;
  }

  if (v49 && (objc_msgSend(v49, "containsElementsOtherThanMoveAndClose") & 1) == 0)
  {

    goto LABEL_30;
  }
LABEL_31:

  return v49;
}

+ (id)p_connectionPathsForFillableAreas:(id)a3 withConnectionThreshold:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  CRLBezierHitTester *v16;
  unint64_t v17;
  double v18;
  void *v19;
  double v20;
  dispatch_queue_attr_t v21;
  dispatch_queue_t v22;
  id v23;
  dispatch_queue_global_t global_queue;
  NSObject *v25;
  id v26;
  CRLBezierHitTester *v27;
  NSObject *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  unint64_t *v39;
  id v40;
  _QWORD block[4];
  id v42;
  CRLBezierHitTester *v43;
  NSObject *v44;
  unint64_t *v45;
  double v46;
  _QWORD v47[6];
  unint64_t v48[6];
  void *__p;
  void *v50;
  uint64_t v51;
  double v52;
  _BYTE v53[32];
  int v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[5];
  _BYTE v60[128];

  v6 = a3;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10043F9DC;
  v59[3] = &unk_10125E4D0;
  v59[4] = a1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crl_arrayByTransformingWithBlock:", v59));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v56 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "isCompound"))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "arrayOfSubpathsWithEffectivelyEmptySubpathsRemoved:", 1));
          objc_msgSend(v8, "addObjectsFromArray:", v14);

        }
        else
        {
          objc_msgSend(v8, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v10);
  }

  v15 = v8;
  memset(v53, 0, sizeof(v53));
  v54 = 1065353216;
  v16 = -[CRLBezierHitTester initWithBucketSize:]([CRLBezierHitTester alloc], "initWithBucketSize:", 5.0);
  v17 = 0;
  v18 = 0.0;
  while (1)
  {
    v48[0] = v17;
    if (v17 >= (unint64_t)objc_msgSend(v15, "count"))
      break;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v48[0]));
    -[CRLBezierHitTester addPath:filled:pathID:](v16, "addPath:filled:pathID:", v19, 0, v48[0]);
    v52 = 0.0;
    objc_msgSend(v19, "lineWidth");
    v52 = v20;
    sub_10044194C((uint64_t)v53, v48, v48, &v52);
    if (v52 > v18)
      v18 = v52;

    v17 = v48[0] + 1;
  }
  v21 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v35 = objc_claimAutoreleasedReturnValue(v21);
  v22 = dispatch_queue_create("com.apple.freeform.freehand-drawing.flood-fill-connection", v35);
  v48[0] = 0;
  v48[1] = (unint64_t)v48;
  v48[2] = 0x4812000000;
  v48[3] = (unint64_t)sub_10043F9FC;
  v48[4] = (unint64_t)sub_10043FA20;
  v48[5] = (unint64_t)&unk_1010E66AB;
  __p = 0;
  v50 = 0;
  v51 = 0;
  v23 = objc_msgSend(v15, "count");
  global_queue = dispatch_get_global_queue(2, 0);
  v25 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_10043FA38;
  block[3] = &unk_10125E5B0;
  v26 = v15;
  v42 = v26;
  v46 = v18 + a4;
  v27 = v16;
  v43 = v27;
  sub_100441B78((uint64_t)v47, (uint64_t)v53);
  *(double *)&v47[5] = a4;
  v28 = v22;
  v44 = v28;
  v45 = v48;
  dispatch_apply((size_t)v23, v25, block);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10044058C;
  v36[3] = &unk_10125E5E8;
  v39 = v48;
  v30 = v26;
  v37 = v30;
  v40 = a1;
  v31 = v29;
  v38 = v31;
  dispatch_sync(v28, v36);
  v32 = v38;
  v33 = v31;

  sub_10001E288((uint64_t)v47);
  _Block_object_dispose(v48, 8);
  if (__p)
  {
    v50 = __p;
    operator delete(__p);
  }

  sub_10001E288((uint64_t)v53);
  return v33;
}

+ (id)p_flattenedPathForPath:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  _BYTE v12[32];

  v3 = a3;
  if (objc_msgSend(v3, "isFlat"))
  {
    v4 = v3;
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    objc_msgSend(v3, "copyPathAttributesTo:", v4);
    v5 = (uint64_t)objc_msgSend(v3, "elementCount");
    if (v5 >= 1)
    {
      v6 = 0;
      do
      {
        v10 = xmmword_100EEC438;
        v11 = xmmword_100EEC438;
        *(_OWORD *)v12 = xmmword_100EEC438;
        *(_OWORD *)&v12[16] = xmmword_100EEC438;
        switch((unint64_t)objc_msgSend(v3, "elementAtIndex:allPoints:", v6, &v10))
        {
          case 0uLL:
            objc_msgSend(v4, "moveToPoint:", v10);
            break;
          case 1uLL:
            objc_msgSend(v4, "lineToPoint:", v11);
            break;
          case 2uLL:
            v7 = sub_10031E874((float64x2_t *)&v10);
            v9[0] = _NSConcreteStackBlock;
            v9[1] = 3221225472;
            v9[2] = sub_100440908;
            v9[3] = &unk_10125E610;
            v9[4] = v4;
            +[CRLBezierPath subdivideBezierWithFlatness:startPoint:controlPoint1:controlPoint2:endPoint:addLineBlock:](CRLBezierPath, "subdivideBezierWithFlatness:startPoint:controlPoint1:controlPoint2:endPoint:addLineBlock:", v9, v7, v10, v11, *(double *)v12, *(_OWORD *)&v12[8], *(_QWORD *)&v12[24]);
            break;
          case 3uLL:
            objc_msgSend(v4, "closePath");
            break;
          default:
            break;
        }
        ++v6;
      }
      while (v5 != v6);
    }
  }

  return v4;
}

+ (id)p_bezierPathWithSectionOfBezierPath:(id)a3 centeredAtPercentAlongPath:(double)a4 withMaximumLength:(double)a5
{
  id v7;
  double v8;
  id v9;
  double v10;
  id v11;
  id v12;
  void *v13;
  double v15;
  double v16;

  v7 = a3;
  objc_msgSend(v7, "length");
  if (v8 == 0.0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  }
  else
  {
    v10 = a5 / v8 * 0.5;
    v16 = 0.0;
    v11 = objc_msgSend(v7, "elementPercentage:forOverallPercentage:", &v16, fmax(a4 - v10, 0.0));
    v15 = 0.0;
    v12 = objc_msgSend(v7, "elementPercentage:forOverallPercentage:", &v15, fmin(v10 + a4, 1.0));
    v9 = objc_msgSend(v7, "copyFromSegment:t:toSegment:t:", v11, v12, v16, v15);
  }
  v13 = v9;

  return v13;
}

+ (id)p_bitmapFillablePathFromPaths:(id)a3 atFillPoint:(CGPoint)a4 allowOverflowingPath:(BOOL)a5
{
  double y;
  double x;
  id v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat width;
  CGFloat height;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CKRecordID v21;
  Swift::String v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
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
  CGContext *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *j;
  CGImage *Image;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  _QWORD *v59;
  uint64_t v60;
  int v61;
  void *v62;
  CRLInstantAlphaBinaryBitmap *v63;
  id v64;
  unsigned int v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v77;
  uint64_t v78;
  double v79;
  BOOL v80;
  CGAffineTransform v81;
  CGAffineTransform v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  CGAffineTransform transform;
  CGAffineTransform v88;
  CGAffineTransform v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[54];
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  CGPoint v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;

  y = a4.y;
  x = a4.x;
  v8 = a3;
  v9 = CGRectNull.origin.x;
  v10 = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v91 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)i), "controlPointBounds");
        v107.origin.x = v17;
        v107.origin.y = v18;
        v107.size.width = v19;
        v107.size.height = v20;
        v102.origin.x = v9;
        v102.origin.y = v10;
        v102.size.width = width;
        v102.size.height = height;
        v103 = CGRectUnion(v102, v107);
        v9 = v103.origin.x;
        v10 = v103.origin.y;
        width = v103.size.width;
        height = v103.size.height;
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
    }
    while (v14);
  }
  v80 = a5;

  v104.origin.x = v9;
  v104.origin.y = v10;
  v104.size.width = width;
  v104.size.height = height;
  v105 = CGRectInset(v104, -5.0, -5.0);
  sub_100063090(v105.size.width);
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v21, v22);
  v27 = 0;
  if (v25 != 0.0 && v26 != 0.0)
  {
    v28 = v23;
    v29 = v24;
    v30 = v25;
    v31 = sub_1000603DC(v25, v26, 2.0);
    v33 = sub_100062E58(v31, v32, 4194304.0);
    v34 = sub_100063090(v33);
    v36 = v35;
    memset(&v89, 0, sizeof(v89));
    v37 = v34 / v30;
    CGAffineTransformMakeScale(&v89, v37, v37);
    v88 = v89;
    CGAffineTransformTranslate((CGAffineTransform *)v96, &v88, -v28, -v29);
    v89 = *(CGAffineTransform *)v96;
    v38 = sub_10040FA64(10, v34, v36);
    if (!v38)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125E630);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E35044();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125E650);
      v39 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingFloodFillHelper p_bitmapFillablePathFromPaths:atFillPoint:allowOverflowingPath:]"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingFloodFillHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v40, v41, 460, 0, "invalid nil value for '%{public}s'", "pathContext");

    }
    CGContextSaveGState(v38);
    transform = v89;
    CGContextConcatCTM(v38, &transform);
    CGContextSetLineWidth(v38, 1.0 / v37);
    CGContextSetGrayStrokeColor(v38, 0.0, 1.0);
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v42 = v13;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v84;
      do
      {
        for (j = 0; j != v43; j = (char *)j + 1)
        {
          if (*(_QWORD *)v84 != v44)
            objc_enumerationMutation(v42);
          CGContextAddPath(v38, (CGPathRef)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)j)), "CGPath"));
        }
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
      }
      while (v43);
    }

    CGContextStrokePath(v38);
    CGContextRestoreGState(v38);
    Image = CGBitmapContextCreateImage(v38);
    if (!Image)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125E670);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E34FB0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125E690);
      v47 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingFloodFillHelper p_bitmapFillablePathFromPaths:atFillPoint:allowOverflowingPath:]"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingFloodFillHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v48, v49, 477, 0, "invalid nil value for '%{public}s'", "pathImage");

    }
    CGContextRelease(v38);
    v50 = +[CRLInstantAlphaHelper newInstantAlphaImageWithCGImage:ofSize:](CRLInstantAlphaHelper, "newInstantAlphaImageWithCGImage:ofSize:", Image, v34, v36);
    CGImageRelease(Image);
    if (v50)
    {
      v51 = v89.tx + y * v89.c + v89.a * x;
      v52 = v89.ty + y * v89.d + v89.b * x;
      v106.origin.x = sub_10005FDDC();
      v53 = v106.origin.y;
      v54 = v106.size.width;
      v55 = v106.size.height;
      v79 = v106.origin.x;
      v101.x = v51;
      v101.y = v52;
      if (!CGRectContainsPoint(v106, v101))
      {
LABEL_44:
        v27 = 0;
LABEL_76:

        goto LABEL_77;
      }
      v56 = (uint64_t)v51;
      v57 = (uint64_t)v52;
      v58 = v50;
      v59 = v58;
      if ((uint64_t)v51 < 0 || v57 < 0 || (v60 = v58[1], v60 <= v56) || v58[2] <= v57)
      {
        v65 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125E730);
        v66 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          v77 = v59[1];
          v78 = v59[2];
          *(_DWORD *)v96 = 67110914;
          *(_DWORD *)&v96[4] = v65;
          *(_WORD *)&v96[8] = 2082;
          *(_QWORD *)&v96[10] = "CRLInstantAlphaPixel getPixel(CRLInstantAlphaImage *__strong, NSInteger, NSInteger)";
          *(_WORD *)&v96[18] = 2082;
          *(_QWORD *)&v96[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaImage.h";
          *(_WORD *)&v96[28] = 1024;
          *(_DWORD *)&v96[30] = 36;
          *(_WORD *)&v96[34] = 2048;
          *(_QWORD *)&v96[36] = (uint64_t)v51;
          *(_WORD *)&v96[44] = 2048;
          *(_QWORD *)&v96[46] = (uint64_t)v52;
          v97 = 2048;
          v98 = v77;
          v99 = 2048;
          v100 = v78;
          _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d bad request for get pixel in IA: (%li, %li) for image of size (%li, %li)", v96, 0x4Au);
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125E750);
        }
        v67 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v67, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CRLInstantAlphaPixel getPixel(CRLInstantAlphaImage *__strong, NSInteger, NSInteger)"));
        v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaImage.h"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v68, v69, 36, 0, "bad request for get pixel in IA: (%li, %li) for image of size (%li, %li)", (uint64_t)v51, (uint64_t)v52, v59[1], v59[2]);

      }
      else
      {
        v61 = *(_DWORD *)(v58[3] + 4 * (v56 + v60 * v57));

        if (v61)
          goto LABEL_44;
      }
      v63 = -[CRLInstantAlphaBinaryBitmap initWithWidth:height:]([CRLInstantAlphaBinaryBitmap alloc], "initWithWidth:height:", (uint64_t)v34, (uint64_t)v36);
      v64 = +[CRLInstantAlphaHelper newMaskSeedFillWithPoint:inImage:tolerance:oldFill:](CRLInstantAlphaHelper, "newMaskSeedFillWithPoint:inImage:tolerance:oldFill:", v59, 0, v63, v51, v52);
      if (!v64)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125E6F0);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E34F1C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125E710);
        v70 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingFloodFillHelper p_bitmapFillablePathFromPaths:atFillPoint:allowOverflowingPath:]"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingFloodFillHelper.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v71, v72, 500, 0, "invalid nil value for '%{public}s'", "binaryBitmap");

      }
      v73 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath tracedPathForInstantAlphaBinaryBitmap:pointSpacing:](CRLBezierPath, "tracedPathForInstantAlphaBinaryBitmap:pointSpacing:", v64, 1.0));
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", v79, v53, v54, v55));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "subtractBezierPath:", v73));

      v27 = v75;
      if (v80 || !objc_msgSend(v75, "containsPoint:", v37 * 5.0 * 0.5, v37 * 5.0 * 0.5))
      {
        v81 = v89;
        CGAffineTransformInvert(&v82, &v81);
        objc_msgSend(v75, "transformUsingAffineTransform:", &v82);
        goto LABEL_75;
      }

    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125E6B0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E34E9C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125E6D0);
      v62 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v62, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v63 = (CRLInstantAlphaBinaryBitmap *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingFloodFillHelper p_bitmapFillablePathFromPaths:atFillPoint:allowOverflowingPath:]"));
      v64 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingFloodFillHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v63, v64, 486, 0, "iaImage should not be nil");
    }
    v27 = 0;
LABEL_75:

    goto LABEL_76;
  }
LABEL_77:

  return v27;
}

@end
