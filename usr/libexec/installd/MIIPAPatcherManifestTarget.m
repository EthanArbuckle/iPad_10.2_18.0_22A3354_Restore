@implementation MIIPAPatcherManifestTarget

- (MIIPAPatcherManifestTarget)initWithCFBundleVersion:(id)a3 cfBundleShortVersion:(id)a4 bundleIdentifier:(id)a5 uiSupportedDevices:(id)a6 infoPlistHash:(id)a7 infoPlistHashAlgorithm:(id)a8
{
  id v15;
  id v16;
  id v17;
  MIIPAPatcherManifestTarget *v18;
  id v20;
  id v21;
  id v22;
  objc_super v23;

  v22 = a3;
  v21 = a4;
  v20 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)MIIPAPatcherManifestTarget;
  v18 = -[MIIPAPatcherManifestTarget init](&v23, "init");
  if (v18)
  {
    if (qword_10009DF08 != -1)
      dispatch_once(&qword_10009DF08, &stru_100084E60);
    objc_storeStrong((id *)&v18->_cfBundleVersion, a3);
    objc_storeStrong((id *)&v18->_cfBundleShortVersion, a4);
    objc_storeStrong((id *)&v18->_bundleIdentifier, a5);
    objc_storeStrong((id *)&v18->_uiSupportedDevices, a6);
    objc_storeStrong((id *)&v18->_infoPlistHash, a7);
    objc_storeStrong((id *)&v18->_infoPlistHashAlgorithm, a8);
  }

  return v18;
}

- (id)plistRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[5];

  v14[0] = kCFBundleVersionKey;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifestTarget cfBundleVersion](self, "cfBundleVersion"));
  v15[0] = v3;
  v14[1] = _kCFBundleShortVersionStringKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifestTarget cfBundleShortVersion](self, "cfBundleShortVersion"));
  v15[1] = v4;
  v14[2] = kCFBundleIdentifierKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifestTarget bundleIdentifier](self, "bundleIdentifier"));
  v15[2] = v5;
  v14[3] = CFSTR("infoPlistHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifestTarget infoPlistHash](self, "infoPlistHash"));
  v15[3] = v6;
  v14[4] = CFSTR("infoPlistHashAlgorithm");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifestTarget infoPlistHashAlgorithm](self, "infoPlistHashAlgorithm"));
  v15[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 5));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifestTarget uiSupportedDevices](self, "uiSupportedDevices"));
  if (v9)
  {
    v10 = objc_msgSend(v8, "mutableCopy");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifestTarget uiSupportedDevices](self, "uiSupportedDevices"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("UISupportedDevices"));

    v12 = objc_msgSend(v10, "copy");
    v8 = v12;
  }
  return v8;
}

- (NSString)cfBundleVersion
{
  return self->_cfBundleVersion;
}

- (NSString)cfBundleShortVersion
{
  return self->_cfBundleShortVersion;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSArray)uiSupportedDevices
{
  return self->_uiSupportedDevices;
}

- (NSString)infoPlistHash
{
  return self->_infoPlistHash;
}

- (NSString)infoPlistHashAlgorithm
{
  return self->_infoPlistHashAlgorithm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoPlistHashAlgorithm, 0);
  objc_storeStrong((id *)&self->_infoPlistHash, 0);
  objc_storeStrong((id *)&self->_uiSupportedDevices, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_cfBundleShortVersion, 0);
  objc_storeStrong((id *)&self->_cfBundleVersion, 0);
}

@end
