@implementation CKKSCuttlefishAdapter

- (CKKSCuttlefishAdapter)initWithConnection:(id)a3
{
  id v4;
  CKKSCuttlefishAdapter *v5;
  CuttlefishXPCWrapper *v6;
  CuttlefishXPCWrapper *cuttlefishXPCWrapper;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSCuttlefishAdapter;
  v5 = -[CKKSCuttlefishAdapter init](&v9, "init");
  if (v5)
  {
    v6 = -[CuttlefishXPCWrapper initWithCuttlefishXPCConnection:]([CuttlefishXPCWrapper alloc], "initWithCuttlefishXPCConnection:", v4);
    cuttlefishXPCWrapper = v5->_cuttlefishXPCWrapper;
    v5->_cuttlefishXPCWrapper = v6;

  }
  return v5;
}

- (void)fetchCurrentItem:(id)a3 items:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCuttlefishAdapter cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000550B0;
  v14[3] = &unk_1002E9658;
  v15 = v8;
  v16 = v9;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v11, "fetchCurrentItemWithSpecificUser:items:reply:", v10, v12, v14);

}

- (void)fetchPCSIdentityByKey:(id)a3 pcsservices:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCuttlefishAdapter cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100054F4C;
  v14[3] = &unk_1002E9658;
  v15 = v8;
  v16 = v9;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v11, "fetchPCSIdentityByPublicKeyWithSpecificUser:pcsservices:reply:", v10, v12, v14);

}

- (CuttlefishXPCWrapper)cuttlefishXPCWrapper
{
  return (CuttlefishXPCWrapper *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCuttlefishXPCWrapper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cuttlefishXPCWrapper, 0);
}

@end
