@implementation ICDelegationPlayInfoTokenRequest

- (ICDelegationPlayInfoTokenRequest)initWithDSID:(id)a3 SICData:(id)a4
{
  id v6;
  id v7;
  ICDelegationPlayInfoTokenRequest *v8;
  uint64_t v9;
  NSNumber *DSID;
  uint64_t v11;
  NSData *SICData;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICDelegationPlayInfoTokenRequest;
  v8 = -[ICDelegationPlayInfoTokenRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    DSID = v8->_DSID;
    v8->_DSID = (NSNumber *)v9;

    v11 = objc_msgSend(v7, "copy");
    SICData = v8->_SICData;
    v8->_SICData = (NSData *)v11;

  }
  return v8;
}

- (NSMutableDictionary)propertyListRepresentation
{
  void *v3;
  void *v4;
  NSData *cloudCredentialsTokenData;
  NSNumber *DSID;
  NSData *SICData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  cloudCredentialsTokenData = self->_cloudCredentialsTokenData;
  if (cloudCredentialsTokenData)
    objc_msgSend(v3, "setObject:forKey:", cloudCredentialsTokenData, CFSTR("wha-token"));
  DSID = self->_DSID;
  if (DSID)
    objc_msgSend(v4, "setObject:forKey:", DSID, CFSTR("dsid"));
  SICData = self->_SICData;
  if (SICData)
    objc_msgSend(v4, "setObject:forKey:", SICData, CFSTR("sic"));
  return (NSMutableDictionary *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSData copyWithZone:](self->_cloudCredentialsTokenData, "copyWithZone:", a3);
    v7 = (void *)v5[2];
    v5[2] = v6;

    v8 = -[NSNumber copyWithZone:](self->_DSID, "copyWithZone:", a3);
    v9 = (void *)v5[1];
    v5[1] = v8;

    v10 = -[NSData copyWithZone:](self->_SICData, "copyWithZone:", a3);
    v11 = (void *)v5[3];
    v5[3] = v10;

  }
  return v5;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)cloudCredentialsTokenData
{
  return self->_cloudCredentialsTokenData;
}

- (void)setCloudCredentialsTokenData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)SICData
{
  return self->_SICData;
}

- (void)setSICData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SICData, 0);
  objc_storeStrong((id *)&self->_cloudCredentialsTokenData, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
}

@end
