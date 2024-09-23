@implementation _BKMousePointerServerClientRecord

- (_BKMousePointerServerClientRecord)init
{
  _BKMousePointerServerClientRecord *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *perDisplayUUIDInfo;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_BKMousePointerServerClientRecord;
  v2 = -[_BKMousePointerServerClientRecord init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    perDisplayUUIDInfo = v2->_perDisplayUUIDInfo;
    v2->_perDisplayUUIDInfo = v3;

  }
  return v2;
}

- (void)setPID:(int)a3
{
  self->_pid = a3;
}

- (void)setEntitlements:(id)a3
{
  objc_storeStrong((id *)&self->_entitlements, a3);
}

- (id)infoForDisplayUUID:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  _BKMousePointerServerClientPerDisplay *v8;

  v4 = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_perDisplayUUIDInfo, "objectForKeyedSubscript:", v6));
  v8 = (_BKMousePointerServerClientPerDisplay *)v7;
  if (v4 && !v7)
  {
    v8 = objc_alloc_init(_BKMousePointerServerClientPerDisplay);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_perDisplayUUIDInfo, "setObject:forKeyedSubscript:", v8, v6);
  }

  return v8;
}

- (BOOL)hasEntitlement:(id)a3
{
  return -[NSSet containsObject:](self->_entitlements, "containsObject:", a3);
}

- (NSMutableDictionary)perDisplayUUIDInfo
{
  return self->_perDisplayUUIDInfo;
}

- (void)setPerDisplayUUIDInfo:(id)a3
{
  objc_storeStrong((id *)&self->_perDisplayUUIDInfo, a3);
}

- (NSSet)entitlements
{
  return self->_entitlements;
}

- (int)pid
{
  return self->_pid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_perDisplayUUIDInfo, 0);
}

@end
