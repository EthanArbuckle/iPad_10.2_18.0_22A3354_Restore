@implementation MCNewWiFiPayloadHandler

- (MCNewWiFiPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  MCNewWiFiPayloadHandler *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t v11[16];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MCNewWiFiPayloadHandler;
  v4 = -[MCNewPayloadHandler initWithPayload:profileHandler:](&v12, "initWithPayload:profileHandler:", a3, a4);
  if (v4)
  {
    v5 = WiFiManagerClientCreate(kCFAllocatorDefault, 0);
    v4->_manager = (__WiFiManagerClient *)v5;
    v6 = _MCLogObjects[0];
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        v7 = "MCNewWiFiPayloadHandler successfully created a WiFiManagerClient.";
        v8 = v6;
        v9 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, v11, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      v7 = "MCNewWiFiPayloadHandler could not create a WiFiManagerClient. This payload handler will not function correctly.";
      v8 = v6;
      v9 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
  }
  return v4;
}

- (void)dealloc
{
  __WiFiManagerClient *manager;
  objc_super v4;

  manager = self->_manager;
  if (manager)
  {
    CFRelease(manager);
    self->_manager = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MCNewWiFiPayloadHandler;
  -[MCNewWiFiPayloadHandler dealloc](&v4, "dealloc");
}

- (id)userInputFields
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userInputFields"));

  return v3;
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __int128 v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v22;
    v11 = kMCIDUUIDKey;
    v12 = kMCIDResponseKey;
    *(_QWORD *)&v8 = 138543362;
    v19 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v11, v19));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v12));
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("UsernameUserInputKey")))
        {
          objc_msgSend(v6, "setUsername:", v16);
        }
        else if (objc_msgSend(v15, "isEqualToString:", CFSTR("PasswordUserInputKey")))
        {
          objc_msgSend(v6, "setPassword:", v16);
        }
        else
        {
          v17 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v19;
            v26 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler didn't ask for user input for key: %{public}@", buf, 0xCu);
          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v9);
  }

  return 1;
}

- (id)profileMetadata
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v3, kMCPayloadUUIDKey));

  return v4;
}

- (BOOL)_isMetadataValid:(__EAPOLClientProfile *)a3
{
  void *v4;
  uint64_t Information;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  BOOL v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  Information = EAPOLClientProfileGetInformation(a3, CFSTR("com.apple.managedconfiguration.profiled.eap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(Information);
  v7 = v6;
  if (!v6)
    goto LABEL_5;
  v8 = kMCPayloadUUIDKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", kMCPayloadUUIDKey));
  v10 = objc_opt_class(NSString);
  isKindOfClass = objc_opt_isKindOfClass(v9, v10);

  if ((isKindOfClass & 1) == 0)
    goto LABEL_5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v8));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if ((v14 & 1) != 0)
    v15 = 1;
  else
LABEL_5:
    v15 = 0;

  return v15;
}

- (BOOL)_installEAPConfiguration:(id)a3 isHotspot:(BOOL)a4 securityType:(id)a5 authProperties:(id)a6 username:(id)a7 password:(id)a8 identity:(__SecIdentity *)a9
{
  _BOOL4 v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  const void *v22;
  const void *ProfileWithWLANDomain;
  const void *v24;
  os_log_t v25;
  NSObject *v26;
  id v27;
  BOOL v28;
  void *v29;
  const void *ProfileWithWLANSSID;
  os_log_t v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  const void *v35;
  void *v36;
  void *v37;
  void *v38;
  os_log_t v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  os_log_t v44;
  NSObject *v45;
  id v46;
  os_log_t v47;
  NSObject *v48;
  void *v49;
  id v50;
  os_log_t v51;
  NSObject *v52;
  void *v53;
  id v54;
  const char *v55;
  os_log_t v56;
  void *v57;
  os_log_t v58;
  void *v59;
  id v61;
  id v62;
  uint8_t buf[4];
  id v64;

  v13 = a4;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v21 = EAPOLClientConfigurationCreateWithAuthorization(0, 0);
  if (v21)
  {
    v22 = (const void *)v21;
    v61 = v16;
    v62 = v17;
    if (v13)
    {
      ProfileWithWLANDomain = (const void *)EAPOLClientConfigurationGetProfileWithWLANDomain(v21, v15);
      if (ProfileWithWLANDomain)
      {
        v24 = ProfileWithWLANDomain;
        CFRetain(ProfileWithWLANDomain);
LABEL_10:
        if (!-[MCNewWiFiPayloadHandler _isMetadataValid:](self, "_isMetadataValid:", v24, v61))
        {
          v31 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            v32 = v31;
            *(_DWORD *)buf = 138543362;
            v64 = (id)objc_opt_class(self);
            v33 = v64;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%{public}@ configuration for the Wi-Fi already exists", buf, 0xCu);

          }
        }
        goto LABEL_15;
      }
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataUsingEncoding:", 4));
      ProfileWithWLANSSID = (const void *)EAPOLClientConfigurationGetProfileWithWLANSSID(v22, v29);
      if (ProfileWithWLANSSID)
      {
        v24 = ProfileWithWLANSSID;
        CFRetain(ProfileWithWLANSSID);

        goto LABEL_10;
      }

    }
    v24 = (const void *)EAPOLClientProfileCreate(v22);
    if (!v24)
    {
      v44 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v45 = v44;
        *(_DWORD *)buf = 138543362;
        v64 = (id)objc_opt_class(self);
        v46 = v64;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientProfileCreate() returned NULL", buf, 0xCu);

      }
      v28 = 0;
      v16 = v61;
      goto LABEL_49;
    }
LABEL_15:
    v34 = EAPOLClientItemIDCreateWithProfile(v24);
    if (!v34)
    {
      v39 = _MCLogObjects[0];
      v17 = v62;
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v40 = v39;
        v41 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543362;
        v64 = v41;
        v42 = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientItemIDCreateWithProfile() returned NULL", buf, 0xCu);

      }
      v28 = 0;
      goto LABEL_48;
    }
    v35 = (const void *)v34;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "displayName"));

    if (v36)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "displayName"));
      EAPOLClientProfileSetUserDefinedName(v24, v37);

    }
    EAPOLClientProfileSetAuthenticationProperties(v24, v62);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewWiFiPayloadHandler profileMetadata](self, "profileMetadata"));
    if (v38
      && !EAPOLClientProfileSetInformation(v24, CFSTR("com.apple.managedconfiguration.profiled.eap"), v38))
    {
      v47 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v48 = v47;
        v49 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543362;
        v64 = v49;
        v50 = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientProfileSetInformation() failed", buf, 0xCu);

      }
      goto LABEL_46;
    }

    if (v13)
    {
      EAPOLClientProfileSetWLANDomain(v24, v15);
      if (!v18)
        goto LABEL_29;
    }
    else
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataUsingEncoding:", 4));
      EAPOLClientProfileSetWLANSSIDAndSecurityType(v24, v43, v61);

      if (!v18)
        goto LABEL_29;
    }
    if (v19 && !EAPOLClientItemIDSetPasswordItem(v35, 3, v18, v19))
    {
      v58 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v52 = v58;
        v59 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543362;
        v64 = v59;
        v54 = v59;
        v55 = "%{public}@ EAPOLClientItemIDSetPasswordItem() failed";
        goto LABEL_45;
      }
      goto LABEL_46;
    }
LABEL_29:
    if (a9 && !EAPOLClientItemIDSetIdentity(v35, 3))
    {
      v56 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v52 = v56;
        v57 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543362;
        v64 = v57;
        v54 = v57;
        v55 = "%{public}@ EAPOLClientItemIDSetIdentity() failed";
        goto LABEL_45;
      }
    }
    else
    {
      if (EAPOLClientConfigurationSave(v22))
      {
        v28 = 1;
LABEL_47:
        CFRelease(v35);
        v17 = v62;
LABEL_48:
        CFRelease(v24);
        v16 = v61;
LABEL_49:
        CFRelease(v22);
        goto LABEL_50;
      }
      v51 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v52 = v51;
        v53 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543362;
        v64 = v53;
        v54 = v53;
        v55 = "%{public}@ EAPOLClientConfigurationSave() failed";
LABEL_45:
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, v55, buf, 0xCu);

      }
    }
LABEL_46:
    v28 = 0;
    goto LABEL_47;
  }
  v25 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v26 = v25;
    *(_DWORD *)buf = 138543362;
    v64 = (id)objc_opt_class(self);
    v27 = v64;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL", buf, 0xCu);

  }
  v28 = 0;
LABEL_50:

  return v28;
}

- (void)_removeEAPConfiguration
{
  void *v3;
  uint64_t v4;
  const void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  os_log_t v9;
  NSObject *v10;
  id v11;
  uint64_t ProfileWithID;
  os_log_t v13;
  NSObject *v14;
  id v15;
  uint64_t ProfileWithWLANSSID;
  uint64_t v17;
  const void *v18;
  os_log_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  os_log_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  os_log_t v27;
  NSObject *v28;
  void *v29;
  id v30;
  const char *v31;
  os_log_t v32;
  NSObject *v33;
  void *v34;
  id v35;
  const char *v36;
  void *v37;
  void *v38;
  os_log_t v39;
  void *v40;
  os_log_t v41;
  void *v42;
  void *v43;
  os_log_t v44;
  void *v45;
  void *v46;
  uint8_t v47[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = EAPOLClientConfigurationCreateWithAuthorization(0, 0);
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v7 = objc_msgSend(v6, "isSetAside");
    v8 = qword_1000FD7E8;

    if (v7)
    {
      if (!v8)
      {
        v9 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          v10 = v9;
          *(_DWORD *)v47 = 138543362;
          *(_QWORD *)&v47[4] = objc_opt_class(self);
          v11 = *(id *)&v47[4];
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@ failed to find set aside EAP profile", v47, 0xCu);

        }
      }
    }
    if (qword_1000FD7E8)
    {
      ProfileWithID = EAPOLClientConfigurationGetProfileWithID(v5);
    }
    else
    {
      if (!objc_msgSend(v3, "isHotspot"))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ssid"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "dataUsingEncoding:", 4));

        ProfileWithWLANSSID = EAPOLClientConfigurationGetProfileWithWLANSSID(v5, v38);
        if (ProfileWithWLANSSID)
          goto LABEL_13;
        goto LABEL_28;
      }
      ProfileWithID = EAPOLClientConfigurationGetProfileWithWLANDomain(v5, objc_msgSend(v3, "domainName"));
    }
    ProfileWithWLANSSID = ProfileWithID;
    if (ProfileWithID)
    {
LABEL_13:
      if (-[MCNewWiFiPayloadHandler _isMetadataValid:](self, "_isMetadataValid:", ProfileWithWLANSSID, *(_OWORD *)v47))
      {
        v17 = EAPOLClientItemIDCreateWithProfile(ProfileWithWLANSSID);
        if (v17)
        {
          v18 = (const void *)v17;
          if (!EAPOLClientItemIDRemovePasswordItem(v17, 3))
          {
            v19 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v20 = v19;
              v21 = (void *)objc_opt_class(self);
              *(_DWORD *)v47 = 138543362;
              *(_QWORD *)&v47[4] = v21;
              v22 = v21;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ EAPOLClientItemIDRemovePasswordItem() failed", v47, 0xCu);

            }
          }
          if (!EAPOLClientItemIDSetIdentity(v18, 3))
          {
            v23 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v24 = v23;
              v25 = (void *)objc_opt_class(self);
              *(_DWORD *)v47 = 138543362;
              *(_QWORD *)&v47[4] = v25;
              v26 = v25;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ EAPOLClientItemIDSetIdentity() failed", v47, 0xCu);

            }
          }
          if (EAPOLClientConfigurationRemoveProfile(v5, ProfileWithWLANSSID))
          {
            if (EAPOLClientConfigurationSave(v5))
              goto LABEL_39;
            v27 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              goto LABEL_39;
            v28 = v27;
            v29 = (void *)objc_opt_class(self);
            *(_DWORD *)v47 = 138543362;
            *(_QWORD *)&v47[4] = v29;
            v30 = v29;
            v31 = "%{public}@ EAPOLClientConfigurationSave() failed";
          }
          else
          {
            v44 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
LABEL_39:
              v46 = (void *)qword_1000FD7E8;
              qword_1000FD7E8 = 0;

              CFRelease(v18);
              goto LABEL_34;
            }
            v28 = v44;
            v45 = (void *)objc_opt_class(self);
            *(_DWORD *)v47 = 138543362;
            *(_QWORD *)&v47[4] = v45;
            v30 = v45;
            v31 = "%{public}@ EAPOLClientConfigurationRemoveProfile() failed";
          }
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v31, v47, 0xCu);

          goto LABEL_39;
        }
        v41 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          v33 = v41;
          v42 = (void *)objc_opt_class(self);
          *(_DWORD *)v47 = 138543362;
          *(_QWORD *)&v47[4] = v42;
          v35 = v42;
          v36 = "%{public}@ EAPOLClientItemIDCreateWithProfile() returned NULL";
          goto LABEL_32;
        }
LABEL_33:
        v43 = (void *)qword_1000FD7E8;
        qword_1000FD7E8 = 0;

LABEL_34:
        CFRelease(v5);
        goto LABEL_35;
      }
      v32 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        goto LABEL_33;
      v33 = v32;
      v34 = (void *)objc_opt_class(self);
      *(_DWORD *)v47 = 138543362;
      *(_QWORD *)&v47[4] = v34;
      v35 = v34;
      v36 = "%{public}@ metadata validation failed";
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v36, v47, 0xCu);

      goto LABEL_33;
    }
LABEL_28:
    v39 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      goto LABEL_33;
    v33 = v39;
    v40 = (void *)objc_opt_class(self);
    *(_DWORD *)v47 = 138543362;
    *(_QWORD *)&v47[4] = v40;
    v35 = v40;
    v36 = "%{public}@ failed to find EAP profile";
    goto LABEL_32;
  }
  v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v14 = v13;
    *(_DWORD *)v47 = 138543362;
    *(_QWORD *)&v47[4] = objc_opt_class(self);
    v15 = *(id *)&v47[4];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL", v47, 0xCu);

  }
LABEL_35:

}

- (BOOL)_setEAPConfigUsingEAPConfigAPI:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __SecCertificate *v20;
  __SecCertificate *v21;
  CFDataRef v22;
  os_log_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  os_log_t v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  os_log_t v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  os_log_t v48;
  NSObject *v49;
  id v50;
  os_log_t v51;
  NSObject *v52;
  void *v53;
  id v54;
  int v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id obj;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  CFTypeRef cf;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  int v71;
  _BYTE v72[128];

  v4 = a3;
  cf = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v6 = objc_msgSend(v4, "mutableCopy");
  if (objc_msgSend(v5, "usernameRequired")
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username")), v7, !v7))
  {
    v48 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v49 = v48;
      *(_DWORD *)buf = 138543362;
      v67 = (id)objc_opt_class(self);
      v50 = v67;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%{public}@ username is not available", buf, 0xCu);

    }
    LODWORD(v8) = 0;
  }
  else
  {
    LODWORD(v8) = 1;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("TLSTrustedCertificates")));

  if (v9)
  {
    if (!(_DWORD)v8)
      goto LABEL_38;
LABEL_26:
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "certificateUUID"));

    if (v31)
    {
      v32 = v6;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "certificateUUID"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "persistentIDForCertificateUUID:", v34));

      v36 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        v37 = v36;
        v38 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543618;
        v67 = v38;
        v68 = 1026;
        LODWORD(v69) = v35 != 0;
        v39 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ handling identity certs? %{public}d", buf, 0x12u);

      }
      if (v35 && (EAPSecIdentityHandleCreateSecIdentity(v35, &cf) || !cf))
      {
        v51 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          v52 = v51;
          v53 = (void *)objc_opt_class(self);
          *(_DWORD *)buf = 138543362;
          v67 = v53;
          v54 = v53;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ EAPSecIdentityHandleCreateSecIdentity() failed", buf, 0xCu);

        }
        LOBYTE(v8) = 0;
        goto LABEL_37;
      }

    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "dataUsingEncoding:", 4));

    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "password"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "dataUsingEncoding:", 4));

    v32 = v6;
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("UserPassword"));
    v8 = objc_msgSend(v5, "isHotspot");
    if ((v8 & 1) != 0)
      v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domainName"));
    else
      v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ssid"));
    v44 = (void *)v43;
    v45 = v5;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "encryptionType"));
    LOBYTE(v8) = -[MCNewWiFiPayloadHandler _installEAPConfiguration:isHotspot:securityType:authProperties:username:password:identity:](self, "_installEAPConfiguration:isHotspot:securityType:authProperties:username:password:identity:", v44, v8, v46, v32, v35, v42, cf);

    v5 = v45;
LABEL_37:

    v6 = v32;
    goto LABEL_38;
  }
  v55 = (int)v8;
  v56 = v6;
  v58 = v4;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v57 = v5;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "payloadCertificateAnchorUUID"));
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v62 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "persistentIDForCertificateUUID:", v14));

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "profile"));
          v19 = objc_msgSend(v18, "isInstalledForSystem");

          v20 = (__SecCertificate *)+[MCKeychain copyCertificateWithPersistentID:useSystemKeychain:](MCKeychain, "copyCertificateWithPersistentID:useSystemKeychain:", v16, v19);
          if (v20)
          {
            v21 = v20;
            v22 = SecCertificateCopyData(v20);
            if (v22)
            {
              v23 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                v24 = v23;
                v25 = (void *)objc_opt_class(self);
                *(_DWORD *)buf = 138543874;
                v67 = v25;
                v68 = 2114;
                v69 = v14;
                v70 = 1026;
                v71 = (int)v19;
                v26 = v25;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ adding trusted certificate UUID %{public}@ with system keychain? %{public}d", buf, 0x1Cu);

              }
              objc_msgSend(v59, "addObject:", v22);
            }

            CFRelease(v21);
          }
        }
        else
        {
          v27 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            v28 = v27;
            v29 = (void *)objc_opt_class(self);
            *(_DWORD *)buf = 138543618;
            v67 = v29;
            v68 = 2114;
            v69 = v14;
            v30 = v29;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ certificate UUID %{public}@ referenced by this payload does not exist, skipping.", buf, 0x16u);

          }
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
    }
    while (v11);
  }

  v6 = v56;
  if (objc_msgSend(v59, "count"))
    objc_msgSend(v56, "setObject:forKey:", v59, CFSTR("TLSTrustedCertificates"));

  v5 = v57;
  v4 = v58;
  LOBYTE(v8) = v55;
  if (v55)
    goto LABEL_26;
LABEL_38:
  if (cf)
    CFRelease(cf);

  return (char)v8;
}

- (void)setAsideEAPConfig
{
  void *v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  uint64_t ProfileWithWLANDomain;
  void *v8;
  uint64_t ID;
  uint64_t v10;
  void *v11;
  os_log_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  os_log_t v16;
  NSObject *v17;
  id v18;
  const char *v19;
  os_log_t v20;
  os_log_t v21;
  os_log_t v22;
  int v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)qword_1000FD7E8;
  qword_1000FD7E8 = 0;

  v5 = EAPOLClientConfigurationCreateWithAuthorization(0, 0);
  if (v5)
  {
    v6 = (const void *)v5;
    if (objc_msgSend(v3, "isHotspot"))
    {
      ProfileWithWLANDomain = EAPOLClientConfigurationGetProfileWithWLANDomain(v6, objc_msgSend(v3, "domainName"));
      v8 = 0;
      if (ProfileWithWLANDomain)
      {
LABEL_4:
        if (-[MCNewWiFiPayloadHandler _isMetadataValid:](self, "_isMetadataValid:", ProfileWithWLANDomain))
        {
          ID = EAPOLClientProfileGetID(ProfileWithWLANDomain);
          v10 = objc_claimAutoreleasedReturnValue(ID);
          v11 = (void *)qword_1000FD7E8;
          qword_1000FD7E8 = v10;

          if (qword_1000FD7E8)
          {
            if (v8)
              EAPOLClientProfileSetWLANSSIDAndSecurityType(ProfileWithWLANDomain, 0, 0);
            else
              EAPOLClientProfileSetWLANDomain(ProfileWithWLANDomain, 0);
            if (EAPOLClientConfigurationSave(v6))
              goto LABEL_22;
            v22 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              goto LABEL_22;
            v17 = v22;
            v23 = 138543362;
            v24 = (id)objc_opt_class(self);
            v18 = v24;
            v19 = "%{public}@ EAPOLClientConfigurationSave() failed";
            goto LABEL_21;
          }
          v21 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            v17 = v21;
            v23 = 138543362;
            v24 = (id)objc_opt_class(self);
            v18 = v24;
            v19 = "%{public}@ EAPOLClientProfileGetID() returned NULL";
            goto LABEL_21;
          }
LABEL_22:
          CFRelease(v6);
          goto LABEL_23;
        }
        v20 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          goto LABEL_22;
        v17 = v20;
        v23 = 138543362;
        v24 = (id)objc_opt_class(self);
        v18 = v24;
        v19 = "%{public}@ metadata validation failed";
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v23, 0xCu);

        goto LABEL_22;
      }
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ssid"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataUsingEncoding:", 4));

      ProfileWithWLANDomain = EAPOLClientConfigurationGetProfileWithWLANSSID(v6, v8);
      if (ProfileWithWLANDomain)
        goto LABEL_4;
    }
    v16 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    v17 = v16;
    v23 = 138543362;
    v24 = (id)objc_opt_class(self);
    v18 = v24;
    v19 = "%{public}@ failed to find EAP Profile";
    goto LABEL_21;
  }
  v12 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v13 = v12;
    v23 = 138543362;
    v24 = (id)objc_opt_class(self);
    v14 = v24;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL", (uint8_t *)&v23, 0xCu);

  }
LABEL_23:

}

- (void)unsetAsideEAPConfig
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  uint64_t ProfileWithID;
  void *v10;
  os_log_t v11;
  NSObject *v12;
  id v13;
  os_log_t v14;
  NSObject *v15;
  id v16;
  const char *v17;
  void *v18;
  void *v19;
  os_log_t v20;
  int v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v5 = objc_msgSend(v4, "isSetAside");
  v6 = qword_1000FD7E8;

  if (v5 && v6)
  {
    v7 = EAPOLClientConfigurationCreateWithAuthorization(0, 0);
    if (v7)
    {
      v8 = (const void *)v7;
      ProfileWithID = EAPOLClientConfigurationGetProfileWithID(v7);
      v10 = (void *)qword_1000FD7E8;
      qword_1000FD7E8 = 0;

      if (ProfileWithID)
      {
        if (objc_msgSend(v3, "isHotspot"))
        {
          EAPOLClientProfileSetWLANDomain(ProfileWithID, objc_msgSend(v3, "domainName"));
        }
        else
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ssid"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dataUsingEncoding:", 4));
          EAPOLClientProfileSetWLANSSIDAndSecurityType(ProfileWithID, v19, objc_msgSend(v3, "encryptionType"));

        }
        if (EAPOLClientConfigurationSave(v8))
          goto LABEL_16;
        v20 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        v15 = v20;
        v21 = 138543362;
        v22 = (id)objc_opt_class(self);
        v16 = v22;
        v17 = "%{public}@ EAPOLClientConfigurationSave() failed";
      }
      else
      {
        v14 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
LABEL_16:
          CFRelease(v8);
          goto LABEL_17;
        }
        v15 = v14;
        v21 = 138543362;
        v22 = (id)objc_opt_class(self);
        v16 = v22;
        v17 = "%{public}@ EAPOLClientConfigurationGetProfileWithID() returned NULL";
      }
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v21, 0xCu);

      goto LABEL_16;
    }
    v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      v21 = 138543362;
      v22 = (id)objc_opt_class(self);
      v13 = v22;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL", (uint8_t *)&v21, 0xCu);

    }
  }
LABEL_17:

}

- (BOOL)_setEAPConfig:(id)a3 onNetwork:(__WiFiNetwork *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const void *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __SecCertificate *v31;
  __SecCertificate *v32;
  CFDataRef v33;
  void *v34;
  MCNewWiFiPayloadHandler *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  _BOOL4 v44;
  __WiFiNetwork *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  id v50;
  uint8_t v51[16];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE buf[12];
  __int16 v57;
  int v58;
  _BYTE v59[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  sub_10005B814();
  v8 = objc_msgSend(v6, "mutableCopy");
  if (!objc_msgSend(v7, "usernameRequired"))
    goto LABEL_4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "username"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "username"));
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("UserName"));

LABEL_4:
    v11 = 1;
    goto LABEL_5;
  }
  v40 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler requires a username but a username is not available.", buf, 2u);
  }
  v11 = 0;
LABEL_5:
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("TLSTrustedCertificates")));

  if (v12)
  {
    if (v11)
      goto LABEL_7;
  }
  else
  {
    v44 = v11;
    v45 = a4;
    v46 = v8;
    v48 = v6;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v47 = v7;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payloadCertificateAnchorUUID"));
    v50 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    if (v50)
    {
      v23 = *(_QWORD *)v53;
      v49 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v50; i = (char *)i + 1)
        {
          if (*(_QWORD *)v53 != v23)
            objc_enumerationMutation(v22);
          v25 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "persistentIDForCertificateUUID:", v25));

          if (v27)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "profile"));
            v30 = objc_msgSend(v29, "isInstalledForSystem");

            v31 = (__SecCertificate *)+[MCKeychain copyCertificateWithPersistentID:useSystemKeychain:](MCKeychain, "copyCertificateWithPersistentID:useSystemKeychain:", v27, v30);
            if (v31)
            {
              v32 = v31;
              v33 = SecCertificateCopyData(v31);
              if (v33)
              {
                v34 = v22;
                v35 = self;
                v36 = v21;
                v37 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v25;
                  v57 = 1026;
                  v58 = (int)v30;
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler adding trusted certificate UUID %{public}@ with system keychain? %{public}d", buf, 0x12u);
                }
                v21 = v36;
                objc_msgSend(v36, "addObject:", v33);
                self = v35;
                v22 = v34;
                v23 = v49;
              }

              CFRelease(v32);
            }
          }
          else
          {
            v38 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v25;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler certificate UUID %{public}@ referenced by this payload does not exist, skipping.", buf, 0xCu);
            }
          }

        }
        v50 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      }
      while (v50);
    }

    v8 = v46;
    if (objc_msgSend(v21, "count"))
      objc_msgSend(v46, "setObject:forKey:", v21, CFSTR("TLSTrustedCertificates"));

    v7 = v47;
    v6 = v48;
    a4 = v45;
    LOBYTE(v11) = v44;
    if (v44)
    {
LABEL_7:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "certificateUUID"));

      if (!v13)
      {
LABEL_43:
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v8, CFSTR("EAPClientConfiguration")));
        WiFiNetworkSetProperty(a4, kWiFiNetworkEnterpriseProfile, v41);
        v42 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v41;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler setEAPConfig succeeded with EAP profile: %{public}@", buf, 0xCu);
        }

        goto LABEL_46;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "certificateUUID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "persistentIDForCertificateUUID:", v15));

      v17 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = v16 != 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler handling identity certs? %{public}d", buf, 8u);
      }
      if (v16)
      {
        *(_QWORD *)buf = 0;
        EAPSecIdentityHandleCreateSecIdentity(v16, buf);
        if (*(_QWORD *)buf && (v18 = (const void *)EAPSecIdentityHandleCreate(), CFRelease(*(CFTypeRef *)buf), v18))
        {
          objc_msgSend(v8, "setObject:forKey:", v18, CFSTR("TLSIdentityHandle"));
          CFRelease(v18);
          v19 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v51 = 0;
            v20 = "MCNewWiFiPayloadHandler set identity handle.";
LABEL_41:
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, v51, 2u);
          }
        }
        else
        {
          objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("TLSIdentityHandle"));
          v19 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v51 = 0;
            v20 = "MCNewWiFiPayloadHandler set persistent ID as identity handle.";
            goto LABEL_41;
          }
        }
      }

      goto LABEL_43;
    }
  }
  v39 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler setEAPConfig failed.", buf, 2u);
  }
LABEL_46:

  return v11;
}

- (void)_updateWiFiCustomSetWithSetID:(id)a3 forSSID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  const char *v13;
  int v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = kWiFiPreferenceCustomNetworksSettingsKey;
  v9 = (void *)WiFiManagerClientCopyProperty(self->_manager, kWiFiPreferenceCustomNetworksSettingsKey);
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v11, "setObject:forKey:", v6, v7);
    WiFiManagerClientSetProperty(self->_manager, v8, v11);
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = v11;
      v13 = "MCNewWiFiPayloadHandler updated custom settings: %{public}@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v6, v7));
    WiFiManagerClientSetProperty(self->_manager, v8, v11);
    v12 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = v6;
      v13 = "MCNewWiFiPayloadHandler set custom settings: %{public}@";
      goto LABEL_6;
    }
  }

}

- (BOOL)_applyProxyCredential:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint8_t v22[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "proxyServer"));
  v7 = objc_msgSend(v6, "length");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredentialStorage sharedCredentialStorage](NSURLCredentialStorage, "sharedCredentialStorage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "profile"));
    objc_msgSend(v8, "set_useSystemKeychain:", objc_msgSend(v10, "isInstalledForSystem"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "proxyServerPort"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "proxyServerPort"));
      v13 = (int)objc_msgSend(v12, "intValue");

    }
    else
    {
      v13 = 80;
    }

    v15 = objc_alloc((Class)NSURLProtectionSpace);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "proxyServer"));
    v17 = objc_msgSend(v15, "initWithProxyHost:port:type:realm:authenticationMethod:", v16, v13, NSURLProtectionSpaceHTTP, 0, NSURLAuthenticationMethodDefault);

    v18 = objc_alloc((Class)NSURLProtectionSpace);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "proxyServer"));
    v20 = objc_msgSend(v18, "initWithProxyHost:port:type:realm:authenticationMethod:", v19, v13, NSURLProtectionSpaceHTTPS, 0, NSURLAuthenticationMethodDefault);

    objc_msgSend(v8, "setDefaultCredential:forProtectionSpace:", v4, v17);
    objc_msgSend(v8, "setDefaultCredential:forProtectionSpace:", v4, v20);

  }
  else
  {
    v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler requires a proxy server to be provided.", v22, 2u);
    }
  }

  return v7 != 0;
}

- (BOOL)_configureEncryptionTypeForWiFiNetwork:(__WiFiNetwork *)a3 payload:(id)a4 outError:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  NSObject *v22;
  void *v23;
  unsigned int v24;
  NSObject *v25;
  void *v26;
  unsigned int v27;
  NSObject *v28;
  __WiFiNetwork *v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  const __CFString *v40;
  _UNKNOWN **v41;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eapClientConfig"));

  if (v9)
  {
    WiFiNetworkSetWPA(a3, objc_msgSend(v8, "isWPA"));
    WiFiNetworkSetWEP(a3, objc_msgSend(v8, "isWEP"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eapClientConfig"));
    v11 = -[MCNewWiFiPayloadHandler _setEAPConfig:onNetwork:](self, "_setEAPConfig:onNetwork:", v10, a3);

    if ((v11 & 1) != 0)
    {
      v40 = CFSTR("IE_KEY_WPA_AUTHSELS");
      v41 = &off_1000ED2C0;
      LOBYTE(a5) = 1;
      WiFiNetworkSetProperty(a3, CFSTR("WPA_IE"), +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
    }
    else if (a5)
    {
      v15 = MCWiFiErrorDomain;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("ERROR_WIFI_COULD_NOT_SETUP_EAP"), "MCAppendGreenteaSuffix"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ssid"));
      v18 = MCErrorArray(v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v15, 13004, v19, MCErrorTypeFatal, v17, 0));

      LOBYTE(a5) = 0;
    }
    goto LABEL_28;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "encryptionType"));
  v13 = objc_msgSend(v12, "isEqualToString:", kMCWiFiEncryptionTypeWEP);

  if (v13)
  {
    v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler setting WEP network", buf, 2u);
    }
    LOBYTE(a5) = 1;
    WiFiNetworkSetWEP(a3, 1);
    goto LABEL_28;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "encryptionType"));
  v21 = objc_msgSend(v20, "isEqualToString:", kMCWiFiEncryptionTypeWPA);

  if (v21)
  {
    v22 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler setting WPA network", buf, 2u);
    }
    LOBYTE(a5) = 1;
    WiFiNetworkSetWPA(a3, 1);
    goto LABEL_28;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "encryptionType"));
  v24 = objc_msgSend(v23, "isEqualToString:", kMCWiFiEncryptionTypeWPA2);

  if (v24)
  {
    v25 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler setting WPA2 network", buf, 2u);
    }
    LOBYTE(a5) = 1;
LABEL_26:
    v29 = a3;
    v30 = 1;
LABEL_27:
    WiFiNetworkSetSAE(v29, 1, v30);
    goto LABEL_28;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "encryptionType"));
  v27 = objc_msgSend(v26, "isEqualToString:", kMCWiFiEncryptionTypeWPA3);

  if (v27)
  {
    v28 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler setting WPA3 network", buf, 2u);
    }
    LOBYTE(a5) = 1;
    v29 = a3;
    v30 = 0;
    goto LABEL_27;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "encryptionType"));
  v32 = objc_msgSend(v31, "isEqualToString:", kMCWiFiEncryptionTypeAny);

  v33 = _MCLogObjects[0];
  v34 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT);
  if (v32)
  {
    if (v34)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler setting Any-secured network", buf, 2u);
    }
    LOBYTE(a5) = 1;
    WiFiNetworkSetWEP(a3, 1);
    WiFiNetworkSetWPA(a3, 1);
    goto LABEL_26;
  }
  if (v34)
  {
    v36 = v33;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "encryptionType"));
    *(_DWORD *)buf = 138543362;
    v39 = v37;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler encryption type not recognized: %{public}@", buf, 0xCu);

  }
  LOBYTE(a5) = 1;
LABEL_28:

  return (char)a5;
}

- (BOOL)_networkServiceRequired
{
  void *v2;
  unsigned int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  os_log_t v7;
  void *v8;
  int v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = objc_msgSend(v2, "proxyType");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "qosMarkingConfig"));
  LOBYTE(v5) = 1;
  if (!objc_msgSend(v4, "count") && v3 - 1 >= 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "proxyUsername"));
    if (v6)
    {

    }
    else
    {
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "proxyPassword"));

      if (v5)
      {
        LOBYTE(v5) = 1;
      }
      else
      {
        v7 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          v5 = v7;
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ssid"));
          v10 = 138543362;
          v11 = v8;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler custom service not required for SSID: %{public}@", (uint8_t *)&v10, 0xCu);

          LOBYTE(v5) = 0;
        }
      }
    }
  }

  return (char)v5;
}

- (BOOL)_configureNetworkServiceForWiFiNetwork:(__WiFiNetwork *)a3 outError:(id *)a4
{
  void *v8;
  SCPreferencesRef v9;
  SCPreferencesRef v10;
  uint64_t v11;
  void *v12;
  const __CFArray *v13;
  CFIndex v14;
  const __SCNetworkSet *v15;
  __CFString *v16;
  NSObject *v17;
  NSObject *v18;
  CFIndex v19;
  const __SCNetworkSet *ValueAtIndex;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  const __SCNetworkProtocol *v24;
  _BOOL4 v25;
  const __SCNetworkSet *v26;
  NSObject *v27;
  const __SCNetworkSet *v28;
  const __CFArray *v29;
  const __CFArray *v30;
  const __CFArray *v31;
  CFIndex v32;
  const __SCNetworkSet *v33;
  const __SCNetworkService *v34;
  SCNetworkInterfaceRef Interface;
  const __SCNetworkInterface *v36;
  CFStringRef InterfaceType;
  NSObject *v38;
  NSObject *v39;
  const __SCNetworkService *v40;
  const __CFArray *ServiceOrder;
  const __CFArray *MutableCopy;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  const __CFArray *v46;
  const __CFArray *v47;
  CFIndex v48;
  const __SCNetworkService *v49;
  SCNetworkInterfaceRef v50;
  const __SCNetworkInterface *v51;
  CFStringRef v52;
  NSObject *v53;
  const __SCNetworkService *v54;
  uint64_t v55;
  const __SCNetworkSet *v56;
  NSObject *v57;
  uint64_t v58;
  NSObject *v59;
  const char *v60;
  unsigned int v61;
  int v62;
  NSObject *v63;
  const __SCNetworkService *v64;
  const __CFArray *v65;
  CFIndex Count;
  CFStringRef ServiceID;
  CFIndex FirstIndexOfValue;
  CFIndex v69;
  CFStringRef v70;
  NSObject *v71;
  const char *v72;
  NSObject *v73;
  os_log_type_t v74;
  uint32_t v75;
  CFStringRef SetID;
  NSObject *v77;
  const __CFArray *v78;
  const __CFArray *v79;
  const void *v80;
  uint64_t InterfaceName;
  const __CFArray *v82;
  const __CFArray *v83;
  CFIndex v84;
  const __SCNetworkService *v85;
  const __SCNetworkInterface *v86;
  CFStringRef BSDName;
  void *v88;
  NSObject *v89;
  NSObject *v90;
  void *v91;
  uint64_t v92;
  NSObject *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  BOOL v97;
  void *v98;
  NSObject *v100;
  const __SCNetworkService *v101;
  CFArrayRef v102;
  void *v103;
  void *v104;
  unsigned int v105;
  os_log_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  NSObject *v111;
  NSObject *v112;
  NSObject *v113;
  const char *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  _UNKNOWN **v119;
  void *v120;
  id *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  const __CFString *v131;
  NSObject *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  const void *v140;
  const void *Archive;
  const void *v142;
  CFDataRef Data;
  uint64_t v144;
  id v145;
  NSObject *v146;
  NSObject *v147;
  uint64_t Property;
  void *v149;
  NSObject *v150;
  void *v151;
  void *v152;
  __WiFiNetwork *v153;
  __WiFiNetwork *v154;
  __WiFiNetwork *v155;
  SEL v156;
  void *v157;
  uint64_t v158;
  void *v159;
  void *v160;
  id *v161;
  id *v162;
  void *v163;
  const __SCNetworkService *cf;
  SCNetworkServiceRef service;
  const __SCNetworkService *servicea;
  SCNetworkServiceRef serviceb;
  const __SCNetworkSet *set;
  __CFString *name;
  const __SCNetworkSet *v170;
  id v171;
  uint8_t buf[4];
  id v173;
  __int16 v174;
  const __CFArray *v175;
  CFRange v176;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v9 = SCPreferencesCreateWithAuthorization(0, CFSTR("com.apple.settings.wi-fi"), 0, 0);
  if (!v9)
  {
    v21 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot create system configuration preferences.", buf, 2u);
    }
    goto LABEL_144;
  }
  v10 = v9;
  v11 = kWiFiPreferenceCustomNetworksSettingsKey;
  v12 = (void *)WiFiManagerClientCopyProperty(self->_manager, kWiFiPreferenceCustomNetworksSettingsKey);
  if (!SCPreferencesLock(v10, 1u))
  {
    v22 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot lock system configuration preferences.", buf, 2u);
    }

    CFRelease(v10);
    goto LABEL_144;
  }
  SCPreferencesSynchronize(v10);
  v13 = SCNetworkSetCopyAll(v10);
  if (!v13)
  {
    v23 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot retrieve network sets from system configuration.", buf, 2u);
    }

    v24 = 0;
    v25 = 1;
    goto LABEL_139;
  }
  v156 = a2;
  name = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ssid"));
  service = (SCNetworkServiceRef)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:"));
  v163 = v12;
  v158 = v11;
  if (!service)
  {
LABEL_13:
    v18 = _MCLogObjects[0];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler attempting to create a new set for the network...", buf, 2u);
    }

    if (CFArrayGetCount(v13) < 1)
      goto LABEL_29;
    v19 = 0;
    while (1)
    {
      ValueAtIndex = (const __SCNetworkSet *)CFArrayGetValueAtIndex(v13, v19);
      if (-[__CFString isEqualToString:]((id)SCNetworkSetGetName(ValueAtIndex), "isEqualToString:", CFSTR("Automatic")))break;
      if (++v19 >= CFArrayGetCount(v13))
        goto LABEL_29;
    }
    v26 = (const __SCNetworkSet *)CFRetain(ValueAtIndex);
    if (!v26)
    {
LABEL_29:
      v27 = _MCLogObjects[0];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "MCNewWiFiPayloadHandler cannot get default set; using current set instead.",
          buf,
          2u);
      }

      v26 = SCNetworkSetCopyCurrent(v10);
      if (!v26)
      {
        v43 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot copy default set from system configuration.", buf, 2u);
        }
        v24 = 0;
        cf = 0;
        v31 = 0;
        v170 = 0;
        set = 0;
        goto LABEL_92;
      }
    }
    v28 = SCNetworkSetCreate(v10);
    set = v26;
    if (!v28)
    {
      v44 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot create new set.", buf, 2u);
      }
      v24 = 0;
      cf = 0;
      v31 = 0;
      v170 = 0;
      goto LABEL_92;
    }
    v153 = a3;
    v170 = v28;
    SCNetworkSetSetName(v28, name);
    v29 = SCNetworkSetCopyServices(v26);
    if (!v29)
    {
      v57 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot get default services.", buf, 2u);
      }
      v24 = 0;
      cf = 0;
      v31 = 0;
      goto LABEL_92;
    }
    v30 = v29;
    v160 = v8;
    v161 = a4;
    if (CFArrayGetCount(v29) < 1)
    {
      v31 = v30;
      v58 = v158;
LABEL_108:
      v33 = v170;
LABEL_109:
      CFRelease(v31);
LABEL_110:
      SetID = SCNetworkSetGetSetID(v33);
      a3 = v153;
      WiFiNetworkSetProperty(v153, v58, SetID);
      v77 = _MCLogObjects[0];
      v56 = set;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v173 = (id)SetID;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler set system configuration set ID: %{public}@", buf, 0xCu);
      }

      v64 = 0;
      v15 = v170;
      goto LABEL_113;
    }
    v31 = 0;
    v32 = 0;
    servicea = 0;
    v33 = v170;
    do
    {
      v34 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v30, v32);
      Interface = SCNetworkServiceGetInterface(v34);
      if (Interface)
      {
        v36 = Interface;
        while (1)
        {
          InterfaceType = SCNetworkInterfaceGetInterfaceType(v36);
          if (CFEqual(InterfaceType, kSCNetworkInterfaceTypeIEEE80211))
            break;
          v36 = SCNetworkInterfaceGetInterface(v36);
          if (!v36)
            goto LABEL_50;
        }
        v38 = _MCLogObjects[0];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler found WiFi interface.", buf, 2u);
        }

        if (!v31)
        {
          v39 = _MCLogObjects[0];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler creating new service...", buf, 2u);
          }

          v40 = SCNetworkServiceCreate(v10, v36);
          if (!v40)
          {
            v111 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot create new service.", buf, 2u);
            }
            v31 = 0;
LABEL_91:
            v8 = v160;
            a4 = v161;
            CFRelease(v30);
            v24 = 0;
            cf = 0;
LABEL_92:
            v61 = 1;
            v62 = 1;
            goto LABEL_131;
          }
          v31 = v40;
          if (!SCNetworkServiceEstablishDefaultConfiguration(v40))
          {
            v59 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              goto LABEL_91;
            *(_WORD *)buf = 0;
            v60 = "MCNewWiFiPayloadHandler cannot establish new service.";
LABEL_90:
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, v60, buf, 2u);
            goto LABEL_91;
          }
          servicea = v34;
          v34 = v31;
        }
        v33 = v170;
      }
LABEL_50:
      if (!SCNetworkSetAddService(v33, v34))
      {
        v59 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          goto LABEL_91;
        *(_WORD *)buf = 0;
        v60 = "MCNewWiFiPayloadHandler cannot add new service.";
        goto LABEL_90;
      }
      ++v32;
    }
    while (v32 < CFArrayGetCount(v30));
    if (!v31 || !servicea)
    {
      CFRelease(v30);
      v58 = v158;
      if (!v31)
        goto LABEL_110;
      goto LABEL_109;
    }
    ServiceOrder = SCNetworkSetGetServiceOrder(set);
    if (ServiceOrder)
      MutableCopy = CFArrayCreateMutableCopy(0, 0, ServiceOrder);
    else
      MutableCopy = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    v65 = MutableCopy;
    Count = CFArrayGetCount(MutableCopy);
    ServiceID = SCNetworkServiceGetServiceID(servicea);
    v176.location = 0;
    v176.length = Count;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v65, v176, ServiceID);
    if (FirstIndexOfValue == -1)
    {
      v71 = _MCLogObjects[0];
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v173 = v65;
        v174 = 2114;
        v175 = ServiceOrder;
        v72 = "MCNewWiFiPayloadHandler failed to set service order: %{public}@. Maintaining old order: %{public}@";
        v73 = v71;
        v74 = OS_LOG_TYPE_ERROR;
        v75 = 22;
        goto LABEL_106;
      }
    }
    else
    {
      v69 = FirstIndexOfValue;
      v70 = SCNetworkServiceGetServiceID(v31);
      CFArraySetValueAtIndex(v65, v69, v70);
      SCNetworkSetSetServiceOrder(v170, v65);
      v71 = _MCLogObjects[0];
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v173 = v65;
        v72 = "MCNewWiFiPayloadHandler set service order: %{public}@";
        v73 = v71;
        v74 = OS_LOG_TYPE_DEFAULT;
        v75 = 12;
LABEL_106:
        _os_log_impl((void *)&_mh_execute_header, v73, v74, v72, buf, v75);
      }
    }
    v58 = v158;

    CFRelease(v65);
    CFRelease(v30);
    goto LABEL_108;
  }
  v160 = v8;
  v161 = a4;
  if (CFArrayGetCount(v13) < 1)
    goto LABEL_10;
  v14 = 0;
  while (1)
  {
    v15 = (const __SCNetworkSet *)CFArrayGetValueAtIndex(v13, v14);
    v16 = (__CFString *)SCNetworkSetGetSetID(v15);
    if (v16)
    {
      if ((-[__CFString isEqualToString:](v16, "isEqualToString:", service) & 1) != 0)
        break;
    }
    if (++v14 >= CFArrayGetCount(v13))
      goto LABEL_10;
  }
  if (!v15)
  {
LABEL_10:
    v17 = _MCLogObjects[0];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot retrieve custom network set from system configuration.", buf, 2u);
    }

    a4 = v161;
    goto LABEL_13;
  }
  v45 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v173 = service;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler attempting to modify service for custom set ID: %{public}@...", buf, 0xCu);
  }
  v46 = SCNetworkSetCopyServices(v15);
  if (!v46)
  {
    v63 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot get existing services.", buf, 2u);
    }

    v24 = 0;
    cf = 0;
    v31 = 0;
    goto LABEL_191;
  }
  v47 = v46;
  if (CFArrayGetCount(v46) <= 0)
  {
    CFRelease(v47);
    v170 = 0;
    v56 = 0;
  }
  else
  {
    v154 = a3;
    v31 = 0;
    v48 = 0;
    do
    {
      v49 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v47, v48);
      v50 = SCNetworkServiceGetInterface(v49);
      if (v50)
      {
        v51 = v50;
        while (1)
        {
          v52 = SCNetworkInterfaceGetInterfaceType(v51);
          if (CFEqual(v52, kSCNetworkInterfaceTypeIEEE80211))
            break;
          v51 = SCNetworkInterfaceGetInterface(v51);
          if (!v51)
            goto LABEL_80;
        }
        if (!v31)
        {
          v53 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler creating a new service...", buf, 2u);
          }
          v54 = SCNetworkServiceCreate(v10, v51);
          v31 = v54;
          if (!v54)
          {
            v113 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v114 = "MCNewWiFiPayloadHandler cannot create new service.";
              goto LABEL_189;
            }
LABEL_190:
            CFRelease(v47);

            v24 = 0;
            cf = 0;
LABEL_191:
            v170 = 0;
            set = 0;
            v61 = 1;
            v62 = 1;
            v8 = v160;
            a4 = v161;
            goto LABEL_131;
          }
          if (!SCNetworkServiceEstablishDefaultConfiguration(v54))
          {
            v113 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              goto LABEL_190;
            *(_WORD *)buf = 0;
            v114 = "MCNewWiFiPayloadHandler cannot establish new service.";
LABEL_189:
            _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_ERROR, v114, buf, 2u);
            goto LABEL_190;
          }
          if (!SCNetworkServiceRemove(v49))
          {
            v113 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              goto LABEL_190;
            *(_WORD *)buf = 0;
            v114 = "MCNewWiFiPayloadHandler cannot remove old service.";
            goto LABEL_189;
          }
          if (!SCNetworkSetAddService(v15, v31))
          {
            v113 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              goto LABEL_190;
            *(_WORD *)buf = 0;
            v114 = "MCNewWiFiPayloadHandler cannot add new service.";
            goto LABEL_189;
          }
        }
      }
LABEL_80:
      ++v48;
    }
    while (v48 < CFArrayGetCount(v47));
    CFRelease(v47);
    if (v31)
      CFRelease(v31);
    v170 = 0;
    v56 = 0;
    a3 = v154;
  }
  v64 = service;
LABEL_113:
  v78 = (const __CFArray *)WiFiManagerClientCopyDevices(self->_manager, v55);
  set = v56;
  if (v78)
  {
    v79 = v78;
    if (CFArrayGetCount(v78))
    {
      v80 = CFArrayGetValueAtIndex(v79, 0);
      InterfaceName = WiFiDeviceClientGetInterfaceName(v80);
      v159 = (void *)objc_claimAutoreleasedReturnValue(InterfaceName);
    }
    else
    {
      v159 = 0;
    }
    CFRelease(v79);
  }
  else
  {
    v159 = 0;
  }
  v82 = SCNetworkSetCopyServices(v15);
  serviceb = v64;
  if (!v82)
    goto LABEL_127;
  v83 = v82;
  v155 = a3;
  if (CFArrayGetCount(v82) < 1)
  {
LABEL_126:
    CFRelease(v83);
    goto LABEL_127;
  }
  v84 = 0;
  while (1)
  {
    v85 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v83, v84);
    v86 = SCNetworkServiceGetInterface(v85);
    if (-[__CFString isEqualToString:]((id)SCNetworkInterfaceGetInterfaceType(v86), "isEqualToString:", kSCNetworkInterfaceTypeIEEE80211))break;
LABEL_125:
    if (++v84 >= CFArrayGetCount(v83))
      goto LABEL_126;
  }
  BSDName = SCNetworkInterfaceGetBSDName(v86);
  v88 = (void *)objc_claimAutoreleasedReturnValue(BSDName);
  if (!objc_msgSend(v88, "isEqualToString:", v159))
  {

    goto LABEL_125;
  }
  v100 = _MCLogObjects[0];
  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v173 = v159;
    _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler found WiFi service matching interface name: %{public}@", buf, 0xCu);
  }

  v101 = (const __SCNetworkService *)CFRetain(v85);
  CFRelease(v83);
  if (!v101)
  {
LABEL_127:
    v89 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler could not find WiFi service in system configuration.", buf, 2u);
    }
    cf = 0;
    v24 = 0;
    v61 = 1;
    v62 = 1;
    v8 = v160;
    a4 = v161;
    goto LABEL_130;
  }
  v102 = SCNetworkSetGetServiceOrder(v15);
  v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
  cf = v101;
  if ((objc_msgSend(v103, "containsObject:", SCNetworkServiceGetServiceID(v101)) & 1) == 0)
  {
    v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v149, "handleFailureInMethod:object:file:lineNumber:description:", v156, self, CFSTR("MCNewWiFiPayloadHandler.m"), 999, CFSTR("MCNewWiFiPayloadHandler's new WiFi service %@ isn't in the new network set"), v101);

  }
  v8 = v160;
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "qosMarkingConfig"));
  if (objc_msgSend(v104, "count") && !SCNetworkInterfaceSetQoSMarkingPolicy(v86, v104))
  {
    v112 = _MCLogObjects[0];
    a4 = v161;
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler could not set WiFi service QoS Marking Policy in system configuration.", buf, 2u);
    }
    v24 = 0;
    v61 = 1;
    v62 = 1;
    goto LABEL_236;
  }
  v24 = SCNetworkServiceCopyProtocol(v101, kSCEntNetProxies);
  a4 = v161;
  v157 = v104;
  if (v24)
  {
    v105 = objc_msgSend(v160, "proxyType");
    if (v105 == 1)
    {
      v106 = (os_log_t)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "proxyPACURLString"));

      if (v115)
      {
        -[NSObject setObject:forKeyedSubscript:](v106, "setObject:forKeyedSubscript:", &off_1000ED1F0, kSCPropNetProxiesProxyAutoConfigEnable);
        v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "proxyPACURLString"));
        -[NSObject setObject:forKeyedSubscript:](v106, "setObject:forKeyedSubscript:", v116, kSCPropNetProxiesProxyAutoConfigURLString);

      }
      else
      {
        -[NSObject setObject:forKeyedSubscript:](v106, "setObject:forKeyedSubscript:", &off_1000ED1F0, kSCPropNetProxiesProxyAutoDiscoveryEnable);
      }
      if (objc_msgSend(v160, "proxyPACFallbackAllowed"))
        v119 = &off_1000ED1F0;
      else
        v119 = &off_1000ED208;
      -[NSObject setObject:forKeyedSubscript:](v106, "setObject:forKeyedSubscript:", v119, kSCPropNetProxiesFallBackAllowed);
      v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
      -[NSObject setObject:forKey:](v106, "setObject:forKey:", v120, CFSTR("HTTPProxyType"));

      a4 = v161;
    }
    else if (v105 == 2)
    {
      v106 = (os_log_t)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "proxyServer"));

      if (v107)
      {
        v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "proxyServer"));
        -[NSObject setObject:forKey:](v106, "setObject:forKey:", v108, kSCPropNetProxiesHTTPProxy);

        v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "proxyServer"));
        -[NSObject setObject:forKey:](v106, "setObject:forKey:", v109, kSCPropNetProxiesHTTPSProxy);

      }
      v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "proxyServerPort"));
      if (v110)
      {
        -[NSObject setObject:forKey:](v106, "setObject:forKey:", v110, kSCPropNetProxiesHTTPPort);
      }
      else
      {
        v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 80));
        -[NSObject setObject:forKey:](v106, "setObject:forKey:", v117, kSCPropNetProxiesHTTPPort);

        a4 = v161;
      }

      v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "proxyServerPort"));
      if (v118)
      {
        -[NSObject setObject:forKey:](v106, "setObject:forKey:", v118, kSCPropNetProxiesHTTPSPort);
      }
      else
      {
        v121 = a4;
        v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 80));
        -[NSObject setObject:forKey:](v106, "setObject:forKey:", v122, kSCPropNetProxiesHTTPSPort);

        a4 = v121;
      }

      v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
      -[NSObject setObject:forKey:](v106, "setObject:forKey:", v123, kSCPropNetProxiesHTTPEnable);

      v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
      -[NSObject setObject:forKey:](v106, "setObject:forKey:", v124, kSCPropNetProxiesHTTPSEnable);

      v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
      -[NSObject setObject:forKey:](v106, "setObject:forKey:", v125, CFSTR("HTTPProxyType"));

    }
    else
    {
      v106 = (os_log_t)-[__CFDictionary mutableCopy](SCNetworkProtocolGetConfiguration(v24), "mutableCopy");
    }
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "proxyUsername"));
    if (v126)
    {

      goto LABEL_208;
    }
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "proxyPassword"));

    if (v127)
    {
LABEL_208:
      v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
      -[NSObject setObject:forKey:](v106, "setObject:forKey:", v128, CFSTR("HTTPProxyAuthenticated"));

      v129 = objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "proxyUsername"));
      v130 = (void *)v129;
      if (v129)
        v131 = (const __CFString *)v129;
      else
        v131 = &stru_1000E4AA0;
      -[NSObject setObject:forKey:](v106, "setObject:forKey:", v131, CFSTR("HTTPProxyUsername"));

      -[NSObject setObject:forKey:](v106, "setObject:forKey:", &stru_1000E4AA0, CFSTR("HTTPProxyPassword"));
    }
    SCNetworkProtocolSetConfiguration(v24, (CFDictionaryRef)v106);
    v132 = _MCLogObjects[0];
    if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v173 = v106;
      _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler set proxy protocol configuration: %{public}@", buf, 0xCu);
    }

  }
  else
  {
    v106 = _MCLogObjects[0];
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot find proxy protocol for the WiFi service.", buf, 2u);
    }
  }

  SCPreferencesCommitChanges(v10);
  SCPreferencesApplyChanges(v10);
  SCPreferencesSynchronize(v10);
  SCPreferencesUnlock(v10);
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "proxyUsername"));

  if (!v133)
  {
    v61 = 0;
LABEL_233:
    Property = WiFiNetworkGetProperty(v155, v158);
    v104 = v157;
    if (Property)
      -[MCNewWiFiPayloadHandler _updateWiFiCustomSetWithSetID:forSSID:](self, "_updateWiFiCustomSetWithSetID:forSSID:", Property, name);
    v62 = 0;
    goto LABEL_236;
  }
  v162 = a4;
  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "proxyUsername"));
  v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "proxyPassword"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialWithUser:password:persistence:](NSURLCredential, "credentialWithUser:password:persistence:", v134, v135, 2));

  v61 = !-[MCNewWiFiPayloadHandler _applyProxyCredential:](self, "_applyProxyCredential:", v136);
  if ((v61 & 1) != 0)
  {
    v138 = v160;
    goto LABEL_226;
  }
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "proxyUsername"));
  v138 = v160;
  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "proxyPassword"));
  v140 = (const void *)CFURLCredentialCreate(0, v137, v139, 0, 3);

  if (!v140)
  {
LABEL_232:

    v8 = v160;
    a4 = v162;
    goto LABEL_233;
  }
  Archive = (const void *)_CFURLCredentialCreateArchive(0, v140);
  if (!Archive)
  {
LABEL_231:
    CFRelease(v140);
    goto LABEL_232;
  }
  v142 = Archive;
  Data = CFPropertyListCreateData(0, Archive, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  CFRelease(v142);
  if (!Data)
  {
    v147 = _MCLogObjects[0];
    if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot serialize credential. Ignoring.", buf, 2u);
    }
    goto LABEL_230;
  }
  v144 = objc_claimAutoreleasedReturnValue(+[NSString MCMakeUUID](NSString, "MCMakeUUID"));
  v152 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "profile"));
  v171 = 0;
  v150 = v144;
  +[MCKeychain setData:forService:account:label:description:useSystemKeychain:outError:](MCKeychain, "setData:forService:account:label:description:useSystemKeychain:outError:", Data, CFSTR("MCWiFiCredential"), v144, 0, 0, objc_msgSend(v151, "isInstalledForSystem"), &v171);
  v145 = v171;

  CFRelease(Data);
  if (!v145)
  {
    v147 = v150;
    objc_msgSend(v160, "setCredentialUUID:", v150);
LABEL_230:

    goto LABEL_231;
  }
  v146 = _MCLogObjects[0];
  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v173 = v145;
    _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot commit credential to keychain with error: %{public}@", buf, 0xCu);
  }

  CFRelease(v140);
  v61 = 1;
LABEL_226:

  v62 = 0;
  v8 = v138;
  a4 = v162;
  v104 = v157;
LABEL_236:

LABEL_130:
  v31 = 0;
LABEL_131:

  v25 = v61 != 0;
  if (v31)
  {
    SCNetworkServiceRemove(v31);
    CFRelease(v31);
  }
  if (v170)
  {
    SCNetworkSetRemove(v170);
    CFRelease(v170);
  }
  if (set)
    CFRelease(set);
  if (!cf)
  {
    if (!v62)
      goto LABEL_140;
LABEL_139:
    SCPreferencesUnlock(v10);
    goto LABEL_140;
  }
  CFRelease(cf);
  if ((v62 & 1) != 0)
    goto LABEL_139;
LABEL_140:
  if (v13)
    CFRelease(v13);
  CFRelease(v10);
  if (v24)
  {
    CFRelease(v24);
    if (v25)
      goto LABEL_144;
LABEL_150:
    v93 = _MCLogObjects[0];
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ssid"));
      *(_DWORD *)buf = 138543362;
      v173 = v98;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler successfully configured WiFi for SSID: %{public}@", buf, 0xCu);

    }
    v97 = 1;
LABEL_153:

    goto LABEL_154;
  }
  if (!v25)
    goto LABEL_150;
LABEL_144:
  v90 = _MCLogObjects[0];
  if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ssid"));
    *(_DWORD *)buf = 138543362;
    v173 = v91;
    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler failed to configure WiFi for SSID: %{public}@", buf, 0xCu);

  }
  if (a4)
  {
    v92 = MCWiFiErrorDomain;
    v93 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("ERROR_WIFI_COULD_NOT_SETUP_PROXY"), "MCAppendGreenteaSuffix"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ssid"));
    v95 = MCErrorArray(v93);
    v96 = (void *)objc_claimAutoreleasedReturnValue(v95);
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v92, 13005, v96, MCErrorTypeFatal, v94, 0));

    v97 = 0;
    goto LABEL_153;
  }
  v97 = 0;
LABEL_154:

  return v97;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  const __CFString *v12;
  const void *v13;
  char v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  os_log_t v23;
  NSObject *v24;
  id *v25;
  void *v26;
  unsigned int v27;
  id v28;
  NSObject *v29;
  _BOOL4 v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  CFBooleanRef v49;
  CFBooleanRef v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  void *i;
  void *v68;
  id v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  os_log_t v74;
  NSObject *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  CFBooleanRef v79;
  void *v80;
  id v81;
  MCNewWiFiPayloadHandler *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  uint64_t v88;
  id *v89;
  void *v90;
  id v91;
  MCNewWiFiPayloadHandler *v92;
  MCNewWiFiPayloadHandler *v93;
  id v94;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  id v100;
  uint8_t v101[128];
  uint8_t buf[4];
  _BYTE v103[10];
  void *v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  void *v108;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v10 = -[MCNewWiFiPayloadHandler _isWiFiDaemonAvailable](self, "_isWiFiDaemonAvailable");
  v11 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("NO");
    if (v10)
      v12 = CFSTR("YES");
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v103 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler Wi-Fi daemon is available (install): %{public}@", buf, 0xCu);
  }
  v13 = (const void *)WiFiNetworkCreate(kCFAllocatorDefault, 0);
  if (!v13 || (self->_manager ? (v14 = v10) : (v14 = 0), (v14 & 1) == 0))
  {
    v29 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v30 = self->_manager != 0;
      *(_DWORD *)buf = 67240704;
      *(_DWORD *)v103 = v13 != 0;
      *(_WORD *)&v103[4] = 1026;
      *(_DWORD *)&v103[6] = v30;
      LOWORD(v104) = 1026;
      *(_DWORD *)((char *)&v104 + 2) = v10;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler cannot create WiFi network. Network? %{public}d, Manager? %{public}d, wifid? %{public}d", buf, 0x14u);
    }
    v31 = MCWiFiErrorDomain;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("ERROR_WIFI_COULD_NOT_CREATE"), "MCAppendGreenteaSuffix"));
    v33 = MCErrorArray(v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v28 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v31, 13003, v34, MCErrorTypeFatal, 0));

LABEL_27:
    if (!v13)
      goto LABEL_29;
    goto LABEL_28;
  }
  WiFiNetworkSetProperty(v13, CFSTR("SSID_STR"), objc_msgSend(v9, "ssid"));
  WiFiNetworkSetProperty(v13, CFSTR("AP_MODE"), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
  WiFiNetworkSetDirectedState(v13, objc_msgSend(v9, "isHidden"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", kMCInstallProfileOptionFilterFlag));
  v16 = objc_msgSend(v15, "intValue");

  if ((v16 & 2) != 0)
  {
    WiFiNetworkSetProperty(v13, kWiFiAddNetworkOriginatorKey, &off_1000ED220);
    v17 = objc_msgSend((id)objc_opt_class(self), "_originatorIdentifierFromInstallationOptions:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (v18)
      WiFiNetworkAddSIMIdentifier(v13, v18);
    v92 = self;
    v19 = objc_msgSend((id)objc_opt_class(self), "_originatorNameFromInstallationOptions:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (v20)
      WiFiNetworkSetOriginatorName(v13, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "isFirstAutoJoinRestricted"));
    v22 = v21;
    if (v21)
      WiFiNetworkDisableAutoJoinUntilFirstUserJoin(v13, objc_msgSend(v21, "BOOLValue"));
    v23 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      v25 = a6;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ssid"));
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)v103 = v26;
      *(_WORD *)&v103[8] = 2114;
      v104 = v20;
      v105 = 2114;
      v106 = v18;
      v107 = 2114;
      v108 = v22;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler Carrier Profile WiFi originator properties: SSID=%{public}@, name=%{public}@, identifier=%{public}@, autojoin=%{public}@", buf, 0x2Au);

      a6 = v25;
    }

    self = v92;
  }
  WiFiNetworkSetProperty(v13, kMCPayloadUUIDKey, objc_msgSend(v9, "UUID"));
  WiFiNetworkSetProperty(v13, kMCPayloadOrganizationKey, objc_msgSend(v9, "organization"));
  WiFiNetworkSetProperty(v13, kMCPayloadIdentifierKey, objc_msgSend(v9, "identifier"));
  if ((objc_msgSend(v9, "isWEP") & 1) == 0 && !objc_msgSend(v9, "isWPA"))
  {
    v28 = 0;
LABEL_38:
    if (objc_msgSend(v9, "captiveBypass"))
      WiFiNetworkSetProperty(v13, CFSTR("CaptiveBypass"), kCFBooleanTrue);
    if (objc_msgSend(v9, "isHotspot"))
      WiFiNetworkSetProperty(v13, kWiFiIsHotspot, kCFBooleanTrue);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domainName"));

    if (v42)
    {
      v43 = kWiFiDomainName;
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domainName"));
      WiFiNetworkSetProperty(v13, v43, v44);

    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "HESSID"));

    if (v45)
    {
      v46 = kWiFiHESSID;
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "HESSID"));
      WiFiNetworkSetProperty(v13, v46, v47);

    }
    v48 = kWiFiSPRoaming;
    v49 = kCFBooleanTrue;
    if (objc_msgSend(v9, "isServiceProviderRoamingEnabled"))
      v50 = kCFBooleanTrue;
    else
      v50 = kCFBooleanFalse;
    WiFiNetworkSetProperty(v13, v48, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "roamingConsortiumOIs"));
    v52 = objc_msgSend(v51, "count");

    if (v52)
    {
      v53 = kWiFiRoamingConsortiumOIs;
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "roamingConsortiumOIs"));
      WiFiNetworkSetProperty(v13, v53, v54);

    }
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NAIRealmNames"));
    v56 = objc_msgSend(v55, "count");

    if (v56)
    {
      v57 = kWiFiNaiRealmName;
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "NAIRealmNames"));
      WiFiNetworkSetProperty(v13, v57, v58);

    }
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "MCCAndMNCs"));
    v60 = objc_msgSend(v59, "count");

    v91 = v8;
    if (v60)
    {
      v89 = a6;
      v93 = self;
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "MCCAndMNCs"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v61, "count")));

      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "MCCAndMNCs"));
      v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
      if (v64)
      {
        v65 = v64;
        v66 = *(_QWORD *)v97;
        do
        {
          for (i = 0; i != v65; i = (char *)i + 1)
          {
            if (*(_QWORD *)v97 != v66)
              objc_enumerationMutation(v63);
            v68 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v68, "characterAtIndex:", 3) == 48)
            {
              v69 = objc_msgSend(v68, "mutableCopy");
              objc_msgSend(v69, "replaceCharactersInRange:withString:", 3, 1, CFSTR("F"));
              objc_msgSend(v62, "addObject:", v69);

            }
            else
            {
              objc_msgSend(v62, "addObject:", v68);
            }
          }
          v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
        }
        while (v65);
      }

      WiFiNetworkSetProperty(v13, kWiFiMCCandMNC, v62);
      self = v93;
      v49 = kCFBooleanTrue;
      a6 = v89;
    }
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayedOperatorName"));

    if (v70)
    {
      v71 = kWiFiDisplayedOperatorName;
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayedOperatorName"));
      WiFiNetworkSetProperty(v13, v71, v72);

    }
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "disableAssociationMACRandomization"));

    if (v73)
    {
      v74 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        v75 = v74;
        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "disableAssociationMACRandomization"));
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v103 = v76;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler setting MAC randomization disable to: %{public}@", buf, 0xCu);

      }
      v77 = kWiFiPrivateMacProfileDefaultFeatureToDisable;
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "disableAssociationMACRandomization"));
      if (objc_msgSend(v78, "BOOLValue"))
        v79 = v49;
      else
        v79 = kCFBooleanFalse;
      WiFiNetworkSetProperty(v13, v77, v79);

    }
    sub_10005B814();
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "password"));
    v81 = objc_msgSend(v80, "length");

    if (!v81)
      goto LABEL_82;
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "password"));
    v82 = self;
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ssid"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](v82, "profileHandler"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "profile"));
    v95 = v28;
    LOWORD(v88) = objc_msgSend(v85, "isInstalledForSystem");
    +[MCKeychain setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](MCKeychain, "setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", v90, CFSTR("AirPort"), v83, 0, 0, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, 0, v88, &v95);
    v86 = v95;

    v8 = v91;
    self = v82;

    v28 = v86;
    if (!v86)
    {
LABEL_82:
      if (!-[MCNewWiFiPayloadHandler _networkServiceRequired](self, "_networkServiceRequired")
        || (v94 = v28,
            -[MCNewWiFiPayloadHandler _configureNetworkServiceForWiFiNetwork:outError:](self, "_configureNetworkServiceForWiFiNetwork:outError:", v13, &v94), v87 = v94, v28, (v28 = v87) == 0))
      {
        WiFiManagerClientAddNetwork(self->_manager, v13);
        if ((objc_msgSend(v9, "autoJoin") & 1) == 0)
        {
          WiFiManagerClientDisableNetwork(self->_manager, v13);
          WiFiManagerClientEnable(self->_manager);
        }
      }
    }
    goto LABEL_27;
  }
  v100 = 0;
  v27 = -[MCNewWiFiPayloadHandler _configureEncryptionTypeForWiFiNetwork:payload:outError:](self, "_configureEncryptionTypeForWiFiNetwork:payload:outError:", v13, v9, &v100);
  v28 = v100;
  if (v27)
    goto LABEL_38;
LABEL_28:
  CFRelease(v13);
LABEL_29:
  v35 = _MCLogObjects[0];
  if (v28)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v103 = v28;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler failed installWithInstaller with error: %{public}@", buf, 0xCu);
    }
    if (a6)
    {
      v36 = MCWiFiErrorDomain;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("ERROR_WIFI_COULD_NOT_INSTALL"), "MCAppendGreenteaSuffix"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ssid"));
      v39 = MCErrorArray(v37);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v36, 13000, v40, v28, MCErrorTypeFatal, v38, 0));

    }
  }
  else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler successfully completed installWithInstaller with no errors.", buf, 2u);
  }

  return v28 == 0;
}

+ (id)_originatorIdentifierFromInstallationOptions:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", kMCInstallProfileOptionCarrierIdentifier));
  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

+ (id)_originatorNameFromInstallationOptions:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", kMCInstallProfileOptionCarrierName));
  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (BOOL)isInstalled
{
  __WiFiManagerClient *manager;
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  char v9;
  uint64_t v10;
  const void *ValueAtIndex;
  uint64_t Property;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;

  manager = self->_manager;
  if (manager && (v4 = (const __CFArray *)WiFiManagerClientCopyNetworks(manager, a2)) != 0)
  {
    v5 = v4;
    Count = CFArrayGetCount(v4);
    if (Count < 1)
    {
      v9 = 0;
    }
    else
    {
      v7 = Count;
      v8 = 0;
      v9 = 0;
      v10 = kMCPayloadUUIDKey;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, v8);
        if (ValueAtIndex)
        {
          Property = WiFiNetworkGetProperty(ValueAtIndex, v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue(Property);
          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUID"));
            v16 = objc_msgSend(v13, "isEqualToString:", v15) ^ 1;

          }
          else
          {
            LOBYTE(v16) = 1;
          }
          v9 |= v16;

        }
        ++v8;
      }
      while (v7 != v8);
    }
    CFRelease(v5);
  }
  else
  {
    v9 = 0;
  }
  return v9 & 1;
}

- (BOOL)_isWiFiDaemonAvailable
{
  __WiFiManagerClient *manager;
  const __CFArray *v3;
  const __CFArray *v4;
  BOOL v5;

  manager = self->_manager;
  if (!manager)
    return 0;
  v3 = (const __CFArray *)WiFiManagerClientCopyDevices(manager, a2);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CFArrayGetCount(v3) > 0;
  CFRelease(v4);
  return v5;
}

- (void)_removeProxyCredential
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSString *v23;
  void *v24;
  NSString *v25;
  void *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "proxyServer"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(v3, "proxyType");

    if (v6 == 2)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "proxyServerPort"));
      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "proxyServerPort"));
        v9 = (int)objc_msgSend(v8, "intValue");

      }
      else
      {
        v9 = 80;
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredentialStorage sharedCredentialStorage](NSURLCredentialStorage, "sharedCredentialStorage"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
      objc_msgSend(v10, "set_useSystemKeychain:", objc_msgSend(v12, "isInstalledForSystem"));

      v13 = objc_alloc((Class)NSURLProtectionSpace);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "proxyServer"));
      v15 = objc_msgSend(v13, "initWithProxyHost:port:type:realm:authenticationMethod:", v14, v9, NSURLProtectionSpaceHTTP, 0, NSURLAuthenticationMethodDefault);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "defaultCredentialForProtectionSpace:", v15));
      if (v16)
      {
        v25 = NSURLCredentialStorageRemoveSynchronizableCredentials;
        v26 = &__kCFBooleanTrue;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
        objc_msgSend(v10, "removeCredential:forProtectionSpace:options:", v16, v15, v17);

      }
      v18 = objc_alloc((Class)NSURLProtectionSpace);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "proxyServer"));
      v20 = objc_msgSend(v18, "initWithProxyHost:port:type:realm:authenticationMethod:", v19, v9, NSURLProtectionSpaceHTTPS, 0, NSURLAuthenticationMethodDefault);

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "defaultCredentialForProtectionSpace:", v20));
      if (v21)
      {
        v23 = NSURLCredentialStorageRemoveSynchronizableCredentials;
        v24 = &__kCFBooleanTrue;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
        objc_msgSend(v10, "removeCredential:forProtectionSpace:options:", v21, v20, v22);

      }
    }
  }

}

- (void)_removeNetworkWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  __WiFiManagerClient *manager;
  const __CFArray *v8;
  const __CFArray *v9;
  CFIndex Count;
  NSObject *v11;
  CFIndex v12;
  uint64_t v13;
  const void *ValueAtIndex;
  uint64_t Property;
  void *v16;
  uint64_t SSID;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  MCNewWiFiPayloadHandler *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;

  v4 = a3;
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler removing WiFi network with UUID: %{public}@", buf, 0xCu);
  }
  manager = self->_manager;
  if (manager)
  {
    v8 = (const __CFArray *)WiFiManagerClientCopyNetworks(manager, v6);
    if (v8)
    {
      v9 = v8;
      v22 = self;
      Count = CFArrayGetCount(v8);
      v11 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v24) = Count;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler iterating over %d WiFi networks", buf, 8u);
      }
      if (Count >= 1)
      {
        v12 = 0;
        v13 = kMCPayloadUUIDKey;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v9, v12);
          Property = WiFiNetworkGetProperty(ValueAtIndex, v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue(Property);
          SSID = WiFiNetworkGetSSID(ValueAtIndex);
          v18 = (void *)objc_claimAutoreleasedReturnValue(SSID);
          v19 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v24 = v18;
            v25 = 2114;
            v26 = v16;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "MCNewWiFiPayloadHandler considering WiFi network \"%{public}@\" with payload UUID: %{public}@", buf, 0x16u);
          }
          if (v16 && objc_msgSend(v16, "isEqualToString:", v4))
            break;

          if (Count == ++v12)
            goto LABEL_20;
        }
        v21 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v24 = v18;
          v25 = 2114;
          v26 = v16;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler calling WiFiManagerClientRemoveNetwork() for WiFi network \"%{public}@\" with payload UUID: %{public}@", buf, 0x16u);
        }
        WiFiNetworkIsEAP(ValueAtIndex);
        WiFiManagerClientRemoveNetwork(v22->_manager, ValueAtIndex);

      }
LABEL_20:
      CFRelease(v9);
    }
    else
    {
      v20 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "MCNewWiFiPayloadHandler WiFiManagerClientCopyNetworks returned nil.", buf, 2u);
      }
    }
    sub_10005B814();
  }

}

- (void)setAside
{
  __WiFiManagerClient *manager;
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  uint64_t v9;
  const void *ValueAtIndex;
  uint64_t Property;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  NSString *v16;
  NSString *setAsideUUID;
  id v18;

  manager = self->_manager;
  if (manager)
  {
    v4 = (const __CFArray *)WiFiManagerClientCopyNetworks(manager, a2);
    if (v4)
    {
      v5 = v4;
      Count = CFArrayGetCount(v4);
      if (Count >= 1)
      {
        v7 = Count;
        v8 = 0;
        v9 = kMCPayloadUUIDKey;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v5, v8);
          Property = WiFiNetworkGetProperty(ValueAtIndex, v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue(Property);
          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
            v15 = objc_msgSend(v12, "isEqualToString:", v14);

            if (v15)
              break;
          }

          if (v7 == ++v8)
            goto LABEL_11;
        }
        v16 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString MCMakeUUID](NSString, "MCMakeUUID"));
        setAsideUUID = self->_setAsideUUID;
        self->_setAsideUUID = v16;

        WiFiNetworkSetProperty(ValueAtIndex, v9, self->_setAsideUUID);
        WiFiManagerClientUpdateNetwork(self->_manager, ValueAtIndex);
        WiFiNetworkIsEAP(ValueAtIndex);

      }
LABEL_11:
      CFRelease(v5);
    }
    v18 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    if (objc_msgSend(v18, "proxyType") == 2)
      -[MCNewWiFiPayloadHandler _removeProxyCredential](self, "_removeProxyCredential");
    sub_10005B814();

  }
}

- (void)unsetAside
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  const __CFArray *v6;
  const __CFArray *v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  uint64_t v11;
  const void *ValueAtIndex;
  uint64_t Property;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSString *setAsideUUID;
  void *v20;
  void *v21;
  void *v22;
  const __CFData *v23;
  CFPropertyListRef v24;
  const void *v25;
  uint64_t v26;
  const void *v27;
  uint64_t Username;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  if (self->_manager)
  {
    v32 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v4 = objc_msgSend(v3, "isSetAside");

    if (v4)
    {
      v6 = (const __CFArray *)WiFiManagerClientCopyNetworks(self->_manager, v5);
      if (v6)
      {
        v7 = v6;
        Count = CFArrayGetCount(v6);
        if (Count >= 1)
        {
          v9 = Count;
          v10 = 0;
          v11 = kMCPayloadUUIDKey;
          while (1)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v7, v10);
            Property = WiFiNetworkGetProperty(ValueAtIndex, v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue(Property);
            v15 = v14;
            if (v14)
            {
              if (objc_msgSend(v14, "isEqualToString:", self->_setAsideUUID))
                break;
            }

            if (v9 == ++v10)
              goto LABEL_14;
          }
          WiFiNetworkSetProperty(ValueAtIndex, v11, objc_msgSend(v32, "UUID"));
          WiFiManagerClientUpdateNetwork(self->_manager, ValueAtIndex);
          v16 = WiFiNetworkGetProperty(ValueAtIndex, kWiFiPreferenceCustomNetworksSettingsKey);
          if (v16)
          {
            v17 = v16;
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ssid"));
            -[MCNewWiFiPayloadHandler _updateWiFiCustomSetWithSetID:forSSID:](self, "_updateWiFiCustomSetWithSetID:forSSID:", v17, v18);

          }
          WiFiNetworkIsEAP(ValueAtIndex);

        }
LABEL_14:
        CFRelease(v7);
      }
      sub_10005B814();
      setAsideUUID = self->_setAsideUUID;
      self->_setAsideUUID = 0;

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "credentialUUID"));
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "profile"));
      v23 = (const __CFData *)+[MCKeychain dataFromService:account:label:description:useSystemKeychain:outError:](MCKeychain, "dataFromService:account:label:description:useSystemKeychain:outError:", CFSTR("MCWiFiCredential"), v20, 0, 0, objc_msgSend(v22, "isInstalledForSystem"), 0);

      if (v23)
      {
        v24 = CFPropertyListCreateWithData(0, v23, 0, 0, 0);
        if (v24)
        {
          v25 = v24;
          v26 = _CFURLCredentialCreateFromArchive(0, v24);
          if (v26)
          {
            v27 = (const void *)v26;
            Username = CFURLCredentialGetUsername();
            v29 = (void *)objc_claimAutoreleasedReturnValue(Username);
            v30 = (void *)CFURLCredentialCopyPassword(v27);
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialWithUser:password:persistence:](NSURLCredential, "credentialWithUser:password:persistence:", v29, v30, 2));
            -[MCNewWiFiPayloadHandler _applyProxyCredential:](self, "_applyProxyCredential:", v31);
            CFRelease(v27);

          }
          CFRelease(v25);
        }
      }
    }

  }
}

- (void)remove
{
  void *v3;
  unsigned int v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  NSObject *v10;
  unsigned int v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  NSString *setAsideUUID;
  NSObject *v18;
  const char *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  const __CFString *v27;
  __int16 v28;
  NSString *v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");
  v5 = &stru_1000E4AA0;
  if (v4)
    v5 = CFSTR("set-aside ");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  if (objc_msgSend(v7, "isSetAside"))
  {
    v8 = self->_setAsideUUID;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));

  }
  v10 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138543618;
    v27 = v6;
    v28 = 2114;
    v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler removing %{public}@WiFi payload with UUID: %{public}@", (uint8_t *)&v26, 0x16u);
  }
  v11 = -[MCNewWiFiPayloadHandler _isWiFiDaemonAvailable](self, "_isWiFiDaemonAvailable");
  v12 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("NO");
    if (v11)
      v13 = CFSTR("YES");
    v26 = 138543362;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler Wi-Fi daemon is available (remove): %{public}@", (uint8_t *)&v26, 0xCu);
  }
  if (!self->_manager)
  {
    v18 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v26 = 138543618;
    v27 = v6;
    v28 = 2114;
    v29 = v8;
    v19 = "MCNewWiFiPayloadHandler unable to remove %{public}@WiFi payload with UUID: %{public}@ - no manager";
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v26, 0x16u);
    goto LABEL_27;
  }
  if ((v11 & 1) == 0)
  {
    v18 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v26 = 138543618;
    v27 = v6;
    v28 = 2114;
    v29 = v8;
    v19 = "MCNewWiFiPayloadHandler unable to remove %{public}@WiFi payload with UUID: %{public}@ - wifid not available";
    goto LABEL_20;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v16 = objc_msgSend(v15, "isSetAside");

  if (v16)
  {
    -[MCNewWiFiPayloadHandler _removeNetworkWithUUID:](self, "_removeNetworkWithUUID:", self->_setAsideUUID);
    setAsideUUID = self->_setAsideUUID;
    self->_setAsideUUID = 0;

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "UUID"));
    -[MCNewWiFiPayloadHandler _removeNetworkWithUUID:](self, "_removeNetworkWithUUID:", v21);

    -[MCNewWiFiPayloadHandler _removeProxyCredential](self, "_removeProxyCredential");
  }
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "credentialUUID"));
  if (v22)
  {
    v23 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138543362;
      v27 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "MCNewWiFiPayloadHandler removing credential with UUID: %{public}@", (uint8_t *)&v26, 0xCu);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "profile"));
    +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:](MCKeychain, "removeItemForService:account:label:description:useSystemKeychain:group:", CFSTR("MCWiFiCredential"), v22, 0, 0, objc_msgSend(v25, "isInstalledForSystem"), 0);

  }
LABEL_27:

}

+ (id)managedWiFiNetworkNames
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  const __CFArray *v6;
  const __CFArray *v7;
  CFIndex Count;
  NSObject *v9;
  CFIndex v10;
  uint64_t v11;
  const void *ValueAtIndex;
  const void *v13;
  uint64_t SSID;
  os_log_t v15;
  NSObject *v16;
  const char *v17;
  os_log_t v18;
  os_log_t v19;
  NSObject *v20;
  int v22;
  CFIndex v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = qword_1000FD938;
  if (qword_1000FD938)
    goto LABEL_5;
  qword_1000FD938 = WiFiManagerClientCreate(kCFAllocatorSystemDefault, 0);
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    v22 = 67109120;
    LODWORD(v23) = qword_1000FD938 != 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "MCNewWiFiPayloadHandler attempted to create WiFiManagerClient and got success status: %d", (uint8_t *)&v22, 8u);
  }
  v4 = qword_1000FD938;
  if (qword_1000FD938)
  {
LABEL_5:
    v6 = (const __CFArray *)WiFiManagerClientCopyNetworks(v4, v2);
    v7 = v6;
    if (v6)
      Count = CFArrayGetCount(v6);
    else
      Count = 0;
    v9 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      v22 = 134217984;
      v23 = Count;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "MCNewWiFiPayloadHandler checking %ld networks for profile-installed configurations...", (uint8_t *)&v22, 0xCu);
    }
    if (Count >= 1)
    {
      v10 = 0;
      v11 = kMCPayloadUUIDKey;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v7, v10);
        if (ValueAtIndex)
        {
          v13 = ValueAtIndex;
          if (WiFiNetworkGetProperty(ValueAtIndex, v11))
          {
            SSID = WiFiNetworkGetSSID(v13);
            if (SSID)
            {
              objc_msgSend(v3, "addObject:", SSID);
            }
            else
            {
              v19 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
              {
                LOWORD(v22) = 0;
                v16 = v19;
                v17 = "MCNewWiFiPayloadHandler skipped Wi-Fi network missing SSID";
                goto LABEL_22;
              }
            }
          }
          else
          {
            v18 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v22) = 0;
              v16 = v18;
              v17 = "MCNewWiFiPayloadHandler skipped Wi-Fi network missing UUID";
              goto LABEL_22;
            }
          }
        }
        else
        {
          v15 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            LOWORD(v22) = 0;
            v16 = v15;
            v17 = "MCNewWiFiPayloadHandler skipped non-existent Wi-Fi network";
LABEL_22:
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&v22, 2u);
          }
        }
        ++v10;
      }
      while (Count != v10);
    }
    if (v7)
      CFRelease(v7);
  }
  v20 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    v22 = 138543362;
    v23 = (CFIndex)v3;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "MCNewWiFiPayloadHandler managed Wi-Fi networks: %{public}@", (uint8_t *)&v22, 0xCu);
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setAsideUUID, 0);
}

@end
