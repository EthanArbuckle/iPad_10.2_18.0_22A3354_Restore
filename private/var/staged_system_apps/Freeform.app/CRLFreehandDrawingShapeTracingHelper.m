@implementation CRLFreehandDrawingShapeTracingHelper

+ (id)unscaledOutlinePathFromFreehandDrawingShapeLayouts:(id)a3 unscaledOutset:(double)a4 viewScale:(double)a5
{
  id v7;
  void *v8;
  CGSize size;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  CGRect *v23;
  double v24;
  void *v25;
  unsigned int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char *v43;
  char *j;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  const CGRect *v53;
  CGFloat *p_height;
  CGSize *p_size;
  CGFloat *p_y;
  void *v57;
  double width;
  double height;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  CGContext *v68;
  void *v69;
  id v70;
  uint64_t v71;
  void *k;
  void *v73;
  CRLBrushStroke *v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  CRLBrushStroke *v79;
  id v80;
  uint64_t v81;
  void *m;
  void *v83;
  CRLStroke *v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  CRLStroke *v89;
  CGImage *Image;
  void *v91;
  void *v92;
  void *v93;
  id obj;
  uint64_t v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  CGAffineTransform v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  CGAffineTransform v112;
  _QWORD block[8];
  _QWORD v114[4];
  int v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  CGRect *v125;
  uint64_t v126;
  void *v127;
  CGPoint origin;
  CGSize v129;
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  CGAffineTransform buf;
  CGAffineTransform v134;
  _BYTE v135[128];
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v124 = 0;
  v125 = (CGRect *)&v124;
  v126 = 0x4010000000;
  v127 = &unk_1010E66AB;
  size = CGRectNull.size;
  origin = CGRectNull.origin;
  v129 = size;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  obj = v7;
  v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
  if (v96)
  {
    v95 = *(_QWORD *)v121;
    if (a5 <= 0.0)
      v10 = 2.0;
    else
      v10 = 2.0 / a5;
    do
    {
      v98 = 0;
      do
      {
        if (*(_QWORD *)v121 != v95)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)v98);
        v12 = a4;
        if (a4 == 0.0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)v98), "stroke"));
          objc_msgSend(v13, "width");
          if (v14 >= 2.0)
            v12 = a4;
          else
            v12 = v10;

        }
        memset(&v134, 0, sizeof(v134));
        if (v11)
          objc_msgSend(v11, "pureTransformInRoot");
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pathSource"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v15, "bezierPath"));
        v100 = objc_msgSend(v16, "copy");

        buf = v134;
        objc_msgSend(v100, "transformUsingAffineTransform:", &buf);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shapeInfo"));
        LOBYTE(v15) = objc_msgSend(v17, "isTreatedAsFillForFreehandDrawing");

        if ((v15 & 1) == 0)
        {
          if (a4 != 0.0 || (objc_msgSend(v100, "length"), v18 >= 10.0))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pencilKitStrokes"));
            if (!v25)
            {
              v26 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_1012414D0);
              v27 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf.a) = 67110146;
                HIDWORD(buf.a) = v26;
                LOWORD(buf.b) = 2082;
                *(_QWORD *)((char *)&buf.b + 2) = "+[CRLFreehandDrawingShapeTracingHelper unscaledOutlinePathFromFreehand"
                                                  "DrawingShapeLayouts:unscaledOutset:viewScale:]";
                WORD1(buf.c) = 2082;
                *(_QWORD *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFr"
                                                  "eehandDrawingShapeTracingHelper.m";
                WORD2(buf.d) = 1024;
                *(_DWORD *)((char *)&buf.d + 6) = 88;
                WORD1(buf.tx) = 2082;
                *(_QWORD *)((char *)&buf.tx + 4) = "pkStrokesFromShapeLayout";
                _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", (uint8_t *)&buf, 0x2Cu);
              }
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_1012414F0);
              v28 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
              {
                v42 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                LODWORD(buf.a) = 67109378;
                HIDWORD(buf.a) = v26;
                LOWORD(buf.b) = 2114;
                *(_QWORD *)((char *)&buf.b + 2) = v42;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);

              }
              v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingShapeTracingHelper unscaledOutlinePathFromFreehandDrawingShapeLayouts:unscaledOutset:viewScale:]"));
              v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingShapeTracingHelper.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 88, 0, "invalid nil value for '%{public}s'", "pkStrokesFromShapeLayout");

            }
            v118 = 0u;
            v119 = 0u;
            v116 = 0u;
            v117 = 0u;
            v31 = v25;
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
            if (v32)
            {
              v33 = *(_QWORD *)v117;
              do
              {
                for (i = 0; i != v32; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v117 != v33)
                    objc_enumerationMutation(v31);
                  v35 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)i);
                  buf = v134;
                  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "crl_strokeByAppendingTransform:", &buf));
                  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
                  v38 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPair pairWithFirst:second:](CRLPair, "pairWithFirst:second:", v36, v37));

                  objc_msgSend(v8, "addObject:", v38);
                }
                v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
              }
              while (v32);
            }
            v39 = v31;
            goto LABEL_41;
          }
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stroke"));
        objc_msgSend(v19, "width");
        v21 = v20;

        v22 = v12 + v21;
        objc_msgSend(v100, "setLineWidth:", v22 + v22);
        objc_msgSend(v100, "bounds");
        v23 = v125;
        v139 = CGRectInset(v136, -v22, -v22);
        v137 = CGRectUnion(v23[1], v139);
        v125[1] = v137;
        objc_msgSend(v100, "length");
        if (v24 < 10.0)
        {
          objc_msgSend(v92, "addObject:", v100);
          goto LABEL_43;
        }
        objc_msgSend(v100, "lineWidth");
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", v40));

        if (!v39)
        {
          v31 = objc_msgSend(v100, "copy");
          objc_msgSend(v100, "lineWidth");
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v93, "setObject:forKeyedSubscript:", v31, v41);

LABEL_41:
          goto LABEL_42;
        }
        objc_msgSend(v39, "appendBezierPath:", v100);
LABEL_42:

LABEL_43:
        v98 = (char *)v98 + 1;
      }
      while (v98 != v96);
      v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
    }
    while (v96);
  }

  v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v43 = (char *)objc_msgSend(v8, "count");
  v114[0] = 0;
  v114[1] = v114;
  v114[2] = 0x2810000000;
  v114[3] = &unk_1010E66AB;
  v115 = 0;
  __dmb(0xBu);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BA2B4;
  block[3] = &unk_101241518;
  block[6] = v114;
  block[7] = &v124;
  block[4] = v8;
  block[5] = v99;
  dispatch_apply((size_t)v43, 0, block);
  v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (v43)
  {
    for (j = 0; j != v43; ++j)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", j));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "objectForKeyedSubscript:", v45));

      if (v46)
        objc_msgSend(v97, "addObject:", v46);

    }
  }
  if (CGRectGetWidth(v125[1]) == 0.0 || CGRectGetHeight(v125[1]) == 0.0)
  {
    v47 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241538);
    v48 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_ERROR))
      sub_100E07538((uint8_t *)&v134, v47, (uint64_t)objc_msgSend(obj, "count"), (os_log_t)v48);

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241558);
    v49 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_ERROR))
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100E02830(v50, (uint8_t *)&buf, v47, (os_log_t)v49);
    }

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingShapeTracingHelper unscaledOutlinePathFromFreehandDrawingShapeLayouts:unscaledOutset:viewScale:]"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingShapeTracingHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v51, v52, 139, 0, "Unable to trace freehand drawing shape layouts (count: %zu).", objc_msgSend(obj, "count"));

    if (CGRectIsNull(v125[1]))
    {
      v53 = &CGRectZero;
      p_height = &CGRectZero.size.height;
      p_size = &CGRectZero.size;
      p_y = &CGRectZero.origin.y;
    }
    else
    {
      v53 = v125 + 1;
      p_y = &v125[1].origin.y;
      p_size = &v125[1].size;
      p_height = &v125[1].size.height;
    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", v53->origin.x, *p_y, p_size->width, *p_height));
  }
  else
  {
    width = v125[1].size.width;
    height = v125[1].size.height;
    v138.origin.x = v125[1].origin.x;
    v138.origin.y = v125[1].origin.y;
    v138.size.width = width;
    v138.size.height = height;
    v61 = CGRectGetWidth(v138);
    v62 = sub_100062E58(width, height, 4194304.0);
    v63 = sub_100063090(v62);
    v65 = v64;
    memset(&v134, 0, sizeof(v134));
    CGAffineTransformMakeScale(&v134, v63 / v61, v63 / v61);
    v66 = -v125[1].origin.x;
    v67 = -v125[1].origin.y;
    v112 = v134;
    CGAffineTransformTranslate(&buf, &v112, v66, v67);
    v134 = buf;
    v68 = sub_10040FA64(10, v63, v65);
    sub_100411254((uint64_t)v68, 1);
    buf = v134;
    CGContextConcatCTM(v68, &buf);
    if (objc_msgSend(v97, "count"))
      +[CRLPencilKitInkStroke drawStrokes:inContext:overTransparentCanvas:](CRLPencilKitInkStroke, "drawStrokes:inContext:overTransparentCanvas:", v97, v68, 1);
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "allValues"));
    v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v108, v131, 16);
    if (v70)
    {
      v71 = *(_QWORD *)v109;
      v101 = v69;
      do
      {
        for (k = 0; k != v70; k = (char *)k + 1)
        {
          if (*(_QWORD *)v109 != v71)
            objc_enumerationMutation(v101);
          v73 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)k);
          v74 = [CRLBrushStroke alloc];
          v75 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
          objc_msgSend(v73, "lineWidth");
          v77 = v76;
          v78 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern solidPattern](CRLStrokePattern, "solidPattern"));
          v79 = -[CRLBrushStroke initWithName:color:width:cap:join:pattern:miterLimit:](v74, "initWithName:color:width:cap:join:pattern:miterLimit:", CFSTR("Basic Rounded"), v75, 1, 1, v78, v77, 0.0);

          -[CRLBrushStroke paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:](v79, "paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:", objc_msgSend(objc_retainAutorelease(v73), "CGPath"), 0, v68, 0, 0, 0);
        }
        v69 = v101;
        v70 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v108, v131, 16);
      }
      while (v70);
    }

    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v102 = v92;
    v80 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v104, v130, 16);
    if (v80)
    {
      v81 = *(_QWORD *)v105;
      do
      {
        for (m = 0; m != v80; m = (char *)m + 1)
        {
          if (*(_QWORD *)v105 != v81)
            objc_enumerationMutation(v102);
          v83 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)m);
          v84 = [CRLStroke alloc];
          v85 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
          objc_msgSend(v83, "lineWidth");
          v87 = v86;
          v88 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern solidPattern](CRLStrokePattern, "solidPattern"));
          v89 = -[CRLStroke initWithColor:width:cap:join:pattern:](v84, "initWithColor:width:cap:join:pattern:", v85, 1, 1, v88, v87);

          -[CRLStroke paintPath:inContext:](v89, "paintPath:inContext:", objc_msgSend(objc_retainAutorelease(v83), "CGPath"), v68);
        }
        v80 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v104, v130, 16);
      }
      while (v80);
    }

    Image = CGBitmapContextCreateImage(v68);
    CGContextRelease(v68);
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath tracedPathForImage:alphaThreshold:pointSpacing:](CRLBezierPath, "tracedPathForImage:alphaThreshold:pointSpacing:", Image, 0.01, 3.0));
    CGImageRelease(Image);
    buf = v134;
    CGAffineTransformInvert(&v103, &buf);
    objc_msgSend(v91, "transformUsingAffineTransform:", &v103);
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath exteriorOfBezierPath:](CRLBezierPath, "exteriorOfBezierPath:", v91));

  }
  _Block_object_dispose(v114, 8);

  _Block_object_dispose(&v124, 8);
  return v57;
}

@end
