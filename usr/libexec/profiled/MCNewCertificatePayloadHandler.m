@implementation MCNewCertificatePayloadHandler

- (void)setAside
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "certificatePersistentID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
  -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v3, v4);

  self->_isSetAside = 1;
}

- (void)unsetAside
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "certificatePersistentID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
  -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:](self, "_retainDependencyBetweenPersistentID:andUUID:", v3, v4);

  self->_isSetAside = 0;
}

- (void)remove
{
  void *v3;
  void *v4;
  id v5;

  if (!self->_isSetAside)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "certificatePersistentID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
    -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v3, v4);

  }
}

- (__SecIdentity)copyIdentityImmediatelyWithInteractionClient:(id)a3 outError:(id *)a4
{
  return 0;
}

- (void)accessibility
{
  void *v2;
  const CFStringRef *v3;
  CFStringRef v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  if (objc_msgSend(v2, "isIdentity") && !objc_msgSend(v2, "isMDMClientIdentity"))
    v3 = &kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
  else
    v3 = (const CFStringRef *)&kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate;
  v4 = *v3;

  return (void *)v4;
}

- (BOOL)isSetAside
{
  return self->_isSetAside;
}

@end
