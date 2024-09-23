@implementation CRLConnectionLineAdjustmentHelper

+ (id)infosForAdjustingConnectionLinesAfterRemove:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  char *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  unsigned int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  const char *v52;
  _BYTE v53[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v39;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v9);
        *(_QWORD *)&v11 = objc_opt_class(_TtC8Freeform16CRLContainerItem, v6).n128_u64[0];
        v13 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parentInfo", v11));
        v15 = sub_100221D0C(v13, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

        if (v16)
        {
          objc_msgSend(v4, "addObject:", v16);
        }
        else
        {
          v17 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101248538);
          v18 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v44 = v17;
            v45 = 2082;
            v46 = "+[CRLConnectionLineAdjustmentHelper infosForAdjustingConnectionLinesAfterRemove:]";
            v47 = 2082;
            v48 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLConnectionLineAdjustmentHelper.m";
            v49 = 1024;
            v50 = 24;
            v51 = 2082;
            v52 = "currentParent";
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101248558);
          v19 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v22 = v19;
            v23 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v44 = v17;
            v45 = 2114;
            v46 = v23;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLConnectionLineAdjustmentHelper infosForAdjustingConnectionLinesAfterRemove:]"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLConnectionLineAdjustmentHelper.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 24, 0, "invalid nil value for '%{public}s'", "currentParent");

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
    }
    while (v7);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v25 = v4;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), "childInfos"));
        objc_msgSend(v24, "addObjectsFromArray:", v30);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v27);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "crl_setBySubtractingSet:", obj));
  return v31;
}

+ (id)commandsForAdjustingConnectionLines:(id)a3 infosToRemove:(id)a4 editingCoordinator:(id)a5 withIcc:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  unsigned int v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  unsigned int v42;
  void *v43;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v44;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v45;
  id v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  double v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  void *v63;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v64;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v65;
  void *v67;
  id v68;
  uint64_t v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id v84;
  id v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];

  v9 = a3;
  v71 = a4;
  v10 = a5;
  v68 = a6;
  v78 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v67 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mainBoard"));
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
  v15 = (char *)&unk_1013BF000;
  v70 = v12;
  v76 = v11;
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v88;
    v69 = *(_QWORD *)v88;
    do
    {
      v18 = 0;
      v72 = v16;
      do
      {
        if (*(_QWORD *)v88 != v17)
          objc_enumerationMutation(v12);
        v19 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)v18);
        *(_QWORD *)&v20 = objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v14).n128_u64[0];
        if (objc_msgSend(v19, "isMemberOfClass:", v21, v20))
        {
          v22 = v19;
          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "getConnectedFromWithBoardItemOwner:", v11));
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "getConnectedToWithBoardItemOwner:", v11));
          if (v23 | v24)
          {
            v86 = 0;
            v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_commandsForUpdateConnectionLineInfoGeometry:withBoardItemOwner:withNewPathSource:", v22, v11, &v86));
            v26 = v86;
            objc_msgSend(v78, "addObjectsFromArray:", v25);
            objc_opt_class(CRLConnectionLinePathSource, v27);
            v73 = v26;
            v29 = sub_100221D0C(v28, v26);
            v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
            v31 = (id)v24;
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "connectionLinePathSource"));
            v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "headMagnet"));
            if (!v33)
              goto LABEL_11;
            v34 = (void *)v33;
            v35 = objc_msgSend(v71, "containsObject:", v31);

            if (v35)
            {

              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "layoutForInfo:", v31));
              v85 = 0;
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_getUpdatedMagnetForClineItem:forHeadMagnet:withOriginalLayout:withIcc:newConnectedInfo:", v22, 1, v32, v68, &v85));
              v31 = v85;
              objc_msgSend(v30, "setHeadMagnet:", v36);

LABEL_11:
            }
            v37 = (id)v23;
            v74 = (void *)v25;
            if (v23)
            {
              v38 = v37;
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "connectionLinePathSource"));
              v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "tailMagnet"));
              if (!v40)
                goto LABEL_16;
              v41 = (void *)v40;
              v42 = objc_msgSend(v71, "containsObject:", v38);

              if (v42)
              {

                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "layoutForInfo:", v38));
                v84 = 0;
                v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_getUpdatedMagnetForClineItem:forHeadMagnet:withOriginalLayout:withIcc:newConnectedInfo:", v22, 0, v39, v68, &v84));
                v38 = v84;
                objc_msgSend(v30, "setTailMagnet:", v43);

LABEL_16:
              }
            }
            else
            {
              v38 = 0;
            }
            v44 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v22, v31, 1, v30);
            objc_msgSend(v78, "addObject:", v44);
            v45 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v22, v38, 0, v30);
            objc_msgSend(v78, "addObject:", v45);

            v17 = v69;
            v12 = v70;
            v11 = v76;
            v15 = (char *)&unk_1013BF000;
            v16 = v72;
          }

        }
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
    }
    while (v16);
  }

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v46 = v71;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
  if (v47)
  {
    v49 = v47;
    v50 = *(_QWORD *)v81;
    v75 = v46;
    do
    {
      v51 = 0;
      do
      {
        if (*(_QWORD *)v81 != v50)
          objc_enumerationMutation(v46);
        v52 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)v51);
        *(_QWORD *)&v53 = objc_opt_class(v15 + 3232, v48).n128_u64[0];
        if (objc_msgSend(v52, "isMemberOfClass:", v54, v53))
        {
          v55 = v52;
          v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "getConnectedFromWithBoardItemOwner:", v11));
          v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "getConnectedToWithBoardItemOwner:", v11));
          if (v56 | v57)
          {
            v79 = 0;
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_commandsForUpdateConnectionLineInfoGeometry:withBoardItemOwner:withNewPathSource:", v55, v11, &v79));
            v59 = v79;
            objc_msgSend(v78, "addObjectsFromArray:", v58);
            objc_opt_class(CRLConnectionLinePathSource, v60);
            v62 = sub_100221D0C(v61, v59);
            v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
            if (!v56 || (objc_msgSend(v46, "containsObject:", v56) & 1) == 0)
            {
              objc_msgSend(v63, "setTailMagnet:", 0);
              v64 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v55, 0, 0, v63);
              objc_msgSend(v78, "addObject:", v64);

              v46 = v75;
            }
            if (!v57 || (objc_msgSend(v46, "containsObject:", v57) & 1) == 0)
            {
              objc_msgSend(v63, "setHeadMagnet:", 0);
              v65 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v55, 0, 1, v63);
              objc_msgSend(v78, "addObject:", v65);

              v46 = v75;
            }

            v11 = v76;
          }

          v15 = (_BYTE *)&unk_1013BF000;
        }
        v51 = (char *)v51 + 1;
      }
      while (v49 != v51);
      v49 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
    }
    while (v49);
  }

  return v78;
}

+ (id)p_getUpdatedMagnetForClineItem:(id)a3 forHeadMagnet:(BOOL)a4 withOriginalLayout:(id)a5 withIcc:(id)a6 newConnectedInfo:(id *)a7
{
  _BOOL8 v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  double v40;
  double v41;
  CRLConnectionLineMagnet *v42;
  id v43;
  double v46;
  double v47;
  float64x2_t v48;
  _QWORD v49[4];
  id v50;
  id v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;

  v10 = a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248578);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E12A74();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248598);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLConnectionLineAdjustmentHelper p_getUpdatedMagnetForClineItem:forHeadMagnet:withOriginalLayout:withIcc:newConnectedInfo:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLConnectionLineAdjustmentHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 132, 0, "invalid nil value for '%{public}s'", "originalLayout");

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "connectionLinePathSource"));
  v18 = v17;
  if (v10)
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "headMagnet"));
  else
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tailMagnet"));
  v20 = v19;
  objc_msgSend(v19, "magnetNormalizedPosition");
  v46 = v22;
  v47 = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pureGeometry"));
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "fullTransform");
    v25 = v52;
    v26 = v53;
    v27 = v54;
  }
  else
  {
    v27 = 0uLL;
    v53 = 0u;
    v54 = 0u;
    v52 = 0u;
    v25 = 0uLL;
    v26 = 0uLL;
  }
  v48 = vaddq_f64(v27, vmlaq_n_f64(vmulq_n_f64(v26, v46), v25, v47));

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10025BDE0;
  v49[3] = &unk_1012485C0;
  v28 = v12;
  v50 = v28;
  v29 = v11;
  v51 = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hitRep:passingTest:", v49));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "repForSelecting"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "layout"));

  if (v32)
  {
    *(_QWORD *)&v34 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v33).n128_u64[0];
    v36 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "info", v34));
    v38 = sub_100221D0C(v36, v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);

    objc_msgSend(v18, "getNewNormalizedPositionForMagnet:withPreviousLayout:onNewLayout:", v10, v28, v32);
    v42 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", objc_msgSend(a1, "p_getUpdatedMagnetTypeWithPosition:inLayout:", v32, *(_OWORD *)&v48), v40, v41);
  }
  else
  {
    v42 = 0;
    v39 = 0;
  }
  v43 = objc_retainAutorelease(v39);
  *a7 = v43;

  return v42;
}

+ (unint64_t)p_getUpdatedMagnetTypeWithPosition:(CGPoint)a3 inLayout:(id)a4
{
  double y;
  double x;
  unint64_t v7;
  uint64_t i;
  double v9;
  double v10;

  y = a3.y;
  x = a3.x;
  v7 = 7;
  for (i = 2; i != 6; ++i)
  {
    objc_msgSend(a4, "getCardinalPositionFromType:", i);
    if (sub_10006108C(v9, v10, x, y) < 10.0)
      v7 = i;
  }
  return v7;
}

+ (id)p_commandsForUpdateConnectionLineInfoGeometry:(id)a3 withBoardItemOwner:(id)a4 withNewPathSource:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v13;
  _TtC8Freeform23CRLCommandSetPathSource *v14;
  id v15;
  id v17;
  id v18;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = 0;
  v18 = 0;
  objc_msgSend(a1, "p_computeLayoutInfoGeometry:andPathSource:forConnectionLine:withBoardItemOwner:", &v18, &v17, v9, v8);

  v11 = v18;
  v12 = v17;
  v13 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:]([_TtC8Freeform25CRLCommandSetInfoGeometry alloc], "initWithBoardItem:geometry:", v9, v11);
  objc_msgSend(v10, "addObject:", v13);
  v14 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:]([_TtC8Freeform23CRLCommandSetPathSource alloc], "initWithShapeItem:pathSource:", v9, v12);

  objc_msgSend(v10, "addObject:", v14);
  v15 = objc_retainAutorelease(v12);

  *a5 = v15;
  return v10;
}

+ (void)transferLaidOutInfoGeometryAndPathSourceFrom:(id)a3 to:(id)a4 withBoardItemOwner:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v11 = 0;
  v12 = 0;
  v8 = a4;
  objc_msgSend(a1, "p_computeLayoutInfoGeometry:andPathSource:forConnectionLine:withBoardItemOwner:", &v12, &v11, a3, a5);
  v9 = v12;
  v10 = v11;
  objc_msgSend(v8, "setGeometry:", v9);
  objc_msgSend(v8, "setPathSource:", v10);

}

+ (void)p_computeLayoutInfoGeometry:(id *)a3 andPathSource:(id *)a4 forConnectionLine:(id)a5 withBoardItemOwner:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id *v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v9 = a5;
  v10 = a6;
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getConnectedFromWithBoardItemOwner:", v10));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getConnectedToWithBoardItemOwner:", v10));
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_10025C3A4;
  v42 = sub_10025C3B4;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_10025C3A4;
  v36 = sub_10025C3B4;
  v37 = 0;
  if (v11 | v12)
  {
    v27 = a4;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v9));
    v16 = v17;
    if (v11)
      objc_msgSend(v17, "addObject:", v11);
    if (v12)
      objc_msgSend(v16, "addObject:", v12);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10025C3BC;
    v28[3] = &unk_101248628;
    v18 = v9;
    v29 = v18;
    v30 = &v38;
    v31 = &v32;
    +[CRLCanvasLayoutController temporaryLayoutControllerForInfos:useInBlock:](CRLCanvasLayoutController, "temporaryLayoutControllerForInfos:useInBlock:", v16, v28);
    objc_opt_class(CRLConnectionLinePathSource, v19);
    v21 = sub_100221D0C(v20, (void *)v33[5]);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "connectionLinePathSource"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "headMagnet"));
    objc_msgSend(v22, "setHeadMagnet:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "connectionLinePathSource"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "tailMagnet"));
    objc_msgSend(v22, "setTailMagnet:", v26);

    a4 = v27;
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geometry"));
    v14 = (void *)v39[5];
    v39[5] = v13;

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathSource"));
    v16 = (void *)v33[5];
    v33[5] = v15;
  }

  if (a3)
    *a3 = objc_retainAutorelease((id)v39[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v33[5]);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
}

@end
