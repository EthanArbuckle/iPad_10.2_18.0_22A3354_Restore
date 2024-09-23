@implementation _OfflineMapsExpiredSubscription

- (_OfflineMapsExpiredSubscription)initWithSubscription:(id)a3
{
  id v5;
  _OfflineMapsExpiredSubscription *v6;
  _OfflineMapsExpiredSubscription *v7;
  _OfflineMapsExpiredSubscription *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_OfflineMapsExpiredSubscription;
  v6 = -[_OfflineMapsExpiredSubscription init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscription, a3);
    v8 = v7;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMapDataSubscription identifier](self->_subscription, "identifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  _OfflineMapsExpiredSubscription *v4;
  _OfflineMapsExpiredSubscription *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = (_OfflineMapsExpiredSubscription *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_OfflineMapsExpiredSubscription subscription](v5, "subscription"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_OfflineMapsExpiredSubscription subscription](self, "subscription"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v11 = objc_msgSend(v8, "isEqual:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (GEOMapDataSubscription)subscription
{
  return self->_subscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
}

@end
