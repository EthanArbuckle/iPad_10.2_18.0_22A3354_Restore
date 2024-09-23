@implementation GKDelayedRequestsNetworkWriter

+ (id)writerWithTransport:(id)a3 forBagKey:(id)a4
{
  id v5;
  id v6;
  GKDelayedRequestsNetworkWriter *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[GKDelayedRequestsNetworkWriter initWithTransport:forBagKey:]([GKDelayedRequestsNetworkWriter alloc], "initWithTransport:forBagKey:", v6, v5);

  return v7;
}

- (GKDelayedRequestsNetworkWriter)initWithTransport:(id)a3 forBagKey:(id)a4
{
  id v6;
  id v7;
  GKDelayedRequestsNetworkWriter *v8;
  GKDelayedRequestsNetworkWriter *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKDelayedRequestsNetworkWriter;
  v8 = -[GKDelayedRequestsNetworkWriter init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[GKDelayedRequestsNetworkWriter setTransport:](v8, "setTransport:", v6);
    -[GKDelayedRequestsNetworkWriter setBagKey:](v9, "setBagKey:", v7);
  }

  return v9;
}

- (void)writeResources:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  GKDataTransport *transport;
  NSString *bagKey;
  NSString *v18;
  void *v19;
  id v20;
  id obj;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_gkValuesForKeyPath:", CFSTR("resourceID")));
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is being asked to submit a delayed request for multiple players:%@. This is not currently supported. Bag key: %@"), v8, objc_opt_class(self, v9), self->_bagKey);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v19, 0));

    objc_exception_throw(v20);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(obj);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_gkResourceWithID:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v13)));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "representedItem"));

        bagKey = self->_bagKey;
        transport = self->_transport;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000D2058;
        v22[3] = &unk_1002BC0D0;
        v23 = v7;
        -[GKDataTransport postRequest:forBagKey:result:](transport, "postRequest:forBagKey:result:", v15, bagKey, v22);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

}

- (NSString)bagKey
{
  return self->_bagKey;
}

- (void)setBagKey:(id)a3
{
  objc_storeStrong((id *)&self->_bagKey, a3);
}

- (GKDataTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_storeStrong((id *)&self->_transport, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_bagKey, 0);
}

@end
