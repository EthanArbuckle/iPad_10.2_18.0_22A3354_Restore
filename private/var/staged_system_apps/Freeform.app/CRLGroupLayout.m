@implementation CRLGroupLayout

- (id)convexHullPath
{
  -[CRLGroupLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  return +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:");
}

- (id)p_groupItem
{
  double v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLGroupItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v3));
  v7 = sub_1002223BC(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)visibleGeometries
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  _OWORD v19[3];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v29 = 0u;
  v30 = 0u;
  v28 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "transform");
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v28 = 0u;
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "visibleGeometries"));
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(_QWORD *)v21 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j);
              v19[0] = v28;
              v19[1] = v29;
              v19[2] = v30;
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "geometryByTransformingBy:", v19));
              objc_msgSend(v3, "addObject:", v17);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
          }
          while (v13);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v8);
  }

  return v3;
}

- (id)childInfosForChildLayouts
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  _UNKNOWN **v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  CRLGroupLayout *v39;
  uint64_t v40;
  CRLGroupLayout *v41;
  CRLCounterRotateInfo *v42;
  CRLCounterRotateInfo *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  double v53;
  objc_class *v54;
  objc_class *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  id v65;
  void *v66;
  void *v67;
  int v68;
  uint64_t v69;
  void *v70;
  id v71;
  id v72;
  _OWORD v73[3];
  _OWORD v74[3];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _OWORD v79[3];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _OWORD v84[3];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _OWORD v88[3];
  __int128 v89;
  __int128 v90;
  __int128 v91;
  objc_super v92;
  _BYTE v93[128];
  _BYTE v94[128];

  v92.receiver = self;
  v92.super_class = (Class)CRLGroupLayout;
  v3 = -[CRLCanvasLayout childInfosForChildLayouts](&v92, "childInfosForChildLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvas"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "additionalChildInfosForLayout:", self));

  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v8));

    v4 = (void *)v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupItem](self, "p_groupItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "childItems"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupItem](self, "p_groupItem"));
  v14 = v12;
  v71 = v14;
  if ((objc_msgSend(v13, "isFreehandDrawing") & 1) == 0)
  {
    v90 = 0u;
    v91 = 0u;
    v89 = 0u;
    v66 = v8;
    v67 = v13;
    if (v13)
      objc_msgSend(v13, "transformInRoot");
    else
      memset(v88, 0, sizeof(v88));
    +[CRLCounterRotateInfo counterTransformForTransformInRoot:](CRLCounterRotateInfo, "counterTransformForTransformInRoot:", v88);
    v85 = v89;
    v86 = v90;
    v87 = v91;
    v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v84[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v84[1] = v15;
    v84[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v16 = sub_10005FEA0(&v85, v84);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v65 = v14;
    v18 = v14;
    v70 = v18;
    v71 = v17;
    v72 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
    if (v72)
    {
      v20 = *(_QWORD *)v81;
      v21 = !v16;
      v22 = &off_1013BA000;
      v69 = *(_QWORD *)v81;
      v68 = v21;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v81 != v20)
            objc_enumerationMutation(v18);
          v24 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)v23);
          objc_opt_class(v22 + 277, v19);
          v26 = sub_100221D0C(v25, v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
          v28 = v27;
          if (!v27
            || !objc_msgSend(v27, "wantsCounterRotationWhenNotSupportingParentRotationInRotatedParent"))
          {
LABEL_32:
            objc_msgSend(v17, "addObject:", v24, v65);
            goto LABEL_33;
          }
          v29 = objc_msgSend(v28, "supportsParentRotation");
          if (((v29 | v21) & 1) != 0)
          {
            if ((v29 & 1) != 0)
              goto LABEL_32;
          }
          else
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "geometry"));
            v45 = v44;
            if (v44)
              objc_msgSend(v44, "transform");
            else
              memset(v79, 0, sizeof(v79));
            v46 = sub_100079210((double *)v79);

            v22 = &off_1013BA000;
            if (!v46)
              goto LABEL_32;
          }
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController", v65));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "layoutsForInfo:", v28));

          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          v32 = v31;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v76;
LABEL_18:
            v36 = 0;
            while (1)
            {
              if (*(_QWORD *)v76 != v35)
                objc_enumerationMutation(v32);
              v37 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v36);
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "parent"));
              v39 = (CRLGroupLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "parent"));

              if (v39 == self)
                break;
              v41 = (CRLGroupLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "parent"));

              if (v41 == self)
                goto LABEL_25;
              if (v34 == (id)++v36)
              {
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
                if (v34)
                  goto LABEL_18;
                goto LABEL_25;
              }
            }
            *(_QWORD *)&v47 = objc_opt_class(CRLCounterRotateLayout, v40).n128_u64[0];
            v49 = v48;
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "parent", v47));
            v51 = sub_100221D0C(v49, v50);
            v43 = (CRLCounterRotateInfo *)objc_claimAutoreleasedReturnValue(v51);

            if (!v43)
              goto LABEL_26;
            *(_QWORD *)&v53 = objc_opt_class(CRLCounterRotateInfo, v52).n128_u64[0];
            v55 = v54;
            v56 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCounterRotateInfo info](v43, "info", v53));
            v57 = sub_1002223BC(v55, v56);
            v58 = (void *)objc_claimAutoreleasedReturnValue(v57);

            v18 = v70;
            v17 = v71;
            v20 = v69;
            if (v58)
              objc_msgSend(v58, "counterTransform");
            else
              memset(v74, 0, sizeof(v74));
            v85 = v89;
            v86 = v90;
            v87 = v91;
            v21 = v68;
            if (!sub_10005FEA0(v74, &v85))
            {
              v73[0] = v89;
              v73[1] = v90;
              v73[2] = v91;
              objc_msgSend(v58, "setCounterTransform:", v73);
              -[CRLCounterRotateInfo invalidateFrame](v43, "invalidateFrame");
            }
            objc_msgSend(v71, "addObject:", v58);

          }
          else
          {
LABEL_25:

LABEL_26:
            v42 = [CRLCounterRotateInfo alloc];
            v85 = v89;
            v86 = v90;
            v87 = v91;
            v43 = -[CRLCounterRotateInfo initWithChildInfo:parentGroup:counterTransform:](v42, "initWithChildInfo:parentGroup:counterTransform:", v28, v67, &v85);
            v17 = v71;
            objc_msgSend(v71, "addObject:", v43);
            v20 = v69;
            v18 = v70;
            v21 = v68;
          }

          v22 = &off_1013BA000;
LABEL_33:

          v23 = (char *)v23 + 1;
        }
        while (v23 != v72);
        v59 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
        v72 = v59;
      }
      while (v59);
    }

    v60 = objc_msgSend(v17, "count");
    v8 = v66;
    v13 = v67;
    if (v60 != objc_msgSend(v18, "count"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012479A8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E113B8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012479C8);
      v61 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupLayout childInfosForChildLayouts]", v65));
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupLayout.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v62, v63, 133, 0, "should have same number of children!");

    }
    v14 = v65;
  }

  return v71;
}

- (BOOL)canInspectGeometry
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvas"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasController"));

  if (-[CRLCanvasLayout isInTopLevelContainerForEditing](self, "isInTopLevelContainerForEditing"))
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "hasSelectedInfosInMultipleContainers");

  return v6;
}

- (id)layoutGeometryFromInfo
{
  void *v2;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  void *v15;
  id v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  CRLCanvasLayoutGeometry *v23;
  NSObject *v24;
  NSString *v25;
  void *v26;
  uint64_t v27;
  Class v28;
  NSString *v29;
  void *v30;
  id v31;
  unsigned int v32;
  unsigned int v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  unsigned int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  unsigned int v45;
  __int16 v46;
  unsigned int v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;

  v2 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
  if (v2)
    return v2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geometry"));

  if (!objc_msgSend(v6, "widthValid") || (objc_msgSend(v6, "heightValid") & 1) == 0)
  {
    v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012479E8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      v24 = v8;
      v33 = objc_msgSend(v6, "widthValid");
      v32 = objc_msgSend(v6, "heightValid");
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupItem](self, "p_groupItem"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "childItems"));
      v31 = objc_msgSend(v34, "count");
      v25 = NSStringFromCGRect(*(CGRect *)((char *)&self->_dynamicLayoutGeometry + 2));
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      objc_opt_class(self, v27);
      v29 = NSStringFromClass(v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      *(_DWORD *)buf = 67111426;
      v37 = v7;
      v38 = 2082;
      v39 = "-[CRLGroupLayout layoutGeometryFromInfo]";
      v40 = 2082;
      v41 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupLayout.m";
      v42 = 1024;
      v43 = 156;
      v44 = 1024;
      v45 = v33;
      v46 = 1024;
      v47 = v32;
      v48 = 2048;
      v49 = v31;
      v50 = 2114;
      v51 = v26;
      v52 = 2114;
      v53 = v30;
      v54 = 2114;
      v55 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid info geom! wV: %d hV: %d. numChildren: %zi boundsForStandardKnobs %{public}@ %{public}@ geom: %{public}@", buf, 0x56u);

    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247A08);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupLayout layoutGeometryFromInfo]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupLayout.m"));
    v12 = objc_msgSend(v6, "widthValid");
    v13 = objc_msgSend(v6, "heightValid");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupItem](self, "p_groupItem"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "childItems"));
    v16 = objc_msgSend(v15, "count");
    v17 = NSStringFromCGRect(*(CGRect *)((char *)&self->_dynamicLayoutGeometry + 2));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_opt_class(self, v19);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 156, 0, "Invalid info geom! wV: %d hV: %d. numChildren: %zi boundsForStandardKnobs %{public}@ %{public}@ geom: %{public}@", v12, v13, v16, v18, v22, v6);

  }
  v23 = -[CRLCanvasLayoutGeometry initWithInfoGeometry:]([CRLCanvasLayoutGeometry alloc], "initWithInfoGeometry:", v6);

  return v23;
}

- (id)reliedOnLayouts
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupedChildren](self, "p_groupedChildren"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "set"));

  return v3;
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  CRLGroupLayout *v4;

  v4 = self;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1));
}

- (CGRect)computeBoundsForStandardKnobs
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;
  CGRect v36;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupedChildren](self, "p_groupedChildren", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v28;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v11);
        objc_opt_class(CRLGroupLayout, v8);
        v14 = sub_100221D0C(v13, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = v15;
        if (!v15
          || (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "p_groupItem")),
              v18 = objc_msgSend(v17, "isEffectivelyEmpty"),
              v17,
              (v18 & 1) == 0))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pureGeometry"));
          objc_msgSend(v19, "frame");
          v36.origin.x = x;
          v36.origin.y = y;
          v36.size.width = width;
          v36.size.height = height;
          v33 = CGRectUnion(v32, v36);
          x = v33.origin.x;
          y = v33.origin.y;
          width = v33.size.width;
          height = v33.size.height;

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  if (CGRectIsNull(v34))
  {
    +[CRLGroupItem unscaledSizeForEmptyGroups](_TtC8Freeform12CRLGroupItem, "unscaledSizeForEmptyGroups");
    x = sub_10005FDDC();
    y = v20;
    width = v21;
    height = v22;
  }
  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)computeLayoutGeometry
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (CRLCanvasLayoutGeometry **)((char *)&self->_dynamicLayoutGeometry + 2);
  -[CRLGroupLayout computeBoundsForStandardKnobs](self, "computeBoundsForStandardKnobs");
  *v3 = v4;
  v3[1] = v5;
  v3[2] = v6;
  v3[3] = v7;
  return -[CRLGroupLayout layoutGeometryFromInfo](self, "layoutGeometryFromInfo");
}

- (CGRect)rectInRootForSelectionPath:(id)a3
{
  void *v3;
  double v4;
  double v5;
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
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometryInRoot](self, "pureGeometryInRoot", a3));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)processChangedProperty:(unint64_t)a3
{
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  _OWORD v17[3];
  _OWORD v18[3];

  if (a3 == 7)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
    v6 = objc_msgSend(v5, "isFreehandDrawing");

    if ((v6 & 1) != 0)
      goto LABEL_14;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geometry"));
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "transform");
    else
      memset(v18, 0, sizeof(v18));
    v10 = sub_1000791EC((double *)v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "transform");
    else
      memset(v17, 0, sizeof(v17));
    v13 = sub_1000791EC((double *)v17);
    if (v10 == v13)
    {

      goto LABEL_14;
    }
    v14 = fabs(v13 * 0.000000999999997);
    v15 = vabdd_f64(v10, v13);

    if (v15 < v14)
      goto LABEL_14;
    goto LABEL_3;
  }
  if (a3 == 4)
LABEL_3:
    -[CRLCanvasLayout invalidateChildren](self, "invalidateChildren");
LABEL_14:
  v16.receiver = self;
  v16.super_class = (Class)CRLGroupLayout;
  -[CRLCanvasLayout processChangedProperty:](&v16, "processChangedProperty:", a3);
}

- (CGRect)boundsForStandardKnobs
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)((char *)&self->_dynamicLayoutGeometry + 2);
  v3 = *(double *)((char *)&self->_boundsForStandardKnobs.origin.x + 2);
  v4 = *(double *)((char *)&self->_boundsForStandardKnobs.origin.y + 2);
  v5 = *(double *)((char *)&self->_boundsForStandardKnobs.size.width + 2);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)frameForMiniFormatterPositioning
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CGAffineTransform v45;
  _BYTE v46[128];
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect result;
  CGRect v54;
  CGRect v55;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  memset(&v45, 0, sizeof(v45));
  -[CRLCanvasAbstractLayout transform](self, "transform");
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v42;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v12);
        *(_QWORD *)&v14 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v9).n128_u64[0];
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "info", v14));
        v18 = sub_100221D0C(v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

        if (!v19 || (objc_msgSend(v19, "isEffectivelyEmpty") & 1) == 0)
        {
          objc_msgSend(v13, "frameForMiniFormatterPositioning");
          v40 = v45;
          v48 = CGRectApplyAffineTransform(v47, &v40);
          v54.origin.x = x;
          v54.origin.y = y;
          v54.size.width = width;
          v54.size.height = height;
          v49 = CGRectUnion(v48, v54);
          x = v49.origin.x;
          y = v49.origin.y;
          width = v49.size.width;
          height = v49.size.height;
        }

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v10);
  }

  -[CRLGroupLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[CRLCanvasAbstractLayout transform](self, "transform");
  v50.origin.x = v21;
  v50.origin.y = v23;
  v50.size.width = v25;
  v50.size.height = v27;
  v55 = CGRectApplyAffineTransform(v50, &v39);
  v51.origin.x = x;
  v51.origin.y = y;
  v51.size.width = width;
  v51.size.height = height;
  v52 = CGRectUnion(v51, v55);
  v28 = v52.origin.x;
  v29 = v52.origin.y;
  v30 = v52.size.width;
  v31 = v52.size.height;
  if (CGRectIsNull(v52))
  {
    +[CRLGroupItem unscaledSizeForEmptyGroups](_TtC8Freeform12CRLGroupItem, "unscaledSizeForEmptyGroups");
    v28 = sub_10005FDDC();
    v29 = v32;
    v30 = v33;
    v31 = v34;
  }
  v35 = v28;
  v36 = v29;
  v37 = v30;
  v38 = v31;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (CGRect)clipRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)((char *)&self->_dynamicLayoutGeometry + 2);
  v3 = *(double *)((char *)&self->_boundsForStandardKnobs.origin.x + 2);
  v4 = *(double *)((char *)&self->_boundsForStandardKnobs.origin.y + 2);
  v5 = *(double *)((char *)&self->_boundsForStandardKnobs.size.width + 2);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)updateLayoutGeometryInPreparationForPartitioning
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  double x;
  double y;
  double height;
  double width;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *k;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v49;
  CGAffineTransform v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupItem](self, "p_groupItem"));
  v4 = objc_msgSend(v3, "isEffectivelyEmpty");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupedChildren](self, "p_groupedChildren"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "array"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrayByAddingObject:", self));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v56 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i), "invalidateFrame");
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v11);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
    objc_msgSend(v14, "validateLayoutWithDependencies:", self);

    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupedChildren](self, "p_groupedChildren"));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(_QWORD *)v52 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)j), "frameForCulling");
          v64.origin.x = x;
          v64.origin.y = y;
          v64.size.width = width;
          v64.size.height = height;
          v63 = CGRectUnion(v62, v64);
          x = v63.origin.x;
          y = v63.origin.y;
          width = v63.size.width;
          height = v63.size.height;
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v21);
    }

    v24 = fmax(width, 1.0);
    v25 = fmax(height, 1.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
    objc_msgSend(v26, "size");
    v28 = v27;
    v30 = v29;

    v31 = fmax(v28, 1.0);
    v32 = fmax(v30, 1.0);
    memset(&v50, 0, sizeof(v50));
    CGAffineTransformMakeScale(&v50, v24 / v31, v25 / v32);
    CGAffineTransformMakeTranslation(&t2, x / v31, y / v32);
    t1 = v50;
    CGAffineTransformConcat(&v49, &t1, &t2);
    v50 = v49;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
    v34 = v33;
    if (v33)
      objc_msgSend(v33, "fullTransform");
    else
      memset(&v45, 0, sizeof(v45));
    v49 = v50;
    CGAffineTransformConcat(&v46, &v49, &v45);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasLayoutGeometry geometryFromFullTransform:](CRLCanvasLayoutGeometry, "geometryFromFullTransform:", &v46));
    -[CRLCanvasAbstractLayout setGeometry:](self, "setGeometry:", v35);

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children", 0));
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v41, v59, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v38; k = (char *)k + 1)
        {
          if (*(_QWORD *)v42 != v39)
            objc_enumerationMutation(v36);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)k), "offsetGeometryBy:", sub_1000603DC(x, y, -1.0));
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v41, v59, 16);
      }
      while (v38);
    }

  }
}

- (CGRect)alignmentFrame
{
  CGFloat *v2;
  CGAffineTransform v3;
  CGRect v4;

  v2 = (CGFloat *)((char *)&self->_dynamicLayoutGeometry + 2);
  -[CRLCanvasAbstractLayout transform](self, "transform");
  v4.origin.x = *v2;
  v4.origin.y = v2[1];
  v4.size.width = v2[2];
  v4.size.height = v2[3];
  return CGRectApplyAffineTransform(v4, &v3);
}

- (CGRect)baseFrameForFrameForCullingWithAdditionalTransform:(CGAffineTransform *)a3
{
  void *v4;
  __int128 v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  double v12;
  double v13;
  CGAffineTransform v14;
  CGRect v15;
  CGRect v16;
  CGRect result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  objc_msgSend(v4, "frame");
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v14.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v14.c = v5;
  *(_OWORD *)&v14.tx = *(_OWORD *)&a3->tx;
  v16 = CGRectApplyAffineTransform(v15, &v14);
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;

  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (BOOL)shouldBeIncludedInParentFrameForCulling
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupItem](self, "p_groupItem"));
  v3 = objc_msgSend(v2, "isEffectivelyEmpty") ^ 1;

  return v3;
}

- (CGRect)rectInRootForPresentingAnnotationPopoverForSelectionPath:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[CRLGroupLayout boundsForStandardKnobs](self, "boundsForStandardKnobs", a3);
  -[CRLCanvasAbstractLayout rectInRoot:](self, "rectInRoot:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  if (-[CRLGroupLayout resizeMayChangeAspectRatio](self, "resizeMayChangeAspectRatio"))
    v5 = 1;
  else
    v5 = 2;
  *(_DWORD *)((char *)&self->_cachedGroupedChildren + 6) = v5;
  -[CRLGroupLayout p_createDynamicCopies](self, "p_createDynamicCopies");
  v6.receiver = self;
  v6.super_class = (Class)CRLGroupLayout;
  -[CRLCanvasLayout beginDynamicOperationWithRealTimeCommands:](&v6, "beginDynamicOperationWithRealTimeCommands:", v3);
}

- (id)computeInfoGeometryDuringResize
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "infoGeometry"));

  return v3;
}

- (void)takeRotationFromTracker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _OWORD v7[3];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLGroupLayout;
  -[CRLCanvasLayout takeRotationFromTracker:](&v11, "takeRotationFromTracker:", v4);
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  if (v4)
    objc_msgSend(v4, "rotateTransform");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalGeometry](self, "originalGeometry"));
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geometryByTransformingBy:", v7));

  -[CRLGroupLayout setDynamicGeometry:](self, "setDynamicGeometry:", v6);
  -[CRLCanvasLayout invalidatePosition](self, "invalidatePosition");

}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v3 = objc_msgSend(v2, "canAspectRatioLockBeChangedByUser");

  return v3;
}

- (BOOL)resizeMayChangeAspectRatio
{
  int v2;
  char v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char isKindOfClass;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unsigned __int8 v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v2 = *(_DWORD *)((char *)&self->_cachedGroupedChildren + 6);
  if (!v2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
    if ((objc_msgSend(v5, "aspectRatioLocked") & 1) != 0
      || !objc_msgSend(v5, "canAspectRatioLockBeChangedByUser"))
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allNestedChildrenItemsIncludingGroups"));
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v30;
LABEL_7:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v10), "aspectRatioLocked") & 1) != 0)
            goto LABEL_30;
          if (v8 == (id)++v10)
          {
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
            if (v8)
              goto LABEL_7;
            break;
          }
        }
      }

      if ((objc_msgSend(v5, "isFreehandDrawing") & 1) == 0)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupedChildren](self, "p_groupedChildren", 0));
        v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (!v11)
        {
LABEL_31:

          goto LABEL_32;
        }
        v12 = *(_QWORD *)v26;
LABEL_18:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v6);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "info"));
          objc_opt_class(CRLCounterRotateInfo, v16);
          isKindOfClass = objc_opt_isKindOfClass(v15, v17);

          if ((isKindOfClass & 1) != 0)
            break;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "info"));
          objc_opt_class(_TtC8Freeform12CRLGroupItem, v20);
          if ((objc_opt_isKindOfClass(v19, v21) & 1) != 0)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "info"));
            v23 = objc_msgSend(v22, "isFreehandDrawing");

            if ((v23 & 1) == 0 && !objc_msgSend(v14, "resizeMayChangeAspectRatio"))
              break;
          }
          else
          {

          }
          if (v11 == (id)++v13)
          {
            v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            if (v11)
              goto LABEL_18;
            goto LABEL_31;
          }
        }
LABEL_30:
        LOBYTE(v11) = 1;
        goto LABEL_31;
      }
      LOBYTE(v11) = 0;
    }
LABEL_32:
    v3 = v11 ^ 1;

    return v3;
  }
  return v2 == 1;
}

- (id)commandForSettingAspectRatioLocked:(BOOL)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  _TtC8Freeform15CRLCommandGroup *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_class *v23;
  id v24;
  void *v25;
  _TtC8Freeform15CRLCommandGroup *v26;
  unsigned int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  char *v34;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  uint8_t buf[4];
  unsigned int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  _BYTE v50[128];

  v41.receiver = self;
  v41.super_class = (Class)CRLGroupLayout;
  v5 = -[CRLCanvasLayout commandForSettingAspectRatioLocked:](&v41, "commandForSettingAspectRatioLocked:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  *(_QWORD *)&v8 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v7).n128_u64[0];
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info", v8));
  v12 = sub_100221D0C(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  -[CRLCommandGroup addCommand:](v14, "addCommand:", v6);
  if (!a3)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allNestedChildrenItemsIncludingGroups"));
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
    if (v16)
    {
      v18 = v16;
      v19 = (_BYTE *)&unk_1013D5000;
      v20 = *(_QWORD *)v38;
      v36 = v15;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v38 != v20)
            objc_enumerationMutation(v15);
          v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v21);
          if (v22 != v13)
          {
            objc_opt_class(_TtC8Freeform12CRLBoardItem, v17);
            v24 = sub_1002223BC(v23, v22);
            v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
            if (objc_msgSend(v25, "aspectRatioLocked"))
            {
              if ((objc_msgSend(v25, "canAspectRatioLockBeChangedByUser") & 1) == 0)
              {
                v26 = v14;
                v27 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_101247A28);
                v28 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109890;
                  v43 = v27;
                  v44 = 2082;
                  v45 = "-[CRLGroupLayout commandForSettingAspectRatioLocked:]";
                  v46 = 2082;
                  v47 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupLayout.m";
                  v48 = 1024;
                  v49 = 411;
                  _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Able to change aspect ratio of a group with children whose aspect ratio cannot be changed by the user!", buf, 0x22u);
                }
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_101247A48);
                v29 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                {
                  v33 = v29;
                  v34 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                  *(_DWORD *)buf = 67109378;
                  v43 = v27;
                  v44 = 2114;
                  v45 = v34;
                  _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

                }
                v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupLayout commandForSettingAspectRatioLocked:]"));
                v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupLayout.m"));
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 411, 0, "Able to change aspect ratio of a group with children whose aspect ratio cannot be changed by the user!");

                v14 = v26;
                v15 = v36;
                v19 = (char *)&unk_1013D5000;
              }
              v32 = objc_msgSend(objc_alloc((Class)(v19 + 2512)), "initWithBoardItem:aspectRatioLocked:", v25, 0);
              -[CRLCommandGroup addCommand:](v14, "addCommand:", v32);

            }
          }
          v21 = (char *)v21 + 1;
        }
        while (v18 != v21);
        v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      }
      while (v18);
    }

  }
  return v14;
}

- (BOOL)shouldSnapWhileResizing
{
  void *v3;
  double v4;
  double v5;
  BOOL v6;
  double v8;

  -[CRLCanvasAbstractLayout transformInRoot](self, "transformInRoot");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout pureGeometry](self, "pureGeometry"));
  objc_msgSend(v3, "size");
  v6 = sub_1000792C0(&v8, v4, v5);

  return v6;
}

- (void)takeSizeFromTracker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRLGroupLayout;
  -[CRLCanvasLayout takeSizeFromTracker:](&v20, "takeSizeFromTracker:", v4);
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  if (v4)
    objc_msgSend(v4, "transformForLayout:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalGeometry](self, "originalGeometry"));
  v16[0] = v17;
  v16[1] = v18;
  v16[2] = v19;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geometryByTransformingBy:", v16));

  -[CRLGroupLayout setDynamicGeometry:](self, "setDynamicGeometry:", v6);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupedChildren](self, "p_groupedChildren", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "takeSizeFromTracker:", v4);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v21, 16);
    }
    while (v9);
  }

  -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
  -[CRLCanvasLayout invalidateChildren](self, "invalidateChildren");

}

- (CGSize)minimumSize
{
  double v3;
  unsigned __int8 v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  void *i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  void *v28;
  double width;
  double height;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGAffineTransform v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  CGSize result;
  CGRect v46;
  CGRect v47;

  v3 = *(double *)((char *)&self->_boundsForStandardKnobs.size.width + 2);
  v38 = *(double *)((char *)&self->_boundsForStandardKnobs.origin.y + 2);
  v4 = -[CRLGroupLayout resizeMayChangeAspectRatio](self, "resizeMayChangeAspectRatio");
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupedChildren](self, "p_groupedChildren"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "minimumSize");
        v14 = v13;
        v16 = v15;
        if ((v4 & 1) == 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pureGeometry"));
          objc_msgSend(v17, "size");
          sub_100062BCC(v14, v16, v18, v19);

        }
        v20 = sub_10005FDDC();
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pureGeometry"));
        v28 = v27;
        if (v27)
          objc_msgSend(v27, "transform");
        else
          memset(&v39, 0, sizeof(v39));
        v46.origin.x = v20;
        v46.origin.y = v22;
        v46.size.width = v24;
        v46.size.height = v26;
        v47 = CGRectApplyAffineTransform(v46, &v39);
        width = v47.size.width;
        height = v47.size.height;

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pureGeometry"));
        objc_msgSend(v31, "frame");
        v33 = v32;
        v35 = v34;

        if (v33 > 1.0e-11)
          v10 = fmax(v10, width / v33);
        if (v35 > 1.0e-11)
          v9 = fmax(v9, height / v35);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
    v10 = 0.0;
  }

  v36 = v38 * v10;
  v37 = v3 * v9;
  result.height = v37;
  result.width = v36;
  return result;
}

- (void)takeFreeTransformFromTracker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRLGroupLayout;
  -[CRLCanvasLayout takeFreeTransformFromTracker:](&v20, "takeFreeTransformFromTracker:", v4);
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  if (v4)
    objc_msgSend(v4, "freeTransformForLayout:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalGeometry](self, "originalGeometry"));
  v16[0] = v17;
  v16[1] = v18;
  v16[2] = v19;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geometryByTransformingBy:", v16));

  -[CRLGroupLayout setDynamicGeometry:](self, "setDynamicGeometry:", v6);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupedChildren](self, "p_groupedChildren", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "takeFreeTransformFromTracker:", v4);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v21, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v4, "isResizing"))
  {
    -[CRLCanvasLayout invalidateFrame](self, "invalidateFrame");
    -[CRLCanvasLayout invalidateChildren](self, "invalidateChildren");
  }

}

- (void)endDynamicOperation
{
  objc_super v3;

  *(_DWORD *)((char *)&self->_cachedGroupedChildren + 6) = 0;
  -[CRLGroupLayout p_destroyDynamicCopies](self, "p_destroyDynamicCopies");
  v3.receiver = self;
  v3.super_class = (Class)CRLGroupLayout;
  -[CRLCanvasLayout endDynamicOperation](&v3, "endDynamicOperation");
}

- (void)i_clearInvalidationCache
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLGroupLayout;
  -[CRLCanvasLayout i_clearInvalidationCache](&v3, "i_clearInvalidationCache");
  BYTE2(self->_cachedGroupedChildren) = 0;
}

- (void)invalidate
{
  void *v3;
  void *v4;
  objc_super v5;

  if (!BYTE2(self->_cachedGroupedChildren))
  {
    BYTE2(self->_cachedGroupedChildren) = -[CRLCanvasLayout layoutState](self, "layoutState") != 0;
    v5.receiver = self;
    v5.super_class = (Class)CRLGroupLayout;
    -[CRLCanvasLayout invalidate](&v5, "invalidate");
    if (-[CRLCanvasLayout layoutState](self, "layoutState") != 2)
    {
      v3 = *(void **)((char *)&self->_boundsForStandardKnobs.size.height + 2);
      *(CGFloat *)((char *)&self->_boundsForStandardKnobs.size.height + 2) = 0.0;

      v4 = *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2);
      *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2) = 0;

    }
    -[CRLCanvasLayout invalidatePositionWithoutSideEffects](self, "invalidatePositionWithoutSideEffects");
    -[CRLCanvasLayout invalidateSizeWithoutSideEffects](self, "invalidateSizeWithoutSideEffects");
    -[CRLCanvasLayout invalidateCacheForMagnets](self, "invalidateCacheForMagnets");
  }
}

- (void)updateChildrenFromInfo
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLGroupLayout;
  -[CRLCanvasLayout updateChildrenFromInfo](&v4, "updateChildrenFromInfo");
  v3 = *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2);
  *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2) = 0;

}

- (BOOL)isDraggable
{
  return 1;
}

- (BOOL)shouldDisplayGuides
{
  void *v3;
  unsigned __int8 v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupItem](self, "p_groupItem"));
  v4 = objc_msgSend(v3, "isEffectivelyEmpty");

  if ((v4 & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)CRLGroupLayout;
  return -[CRLCanvasLayout shouldDisplayGuides](&v6, "shouldDisplayGuides");
}

- (BOOL)providesGuidesForChildLayouts
{
  return 1;
}

- (id)layoutsForProvidingGuidesForChildLayouts
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupedChildren](self, "p_groupedChildren"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "array"));

  return v3;
}

- (BOOL)allowsConnections
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "childInfos"));
  if (objc_msgSend(v3, "count"))
    v4 = 1;
  else
    v4 = objc_msgSend(v2, "isFreehandDrawing");

  return v4;
}

- (BOOL)supportsRotation
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        *(_QWORD *)&v9 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v4).n128_u64[0];
        v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "info", v9));
        v13 = sub_100221D0C(v11, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

        LODWORD(v12) = objc_msgSend(v14, "supportsParentRotation");
        if (!(_DWORD)v12)
        {
          v15 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v5)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_11:

  return v15;
}

- (BOOL)supportsFlipping
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "supportsParentFlipping"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)supportsParentFlipping
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];

  v14.receiver = self;
  v14.super_class = (Class)CRLGroupLayout;
  if (!-[CRLCanvasLayout supportsParentFlipping](&v14, "supportsParentFlipping"))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupedChildren](self, "p_groupedChildren", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "supportsParentFlipping"))
        {
          v8 = 0;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (id)commandToFlipWithOrientation:(int)a3
{
  uint64_t v5;
  CGFloat MidY;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat MidX;
  void *v15;
  void *v16;
  CGFloat a;
  CGFloat ty;
  void *v19;
  void *v20;
  void *v21;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v22;
  void *v23;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v24;
  __int128 v26;
  double v27;
  __int128 v28;
  __int128 v29;
  double v30;
  _OWORD v31[3];
  CGAffineTransform v32;
  __int128 v33;

  -[CRLGroupLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  if (a3)
  {
    MidY = CGRectGetMidY(*(CGRect *)&v5);
    v10 = MidY + MidY;
    v11 = 1.0;
    v12 = -1.0;
    v13 = 0.0;
  }
  else
  {
    MidX = CGRectGetMidX(*(CGRect *)&v5);
    v13 = MidX + MidX;
    v11 = -1.0;
    v12 = 1.0;
    v10 = 0.0;
  }
  v33 = 0uLL;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "transform");
  else
    memset(v31, 0, sizeof(v31));
  v27 = v11;
  v28 = v33;
  *(double *)&v29 = v12;
  *((double *)&v29 + 1) = v13;
  v30 = v10;
  sub_1000795C0(&v27, v31, &v32);
  a = v32.a;
  v33 = *(_OWORD *)&v32.b;
  v26 = *(_OWORD *)&v32.d;
  ty = v32.ty;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "geometry"));
  v27 = a;
  v28 = v33;
  v29 = v26;
  v30 = ty;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "geometryByAppendingTransform:", &v27));

  v22 = [_TtC8Freeform25CRLCommandSetInfoGeometry alloc];
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout boardItem](self, "boardItem"));
  v24 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:](v22, "initWithBoardItem:geometry:", v23, v21);

  return v24;
}

- (id)p_childWrapPathsFrom:(id)a3 inDescendents:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  __objc2_class_ro **p_info;
  void *i;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  id v27;
  uint64_t v29;
  id v30;
  id v31;
  _OWORD v33[3];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _OWORD v38[3];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableArray);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v40;
    p_info = &OBJC_METACLASS___CRLWPSearchReferenceAccessibility.info;
    v30 = v8;
    v31 = v6;
    v29 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        objc_opt_class(p_info + 101, v10);
        v17 = sub_100221D0C(v16, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        if (v18)
        {
          if (!objc_msgSend(v6, "containsObject:", v18))
            goto LABEL_25;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "i_wrapPath"));
          v20 = objc_msgSend(v19, "copy");

          if (v15)
            objc_msgSend(v15, "transform");
          else
            memset(v38, 0, sizeof(v38));
          objc_msgSend(v20, "transformUsingAffineTransform:", v38, v29, v30, v31);
          objc_msgSend(v7, "addObject:", v20);
        }
        else
        {
          if (!objc_msgSend(v15, "conformsToProtocol:", &OBJC_PROTOCOL___CRLCanvasWrappableParent))
            goto LABEL_25;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "children"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_childWrapPathsFrom:inDescendents:](self, "p_childWrapPathsFrom:inDescendents:", v21, v6));

          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v20 = v22;
          v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v24; j = (char *)j + 1)
              {
                if (*(_QWORD *)v35 != v25)
                  objc_enumerationMutation(v20);
                v27 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j), "copy", v29, v30, v31);
                if (v15)
                  objc_msgSend(v15, "transform");
                else
                  memset(v33, 0, sizeof(v33));
                objc_msgSend(v27, "transformUsingAffineTransform:", v33);
                objc_msgSend(v7, "addObject:", v27);

              }
              v24 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            }
            while (v24);
          }

          v8 = v30;
          v6 = v31;
          v12 = v29;
        }
        p_info = (__objc2_class_ro **)(&OBJC_METACLASS___CRLWPSearchReferenceAccessibility + 32);

LABEL_25:
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v11);
  }

  return v7;
}

- (id)computeWrapPath
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout descendentWrappables](self, "descendentWrappables"));
  v4 = objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 512, objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), (_QWORD)v14);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_childWrapPathsFrom:inDescendents:](self, "p_childWrapPathsFrom:inDescendents:", v10, v4));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath uniteBezierPaths:](CRLBezierPath, "uniteBezierPaths:", v11));
  return v12;
}

- (id)i_wrapPath
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;

  if (!*(_QWORD *)((char *)&self->_boundsForStandardKnobs.size.height + 2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
    if (objc_msgSend(v3, "count"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupItem](self, "p_groupItem"));
      v5 = objc_msgSend(v4, "isEffectivelyEmpty");

      if ((v5 & 1) == 0)
      {
        v6 = objc_claimAutoreleasedReturnValue(-[CRLGroupLayout computeWrapPath](self, "computeWrapPath"));
LABEL_7:
        v7 = *(void **)((char *)&self->_boundsForStandardKnobs.size.height + 2);
        *(_QWORD *)((char *)&self->_boundsForStandardKnobs.size.height + 2) = v6;

        return *(id *)((char *)&self->_boundsForStandardKnobs.size.height + 2);
      }
    }
    else
    {

    }
    -[CRLGroupLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
    v6 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:"));
    goto LABEL_7;
  }
  return *(id *)((char *)&self->_boundsForStandardKnobs.size.height + 2);
}

- (id)pathForClippingConnectionLines
{
  void *v3;
  void *v4;
  CRLBezierPath *v5;
  void *v6;

  v3 = *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2);
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout i_wrapPath](self, "i_wrapPath"));
    v5 = (CRLBezierPath *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath exteriorOfBezierPath:](CRLBezierPath, "exteriorOfBezierPath:", v4));
    v6 = *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2);
    *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2) = v5;

    v3 = *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2);
  }
  return v3;
}

- (CGRect)rectInRootForCalculatingActivityLineEndpoint
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v17;
  double v18;
  double v19;
  double v20;
  CGAffineTransform v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  -[CRLGroupLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometryInRoot](self, "geometryInRoot"));
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "transform");
  else
    memset(&v21, 0, sizeof(v21));
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  v23 = CGRectApplyAffineTransform(v22, &v21);
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;

  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)transferLayoutGeometryToInfo:(id)a3 withAdditionalTransform:(CGAffineTransform *)a4 assertIfInDocument:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  __int128 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  char *v19;
  char *v20;
  char *i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  objc_super v29;

  v5 = a5;
  v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CRLGroupLayout;
  v9 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v28.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v28.c = v9;
  *(_OWORD *)&v28.tx = *(_OWORD *)&a4->tx;
  -[CRLCanvasLayout transferLayoutGeometryToInfo:withAdditionalTransform:assertIfInDocument:](&v29, "transferLayoutGeometryToInfo:withAdditionalTransform:assertIfInDocument:", v8, &v28, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupItem](self, "p_groupItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "childItems"));

  objc_opt_class(_TtC8Freeform12CRLGroupItem, v12);
  v14 = sub_100221D0C(v13, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  memset(&v28, 0, sizeof(v28));
  -[CRLGroupLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v17 = -v16;
  -[CRLGroupLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  CGAffineTransformMakeTranslation(&v28, v17, -v18);
  v19 = (char *)objc_msgSend(v11, "count");
  if (v19)
  {
    v20 = v19;
    for (i = 0; i != v20; ++i)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout layoutController](self, "layoutController"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", i));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layoutForInfo:", v23));

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "childItems"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", i));
      v27 = v28;
      objc_msgSend(v24, "transferLayoutGeometryToInfo:withAdditionalTransform:assertIfInDocument:", v26, &v27, v5);

    }
  }

}

- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3
{
  _TtC8Freeform15CRLCommandGroup *v5;
  __int128 v6;
  __int128 v7;
  id v8;
  void *v9;
  __int128 v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _TtC8Freeform15CRLCommandGroup *v18;
  _TtC8Freeform15CRLCommandGroup *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v5 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  v6 = *(_OWORD *)((char *)&self->_boundsForStandardKnobs.origin.y + 2);
  v32 = *(_OWORD *)((char *)&self->_dynamicLayoutGeometry + 2);
  v33 = v6;
  *(CGPoint *)((char *)&self->_dynamicLayoutGeometry + 2) = CGPointZero;
  v31.receiver = self;
  v31.super_class = (Class)CRLGroupLayout;
  v7 = *(_OWORD *)&a3->c;
  v28 = *(_OWORD *)&a3->a;
  v29 = v7;
  v30 = *(_OWORD *)&a3->tx;
  v8 = -[CRLCanvasLayout commandToClampModelToLayoutSizeWithAdditionalTransform:](&v31, "commandToClampModelToLayoutSizeWithAdditionalTransform:", &v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v33;
  *(_OWORD *)((char *)&self->_dynamicLayoutGeometry + 2) = v32;
  *(_OWORD *)((char *)&self->_boundsForStandardKnobs.origin.y + 2) = v10;
  if (v9)
    -[CRLCommandGroup addCommand:](v5, "addCommand:", v9);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupLayout p_groupedChildren](self, "p_groupedChildren"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v23 = *(_OWORD *)&CGAffineTransformIdentity.a;
    v21 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v15);
        v28 = v23;
        v29 = v22;
        v30 = v21;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "commandToClampModelToLayoutSizeWithAdditionalTransform:", &v28, v21, v22, v23));
        if (v17)
          -[CRLCommandGroup addCommand:](v5, "addCommand:", v17);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v13);
  }

  if (-[CRLCommandGroup isEmpty](v5, "isEmpty"))
    v18 = 0;
  else
    v18 = v5;
  v19 = v18;

  return v19;
}

- (id)descendentWrappables
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_alloc((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___CRLCanvasWrappable))
          objc_msgSend(v5, "addObject:", v11);
        if (objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___CRLCanvasWrappableParent))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "descendentWrappables"));
          objc_msgSend(v5, "addObjectsFromArray:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)descendentWrappablesContainsWrappable:(id)a3
{
  id v4;
  CRLGroupLayout *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  unsigned __int8 v19;

  v4 = a3;
  v5 = (CRLGroupLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parent"));

  if (v5 == self)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class(CRLCanvasLayout, v6);
    v8 = sub_100221D0C(v7, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout childLayoutContainingPossibleDescendentLayout:](self, "childLayoutContainingPossibleDescendentLayout:", v9));
    v17 = sub_100221DDC(v10, 1, v11, v12, v13, v14, v15, v16, (uint64_t)&OBJC_PROTOCOL___CRLCanvasWrappableParent);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    if (v18)
      v19 = objc_msgSend(v18, "descendentWrappablesContainsWrappable:", v4);
    else
      v19 = 0;

  }
  return v19;
}

- (void)p_createDynamicCopies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CRLCanvasInfoGeometry *v7;
  void *v8;

  if (*(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247A68);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E11454();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247A88);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupLayout p_createDynamicCopies]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 773, 0, "expected nil value for '%{public}s'", "_dynamicLayoutGeometry");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout geometry](self, "geometry"));
  v7 = (CRLCanvasInfoGeometry *)objc_msgSend(v6, "copy");
  v8 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2) = v7;

}

- (void)setDynamicGeometry:(id)a3
{
  id v4;
  CRLCanvasInfoGeometry *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLGroupLayout;
  v4 = a3;
  -[CRLCanvasLayout setDynamicGeometry:](&v7, "setDynamicGeometry:", v4);
  v5 = (CRLCanvasInfoGeometry *)objc_msgSend(v4, "copy", v7.receiver, v7.super_class);

  v6 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2) = v5;

}

- (void)p_destroyDynamicCopies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247AA8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E114F4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247AC8);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupLayout p_destroyDynamicCopies]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupLayout.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 783, 0, "invalid nil value for '%{public}s'", "_dynamicLayoutGeometry");

    v3 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
  }
  *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2) = 0;

}

- (id)p_groupedChildren
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout children](self, "children"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v2));

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_cachedPathForClippingConnectionLines + 2), 0);
  objc_storeStrong((id *)((char *)&self->_cachedWrapPath + 2), 0);
  objc_storeStrong((id *)((char *)&self->_boundsForStandardKnobs.size.height + 2), 0);
  objc_storeStrong((id *)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2), 0);
}

@end
