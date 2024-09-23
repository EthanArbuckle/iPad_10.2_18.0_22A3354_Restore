@implementation STUPostUserNotificationOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUPostUserNotificationOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKPostUserNotificationRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D3AB0);
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
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUPostUserNotificationOperation;
  -[STUTaskOperation cancel](&v4, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048F7C;
  block[3] = &unk_1000C97E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)operationWillFinish
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[STUPostUserNotificationOperation userNotification](self, "userNotification"));
  objc_msgSend(v2, "cancel");

}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "notificationType") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primitives"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userNotificationPrimitives"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "postRemoteConnectionNotificationWithInstructorName:actionHandler:", CFSTR("Moira Dawson"), &stru_1000CB028));
LABEL_6:
    v9 = (void *)v7;
    -[STUPostUserNotificationOperation setUserNotification:](self, "setUserNotification:", v7);

    goto LABEL_7;
  }
  if (!objc_msgSend(v10, "notificationType"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primitives"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userNotificationPrimitives"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "postInformativeNotificationWithTitle:subtitle:", CFSTR("SomeTitle"), CFSTR("SomeSubtitle")));
    goto LABEL_6;
  }
  v8 = CRKErrorWithCodeAndUserInfo(2, &off_1000D3AD8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[STUPostUserNotificationOperation endOperationWithError:](self, "endOperationWithError:", v4);
LABEL_7:

}

- (STUUserNotification)userNotification
{
  return self->_userNotification;
}

- (void)setUserNotification:(id)a3
{
  objc_storeStrong((id *)&self->_userNotification, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotification, 0);
}

@end
