@implementation STUListenForIDSMessagesOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUListenForIDSMessagesOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKListenForIDSMessagesRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D3998);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (void)cancel
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000455F4;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;

  -[STUListenForIDSMessagesOperation setTotalUnitCount:](self, "setTotalUnitCount:", 2);
  -[STUListenForIDSMessagesOperation setCompletedUnitCount:](self, "setCompletedUnitCount:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "IDSMessageBroadcaster"));
  objc_msgSend(v5, "addBroadcastHandler:", self);

  -[STUListenForIDSMessagesOperation setCompletedUnitCount:](self, "setCompletedUnitCount:", 1);
}

- (void)processMessage:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_autoreleasePoolPush();
  v11 = objc_msgSend(objc_alloc((Class)CRKIDSMessageNotificationInfo), "initWithMessage:senderAppleID:senderAddress:", v14, v8, v9);
  v12 = CRKDidReceiveIDSMessageNotificationName;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dictionaryValue"));
  -[STUListenForIDSMessagesOperation postNotificationWithName:userInfo:](self, "postNotificationWithName:userInfo:", v12, v13);

  objc_autoreleasePoolPop(v10);
}

@end
