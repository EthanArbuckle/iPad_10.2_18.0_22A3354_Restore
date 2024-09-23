@implementation STUSendIDSMessageOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  _UNKNOWN **v15;
  uint64_t v16;
  void *v18;
  void *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  objc_super v26;

  v6 = a3;
  v26.receiver = a1;
  v26.super_class = (Class)&OBJC_METACLASS___STUSendIDSMessageOperation;
  if (!objc_msgSendSuper2(&v26, "validateRequest:error:", v6, a4))
    goto LABEL_11;
  v7 = objc_opt_class(CRKSendIDSMessageRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = v6;
    v9 = objc_opt_class(CRKSendIDSMessageRequest);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[STUSendIDSMessageOperation validateRequest:error:]"));
      v20 = (objc_class *)objc_opt_class(CRKSendIDSMessageRequest);
      v21 = NSStringFromClass(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = (objc_class *)objc_opt_class(v8);
      v24 = NSStringFromClass(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("STUSendIDSMessageOperation.m"), 30, CFSTR("expected %@, got %@"), v22, v25);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "destinationAddress"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sourceAppleID"));

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "message"));

        if (v12)
        {
          v13 = 1;
LABEL_20:

          goto LABEL_21;
        }
        if (a4)
        {
          v15 = &off_1000D2A70;
          goto LABEL_18;
        }
LABEL_19:
        v13 = 0;
        goto LABEL_20;
      }
      if (!a4)
        goto LABEL_19;
      v15 = &off_1000D2A48;
    }
    else
    {
      if (!a4)
        goto LABEL_19;
      v15 = &off_1000D2A20;
    }
LABEL_18:
    v16 = CRKErrorWithCodeAndUserInfo(2, v15);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_20;
  }
  if (a4)
  {
    v14 = CRKErrorWithCodeAndUserInfo(2, &off_1000D29F8);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v14);
  }
  else
  {
LABEL_11:
    v13 = 0;
  }
LABEL_21:

  return v13;
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUSendIDSMessageOperation;
  -[STUTaskOperation cancel](&v4, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000695C;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)runWithRequest:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  _QWORD v25[6];

  v5 = a3;
  v6 = objc_opt_class(CRKSendIDSMessageRequest);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STUSendIDSMessageOperation runWithRequest:]"));
    v19 = (objc_class *)objc_opt_class(CRKSendIDSMessageRequest);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (objc_class *)objc_opt_class(v5);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("STUSendIDSMessageOperation.m"), 66, CFSTR("expected %@, got %@"), v21, v24);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "options"));
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_opt_new(CRKIDSMessageOptions);
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[STUEnvironment shared](STUEnvironment, "shared"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "whiteboard"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "IDSPrimitives"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "message"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destinationAddress"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceAppleID"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100006BB8;
  v25[3] = &unk_1000C9810;
  v25[4] = self;
  v25[5] = a2;
  objc_msgSend(v13, "sendMessage:destinationAddress:sourceAppleID:options:completion:", v14, v15, v16, v10, v25);

}

@end
