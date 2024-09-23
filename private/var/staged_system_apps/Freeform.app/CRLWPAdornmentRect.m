@implementation CRLWPAdornmentRect

- (CRLWPAdornmentRect)initWithRect:(CGRect)a3 stroke:(id)a4 fill:(id)a5 type:(int)a6 range:(_NSRange)a7 paths:(id)a8 rubyPaths:(id)a9 shadow:(id)a10
{
  NSUInteger length;
  NSUInteger location;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v21;
  id v22;
  id v23;
  id v24;
  CRLWPAdornmentRect *v25;
  CRLWPAdornmentRect *v26;
  TSUSparseArray *v27;
  TSUSparseArray *paths;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  TSUSparseArray *v34;
  TSUSparseArray *rubyPaths;
  CRLShadow *v36;
  CRLShadow *shadow;
  NSObject *v39;
  id v40;
  NSUInteger v41;
  TSUSparseArray *v42;
  id v43;
  objc_super v44;
  uint8_t buf[4];
  unsigned int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  id v54;
  __int16 v55;
  NSUInteger v56;

  length = a7.length;
  location = a7.location;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v43 = a4;
  v21 = a5;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v44.receiver = self;
  v44.super_class = (Class)CRLWPAdornmentRect;
  v25 = -[CRLWPAdornmentRect init](&v44, "init");
  v26 = v25;
  if (v25)
  {
    v25->_rect.origin.x = x;
    v25->_rect.origin.y = y;
    v25->_rect.size.width = width;
    v25->_rect.size.height = height;
    objc_storeStrong((id *)&v25->_stroke, a4);
    objc_storeStrong((id *)&v26->_fill, a5);
    v26->_type = a6;
    v26->_range.location = location;
    v26->_range.length = length;
    v27 = (TSUSparseArray *)objc_msgSend(v22, "copy");
    paths = v26->_paths;
    v26->_paths = v27;

    if (-[TSUSparseArray count](v26->_paths, "count")
      && -[TSUSparseArray count](v26->_paths, "count") > v26->_range.length)
    {
      v29 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241B48);
      v30 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        v42 = v26->_paths;
        v39 = v30;
        v40 = -[TSUSparseArray count](v42, "count");
        v41 = v26->_range.length;
        *(_DWORD *)buf = 67110402;
        v46 = v29;
        v47 = 2082;
        v48 = "-[CRLWPAdornmentRect initWithRect:stroke:fill:type:range:paths:rubyPaths:shadow:]";
        v49 = 2082;
        v50 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPAdornmentRect.m";
        v51 = 1024;
        v52 = 31;
        v53 = 2048;
        v54 = v40;
        v55 = 2048;
        v56 = v41;
        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Should have no more than one path per glyph. %lu paths for range %lu", buf, 0x36u);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241B68);
      v31 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPAdornmentRect initWithRect:stroke:fill:type:range:paths:rubyPaths:shadow:]"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPAdornmentRect.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v32, v33, 31, 0, "Should have no more than one path per glyph. %lu paths for range %lu", -[TSUSparseArray count](v26->_paths, "count"), v26->_range.length);

    }
    v34 = (TSUSparseArray *)objc_msgSend(v23, "copy");
    rubyPaths = v26->_rubyPaths;
    v26->_rubyPaths = v34;

    v36 = (CRLShadow *)objc_msgSend(v24, "copy");
    shadow = v26->_shadow;
    v26->_shadow = v36;

  }
  return v26;
}

- (CRLWPAdornmentRect)initWithRect:(CGRect)a3 stroke:(id)a4 fill:(id)a5 type:(int)a6 range:(_NSRange)a7 paths:(id)a8 rubyPaths:(id)a9
{
  return -[CRLWPAdornmentRect initWithRect:stroke:fill:type:range:paths:rubyPaths:shadow:](self, "initWithRect:stroke:fill:type:range:paths:rubyPaths:shadow:", a4, a5, *(_QWORD *)&a6, a7.location, a7.length, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a9, 0);
}

- (CRLWPAdornmentRect)initWithRect:(CGRect)a3 stroke:(id)a4 fill:(id)a5 type:(int)a6
{
  return -[CRLWPAdornmentRect initWithRect:stroke:fill:type:range:paths:rubyPaths:](self, "initWithRect:stroke:fill:type:range:paths:rubyPaths:", a4, a5, *(_QWORD *)&a6, 0x7FFFFFFFFFFFFFFFLL, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0);
}

- (CRLWPAdornmentRect)initWithRect:(CGRect)a3 stroke:(id)a4
{
  return -[CRLWPAdornmentRect initWithRect:stroke:fill:type:](self, "initWithRect:stroke:fill:type:", a4, 0, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CRLWPAdornmentRect)initWithRect:(CGRect)a3 fill:(id)a4
{
  return -[CRLWPAdornmentRect initWithRect:stroke:fill:type:](self, "initWithRect:stroke:fill:type:", 0, a4, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CRLWPAdornmentRect)initWithCharacterFill:(id)a3 rect:(CGRect)a4 range:(_NSRange)a5 paths:(id)a6 rubyPaths:(id)a7
{
  return -[CRLWPAdornmentRect initWithRect:stroke:fill:type:range:paths:rubyPaths:](self, "initWithRect:stroke:fill:type:range:paths:rubyPaths:", 0, a3, 4, a5.location, a5.length, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a7);
}

- (CRLWPAdornmentRect)initWithCharacterStroke:(id)a3 rect:(CGRect)a4 range:(_NSRange)a5 paths:(id)a6 rubyPaths:(id)a7
{
  return -[CRLWPAdornmentRect initWithRect:stroke:fill:type:range:paths:rubyPaths:](self, "initWithRect:stroke:fill:type:range:paths:rubyPaths:", a3, 0, 5, a5.location, a5.length, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a7);
}

- (CRLWPAdornmentRect)initWithCharacterFillAdornmentState:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  CRLWPAdornmentRect *v27;

  v4 = a3;
  objc_msgSend(v4, "currentFillRect");
  if (!sub_10006178C(v5, v6, v7, v8))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241B88);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E07D78();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241BA8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPAdornmentRect initWithCharacterFillAdornmentState:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPAdornmentRect.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 65, 0, "Attempted to create an adornment with a non-finite rect");

  }
  objc_msgSend(v4, "currentFillRect");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentAdornmentFill"));
  v21 = objc_msgSend(v4, "currentFillRange");
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentFillPaths"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRubyFillPaths"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentFillShadow"));

  v27 = -[CRLWPAdornmentRect initWithRect:stroke:fill:type:range:paths:rubyPaths:shadow:](self, "initWithRect:stroke:fill:type:range:paths:rubyPaths:shadow:", 0, v20, 4, v21, v23, v24, v13, v15, v17, v19, v25, v26);
  return v27;
}

- (CRLWPAdornmentRect)initWithCharacterStrokeAdornmentState:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  CRLWPAdornmentRect *v27;

  v4 = a3;
  objc_msgSend(v4, "currentStrokeRect");
  if (!sub_10006178C(v5, v6, v7, v8))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241BC8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E07DFC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241BE8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPAdornmentRect initWithCharacterStrokeAdornmentState:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPAdornmentRect.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 77, 0, "Attempted to create an adornment with a non-finite rect");

  }
  objc_msgSend(v4, "currentStrokeRect");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentAdornmentStroke"));
  v21 = objc_msgSend(v4, "currentStrokeRange");
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentStrokePaths"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRubyStrokePaths"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentStrokeShadow"));

  v27 = -[CRLWPAdornmentRect initWithRect:stroke:fill:type:range:paths:rubyPaths:shadow:](self, "initWithRect:stroke:fill:type:range:paths:rubyPaths:shadow:", v20, 0, 5, v21, v23, v24, v13, v15, v17, v19, v25, v26);
  return v27;
}

- (CRLBezierPath)path
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  CRLBezierPath *v10;
  void **v12;
  uint64_t v13;
  id (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPAdornmentRect paths](self, "paths"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001C05C0;
  v17[3] = &unk_101241C10;
  v5 = v3;
  v18 = v5;
  objc_msgSend(v4, "foreach:", v17);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPAdornmentRect rubyPaths](self, "rubyPaths"));
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1001C05CC;
  v15 = &unk_101241C10;
  v7 = v5;
  v16 = v7;
  objc_msgSend(v6, "foreach:", &v12);

  if ((objc_msgSend(v7, "isEmpty", v12, v13, v14, v15) & 1) != 0)
    v8 = 0;
  else
    v8 = v7;
  v9 = v16;
  v10 = (CRLBezierPath *)v8;

  return v10;
}

- (id)pathFromExcludeRange:(_NSRange)a3 limitSelection:(id)a4 rubyGlyphRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, unint64_t);
  void *v25;
  id v26;
  id v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  _QWORD v32[4];
  id v33;
  id v34;
  NSUInteger v35;
  NSUInteger v36;

  length = a5.length;
  location = a5.location;
  v7 = a3.length;
  v8 = a3.location;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPAdornmentRect paths](self, "paths"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1001C0764;
  v32[3] = &unk_101241C38;
  v35 = v8;
  v36 = v7;
  v13 = v10;
  v33 = v13;
  v14 = v11;
  v34 = v14;
  objc_msgSend(v12, "foreach:", v32);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPAdornmentRect rubyPaths](self, "rubyPaths"));
  v22 = _NSConcreteStackBlock;
  v23 = 3221225472;
  v24 = sub_1001C0808;
  v25 = &unk_101241C60;
  v28 = v8;
  v29 = v7;
  v26 = v13;
  v30 = location;
  v31 = length;
  v16 = v14;
  v27 = v16;
  v17 = v13;
  objc_msgSend(v15, "foreach:", &v22);

  if ((objc_msgSend(v16, "isEmpty", v22, v23, v24, v25) & 1) != 0)
    v18 = 0;
  else
    v18 = v16;
  v19 = v27;
  v20 = v18;

  return v20;
}

- (int)type
{
  return self->_type;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CRLStroke)stroke
{
  return self->_stroke;
}

- (CRLFill)fill
{
  return self->_fill;
}

- (CRLShadow)shadow
{
  return self->_shadow;
}

- (void)setShadow:(id)a3
{
  objc_storeStrong((id *)&self->_shadow, a3);
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (TSUSparseArray)paths
{
  return self->_paths;
}

- (TSUSparseArray)rubyPaths
{
  return self->_rubyPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rubyPaths, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_fill, 0);
  objc_storeStrong((id *)&self->_stroke, 0);
}

@end
