@implementation CKOperation

- (id)ic_loggingValues
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKOperation;
  v3 = -[CKOperation ic_loggingValues](&v14, "ic_loggingValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKOperation metrics](self, "metrics"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cloudKitMetrics"));
  objc_msgSend(v7, "duration");
  v9 = v8;

  if (v9 > 0.0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKOperation metrics](self, "metrics"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cloudKitMetrics"));
    objc_msgSend(v11, "duration");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("duration"));

  }
  return v5;
}

@end
