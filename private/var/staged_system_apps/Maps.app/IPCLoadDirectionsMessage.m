@implementation IPCLoadDirectionsMessage

- (IPCLoadDirectionsMessage)initWithDictionary:(id)a3
{
  id v4;
  IPCLoadDirectionsMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IPCLoadDirectionsMessage;
  v5 = -[IPCMessageObject initWithDictionary:](&v13, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCLoadDirectionsMessageURL")));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCLoadDirectionsMessageURL")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));
      -[IPCLoadDirectionsMessage setUrl:](v5, "setUrl:", v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCLoadDirectionsMessageOriginIsWatch")));
    -[IPCLoadDirectionsMessage setOriginIsWatch:](v5, "setOriginIsWatch:", objc_msgSend(v9, "BOOLValue"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCLoadDirectionsMessageRouteContextData")));
    -[IPCLoadDirectionsMessage setRouteContextData:](v5, "setRouteContextData:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCLoadDirectionsMessageRoutePersistentData")));
    -[IPCLoadDirectionsMessage setRoutePersistentData:](v5, "setRoutePersistentData:", v11);

  }
  return v5;
}

- (id)dictionaryValue
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)IPCLoadDirectionsMessage;
  v3 = -[IPCMessageObject dictionaryValue](&v15, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLoadDirectionsMessage url](self, "url"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kIPCLoadDirectionsMessageURL"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCLoadDirectionsMessage originIsWatch](self, "originIsWatch")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("kIPCLoadDirectionsMessageOriginIsWatch"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLoadDirectionsMessage routeContextData](self, "routeContextData"));
  v10 = objc_msgSend(v9, "copy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("kIPCLoadDirectionsMessageRouteContextData"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLoadDirectionsMessage routePersistentData](self, "routePersistentData"));
  v12 = objc_msgSend(v11, "copy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("kIPCLoadDirectionsMessageRoutePersistentData"));

  v13 = objc_msgSend(v5, "copy");
  return v13;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IPCLoadDirectionsMessage;
  v3 = -[IPCLoadDirectionsMessage description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCLoadDirectionsMessage dictionaryValue](self, "dictionaryValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)originIsWatch
{
  return self->_originIsWatch;
}

- (void)setOriginIsWatch:(BOOL)a3
{
  self->_originIsWatch = a3;
}

- (NSData)routeContextData
{
  return self->_routeContextData;
}

- (void)setRouteContextData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)routePersistentData
{
  return self->_routePersistentData;
}

- (void)setRoutePersistentData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePersistentData, 0);
  objc_storeStrong((id *)&self->_routeContextData, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
