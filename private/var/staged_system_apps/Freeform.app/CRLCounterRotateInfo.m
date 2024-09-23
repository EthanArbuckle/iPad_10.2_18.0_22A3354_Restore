@implementation CRLCounterRotateInfo

- (CRLCounterRotateInfo)initWithChildInfo:(id)a3 parentGroup:(id)a4 counterTransform:(CGAffineTransform *)a5
{
  id v8;
  id v9;
  CRLCounterRotateInfo *v10;
  CRLCounterRotateInfo *v11;
  __int128 v12;
  _OWORD v14[3];
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CRLCounterRotateInfo;
  v10 = -[CRLCounterRotateInfo init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_childInfo, v8);
    objc_storeWeak((id *)&v11->_parentGroup, v9);
    v12 = *(_OWORD *)&a5->c;
    v14[0] = *(_OWORD *)&a5->a;
    v14[1] = v12;
    v14[2] = *(_OWORD *)&a5->tx;
    -[CRLCounterRotateInfo setCounterTransform:](v11, "setCounterTransform:", v14);
  }

  return v11;
}

+ (id)infoGeometryForTransformInRoot:(CGAffineTransform *)a3 isChildFlipped:(BOOL)a4
{
  _BOOL8 v4;
  __int128 v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v4 = a4;
  v12 = 0u;
  v13 = 0u;
  v6 = *(_OWORD *)&a3->c;
  v8 = *(_OWORD *)&a3->a;
  v9 = v6;
  v10 = *(_OWORD *)&a3->tx;
  v11 = 0u;
  objc_msgSend(a1, "counterTransformForTransformInRoot:", &v8);
  v8 = v11;
  v9 = v12;
  v10 = v13;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_infoGeometryForCounterTransform:isChildFlipped:", &v8, v4));
}

+ (id)p_infoGeometryForCounterTransform:(CGAffineTransform *)a3 isChildFlipped:(BOOL)a4
{
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v5 = *(_OWORD *)&a3->c;
  v9 = *(_OWORD *)&a3->a;
  v10 = v5;
  v11 = *(_OWORD *)&a3->tx;
  v6 = sub_100079210((double *)&v9) ^ a4;
  v7 = *(_OWORD *)&a3->c;
  v9 = *(_OWORD *)&a3->a;
  v10 = v7;
  v11 = *(_OWORD *)&a3->tx;
  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 1, v6, 0, CGPointZero.x, CGPointZero.y, 10.0, 10.0, -sub_1000791B0(&v9));
}

+ (CGAffineTransform)counterTransformForTransformInRoot:(SEL)a3
{
  __int128 v4;
  CGAffineTransform v6;

  v4 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v6.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v6.c = v4;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  v6.tx = 0.0;
  v6.ty = 0.0;
  return CGAffineTransformInvert(retstr, &v6);
}

+ (id)infoGeometryInRootIncludingCounterRotateIfNeededForBoardItem:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  __int128 v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v37;
  _OWORD v38[3];
  _OWORD v39[3];
  _QWORD v40[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geometry"));
  v6 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentInfo"));
  v8 = sub_100221D0C(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (objc_msgSend(v3, "wantsCounterRotationWhenNotSupportingParentRotationInRotatedParent"))
  {
    if ((objc_msgSend(v3, "supportsParentRotation") & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containingGroup"));

      if (v10)
      {
        v41 = 0;
        v42 = &v41;
        v43 = 0x5010000000;
        v44 = &unk_1010E66AB;
        v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
        v45 = *(_OWORD *)&CGAffineTransformIdentity.a;
        v46 = v11;
        v47 = *(_OWORD *)&CGAffineTransformIdentity.tx;
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_1000F1830;
        v40[3] = &unk_1012374B0;
        v40[4] = &v41;
        objc_msgSend(v9, "withTemporaryLayoutPerform:", v40);
        if (v9)
          objc_msgSend(v9, "transformInRoot");
        else
          memset(v39, 0, sizeof(v39));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geometry"));
        v13 = v12;
        if (v12)
          objc_msgSend(v12, "transform");
        else
          memset(v38, 0, sizeof(v38));
        v14 = +[CRLCounterRotateInfo infoGeometryForTransformInRoot:isChildFlipped:](CRLCounterRotateInfo, "infoGeometryForTransformInRoot:isChildFlipped:", v39, sub_100079210((double *)v38));
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

        memset(&v37, 0, sizeof(v37));
        if (v15)
          objc_msgSend(v15, "transform");
        else
          memset(&t1, 0, sizeof(t1));
        v16 = *((_OWORD *)v42 + 3);
        *(_OWORD *)&t2.a = *((_OWORD *)v42 + 2);
        *(_OWORD *)&t2.c = v16;
        *(_OWORD *)&t2.tx = *((_OWORD *)v42 + 4);
        CGAffineTransformConcat(&v37, &t1, &t2);
        memset(&t2, 0, sizeof(t2));
        if (v4)
          objc_msgSend(v4, "fullTransform");
        else
          memset(&v34, 0, sizeof(v34));
        v33 = v37;
        CGAffineTransformConcat(&t2, &v34, &v33);
        v17 = objc_msgSend(v4, "widthValid");
        v18 = objc_msgSend(v4, "heightValid");
        v33 = t2;
        v19 = objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:widthValid:heightValid:](CRLCanvasInfoGeometry, "geometryFromFullTransform:widthValid:heightValid:", &v33, v17, v18));

        v21 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parentInfo"));
        v23 = sub_100221D0C(v21, v22);
        v24 = objc_claimAutoreleasedReturnValue(v23);

        _Block_object_dispose(&v41, 8);
        v9 = (void *)v24;
        v4 = (void *)v19;
      }
    }
  }
  if (v9)
  {
    do
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geometry"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geometryWithParentGeometry:", v25));

      v28 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parentInfo"));
      v30 = sub_100221D0C(v28, v29);
      v31 = objc_claimAutoreleasedReturnValue(v30);

      v4 = v26;
      v9 = (void *)v31;
    }
    while (v31);
  }
  else
  {
    v26 = v4;
  }

  return v26;
}

- (void)setCounterTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  _BOOL8 v11;
  __int128 v12;
  void *v13;
  _OWORD v14[3];
  _OWORD v15[3];

  v5 = *(_OWORD *)&a3->a;
  v6 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_counterTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_counterTransform.tx = v6;
  *(_OWORD *)&self->_counterTransform.a = v5;
  v7 = (void *)objc_opt_class(self, a2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_childInfo);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "geometry"));
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "transform");
  else
    memset(v15, 0, sizeof(v15));
  v11 = sub_100079210((double *)v15);
  v12 = *(_OWORD *)&a3->c;
  v14[0] = *(_OWORD *)&a3->a;
  v14[1] = v12;
  v14[2] = *(_OWORD *)&a3->tx;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "p_infoGeometryForCounterTransform:isChildFlipped:", v14, v11));
  -[CRLCounterRotateInfo setGeometry:](self, "setGeometry:", v13);

}

- (CRLCanvasElementInfo)parentInfo
{
  return (CRLCanvasElementInfo *)objc_loadWeakRetained((id *)&self->_parentGroup);
}

- (void)setParentInfo:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  CKRecordID v18;
  Swift::String v19;
  id v20;

  v20 = a3;
  v5 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v4);
  v6 = sub_100221D0C(v5, v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v20 && !v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012374D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF9AE8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012374F0);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v8);
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Must provide a group info or nil as parent of a counter rotate info!", v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[CRLCounterRotateInfo setParentInfo:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateInfo setParentInfo:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateInfo.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 108, 1, "Must provide a group info or nil as parent of a counter rotate info!");

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v18, v19);
    abort();
  }
  objc_storeWeak((id *)&self->_parentGroup, v7);

}

- (BOOL)isSelectable
{
  return 0;
}

- (void)clearBackPointerToParentInfoIfNeeded:(id)a3
{
  _TtC8Freeform12CRLGroupItem **p_parentGroup;
  id v4;
  id WeakRetained;

  p_parentGroup = &self->_parentGroup;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_parentGroup);

  if (WeakRetained == v4)
    objc_storeWeak((id *)p_parentGroup, 0);
}

- (BOOL)isSupported
{
  return 1;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(CRLCounterRotateLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(CRLCounterRotateRep, a2);
}

- (Class)editorClass
{
  void *v2;
  void *v3;
  void *v4;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101237510);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DF9B68();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101237530);
  v2 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE87A4(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateInfo editorClass]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateInfo.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 135, 0, "We don't expect this to be called");

  return 0;
}

- (NSArray)childInfos
{
  id WeakRetained;
  void *v3;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_childInfo);
  v5 = WeakRetained;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return (NSArray *)v3;
}

- (id)infoForSelectionPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101237550);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DF9BE8();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101237570);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE87A4(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCounterRotateInfo infoForSelectionPath:]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLCounterRotateInfo.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 146, 0, "We don't expect this to be called");

  return 0;
}

- (CRLCanvasInfoGeometry)geometry
{
  return self->_geometry;
}

- (void)setGeometry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_TtC8Freeform12CRLGroupItem)parentGroup
{
  return (_TtC8Freeform12CRLGroupItem *)objc_loadWeakRetained((id *)&self->_parentGroup);
}

- (_TtC8Freeform12CRLBoardItem)childInfo
{
  return (_TtC8Freeform12CRLBoardItem *)objc_loadWeakRetained((id *)&self->_childInfo);
}

- (CGAffineTransform)counterTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].c;
  return self;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_childInfo);
  objc_destroyWeak((id *)&self->_parentGroup);
  objc_storeStrong((id *)&self->_geometry, 0);
}

@end
