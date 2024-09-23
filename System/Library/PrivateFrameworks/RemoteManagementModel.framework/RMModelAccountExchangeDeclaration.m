@implementation RMModelAccountExchangeDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.account.exchange");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[24];

  v6[23] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("VisibleName");
  v6[1] = CFSTR("EnabledProtocolTypes");
  v6[2] = CFSTR("UserIdentityAssetReference");
  v6[3] = CFSTR("HostName");
  v6[4] = CFSTR("Port");
  v6[5] = CFSTR("Path");
  v6[6] = CFSTR("ExternalHostName");
  v6[7] = CFSTR("ExternalPort");
  v6[8] = CFSTR("External Path");
  v6[9] = CFSTR("OAuth");
  v6[10] = CFSTR("AuthenticationCredentialsAssetReference");
  v6[11] = CFSTR("AuthenticationIdentityAssetReference");
  v6[12] = CFSTR("SMIME");
  v6[13] = CFSTR("MailServiceActive");
  v6[14] = CFSTR("LockMailService");
  v6[15] = CFSTR("ContactsServiceActive");
  v6[16] = CFSTR("LockContactsService");
  v6[17] = CFSTR("CalendarServiceActive");
  v6[18] = CFSTR("LockCalendarService");
  v6[19] = CFSTR("RemindersServiceActive");
  v6[20] = CFSTR("LockRemindersService");
  v6[21] = CFSTR("NotesServiceActive");
  v6[22] = CFSTR("LockNotesService");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624480);
}

- (id)assetReferences
{
  if (assetReferences_onceToken_1 != -1)
    dispatch_once(&assetReferences_onceToken_1, &__block_literal_global_1);
  return -[RMModelConfigurationBase assetReferencesFromKeyPaths:payloadObject:](self, "assetReferencesFromKeyPaths:payloadObject:", assetReferences_assetPaths_1, self);
}

void __52__RMModelAccountExchangeDeclaration_assetReferences__block_invoke()
{
  RMModelConfigurationSchemaAssetReference *v0;
  RMModelConfigurationSchemaAssetReference *v1;
  RMModelConfigurationSchemaAssetReference *v2;
  RMModelConfigurationSchemaAssetReference *v3;
  RMModelConfigurationSchemaAssetReference *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x24BDAC8D0];
  v0 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_251624498, CFSTR("$.payloadUserIdentityAssetReference"));
  v1 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_2516244B0, CFSTR("$.payloadAuthenticationCredentialsAssetReference"), v0);
  v7[1] = v1;
  v2 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_2516244C8, CFSTR("$.payloadAuthenticationIdentityAssetReference"));
  v7[2] = v2;
  v3 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_2516244E0, CFSTR("$.payloadSMIME.payloadSigning.payloadIdentityAssetReference"));
  v7[3] = v3;
  v4 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", &unk_2516244F8, CFSTR("$.payloadSMIME.payloadEncryption.payloadIdentityAssetReference"));
  v7[4] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)assetReferences_assetPaths_1;
  assetReferences_assetPaths_1 = v5;

}

+ (id)buildWithIdentifier:(id)a3 visibleName:(id)a4 enabledProtocolTypes:(id)a5 userIdentityAssetReference:(id)a6 hostName:(id)a7 port:(id)a8 path:(id)a9 externalHostName:(id)a10 externalPort:(id)a11 externalPath:(id)a12 oAuth:(id)a13 authenticationCredentialsAssetReference:(id)a14 authenticationIdentityAssetReference:(id)a15 SMIME:(id)a16 mailServiceActive:(id)a17 lockMailService:(id)a18 contactsServiceActive:(id)a19 lockContactsService:(id)a20 calendarServiceActive:(id)a21 lockCalendarService:(id)a22 remindersServiceActive:(id)a23 lockRemindersService:(id)a24 notesServiceActive:(id)a25 lockNotesService:(id)a26
{
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v53;
  id v57;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;

  v26 = a3;
  v27 = a26;
  v28 = a25;
  v72 = a24;
  v71 = a23;
  v70 = a22;
  v69 = a21;
  v68 = a20;
  v67 = a19;
  v66 = a18;
  v65 = a17;
  v64 = a16;
  v63 = a15;
  v62 = a14;
  v61 = a13;
  v60 = a12;
  v57 = a11;
  v53 = a10;
  v29 = a9;
  v30 = a8;
  v31 = a7;
  v32 = a6;
  v33 = a5;
  v34 = a4;
  v35 = (void *)objc_opt_new();
  objc_msgSend(v35, "setDeclarationType:", CFSTR("com.apple.configuration.account.exchange"));
  if (v26)
  {
    objc_msgSend(v35, "setDeclarationIdentifier:", v26);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v59 = v27;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "UUIDString");
    v37 = v28;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setDeclarationIdentifier:", v38);

    v28 = v37;
    v26 = 0;
    v27 = v59;
  }
  objc_msgSend(v35, "setPayloadVisibleName:", v34);

  objc_msgSend(v35, "setPayloadEnabledProtocolTypes:", v33);
  objc_msgSend(v35, "setPayloadUserIdentityAssetReference:", v32);

  objc_msgSend(v35, "setPayloadHostName:", v31);
  objc_msgSend(v35, "setPayloadPort:", v30);

  objc_msgSend(v35, "setPayloadPath:", v29);
  objc_msgSend(v35, "setPayloadExternalHostName:", v53);

  objc_msgSend(v35, "setPayloadExternalPort:", v57);
  objc_msgSend(v35, "setPayloadExternalPath:", v60);

  objc_msgSend(v35, "setPayloadOAuth:", v61);
  objc_msgSend(v35, "setPayloadAuthenticationCredentialsAssetReference:", v62);

  objc_msgSend(v35, "setPayloadAuthenticationIdentityAssetReference:", v63);
  objc_msgSend(v35, "setPayloadSMIME:", v64);

  v39 = (void *)MEMORY[0x24BDBD1C8];
  if (v65)
    v40 = v65;
  else
    v40 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v35, "setPayloadMailServiceActive:", v40);

  v41 = (void *)MEMORY[0x24BDBD1C0];
  if (v66)
    v42 = v66;
  else
    v42 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v35, "setPayloadLockMailService:", v42);

  if (v67)
    v43 = v67;
  else
    v43 = v39;
  objc_msgSend(v35, "setPayloadContactsServiceActive:", v43);

  if (v68)
    v44 = v68;
  else
    v44 = v41;
  objc_msgSend(v35, "setPayloadLockContactsService:", v44);

  if (v69)
    v45 = v69;
  else
    v45 = v39;
  objc_msgSend(v35, "setPayloadCalendarServiceActive:", v45);

  if (v70)
    v46 = v70;
  else
    v46 = v41;
  objc_msgSend(v35, "setPayloadLockCalendarService:", v46);

  if (v71)
    v47 = v71;
  else
    v47 = v39;
  objc_msgSend(v35, "setPayloadRemindersServiceActive:", v47);

  if (v72)
    v48 = v72;
  else
    v48 = v41;
  objc_msgSend(v35, "setPayloadLockRemindersService:", v48);

  if (v28)
    v49 = v28;
  else
    v49 = v39;
  objc_msgSend(v35, "setPayloadNotesServiceActive:", v49);

  if (v27)
    v50 = v27;
  else
    v50 = v41;
  objc_msgSend(v35, "setPayloadLockNotesService:", v50);

  objc_msgSend(v35, "updateServerToken");
  return v35;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 enabledProtocolTypes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDeclarationType:", CFSTR("com.apple.configuration.account.exchange"));
  if (v5)
  {
    objc_msgSend(v7, "setDeclarationIdentifier:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeclarationIdentifier:", v9);

  }
  objc_msgSend(v7, "setPayloadEnabledProtocolTypes:", v6);

  objc_msgSend(v7, "updateServerToken");
  return v7;
}

+ (id)combineConfigurations:(id)a3
{
  return 0;
}

+ (id)supportedOS
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[4];
  _QWORD v21[6];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v20[0] = &unk_251629028;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624510);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624528);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v20[1] = &unk_251629070;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624540);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624558);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v4;
  v20[2] = &unk_251629040;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624570);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251624588);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v7;
  v20[3] = &unk_251629088;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516245A0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516245B8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelAccountExchangeDeclaration allowedPayloadKeys](RMModelAccountExchangeDeclaration, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  v14 = 0;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("VisibleName"), CFSTR("payloadVisibleName"), 0, 0, a5))
  {
    if (-[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v8, CFSTR("EnabledProtocolTypes"), CFSTR("payloadEnabledProtocolTypes"), &__block_literal_global_112, 1, 0, a5))
    {
      v14 = 0;
      if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("UserIdentityAssetReference"), CFSTR("payloadUserIdentityAssetReference"), 0, 0, a5))
      {
        v14 = 0;
        if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("HostName"), CFSTR("payloadHostName"), 0, 0, a5))
        {
          v14 = 0;
          if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Port"), CFSTR("payloadPort"), 0, 0, a5))
          {
            v14 = 0;
            if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Path"), CFSTR("payloadPath"), 0, 0, a5))
            {
              v14 = 0;
              if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("ExternalHostName"), CFSTR("payloadExternalHostName"), 0, 0, a5))
              {
                v14 = 0;
                if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("ExternalPort"), CFSTR("payloadExternalPort"), 0, 0, a5))
                {
                  v14 = 0;
                  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("External Path"), CFSTR("payloadExternalPath"), 0, 0, a5))
                  {
                    LOWORD(v16) = a4;
                    v14 = 0;
                    if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("OAuth"), CFSTR("payloadOAuth"), objc_opt_class(), 0, 0, v16, a5))
                    {
                      v14 = 0;
                      if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("AuthenticationCredentialsAssetReference"), CFSTR("payloadAuthenticationCredentialsAssetReference"), 0, 0, a5))
                      {
                        v14 = 0;
                        if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("AuthenticationIdentityAssetReference"), CFSTR("payloadAuthenticationIdentityAssetReference"), 0, 0, a5))
                        {
                          LOWORD(v17) = a4;
                          v14 = 0;
                          if (-[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("SMIME"), CFSTR("payloadSMIME"), objc_opt_class(), 0, 0, v17, a5))
                          {
                            v14 = 0;
                            if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("MailServiceActive"), CFSTR("payloadMailServiceActive"), 0, MEMORY[0x24BDBD1C8], a5))
                            {
                              v14 = 0;
                              if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("LockMailService"), CFSTR("payloadLockMailService"), 0, MEMORY[0x24BDBD1C0], a5))
                              {
                                v14 = 0;
                                if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("ContactsServiceActive"), CFSTR("payloadContactsServiceActive"), 0, MEMORY[0x24BDBD1C8], a5))
                                {
                                  v14 = 0;
                                  if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("LockContactsService"), CFSTR("payloadLockContactsService"), 0, MEMORY[0x24BDBD1C0], a5))
                                  {
                                    v14 = 0;
                                    if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("CalendarServiceActive"), CFSTR("payloadCalendarServiceActive"), 0, MEMORY[0x24BDBD1C8], a5))
                                    {
                                      v14 = 0;
                                      if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("LockCalendarService"), CFSTR("payloadLockCalendarService"), 0, MEMORY[0x24BDBD1C0], a5))
                                      {
                                        v14 = 0;
                                        if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("RemindersServiceActive"), CFSTR("payloadRemindersServiceActive"), 0, MEMORY[0x24BDBD1C8], a5))
                                        {
                                          v14 = 0;
                                          if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("LockRemindersService"), CFSTR("payloadLockRemindersService"), 0, MEMORY[0x24BDBD1C0], a5))
                                          {
                                            v14 = 0;
                                            if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("NotesServiceActive"), CFSTR("payloadNotesServiceActive"), 0, MEMORY[0x24BDBD1C8], a5))
                                            {
                                              v14 = -[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("LockNotesService"), CFSTR("payloadLockNotesService"), 0, MEMORY[0x24BDBD1C0], a5);
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

uint64_t __87__RMModelAccountExchangeDeclaration_loadPayloadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
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
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[4];
  signed __int16 v35;
  _QWORD v36[4];
  signed __int16 v37;

  v5 = (void *)objc_opt_new();
  -[RMModelAccountExchangeDeclaration payloadVisibleName](self, "payloadVisibleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("VisibleName"), v6, 0, 0);

  -[RMModelAccountExchangeDeclaration payloadEnabledProtocolTypes](self, "payloadEnabledProtocolTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("EnabledProtocolTypes"), v7, &__block_literal_global_160, 1, 0);

  -[RMModelAccountExchangeDeclaration payloadUserIdentityAssetReference](self, "payloadUserIdentityAssetReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("UserIdentityAssetReference"), v8, 0, 0);

  -[RMModelAccountExchangeDeclaration payloadHostName](self, "payloadHostName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("HostName"), v9, 0, 0);

  -[RMModelAccountExchangeDeclaration payloadPort](self, "payloadPort");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Port"), v10, 0, 0);

  -[RMModelAccountExchangeDeclaration payloadPath](self, "payloadPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Path"), v11, 0, 0);

  -[RMModelAccountExchangeDeclaration payloadExternalHostName](self, "payloadExternalHostName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("ExternalHostName"), v12, 0, 0);

  -[RMModelAccountExchangeDeclaration payloadExternalPort](self, "payloadExternalPort");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("ExternalPort"), v13, 0, 0);

  -[RMModelAccountExchangeDeclaration payloadExternalPath](self, "payloadExternalPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("External Path"), v14, 0, 0);

  -[RMModelAccountExchangeDeclaration payloadOAuth](self, "payloadOAuth");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __62__RMModelAccountExchangeDeclaration_serializePayloadWithType___block_invoke_2;
  v36[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v37 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("OAuth"), v15, v36, 0, 0);

  -[RMModelAccountExchangeDeclaration payloadAuthenticationCredentialsAssetReference](self, "payloadAuthenticationCredentialsAssetReference");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("AuthenticationCredentialsAssetReference"), v17, 0, 0);

  -[RMModelAccountExchangeDeclaration payloadAuthenticationIdentityAssetReference](self, "payloadAuthenticationIdentityAssetReference");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("AuthenticationIdentityAssetReference"), v18, 0, 0);

  -[RMModelAccountExchangeDeclaration payloadSMIME](self, "payloadSMIME");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v16;
  v34[1] = 3221225472;
  v34[2] = __62__RMModelAccountExchangeDeclaration_serializePayloadWithType___block_invoke_3;
  v34[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v35 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("SMIME"), v19, v34, 0, 0);

  -[RMModelAccountExchangeDeclaration payloadMailServiceActive](self, "payloadMailServiceActive");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x24BDBD1C8];
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("MailServiceActive"), v20, 0, MEMORY[0x24BDBD1C8]);

  -[RMModelAccountExchangeDeclaration payloadLockMailService](self, "payloadLockMailService");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x24BDBD1C0];
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("LockMailService"), v22, 0, MEMORY[0x24BDBD1C0]);

  -[RMModelAccountExchangeDeclaration payloadContactsServiceActive](self, "payloadContactsServiceActive");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("ContactsServiceActive"), v24, 0, v21);

  -[RMModelAccountExchangeDeclaration payloadLockContactsService](self, "payloadLockContactsService");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("LockContactsService"), v25, 0, v23);

  -[RMModelAccountExchangeDeclaration payloadCalendarServiceActive](self, "payloadCalendarServiceActive");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("CalendarServiceActive"), v26, 0, v21);

  -[RMModelAccountExchangeDeclaration payloadLockCalendarService](self, "payloadLockCalendarService");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("LockCalendarService"), v27, 0, v23);

  -[RMModelAccountExchangeDeclaration payloadRemindersServiceActive](self, "payloadRemindersServiceActive");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("RemindersServiceActive"), v28, 0, v21);

  -[RMModelAccountExchangeDeclaration payloadLockRemindersService](self, "payloadLockRemindersService");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("LockRemindersService"), v29, 0, v23);

  -[RMModelAccountExchangeDeclaration payloadNotesServiceActive](self, "payloadNotesServiceActive");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("NotesServiceActive"), v30, 0, v21);

  -[RMModelAccountExchangeDeclaration payloadLockNotesService](self, "payloadLockNotesService");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("LockNotesService"), v31, 0, v23);

  v32 = (void *)objc_msgSend(v5, "copy");
  return v32;
}

id __62__RMModelAccountExchangeDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __62__RMModelAccountExchangeDeclaration_serializePayloadWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __62__RMModelAccountExchangeDeclaration_serializePayloadWithType___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)RMModelAccountExchangeDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v52, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_payloadVisibleName, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSArray copy](self->_payloadEnabledProtocolTypes, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSString copy](self->_payloadUserIdentityAssetReference, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  v11 = -[NSString copy](self->_payloadHostName, "copy");
  v12 = (void *)v4[9];
  v4[9] = v11;

  v13 = -[NSNumber copy](self->_payloadPort, "copy");
  v14 = (void *)v4[10];
  v4[10] = v13;

  v15 = -[NSString copy](self->_payloadPath, "copy");
  v16 = (void *)v4[11];
  v4[11] = v15;

  v17 = -[NSString copy](self->_payloadExternalHostName, "copy");
  v18 = (void *)v4[12];
  v4[12] = v17;

  v19 = -[NSNumber copy](self->_payloadExternalPort, "copy");
  v20 = (void *)v4[13];
  v4[13] = v19;

  v21 = -[NSString copy](self->_payloadExternalPath, "copy");
  v22 = (void *)v4[14];
  v4[14] = v21;

  v23 = -[RMModelAccountExchangeDeclaration_OAuth copy](self->_payloadOAuth, "copy");
  v24 = (void *)v4[15];
  v4[15] = v23;

  v25 = -[NSString copy](self->_payloadAuthenticationCredentialsAssetReference, "copy");
  v26 = (void *)v4[16];
  v4[16] = v25;

  v27 = -[NSString copy](self->_payloadAuthenticationIdentityAssetReference, "copy");
  v28 = (void *)v4[17];
  v4[17] = v27;

  v29 = -[RMModelAccountExchangeDeclaration_SMIME copy](self->_payloadSMIME, "copy");
  v30 = (void *)v4[18];
  v4[18] = v29;

  v31 = -[NSNumber copy](self->_payloadMailServiceActive, "copy");
  v32 = (void *)v4[19];
  v4[19] = v31;

  v33 = -[NSNumber copy](self->_payloadLockMailService, "copy");
  v34 = (void *)v4[20];
  v4[20] = v33;

  v35 = -[NSNumber copy](self->_payloadContactsServiceActive, "copy");
  v36 = (void *)v4[21];
  v4[21] = v35;

  v37 = -[NSNumber copy](self->_payloadLockContactsService, "copy");
  v38 = (void *)v4[22];
  v4[22] = v37;

  v39 = -[NSNumber copy](self->_payloadCalendarServiceActive, "copy");
  v40 = (void *)v4[23];
  v4[23] = v39;

  v41 = -[NSNumber copy](self->_payloadLockCalendarService, "copy");
  v42 = (void *)v4[24];
  v4[24] = v41;

  v43 = -[NSNumber copy](self->_payloadRemindersServiceActive, "copy");
  v44 = (void *)v4[25];
  v4[25] = v43;

  v45 = -[NSNumber copy](self->_payloadLockRemindersService, "copy");
  v46 = (void *)v4[26];
  v4[26] = v45;

  v47 = -[NSNumber copy](self->_payloadNotesServiceActive, "copy");
  v48 = (void *)v4[27];
  v4[27] = v47;

  v49 = -[NSNumber copy](self->_payloadLockNotesService, "copy");
  v50 = (void *)v4[28];
  v4[28] = v49;

  return v4;
}

- (NSString)payloadVisibleName
{
  return self->_payloadVisibleName;
}

- (void)setPayloadVisibleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)payloadEnabledProtocolTypes
{
  return self->_payloadEnabledProtocolTypes;
}

- (void)setPayloadEnabledProtocolTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)payloadUserIdentityAssetReference
{
  return self->_payloadUserIdentityAssetReference;
}

- (void)setPayloadUserIdentityAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)payloadHostName
{
  return self->_payloadHostName;
}

- (void)setPayloadHostName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadPort
{
  return self->_payloadPort;
}

- (void)setPayloadPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)payloadPath
{
  return self->_payloadPath;
}

- (void)setPayloadPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)payloadExternalHostName
{
  return self->_payloadExternalHostName;
}

- (void)setPayloadExternalHostName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadExternalPort
{
  return self->_payloadExternalPort;
}

- (void)setPayloadExternalPort:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadExternalPath
{
  return self->_payloadExternalPath;
}

- (void)setPayloadExternalPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (RMModelAccountExchangeDeclaration_OAuth)payloadOAuth
{
  return self->_payloadOAuth;
}

- (void)setPayloadOAuth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)payloadAuthenticationCredentialsAssetReference
{
  return self->_payloadAuthenticationCredentialsAssetReference;
}

- (void)setPayloadAuthenticationCredentialsAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)payloadAuthenticationIdentityAssetReference
{
  return self->_payloadAuthenticationIdentityAssetReference;
}

- (void)setPayloadAuthenticationIdentityAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (RMModelAccountExchangeDeclaration_SMIME)payloadSMIME
{
  return self->_payloadSMIME;
}

- (void)setPayloadSMIME:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)payloadMailServiceActive
{
  return self->_payloadMailServiceActive;
}

- (void)setPayloadMailServiceActive:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)payloadLockMailService
{
  return self->_payloadLockMailService;
}

- (void)setPayloadLockMailService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)payloadContactsServiceActive
{
  return self->_payloadContactsServiceActive;
}

- (void)setPayloadContactsServiceActive:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)payloadLockContactsService
{
  return self->_payloadLockContactsService;
}

- (void)setPayloadLockContactsService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)payloadCalendarServiceActive
{
  return self->_payloadCalendarServiceActive;
}

- (void)setPayloadCalendarServiceActive:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)payloadLockCalendarService
{
  return self->_payloadLockCalendarService;
}

- (void)setPayloadLockCalendarService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)payloadRemindersServiceActive
{
  return self->_payloadRemindersServiceActive;
}

- (void)setPayloadRemindersServiceActive:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSNumber)payloadLockRemindersService
{
  return self->_payloadLockRemindersService;
}

- (void)setPayloadLockRemindersService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSNumber)payloadNotesServiceActive
{
  return self->_payloadNotesServiceActive;
}

- (void)setPayloadNotesServiceActive:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSNumber)payloadLockNotesService
{
  return self->_payloadLockNotesService;
}

- (void)setPayloadLockNotesService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadLockNotesService, 0);
  objc_storeStrong((id *)&self->_payloadNotesServiceActive, 0);
  objc_storeStrong((id *)&self->_payloadLockRemindersService, 0);
  objc_storeStrong((id *)&self->_payloadRemindersServiceActive, 0);
  objc_storeStrong((id *)&self->_payloadLockCalendarService, 0);
  objc_storeStrong((id *)&self->_payloadCalendarServiceActive, 0);
  objc_storeStrong((id *)&self->_payloadLockContactsService, 0);
  objc_storeStrong((id *)&self->_payloadContactsServiceActive, 0);
  objc_storeStrong((id *)&self->_payloadLockMailService, 0);
  objc_storeStrong((id *)&self->_payloadMailServiceActive, 0);
  objc_storeStrong((id *)&self->_payloadSMIME, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationIdentityAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadAuthenticationCredentialsAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadOAuth, 0);
  objc_storeStrong((id *)&self->_payloadExternalPath, 0);
  objc_storeStrong((id *)&self->_payloadExternalPort, 0);
  objc_storeStrong((id *)&self->_payloadExternalHostName, 0);
  objc_storeStrong((id *)&self->_payloadPath, 0);
  objc_storeStrong((id *)&self->_payloadPort, 0);
  objc_storeStrong((id *)&self->_payloadHostName, 0);
  objc_storeStrong((id *)&self->_payloadUserIdentityAssetReference, 0);
  objc_storeStrong((id *)&self->_payloadEnabledProtocolTypes, 0);
  objc_storeStrong((id *)&self->_payloadVisibleName, 0);
}

uint64_t __61__RMModelAccountExchangeDeclaration_SMIME_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

uint64_t __61__RMModelAccountExchangeDeclaration_SMIME_serializeWithType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

@end
