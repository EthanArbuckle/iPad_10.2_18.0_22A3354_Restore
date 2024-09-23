@implementation MCNewEmailAccountPayloadHandler

- (MCNewEmailAccountPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  MCNewEmailAccountPayloadHandler *v4;
  NSConditionLock *v5;
  NSConditionLock *validationLock;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCNewEmailAccountPayloadHandler;
  v4 = -[MCNewPayloadHandler initWithPayload:profileHandler:](&v8, "initWithPayload:profileHandler:", a3, a4);
  if (v4)
  {
    v5 = (NSConditionLock *)objc_msgSend(objc_alloc((Class)NSConditionLock), "initWithCondition:", 0);
    validationLock = v4->_validationLock;
    v4->_validationLock = v5;

  }
  return v4;
}

- (id)userInputFields
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned __int8 v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  const __CFString *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v67;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "emailAccountName"));

  if (!v5)
  {
    v6 = kMCEAPEmailAccountNameKey;
    v7 = MCLocalizedString(CFSTR("SENDER_NAME_PROMPT_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "emailAccountDescription"));
    v10 = MCLocalizedFormat(CFSTR("SENDER_NAME_DESCRIPTION_P_ACCOUNT"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", v6, v8, v11, 0, 0, 0, 0, 0, 6));
    objc_msgSend(v3, "addObject:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "emailAddress"));

  if (!v13)
  {
    v14 = kMCEAPEmailAddressKey;
    v15 = MCLocalizedString(CFSTR("EMAIL_PROMPT_TITLE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
    v18 = MCLocalizedFormat(CFSTR("EMAIL_PROMPT_DESCRIPTION"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", v14, v16, v19, 0, 0, 0, 0, 0, 2));
    objc_msgSend(v3, "addObject:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incomingMailServerUsername"));

  if (!v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "emailAccountDescription"));
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "emailAccountDescription"));
      v24 = CFSTR("EMAIL_INCOMING_USER_NAME_P_ACCOUNT");
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incomingMailServerHostname"));
      v24 = CFSTR("EMAIL_INCOMING_USER_NAME_PROMPT");
    }
    v25 = MCLocalizedFormat(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

    v27 = kMCEAPIncomingMailServerUsernameKey;
    v28 = MCLocalizedString(CFSTR("USERNAME_PROMPT_TITLE"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", v27, v29, v26, 0, 0, 0, 0, 0, 0));
    objc_msgSend(v3, "addObject:", v30);

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incomingMailServerAuthentication"));
  v32 = kMCEmailAccountPayloadAuthenticationTypeNone;
  if ((objc_msgSend(v31, "isEqualToString:", kMCEmailAccountPayloadAuthenticationTypeNone) & 1) == 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incomingPassword"));

    if (v33)
      goto LABEL_17;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "emailAccountDescription"));
    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "emailAccountDescription"));
      v36 = CFSTR("EMAIL_INCOMING_PASSWORD_P_ACCOUNT");
    }
    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incomingMailServerHostname"));
      v36 = CFSTR("EMAIL_INCOMING_PASSWORD_PROMPT");
    }
    v37 = MCLocalizedFormat(v36);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v37);

    v38 = kMCEAPIncomingPasswordKey;
    v39 = MCLocalizedString(CFSTR("PASSWORD_PROMPT_TITLE"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v41 = MCLocalizedString(CFSTR("EMAIL_PASSWORD_PLACEHOLDER"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", v38, v40, v31, 0, 0, 0, v42, 0, 3));
    objc_msgSend(v3, "addObject:", v43);

  }
LABEL_17:
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outgoingMailServerAuthentication"));
  v45 = objc_msgSend(v44, "isEqualToString:", v32);

  if ((v45 & 1) == 0)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "emailAccountDescription"));
    if (v46)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "emailAccountDescription"));
      v67 = v47;
      v48 = CFSTR("EMAIL_OUTGOING_USER_NAME_P_ACCOUNT");
    }
    else
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outgoingMailServerHostname"));
      v67 = v47;
      v48 = CFSTR("EMAIL_OUTGOING_USER_NAME_PROMPT");
    }
    v49 = MCLocalizedFormat(v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);

    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outgoingMailServerUsername", v67));
    if (!v51)
    {
      v52 = kMCEAPOutgoingMailServerUsernameKey;
      v53 = MCLocalizedString(CFSTR("USERNAME_PROMPT_TITLE"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", v52, v54, v50, 0, 0, 0, 0, 0, 0));
      objc_msgSend(v3, "addObject:", v55);

    }
    v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outgoingPassword"));
    if (v56)
    {
      v57 = (void *)v56;
    }
    else
    {
      if ((objc_msgSend(v4, "outgoingPasswordSameAsIncomingPassword") & 1) != 0)
      {
LABEL_31:

        goto LABEL_32;
      }
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "emailAccountDescription"));
      if (v58)
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "emailAccountDescription"));
        v60 = CFSTR("EMAIL_OUTGOING_PASSWORD_P_ACCOUNT");
      }
      else
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outgoingMailServerHostname"));
        v60 = CFSTR("EMAIL_OUTGOING_PASSWORD_PROMPT");
      }
      v61 = MCLocalizedFormat(v60);
      v62 = objc_claimAutoreleasedReturnValue(v61);

      v63 = kMCEAPOutgoingPasswordKey;
      v64 = MCLocalizedString(CFSTR("PASSWORD_PROMPT_TITLE"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:](MCNewPayloadHandler, "promptDictionaryForKey:title:description:retypeDescription:finePrint:defaultValue:placeholderValue:minimumLength:fieldType:flags:", v63, v57, v62, 0, 0, 0, 0, 0, 3));
      objc_msgSend(v3, "addObject:", v65);

      v50 = (void *)v62;
    }

    goto LABEL_31;
  }
LABEL_32:

  return v3;
}

- (id)_authSchemeForAuthenticationMethod:(id)a3
{
  id v3;
  id *v4;
  __CFString *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", kMCEmailAccountPayloadAuthenticationTypeCRAMMD5) & 1) != 0)
  {
    v4 = (id *)&MFAuthSchemeCramMd5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kMCEmailAccountPayloadAuthenticationTypeNTLM) & 1) != 0)
  {
    v4 = (id *)&MFAuthSchemeNTLM;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", kMCEmailAccountPayloadAuthenticationTypeHTTPMD5))
    {
      v5 = &stru_1000E4AA0;
      goto LABEL_8;
    }
    v4 = (id *)&MFAuthSchemeDigestMD5;
  }
  v5 = (__CFString *)*v4;
LABEL_8:

  return v5;
}

- (id)_persistentIDForCertificateUUID:(id)a3 notFoundLocErrorString:(id)a4 badLocErrorString:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v31;

  v10 = a4;
  v11 = a5;
  if (a3)
  {
    v12 = a3;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "persistentIDForCertificateUUID:", v12));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "profile"));
      v17 = +[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:](MCKeychain, "copyIdentityWithPersistentID:useSystemKeychain:", v14, objc_msgSend(v16, "isInstalledForSystem"));

      if (v17)
      {
        CFRelease(v17);
        goto LABEL_11;
      }
      v27 = MCEmailErrorDomain;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "friendlyName"));
      v31 = v21;
      v28 = MCErrorArray(v11);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v24 = MCErrorTypeFatal;
      v25 = v27;
      v26 = 7004;
    }
    else
    {
      v19 = MCEmailErrorDomain;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "friendlyName"));
      v31 = v21;
      v22 = MCErrorArray(v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v24 = MCErrorTypeFatal;
      v25 = v19;
      v26 = 7003;
    }
    v29 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v25, v26, v23, v24, v31, 0));

    if (v29)
    {
      if (a6)
      {
        v29 = objc_retainAutorelease(v29);
        v18 = 0;
        *a6 = v29;
      }
      else
      {
        v18 = 0;
      }
      goto LABEL_12;
    }
LABEL_11:
    v18 = v14;
    v29 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v18 = 0;
LABEL_13:

  return v18;
}

+ (id)MCACAccountIdentifierWithIncomingAccountInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("MCNewEmailAccountPayloadHandlerAccountType")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", MailAccountHostname));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", MFMailAccountUsername));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewEmailAccountPayloadHandler unhashedAccountIdentifierWithType:hostname:username:](MCNewEmailAccountPayloadHandler, "unhashedAccountIdentifierWithType:hostname:username:", v4, v5, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "MCHashedIdentifier"));

  return v8;
}

+ (id)MCACAccountIdentifierWithOutgoingAccountInfo:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = MailAccountHostname;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", MFMailAccountUsername));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewEmailAccountPayloadHandler unhashedAccountIdentifierWithType:hostname:username:](MCNewEmailAccountPayloadHandler, "unhashedAccountIdentifierWithType:hostname:username:", CFSTR("smtp"), v5, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "MCHashedIdentifier"));

  return v8;
}

+ (id)unhashedAccountIdentifierWithType:(id)a3 hostname:(id)a4 username:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v7 = a5;
  v8 = 0;
  if (a3)
  {
    if (a4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@|%@"), a3, a4));
      v8 = v9;
      if (v7)
      {
        if (v9)
        {
          v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("|%@"), v7));

          v8 = (void *)v10;
        }
      }
    }
  }

  return v8;
}

- (id)_incomingAccountInfoDictionaryWithUserInput:(id)a3 isPreflight:(BOOL)a4 outError:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id *v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  os_log_t v63;
  NSObject *v64;
  void *v65;
  id v66;
  void *v68;
  void *v69;
  _BOOL4 v70;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint8_t buf[4];
  void *v82;

  v70 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v9 = kMCEAPEmailAddressKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "emailAddress"));
  v11 = objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler prioritizeUserInput:key:overField:](MCNewPayloadHandler, "prioritizeUserInput:key:overField:", v6, v9, v10));

  v12 = kMCEAPIncomingMailServerUsernameKey;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "incomingMailServerUsername"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler prioritizeUserInput:key:overField:](MCNewPayloadHandler, "prioritizeUserInput:key:overField:", v6, v12, v13));

  v14 = kMCEAPIncomingMailServerHostnameKey;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "incomingMailServerHostname"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler prioritizeUserInput:key:overField:](MCNewPayloadHandler, "prioritizeUserInput:key:overField:", v6, v14, v15));

  v17 = kMCEAPIncomingPasswordKey;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "incomingPassword"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler prioritizeUserInput:key:overField:](MCNewPayloadHandler, "prioritizeUserInput:key:overField:", v6, v17, v18));

  v19 = kMCEAPEmailAccountDescriptionKey;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "emailAccountDescription"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler prioritizeUserInput:key:overField:](MCNewPayloadHandler, "prioritizeUserInput:key:overField:", v6, v19, v20));

  v21 = kMCEAPEmailAccountNameKey;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "emailAccountName"));
  v23 = objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler prioritizeUserInput:key:overField:](MCNewPayloadHandler, "prioritizeUserInput:key:overField:", v6, v21, v22));

  if (v11)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v11));
    objc_msgSend(v7, "MCSetObjectIfNotNil:forKey:", v24, MailAccountEmailAddresses);

  }
  objc_msgSend(v7, "MCSetObjectIfNotNil:forKey:", v76, MFMailAccountUsername);
  objc_msgSend(v7, "MCSetObjectIfNotNil:forKey:", v16, MailAccountHostname);
  v25 = MailAccountPassword;
  objc_msgSend(v7, "MCSetObjectIfNotNil:forKey:", v75, MailAccountPassword);
  objc_msgSend(v7, "MCSetObjectIfNotNil:forKey:", v74, MFMailAccountDescription);
  v72 = (void *)v23;
  objc_msgSend(v7, "MCSetObjectIfNotNil:forKey:", v23, MailAccountFullUserName);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "incomingMailServerPortNumber"));
  objc_msgSend(v7, "MCSetObjectIfNotNil:forKey:", v26, MailAccountPortNumber);

  if (objc_msgSend(v8, "incomingMailServerUseSSL"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    objc_msgSend(v7, "setObject:forKey:", v27, MailAccountSSLEnabled);

  }
  if (objc_msgSend(v8, "preventMove"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "preventMove")));
    objc_msgSend(v7, "setObject:forKey:", v28, MFMailAccountRestrictMessageTransfersToOtherAccounts);

  }
  if (objc_msgSend(v8, "preventAppSheet"))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "preventAppSheet")));
    objc_msgSend(v7, "setObject:forKey:", v29, MFMailAccountRestrictSendingFromExternalProcesses);

  }
  if (objc_msgSend(v8, "isRecentsSyncingDisabled"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    objc_msgSend(v7, "setObject:forKey:", v30, MFMailAccountRestrictRecentsSyncing);

  }
  if (objc_msgSend(v8, "isMailDropEnabled"))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    objc_msgSend(v7, "setObject:forKey:", v31, MFMailAccountSupportsMailDrop);

  }
  v73 = (void *)v11;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "emailAccountType"));
  v33 = objc_msgSend(v32, "isEqualToString:", kMCEmailAccountPayloadTypeIMAP);

  if (v33)
    v34 = CFSTR("imap");
  else
    v34 = CFSTR("pop");
  objc_msgSend(v7, "setValue:forKey:", v34, CFSTR("MCNewEmailAccountPayloadHandlerAccountType"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "incomingMailServerAuthentication"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEmailAccountPayloadHandler _authSchemeForAuthenticationMethod:](self, "_authSchemeForAuthenticationMethod:", v35));
  objc_msgSend(v7, "setObject:forKey:", v36, MFMailAccountAuthenticationScheme);

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v25));
  if (v37)
    v38 = &__kCFBooleanTrue;
  else
    v38 = &__kCFBooleanFalse;
  objc_msgSend(v7, "setObject:forKey:", v38, ACAccountPropertyShouldNeverUseSyncableCredential);
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "incomingMailServerIMAPPathPrefix"));
  if (v39 && -[__CFString isEqualToString:](v34, "isEqualToString:", CFSTR("imap")))
    objc_msgSend(v7, "setObject:forKey:", v39, IMAPServerPathPrefix);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewEmailAccountPayloadHandler unhashedAccountIdentifierWithType:hostname:username:](MCNewEmailAccountPayloadHandler, "unhashedAccountIdentifierWithType:hostname:username:", v34, v16, v76));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "profile"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "displayName"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@|%@"), v40, v42));

  objc_msgSend(v7, "setObject:forKey:", v43, MailAccountManagedTag);
  if (!objc_msgSend(v8, "SMIMEEnabled"))
  {
    v48 = 0;
    goto LABEL_52;
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "SMIMESigningIdentityUUID"));

  if (v44)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "SMIMESigningIdentityUUID"));
    if (v70)
    {
      v80 = 0;
      v46 = (id *)&v80;
      v47 = objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler _temporaryPersistentIDForIdentityUUID:outError:](self, "_temporaryPersistentIDForIdentityUUID:outError:", v45, &v80));
    }
    else
    {
      v79 = 0;
      v46 = (id *)&v79;
      v47 = objc_claimAutoreleasedReturnValue(-[MCNewEmailAccountPayloadHandler _persistentIDForCertificateUUID:notFoundLocErrorString:badLocErrorString:outError:](self, "_persistentIDForCertificateUUID:notFoundLocErrorString:badLocErrorString:outError:", v45, CFSTR("EMAIL_ERROR_SMIME_SIGNING_CERT_NOT_FOUND_P_PAYLOAD"), CFSTR("EMAIL_ERROR_SMIME_SIGNING_CERT_BAD_P_PAYLOAD"), &v79));
    }
    v49 = (void *)v47;
    v48 = *v46;

    if (v48)
      goto LABEL_51;
    if (!v49)
    {
      v61 = MCEmailErrorDomain;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "friendlyName"));
      v62 = MCErrorArray(CFSTR("EMAIL_ERROR_SMIME_SIGNING_CERT_NOT_FOUND_P_PAYLOAD"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(v62);
      v48 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v61, 7003, v57, MCErrorTypeFatal, v69, 0));
      goto LABEL_50;
    }
    objc_msgSend(v7, "setObject:forKey:", v49, CFSTR("MCSMIMESigningIdentityPersistentID"));

  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "SMIMESigningEnabled"));
  if (v49)
  {
    objc_msgSend(v7, "setObject:forKey:", v49, MFMailAccountSigningEnabled);
  }
  else
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "SMIMESigningIdentityUUID"));

    if (v50)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      objc_msgSend(v7, "setObject:forKey:", v51, MFMailAccountSigningEnabled);

    }
  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "SMIMESigningUserOverrideable")));
  objc_msgSend(v7, "setObject:forKey:", v52, MFMailAccountSigningUserOverrideable);
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "SMIMESigningIdentityUserOverrideable")));
  objc_msgSend(v7, "setObject:forKey:");
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "SMIMEEncryptionIdentityUUID"));

  if (!v53)
  {
LABEL_42:
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "SMIMEEncryptionEnabled"));
    if (v57)
    {
      objc_msgSend(v7, "setObject:forKey:", v57, MFMailAccountEncryptionEnabled);
    }
    else
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "SMIMEEncryptionIdentityUUID"));

      if (v58)
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
        objc_msgSend(v7, "setObject:forKey:", v59, MFMailAccountEncryptionEnabled);

      }
    }
    if (objc_msgSend(v8, "SMIMEEncryptByDefaultUserOverrideable"))
      objc_msgSend(v7, "setObject:forKey:", &__kCFBooleanTrue, MFMailAccountEncryptByDefaultUserOverrideable);
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "SMIMEEncryptionIdentityUserOverrideable")));
    objc_msgSend(v7, "setObject:forKey:", v60, MFMailAccountEncryptionIdentityUserOverrideable);

    v48 = 0;
    goto LABEL_50;
  }
  v68 = v52;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "SMIMEEncryptionIdentityUUID"));
  if (v70)
  {
    v78 = 0;
    v55 = (id *)&v78;
    v56 = objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler _temporaryPersistentIDForIdentityUUID:outError:](self, "_temporaryPersistentIDForIdentityUUID:outError:", v54, &v78));
  }
  else
  {
    v77 = 0;
    v55 = (id *)&v77;
    v56 = objc_claimAutoreleasedReturnValue(-[MCNewEmailAccountPayloadHandler _persistentIDForCertificateUUID:notFoundLocErrorString:badLocErrorString:outError:](self, "_persistentIDForCertificateUUID:notFoundLocErrorString:badLocErrorString:outError:", v54, CFSTR("EMAIL_ERROR_SMIME_ENCRYPTION_CERT_NOT_FOUND_P_PAYLOAD"), CFSTR("EMAIL_ERROR_SMIME_ENCRYPTION_CERT_BAD_P_PAYLOAD"), &v77));
  }
  v57 = (void *)v56;
  v48 = *v55;

  if (!v48)
  {
    objc_msgSend(v7, "setObject:forKey:", v57, CFSTR("MCSMIMEEncryptionIdentityPersistentID"));

    v52 = v68;
    goto LABEL_42;
  }
  v52 = v68;
LABEL_50:

LABEL_51:
LABEL_52:

  if (v48)
  {
    v63 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v64 = v63;
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "MCVerboseDescription"));
      *(_DWORD *)buf = 138543362;
      v82 = v65;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Cannot create incoming account dictionary. Error: %{public}@", buf, 0xCu);

    }
    v66 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v48);
  }
  else
  {
    v66 = v7;
  }

  return v66;
}

- (id)_incomingAccountWithAccountInfo:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  _QWORD *v7;
  objc_class *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  id v25;
  NSString *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *j;
  uint64_t v40;
  void *v41;
  void *v42;
  NSString *v43;
  NSString *incomingACAccountIdentifier;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MCNewEmailAccountPayloadHandlerAccountType")));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("imap"));
  v7 = IMAPAccount_ptr;
  if (!v6)
    v7 = POPAccount_ptr;
  v8 = (objc_class *)objc_opt_class(*v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v10 = objc_msgSend(v9, "userMode");

  if (v10 == 1)
  {
    v47 = v5;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
    v12 = v11;
    v13 = &ACAccountTypeIdentifierIMAP;
    if (!v6)
      v13 = &ACAccountTypeIdentifierPOP;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountTypeWithAccountTypeIdentifier:", *v13));
    v15 = objc_msgSend(objc_alloc((Class)ACAccount), "initWithAccountType:", v14);
    objc_msgSend(v15, "setManagingOwnerIdentifier:", kMCAccountManagingOwnerIdentifier);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "friendlyName"));
    objc_msgSend(v15, "setManagingSourceName:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewEmailAccountPayloadHandler MCACAccountIdentifierWithIncomingAccountInfo:](MCNewEmailAccountPayloadHandler, "MCACAccountIdentifierWithIncomingAccountInfo:", v4));
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
      objc_msgSend(v15, "setAccountProperty:forKey:", v19, CFSTR("MCAccountIdentifer"));

      objc_msgSend(v15, "setIdentifier:", v18);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "supportedDataclassesForAccountType:", v14, v12));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v53 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(v15, "setProvisioned:forDataclass:", 1, *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i));
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v22);
    }
    objc_msgSend(v15, "setAuthenticated:", 1);
    v25 = objc_msgSend(v4, "mutableCopy");
    v26 = NSStringFromClass(v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    objc_msgSend(v25, "setObject:forKey:", v27, MFMailAccountClass);

    v28 = objc_msgSend([v8 alloc], "initWithPersistentAccount:", v15);
    objc_msgSend(v28, "_setAccountProperties:", v25);

    v5 = v47;
  }
  else
  {
    v28 = -[objc_class newAccountWithDictionary:](v8, "newAccountWithDictionary:", v4);
    v29 = kMCAccountManagingOwnerIdentifier;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "persistentAccount"));
    objc_msgSend(v30, "setManagingOwnerIdentifier:", v29);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "friendlyName"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "persistentAccount"));
    objc_msgSend(v33, "setManagingSourceName:", v32);

  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "persistentAccount"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "provisionedDataclasses"));

  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v37; j = (char *)j + 1)
      {
        if (*(_QWORD *)v49 != v38)
          objc_enumerationMutation(v35);
        v40 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j);
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "persistentAccount"));
        objc_msgSend(v41, "setEnabled:forDataclass:", 1, v40);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v37);
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "persistentAccount"));
  v43 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "identifier"));
  incomingACAccountIdentifier = self->_incomingACAccountIdentifier;
  self->_incomingACAccountIdentifier = v43;

  return v28;
}

- (id)_outgoingAccountInfoDictionaryWithUserInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = kMCEAPOutgoingMailServerUsernameKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "outgoingMailServerUsername"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler prioritizeUserInput:key:overField:](MCNewPayloadHandler, "prioritizeUserInput:key:overField:", v4, v7, v8));

  v10 = kMCEAPOutgoingMailServerHostnameKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "outgoingMailServerHostname"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler prioritizeUserInput:key:overField:](MCNewPayloadHandler, "prioritizeUserInput:key:overField:", v4, v10, v11));

  v13 = kMCEAPIncomingPasswordKey;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "incomingPassword"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler prioritizeUserInput:key:overField:](MCNewPayloadHandler, "prioritizeUserInput:key:overField:", v4, v13, v14));

  v16 = kMCEAPOutgoingPasswordKey;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "outgoingPassword"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewPayloadHandler prioritizeUserInput:key:overField:](MCNewPayloadHandler, "prioritizeUserInput:key:overField:", v4, v16, v17));

  objc_msgSend(v6, "MCSetObjectIfNotNil:forKey:", v9, MFMailAccountUsername);
  objc_msgSend(v6, "MCSetObjectIfNotNil:forKey:", v12, MailAccountHostname);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "outgoingMailServerPortNumber"));
  objc_msgSend(v6, "MCSetObjectIfNotNil:forKey:", v19, MailAccountPortNumber);

  if (v15 && objc_msgSend(v5, "outgoingPasswordSameAsIncomingPassword"))
  {
    v20 = MailAccountPassword;
    v21 = v6;
    v22 = v15;
  }
  else
  {
    v20 = MailAccountPassword;
    if (!v18)
      goto LABEL_7;
    v21 = v6;
    v22 = v18;
  }
  objc_msgSend(v21, "setObject:forKey:", v22, v20);
LABEL_7:
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "outgoingMailServerAuthentication"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEmailAccountPayloadHandler _authSchemeForAuthenticationMethod:](self, "_authSchemeForAuthenticationMethod:", v23));
  objc_msgSend(v6, "setObject:forKey:", v24, MFMailAccountAuthenticationScheme);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v20));
  if (v25)
    v26 = &__kCFBooleanTrue;
  else
    v26 = &__kCFBooleanFalse;
  objc_msgSend(v6, "setObject:forKey:", v26, ACAccountPropertyShouldNeverUseSyncableCredential);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewEmailAccountPayloadHandler unhashedAccountIdentifierWithType:hostname:username:](MCNewEmailAccountPayloadHandler, "unhashedAccountIdentifierWithType:hostname:username:", CFSTR("smtp"), v12, v9));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "profile"));
  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "displayName"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@|%@"), v27, v29));

  objc_msgSend(v6, "setObject:forKey:", v30, MailAccountManagedTag);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "outgoingMailServerAuthentication"));
  LOBYTE(v29) = objc_msgSend(v31, "isEqualToString:", kMCEmailAccountPayloadAuthenticationTypeNone);

  if ((v29 & 1) == 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    objc_msgSend(v6, "setObject:forKey:", v32, DeliveryAccountShouldUseAuthentication);

  }
  if (objc_msgSend(v5, "outgoingMailServerUseSSL"))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    objc_msgSend(v6, "setObject:forKey:", v33, MailAccountSSLEnabled);

  }
  return v6;
}

- (id)_outgoingAccountWithAccountInfo:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSString *v27;
  NSString *outgoingACAccountIdentifier;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v6 = objc_msgSend(v5, "userMode");

  if (v6 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountTypeWithAccountTypeIdentifier:", ACAccountTypeIdentifierSMTP));
    v9 = objc_msgSend(objc_alloc((Class)ACAccount), "initWithAccountType:", v8);
    objc_msgSend(v9, "setManagingOwnerIdentifier:", kMCAccountManagingOwnerIdentifier);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "friendlyName"));
    objc_msgSend(v9, "setManagingSourceName:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCNewEmailAccountPayloadHandler MCACAccountIdentifierWithOutgoingAccountInfo:](MCNewEmailAccountPayloadHandler, "MCACAccountIdentifierWithOutgoingAccountInfo:", v4));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      objc_msgSend(v9, "setAccountProperty:forKey:", v13, CFSTR("MCAccountIdentifer"));

      objc_msgSend(v9, "setIdentifier:", v12);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "supportedDataclassesForAccountType:", v8));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v9, "setProvisioned:forDataclass:", 1, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v18));
          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v16);
    }
    objc_msgSend(v9, "setAuthenticated:", 1);
    v19 = objc_msgSend(v4, "mutableCopy");
    v20 = (objc_class *)objc_opt_class(SMTPAccount);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v19, "setObject:forKey:", v22, MFMailAccountClass);

    v23 = objc_msgSend(objc_alloc((Class)SMTPAccount), "initWithPersistentAccount:", v9);
    objc_msgSend(v23, "_setAccountProperties:", v19);

  }
  else
  {
    v23 = +[SMTPAccount newAccountWithDictionary:](SMTPAccount, "newAccountWithDictionary:", v4);
    v24 = kMCAccountManagingOwnerIdentifier;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "persistentAccount"));
    objc_msgSend(v25, "setManagingOwnerIdentifier:", v24);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "friendlyName"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "persistentAccount"));
    objc_msgSend(v9, "setManagingSourceName:", v8);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "persistentAccount"));
  v27 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
  outgoingACAccountIdentifier = self->_outgoingACAccountIdentifier;
  self->_outgoingACAccountIdentifier = v27;

  return v23;
}

- (void)_validateIncomingAccountOnThread
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  v3 = objc_autoreleasePoolPush();
  self->_validationResult = 0;
  self->_validationDone = 0;
  v4 = objc_alloc_init((Class)MFAccountValidator);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "validateAccount:useSSL:", self->_incomingAccount, self->_incomingAccountUsesSSL);
  while (!self->_validationDone)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceNow:", 0.3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v6, "runUntilDate:", v5);

  }
  -[NSConditionLock lockWhenCondition:](self->_validationLock, "lockWhenCondition:", 1);
  -[NSConditionLock unlockWithCondition:](self->_validationLock, "unlockWithCondition:", 2);

  objc_autoreleasePoolPop(v3);
}

- (id)_errorFromValidationError:(id)a3
{
  id v3;
  char *v4;
  id v5;
  id *v6;
  uint64_t v7;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  int v18;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = (char *)objc_msgSend(v3, "code");
  v5 = MCErrorTypeSkippable;
  if ((unint64_t)(v4 - 1043) >= 3)
  {
    if (v4 == (char *)1030)
    {
      v7 = 7002;
      goto LABEL_10;
    }
    v6 = (id *)&MCErrorTypeFatal;
    if (v4 == (char *)1032)
    {
      v6 = (id *)&MCErrorTypeRetryable;
      v7 = 7001;
    }
    else
    {
      v7 = 7002;
    }
  }
  else
  {
    v6 = (id *)&MCErrorTypeRetryable;
    v7 = 7000;
  }
  v9 = *v6;

  v5 = v9;
LABEL_10:
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));

  if (!v10)
  {
    v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v18 = (int)v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Validation error %u does not have a description.", buf, 8u);
    }
    v12 = MCLocalizedFormat(CFSTR("UNKNOWN_ERROR"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v12);
  }
  v13 = MCEmailErrorDomain;
  v14 = MCErrorArrayFromLocalizedDescription(v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v13, v7, v15, v5));

  return v16;
}

- (void)accountValidator:(id)a3 finishedValidationOfAccount:(id)a4 usedSSL:(BOOL)a5
{
  id v7;
  DeliveryAccount *v8;
  DeliveryAccount *outgoingAccount;
  os_log_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const char *v14;
  os_log_t v15;
  void *v16;
  NSError *v17;
  NSError *validationError;
  int v19;
  void *v20;

  v7 = a3;
  v8 = (DeliveryAccount *)a4;
  if (!objc_msgSend(v7, "accountIsValid"))
  {
    self->_validationResult = 0;
    if (self->_incomingAccount == v8)
    {
      v15 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      v11 = v15;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "error"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "MCVerboseDescription"));
      v19 = 138543362;
      v20 = v13;
      v14 = "Error validating incoming server information: %{public}@";
    }
    else
    {
      if (self->_outgoingAccount != v8)
        goto LABEL_13;
      v10 = _MCLogObjects[0];
      if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "error"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "MCVerboseDescription"));
      v19 = 138543362;
      v20 = v13;
      v14 = "Error validating outgoing server information: %{public}@";
    }
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v19, 0xCu);

    goto LABEL_13;
  }
  outgoingAccount = self->_outgoingAccount;
  if (self->_incomingAccount == v8)
  {
    objc_msgSend(v7, "validateAccount:useSSL:", outgoingAccount, self->_outgoingAccountUsesSSL);
    goto LABEL_16;
  }
  if (outgoingAccount == v8)
  {
    self->_validationResult = 1;
LABEL_13:
    if (!self->_validationResult)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "error"));
      v17 = (NSError *)objc_claimAutoreleasedReturnValue(-[MCNewEmailAccountPayloadHandler _errorFromValidationError:](self, "_errorFromValidationError:", v16));
      validationError = self->_validationError;
      self->_validationError = v17;

    }
    self->_validationDone = 1;
  }
LABEL_16:

}

- (BOOL)preflightUserInputResponses:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSError *v9;
  NSError *v10;
  void *v11;
  MailAccount *v12;
  MailAccount *incomingAccount;
  DeliveryAccount *v14;
  DeliveryAccount *outgoingAccount;
  os_log_t v16;
  NSObject *v17;
  void *v18;
  NSThread *v19;
  NSThread *validationThread;
  NSThread *v21;
  MailAccount *v22;
  DeliveryAccount *v23;
  os_log_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSError *v29;
  NSError *validationError;
  void *v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  os_log_t v42;
  NSObject *v43;
  void *v44;
  BOOL v45;
  NSError *v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v48 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEmailAccountPayloadHandler _incomingAccountInfoDictionaryWithUserInput:isPreflight:outError:](self, "_incomingAccountInfoDictionaryWithUserInput:isPreflight:outError:", v6, 1, &v48));
  v9 = (NSError *)v48;
  if (v9)
  {
    v10 = v9;

    goto LABEL_17;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEmailAccountPayloadHandler _outgoingAccountInfoDictionaryWithUserInput:](self, "_outgoingAccountInfoDictionaryWithUserInput:", v6));
  v12 = (MailAccount *)objc_claimAutoreleasedReturnValue(-[MCNewEmailAccountPayloadHandler _incomingAccountWithAccountInfo:](self, "_incomingAccountWithAccountInfo:", v8));
  incomingAccount = self->_incomingAccount;
  self->_incomingAccount = v12;

  self->_incomingAccountUsesSSL = objc_msgSend(v7, "incomingMailServerUseSSL");
  v14 = (DeliveryAccount *)objc_claimAutoreleasedReturnValue(-[MCNewEmailAccountPayloadHandler _outgoingAccountWithAccountInfo:](self, "_outgoingAccountWithAccountInfo:", v11));
  outgoingAccount = self->_outgoingAccount;
  self->_outgoingAccount = v14;

  self->_outgoingAccountUsesSSL = objc_msgSend(v7, "outgoingMailServerUseSSL");
  if (!self->_incomingAccount)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "emailAccountType"));
    v32 = objc_msgSend(v31, "isEqualToString:", kMCEmailAccountPayloadTypeIMAP);

    v33 = MCEmailErrorDomain;
    v29 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "emailAccountDescription"));
    v47 = v29;
    if (v32)
    {
      v34 = MCErrorArray(CFSTR("EMAIL_ERROR_IMAP_BAD_P_PAYLOAD"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v36 = MCErrorTypeFatal;
      v37 = v33;
      v38 = 7005;
    }
    else
    {
      v41 = MCErrorArray(CFSTR("EMAIL_ERROR_POP_BAD_P_PAYLOAD"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(v41);
      v36 = MCErrorTypeFatal;
      v37 = v33;
      v38 = 7006;
    }
    goto LABEL_15;
  }
  if (!self->_outgoingAccount)
  {
    v39 = MCEmailErrorDomain;
    v29 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "emailAccountDescription"));
    v47 = v29;
    v40 = MCErrorArray(CFSTR("EMAIL_ERROR_SMTP_BAD_P_PAYLOAD"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v36 = MCErrorTypeFatal;
    v37 = v39;
    v38 = 7007;
LABEL_15:
    v10 = (NSError *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v37, v38, v35, v36, v47, 0));

    goto LABEL_16;
  }
  v16 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "emailAccountDescription"));
    *(_DWORD *)buf = 138543362;
    v50 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Validating account “%{public}@”", buf, 0xCu);

  }
  -[NSConditionLock lock](self->_validationLock, "lock");
  -[NSConditionLock unlockWithCondition:](self->_validationLock, "unlockWithCondition:", 1);
  v19 = (NSThread *)objc_msgSend(objc_alloc((Class)NSThread), "initWithTarget:selector:object:", self, "_validateIncomingAccountOnThread", 0);
  validationThread = self->_validationThread;
  self->_validationThread = v19;

  -[NSThread start](self->_validationThread, "start");
  -[NSConditionLock lockWhenCondition:](self->_validationLock, "lockWhenCondition:", 2);
  -[NSConditionLock unlock](self->_validationLock, "unlock");
  v21 = self->_validationThread;
  self->_validationThread = 0;

  v22 = self->_incomingAccount;
  self->_incomingAccount = 0;

  v23 = self->_outgoingAccount;
  self->_outgoingAccount = 0;

  v24 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "emailAccountDescription"));
    v27 = MCStringForBool(self->_validationResult);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 138543618;
    v50 = v26;
    v51 = 2114;
    v52 = v28;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Validation of account “%{public}@” done. Result: %{public}@", buf, 0x16u);

  }
  v29 = self->_validationError;
  validationError = self->_validationError;
  self->_validationError = 0;

  if (self->_validationResult)
  {
    v10 = 0;
  }
  else
  {
    v29 = v29;
    v10 = v29;
  }
LABEL_16:

  if (!v10)
  {
    v45 = 1;
    goto LABEL_23;
  }
LABEL_17:
  v42 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v43 = v42;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSError MCVerboseDescription](v10, "MCVerboseDescription"));
    *(_DWORD *)buf = 138543362;
    v50 = v44;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Account validation failed. Error: %{public}@", buf, 0xCu);

  }
  if (a4)
  {
    v10 = objc_retainAutorelease(v10);
    v45 = 0;
    *a4 = v10;
  }
  else
  {
    v45 = 0;
  }
LABEL_23:

  return v45;
}

- (id)_installWithIncomingAccountInfo:(id)a3 outgoingAccountInfo:(id)a4 isInstalledByMDM:(BOOL)a5 personaID:(id)a6 rmAccountIdentifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
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
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *i;
  void *v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  void *j;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v67;
  _BOOL4 v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  id v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[2];
  _QWORD v88[2];
  _BYTE v89[128];
  _BYTE v90[128];

  v68 = a5;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v69 = a7;
  v71 = v11;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEmailAccountPayloadHandler _incomingAccountWithAccountInfo:](self, "_incomingAccountWithAccountInfo:", v11));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "profile"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUID"));
  v18 = kMCAccountProfileUUIDKey;
  objc_msgSend(v14, "setAccountProperty:forKey:", v17, kMCAccountProfileUUIDKey);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUID"));
  v21 = kMCAccountPayloadUUIDKey;
  objc_msgSend(v14, "setAccountProperty:forKey:", v20, kMCAccountPayloadUUIDKey);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "profile"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
  v25 = ACAccountPropertyConfigurationProfileIdentifier;
  objc_msgSend(v14, "setAccountProperty:forKey:", v24, ACAccountPropertyConfigurationProfileIdentifier);

  v70 = v12;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEmailAccountPayloadHandler _outgoingAccountWithAccountInfo:](self, "_outgoingAccountWithAccountInfo:", v12));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "profile"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "UUID"));
  objc_msgSend(v26, "setAccountProperty:forKey:", v29, v18);

  v30 = v13;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "UUID"));
  objc_msgSend(v26, "setAccountProperty:forKey:", v32, v21);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "profile"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "identifier"));
  objc_msgSend(v26, "setAccountProperty:forKey:", v35, v25);

  objc_msgSend(v14, "setDeliveryAccount:", v26);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount mailAccounts](MailAccount, "mailAccounts"));
  v37 = objc_msgSend(v36, "mutableCopy");

  objc_msgSend(v37, "addObject:", v14);
  if (objc_msgSend(v30, "length"))
  {
    v38 = ACAccountPropertyPersonaIdentifier;
    objc_msgSend(v14, "setAccountProperty:forKey:", v30, ACAccountPropertyPersonaIdentifier);
    objc_msgSend(v26, "setAccountProperty:forKey:", v30, v38);
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_10002A220;
    v85[3] = &unk_1000E2C50;
    v86 = v37;
    v39 = +[DMCPersonaHelper performBlockUnderPersona:block:](DMCPersonaHelper, "performBlockUnderPersona:block:", v30, v85);

  }
  else
  {
    +[MailAccount setMailAccounts:](MailAccount, "setMailAccounts:", v37);
  }
  if (v69)
  {
    v40 = ACAccountPropertyRemoteManagingAccountIdentifier;
    objc_msgSend(v14, "setAccountProperty:forKey:", v69, ACAccountPropertyRemoteManagingAccountIdentifier);
    objc_msgSend(v26, "setAccountProperty:forKey:", v69, v40);
  }
  v72 = v30;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  if (v68)
    objc_msgSend(v14, "setValueInAccountProperties:forKey:", &__kCFBooleanTrue, CFSTR("MCAccountIsManaged"));
  v67 = v37;
  if (objc_msgSend(v41, "SMIMEEnabled"))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v41, "SMIMEPerMessageSwitchEnabled")));
    objc_msgSend(v14, "setAccountProperty:forKey:", v42, MFMailAccountPerMessageEncryptionEnabled);

  }
  if (objc_msgSend(v30, "length"))
  {
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_10002A234;
    v83[3] = &unk_1000E2C50;
    v84 = v14;
    v43 = +[DMCPersonaHelper performBlockUnderPersona:block:](DMCPersonaHelper, "performBlockUnderPersona:block:", v30, v83);

  }
  else
  {
    objc_msgSend(v14, "savePersistentAccount");
  }
  +[DeliveryAccount addDeliveryAccount:](DeliveryAccount, "addDeliveryAccount:", v26);
  if (v68)
    objc_msgSend(v26, "setValueInAccountProperties:forKey:", &__kCFBooleanTrue, CFSTR("MCAccountIsManaged"));
  if (objc_msgSend(v41, "SMIMEEnabled"))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v41, "SMIMEPerMessageSwitchEnabled")));
    objc_msgSend(v26, "setAccountProperty:forKey:", v44, MFMailAccountPerMessageEncryptionEnabled);

  }
  if (objc_msgSend(v30, "length"))
  {
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_10002A23C;
    v81[3] = &unk_1000E2C50;
    v82 = v26;
    v45 = +[DMCPersonaHelper performBlockUnderPersona:block:](DMCPersonaHelper, "performBlockUnderPersona:block:", v30, v81);

  }
  else
  {
    objc_msgSend(v26, "savePersistentAccount");
  }
  v46 = v71;
  if (objc_msgSend(v41, "SMIMEEnabled"))
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKey:", CFSTR("MCSMIMESigningIdentityPersistentID")));
    if (v47)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKey:", MailAccountEmailAddresses));
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v78;
        do
        {
          for (i = 0; i != v50; i = (char *)i + 1)
          {
            if (*(_QWORD *)v78 != v51)
              objc_enumerationMutation(v48);
            objc_msgSend(v14, "setSigningIdentityPersistentReference:forAddress:", v47, *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i));
          }
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
        }
        while (v50);
      }
      objc_msgSend(v41, "setSMIMESigningIdentityPersistentID:", v47);

      v46 = v71;
    }
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKey:", CFSTR("MCSMIMEEncryptionIdentityPersistentID")));
    if (v53)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKey:", MailAccountEmailAddresses));
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v74;
        do
        {
          for (j = 0; j != v56; j = (char *)j + 1)
          {
            if (*(_QWORD *)v74 != v57)
              objc_enumerationMutation(v54);
            objc_msgSend(v14, "setEncryptionIdentityPersistentReference:forAddress:", v53, *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)j));
          }
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
        }
        while (v56);
      }
      objc_msgSend(v41, "setSMIMEEncryptionIdentityPersistentID:", v53);

      v46 = v71;
    }

    v30 = v72;
  }
  v87[0] = CFSTR("IncomingAccountInfo");
  v87[1] = CFSTR("OutgoingAccountInfo");
  v88[0] = v46;
  v88[1] = v70;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v88, v87, 2));
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v59, 200, 0, 0));
  if (v60)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "UUID"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "profile"));
    +[MCKeychain setData:forService:account:label:description:useSystemKeychain:outError:](MCKeychain, "setData:forService:account:label:description:useSystemKeychain:outError:", v60, CFSTR("MCEmailAccount"), v62, 0, 0, objc_msgSend(v64, "isInstalledForSystem"), 0);

    v46 = v71;
    v30 = v72;

  }
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accountPropertyForKey:", MailAccountManagedTag));

  return v65;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  os_log_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));
  v10 = objc_msgSend(v9, "BOOLValue");

  if (!(_DWORD)v10)
  {
    v14 = 0;
    goto LABEL_5;
  }
  v11 = kMDMPersonaKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kMDMPersonaKey));
  v13 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v11));
  else
    v14 = 0;

  v16 = kMCInstallProfileOptionManagingProfileIdentifier;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kMCInstallProfileOptionManagingProfileIdentifier));
  v18 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
  {
    v15 = 0;
    goto LABEL_11;
  }
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v16));

  if (!v19)
  {
LABEL_5:
    v15 = 0;
    goto LABEL_12;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dmc_remoteManagementAccountForManagementProfileIdentifier:", v19));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
  v17 = (void *)v19;
LABEL_11:

LABEL_12:
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler userInputResponses](self, "userInputResponses"));
  v34 = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEmailAccountPayloadHandler _incomingAccountInfoDictionaryWithUserInput:isPreflight:outError:](self, "_incomingAccountInfoDictionaryWithUserInput:isPreflight:outError:", v22, 0, &v34));
  v24 = v34;

  if (v24)
  {

    v25 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v26 = v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "friendlyName"));
      *(_DWORD *)buf = 138543618;
      v36 = v28;
      v37 = 2114;
      v38 = v24;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Could not install email payload %{public}@. Error: %{public}@", buf, 0x16u);

    }
    if (a6)
      *a6 = objc_msgSend(v24, "MCCopyAsPrimaryError");
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler userInputResponses](self, "userInputResponses"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEmailAccountPayloadHandler _outgoingAccountInfoDictionaryWithUserInput:](self, "_outgoingAccountInfoDictionaryWithUserInput:", v29));

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEmailAccountPayloadHandler _installWithIncomingAccountInfo:outgoingAccountInfo:isInstalledByMDM:personaID:rmAccountIdentifier:](self, "_installWithIncomingAccountInfo:outgoingAccountInfo:isInstalledByMDM:personaID:rmAccountIdentifier:", v23, v30, v10, v14, v15));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    objc_msgSend(v32, "setPersistentResourceID:", v31);
    objc_msgSend(v32, "setIncomingACAccountIdentifier:", self->_incomingACAccountIdentifier);
    objc_msgSend(v32, "setOutgoingACAccountIdentifier:", self->_outgoingACAccountIdentifier);

  }
  return v24 == 0;
}

- (BOOL)isInstalled
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistentResourceID"));

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MailAccount mailAccounts](MailAccount, "mailAccounts"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = MailAccountManagedTag;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "accountPropertyForKey:", v8, (_QWORD)v13));
        if (v10 && (objc_msgSend(v3, "isEqualToString:", v10) & 1) != 0)
        {

          v11 = 1;
          goto LABEL_12;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (id)_removeAccountWithPersistentResourceID:(id)a3 fromArray:(id)a4 outArray:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  id v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v22;
    v14 = MailAccountManagedTag;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "accountPropertyForKey:", v14));
        if (v17 && (objc_msgSend(v6, "isEqualToString:", v17) & 1) != 0)
        {
          v18 = v16;

          v12 = v18;
        }
        else
        {
          objc_msgSend(v8, "addObject:", v16);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  if (a5)
    *a5 = objc_retainAutorelease(v8);

  return v12;
}

- (void)_removePersonaIDForMailAccountWithPersistentResourceID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  __int128 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  _QWORD v33[6];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v33[0] = ACAccountTypeIdentifierPOP;
  v33[1] = ACAccountTypeIdentifierAol;
  v33[2] = ACAccountTypeIdentifierYahoo;
  v33[3] = ACAccountTypeIdentifierGmail;
  v33[4] = ACAccountTypeIdentifierIMAP;
  v33[5] = ACAccountTypeIdentifierIMAPMail;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 6));
  v22 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountsWithAccountTypeIdentifiers:error:", v5, 0));

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v25;
    v12 = MailAccountManagedTag;
    v21 = ACAccountPropertyPersonaIdentifier;
    *(_QWORD *)&v9 = 138412546;
    v20 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accountPropertyForKey:", v12, v20));
        if (v15)
        {
          if (objc_msgSend(v3, "isEqualToString:", v15))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "personaIdentifier"));

            if (v16)
            {
              v17 = _MCLogObjects[0];
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v29 = v14;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Removing personaIdentifier for mail account: %@", buf, 0xCu);
              }
              objc_msgSend(v14, "setAccountProperty:forKey:", 0, v21);
              v23 = 0;
              objc_msgSend(v22, "saveVerifiedAccount:error:", v14, &v23);
              v18 = v23;
              if (v18)
              {
                v19 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v20;
                  v29 = v14;
                  v30 = 2114;
                  v31 = v18;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to remove personaIdentifier for mail account: %@, error: %{public}@", buf, 0x16u);
                }
              }

            }
          }
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v10);
  }

}

- (void)_remove
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persistentResourceID"));

  -[MCNewEmailAccountPayloadHandler _removePersonaIDForMailAccountWithPersistentResourceID:](self, "_removePersonaIDForMailAccountWithPersistentResourceID:", v4);
  +[MailAccount reloadAccounts](MailAccount, "reloadAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount mailAccounts](MailAccount, "mailAccounts"));
  v13 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewEmailAccountPayloadHandler _removeAccountWithPersistentResourceID:fromArray:outArray:](self, "_removeAccountWithPersistentResourceID:fromArray:outArray:", v4, v5, &v13));
  v7 = v13;

  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deliveryAccount"));
    +[DeliveryAccount removeDeliveryAccount:](DeliveryAccount, "removeDeliveryAccount:", v8);

    +[MailAccount setMailAccounts:](MailAccount, "setMailAccounts:", v7);
    objc_msgSend(v6, "removePersistentAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "profile"));
    +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:](MCKeychain, "removeItemForService:account:label:description:useSystemKeychain:group:", CFSTR("MCEmailAccount"), v10, 0, 0, objc_msgSend(v12, "isInstalledForSystem"), 0);

  }
}

- (void)remove
{
  void *v3;
  unsigned int v4;
  NSDictionary *setAsideAccountInfo;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if (v4)
  {
    setAsideAccountInfo = self->_setAsideAccountInfo;
    self->_setAsideAccountInfo = 0;

  }
  else
  {
    -[MCNewEmailAccountPayloadHandler _remove](self, "_remove");
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  objc_msgSend(v6, "setPersistentResourceID:", 0);

}

- (void)setAside
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSDictionary *v22;
  NSDictionary *setAsideAccountInfo;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "profile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCKeychain dataFromService:account:label:description:useSystemKeychain:outError:](MCKeychain, "dataFromService:account:label:description:useSystemKeychain:outError:", CFSTR("MCEmailAccount"), v4, 0, 0, objc_msgSend(v6, "isInstalledForSystem"), 0));

  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[MailAccount mailAccounts](MailAccount, "mailAccounts"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v24 = v7;
    v9 = *(_QWORD *)v27;
    v10 = MailAccountManagedTag;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountPropertyForKey:", v10, v24));
        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "persistentResourceID"));
          v16 = objc_msgSend(v15, "isEqualToString:", v13);

          if (v16)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueInAccountPropertiesForKey:", CFSTR("MCAccountIsManaged")));
            LOBYTE(v8) = objc_msgSend(v19, "BOOLValue");

            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "persistentAccount"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", ACAccountPropertyPersonaIdentifier));

            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "persistentAccount"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", ACAccountPropertyRemoteManagingAccountIdentifier));

            goto LABEL_12;
          }
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v8)
        continue;
      break;
    }
    v17 = 0;
    v18 = 0;
LABEL_12:
    v7 = v24;
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }

  if (v7)
  {
    v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization MCSafePropertyListWithData:options:format:error:](NSPropertyListSerialization, "MCSafePropertyListWithData:options:format:error:", v7, 0, 0, 0));
    setAsideAccountInfo = self->_setAsideAccountInfo;
    self->_setAsideAccountInfo = v22;

    self->_wasInstalledByMDM = (char)v8;
    objc_storeStrong((id *)&self->_personaID, v18);
    objc_storeStrong((id *)&self->_rmAccountIdentifier, v17);
  }
  -[MCNewEmailAccountPayloadHandler _remove](self, "_remove");

}

- (void)unsetAside
{
  NSDictionary *setAsideAccountInfo;
  void *v4;
  void *v5;
  id v6;
  NSDictionary *v7;

  setAsideAccountInfo = self->_setAsideAccountInfo;
  if (setAsideAccountInfo)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](setAsideAccountInfo, "objectForKey:", CFSTR("IncomingAccountInfo")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_setAsideAccountInfo, "objectForKey:", CFSTR("OutgoingAccountInfo")));
    v6 = -[MCNewEmailAccountPayloadHandler _installWithIncomingAccountInfo:outgoingAccountInfo:isInstalledByMDM:personaID:rmAccountIdentifier:](self, "_installWithIncomingAccountInfo:outgoingAccountInfo:isInstalledByMDM:personaID:rmAccountIdentifier:", v4, v5, self->_wasInstalledByMDM, self->_personaID, self->_rmAccountIdentifier);

    v7 = self->_setAsideAccountInfo;
    self->_setAsideAccountInfo = 0;

  }
}

- (NSString)incomingACAccountIdentifier
{
  return self->_incomingACAccountIdentifier;
}

- (void)setIncomingACAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_incomingACAccountIdentifier, a3);
}

- (NSString)outgoingACAccountIdentifier
{
  return self->_outgoingACAccountIdentifier;
}

- (void)setOutgoingACAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingACAccountIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingACAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_incomingACAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_validationError, 0);
  objc_storeStrong((id *)&self->_outgoingAccount, 0);
  objc_storeStrong((id *)&self->_incomingAccount, 0);
  objc_storeStrong((id *)&self->_rmAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_setAsideAccountInfo, 0);
  objc_storeStrong((id *)&self->_validationThread, 0);
  objc_storeStrong((id *)&self->_validationLock, 0);
}

@end
