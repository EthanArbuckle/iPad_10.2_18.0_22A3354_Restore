@implementation MFUserInteractionAssertion

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C3CC4;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA4A8 != -1)
    dispatch_once(&qword_1005AA4A8, block);
  return (OS_os_log *)(id)qword_1005AA4A0;
}

- (unint64_t)signpostID
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_signpost_id_make_with_pointer(v4, self);

  return v5;
}

+ (id)interactionAssertionWithReason:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[MFUserInteractionAssertion interactionAssertionWithReason:timeout:](MFUserInteractionAssertion, "interactionAssertionWithReason:timeout:", a3, -978307200.0));
}

+ (id)interactionAssertionWithReason:(id)a3 timeout:(double)a4
{
  id v5;
  MFUserInteractionAssertion *v6;

  v5 = a3;
  v6 = -[MFUserInteractionAssertion initWithReason:timeout:]([MFUserInteractionAssertion alloc], "initWithReason:timeout:", v5, a4);

  return v6;
}

- (MFUserInteractionAssertion)initWithReason:(id)a3 timeout:(double)a4
{
  id v6;
  void *v7;
  MFUserInteractionAssertion *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = -[MFUserInteractionAssertion initWithReason:timeout:application:](self, "initWithReason:timeout:application:", v6, v7, a4);

  return v8;
}

- (MFUserInteractionAssertion)initWithReason:(id)a3 timeout:(double)a4 application:(id)a5
{
  id v8;
  id v9;
  MFUserInteractionAssertion *v10;
  NSString *v11;
  NSString *reason;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  char *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  double timeout;
  id v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  char *v32;
  objc_super v33;
  _BYTE buf[24];

  v8 = a3;
  v9 = a5;
  v33.receiver = self;
  v33.super_class = (Class)MFUserInteractionAssertion;
  v10 = -[MFUserInteractionAssertion init](&v33, "init");
  if (v10)
  {
    v11 = (NSString *)objc_msgSend(v8, "copy");
    reason = v10->_reason;
    v10->_reason = v11;

    v10->_timeout = a4;
    v14 = MFLogGeneral(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "MFUserInteractionAssertion beginIgnoringInteractionEvents with reason:%{public}@", buf, 0xCu);
    }

    v16 = -[MFUserInteractionAssertion signpostID](v10, "signpostID");
    v17 = objc_claimAutoreleasedReturnValue(+[MFUserInteractionAssertion signpostLog](MFUserInteractionAssertion, "signpostLog"));
    v18 = v17;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v16, "MFUserInteractionAssertion", "Reason=%@", buf, 0xCu);
    }

    v19 = objc_msgSend(objc_alloc((Class)EFDeallocInvocationToken), "initWithLabel:", CFSTR("MFUserInteractionAssertion Invalidation Token"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1001C422C;
    v29[3] = &unk_100523398;
    v30 = v9;
    v21 = v19;
    v31 = v21;
    v32 = v16;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "performCancelableBlock:", v29));

    if (v22)
      objc_msgSend(v21, "addInvocable:", v22);
    objc_storeStrong((id *)&v10->_invalidationToken, v19);
    if (v10->_timeout != -978307200.0)
    {
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
      timeout = v10->_timeout;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1001C4350;
      v27[3] = &unk_10051B1B8;
      objc_copyWeak(&v28, (id *)buf);
      v25 = objc_msgSend(v23, "afterDelay:performBlock:", v27, timeout);

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
    }

  }
  return v10;
}

- (NSString)description
{
  unint64_t v3;
  const __CFString *v4;
  double v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = -[MFUserInteractionAssertion state](self, "state");
  if (v3 > 2)
    v4 = CFSTR("unknown");
  else
    v4 = off_1005233B8[v3];
  -[MFUserInteractionAssertion timeout](self, "timeout");
  if (v5 == -978307200.0)
  {
    v7 = CFSTR("never");
  }
  else
  {
    -[MFUserInteractionAssertion timeout](self, "timeout");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.01f"), v6));
  }
  v8 = objc_opt_class(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFUserInteractionAssertion reason](self, "reason"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> reason='%@' state=%@ timeout=%@"), v8, self, v9, v4, v7));

  return (NSString *)v10;
}

- (void)invalidate
{
  -[MFUserInteractionAssertion _invalidateWithState:](self, "_invalidateWithState:", 1);
}

- (void)_invalidateWithState:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9[2];
  id location;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFUserInteractionAssertion invalidationToken](self, "invalidationToken"));
  if ((objc_msgSend(v5, "isInvoked") & 1) == 0)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    objc_copyWeak(v9, &location);
    v8 = v5;
    v9[1] = (id)a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_1001C45E4, &unk_10051CF98));
    objc_msgSend(v6, "performBlock:", &v7);

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }

}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (EFDeallocInvocationToken)invalidationToken
{
  return self->_invalidationToken;
}

- (void)setInvalidationToken:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationToken, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
