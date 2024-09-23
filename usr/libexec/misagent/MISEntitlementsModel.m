@implementation MISEntitlementsModel

- (MISEntitlementsModel)initWithDB:(id)a3
{
  id v4;
  MISEntitlementsModel *v5;
  MISEntitlementsModel *v6;
  MISEntitlementsModel *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MISEntitlementsModel;
  v5 = -[MISEntitlementsModel init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_weak_db, v4);
    v7 = v6;
  }

  return v6;
}

- (void)emitEntitlementPredicates:(id)a3 predicateHandler:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003F00;
  v6[3] = &unk_100010710;
  v7 = a4;
  v5 = v7;
  sub_100008900(a3, v6);

}

- (int)insertEntitlement:(id)a3 forProfile:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  unsigned __int8 v15;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_weak_db);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100003FE8;
  v12[3] = &unk_100010738;
  v13 = v7;
  v14 = v6;
  v15 = objc_msgSend(v6, "hasSuffix:", CFSTR("*"));
  v9 = v6;
  v10 = v7;
  LODWORD(v7) = objc_msgSend(WeakRetained, "executeQuery:withBind:withResults:", CFSTR("INSERT OR IGNORE INTO entitlements_provisioning_cache VALUES (NULL, @uuid, @predicate, @wildcard)"), v12, 0);

  return (int)v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weak_db);
}

@end
