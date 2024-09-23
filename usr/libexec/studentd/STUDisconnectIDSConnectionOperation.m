@implementation STUDisconnectIDSConnectionOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  _UNKNOWN **v14;
  uint64_t v15;
  void *v17;
  void *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  objc_super v25;

  v6 = a3;
  v25.receiver = a1;
  v25.super_class = (Class)&OBJC_METACLASS___STUDisconnectIDSConnectionOperation;
  if (!objc_msgSendSuper2(&v25, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  v7 = objc_opt_class(CRKDisconnectIDSConnectionRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = v6;
    v9 = objc_opt_class(CRKDisconnectIDSConnectionRequest);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[STUDisconnectIDSConnectionOperation validateRequest:error:]"));
      v19 = (objc_class *)objc_opt_class(CRKDisconnectIDSConnectionRequest);
      v20 = NSStringFromClass(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (objc_class *)objc_opt_class(v8);
      v23 = NSStringFromClass(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("STUDisconnectIDSConnectionOperation.m"), 29, CFSTR("expected %@, got %@"), v21, v24);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "courseIdentifier"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instructorIdentifier"));

      if (v11)
      {
        v12 = 1;
LABEL_17:

        goto LABEL_18;
      }
      if (a4)
      {
        v14 = &off_1000D3538;
        goto LABEL_15;
      }
    }
    else if (a4)
    {
      v14 = &off_1000D3510;
LABEL_15:
      v15 = CRKErrorWithCodeAndUserInfo(2, v14);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v15);
      goto LABEL_17;
    }
    v12 = 0;
    goto LABEL_17;
  }
  if (a4)
  {
    v13 = CRKErrorWithCodeAndUserInfo(2, &off_1000D34E8);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v13);
  }
  else
  {
LABEL_10:
    v12 = 0;
  }
LABEL_18:

  return v12;
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUDisconnectIDSConnectionOperation;
  -[STUTaskOperation cancel](&v4, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035BC0;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "daemon"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "instructorIdentifier"));

  objc_msgSend(v6, "disconnectIDSSessionWithCourseIdentifier:instructorIdentifier:", v7, v8);
  -[STUDisconnectIDSConnectionOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
}

@end
