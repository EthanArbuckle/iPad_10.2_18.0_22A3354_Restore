@implementation W5LogItemRequestInternal

- (W5LogItemRequestInternal)init
{
  W5LogItemRequestInternal *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5LogItemRequestInternal;
  v2 = -[W5LogItemRequestInternal init](&v5, "init");
  if (v2)
  {
    v3 = os_transaction_create("com.apple.wifivelocity.W5LogItemRequestInternal");
    objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionCreate:transaction:", "com.apple.wifivelocity.W5LogItemRequestInternal", v3);
    v2->_transaction = (OS_os_transaction *)v3;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"), "osTransactionComplete:", self->_transaction);

  self->_transaction = 0;
  v3.receiver = self;
  v3.super_class = (Class)W5LogItemRequestInternal;
  -[W5LogItemRequestInternal dealloc](&v3, "dealloc");
}

- (id)description
{
  NSMutableString *v3;
  const char *v4;
  NSArray *itemRequests;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("UUID: %@\n"), self->_uuid);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("UID: %d\n"), self->_uid);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("GID: %d\n"), self->_gid);
  if (self->_includeEvents)
    v4 = "Yes";
  else
    v4 = "No";
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Events: %s\n"), v4);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Filename: %@\n"), self->_filename);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("AdditionalLog: %@\n"), self->_additionalLog);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Configuration: %@\n"), self->_configuration);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("AddedAt: %@\n"), self->_addedAt);
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("Requests:\n"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  itemRequests = self->_itemRequests;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](itemRequests, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(itemRequests);
        -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](itemRequests, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  return -[NSMutableString copy](v3, "copy");
}

- (BOOL)isEqualToLogItemRequestInternal:(id)a3
{
  return -[NSUUID isEqual:](self->_uuid, "isEqual:", objc_msgSend(a3, "uuid"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (a3 == self)
    return 1;
  if (a3)
  {
    v5 = objc_opt_class(self, a2);
    if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
      return -[W5LogItemRequestInternal isEqualToLogItemRequestInternal:](self, "isEqualToLogItemRequestInternal:", a3);
  }
  return 0;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSUUID hash](self->_uuid, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5LogItemRequestInternal *v4;

  v4 = -[W5LogItemRequestInternal init](+[W5LogItemRequestInternal allocWithZone:](W5LogItemRequestInternal, "allocWithZone:", a3), "init");
  -[W5LogItemRequestInternal setUuid:](v4, "setUuid:", self->_uuid);
  -[W5LogItemRequestInternal setItemRequests:](v4, "setItemRequests:", self->_itemRequests);
  -[W5LogItemRequestInternal setConfiguration:](v4, "setConfiguration:", self->_configuration);
  -[W5LogItemRequestInternal setFilename:](v4, "setFilename:", self->_filename);
  -[W5LogItemRequestInternal setAdditionalLog:](v4, "setAdditionalLog:", self->_additionalLog);
  -[W5LogItemRequestInternal setUid:](v4, "setUid:", self->_uid);
  -[W5LogItemRequestInternal setGid:](v4, "setGid:", self->_gid);
  -[W5LogItemRequestInternal setIncludeEvents:](v4, "setIncludeEvents:", self->_includeEvents);
  -[W5LogItemRequestInternal setAddedAt:](v4, "setAddedAt:", self->_addedAt);
  -[W5LogItemRequestInternal setReply:](v4, "setReply:", self->_reply);
  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSArray)itemRequests
{
  return self->_itemRequests;
}

- (void)setItemRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)additionalLog
{
  return self->_additionalLog;
}

- (void)setAdditionalLog:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (unsigned)gid
{
  return self->_gid;
}

- (void)setGid:(unsigned int)a3
{
  self->_gid = a3;
}

- (BOOL)includeEvents
{
  return self->_includeEvents;
}

- (void)setIncludeEvents:(BOOL)a3
{
  self->_includeEvents = a3;
}

- (NSDate)addedAt
{
  return self->_addedAt;
}

- (void)setAddedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

@end
