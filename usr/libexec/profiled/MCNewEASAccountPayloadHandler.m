@implementation MCNewEASAccountPayloadHandler

- (id)userInputFields
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  unsigned __int8 v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  objc_super v72;

  v72.receiver = self;
  v72.super_class = (Class)MCNewEASAccountPayloadHandler;
  v3 = -[MCNewPayloadHandler userInputFields](&v72, "userInputFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountDescription"));
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostname"));
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      v13 = MCLocalizedString(CFSTR("EAS_ACCOUNT_DESCRIPTION_SINGULAR_FORMAT"));
      v12 = (id)objc_claimAutoreleasedReturnValue(v13);
    }
    v9 = v12;

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "emailAddress"));

  if (!v14)
  {
    v15 = MCLocalizedString(CFSTR("EMAIL_PROMPT_TITLE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = MCLocalizedFormat(CFSTR("EAS_EMAIL_PROMPT_DESCRIPTION"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = MCLocalizedString(CFSTR("EAS_ADDRESS_PLACEHOLDER"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("kEASEmailAddressKey"), v16, v18, 0, 0, 0, v20, 0, 2));
    objc_msgSend(v5, "addObject:", v21);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "embeddedCertificate"));
  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "certificateUUID"));
    v24 = v23 == 0;

  }
  else
  {
    v24 = 0;
  }

  v25 = objc_msgSend(v6, "hasCertificate");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "useOAuth"));
  if (v26)
  {
    v27 = 0;
  }
  else if (objc_msgSend(v6, "hasCertificate"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
    v27 = objc_msgSend(v28, "length") != 0;

  }
  else
  {
    v27 = 1;
  }

  if (!v24
    || (v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "embeddedCertificatePassword")),
        v30 = objc_msgSend(v29, "length"),
        v29,
        v30))
  {
    if ((v25 & 1) != 0)
      goto LABEL_28;
    goto LABEL_20;
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "embeddedCertificateName"));
  v41 = objc_msgSend(v40, "length");

  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "embeddedCertificateName"));
    v43 = CFSTR("IDENTITY_PASSWORD_PROMPT_DESCRIPTION");
LABEL_26:
    v46 = MCLocalizedFormat(v43);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);

    goto LABEL_27;
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "emailAddress"));
  v45 = objc_msgSend(v44, "length");

  if (v45)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "emailAddress"));
    v43 = CFSTR("EAS_PASSWORD_CERTIFICATE");
    goto LABEL_26;
  }
  v69 = MCLocalizedFormat(CFSTR("EAS_PASSWORD_CERTIFICATE"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(v69);
LABEL_27:
  v48 = MCLocalizedString(CFSTR("PASSWORD_PROMPT_TITLE"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  v50 = MCLocalizedString(CFSTR("EAS_PASSWORD_REQUIRED_PLACEHOLDER"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("kEASCertPasswordKey"), v49, v47, 0, 0, 0, v51, 0, 3));
  objc_msgSend(v5, "addObject:", v52);

  if ((v25 & 1) != 0)
    goto LABEL_28;
LABEL_20:
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
  v32 = objc_msgSend(v31, "length");

  if (!v32)
  {
    v33 = MCLocalizedString(CFSTR("USERNAME_PROMPT_TITLE"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = MCLocalizedFormat(CFSTR("EAS_USERNAME_PROMPT_DESCRIPTION"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = MCLocalizedString(CFSTR("EAS_USER_NAME_PLACEHOLDER"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("kEASUsernameKey"), v34, v36, 0, 0, 0, v38, 0, 0));
    objc_msgSend(v5, "addObject:", v39);

  }
LABEL_28:
  if (v27)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "password"));
    v54 = objc_msgSend(v53, "length");

    if (!v54)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "emailAddress"));
      v56 = objc_msgSend(v55, "length");

      if (v56)
      {
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "emailAddress"));
        v57 = MCLocalizedFormat(CFSTR("EAS_PASSWORD_EMAIL_AVAILABLE_DESCRIPTION"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(v57);

      }
      else
      {
        v70 = v9;
        v59 = MCLocalizedFormat(CFSTR("EAS_PASSWORD_HOST_AVAILABLE_DESCRIPTION"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(v59);
      }
      v60 = MCLocalizedString(CFSTR("EAS_PASSWORD_REQUIRED_PLACEHOLDER"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      if (objc_msgSend(v6, "hasCertificate", v70))
      {
        v62 = MCLocalizedString(CFSTR("EAS_PASSWORD_OPTIONAL_PLACEHOLDER"));
        v63 = objc_claimAutoreleasedReturnValue(v62);

        v64 = 4;
        v61 = (void *)v63;
      }
      else
      {
        v64 = 0;
      }
      v65 = MCLocalizedString(CFSTR("PASSWORD_PROMPT_TITLE"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
      LODWORD(v71) = 3;
      HIDWORD(v71) = v64;
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", CFSTR("kEASPasswordKey"), v66, v58, 0, 0, 0, v61, 0, v71));
      objc_msgSend(v5, "addObject:", v67);

    }
  }

  return v5;
}

- (void)setUserInputResponses:(id)a3
{
  id v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  os_log_t v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  MCNewEASAccountPayloadHandler *v20;
  id v21;
  id obj;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];

  v4 = a3;
  v20 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v25;
    v10 = kMCIDUUIDKey;
    v11 = kMCIDResponseKey;
    *(_QWORD *)&v7 = 138543618;
    v19 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v10, v19));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v11));
        if (objc_msgSend(v14, "isEqualToString:", CFSTR("kEASEmailAddressKey")))
        {
          objc_msgSend(v5, "setEmailAddress:", v15);
        }
        else if (objc_msgSend(v14, "isEqualToString:", CFSTR("kEASCertPasswordKey")))
        {
          objc_msgSend(v5, "setEmbeddedCertificatePassword:", v15);
        }
        else if (objc_msgSend(v14, "isEqualToString:", CFSTR("kEASUsernameKey")))
        {
          objc_msgSend(v5, "setUsername:", v15);
        }
        else if (objc_msgSend(v14, "isEqualToString:", CFSTR("kEASPasswordKey")))
        {
          objc_msgSend(v5, "setPassword:", v15);
        }
        else
        {
          v16 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
          {
            v17 = v16;
            v18 = (void *)objc_opt_class(v20);
            *(_DWORD *)buf = v19;
            v29 = v18;
            v30 = 2114;
            v31 = v14;
            v21 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ didn't ask for user input for key %{public}@", buf, 0x16u);

          }
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v8);
  }

  v23.receiver = v20;
  v23.super_class = (Class)MCNewEASAccountPayloadHandler;
  -[MCNewPayloadHandler setUserInputResponses:](&v23, "setUserInputResponses:", obj);

}

- (id)unhashedAccountIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "emailAddress"));
  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("eas|%@"), v3));
  else
    v4 = 0;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "hostname"));
  v6 = (void *)v5;
  if (v4 && v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("|%@"), v5));

    v4 = (void *)v7;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "username"));
  v9 = (void *)v8;
  if (v4 && v8)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("|%@"), v8));

    v4 = (void *)v10;
  }

  return v4;
}

- (id)_accountFromPayloadWithUserInputResponses:(id)a3 identityPersistentID:(id)a4 SMIMESigningIdentityPersistentID:(id)a5 SMIMEEncryptionIdentityPersistentID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  unsigned int v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *i;
  ASAccount *v43;
  ASAccount *account;
  ASAccount *v45;
  void *v46;
  unsigned int v47;
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
  uint64_t v67;
  void *v68;
  NSObject *v69;
  ASAccount *v70;
  void *v71;
  ASAccount *v72;
  void *v73;
  ASAccount *v74;
  void *v75;
  void *v76;
  ASAccount *v77;
  void *v78;
  ASAccount *v79;
  void *v80;
  ASAccount *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  unsigned int v86;
  ASAccount *v87;
  id v88;
  MCNewEASAccountPayloadHandler *v89;
  void *v90;
  void *v91;
  ASAccount *v92;
  void *v93;
  void *v94;
  void *v95;
  ASAccount *v96;
  void *v97;
  ASAccount *v98;
  id v99;
  ASAccount *v100;
  id v101;
  void *v102;
  void *v103;
  ASAccount *v104;
  uint64_t v105;
  uint64_t v106;
  ASAccount *v107;
  void *v108;
  void *v109;
  MCNewEASAccountPayloadHandler *v110;
  ASAccount *v111;
  uint64_t v112;
  uint64_t v113;
  ASAccount *v114;
  ASAccount *v115;
  id v116;
  ASAccount *v117;
  id v118;
  ASAccount *v119;
  id v120;
  ASAccount *v121;
  id v122;
  ASAccount *v123;
  id v124;
  ASAccount *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  id v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *j;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  id v140;
  id v141;
  id v142;
  os_log_t v143;
  NSObject *v144;
  void *v145;
  ASAccount *v146;
  void *v148;
  id v149;
  id v150;
  id v151;
  id v152;
  MCNewEASAccountPayloadHandler *v153;
  id v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  id obj;
  id obja;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  uint8_t buf[4];
  void *v172;
  __int16 v173;
  void *v174;
  _BYTE v175[128];
  _BYTE v176[128];

  v10 = a3;
  v11 = a4;
  v152 = a5;
  v12 = a6;
  v151 = v12;
  if (!self->_account)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v14 = ACAccountTypeIdentifierExchange;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hostname"));
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("m.hotmail.com"));

    if (v16)
    {
      v18 = ACAccountTypeIdentifierHotmail;

      v14 = v18;
    }
    v19 = sharedDAAccountStore(v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    obj = v14;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "accountTypeWithAccountTypeIdentifier:", v14));

    v22 = objc_msgSend(objc_alloc((Class)ACAccount), "initWithAccountType:", v21);
    objc_msgSend(v22, "setManagingOwnerIdentifier:", kMCAccountManagingOwnerIdentifier);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "friendlyName"));
    objc_msgSend(v22, "setManagingSourceName:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
    v25 = objc_msgSend(v24, "userMode");

    if (v25 == 1)
    {
      v26 = (id)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler MCACAccountIdentifier](self, "MCACAccountIdentifier"));
      v27 = v26;
      if (v26)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
        objc_msgSend(v22, "setAccountProperty:forKey:", v28, CFSTR("MCAccountIdentifer"));

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
        objc_msgSend(v22, "setAccountProperty:forKey:", v29, CFSTR("MCNativeAccountIdentifer"));

        v26 = objc_msgSend(v22, "setIdentifier:", v27);
      }
      v30 = sharedDAAccountStore(v26);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "accountWithIdentifier:", v32));

      if (v33)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectID"));
        objc_msgSend(v22, "performSelector:withObject:", "_setObjectID:", v34);

      }
    }
    v159 = v21;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "supportedDataclasses"));
    v36 = objc_msgSend(v35, "mutableCopy");

    v37 = kAccountDataclassNotes;
    objc_msgSend(v36, "removeObject:", kAccountDataclassNotes);
    v169 = 0u;
    v170 = 0u;
    v167 = 0u;
    v168 = 0u;
    v38 = v36;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v167, v176, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v168;
      do
      {
        for (i = 0; i != v40; i = (char *)i + 1)
        {
          if (*(_QWORD *)v168 != v41)
            objc_enumerationMutation(v38);
          objc_msgSend(v22, "setProvisioned:forDataclass:", 1, *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * (_QWORD)i));
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v167, v176, 16);
      }
      while (v40);
    }

    v43 = (ASAccount *)objc_claimAutoreleasedReturnValue(+[DAAccount daAccountSubclassWithBackingAccountInfo:](DAAccount, "daAccountSubclassWithBackingAccountInfo:", v22));
    account = self->_account;
    self->_account = v43;

    v45 = self->_account;
    if (!v45)
      goto LABEL_74;
    -[ASAccount setEnabled:forDADataclass:](v45, "setEnabled:forDADataclass:", objc_msgSend(v13, "enableMail"), 1);
    -[ASAccount setEnabled:forDADataclass:](self->_account, "setEnabled:forDADataclass:", objc_msgSend(v13, "enableContacts"), 2);
    -[ASAccount setEnabled:forDADataclass:](self->_account, "setEnabled:forDADataclass:", objc_msgSend(v13, "enableCalendars"), 4);
    -[ASAccount setEnabled:forDADataclass:](self->_account, "setEnabled:forDADataclass:", objc_msgSend(v13, "enableContacts"), 8);
    -[ASAccount setEnabled:forDADataclass:](self->_account, "setEnabled:forDADataclass:", objc_msgSend(v13, "enableReminders"), 16);
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "provisionedDataclasses"));
    v47 = objc_msgSend(v46, "containsObject:", v37);

    if (v47)
      -[ASAccount setEnabled:forDADataclass:](self->_account, "setEnabled:forDADataclass:", objc_msgSend(v13, "enableNotes"), 32);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[ASAccount backingAccountInfo](self->_account, "backingAccountInfo"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "UUID"));
    objc_msgSend(v48, "setMcPayloadUUID:", v50);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[ASAccount backingAccountInfo](self->_account, "backingAccountInfo"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "profile"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "UUID"));
    objc_msgSend(v51, "setMcProfileUUID:", v54);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[ASAccount backingAccountInfo](self->_account, "backingAccountInfo"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "communicationServiceRules"));
    objc_msgSend(v55, "setCommunicationServiceRules:", v56);

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[ASAccount backingAccountInfo](self->_account, "backingAccountInfo"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    objc_msgSend(v57, "setMcAccountIdentifier:", v58);

    if ((objc_msgSend(v13, "enableNotes") & 1) == 0)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[ASAccount backingAccountInfo](self->_account, "backingAccountInfo"));
      objc_msgSend(v59, "setMcEASAccountEnableNotes:", &__kCFBooleanFalse);

    }
    if ((objc_msgSend(v13, "enableMailUserOverridable") & 1) == 0)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[ASAccount backingAccountInfo](self->_account, "backingAccountInfo"));
      objc_msgSend(v60, "setMcEnableMailUserOverridable:", &__kCFBooleanFalse);

    }
    if ((objc_msgSend(v13, "enableContactsUserOverridable") & 1) == 0)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[ASAccount backingAccountInfo](self->_account, "backingAccountInfo"));
      objc_msgSend(v61, "setMcEnableContactsUserOverridable:", &__kCFBooleanFalse);

    }
    if ((objc_msgSend(v13, "enableCalendarsUserOverridable") & 1) == 0)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[ASAccount backingAccountInfo](self->_account, "backingAccountInfo"));
      objc_msgSend(v62, "setMcEnableCalendarsUserOverridable:", &__kCFBooleanFalse);

    }
    if ((objc_msgSend(v13, "enableRemindersUserOverridable") & 1) == 0)
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[ASAccount backingAccountInfo](self->_account, "backingAccountInfo"));
      objc_msgSend(v63, "setMcEnableRemindersUserOverridable:", &__kCFBooleanFalse);

    }
    if ((objc_msgSend(v13, "enableNotesUserOverridable") & 1) == 0)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[ASAccount backingAccountInfo](self->_account, "backingAccountInfo"));
      objc_msgSend(v64, "setMcEnableNotesUserOverridable:", &__kCFBooleanFalse);

    }
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "profile"));
    v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "identifier"));

    if (v67)
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[ASAccount backingAccountInfo](self->_account, "backingAccountInfo"));
      objc_msgSend(v68, "setMcConfigurationProfileIdentifier:", v67);

    }
    else
    {
      v69 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "Failed to retrieve profile identifier. Not setting profile identifier account property on Exchange account.", buf, 2u);
      }
    }
    v70 = self->_account;
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "username"));
    -[ASAccount setUsername:](v70, "setUsername:", v71);

    v72 = self->_account;
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hostname"));
    -[ASAccount setHost:](v72, "setHost:", v73);

    v74 = self->_account;
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "useSSL"));
    -[ASAccount setUseSSL:](v74, "setUseSSL:", objc_msgSend(v75, "BOOLValue"));

    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mailNumberOfPastDaysToSync"));
    if (v76)
    {
      v77 = self->_account;
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mailNumberOfPastDaysToSync"));
      -[ASAccount setMailNumberOfPastDaysToSync:](v77, "setMailNumberOfPastDaysToSync:", objc_msgSend(v78, "intValue"));

    }
    v157 = (void *)v67;
    v79 = self->_account;
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accountDescription"));
    -[ASAccount setAccountDescription:](v79, "setAccountDescription:", v80);

    v81 = self->_account;
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "emailAddress"));
    -[ASAccount setEmailAddress:](v81, "setEmailAddress:", v82);

    v83 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v13, "mustNotUseSynchronizableCredential")));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[ASAccount backingAccountInfo](self->_account, "backingAccountInfo"));
    v155 = (void *)v83;
    objc_msgSend(v84, "setAccountProperty:forKey:", v83, ACAccountPropertyShouldNeverUseSyncableCredential);

    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "useOAuth"));
    v86 = objc_msgSend(v85, "BOOLValue");

    v87 = self->_account;
    if (v86)
    {
      -[ASAccount setAccountBoolProperty:forKey:](self->_account, "setAccountBoolProperty:forKey:", 1, kDAExchangeOAuthSupportedKey);
      v88 = objc_msgSend(objc_alloc((Class)ACAccountCredential), "initWithOAuth2Token:refreshToken:expiryDate:", &stru_1000E4AA0, 0, 0);
      v89 = self;
      v90 = (void *)objc_claimAutoreleasedReturnValue(-[ASAccount backingAccountInfo](self->_account, "backingAccountInfo"));
      objc_msgSend(v90, "setCredential:", v88);

      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "OAuthSignInURL"));
      if (v91)
      {
        v92 = self->_account;
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "OAuthSignInURL"));
        -[ASAccount setAccountProperty:forKey:](v92, "setAccountProperty:forKey:", v93, kDAExchangeOAuthURI);

        v94 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler _endPointFQDNForPayload:](self, "_endPointFQDNForPayload:", v13));
        if (v94)
          -[ASAccount setAccountProperty:forKey:](self->_account, "setAccountProperty:forKey:", v94, kDAEASEndPointFQDN);

      }
      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "OAuthTokenRequestURL"));

      if (!v95)
      {
LABEL_47:
        if (objc_msgSend(v13, "preventMove"))
        {
          v98 = v89->_account;
          v99 = objc_msgSend(v13, "preventMove");
          -[ASAccount setAccountBoolProperty:forKey:](v98, "setAccountBoolProperty:forKey:", v99, MFMailAccountRestrictMessageTransfersToOtherAccounts);
        }
        if (objc_msgSend(v13, "preventAppSheet"))
        {
          v100 = v89->_account;
          v101 = objc_msgSend(v13, "preventAppSheet");
          -[ASAccount setAccountBoolProperty:forKey:](v100, "setAccountBoolProperty:forKey:", v101, MFMailAccountRestrictSendingFromExternalProcesses);
        }
        if (!objc_msgSend(v13, "SMIMEEnabled"))
          goto LABEL_67;
        if (v152)
          -[ASAccount setSigningIdentityPersistentReference:](v89->_account, "setSigningIdentityPersistentReference:");
        v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "SMIMESigningEnabled"));
        v103 = v102;
        if (v102)
        {
          v104 = v89->_account;
          v105 = (uint64_t)objc_msgSend(v102, "BOOLValue");
          v106 = MFMailAccountSigningEnabled;
          v107 = v104;
        }
        else
        {
          if (!v152)
            goto LABEL_59;
          v107 = v89->_account;
          v106 = MFMailAccountSigningEnabled;
          v105 = 1;
        }
        -[ASAccount setAccountBoolProperty:forKey:](v107, "setAccountBoolProperty:forKey:", v105, v106);
LABEL_59:
        if (v151)
          -[ASAccount setEncryptionIdentityPersistentReference:](v89->_account, "setEncryptionIdentityPersistentReference:");
        v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "SMIMEEncryptionEnabled"));
        v109 = v108;
        if (v108)
        {
          v110 = v89;
          v111 = v89->_account;
          v112 = (uint64_t)objc_msgSend(v108, "BOOLValue");
          v113 = MFMailAccountEncryptionEnabled;
          v114 = v111;
        }
        else
        {
          v110 = v89;
          if (!v151)
          {
LABEL_66:
            v115 = v110->_account;
            v116 = objc_msgSend(v13, "SMIMEEncryptByDefaultUserOverrideable");
            -[ASAccount setAccountBoolProperty:forKey:](v115, "setAccountBoolProperty:forKey:", v116, MFMailAccountEncryptByDefaultUserOverrideable);
            v117 = v110->_account;
            v118 = objc_msgSend(v13, "SMIMEPerMessageSwitchEnabled");
            -[ASAccount setAccountBoolProperty:forKey:](v117, "setAccountBoolProperty:forKey:", v118, MFMailAccountPerMessageEncryptionEnabled);
            v119 = v110->_account;
            v120 = objc_msgSend(v13, "SMIMESigningUserOverrideable");
            -[ASAccount setAccountBoolProperty:forKey:](v119, "setAccountBoolProperty:forKey:", v120, MFMailAccountSigningUserOverrideable);
            v121 = v110->_account;
            v122 = objc_msgSend(v13, "SMIMESigningIdentityUserOverrideable");
            -[ASAccount setAccountBoolProperty:forKey:](v121, "setAccountBoolProperty:forKey:", v122, MFMailAccountSigningIdentityUserOverrideable);
            v89 = v110;
            v123 = v110->_account;
            v124 = objc_msgSend(v13, "SMIMEEncryptionIdentityUserOverrideable");
            -[ASAccount setAccountBoolProperty:forKey:](v123, "setAccountBoolProperty:forKey:", v124, MFMailAccountEncryptionIdentityUserOverrideable);

LABEL_67:
            if (objc_msgSend(v13, "syncDefaultFoldersOnly"))
            {
              v125 = v89->_account;
              v126 = MCkASSyncDefaultFoldersOnly();
              v127 = (void *)objc_claimAutoreleasedReturnValue(v126);
              -[ASAccount setAccountBoolProperty:forKey:](v125, "setAccountBoolProperty:forKey:", 1, v127);

            }
            if (objc_msgSend(v13, "isRecentsSyncingDisabled"))
              -[ASAccount setAccountBoolProperty:forKey:](v89->_account, "setAccountBoolProperty:forKey:", 1, MFMailAccountRestrictRecentsSyncing);
            if (objc_msgSend(v13, "isMailDropEnabled"))
              -[ASAccount setAccountBoolProperty:forKey:](v89->_account, "setAccountBoolProperty:forKey:", 1, MFMailAccountSupportsMailDrop);

            self = v89;
LABEL_74:

            v12 = v151;
            goto LABEL_75;
          }
          v114 = v89->_account;
          v113 = MFMailAccountEncryptionEnabled;
          v112 = 1;
        }
        -[ASAccount setAccountBoolProperty:forKey:](v114, "setAccountBoolProperty:forKey:", v112, v113);
        goto LABEL_66;
      }
      v96 = self->_account;
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "OAuthTokenRequestURL"));
      -[ASAccount setAccountProperty:forKey:](v96, "setAccountProperty:forKey:", v97, kDAExchangeTokenRequestURI);
    }
    else
    {
      v89 = self;
      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "password"));
      -[ASAccount setPassword:](v87, "setPassword:", v97);
    }

    goto LABEL_47;
  }
LABEL_75:
  if (v11)
    -[ASAccount setIdentityCertificatePersistentID:managedByProfile:](self->_account, "setIdentityCertificatePersistentID:managedByProfile:", v11, 1);
  if (v10)
  {
    v150 = v11;
    v153 = self;
    v128 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "emailAddress"));
    v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "embeddedCertificatePassword"));
    v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "username"));
    v148 = v128;
    v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "password"));
    v163 = 0u;
    v164 = 0u;
    v165 = 0u;
    v166 = 0u;
    v149 = v10;
    obja = v10;
    v130 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v163, v175, 16);
    if (v130)
    {
      v131 = v130;
      v132 = *(_QWORD *)v164;
      v133 = kMCIDUUIDKey;
      v134 = kMCIDResponseKey;
      do
      {
        for (j = 0; j != v131; j = (char *)j + 1)
        {
          if (*(_QWORD *)v164 != v132)
            objc_enumerationMutation(obja);
          v136 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * (_QWORD)j);
          v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "objectForKey:", v133));
          v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "objectForKey:", v134));
          if (objc_msgSend(v137, "isEqualToString:", CFSTR("kEASEmailAddressKey")))
          {
            v139 = v138;

            v129 = v139;
          }
          else if (objc_msgSend(v137, "isEqualToString:", CFSTR("kEASCertPasswordKey")))
          {
            v140 = v138;

            v160 = v140;
          }
          else if (objc_msgSend(v137, "isEqualToString:", CFSTR("kEASUsernameKey")))
          {
            v141 = v138;

            v158 = v141;
          }
          else if (objc_msgSend(v137, "isEqualToString:", CFSTR("kEASPasswordKey")))
          {
            v142 = v138;

            v156 = v142;
          }
          else
          {
            v143 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              v144 = v143;
              v145 = (void *)objc_opt_class(v153);
              *(_DWORD *)buf = 138543618;
              v172 = v145;
              v173 = 2114;
              v174 = v137;
              v154 = v145;
              _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_DEFAULT, "%{public}@ didn't ask for user input for key %{public}@", buf, 0x16u);

            }
          }

        }
        v131 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v163, v175, 16);
      }
      while (v131);
    }

    self = v153;
    -[ASAccount setEmailAddress:](v153->_account, "setEmailAddress:", v129);
    -[ASAccount setUsername:](v153->_account, "setUsername:", v158);
    -[ASAccount setPassword:](v153->_account, "setPassword:", v156);

    v10 = v149;
    v11 = v150;
    v12 = v151;
  }
  v146 = self->_account;

  return v146;
}

- (id)_endPointFQDNForPayload:(id)a3
{
  id v3;
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSURLComponents);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "useSSL"));
  if (objc_msgSend(v5, "BOOLValue"))
    v6 = CFSTR("https");
  else
    v6 = CFSTR("http");
  objc_msgSend(v4, "setScheme:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hostname"));
  objc_msgSend(v4, "setHost:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string"));
  return v8;
}

- (id)_errorFromValidationError:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;

  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  if (v4 == (id)102)
  {
    v13 = MCDAErrorDomain;
    v14 = MCErrorArray(CFSTR("ACCOUNT_VALIDATION_INVALID_CREDENTIALS_DESCRIPTION"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v15 = MCLocalizedErrorString(CFSTR("ACCOUNT_VALIDATION_INVALID_CREDENTIALS_SUGGESTION"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v16 = MCUSEnglishErrorString(CFSTR("ACCOUNT_VALIDATION_INVALID_CREDENTIALS_SUGGESTION"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v17 = +[NSError MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:", v13, 18002, v7, v9, v11, v3, MCErrorTypeRetryable);
LABEL_11:
    v25 = (void *)objc_claimAutoreleasedReturnValue(v17);

    goto LABEL_12;
  }
  if (v4 == (id)101)
  {
    v18 = MCDAErrorDomain;
    v19 = MCErrorArray(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_DESCRIPTION"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v20 = MCLocalizedErrorString(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_SUGGESTION"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v21 = MCUSEnglishErrorString(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_SUGGESTION"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v17 = +[NSError MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:", v18, 18001, v7, v9, v11, v3, MCErrorTypeSkippable);
    goto LABEL_11;
  }
  if (v4 == (id)100)
  {
    v5 = MCDAErrorDomain;
    v6 = MCErrorArray(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_DESCRIPTION"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = MCLocalizedErrorString(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_SUGGESTION"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = MCUSEnglishErrorString(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_SUGGESTION"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = &MCErrorTypeSkippable;
LABEL_10:
    v17 = +[NSError MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:", v5, 18000, v7, v9, v11, v3, *v12);
    goto LABEL_11;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
  v23 = objc_msgSend(v22, "length");

  v5 = MCDAErrorDomain;
  v24 = MCErrorArray(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_DESCRIPTION"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v24);
  if (!v23)
  {
    v26 = MCLocalizedErrorString(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_SUGGESTION"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v27 = MCUSEnglishErrorString(CFSTR("ACCOUNT_VALIDATION_UNKNOWN_ERROR_SUGGESTION"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v12 = &MCErrorTypeFatal;
    goto LABEL_10;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v5, 18000, v7, v3, MCErrorTypeFatal, 0));
LABEL_12:

  return v25;
}

- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  os_log_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  int v15;
  id v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  void *v20;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "MCVerboseDescription"));
    v15 = 138543874;
    v16 = v8;
    v17 = 1024;
    v18 = v6;
    v19 = 2114;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "account %{public}@ is valid %d with error %{public}@", (uint8_t *)&v15, 0x1Cu);

  }
  if (!v9 && !v6)
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", DAAccountValidationDomain, 102, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler accountValidationCompletionHandler](self, "accountValidationCompletionHandler"));

  if (v13)
  {
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler accountValidationCompletionHandler](self, "accountValidationCompletionHandler"));
    ((void (**)(_QWORD, id))v14)[2](v14, v9);

    -[MCNewEASAccountPayloadHandler setAccountValidationCompletionHandler:](self, "setAccountValidationCompletionHandler:", 0);
  }

}

- (void)_preflightWithAccount:(id)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t global_queue;
  void *v9;
  id v10;

  v6 = a3;
  v7 = sharedDAAccountStore(-[MCNewEASAccountPayloadHandler setAccountValidationCompletionHandler:](self, "setAccountValidationCompletionHandler:", a4));
  v10 = (id)objc_claimAutoreleasedReturnValue(v7);
  global_queue = dataaccess_get_global_queue();
  v9 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  objc_msgSend(v6, "checkValidityOnAccountStore:withConsumer:inQueue:", v10, self, v9);

}

- (id)_preflightTimePersistentIDForIdentityCertificateUserInputResponses:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  id v45;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "certificateUUID"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "certificateUUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "payloadHandlerWithUUID:", v10));

    if (v11)
    {
      v43 = 0;
      v12 = objc_msgSend(v11, "copyIdentityImmediatelyWithInteractionClient:outError:", 0, &v43);
      v13 = v43;
      v14 = 0;
      if (!v13 && v12)
      {
        v39 = a4;
        v41 = v6;
        v15 = objc_msgSend(v11, "accessibility");
        v16 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Preflighting EAS identity, storing with accessibility %@", buf, 0xCu);
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
        v18 = kMCAppleIdentitiesKeychainGroup;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "profile"));
        v14 = (id)objc_claimAutoreleasedReturnValue(+[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v12, v17, v18, objc_msgSend(v20, "isInstalledForSystem"), v15));

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
        -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:](self, "_touchDependencyBetweenPersistentID:andUUID:", v14, v21);

        CFRelease(v12);
        v13 = 0;
        a4 = v39;
        v6 = v41;
      }
    }
    else
    {
      v13 = 0;
      v14 = 0;
    }
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "embeddedCertificate"));

    if (!v22)
    {

      v14 = 0;
LABEL_18:
      v14 = v14;
      v13 = 0;
      v37 = v14;
      goto LABEL_20;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "embeddedCertificate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "embeddedCertificatePassword"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler prioritizeUserInput:key:overField:](MCNewPayloadHandler, "prioritizeUserInput:key:overField:", v6, CFSTR("kEASCertPasswordKey"), v23));

    v25 = MCKeychainCopyIdentityFromPKCS12(v11, v24);
    if (v25)
    {
      v26 = (const void *)v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
      v28 = kMCAppleIdentitiesKeychainGroup;
      v40 = v11;
      v42 = v6;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v30 = v24;
      v31 = a4;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "profile"));
      v14 = (id)objc_claimAutoreleasedReturnValue(+[MCKeychain saveItem:withLabel:group:useSystemKeychain:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:", v26, v27, v28, objc_msgSend(v32, "isInstalledForSystem")));

      a4 = v31;
      v24 = v30;

      v11 = v40;
      v6 = v42;

      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
      -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:](self, "_touchDependencyBetweenPersistentID:andUUID:", v14, v33);

      CFRelease(v26);
      v13 = 0;
    }
    else
    {
      v34 = MCEASErrorDomain;
      v35 = MCErrorArray(CFSTR("EAS_ACCT_CANNOT_DECRYPT_CERTIFICATE"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v13 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v34, 21006, v36, MCErrorTypeFatal, 0));

      v14 = 0;
    }

  }
  if (!v13)
    goto LABEL_18;
  if (a4)
  {
    v13 = objc_retainAutorelease(v13);
    v37 = 0;
    *a4 = v13;
  }
  else
  {
    v37 = 0;
  }
LABEL_20:

  return v37;
}

- (id)_installTimePersistentIDForIdentityCertificateOutError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  CFStringRef v29;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "certificateUUID"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "certificateUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentIDForCertificateUUID:", v8));

LABEL_3:
    v10 = 0;
    goto LABEL_4;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "embeddedCertificate"));

  if (!v12)
  {
    v9 = 0;
    goto LABEL_3;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "embeddedCertificate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "embeddedCertificatePassword"));
  v15 = MCKeychainCopyIdentityFromPKCS12(v13, v14);
  if (v15)
  {
    v16 = (const void *)v15;
    v26 = v14;
    v27 = v13;
    v17 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v29 = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Storing embedded identity for EAS, storing with accessibility %@", buf, 0xCu);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
    v19 = kMCAppleIdentitiesKeychainGroup;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "profile"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:](MCKeychain, "saveItem:withLabel:group:useSystemKeychain:accessibility:", v16, v18, v19, objc_msgSend(v21, "isInstalledForSystem"), kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly));

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
    -[MCNewPayloadHandler _touchDependencyBetweenPersistentID:andUUID:](self, "_touchDependencyBetweenPersistentID:andUUID:", v9, v22);

    CFRelease(v16);
    v10 = 0;
    v14 = v26;
    v13 = v27;
  }
  else
  {
    v23 = MCEASErrorDomain;
    v24 = MCErrorArray(CFSTR("EAS_ACCT_CANNOT_DECRYPT_CERTIFICATE"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v23, 21006, v25, MCErrorTypeFatal, 0));

    v9 = 0;
  }

  if (a3 && v10)
  {
    v10 = objc_retainAutorelease(v10);
    *a3 = v10;
  }
LABEL_4:

  return v9;
}

- (BOOL)_isConfiguredWithSCEP
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "certificateUUID"));

  if (!v3)
    goto LABEL_4;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "profile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "certificateUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v4, "payloadWithUUID:", v5));

  v7 = objc_opt_class(MCSCEPPayload);
  LOBYTE(v4) = objc_opt_isKindOfClass(v6, v7);

  if ((v4 & 1) != 0)
    v8 = 1;
  else
LABEL_4:
    v8 = 0;

  return v8;
}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  NSObject *v16;
  dispatch_time_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v25;
  id *v26;
  _QWORD v27[4];
  NSObject *v28;
  uint64_t *v29;
  id v30;
  id v31;
  id obj;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_10006DC5C;
  v37 = sub_10006DC6C;
  v38 = 0;
  if (-[MCNewEASAccountPayloadHandler _isConfiguredWithSCEP](self, "_isConfiguredWithSCEP"))
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_17;
  }
  v11 = (id *)(v34 + 5);
  obj = (id)v34[5];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler _preflightTimePersistentIDForIdentityCertificateUserInputResponses:outError:](self, "_preflightTimePersistentIDForIdentityCertificateUserInputResponses:outError:", v6, &obj));
  objc_storeStrong(v11, obj);
  if (v34[5])
  {
    v10 = 0;
    v9 = 0;
    goto LABEL_15;
  }
  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
    -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:](self, "_retainDependencyBetweenPersistentID:andUUID:", v8, v12);

  }
  if (!objc_msgSend(v7, "SMIMEEnabled"))
  {
    v10 = 0;
    v9 = 0;
LABEL_11:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler _accountFromPayloadWithUserInputResponses:identityPersistentID:SMIMESigningIdentityPersistentID:SMIMEEncryptionIdentityPersistentID:](self, "_accountFromPayloadWithUserInputResponses:identityPersistentID:SMIMESigningIdentityPersistentID:SMIMEEncryptionIdentityPersistentID:", v6, v8, v9, v10));
    if (v15)
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10006DC74;
      v27[3] = &unk_1000E35C0;
      v29 = &v33;
      v16 = dispatch_semaphore_create(0);
      v28 = v16;
      -[MCNewEASAccountPayloadHandler _preflightWithAccount:completionHandler:](self, "_preflightWithAccount:completionHandler:", v15, v27);
      v17 = dispatch_time(0, 30000000000);
      dispatch_semaphore_wait(v16, v17);
      v18 = v28;
    }
    else
    {
      v19 = MCErrorArray(CFSTR("EAS_ACCT_CREATION_FAILED"));
      v16 = objc_claimAutoreleasedReturnValue(v19);
      v20 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCEASErrorDomain, 21004, v16, MCErrorTypeFatal, 0));
      v18 = v34[5];
      v34[5] = v20;
    }

    goto LABEL_15;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "SMIMESigningIdentityUUID"));
  v14 = (id *)(v34 + 5);
  v31 = (id)v34[5];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler _temporaryPersistentIDForIdentityUUID:outError:](self, "_temporaryPersistentIDForIdentityUUID:outError:", v13, &v31));
  objc_storeStrong(v14, v31);

  if (v34[5])
  {
    v10 = 0;
    goto LABEL_15;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "SMIMEEncryptionIdentityUUID"));
  v26 = (id *)(v34 + 5);
  v30 = (id)v34[5];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler _temporaryPersistentIDForIdentityUUID:outError:](self, "_temporaryPersistentIDForIdentityUUID:outError:", v25, &v30));
  objc_storeStrong(v26, v30);

  if (!v34[5])
    goto LABEL_11;
LABEL_15:
  if (v8)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
    -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v8, v21);

  }
LABEL_17:
  if (a4 && v34[5])
  {
    v22 = MCErrorArray(CFSTR("EAS_ACCT_VERIFICATION_FAIL"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCEASErrorDomain, 21007, v23, v34[5], MCErrorTypeSkippable, 0));

  }
  _Block_object_dispose(&v33, 8);

  return 1;
}

- (id)_errorFromPolicyPreflightError:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  int v15;
  id v16;

  v3 = a3;
  v4 = MCEASOverSimplifiedStatusForError();
  v5 = _MCLogObjects[0];
  v6 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR);
  if (v4 == 1)
  {
    if (v6)
    {
      v15 = 138543362;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Got a network error during policy preflight: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    v7 = MCEASErrorDomain;
    v8 = MCLocalizedErrorString(CFSTR("CANT_RETRIEVE_POLICY_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v9));
    v11 = &MCErrorTypeSkippable;
  }
  else
  {
    if (v6)
    {
      v15 = 138543362;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Got an unknown error back from my policy preflight: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    v7 = MCEASErrorDomain;
    v12 = MCLocalizedErrorString(CFSTR("CANT_RETRIEVE_POLICY_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v9));
    v11 = &MCErrorTypeFatal;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v7, 21000, v10, v3, *v11));

  return v13;
}

- (void)_preflightWithPreflighter:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  ASAccount *account;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  account = self->_account;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DASharedAccountProperties DAAccountDoNotSaveReason](DASharedAccountProperties, "DAAccountDoNotSaveReason"));
  -[ASAccount setAccountProperty:forKey:](account, "setAccountProperty:forKey:", CFSTR("Preflighting for payload handler"), v9);

  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "startPreflight");
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006DFC0;
  v11[3] = &unk_1000E4020;
  objc_copyWeak(&v13, &location);
  v10 = v7;
  v12 = v10;
  -[MCNewEASAccountPayloadHandler setPreflightCompletionHandler:](self, "setPreflightCompletionHandler:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (id)_getClientRestrictionsFromServerCertificatePersistentID:(id)a3 SMIMESigningIdentityPersistentID:(id)a4 SMIMEEncryptionIdentityPersistentID:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  dispatch_semaphore_t v16;
  id v17;
  NSObject *v18;
  dispatch_time_t v19;
  id v20;
  _QWORD block[5];
  id v23;
  NSObject *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc((Class)MCASPolicyPreflighterClass());
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler _accountFromPayloadWithUserInputResponses:identityPersistentID:SMIMESigningIdentityPersistentID:SMIMEEncryptionIdentityPersistentID:](self, "_accountFromPayloadWithUserInputResponses:identityPersistentID:SMIMESigningIdentityPersistentID:SMIMEEncryptionIdentityPersistentID:", 0, v10, v11, v12));
  v15 = objc_msgSend(v13, "initWithAccount:policyKey:", v14, 0);

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_10006DC5C;
  v37 = sub_10006DC6C;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_10006DC5C;
  v31 = sub_10006DC6C;
  v32 = 0;
  v16 = dispatch_semaphore_create(0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E280;
  block[3] = &unk_1000E4048;
  block[4] = self;
  v17 = v15;
  v23 = v17;
  v25 = &v27;
  v26 = &v33;
  v18 = v16;
  v24 = v18;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v19 = dispatch_time(0, 60000000000);
  dispatch_semaphore_wait(v18, v19);
  objc_msgSend(v17, "invalidate");
  if (a6)
    *a6 = objc_retainAutorelease((id)v34[5]);
  v20 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v20;
}

- (BOOL)stageForInstallationWithInstaller:(id)a3 interactionClient:(id)a4 outError:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  os_log_t v27;
  NSObject *v28;
  void *v29;
  BOOL v30;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4, a5));
  if (-[MCNewEASAccountPayloadHandler _isConfiguredWithSCEP](self, "_isConfiguredWithSCEP"))
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
LABEL_24:
    v30 = 1;
    goto LABEL_25;
  }
  v49 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler _preflightTimePersistentIDForIdentityCertificateUserInputResponses:outError:](self, "_preflightTimePersistentIDForIdentityCertificateUserInputResponses:outError:", 0, &v49));
  v10 = v49;
  if (v10)
  {
    v11 = v10;
    v7 = 0;
    v8 = 0;
    goto LABEL_18;
  }
  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUID"));
    -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:](self, "_retainDependencyBetweenPersistentID:andUUID:", v9, v13);

  }
  if (!objc_msgSend(v6, "SMIMEEnabled"))
  {
    v7 = 0;
    v8 = 0;
LABEL_11:
    v46 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler _getClientRestrictionsFromServerCertificatePersistentID:SMIMESigningIdentityPersistentID:SMIMEEncryptionIdentityPersistentID:outError:](self, "_getClientRestrictionsFromServerCertificatePersistentID:SMIMESigningIdentityPersistentID:SMIMEEncryptionIdentityPersistentID:outError:", v9, v8, v7, &v46));
    v11 = v46;
    if (!v11)
    {
      if (v15)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler _accountFromPayloadWithUserInputResponses:identityPersistentID:SMIMESigningIdentityPersistentID:SMIMEEncryptionIdentityPersistentID:](self, "_accountFromPayloadWithUserInputResponses:identityPersistentID:SMIMESigningIdentityPersistentID:SMIMEEncryptionIdentityPersistentID:", 0, v9, v8, v7));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "profile"));
        v42 = objc_msgSend(v16, "installType") != (id)2;

        v40 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "profile"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "identifier"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "profile"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUID"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v17, v20));

        v34 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
        v37 = kEASAccountClientType;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "persistentUUID"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "friendlyName"));
        v21 = MCLocalizedFormat(CFSTR("EAS_CLIENT_TYPE"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(v21);
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", v39));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "friendlyName"));
        v23 = MCLocalizedFormat(CFSTR("EAS_INSTALLATION_POLICY_WARNING"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v45 = 0;
        LOBYTE(v32) = 0;
        objc_msgSend(v34, "setClientRestrictions:overrideRestrictions:appsAndOptions:system:clientType:clientUUID:sender:localizedClientDescription:localizedWarning:shouldRecomputeNag:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:", v15, 0, 0, v42, v37, v36, v43, v33, v24, v32, 0, 0, 0, &v45);
        v11 = v45;

      }
      else
      {
        v11 = 0;
      }
    }

    goto LABEL_18;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "SMIMESigningIdentityUUID"));
  v48 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler _temporaryPersistentIDForIdentityUUID:outError:](self, "_temporaryPersistentIDForIdentityUUID:outError:", v14, &v48));
  v11 = v48;

  if (v11)
  {
    v7 = 0;
    goto LABEL_18;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "SMIMEEncryptionIdentityUUID"));
  v47 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler _temporaryPersistentIDForIdentityUUID:outError:](self, "_temporaryPersistentIDForIdentityUUID:outError:", v25, &v47));
  v11 = v47;

  if (!v11)
    goto LABEL_11;
LABEL_18:
  if (v9)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));
    -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v9, v26);

  }
  if (!v11)
    goto LABEL_24;
  v27 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "MCVerboseDescription"));
    *(_DWORD *)buf = 138543362;
    v51 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Error retrieving server policy for account. Error: %{public}@", buf, 0xCu);

  }
  v30 = 0;
LABEL_25:

  return v30;
}

- (void)unstageFromInstallationWithInstaller:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[16];

  if (!-[MCNewEASAccountPayloadHandler _isConfiguredWithSCEP](self, "_isConfiguredWithSCEP", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler _preflightTimePersistentIDForIdentityCertificateUserInputResponses:outError:](self, "_preflightTimePersistentIDForIdentityCertificateUserInputResponses:outError:", 0, 0));
    v6 = 0;
    v7 = 0;
    if (objc_msgSend(v4, "SMIMEEnabled"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "SMIMESigningIdentityUUID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler _temporaryPersistentIDForIdentityUUID:outError:](self, "_temporaryPersistentIDForIdentityUUID:outError:", v8, 0));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "SMIMEEncryptionIdentityUUID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler _temporaryPersistentIDForIdentityUUID:outError:](self, "_temporaryPersistentIDForIdentityUUID:outError:", v9, 0));

    }
    if (v5)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
      -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:](self, "_retainDependencyBetweenPersistentID:andUUID:", v5, v10);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler _accountFromPayloadWithUserInputResponses:identityPersistentID:SMIMESigningIdentityPersistentID:SMIMEEncryptionIdentityPersistentID:](self, "_accountFromPayloadWithUserInputResponses:identityPersistentID:SMIMESigningIdentityPersistentID:SMIMEEncryptionIdentityPersistentID:", 0, v5, v7, v6));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "profile"));
    v14 = objc_msgSend(v13, "installType");

    if (v11)
    {
      v29 = v14 != (id)2;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v31 = v7;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "profile"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
      v32 = v4;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v30 = v6;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "profile"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUID"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v17, v20));

      v7 = v31;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
      v23 = kEASAccountClientType;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "persistentUUID"));
      LOBYTE(v28) = 1;
      v25 = v23;
      v4 = v32;
      objc_msgSend(v22, "setClientRestrictions:overrideRestrictions:appsAndOptions:system:clientType:clientUUID:sender:localizedClientDescription:localizedWarning:shouldRecomputeNag:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:", 0, 0, 0, v29, v25, v24, v21, 0, 0, v28, 0, 0, 0, 0);

      v6 = v30;
    }
    else
    {
      v26 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Could not find an account, so could not set client restrictions.", buf, 2u);
      }
    }
    if (v5)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
      -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v5, v27);

    }
  }
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  unsigned int v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD *v64;
  id v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  BOOL v79;
  void *v81;
  void *v82;
  id v84;
  void *v85;
  id v86;
  void *v87;
  _QWORD v88[4];
  id v89;
  uint8_t *v90;
  uint64_t *v91;
  _QWORD v92[6];
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  char v96;
  uint8_t buf[8];
  uint8_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  dispatch_semaphore_t v102;
  id v103;
  uint64_t v104;
  id *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;

  v86 = a3;
  v9 = a4;
  v84 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v104 = 0;
  v105 = (id *)&v104;
  v106 = 0x3032000000;
  v107 = sub_10006DC5C;
  v108 = sub_10006DC6C;
  v109 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));
  v12 = objc_msgSend(v11, "BOOLValue");

  if (!v12)
  {
    v87 = 0;
    goto LABEL_5;
  }
  v13 = kMDMPersonaKey;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMDMPersonaKey));
  v15 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v13));
  else
    v87 = 0;

  v16 = kMCInstallProfileOptionManagingProfileIdentifier;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", kMCInstallProfileOptionManagingProfileIdentifier));
  v18 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
  {
    v85 = 0;
    goto LABEL_11;
  }
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v16));

  if (!v19)
  {
LABEL_5:
    v85 = 0;
    goto LABEL_12;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dmc_remoteManagementAccountForManagementProfileIdentifier:", v19));

  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
  v17 = (void *)v19;
LABEL_11:

LABEL_12:
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hostname"));
  if (v22)
  {

LABEL_15:
    v25 = v105;
    v103 = v105[5];
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler _installTimePersistentIDForIdentityCertificateOutError:](self, "_installTimePersistentIDForIdentityCertificateOutError:", &v103));
    objc_storeStrong(v25 + 5, v103);
    if (v105[5])
    {
      v27 = 0;
      v28 = 0;
LABEL_50:
      if (v26)
      {
        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUID"));
        -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v26, v76);

      }
      if (v27)
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUID"));
        -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v27, v77);

      }
      if (v28)
      {
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUID"));
        -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v28, v78);

      }
      goto LABEL_56;
    }
    if (objc_msgSend(v10, "SMIMEEnabled"))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "SMIMESigningIdentityUUID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "persistentIDForCertificateUUID:", v30));

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "SMIMEEncryptionIdentityUUID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "persistentIDForCertificateUUID:", v32));

    }
    else
    {
      v28 = 0;
      v27 = 0;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler _accountFromPayloadWithUserInputResponses:identityPersistentID:SMIMESigningIdentityPersistentID:SMIMEEncryptionIdentityPersistentID:](self, "_accountFromPayloadWithUserInputResponses:identityPersistentID:SMIMESigningIdentityPersistentID:SMIMEEncryptionIdentityPersistentID:", 0, v26, v27, v28));
    v38 = v37;
    if (v37)
    {
      if (v12)
      {
        objc_msgSend(v37, "setAccountBoolProperty:forKey:", 1, CFSTR("MCAccountIsManaged"));
        if (v85)
          objc_msgSend(v38, "setAccountProperty:forKey:", v85, ACAccountPropertyRemoteManagingAccountIdentifier);
      }
      if ((objc_msgSend(v10, "overridePreviousPassword") & 1) != 0)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "backingAccountInfo"));
        objc_msgSend(v39, "setAccountProperty:forKey:", &__kCFBooleanFalse, CFSTR("EASPayloadShouldPreserveOldPassword"));

        v40 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "EAS Payload asked to override old password", buf, 2u);
        }
      }
      else
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "backingAccountInfo"));
        objc_msgSend(v45, "setAccountProperty:forKey:", &__kCFBooleanTrue, CFSTR("EASPayloadShouldPreserveOldPassword"));

      }
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[MDMConfiguration sharedConfiguration](MDMConfiguration, "sharedConfiguration"));
      if ((objc_msgSend(v82, "isUserEnrollment") & 1) != 0
        || (v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "profile")),
            v47 = objc_msgSend(v46, "isUserEnrollmentProfile"),
            v46,
            v47))
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "easEnrollmentID"));
        v49 = MCkESExchangeDeviceID();
        v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v48, v50);

        v51 = MCkESExchangeAccountWipeOnly();
        v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
        objc_msgSend(v38, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v52);

        v53 = MCkESExchangeUserEnrollmentMode(objc_msgSend(v38, "setAccountProperty:forKey:", v87, ACAccountPropertyPersonaIdentifier));
        v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
        objc_msgSend(v38, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v54);

      }
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "backingAccountInfo"));
      -[MCACAccountPayloadHandler markIfUpdatingOverInstalledAccount:](self, "markIfUpdatingOverInstalledAccount:", v55);

      *(_QWORD *)buf = 0;
      v98 = buf;
      v99 = 0x3032000000;
      v100 = sub_10006DC5C;
      v101 = sub_10006DC6C;
      v102 = dispatch_semaphore_create(0);
      v93 = 0;
      v94 = &v93;
      v95 = 0x2020000000;
      v96 = 1;
      v56 = objc_msgSend(v86, "setAsideAccountIdentifiersForPayloadClass:", objc_opt_class(self));
      v81 = (void *)objc_claimAutoreleasedReturnValue(v56);
      v57 = objc_msgSend(v81, "count");
      if (v57)
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "backingAccountInfo"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[DASharedAccountProperties DAAccountIdentifiersToIgnoreForUniquenessCheck](DASharedAccountProperties, "DAAccountIdentifiersToIgnoreForUniquenessCheck"));
        objc_msgSend(v58, "setAccountProperty:forKey:", v81, v59);

      }
      v60 = sharedDAAccountStore(v57);
      v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "backingAccountInfo"));
      v92[0] = _NSConcreteStackBlock;
      v92[1] = 3221225472;
      v92[2] = sub_10006F590;
      v92[3] = &unk_1000E3E68;
      v92[4] = &v93;
      v92[5] = buf;
      objc_msgSend(v61, "canSaveAccount:withCompletionHandler:", v62, v92);

      dispatch_semaphore_wait(*((dispatch_semaphore_t *)v98 + 5), 0xFFFFFFFFFFFFFFFFLL);
      if (*((_BYTE *)v94 + 24))
      {
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "backingAccountInfo"));
        objc_msgSend(v63, "setAuthenticated:", 1);

        v88[0] = _NSConcreteStackBlock;
        v88[1] = 3221225472;
        v88[2] = sub_10006F5AC;
        v88[3] = &unk_1000E2F38;
        v90 = buf;
        v89 = v38;
        v91 = &v104;
        v64 = objc_retainBlock(v88);
        if (objc_msgSend(v87, "length"))
          v65 = +[DMCPersonaHelper performBlockUnderPersona:block:](DMCPersonaHelper, "performBlockUnderPersona:block:", v87, v64);
        else
          ((void (*)(_QWORD *))v64[2])(v64);

        v67 = v89;
      }
      else
      {
        v66 = MCErrorArray(CFSTR("EAS_ACCT_NOT_UNIQUE"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCEASErrorDomain, 21005, v67, MCErrorTypeFatal, 0));
        v69 = objc_msgSend(v68, "MCCopyAsPrimaryError");
        v70 = v105[5];
        v105[5] = v69;

      }
      _Block_object_dispose(&v93, 8);
      _Block_object_dispose(buf, 8);

      v42 = v82;
    }
    else
    {
      v41 = MCErrorArray(CFSTR("EAS_ACCT_CREATION_FAILED"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      v43 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCEASErrorDomain, 21004, v42, MCErrorTypeFatal, 0));
      v44 = v105[5];
      v105[5] = (id)v43;

    }
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "backingAccountInfo"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "identifier"));
    objc_msgSend(v10, "setAcAccountIdentifier:", v72);

    if (v26)
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUID"));
      -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:](self, "_retainDependencyBetweenPersistentID:andUUID:", v26, v73);

    }
    if (v27)
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUID"));
      -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:](self, "_retainDependencyBetweenPersistentID:andUUID:", v27, v74);

    }
    if (v28)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUID"));
      -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:](self, "_retainDependencyBetweenPersistentID:andUUID:", v28, v75);

    }
    if (v105[5])
      goto LABEL_50;
LABEL_59:
    objc_msgSend(v10, "setCertificatePersistentID:", v26);
    objc_msgSend(v10, "setSMIMESigningIdentityPersistentID:", v27);
    objc_msgSend(v10, "setSMIMEEncryptionIdentityPersistentID:", v28);
    v79 = 1;
    goto LABEL_60;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "useOAuth"));
  v24 = objc_msgSend(v23, "BOOLValue");

  if ((v24 & 1) != 0)
    goto LABEL_15;
  v33 = MCErrorArray(CFSTR("EAS_ACCT_NO_HOST_NAME"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v35 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", MCEASErrorDomain, 21003, v34, MCErrorTypeFatal, 0));
  v36 = v105[5];
  v105[5] = (id)v35;

  v28 = 0;
  v27 = 0;
  v26 = 0;
  if (!v105[5])
    goto LABEL_59;
LABEL_56:
  v79 = 0;
  if (a6)
    *a6 = objc_retainAutorelease(v105[5]);
LABEL_60:

  _Block_object_dispose(&v104, 8);
  return v79;
}

- (id)accountTypeIdentifiers
{
  _QWORD v3[2];

  v3[0] = ACAccountTypeIdentifierExchange;
  v3[1] = ACAccountTypeIdentifierHotmail;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2));
}

- (BOOL)isInstalled
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler _installedDAAccount](self, "_installedDAAccount"));
  v3 = v2 != 0;

  return v3;
}

- (void)setAsideWithInstaller:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MCNewEASAccountPayloadHandler;
  -[MCNewPayloadHandler setAsideWithInstaller:](&v12, "setAsideWithInstaller:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler _installedDAAccount](self, "_installedDAAccount"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backingAccountInfo"));
    -[MCACAccountPayloadHandler setSetAsideAccount:](self, "setSetAsideAccount:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backingAccountInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "credential"));
    -[MCNewEASAccountPayloadHandler setSetAsideAccountCredential:](self, "setSetAsideAccountCredential:", v9);

    -[MCNewEASAccountPayloadHandler setSetAsideDAAccount:](self, "setSetAsideDAAccount:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backingAccountInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    objc_msgSend(v4, "addSetAsideAccountIdentifier:forPayloadClass:", v11, objc_opt_class(self));

  }
}

- (void)unsetAside
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_semaphore_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  dispatch_semaphore_t v18;

  v15 = (id)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  if (objc_msgSend(v15, "userMode") == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler setAsideAccount](self, "setAsideAccount"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler _installedDAAccount](self, "_installedDAAccount"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler setAsideAccount](self, "setAsideAccount"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountPropertyForKey:", CFSTR("MCAccountIdentifer")));

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backingAccountInfo"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountPropertyForKey:", CFSTR("MCAccountIdentifer")));

      if (v6 && (!v8 || (objc_msgSend(v6, "isEqualToString:", v8) & 1) == 0))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler setAsideAccount](self, "setAsideAccount"));
        objc_msgSend(v9, "markAllPropertiesDirty");
        v10 = dispatch_semaphore_create(0);
        v11 = sharedDAAccountStore(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10006FAC8;
        v16[3] = &unk_1000E3E90;
        v17 = v9;
        v18 = v10;
        v13 = v10;
        v14 = v9;
        objc_msgSend(v12, "saveVerifiedAccount:withCompletionHandler:", v14, v16);

        dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
      }
      -[MCACAccountPayloadHandler setSetAsideAccount:](self, "setSetAsideAccount:", 0);
      -[MCNewEASAccountPayloadHandler setSetAsideAccountCredential:](self, "setSetAsideAccountCredential:", 0);

    }
  }
  else
  {

  }
}

- (void)remove
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned __int8 v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  os_log_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  unsigned int v28;
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
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  char *v50;
  uint64_t v51;
  _QWORD *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  char v62;
  uint8_t buf[4];
  MCNewEASAccountPayloadHandler *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  unsigned int v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  int v76;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if (v4)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler setAsideDAAccount](self, "setAsideDAAccount"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler setAsideAccountCredential](self, "setAsideAccountCredential"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
    v6 = objc_msgSend(v5, "userMode");

    if (v6 == 1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler _installedSetAsideACAccount](self, "_installedSetAsideACAccount"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler setAsideAccount](self, "setAsideAccount"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountPropertyForKey:", CFSTR("MCNativeAccountIdentifer")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountPropertyForKey:", CFSTR("MCNativeAccountIdentifer")));
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (v11)
      {
        v53 = v7;
      }
      else
      {
        v14 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v64 = (MCNewEASAccountPayloadHandler *)"-[MCNewEASAccountPayloadHandler remove]";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s On Shared iPad, and current payload doesn't own any ACAccount.", buf, 0xCu);
        }
        v53 = 0;
      }

      v13 = v11 ^ 1;
    }
    else
    {
      v53 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "backingAccountInfo"));
      v13 = 0;
    }
  }
  else
  {
    v12 = -[MCACAccountPayloadHandler updatedOverInstalledAccount](self, "updatedOverInstalledAccount");
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler _installedDAAccount](self, "_installedDAAccount"));
    if ((v12 & 1) != 0)
    {
      v13 = 0;
      v53 = 0;
      v54 = 0;
    }
    else
    {
      v53 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "backingAccountInfo"));
      v13 = 0;
      v54 = 0;
    }
  }
  if (v55)
  {
    if (v54)
    {
      if ((v13 & 1) != 0)
        v15 = objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler _installedSetAsideACAccount](self, "_installedSetAsideACAccount"));
      else
        v15 = objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler _installedACAccountOtherThanSelf](self, "_installedACAccountOtherThanSelf"));
      v16 = (void *)v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[DAAccount daAccountSubclassWithBackingAccountInfo:](DAAccount, "daAccountSubclassWithBackingAccountInfo:", v15));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "credential"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "backingAccountInfo"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "accountPropertyForKey:", CFSTR("EASPayloadShouldPreserveOldPassword")));
      v21 = objc_msgSend(v20, "BOOLValue");

      v22 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
      {
        v23 = v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler setAsideDAAccount](self, "setAsideDAAccount"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "backingAccountInfo"));
        *(_DWORD *)buf = 134219522;
        v64 = self;
        v65 = 2080;
        v66 = "-[MCNewEASAccountPayloadHandler remove]";
        v67 = 2112;
        v68 = v54;
        v69 = 2112;
        v70 = v16;
        v71 = 1024;
        v72 = v21;
        v73 = 2112;
        v74 = v25;
        v75 = 1024;
        v76 = v13;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%p %s - accountCredential %@, installedAccount %@ shouldPreservePassword %d setAsideDAAccount %@ lostAccountOwnership %d", buf, 0x40u);

      }
      if ((v13 & v21 & 1) != 0
        || (!v17 ? (v26 = 1) : (v26 = v13),
            (v26 & 1) == 0
         && (v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler setAsideDAAccount](self, "setAsideDAAccount")),
             v28 = objc_msgSend(v27, "isConsideredTheSame:", v17),
             v27,
             v28)))
      {
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_100070408;
        v57[3] = &unk_1000E4098;
        v58 = v16;
        v62 = v21;
        v59 = v17;
        v60 = v54;
        v61 = v18;
        v52 = objc_retainBlock(v57);

      }
      else
      {
        v52 = 0;
      }

    }
    else
    {
      v52 = 0;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "certificatePersistentID"));
    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "UUID"));
      -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v30, v31);

    }
    else
    {
      objc_msgSend(v55, "removeClientCertificateData");
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "SMIMESigningIdentityPersistentID"));
    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "UUID"));
      -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v32, v33);

    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "SMIMEEncryptionIdentityPersistentID"));
    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "UUID"));
      -[MCNewPayloadHandler _releaseDependencyBetweenPersistentID:andUUID:](self, "_releaseDependencyBetweenPersistentID:andUUID:", v34, v35);

    }
    if (v53)
    {
      +[MCFeatureOverrides accountRemovalTimeoutWithDefaultValue:](MCFeatureOverrides, "accountRemovalTimeoutWithDefaultValue:", 600.0);
      -[MCACAccountPayloadHandler _synchronouslyDeleteAccountAndAssociatedData:timeout:completion:](self, "_synchronouslyDeleteAccountAndAssociatedData:timeout:completion:", v53, v52);
    }
    else if (v52)
    {
      ((void (*)(_QWORD *, uint64_t, _QWORD))v52[2])(v52, 1, 0);
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "profile"));
    v39 = objc_msgSend(v38, "installType");

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "profile"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "identifier"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "profile"));
    v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "UUID"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v42, v45));

    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "persistentUUID"));
    v56 = 0;
    LOBYTE(v51) = 1;
    LOBYTE(v45) = objc_msgSend(v36, "setClientRestrictions:overrideRestrictions:appsAndOptions:system:clientType:clientUUID:sender:localizedClientDescription:localizedWarning:shouldRecomputeNag:outRestrictionsChanged:outEffectiveSettingsChanged:outRecomputedNag:outError:", 0, 0, 0, v39 != (id)2, kEASAccountClientType, v47, v46, 0, 0, v51, 0, 0, 0, &v56);
    v48 = v56;

    if ((v45 & 1) == 0)
    {
      v49 = _MCLogObjects[0];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "MCVerboseDescription"));
        *(_DWORD *)buf = 138543618;
        v64 = self;
        v65 = 2114;
        v66 = v50;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Error removing client restrictions: %{public}@, %{public}@", buf, 0x16u);

      }
    }

  }
}

- (id)_installedACAccountOtherThanSelf
{
  void *v3;
  unsigned int v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler installedACAccounts](self, "installedACAccounts"));
  v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Installed accounts %@", buf, 0xCu);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier", (_QWORD)v20));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCACAccountPayloadHandler setAsideAccount](self, "setAsideAccount"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
        v16 = objc_msgSend(v13, "isEqualToString:", v15);

        if ((v16 & 1) == 0)
        {
          v19 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v12;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Installed account other than self %@", buf, 0xCu);
          }
          v17 = v12;
          goto LABEL_17;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_17:

  return v17;
}

- (void)preflighterSuccessWithoutPolicyUpdate:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler preflightCompletionHandler](self, "preflightCompletionHandler", a3));

  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler preflightCompletionHandler](self, "preflightCompletionHandler"));
    v5[2](v5, 0, 0);

    -[MCNewEASAccountPayloadHandler setPreflightCompletionHandler:](self, "setPreflightCompletionHandler:", 0);
  }
}

- (void)preflighter:(id)a3 needsComplianceWithMCFeatures:(id)a4 perAccountPolicies:(id)a5
{
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler preflightCompletionHandler](self, "preflightCompletionHandler"));

  if (v6)
  {
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler preflightCompletionHandler](self, "preflightCompletionHandler"));
    ((void (**)(_QWORD, id, _QWORD))v7)[2](v7, v8, 0);

    -[MCNewEASAccountPayloadHandler setPreflightCompletionHandler:](self, "setPreflightCompletionHandler:", 0);
  }

}

- (void)preflighter:(id)a3 successWithMCFeatures:(id)a4 perAccountPolicies:(id)a5 policyKey:(id)a6
{
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler preflightCompletionHandler](self, "preflightCompletionHandler"));

  if (v7)
  {
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler preflightCompletionHandler](self, "preflightCompletionHandler"));
    ((void (**)(_QWORD, id, _QWORD))v8)[2](v8, v9, 0);

    -[MCNewEASAccountPayloadHandler setPreflightCompletionHandler:](self, "setPreflightCompletionHandler:", 0);
  }

}

- (void)preflighterRemoteWipeRequested:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v4 = MCEASErrorDomain;
  v5 = MCErrorArray(CFSTR("CANT_RETRIEVE_POLICY_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v4, 21001, v6, MCErrorTypeFatal, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler preflightCompletionHandler](self, "preflightCompletionHandler"));
  if (v7)
  {
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler preflightCompletionHandler](self, "preflightCompletionHandler"));
    ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v9);

    -[MCNewEASAccountPayloadHandler setPreflightCompletionHandler:](self, "setPreflightCompletionHandler:", 0);
  }

}

- (void)preflighterRemoteWipeRequestResponseAcknowledged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  int v8;
  MCNewEASAccountPayloadHandler *v9;

  v4 = a3;
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "My policy preflighter is wigging out. %{public}@", (uint8_t *)&v8, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler preflightCompletionHandler](self, "preflightCompletionHandler"));

  if (v6)
  {
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler preflightCompletionHandler](self, "preflightCompletionHandler"));
    v7[2](v7, 0, 0);

    -[MCNewEASAccountPayloadHandler setPreflightCompletionHandler:](self, "setPreflightCompletionHandler:", 0);
  }

}

- (void)preflighterAccountOnlyRemoteWipeRequested:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[16];

  v4 = a3;
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Account-only wipe requested by server.", buf, 2u);
  }
  v6 = MCEASErrorDomain;
  v7 = MCErrorArray(CFSTR("EAS_SERVER_REQUESTED_ACCOUNT_ONLY_WIPE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v6, 21008, v8, MCErrorTypeFatal, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler preflightCompletionHandler](self, "preflightCompletionHandler"));
  if (v10)
  {
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler preflightCompletionHandler](self, "preflightCompletionHandler"));
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v9);

    -[MCNewEASAccountPayloadHandler setPreflightCompletionHandler:](self, "setPreflightCompletionHandler:", 0);
  }

}

- (void)preflighterAccountOnlyRemoteWipeRequestResponseAcknowledged:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  MCNewEASAccountPayloadHandler *v13;

  v4 = a3;
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Account is being wiped per server account-only wipe request. My policy preflighter is wigging out. %{public}@", buf, 0xCu);
  }
  v6 = MCEASErrorDomain;
  v7 = MCErrorArray(CFSTR("EAS_SERVER_REQUESTED_ACCOUNT_ONLY_WIPE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v6, 21008, v8, MCErrorTypeFatal, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler preflightCompletionHandler](self, "preflightCompletionHandler"));
  if (v10)
  {
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler preflightCompletionHandler](self, "preflightCompletionHandler"));
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v9);

    -[MCNewEASAccountPayloadHandler setPreflightCompletionHandler:](self, "setPreflightCompletionHandler:", 0);
  }

}

- (void)preflighter:(id)a3 error:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler preflightCompletionHandler](self, "preflightCompletionHandler"));

  if (v5)
  {
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler preflightCompletionHandler](self, "preflightCompletionHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEASAccountPayloadHandler _errorFromPolicyPreflightError:](self, "_errorFromPolicyPreflightError:", v8));
    ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, 0, v7);

    -[MCNewEASAccountPayloadHandler setPreflightCompletionHandler:](self, "setPreflightCompletionHandler:", 0);
  }

}

- (DAAccount)setAsideDAAccount
{
  return self->_setAsideDAAccount;
}

- (void)setSetAsideDAAccount:(id)a3
{
  objc_storeStrong((id *)&self->_setAsideDAAccount, a3);
}

- (ACAccountCredential)setAsideAccountCredential
{
  return self->_setAsideAccountCredential;
}

- (void)setSetAsideAccountCredential:(id)a3
{
  objc_storeStrong((id *)&self->_setAsideAccountCredential, a3);
}

- (id)accountValidationCompletionHandler
{
  return self->_accountValidationCompletionHandler;
}

- (void)setAccountValidationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)preflightCompletionHandler
{
  return self->_preflightCompletionHandler;
}

- (void)setPreflightCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_preflightCompletionHandler, 0);
  objc_storeStrong(&self->_accountValidationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_setAsideAccountCredential, 0);
  objc_storeStrong((id *)&self->_setAsideDAAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_embeddedCertificatePersistentID, 0);
}

@end
