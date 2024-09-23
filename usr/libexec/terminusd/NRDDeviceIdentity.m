@implementation NRDDeviceIdentity

- (id)copyWithZone:(_NSZone *)a3
{
  NRDDeviceIdentity *v5;
  NSUUID *identity;
  NSUUID *v7;
  id v8;
  NSData *publicKey;
  NSData *v10;
  id v11;

  v5 = -[NRDDeviceIdentity init](+[NRDDeviceIdentity allocWithZone:](NRDDeviceIdentity, "allocWithZone:"), "init");
  if (self)
    identity = self->_identity;
  else
    identity = 0;
  v7 = identity;
  v8 = -[NSUUID copyWithZone:](v7, "copyWithZone:", a3);
  if (v5)
    objc_storeStrong((id *)&v5->_identity, v8);

  if (self)
    publicKey = self->_publicKey;
  else
    publicKey = 0;
  v10 = publicKey;
  v11 = -[NSData copyWithZone:](v10, "copyWithZone:", a3);
  if (v5)
    objc_storeStrong((id *)&v5->_publicKey, v11);

  return v5;
}

- (NRDDeviceIdentity)initWithCoder:(id)a3
{
  id v4;
  NRDDeviceIdentity *v5;
  NRDDeviceIdentity *v6;
  id v7;
  uint64_t v8;
  NSUUID *identity;
  id v10;
  uint64_t v11;
  NSData *publicKey;
  NRDDeviceIdentity *v13;
  id v15;
  int IsLevelEnabled;
  id v17;
  int *v18;
  uint64_t v19;
  id v20;
  id v21;
  int v22;
  id v23;
  id v24;
  int v25;
  uint64_t v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NRDDeviceIdentity;
  v5 = -[NRDDeviceIdentity init](&v27, "init");
  if (!v5)
  {
    v15 = sub_100128400();
    IsLevelEnabled = _NRLogIsLevelEnabled(v15, 16);

    if (IsLevelEnabled)
    {
      v17 = sub_100128400();
      _NRLogWithArgs(v17, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRDDeviceIdentity initWithCoder:]", 729);

    }
    v4 = (id)_os_log_pack_size(12);
    v6 = (NRDDeviceIdentity *)((char *)&v26 - (((unint64_t)v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    v18 = __error();
    v19 = _os_log_pack_fill(v6, v4, *v18, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v19 = 136446210;
    *(_QWORD *)(v19 + 4) = "-[NRDDeviceIdentity initWithCoder:]";
    v20 = sub_100128400();
    _NRLogAbortWithPack(v20, v6);
LABEL_9:
    v21 = sub_100128400();
    v22 = _NRLogIsLevelEnabled(v21, 17);

    if (v22)
    {
      v23 = sub_100128400();
      _NRLogWithArgs(v23, 17, "%s called with null self.identity");
LABEL_13:

    }
LABEL_14:
    v13 = 0;
    goto LABEL_5;
  }
  v6 = v5;
  v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("identity"));
  v8 = objc_claimAutoreleasedReturnValue(v7);
  identity = v6->_identity;
  v6->_identity = (NSUUID *)v8;

  if (!v6->_identity)
    goto LABEL_9;
  v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("publicKey"));
  v11 = objc_claimAutoreleasedReturnValue(v10);
  publicKey = v6->_publicKey;
  v6->_publicKey = (NSData *)v11;

  if (!v6->_publicKey)
  {
    v24 = sub_100128400();
    v25 = _NRLogIsLevelEnabled(v24, 17);

    if (v25)
    {
      v23 = sub_100128400();
      _NRLogWithArgs(v23, 17, "%s called with null self.publicKey");
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v13 = v6;
LABEL_5:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *publicKey;

  if (self)
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_identity, CFSTR("identity"));
    publicKey = self->_publicKey;
  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("identity"));
    publicKey = 0;
  }
  objc_msgSend(a3, "encodeObject:forKey:", publicKey, CFSTR("publicKey"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id *v6;
  NSUUID *identity;
  NSUUID *v8;
  id v9;
  NSData *publicKey;
  id v11;
  NSData *v12;
  unsigned __int8 v13;

  v4 = a3;
  if (v4 && (v5 = objc_opt_class(NRDDeviceIdentity), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
  {
    v6 = (id *)v4;
    if (self)
      identity = self->_identity;
    else
      identity = 0;
    v8 = identity;
    v9 = v6[1];
    if (-[NSUUID isEqual:](v8, "isEqual:", v9))
    {
      if (self)
        publicKey = self->_publicKey;
      else
        publicKey = 0;
      v11 = v6[2];
      v12 = publicKey;
      v13 = -[NSData isEqualToData:](v12, "isEqualToData:", v11);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
