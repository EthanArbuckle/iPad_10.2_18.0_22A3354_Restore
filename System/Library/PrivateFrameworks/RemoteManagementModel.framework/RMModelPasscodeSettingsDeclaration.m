@implementation RMModelPasscodeSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.passcode.settings");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[14];

  v6[13] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("RequirePasscode");
  v6[1] = CFSTR("RequireAlphanumericPasscode");
  v6[2] = CFSTR("RequireComplexPasscode");
  v6[3] = CFSTR("MinimumLength");
  v6[4] = CFSTR("MinimumComplexCharacters");
  v6[5] = CFSTR("MaximumFailedAttempts");
  v6[6] = CFSTR("FailedAttemptsResetInMinutes");
  v6[7] = CFSTR("MaximumGracePeriodInMinutes");
  v6[8] = CFSTR("MaximumInactivityInMinutes");
  v6[9] = CFSTR("MaximumPasscodeAgeInDays");
  v6[10] = CFSTR("PasscodeReuseLimit");
  v6[11] = CFSTR("ChangeAtNextAuth");
  v6[12] = CFSTR("CustomRegex");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)assetTypes
{
  return (id)objc_opt_new();
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 requirePasscode:(id)a4 requireAlphanumericPasscode:(id)a5 requireComplexPasscode:(id)a6 minimumLength:(id)a7 minimumComplexCharacters:(id)a8 maximumFailedAttempts:(id)a9 failedAttemptsResetInMinutes:(id)a10 maximumGracePeriodInMinutes:(id)a11 maximumInactivityInMinutes:(id)a12 maximumPasscodeAgeInDays:(id)a13 passcodeReuseLimit:(id)a14 changeAtNextAuth:(id)a15 customRegex:(id)a16
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;

  v17 = a3;
  v46 = a16;
  v45 = a15;
  v44 = a14;
  v43 = a13;
  v42 = a12;
  v18 = a11;
  v41 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setDeclarationType:", CFSTR("com.apple.configuration.passcode.settings"));
  if (v17)
  {
    objc_msgSend(v25, "setDeclarationIdentifier:", v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDeclarationIdentifier:", v27);

    v17 = 0;
  }
  v28 = (void *)MEMORY[0x24BDBD1C0];
  if (v24)
    v29 = v24;
  else
    v29 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v25, "setPayloadRequirePasscode:", v29);

  if (v23)
    v30 = v23;
  else
    v30 = v28;
  objc_msgSend(v25, "setPayloadRequireAlphanumericPasscode:", v30);

  if (v22)
    v31 = v22;
  else
    v31 = v28;
  objc_msgSend(v25, "setPayloadRequireComplexPasscode:", v31);

  if (v21)
    v32 = v21;
  else
    v32 = &unk_251629D90;
  objc_msgSend(v25, "setPayloadMinimumLength:", v32);

  if (v20)
    v33 = v20;
  else
    v33 = &unk_251629D90;
  objc_msgSend(v25, "setPayloadMinimumComplexCharacters:", v33);

  if (v19)
    v34 = v19;
  else
    v34 = &unk_251629DA8;
  objc_msgSend(v25, "setPayloadMaximumFailedAttempts:", v34);

  objc_msgSend(v25, "setPayloadFailedAttemptsResetInMinutes:", v41);
  objc_msgSend(v25, "setPayloadMaximumGracePeriodInMinutes:", v18);

  objc_msgSend(v25, "setPayloadMaximumInactivityInMinutes:", v42);
  objc_msgSend(v25, "setPayloadMaximumPasscodeAgeInDays:", v43);

  objc_msgSend(v25, "setPayloadPasscodeReuseLimit:", v44);
  if (v45)
    v35 = v45;
  else
    v35 = v28;
  objc_msgSend(v25, "setPayloadChangeAtNextAuth:", v35);

  objc_msgSend(v25, "setPayloadCustomRegex:", v46);
  objc_msgSend(v25, "updateServerToken");

  return v25;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.passcode.settings"));
  if (v3)
  {
    objc_msgSend(v4, "setDeclarationIdentifier:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeclarationIdentifier:", v6);

  }
  objc_msgSend(v4, "updateServerToken");

  return v4;
}

+ (id)combineConfigurations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "combineWithOther:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
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
  v20[0] = &unk_251629DC0;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626148);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626160);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v20[1] = &unk_251629DD8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626178);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251626190);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v4;
  v20[2] = &unk_251629E20;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516261A8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516261C0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v7;
  v20[3] = &unk_251629E38;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516261D8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2516261F0);
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

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelPasscodeSettingsDeclaration allowedPayloadKeys](RMModelPasscodeSettingsDeclaration, "allowedPayloadKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  v14 = 0;
  if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("RequirePasscode"), CFSTR("payloadRequirePasscode"), 0, MEMORY[0x24BDBD1C0], a5))
  {
    v14 = 0;
    if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("RequireAlphanumericPasscode"), CFSTR("payloadRequireAlphanumericPasscode"), 0, MEMORY[0x24BDBD1C0], a5))
    {
      v14 = 0;
      if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("RequireComplexPasscode"), CFSTR("payloadRequireComplexPasscode"), 0, MEMORY[0x24BDBD1C0], a5))
      {
        v14 = 0;
        if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("MinimumLength"), CFSTR("payloadMinimumLength"), 0, &unk_251629D90, a5))
        {
          v14 = 0;
          if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("MinimumComplexCharacters"), CFSTR("payloadMinimumComplexCharacters"), 0, &unk_251629D90, a5))
          {
            v14 = 0;
            if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("MaximumFailedAttempts"), CFSTR("payloadMaximumFailedAttempts"), 0, &unk_251629DA8, a5))
            {
              v14 = 0;
              if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("FailedAttemptsResetInMinutes"), CFSTR("payloadFailedAttemptsResetInMinutes"), 0, 0, a5))
              {
                v14 = 0;
                if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("MaximumGracePeriodInMinutes"), CFSTR("payloadMaximumGracePeriodInMinutes"), 0, 0, a5))
                {
                  v14 = 0;
                  if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("MaximumInactivityInMinutes"), CFSTR("payloadMaximumInactivityInMinutes"), 0, 0, a5))
                  {
                    v14 = 0;
                    if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("MaximumPasscodeAgeInDays"), CFSTR("payloadMaximumPasscodeAgeInDays"), 0, 0, a5))
                    {
                      v14 = 0;
                      if (-[RMModelPayloadBase loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("PasscodeReuseLimit"), CFSTR("payloadPasscodeReuseLimit"), 0, 0, a5))
                      {
                        v14 = 0;
                        if (-[RMModelPayloadBase loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("ChangeAtNextAuth"), CFSTR("payloadChangeAtNextAuth"), 0, MEMORY[0x24BDBD1C0], a5))
                        {
                          LOWORD(v16) = a4;
                          v14 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("CustomRegex"), CFSTR("payloadCustomRegex"), objc_opt_class(), 0, 0, v16, a5);
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

  return v14;
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
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
  _QWORD v22[4];
  signed __int16 v23;

  v5 = (void *)objc_opt_new();
  -[RMModelPasscodeSettingsDeclaration payloadRequirePasscode](self, "payloadRequirePasscode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDBD1C0];
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("RequirePasscode"), v6, 0, MEMORY[0x24BDBD1C0]);

  -[RMModelPasscodeSettingsDeclaration payloadRequireAlphanumericPasscode](self, "payloadRequireAlphanumericPasscode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("RequireAlphanumericPasscode"), v8, 0, v7);

  -[RMModelPasscodeSettingsDeclaration payloadRequireComplexPasscode](self, "payloadRequireComplexPasscode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("RequireComplexPasscode"), v9, 0, v7);

  -[RMModelPasscodeSettingsDeclaration payloadMinimumLength](self, "payloadMinimumLength");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("MinimumLength"), v10, 0, &unk_251629D90);

  -[RMModelPasscodeSettingsDeclaration payloadMinimumComplexCharacters](self, "payloadMinimumComplexCharacters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("MinimumComplexCharacters"), v11, 0, &unk_251629D90);

  -[RMModelPasscodeSettingsDeclaration payloadMaximumFailedAttempts](self, "payloadMaximumFailedAttempts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("MaximumFailedAttempts"), v12, 0, &unk_251629DA8);

  -[RMModelPasscodeSettingsDeclaration payloadFailedAttemptsResetInMinutes](self, "payloadFailedAttemptsResetInMinutes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("FailedAttemptsResetInMinutes"), v13, 0, 0);

  -[RMModelPasscodeSettingsDeclaration payloadMaximumGracePeriodInMinutes](self, "payloadMaximumGracePeriodInMinutes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("MaximumGracePeriodInMinutes"), v14, 0, 0);

  -[RMModelPasscodeSettingsDeclaration payloadMaximumInactivityInMinutes](self, "payloadMaximumInactivityInMinutes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("MaximumInactivityInMinutes"), v15, 0, 0);

  -[RMModelPasscodeSettingsDeclaration payloadMaximumPasscodeAgeInDays](self, "payloadMaximumPasscodeAgeInDays");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("MaximumPasscodeAgeInDays"), v16, 0, 0);

  -[RMModelPasscodeSettingsDeclaration payloadPasscodeReuseLimit](self, "payloadPasscodeReuseLimit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("PasscodeReuseLimit"), v17, 0, 0);

  -[RMModelPasscodeSettingsDeclaration payloadChangeAtNextAuth](self, "payloadChangeAtNextAuth");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("ChangeAtNextAuth"), v18, 0, v7);

  -[RMModelPasscodeSettingsDeclaration payloadCustomRegex](self, "payloadCustomRegex");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __63__RMModelPasscodeSettingsDeclaration_serializePayloadWithType___block_invoke;
  v22[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v23 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("CustomRegex"), v19, v22, 0, 0);

  v20 = (void *)objc_msgSend(v5, "copy");
  return v20;
}

uint64_t __63__RMModelPasscodeSettingsDeclaration_serializePayloadWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

- (void)combineWithOther:(id)a3
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;

  v4 = a3;
  -[RMModelPasscodeSettingsDeclaration payloadRequirePasscode](self, "payloadRequirePasscode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadRequirePasscode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineBooleanOr:other:](RMModelConfigurationBase, "combineBooleanOr:other:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPasscodeSettingsDeclaration setPayloadRequirePasscode:](self, "setPayloadRequirePasscode:", v7);

  -[RMModelPasscodeSettingsDeclaration payloadRequireAlphanumericPasscode](self, "payloadRequireAlphanumericPasscode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadRequireAlphanumericPasscode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineBooleanOr:other:](RMModelConfigurationBase, "combineBooleanOr:other:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPasscodeSettingsDeclaration setPayloadRequireAlphanumericPasscode:](self, "setPayloadRequireAlphanumericPasscode:", v10);

  -[RMModelPasscodeSettingsDeclaration payloadRequireComplexPasscode](self, "payloadRequireComplexPasscode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadRequireComplexPasscode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineBooleanOr:other:](RMModelConfigurationBase, "combineBooleanOr:other:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPasscodeSettingsDeclaration setPayloadRequireComplexPasscode:](self, "setPayloadRequireComplexPasscode:", v13);

  -[RMModelPasscodeSettingsDeclaration payloadMinimumLength](self, "payloadMinimumLength");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadMinimumLength");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineNumberMax:other:](RMModelConfigurationBase, "combineNumberMax:other:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPasscodeSettingsDeclaration setPayloadMinimumLength:](self, "setPayloadMinimumLength:", v16);

  -[RMModelPasscodeSettingsDeclaration payloadMinimumComplexCharacters](self, "payloadMinimumComplexCharacters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadMinimumComplexCharacters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineNumberMax:other:](RMModelConfigurationBase, "combineNumberMax:other:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPasscodeSettingsDeclaration setPayloadMinimumComplexCharacters:](self, "setPayloadMinimumComplexCharacters:", v19);

  -[RMModelPasscodeSettingsDeclaration payloadMaximumFailedAttempts](self, "payloadMaximumFailedAttempts");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadMaximumFailedAttempts");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineNumberMin:other:](RMModelConfigurationBase, "combineNumberMin:other:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPasscodeSettingsDeclaration setPayloadMaximumFailedAttempts:](self, "setPayloadMaximumFailedAttempts:", v22);

  -[RMModelPasscodeSettingsDeclaration payloadFailedAttemptsResetInMinutes](self, "payloadFailedAttemptsResetInMinutes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadFailedAttemptsResetInMinutes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineNumberMin:other:](RMModelConfigurationBase, "combineNumberMin:other:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPasscodeSettingsDeclaration setPayloadFailedAttemptsResetInMinutes:](self, "setPayloadFailedAttemptsResetInMinutes:", v25);

  -[RMModelPasscodeSettingsDeclaration payloadMaximumGracePeriodInMinutes](self, "payloadMaximumGracePeriodInMinutes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadMaximumGracePeriodInMinutes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineNumberMin:other:](RMModelConfigurationBase, "combineNumberMin:other:", v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPasscodeSettingsDeclaration setPayloadMaximumGracePeriodInMinutes:](self, "setPayloadMaximumGracePeriodInMinutes:", v28);

  -[RMModelPasscodeSettingsDeclaration payloadMaximumInactivityInMinutes](self, "payloadMaximumInactivityInMinutes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadMaximumInactivityInMinutes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineNumberMin:other:](RMModelConfigurationBase, "combineNumberMin:other:", v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPasscodeSettingsDeclaration setPayloadMaximumInactivityInMinutes:](self, "setPayloadMaximumInactivityInMinutes:", v31);

  -[RMModelPasscodeSettingsDeclaration payloadMaximumPasscodeAgeInDays](self, "payloadMaximumPasscodeAgeInDays");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadMaximumPasscodeAgeInDays");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineNumberMin:other:](RMModelConfigurationBase, "combineNumberMin:other:", v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPasscodeSettingsDeclaration setPayloadMaximumPasscodeAgeInDays:](self, "setPayloadMaximumPasscodeAgeInDays:", v34);

  -[RMModelPasscodeSettingsDeclaration payloadPasscodeReuseLimit](self, "payloadPasscodeReuseLimit");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadPasscodeReuseLimit");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineNumberMin:other:](RMModelConfigurationBase, "combineNumberMin:other:", v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPasscodeSettingsDeclaration setPayloadPasscodeReuseLimit:](self, "setPayloadPasscodeReuseLimit:", v37);

  -[RMModelPasscodeSettingsDeclaration payloadChangeAtNextAuth](self, "payloadChangeAtNextAuth");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadChangeAtNextAuth");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMModelConfigurationBase combineBooleanOr:other:](RMModelConfigurationBase, "combineBooleanOr:other:", v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPasscodeSettingsDeclaration setPayloadChangeAtNextAuth:](self, "setPayloadChangeAtNextAuth:", v40);

  -[RMModelPasscodeSettingsDeclaration payloadCustomRegex](self, "payloadCustomRegex");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadCustomRegex");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelConfigurationBase combineDictionary:other:](RMModelConfigurationBase, "combineDictionary:other:", v43, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPasscodeSettingsDeclaration setPayloadCustomRegex:](self, "setPayloadCustomRegex:", v42);

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
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)RMModelPasscodeSettingsDeclaration;
  v4 = -[RMModelDeclarationBase copyWithZone:](&v32, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadRequirePasscode, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSNumber copy](self->_payloadRequireAlphanumericPasscode, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSNumber copy](self->_payloadRequireComplexPasscode, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  v11 = -[NSNumber copy](self->_payloadMinimumLength, "copy");
  v12 = (void *)v4[9];
  v4[9] = v11;

  v13 = -[NSNumber copy](self->_payloadMinimumComplexCharacters, "copy");
  v14 = (void *)v4[10];
  v4[10] = v13;

  v15 = -[NSNumber copy](self->_payloadMaximumFailedAttempts, "copy");
  v16 = (void *)v4[11];
  v4[11] = v15;

  v17 = -[NSNumber copy](self->_payloadFailedAttemptsResetInMinutes, "copy");
  v18 = (void *)v4[12];
  v4[12] = v17;

  v19 = -[NSNumber copy](self->_payloadMaximumGracePeriodInMinutes, "copy");
  v20 = (void *)v4[13];
  v4[13] = v19;

  v21 = -[NSNumber copy](self->_payloadMaximumInactivityInMinutes, "copy");
  v22 = (void *)v4[14];
  v4[14] = v21;

  v23 = -[NSNumber copy](self->_payloadMaximumPasscodeAgeInDays, "copy");
  v24 = (void *)v4[15];
  v4[15] = v23;

  v25 = -[NSNumber copy](self->_payloadPasscodeReuseLimit, "copy");
  v26 = (void *)v4[16];
  v4[16] = v25;

  v27 = -[NSNumber copy](self->_payloadChangeAtNextAuth, "copy");
  v28 = (void *)v4[17];
  v4[17] = v27;

  v29 = -[RMModelPasscodeSettingsDeclaration_CustomRegex copy](self->_payloadCustomRegex, "copy");
  v30 = (void *)v4[18];
  v4[18] = v29;

  return v4;
}

- (NSNumber)payloadRequirePasscode
{
  return self->_payloadRequirePasscode;
}

- (void)setPayloadRequirePasscode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)payloadRequireAlphanumericPasscode
{
  return self->_payloadRequireAlphanumericPasscode;
}

- (void)setPayloadRequireAlphanumericPasscode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)payloadRequireComplexPasscode
{
  return self->_payloadRequireComplexPasscode;
}

- (void)setPayloadRequireComplexPasscode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)payloadMinimumLength
{
  return self->_payloadMinimumLength;
}

- (void)setPayloadMinimumLength:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadMinimumComplexCharacters
{
  return self->_payloadMinimumComplexCharacters;
}

- (void)setPayloadMinimumComplexCharacters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadMaximumFailedAttempts
{
  return self->_payloadMaximumFailedAttempts;
}

- (void)setPayloadMaximumFailedAttempts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadFailedAttemptsResetInMinutes
{
  return self->_payloadFailedAttemptsResetInMinutes;
}

- (void)setPayloadFailedAttemptsResetInMinutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadMaximumGracePeriodInMinutes
{
  return self->_payloadMaximumGracePeriodInMinutes;
}

- (void)setPayloadMaximumGracePeriodInMinutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadMaximumInactivityInMinutes
{
  return self->_payloadMaximumInactivityInMinutes;
}

- (void)setPayloadMaximumInactivityInMinutes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)payloadMaximumPasscodeAgeInDays
{
  return self->_payloadMaximumPasscodeAgeInDays;
}

- (void)setPayloadMaximumPasscodeAgeInDays:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)payloadPasscodeReuseLimit
{
  return self->_payloadPasscodeReuseLimit;
}

- (void)setPayloadPasscodeReuseLimit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)payloadChangeAtNextAuth
{
  return self->_payloadChangeAtNextAuth;
}

- (void)setPayloadChangeAtNextAuth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (RMModelPasscodeSettingsDeclaration_CustomRegex)payloadCustomRegex
{
  return self->_payloadCustomRegex;
}

- (void)setPayloadCustomRegex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCustomRegex, 0);
  objc_storeStrong((id *)&self->_payloadChangeAtNextAuth, 0);
  objc_storeStrong((id *)&self->_payloadPasscodeReuseLimit, 0);
  objc_storeStrong((id *)&self->_payloadMaximumPasscodeAgeInDays, 0);
  objc_storeStrong((id *)&self->_payloadMaximumInactivityInMinutes, 0);
  objc_storeStrong((id *)&self->_payloadMaximumGracePeriodInMinutes, 0);
  objc_storeStrong((id *)&self->_payloadFailedAttemptsResetInMinutes, 0);
  objc_storeStrong((id *)&self->_payloadMaximumFailedAttempts, 0);
  objc_storeStrong((id *)&self->_payloadMinimumComplexCharacters, 0);
  objc_storeStrong((id *)&self->_payloadMinimumLength, 0);
  objc_storeStrong((id *)&self->_payloadRequireComplexPasscode, 0);
  objc_storeStrong((id *)&self->_payloadRequireAlphanumericPasscode, 0);
  objc_storeStrong((id *)&self->_payloadRequirePasscode, 0);
}

uint64_t __68__RMModelPasscodeSettingsDeclaration_CustomRegex_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

@end
