@implementation B2PDataSessionDiscoveryEntry

- (B2PDataSessionDiscoveryEntry)initWithSessionID:(unsigned __int8)a3 tag:(id)a4
{
  id v6;
  B2PDataSessionDiscoveryEntry *v7;
  B2PDataSessionDiscoveryEntry *v8;
  uint64_t v9;
  NSString *tag;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)B2PDataSessionDiscoveryEntry;
  v7 = -[B2PDataSessionDiscoveryEntry init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_sessionID = a3;
    v9 = objc_msgSend(v6, "copy");
    tag = v8->_tag;
    v8->_tag = (NSString *)v9;

  }
  return v8;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (NSString)tag
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
