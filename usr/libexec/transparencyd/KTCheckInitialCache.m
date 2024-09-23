@implementation KTCheckInitialCache

- (void)setPendingFlag:(id)a3 stateMachine:(id)a4
{
  id v5;
  id v6;
  KTPendingFlag *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]([KTPendingFlag alloc], "initWithFlag:conditions:delayInSeconds:", v6, 2, 60.0);

  objc_msgSend(v5, "_onqueueHandlePendingFlagLater:", v7);
}

- (KTCheckInitialCache)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 stateMachine:(id)a6
{
  id v9;
  id v10;
  id v11;
  KTCheckInitialCache *v12;
  KTCheckInitialCache *v13;
  void *v14;
  KTCheckInitialCache *v15;
  KTCheckInitialCache *v16;
  _QWORD v18[4];
  KTCheckInitialCache *v19;
  id v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v21.receiver = self;
  v21.super_class = (Class)KTCheckInitialCache;
  v12 = -[KTGroupOperation init](&v21, "init");
  v13 = v12;
  if (v12)
  {
    -[KTCheckInitialCache setNextState:](v12, "setNextState:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "smDataStore"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10010FCA8;
    v18[3] = &unk_100245D00;
    v15 = v13;
    v19 = v15;
    v20 = v11;
    objc_msgSend(v14, "fetchIDMSDeviceList:", v18);

    v16 = v15;
  }

  return v13;
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 120, 1);
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
