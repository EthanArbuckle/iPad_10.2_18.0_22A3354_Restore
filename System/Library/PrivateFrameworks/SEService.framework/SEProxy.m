@implementation SEProxy

+ (id)withSession:(id)a3 seid:(id)a4
{
  id v5;
  id v6;
  SEProxyWithManagerSession *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SEProxyWithManagerSession);
  -[SEProxyWithManagerSession setSession:seid:]((uint64_t)v7, v6, v5);

  return v7;
}

+ (id)withEndpoint:(id)a3
{
  id v3;
  SEProxyWithRemoteTransceiver *v4;
  void *v5;
  SEProxyWithRemoteTransceiver *v6;

  v3 = a3;
  v4 = objc_alloc_init(SEProxyWithRemoteTransceiver);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82C40]), "initWithListenerEndpoint:", v3);

  if (v5)
  {
    -[SEProxyWithRemoteTransceiver setRemoteTransceiver:](v4, "setRemoteTransceiver:", v5);
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
