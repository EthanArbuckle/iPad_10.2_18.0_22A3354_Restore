@implementation CKKSFixupLocalReloadOperation

- (CKKSFixupLocalReloadOperation)initWithOperationDependencies:(id)a3 fixupNumber:(unint64_t)a4 ckoperationGroup:(id)a5 entering:(id)a6
{
  id v11;
  id v12;
  id v13;
  CKKSFixupLocalReloadOperation *v14;
  CKKSFixupLocalReloadOperation *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CKKSFixupLocalReloadOperation;
  v14 = -[CKKSGroupOperation init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_deps, a3);
    v15->_fixupNumber = a4;
    objc_storeStrong((id *)&v15->_group, a5);
    objc_storeStrong((id *)&v15->_intendedState, a6);
    objc_storeStrong((id *)&v15->_nextState, CFSTR("error"));
  }

  return v15;
}

- (id)description
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[CKKSFixupLocalReloadOperation fixupNumber](self, "fixupNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFixupLocalReloadOperation deps](self, "deps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "views"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSFixup:LocalReload (%d)(%@)>"), v3, v5));

  return v6;
}

- (void)groupStart
{
  CKKSReloadAllItemsOperation *v3;
  void *v4;
  CKKSReloadAllItemsOperation *v5;
  CKKSReloadAllItemsOperation *v6;
  void *v7;
  _QWORD v8[4];
  CKKSReloadAllItemsOperation *v9;
  id v10;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [CKKSReloadAllItemsOperation alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFixupLocalReloadOperation deps](self, "deps"));
  v5 = -[CKKSReloadAllItemsOperation initWithOperationDependencies:](v3, "initWithOperationDependencies:", v4);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100151248;
  v8[3] = &unk_1002EA8C8;
  objc_copyWeak(&v10, &location);
  v6 = v5;
  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("local-reload-cleanup"), v8));
  objc_msgSend(v7, "addNullableDependency:", v6);
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (CKOperationGroup)group
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 152, 1);
}

- (void)setGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (unint64_t)fixupNumber
{
  return self->_fixupNumber;
}

- (void)setFixupNumber:(unint64_t)a3
{
  self->_fixupNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
