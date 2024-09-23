@implementation KTStateTransitionOperation

- (id)initIntending:(id)a3 errorState:(id)a4
{
  id v7;
  id v8;
  KTStateTransitionOperation *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KTStateTransitionOperation;
  v9 = -[KTResultOperation init](&v12, "init");
  p_isa = (id *)&v9->super.super.super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_nextState, a4);
    objc_storeStrong(p_isa + 10, a3);
  }

  return p_isa;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionOperation name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionOperation intendedState](self, "intendedState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTStateTransitionOperation nextState](self, "nextState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<KTStateTransitionOperation(%@): intended:%@ actual:%@>"), v3, v4, v5));

  return v6;
}

+ (id)named:(id)a3 intending:(id)a4 errorState:(id)a5 withBlockTakingSelf:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(objc_alloc((Class)a1), "initIntending:errorState:", v11, v12);
  location = 0;
  objc_initWeak(&location, v14);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100111898;
  v17[3] = &unk_100245D38;
  objc_copyWeak(&v19, &location);
  v15 = v13;
  v18 = v15;
  objc_msgSend(v14, "addExecutionBlock:", v17);
  objc_msgSend(v14, "setName:", v10);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v14;
}

+ (id)named:(id)a3 entering:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initIntending:errorState:", v6, v6);

  objc_msgSend(v8, "setName:", v7);
  return v8;
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intendedState, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

@end
