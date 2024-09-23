@implementation FRArticlePrefetchOperation

- (FRArticlePrefetchOperation)initWithHeadline:(id)a3 component:(unint64_t)a4 priority:(unint64_t)a5
{
  id v9;
  FRArticlePrefetchOperation *v10;
  FRArticlePrefetchOperation *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FRArticlePrefetchOperation;
  v10 = -[FRArticlePrefetchOperation init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_headline, a3);
    v11->_component = a4;
    v11->_priority = a5;
    v11->_cancellationLock._os_unfair_lock_opaque = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;

  v4 = a3;
  v6 = objc_opt_class(FRArticlePrefetchOperation, v5);
  v7 = FCDynamicCast(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchOperation headline](self, "headline"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "headline"));
    if (objc_msgSend(v9, "isEqual:", v10))
    {
      v11 = -[FRArticlePrefetchOperation component](self, "component");
      v12 = v11 == objc_msgSend(v8, "component");
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchOperation headline](self, "headline"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = -[FRArticlePrefetchOperation component](self, "component") ^ v4;

  return v5;
}

- (int64_t)compareExecutionOrder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FRArticlePrefetchOperation component](self, "component")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "component")));
  v7 = objc_msgSend(v5, "compare:", v6);

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FRArticlePrefetchOperation priority](self, "priority")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "priority")));
    v7 = objc_msgSend(v8, "compare:", v9);

  }
  return (int64_t)v7;
}

- (id)executeWithArticleContentPool:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;

  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v11 = "-[FRArticlePrefetchOperation executeWithArticleContentPool:completionHandler:]";
    v12 = 2080;
    v13 = "FRArticlePrefetchManager.m";
    v14 = 1024;
    v15 = 308;
    v16 = 2114;
    v17 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FRArticlePrefetchOperation executeWithArticleContentPool:completionHandler:]"));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v8, 0));

  objc_exception_throw(v9);
}

- (void)_doWorkIfNotCancelled:(id)a3
{
  _BOOL4 cancelled;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  os_unfair_lock_lock_with_options(&self->_cancellationLock, 0x10000);
  cancelled = self->_cancelled;
  os_unfair_lock_unlock(&self->_cancellationLock);
  v5 = v8;
  if (!cancelled)
  {
    v6 = (*((uint64_t (**)(void))v8 + 2))();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    os_unfair_lock_lock_with_options(&self->_cancellationLock, 0x10000);
    if (self->_cancelled)
    {
      os_unfair_lock_unlock(&self->_cancellationLock);
      objc_msgSend(v7, "cancel");
    }
    else
    {
      objc_storeStrong((id *)&self->_childCancelHandler, v7);
      os_unfair_lock_unlock(&self->_cancellationLock);
    }

    v5 = v8;
  }

}

- (void)cancel
{
  os_unfair_lock_s *p_cancellationLock;
  FCOperationCanceling *v4;

  p_cancellationLock = &self->_cancellationLock;
  os_unfair_lock_lock_with_options(&self->_cancellationLock, 0x10000);
  self->_cancelled = 1;
  v4 = self->_childCancelHandler;
  os_unfair_lock_unlock(p_cancellationLock);
  -[FCOperationCanceling cancel](v4, "cancel");

}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (unint64_t)component
{
  return self->_component;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_childCancelHandler, 0);
}

@end
