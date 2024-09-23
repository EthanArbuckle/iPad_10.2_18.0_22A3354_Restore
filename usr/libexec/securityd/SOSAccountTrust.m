@implementation SOSAccountTrust

- (SOSAccountTrust)init
{
  SOSAccountTrust *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SOSAccountTrust;
  v2 = -[SOSAccountTrust init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[SOSAccountTrust setRetirees:](v2, "setRetirees:", v3);

    -[SOSAccountTrust setFullPeerInfo:](v2, "setFullPeerInfo:", 0);
    -[SOSAccountTrust setTrustedCircle:](v2, "setTrustedCircle:", 0);
    -[SOSAccountTrust setDepartureCode:](v2, "setDepartureCode:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[SOSAccountTrust setExpansion:](v2, "setExpansion:", v4);

  }
  return v2;
}

- (SOSAccountTrust)initWithRetirees:(id)a3 fpi:(__OpaqueSOSFullPeerInfo *)a4 circle:(__OpaqueSOSCircle *)a5 departureCode:(int)a6 peerExpansion:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  SOSAccountTrust *v14;
  SOSAccountTrust *v15;
  objc_super v17;

  v8 = *(_QWORD *)&a6;
  v12 = a3;
  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)SOSAccountTrust;
  v14 = -[SOSAccountTrust init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    -[SOSAccountTrust setRetirees:](v14, "setRetirees:", v12);
    -[SOSAccountTrust setFullPeerInfo:](v15, "setFullPeerInfo:", a4);
    -[SOSAccountTrust setTrustedCircle:](v15, "setTrustedCircle:", a5);
    -[SOSAccountTrust setDepartureCode:](v15, "setDepartureCode:", v8);
    -[SOSAccountTrust setExpansion:](v15, "setExpansion:", v13);
  }

  return v15;
}

- (void)dealloc
{
  __OpaqueSOSFullPeerInfo *fullPeerInfo;
  __OpaqueSOSPeerInfo *peerInfo;
  __OpaqueSOSCircle *trustedCircle;
  __SecKey *cachedOctagonSigningKey;
  __SecKey *cachedOctagonEncryptionKey;
  objc_super v8;

  if (self)
  {
    fullPeerInfo = self->fullPeerInfo;
    if (fullPeerInfo)
    {
      self->fullPeerInfo = 0;
      CFRelease(fullPeerInfo);
    }
    peerInfo = self->peerInfo;
    if (peerInfo)
    {
      self->peerInfo = 0;
      CFRelease(peerInfo);
    }
    trustedCircle = self->trustedCircle;
    if (trustedCircle)
    {
      self->trustedCircle = 0;
      CFRelease(trustedCircle);
    }
    cachedOctagonSigningKey = self->_cachedOctagonSigningKey;
    if (cachedOctagonSigningKey)
    {
      self->_cachedOctagonSigningKey = 0;
      CFRelease(cachedOctagonSigningKey);
    }
    cachedOctagonEncryptionKey = self->_cachedOctagonEncryptionKey;
    if (cachedOctagonEncryptionKey)
    {
      self->_cachedOctagonEncryptionKey = 0;
      CFRelease(cachedOctagonEncryptionKey);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)SOSAccountTrust;
  -[SOSAccountTrust dealloc](&v8, "dealloc");
}

- (__OpaqueSOSPeerInfo)peerInfo
{
  return (__OpaqueSOSPeerInfo *)SOSFullPeerInfoGetPeerInfo(-[SOSAccountTrust fullPeerInfo](self, "fullPeerInfo"));
}

- (NSString)peerID
{
  void *PeerID;
  void *v3;

  PeerID = (void *)SOSPeerInfoGetPeerID(-[SOSAccountTrust peerInfo](self, "peerInfo"));
  v3 = PeerID;
  if (PeerID)
    CFRetain(PeerID);
  return (NSString *)v3;
}

- (void)setTrustedCircle:(__OpaqueSOSCircle *)a3
{
  __OpaqueSOSCircle *trustedCircle;

  trustedCircle = self->trustedCircle;
  if (trustedCircle != a3)
  {
    if (!a3 || (CFRetain(a3), (trustedCircle = self->trustedCircle) != 0))
      CFRelease(trustedCircle);
    self->trustedCircle = a3;
  }
}

- (void)setRetirees:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *retirees;

  v4 = (NSMutableSet *)objc_msgSend(a3, "mutableCopy");
  retirees = self->retirees;
  self->retirees = v4;

}

- (void)setFullPeerInfo:(__OpaqueSOSFullPeerInfo *)a3
{
  __OpaqueSOSFullPeerInfo *fullPeerInfo;

  fullPeerInfo = self->fullPeerInfo;
  if (fullPeerInfo != a3)
  {
    if (!a3 || (CFRetain(a3), (fullPeerInfo = self->fullPeerInfo) != 0))
      CFRelease(fullPeerInfo);
    self->fullPeerInfo = a3;
  }
}

- (void)setExpansion:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *expansion;

  v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  expansion = self->expansion;
  self->expansion = v4;

}

- (void)setDepartureCode:(int)a3
{
  self->departureCode = a3;
}

- (__SecKey)cachedOctagonEncryptionKey
{
  return self->_cachedOctagonEncryptionKey;
}

- (void)setCachedOctagonEncryptionKey:(__SecKey *)a3
{
  self->_cachedOctagonEncryptionKey = a3;
}

- (__SecKey)cachedOctagonSigningKey
{
  return self->_cachedOctagonSigningKey;
}

- (void)setCachedOctagonSigningKey:(__SecKey *)a3
{
  self->_cachedOctagonSigningKey = a3;
}

- (__OpaqueSOSCircle)trustedCircle
{
  return self->trustedCircle;
}

- (NSMutableSet)retirees
{
  return self->retirees;
}

- (__OpaqueSOSFullPeerInfo)fullPeerInfo
{
  return self->fullPeerInfo;
}

- (NSMutableDictionary)expansion
{
  return self->expansion;
}

- (int)departureCode
{
  return self->departureCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->retirees, 0);
  objc_storeStrong((id *)&self->peerID, 0);
  objc_storeStrong((id *)&self->expansion, 0);
}

+ (id)trust
{
  return objc_alloc_init(SOSAccountTrust);
}

@end
