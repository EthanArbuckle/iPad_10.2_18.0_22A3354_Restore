@implementation SESEndPointContainerInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)withAppletAID:(id)a3 isSuspended:(BOOL)a4
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  v6 = objc_opt_new();
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v5;

  *(_BYTE *)(v6 + 8) = a4;
  return (id)v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *appletAID;
  id v5;

  appletAID = self->_appletAID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appletAID, CFSTR("appletAID"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_isSuspended, CFSTR("isSuspended"));

}

- (SESEndPointContainerInfo)initWithCoder:(id)a3
{
  id v4;
  SESEndPointContainerInfo *v5;
  uint64_t v6;
  NSData *appletAID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SESEndPointContainerInfo;
  v5 = -[SESEndPointContainerInfo init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appletAID"));
    v6 = objc_claimAutoreleasedReturnValue();
    appletAID = v5->_appletAID;
    v5->_appletAID = (NSData *)v6;

    v5->_isSuspended = objc_msgSend(v4, "decodeIntForKey:", CFSTR("isSuspended")) != 0;
  }

  return v5;
}

- (NSData)appletAID
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appletAID, 0);
}

@end
