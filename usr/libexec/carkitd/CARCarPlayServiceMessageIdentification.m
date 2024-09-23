@implementation CARCarPlayServiceMessageIdentification

- (CARCarPlayServiceMessageIdentification)initWithDisplayName:(id)a3 modelName:(id)a4 PPID:(id)a5 authenticationSerialNumber:(id)a6 accessoryProtocols:(id)a7 supportsWiredCarPlay:(BOOL)a8 supportsWiredToWirelessPairing:(BOOL)a9 supportsEnhancedIntegration:(BOOL)a10 supportsThemeAssets:(BOOL)a11
{
  id v18;
  id v19;
  id v20;
  CARCarPlayServiceMessageIdentification *v21;
  CARCarPlayServiceMessageIdentification *v22;
  id v24;
  id v25;
  objc_super v26;

  v18 = a3;
  v19 = a4;
  v25 = a5;
  v24 = a6;
  v20 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CARCarPlayServiceMessageIdentification;
  v21 = -[CARCarPlayServiceMessageIdentification init](&v26, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_displayName, a3);
    objc_storeStrong((id *)&v22->_modelName, a4);
    objc_storeStrong((id *)&v22->_PPID, a5);
    objc_storeStrong((id *)&v22->_authenticationSerialNumber, a6);
    objc_storeStrong((id *)&v22->_accessoryProtocols, a7);
    v22->_supportsWiredCarPlay = a8;
    v22->_supportsWiredToWirelessPairing = a9;
    v22->_supportsEnhancedIntegration = a10;
    v22->_supportsThemeAssets = a11;
  }

  return v22;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CARCarPlayServiceMessageIdentification;
  v3 = -[CARCarPlayServiceMessageIdentification description](&v16, "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageIdentification displayName](self, "displayName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageIdentification modelName](self, "modelName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageIdentification PPID](self, "PPID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageIdentification authenticationSerialNumber](self, "authenticationSerialNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageIdentification accessoryProtocols](self, "accessoryProtocols"));
  if (-[CARCarPlayServiceMessageIdentification supportsWiredCarPlay](self, "supportsWiredCarPlay"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[CARCarPlayServiceMessageIdentification supportsWiredToWirelessPairing](self, "supportsWiredToWirelessPairing"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[CARCarPlayServiceMessageIdentification supportsEnhancedIntegration](self, "supportsEnhancedIntegration"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (-[CARCarPlayServiceMessageIdentification supportsThemeAssets](self, "supportsThemeAssets"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {displayName: %@, modelName: %@, PPID: %@, authSerial: %@, protocols: %@, supportsWired: %@, supportsOOBPairing: %@, supportsEnhancedIntegration: %@, supportsThemeAssets: %@}"), v15, v14, v4, v5, v6, v7, v8, v9, v10, v11));

  return (NSString *)v12;
}

+ (unint64_t)identifier
{
  return 1;
}

- (CARCarPlayServiceMessageIdentification)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  CARCarPlayServiceMessageIdentification *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;
  void *v50;
  unsigned __int8 v51;
  void *v52;
  unsigned __int8 v53;
  uint64_t v55;
  id v56;
  id v57;
  unsigned int v58;
  id v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];

  v4 = a3;
  if (v4)
  {
    v5 = objc_opt_class(NSString);
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("displayName")));
    v7 = v6;
    if (v6 && (objc_opt_isKindOfClass(v6, v5) & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    if (v8)
    {
      v9 = objc_opt_class(NSString);
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("modelName")));
      v11 = v10;
      if (v10 && (objc_opt_isKindOfClass(v10, v9) & 1) != 0)
        v12 = v11;
      else
        v12 = 0;

      if (v12)
      {
        v14 = objc_opt_class(NSString);
        v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("PPID")));
        v16 = v15;
        if (v15 && (objc_opt_isKindOfClass(v15, v14) & 1) != 0)
          v17 = v16;
        else
          v17 = 0;

        if (v17)
        {
          v19 = objc_opt_class(NSData);
          v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("authSerial")));
          v21 = v20;
          if (v20 && (objc_opt_isKindOfClass(v20, v19) & 1) != 0)
            v22 = v21;
          else
            v22 = 0;

          if (v22)
          {
            v24 = objc_opt_class(NSArray);
            v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("accessoryProtocols")));
            v26 = v25;
            if (v25 && (objc_opt_isKindOfClass(v25, v24) & 1) != 0)
              v27 = v26;
            else
              v27 = 0;
            v62 = v22;

            if (v27)
            {
              v60 = v17;
              v65 = 0u;
              v66 = 0u;
              v63 = 0u;
              v64 = 0u;
              v29 = v27;
              v30 = -[NSObject countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
              if (v30)
              {
                v31 = v30;
                v32 = *(_QWORD *)v64;
                while (2)
                {
                  for (i = 0; i != v31; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v64 != v32)
                      objc_enumerationMutation(v29);
                    v34 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
                    v35 = objc_opt_class(NSString);
                    if ((objc_opt_isKindOfClass(v34, v35) & 1) == 0)
                    {

                      v13 = 0;
                      v17 = v60;
                      v22 = v62;
                      goto LABEL_68;
                    }
                  }
                  v31 = -[NSObject countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
                  if (v31)
                    continue;
                  break;
                }
              }
              v59 = v8;

              v17 = v60;
            }
            else
            {
              v59 = v8;
              v29 = &__NSArray0__struct;
            }
            v37 = objc_opt_class(NSNumber);
            v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("supportsWired")));
            v39 = v38;
            if (v38 && (objc_opt_isKindOfClass(v38, v37) & 1) != 0)
              v40 = v39;
            else
              v40 = 0;

            v41 = objc_opt_class(NSNumber);
            v42 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("supportsOOBPairing")));
            v43 = v42;
            if (v42 && (objc_opt_isKindOfClass(v42, v41) & 1) != 0)
              v57 = v43;
            else
              v57 = 0;

            v44 = objc_opt_class(NSNumber);
            v45 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("supportsEnhancedIntegration")));
            v46 = v45;
            if (v45 && (objc_opt_isKindOfClass(v45, v44) & 1) != 0)
              v47 = v46;
            else
              v47 = 0;

            v48 = objc_opt_class(NSNumber);
            v49 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("supportsThemeAssets")));
            v50 = v49;
            if (v49 && (objc_opt_isKindOfClass(v49, v48) & 1) != 0)
              v56 = v50;
            else
              v56 = 0;

            v58 = objc_msgSend(v40, "BOOLValue");
            v61 = v40;
            v51 = objc_msgSend(v57, "BOOLValue");
            v52 = v47;
            v53 = objc_msgSend(v47, "BOOLValue");
            BYTE2(v55) = objc_msgSend(v56, "BOOLValue");
            BYTE1(v55) = v53;
            LOBYTE(v55) = v51;
            v22 = v62;
            self = -[CARCarPlayServiceMessageIdentification initWithDisplayName:modelName:PPID:authenticationSerialNumber:accessoryProtocols:supportsWiredCarPlay:supportsWiredToWirelessPairing:supportsEnhancedIntegration:supportsThemeAssets:](self, "initWithDisplayName:modelName:PPID:authenticationSerialNumber:accessoryProtocols:supportsWiredCarPlay:supportsWiredToWirelessPairing:supportsEnhancedIntegration:supportsThemeAssets:", v59, v12, v17, v62, v29, v58, v55);

            v8 = v59;
            v13 = self;
          }
          else
          {
            v36 = sub_100056C84(2uLL);
            v29 = objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              sub_10006BD28();
            v13 = 0;
          }
LABEL_68:

        }
        else
        {
          v28 = sub_100056C84(2uLL);
          v22 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            sub_10006BCBC();
          v13 = 0;
        }

      }
      else
      {
        v23 = sub_100056C84(2uLL);
        v17 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_10006BC50();
        v13 = 0;
      }

    }
    else
    {
      v18 = sub_100056C84(2uLL);
      v12 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10006BBE4();
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageIdentification displayName](self, "displayName"));
  objc_msgSend(v3, "cr_setSafeObject:forKey:", v4, CFSTR("displayName"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageIdentification modelName](self, "modelName"));
  objc_msgSend(v3, "cr_setSafeObject:forKey:", v5, CFSTR("modelName"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageIdentification PPID](self, "PPID"));
  objc_msgSend(v3, "cr_setSafeObject:forKey:", v6, CFSTR("PPID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageIdentification authenticationSerialNumber](self, "authenticationSerialNumber"));
  objc_msgSend(v3, "cr_setSafeObject:forKey:", v7, CFSTR("authSerial"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARCarPlayServiceMessageIdentification accessoryProtocols](self, "accessoryProtocols"));
  objc_msgSend(v3, "cr_setSafeObject:forKey:", v8, CFSTR("accessoryProtocols"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CARCarPlayServiceMessageIdentification supportsWiredCarPlay](self, "supportsWiredCarPlay")));
  objc_msgSend(v3, "cr_setSafeObject:forKey:", v9, CFSTR("supportsWired"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CARCarPlayServiceMessageIdentification supportsWiredToWirelessPairing](self, "supportsWiredToWirelessPairing")));
  objc_msgSend(v3, "cr_setSafeObject:forKey:", v10, CFSTR("supportsOOBPairing"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CARCarPlayServiceMessageIdentification supportsEnhancedIntegration](self, "supportsEnhancedIntegration")));
  objc_msgSend(v3, "cr_setSafeObject:forKey:", v11, CFSTR("supportsEnhancedIntegration"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[CARCarPlayServiceMessageIdentification supportsThemeAssets](self, "supportsThemeAssets")));
  objc_msgSend(v3, "cr_setSafeObject:forKey:", v12, CFSTR("supportsThemeAssets"));

  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSString)PPID
{
  return self->_PPID;
}

- (NSData)authenticationSerialNumber
{
  return self->_authenticationSerialNumber;
}

- (NSArray)accessoryProtocols
{
  return self->_accessoryProtocols;
}

- (BOOL)supportsWiredCarPlay
{
  return self->_supportsWiredCarPlay;
}

- (BOOL)supportsWiredToWirelessPairing
{
  return self->_supportsWiredToWirelessPairing;
}

- (BOOL)supportsEnhancedIntegration
{
  return self->_supportsEnhancedIntegration;
}

- (BOOL)supportsThemeAssets
{
  return self->_supportsThemeAssets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryProtocols, 0);
  objc_storeStrong((id *)&self->_authenticationSerialNumber, 0);
  objc_storeStrong((id *)&self->_PPID, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
