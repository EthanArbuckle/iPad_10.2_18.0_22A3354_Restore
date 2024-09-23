@implementation MapDataSubscriptionInfo

- (MapDataSubscriptionInfo)initWithSubscription:(id)a3 state:(id)a4
{
  id v7;
  id v8;
  MapDataSubscriptionInfo *v9;
  MapDataSubscriptionInfo *v10;
  MapDataSubscriptionInfo *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MapDataSubscriptionInfo;
  v9 = -[MapDataSubscriptionInfo init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subscription, a3);
    objc_storeStrong((id *)&v10->_state, a4);
    v11 = v10;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo subscription](self, "subscription"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  MapDataSubscriptionInfo *v4;
  MapDataSubscriptionInfo *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = (MapDataSubscriptionInfo *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo subscription](v5, "subscription"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo subscription](self, "subscription"));
    if (v7 == v8)
      v9 = 1;
    else
      v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (GEOMapDataSubscription)subscription
{
  return self->_subscription;
}

- (GEOMapDataSubscriptionState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (GEOMapDataSubscriptionState)pairedDeviceState
{
  return self->_pairedDeviceState;
}

- (void)setPairedDeviceState:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDeviceState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceState, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
}

@end
