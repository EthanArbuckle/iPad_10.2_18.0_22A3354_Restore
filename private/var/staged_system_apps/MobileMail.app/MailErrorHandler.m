@implementation MailErrorHandler

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (void)reset
{
  NSMutableSet *sslErrorAccountsDisplayed;

  -[NSMutableSet removeAllObjects](self->_displayedErrorDescriptions, "removeAllObjects");
  sslErrorAccountsDisplayed = self->_sslErrorAccountsDisplayed;
  self->_sslErrorAccountsDisplayed = 0;

}

- (MailErrorHandler)init
{
  MailErrorHandler *v2;
  NSMutableSet *v3;
  NSMutableSet *displayedErrorDescriptions;
  NSMutableSet *v5;
  NSMutableSet *sslErrorAccountsDisplayed;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MailErrorHandler;
  v2 = -[MailErrorHandler init](&v9, "init");
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    displayedErrorDescriptions = v2->_displayedErrorDescriptions;
    v2->_displayedErrorDescriptions = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    sslErrorAccountsDisplayed = v2->_sslErrorAccountsDisplayed;
    v2->_sslErrorAccountsDisplayed = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "_changeSetManagerEncounteredError:", CFSTR("MailChangeSetEncounteredError"), 0);

  }
  return v2;
}

- (BOOL)shouldDisplayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5
{
  id v7;
  id v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  int isKindOfClass;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  char v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unsigned __int8 v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  NSMutableSet *displayedErrorDescriptions;
  void *v37;
  NSMutableSet *sslErrorAccountsDisplayed;
  void *v39;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id obj;
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

  v7 = a3;
  v8 = a4;
  if (a5 == 2)
  {
    LOBYTE(v9) = 1;
    goto LABEL_50;
  }
  v9 = objc_msgSend(v7, "mf_shouldBeReportedToUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", MFSSLErrorCertificateDigestKey));

  v11 = objc_opt_class(MailAccount);
  isKindOfClass = objc_opt_isKindOfClass(v8, v11);
  if (v45)
    v13 = 0;
  else
    v13 = v9;
  if (v13 == 1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mf_shortDescription"));
    v9 = objc_msgSend(v14, "length") != 0;

  }
  if ((v9 & isKindOfClass) == 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v9 = objc_msgSend(v15, "isSuspended") ^ 1;

  }
  if ((v9 & isKindOfClass) == 1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[PCPersistentTimer lastSystemWakeDate](PCPersistentTimer, "lastSystemWakeDate"));
    objc_msgSend(v16, "timeIntervalSinceNow");
    v9 = v17 < -7.0;

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "selectedAccounts"));

  v19 = v9 ^ 1;
  if (!v8)
    v19 = 1;
  if ((v19 & 1) == 0)
  {
    if (objc_msgSend(v44, "count"))
    {
      v20 = objc_opt_class(MailAccount);
      if ((objc_opt_isKindOfClass(v8, v20) & 1) != 0)
      {
        v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueID"));
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        obj = v44;
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v53;
LABEL_19:
          v24 = 0;
          while (1)
          {
            if (*(_QWORD *)v53 != v23)
              objc_enumerationMutation(obj);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v24), "uniqueID"));
            v26 = objc_msgSend(v21, "isEqualToString:", v25);

            if ((v26 & 1) != 0)
              break;
            if (v22 == (id)++v24)
            {
              v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
              if (v22)
                goto LABEL_19;
              v9 = 0;
              goto LABEL_42;
            }
          }
        }
        v9 = 1;
LABEL_42:

        goto LABEL_43;
      }
      v27 = objc_opt_class(DeliveryAccount);
      if ((objc_opt_isKindOfClass(v8, v27) & 1) != 0)
      {
        v21 = v8;
        obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uniqueID"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "mailAccountIfAvailable"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "uniqueID"));

        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v41 = v44;
        v29 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        if (v29)
        {
          v42 = *(_QWORD *)v49;
          while (2)
          {
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(_QWORD *)v49 != v42)
                objc_enumerationMutation(v41);
              v31 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "deliveryAccount"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "uniqueID"));
              if (objc_msgSend(obj, "isEqualToString:", v33))
              {

                goto LABEL_40;
              }
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "uniqueID"));
              v35 = objc_msgSend(v43, "isEqualToString:", v34);

              if ((v35 & 1) != 0)
                goto LABEL_40;
            }
            v29 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
            v9 = 0;
            if (v29)
              continue;
            break;
          }
        }
        else
        {
LABEL_40:
          v9 = 1;
        }

        goto LABEL_42;
      }
    }
    v9 = 1;
  }
LABEL_43:
  if (a5 == 1 && v9)
  {
    displayedErrorDescriptions = self->_displayedErrorDescriptions;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedDescription"));
    LODWORD(displayedErrorDescriptions) = -[NSMutableSet containsObject:](displayedErrorDescriptions, "containsObject:", v37);

    v9 = displayedErrorDescriptions ^ 1;
  }
  if (v9 && v45)
  {
    sslErrorAccountsDisplayed = self->_sslErrorAccountsDisplayed;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueID"));
    LOBYTE(sslErrorAccountsDisplayed) = -[NSMutableSet containsObject:](sslErrorAccountsDisplayed, "containsObject:", v39);

    LOBYTE(v9) = sslErrorAccountsDisplayed ^ 1;
  }

LABEL_50:
  return v9;
}

- (void)didDisplayError:(id)a3
{
  id v4;
  NSMutableSet *displayedErrorDescriptions;
  NSMutableSet *v6;
  NSMutableSet *v7;
  void *v8;
  id v9;

  v4 = a3;
  displayedErrorDescriptions = self->_displayedErrorDescriptions;
  v9 = v4;
  if (!displayedErrorDescriptions)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_displayedErrorDescriptions;
    self->_displayedErrorDescriptions = v6;

    displayedErrorDescriptions = self->_displayedErrorDescriptions;
    v4 = v9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
  -[NSMutableSet addObject:](displayedErrorDescriptions, "addObject:", v8);

}

- (id)sanitizedErrorForError:(id)a3 forAccount:(id)a4
{
  uint64_t v5;
  char isKindOfClass;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSBundle *v25;
  uint64_t v26;
  uint64_t v27;
  NSBundle *v28;
  NSBundle *v29;
  uint64_t v30;
  NSBundle *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSBundle *v35;
  uint64_t v36;
  NSBundle *v37;
  uint64_t v38;
  NSBundle *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  NSBundle *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  NSBundle *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v71;
  id v72;

  v71 = a3;
  v72 = a4;
  v5 = objc_opt_class(DeliveryAccount);
  isKindOfClass = objc_opt_isKindOfClass(v72, v5);
  v7 = v72;
  v8 = v71;
  v9 = v7;
  v10 = objc_opt_class(DeliveryAccount);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0
    || (v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mailAccountIfAvailable"))) == 0)
  {
    v11 = v9;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayName"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  v14 = (void *)MFMessageErrorDomain;
  v15 = objc_msgSend(v13, "isEqual:", MFMessageErrorDomain);

  if (v15)
  {
    v16 = 0;
    v17 = 0;
    switch((unint64_t)objc_msgSend(v8, "code"))
    {
      case 0x408uLL:
        v21 = MFLookupLocalizedString(CFSTR("FAILED_LOGIN"), CFSTR("The user name or password for “%@” is incorrect."), CFSTR("Delayed"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v12));
        goto LABEL_31;
      case 0x409uLL:
      case 0x40AuLL:
      case 0x40DuLL:
      case 0x40EuLL:
      case 0x411uLL:
      case 0x414uLL:
      case 0x415uLL:
      case 0x41CuLL:
      case 0x420uLL:
      case 0x421uLL:
      case 0x422uLL:
        break;
      case 0x40BuLL:
      case 0x40CuLL:
        if ((isKindOfClass & 1) == 0)
          goto LABEL_9;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedDescription"));
        v19 = MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        if (!v20)
          goto LABEL_32;
        goto LABEL_27;
      case 0x40FuLL:
        v24 = MFLookupLocalizedString(CFSTR("IMAP_UNAVAILABLE_SERVER"), CFSTR("%@ is currently unavailable."), CFSTR("Delayed"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v12));
        goto LABEL_31;
      case 0x410uLL:
        v25 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailAppController));
        v22 = (void *)objc_claimAutoreleasedReturnValue(v25);
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("UNRECOVERABLE_SERVER_ERROR"), &stru_100531B00, CFSTR("Main")));
        goto LABEL_31;
      case 0x412uLL:
        v26 = MFLookupLocalizedString(CFSTR("MULTIPLE_ACCOUNT_ERRORS"), CFSTR("Multiple Account Errors"), CFSTR("Message"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedDescription"));
        goto LABEL_26;
      case 0x413uLL:
        v28 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailAppController));
        v22 = (void *)objc_claimAutoreleasedReturnValue(v28);
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("NO_INTERNET_CONNECTION"), &stru_100531B00, CFSTR("Main")));
        goto LABEL_31;
      case 0x416uLL:
        v29 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailAppController));
        v22 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ERROR_DATA_BLOCKED_BY_CALL"), &stru_100531B00, CFSTR("Main")));
        goto LABEL_31;
      case 0x417uLL:
        v30 = MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(v30);
        v31 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailAppController));
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("INVALID_SENDER_MESSAGE"), &stru_100531B00, CFSTR("Main")));
        goto LABEL_21;
      case 0x418uLL:
        v34 = MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(v34);
        v35 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailAppController));
        v32 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("NO_RECIPIENT_MESSAGE"), &stru_100531B00, CFSTR("Main")));
        goto LABEL_21;
      case 0x419uLL:
        v36 = MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(v36);
        v37 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailAppController));
        v32 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("INVALID_RECIPIENT_MESSAGE"), &stru_100531B00, CFSTR("Main")));
        goto LABEL_21;
      case 0x41AuLL:
        v38 = MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(v38);
        v39 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailAppController));
        v32 = (void *)objc_claimAutoreleasedReturnValue(v39);
        v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("SENDER_MAILBOX_FULL_MESSAGE"), &stru_100531B00, CFSTR("Main")));
LABEL_21:
        v18 = (void *)v33;

        if (!v20)
          goto LABEL_32;
        goto LABEL_27;
      case 0x41BuLL:
        v40 = MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(v40);
        v41 = MFLookupLocalizedString(CFSTR("MF_FAILED_SEND_NO_SERVER"), CFSTR("Check the settings for the outgoing servers in Settings > Apps > Mail > Accounts."), CFSTR("Delayed"));
        v27 = objc_claimAutoreleasedReturnValue(v41);
        goto LABEL_26;
      case 0x41DuLL:
        v42 = MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(v42);
        v43 = MFLookupLocalizedString(CFSTR("MF_FAILED_SEND_MESSAGE_REJECTED"), CFSTR("The message was rejected by the server."), CFSTR("Delayed"));
        v27 = objc_claimAutoreleasedReturnValue(v43);
        goto LABEL_26;
      case 0x41EuLL:
        v44 = MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(v44);
        v45 = MFLookupLocalizedString(CFSTR("MF_FAILED_SEND_MESSAGE_TOO_LARGE"), CFSTR("The message was rejected by the server because it is too large."), CFSTR("Delayed"));
        v27 = objc_claimAutoreleasedReturnValue(v45);
LABEL_26:
        v18 = (void *)v27;
        if (!v20)
          goto LABEL_32;
LABEL_27:
        v16 = objc_retainAutorelease(v20);
        if (!v18)
          goto LABEL_10;
        goto LABEL_33;
      case 0x41FuLL:
        v46 = MFLookupLocalizedString(CFSTR("NO_PASSWORD_PROVIDED_FOR_ACCOUNT_FORMAT"), CFSTR("No password provided for “%@”.\n\nPlease go to Mail Account Settings and enter a password."), CFSTR("Message"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(v46);
        v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v12));
        goto LABEL_31;
      case 0x423uLL:
        v47 = MFLookupLocalizedString(CFSTR("LOGIN_DISABLED_FOR_ACCOUNT_FORMAT"), CFSTR("Logins are disabled for “%@”."), CFSTR("Message"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(v47);
        v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v12));
LABEL_31:
        v18 = (void *)v23;

LABEL_32:
        v16 = 0;
        if (!v18)
          goto LABEL_10;
LABEL_33:
        v17 = objc_retainAutorelease(v18);

        break;
      default:
        v17 = 0;
        break;
    }
  }
  else
  {
LABEL_9:
    v16 = 0;
LABEL_10:
    v17 = 0;
  }

  v48 = v16;
  v49 = v17;
  v50 = v49;
  if (v48 && v49)
    goto LABEL_60;
  v51 = objc_msgSend(v8, "code");
  v52 = v9;
  if ((isKindOfClass & 1) != 0)
    v53 = MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
  else
    v53 = MFLookupLocalizedString(CFSTR("FAILED_FETCH_TITLE"), CFSTR("Cannot Get Mail"), CFSTR("Delayed"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  if (v51 == (id)1057)
  {
    v55 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailAppController));
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_IN_USE"), &stru_100531B00, CFSTR("Main")));

    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "displayName"));
    v59 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v57, v58));
  }
  else
  {
    if (!objc_msgSend(v52, "shouldDisplayHostnameInErrorMessages")
      || (v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "hostname"))) == 0)
    {
      v61 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailAppController));
      v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
      v57 = v62;
      if ((isKindOfClass & 1) != 0)
        v63 = CFSTR("GENERIC_DELIVERY_ERROR_MESSAGE");
      else
        v63 = CFSTR("GENERIC_INCOMING_ERROR_MESSAGE");
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "localizedStringForKey:value:table:", v63, &stru_100531B00, CFSTR("Main")));
      goto LABEL_52;
    }
    if ((isKindOfClass & 1) != 0)
      v60 = MFLookupLocalizedString(CFSTR("SMTP_NO_CONNECTION"), CFSTR("The connection to the outgoing server “%@” failed. Additional Outgoing Mail Servers can be configured for Mail accounts in Settings > Apps > Mail > Accounts."), CFSTR("Delayed"));
    else
      v60 = MFLookupLocalizedString(CFSTR("CONNECTION_FAILED"), CFSTR("The mail server “%@” is not responding. Verify that you have entered the correct account info in Mail settings."), CFSTR("Delayed"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(v60);
    v59 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v58, v57));
  }
  v64 = (void *)v59;

LABEL_52:
  v65 = v48;
  if (!v48)
  {
    v65 = 0;
    if (v54)
      v65 = objc_retainAutorelease(v54);
  }
  v66 = v50;
  if (!v50)
  {
    v66 = 0;
    if (v64)
      v66 = objc_retainAutorelease(v64);
  }

  if (v48)
  {
    if (v50)
      goto LABEL_60;
  }
  else
  {
    v48 = v65;
    if (v50)
      goto LABEL_60;
  }
  v50 = v66;
LABEL_60:
  if (v8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
    v67 = (uint64_t)objc_msgSend(v8, "code");
  }
  else
  {
    v67 = 1030;
  }
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", v14, v67, v50, v48, v68));

  if (v8)
  return v69;
}

- (id)preferencesURLForAccount:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char *v8;
  unsigned int v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
  v8 = (char *)objc_msgSend(v6, "code");
  if (objc_msgSend(MFMessageErrorDomain, "isEqualToString:", v7))
  {
    v9 = (0x880001u >> ((_BYTE)v8 - 8)) & 1;
    if ((unint64_t)(v8 - 1032) > 0x17)
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  if (v8 == (char *)54 || v8 == (char *)1212 || v8 == (char *)1235 || v9)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[MFPreferencesURL accountInfoURLForAccount:](MFPreferencesURL, "accountInfoURLForAccount:", v5));
LABEL_11:
    v11 = v10;
    goto LABEL_12;
  }
  v10 = objc_msgSend(v6, "mf_isSMIMEError");
  if ((_DWORD)v10)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[MFPreferencesURL advancedAccountInfoURLForAccount:](MFPreferencesURL, "advancedAccountInfoURLForAccount:", v5));
    goto LABEL_11;
  }
  v11 = 0;
LABEL_12:
  v12 = MFLogGeneral(v10);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    v17 = 138413058;
    v18 = v14;
    v19 = 2112;
    v20 = v15;
    v21 = 2048;
    v22 = objc_msgSend(v6, "code");
    v23 = 2112;
    v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "preferencesURLForAccount:%@ error:[%@:%ld] => %@", (uint8_t *)&v17, 0x2Au);

  }
  return v11;
}

- (void)_displayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", MFSSLErrorCertificateKey));
  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("MailErrorHandlerDoNotSanitize")));
    v12 = objc_msgSend(v11, "BOOLValue");

    if ((v12 & 1) != 0)
      goto LABEL_5;
    v13 = objc_claimAutoreleasedReturnValue(-[MailErrorHandler sanitizedErrorForError:forAccount:](self, "sanitizedErrorForError:forAccount:", v14, v8));
    v10 = v14;
    v14 = (id)v13;
  }

LABEL_5:
  if (-[MailErrorHandler shouldDisplayError:forAccount:mode:](self, "shouldDisplayError:forAccount:mode:", v14, v8, a5))
  {
    if (objc_msgSend(v14, "code") == (id)1058)
      -[MailErrorHandler _promptUserForWebLoginWithAccount:error:](self, "_promptUserForWebLoginWithAccount:error:", v8, v14);
    else
      -[MailErrorHandler _presentAlertWithSettingsButtonForAccount:error:](self, "_presentAlertWithSettingsButtonForAccount:error:", v8, v14);
    -[MailErrorHandler didDisplayError:](self, "didDisplayError:", v14);
  }

}

- (void)displayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5
{
  id v8;
  id v9;
  MFAccountHealer *v10;
  void *v11;
  MFAccountHealer *v12;
  void ***v13;
  void **v14;
  uint64_t v15;
  id *(*v16)(id *, char);
  void *v17;
  MailErrorHandler *v18;
  id v19;
  id v20;
  int64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = [MFAccountHealer alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance"));
  v12 = -[MFAccountHealer initWithAccount:networkController:error:](v10, "initWithAccount:networkController:error:", v9, v11, v8);

  if (-[MFAccountHealer shouldHealFromAlternateAccount](v12, "shouldHealFromAlternateAccount"))
  {
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_1000E439C;
    v17 = &unk_10051E3E8;
    v18 = self;
    v19 = v8;
    v20 = v9;
    v21 = a5;
    v13 = objc_retainBlock(&v14);
    -[MailErrorHandler _promptUserToTryAlternateSettingsFromAccountHealer:completionHandler:](self, "_promptUserToTryAlternateSettingsFromAccountHealer:completionHandler:", v12, v13, v14, v15, v16, v17, v18);

  }
  else
  {
    -[MailErrorHandler _displayError:forAccount:mode:](self, "_displayError:forAccount:mode:", v8, v9, a5);
  }

}

- (void)_redirectToRecoveryURL:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (v3)
  {
    v5 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v4, "openURL:options:completionHandler:", v5, &__NSDictionary0__struct, 0);

    v3 = v5;
  }

}

- (void)_changeSetManagerEncounteredError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  MailErrorHandler *v8;

  v4 = a3;
  v7 = v4;
  v8 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_1000E44E8, &unk_10051A910));
  objc_msgSend(v5, "performBlock:", &v6);

}

- (void)_promptUserForWebLoginWithAccount:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unsigned __int8 v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  MailErrorHandler *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", MFRequestedWebLoginURLKey));

  if (!v9)
    goto LABEL_4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v11 = objc_msgSend(v10, "applicationState");

  if (v11)
    goto LABEL_4;
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1000E47B8;
  v16 = &unk_10051E410;
  v17 = self;
  v18 = v6;
  v12 = objc_msgSend(v18, "promptUserForWebLoginWithURL:shouldConfirm:completionHandler:", v9, 1, &v13);

  if ((v12 & 1) == 0)
LABEL_4:
    -[MailErrorHandler _presentAlertWithSettingsButtonForAccount:error:](self, "_presentAlertWithSettingsButtonForAccount:error:", v6, v7, v13, v14, v15, v16, v17);

}

- (void)_promptUserToTryAlternateSettingsFromAccountHealer:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSBundle *v10;
  void *v11;
  uint64_t v12;
  NSBundle *v13;
  void *v14;
  void *v15;
  void *v16;
  NSBundle *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSBundle *v22;
  void *v23;
  void *v24;
  NSBundle *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;

  v6 = a3;
  v7 = a4;
  if (pthread_main_np() != 1)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailErrorHandler.m"), 420, CFSTR("Current thread must be main"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "account"));
  v34 = v8;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
  v9 = objc_opt_class(MailAccount);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailAppController));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("HEAL_INCOMING_TITLE"), &stru_100531B00, CFSTR("Main")));
  }
  else
  {
    v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailAppController));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("HEAL_OUTGOING_TITLE"), &stru_100531B00, CFSTR("Main")));
  }
  v14 = (void *)v12;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15));

  v17 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailAppController));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("HEAL_MESSAGE"), &stru_100531B00, CFSTR("Main")));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "domain"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", v20, objc_msgSend(v35, "code"), v19, v16, 0));

  if (-[MailErrorHandler shouldDisplayError:forAccount:mode:](self, "shouldDisplayError:forAccount:mode:", v21, v34, 1))
  {
    -[MailErrorHandler didDisplayError:](self, "didDisplayError:", v21);
    v33 = v7;
    v22 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailAppController));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("REPAIR"), &stru_100531B00, CFSTR("Main")));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v16, v19, 1));
    v25 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailAppController));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100531B00, CFSTR("Main")));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000E4EAC;
    v40[3] = &unk_10051E438;
    v28 = v7;
    v41 = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v27, 1, v40));
    objc_msgSend(v24, "addAction:", v29);

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000E4EBC;
    v37[3] = &unk_10051E460;
    v38 = v6;
    v39 = v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v32, 0, v37));
    v7 = v33;
    objc_msgSend(v24, "addAction:", v30);

    -[MailErrorHandler _presentAlertController:](self, "_presentAlertController:", v24);
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)_presentAlertWithSettingsButtonForAccount:(id)a3 error:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  BOOL v16;
  int v17;
  void *v18;
  NSBundle *v19;
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
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  MailErrorHandler *v42;
  uint8_t buf[4];
  id v44;

  v36 = a3;
  v7 = a4;
  if (pthread_main_np() == 1)
  {
    if (!v7)
      goto LABEL_24;
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailErrorHandler.m"), 460, CFSTR("Current thread must be main"));

    if (!v7)
      goto LABEL_24;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailErrorHandler _alertTitleWithError:](self, "_alertTitleWithError:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedDescription"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedFailureReason"));
  v11 = v10;
  if (v10)
  {
    v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n\n%@"), v9, v10));

    v9 = (void *)v12;
  }
  if (v8 && (v10 = objc_msgSend(&stru_100531B00, "isEqualToString:", v8), !(_DWORD)v10)
    || v9 && (v10 = objc_msgSend(&stru_100531B00, "isEqualToString:", v9), !(_DWORD)v10))
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedRecoverySuggestion"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recoveryAttempter"));
    v15 = objc_opt_respondsToSelector(v34, "attemptRecoveryFromError:optionIndex:delegate:didRecoverSelector:contextInfo:");
    if (v34)
      v16 = v14 == 0;
    else
      v16 = 1;
    v17 = !v16;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MailErrorHandler preferencesURLForAccount:error:](self, "preferencesURLForAccount:error:", v36, v7));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1));
    if ((v17 & v15) != 0)
    {
      v19 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailAppController));
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100531B00, CFSTR("Main")));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v21, 1, 0));
      objc_msgSend(v18, "addAction:", v22);

      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1000E5544;
      v39[3] = &unk_10051E488;
      v40 = v34;
      v41 = v7;
      v42 = self;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v14, 0, v39));
      objc_msgSend(v18, "addAction:", v23);

    }
    else if (v35)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("SETTINGS"), &stru_100531B00, CFSTR("Main")));
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1000E5564;
      v37[3] = &unk_10051D948;
      v38 = v35;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, 0, v37));
      objc_msgSend(v18, "addAction:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100531B00, CFSTR("Main")));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v27, 1, 0));
      objc_msgSend(v18, "addAction:", v28);

    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100531B00, CFSTR("Main")));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v30, 1, 0));
      objc_msgSend(v18, "addAction:", v31);

    }
    -[MailErrorHandler _presentAlertController:](self, "_presentAlertController:", v18);

  }
  else
  {
    v13 = MFLogGeneral(v10);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Warning Suppressing alert for error with no title or message: %@", buf, 0xCu);
    }
  }

LABEL_24:
}

- (id)_alertTitleWithError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("MailErrorHandlerOverridingTitle")));
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mf_shortDescription"));
  v8 = v7;

  return v8;
}

- (void)_presentAlertController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailErrorHandler presentationDelegate](self, "presentationDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForPresentingErrors"));

  if (v5)
    objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

}

- (MailErrorPresentationDelegate)presentationDelegate
{
  return (MailErrorPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (NSMutableSet)displayedErrorDescriptions
{
  return self->_displayedErrorDescriptions;
}

- (void)setDisplayedErrorDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_displayedErrorDescriptions, a3);
}

- (NSMutableSet)sslErrorAccountsDisplayed
{
  return self->_sslErrorAccountsDisplayed;
}

- (void)setSslErrorAccountsDisplayed:(id)a3
{
  objc_storeStrong((id *)&self->_sslErrorAccountsDisplayed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sslErrorAccountsDisplayed, 0);
  objc_storeStrong((id *)&self->_displayedErrorDescriptions, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
