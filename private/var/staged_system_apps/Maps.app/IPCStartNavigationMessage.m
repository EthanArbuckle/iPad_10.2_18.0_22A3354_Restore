@implementation IPCStartNavigationMessage

+ (id)startNavigationMessageWithLoadDirectionsMessage:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc_init((Class)a1);
    objc_msgSend(v5, "setLoadDirectionsMessage:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (IPCStartNavigationMessage)initWithDictionary:(id)a3
{
  id v4;
  IPCStartNavigationMessage *v5;
  void *v6;
  IPCLoadDirectionsMessage *v7;
  void *v8;
  IPCLoadDirectionsMessage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IPCStartNavigationMessage;
  v5 = -[IPCMessageObject initWithDictionary:](&v16, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCStartNavigationMessageLoadDirectionsMessageKey")));

    if (v6)
    {
      v7 = [IPCLoadDirectionsMessage alloc];
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCStartNavigationMessageLoadDirectionsMessageKey")));
      v9 = -[IPCLoadDirectionsMessage initWithDictionary:](v7, "initWithDictionary:", v8);
      -[IPCStartNavigationMessage setLoadDirectionsMessage:](v5, "setLoadDirectionsMessage:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCStartNavigationMessageOriginIsWatchKey")));
      -[IPCStartNavigationMessage setOriginIsWatch:](v5, "setOriginIsWatch:", objc_msgSend(v10, "BOOLValue"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCStartNavigationMessageRouteIDKey")));
      -[IPCStartNavigationMessage setRouteID:](v5, "setRouteID:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kIPCStartNavigationMessageRouteIndexKey")));
      v13 = v12;
      if (v12)
        v14 = (uint64_t)objc_msgSend(v12, "unsignedIntegerValue");
      else
        v14 = 0x7FFFFFFFFFFFFFFFLL;
      -[IPCStartNavigationMessage setRouteIndex:](v5, "setRouteIndex:", v14);

    }
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)IPCStartNavigationMessage;
  v3 = -[IPCMessageObject dictionaryValue](&v14, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IPCStartNavigationMessage loadDirectionsMessage](self, "loadDirectionsMessage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dictionaryValue"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kIPCStartNavigationMessageLoadDirectionsMessageKey"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[IPCStartNavigationMessage originIsWatch](self, "originIsWatch")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("kIPCStartNavigationMessageOriginIsWatchKey"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IPCStartNavigationMessage routeID](self, "routeID"));
  v10 = objc_msgSend(v9, "copy");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("kIPCStartNavigationMessageRouteIDKey"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[IPCStartNavigationMessage routeIndex](self, "routeIndex")));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("kIPCStartNavigationMessageRouteIndexKey"));

  v12 = objc_msgSend(v5, "copy");
  return v12;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IPCStartNavigationMessage;
  v3 = -[IPCStartNavigationMessage description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCStartNavigationMessage dictionaryValue](self, "dictionaryValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (BOOL)matchesLoadDirectionsMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  unsigned __int8 v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCStartNavigationMessage loadDirectionsMessage](self, "loadDirectionsMessage"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeContextData"));
  if (v6
    && (v7 = (void *)v6,
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeContextData")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeContextData")),
        v10 = objc_msgSend(v8, "isEqualToData:", v9),
        v9,
        v8,
        v7,
        (v10 & 1) != 0))
  {
    v11 = 1;
  }
  else
  {
    v11 = objc_msgSend(v5, "isEqual:", v4);
  }

  return v11;
}

- (IPCLoadDirectionsMessage)loadDirectionsMessage
{
  return self->_loadDirectionsMessage;
}

- (void)setLoadDirectionsMessage:(id)a3
{
  objc_storeStrong((id *)&self->_loadDirectionsMessage, a3);
}

- (BOOL)originIsWatch
{
  return self->_originIsWatch;
}

- (void)setOriginIsWatch:(BOOL)a3
{
  self->_originIsWatch = a3;
}

- (NSData)routeID
{
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)routeIndex
{
  return self->_routeIndex;
}

- (void)setRouteIndex:(unint64_t)a3
{
  self->_routeIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_loadDirectionsMessage, 0);
}

@end
