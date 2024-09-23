@implementation MCGlobalEthernetPayloadHandler

- (MCGlobalEthernetPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCGlobalEthernetPayloadHandler;
  return -[MCNewPayloadHandler initWithPayload:profileHandler:](&v5, "initWithPayload:profileHandler:", a3, a4);
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

- (BOOL)_install:(id)a3 username:(id)a4 password:(id)a5 identity:(__SecIdentity *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  const void *v15;
  uint64_t SystemEthernetProfile;
  uint64_t v17;
  const void *v18;
  uint64_t ID;
  const void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  const void *v25;
  BOOL v26;
  os_log_t v27;
  NSObject *v28;
  id v29;
  os_log_t v30;
  NSObject *v31;
  id v32;
  const char *v33;
  os_log_t v34;
  os_log_t v35;
  NSObject *v36;
  id v37;
  os_log_t v38;
  NSObject *v39;
  id v40;
  os_log_t v41;
  NSObject *v42;
  id v43;
  os_log_t v44;
  id v45;
  const char *v46;
  os_log_t v47;
  os_log_t v48;
  os_log_t v49;
  const void *v51;
  uint8_t buf[4];
  id v53;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v14 = EAPOLClientConfigurationCreateWithAuthorization(0, 0);
  if (v14)
  {
    v15 = (const void *)v14;
    SystemEthernetProfile = EAPOLClientConfigurationGetSystemEthernetProfile();
    if (SystemEthernetProfile
      && !-[MCGlobalEthernetPayloadHandler _isMetadataValid:](self, "_isMetadataValid:", SystemEthernetProfile))
    {
      v30 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v31 = v30;
        *(_DWORD *)buf = 138543362;
        v53 = (id)objc_opt_class(self);
        v32 = v53;
        v33 = "%{public}@ payload of this type is already installed";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v33, buf, 0xCu);

      }
    }
    else
    {
      v17 = EAPOLClientProfileCreate(v15);
      if (v17)
      {
        v18 = (const void *)v17;
        ID = EAPOLClientProfileGetID(v17);
        if (!ID)
        {
          v35 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            v36 = v35;
            *(_DWORD *)buf = 138543362;
            v53 = (id)objc_opt_class(self);
            v37 = v53;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientProfileGetID() returned NULL", buf, 0xCu);

          }
          v26 = 0;
          goto LABEL_49;
        }
        v20 = (const void *)ID;
        v21 = EAPOLClientItemIDCreateWithProfile(v18);
        if (!v21)
        {
          v38 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            v39 = v38;
            *(_DWORD *)buf = 138543362;
            v53 = (id)objc_opt_class(self);
            v40 = v53;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientItemIDCreateWithProfile() returned NULL", buf, 0xCu);

          }
          v26 = 0;
          goto LABEL_48;
        }
        v51 = (const void *)v21;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "displayName"));

        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "displayName"));
          EAPOLClientProfileSetUserDefinedName(v18, v23);

        }
        EAPOLClientProfileSetAuthenticationProperties(v18, v10);
        v24 = objc_claimAutoreleasedReturnValue(-[MCGlobalEthernetPayloadHandler profileMetadata](self, "profileMetadata"));
        if (v24
          && !EAPOLClientProfileSetInformation(v18, CFSTR("com.apple.managedconfiguration.profiled"), v24))
        {
          v41 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            v42 = v41;
            *(_DWORD *)buf = 138543362;
            v53 = (id)objc_opt_class(self);
            v43 = v53;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientProfileSetInformation() failed", buf, 0xCu);

          }
          goto LABEL_45;
        }

        v25 = v51;
        if (v11 && v12 && !EAPOLClientItemIDSetPasswordItem(v51, 3, v11, v12))
        {
          v48 = _MCLogObjects[0];
          if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            goto LABEL_46;
          v24 = v48;
          *(_DWORD *)buf = 138543362;
          v53 = (id)objc_opt_class(self);
          v45 = v53;
          v46 = "%{public}@ EAPOLClientItemIDSetPasswordItem() failed";
        }
        else if (a6 && !EAPOLClientItemIDSetIdentity(v51, 3))
        {
          v47 = _MCLogObjects[0];
          if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            goto LABEL_46;
          v24 = v47;
          *(_DWORD *)buf = 138543362;
          v53 = (id)objc_opt_class(self);
          v45 = v53;
          v46 = "%{public}@ EAPOLClientItemIDSetIdentity() failed";
        }
        else
        {
          if (EAPOLClientConfigurationSetSystemEthernetProfile(v15, v18))
          {
            if (EAPOLClientConfigurationSave(v15))
            {
              v26 = 1;
LABEL_47:
              CFRelease(v25);
LABEL_48:
              CFRelease(v20);
LABEL_49:
              CFRelease(v18);
              goto LABEL_50;
            }
            v49 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              v24 = v49;
              *(_DWORD *)buf = 138543362;
              v53 = (id)objc_opt_class(self);
              v45 = v53;
              v46 = "%{public}@ EAPOLClientConfigurationSave() failed";
              goto LABEL_44;
            }
LABEL_46:
            v26 = 0;
            v25 = v51;
            goto LABEL_47;
          }
          v44 = _MCLogObjects[0];
          if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            goto LABEL_46;
          v24 = v44;
          *(_DWORD *)buf = 138543362;
          v53 = (id)objc_opt_class(self);
          v45 = v53;
          v46 = "%{public}@ EAPOLClientConfigurationSetSystemEthernetProfile() failed";
        }
LABEL_44:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v46, buf, 0xCu);

LABEL_45:
        goto LABEL_46;
      }
      v34 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        v31 = v34;
        *(_DWORD *)buf = 138543362;
        v53 = (id)objc_opt_class(self);
        v32 = v53;
        v33 = "%{public}@ EAPOLClientProfileCreate() returned NULL";
        goto LABEL_26;
      }
    }
    v26 = 0;
LABEL_50:
    CFRelease(v15);
    goto LABEL_51;
  }
  v27 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v28 = v27;
    *(_DWORD *)buf = 138543362;
    v53 = (id)objc_opt_class(self);
    v29 = v53;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL", buf, 0xCu);

  }
  v26 = 0;
LABEL_51:

  return v26;
}

- (BOOL)_uninstall
{
  void *v3;
  uint64_t v4;
  const void *v5;
  uint64_t ProfileWithID;
  os_log_t v7;
  NSObject *v8;
  id v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  os_log_t v14;
  NSObject *v15;
  id v16;
  os_log_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  os_log_t v21;
  NSObject *v22;
  id v23;
  const char *v24;
  os_log_t v25;
  os_log_t v26;
  os_log_t v28;
  NSObject *v29;
  void *v30;
  id v31;
  const char *v32;
  os_log_t v33;
  void *v34;
  os_log_t v35;
  void *v36;
  int v37;
  id v38;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = EAPOLClientConfigurationCreateWithAuthorization(0, 0);
  if (v4)
  {
    v5 = (const void *)v4;
    if (self->_setAsideProfileID)
      ProfileWithID = EAPOLClientConfigurationGetProfileWithID(v4);
    else
      ProfileWithID = EAPOLClientConfigurationGetSystemEthernetProfile(v4);
    v11 = ProfileWithID;
    if (ProfileWithID)
    {
      if (-[MCGlobalEthernetPayloadHandler _isMetadataValid:](self, "_isMetadataValid:", ProfileWithID))
      {
        v12 = EAPOLClientItemIDCreateWithProfile(v11);
        if (v12)
        {
          v13 = (const void *)v12;
          if (!EAPOLClientItemIDRemovePasswordItem(v12, 3))
          {
            v14 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v15 = v14;
              v37 = 138543362;
              v38 = (id)objc_opt_class(self);
              v16 = v38;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ EAPOLClientItemIDRemovePasswordItem() failed", (uint8_t *)&v37, 0xCu);

            }
          }
          if (!EAPOLClientItemIDSetIdentity(v13, 3))
          {
            v17 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v18 = v17;
              v19 = (void *)objc_opt_class(self);
              v37 = 138543362;
              v38 = v19;
              v20 = v19;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ EAPOLClientItemIDSetIdentity() failed", (uint8_t *)&v37, 0xCu);

            }
          }
          if (self->_setAsideProfileID || EAPOLClientConfigurationSetSystemEthernetProfile(v5, 0))
          {
            if (EAPOLClientConfigurationRemoveProfile(v5, v11))
            {
              if (EAPOLClientConfigurationSave(v5))
              {
                v10 = 1;
LABEL_40:
                CFRelease(v13);
                goto LABEL_30;
              }
              v33 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              {
                v29 = v33;
                v34 = (void *)objc_opt_class(self);
                v37 = 138543362;
                v38 = v34;
                v31 = v34;
                v32 = "%{public}@ EAPOLClientConfigurationSave() failed";
                goto LABEL_38;
              }
            }
            else
            {
              v28 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              {
                v29 = v28;
                v30 = (void *)objc_opt_class(self);
                v37 = 138543362;
                v38 = v30;
                v31 = v30;
                v32 = "%{public}@ EAPOLClientConfigurationRemoveProfile() failed";
LABEL_38:
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v37, 0xCu);

              }
            }
          }
          else
          {
            v35 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              v29 = v35;
              v36 = (void *)objc_opt_class(self);
              v37 = 138543362;
              v38 = v36;
              v31 = v36;
              v32 = "%{public}@ EAPOLClientConfigurationSetSystemEthernetProfile() failed";
              goto LABEL_38;
            }
          }
          v10 = 0;
          goto LABEL_40;
        }
        v26 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          v22 = v26;
          v37 = 138543362;
          v38 = (id)objc_opt_class(self);
          v23 = v38;
          v24 = "%{public}@ EAPOLClientItemIDCreateWithProfile() returned NULL";
          goto LABEL_28;
        }
LABEL_29:
        v10 = 0;
LABEL_30:
        CFRelease(v5);
        goto LABEL_31;
      }
      v25 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      v22 = v25;
      v37 = 138543362;
      v38 = (id)objc_opt_class(self);
      v23 = v38;
      v24 = "%{public}@ metadata validation failed";
    }
    else
    {
      v21 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      v22 = v21;
      v37 = 138543362;
      v38 = (id)objc_opt_class(self);
      v23 = v38;
      v24 = "%{public}@ failed to find EAP profile";
    }
LABEL_28:
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v37, 0xCu);

    goto LABEL_29;
  }
  v7 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v8 = v7;
    v37 = 138543362;
    v38 = (id)objc_opt_class(self);
    v9 = v38;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL", (uint8_t *)&v37, 0xCu);

  }
  v10 = 0;
LABEL_31:

  return v10;
}

- (BOOL)_setEAPConfig:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  os_log_t v10;
  NSObject *v11;
  id v12;
  const char *v13;
  os_log_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __SecCertificate *v26;
  __SecCertificate *v27;
  CFDataRef v28;
  os_log_t v29;
  NSObject *v30;
  void *v31;
  id v32;
  os_log_t v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  os_log_t v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  os_log_t v49;
  NSObject *v50;
  void *v51;
  id v52;
  BOOL v53;
  os_log_t v54;
  NSObject *v55;
  void *v56;
  id v57;
  os_log_t v58;
  NSObject *v59;
  void *v60;
  id v61;
  int v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  id obj;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  CFTypeRef cf;
  uint8_t buf[4];
  id v75;
  __int16 v76;
  id v77;
  __int16 v78;
  int v79;
  _BYTE v80[128];

  v4 = a3;
  cf = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v6 = objc_msgSend(v4, "mutableCopy");
  if (objc_msgSend(v5, "usernameRequired")
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username")), v7, !v7))
  {
    v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      *(_DWORD *)buf = 138543362;
      v75 = (id)objc_opt_class(self);
      v12 = v75;
      v13 = "%{public}@ username is not available";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);

    }
  }
  else
  {
    if (!objc_msgSend(v5, "passwordRequired")
      || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "password")), v8, v8))
    {
      v9 = 1;
      goto LABEL_12;
    }
    v14 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v11 = v14;
      *(_DWORD *)buf = 138543362;
      v75 = (id)objc_opt_class(self);
      v12 = v75;
      v13 = "%{public}@ password is not available";
      goto LABEL_10;
    }
  }
  v9 = 0;
LABEL_12:
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("TLSTrustedCertificates")));

  if (v15)
  {
    if (!v9)
      goto LABEL_48;
  }
  else
  {
    v63 = v9;
    v64 = v6;
    v66 = v4;
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v65 = v5;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "payloadCertificateAnchorUUIDs"));
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v70 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "persistentIDForCertificateUUID:", v20));

          if (v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "profile"));
            v25 = objc_msgSend(v24, "isInstalledForSystem");

            v26 = (__SecCertificate *)+[MCKeychain copyCertificateWithPersistentID:useSystemKeychain:](MCKeychain, "copyCertificateWithPersistentID:useSystemKeychain:", v22, v25);
            if (v26)
            {
              v27 = v26;
              v28 = SecCertificateCopyData(v26);
              if (v28)
              {
                v29 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                {
                  v30 = v29;
                  v31 = (void *)objc_opt_class(self);
                  *(_DWORD *)buf = 138543874;
                  v75 = v31;
                  v76 = 2114;
                  v77 = v20;
                  v78 = 1026;
                  v79 = (int)v25;
                  v32 = v31;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ adding trusted certificate UUID %{public}@ with system keychain? %{public}d", buf, 0x1Cu);

                }
                objc_msgSend(v67, "addObject:", v28);
              }

              CFRelease(v27);
            }
          }
          else
          {
            v33 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v34 = v33;
              v35 = (void *)objc_opt_class(self);
              *(_DWORD *)buf = 138543618;
              v75 = v35;
              v76 = 2114;
              v77 = v20;
              v36 = v35;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ certificate UUID %{public}@ referenced by this payload does not exist, skipping.", buf, 0x16u);

            }
          }

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
      }
      while (v17);
    }

    v6 = v64;
    if (objc_msgSend(v67, "count"))
      objc_msgSend(v64, "setObject:forKey:", v67, CFSTR("TLSTrustedCertificates"));

    v5 = v65;
    v4 = v66;
    if (!v63)
      goto LABEL_48;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "certificateUUID"));

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "certificateUUID"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "persistentIDForCertificateUUID:", v39));

    v41 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      v43 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543618;
      v75 = v43;
      v76 = 1026;
      LODWORD(v77) = v40 != 0;
      v44 = v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ handling identity certs? %{public}d", buf, 0x12u);

    }
    if (v40 && (EAPSecIdentityHandleCreateSecIdentity(v40, &cf) || !cf))
    {
      v54 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        v55 = v54;
        v56 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138543362;
        v75 = v56;
        v57 = v56;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}@ EAPSecIdentityHandleCreateSecIdentity() failed", buf, 0xCu);

      }
      goto LABEL_48;
    }

  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "dataUsingEncoding:", 4));

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "password"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "dataUsingEncoding:", 4));

  LODWORD(v47) = -[MCGlobalEthernetPayloadHandler _install:username:password:identity:](self, "_install:username:password:identity:", v6, v46, v48, cf);
  if (!(_DWORD)v47)
  {
LABEL_48:
    v58 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v59 = v58;
      v60 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      v75 = v60;
      v61 = v60;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%{public}@ installation failed.", buf, 0xCu);

    }
    v53 = 0;
    goto LABEL_51;
  }
  v49 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v50 = v49;
    v51 = (void *)objc_opt_class(self);
    *(_DWORD *)buf = 138543618;
    v75 = v51;
    v76 = 2114;
    v77 = v6;
    v52 = v51;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ installation succeeded with EAP profile: %{public}@", buf, 0x16u);

  }
  v53 = 1;
LABEL_51:
  if (cf)
    CFRelease(cf);

  return v53;
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
  Information = EAPOLClientProfileGetInformation(a3, CFSTR("com.apple.managedconfiguration.profiled"));
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

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4, a5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eapClientConfiguration"));

  if (!v9)
    goto LABEL_6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eapClientConfiguration"));
  v11 = -[MCGlobalEthernetPayloadHandler _setEAPConfig:](self, "_setEAPConfig:", v10);

  if ((v11 & 1) == 0)
  {
    if (!a6)
      goto LABEL_7;
    v12 = MCGlobalEthernetErrorDomain;
    v13 = MCErrorArray(CFSTR("ERROR_GLOBAL_ETHERNET_INSTALL_FAILURE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v12, 62000, v14, MCErrorTypeFatal, 0));

LABEL_6:
    LOBYTE(a6) = 0;
    goto LABEL_7;
  }
  LOBYTE(a6) = 1;
LABEL_7:

  return (char)a6;
}

- (void)remove
{
  os_log_t v3;
  NSObject *v4;
  id v5;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSString *setAsideProfileID;
  int v11;
  id v12;

  if (!-[MCGlobalEthernetPayloadHandler _uninstall](self, "_uninstall"))
  {
    v3 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      v11 = 138543362;
      v12 = (id)objc_opt_class(self);
      v5 = v12;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}@ uninstallation failed.", (uint8_t *)&v11, 0xCu);

    }
  }
  v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    v7 = v6;
    v8 = (void *)objc_opt_class(self);
    v11 = 138543362;
    v12 = v8;
    v9 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}@ uninstallation succeeded", (uint8_t *)&v11, 0xCu);

  }
  setAsideProfileID = self->_setAsideProfileID;
  self->_setAsideProfileID = 0;

}

- (void)setAside
{
  void *v3;
  NSString *setAsideProfileID;
  uint64_t v5;
  const void *v6;
  uint64_t SystemEthernetProfile;
  uint64_t v8;
  uint64_t ID;
  NSString *v10;
  NSString *v11;
  os_log_t v12;
  NSObject *v13;
  id v14;
  const char *v15;
  os_log_t v16;
  NSObject *v17;
  id v18;
  os_log_t v19;
  os_log_t v20;
  os_log_t v21;
  os_log_t v22;
  int v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  setAsideProfileID = self->_setAsideProfileID;
  self->_setAsideProfileID = 0;

  v5 = EAPOLClientConfigurationCreateWithAuthorization(0, 0);
  if (v5)
  {
    v6 = (const void *)v5;
    SystemEthernetProfile = EAPOLClientConfigurationGetSystemEthernetProfile(v5);
    if (SystemEthernetProfile)
    {
      v8 = SystemEthernetProfile;
      if (-[MCGlobalEthernetPayloadHandler _isMetadataValid:](self, "_isMetadataValid:", SystemEthernetProfile))
      {
        ID = EAPOLClientProfileGetID(v8);
        v10 = (NSString *)objc_claimAutoreleasedReturnValue(ID);
        v11 = self->_setAsideProfileID;
        self->_setAsideProfileID = v10;

        if (self->_setAsideProfileID)
        {
          if (EAPOLClientConfigurationSetSystemEthernetProfile(v6, 0))
          {
            if (EAPOLClientConfigurationSave(v6))
              goto LABEL_20;
            v12 = _MCLogObjects[0];
            if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              goto LABEL_20;
            v13 = v12;
            v23 = 138543362;
            v24 = (id)objc_opt_class(self);
            v14 = v24;
            v15 = "%{public}@ EAPOLClientConfigurationSave() failed";
            goto LABEL_19;
          }
          v22 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            v13 = v22;
            v23 = 138543362;
            v24 = (id)objc_opt_class(self);
            v14 = v24;
            v15 = "%{public}@ EAPOLClientConfigurationSetSystemEthernetProfile() failed";
            goto LABEL_19;
          }
LABEL_20:
          CFRelease(v6);
          goto LABEL_21;
        }
        v21 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          goto LABEL_20;
        v13 = v21;
        v23 = 138543362;
        v24 = (id)objc_opt_class(self);
        v14 = v24;
        v15 = "%{public}@ EAPOLClientProfileGetID() returned NULL";
      }
      else
      {
        v20 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          goto LABEL_20;
        v13 = v20;
        v23 = 138543362;
        v24 = (id)objc_opt_class(self);
        v14 = v24;
        v15 = "%{public}@ metadata validation failed";
      }
    }
    else
    {
      v19 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v13 = v19;
      v23 = 138543362;
      v24 = (id)objc_opt_class(self);
      v14 = v24;
      v15 = "%{public}@ EAPOLClientProfileCreate() returned NULL";
    }
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v23, 0xCu);

    goto LABEL_20;
  }
  v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v17 = v16;
    v23 = 138543362;
    v24 = (id)objc_opt_class(self);
    v18 = v24;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL", (uint8_t *)&v23, 0xCu);

  }
LABEL_21:

}

- (void)unsetAside
{
  void *v3;
  NSObject *v4;
  NSString *setAsideProfileID;
  uint64_t v6;
  const void *v7;
  uint64_t ProfileWithID;
  NSString *v9;
  os_log_t v10;
  id v11;
  os_log_t v12;
  NSObject *v13;
  id v14;
  const char *v15;
  os_log_t v16;
  os_log_t v17;
  int v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  if (!-[NSObject isSetAside](v4, "isSetAside"))
    goto LABEL_10;
  setAsideProfileID = self->_setAsideProfileID;

  if (setAsideProfileID)
  {
    v6 = EAPOLClientConfigurationCreateWithAuthorization(0, 0);
    if (v6)
    {
      v7 = (const void *)v6;
      ProfileWithID = EAPOLClientConfigurationGetProfileWithID(v6);
      if (ProfileWithID)
      {
        if (EAPOLClientConfigurationSetSystemEthernetProfile(v7, ProfileWithID))
        {
          if (EAPOLClientConfigurationSave(v7))
          {
            v9 = self->_setAsideProfileID;
            self->_setAsideProfileID = 0;

LABEL_18:
            CFRelease(v7);
            goto LABEL_19;
          }
          v17 = _MCLogObjects[0];
          if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            goto LABEL_18;
          v13 = v17;
          v18 = 138543362;
          v19 = (id)objc_opt_class(self);
          v14 = v19;
          v15 = "%{public}@ EAPOLClientConfigurationSave() failed";
        }
        else
        {
          v16 = _MCLogObjects[0];
          if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            goto LABEL_18;
          v13 = v16;
          v18 = 138543362;
          v19 = (id)objc_opt_class(self);
          v14 = v19;
          v15 = "%{public}@ EAPOLClientConfigurationSetSystemEthernetProfile() failed";
        }
      }
      else
      {
        v12 = _MCLogObjects[0];
        if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          goto LABEL_18;
        v13 = v12;
        v18 = 138543362;
        v19 = (id)objc_opt_class(self);
        v14 = v19;
        v15 = "%{public}@ EAPOLClientConfigurationGetProfileWithID() returned NULL";
      }
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v18, 0xCu);

      goto LABEL_18;
    }
    v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v4 = v10;
      v18 = 138543362;
      v19 = (id)objc_opt_class(self);
      v11 = v19;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}@ EAPOLClientConfigurationCreateWithAuthorization() returned NULL", (uint8_t *)&v18, 0xCu);

LABEL_10:
    }
  }
LABEL_19:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setAsideProfileID, 0);
}

@end
