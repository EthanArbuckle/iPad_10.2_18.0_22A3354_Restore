@implementation GTConnectionMap

- (GTConnectionMap)init
{
  GTConnectionMap *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *idToConnection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GTConnectionMap;
  v2 = -[GTConnectionMap init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    idToConnection = v2->_idToConnection;
    v2->_idToConnection = v3;

    v2->_nextConnectionId = 1;
  }
  return v2;
}

- (void)insert:(id)a3
{
  NSMutableDictionary *idToConnection;
  unint64_t nextConnectionId;
  id v6;
  void *v7;

  idToConnection = self->_idToConnection;
  nextConnectionId = self->_nextConnectionId;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", nextConnectionId));
  -[NSMutableDictionary setObject:forKeyedSubscript:](idToConnection, "setObject:forKeyedSubscript:", v6, v7);

  ++self->_nextConnectionId;
}

- (unint64_t)remove:(id)a3
{
  NSMutableDictionary *idToConnection;
  void *v5;
  unint64_t v7;

  v7 = 0;
  -[GTConnectionMap retrieveId:forConnection:](self, "retrieveId:forConnection:", &v7, a3);
  idToConnection = self->_idToConnection;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
  -[NSMutableDictionary removeObjectForKey:](idToConnection, "removeObjectForKey:", v5);

  return v7;
}

- (BOOL)retrieveId:(unint64_t *)a3 forConnection:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeysForObject:](self->_idToConnection, "allKeysForObject:", a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  *a3 = (unint64_t)objc_msgSend(v6, "unsignedIntegerValue");

  LOBYTE(a3) = objc_msgSend(v5, "count") != 0;
  return (char)a3;
}

- (BOOL)retrieveConnection:(id *)a3 forId:(unint64_t)a4
{
  NSMutableDictionary *idToConnection;
  void *v6;

  idToConnection = self->_idToConnection;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  *a3 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](idToConnection, "objectForKeyedSubscript:", v6));

  return *a3 != 0;
}

- (NSArray)connections
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_idToConnection, "allValues");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idToConnection, 0);
}

@end
