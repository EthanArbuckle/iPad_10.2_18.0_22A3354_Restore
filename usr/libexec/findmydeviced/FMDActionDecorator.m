@implementation FMDActionDecorator

- (FMDActionDecorator)initWithAction:(id)a3 usingCompletion:(id)a4
{
  id v6;
  id v7;
  FMDActionDecorator *v8;
  FMDActionDecorator *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDActionDecorator;
  v8 = -[FMDActionDecorator init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[FMDActionDecorator setInnerAction:](v8, "setInnerAction:", v6);
    -[FMDActionDecorator setCompletion:](v9, "setCompletion:", v7);
  }

  return v9;
}

- (id)actionType
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(FMDActionDecorator, a2);
  return NSStringFromClass(v2);
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  FMDActionDecorator *v14;
  __int16 v15;
  void *v16;

  v4 = a3;
  v5 = sub_100052F5C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDActionDecorator innerAction](self, "innerAction"));
    *(_DWORD *)buf = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ run inner action - %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDActionDecorator innerAction](self, "innerAction"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000661B8;
  v10[3] = &unk_1002C1CF8;
  objc_copyWeak(&v12, (id *)buf);
  v9 = v4;
  v11 = v9;
  objc_msgSend(v8, "runWithCompletion:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDActionDecorator innerAction](self, "innerAction"));
  v6 = objc_opt_respondsToSelector(v5, "shouldCancelAction:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDActionDecorator innerAction](self, "innerAction"));
    v8 = objc_msgSend(v7, "shouldCancelAction:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)willCancelAction
{
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  FMDActionDecorator *v10;
  __int16 v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDActionDecorator innerAction](self, "innerAction"));
  v4 = objc_opt_respondsToSelector(v3, "willCancelAction");

  if ((v4 & 1) != 0)
  {
    v5 = sub_100052F5C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDActionDecorator innerAction](self, "innerAction"));
      v9 = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ will cancel inner action - %@", (uint8_t *)&v9, 0x16u);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDActionDecorator innerAction](self, "innerAction"));
    objc_msgSend(v8, "willCancelAction");

  }
}

- (BOOL)shouldWaitForAction:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDActionDecorator innerAction](self, "innerAction"));
  v6 = objc_msgSend(v5, "shouldWaitForAction:", v4);

  return v6;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDActionDecorator innerAction](self, "innerAction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%p:%@"), v3, self, v4));

  return (NSString *)v5;
}

- (Action)innerAction
{
  return self->_innerAction;
}

- (void)setInnerAction:(id)a3
{
  objc_storeStrong((id *)&self->_innerAction, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_innerAction, 0);
}

@end
