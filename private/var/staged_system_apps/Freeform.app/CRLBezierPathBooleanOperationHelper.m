@implementation CRLBezierPathBooleanOperationHelper

+ (id)pathByNormalizingPath:(id)a3
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _OWORD v11[3];
  uint64_t v12[3];
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "containsElementsOtherThanMoveAndClose") & 1) != 0)
    {
      v14 = 0u;
      v15 = 0u;
      v13 = 0u;
      objc_msgSend(v4, "controlPointBounds");
      sub_10031FD8C((uint64_t)&v13, v5);
      memset(v12, 0, sizeof(v12));
      v11[0] = v13;
      v11[1] = v14;
      v11[2] = v15;
      sub_10031FEFC(v12, v4, v11, 1, 0);
      sub_100320BC0();
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251C70);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E20CAC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251C90);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper pathByNormalizingPath:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 817, 0, "invalid nil value for '%{public}s'", "inputPath");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  objc_msgSend(v4, "copyPathAttributesTo:", v9);

  return v9;
}

+ (id)pathByPerformingBooleanOperation:(unint64_t)a3 onPaths:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pathByPerformingBooleanOperation:onPaths:outMapToInputPaths:", a3, a4, 0));
}

+ (id)pathByPerformingBooleanOperation:(unint64_t)a3 onPaths:(id)a4 outMapToInputPaths:(id *)a5
{
  id v8;
  void *v9;
  CRLBezierPathBooleanOperationInputPathMap *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t j;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _OWORD v48[3];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v8 = a4;
  v9 = v8;
  if (a5)
  {
    v10 = objc_retainAutorelease(objc_alloc_init(CRLBezierPathBooleanOperationInputPathMap));
    *a5 = v10;
    if (v9)
      goto LABEL_3;
LABEL_9:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251CB0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E20D38();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251CD0);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper pathByPerformingBooleanOperation:onPaths:outMapToInputPaths:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 868, 0, "invalid nil value for '%{public}s'", "inputPaths");

    goto LABEL_18;
  }
  v10 = 0;
  if (!v8)
    goto LABEL_9;
LABEL_3:
  if (!objc_msgSend(v9, "count"))
  {
LABEL_18:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    goto LABEL_67;
  }
  if (a3 >= 4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251CF0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E20E44();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251D10);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper pathByPerformingBooleanOperation:onPaths:outMapToInputPaths:]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 883, 0, "Unsupported BOOLean operation type: %zu", a3);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v19, "copyPathAttributesTo:", v11);

  }
  else if (a3 == 3 && (unint64_t)objc_msgSend(v9, "count") >= 3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v12, "copyPathAttributesTo:", v11);

  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v24 = v9;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v50 != v26)
            objc_enumerationMutation(v24);
          v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v28, "isEmpty") & 1) == 0)
          {
            objc_msgSend(v28, "controlPointBounds");
            v60.origin.x = v29;
            v60.origin.y = v30;
            v60.size.width = v31;
            v60.size.height = v32;
            v57.origin.x = x;
            v57.origin.y = y;
            v57.size.width = width;
            v57.size.height = height;
            v58 = CGRectUnion(v57, v60);
            x = v58.origin.x;
            y = v58.origin.y;
            width = v58.size.width;
            height = v58.size.height;
          }
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v25);
    }

    if (objc_msgSend(v24, "count") != (id)1)
    {
      v59.origin.x = x;
      v59.origin.y = y;
      v59.size.width = width;
      v59.size.height = height;
      if (!CGRectIsNull(v59))
        goto LABEL_44;
    }
    if (a3 - 2 < 2 || !a3)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", 0));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pathByNormalizingPath:", v34));

      goto LABEL_67;
    }
    if (a3 == 1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v33, "copyPathAttributesTo:", v11);

    }
    else
    {
LABEL_44:
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      for (j = 0; j < (unint64_t)objc_msgSend(v24, "count"); ++j)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", j));
        if (a3 == 1 || j <= 1)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          objc_msgSend(v35, "addObject:", v38);

        }
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "lastObject"));
        objc_msgSend(v39, "addObject:", v37);

      }
      if (a3 - 1 > 2)
        v40 = 2;
      else
        v40 = dword_100EEF5A8[a3 - 1];
      v54 = 0u;
      v55 = 0u;
      v53 = 0u;
      v41 = sub_10031FD8C((uint64_t)&v53, x);
      if (v10 && (unint64_t)objc_msgSend(v35, "count", v41) >= 3)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101251D30);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E20DC4();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101251D50);
        v42 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper pathByPerformingBooleanOperation:onPaths:outMapToInputPaths:]"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v43, v44, 952, 0, "Unable to generate an accurate input path map when performing multiple BOOLean operations. Skipping populating it.");

        v10 = 0;
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndexedSubscript:", 0, v41));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectAtIndexedSubscript:", 0));

      if ((unint64_t)objc_msgSend(v35, "count") > 1)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndexedSubscript:", 1));
        v48[0] = v53;
        v48[1] = v54;
        v48[2] = v55;
        sub_100322008(v11, 1, v46, v40, v48, v10);
      }

    }
  }
LABEL_67:

  return v11;
}

+ (id)linePathWithLinePath:(id)a3 subtractingFilledPath:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "linePathWithLinePath:subtractingFilledPath:outMapToInputPaths:", a3, a4, 0));
}

+ (id)linePathWithLinePath:(id)a3 subtractingFilledPath:(id)a4 outMapToInputPaths:(id *)a5
{
  id v7;
  id v8;
  CRLBezierPathBooleanOperationInputPathMap *v9;
  id v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (a5)
  {
    v9 = objc_retainAutorelease(objc_alloc_init(CRLBezierPathBooleanOperationInputPathMap));
    *a5 = v9;
  }
  else
  {
    v9 = 0;
  }
  v10 = sub_100323158(3, v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

+ (id)linePathWithLinePath:(id)a3 intersectedWithFilledPath:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "linePathWithLinePath:intersectedWithFilledPath:outMapToInputPaths:", a3, a4, 0));
}

+ (id)linePathWithLinePath:(id)a3 intersectedWithFilledPath:(id)a4 outMapToInputPaths:(id *)a5
{
  id v7;
  id v8;
  CRLBezierPathBooleanOperationInputPathMap *v9;
  id v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (a5)
  {
    v9 = objc_retainAutorelease(objc_alloc_init(CRLBezierPathBooleanOperationInputPathMap));
    *a5 = v9;
  }
  else
  {
    v9 = 0;
  }
  v10 = sub_100323158(1, v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

+ (BOOL)hasAnyCrossingBetweenPath:(id)a3 andPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  id v25;
  void *v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t **v42;
  __n128 *v43;
  uint64_t v44;
  uint64_t *v45;
  __n128 *v46;
  uint64_t v47;
  _QWORD block[6];
  _QWORD v49[3];
  _QWORD v50[6];
  int v51;
  void **v52;
  void ***v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  uint64_t (*v56)(uint64_t);
  _BYTE v57[32];
  uint64_t v58;
  int v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _OWORD v63[3];
  _OWORD v64[4];
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68[3];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  unint64_t *v76;
  _BYTE v77[128];
  _QWORD v78[2];
  int v79;
  uint64_t v80;
  __int16 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[32];
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  _BYTE v98[136];
  _QWORD v99[2];
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v6;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
      v99[0] = v7;
      v99[1] = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v99, 2));
      x = CGRectNull.origin.x;
      y = CGRectNull.origin.y;
      width = CGRectNull.size.width;
      height = CGRectNull.size.height;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v15 = v10;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v72, v98, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v73 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
            if ((objc_msgSend(v19, "isEmpty") & 1) == 0)
            {
              objc_msgSend(v19, "controlPointBounds");
              v104.origin.x = v20;
              v104.origin.y = v21;
              v104.size.width = v22;
              v104.size.height = v23;
              v100.origin.x = x;
              v100.origin.y = y;
              v100.size.width = width;
              v100.size.height = height;
              v101 = CGRectUnion(v100, v104);
              x = v101.origin.x;
              y = v101.origin.y;
              width = v101.size.width;
              height = v101.size.height;
            }
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v72, v98, 16);
        }
        while (v16);
      }

      v102.origin.x = x;
      v102.origin.y = y;
      v102.size.width = width;
      v102.size.height = height;
      if (!CGRectIsNull(v102))
      {
        v103.origin.x = x;
        v103.origin.y = y;
        v103.size.width = width;
        v103.size.height = height;
        *(_QWORD *)&v24 = (unint64_t)CGRectInset(v103, -3.0, -3.0);
        v70 = 0u;
        v71 = 0u;
        v69 = 0u;
        sub_10031FD8C((uint64_t)&v69, v24);
        v78[1] = 0;
        v79 = 2;
        v80 = 0;
        v81 = 0;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        memset(v91, 0, 29);
        v91[29] = 1;
        v92 = 0;
        v93 = 0;
        v94 = 0;
        v95 = 0;
        v96 = 1;
        v97 = 0;
        v78[0] = &off_101251F68;
        memset(v68, 0, sizeof(v68));
        v65 = 0;
        v66 = 0;
        v67 = 0;
        memset(v64, 0, sizeof(v64));
        v25 = v15;
        if (objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", v64, v77, 16))
        {
          v26 = (void *)**((_QWORD **)&v64[0] + 1);
          v63[0] = v69;
          v63[1] = v70;
          v63[2] = v71;
          sub_10031FEFC(v68, v26, v63, 0, 0);
          v60 = v69;
          v61 = v70;
          v62 = v71;
          sub_100320BC0();
        }

        v52 = 0;
        v53 = &v52;
        v54 = 0x5812000000;
        v55 = sub_100329EF4;
        v56 = sub_100329F00;
        memset(v57, 0, sizeof(v57));
        v58 = 0;
        v59 = 1065353216;
        v50[0] = 0;
        v50[1] = v50;
        v50[2] = 0x3812000000;
        v50[3] = sub_100329F08;
        v50[4] = nullsub_40;
        v50[5] = &unk_1010E66AB;
        v51 = 0;
        __dmb(0xBu);
        v27 = 0xAAAAAAAAAAAAAAABLL * ((v66 - v65) >> 3);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3321888768;
        block[2] = sub_100329F18;
        block[3] = &unk_1012521B8;
        memset(v49, 0, sizeof(v49));
        sub_10032AFD4(v49, v65, v66, v27);
        block[4] = v50;
        block[5] = &v52;
        dispatch_apply(v27, 0, block);
        v45 = 0;
        v46 = 0;
        v47 = 0;
        v42 = 0;
        v43 = 0;
        v44 = 0;
        v39 = 0;
        if (v66 != v65)
        {
          do
          {
            v76 = &v39;
            v28 = sub_10032A998((uint64_t)(v53 + 6), &v39, (uint64_t)&unk_100EEC1A0, (uint64_t **)&v76);
            v29 = v28[3];
            v30 = v28[4];
            v31 = 0xAAAAAAAAAAAAAAABLL * ((v30 - v29) >> 3);
            if (v39)
              sub_10032A2C0((uint64_t *)&v42, v43, v29, v30, v31);
            else
              sub_10032A2C0((uint64_t *)&v45, v46, v29, v30, v31);
            ++v39;
          }
          while (v39 < 0xAAAAAAAAAAAAAAABLL * ((v66 - v65) >> 3));
        }
        sub_1003D0194((uint64_t)v78, &v45, 0, 0);
        sub_1003D0194((uint64_t)v78, (uint64_t **)&v42, 1, 0);
        v39 = 0;
        v40 = 0;
        v41 = 0;
        sub_100320F24((uint64_t)v78, 1, 1, (uint64_t *)&v39);
        v32 = v40 != v39;
        v76 = &v39;
        sub_100121A78((void ***)&v76);
        v39 = (unint64_t)&v42;
        sub_100121A78((void ***)&v39);
        v42 = &v45;
        sub_100121A78((void ***)&v42);
        v45 = v49;
        sub_100121A78((void ***)&v45);
        _Block_object_dispose(v50, 8);
        _Block_object_dispose(&v52, 8);
        sub_10032A914((uint64_t)&v57[8]);
        v52 = (void **)&v65;
        sub_100121A78(&v52);
        v52 = (void **)v68;
        sub_100327514(&v52);
        sub_1003CFDF0((uint64_t)v78);
        v15 = v25;
        goto LABEL_37;
      }
LABEL_36:
      v32 = 0;
LABEL_37:

      goto LABEL_38;
    }
LABEL_29:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101252130);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E210F4();
    v36 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "BOOL _hasAnyIntersectionBetweenPaths(CRLBezierPath *const  _Nonnull __strong, CRLBezierPath *const  _Nonnull __strong)"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v37, 1431, 0, "invalid nil value for '%{public}s'", "inputPath2");

    goto LABEL_36;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012520F0);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E211B8();
  v33 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
  {
    objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    sub_100DE7E60();
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "BOOL _hasAnyIntersectionBetweenPaths(CRLBezierPath *const  _Nonnull __strong, CRLBezierPath *const  _Nonnull __strong)"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v34, v35, 1430, 0, "invalid nil value for '%{public}s'", "inputPath1");

  if (!v9)
    goto LABEL_29;
  v32 = 0;
LABEL_38:

  return v32;
}

+ (BOOL)hasAtLeastTwoVisuallyDistinctSubregionsInPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = sub_100324524(v3, 2uLL);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if ((unint64_t)objc_msgSend(v6, "count") >= 3)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101251DB0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E21308();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101251DD0);
      v7 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper hasAtLeastTwoVisuallyDistinctSubregionsInPath:]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 1018, 0, "We asked to stop after finding 2 paths.");

    }
    v10 = (unint64_t)objc_msgSend(v6, "count") > 1;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251D70);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2127C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251D90);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper hasAtLeastTwoVisuallyDistinctSubregionsInPath:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v12, 1011, 0, "invalid nil value for '%{public}s'", "inputPath");

    v10 = 0;
  }

  return v10;
}

+ (id)pathsBySeparatingVisuallyDistinctSubregionsOfPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = sub_100324524(v3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251DF0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E21408();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251E10);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper pathsBySeparatingVisuallyDistinctSubregionsOfPath:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 1024, 0, "invalid nil value for '%{public}s'", "inputPath");

    v6 = &__NSArray0__struct;
  }

  return v6;
}

+ (id)pathByFloodFillingPaths:(id)a3 atFillPoint:(CGPoint)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat width;
  CGFloat height;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  void *v26;
  _QWORD *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double y;
  double x;
  void *v34;
  _OWORD v35[3];
  uint64_t v36[3];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[3];
  _QWORD *v45;
  uint64_t (**v46)(uint64_t);
  uint64_t v47;
  int v48;
  uint64_t v49;
  __int16 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[32];
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[4];
  __int16 v65;
  uint64_t v66;
  _BYTE v67[128];
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  y = a4.y;
  x = a4.x;
  v4 = a3;
  v34 = v4;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251E30);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E21490();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251E50);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper pathByFloodFillingPaths:atFillPoint:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1035, 0, "invalid nil value for '%{public}s'", "inputPaths");
    goto LABEL_22;
  }
  if (!objc_msgSend(v4, "count"))
  {
    v9 = 0;
    goto LABEL_26;
  }
  if (sub_100061890(x, y))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251E70);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2151C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251E90);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper pathByFloodFillingPaths:atFillPoint:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1044, 0, "Unable to fill path at null point.");
LABEL_22:

    goto LABEL_23;
  }
  v11 = v34;
  v12 = CGRectNull.origin.x;
  v13 = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v67, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v20, "isEmpty") & 1) == 0)
        {
          objc_msgSend(v20, "controlPointBounds");
          v72.origin.x = v21;
          v72.origin.y = v22;
          v72.size.width = v23;
          v72.size.height = v24;
          v68.origin.x = v12;
          v68.origin.y = v13;
          v68.size.width = width;
          v68.size.height = height;
          v69 = CGRectUnion(v68, v72);
          v12 = v69.origin.x;
          v13 = v69.origin.y;
          width = v69.size.width;
          height = v69.size.height;
        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v67, 16);
    }
    while (v17);
  }

  v70.origin.x = v12;
  v70.origin.y = v13;
  v70.size.width = width;
  v70.size.height = height;
  if (!CGRectIsNull(v70))
  {
    v71.origin.x = v12;
    v71.origin.y = v13;
    v71.size.width = width;
    v71.size.height = height;
    *(_QWORD *)&v25 = (unint64_t)CGRectInset(v71, -3.0, -3.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:"));
    v38 = 0u;
    v39 = 0u;
    v37 = 0u;
    sub_10031FD8C((uint64_t)&v37, v25);
    v47 = 0;
    v48 = 2;
    v49 = 0;
    v50 = 0;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    memset(v60, 0, 29);
    v60[29] = 1;
    v61 = 0;
    v62 = 0;
    v63 = 0;
    v64[3] = 0;
    v66 = 0;
    v46 = &off_101251F68;
    v65 = 1;
    v44[0] = off_1012523C8;
    v44[1] = sub_100320D88;
    v45 = v44;
    sub_100326E78(v64, (uint64_t)v44);
    v27 = v45;
    if (v45 == v44)
    {
      v28 = 4;
      v27 = v44;
    }
    else
    {
      if (!v45)
        goto LABEL_43;
      v28 = 5;
    }
    (*(void (**)(void))(*v27 + 8 * v28))();
LABEL_43:
    memset(v36, 0, sizeof(v36));
    v35[0] = v37;
    v35[1] = v38;
    v35[2] = v39;
    sub_10031FEFC(v36, v26, v35, 1, 0);
    sub_100320BC0();
  }
  v6 = &__NSArray0__struct;

  if ((unint64_t)objc_msgSend(&__NSArray0__struct, "count") >= 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251EB0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2159C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251ED0);
    v29 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBezierPathBooleanOperationHelper pathByFloodFillingPaths:atFillPoint:]"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBezierPathBooleanOperationHelper.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 1049, 0, "Should never get more than one path back with a non-null fill point.");

  }
  if (objc_msgSend(&__NSArray0__struct, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&__NSArray0__struct, "objectAtIndexedSubscript:", 0));
    goto LABEL_24;
  }
LABEL_23:
  v9 = 0;
LABEL_24:

LABEL_26:
  return v9;
}

@end
