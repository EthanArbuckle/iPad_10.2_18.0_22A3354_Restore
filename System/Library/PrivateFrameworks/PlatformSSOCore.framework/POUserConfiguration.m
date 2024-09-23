@implementation POUserConfiguration

- (POUserConfiguration)init
{
  POUserConfiguration *v2;
  POUserConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)POUserConfiguration;
  v2 = -[POUserConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    objc_storeStrong((id *)&v2->_signingAlgorithm, &unk_251520F48);
  }
  return v3;
}

- (void)updateVersion
{
  self->_version = 1;
}

- (__SecKey)sepKey
{
  return -[POUserConfiguration sepKeyWithContext:](self, "sepKeyWithContext:", 0);
}

- (__SecKey)sepKeyWithContext:(id)a3
{
  __SecKey *result;

  result = +[POSecKeyHelper keyForData:context:](POSecKeyHelper, "keyForData:context:", self->__sepKeyData, a3);
  self->_sepKey = result;
  return result;
}

- (void)setSepKey:(__SecKey *)a3
{
  NSData *v4;
  NSData *sepKeyData;

  self->_sepKey = a3;
  if (a3)
  {
    +[POSecKeyHelper dataForKey:](POSecKeyHelper, "dataForKey:");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    sepKeyData = self->__sepKeyData;
    self->__sepKeyData = v4;

  }
}

- (NSString)__ssoExtensionIdentifier
{
  return self->_ssoExtensionIdentifier;
}

- (void)set__ssoExtensionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_ssoExtensionIdentifier, a3);
}

- (NSString)tokenId
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[POUserConfiguration userDecryptionKeyHash](self, "userDecryptionKeyHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[POUserConfiguration userDecryptionKeyHash](self, "userDecryptionKeyHash");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[POTokenHelper dataToHex:](POTokenHelper, "dataToHex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("com.apple.platformsso:%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (NSString)unlockTokenId
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[POUserConfiguration userUnlockHash](self, "userUnlockHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[POUserConfiguration userUnlockHash](self, "userUnlockHash");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[POTokenHelper dataToHex:](POTokenHelper, "dataToHex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("com.apple.platformsso:%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (id)dataRepresentation
{
  return -[POUserConfiguration dataRepresentationForDisplay:](self, "dataRepresentationForDisplay:", 0);
}

- (id)dataRepresentationForDisplay:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *uniqueIdentifier;
  void *v12;
  NSString *ssoExtensionIdentifier;
  void *v14;
  unint64_t loginType;
  void *v16;
  void *v17;
  NSDate *lastLoginDate;
  void *v19;
  void *v20;
  int64_t state;
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
  NSString *smartCardTokenId;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *userDecryptionContext;
  void *v53;
  void *userUnlockData;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  _QWORD v69[4];
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;

  v3 = a3;
  v77 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  objc_msgSend(v5, "setFormatOptions:", 1907);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_version);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_version);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v8);

  -[POUserLoginConfiguration dictionaryRepresentationForDisplay:](self->_userLoginConfiguration, "dictionaryRepresentationForDisplay:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userLoginConfiguration);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v10);

  uniqueIdentifier = self->_uniqueIdentifier;
  NSStringFromSelector(sel_uniqueIdentifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", uniqueIdentifier, v12);

  ssoExtensionIdentifier = self->_ssoExtensionIdentifier;
  NSStringFromSelector(sel_ssoExtensionIdentifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", ssoExtensionIdentifier, v14);

  loginType = self->_loginType;
  if (v3)
    +[POConstantCoreUtil stringForLoginType:](POConstantCoreUtil, "stringForLoginType:", loginType);
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", loginType);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_loginType);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v17);

  lastLoginDate = self->_lastLoginDate;
  if (lastLoginDate)
  {
    objc_msgSend(v5, "stringFromDate:", self->_lastLoginDate);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  NSStringFromSelector(sel_lastLoginDate);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v20);

  if (lastLoginDate)
  state = self->_state;
  if (v3)
    +[POConstantCoreUtil stringForUserState:](POConstantCoreUtil, "stringForUserState:", state);
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", state);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_state);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, v23);

  if (v3)
    -[NSData psso_sha256HashString](self->__sepKeyData, "psso_sha256HashString");
  else
    -[NSData psso_base64URLEncodedString](self->__sepKeyData, "psso_base64URLEncodedString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__sepKeyData);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, v25);

  -[POUserConfiguration signingAlgorithm](self, "signingAlgorithm");
  if (v3)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[POConstantCoreUtil stringForSigningAlgorithm:](POConstantCoreUtil, "stringForSigningAlgorithm:", v24);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_signingAlgorithm);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, v27);

  if (v3)
  {

    -[POUserConfiguration pendingSigningAlgorithm](self, "pendingSigningAlgorithm");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[POConstantCoreUtil stringForSigningAlgorithm:](POConstantCoreUtil, "stringForSigningAlgorithm:", v24);
  }
  else
  {
    -[POUserConfiguration pendingSigningAlgorithm](self, "pendingSigningAlgorithm");
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_pendingSigningAlgorithm);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, v29);

  if (v3)
  {

    v28 = v24;
  }

  +[POSecKeyHelper dataForCertificate:](POSecKeyHelper, "dataForCertificate:", self->_sepKeyCertificate);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "psso_base64URLEncodedString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sepKeyCertificate);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, v32);

  smartCardTokenId = self->_smartCardTokenId;
  NSStringFromSelector(sel_smartCardTokenId);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", smartCardTokenId, v34);

  if (v3)
    +[POTokenHelper dataToHex:](POTokenHelper, "dataToHex:", self->_smartCardHash);
  else
    -[NSData psso_base64URLEncodedString](self->_smartCardHash, "psso_base64URLEncodedString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_smartCardHash);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, v36);

  if (v3)
    -[NSData psso_sha256HashString](self->__credential, "psso_sha256HashString");
  else
    -[NSData psso_base64URLEncodedString](self->__credential, "psso_base64URLEncodedString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__credential);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, v38);

  v39 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v40 = self->_kerberosStatus;
  v41 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v73 != v43)
          objc_enumerationMutation(v40);
        objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "dictionaryRepresentation");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObject:", v45);

      }
      v42 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
    }
    while (v42);
  }

  if (objc_msgSend(v39, "count"))
  {
    NSStringFromSelector(sel_kerberosStatus);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, v46);

  }
  if (v3)
    +[POTokenHelper dataToHex:](POTokenHelper, "dataToHex:", self->_userDecryptionKeyHash);
  else
    -[NSData psso_base64URLEncodedString](self->_userDecryptionKeyHash, "psso_base64URLEncodedString");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userDecryptionKeyHash);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v47, v48);

  +[POSecKeyHelper dataForCertificate:](POSecKeyHelper, "dataForCertificate:", self->_userDecryptionCertificate);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "psso_base64URLEncodedString");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userDecryptionCertificate);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v50, v51);

  userDecryptionContext = self->_userDecryptionContext;
  if (v3)
  {
    -[NSString dataUsingEncoding:](self->_userDecryptionContext, "dataUsingEncoding:", 4);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "psso_sha256HashString");
    userDecryptionContext = (void *)objc_claimAutoreleasedReturnValue();
  }
  NSStringFromSelector(sel_userDecryptionContext);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", userDecryptionContext, v53);

  if (v3)
  {

    -[NSString dataUsingEncoding:](self->_userUnlockData, "dataUsingEncoding:", 4);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "psso_sha256HashString");
    userUnlockData = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    userUnlockData = self->_userUnlockData;
  }
  NSStringFromSelector(sel_userUnlockData);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", userUnlockData, v55);

  if (v3)
  {

    +[POTokenHelper dataToHex:](POTokenHelper, "dataToHex:", self->_userUnlockHash);
  }
  else
  {
    -[NSData psso_base64URLEncodedString](self->_userUnlockHash, "psso_base64URLEncodedString");
  }
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userUnlockHash);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v56, v57);

  +[POSecKeyHelper dataForCertificate:](POSecKeyHelper, "dataForCertificate:", self->_userUnlockCertificate);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "psso_base64URLEncodedString");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userUnlockCertificate);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v59, v60);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v62, CFSTR("created"));

  v71 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 11, &v71);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v71;
  v65 = v64;
  if (v64)
  {
    v69[0] = MEMORY[0x24BDAC760];
    v69[1] = 3221225472;
    v69[2] = __52__POUserConfiguration_dataRepresentationForDisplay___block_invoke;
    v69[3] = &unk_2514FF9D0;
    v70 = v64;
    v66 = __52__POUserConfiguration_dataRepresentationForDisplay___block_invoke((uint64_t)v69);

    v67 = 0;
  }
  else
  {
    v67 = v63;
  }

  return v67;
}

id __52__POUserConfiguration_dataRepresentationForDisplay___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error serializing user config."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserConfiguration();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

- (POUserConfiguration)initWithData:(id)a3
{
  id v4;
  POUserConfiguration *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  POUserConfiguration *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  POUserLoginConfiguration *v18;
  POUserLoginConfiguration *userLoginConfiguration;
  void *v20;
  POUserLoginConfiguration *v21;
  POUserLoginConfiguration *v22;
  void *v23;
  uint64_t v24;
  NSString *uniqueIdentifier;
  void *v26;
  uint64_t v27;
  NSString *ssoExtensionIdentifier;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSString *smartCardTokenId;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSData *smartCardHash;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  NSDate *lastLoginDate;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSData *credential;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSData *sepKeyData;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  NSNumber *signingAlgorithm;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  NSNumber *pendingSigningAlgorithm;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  uint64_t v87;
  NSData *userDecryptionKeyHash;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  NSString *userDecryptionContext;
  void *v98;
  uint64_t v99;
  NSString *userUnlockData;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  uint64_t v106;
  NSData *userUnlockHash;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v115;
  void *v116;
  _QWORD v117[4];
  id v118;
  _QWORD v119[4];
  id v120;
  id v121;

  v4 = a3;
  v5 = -[POUserConfiguration init](self, "init");
  if (!v5)
  {
LABEL_39:
    v11 = v5;
    goto LABEL_40;
  }
  v6 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  objc_msgSend(v6, "setFormatOptions:", 1907);
  v121 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 16, &v121);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v121;
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
    NSStringFromSelector(sel_userLoginConfiguration);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[POUserLoginConfiguration initWithDictionary:]([POUserLoginConfiguration alloc], "initWithDictionary:", v17);
      userLoginConfiguration = v5->_userLoginConfiguration;
      v5->_userLoginConfiguration = v18;

    }
    if (!v5->_version)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("loginUserName"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = -[POUserLoginConfiguration initWithLoginUserName:]([POUserLoginConfiguration alloc], "initWithLoginUserName:", v20);
        v22 = v5->_userLoginConfiguration;
        v5->_userLoginConfiguration = v21;

      }
    }
    NSStringFromSelector(sel_uniqueIdentifier);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v24;

    NSStringFromSelector(sel_ssoExtensionIdentifier);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    ssoExtensionIdentifier = v5->_ssoExtensionIdentifier;
    v5->_ssoExtensionIdentifier = (NSString *)v27;

    NSStringFromSelector(sel_loginType);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_loginType = (int)objc_msgSend(v30, "intValue");

    NSStringFromSelector(sel_state);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = (int)objc_msgSend(v32, "intValue");

    NSStringFromSelector(sel_smartCardTokenId);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    smartCardTokenId = v5->_smartCardTokenId;
    v5->_smartCardTokenId = (NSString *)v34;

    NSStringFromSelector(sel_smartCardHash);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = objc_alloc(MEMORY[0x24BDBCE50]);
      NSStringFromSelector(sel_smartCardHash);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "psso_initWithBase64URLEncodedString:", v40);
      v41 = objc_claimAutoreleasedReturnValue();

      smartCardHash = v5->_smartCardHash;
      v5->_smartCardHash = (NSData *)v41;

    }
    NSStringFromSelector(sel_lastLoginDate);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v43);
    v44 = objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v6, "dateFromString:", v44);
      v45 = objc_claimAutoreleasedReturnValue();
      lastLoginDate = v5->_lastLoginDate;
      v5->_lastLoginDate = (NSDate *)v45;

    }
    NSStringFromSelector(sel__credential);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v49 = objc_alloc(MEMORY[0x24BDBCE50]);
      NSStringFromSelector(sel__credential);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "psso_initWithBase64URLEncodedString:", v51);
      v52 = objc_claimAutoreleasedReturnValue();

      credential = v5->__credential;
      v5->__credential = (NSData *)v52;

    }
    NSStringFromSelector(sel__sepKeyData);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      v56 = objc_alloc(MEMORY[0x24BDBCE50]);
      NSStringFromSelector(sel__sepKeyData);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "psso_initWithBase64URLEncodedString:", v58);
      v59 = objc_claimAutoreleasedReturnValue();

      sepKeyData = v5->__sepKeyData;
      v5->__sepKeyData = (NSData *)v59;

    }
    NSStringFromSelector(sel_signingAlgorithm);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      NSStringFromSelector(sel_signingAlgorithm);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v63);
      v64 = objc_claimAutoreleasedReturnValue();

      signingAlgorithm = v5->_signingAlgorithm;
      v5->_signingAlgorithm = (NSNumber *)v64;
    }
    else
    {
      v66 = &unk_251520F48;
      signingAlgorithm = v5->_signingAlgorithm;
      v5->_signingAlgorithm = (NSNumber *)v66;
    }

    NSStringFromSelector(sel_pendingSigningAlgorithm);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      NSStringFromSelector(sel_pendingSigningAlgorithm);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v69);
      v70 = objc_claimAutoreleasedReturnValue();

      pendingSigningAlgorithm = v5->_pendingSigningAlgorithm;
      v5->_pendingSigningAlgorithm = (NSNumber *)v70;

    }
    NSStringFromSelector(sel_sepKeyCertificate);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      v74 = objc_alloc(MEMORY[0x24BDBCE50]);
      NSStringFromSelector(sel_sepKeyCertificate);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "psso_initWithBase64URLEncodedString:", v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_sepKeyCertificate = +[POSecKeyHelper certificateForData:](POSecKeyHelper, "certificateForData:", v77);
    }
    v115 = (void *)v44;
    v116 = (void *)v17;
    v78 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    NSStringFromSelector(sel_kerberosStatus);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    v117[0] = MEMORY[0x24BDAC760];
    v117[1] = 3221225472;
    v117[2] = __36__POUserConfiguration_initWithData___block_invoke_138;
    v117[3] = &unk_2514FFB88;
    v81 = v78;
    v118 = v81;
    objc_msgSend(v80, "enumerateObjectsUsingBlock:", v117);
    if (objc_msgSend(v81, "count"))
      objc_storeStrong((id *)&v5->_kerberosStatus, v78);
    NSStringFromSelector(sel_userDecryptionKeyHash);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    if (v83)
    {
      v84 = objc_alloc(MEMORY[0x24BDBCE50]);
      NSStringFromSelector(sel_userDecryptionKeyHash);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "psso_initWithBase64URLEncodedString:", v86);
      v87 = objc_claimAutoreleasedReturnValue();

      userDecryptionKeyHash = v5->_userDecryptionKeyHash;
      v5->_userDecryptionKeyHash = (NSData *)v87;

    }
    NSStringFromSelector(sel_userDecryptionCertificate);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    if (v90)
    {
      v91 = objc_alloc(MEMORY[0x24BDBCE50]);
      NSStringFromSelector(sel_userDecryptionCertificate);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "psso_initWithBase64URLEncodedString:", v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_userDecryptionCertificate = +[POSecKeyHelper certificateForData:](POSecKeyHelper, "certificateForData:", v94);
    }
    NSStringFromSelector(sel_userDecryptionContext);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v95);
    v96 = objc_claimAutoreleasedReturnValue();
    userDecryptionContext = v5->_userDecryptionContext;
    v5->_userDecryptionContext = (NSString *)v96;

    NSStringFromSelector(sel_userUnlockData);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v98);
    v99 = objc_claimAutoreleasedReturnValue();
    userUnlockData = v5->_userUnlockData;
    v5->_userUnlockData = (NSString *)v99;

    NSStringFromSelector(sel_userUnlockHash);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    if (v102)
    {
      v103 = objc_alloc(MEMORY[0x24BDBCE50]);
      NSStringFromSelector(sel_userUnlockHash);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v104);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "psso_initWithBase64URLEncodedString:", v105);
      v106 = objc_claimAutoreleasedReturnValue();

      userUnlockHash = v5->_userUnlockHash;
      v5->_userUnlockHash = (NSData *)v106;

    }
    NSStringFromSelector(sel_userUnlockCertificate);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    if (v109)
    {
      v110 = objc_alloc(MEMORY[0x24BDBCE50]);
      NSStringFromSelector(sel_userUnlockCertificate);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "psso_initWithBase64URLEncodedString:", v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();

      v5->_userUnlockCertificate = +[POSecKeyHelper certificateForData:](POSecKeyHelper, "certificateForData:", v113);
    }

    goto LABEL_39;
  }
  v119[0] = MEMORY[0x24BDAC760];
  v119[1] = 3221225472;
  v119[2] = __36__POUserConfiguration_initWithData___block_invoke;
  v119[3] = &unk_2514FF9D0;
  v120 = v8;
  v9 = v8;
  v10 = __36__POUserConfiguration_initWithData___block_invoke((uint64_t)v119);

  v11 = 0;
LABEL_40:

  return v11;
}

id __36__POUserConfiguration_initWithData___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error deserializing user config."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POUserConfiguration();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

void __36__POUserConfiguration_initWithData___block_invoke_138(uint64_t a1, void *a2)
{
  void *v3;
  POKerberosStatus *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = -[POKerberosStatus initWithDictionary:]([POKerberosStatus alloc], "initWithDictionary:", v5);
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[POUserConfiguration dataRepresentationForDisplay:](self, "dataRepresentationForDisplay:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (POUserConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  POUserConfiguration *v8;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_dataRepresentation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[POUserConfiguration initWithData:](self, "initWithData:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[POUserConfiguration dataRepresentation](self, "dataRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dataRepresentation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (int)version
{
  return self->_version;
}

- (POUserLoginConfiguration)userLoginConfiguration
{
  return (POUserLoginConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUserLoginConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)uniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSDate)lastLoginDate
{
  return self->_lastLoginDate;
}

- (void)setLastLoginDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastLoginDate, a3);
}

- (unint64_t)loginType
{
  return self->_loginType;
}

- (void)setLoginType:(unint64_t)a3
{
  self->_loginType = a3;
}

- (NSNumber)signingAlgorithm
{
  return self->_signingAlgorithm;
}

- (void)setSigningAlgorithm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)pendingSigningAlgorithm
{
  return self->_pendingSigningAlgorithm;
}

- (void)setPendingSigningAlgorithm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (__SecCertificate)sepKeyCertificate
{
  return self->_sepKeyCertificate;
}

- (void)setSepKeyCertificate:(__SecCertificate *)a3
{
  self->_sepKeyCertificate = a3;
}

- (NSString)smartCardTokenId
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSmartCardTokenId:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSData)smartCardHash
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSmartCardHash:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSData)_credential
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)set_credential:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSArray)kerberosStatus
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setKerberosStatus:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSData)userDecryptionKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setUserDecryptionKeyHash:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (__SecCertificate)userDecryptionCertificate
{
  return self->_userDecryptionCertificate;
}

- (void)setUserDecryptionCertificate:(__SecCertificate *)a3
{
  self->_userDecryptionCertificate = a3;
}

- (NSString)userDecryptionContext
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setUserDecryptionContext:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSString)userUnlockData
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setUserUnlockData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSData)userUnlockHash
{
  return (NSData *)objc_getProperty(self, a2, 152, 1);
}

- (void)setUserUnlockHash:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (__SecCertificate)userUnlockCertificate
{
  return self->_userUnlockCertificate;
}

- (void)setUserUnlockCertificate:(__SecCertificate *)a3
{
  self->_userUnlockCertificate = a3;
}

- (NSString)ssoExtensionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSsoExtensionIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (NSData)_sepKeyData
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (void)set_sepKeyData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__sepKeyData, 0);
  objc_storeStrong((id *)&self->_ssoExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_userUnlockHash, 0);
  objc_storeStrong((id *)&self->_userUnlockData, 0);
  objc_storeStrong((id *)&self->_userDecryptionContext, 0);
  objc_storeStrong((id *)&self->_userDecryptionKeyHash, 0);
  objc_storeStrong((id *)&self->_kerberosStatus, 0);
  objc_storeStrong((id *)&self->__credential, 0);
  objc_storeStrong((id *)&self->_smartCardHash, 0);
  objc_storeStrong((id *)&self->_smartCardTokenId, 0);
  objc_storeStrong((id *)&self->_pendingSigningAlgorithm, 0);
  objc_storeStrong((id *)&self->_signingAlgorithm, 0);
  objc_storeStrong((id *)&self->_lastLoginDate, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_userLoginConfiguration, 0);
}

@end
