@implementation CRLiOSScribbleInteractionDelegate

- (CRLiOSScribbleInteractionDelegate)initWithEditingProvider:(id)a3 scribbleInteractionObserver:(id)a4
{
  id v6;
  id v7;
  CRLiOSScribbleInteractionDelegate *v8;
  CRLiOSScribbleInteractionDelegate *v9;
  uint64_t v10;
  NSUUID *rootIdentifier;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CRLiOSScribbleInteractionDelegate;
  v8 = -[CRLiOSScribbleInteractionDelegate init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_editingProvider, v6);
    v10 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    rootIdentifier = v9->_rootIdentifier;
    v9->_rootIdentifier = (NSUUID *)v10;

    objc_storeWeak((id *)&v9->_scribbleObserver, v7);
  }

  return v9;
}

- (void)indirectScribbleInteraction:(id)a3 focusElementIfNeeded:(id)a4 referencePoint:(CGPoint)a5 completion:(id)a6
{
  double y;
  double x;
  id v12;
  id v13;
  void (**v14)(id, void *);
  void *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void (**v32)(_QWORD, _QWORD, double, double);
  void *v33;
  void *v34;
  void *v35;
  void (**v36)(double, double);
  void *v37;
  void *v38;
  NSObject *v39;
  NSString *v40;
  void *v41;
  NSString *v42;
  void *v43;
  uint64_t v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  CGPoint v51;

  y = a5.y;
  x = a5.x;
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, void *))a6;
  if (qword_10147E610 != -1)
    dispatch_once(&qword_10147E610, &stru_10125DCE0);
  v15 = &unk_1013DC000;
  v16 = off_1013DC538;
  if (os_log_type_enabled((os_log_t)off_1013DC538, OS_LOG_TYPE_DEBUG))
  {
    v39 = v16;
    v40 = NSStringFromSelector(a2);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v51.x = x;
    v51.y = y;
    v42 = NSStringFromCGPoint(v51);
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    *(_DWORD *)buf = 138543874;
    v46 = v41;
    v47 = 2114;
    v48 = v13;
    v49 = 2114;
    v50 = v43;
    _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%{public}@\n %{public}@, focusReferencePoint: %{public}@", buf, 0x20u);

  }
  objc_opt_class(NSUUID, v17);
  v19 = sub_1002223BC(v18, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate p_absoluteScribbleCapableElementWithIdentifier:](self, "p_absoluteScribbleCapableElementWithIdentifier:", v20));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate rootIdentifier](self, "rootIdentifier"));

  if (v20 != v22)
  {
    if (v21)
      goto LABEL_22;
    goto LABEL_13;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate p_insertedScribbleElementProvider](self, "p_insertedScribbleElementProvider"));
  if (objc_msgSend(v23, "canInsertScribbleElementAtPoint:", x, y))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "insertedScribbleElementAtPoint:", x, y));
    v25 = v24;
    if (v24)
    {
      v26 = v24;

      v21 = v26;
      v15 = &unk_1013DC000;
    }

  }
  if (!v21)
  {
LABEL_13:
    LODWORD(v44) = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125DD00);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E342D8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125DD20);
    v27 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSScribbleInteractionDelegate indirectScribbleInteraction:focusElementIfNeeded:referencePoint:completion:]"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSScribbleInteractionDelegate.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 67, 0, "invalid nil value for '%{public}s'", "scribbleElement", v44);

    v15 = &unk_1013DC000;
  }
LABEL_22:
  if (qword_10147E610 != -1)
    dispatch_once(&qword_10147E610, &stru_10125DD40);
  v30 = *((_QWORD *)v15 + 167);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    sub_100E34264((uint64_t)v21, v30);
  if ((objc_msgSend(v21, "scribbleElementIsFocused") & 1) == 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "scribbleEditingBlock"));

    if (v31)
    {
      v32 = (void (**)(_QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "scribbleEditingBlock"));
      v32[2](v32, 0, x, y);

    }
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "scribbleIdentifier"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate p_currentEditingTextInputResponderForElementIdentifer:](self, "p_currentEditingTextInputResponderForElementIdentifer:", v33));

  if (v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "prepareForScribbleBlock"));

    if (!v35)
      goto LABEL_42;
    v36 = (void (**)(double, double))objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "prepareForScribbleBlock"));
    v36[2](x, y);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125DD60);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E341C4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125DD80);
    v37 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v37);
    v36 = (void (**)(double, double))objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSScribbleInteractionDelegate indirectScribbleInteraction:focusElementIfNeeded:referencePoint:completion:]"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSScribbleInteractionDelegate.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v36, v38, 78, 0, "invalid nil value for '%{public}s'", "inputResponder");

  }
LABEL_42:
  if (v14)
    v14[2](v14, v34);

}

- (BOOL)indirectScribbleInteraction:(id)a3 shouldDelayFocusForElement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  NSObject *v13;
  NSString *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  __CFString *v23;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate rootIdentifier](self, "rootIdentifier"));

  if (v7 == v6)
  {
    v10 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate p_absoluteScribbleCapableElementWithIdentifier:](self, "p_absoluteScribbleCapableElementWithIdentifier:", v6));
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "shouldDelayScribbleFocus");
    else
      v10 = 0;

  }
  if (qword_10147E610 != -1)
    dispatch_once(&qword_10147E610, &stru_10125DDA0);
  v11 = off_1013DC538;
  if (os_log_type_enabled((os_log_t)off_1013DC538, OS_LOG_TYPE_DEBUG))
  {
    v13 = v11;
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = CFSTR("NO");
    if (v10)
      v16 = CFSTR("YES");
    v17 = v16;
    v18 = 138543874;
    v19 = v15;
    v20 = 2114;
    v21 = v6;
    v22 = 2114;
    v23 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@\n %{public}@ -> %{public}@", (uint8_t *)&v18, 0x20u);

  }
  return v10;
}

- (void)indirectScribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(void);
  void *v12;
  id v13;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleObserver);
  objc_msgSend(WeakRetained, "willBeginScribbleWithDelegate:", self);

  if (qword_10147E610 != -1)
    dispatch_once(&qword_10147E610, &stru_10125DDC0);
  v7 = off_1013DC538;
  if (os_log_type_enabled((os_log_t)off_1013DC538, OS_LOG_TYPE_DEBUG))
    sub_100E34378(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate p_absoluteScribbleCapableElementWithIdentifier:](self, "p_absoluteScribbleCapableElementWithIdentifier:", v5));
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "willBeginWritingBlock"));

    if (v10)
    {
      v11 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "willBeginWritingBlock"));
      v11[2]();

    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate editingProvider](self, "editingProvider"));
  v13 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate rootIdentifier](self, "rootIdentifier"));
  objc_msgSend(v12, "scribbleInteractionWillBeginWritingScribbleElementWillBeInserted:", v13 == v5);

}

- (BOOL)p_isElementFocused:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate p_absoluteScribbleCapableElementWithIdentifier:](self, "p_absoluteScribbleCapableElementWithIdentifier:", a3));
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "scribbleElementIsFocused");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate editingProvider](self, "editingProvider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentEditingTextInputResponder"));

    if (v6 && !v8)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125DDE0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E34400();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125DE00);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSScribbleInteractionDelegate p_isElementFocused:]"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSScribbleInteractionDelegate.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 125, 0, "Element says it is focused but we have no editing TIR");

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)indirectScribbleInteraction:(id)a3 isElementFocused:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v10;
  NSString *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  __CFString *v20;

  v6 = a4;
  v7 = -[CRLiOSScribbleInteractionDelegate p_isElementFocused:](self, "p_isElementFocused:", v6);
  if (qword_10147E610 != -1)
    dispatch_once(&qword_10147E610, &stru_10125DE20);
  v8 = off_1013DC538;
  if (os_log_type_enabled((os_log_t)off_1013DC538, OS_LOG_TYPE_DEBUG))
  {
    v10 = v8;
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = CFSTR("NO");
    if (v7)
      v13 = CFSTR("YES");
    v14 = v13;
    v15 = 138543874;
    v16 = v12;
    v17 = 2114;
    v18 = v6;
    v19 = 2114;
    v20 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@\n %{public}@ -> %{public}@", (uint8_t *)&v15, 0x20u);

  }
  return v7;
}

- (CGRect)indirectScribbleInteraction:(id)a3 frameForElement:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat x;
  double v22;
  CGFloat y;
  double v24;
  CGFloat width;
  double v26;
  CGFloat height;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSObject *v34;
  NSString *v35;
  void *v36;
  NSString *v37;
  void *v38;
  int v39;
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  CGRect v45;
  CGRect result;

  v7 = a3;
  v8 = a4;
  objc_opt_class(NSUUID, v9);
  v11 = sub_1002223BC(v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate rootIdentifier](self, "rootIdentifier"));

  if (v12 == v13)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    objc_msgSend(v19, "bounds");
    x = v20;
    y = v22;
    width = v24;
    height = v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate p_insertedScribbleElementProvider](self, "p_insertedScribbleElementProvider"));
    v14 = v28;
    if (!v28)
      goto LABEL_8;
    objc_msgSend(v28, "rectForInsertingScribbleElements");
    goto LABEL_6;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate p_absoluteScribbleCapableElementWithIdentifier:](self, "p_absoluteScribbleCapableElementWithIdentifier:", v8));
  if (v14)
  {
    -[CRLiOSScribbleInteractionDelegate p_expandedScribbleFrameForElement:](self, "p_expandedScribbleFrameForElement:", v14);
LABEL_6:
    x = v15;
    y = v16;
    width = v17;
    height = v18;
    goto LABEL_8;
  }
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
LABEL_8:

  if (qword_10147E610 != -1)
    dispatch_once(&qword_10147E610, &stru_10125DE40);
  v29 = off_1013DC538;
  if (os_log_type_enabled((os_log_t)off_1013DC538, OS_LOG_TYPE_DEBUG))
  {
    v34 = v29;
    v35 = NSStringFromSelector(a2);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    v37 = NSStringFromCGRect(v45);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = 138543874;
    v40 = v36;
    v41 = 2114;
    v42 = v8;
    v43 = 2114;
    v44 = v38;
    _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%{public}@\n %{public}@ -> %{public}@", (uint8_t *)&v39, 0x20u);

  }
  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)indirectScribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  double height;
  double width;
  CGFloat y;
  double x;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSString *v25;
  void *v26;
  NSString *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  CGRect v35;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v13 = (void (**)(id, void *))a5;
  if (width < 300.0 || height < 300.0)
  {
    if (qword_10147E610 != -1)
      dispatch_once(&qword_10147E610, &stru_10125DE60);
    v14 = off_1013DC538;
    if (os_log_type_enabled((os_log_t)off_1013DC538, OS_LOG_TYPE_DEBUG))
      sub_100E3449C(v14, a2, x, y, width, height);
    v15 = sub_100061400(x, y, width, height);
    v17 = v16;
    v18 = sub_100060C18(width, height, 300.0);
    x = sub_10005FD98(v15, v17, v18);
    y = v19;
    width = v20;
    height = v21;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate p_scribbleElementIdentifiersInRect:](self, "p_scribbleElementIdentifiersInRect:", x, y, width, height));
  v13[2](v13, v22);
  if (qword_10147E610 != -1)
    dispatch_once(&qword_10147E610, &stru_10125DE80);
  v23 = off_1013DC538;
  if (os_log_type_enabled((os_log_t)off_1013DC538, OS_LOG_TYPE_DEBUG))
  {
    v24 = v23;
    v25 = NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    v27 = NSStringFromCGRect(v35);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = 138543874;
    v30 = v26;
    v31 = 2114;
    v32 = v28;
    v33 = 2114;
    v34 = v22;
    _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}@\n %{public}@ -> %{public}@", (uint8_t *)&v29, 0x20u);

  }
}

- (void)indirectScribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scribbleObserver);
  objc_msgSend(WeakRetained, "didFinishScribbleWithDelegate:", self);

  if (qword_10147E610 != -1)
    dispatch_once(&qword_10147E610, &stru_10125DEA0);
  v7 = off_1013DC538;
  if (os_log_type_enabled((os_log_t)off_1013DC538, OS_LOG_TYPE_DEBUG))
    sub_100E34378(v7);
  objc_opt_class(NSUUID, v8);
  v10 = sub_1002223BC(v9, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate p_absoluteScribbleCapableElementWithIdentifier:](self, "p_absoluteScribbleCapableElementWithIdentifier:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate rootIdentifier](self, "rootIdentifier"));

  if (v11 == v13 || v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate editingProvider](self, "editingProvider"));
    objc_msgSend(v14, "scribbleInteractionDidFinishWriting");

  }
}

- (BOOL)_indirectScribbleInteractionShouldDisableInputAssistant:(id)a3
{
  void *v3;
  char v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate editingProvider](self, "editingProvider", a3));
  v4 = objc_msgSend(v3, "wantsSystemInputAssistantForScribble") ^ 1;

  return v4;
}

- (BOOL)scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  unsigned int v8;
  void *v9;
  NSObject *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  __CFString *v23;
  CGPoint v24;

  y = a4.y;
  x = a4.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate editingProvider](self, "editingProvider", a3));
  v8 = objc_msgSend(v7, "shouldBeginScribblingAtPoint:", x, y);

  if (qword_10147E610 != -1)
    dispatch_once(&qword_10147E610, &stru_10125DEC0);
  v9 = off_1013DC538;
  if (os_log_type_enabled((os_log_t)off_1013DC538, OS_LOG_TYPE_DEBUG))
  {
    v11 = v9;
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v24.x = x;
    v24.y = y;
    v14 = NSStringFromCGPoint(v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = CFSTR("NO");
    if (v8)
      v16 = CFSTR("YES");
    v17 = v16;
    v18 = 138543874;
    v19 = v13;
    v20 = 2114;
    v21 = v15;
    v22 = 2114;
    v23 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@\n %{public}@ -> %{public}@", (uint8_t *)&v18, 0x20u);

  }
  return v8;
}

- (BOOL)_scribbleInteractionShouldDisableInputAssistant:(id)a3
{
  void *v3;
  char v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate editingProvider](self, "editingProvider", a3));
  v4 = objc_msgSend(v3, "wantsSystemInputAssistantForScribble") ^ 1;

  return v4;
}

- (id)p_currentEditingTextInputResponderForElementIdentifer:(id)a3
{
  void *v4;
  void *v5;

  if (-[CRLiOSScribbleInteractionDelegate p_isElementFocused:](self, "p_isElementFocused:", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate editingProvider](self, "editingProvider"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentEditingTextInputResponder"));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)p_insertedScribbleElementProvider
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate editingProvider](self, "editingProvider"));
  v9 = sub_100221DDC(v2, 1, v3, v4, v5, v6, v7, v8, (uint64_t)&OBJC_PROTOCOL___CRLiOSScribbleInteractionInsertedScribbleElementProvider);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (id)p_containedScribbleElementForContainerScribbleElement:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate editingProvider](self, "editingProvider"));
  v6 = objc_opt_respondsToSelector(v5, "containedScribbleElementForContainerScribbleElement:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate editingProvider](self, "editingProvider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "containedScribbleElementForContainerScribbleElement:", v4));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)p_absoluteScribbleCapableElementWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  objc_opt_class(NSUUID, v5);
  v7 = sub_1002223BC(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate rootIdentifier](self, "rootIdentifier"));
  if (v8 == v9 || v8 == 0)
  {
    v12 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate editingProvider](self, "editingProvider"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scribbleCapableElementWithIdentifier:", v8));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate p_containedScribbleElementForContainerScribbleElement:](self, "p_containedScribbleElementForContainerScribbleElement:", v12));
      v14 = v13;
      if (v13)
      {
        v15 = v13;

        v12 = v15;
      }

    }
  }

  return v12;
}

- (id)p_scribbleCapableElementsForRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate editingProvider](self, "editingProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scribbleCapableElementsForRect:", x, y, width, height));

  return v8;
}

- (CGRect)p_expandedScribbleFrameForElement:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double MinX;
  CGFloat v20;
  double v21;
  double MaxY;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  double v27;
  void *i;
  double MinY;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double MaxX;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *j;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *k;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  void *m;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
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
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "scaledScribbleEditingFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "hitToleranceInsetsWithDefaultInsets:", -60.0, -60.0, -60.0, -60.0);
  v76 = v16;
  v77 = v13;
  v17 = v15;
  if (v14 == 0.0)
  {
    v27 = v13;
  }
  else
  {
    v18 = v14;
    v75 = v15;
    v98.origin.x = v6;
    v98.origin.y = v8;
    v98.size.width = v10;
    v98.size.height = v12;
    MinX = CGRectGetMinX(v98);
    v99.origin.x = v6;
    v99.origin.y = v8;
    v99.size.width = v10;
    v99.size.height = v12;
    v20 = CGRectGetMaxY(v99) + 0.001;
    v21 = -v18;
    v100.origin.x = MinX;
    v100.origin.y = v20;
    v100.size.width = v10;
    v100.size.height = -v18;
    MaxY = CGRectGetMaxY(v100);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate p_scribbleCapableElementsForRect:](self, "p_scribbleCapableElementsForRect:", MinX, v20, v10, v21));
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v91;
      v27 = v77;
      v17 = v75;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v91 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)i), "scaledScribbleEditingFrame");
          MinY = CGRectGetMinY(v101);
          if (MinY < MaxY)
            MaxY = MinY;
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
      }
      while (v25);
    }
    else
    {
      v27 = v77;
      v17 = v75;
    }
    v102.origin.x = v6;
    v102.origin.y = v8;
    v102.size.width = v10;
    v102.size.height = v12;
    if (MaxY > CGRectGetMaxY(v102))
    {
      v6 = sub_1000615D8(v6, v8, v10, v12, v6);
      v8 = v30;
      v10 = v31;
      v12 = v32;
    }

  }
  if (v17 != 0.0)
  {
    v103.origin.x = v6;
    v103.origin.y = v8;
    v103.size.width = v10;
    v103.size.height = v12;
    v33 = CGRectGetMaxX(v103) + 0.001;
    v104.origin.x = v6;
    v104.origin.y = v8;
    v104.size.width = v10;
    v104.size.height = v12;
    v34 = CGRectGetMinY(v104);
    v35 = -v17;
    v105.origin.x = v33;
    v105.origin.y = v34;
    v105.size.width = -v17;
    v105.size.height = v12;
    MaxX = CGRectGetMaxX(v105);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate p_scribbleCapableElementsForRect:](self, "p_scribbleCapableElementsForRect:", v33, v34, v35, v12));
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v87;
      v27 = v77;
      do
      {
        for (j = 0; j != v39; j = (char *)j + 1)
        {
          if (*(_QWORD *)v87 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)j), "scaledScribbleEditingFrame");
          v42 = CGRectGetMinX(v106);
          if (v42 < MaxX)
            MaxX = v42;
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
      }
      while (v39);
    }
    else
    {
      v27 = v77;
    }
    v107.origin.x = v6;
    v107.origin.y = v8;
    v107.size.width = v10;
    v107.size.height = v12;
    if (MaxX > CGRectGetMaxX(v107))
    {
      v6 = sub_1000615D8(v6, v8, v10, v12, MaxX);
      v8 = v43;
      v10 = v44;
      v12 = v45;
    }

  }
  if (v27 != 0.0)
  {
    v108.origin.x = v6;
    v108.origin.y = v8;
    v108.size.width = v10;
    v108.size.height = v12;
    v46 = CGRectGetMinX(v108);
    v109.origin.x = v6;
    v109.origin.y = v8;
    v109.size.width = v10;
    v109.size.height = v12;
    v47 = v27 + CGRectGetMinY(v109) + -0.001;
    v48 = -v27;
    v110.origin.x = v46;
    v110.origin.y = v47;
    v110.size.width = v10;
    v110.size.height = -v27;
    v49 = CGRectGetMinY(v110);
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate p_scribbleCapableElementsForRect:](self, "p_scribbleCapableElementsForRect:", v46, v47, v10, v48));
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v83;
      do
      {
        for (k = 0; k != v52; k = (char *)k + 1)
        {
          if (*(_QWORD *)v83 != v53)
            objc_enumerationMutation(v50);
          objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)k), "scaledScribbleEditingFrame");
          v55 = CGRectGetMaxY(v111);
          if (v55 > v49)
            v49 = v55;
        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
      }
      while (v52);
    }
    v112.origin.x = v6;
    v112.origin.y = v8;
    v112.size.width = v10;
    v112.size.height = v12;
    if (v49 < CGRectGetMinY(v112))
    {
      v6 = sub_1000615D8(v6, v8, v10, v12, v6);
      v8 = v56;
      v10 = v57;
      v12 = v58;
    }

  }
  if (v76 != 0.0)
  {
    v113.origin.x = v6;
    v113.origin.y = v8;
    v113.size.width = v10;
    v113.size.height = v12;
    v59 = v76 + CGRectGetMinX(v113) + -0.001;
    v114.origin.x = v6;
    v114.origin.y = v8;
    v114.size.width = v10;
    v114.size.height = v12;
    v60 = CGRectGetMinY(v114);
    v115.origin.x = v59;
    v115.origin.y = v60;
    v115.size.width = -v76;
    v115.size.height = v12;
    v61 = CGRectGetMinX(v115);
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate p_scribbleCapableElementsForRect:](self, "p_scribbleCapableElementsForRect:", v59, v60, -v76, v12));
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v79;
      do
      {
        for (m = 0; m != v64; m = (char *)m + 1)
        {
          if (*(_QWORD *)v79 != v65)
            objc_enumerationMutation(v62);
          objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)m), "scaledScribbleEditingFrame");
          v67 = CGRectGetMaxX(v116);
          if (v67 > v61)
            v61 = v67;
        }
        v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
      }
      while (v64);
    }
    v117.origin.x = v6;
    v117.origin.y = v8;
    v117.size.width = v10;
    v117.size.height = v12;
    if (v61 < CGRectGetMinX(v117))
    {
      v6 = sub_1000615D8(v6, v8, v10, v12, v61);
      v8 = v68;
      v10 = v69;
      v12 = v70;
    }

  }
  v71 = v6;
  v72 = v8;
  v73 = v10;
  v74 = v12;
  result.size.height = v74;
  result.size.width = v73;
  result.origin.y = v72;
  result.origin.x = v71;
  return result;
}

- (id)p_scribbleElementIdentifiersInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = objc_alloc_init((Class)NSMutableArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate p_scribbleCapableElementsForRect:](self, "p_scribbleCapableElementsForRect:", x, y, width, height));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate p_insertedScribbleElementProvider](self, "p_insertedScribbleElementProvider"));
  if (v11 && objc_msgSend(v11, "canInsertScribbleElementAtPoint:", sub_100061400(x, y, width, height)))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSScribbleInteractionDelegate rootIdentifier](self, "rootIdentifier"));
    objc_msgSend(v9, "addObject:", v12);

    if (qword_10147E610 != -1)
      dispatch_once(&qword_10147E610, &stru_10125DEE0);
    v13 = off_1013DC538;
    if (os_log_type_enabled((os_log_t)off_1013DC538, OS_LOG_TYPE_DEBUG))
      sub_100E34590(v13, (uint64_t)a2, self);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "scribbleIdentifier", (_QWORD)v21));
        objc_msgSend(v9, "crl_addNonNilObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  return v9;
}

- (CRLiOSScribbleInteractionEditingProvider)editingProvider
{
  return (CRLiOSScribbleInteractionEditingProvider *)objc_loadWeakRetained((id *)&self->_editingProvider);
}

- (void)setEditingProvider:(id)a3
{
  objc_storeWeak((id *)&self->_editingProvider, a3);
}

- (NSUUID)rootIdentifier
{
  return self->_rootIdentifier;
}

- (void)setRootIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_rootIdentifier, a3);
}

- (CRLiOSScribbleInteractionObserver)scribbleObserver
{
  return (CRLiOSScribbleInteractionObserver *)objc_loadWeakRetained((id *)&self->_scribbleObserver);
}

- (void)setScribbleObserver:(id)a3
{
  objc_storeWeak((id *)&self->_scribbleObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scribbleObserver);
  objc_storeStrong((id *)&self->_rootIdentifier, 0);
  objc_destroyWeak((id *)&self->_editingProvider);
}

@end
