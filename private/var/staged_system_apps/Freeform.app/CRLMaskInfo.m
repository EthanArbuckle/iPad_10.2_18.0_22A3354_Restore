@implementation CRLMaskInfo

- (CRLMaskInfo)initWithImageItem:(id)a3 geometry:(id)a4 pathSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRLMaskInfo *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CRLMaskInfo;
  v11 = -[CRLMaskInfo init](&v22, "init");
  if (v11)
  {
    if (v10)
    {
      if (v9)
        goto LABEL_4;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012417E0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E07958();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241800);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskInfo initWithImageItem:geometry:pathSource:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskInfo.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 31, 0, "invalid nil value for '%{public}s'", "pathSource");

      if (v9)
      {
LABEL_4:
        if (v8)
        {
LABEL_33:
          -[CRLMaskInfo setGeometry:](v11, "setGeometry:", v9);
          -[CRLMaskInfo setParentInfo:](v11, "setParentInfo:", v8);
          -[CRLMaskInfo setPathSource:](v11, "setPathSource:", v10);
          goto LABEL_34;
        }
LABEL_24:
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101241860);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E07840();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101241880);
        v18 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskInfo initWithImageItem:geometry:pathSource:]"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskInfo.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 33, 0, "invalid nil value for '%{public}s'", "imageItem");

        goto LABEL_33;
      }
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241820);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E078CC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241840);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskInfo initWithImageItem:geometry:pathSource:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskInfo.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 32, 0, "invalid nil value for '%{public}s'", "geometry");

    if (v8)
      goto LABEL_33;
    goto LABEL_24;
  }
LABEL_34:

  return v11;
}

- (_TtC8Freeform12CRLImageItem)parentImageItem
{
  objc_class *v3;
  objc_class *v4;
  id WeakRetained;
  id v6;
  void *v7;

  objc_opt_class(_TtC8Freeform12CRLImageItem, a2);
  v4 = v3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentInfo);
  v6 = sub_1002223BC(v4, WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (_TtC8Freeform12CRLImageItem *)v7;
}

- (BOOL)isEqualToMaskInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskInfo geometry](self, "geometry"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geometry"));
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskInfo pathSource](self, "pathSource"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bezierPath"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathSource"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bezierPath"));
      v11 = objc_msgSend(v8, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class(CRLMaskInfo, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskInfo parentInfo](self, "parentInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parentInfo"));
  if (v9 == v10)
    v11 = -[CRLMaskInfo isEqualToMaskInfo:](self, "isEqualToMaskInfo:", v8);
  else
    v11 = 0;

  return v11;
}

- (BOOL)isSupported
{
  return 1;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(CRLMaskLayout, a2);
}

- (Class)repClass
{
  return 0;
}

- (Class)editorClass
{
  return (Class)objc_opt_class(CRLBoardItemEditor, a2);
}

- (BOOL)isSelectable
{
  return 0;
}

- (void)setGeometry:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  Class v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  CRLCanvasInfoGeometry *v15;
  CRLCanvasInfoGeometry *geometry;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v25;
  uint64_t v26;
  Class v27;
  NSString *v28;
  void *v29;
  uint8_t buf[4];
  unsigned int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;

  v4 = a3;
  if ((objc_msgSend(v4, "allValuesValidNumbers") & 1) == 0)
  {
    v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012418A0);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      v25 = v6;
      objc_opt_class(self, v26);
      v28 = NSStringFromClass(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      *(_DWORD *)buf = 67110402;
      v31 = v5;
      v32 = 2082;
      v33 = "-[CRLMaskInfo setGeometry:]";
      v34 = 2082;
      v35 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskInfo.m";
      v36 = 1024;
      v37 = 89;
      v38 = 2114;
      v39 = v29;
      v40 = 2112;
      v41 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Attempting to set geometry with invalid properties on %{public}@! %@", buf, 0x36u);

    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012418C0);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskInfo setGeometry:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskInfo.m"));
    objc_opt_class(self, v10);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 89, 0, "Attempting to set geometry with invalid properties on %{public}@! %@", v13, v4);

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geometryWithValidNumbers"));
    v4 = (id)v14;
  }
  if ((objc_msgSend(v4, "isEqual:", self->_geometry) & 1) == 0)
  {
    v15 = (CRLCanvasInfoGeometry *)objc_msgSend(v4, "copy");
    geometry = self->_geometry;
    self->_geometry = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskInfo geometry](self, "geometry"));
    objc_msgSend(v17, "size");
    v19 = v18;
    v21 = v20;

    -[CRLPathSource naturalSize](self->_pathSource, "naturalSize");
    if (v23 != v19 || v22 != v21)
      -[CRLPathSource setNaturalSize:](self->_pathSource, "setNaturalSize:", v19, v21);
  }

}

- (void)setPathSource:(id)a3
{
  CRLPathSource *v4;
  void *v5;
  void *v6;
  void *v7;
  CRLPathSource *v8;
  CRLPathSource *pathSource;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  BOOL v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *v23;
  void *v24;
  void *v25;
  NSString *v26;
  void *v27;
  CRLPathSource *v28;
  NSObject *v29;
  NSString *v30;
  void *v31;
  void *v32;
  NSString *v33;
  void *v34;
  uint8_t buf[4];
  unsigned int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  CGSize v47;
  CGSize v48;
  CGSize v49;
  CGSize v50;

  v4 = (CRLPathSource *)a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012418E0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E079E4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241900);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskInfo setPathSource:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskInfo.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 104, 0, "invalid nil value for '%{public}s'", "newPathSource");

  }
  if (self->_pathSource != v4)
  {
    v8 = (CRLPathSource *)-[CRLPathSource copy](v4, "copy");
    pathSource = self->_pathSource;
    self->_pathSource = v8;

    -[CRLPathSource naturalSize](self->_pathSource, "naturalSize");
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskInfo geometry](self, "geometry"));
    objc_msgSend(v14, "size");
    v17 = sub_10005FDF0(v11, v13, v15, v16);

    if (!v17)
    {
      v18 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241920);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        v28 = self->_pathSource;
        v29 = v19;
        -[CRLPathSource naturalSize](v28, "naturalSize");
        v30 = NSStringFromCGSize(v49);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskInfo geometry](self, "geometry"));
        objc_msgSend(v32, "size");
        v33 = NSStringFromCGSize(v50);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        *(_DWORD *)buf = 67110402;
        v36 = v18;
        v37 = 2082;
        v38 = "-[CRLMaskInfo setPathSource:]";
        v39 = 2082;
        v40 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskInfo.m";
        v41 = 1024;
        v42 = 110;
        v43 = 2114;
        v44 = v31;
        v45 = 2114;
        v46 = v34;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Path source set on mask info that doesn't have a natural size that aligns with the mask's info geometry! Path Source Size: %{public}@ Geometry Size: %{public}@", buf, 0x36u);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241940);
      v20 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMaskInfo setPathSource:]"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMaskInfo.m"));
      -[CRLPathSource naturalSize](self->_pathSource, "naturalSize");
      v23 = NSStringFromCGSize(v47);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMaskInfo geometry](self, "geometry"));
      objc_msgSend(v25, "size");
      v26 = NSStringFromCGSize(v48);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 110, 0, "Path source set on mask info that doesn't have a natural size that aligns with the mask's info geometry! Path Source Size: %{public}@ Geometry Size: %{public}@", v24, v27);

    }
  }

}

- (CRLPathSource)pathSource
{
  return self->_pathSource;
}

- (CRLCanvasInfoGeometry)geometry
{
  return self->_geometry;
}

- (CRLCanvasElementInfo)parentInfo
{
  return (CRLCanvasElementInfo *)objc_loadWeakRetained((id *)&self->_parentInfo);
}

- (void)setParentInfo:(id)a3
{
  objc_storeWeak((id *)&self->_parentInfo, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentInfo);
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_pathSource, 0);
}

@end
