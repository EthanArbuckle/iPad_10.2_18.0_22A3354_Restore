@implementation _SSKDisplayMonitorIdentityRecord

- (_SSKDisplayMonitorIdentityRecord)initWithIdentity:(id)a3 connectedAtInit:(BOOL)a4
{
  id v7;
  _SSKDisplayMonitorIdentityRecord *v8;
  _SSKDisplayMonitorIdentityRecord *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SSKDisplayMonitorIdentityRecord;
  v8 = -[_SSKDisplayMonitorIdentityRecord init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_displayIdentity, a3);
    v9->_connectedAtInit = a4;
  }

  return v9;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_displayIdentity, 0);
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_connectedAtInit, CFSTR("connectedAtInit"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (BOOL)didConnectAtInit
{
  return self->_connectedAtInit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

@end
