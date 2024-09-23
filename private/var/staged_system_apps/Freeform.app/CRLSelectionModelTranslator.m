@implementation CRLSelectionModelTranslator

- (id)infoForSelectionPath:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionModelTranslator infosForSelectionPath:](self, "infosForSelectionPath:", a3));
  if (objc_msgSend(v3, "count") == (id)1)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anyObject"));
  else
    v4 = 0;

  return v4;
}

- (id)infosForSelectionPath:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  *(_QWORD *)&v6 = objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v5).n128_u64[0];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mostSpecificSelectionOfClass:", v7, v6));
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "boardItems"));

    if (objc_msgSend(v9, "itemCount") == (id)1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "boardItems"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "anyObject"));

      if (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___CRLContainerInfo))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "infoForSelectionPath:", v3));
        if (v13)
        {
          v14 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v13));

          v10 = (void *)v14;
        }

      }
    }
    v4 = v10;
  }

  return v4;
}

- (id)selectionPathForInfos:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  unsigned int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  char *v27;
  NSObject *v28;
  char *v29;
  _TtC8Freeform17CRLBoardSelection *v30;
  CRLCanvasSelection *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  char v42;
  uint64_t v43;
  void *i;
  id v45;
  uint64_t v46;
  void *v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  _TtC8Freeform17CRLGroupSelection *v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  void *j;
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  void *k;
  void *v79;
  objc_class *v80;
  id v81;
  void *v82;
  _TtC8Freeform21CRLBoardItemSelection *v83;
  void *v84;
  uint64_t v86;
  void *v87;
  _TtC8Freeform17CRLGroupSelection *v88;
  uint64_t v89;
  double v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  id v94;
  uint64_t v95;
  CRLCanvasSelection *v96;
  _TtC8Freeform17CRLBoardSelection *v97;
  void *v98;
  void *v99;
  id obj;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint8_t v119[128];
  uint8_t buf[4];
  unsigned int v121;
  __int16 v122;
  const char *v123;
  __int16 v124;
  const char *v125;
  __int16 v126;
  int v127;
  __int16 v128;
  void *v129;
  _BYTE v130[128];

  v3 = a3;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v113, v130, 16);
  obj = v3;
  if (v4)
  {
    v11 = v4;
    v12 = *(_QWORD *)v114;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v114 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)v13);
        v15 = sub_100221DDC(v14, 1, v5, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = v16;
        if (v16)
        {
          if ((objc_msgSend(v16, "isSelectable") & 1) != 0)
            goto LABEL_27;
          v18 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101250F90);
          v19 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v121 = v18;
            v122 = 2082;
            v123 = "-[CRLSelectionModelTranslator selectionPathForInfos:]";
            v124 = 2082;
            v125 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m";
            v126 = 1024;
            v127 = 53;
            v128 = 2112;
            v129 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Only selectable infos should be used to make a selection path (%@)", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101250FB0);
          v20 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v28 = v20;
            v29 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v121 = v18;
            v122 = 2114;
            v123 = v29;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionModelTranslator selectionPathForInfos:]"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 53, 0, "Only selectable infos should be used to make a selection path (%@)", v14);
        }
        else
        {
          v23 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101250F50);
          v24 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v121 = v23;
            v122 = 2082;
            v123 = "-[CRLSelectionModelTranslator selectionPathForInfos:]";
            v124 = 2082;
            v125 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m";
            v126 = 1024;
            v127 = 51;
            v128 = 2112;
            v129 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Cannot make a selection path with an object that is not a <CRLCanvasElementInfo> (%@)", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101250F70);
          v25 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v26 = v25;
            v27 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v121 = v23;
            v122 = 2114;
            v123 = v27;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionModelTranslator selectionPathForInfos:]"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 51, 0, "Cannot make a selection path with an object that is not a <CRLCanvasElementInfo> (%@)", v14);
        }

LABEL_27:
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v3 = obj;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v130, 16);
    }
    while (v11);
  }
  v30 = objc_alloc_init(_TtC8Freeform17CRLBoardSelection);
  v31 = objc_alloc_init(CRLCanvasSelection);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v30, v31, 0));
  if (objc_msgSend(v3, "count"))
  {
    v97 = v30;
    v98 = v32;
    v96 = v31;
    v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v33 = v3;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v109, v119, 16);
    if (v34)
    {
      v41 = v34;
      v42 = 0;
      v43 = *(_QWORD *)v110;
      do
      {
        for (i = 0; i != v41; i = (char *)i + 1)
        {
          if (*(_QWORD *)v110 != v43)
            objc_enumerationMutation(v33);
          v45 = sub_100221DDC(*(void **)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)i), 1, v35, v36, v37, v38, v39, v40, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
          v47 = (void *)objc_claimAutoreleasedReturnValue(v45);
          if (v47)
          {
            *(_QWORD *)&v48 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v46).n128_u64[0];
            v50 = v49;
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "parentInfo", v48));
            v52 = sub_100221D0C(v50, v51);
            v53 = (void *)objc_claimAutoreleasedReturnValue(v52);

            if (v53)
              objc_msgSend(v99, "addObject:", v53);
            else
              v42 = 1;

          }
        }
        v41 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v109, v119, 16);
      }
      while (v41);
    }
    else
    {
      v42 = 0;
    }

    v54 = v99;
    if ((unint64_t)objc_msgSend(v99, "count") > 1
      || ((objc_msgSend(v99, "count") == (id)1) & v42) == 1)
    {
      v55 = -[CRLGroupSelection initWithContainerGroups:hasSelectedItemsInNonGroupContainer:]([_TtC8Freeform17CRLGroupSelection alloc], "initWithContainerGroups:hasSelectedItemsInNonGroupContainer:", v99, v42 & 1);
      objc_msgSend(v98, "addObject:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v105 = 0u;
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      v57 = v33;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v105, v118, 16);
      if (v58)
      {
        v60 = v58;
        v61 = *(_QWORD *)v106;
        do
        {
          for (j = 0; j != v60; j = (char *)j + 1)
          {
            if (*(_QWORD *)v106 != v61)
              objc_enumerationMutation(v57);
            v63 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)j);
            objc_opt_class(_TtC8Freeform12CRLGroupItem, v59);
            v65 = sub_100221D0C(v64, v63);
            v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
            v67 = v66;
            if (v66)
            {
              v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "allNestedChildrenItemsIncludingGroups"));
              objc_msgSend(v56, "addObjectsFromArray:", v68);

            }
          }
          v60 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v105, v118, 16);
        }
        while (v60);
      }

      v32 = v98;
      if (objc_msgSend(v56, "intersectsSet:", v57))
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101250FD0);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E1F918();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101250FF0);
        v69 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionModelTranslator selectionPathForInfos:]"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v70, v71, 86, 0, "Cannot select a parent and child simultaneously!");

      }
      v54 = v99;
    }
    else
    {
      v32 = v98;
      if (objc_msgSend(v99, "count") == (id)1)
      {
        v86 = objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "anyObject"));
        if (v86)
        {
          v87 = (void *)v86;
          do
          {
            v88 = -[CRLGroupSelection initWithGroupItem:]([_TtC8Freeform17CRLGroupSelection alloc], "initWithGroupItem:", v87);
            objc_msgSend(v98, "insertObject:atIndex:", v88, 2);
            *(_QWORD *)&v90 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v89).n128_u64[0];
            v92 = v91;
            v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "parentInfo", v90));
            v94 = sub_100221D0C(v92, v93);
            v95 = objc_claimAutoreleasedReturnValue(v94);

            v87 = (void *)v95;
          }
          while (v95);
        }
      }
    }
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v73 = v33;
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
    if (v74)
    {
      v76 = v74;
      v77 = *(_QWORD *)v102;
      do
      {
        for (k = 0; k != v76; k = (char *)k + 1)
        {
          if (*(_QWORD *)v102 != v77)
            objc_enumerationMutation(v73);
          v79 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)k);
          objc_opt_class(_TtC8Freeform12CRLBoardItem, v75);
          v81 = sub_1002223BC(v80, v79);
          v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
          objc_msgSend(v72, "crl_addNonNilObject:", v82);

        }
        v76 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
      }
      while (v76);
    }

    v83 = -[CRLBoardItemSelection initWithBoardItems:]([_TtC8Freeform21CRLBoardItemSelection alloc], "initWithBoardItems:", v72);
    objc_msgSend(v32, "addObject:", v83);

    v3 = obj;
    v31 = v96;
    v30 = v97;
  }
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSelectionPath selectionPathWithSelectionArray:](CRLSelectionPath, "selectionPathWithSelectionArray:", v32));

  return v84;
}

- (id)selectionPathForTextRange:(id)a3 onStorage:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  CRLWPSelection *v17;
  id v18;
  uint64_t v19;
  CRLWPSelection *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;

  v6 = a3;
  v7 = a4;
  *(_QWORD *)&v9 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v8).n128_u64[0];
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentInfo", v9));
  v13 = sub_100221D0C(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionModelTranslator selectionPathForInfos:](self, "selectionPathForInfos:", v15));

    v17 = [CRLWPSelection alloc];
    v18 = objc_msgSend(v6, "nsRange");
    LOBYTE(v26) = 1;
    v20 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v17, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 0, v18, v19, 0, objc_msgSend(v6, "caretAffinity"), 0x7FFFFFFFFFFFFFFFLL, 0, v26, v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "selectionPathWithAppendedSelection:", v20));

  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251010);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1F99C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251030);
    v22 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionModelTranslator selectionPathForTextRange:onStorage:]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 112, 0, "invalid nil value for '%{public}s'", "parentInfo");

    v21 = 0;
  }

  return v21;
}

- (id)selectionPathForRange:(_NSRange)a3 onStorage:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLTextRange textRangeWith:](_TtC8Freeform12CRLTextRange, "textRangeWith:", location, length));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionModelTranslator selectionPathForTextRange:onStorage:](self, "selectionPathForTextRange:onStorage:", v8, v7));

  return v9;
}

- (id)visualSelectionPathForTextRange:(id)a3 onStorage:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  CRLWPSelection *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  CRLWPSelection *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;

  v6 = a3;
  v7 = a4;
  *(_QWORD *)&v9 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v8).n128_u64[0];
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentInfo", v9));
  v13 = sub_100221D0C(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionModelTranslator selectionPathForInfos:](self, "selectionPathForInfos:", v15));

    v17 = [CRLWPSelection alloc];
    v18 = objc_msgSend(v6, "nsRange");
    v20 = v19;
    v21 = objc_msgSend(v6, "caretAffinity");
    LOBYTE(v28) = objc_msgSend(v6, "insertionEdge") == 0;
    v22 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v17, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, v18, v20, 0, v21, 0x7FFFFFFFFFFFFFFFLL, 0, v28, v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "selectionPathWithAppendedSelection:", v22));

  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251050);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1FA28();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251070);
    v24 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionModelTranslator visualSelectionPathForTextRange:onStorage:]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 130, 0, "invalid nil value for '%{public}s'", "parentInfo");

    v23 = 0;
  }

  return v23;
}

- (id)visualSelectionPathForRange:(_NSRange)a3 onStorage:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLTextRange textRangeWith:](_TtC8Freeform12CRLTextRange, "textRangeWith:", location, length));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionModelTranslator visualSelectionPathForTextRange:onStorage:](self, "visualSelectionPathForTextRange:onStorage:", v8, v7));

  return v9;
}

- (id)selectionPathForRange:(_NSRange)a3 onStorage:(id)a4 headCursorAffinity:(unint64_t)a5 tailCursorAffinity:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  length = a3.length;
  location = a3.location;
  v11 = a4;
  *(_QWORD *)&v13 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v12).n128_u64[0];
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parentInfo", v13));
  v17 = sub_100221D0C(v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v18));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionModelTranslator selectionPathForInfos:](self, "selectionPathForInfos:", v19));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSelection selectionWithRange:type:leadingEdge:storage:](CRLWPSelection, "selectionWithRange:type:leadingEdge:storage:", location, length, 0, 1, v11));
    objc_msgSend(v21, "setHeadCursorAffinity:", a5);
    objc_msgSend(v21, "setTailCursorAffinity:", a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "selectionPathWithAppendedSelection:", v21));

  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251090);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1FAB4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012510B0);
    v23 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionModelTranslator selectionPathForRange:onStorage:headCursorAffinity:tailCursorAffinity:]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 148, 0, "invalid nil value for '%{public}s'", "parentInfo");

    v22 = 0;
  }

  return v22;
}

- (id)selectionPathForSelection:(id)a3 onStorage:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  *(_QWORD *)&v9 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v8).n128_u64[0];
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentInfo", v9));

  v13 = sub_100221D0C(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionModelTranslator selectionPathForInfos:](self, "selectionPathForInfos:", v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "selectionPathWithAppendedSelection:", v6));
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012510D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1FB40();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012510F0);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionModelTranslator selectionPathForSelection:onStorage:]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 164, 0, "invalid nil value for '%{public}s'", "parentInfo");

    v17 = 0;
  }

  return v17;
}

- (id)selectionPathForNothingSelectedInsideGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _TtC8Freeform17CRLGroupSelection *v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionModelTranslator selectionPathForInfos:](self, "selectionPathForInfos:", v5));

  *(_QWORD *)&v8 = objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v7).n128_u64[0];
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mostSpecificSelectionOfClass:", 0, v8));
  v12 = sub_100221D0C(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (!v13
    || (objc_opt_class(_TtC8Freeform17CRLGroupSelection, v14), (objc_opt_isKindOfClass(v13, v15) & 1) != 0))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251110);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1FBCC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251130);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSelectionModelTranslator selectionPathForNothingSelectedInsideGroup:]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSelectionModelTranslator.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 180, 0, "We expect this selection to be a plain board item selection, not one for editing in a group.");

  }
  v19 = -[CRLGroupSelection initWithGroupItem:]([_TtC8Freeform17CRLGroupSelection alloc], "initWithGroupItem:", v4);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPathReplacingMostSpecificLocationOfSelection:withSelection:", v13, v19));
  return v20;
}

- (id)boardItemsForSelectionPath:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  *(_QWORD *)&v5 = objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v4).n128_u64[0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mostSpecificSelectionOfClass:", v6, v5));

  if (v7
    && (objc_opt_class(_TtC8Freeform17CRLGroupSelection, v8), (objc_opt_isKindOfClass(v7, v9) & 1) == 0))
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boardItems"));
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  }
  v11 = (void *)v10;

  return v11;
}

- (id)unlockedBoardItemsForSelectionPath:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionModelTranslator boardItemsForSelectionPath:](self, "boardItemsForSelectionPath:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectsPassingTest:", &stru_101251150));

  return v4;
}

- (id)containerToInsertIntoForSelectionPath:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  CFArrayRef (__cdecl **v10)(CTFontDescriptorRef, CFSetRef);
  void *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  uint64_t v34;
  id v35;
  id v37;
  uint64_t v38;
  id obj;
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];

  v3 = a3;
  *(_QWORD *)&v5 = objc_opt_class(_TtC8Freeform17CRLGroupSelection, v4).n128_u64[0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mostSpecificSelectionOfClass:", v6, v5));
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "hasSelectedItemsInNonGroupContainer") & 1) == 0)
  {
    v37 = v3;
    v10 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerGroups"));
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v40)
    {
      v12 = *(_QWORD *)v47;
      v13 = 1;
      v38 = *(_QWORD *)v47;
LABEL_6:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v47 != v12)
          objc_enumerationMutation(obj);
        v41 = v14;
        v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[413], "array"));
        objc_msgSend(v16, "addObject:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "parentInfo"));
        do
        {
          objc_opt_class(NSObject, v17);
          v25 = sub_10022209C(v18, v19, 1, v20, v21, v22, v23, v24, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          objc_msgSend(v16, "crl_addNonNilObject:", v26);
          v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "parentInfo"));

          v18 = (void *)v27;
        }
        while (v27);
        if ((v13 & 1) != 0)
        {
          objc_msgSend(v11, "addObjectsFromArray:", v16);
        }
        else
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v29 = objc_msgSend(v11, "copy");
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v43;
            do
            {
              for (i = 0; i != v31; i = (char *)i + 1)
              {
                if (*(_QWORD *)v43 != v32)
                  objc_enumerationMutation(v29);
                v34 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
                if ((objc_msgSend(v28, "containsObject:", v34) & 1) == 0)
                  objc_msgSend(v11, "removeObject:", v34);
              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
            }
            while (v31);
          }

          v10 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
          v12 = v38;
        }
        v35 = objc_msgSend(v11, "count");

        if (!v35)
          break;
        v13 = 0;
        v14 = v41 + 1;
        if ((id)(v41 + 1) == v40)
        {
          v13 = 0;
          v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          if (v40)
            goto LABEL_6;
          break;
        }
      }
    }

    if (objc_msgSend(v11, "count"))
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    else
      v9 = 0;
    v3 = v37;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)selectionPathRemovingCrossContainerSelectionsForSelectionPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *j;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  void *k;
  id v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  void *m;
  uint64_t v67;
  void *v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  CRLSelectionModelTranslator *v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionModelTranslator infosForSelectionPath:](self, "infosForSelectionPath:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  *(_QWORD *)&v8 = objc_opt_class(_TtC8Freeform17CRLGroupSelection, v7).n128_u64[0];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mostSpecificSelectionOfClass:", v9, v8));
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "isCrossContainerSelection") & 1) != 0)
  {
    v74 = v11;
    v75 = self;
    if (objc_msgSend(v11, "hasSelectedItemsInNonGroupContainer"))
    {
      v69 = v5;
      v70 = v4;
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
      if (v13)
      {
        v15 = v13;
        v16 = *(_QWORD *)v90;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v90 != v16)
              objc_enumerationMutation(v12);
            v18 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)i);
            *(_QWORD *)&v19 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v14).n128_u64[0];
            v21 = v20;
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "parentInfo", v19));
            v23 = sub_100221D0C(v21, v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

            if (v24)
              objc_msgSend(v6, "crl_addNonNilObject:", v18);

          }
          v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v89, v96, 16);
        }
        while (v15);
      }

      v5 = v69;
      v4 = v70;
      self = v75;
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
      objc_msgSend(v6, "addObjectsFromArray:", v26);

    }
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionModelTranslator selectionPathForInfos:](self, "selectionPathForInfos:", v6));
    v27 = (id)objc_claimAutoreleasedReturnValue(-[CRLSelectionModelTranslator containerToInsertIntoForSelectionPath:](self, "containerToInsertIntoForSelectionPath:"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    if (v27 && (objc_msgSend(v27, "isSelectable") & 1) != 0)
    {
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v29 = v5;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
      if (!v30)
      {
LABEL_54:

        v25 = (id)objc_claimAutoreleasedReturnValue(-[CRLSelectionModelTranslator selectionPathForInfos:](self, "selectionPathForInfos:", v28));
        v11 = v74;
        goto LABEL_55;
      }
      v31 = v30;
      v71 = v4;
      v72 = v6;
      v76 = *(_QWORD *)v78;
      do
      {
        for (j = 0; j != v31; j = (char *)j + 1)
        {
          if (*(_QWORD *)v78 != v76)
            objc_enumerationMutation(v29);
          v33 = *(id *)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)j);
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "parentInfo"));
          objc_opt_class(NSObject, v35);
          v42 = sub_10022209C(v34, v36, 1, v37, v38, v39, v40, v41, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
          v43 = (id)objc_claimAutoreleasedReturnValue(v42);

          while (1)
          {
            if (v43 == v27)
            {
              v43 = v27;

              v33 = v43;
              goto LABEL_33;
            }
            if (objc_msgSend(v43, "isSelectable"))
            {
              v44 = v43;

              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "parentInfo"));
              objc_opt_class(NSObject, v46);
              v53 = sub_10022209C(v45, v47, 1, v48, v49, v50, v51, v52, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
              v43 = (id)objc_claimAutoreleasedReturnValue(v53);

              v33 = v44;
            }
            if (!v43)
              goto LABEL_33;
            if (v43 == v27)
              break;
            if ((objc_msgSend(v43, "isSelectable") & 1) == 0)
              goto LABEL_33;
          }
          v43 = v27;
LABEL_33:
          objc_msgSend(v28, "crl_addNonNilObject:", v33);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
      }
      while (v31);
      v4 = v71;
    }
    else
    {
      v72 = v6;
      v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      v54 = v5;
      v55 = v5;
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v86;
        do
        {
          for (k = 0; k != v57; k = (char *)k + 1)
          {
            if (*(_QWORD *)v86 != v58)
              objc_enumerationMutation(v55);
            v60 = sub_1000664C4(*(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)k));
            v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
            objc_msgSend(v29, "crl_addNonNilObject:", v61);

          }
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
        }
        while (v57);
      }

      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "childInfos"));
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
      if (v63)
      {
        v64 = v63;
        v65 = *(_QWORD *)v82;
        do
        {
          for (m = 0; m != v64; m = (char *)m + 1)
          {
            if (*(_QWORD *)v82 != v65)
              objc_enumerationMutation(v62);
            v67 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)m);
            if (objc_msgSend(v29, "containsObject:", v67))
              objc_msgSend(v28, "addObject:", v67);
          }
          v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
        }
        while (v64);
      }

      v5 = v54;
    }
    v6 = v72;
    self = v75;
    goto LABEL_54;
  }
  v25 = v4;
LABEL_55:

  return v25;
}

- (BOOL)isSelectionPathUserSelectable:(id)a3 isInCollaborationMode:(BOOL)a4
{
  id v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  BOOL v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL4 v31;
  id v32;
  id v33;
  uint64_t v34;
  void *j;
  void *v36;
  id v37;
  void *v38;
  int v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];

  v5 = a3;
  *(_QWORD *)&v7 = objc_opt_class(_TtC8Freeform17CRLGroupSelection, v6).n128_u64[0];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mostSpecificSelectionOfClass:", v8, v7));
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "containerGroups"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v50;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v50 != v13)
        objc_enumerationMutation(v10);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v14), "isEffectivelyEmpty") & 1) != 0)
        break;
      if (v12 == (id)++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_9;
      }
    }

    v15 = 0;
    v16 = 0;
    if (v9)
      goto LABEL_44;
  }
  else
  {
LABEL_9:

    if (v9)
    {

      goto LABEL_24;
    }
    v15 = 1;
  }
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v17 = (id)objc_claimAutoreleasedReturnValue(-[CRLSelectionModelTranslator boardItemsForSelectionPath:](self, "boardItemsForSelectionPath:", v5));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v18)
  {
    v20 = v18;
    v21 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v21)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform12CRLGroupItem, v19);
        v25 = sub_100221D0C(v24, v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        v27 = v26;
        if (v26 && (objc_msgSend(v26, "isEffectivelyEmpty") & 1) != 0)
        {
          v16 = 0;
          v9 = v17;
          goto LABEL_43;
        }

      }
      v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      if (v20)
        continue;
      break;
    }
  }

  if ((v15 & 1) == 0)
  {
    v16 = 0;
    goto LABEL_45;
  }
LABEL_24:
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionModelTranslator infosForSelectionPath:](self, "infosForSelectionPath:", v5));
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mostSpecificSelectionOfClass:", 0));
  objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v29);
  v31 = (objc_opt_isKindOfClass(v17, v30) & 1) == 0 && objc_msgSend(v28, "count") == (id)1;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v27 = v28;
  v32 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v42;
    while (2)
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(_QWORD *)v42 != v34)
          objc_enumerationMutation(v27);
        v36 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
        v37 = sub_1000664C4(v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v39 = v36 != v38 || v31;

        if (v39 == 1 && (sub_1000665A8(v36) & 1) != 0)
        {
          v16 = 0;
          goto LABEL_42;
        }
      }
      v33 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      if (v33)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_42:
  v9 = v27;
LABEL_43:

LABEL_44:
LABEL_45:

  return v16;
}

@end
