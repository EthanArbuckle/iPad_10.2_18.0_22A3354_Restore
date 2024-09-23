@implementation SESConfigDCK

- (SESConfigDCK)init
{
  SESConfigDCK *v2;
  uint64_t v3;
  NSString *mgDeviceClass;
  uint64_t v5;
  NSString *mgProductVersion;
  NSString *v7;
  int v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSString *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  const char *v16;
  SESConfigDCK *v17;
  SESConfig *v18;
  double v19;
  uint64_t v20;
  SESConfig *config;
  NSString *vehicleBrand;
  NSData *vehicleUUID;
  NSDictionary *settings;
  id v26;
  objc_super v27;
  uint8_t buf[4];
  NSString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)SESConfigDCK;
  v2 = -[SESConfigDCK init](&v27, sel_init);
  if (!v2)
    goto LABEL_17;
  v3 = MGGetStringAnswer();
  mgDeviceClass = v2->_mgDeviceClass;
  v2->_mgDeviceClass = (NSString *)v3;

  if (!v2->_mgDeviceClass)
  {
    SESDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v16 = "Failed to read DeviceClass from device";
LABEL_13:
    _os_log_impl(&dword_24B9C8000, v10, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_14;
  }
  v5 = MGGetStringAnswer();
  mgProductVersion = v2->_mgProductVersion;
  v2->_mgProductVersion = (NSString *)v5;

  v7 = v2->_mgProductVersion;
  if (!v7)
  {
    SESDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v16 = "Failed to read ProductVersion from device";
    goto LABEL_13;
  }
  v26 = 0;
  +[SESConfigUtilities getVersion:error:](SESConfigUtilities, "getVersion:error:", v7, &v26);
  v9 = v8;
  v10 = v26;
  if (!v10)
  {
    v18 = [SESConfig alloc];
    LODWORD(v19) = v9;
    v20 = -[SESConfig initWithDeviceClass:productVersion:](v18, "initWithDeviceClass:productVersion:", v2->_mgDeviceClass, v19);
    config = v2->_config;
    v2->_config = (SESConfig *)v20;

    if (!v2->_config)
    {
      SESDefaultLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      *(_WORD *)buf = 0;
      v13 = "Failed to initialize SESConfig";
      v14 = v11;
      v15 = 2;
      goto LABEL_7;
    }
    vehicleBrand = v2->_vehicleBrand;
    v2->_vehicleBrand = 0;

    vehicleUUID = v2->_vehicleUUID;
    v2->_vehicleUUID = 0;

    settings = v2->_settings;
    v2->_settings = 0;

LABEL_17:
    v17 = v2;
    goto LABEL_18;
  }
  SESDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = v2->_mgProductVersion;
    *(_DWORD *)buf = 138412290;
    v29 = v12;
    v13 = "Invalid ProductVersion value %@";
    v14 = v11;
    v15 = 12;
LABEL_7:
    _os_log_impl(&dword_24B9C8000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
  }
LABEL_8:

LABEL_14:
  v17 = 0;
LABEL_18:

  return v17;
}

- (id)initAtPath:(id)a3 deviceClass:(id)a4 productVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  SESConfigDCK *v11;
  SESConfigDCK *v12;
  int v13;
  int v14;
  id v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  SESConfigDCK *v20;
  SESConfig *v21;
  double v22;
  uint64_t v23;
  SESConfig *config;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[SESConfigDCK init](self, "init");
  v12 = v11;
  if (!v11)
    goto LABEL_8;
  objc_storeStrong((id *)&v11->_mgDeviceClass, a4);
  objc_storeStrong((id *)&v12->_mgProductVersion, a5);
  v26 = 0;
  +[SESConfigUtilities getVersion:error:](SESConfigUtilities, "getVersion:error:", v10, &v26);
  v14 = v13;
  v15 = v26;
  if (!v15)
  {
    v21 = [SESConfig alloc];
    LODWORD(v22) = v14;
    v23 = -[SESConfig initWithDeviceClass:productVersion:path:](v21, "initWithDeviceClass:productVersion:path:", v9, v8, v22);
    config = v12->_config;
    v12->_config = (SESConfig *)v23;

    if (!v12->_config)
    {
      SESDefaultLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_6;
      *(_WORD *)buf = 0;
      v17 = "Failed to initialize SESConfig";
      v18 = v16;
      v19 = 2;
      goto LABEL_5;
    }
LABEL_8:
    v20 = v12;
    goto LABEL_9;
  }
  SESDefaultLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v10;
    v17 = "Invalid ProductVersion value %@";
    v18 = v16;
    v19 = 12;
LABEL_5:
    _os_log_impl(&dword_24B9C8000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
  }
LABEL_6:

  v20 = 0;
LABEL_9:

  return v20;
}

- (id)getSettingForKey:(id)a3 error:(id *)a4
{
  SESConfig *config;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v12;

  config = self->_config;
  v12 = 0;
  v6 = a3;
  -[SESConfig getContentsOfAssetFile:component:error:](config, "getContentsOfAssetFile:component:error:", CFSTR("_settings"), 1, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  v9 = v8;
  if (a4)
    *a4 = objc_retainAutorelease(v8);
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isDCKConfigurationAvailableFor:(id)a3 error:(id *)a4
{
  SESConfig *config;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  id v15;

  config = self->_config;
  v15 = 0;
  -[SESConfig getConfigForManufacturer:component:error:](config, "getConfigForManufacturer:component:error:", a3, 1, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  v8 = v7;
  if (a4 && v7)
  {
    SESDefaultLogObject();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError(v8, v9, SESErrorDomain, 0, CFSTR("Failed to retrieve configuration"), v10, v11, v12, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6 != 0;
}

- (id)getExternalCACertificateFor:(id)a3 environment:(id)a4 prodSE:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v7 = a5;
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = a4;
  v12 = a3;
  objc_msgSend(v10, "numberWithBool:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SESConfigDCK getCertificate:manufacturer:environment:region:prodSE:keyID:error:](self, "getCertificate:manufacturer:environment:region:prodSE:keyID:error:", CFSTR("ExternalCA"), v12, v11, 0, v13, 0, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)getEncryptionCertificateFor:(id)a3 environment:(id)a4 region:(id)a5 error:(id *)a6
{
  return -[SESConfigDCK getCertificate:manufacturer:environment:region:prodSE:keyID:error:](self, "getCertificate:manufacturer:environment:region:prodSE:keyID:error:", CFSTR("Encryption"), a3, a4, a5, 0, 0, a6);
}

- (id)getSignatureCertificateFor:(id)a3 environment:(id)a4 region:(id)a5 error:(id *)a6
{
  return -[SESConfigDCK getCertificate:manufacturer:environment:region:prodSE:keyID:error:](self, "getCertificate:manufacturer:environment:region:prodSE:keyID:error:", CFSTR("Signature"), a3, a4, a5, 0, 0, a6);
}

- (id)getRootCertificateFor:(id)a3 keyID:(id)a4 error:(id *)a5
{
  return -[SESConfigDCK getCertificate:manufacturer:environment:region:prodSE:keyID:error:](self, "getCertificate:manufacturer:environment:region:prodSE:keyID:error:", CFSTR("Root"), a3, 0, 0, 0, a4, a5);
}

- (id)getCertificate:(id)a3 manufacturer:(id)a4 environment:(id)a5 region:(id)a6 prodSE:(id)a7 keyID:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SESConfig *config;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id obj;
  uint64_t v67;
  uint64_t v68;
  __CFString *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  config = self->_config;
  v74 = 0;
  -[SESConfig getConfigForManufacturer:component:error:](config, "getConfigForManufacturer:component:error:", a4, 1, &v74);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v74;
  if (v22)
  {
    v23 = v22;
    if (a9)
    {
      SESDefaultLogObject();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError(v23, v24, SESErrorDomain, 0, CFSTR("Failed to retrieve configuration"), v25, v26, v27, v59);
      *a9 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_4:
    v28 = 0;
    goto LABEL_5;
  }
  +[SESConfigUtilities validateKey:expectedClass:dictionary:](SESConfigUtilities, "validateKey:expectedClass:dictionary:", CFSTR("Certificates"), objc_opt_class(), v21);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v23 = v30;
    if (a9)
    {
      v23 = objc_retainAutorelease(v30);
      v28 = 0;
      *a9 = v23;
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Certificates"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[SESConfigUtilities validateKey:expectedClass:dictionary:](SESConfigUtilities, "validateKey:expectedClass:dictionary:", v15, objc_opt_class(), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v23 = v32;
    if (a9)
    {
      v23 = objc_retainAutorelease(v32);
      v28 = 0;
      *a9 = v23;
    }
    else
    {
      v28 = 0;
    }
    goto LABEL_51;
  }
  v63 = v31;
  objc_msgSend(v31, "objectForKeyedSubscript:", v15);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_opt_new();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v33;
  v64 = v34;
  v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
  if (!v67)
    goto LABEL_33;
  v68 = *(_QWORD *)v71;
  v62 = v15;
  v65 = v19;
  while (2)
  {
    for (i = 0; i != v67; ++i)
    {
      if (*(_QWORD *)v71 != v68)
        objc_enumerationMutation(obj);
      v36 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a9)
        {
          SESDefaultLogObject();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          SESCreateAndLogError(0, v49, SESErrorDomain, 0, CFSTR("Wrong class for certificate"), v50, v51, v52, v59);
          *a9 = (id)objc_claimAutoreleasedReturnValue();

        }
        v23 = 0;
        goto LABEL_43;
      }
      if (!v16)
        goto LABEL_55;
      +[SESConfigUtilities validateKey:expectedClass:dictionary:](SESConfigUtilities, "validateKey:expectedClass:dictionary:", CFSTR("Environment"), objc_opt_class(), v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
        goto LABEL_38;
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("Environment"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v16, "isEqualToString:", v38);

      if (v39)
      {
LABEL_55:
        if (!v17)
          goto LABEL_24;
        +[SESConfigUtilities validateKey:expectedClass:dictionary:](SESConfigUtilities, "validateKey:expectedClass:dictionary:", CFSTR("Region"), objc_opt_class(), v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
          goto LABEL_38;
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("Region"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v17, "isEqualToString:", v40);

        if (v41)
        {
LABEL_24:
          if (!v18)
            goto LABEL_27;
          +[SESConfigUtilities validateKey:expectedClass:dictionary:](SESConfigUtilities, "validateKey:expectedClass:dictionary:", CFSTR("ProdSE"), objc_opt_class(), v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
            goto LABEL_38;
          v42 = objc_msgSend(v18, "BOOLValue");
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("ProdSE"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "BOOLValue");

          if (v42 == v44)
          {
LABEL_27:
            if (!v65)
            {
LABEL_30:
              objc_msgSend(v64, "addObject:", v36);
              continue;
            }
            +[SESConfigUtilities validateKey:expectedClass:dictionary:](SESConfigUtilities, "validateKey:expectedClass:dictionary:", CFSTR("KeyID"), objc_opt_class(), v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v37)
            {
              objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("KeyID"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v65, "isEqualToData:", v45);

              if (!v46)
                continue;
              goto LABEL_30;
            }
LABEL_38:
            v23 = v37;
            if (a9)
            {
              v23 = objc_retainAutorelease(v37);
              v28 = 0;
              *a9 = v23;
LABEL_44:
              v19 = v65;
              v47 = obj;
              v15 = v62;
              goto LABEL_49;
            }
LABEL_43:
            v28 = 0;
            goto LABEL_44;
          }
        }
      }
    }
    v15 = v62;
    v34 = v64;
    v19 = v65;
    v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    if (v67)
      continue;
    break;
  }
LABEL_33:

  if (objc_msgSend(v34, "count") == 1)
  {
    objc_msgSend(v34, "firstObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[SESConfigUtilities validateKey:expectedClass:dictionary:](SESConfigUtilities, "validateKey:expectedClass:dictionary:", CFSTR("Certificate"), objc_opt_class(), v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v48;
    if (v48)
    {
      if (a9)
      {
        v23 = objc_retainAutorelease(v48);
        v28 = 0;
        *a9 = v23;
        goto LABEL_49;
      }
LABEL_47:
      v28 = 0;
    }
    else
    {
      objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("Certificate"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_49:

  }
  else
  {
    if (a9)
    {
      SESDefaultLogObject();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = SESErrorDomain;
      v53 = v19;
      v54 = v15;
      v55 = objc_msgSend(v34, "count");
      objc_msgSend(v53, "base64");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v55;
      v15 = v54;
      v19 = v53;
      SESCreateAndLogError(0, v47, v69, 0, CFSTR("%lu matches for type %@ environment %@ region %@ prodSE %@ keyID %@"), v56, v57, v58, v60);
      *a9 = (id)objc_claimAutoreleasedReturnValue();

      v23 = 0;
      goto LABEL_47;
    }
    v23 = 0;
    v28 = 0;
  }
  v31 = v63;

LABEL_51:
LABEL_5:

  return v28;
}

- (id)BOOLValueForSetting:(unint64_t)a3 manufacturer:(id)a4 brand:(id)a5 uuid:(id)a6 error:(id *)a7
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;

  v19 = 0;
  -[SESConfigDCK getSettingsFor:brand:uuid:error:](self, "getSettingsFor:brand:uuid:error:", a4, a5, a6, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  if (!v10)
  {
    if (a3 >= 8)
    {
      if (a7)
      {
        SESDefaultLogObject();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError(0, v14, SESErrorDomain, 1, CFSTR("Invalid BOOL setting input %lu"), v15, v16, v17, a3);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      v11 = 0;
    }
    else
    {
      v13 = off_251CC6298[a3];
      +[SESConfigUtilities validateKey:expectedClass:dictionary:](SESConfigUtilities, "validateKey:expectedClass:dictionary:", v13, objc_opt_class(), v9);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      if (a7)
        goto LABEL_3;
    }
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v11 = v10;
  if (!a7)
    goto LABEL_11;
LABEL_3:
  v11 = objc_retainAutorelease(v11);
  v12 = 0;
  *a7 = v11;
LABEL_12:

  return v12;
}

- (id)intValueForSetting:(unint64_t)a3 manufacturer:(id)a4 brand:(id)a5 uuid:(id)a6 error:(id *)a7
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;

  v24 = 0;
  -[SESConfigDCK getSettingsFor:brand:uuid:error:](self, "getSettingsFor:brand:uuid:error:", a4, a5, a6, &v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;
  if (v11)
  {
    v12 = v11;
    if (a7)
      goto LABEL_3;
LABEL_25:
    v13 = 0;
    goto LABEL_26;
  }
  if (!a3)
  {
    v14 = CFSTR("KeyRoleOnUpgrade");
    goto LABEL_18;
  }
  if (a3 == 2)
  {
    if ((objc_msgSend(CFSTR("iPhone"), "isEqualToString:", self->_mgDeviceClass) & 1) != 0)
    {
      v14 = CFSTR("RSSIFurtherPhone");
      goto LABEL_18;
    }
    if ((objc_msgSend(CFSTR("Watch"), "isEqualToString:", self->_mgDeviceClass) & 1) != 0)
    {
      v14 = CFSTR("RSSIFurtherWatch");
      goto LABEL_18;
    }
    goto LABEL_22;
  }
  if (a3 != 1)
  {
    if (a7)
    {
      SESDefaultLogObject();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError(0, v15, SESErrorDomain, 1, CFSTR("Invalid int setting input %lu"), v16, v17, v18, a3);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_24;
  }
  if ((objc_msgSend(CFSTR("iPhone"), "isEqualToString:", self->_mgDeviceClass) & 1) != 0)
  {
    v14 = CFSTR("RSSICloserPhone");
    goto LABEL_18;
  }
  if ((objc_msgSend(CFSTR("Watch"), "isEqualToString:", self->_mgDeviceClass) & 1) == 0)
  {
LABEL_22:
    if (a7)
    {
      SESDefaultLogObject();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError(0, v19, SESErrorDomain, 1, CFSTR("Invalid DeviceClass %@"), v20, v21, v22, (uint64_t)self->_mgDeviceClass);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_24:
    v12 = 0;
    goto LABEL_25;
  }
  v14 = CFSTR("RSSICloserWatch");
LABEL_18:
  +[SESConfigUtilities validateKey:expectedClass:dictionary:](SESConfigUtilities, "validateKey:expectedClass:dictionary:", v14, objc_opt_class(), v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  if (!a7)
    goto LABEL_25;
LABEL_3:
  v12 = objc_retainAutorelease(v12);
  v13 = 0;
  *a7 = v12;
LABEL_26:

  return v13;
}

- (id)arrayValueForSetting:(unint64_t)a3 manufacturer:(id)a4 brand:(id)a5 uuid:(id)a6 error:(id *)a7
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;

  v18 = 0;
  -[SESConfigDCK getSettingsFor:brand:uuid:error:](self, "getSettingsFor:brand:uuid:error:", a4, a5, a6, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;
  if (!v10)
  {
    if (a3)
    {
      if (a7)
      {
        SESDefaultLogObject();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError(0, v13, SESErrorDomain, 1, CFSTR("Invalid array setting input %lu"), v14, v15, v16, a3);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      v11 = 0;
    }
    else
    {
      +[SESConfigUtilities validateKey:expectedClass:dictionary:](SESConfigUtilities, "validateKey:expectedClass:dictionary:", CFSTR("RKEDisabledFunctions"), objc_opt_class(), v9);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RKEDisabledFunctions"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      if (a7)
        goto LABEL_3;
    }
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  v11 = v10;
  if (!a7)
    goto LABEL_8;
LABEL_3:
  v11 = objc_retainAutorelease(v11);
  v12 = 0;
  *a7 = v11;
LABEL_9:

  return v12;
}

- (id)dictValueForSetting:(unint64_t)a3 manufacturer:(id)a4 brand:(id)a5 uuid:(id)a6 error:(id *)a7
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;

  v18 = 0;
  -[SESConfigDCK getSettingsFor:brand:uuid:error:](self, "getSettingsFor:brand:uuid:error:", a4, a5, a6, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;
  if (!v10)
  {
    if (a3)
    {
      if (a7)
      {
        SESDefaultLogObject();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError(0, v13, SESErrorDomain, 1, CFSTR("Invalid dict setting input %lu"), v14, v15, v16, a3);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      v11 = 0;
    }
    else
    {
      +[SESConfigUtilities validateKey:expectedClass:dictionary:](SESConfigUtilities, "validateKey:expectedClass:dictionary:", CFSTR("RKETimeout"), objc_opt_class(), v9);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RKETimeout"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      if (a7)
        goto LABEL_3;
    }
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  v11 = v10;
  if (!a7)
    goto LABEL_8;
LABEL_3:
  v11 = objc_retainAutorelease(v11);
  v12 = 0;
  *a7 = v11;
LABEL_9:

  return v12;
}

- (id)getSettingsFor:(id)a3 brand:(id)a4 uuid:(id)a5 error:(id *)a6
{
  id v10;
  unint64_t v11;
  unint64_t v12;
  NSString *vehicleBrand;
  int v14;
  NSData *vehicleUUID;
  int v16;
  id *v17;
  void *v18;
  int v19;
  SESConfig *config;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  NSDictionary *v30;
  NSString *mgDeviceClass;
  NSString *mgProductVersion;
  id v33;
  id obj;
  id obja;
  id v37;
  id v38;
  id v39;

  v10 = a3;
  v11 = (unint64_t)a4;
  v12 = (unint64_t)a5;
  vehicleBrand = self->_vehicleBrand;
  v14 = (v11 | (unint64_t)vehicleBrand) == 0;
  obj = a4;
  if (v11 && vehicleBrand)
    v14 = objc_msgSend((id)v11, "isEqualToString:", a4);
  vehicleUUID = self->_vehicleUUID;
  v16 = (v12 | (unint64_t)vehicleUUID) == 0;
  v37 = a5;
  v17 = a6;
  if (v12 && vehicleUUID)
    v16 = objc_msgSend((id)v12, "isEqualToData:");
  -[SESConfig cachedFileName](self->_config, "cachedFileName", obj);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", v10) & v14;

  if (v19 != 1 || v16 == 0)
  {
    config = self->_config;
    v39 = 0;
    -[SESConfig getConfigForManufacturer:component:error:](config, "getConfigForManufacturer:component:error:", v10, 1, &v39);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v39;
    if (v23)
    {
      v24 = v23;
      if (!v17)
      {
        v30 = 0;
LABEL_23:

        goto LABEL_24;
      }
      SESDefaultLogObject();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError(v24, v25, SESErrorDomain, 0, CFSTR("Failed to retrieve configuration"), v26, v27, v28, (uint64_t)obja);
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      mgDeviceClass = self->_mgDeviceClass;
      mgProductVersion = self->_mgProductVersion;
      v38 = 0;
      +[SESConfigDCK getResolvedSettingsFrom:brand:uuid:deviceClass:productVersion:error:](SESConfigDCK, "getResolvedSettingsFrom:brand:uuid:deviceClass:productVersion:error:", v22, v11, v12, mgDeviceClass, mgProductVersion, &v38);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v38;
      v24 = v33;
      if (!v33)
      {
        objc_storeStrong((id *)&self->_vehicleBrand, obja);
        objc_storeStrong((id *)&self->_vehicleUUID, v37);
        objc_storeStrong((id *)&self->_settings, v25);
        v30 = self->_settings;
        goto LABEL_22;
      }
      if (!v17)
      {
        v30 = 0;
        goto LABEL_22;
      }
      v29 = objc_retainAutorelease(v33);
      v24 = v29;
    }
    v30 = 0;
    *v17 = v29;
LABEL_22:

    goto LABEL_23;
  }
  v30 = self->_settings;
LABEL_24:

  return v30;
}

+ (id)getResolvedSettingsFrom:(id)a3 brand:(id)a4 uuid:(id)a5 deviceClass:(id)a6 productVersion:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  unint64_t v32;
  void *v33;
  _BOOL4 v34;
  id v35;
  id *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v48;
  id obj;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  _QWORD v57[4];
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  SESDefaultLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Manufacturer"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "base64");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v66 = v18;
    v67 = 2112;
    v68 = v13;
    v69 = 2112;
    v70 = v19;
    v71 = 2112;
    v72 = v15;
    v73 = 2112;
    v74 = v16;
    _os_log_impl(&dword_24B9C8000, v17, OS_LOG_TYPE_INFO, "Resolving settings for manufacturer %@ brand %@ uuid %@ device class %@ product version %@", buf, 0x34u);

  }
  v20 = 0x24BDBC000uLL;
  +[SESConfigUtilities validateKey:expectedClass:dictionary:](SESConfigUtilities, "validateKey:expectedClass:dictionary:", CFSTR("DefaultSettings"), objc_opt_class(), v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = v21;
    if (a8)
    {
      v22 = objc_retainAutorelease(v21);
      v23 = 0;
      *a8 = v22;
    }
    else
    {
      v23 = 0;
    }
    goto LABEL_45;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("DefaultSettings"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "mutableCopy");

  SESDefaultLogObject();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v66 = v25;
    _os_log_impl(&dword_24B9C8000, v26, OS_LOG_TYPE_INFO, "Default settings %@", buf, 0xCu);
  }
  v52 = v25;

  +[SESConfigUtilities validateKey:expectedClass:dictionary:](SESConfigUtilities, "validateKey:expectedClass:dictionary:", CFSTR("Configurations"), objc_opt_class(), v12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v27;
  if (v27)
  {
    v23 = 0;
    if (a8)
      *a8 = objc_retainAutorelease(v27);
    goto LABEL_44;
  }
  v54 = v15;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Configurations"));
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (!v50)
  {
LABEL_40:
    v37 = obj;

    SESDefaultLogObject();
    v46 = objc_claimAutoreleasedReturnValue();
    v15 = v54;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v66 = v25;
      _os_log_impl(&dword_24B9C8000, v46, OS_LOG_TYPE_INFO, "Resolved settings %@", buf, 0xCu);
    }

    v23 = v25;
    goto LABEL_43;
  }
  v51 = *(_QWORD *)v61;
  v55 = v16;
  v53 = v13;
LABEL_14:
  v28 = 0;
  while (1)
  {
    if (*(_QWORD *)v61 != v51)
      objc_enumerationMutation(obj);
    v29 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v28);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = v53;
      v15 = v54;
      v36 = a8;
      v37 = obj;
      if (!a8)
      {
LABEL_36:

        v23 = 0;
        goto LABEL_43;
      }
      SESDefaultLogObject();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError(0, v38, SESErrorDomain, 0, CFSTR("Wrong class for configuration"), v39, v40, v41, v48);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    +[SESConfigUtilities validateKey:expectedClass:dictionary:](SESConfigUtilities, "validateKey:expectedClass:dictionary:", CFSTR("Conditions"), objc_opt_class(), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v38 = v30;
      v36 = a8;
      if (!a8)
      {
        v13 = v53;
        v15 = v54;
        v37 = obj;
        goto LABEL_35;
      }
      v42 = objc_retainAutorelease(v30);
      v13 = v53;
      v15 = v54;
      v37 = obj;
LABEL_29:
      *v36 = v42;
LABEL_35:

      v16 = v55;
      goto LABEL_36;
    }
    v31 = v12;
    v32 = v20;
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Conditions"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    v34 = +[SESConfigDCK isConfigurationApplicable:brand:uuid:deviceClass:productVersion:error:](SESConfigDCK, "isConfigurationApplicable:brand:uuid:deviceClass:productVersion:error:", v33, v53, v14, v54, v55, &v59);
    v35 = v59;
    if (v35)
      goto LABEL_31;
    if (v34)
      break;

    ++v28;
    v16 = v55;
    v20 = v32;
    v12 = v31;
    if (v50 == v28)
    {
      v13 = v53;
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      if (v50)
        goto LABEL_14;
      goto LABEL_40;
    }
  }
  +[SESConfigUtilities validateKey:expectedClass:dictionary:](SESConfigUtilities, "validateKey:expectedClass:dictionary:", CFSTR("Settings"), objc_opt_class(), v29);
  v35 = (id)objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Settings"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    SESDefaultLogObject();
    v45 = objc_claimAutoreleasedReturnValue();
    v12 = v31;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v66 = v44;
      _os_log_impl(&dword_24B9C8000, v45, OS_LOG_TYPE_INFO, "Configuration overrides %@", buf, 0xCu);
    }

    v57[0] = MEMORY[0x24BDAC760];
    v57[1] = 3221225472;
    v57[2] = __84__SESConfigDCK_getResolvedSettingsFrom_brand_uuid_deviceClass_productVersion_error___block_invoke;
    v57[3] = &unk_251CC6278;
    v58 = v25;
    objc_msgSend(v44, "enumerateKeysAndObjectsUsingBlock:", v57);

    v13 = v53;
    v16 = v55;
    goto LABEL_40;
  }
LABEL_31:
  v43 = v35;
  v37 = obj;
  v12 = v31;
  if (a8)
  {
    v43 = objc_retainAutorelease(v35);
    *a8 = v43;
  }

  v23 = 0;
  v13 = v53;
  v15 = v54;
  v16 = v55;
LABEL_43:

LABEL_44:
LABEL_45:

  return v23;
}

void __84__SESConfigDCK_getResolvedSettingsFrom_brand_uuid_deviceClass_productVersion_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = (void *)objc_msgSend(v7, "mutableCopy");
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __84__SESConfigDCK_getResolvedSettingsFrom_brand_uuid_deviceClass_productVersion_error___block_invoke_2;
      v12[3] = &unk_251CC6278;
      v13 = v9;
      v10 = v9;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v11);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v11);
  }

}

uint64_t __84__SESConfigDCK_getResolvedSettingsFrom_brand_uuid_deviceClass_productVersion_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

+ (BOOL)isConfigurationApplicable:(id)a3 brand:(id)a4 uuid:(id)a5 deviceClass:(id)a6 productVersion:(id)a7 error:(id *)a8
{
  id v13;
  unint64_t v14;
  const __CFString *v15;
  uint64_t i;
  void *v17;
  void *v18;
  unint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  id v25;
  id *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  id *v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v41 = a4;
  v40 = a5;
  v39 = a6;
  v38 = a7;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v13;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v36)
  {
    LOBYTE(v26) = 1;
    goto LABEL_25;
  }
  v34 = a8;
  v14 = 0x251CC5000uLL;
  v37 = *(_QWORD *)v43;
  v15 = CFSTR("Key");
  while (2)
  {
    for (i = 0; i != v36; ++i)
    {
      if (*(_QWORD *)v43 != v37)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v26 = v34;
        if (!v34)
          goto LABEL_25;
        SESDefaultLogObject();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError(0, v27, SESErrorDomain, 0, CFSTR("Wrong class for condition"), v29, v30, v31, v33);
        v28 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      objc_msgSend(*(id *)(v14 + 3104), "validateKey:expectedClass:dictionary:", v15, objc_opt_class(), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18
        || (objc_msgSend(*(id *)(v14 + 3104), "validateKey:expectedClass:dictionary:", CFSTR("Operator"), objc_opt_class(), v17), (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v27 = v18;
        v26 = v34;
        if (!v34)
        {
LABEL_23:

LABEL_24:
          LOBYTE(v26) = 0;
          goto LABEL_25;
        }
        v28 = objc_retainAutorelease(v18);
        v27 = v28;
LABEL_19:
        *v26 = v28;
        goto LABEL_23;
      }
      v19 = v14;
      v20 = v15;
      objc_msgSend(v17, "objectForKeyedSubscript:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Operator"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Value"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (uint64_t)v38;
      v24 = +[SESConfigDCK evaluateCondition:operator:value:brand:uuid:deviceClass:productVersion:error:](SESConfigDCK, "evaluateCondition:operator:value:brand:uuid:deviceClass:productVersion:error:", v21, v22, v23, v41, v40, v39);
      v25 = 0;
      if (v25)
      {
        v27 = v25;
        if (v34)
          *v34 = objc_retainAutorelease(v25);

        goto LABEL_23;
      }

      if (!v24)
        goto LABEL_24;
      v14 = v19;
      v15 = v20;
    }
    LOBYTE(v26) = 1;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v36)
      continue;
    break;
  }
LABEL_25:

  return (char)v26;
}

+ (BOOL)evaluateCondition:(id)a3 operator:(id)a4 value:(id)a5 brand:(id)a6 uuid:(id)a7 deviceClass:(id)a8 productVersion:(id)a9 error:(id *)a10
{
  char v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v15 = (char)a10;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  if (!objc_msgSend(v16, "isEqualToString:", CFSTR("DeviceClass")))
  {
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("DeviceProductVersion")))
    {
      if ((objc_msgSend(&unk_251CC8C20, "containsObject:", v17) & 1) != 0)
      {
        v23 = v17;
        v24 = v22;
        goto LABEL_13;
      }
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("VehicleBrand")))
    {
      if ((objc_msgSend(&unk_251CC8C38, "containsObject:", v17) & 1) != 0)
      {
        v23 = v17;
        v24 = v19;
        goto LABEL_13;
      }
    }
    else
    {
      if (!objc_msgSend(v16, "isEqualToString:", CFSTR("VehicleUUID")))
      {
        if (!a10)
          goto LABEL_17;
        SESDefaultLogObject();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError(0, v25, SESErrorDomain, 1, CFSTR("Invalid key for condition %@"), v30, v31, v32, (uint64_t)v16);
        goto LABEL_16;
      }
      if ((objc_msgSend(&unk_251CC8C50, "containsObject:", v17) & 1) != 0)
      {
        v23 = v17;
        v24 = v20;
        goto LABEL_13;
      }
    }
LABEL_14:
    if (!a10)
      goto LABEL_17;
    SESDefaultLogObject();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError(0, v25, SESErrorDomain, 1, CFSTR("Invalid operator %@ for key %@"), v26, v27, v28, (uint64_t)v17);
LABEL_16:
    *a10 = (id)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    goto LABEL_17;
  }
  if ((objc_msgSend(&unk_251CC8C08, "containsObject:", v17) & 1) == 0)
    goto LABEL_14;
  v23 = v17;
  v24 = v21;
LABEL_13:
  v15 = +[SESConfigDCK evaluateOperator:valueFromDevice:valueFromConfig:error:](SESConfigDCK, "evaluateOperator:valueFromDevice:valueFromConfig:error:", v23, v24, v18, a10);
LABEL_17:

  return v15;
}

+ (BOOL)evaluateOperator:(id)a3 valueFromDevice:(id)a4 valueFromConfig:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  char v12;
  BOOL v13;
  char v14;
  float v15;
  float v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v23;
  float v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("Eq")))
  {
    v12 = objc_msgSend(v11, "isEqual:", v10);
LABEL_3:
    v13 = v12;
    goto LABEL_22;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("In")))
  {
    if (!v10)
    {
LABEL_21:
      v13 = 0;
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_msgSend(v11, "containsObject:", v10);
      goto LABEL_3;
    }
LABEL_19:
    if (a6)
    {
      SESDefaultLogObject();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError(0, v18, SESErrorDomain, 0, CFSTR("Invalid value %@"), v19, v20, v21, (uint64_t)v11);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_21;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("Present")))
  {
    v13 = v10 != 0;
    goto LABEL_22;
  }
  v14 = objc_msgSend(v9, "isEqualToString:", CFSTR("Absent"));
  if (v10)
    v13 = 0;
  else
    v13 = v14;
  if ((v14 & 1) == 0 && v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_19;
    v31 = 0;
    +[SESConfigUtilities getVersion:error:](SESConfigUtilities, "getVersion:error:", v10, &v31);
    v16 = v15;
    v17 = v31;
    if (v17)
    {
      if (a6)
      {
LABEL_18:
        v17 = objc_retainAutorelease(v17);
        v13 = 0;
        *a6 = v17;
LABEL_26:

        goto LABEL_22;
      }
    }
    else
    {
      v30 = 0;
      +[SESConfigUtilities getVersion:error:](SESConfigUtilities, "getVersion:error:", v11, &v30);
      v24 = v23;
      v17 = v30;
      if (!v17)
      {
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("GT")))
        {
          v17 = 0;
          v13 = v16 > v24;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("GE")))
        {
          v17 = 0;
          v13 = v16 >= v24;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("LT")))
        {
          v17 = 0;
          v13 = v16 < v24;
        }
        else if (objc_msgSend(v9, "isEqualToString:", CFSTR("LE")))
        {
          v17 = 0;
          v13 = v16 <= v24;
        }
        else
        {
          if (a6)
          {
            SESDefaultLogObject();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            SESCreateAndLogError(0, v25, SESErrorDomain, 0, CFSTR("Invalid condition"), v26, v27, v28, v29);
            *a6 = (id)objc_claimAutoreleasedReturnValue();

          }
          v13 = 0;
          v17 = 0;
        }
        goto LABEL_26;
      }
      if (a6)
        goto LABEL_18;
    }
    v13 = 0;
    goto LABEL_26;
  }
LABEL_22:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleUUID, 0);
  objc_storeStrong((id *)&self->_vehicleBrand, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_mgProductVersion, 0);
  objc_storeStrong((id *)&self->_mgDeviceClass, 0);
}

@end
