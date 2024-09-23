@implementation OTSOSMissingAdapter

- (OTSOSMissingAdapter)init
{
  OTSOSMissingAdapter *v2;
  OTSOSMissingAdapter *v3;
  NSString *providerID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OTSOSMissingAdapter;
  v2 = -[OTSOSMissingAdapter init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    providerID = v2->_providerID;
    v2->_providerID = (NSString *)CFSTR("[OTSOSMissingAdapter]");

    v3->_essential = 0;
  }
  return v3;
}

- (BOOL)sosEnabled
{
  return 0;
}

- (int)circleStatus:(id *)a3
{
  return 1;
}

- (id)currentSOSSelf:(id *)a3
{
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS unsupported on this platform")));
  return 0;
}

- (id)fetchTrustedPeers:(id *)a3
{
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS unsupported on this platform")));
  return 0;
}

- (BOOL)updateOctagonKeySetWithAccount:(id)a3 error:(id *)a4
{
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS unsupported on this platform")));
  return 0;
}

- (BOOL)updateCKKS4AllStatus:(BOOL)a3 error:(id *)a4
{
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS unsupported on this platform")));
  return 0;
}

- (id)fetchSelfPeers:(id *)a3
{
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS unsupported on this platform")));
  return 0;
}

- (id)currentState
{
  void *v3;
  CKKSPeerProviderState *v4;
  void *v5;
  CKKSPeerProviderState *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS unsupported on this platform")));
  v4 = [CKKSPeerProviderState alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSMissingAdapter providerID](self, "providerID"));
  v6 = -[CKKSPeerProviderState initWithPeerProviderID:essential:selfPeers:selfPeersError:trustedPeers:trustedPeersError:](v4, "initWithPeerProviderID:essential:selfPeers:selfPeersError:trustedPeers:trustedPeersError:", v5, -[OTSOSMissingAdapter essential](self, "essential"), 0, v3, 0, v3);

  return v6;
}

- (BOOL)safariViewSyncingEnabled:(id *)a3
{
  return 0;
}

- (BOOL)preloadOctagonKeySetOnAccount:(id)a3 error:(id *)a4
{
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS unsupported on this platform")));
  return 0;
}

- (BOOL)joinAfterRestore:(id *)a3
{
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS unsupported on this platform")));
  return 0;
}

- (BOOL)resetToOffering:(id *)a3
{
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", NSOSStatusErrorDomain, -4, CFSTR("SOS unsupported on this platform")));
  return 0;
}

- (NSString)providerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)essential
{
  return self->_essential;
}

- (void)setEssential:(BOOL)a3
{
  self->_essential = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerID, 0);
}

@end
