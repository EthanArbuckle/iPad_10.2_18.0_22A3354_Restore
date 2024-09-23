@implementation PODeviceConfiguration

- (PODeviceConfiguration)init
{
  PODeviceConfiguration *v2;
  PODeviceConfiguration *v3;
  uint64_t v4;
  NSDictionary *tokenToUserMapping;
  objc_super v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)PODeviceConfiguration;
  v2 = -[PODeviceConfiguration init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v8[0] = CFSTR("AccountName");
    v8[1] = CFSTR("FullName");
    v9[0] = CFSTR("preferred_username");
    v9[1] = CFSTR("name");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v4 = objc_claimAutoreleasedReturnValue();
    tokenToUserMapping = v3->_tokenToUserMapping;
    v3->_tokenToUserMapping = (NSDictionary *)v4;

    objc_storeStrong((id *)&v3->_signingAlgorithm, &unk_251520F48);
    objc_storeStrong((id *)&v3->_encryptionAlgorithm, &unk_251520F48);
  }
  return v3;
}

- (void)updateVersion
{
  self->_version = 1;
}

- (BOOL)supportsTokenUnlock
{
  NSObject *v3;
  _BOOL4 v4;

  PO_LOG_PODeviceConfiguration();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PODeviceConfiguration supportsTokenUnlock].cold.1(self);

  v4 = -[PODeviceConfiguration sharedDeviceKeys](self, "sharedDeviceKeys");
  if (v4)
    LOBYTE(v4) = -[PODeviceConfiguration protocolVersion](self, "protocolVersion") == 1;
  return v4;
}

- (BOOL)supportsAuthorization
{
  NSObject *v3;
  _BOOL4 v4;

  PO_LOG_PODeviceConfiguration();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PODeviceConfiguration supportsAuthorization].cold.1(self);

  v4 = -[PODeviceConfiguration sharedDeviceKeys](self, "sharedDeviceKeys");
  if (v4)
    LOBYTE(v4) = -[PODeviceConfiguration authorizationEnabled](self, "authorizationEnabled");
  return v4;
}

- (BOOL)supportsCreateNewUsers
{
  NSObject *v3;
  _BOOL4 v4;

  PO_LOG_PODeviceConfiguration();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PODeviceConfiguration supportsCreateNewUsers].cold.1(self);

  v4 = -[PODeviceConfiguration sharedDeviceKeys](self, "sharedDeviceKeys");
  if (v4)
    LOBYTE(v4) = -[PODeviceConfiguration createUsersEnabled](self, "createUsersEnabled");
  return v4;
}

- (NSNumber)loginFrequency
{
  if (self->_loginFrequency)
    return self->_loginFrequency;
  else
    return (NSNumber *)&unk_251520EA0;
}

- (__SecKey)deviceSigningKey
{
  __SecKey *result;
  _BOOL4 v4;
  NSData *deviceSigningKeyData;

  result = self->_deviceSigningKey;
  if (!result)
  {
    v4 = -[PODeviceConfiguration sharedDeviceKeys](self, "sharedDeviceKeys");
    deviceSigningKeyData = self->__deviceSigningKeyData;
    if (v4)
      result = +[POSecKeyHelper systemKeyForData:](POSecKeyHelper, "systemKeyForData:", deviceSigningKeyData);
    else
      result = +[POSecKeyHelper keyForData:](POSecKeyHelper, "keyForData:", deviceSigningKeyData);
    self->_deviceSigningKey = result;
  }
  return result;
}

- (void)setDeviceSigningKey:(__SecKey *)a3
{
  NSData *v4;
  NSData *deviceSigningKeyData;

  self->_deviceSigningKey = a3;
  if (a3)
  {
    +[POSecKeyHelper dataForKey:](POSecKeyHelper, "dataForKey:");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    deviceSigningKeyData = self->__deviceSigningKeyData;
    self->__deviceSigningKeyData = v4;

  }
}

- (__SecKey)deviceSigningPublicKey
{
  __SecKey *result;

  result = -[PODeviceConfiguration deviceSigningKey](self, "deviceSigningKey");
  if (result)
    return SecKeyCopyPublicKey(-[PODeviceConfiguration deviceSigningKey](self, "deviceSigningKey"));
  return result;
}

- (__SecKey)deviceEncryptionKey
{
  __SecKey *result;
  _BOOL4 v4;
  NSData *deviceEncryptionKeyData;

  result = self->_deviceEncryptionKey;
  if (!result)
  {
    v4 = -[PODeviceConfiguration sharedDeviceKeys](self, "sharedDeviceKeys");
    deviceEncryptionKeyData = self->__deviceEncryptionKeyData;
    if (v4)
      result = +[POSecKeyHelper systemKeyForData:](POSecKeyHelper, "systemKeyForData:", deviceEncryptionKeyData);
    else
      result = +[POSecKeyHelper keyForData:](POSecKeyHelper, "keyForData:", deviceEncryptionKeyData);
    self->_deviceEncryptionKey = result;
  }
  return result;
}

- (void)setDeviceEncryptionKey:(__SecKey *)a3
{
  NSData *v4;
  NSData *deviceEncryptionKeyData;

  self->_deviceEncryptionKey = a3;
  if (a3)
  {
    +[POSecKeyHelper dataForKey:](POSecKeyHelper, "dataForKey:");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    deviceEncryptionKeyData = self->__deviceEncryptionKeyData;
    self->__deviceEncryptionKeyData = v4;

  }
}

- (__SecKey)deviceEncryptionPublicKey
{
  __SecKey *result;

  result = -[PODeviceConfiguration deviceEncryptionKey](self, "deviceEncryptionKey");
  if (result)
    return SecKeyCopyPublicKey(-[PODeviceConfiguration deviceEncryptionKey](self, "deviceEncryptionKey"));
  return result;
}

- (__SecIdentity)deviceSigningIdentity
{
  return +[POSecKeyHelper identityForKey:andCertificate:](POSecKeyHelper, "identityForKey:andCertificate:", -[PODeviceConfiguration deviceSigningKey](self, "deviceSigningKey"), self->_deviceSigningCertificate);
}

- (__SecIdentity)deviceEncryptionIdentity
{
  return +[POSecKeyHelper identityForKey:andCertificate:](POSecKeyHelper, "identityForKey:andCertificate:", -[PODeviceConfiguration deviceEncryptionKey](self, "deviceEncryptionKey"), self->_deviceEncryptionCertificate);
}

- (id)dataRepresentation
{
  return -[PODeviceConfiguration dataRepresentationForDisplay:](self, "dataRepresentationForDisplay:", 0);
}

- (id)dataRepresentationForDisplay:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSData *deviceSigningKeyData;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSString *extensionIdentifier;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t loginType;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  uint64_t v90;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  objc_msgSend(v5, "setFormatOptions:", 1907);
  v6 = objc_alloc_init(MEMORY[0x24BDD14F8]);
  objc_msgSend(v6, "setUnitsStyle:", 3);
  objc_msgSend(v6, "setAllowedUnits:", 48);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_version);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_version);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v9);

  deviceSigningKeyData = self->__deviceSigningKeyData;
  if (v3)
    -[NSData psso_sha256HashString](deviceSigningKeyData, "psso_sha256HashString");
  else
    -[NSData psso_base64URLEncodedString](deviceSigningKeyData, "psso_base64URLEncodedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__deviceSigningKeyData);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v12);

  +[POSecKeyHelper dataForCertificate:](POSecKeyHelper, "dataForCertificate:", self->_deviceSigningCertificate);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "psso_base64URLEncodedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_deviceSigningCertificate);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);

  -[PODeviceConfiguration signingAlgorithm](self, "signingAlgorithm");
  if (v3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[POConstantCoreUtil stringForSigningAlgorithm:](POConstantCoreUtil, "stringForSigningAlgorithm:", v13);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_signingAlgorithm);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v17);

  if (v3)
  {

    -[PODeviceConfiguration pendingSigningAlgorithm](self, "pendingSigningAlgorithm");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[POConstantCoreUtil stringForSigningAlgorithm:](POConstantCoreUtil, "stringForSigningAlgorithm:", v13);
  }
  else
  {
    -[PODeviceConfiguration pendingSigningAlgorithm](self, "pendingSigningAlgorithm");
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_pendingSigningAlgorithm);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v19);

  if (v3)
  {

    -[NSData psso_sha256HashString](self->__deviceEncryptionKeyData, "psso_sha256HashString");
  }
  else
  {
    -[NSData psso_base64URLEncodedString](self->__deviceEncryptionKeyData, "psso_base64URLEncodedString");
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__deviceEncryptionKeyData);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, v21);

  +[POSecKeyHelper dataForCertificate:](POSecKeyHelper, "dataForCertificate:", self->_deviceEncryptionCertificate);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "psso_base64URLEncodedString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_deviceEncryptionCertificate);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, v24);

  -[PODeviceConfiguration encryptionAlgorithm](self, "encryptionAlgorithm");
  if (v3)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[POConstantCoreUtil stringForEncryptionAlgorithm:](POConstantCoreUtil, "stringForEncryptionAlgorithm:", v22);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_encryptionAlgorithm);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, v26);

  if (v3)
  {

    -[PODeviceConfiguration pendingEncryptionAlgorithm](self, "pendingEncryptionAlgorithm");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[POConstantCoreUtil stringForEncryptionAlgorithm:](POConstantCoreUtil, "stringForEncryptionAlgorithm:", v22);
  }
  else
  {
    -[PODeviceConfiguration pendingEncryptionAlgorithm](self, "pendingEncryptionAlgorithm");
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_pendingEncryptionAlgorithm);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, v28);

  if (v3)
  {

    -[PODeviceConfiguration lastEncryptionKeyChange](self, "lastEncryptionKeyChange");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v29);
  }
  else
  {
    v30 = (void *)MEMORY[0x24BDD16E0];
    -[PODeviceConfiguration lastEncryptionKeyChange](self, "lastEncryptionKeyChange");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "timeIntervalSince1970");
    objc_msgSend(v30, "numberWithDouble:");
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_lastEncryptionKeyChange);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, v32);

  extensionIdentifier = self->_extensionIdentifier;
  NSStringFromSelector(sel_extensionIdentifier);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", extensionIdentifier, v34);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PODeviceConfiguration registrationCompleted](self, "registrationCompleted"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_registrationCompleted);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, v36);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PODeviceConfiguration sharedDeviceKeys](self, "sharedDeviceKeys"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sharedDeviceKeys);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v37, v38);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[PODeviceConfiguration protocolVersion](self, "protocolVersion"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_protocolVersion);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v39, v40);

  -[PODeviceConfiguration sdkVersionString](self, "sdkVersionString");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sdkVersionString);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v41, v42);

  loginType = self->_loginType;
  if (v3)
    +[POConstantCoreUtil stringForLoginType:](POConstantCoreUtil, "stringForLoginType:", loginType);
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", loginType);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_loginType);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v44, v45);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PODeviceConfiguration createUsersEnabled](self, "createUsersEnabled"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_createUsersEnabled);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v46, v47);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PODeviceConfiguration authorizationEnabled](self, "authorizationEnabled"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_authorizationEnabled);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v48, v49);

  -[PODeviceConfiguration tokenToUserMapping](self, "tokenToUserMapping");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_tokenToUserMapping);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v50, v51);

  if (v3)
    +[POConstantCoreUtil stringForUserAuthorizationMode:](POConstantCoreUtil, "stringForUserAuthorizationMode:", -[PODeviceConfiguration newUserAuthorizationMode](self, "newUserAuthorizationMode"));
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[PODeviceConfiguration newUserAuthorizationMode](self, "newUserAuthorizationMode"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_newUserAuthorizationMode);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v52, v53);

  if (v3)
    +[POConstantCoreUtil stringForUserAuthorizationMode:](POConstantCoreUtil, "stringForUserAuthorizationMode:", -[PODeviceConfiguration userAuthorizationMode](self, "userAuthorizationMode"));
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[PODeviceConfiguration userAuthorizationMode](self, "userAuthorizationMode"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userAuthorizationMode);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v54, v55);

  -[PODeviceConfiguration administratorGroups](self, "administratorGroups");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_administratorGroups);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v56, v57);

  -[PODeviceConfiguration authorizationGroups](self, "authorizationGroups");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_authorizationGroups);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v58, v59);

  -[PODeviceConfiguration otherGroups](self, "otherGroups");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_otherGroups);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v60, v61);

  -[PODeviceConfiguration defaultUserDomain](self, "defaultUserDomain");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_defaultUserDomain);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v62, v63);

  -[PODeviceConfiguration accountDisplayName](self, "accountDisplayName");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accountDisplayName);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v64, v65);

  -[PODeviceConfiguration loginFrequency](self, "loginFrequency");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_loginFrequency);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v66, v67);

  if (v3)
    +[POConstantCoreUtil stringForLoginPolicy:](POConstantCoreUtil, "stringForLoginPolicy:", -[PODeviceConfiguration fileVaultPolicy](self, "fileVaultPolicy"));
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PODeviceConfiguration fileVaultPolicy](self, "fileVaultPolicy"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fileVaultPolicy);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v68, v69);

  if (v3)
    +[POConstantCoreUtil stringForLoginPolicy:](POConstantCoreUtil, "stringForLoginPolicy:", -[PODeviceConfiguration loginPolicy](self, "loginPolicy"));
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PODeviceConfiguration loginPolicy](self, "loginPolicy"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_loginPolicy);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v70, v71);

  if (v3)
    +[POConstantCoreUtil stringForLoginPolicy:](POConstantCoreUtil, "stringForLoginPolicy:", -[PODeviceConfiguration unlockPolicy](self, "unlockPolicy"));
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PODeviceConfiguration unlockPolicy](self, "unlockPolicy"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_unlockPolicy);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v72, v73);

  if (v3)
    objc_msgSend(v6, "stringFromTimeInterval:", (double)-[PODeviceConfiguration offlineGracePeriod](self, "offlineGracePeriod"));
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[PODeviceConfiguration offlineGracePeriod](self, "offlineGracePeriod"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_offlineGracePeriod);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v74, v75);

  if (v3)
    objc_msgSend(v6, "stringFromTimeInterval:", (double)-[PODeviceConfiguration requireAuthGracePeriod](self, "requireAuthGracePeriod"));
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[PODeviceConfiguration requireAuthGracePeriod](self, "requireAuthGracePeriod"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_requireAuthGracePeriod);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v76, v77);

  -[PODeviceConfiguration authGracePeriodStart](self, "authGracePeriodStart");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    -[PODeviceConfiguration authGracePeriodStart](self, "authGracePeriodStart");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v77);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v79 = 0;
  }
  NSStringFromSelector(sel_authGracePeriodStart);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v79, v80);

  if (v78)
  {

  }
  -[PODeviceConfiguration nonPlatformSSOAccounts](self, "nonPlatformSSOAccounts");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_nonPlatformSSOAccounts);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v81, v82);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v84, CFSTR("created"));

  v90 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v7, 11, &v90);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v85;
  if (v90)
  {
    v87 = __54__PODeviceConfiguration_dataRepresentationForDisplay___block_invoke();
    v88 = 0;
  }
  else
  {
    v88 = v85;
  }

  return v88;
}

id __54__PODeviceConfiguration_dataRepresentationForDisplay___block_invoke()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Error serializing device config."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODeviceConfiguration();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v0, v1, v2, v3, v4, v5, v6, v7);

  return v0;
}

- (PODeviceConfiguration)initWithData:(id)a3
{
  id v4;
  PODeviceConfiguration *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  PODeviceConfiguration *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSData *deviceSigningKeyData;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSNumber *signingAlgorithm;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSNumber *pendingSigningAlgorithm;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSData *deviceEncryptionKeyData;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSNumber *encryptionAlgorithm;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  NSNumber *pendingEncryptionAlgorithm;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  NSDate *lastEncryptionKeyChange;
  void *v70;
  uint64_t v71;
  NSString *extensionIdentifier;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  NSNumber *sdkVersionString;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  NSDictionary *tokenToUserMapping;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  NSArray *administratorGroups;
  void *v112;
  uint64_t v113;
  NSDictionary *authorizationGroups;
  void *v115;
  uint64_t v116;
  NSArray *otherGroups;
  void *v118;
  uint64_t v119;
  NSString *defaultUserDomain;
  void *v121;
  uint64_t v122;
  NSString *accountDisplayName;
  void *v124;
  uint64_t v125;
  NSNumber *loginFrequency;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  NSDate *authGracePeriodStart;
  id v151;
  void *v152;
  void *v153;
  id v154;
  _QWORD v156[4];
  id v157;
  _QWORD v158[4];
  id v159;
  id v160;

  v4 = a3;
  v5 = -[PODeviceConfiguration init](self, "init");
  if (!v5)
  {
LABEL_70:
    v11 = v5;
    goto LABEL_71;
  }
  v6 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  objc_msgSend(v6, "setFormatOptions:", 1907);
  v160 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 16, &v160);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v160;
  if (!v8)
  {
    NSStringFromSelector(sel_version);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      NSStringFromSelector(sel_version);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_version = objc_msgSend(v15, "intValue");
    }
    else
    {
      v5->_version = 0;
    }
    NSStringFromSelector(sel__deviceSigningKeyData);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = objc_alloc(MEMORY[0x24BDBCE50]);
      NSStringFromSelector(sel__deviceSigningKeyData);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "psso_initWithBase64URLEncodedString:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      deviceSigningKeyData = v5->__deviceSigningKeyData;
      v5->__deviceSigningKeyData = (NSData *)v21;

    }
    NSStringFromSelector(sel_deviceSigningCertificate);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = objc_alloc(MEMORY[0x24BDBCE50]);
      NSStringFromSelector(sel_deviceSigningCertificate);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "psso_initWithBase64URLEncodedString:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_deviceSigningCertificate = +[POSecKeyHelper certificateForData:](POSecKeyHelper, "certificateForData:", v28);
    }
    NSStringFromSelector(sel_signingAlgorithm);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      NSStringFromSelector(sel_signingAlgorithm);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v31);
      v32 = objc_claimAutoreleasedReturnValue();

      signingAlgorithm = v5->_signingAlgorithm;
      v5->_signingAlgorithm = (NSNumber *)v32;
    }
    else
    {
      v34 = &unk_251520F48;
      signingAlgorithm = v5->_signingAlgorithm;
      v5->_signingAlgorithm = (NSNumber *)v34;
    }

    NSStringFromSelector(sel_pendingSigningAlgorithm);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      NSStringFromSelector(sel_pendingSigningAlgorithm);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v37);
      v38 = objc_claimAutoreleasedReturnValue();

      pendingSigningAlgorithm = v5->_pendingSigningAlgorithm;
      v5->_pendingSigningAlgorithm = (NSNumber *)v38;

    }
    NSStringFromSelector(sel__deviceEncryptionKeyData);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      v42 = objc_alloc(MEMORY[0x24BDBCE50]);
      NSStringFromSelector(sel__deviceEncryptionKeyData);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "psso_initWithBase64URLEncodedString:", v44);
      v45 = objc_claimAutoreleasedReturnValue();

      deviceEncryptionKeyData = v5->__deviceEncryptionKeyData;
      v5->__deviceEncryptionKeyData = (NSData *)v45;

    }
    NSStringFromSelector(sel_deviceEncryptionCertificate);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v49 = objc_alloc(MEMORY[0x24BDBCE50]);
      NSStringFromSelector(sel_deviceEncryptionCertificate);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "psso_initWithBase64URLEncodedString:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_deviceEncryptionCertificate = +[POSecKeyHelper certificateForData:](POSecKeyHelper, "certificateForData:", v52);
    }
    NSStringFromSelector(sel_encryptionAlgorithm);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      NSStringFromSelector(sel_encryptionAlgorithm);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v55);
      v56 = objc_claimAutoreleasedReturnValue();

      encryptionAlgorithm = v5->_encryptionAlgorithm;
      v5->_encryptionAlgorithm = (NSNumber *)v56;
    }
    else
    {
      v58 = &unk_251520F48;
      encryptionAlgorithm = v5->_encryptionAlgorithm;
      v5->_encryptionAlgorithm = (NSNumber *)v58;
    }

    NSStringFromSelector(sel_pendingEncryptionAlgorithm);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      NSStringFromSelector(sel_pendingEncryptionAlgorithm);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v61);
      v62 = objc_claimAutoreleasedReturnValue();

      pendingEncryptionAlgorithm = v5->_pendingEncryptionAlgorithm;
      v5->_pendingEncryptionAlgorithm = (NSNumber *)v62;

    }
    NSStringFromSelector(sel_lastEncryptionKeyChange);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (v65)
    {
      NSStringFromSelector(sel_lastEncryptionKeyChange);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v67, "intValue"));
      v68 = objc_claimAutoreleasedReturnValue();
      lastEncryptionKeyChange = v5->_lastEncryptionKeyChange;
      v5->_lastEncryptionKeyChange = (NSDate *)v68;

    }
    NSStringFromSelector(sel_extensionIdentifier);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v70);
    v71 = objc_claimAutoreleasedReturnValue();
    extensionIdentifier = v5->_extensionIdentifier;
    v5->_extensionIdentifier = (NSString *)v71;

    NSStringFromSelector(sel_registrationCompleted);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
    {
      NSStringFromSelector(sel_registrationCompleted);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_registrationCompleted = objc_msgSend(v76, "BOOLValue");
    }
    else
    {
      v5->_registrationCompleted = 0;
    }
    NSStringFromSelector(sel_sharedDeviceKeys);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    if (v78)
    {
      NSStringFromSelector(sel_sharedDeviceKeys);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_sharedDeviceKeys = objc_msgSend(v80, "BOOLValue");
    }
    else
    {
      v5->_sharedDeviceKeys = 0;
    }
    NSStringFromSelector(sel_protocolVersion);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (v82)
    {
      NSStringFromSelector(sel_protocolVersion);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_protocolVersion = (int)objc_msgSend(v84, "intValue");
    }
    else
    {
      v5->_protocolVersion = 0;
    }
    NSStringFromSelector(sel_sdkVersionString);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v85);
    v86 = objc_claimAutoreleasedReturnValue();
    sdkVersionString = v5->_sdkVersionString;
    v5->_sdkVersionString = (NSNumber *)v86;

    if (!v5->_sdkVersionString)
    {
      v5->_sdkVersionString = (NSNumber *)&unk_251520EB8;

    }
    NSStringFromSelector(sel_loginType);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_loginType = (int)objc_msgSend(v89, "intValue");

    NSStringFromSelector(sel_createUsersEnabled);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    if (v91)
    {
      NSStringFromSelector(sel_createUsersEnabled);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_createUsersEnabled = objc_msgSend(v93, "BOOLValue");
    }
    else
    {
      v5->_createUsersEnabled = 0;
    }
    NSStringFromSelector(sel_authorizationEnabled);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    if (v95)
    {
      NSStringFromSelector(sel_authorizationEnabled);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_authorizationEnabled = objc_msgSend(v97, "BOOLValue");
    }
    else
    {
      v5->_authorizationEnabled = 0;
    }
    NSStringFromSelector(sel_tokenToUserMapping);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v98);
    v99 = objc_claimAutoreleasedReturnValue();
    tokenToUserMapping = v5->_tokenToUserMapping;
    v5->_tokenToUserMapping = (NSDictionary *)v99;

    NSStringFromSelector(sel_newUserAuthorizationMode);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    if (v102)
    {
      NSStringFromSelector(sel_newUserAuthorizationMode);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_newUserAuthorizationMode = (int)objc_msgSend(v104, "intValue");
    }
    else
    {
      v5->_newUserAuthorizationMode = 0;
    }
    NSStringFromSelector(sel_userAuthorizationMode);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    if (v106)
    {
      NSStringFromSelector(sel_userAuthorizationMode);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_userAuthorizationMode = (int)objc_msgSend(v108, "intValue");
    }
    else
    {
      v5->_userAuthorizationMode = 0;
    }
    NSStringFromSelector(sel_administratorGroups);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v109);
    v110 = objc_claimAutoreleasedReturnValue();
    administratorGroups = v5->_administratorGroups;
    v5->_administratorGroups = (NSArray *)v110;

    NSStringFromSelector(sel_authorizationGroups);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v112);
    v113 = objc_claimAutoreleasedReturnValue();
    authorizationGroups = v5->_authorizationGroups;
    v5->_authorizationGroups = (NSDictionary *)v113;

    NSStringFromSelector(sel_otherGroups);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v115);
    v116 = objc_claimAutoreleasedReturnValue();
    otherGroups = v5->_otherGroups;
    v5->_otherGroups = (NSArray *)v116;

    NSStringFromSelector(sel_defaultUserDomain);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v118);
    v119 = objc_claimAutoreleasedReturnValue();
    defaultUserDomain = v5->_defaultUserDomain;
    v5->_defaultUserDomain = (NSString *)v119;

    NSStringFromSelector(sel_accountDisplayName);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v121);
    v122 = objc_claimAutoreleasedReturnValue();
    accountDisplayName = v5->_accountDisplayName;
    v5->_accountDisplayName = (NSString *)v122;

    NSStringFromSelector(sel_loginFrequency);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v124);
    v125 = objc_claimAutoreleasedReturnValue();
    loginFrequency = v5->_loginFrequency;
    v5->_loginFrequency = (NSNumber *)v125;

    NSStringFromSelector(sel_fileVaultPolicy);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    if (v128)
    {
      NSStringFromSelector(sel_fileVaultPolicy);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_fileVaultPolicy = (int)objc_msgSend(v130, "intValue");
    }
    else
    {
      v5->_fileVaultPolicy = 0;
    }
    NSStringFromSelector(sel_loginPolicy);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();

    if (v132)
    {
      NSStringFromSelector(sel_loginPolicy);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_loginPolicy = (int)objc_msgSend(v134, "intValue");
    }
    else
    {
      v5->_loginPolicy = 0;
    }
    NSStringFromSelector(sel_unlockPolicy);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v135);
    v136 = (void *)objc_claimAutoreleasedReturnValue();

    if (v136)
    {
      NSStringFromSelector(sel_unlockPolicy);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_unlockPolicy = (int)objc_msgSend(v138, "intValue");
    }
    else
    {
      v5->_unlockPolicy = 0;
    }
    NSStringFromSelector(sel_offlineGracePeriod);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v139);
    v140 = (void *)objc_claimAutoreleasedReturnValue();

    if (v140)
    {
      NSStringFromSelector(sel_offlineGracePeriod);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v141);
      v142 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_offlineGracePeriod = (int)objc_msgSend(v142, "intValue");
    }
    else
    {
      v5->_offlineGracePeriod = 604800;
    }
    NSStringFromSelector(sel_requireAuthGracePeriod);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v143);
    v144 = (void *)objc_claimAutoreleasedReturnValue();

    if (v144)
    {
      NSStringFromSelector(sel_requireAuthGracePeriod);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v145);
      v146 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_requireAuthGracePeriod = (int)objc_msgSend(v146, "intValue");
    }
    else
    {
      v5->_requireAuthGracePeriod = 604800;
    }
    NSStringFromSelector(sel_authGracePeriodStart);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();

    if (v148)
    {
      objc_msgSend(v6, "dateFromString:", v148);
      v149 = objc_claimAutoreleasedReturnValue();
      authGracePeriodStart = v5->_authGracePeriodStart;
      v5->_authGracePeriodStart = (NSDate *)v149;

    }
    v151 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    NSStringFromSelector(sel_nonPlatformSSOAccounts);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v152);
    v153 = (void *)objc_claimAutoreleasedReturnValue();

    v156[0] = MEMORY[0x24BDAC760];
    v156[1] = 3221225472;
    v156[2] = __38__PODeviceConfiguration_initWithData___block_invoke_95;
    v156[3] = &unk_2514FFB88;
    v154 = v151;
    v157 = v154;
    objc_msgSend(v153, "enumerateObjectsUsingBlock:", v156);
    if (objc_msgSend(v154, "count"))
      objc_storeStrong((id *)&v5->_nonPlatformSSOAccounts, v151);

    goto LABEL_70;
  }
  v158[0] = MEMORY[0x24BDAC760];
  v158[1] = 3221225472;
  v158[2] = __38__PODeviceConfiguration_initWithData___block_invoke;
  v158[3] = &unk_2514FF9D0;
  v159 = v8;
  v9 = v8;
  v10 = __38__PODeviceConfiguration_initWithData___block_invoke((uint64_t)v158);

  v11 = 0;
LABEL_71:

  return v11;
}

id __38__PODeviceConfiguration_initWithData___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error deserializing device config."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODeviceConfiguration();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v1, v2, v3, v4, v5, v6, v7, v8);

  return v1;
}

void __38__PODeviceConfiguration_initWithData___block_invoke_95(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[PODeviceConfiguration dataRepresentationForDisplay:](self, "dataRepresentationForDisplay:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PODeviceConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PODeviceConfiguration *v8;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_dataRepresentation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PODeviceConfiguration initWithData:](self, "initWithData:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PODeviceConfiguration dataRepresentation](self, "dataRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dataRepresentation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (int)version
{
  return self->_version;
}

- (NSString)accountDisplayName
{
  return self->_accountDisplayName;
}

- (void)setAccountDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setLoginFrequency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (__SecCertificate)deviceSigningCertificate
{
  return self->_deviceSigningCertificate;
}

- (void)setDeviceSigningCertificate:(__SecCertificate *)a3
{
  self->_deviceSigningCertificate = a3;
}

- (NSNumber)signingAlgorithm
{
  return self->_signingAlgorithm;
}

- (void)setSigningAlgorithm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)pendingSigningAlgorithm
{
  return self->_pendingSigningAlgorithm;
}

- (void)setPendingSigningAlgorithm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (__SecCertificate)deviceEncryptionCertificate
{
  return self->_deviceEncryptionCertificate;
}

- (void)setDeviceEncryptionCertificate:(__SecCertificate *)a3
{
  self->_deviceEncryptionCertificate = a3;
}

- (NSNumber)encryptionAlgorithm
{
  return self->_encryptionAlgorithm;
}

- (void)setEncryptionAlgorithm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)pendingEncryptionAlgorithm
{
  return self->_pendingEncryptionAlgorithm;
}

- (void)setPendingEncryptionAlgorithm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDate)lastEncryptionKeyChange
{
  return self->_lastEncryptionKeyChange;
}

- (void)setLastEncryptionKeyChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)registrationCompleted
{
  return self->_registrationCompleted;
}

- (void)setRegistrationCompleted:(BOOL)a3
{
  self->_registrationCompleted = a3;
}

- (unint64_t)loginType
{
  return self->_loginType;
}

- (void)setLoginType:(unint64_t)a3
{
  self->_loginType = a3;
}

- (BOOL)sharedDeviceKeys
{
  return self->_sharedDeviceKeys;
}

- (void)setSharedDeviceKeys:(BOOL)a3
{
  self->_sharedDeviceKeys = a3;
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

- (NSNumber)sdkVersionString
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSdkVersionString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (BOOL)createUsersEnabled
{
  return self->_createUsersEnabled;
}

- (void)setCreateUsersEnabled:(BOOL)a3
{
  self->_createUsersEnabled = a3;
}

- (BOOL)authorizationEnabled
{
  return self->_authorizationEnabled;
}

- (void)setAuthorizationEnabled:(BOOL)a3
{
  self->_authorizationEnabled = a3;
}

- (NSString)defaultUserDomain
{
  return self->_defaultUserDomain;
}

- (void)setDefaultUserDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSDictionary)tokenToUserMapping
{
  return self->_tokenToUserMapping;
}

- (void)setTokenToUserMapping:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int64_t)newUserAuthorizationMode
{
  return self->_newUserAuthorizationMode;
}

- (void)setNewUserAuthorizationMode:(int64_t)a3
{
  self->_newUserAuthorizationMode = a3;
}

- (int64_t)userAuthorizationMode
{
  return self->_userAuthorizationMode;
}

- (void)setUserAuthorizationMode:(int64_t)a3
{
  self->_userAuthorizationMode = a3;
}

- (NSArray)administratorGroups
{
  return self->_administratorGroups;
}

- (void)setAdministratorGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)otherGroups
{
  return self->_otherGroups;
}

- (void)setOtherGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSDictionary)authorizationGroups
{
  return self->_authorizationGroups;
}

- (void)setAuthorizationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (unint64_t)fileVaultPolicy
{
  return self->_fileVaultPolicy;
}

- (void)setFileVaultPolicy:(unint64_t)a3
{
  self->_fileVaultPolicy = a3;
}

- (unint64_t)loginPolicy
{
  return self->_loginPolicy;
}

- (void)setLoginPolicy:(unint64_t)a3
{
  self->_loginPolicy = a3;
}

- (unint64_t)unlockPolicy
{
  return self->_unlockPolicy;
}

- (void)setUnlockPolicy:(unint64_t)a3
{
  self->_unlockPolicy = a3;
}

- (int64_t)offlineGracePeriod
{
  return self->_offlineGracePeriod;
}

- (void)setOfflineGracePeriod:(int64_t)a3
{
  self->_offlineGracePeriod = a3;
}

- (int64_t)requireAuthGracePeriod
{
  return self->_requireAuthGracePeriod;
}

- (void)setRequireAuthGracePeriod:(int64_t)a3
{
  self->_requireAuthGracePeriod = a3;
}

- (NSDate)authGracePeriodStart
{
  return self->_authGracePeriodStart;
}

- (void)setAuthGracePeriodStart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSArray)nonPlatformSSOAccounts
{
  return self->_nonPlatformSSOAccounts;
}

- (void)setNonPlatformSSOAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSData)_deviceSigningKeyData
{
  return self->__deviceSigningKeyData;
}

- (void)set_deviceSigningKeyData:(id)a3
{
  objc_storeStrong((id *)&self->__deviceSigningKeyData, a3);
}

- (NSData)_deviceEncryptionKeyData
{
  return self->__deviceEncryptionKeyData;
}

- (void)set_deviceEncryptionKeyData:(id)a3
{
  objc_storeStrong((id *)&self->__deviceEncryptionKeyData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__deviceEncryptionKeyData, 0);
  objc_storeStrong((id *)&self->__deviceSigningKeyData, 0);
  objc_storeStrong((id *)&self->_nonPlatformSSOAccounts, 0);
  objc_storeStrong((id *)&self->_authGracePeriodStart, 0);
  objc_storeStrong((id *)&self->_authorizationGroups, 0);
  objc_storeStrong((id *)&self->_otherGroups, 0);
  objc_storeStrong((id *)&self->_administratorGroups, 0);
  objc_storeStrong((id *)&self->_tokenToUserMapping, 0);
  objc_storeStrong((id *)&self->_defaultUserDomain, 0);
  objc_storeStrong((id *)&self->_sdkVersionString, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_lastEncryptionKeyChange, 0);
  objc_storeStrong((id *)&self->_pendingEncryptionAlgorithm, 0);
  objc_storeStrong((id *)&self->_encryptionAlgorithm, 0);
  objc_storeStrong((id *)&self->_pendingSigningAlgorithm, 0);
  objc_storeStrong((id *)&self->_signingAlgorithm, 0);
  objc_storeStrong((id *)&self->_loginFrequency, 0);
  objc_storeStrong((id *)&self->_accountDisplayName, 0);
}

- (void)supportsTokenUnlock
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(v1, "numberWithBool:", OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]));
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInteger:", objc_msgSend((id)OUTLINED_FUNCTION_4(), "protocolVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_24440D000, v4, v5, "%s shared = %{public}@, protocolversion = %{public}@ on %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)supportsAuthorization
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(v1, "numberWithBool:", OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]));
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend((id)OUTLINED_FUNCTION_4(), "authorizationEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_24440D000, v4, v5, "%s shared = %{public}@, authorizationEnabled = %{public}@ on %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)supportsCreateNewUsers
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(v1, "numberWithBool:", OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x24BDAC8D0]));
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend((id)OUTLINED_FUNCTION_4(), "createUsersEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_24440D000, v4, v5, "%s shared = %{public}@, createUsersEnabled = %{public}@ on %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_3_0();
}

@end
