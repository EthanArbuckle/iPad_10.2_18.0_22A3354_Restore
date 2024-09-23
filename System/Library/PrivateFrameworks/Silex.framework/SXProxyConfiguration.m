@implementation SXProxyConfiguration

+ (id)direct
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithProxyAutoConfigScript:", CFSTR("function FindProxyForURL(url, host){return 'DIRECT';}"));
}

- (SXProxyConfiguration)initWithProxyAutoConfigScript:(id)a3
{
  id v4;
  SXProxyConfiguration *v5;
  uint64_t v6;
  NSString *proxyAutoConfigScript;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXProxyConfiguration;
  v5 = -[SXProxyConfiguration init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    proxyAutoConfigScript = v5->_proxyAutoConfigScript;
    v5->_proxyAutoConfigScript = (NSString *)v6;

  }
  return v5;
}

- (SXProxyConfiguration)initWithHost:(id)a3
{
  id v5;
  SXProxyConfiguration *v6;
  SXProxyConfiguration *v7;
  uint64_t v8;
  NSString *proxyAutoConfigScript;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXProxyConfiguration;
  v6 = -[SXProxyConfiguration init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_proxyHost, a3);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("function FindProxyForURL(url, host){return 'PROXY %@';}"),
      v5);
    v8 = objc_claimAutoreleasedReturnValue();
    proxyAutoConfigScript = v7->_proxyAutoConfigScript;
    v7->_proxyAutoConfigScript = (NSString *)v8;

  }
  return v7;
}

- (NSString)proxyHost
{
  return self->_proxyHost;
}

- (NSString)proxyAutoConfigScript
{
  return self->_proxyAutoConfigScript;
}

- (BOOL)usePrivateRelay
{
  return self->usePrivateRelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyAutoConfigScript, 0);
  objc_storeStrong((id *)&self->_proxyHost, 0);
}

@end
