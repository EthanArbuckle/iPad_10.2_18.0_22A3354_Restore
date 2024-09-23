@implementation PeerRateLimiter

- (id)setUpConfigForPeer
{
  void *v2;
  void *v3;
  uint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("<?xml version=\"1.0\" encoding=\"UTF-8\"?>                          <!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">                          <plist version=\"1.0\">                          <dict>                          <key>general</key>                          <dict>                          <key>maxStateSize</key>                          <integer>250</integer>                          <key>maxItemAge</key>                          <integer>3600</integer>                          <key>overloadDuration</key>                          <integer>1800</integer>                          <key>name</key>                          <string>SOS</string>                          <key>MAType</key>                          <string></string>                          </dict>                          <key>groups</key>                          <array>                                <dict>                                    <key>property</key>                                    <string>global</string>                                    <key>capacity</key>                                    <integer>1000</integer>                                    <key>rate</key>                                    <integer>10</integer>                                    <key>badness</key>                                    <integer>1</integer>                                </dict>                                <dict>                                    <key>property</key>                                    <string>accessGroup</string>                                    <key>capacity</key>                                    <integer>50</integer>                                    <key>rate</key>                                    <integer>900</integer>                                    <key>badness</key>                                    <integer>3</integer>                                </dict>                          </array>                          </dict>                          </plist>                          "), "dataUsingEncoding:", 4));
  v5 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v2, 0, 0, &v5));

  return v3;
}

- (PeerRateLimiter)initWithPeer:(__OpaqueSOSPeer *)a3
{
  void *v5;
  PeerRateLimiter *v6;
  id v7;
  id v8;
  id v9;
  objc_super v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PeerRateLimiter setUpConfigForPeer](self, "setUpConfigForPeer"));
  v11.receiver = self;
  v11.super_class = (Class)PeerRateLimiter;
  v6 = -[RateLimiter initWithConfig:](&v11, "initWithConfig:", v5);

  if (v6)
  {
    -[PeerRateLimiter setPeerID:](v6, "setPeerID:", *((_QWORD *)a3 + 2));
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    -[PeerRateLimiter setAccessGroupRateLimitState:](v6, "setAccessGroupRateLimitState:", v7);

    v8 = objc_alloc_init((Class)NSMutableDictionary);
    -[PeerRateLimiter setAccessGroupToTimer:](v6, "setAccessGroupToTimer:", v8);

    v9 = objc_alloc_init((Class)NSMutableDictionary);
    -[PeerRateLimiter setAccessGroupToNextMessageToSend:](v6, "setAccessGroupToNextMessageToSend:", v9);

  }
  return v6;
}

- (int)stateForAccessGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PeerRateLimiter accessGroupRateLimitState](self, "accessGroupRateLimitState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (v6)
  {
    v7 = objc_msgSend(v6, "intValue");
  }
  else
  {
    v7 = 1;
    v8 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLong:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PeerRateLimiter accessGroupRateLimitState](self, "accessGroupRateLimitState"));
    objc_msgSend(v9, "setObject:forKey:", v8, v4);

  }
  return v7;
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)accessGroupRateLimitState
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAccessGroupRateLimitState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)accessGroupToTimer
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAccessGroupToTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableDictionary)accessGroupToNextMessageToSend
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAccessGroupToNextMessageToSend:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessGroupToNextMessageToSend, 0);
  objc_storeStrong((id *)&self->_accessGroupToTimer, 0);
  objc_storeStrong((id *)&self->_accessGroupRateLimitState, 0);
  objc_storeStrong((id *)&self->peerID, 0);
}

@end
