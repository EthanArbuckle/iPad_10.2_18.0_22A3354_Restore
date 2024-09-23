@implementation CRLPKStrokePathConverter

+ (id)strokePathDataFromPKStroke:(id)a3 startingAtIndex:(unint64_t)a4 endingAtIndex:(unint64_t)a5
{
  id v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  CRLPKStrokePathCompactData *v17;
  id v18;
  void *v19;
  CRLPKStrokePathCompactData *v20;
  void *v21;
  CRLPKStrokePathCompactData *v22;
  uint64_t i;
  uint64_t j;
  void *v25;
  unint64_t v26;
  double v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  unsigned int v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  float v43;
  NSObject *v44;
  char *v45;
  NSObject *v46;
  char *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v54;
  void *v55;
  _OWORD v56[3];
  uint8_t buf[4];
  unsigned int v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;

  v7 = a3;
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
  v8 = (char *)objc_msgSend(v55, "count");
  if ((unint64_t)v8 < a4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238010);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFA9D0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238030);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokePathConverter strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 335, 0, "Out-of-bounds startingAtIndex parameter.");

  }
  if ((unint64_t)v8 < a5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238050);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFA950();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238070);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokePathConverter strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 336, 0, "Out-of-bounds endAtIndex parameter.");

  }
  if ((unint64_t)(v8 - 1) >= a4)
    v15 = a4;
  else
    v15 = (unint64_t)(v8 - 1);
  if ((unint64_t)(v8 - 1) >= a5)
    v16 = a5;
  else
    v16 = (unint64_t)(v8 - 1);
  v17 = [CRLPKStrokePathCompactData alloc];
  v18 = objc_msgSend(v7, "randomSeed");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "creationDate"));
  v20 = v17;
  v21 = v55;
  v22 = -[CRLPKStrokePathCompactData initWithCapacity:randomSeed:creationDate:](v20, "initWithCapacity:randomSeed:creationDate:", v16 - v15 + 1, v18, v19);

  v54 = v7;
  -[CRLPKStrokePathCompactData setShouldSolveMath:](v22, "setShouldSolveMath:", ((unint64_t)objc_msgSend(v7, "_flags") >> 41) & 1);
  for (i = 0; i != 9; ++i)
  {
    if (v16 >= v15)
    {
      for (j = 0; v15 + j <= v16; ++j)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pointAtIndex:", v15 + j));
        switch((int)i)
        {
          case 0:
            v26 = -[CRLPKStrokePathCompactData altitudeData](v22, "altitudeData");
            objc_msgSend(v25, "altitude");
            goto LABEL_44;
          case 1:
            v26 = -[CRLPKStrokePathCompactData azimuthData](v22, "azimuthData");
            objc_msgSend(v25, "azimuth");
            sub_100062084(v30);
            goto LABEL_44;
          case 2:
            v26 = -[CRLPKStrokePathCompactData opacityData](v22, "opacityData");
            objc_msgSend(v25, "opacity");
            goto LABEL_44;
          case 3:
            v26 = -[CRLPKStrokePathCompactData forceData](v22, "forceData");
            objc_msgSend(v25, "force");
            goto LABEL_44;
          case 4:
            v28 = -[CRLPKStrokePathCompactData sizeXData](v22, "sizeXData");
            objc_msgSend(v25, "size");
            goto LABEL_41;
          case 5:
            v28 = -[CRLPKStrokePathCompactData sizeYData](v22, "sizeYData");
            objc_msgSend(v25, "size");
            v32 = v31;
            goto LABEL_42;
          case 6:
            v28 = -[CRLPKStrokePathCompactData timeOffsetData](v22, "timeOffsetData");
            objc_msgSend(v25, "timeOffset");
            goto LABEL_41;
          case 7:
            v28 = -[CRLPKStrokePathCompactData radius2Data](v22, "radius2Data");
            objc_msgSend(v25, "_radius2");
LABEL_41:
            v32 = v29;
LABEL_42:
            v26 = 0;
            break;
          case 8:
            v26 = -[CRLPKStrokePathCompactData edgeWidthData](v22, "edgeWidthData");
            objc_msgSend(v25, "_edgeWidth");
LABEL_44:
            v32 = v27;
            v28 = 0;
            break;
          default:
            v26 = 0;
            v28 = 0;
            v32 = 0.0;
            break;
        }
        if (!(v26 | (unint64_t)v28))
        {
          v38 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101238090);
          v39 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v58 = v38;
            v59 = 2082;
            v60 = "+[CRLPKStrokePathConverter strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:]";
            v61 = 2082;
            v62 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m";
            v63 = 1024;
            v64 = 408;
            _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Expected a uint16 value or a float value.", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012380B0);
          v40 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v44 = v40;
            v45 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v58 = v38;
            v59 = 2114;
            v60 = v45;
            _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokePathConverter strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:]"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v41, v42, 408, 0, "Expected a uint16 value or a float value.");

          goto LABEL_68;
        }
        if (v26 && v28)
        {
          v33 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012380D0);
          v34 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v58 = v33;
            v59 = 2082;
            v60 = "+[CRLPKStrokePathConverter strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:]";
            v61 = 2082;
            v62 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m";
            v63 = 1024;
            v64 = 409;
            _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Expected a uint16 value or a float value but not both.", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012380F0);
          v35 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v46 = v35;
            v47 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v58 = v33;
            v59 = 2114;
            v60 = v47;
            _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokePathConverter strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:]"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v36, v37, 409, 0, "Expected a uint16 value or a float value but not both.");

          v21 = v55;
        }
        else if (!v26)
        {
          if (v28)
          {
            v43 = v32 * dbl_100EEC888[i];
            *((float *)v28 + j) = v43;
          }
          goto LABEL_68;
        }
        *(_WORD *)(v26 + 2 * j) = (int)(v32 * dbl_100EEC888[i]);
LABEL_68:

      }
    }
  }
  -[CRLPKStrokePathCompactData setPointCount:](v22, "setPointCount:", v16 - v15 + 1);
  if (v54)
    objc_msgSend(v54, "transform");
  else
    memset(v56, 0, sizeof(v56));
  v48 = sub_100079240((double *)v56);
  v50 = v49;
  *(float *)&v48 = v48;
  -[CRLPKStrokePathCompactData setRenderScaleX:](v22, "setRenderScaleX:", v48);
  *(float *)&v51 = v50;
  -[CRLPKStrokePathCompactData setRenderScaleY:](v22, "setRenderScaleY:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "_renderGroupID"));
  -[CRLPKStrokePathCompactData setRenderGroupID:](v22, "setRenderGroupID:", v52);

  objc_msgSend(v54, "crl_anchorPointForTexture");
  -[CRLPKStrokePathCompactData setAnchorPointForTexture:](v22, "setAnchorPointForTexture:");

  return v22;
}

+ (id)strokePathsFromBezierPath:(id)a3 baseWidth:(double)a4 strokePathCompactData:(id)a5 inkType:(id)a6 isFountainPenInkV2:(BOOL)a7
{
  id v11;
  id v12;
  NSString *v13;
  void *v14;
  PKInkType v15;
  NSString *v16;
  double *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double *v28;
  double v29;
  double v30;
  NSString *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  double *v42;
  NSString *v43;
  double v44;
  double v45;
  __int128 v46;
  double *v47;
  __int128 v48;
  double *v49;

  v11 = a3;
  v12 = a5;
  v13 = (NSString *)a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (v13)
    v15 = v13;
  else
    v15 = PKInkTypeMonoline;
  v16 = v15;
  v48 = 0uLL;
  v49 = 0;
  sub_1000FF280(v11, &v48);
  v17 = v49;
  if (v49)
  {
    if (v12)
    {
      if (a7)
        v18 = 0;
      else
        v18 = -[NSString isEqualToString:](v13, "isEqualToString:", PKInkTypeFountainPen);
      v46 = v48;
      v47 = v49;
      v36 = sub_1000FF008(v12, (uint64_t)&v46, v18);
      v20 = (id)objc_claimAutoreleasedReturnValue(v36);
    }
    else
    {
      v42 = v49;
      v43 = v13;
      v41 = v11;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v23 = *((_QWORD *)&v48 + 1);
      if (*((_QWORD *)&v48 + 1))
      {
        v24 = fmax(a4 * 0.5, 1.0);
        v44 = fmax(a4 * 0.5 + 2.0, 1.0);
        v25 = dbl_100EEC8D0[v24 < 2.0];
        v26 = dbl_100EEC8E0[v24 < 2.0];
        v45 = (a4 + 1.0) * 0.85;
        v27 = qword_100EEC8F0[v24 < 2.0];
        if (v24 < 2.0)
          a4 = 0.0;
        v28 = v42 + 1;
        do
        {
          v30 = *(v28 - 1);
          v29 = *v28;
          v31 = v16;
          if (-[NSString isEqualToString:](v31, "isEqualToString:", PKInkTypePencil))
          {
            v32 = objc_msgSend(objc_alloc((Class)PKStrokePoint), "initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:edgeWidth:radius2:", v30, v29, 0.0, v24, v24, v25, 0.0, v26, v27, *(_QWORD *)&a4, 0);
          }
          else if (-[NSString isEqualToString:](v31, "isEqualToString:", PKInkTypeWatercolor))
          {
            v32 = objc_msgSend(objc_alloc((Class)PKStrokePoint), "initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:edgeWidth:radius2:", v30, v29, 0.0, v24, v24, 0.18, 1.0, 3.14159265, 0x3FF921FB54442D18, 0, *(_QWORD *)&v45);
          }
          else if (-[NSString isEqualToString:](v31, "isEqualToString:", PKInkTypePen)
                 || -[NSString isEqualToString:](v31, "isEqualToString:", PKInkTypeMonoline))
          {
            v32 = objc_msgSend(objc_alloc((Class)PKStrokePoint), "initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:", v30, v29, 0.0, v44, v44, 1.0, 1.0, 3.14159265, 0x3FF921FB54442D18);
          }
          else
          {
            v32 = objc_msgSend(objc_alloc((Class)PKStrokePoint), "initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:", v30, v29, 0.0, v24, v24, 1.0, 1.0, 3.14159265, 0x3FF921FB54442D18);
          }
          v33 = v32;

          objc_msgSend(v22, "addObject:", v33);
          v28 += 2;
          --v23;
        }
        while (v23);
      }
      v34 = objc_alloc((Class)PKStrokePath);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v20 = objc_msgSend(v34, "initWithControlPoints:creationDate:", v22, v35);

      v12 = 0;
      v11 = v41;
      v17 = v42;
      v13 = v43;
    }
    free(v17);
    if (v20)
    {
      objc_msgSend(v14, "addObject:", v20);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101238210);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DFAAD0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101238230);
      v37 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokePathConverter strokePathsFromBezierPath:baseWidth:strokePathCompactData:inkType:isFountainPenInkV2:]"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v38, v39, 647, 0, "invalid nil value for '%{public}s'", "newStrokePath");

    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012381D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFAA50();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012381F0);
    v19 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v19);
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokePathConverter strokePathsFromBezierPath:baseWidth:strokePathCompactData:inkType:isFountainPenInkV2:]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 624, 0, "Unexpectedly failed to generate B-Spline control points.");

  }
  return v14;
}

+ (id)pathFromPKStrokePath:(id)a3 pencilKitStrokePathData:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  __int128 v10;
  id v11;
  void *v12;
  _OWORD v14[3];

  v5 = a3;
  v6 = objc_alloc((Class)PKInk);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v8 = objc_msgSend(v6, "initWithInkType:color:", PKInkTypePen, v7);

  v9 = objc_alloc((Class)PKStroke);
  v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v14[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v14[1] = v10;
  v14[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v11 = objc_msgSend(v9, "initWithInk:strokePath:transform:mask:", v8, v5, v14, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPKStrokeConverter pathFromPKStroke:pencilKitStrokePathData:](CRLPKStrokeConverter, "pathFromPKStroke:pencilKitStrokePathData:", v11, a4));
  return v12;
}

+ (unint64_t)countOfBSplineControlPointsForBezierPath:(id)a3
{
  unint64_t v3;
  uint64_t v5;
  unint64_t v6;
  void *v7;

  if (!a3)
    return 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  sub_1000FF280(a3, &v5);
  v3 = v6;
  if (v7)
    free(v7);
  return v3;
}

@end
