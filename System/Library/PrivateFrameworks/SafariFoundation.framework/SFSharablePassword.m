@implementation SFSharablePassword

- (SFSharablePassword)initWithUsername:(id)a3 password:(id)a4 displayName:(id)a5 highLevelDomain:(id)a6 passkeyRelyingPartyID:(id)a7 protectionSpaces:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SFSharablePassword *v20;
  uint64_t v21;
  NSString *username;
  uint64_t v23;
  NSString *password;
  uint64_t v25;
  NSString *displayName;
  uint64_t v27;
  NSString *highLevelDomain;
  uint64_t v29;
  NSString *passkeyRelyingPartyID;
  uint64_t v31;
  NSArray *protectionSpaces;
  SFSharablePassword *v33;
  objc_super v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)SFSharablePassword;
  v20 = -[SFSharablePassword init](&v35, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    username = v20->_username;
    v20->_username = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    password = v20->_password;
    v20->_password = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    displayName = v20->_displayName;
    v20->_displayName = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    highLevelDomain = v20->_highLevelDomain;
    v20->_highLevelDomain = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    passkeyRelyingPartyID = v20->_passkeyRelyingPartyID;
    v20->_passkeyRelyingPartyID = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    protectionSpaces = v20->_protectionSpaces;
    v20->_protectionSpaces = (NSArray *)v31;

    v33 = v20;
  }

  return v20;
}

- (SFSharablePassword)initWithSavedPassword:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SFSharablePassword *v11;
  uint64_t v12;
  NSArray *additionalSites;
  void *v14;
  void *v15;
  uint64_t v16;
  NSURL *otpAuthURL;
  uint64_t v18;
  NSString *notesEntry;
  uint64_t v20;
  NSString *customTitle;
  void *v22;
  uint64_t v23;
  NSData *passkeyCredentialID;
  uint64_t v25;
  NSData *passkeyCredential;
  SFSharablePassword *v27;

  v4 = a3;
  objc_msgSend(v4, "effectiveTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highLevelDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passkeyRelyingPartyID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "protectionSpaces");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SFSharablePassword initWithUsername:password:displayName:highLevelDomain:passkeyRelyingPartyID:protectionSpaces:](self, "initWithUsername:password:displayName:highLevelDomain:passkeyRelyingPartyID:protectionSpaces:", v6, v7, v5, v8, v9, v10);

  if (v11)
  {
    objc_msgSend(v4, "additionalSites");
    v12 = objc_claimAutoreleasedReturnValue();
    additionalSites = v11->_additionalSites;
    v11->_additionalSites = (NSArray *)v12;

    objc_msgSend(v4, "totpGenerators");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "exportableURL");
    v16 = objc_claimAutoreleasedReturnValue();
    otpAuthURL = v11->_otpAuthURL;
    v11->_otpAuthURL = (NSURL *)v16;

    objc_msgSend(v4, "notesEntry");
    v18 = objc_claimAutoreleasedReturnValue();
    notesEntry = v11->_notesEntry;
    v11->_notesEntry = (NSString *)v18;

    objc_msgSend(v4, "customTitle");
    v20 = objc_claimAutoreleasedReturnValue();
    customTitle = v11->_customTitle;
    v11->_customTitle = (NSString *)v20;

    objc_msgSend(v4, "_exportPasskeyCredential");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "first");
    v23 = objc_claimAutoreleasedReturnValue();
    passkeyCredentialID = v11->_passkeyCredentialID;
    v11->_passkeyCredentialID = (NSData *)v23;

    objc_msgSend(v22, "second");
    v25 = objc_claimAutoreleasedReturnValue();
    passkeyCredential = v11->_passkeyCredential;
    v11->_passkeyCredential = (NSData *)v25;

    v27 = v11;
  }

  return v11;
}

+ (id)sharablePasswordFromEncryptedData:(id)a3 encryptionKeyReference:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_decryptedDataForEncryptedData:encryptionKeyReference:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFSharablePassword sharablePasswordFromData:](SFSharablePassword, "sharablePasswordFromData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sharablePasswordFromData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  id v11;

  v3 = (void *)MEMORY[0x24BDD1620];
  v4 = a3;
  v11 = 0;
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v11;
  v7 = v6;
  if (v5)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (!v8)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[SFSharablePassword sharablePasswordFromData:].cold.1(v9);
  }

  return v5;
}

+ (id)sharablePasswordFromURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("safaricredential"));

  if ((v6 & 1) == 0)
  {
    v25 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[SFSharablePassword sharablePasswordFromURL:].cold.2(v25, v26, v27, v28, v29, v30, v31, v32);
    v24 = 0;
    goto LABEL_26;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (!v9)
  {

    v12 = 0;
    v11 = 0;
    goto LABEL_22;
  }
  v10 = v9;
  v42 = a1;
  v43 = v4;
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v45;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v45 != v13)
        objc_enumerationMutation(v8);
      v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
      objc_msgSend(v15, "name", v42);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("data")))
      {
        v17 = objc_alloc(MEMORY[0x24BDBCE50]);
        objc_msgSend(v15, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "initWithBase64EncodedString:options:", v18, 0);
        v20 = v12;
        v12 = (void *)v19;
      }
      else
      {
        if (!objc_msgSend(v16, "isEqualToString:", CFSTR("key")))
          goto LABEL_12;
        v21 = objc_alloc(MEMORY[0x24BDBCE50]);
        objc_msgSend(v15, "value");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "initWithBase64EncodedString:options:", v18, 0);
        v20 = v11;
        v11 = (void *)v22;
      }

LABEL_12:
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  }
  while (v10);

  if (v12)
  {
    v4 = v43;
    if (v11)
    {
      objc_msgSend(v42, "_decryptedDataForEncryptedData:encryptionKeyReference:", v12, v11);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[SFSharablePassword sharablePasswordFromData:](SFSharablePassword, "sharablePasswordFromData:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_25;
    }
  }
  else
  {
    v4 = v43;
  }
LABEL_22:
  v33 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    +[SFSharablePassword sharablePasswordFromURL:].cold.1(v33, v34, v35, v36, v37, v38, v39, v40);
  v24 = 0;
LABEL_25:

LABEL_26:
  return v24;
}

- (NSURL)passwordManagerURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  -[SFSharablePassword _encryptionInformationWithNewKey](self, "_encryptionInformationWithNewKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = *MEMORY[0x24BE82F20];
  objc_msgSend(v2, "encryptedPasswordData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = *MEMORY[0x24BE82F28];
  objc_msgSend(v2, "encryptionKeyReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = *MEMORY[0x24BE82F08];
  v7 = *MEMORY[0x24BE82F00];
  v12[1] = v6;
  v12[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE82D28], "passwordManagerURLWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v9;
}

- (id)urlRepresentationForAirDrop
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[SFSharablePassword _encryptionInformationWithNewKey](self, "_encryptionInformationWithNewKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v4, "setScheme:", CFSTR("safaricredential"));
  -[SFSharablePassword _queryItemsForAirDropRepresentationWithEncryptionInformation:](self, "_queryItemsForAirDropRepresentationWithEncryptionInformation:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryItems:", v5);

  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SFSharablePassword *v4;
  SFSharablePassword *v5;
  NSString *username;
  void *v7;
  NSString *password;
  void *v9;
  NSString *displayName;
  void *v11;
  NSString *highLevelDomain;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *protectionSpaces;
  void *v18;
  char v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = (SFSharablePassword *)a3;
  if (self == v4)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      username = self->_username;
      -[SFSharablePassword username](v5, "username");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](username, "isEqualToString:", v7))
      {
        password = self->_password;
        -[SFSharablePassword password](v5, "password");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](password, "isEqualToString:", v9))
        {
          displayName = self->_displayName;
          -[SFSharablePassword displayName](v5, "displayName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSString isEqualToString:](displayName, "isEqualToString:", v11))
          {
            highLevelDomain = self->_highLevelDomain;
            -[SFSharablePassword highLevelDomain](v5, "highLevelDomain");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSString isEqualToString:](highLevelDomain, "isEqualToString:", v13))
            {
              -[SFSharablePassword additionalSites](v5, "additionalSites");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (WBSIsEqual())
              {
                -[SFSharablePassword otpAuthURL](v5, "otpAuthURL");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (WBSIsEqual())
                {
                  -[SFSharablePassword notesEntry](v5, "notesEntry");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  if (WBSIsEqual())
                  {
                    v24 = v16;
                    -[SFSharablePassword customTitle](v5, "customTitle");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    if (WBSIsEqual())
                    {
                      -[SFSharablePassword passkeyCredentialID](v5, "passkeyCredentialID");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      if (WBSIsEqual())
                      {
                        -[SFSharablePassword passkeyCredential](v5, "passkeyCredential");
                        v22 = (void *)objc_claimAutoreleasedReturnValue();
                        if (WBSIsEqual())
                        {
                          -[SFSharablePassword passkeyRelyingPartyID](v5, "passkeyRelyingPartyID");
                          v21 = (void *)objc_claimAutoreleasedReturnValue();
                          if (WBSIsEqual())
                          {
                            protectionSpaces = self->_protectionSpaces;
                            -[SFSharablePassword protectionSpaces](v5, "protectionSpaces");
                            v18 = (void *)objc_claimAutoreleasedReturnValue();
                            v19 = -[NSArray isEqual:](protectionSpaces, "isEqual:", v18);

                          }
                          else
                          {
                            v19 = 0;
                          }
                          v16 = v24;

                        }
                        else
                        {
                          v19 = 0;
                        }

                      }
                      else
                      {
                        v19 = 0;
                      }

                    }
                    else
                    {
                      v19 = 0;
                    }

                  }
                  else
                  {
                    v19 = 0;
                  }

                }
                else
                {
                  v19 = 0;
                }

              }
              else
              {
                v19 = 0;
              }

            }
            else
            {
              v19 = 0;
            }

          }
          else
          {
            v19 = 0;
          }

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = -[NSString hash](self->_username, "hash");
  v4 = -[NSString hash](self->_password, "hash") ^ v3;
  v5 = -[NSString hash](self->_displayName, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_highLevelDomain, "hash");
  v7 = -[NSArray hash](self->_protectionSpaces, "hash");
  v8 = v7 ^ -[NSURL hash](self->_otpAuthURL, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_notesEntry, "hash");
  v10 = -[NSString hash](self->_customTitle, "hash");
  v11 = v10 ^ -[NSArray hash](self->_additionalSites, "hash");
  v12 = v11 ^ -[NSData hash](self->_passkeyCredentialID, "hash");
  v13 = v9 ^ v12 ^ -[NSData hash](self->_passkeyCredential, "hash");
  return v13 ^ -[NSString hash](self->_passkeyRelyingPartyID, "hash");
}

+ (BOOL)safariCredentialURLHasPasskey:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safari_containsObjectPassingTest:", &__block_literal_global_9);

  return v5;
}

uint64_t __52__SFSharablePassword_safariCredentialURLHasPasskey___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("hasPasskey"));

  return v3;
}

- (id)_queryItemsForAirDropRepresentationWithEncryptionInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "encryptedPasswordData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "encryptionKeyReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("data"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("key"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithObjects:", v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFSharablePassword passkeyCredential](self, "passkeyCredential");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("hasPasskey"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v14);

  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSharablePassword)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SFSharablePassword *v14;
  NSArray *v15;
  NSArray *additionalSites;
  NSURL *v17;
  NSURL *otpAuthURL;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *notesEntry;
  uint64_t v26;
  NSString *customTitle;
  uint64_t v28;
  NSData *passkeyCredentialID;
  uint64_t v30;
  NSData *passkeyCredential;
  SFSharablePassword *v32;
  NSString *v34;
  NSURL *v35;
  NSArray *v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("username"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("password"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("highLevelDomain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCF20];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("protectionSpaces"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passkeyCredentialRelyingPartyID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SFSharablePassword initWithUsername:password:displayName:highLevelDomain:passkeyRelyingPartyID:protectionSpaces:](self, "initWithUsername:password:displayName:highLevelDomain:passkeyRelyingPartyID:protectionSpaces:", v5, v6, v7, v8, v13, v12);
  if (v14)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("additionalSites"));
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    additionalSites = v14->_additionalSites;
    v14->_additionalSites = v15;
    v36 = v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("otp"));
    v17 = (NSURL *)objc_claimAutoreleasedReturnValue();
    otpAuthURL = v14->_otpAuthURL;
    v14->_otpAuthURL = v17;
    v35 = v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notes"));
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    v20 = v12;
    v21 = v8;
    v22 = v7;
    v23 = v6;
    v24 = v5;
    notesEntry = v14->_notesEntry;
    v14->_notesEntry = v19;
    v34 = v19;

    v5 = v24;
    v6 = v23;
    v7 = v22;
    v8 = v21;
    v12 = v20;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v26 = objc_claimAutoreleasedReturnValue();
    customTitle = v14->_customTitle;
    v14->_customTitle = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passkeyCredentialID"));
    v28 = objc_claimAutoreleasedReturnValue();
    passkeyCredentialID = v14->_passkeyCredentialID;
    v14->_passkeyCredentialID = (NSData *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passkeyCredential"));
    v30 = objc_claimAutoreleasedReturnValue();
    passkeyCredential = v14->_passkeyCredential;
    v14->_passkeyCredential = (NSData *)v30;

    v32 = v14;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *username;
  id v5;

  username = self->_username;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", username, CFSTR("username"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_password, CFSTR("password"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_highLevelDomain, CFSTR("highLevelDomain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_additionalSites, CFSTR("additionalSites"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_otpAuthURL, CFSTR("otp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_notesEntry, CFSTR("notes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customTitle, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_protectionSpaces, CFSTR("protectionSpaces"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passkeyCredentialID, CFSTR("passkeyCredentialID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passkeyCredential, CFSTR("passkeyCredential"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passkeyRelyingPartyID, CFSTR("passkeyCredentialRelyingPartyID"));

}

- (id)_encryptionInformationWithNewKey
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFDictionary *v17;
  __SecKey *v18;
  __SecKey *v19;
  __SecKey *v20;
  const __CFData *v21;
  CFDataRef v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  _SFSharablePasswordEncryptionInformation *v35;
  CFErrorRef v36;
  NSObject *v37;
  void *v38;
  CFTypeRef result;
  CFErrorRef error;
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[4];
  _QWORD v47[6];

  v47[4] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.passwordsharing.%f"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDE9080];
  v9 = *MEMORY[0x24BDE9048];
  v46[0] = *MEMORY[0x24BDE9050];
  v46[1] = v9;
  v47[0] = v8;
  v47[1] = &unk_24C93C8F0;
  v10 = MEMORY[0x24BDBD1C8];
  v11 = *MEMORY[0x24BDE9528];
  v47[2] = MEMORY[0x24BDBD1C8];
  v12 = *MEMORY[0x24BDE9468];
  v46[2] = v11;
  v46[3] = v12;
  v13 = *MEMORY[0x24BDE8FB8];
  v44[0] = *MEMORY[0x24BDE9018];
  v44[1] = v13;
  v45[0] = MEMORY[0x24BDBD1C8];
  v45[1] = v7;
  v14 = *MEMORY[0x24BDE8F50];
  v44[2] = *MEMORY[0x24BDE9140];
  v44[3] = v14;
  v45[2] = MEMORY[0x24BDBD1C0];
  v45[3] = CFSTR("com.apple.sharing.safaripasswordsharing");
  v44[4] = *MEMORY[0x24BDE8FF8];
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 86400.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 4);
  v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  error = 0;
  v18 = SecKeyCreateRandomKey(v17, &error);
  if (v18)
  {
    v19 = v18;
    v20 = SecKeyCopyPublicKey(v18);
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
    v21 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v22 = SecKeyCreateEncryptedData(v20, (SecKeyAlgorithm)*MEMORY[0x24BDE9320], v21, &error);
    CFRelease(v19);
    CFRelease(v20);
    if (v22)
    {
      result = 0;
      v23 = *MEMORY[0x24BDE9220];
      v42[0] = *MEMORY[0x24BDE94D0];
      v42[1] = v23;
      v24 = *MEMORY[0x24BDE9248];
      v43[0] = v10;
      v43[1] = v24;
      v42[2] = v13;
      v43[2] = v7;
      v25 = SecItemCopyMatching((CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 3), &result);
      if (!(_DWORD)v25)
      {
        v38 = (void *)result;
        v35 = -[_SFSharablePasswordEncryptionInformation initWithEncryptedPasswordData:encryptionKeyReference:]([_SFSharablePasswordEncryptionInformation alloc], "initWithEncryptedPasswordData:encryptionKeyReference:", v22, result);

        goto LABEL_14;
      }
      v26 = v25;
      v27 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[SFSharablePassword _encryptionInformationWithNewKey].cold.3(v26, v27, v28, v29, v30, v31, v32, v33);
    }
    else
    {
      v36 = error;
      v37 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[SFSharablePassword _encryptionInformationWithNewKey].cold.2(v37);

    }
    v35 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v21 = error;
  v34 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    -[SFSharablePassword _encryptionInformationWithNewKey].cold.1(v34);
  v35 = 0;
LABEL_15:

  return v35;
}

+ (id)_decryptedDataForEncryptedData:(id)a3 encryptionKeyReference:(id)a4
{
  const __CFData *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFDataRef v18;
  const __CFData *v19;
  CFErrorRef v20;
  NSObject *v21;
  CFErrorRef error;
  CFTypeRef result;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  v5 = (const __CFData *)a3;
  v6 = a4;
  result = 0;
  v7 = *MEMORY[0x24BDE9220];
  v25[0] = *MEMORY[0x24BDE9558];
  v25[1] = v7;
  v8 = *MEMORY[0x24BDE9248];
  v26[0] = v6;
  v26[1] = v8;
  v25[2] = *MEMORY[0x24BDE94D8];
  v26[2] = MEMORY[0x24BDBD1C8];
  v9 = SecItemCopyMatching((CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3), &result);
  if ((_DWORD)v9)
  {
    v10 = v9;
    v11 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[SFSharablePassword _decryptedDataForEncryptedData:encryptionKeyReference:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
    v18 = 0;
  }
  else
  {
    error = 0;
    v18 = SecKeyCreateDecryptedData((SecKeyRef)result, (SecKeyAlgorithm)*MEMORY[0x24BDE9320], v5, &error);
    CFRelease(result);
    if (v18)
    {
      v19 = v18;
    }
    else
    {
      v20 = error;
      v21 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[SFSharablePassword _decryptedDataForEncryptedData:encryptionKeyReference:].cold.1(v21);

    }
  }

  return v18;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)highLevelDomain
{
  return self->_highLevelDomain;
}

- (NSArray)additionalSites
{
  return self->_additionalSites;
}

- (NSURL)otpAuthURL
{
  return self->_otpAuthURL;
}

- (NSString)notesEntry
{
  return self->_notesEntry;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (NSArray)protectionSpaces
{
  return self->_protectionSpaces;
}

- (NSData)passkeyCredentialID
{
  return self->_passkeyCredentialID;
}

- (NSData)passkeyCredential
{
  return self->_passkeyCredential;
}

- (NSString)passkeyRelyingPartyID
{
  return self->_passkeyRelyingPartyID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passkeyRelyingPartyID, 0);
  objc_storeStrong((id *)&self->_passkeyCredential, 0);
  objc_storeStrong((id *)&self->_passkeyCredentialID, 0);
  objc_storeStrong((id *)&self->_protectionSpaces, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_notesEntry, 0);
  objc_storeStrong((id *)&self->_otpAuthURL, 0);
  objc_storeStrong((id *)&self->_additionalSites, 0);
  objc_storeStrong((id *)&self->_highLevelDomain, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

- (BOOL)hasAnyCredentialData
{
  return -[SFSharablePassword _hasPasskeyData](self, "_hasPasskeyData")
      || -[SFSharablePassword _hasPasswordData](self, "_hasPasswordData");
}

- (BOOL)hasPasswordWithConflicts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[SFSharablePassword _hasPasswordData](self, "_hasPasswordData"))
  {
    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSharablePassword _usernameOrEmptyString](self, "_usernameOrEmptyString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSharablePassword password](self, "password");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSharablePassword highLevelDomain](self, "highLevelDomain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSharablePassword notesEntry](self, "notesEntry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSharablePassword customTitle](self, "customTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[SFSharablePassword protectionSpaces](self, "protectionSpaces");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          if (!objc_msgSend(v3, "canSaveUser:password:forProtectionSpace:highLevelDomain:notes:customTitle:groupID:error:", v4, v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v6, v7, v8, 0, 0))
          {
            LOBYTE(v10) = 1;
            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (id)saveToKeychain
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[SFSharablePassword _savePasswordAccount](self, "_savePasswordAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSharablePassword _savePasskeyAccount](self, "_savePasskeyAccount");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_mergeSavedAccountWithPasskey:toSavedAccountWithPassword:", v5, v3);

  }
  if (v3)
    v7 = v3;
  else
    v7 = v5;
  v8 = v7;
  if (v8)
  {
    -[SFSharablePassword _saveAdditionalSitesForSavedAccount:](self, "_saveAdditionalSitesForSavedAccount:", v8);
    -[SFSharablePassword _saveNotesEntryForSavedAccount:](self, "_saveNotesEntryForSavedAccount:", v8);
    -[SFSharablePassword _saveCustomTitleForSavedAccount:](self, "_saveCustomTitleForSavedAccount:", v8);
    -[SFSharablePassword _saveOneTimeCodeForSavedAccount:](self, "_saveOneTimeCodeForSavedAccount:", v8);
    v9 = v8;
  }

  return v8;
}

- (void)savePasskeyAccountAndMergeIntoSavedPasswordAccountIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SFSharablePassword _savePasskeyAccount](self, "_savePasskeyAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_mergeSavedAccountWithPasskey:toSavedAccountWithPassword:", v4, v6);

  }
}

- (id)_usernameOrEmptyString
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  -[SFSharablePassword username](self, "username");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_24C9367F0;
  v4 = v2;

  return v4;
}

- (BOOL)_hasPasswordData
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[SFSharablePassword password](self, "password");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[SFSharablePassword highLevelDomain](self, "highLevelDomain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      -[SFSharablePassword protectionSpaces](self, "protectionSpaces");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count") != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_hasPasskeyData
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[SFSharablePassword passkeyCredential](self, "passkeyCredential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[SFSharablePassword passkeyCredentialID](self, "passkeyCredentialID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      -[SFSharablePassword highLevelDomain](self, "highLevelDomain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length") != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_savePasswordAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!-[SFSharablePassword _hasPasswordData](self, "_hasPasswordData"))
    return 0;
  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSharablePassword _usernameOrEmptyString](self, "_usernameOrEmptyString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSharablePassword password](self, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSharablePassword highLevelDomain](self, "highLevelDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SFSharablePassword protectionSpaces](self, "protectionSpaces");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(v3, "saveUser:password:forProtectionSpace:highLevelDomain:groupID:", v4, v5, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), v6, &stru_24C9367F0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_savePasskeyAccount
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[SFSharablePassword _hasPasskeyData](self, "_hasPasskeyData"))
  {
    v3 = objc_alloc(MEMORY[0x24BE82D08]);
    -[SFSharablePassword passkeyCredentialID](self, "passkeyCredentialID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSharablePassword passkeyCredential](self, "passkeyCredential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithFirst:second:", v4, v5);

    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSharablePassword _usernameOrEmptyString](self, "_usernameOrEmptyString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSharablePassword passkeyRelyingPartyID](self, "passkeyRelyingPartyID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_saveUser:passkeyCredential:passkeyRelyingPartyID:", v8, v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)_saveAdditionalSitesForSavedAccount:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SFSharablePassword additionalSites](self, "additionalSites");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "saveAdditionalSites:forSavedAccount:", v4, v6);

  }
}

- (void)_saveNotesEntryForSavedAccount:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SFSharablePassword notesEntry](self, "notesEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "saveNotesEntry:forSavedAccount:", v4, v6);

  }
}

- (void)_saveCustomTitleForSavedAccount:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SFSharablePassword customTitle](self, "customTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "saveCustomTitle:forSavedAccount:", v4, v6);

  }
}

- (void)_saveOneTimeCodeForSavedAccount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SFSharablePassword otpAuthURL](self, "otpAuthURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82DE8]), "initWithOTPAuthURL:", v4);
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "saveTOTPGenerator:forSavedAccount:", v5, v7);

    }
  }

}

+ (void)sharablePasswordFromData:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20E365000, v3, v4, "Failed to unarchive sharable password with error %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

+ (void)sharablePasswordFromURL:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20E365000, a1, a3, "Failed to create sharable password from URL because it's missing data or key reference", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)sharablePasswordFromURL:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20E365000, a1, a3, "Failed to create sharable password from URL because it has incorrect scheme", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_encryptionInformationWithNewKey
{
  OUTLINED_FUNCTION_3_1(&dword_20E365000, a2, a3, "Failed to get persistent reference to private key with status: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)_decryptedDataForEncryptedData:(void *)a1 encryptionKeyReference:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20E365000, v3, v4, "Failed to decrypt password data with error %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

+ (void)_decryptedDataForEncryptedData:(uint64_t)a3 encryptionKeyReference:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_20E365000, a2, a3, "Failed to get private key with status %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
