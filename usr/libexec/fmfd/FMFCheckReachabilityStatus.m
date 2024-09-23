@implementation FMFCheckReachabilityStatus

- (FMFCheckReachabilityStatus)initWithClientSession:(id)a3 idsClientStatusMap:(id)a4
{
  id v6;
  FMFCheckReachabilityStatus *v7;
  FMFCheckReachabilityStatus *v8;
  FMFCheckReachabilityStatus *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMFCheckReachabilityStatus;
  v7 = -[FMFBaseCmd initWithClientSession:](&v11, "initWithClientSession:", a3);
  v8 = v7;
  if (v6 && v7)
  {
    -[FMFCheckReachabilityStatus setStatusMap:](v7, "setStatusMap:", v6);
    v9 = (FMFCheckReachabilityStatus *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[FMFCheckReachabilityStatus setStatusMapFromServer:](v8, "setStatusMapFromServer:", v9);
  }
  else
  {
    -[FMFBaseCmd initFailed](v7, "initFailed");
    v9 = v8;
    v8 = 0;
  }

  return v8;
}

- (id)pathSuffix
{
  return CFSTR("contactStatus");
}

- (id)jsonBodyDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FMFCheckReachabilityStatus;
  v3 = -[FMFBaseCmd jsonBodyDictionary](&v9, "jsonBodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCheckReachabilityStatus statusMap](self, "statusMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("emails"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCheckReachabilityStatus statusMap](self, "statusMap"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("idsValidatedHandles"));

  return v4;
}

- (void)processCommandResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMFCheckReachabilityStatus;
  v4 = a3;
  -[FMFBaseCmd processCommandResponse:](&v8, "processCommandResponse:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commandResponse")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contactStatusMap")));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022E20;
  v7[3] = &unk_100099DC0;
  v7[4] = self;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (NSMutableDictionary)statusMapFromServer
{
  return self->_statusMapFromServer;
}

- (void)setStatusMapFromServer:(id)a3
{
  objc_storeStrong((id *)&self->_statusMapFromServer, a3);
}

- (NSDictionary)statusMap
{
  return self->_statusMap;
}

- (void)setStatusMap:(id)a3
{
  objc_storeStrong((id *)&self->_statusMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusMap, 0);
  objc_storeStrong((id *)&self->_statusMapFromServer, 0);
}

@end
