@implementation CRLBoardItemImporterPlaceholder

+ (id)allocWithZone:(_NSZone *)a3
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10034A4BC;
  v4[3] = &unk_101254000;
  v4[4] = a3;
  v4[5] = a1;
  if (qword_101415550 != -1)
    dispatch_once(&qword_101415550, v4);
  return (id)qword_101415548;
}

- (CRLBoardItemImporterPlaceholder)initWithURL:(id)a3 boardItemFactory:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  id v10;
  CRLBoardItemImporterPlaceholder *v11;

  v6 = a4;
  v7 = a3;
  *(_QWORD *)&v9 = objc_opt_class(self, v8).n128_u64[0];
  v11 = (CRLBoardItemImporterPlaceholder *)objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "p_subclassForURL:", v7, v9)), "initWithURL:boardItemFactory:", v7, v6);

  return v11;
}

- (CRLBoardItemImporterPlaceholder)initWithData:(id)a3 boardItemFactory:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  id v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  CRLBoardItemImporterPlaceholder *v15;

  v6 = a3;
  v7 = a4;
  *(_QWORD *)&v9 = objc_opt_class(self, v8).n128_u64[0];
  v11 = (objc_class *)objc_msgSend(v10, "p_subclassForPreinsertionAssetWrapper:", v6, v9);
  if (!v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254020);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E24768();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101254040);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemImporterPlaceholder initWithData:boardItemFactory:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemImporter.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 374, 0, "invalid nil value for '%{public}s'", "instanceClass");

  }
  v15 = (CRLBoardItemImporterPlaceholder *)objc_msgSend([v11 alloc], "initWithData:boardItemFactory:", v6, v7);

  return v15;
}

@end
