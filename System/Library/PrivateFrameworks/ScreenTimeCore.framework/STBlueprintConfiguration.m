@implementation STBlueprintConfiguration

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintConfiguration setIdentifier:](self, "setIdentifier:", v5);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintConfiguration setType:](self, "setType:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("payloadPlist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[STBlueprintConfiguration setPayloadPlist:](self, "setPayloadPlist:", v7);
  return 1;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[STBlueprintConfiguration identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("identifier"));

  -[STBlueprintConfiguration type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("type"));

  -[STBlueprintConfiguration payloadPlist](self, "payloadPlist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("payloadPlist"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

+ (id)fetchOrCreateWithDictionaryRepresentation:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  STBlueprintConfiguration *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  objc_msgSend(v11, "execute:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "firstObject");
    v15 = (STBlueprintConfiguration *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v15 = -[STBlueprintConfiguration initWithContext:]([STBlueprintConfiguration alloc], "initWithContext:", v9);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[STBlueprintConfiguration setIdentifier:](v15, "setIdentifier:", v16);

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)fetchRequestMatchingBlueprintsForUserWithDSID:(id)a3 ofType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = &unk_1E938D9A0;
  if (v7)
    v9 = v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN %K AND %K == %@ AND %K == NO"), v9, CFSTR("blueprint.users.dsid"), CFSTR("blueprint.type"), v6, CFSTR("blueprint.isTombstoned"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPredicate:", v10);
  return v8;
}

+ (id)fetchRequestMatchingBlueprintsConfigurationForBlueprint:(id)a3 ofType:(id)a4 includeTombstones:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ AND %K == %@"), CFSTR("type"), v8, CFSTR("blueprint"), v9, v13);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ AND %K == %@ AND %K == NO"), CFSTR("type"), v8, CFSTR("blueprint"), v9, CFSTR("blueprint.isTombstoned"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPredicate:", v11);
  return v10;
}

+ (id)cemConfigurationIdentifierWithType:(id)a3 forUser:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "localUserDeviceState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "familySettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isManaged");

  v10 = (void *)objc_msgSend(CFSTR("digital_health_restrictions"), "mutableCopy");
  if (!v7 && v9)
  {
    objc_msgSend(v6, "dsid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR(".%@"), v11);

  }
  objc_msgSend(v10, "appendFormat:", CFSTR(".%@"), v5);

  return v10;
}

+ (Class)cemDeclarationClassForConfigurationType:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("legacy.restrictions.apps")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("system.camera")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("system.siri")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("system.airdrop")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("system.carplay")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("media.settings")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("application.store")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("system.ratings")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("system.music")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("system.webcontentfilter.basic")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("system.gamecenter")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("passcode.settings")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("account.settings")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("network.cellular.settings")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("system.donotdisturb")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("system.tvprovider")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("application.settings")))
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

+ (id)blueprintConfigurationTypeForDeclaration:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = CFSTR("legacy.restrictions.apps");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = CFSTR("system.camera");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = CFSTR("system.siri");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = CFSTR("system.airdrop");
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v4 = CFSTR("system.carplay");
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v4 = CFSTR("media.settings");
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v4 = CFSTR("application.store");
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v4 = CFSTR("system.ratings");
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v4 = CFSTR("system.music");
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v4 = CFSTR("system.webcontentfilter.basic");
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v4 = CFSTR("system.gamecenter");
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v4 = CFSTR("passcode.settings");
                        }
                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            v4 = CFSTR("account.settings");
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v4 = CFSTR("network.cellular.settings");
                            }
                            else
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v4 = CFSTR("system.donotdisturb");
                              }
                              else
                              {
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v4 = CFSTR("system.tvprovider");
                                }
                                else
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v4 = CFSTR("application.settings");
                                  }
                                  else
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                      v4 = CFSTR("system.icloud");
                                    else
                                      v4 = 0;
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

  return (id)v4;
}

+ (id)blueprintConfigurationTypeForDeclarationType:(id)a3
{
  id v3;
  void *v4;
  char v5;
  __CFString **v6;
  void *v7;
  char v8;
  __CFString *v9;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  void *v43;
  char v44;
  void *v45;
  int v46;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D134B8], "registeredIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = STBlueprintTypeAlwaysAllowedApps;
LABEL_5:
    v9 = *v6;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0D134C0], "registeredIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "isEqualToString:", v7);

  if ((v8 & 1) != 0)
  {
    v6 = STBlueprintTypeDowntime;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0D13498], "registeredIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "isEqualToString:", v11);

  if ((v12 & 1) != 0)
  {
    v9 = CFSTR("legacy.restrictions.apps");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13550], "registeredIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v3, "isEqualToString:", v13);

    if ((v14 & 1) != 0)
    {
      v9 = CFSTR("system.camera");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D13588], "registeredIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v3, "isEqualToString:", v15);

      if ((v16 & 1) != 0)
      {
        v9 = CFSTR("system.siri");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D13538], "registeredIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v3, "isEqualToString:", v17);

        if ((v18 & 1) != 0)
        {
          v9 = CFSTR("system.airdrop");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D13558], "registeredIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v3, "isEqualToString:", v19);

          if ((v20 & 1) != 0)
          {
            v9 = CFSTR("system.carplay");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D134A0], "registeredIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v3, "isEqualToString:", v21);

            if ((v22 & 1) != 0)
            {
              v9 = CFSTR("media.settings");
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0D13480], "registeredIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v3, "isEqualToString:", v23);

              if ((v24 & 1) != 0)
              {
                v9 = CFSTR("application.store");
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0D13580], "registeredIdentifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v3, "isEqualToString:", v25);

                if ((v26 & 1) != 0)
                {
                  v9 = CFSTR("system.ratings");
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0D13578], "registeredIdentifier");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = objc_msgSend(v3, "isEqualToString:", v27);

                  if ((v28 & 1) != 0)
                  {
                    v9 = CFSTR("system.music");
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0D13540], "registeredIdentifier");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v30 = objc_msgSend(v3, "isEqualToString:", v29);

                    if ((v30 & 1) != 0)
                    {
                      v9 = CFSTR("system.webcontentfilter.basic");
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0D13570], "registeredIdentifier");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      v32 = objc_msgSend(v3, "isEqualToString:", v31);

                      if ((v32 & 1) != 0)
                      {
                        v9 = CFSTR("system.gamecenter");
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0D134B0], "registeredIdentifier");
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        v34 = objc_msgSend(v3, "isEqualToString:", v33);

                        if ((v34 & 1) != 0)
                        {
                          v9 = CFSTR("passcode.settings");
                        }
                        else
                        {
                          objc_msgSend(MEMORY[0x1E0D13468], "registeredIdentifier");
                          v35 = (void *)objc_claimAutoreleasedReturnValue();
                          v36 = objc_msgSend(v3, "isEqualToString:", v35);

                          if ((v36 & 1) != 0)
                          {
                            v9 = CFSTR("account.settings");
                          }
                          else
                          {
                            objc_msgSend(MEMORY[0x1E0D134A8], "registeredIdentifier");
                            v37 = (void *)objc_claimAutoreleasedReturnValue();
                            v38 = objc_msgSend(v3, "isEqualToString:", v37);

                            if ((v38 & 1) != 0)
                            {
                              v9 = CFSTR("network.cellular.settings");
                            }
                            else
                            {
                              objc_msgSend(MEMORY[0x1E0D13568], "registeredIdentifier");
                              v39 = (void *)objc_claimAutoreleasedReturnValue();
                              v40 = objc_msgSend(v3, "isEqualToString:", v39);

                              if ((v40 & 1) != 0)
                              {
                                v9 = CFSTR("system.donotdisturb");
                              }
                              else
                              {
                                objc_msgSend(MEMORY[0x1E0D13590], "registeredIdentifier");
                                v41 = (void *)objc_claimAutoreleasedReturnValue();
                                v42 = objc_msgSend(v3, "isEqualToString:", v41);

                                if ((v42 & 1) != 0)
                                {
                                  v9 = CFSTR("system.tvprovider");
                                }
                                else
                                {
                                  objc_msgSend(MEMORY[0x1E0D13478], "registeredIdentifier");
                                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                                  v44 = objc_msgSend(v3, "isEqualToString:", v43);

                                  if ((v44 & 1) != 0)
                                  {
                                    v9 = CFSTR("application.settings");
                                  }
                                  else
                                  {
                                    objc_msgSend(MEMORY[0x1E0D135A0], "registeredIdentifier");
                                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                                    v46 = objc_msgSend(v3, "isEqualToString:", v45);

                                    if (v46)
                                      v9 = CFSTR("system.icloud");
                                    else
                                      v9 = 0;
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
LABEL_6:

  return v9;
}

- (id)cemConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;

  -[STBlueprintConfiguration payloadPlist](self, "payloadPlist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[STBlueprintConfiguration type](self, "type");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0D13488];
      -[STBlueprintConfiguration payloadPlist](self, "payloadPlist");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      objc_msgSend(v5, "declarationForData:error:", v6, &v10);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10;

      if (!v3)
      {
        +[STLog blueprint](STLog, "blueprint");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[STBlueprintConfiguration cemConfiguration].cold.1(self);

      }
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)setCemConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;

  v4 = a3;
  v8 = 0;
  objc_msgSend(v4, "serializeAsDataWithError:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v5)
  {
    -[STBlueprintConfiguration setPayloadPlist:](self, "setPayloadPlist:", v5);
  }
  else
  {
    +[STLog blueprint](STLog, "blueprint");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[STBlueprintConfiguration setCemConfiguration:].cold.1(v4);

  }
}

- (void)cemConfiguration
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "type");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1D22E7000, v2, v3, "Error creating configuration for type %{public}@: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

- (void)setCemConfiguration:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "declarationType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1D22E7000, v2, v3, "Error serializing configuration %{public}@: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

@end
