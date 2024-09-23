@implementation SBSSystemInterface

- (SBSSystemInterface)init
{
  return -[SBSSystemInterface initWithTarget:](self, "initWithTarget:", CFSTR("localhost"));
}

- (SBSSystemInterface)initWithTarget:(id)a3
{
  id v4;
  SBSSystemInterface *v5;
  uint64_t v6;
  SBSSystemImplementer *sbProxy;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSSystemInterface;
  v5 = -[SBSSystemInterface init](&v9, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("localhost")))
      +[SBSUtils createProxyConnectionForXPCWithExportedObject:connection:](SBSUtils, "createProxyConnectionForXPCWithExportedObject:connection:", 0, &v5->_sbConnection);
    else
      +[SBSUtils createProxyConnectionForRapportTarget:](SBSUtils, "createProxyConnectionForRapportTarget:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    sbProxy = v5->_sbProxy;
    v5->_sbProxy = (SBSSystemImplementer *)v6;

  }
  return v5;
}

- (void)reboot:(id)a3
{
  -[SBSSystemImplementer reboot:](self->_sbProxy, "reboot:", a3);
}

- (void)requestDeferredReboot
{
  -[SBSSystemImplementer requestDeferredReboot](self->_sbProxy, "requestDeferredReboot");
}

- (void)obliterate:(id)a3
{
  -[SBSSystemImplementer obliterate:](self->_sbProxy, "obliterate:", a3);
}

- (void)identifyWithOptions:(id)a3
{
  -[SBSSystemImplementer identifyWithOptions:](self->_sbProxy, "identifyWithOptions:", a3);
}

- (void)intercomWithOptions:(id)a3
{
  -[SBSSystemImplementer intercomWithOptions:](self->_sbProxy, "intercomWithOptions:", a3);
}

- (void)setTurnOffBrightnessFactor:(BOOL)a3
{
  -[SBSSystemImplementer setTurnOffBrightnessFactor:](self->_sbProxy, "setTurnOffBrightnessFactor:", a3);
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_sbConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSSystemInterface;
  -[SBSSystemInterface dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

@end
