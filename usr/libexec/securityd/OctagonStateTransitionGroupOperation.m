@implementation OctagonStateTransitionGroupOperation

- (id)initIntending:(id)a3 errorState:(id)a4
{
  id v7;
  id v8;
  OctagonStateTransitionGroupOperation *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OctagonStateTransitionGroupOperation;
  v9 = -[CKKSGroupOperation init](&v12, "init");
  p_isa = (id *)&v9->super.super.super.super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_nextState, a4);
    objc_storeStrong(p_isa + 17, a3);
  }

  return p_isa;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionGroupOperation name](self, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionGroupOperation intendedState](self, "intendedState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonStateTransitionGroupOperation nextState](self, "nextState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<OctagonStateTransitionGroupOperation(%@): intended:%@ actual:%@>"), v3, v4, v5));

  return v6;
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intendedState, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

+ (id)named:(id)a3 intending:(id)a4 errorState:(id)a5 withBlockTakingSelf:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(objc_alloc((Class)a1), "initIntending:errorState:", v11, v12);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v14);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10019A980;
  v18[3] = &unk_1002EA830;
  objc_copyWeak(&v20, &location);
  v15 = v13;
  v19 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v18));
  objc_msgSend(v14, "runBeforeGroupFinished:", v16);

  objc_msgSend(v14, "setName:", v10);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v14;
}

@end
