@implementation DAWiFiScanDescriptor

- (DAWiFiScanDescriptor)initWithSSID:(id)a3
{
  id v4;
  DAWiFiScanDescriptor *v5;
  NSString *v6;
  NSString *SSID;
  DAWiFiScanDescriptor *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DAWiFiScanDescriptor;
  v5 = -[DAWiFiScanDescriptor init](&v10, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    SSID = v5->_SSID;
    v5->_SSID = v6;

    v8 = v5;
  }

  return v5;
}

- (DAWiFiScanDescriptor)initWithPrefix:(id)a3
{
  id v4;
  DAWiFiScanDescriptor *v5;
  NSString *v6;
  NSString *prefix;
  DAWiFiScanDescriptor *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DAWiFiScanDescriptor;
  v5 = -[DAWiFiScanDescriptor init](&v10, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    prefix = v5->_prefix;
    v5->_prefix = v6;

    v8 = v5;
  }

  return v5;
}

- (id)scanResultPredicate
{
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAWiFiScanDescriptor SSID](self, "SSID"));

  if (v3)
  {
    v4 = CFSTR("SELF.networkName ==[c] %@");
    v5 = 40;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAWiFiScanDescriptor prefix](self, "prefix"));

    if (!v6)
    {
      v7 = 0;
      return v7;
    }
    v4 = CFSTR("SELF.networkName beginswith %@");
    v5 = 32;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v4, *(Class *)((char *)&self->super.isa + v5)));
  return v7;
}

- (id)description
{
  return -[DAWiFiScanDescriptor descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  int v4;
  uint64_t v5;
  __CFString *v6;
  NSString *SSID;
  NSString *v8;
  __CFString *v9;
  NSString *prefix;
  NSString *v11;
  __CFString *v12;
  NSString *bundleID;
  NSString *v14;
  __CFString *v15;
  NSString *associationIdentifier;
  NSString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  id v26;
  int v27;

  if ((a3 & 0x8000000) != 0)
    v4 = 8;
  else
    v4 = 12;
  v27 = v4;
  if ((a3 & 0x8000000) != 0)
  {
    v6 = 0;
  }
  else
  {
    v26 = 0;
    v5 = objc_opt_class(self, a2);
    CUAppendF(&v26, &v27, "%@", v5);
    v6 = (__CFString *)v26;
  }
  SSID = self->_SSID;
  if (SSID)
  {
    v25 = v6;
    v8 = SSID;
    CUAppendF(&v25, &v27, "SSID %@", v8);
    v9 = v25;

    v6 = v9;
  }
  prefix = self->_prefix;
  if (prefix)
  {
    v24 = v6;
    v11 = prefix;
    CUAppendF(&v24, &v27, "Prefix %@", v11);
    v12 = v24;

    v6 = v12;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    v23 = v6;
    v14 = bundleID;
    CUAppendF(&v23, &v27, "BundleID %@", v14);
    v15 = v23;

    v6 = v15;
  }
  associationIdentifier = self->_associationIdentifier;
  if (associationIdentifier)
  {
    v22 = v6;
    v17 = associationIdentifier;
    CUAppendF(&v22, &v27, "Association Identifier %@", v17);
    v18 = v22;

    v6 = v18;
  }
  v19 = &stru_100039F08;
  if (v6)
    v19 = v6;
  v20 = v19;

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_associationIdentifier, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_bundleID, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[DADiscoveryConfiguration copy](self->_configuration, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = -[NSString copy](self->_SSID, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[NSString copy](self->_prefix, "copy");
  v14 = (void *)v4[4];
  v4[4] = v13;

  return v4;
}

- (NSString)associationIdentifier
{
  return self->_associationIdentifier;
}

- (void)setAssociationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (DADiscoveryConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SSID, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_associationIdentifier, 0);
}

@end
