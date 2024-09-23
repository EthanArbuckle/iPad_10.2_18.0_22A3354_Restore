@implementation CRLCursor

- (CRLCursor)initWithEffect:(id)a3 preview:(id)a4 activeScaledRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CRLCursor *v20;
  CRLCursor *v21;
  NSString *identifierSuffix;
  objc_super v24;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3;
  v13 = a4;
  if (v13)
  {
    if (v12)
      goto LABEL_22;
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124D228);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E19E08();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124D248);
  v14 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCursor initWithEffect:preview:activeScaledRect:]"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCursor.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 278, 0, "Invalid parameter not satisfying: %{public}s", "hoverPreview != nil");

  if (!v12)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D268);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E19D7C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D288);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCursor initWithEffect:preview:activeScaledRect:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCursor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 279, 0, "Invalid parameter not satisfying: %{public}s", "pointerEffect != nil");

  }
LABEL_22:
  v24.receiver = self;
  v24.super_class = (Class)CRLCursor;
  v20 = -[CRLCursor init](&v24, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_effect, a3);
    objc_storeStrong((id *)&v21->_preview, a4);
    v21->_activeScaledRect.origin.x = x;
    v21->_activeScaledRect.origin.y = y;
    v21->_activeScaledRect.size.width = width;
    v21->_activeScaledRect.size.height = height;
    identifierSuffix = v21->_identifierSuffix;
    v21->_identifierSuffix = (NSString *)&stru_1012A72B0;

  }
  return v21;
}

+ (CRLCursor)cursorWithEffect:(id)a3 preview:(id)a4 activeScaledRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  id v13;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(objc_alloc((Class)a1), "initWithEffect:preview:activeScaledRect:", v12, v11, x, y, width, height);

  return (CRLCursor *)v13;
}

+ (CRLCursor)cursorWithEffect:(id)a3 preview:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v9, "frame");
  v10 = objc_msgSend(v8, "initWithEffect:preview:activeScaledRect:", v7, v6);

  return (CRLCursor *)v10;
}

- (CRLCursor)initWithShape:(id)a3 activeScaledRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CRLCursor *v14;
  CRLCursor *v15;
  NSString *identifierSuffix;
  objc_super v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  if (!v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D2A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E19E94();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D2C8);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCursor initWithShape:activeScaledRect:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCursor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 298, 0, "Invalid parameter not satisfying: %{public}s", "shape != nil");

  }
  v18.receiver = self;
  v18.super_class = (Class)CRLCursor;
  v14 = -[CRLCursor init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_shape, a3);
    v15->_activeScaledRect.origin.x = x;
    v15->_activeScaledRect.origin.y = y;
    v15->_activeScaledRect.size.width = width;
    v15->_activeScaledRect.size.height = height;
    identifierSuffix = v15->_identifierSuffix;
    v15->_identifierSuffix = (NSString *)&stru_1012A72B0;

    v15->_constrainedAxes = 0;
  }

  return v15;
}

+ (CRLCursor)cursorWithShape:(id)a3 activeScaledRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithShape:activeScaledRect:", v9, x, y, width, height);

  return (CRLCursor *)v10;
}

- (id)initDefaultCursor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLCursor;
  return -[CRLCursor init](&v3, "init");
}

+ (CRLCursor)defaultCursor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C4384;
  block[3] = &unk_10122DC38;
  block[4] = a1;
  if (qword_101415328 != -1)
    dispatch_once(&qword_101415328, block);
  return (CRLCursor *)(id)qword_101415320;
}

+ (id)cursorForResizeType:(unint64_t)a3 activeScaledRect:(CGRect)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double height;
  double width;
  double y;
  double x;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;

  if (a3 < 4)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v13 = (void *)qword_101415330;
    if (!qword_101415330)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 4));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
      objc_msgSend(v15, "moveToPoint:", 11.0, 11.0);
      objc_msgSend(v15, "addLineToPoint:", 1.0, 17.5);
      objc_msgSend(v15, "addLineToPoint:", 11.0, 24.0);
      objc_msgSend(v15, "addLineToPoint:", 11.0, 11.0);
      objc_msgSend(v15, "closePath");
      objc_msgSend(v15, "moveToPoint:", 24.0, 11.0);
      objc_msgSend(v15, "addLineToPoint:", 24.0, 24.0);
      objc_msgSend(v15, "addLineToPoint:", 34.0, 17.5);
      objc_msgSend(v15, "addLineToPoint:", 24.0, 11.0);
      objc_msgSend(v15, "closePath");
      CGAffineTransformMakeTranslation(&v26, -17.5, -17.5);
      objc_msgSend(v15, "applyTransform:", &v26);
      v16 = objc_msgSend(v15, "copy");
      objc_msgSend(v14, "setObject:atIndexedSubscript:", v16, 0);

      v17 = objc_msgSend(v15, "copy");
      CGAffineTransformMakeRotation(&v25, -0.785398163);
      objc_msgSend(v17, "applyTransform:", &v25);
      objc_msgSend(v14, "setObject:atIndexedSubscript:", v17, 1);
      v18 = objc_msgSend(v15, "copy");
      CGAffineTransformMakeRotation(&v24, 1.57079633);
      objc_msgSend(v18, "applyTransform:", &v24);
      objc_msgSend(v14, "setObject:atIndexedSubscript:", v18, 2);
      v19 = objc_msgSend(v15, "copy");
      CGAffineTransformMakeRotation(&v23, 0.785398163);
      objc_msgSend(v19, "applyTransform:", &v23);
      objc_msgSend(v14, "setObject:atIndexedSubscript:", v19, 3);
      v20 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v14));
      v21 = (void *)qword_101415330;
      qword_101415330 = v20;

      v13 = (void *)qword_101415330;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithPath:](UIPointerShape, "shapeWithPath:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCursor cursorWithShape:activeScaledRect:](CRLCursor, "cursorWithShape:activeScaledRect:", v6, x, y, width, height));
    objc_msgSend(v7, "setConstrainedAxes:", 3);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D2E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E19F20();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D308);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCursor cursorForResizeType:activeScaledRect:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCursor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 331, 0, "Asking for invalid cursor type");
    v7 = 0;
  }

  return v7;
}

+ (id)cursorForRotateType:(unint64_t)a3 activeScaledRect:(CGRect)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double height;
  double width;
  double y;
  double x;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v33;
  id v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;

  if (a3 < 8)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v13 = (void *)qword_101415338;
    if (!qword_101415338)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 8));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
      objc_msgSend(v15, "moveToPoint:", 17.84375, 2.40625);
      objc_msgSend(v15, "addLineToPoint:", 20.3125, 14.0625);
      objc_msgSend(v15, "addLineToPoint:", 23.84375, 10.53125);
      objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", 24.21875, 10.875, 23.966935, 10.642287, 24.100128, 10.756378);
      objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", 24.21875, 24.3125, 27.928727, 14.58498, 27.928731, 20.602519);
      objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", 24.03125, 24.5, 24.15933, 24.371917, 24.091827, 24.44249);
      objc_msgSend(v15, "addLineToPoint:", 23.84375, 24.65625);
      objc_msgSend(v15, "addLineToPoint:", 20.3125, 21.125);
      objc_msgSend(v15, "addLineToPoint:", 17.84375, 32.8125);
      objc_msgSend(v15, "addLineToPoint:", 29.53125, 30.34375);
      objc_msgSend(v15, "addLineToPoint:", 25.96875, 26.78125);
      objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", 26.34375, 26.4375, 26.090566, 26.668649, 26.225413, 26.555837);
      objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", 26.34375, 8.75, 31.225304, 21.555948, 31.225304, 13.631554);
      objc_msgSend(v15, "addLineToPoint:", 26.15625, 8.59375);
      objc_msgSend(v15, "addLineToPoint:", 25.96875, 8.40625);
      objc_msgSend(v15, "addLineToPoint:", 29.53125, 4.875);
      objc_msgSend(v15, "addLineToPoint:", 17.84375, 2.40625);
      objc_msgSend(v15, "closePath");
      CGAffineTransformMakeTranslation(&v43, -17.5, -17.5);
      objc_msgSend(v15, "applyTransform:", &v43);
      v34 = objc_msgSend(v15, "copy");
      CGAffineTransformMakeRotation(&v42, 0.0);
      objc_msgSend(v34, "applyTransform:", &v42);
      v16 = objc_msgSend(v34, "copy");
      objc_msgSend(v14, "setObject:atIndexedSubscript:", v16, 0);

      v33 = objc_msgSend(v15, "copy");
      CGAffineTransformMakeRotation(&v41, -0.785398163);
      objc_msgSend(v33, "applyTransform:", &v41);
      v17 = objc_msgSend(v33, "copy");
      objc_msgSend(v14, "setObject:atIndexedSubscript:", v17, 1);

      v18 = objc_msgSend(v15, "copy");
      CGAffineTransformMakeRotation(&v40, -1.57079633);
      objc_msgSend(v18, "applyTransform:", &v40);
      v19 = objc_msgSend(v18, "copy");
      objc_msgSend(v14, "setObject:atIndexedSubscript:", v19, 2);

      v20 = objc_msgSend(v15, "copy");
      CGAffineTransformMakeRotation(&v39, -2.35619449);
      objc_msgSend(v20, "applyTransform:", &v39);
      v21 = objc_msgSend(v20, "copy");
      objc_msgSend(v14, "setObject:atIndexedSubscript:", v21, 3);

      v22 = objc_msgSend(v15, "copy");
      CGAffineTransformMakeRotation(&v38, -3.14159265);
      objc_msgSend(v22, "applyTransform:", &v38);
      v23 = objc_msgSend(v22, "copy");
      objc_msgSend(v14, "setObject:atIndexedSubscript:", v23, 4);

      v24 = objc_msgSend(v15, "copy");
      CGAffineTransformMakeRotation(&v37, -3.92699082);
      objc_msgSend(v24, "applyTransform:", &v37);
      v25 = objc_msgSend(v24, "copy");
      objc_msgSend(v14, "setObject:atIndexedSubscript:", v25, 5);

      v26 = objc_msgSend(v15, "copy");
      CGAffineTransformMakeRotation(&v36, -4.71238898);
      objc_msgSend(v26, "applyTransform:", &v36);
      v27 = objc_msgSend(v26, "copy");
      objc_msgSend(v14, "setObject:atIndexedSubscript:", v27, 6);

      v28 = objc_msgSend(v15, "copy");
      CGAffineTransformMakeRotation(&v35, -5.49778714);
      objc_msgSend(v28, "applyTransform:", &v35);
      v29 = objc_msgSend(v28, "copy");
      objc_msgSend(v14, "setObject:atIndexedSubscript:", v29, 7);

      v30 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v14));
      v31 = (void *)qword_101415338;
      qword_101415338 = v30;

      v13 = (void *)qword_101415338;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", a3, v33));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithPath:](UIPointerShape, "shapeWithPath:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCursor cursorWithShape:activeScaledRect:](CRLCursor, "cursorWithShape:activeScaledRect:", v6, x, y, width, height));
    objc_msgSend(v7, "setConstrainedAxes:", 3);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D328);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E19FA0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D348);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCursor cursorForRotateType:activeScaledRect:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCursor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 387, 0, "Asking for invalid cursor type");
    v7 = 0;
  }

  return v7;
}

+ (id)moveCursorWithActiveScaledRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  CGAffineTransform v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)qword_101415340;
  if (!qword_101415340)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
    objc_msgSend(v8, "moveToPoint:", 17.5, 2.0);
    objc_msgSend(v8, "addLineToPoint:", 12.0, 10.0);
    objc_msgSend(v8, "addLineToPoint:", 23.0, 10.0);
    objc_msgSend(v8, "addLineToPoint:", 17.5, 2.0);
    objc_msgSend(v8, "closePath");
    objc_msgSend(v8, "moveToPoint:", 10.0, 12.0);
    objc_msgSend(v8, "addLineToPoint:", 2.0, 17.5);
    objc_msgSend(v8, "addLineToPoint:", 10.0, 23.0);
    objc_msgSend(v8, "addLineToPoint:", 10.0, 12.0);
    objc_msgSend(v8, "closePath");
    objc_msgSend(v8, "moveToPoint:", 25.0, 12.0);
    objc_msgSend(v8, "addLineToPoint:", 25.0, 23.0);
    objc_msgSend(v8, "addLineToPoint:", 33.0, 17.5);
    objc_msgSend(v8, "addLineToPoint:", 25.0, 12.0);
    objc_msgSend(v8, "closePath");
    objc_msgSend(v8, "moveToPoint:", 12.0, 25.0);
    objc_msgSend(v8, "addLineToPoint:", 17.5, 33.0);
    objc_msgSend(v8, "addLineToPoint:", 23.0, 25.0);
    objc_msgSend(v8, "addLineToPoint:", 12.0, 25.0);
    objc_msgSend(v8, "closePath");
    objc_msgSend(v8, "bounds");
    v13 = sub_100061400(v9, v10, v11, v12);
    CGAffineTransformMakeTranslation(&v20, -v13, -v14);
    objc_msgSend(v8, "applyTransform:", &v20);
    v15 = (void *)qword_101415340;
    qword_101415340 = (uint64_t)v8;

    v7 = (void *)qword_101415340;
  }
  v16 = objc_msgSend(v7, "copy");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithPath:](UIPointerShape, "shapeWithPath:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCursor cursorWithShape:activeScaledRect:](CRLCursor, "cursorWithShape:activeScaledRect:", v17, x, y, width, height));
  objc_msgSend(v18, "setConstrainedAxes:", 3);

  return v18;
}

+ (id)addPointCursorWithActiveScaledRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  CGAffineTransform v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)qword_101415348;
  if (!qword_101415348)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
    objc_msgSend(v8, "moveToPoint:", 17.5, 8.0);
    objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", 8.0, 17.5, 12.291914, 7.999999, 8.0, 12.284867);
    objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", 17.5, 27.0, 8.0, 22.708087, 12.291914, 27.0);
    objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", 27.0, 17.5, 22.715134, 27.0, 27.0, 22.708086);
    objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", 17.5, 8.0, 27.000001, 12.284866, 22.715134, 8.0);
    objc_msgSend(v8, "closePath");
    objc_msgSend(v8, "moveToPoint:", 17.5, 12.90625);
    objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", 18.46875);
    objc_msgSend(v8, "addLineToPoint:", 18.46875, 16.53125);
    objc_msgSend(v8, "addLineToPoint:", 21.125, 16.53125);
    objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", 22.125, 17.5, 21.724038, 16.53125, 22.125, 16.915059);
    objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", 21.125, 18.46875, 22.125, 18.070845, 21.709941, 18.46875);
    objc_msgSend(v8, "addLineToPoint:", 18.46875, 18.46875);
    objc_msgSend(v8, "addLineToPoint:", 18.46875, 21.0);
    objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", 17.5, 22.0, 18.468749, 21.584938, 18.077893, 22.0);
    objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", 16.53125, 21.0, 16.922105, 22.000001, 16.53125, 21.577893);
    objc_msgSend(v8, "addLineToPoint:", 16.53125, 18.46875);
    objc_msgSend(v8, "addLineToPoint:", 13.875, 18.46875);
    objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", 12.84375, 17.5, 13.290059, 18.468751, 12.84375, 18.070846);
    objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", 13.875, 16.53125, 12.843751, 16.915059, 13.275964, 16.53125);
    objc_msgSend(v8, "addLineToPoint:", 16.53125, 16.53125);
    objc_msgSend(v8, "addLineToPoint:", 16.53125, 13.90625);
    objc_msgSend(v8, "addCurveToPoint:controlPoint1:controlPoint2:", 17.5, 12.90625, 16.531252, 13.32836, 16.922107, 12.90625);
    objc_msgSend(v8, "closePath");
    objc_msgSend(v8, "bounds");
    v13 = sub_100061400(v9, v10, v11, v12);
    CGAffineTransformMakeTranslation(&v20, -v13, -v14);
    objc_msgSend(v8, "applyTransform:", &v20);
    v15 = (void *)qword_101415348;
    qword_101415348 = (uint64_t)v8;

    v7 = (void *)qword_101415348;
  }
  v16 = objc_msgSend(v7, "copy");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithPath:](UIPointerShape, "shapeWithPath:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCursor cursorWithShape:activeScaledRect:](CRLCursor, "cursorWithShape:activeScaledRect:", v17, x, y, width, height));
  return v18;
}

+ (id)tableResizeCursorForOrientation:(int)a3 activeScaledRect:(CGRect)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double height;
  double width;
  double y;
  double x;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  CGAffineTransform v23;
  CGAffineTransform v24;

  if (a3 < 2)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v13 = (void *)qword_101415350;
    if (!qword_101415350)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
      objc_msgSend(v15, "moveToPoint:", 17.5, 8.0);
      objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", 16.0, 9.5, 16.671572, 8.000001, 16.0, 8.671573);
      objc_msgSend(v15, "addLineToPoint:", 16.0, 24.5);
      objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", 17.5, 26.0, 16.0, 25.328428, 16.671573, 26.0);
      objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", 19.0, 24.5, 18.328428, 26.000002, 19.0, 25.328427);
      objc_msgSend(v15, "addLineToPoint:", 19.0, 9.5);
      objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", 17.5, 8.0, 19.0, 8.671573, 18.328427, 8.0);
      objc_msgSend(v15, "closePath");
      objc_msgSend(v15, "moveToPoint:", 12.0, 10.5);
      objc_msgSend(v15, "addLineToPoint:", 2.0, 17.0);
      objc_msgSend(v15, "addLineToPoint:", 12.0, 23.5);
      objc_msgSend(v15, "addLineToPoint:", 12.0, 10.5);
      objc_msgSend(v15, "closePath");
      objc_msgSend(v15, "moveToPoint:", 23.0, 10.5);
      objc_msgSend(v15, "addLineToPoint:", 23.0, 23.5);
      objc_msgSend(v15, "addLineToPoint:", 33.0, 17.0);
      objc_msgSend(v15, "addLineToPoint:", 23.0, 10.5);
      objc_msgSend(v15, "closePath");
      CGAffineTransformMakeTranslation(&v24, -17.5, -17.5);
      objc_msgSend(v15, "applyTransform:", &v24);
      v16 = objc_msgSend(v15, "copy");
      objc_msgSend(v14, "setObject:atIndexedSubscript:", v16, 0);

      v17 = objc_msgSend(v15, "copy");
      CGAffineTransformMakeRotation(&v23, 1.57079633);
      objc_msgSend(v17, "applyTransform:", &v23);
      v18 = objc_msgSend(v17, "copy");
      objc_msgSend(v14, "setObject:atIndexedSubscript:", v18, 1);

      v19 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v14));
      v20 = (void *)qword_101415350;
      qword_101415350 = v19;

      v13 = (void *)qword_101415350;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", a3));
    v21 = objc_msgSend(v5, "copy");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithPath:](UIPointerShape, "shapeWithPath:", v21));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCursor cursorWithShape:activeScaledRect:](CRLCursor, "cursorWithShape:activeScaledRect:", v6, x, y, width, height));
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D368);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1A020();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D388);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCursor tableResizeCursorForOrientation:activeScaledRect:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCursor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 554, 0, "Asking for invalid cursor type");
    v7 = 0;
  }

  return v7;
}

+ (CRLCursor)repContentPlatformViewPlaceholder
{
  if (qword_101415360 != -1)
    dispatch_once(&qword_101415360, &stru_10124D3A8);
  return (CRLCursor *)(id)qword_101415358;
}

- (id)initRepContentPlatformViewPlaceholder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLCursor;
  return -[CRLCursor init](&v3, "init");
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGRect v13;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[CRLCursor activeScaledRect](self, "activeScaledRect");
  v6 = NSStringFromCGRect(v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCursor effect](self, "effect"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCursor shape](self, "shape"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCursor identifierSuffix](self, "identifierSuffix"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p activeScaledRect=%@ effect=%@ shape=%@ identifierSuffix=%@ constrainedAxes=%lu>"), v5, self, v7, v8, v9, v10, -[CRLCursor constrainedAxes](self, "constrainedAxes")));

  return v11;
}

- (CGRect)activeScaledRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_activeScaledRect.origin.x;
  y = self->_activeScaledRect.origin.y;
  width = self->_activeScaledRect.size.width;
  height = self->_activeScaledRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIPointerEffect)effect
{
  return self->_effect;
}

- (UITargetedPreview)preview
{
  return self->_preview;
}

- (UIPointerShape)shape
{
  return self->_shape;
}

- (NSString)identifierSuffix
{
  return self->_identifierSuffix;
}

- (void)setIdentifierSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)constrainedAxes
{
  return self->_constrainedAxes;
}

- (void)setConstrainedAxes:(unint64_t)a3
{
  self->_constrainedAxes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierSuffix, 0);
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_effect, 0);
}

@end
