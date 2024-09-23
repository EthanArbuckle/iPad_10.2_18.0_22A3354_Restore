@implementation AETestDriver

+ (id)shared
{
  if (qword_20F790 != -1)
    dispatch_once(&qword_20F790, &stru_1C1B98);
  return (id)qword_20F788;
}

- (AETestDriver)init
{
  AETestDriver *v2;
  AETestDriver *v3;
  AETestDriverDelegate *delegate;
  AELayoutTestDelegate *layoutDelegate;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AETestDriver;
  v2 = -[AETestDriver init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    delegate = v2->_delegate;
    v2->_delegate = 0;

    layoutDelegate = v3->_layoutDelegate;
    v3->_layoutDelegate = 0;

  }
  return v3;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void)setEventDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_eventDispatcher, a3);
}

- (void)setLayoutDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_layoutDelegate, a3);
}

- (void)postEvent:(id)a3 sender:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AETestDriver testStateProvider](self, "testStateProvider"));
  v8 = objc_msgSend(v7, "testIsRunning");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "postNotificationName:object:", v10, v6);

  }
}

+ (id)getBookKeyWithBook:(id)a3 style:(id)a4 geometry:(id)a5
{
  void *v5;
  void *v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _UNKNOWN **v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  void *v43;
  __CFString *v45;
  __CFString *v46;
  __CFString *v47;
  __CFString *v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _BOOL4 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _BOOL4 v81;
  _BOOL4 v82;
  _QWORD v83[9];
  _QWORD v84[9];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[5];
  _QWORD v90[5];
  _QWORD v91[6];
  _QWORD v92[6];
  _QWORD v93[3];
  _QWORD v94[3];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;

  v93[0] = CFSTR("style");
  v17 = &IMAccessibilityIsFKAEnabledWithKeyboardAttached_ptr;
  if (v10)
  {
    v91[0] = CFSTR("fontFamily");
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontFamily"));
    v82 = v18 != 0;
    v74 = (void *)v18;
    if (v18)
      v19 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontFamily"));
    else
      v19 = &stru_1C3088;
    v53 = (__CFString *)v19;
    v92[0] = v19;
    v91[1] = CFSTR("lineHeight");
    objc_msgSend(v10, "lineHeight");
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v92[1] = v73;
    v91[2] = CFSTR("fontSize");
    objc_msgSend(v10, "fontSize");
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    v92[2] = v72;
    v91[3] = CFSTR("autoHyphenate");
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v10, "autoHyphenate")));
    v92[3] = v71;
    v91[4] = CFSTR("optimizeLegibility");
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v10, "optimizeLegibility")));
    v92[4] = v70;
    v91[5] = CFSTR("justification");
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v10, "justification")));
    v92[5] = v69;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v92, v91, 6));
  }
  else
  {
    v82 = 0;
    v20 = &__NSDictionary0__struct;
  }
  v76 = v20;
  v94[0] = v20;
  v93[1] = CFSTR("geometry");
  if (v11)
  {
    v89[0] = CFSTR("webViewSize");
    a5 = CFSTR("width");
    v87[0] = CFSTR("width");
    objc_msgSend(v11, "layoutSize");
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v87[1] = CFSTR("height");
    v88[0] = v68;
    objc_msgSend(v11, "layoutSize");
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21));
    v88[1] = v67;
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v88, v87, 2));
    v90[0] = v66;
    v89[1] = CFSTR("windowSize");
    v85[0] = CFSTR("width");
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14));
    v85[1] = CFSTR("height");
    v86[0] = v65;
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
    v86[1] = v64;
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v86, v85, 2));
    v90[1] = v63;
    v89[2] = CFSTR("isLandscape");
    objc_msgSend(v11, "layoutSize");
    v23 = v22;
    objc_msgSend(v11, "layoutSize");
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v23 > v24));
    v90[2] = v62;
    v89[3] = CFSTR("hasSpreadPages");
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v11, "hasSpreadPages")));
    v90[3] = v61;
    v89[4] = CFSTR("gutterWidth");
    objc_msgSend(v11, "gutterWidth");
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v90[4] = v60;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v90, v89, 5));
  }
  else
  {
    v25 = &__NSDictionary0__struct;
  }
  v75 = v25;
  v94[1] = v25;
  v93[2] = CFSTR("info");
  if (v9)
  {
    v83[0] = CFSTR("bookEpubId");
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookEpubId"));
    v81 = v26 != 0;
    v59 = (void *)v26;
    if (v26)
      v27 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookEpubId"));
    else
      v27 = &stru_1C3088;
    v52 = (__CFString *)v27;
    v84[0] = v27;
    v83[1] = CFSTR("bookAuthor");
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookAuthor"));
    HIDWORD(v80) = v31 != 0;
    v58 = (void *)v31;
    if (v31)
      v32 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookAuthor"));
    else
      v32 = &stru_1C3088;
    v51 = (__CFString *)v32;
    v84[1] = v32;
    v83[2] = CFSTR("bookTitle");
    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookTitle"));
    LODWORD(v80) = v33 != 0;
    v57 = (void *)v33;
    if (v33)
      v34 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookTitle"));
    else
      v34 = &stru_1C3088;
    v50 = (__CFString *)v34;
    v84[2] = v34;
    v83[3] = CFSTR("bookLanguage");
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookLanguage"));
    HIDWORD(v79) = v35 != 0;
    v56 = (void *)v35;
    if (v35)
      v36 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookLanguage"));
    else
      v36 = &stru_1C3088;
    v49 = (__CFString *)v36;
    v84[3] = v36;
    v83[4] = CFSTR("shortBookTitle");
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shortBookTitle"));
    LODWORD(v79) = v37 != 0;
    v55 = (void *)v37;
    if (v37)
      v38 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shortBookTitle"));
    else
      v38 = &stru_1C3088;
    v48 = (__CFString *)v38;
    v84[4] = v38;
    v83[5] = CFSTR("publisherName");
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "publisherName"));
    HIDWORD(v78) = v39 != 0;
    v54 = (void *)v39;
    if (v39)
      v40 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "publisherName"));
    else
      v40 = &stru_1C3088;
    v47 = (__CFString *)v40;
    v84[5] = v40;
    v83[6] = CFSTR("publisherLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "publisherLocation"));
    LODWORD(v78) = v5 != 0;
    if (v5)
      v41 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "publisherLocation"));
    else
      v41 = &stru_1C3088;
    v46 = (__CFString *)v41;
    v84[6] = v41;
    v83[7] = CFSTR("publisherYear");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "publisherYear"));
    v77 = v6 != 0;
    if (v6)
      v42 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "publisherYear"));
    else
      v42 = &stru_1C3088;
    v45 = (__CFString *)v42;
    v84[7] = v42;
    v83[8] = CFSTR("url");
    v17 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookBundlePath"));
    v29 = v17 != 0;
    v28 = v11;
    if (v17)
      a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookBundlePath"));
    else
      a5 = &stru_1C3088;
    v84[8] = a5;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v84, v83, 9));
  }
  else
  {
    v28 = v11;
    v81 = 0;
    v79 = 0;
    v80 = 0;
    v78 = 0;
    v77 = 0;
    v29 = 0;
    v30 = &__NSDictionary0__struct;
  }
  v94[2] = v30;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v94, v93, 3));
  if (v9)

  if (v29)
  if (v9)

  if (v77)
  if (v9)

  if ((_DWORD)v78)
  if (v9)

  if (HIDWORD(v78))
  if (v9)

  if ((_DWORD)v79)
  if (v9)

  if (HIDWORD(v79))
  if (v9)

  if ((_DWORD)v80)
  if (v9)

  if (HIDWORD(v80))
  if (v9)

  if (v81)
  if (v9)

  if (v28)
  {

  }
  if (v10)
  {

  }
  if (v82)

  if (v10)
  return v43;
}

+ (id)getBookKeyWithBookController:(id)a3
{
  return 0;
}

+ (id)getBookControllerLayout:(id)a3
{
  return 0;
}

+ (void)getWebViews:(id)a3 result:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "subviews", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10);
        objc_opt_class(WKWebView);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
          objc_msgSend(v5, "addObject:", v11);
        else
          +[AETestDriver getWebViews:result:](AETestDriver, "getWebViews:result:", v11, v5);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

+ (id)getContentViewChildren:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  +[AETestDriver getWebViews:result:](AETestDriver, "getWebViews:result:", v3, v4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_E8AA8;
  v7[3] = &unk_1C1BC0;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "sortUsingComparator:", v7);

  return v4;
}

+ (id)getViewSnapshot:(id)a3 parent:(id)a4
{
  id v5;
  id v6;
  CGFloat v7;
  CGFloat v8;
  CGContext *CurrentContext;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  UIImage *ImageFromCurrentImageContext;
  void *v16;
  CGSize v18;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "bounds");
  v18.width = v7;
  v18.height = v8;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v10, "renderInContext:", CurrentContext);

  objc_msgSend(v5, "bounds");
  objc_msgSend(v6, "convertPoint:fromView:", v5);
  v12 = v11;
  v14 = v13;

  CGContextTranslateCTM(CurrentContext, v12, v14);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v16 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v16;
}

+ (id)getSnapshotsWithBookController:(id)a3
{
  return 0;
}

- (void)paginationControllerFinishedWebkitRendering:(id)a3 renderTree:(id)a4 pageCount:(unint64_t)a5
{
  AELayoutTestDelegate *layoutDelegate;

  layoutDelegate = self->_layoutDelegate;
  if (layoutDelegate)
    -[AELayoutTestDelegate paginationControllerFinishedWebkitRendering:renderTree:pageCount:](layoutDelegate, "paginationControllerFinishedWebkitRendering:renderTree:pageCount:", a3, a4, a5);
}

- (void)paginationControllerFinishedBookPagination:(id)a3
{
  AELayoutTestDelegate *layoutDelegate;

  layoutDelegate = self->_layoutDelegate;
  if (layoutDelegate)
    -[AELayoutTestDelegate paginationControllerFinishedBookPagination:](layoutDelegate, "paginationControllerFinishedBookPagination:", a3);
}

- (void)presentationControllerFinishedWebkitRendering:(id)a3 renderTree:(id)a4 pageCount:(unint64_t)a5
{
  AELayoutTestDelegate *layoutDelegate;

  layoutDelegate = self->_layoutDelegate;
  if (layoutDelegate)
    -[AELayoutTestDelegate presentationControllerFinishedWebkitRendering:renderTree:pageCount:](layoutDelegate, "presentationControllerFinishedWebkitRendering:renderTree:pageCount:", a3, a4, a5);
}

- (void)bookViewDidAppear:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  AETestDriverEventDispatcher *eventDispatcher;
  id v8;

  v8 = a3;
  if (self->_delegate)
  {
    objc_opt_class(BKBookViewController);
    v5 = BUDynamicCast(v4, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[AETestDriverDelegate bookViewDidAppear:](self->_delegate, "bookViewDidAppear:", v6);

  }
  eventDispatcher = self->_eventDispatcher;
  if (eventDispatcher)
    -[AETestDriverEventDispatcher notifyBookController:](eventDispatcher, "notifyBookController:", v8);

}

- (void)bookViewWillDisappear:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  AETestDriverEventDispatcher *eventDispatcher;
  id v8;

  v8 = a3;
  if (self->_delegate)
  {
    objc_opt_class(BKBookViewController);
    v5 = BUDynamicCast(v4, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[AETestDriverDelegate bookViewWillDisappear:](self->_delegate, "bookViewWillDisappear:", v6);

  }
  eventDispatcher = self->_eventDispatcher;
  if (eventDispatcher)
    -[AETestDriverEventDispatcher notifyBookController:](eventDispatcher, "notifyBookController:", 0);

}

- (BOOL)reading
{
  return self->_delegate != 0;
}

- (BOOL)testingLayout
{
  return self->_layoutDelegate != 0;
}

- (AETestDriverDelegate)delegate
{
  return self->_delegate;
}

- (AELayoutTestDelegate)layoutDelegate
{
  return self->_layoutDelegate;
}

- (AETestDriverEventDispatcher)eventDispatcher
{
  return self->_eventDispatcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_layoutDelegate, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
