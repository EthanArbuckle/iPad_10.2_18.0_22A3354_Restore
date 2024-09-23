@implementation CRLHyperlinkRegion

+ (id)hyperlinkRegionWithURL:(id)a3 bezierPath:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithURL:bezierPath:", v7, v6);

  return v8;
}

- (CRLHyperlinkRegion)initWithURL:(id)a3 bezierPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CRLHyperlinkRegion *v15;
  NSURL *v16;
  NSURL *URL;
  CRLBezierPath *v18;
  CRLBezierPath *bezierPath;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_22;
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124B1C8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E16B64();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124B1E8);
  v9 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE8358(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLHyperlinkRegion initWithURL:bezierPath:]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLHyperlinkRegion.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 29, 0, "Invalid parameter not satisfying: %{public}s", "aURL != nil");

  if (!v8)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B208);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E16AC8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124B228);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLHyperlinkRegion initWithURL:bezierPath:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLHyperlinkRegion.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 30, 0, "Invalid parameter not satisfying: %{public}s", "aBezierPath != nil");

  }
LABEL_22:
  v21.receiver = self;
  v21.super_class = (Class)CRLHyperlinkRegion;
  v15 = -[CRLHyperlinkRegion init](&v21, "init");
  if (v15)
  {
    v16 = (NSURL *)objc_msgSend(v6, "copy");
    URL = v15->_URL;
    v15->_URL = v16;

    v18 = (CRLBezierPath *)objc_msgSend(v8, "copy");
    bezierPath = v15->_bezierPath;
    v15->_bezierPath = v18;

  }
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;

  v4 = a3;
  objc_opt_class(CRLHyperlinkRegion, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8
    && ((v9 = objc_claimAutoreleasedReturnValue(-[CRLHyperlinkRegion URL](self, "URL")),
         v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL")),
         !(v9 | v10))
     || (v11 = (void *)v10,
         v12 = objc_msgSend((id)v9, "isEqual:", v10),
         v11,
         (id)v9,
         v12)))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLHyperlinkRegion bezierPath](self, "bezierPath"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bezierPath"));
    v15 = objc_msgSend(v13, "isEqual:", v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLHyperlinkRegion URL](self, "URL"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (id)description
{
  NSURL *URL;
  NSString *v3;
  void *v4;
  void *v5;
  CGRect v7;

  URL = self->_URL;
  -[CRLBezierPath bounds](self->_bezierPath, "bounds");
  v3 = NSStringFromCGRect(v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("URL={%@} bounds=%@"), URL, v4));

  return v5;
}

- (NSURL)URL
{
  return self->_URL;
}

- (CRLBezierPath)bezierPath
{
  return self->_bezierPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bezierPath, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
