@implementation SDActivityEncryptionKeyRequestRecord

- (void)dealloc
{
  objc_super v3;

  -[RPCompanionLinkClient invalidate](self->_linkClient, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SDActivityEncryptionKeyRequestRecord;
  -[SDActivityEncryptionKeyRequestRecord dealloc](&v3, "dealloc");
}

- (id)description
{
  RPCompanionLinkClient *linkClient;
  __CFString *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  NSUUID *previousKeyIdentifier;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;

  linkClient = self->_linkClient;
  if (linkClient)
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("linkClient: <%@>, "), linkClient));
  else
    v4 = &stru_10072FE60;
  v5 = (objc_class *)objc_opt_class(self, a2);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  previousKeyIdentifier = self->_previousKeyIdentifier;
  v13.receiver = self;
  v13.super_class = (Class)SDActivityEncryptionKeyRequestRecord;
  v9 = -[SDActivityRequestRecord description](&v13, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, previousKeyIdentifier:%@, %@%@>"), v7, self, previousKeyIdentifier, v4, v10));

  return v11;
}

- (NSUUID)previousKeyIdentifier
{
  return self->_previousKeyIdentifier;
}

- (void)setPreviousKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_previousKeyIdentifier, a3);
}

- (RPCompanionLinkClient)linkClient
{
  return self->_linkClient;
}

- (void)setLinkClient:(id)a3
{
  objc_storeStrong((id *)&self->_linkClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkClient, 0);
  objc_storeStrong((id *)&self->_previousKeyIdentifier, 0);
}

@end
