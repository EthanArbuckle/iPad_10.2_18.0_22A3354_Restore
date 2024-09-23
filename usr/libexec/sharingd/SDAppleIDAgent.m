@implementation SDAppleIDAgent

- (SDAppleIDAgent)init
{
  SDAppleIDAgent *v2;
  uint64_t v3;
  NSDate *creationDate;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v10;
  NSMutableArray *findPersonRequests;
  NSString *pushEnvironment;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SDAppleIDAgent;
  v2 = -[SDAppleIDAgent init](&v14, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    creationDate = v2->_creationDate;
    v2->_creationDate = (NSDate *)v3;

    v7 = SFMainQueue(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    findPersonRequests = v2->_findPersonRequests;
    v2->_findPersonRequests = (NSMutableArray *)v10;

    pushEnvironment = v2->_pushEnvironment;
    v2->_pushEnvironment = (NSString *)CFSTR("production");

  }
  return v2;
}

- (void)dealloc
{
  SDAppleIDAgent *v2;
  SEL v3;
  objc_super v4;

  if (self->_pushConnection)
  {
    v2 = (SDAppleIDAgent *)FatalErrorF("Push connection still active during dealloc", a2);
    -[SDAppleIDAgent eduModeEnabled](v2, v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SDAppleIDAgent;
    -[SDAppleIDAgent dealloc](&v4, "dealloc");
  }
}

- (BOOL)eduModeEnabled
{
  if (qword_1007C6B78 != -1)
    dispatch_once(&qword_1007C6B78, &stru_1007194F0);
  return byte_1007C6B70;
}

- (id)_accountForAppleID:(id)a3
{
  return -[SDAppleIDDatabaseManager accountForAppleID:](self->_dbManager, "accountForAppleID:", a3);
}

- (int64_t)_accountState
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  const void *v11;
  id v12;
  const void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  int64_t v17;

  if (self->_appleID)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v4 = objc_msgSend(v3, "deviceWasUnlockedOnce");

    if ((v4 & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _accountForAppleID:](self, "_accountForAppleID:", self->_appleID));
      if (v5)
      {
        v6 = v5;
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "altDSID"));

        if (v7)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identity"));
          if (v8)
          {
            v9 = v8;
            v10 = objc_msgSend(v8, "copyCertificate");
            if (v10)
            {
              v11 = v10;
              v12 = objc_msgSend(v9, "copyIntermediateCertificate");
              if (v12)
              {
                v13 = v12;
                v14 = objc_msgSend(v9, "copyPrivateKey");
                if (v14)
                {
                  if (objc_msgSend(v9, "certificateExpired"))
                  {
                    if (dword_1007B3030 <= 60
                      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
                    {
                      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _accountState]", 60, "Certificate expired\n");
                    }
                    v17 = 5;
                  }
                  else if (objc_msgSend(v9, "isInvalid"))
                  {
                    if (dword_1007B3030 <= 60
                      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
                    {
                      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _accountState]", 60, "Identity object for %{mask} is invalid\n", self->_appleID);
                    }
                    v17 = 2;
                  }
                  else
                  {
                    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "validationRecord"));
                    v16 = objc_msgSend(v15, "isInvalid");

                    if (v16)
                    {
                      if (dword_1007B3030 <= 30
                        && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
                      {
                        LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _accountState]", 30, "Validation Record for %{mask} is invalid\n", self->_appleID);
                      }
                      v17 = 3;
                    }
                    else
                    {
                      v17 = 1;
                    }
                  }
                }
                else
                {
                  if (dword_1007B3030 <= 60
                    && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
                  {
                    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _accountState]", 60, "No private key for %{mask}\n", self->_appleID);
                  }
                  v17 = 11;
                }
                CFRelease(v11);
                CFRelease(v13);
                if (v14)
                  CFRelease(v14);
              }
              else
              {
                if (dword_1007B3030 <= 60
                  && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
                {
                  LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _accountState]", 60, "No intermediate certificate for %{mask}\n", self->_appleID);
                }
                CFRelease(v11);
                v17 = 12;
              }
            }
            else
            {
              if (dword_1007B3030 <= 60
                && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
              {
                LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _accountState]", 60, "No certificate for %{mask}\n", self->_appleID);
              }
              v17 = 6;
            }
            goto LABEL_15;
          }
          if (self->_identityRequest)
          {
            if (dword_1007B3030 <= 30
              && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
            {
              LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _accountState]", 30, "No identity object for %{mask}. A request is in progress\n", self->_appleID);
            }
            v9 = 0;
            v17 = 4;
            goto LABEL_15;
          }
          if (dword_1007B3030 <= 30
            && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
          {
            LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _accountState]", 30, "No identity object for %{mask}\n", self->_appleID);
          }
        }
        else if (dword_1007B3030 <= 60
               && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
        {
          LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _accountState]", 60, "No altDSID for %{mask}, probably because it doesn't have the identity object.\n", self->_appleID);
        }
        v9 = 0;
        v17 = 10;
        goto LABEL_15;
      }
      if (dword_1007B3030 <= 60
        && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
      {
        LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _accountState]", 60, "No account info for apple ID %{mask}\n", self->_appleID);
      }
      v9 = 0;
      v6 = 0;
      v17 = 9;
    }
    else
    {
      if (dword_1007B3030 <= 30
        && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
      {
        LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _accountState]", 30, "Device not unlocked yet\n");
      }
      v9 = 0;
      v6 = 0;
      v17 = 14;
    }
  }
  else
  {
    if (dword_1007B3030 <= 50
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 50)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _accountState]", 50, "User not signed in\n");
    }
    v9 = 0;
    v6 = 0;
    v17 = 13;
  }
LABEL_15:

  return v17;
}

- (void)_activate
{
  if (dword_1007B3030 <= 30 && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _activate]", 30, "Activate\n");
  -[SDAppleIDAgent _prefsChanged](self, "_prefsChanged");
  -[SDAppleIDAgent _addObservers](self, "_addObservers");
  -[SDAppleIDAgent _ensurePushStarted](self, "_ensurePushStarted");
  -[SDAppleIDAgent _ensurePeriodicVerifyTimerStarted](self, "_ensurePeriodicVerifyTimerStarted");
  -[SDAppleIDAgent _ensureEduModeDevicesAreCleanedUp](self, "_ensureEduModeDevicesAreCleanedUp");
}

- (void)_addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "handleAppleIDSignedInNotification", CFSTR("com.apple.sharingd.AppleAccountSignIn"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "handleAppleIDSignedOutNotification", CFSTR("com.apple.sharingd.AppleAccountSignOut"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "handleAppleIDChangedNotification", CFSTR("com.apple.sharingd.AppleIDChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "handleUILockStatusChangedNotification", CFSTR("com.apple.sharingd.UILockStatusChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "handleKeyBagFirstUnlockNotification", CFSTR("com.apple.sharingd.KeyBagFirstUnlock"), 0);

}

- (void)_invalidate
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  SDAppleIDIdentityRequest *identityRequest;
  SDAppleIDIdentityRequest *v9;
  SDAppleIDServerTask *infoRequest;
  SDAppleIDServerTask *v11;
  SDAppleIDIdentityRequest *testIdentityRequest;
  SDAppleIDIdentityRequest *v13;
  SDAppleIDServerTask *task;
  SDAppleIDServerTask *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  -[SDAppleIDAgent _removeObservers](self, "_removeObservers");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_findPersonRequests;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "invalidate", (_QWORD)v16);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_findPersonRequests, "removeAllObjects");
  identityRequest = self->_identityRequest;
  if (identityRequest)
  {
    -[SDAppleIDIdentityRequest invalidate](identityRequest, "invalidate");
    v9 = self->_identityRequest;
    self->_identityRequest = 0;

  }
  infoRequest = self->_infoRequest;
  if (infoRequest)
  {
    -[SDAppleIDServerTask invalidate](infoRequest, "invalidate");
    v11 = self->_infoRequest;
    self->_infoRequest = 0;

  }
  testIdentityRequest = self->_testIdentityRequest;
  if (testIdentityRequest)
  {
    -[SDAppleIDIdentityRequest invalidate](testIdentityRequest, "invalidate");
    v13 = self->_testIdentityRequest;
    self->_testIdentityRequest = 0;

    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _invalidate]", 30, "Invalidated certificate request\n", (_QWORD)v16);
    }
  }
  -[SDAppleIDAgent _ensurePushStopped](self, "_ensurePushStopped", (_QWORD)v16);
  -[SDAppleIDAgent _ensurePeriodicVerifyTimerStopped](self, "_ensurePeriodicVerifyTimerStopped");
  -[SDAppleIDAgent _ensureThrottledRetryTimerStopped](self, "_ensureThrottledRetryTimerStopped");
  task = self->_task;
  if (task)
  {
    -[SDAppleIDServerTask invalidate](task, "invalidate");
    v15 = self->_task;
    self->_task = 0;

    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _invalidate]", 30, "Invalidated server task\n");
    }
  }
}

- (void)_cleanUpAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  SDAppleIDDatabaseManager *dbManager;
  void *v12;
  id v13;

  v4 = a3;
  v13 = v4;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "certificateToken"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "certificateTokenCreationDate"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", 259200.0));

      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "certificateTokenCreationDate"));
      if (!v7
        || (v8 = (void *)v7,
            v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date")),
            v10 = objc_msgSend(v9, "compare:", v5),
            v9,
            v8,
            v10 == (id)1))
      {
        if (dword_1007B3030 <= 60
          && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
        {
          LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _cleanUpAccount:]", 60, "Certificate token is missing or stale, setting it to nil\n");
        }
        objc_msgSend(v13, "setCertificateToken:", 0);
        objc_msgSend(v13, "setPrivateKeyPersistentReference:", 0);
        dbManager = self->_dbManager;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appleID"));
        -[SDAppleIDDatabaseManager setCertificateToken:privateKeyPersistentReference:forAppleID:](dbManager, "setCertificateToken:privateKeyPersistentReference:forAppleID:", 0, 0, v12);

      }
    }
  }
  else
  {
    v5 = 0;
  }

}

- (void)_clearAccount
{
  SDAppleIDIdentityRequest *identityRequest;
  SDAppleIDIdentityRequest *v4;
  SDAppleIDServerTask *infoRequest;
  SDAppleIDServerTask *v6;

  identityRequest = self->_identityRequest;
  if (identityRequest)
  {
    -[SDAppleIDIdentityRequest invalidate](identityRequest, "invalidate");
    v4 = self->_identityRequest;
    self->_identityRequest = 0;

  }
  infoRequest = self->_infoRequest;
  if (infoRequest)
  {
    -[SDAppleIDServerTask invalidate](infoRequest, "invalidate");
    v6 = self->_infoRequest;
    self->_infoRequest = 0;

  }
  -[SDAppleIDDatabaseManager removeAppleID:](self->_dbManager, "removeAppleID:", self->_appleID);
  -[SDAppleIDDatabaseManager clearPersonInfoCache](self->_dbManager, "clearPersonInfoCache");
  -[SDAppleIDAgent _ensureThrottledRetryTimerStopped](self, "_ensureThrottledRetryTimerStopped");
  sub_10016A6E8();
}

- (__SecIdentity)_copyIdentityForAppleID:(id)a3
{
  void *v3;
  __SecIdentity *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager identityForAppleID:](self->_dbManager, "identityForAppleID:", a3));
  v4 = (__SecIdentity *)objc_msgSend(v3, "copyIdentity");

  return v4;
}

- (void)_ensurePushStarted
{
  unsigned int v3;
  uint64_t (**v4)(void);
  uint64_t v5;
  void *v6;
  APSConnection *v7;
  APSConnection *pushConnection;
  APSConnection *v9;
  void *v10;
  const __CFString *v11;

  if (!self->_pushConnection)
  {
    if (self->_agentEnabled)
    {
      v3 = -[NSString isEqualToString:](self->_pushEnvironment, "isEqualToString:", CFSTR("production"));
      v4 = &off_1007B30A8;
      if (!v3)
        v4 = &off_1007B30B0;
      v5 = (*v4)();
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v7 = (APSConnection *)objc_msgSend(objc_alloc(off_1007B30B8()), "initWithEnvironmentName:namedDelegatePort:queue:", v6, CFSTR("com.apple.coreservices.appleid.aps"), self->_dispatchQueue);
      pushConnection = self->_pushConnection;
      self->_pushConnection = v7;

      -[APSConnection setDelegate:](self->_pushConnection, "setDelegate:", self);
      v9 = self->_pushConnection;
      v11 = CFSTR("com.apple.idmsauthagent");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
      -[APSConnection setEnabledTopics:](v9, "setEnabledTopics:", v10);

      -[APSConnection requestTokenForTopic:identifier:](self->_pushConnection, "requestTokenForTopic:identifier:", CFSTR("com.apple.idmsauthagent"), 0);
      if (dword_1007B3030 <= 30
        && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
      {
        LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _ensurePushStarted]", 30, "Started push agent with environment %@\n", v6);
      }

    }
    else if (dword_1007B3030 <= 30
           && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _ensurePushStarted]", 30, "AIA disabled\n");
    }
  }
}

- (id)_detailedDescription
{
  id v3;
  id v4;
  const char *v5;
  id v6;
  id v7;
  const char *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  const char *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  const char *v37;
  id v38;
  void *v39;
  const char *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  const char *v61;
  id v62;
  void *v63;
  const char *v64;
  id v65;
  void *v66;
  const char *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  const char *v80;
  id v81;
  void *v82;
  const char *v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  const char *v90;
  id v91;
  const char *v92;
  id v93;
  const char *v94;
  id v95;
  void *v96;
  const char *v97;
  id v98;
  const char *v99;
  id v100;
  uint64_t v101;
  const char *v102;
  id v103;
  void *v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  id v109;
  void *v110;
  id v111;
  void *v112;
  id v113;
  unint64_t v114;
  const __CFString *v115;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160[2];

  v160[0] = 0;
  NSAppendPrintF(v160, "-- SDAppleIDAgent --\n");
  v3 = v160[0];
  v159 = v3;
  NSAppendPrintF(&v159, "Creation Date:                       %@\n", self->_creationDate);
  v4 = v159;

  v158 = v4;
  if (self->_agentEnabled)
    v5 = "yes";
  else
    v5 = "no";
  NSAppendPrintF(&v158, "Enabled:                             %s\n", v5);
  v6 = v158;

  v157 = v6;
  NSAppendPrintF(&v157, "Push Environment:                    %@\n", self->_pushEnvironment);
  v7 = v157;

  v156 = v7;
  if (-[SDAppleIDAgent eduModeEnabled](self, "eduModeEnabled"))
    v8 = "yes";
  else
    v8 = "no";
  NSAppendPrintF(&v156, "Edu Mode Enabled:                    %s\n", v8);
  v9 = v156;

  if (self->_agentEnabled)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager accountForAppleID:](self->_dbManager, "accountForAppleID:", self->_appleID));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identity"));
    v155 = v9;
    NSAppendPrintF(&v155, "Apple ID:                            %@\n", self->_appleID);
    v12 = v155;

    v154 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contactInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstName"));
    NSAppendPrintF(&v154, "First Name:                          %@\n", v14);
    v15 = v154;

    v153 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contactInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastName"));
    NSAppendPrintF(&v153, "Last Name:                           %@\n", v17);
    v18 = v153;

    v152 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "altDSID"));
    NSAppendPrintF(&v152, "AltDSID:                             %@\n", v19);
    v20 = v152;

    v151 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "validationRecord"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "data"));
    if (v22)
      v23 = "yes";
    else
      v23 = "no";
    NSAppendPrintF(&v151, "Validation Record (VR) Available:    %s\n", v23);
    v24 = v151;

    v150 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "validationRecord"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "altDSID"));
    NSAppendPrintF(&v150, "VR AltDSID:                          %@\n", v26);
    v27 = v150;

    v149 = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "validationRecord"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "validStartDate"));
    NSAppendPrintF(&v149, "VR Valid Start Date:                 %@\n", v29);
    v30 = v149;

    v148 = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "validationRecord"));
    NSAppendPrintF(&v148, "VR Suggested Valid Duration:         %ld\n", objc_msgSend(v31, "suggestedValidDuration"));
    v32 = v148;

    v147 = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "validationRecord"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "nextCheckDate"));
    NSAppendPrintF(&v147, "VR Next Check Date:                  %@\n", v34);
    v35 = v147;

    v146 = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "validationRecord"));
    if (objc_msgSend(v36, "needsUpdate"))
      v37 = "yes";
    else
      v37 = "no";
    NSAppendPrintF(&v146, "VR Needs Update:                     %s\n", v37);
    v38 = v146;

    v145 = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "validationRecord"));
    if (objc_msgSend(v39, "isInvalid"))
      v40 = "yes";
    else
      v40 = "no";
    NSAppendPrintF(&v145, "VR Invalid:                          %s\n", v40);
    v41 = v145;

    v144 = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contactInfo"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "validatedEmailAddresses"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "componentsJoinedByString:", CFSTR(", ")));
    NSAppendPrintF(&v144, "Validated Email Addresses:           %@\n", v44);
    v45 = v144;

    v143 = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "validationRecord"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "validatedEmailHashes"));
    v48 = SFShortHashArrayDescription(v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    NSAppendPrintF(&v143, "Validated Email Hashes:              %@\n", v49);
    v50 = v143;

    v142 = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contactInfo"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "validatedPhoneNumbers"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "componentsJoinedByString:", CFSTR(", ")));
    NSAppendPrintF(&v142, "Validated Phone Numbers:             %@\n", v53);
    v54 = v142;

    v141 = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "validationRecord"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "validatedPhoneHashes"));
    v57 = SFShortHashArrayDescription(v56);
    v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
    NSAppendPrintF(&v141, "Validated Phone Hashes:              %@\n", v58);
    v59 = v141;

    v140 = v59;
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "privateKeyPersistentReference"));
    v61 = "yes";
    if (!v60)
      v61 = "no";
    NSAppendPrintF(&v140, "Temporary Private Key Reference:     %s\n", v61);
    v62 = v140;

    v139 = v62;
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateKeyPersistentReference"));
    if (v63)
      v64 = "yes";
    else
      v64 = "no";
    NSAppendPrintF(&v139, "Private Key Persistent Reference:    %s\n", v64);
    v65 = v139;

    v138 = v65;
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "certificatePersistentReference"));
    if (v66)
      v67 = "yes";
    else
      v67 = "no";
    NSAppendPrintF(&v138, "Certificate Available:               %s\n", v67);
    v68 = v138;

    v137 = v68;
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountIdentifier"));
    NSAppendPrintF(&v137, "Certificate Account Identifier (AI): %@\n", v69);
    v70 = v137;

    v136 = v70;
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "certificateExpirationDate"));
    NSAppendPrintF(&v136, "Certificate Expiration Date:         %@\n", v71);
    v72 = v136;

    v135 = v72;
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serialNumber"));
    NSAppendPrintF(&v135, "Certificate Serial Number:           %@\n", v73);
    v74 = v135;

    v134 = v74;
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "certificateToken"));
    NSAppendPrintF(&v134, "Certificate Token:                   %@\n", v75);
    v76 = v134;

    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "validationRecord"));
    if (v77 && v11)
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "validationRecord"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "altDSID"));

      if (v79)
      {
        v132 = v76;
        v54 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountIdentifier"));
        if (objc_msgSend(v54, "hasSuffix:", v79))
          v80 = "yes";
        else
          v80 = "no";
        NSAppendPrintF(&v132, "Certificate AI and VR AltDSID match: %s\n", v80);
        v81 = v132;

        v76 = v54;
      }
      else
      {
        v133 = v76;
        NSAppendPrintF(&v133, "VR AltDSID is nil\n");
        v81 = v133;
      }

      v76 = v81;
    }
    v131 = v76;
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "intermediateCertificatePersistentReference"));
    if (v82)
      v83 = "yes";
    else
      v83 = "no";
    NSAppendPrintF(&v131, "Intermediate Certificate Available:  %s\n", v83);
    v84 = v131;

    v130 = v84;
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "intermediateCertificateExpirationDate"));
    NSAppendPrintF(&v130, "Intermediate Cert. Expiration Date:  %@\n", v85);
    v86 = v130;

    v129 = v86;
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "intermediateCertificateSerialNumber"));
    NSAppendPrintF(&v129, "Intermediate Cert. Serial Number:    %@\n", v87);
    v88 = v129;

    v128 = v88;
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "certificatePersistentReference"));
    if (v89)
    {
      v54 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateKeyPersistentReference"));
      if (v54)
        v90 = "yes";
      else
        v90 = "no";
    }
    else
    {
      v90 = "no";
    }
    NSAppendPrintF(&v128, "Identity Available:                  %s\n", v90);
    v91 = v128;

    if (v89)
    v127 = v91;
    if (objc_msgSend(v11, "isInvalid"))
      v92 = "yes";
    else
      v92 = "no";
    NSAppendPrintF(&v127, "Identity Invalid:                    %s\n", v92);
    v93 = v127;

    v126 = v93;
    if (objc_msgSend(v11, "needsRenewal"))
      v94 = "yes";
    else
      v94 = "no";
    NSAppendPrintF(&v126, "Identity Needs Renewal:              %s\n", v94);
    v95 = v126;

    v125 = v95;
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    if (objc_msgSend(v96, "deviceWasUnlockedOnce"))
      v97 = "yes";
    else
      v97 = "no";
    NSAppendPrintF(&v125, "Device Unlocked Once:                %s\n", v97);
    v98 = v125;

    v124 = v98;
    if (-[SDAppleIDAgent _wasOldAgentIdentityQueried](self, "_wasOldAgentIdentityQueried"))
      v99 = "yes";
    else
      v99 = "no";
    NSAppendPrintF(&v124, "Old Agent Identity Queried:          %s\n", v99);
    v100 = v124;

    v101 = CFGetInt64(-[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", CFSTR("OldAgentIdentityWasUsed")), 0);
    v123 = v100;
    if (v101)
      v102 = "yes";
    else
      v102 = "no";
    NSAppendPrintF(&v123, "Old Agent Identity Used:             %s\n", v102);
    v103 = v123;

    if (v101)
    {
      v122 = v103;
      v104 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", CFSTR("OldAgentCertificateSN")));
      NSAppendPrintF(&v122, "Old Agent Certificate Serial Number: %@\n", v104);
      v105 = v122;

      v103 = v105;
    }
    v121 = v103;
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", CFSTR("LastSignInDate")));
    NSAppendPrintF(&v121, "Last Sign In Date:                   %@\n", v106);
    v107 = v121;

    v120 = v107;
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", CFSTR("LastSignOutDate")));
    NSAppendPrintF(&v120, "Last Sign Out Date:                  %@\n", v108);
    v109 = v120;

    v119 = v109;
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", CFSTR("LastSignOutAppleID")));
    NSAppendPrintF(&v119, "Last Apple ID To Sign Out:           %@\n", v110);
    v111 = v119;

    v118 = v111;
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", CFSTR("LastAllGoodDate")));
    NSAppendPrintF(&v118, "Last All Good Date:                  %@\n", v112);
    v113 = v118;

    v117 = v113;
    v114 = -[SDAppleIDAgent _accountState](self, "_accountState");
    if (v114 > 0xE)
      v115 = CFSTR("?");
    else
      v115 = *(&off_100719798 + v114);
    NSAppendPrintF(&v117, "Account state:                       %@\n", v115);
    v9 = v117;

  }
  return v9;
}

- (void)_checkIfAppleIDCertificateChainIsValidForIdentity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  id v10;
  const void *v11;
  void *v12;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  int v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[2];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = 201203;
    v9 = objc_msgSend(v6, "copyCertificate");
    v10 = objc_msgSend(v6, "copyIntermediateCertificate");
    v11 = v10;
    if (v9)
    {
      if (v10)
      {
        v20[0] = v9;
        v20[1] = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
        dispatchQueue = self->_dispatchQueue;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10018858C;
        v18[3] = &unk_100719518;
        v18[4] = self;
        v19 = v7;
        SFAppleIDVerifyCertificateChain(v12, dispatchQueue, v18);

LABEL_5:
        CFRelease(v9);
        goto LABEL_6;
      }
      v8 = 201222;
    }
  }
  else
  {
    v9 = 0;
    v11 = 0;
    v8 = -6705;
  }
  if (v7)
  {
    v14 = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001885E8;
    block[3] = &unk_100716EA8;
    v16 = v7;
    v17 = v8;
    dispatch_async(v14, block);

  }
  if (v9)
    goto LABEL_5;
LABEL_6:
  if (v11)
    CFRelease(v11);

}

- (int)_ensureEduModeDevicesAreCleanedUp
{
  NSString *v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD block[4];
  NSString *v8;
  SDAppleIDAgent *v9;
  uint64_t v10;

  if (-[SDAppleIDAgent eduModeEnabled](self, "eduModeEnabled"))
  {
    v3 = self->_appleID;
    if (!-[SDAppleIDAgent _keychainCleanupTag](self, "_keychainCleanupTag"))
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v5 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001886C0;
      block[3] = &unk_100715D08;
      v10 = 0;
      v3 = v3;
      v8 = v3;
      v9 = self;
      dispatch_async(v5, block);

    }
  }
  else
  {
    v3 = 0;
  }

  return 0;
}

- (void)_ensurePushStopped
{
  APSConnection *pushConnection;
  APSConnection *v4;

  pushConnection = self->_pushConnection;
  if (pushConnection)
  {
    -[APSConnection shutdown](pushConnection, "shutdown");
    -[APSConnection setDelegate:](self->_pushConnection, "setDelegate:", 0);
    v4 = self->_pushConnection;
    self->_pushConnection = 0;

    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _ensurePushStopped]", 30, "Invalidated push agent\n");
    }
  }
}

- (void)_ensurePeriodicVerifyTimerStarted
{
  OS_dispatch_source *v3;
  OS_dispatch_source *periodicVerifyTimer;
  NSObject *v5;
  _QWORD handler[5];

  if (!self->_periodicVerifyTimer)
  {
    if (self->_agentEnabled)
    {
      v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      periodicVerifyTimer = self->_periodicVerifyTimer;
      self->_periodicVerifyTimer = v3;

      v5 = self->_periodicVerifyTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100188A60;
      handler[3] = &unk_1007146D8;
      handler[4] = self;
      dispatch_source_set_event_handler(v5, handler);
      SFDispatchTimerSet(self->_periodicVerifyTimer, 0.0, 3600.0, -4.0);
      dispatch_resume((dispatch_object_t)self->_periodicVerifyTimer);
      if (dword_1007B3030 <= 30
        && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
      {
        LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _ensurePeriodicVerifyTimerStarted]", 30, "Started periodic verify timer\n");
      }
    }
    else if (dword_1007B3030 <= 30
           && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _ensurePeriodicVerifyTimerStarted]", 30, "AIA disabled\n");
    }
  }
}

- (void)_ensurePeriodicVerifyTimerStopped
{
  OS_dispatch_source *periodicVerifyTimer;
  NSObject *v4;
  OS_dispatch_source *v5;

  periodicVerifyTimer = self->_periodicVerifyTimer;
  if (periodicVerifyTimer)
  {
    v4 = periodicVerifyTimer;
    dispatch_source_cancel(v4);
    v5 = self->_periodicVerifyTimer;
    self->_periodicVerifyTimer = 0;

    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _ensurePeriodicVerifyTimerStopped]", 30, "Stopped periodic verify timer\n");
    }
  }
}

- (void)_ensureThrottledRetryTimerStartedWithSuggestedDelay:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *throttledRetryTimer;
  NSObject *v14;
  _QWORD handler[5];

  if (self->_throttledRetryTimer)
  {
    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _ensureThrottledRetryTimerStartedWithSuggestedDelay:]", 30, "Throttled retry already scheduled\n");
    }
    goto LABEL_34;
  }
  if (!self->_agentEnabled)
  {
    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _ensureThrottledRetryTimerStartedWithSuggestedDelay:]", 30, "AIA disabled\n");
    }
LABEL_34:
    v8 = 0;
    v5 = 0;
    goto LABEL_23;
  }
  v4 = a3;
  if (a3)
  {
    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _ensureThrottledRetryTimerStartedWithSuggestedDelay:]", 30, "Using server suggested delay of %d seconds\n", v4);
    }
    v8 = 0;
    v5 = 0;
  }
  else
  {
    sub_10016A770();
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v6 = sub_10016A8E4();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if (!v5 || !v7)
      goto LABEL_23;
    objc_msgSend(v7, "timeIntervalSinceDate:", v5);
    v4 = (unint64_t)v9;
  }
  v10 = 16;
  if (v4 > 0x10)
    v10 = v4;
  if (v10 >= 0x15180)
    v10 = 86400;
  if (v4)
    v11 = v10;
  else
    v11 = 3600;
  v12 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  throttledRetryTimer = self->_throttledRetryTimer;
  self->_throttledRetryTimer = v12;

  v14 = self->_throttledRetryTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100188DD8;
  handler[3] = &unk_1007146D8;
  handler[4] = self;
  dispatch_source_set_event_handler(v14, handler);
  SFDispatchTimerSet(self->_throttledRetryTimer, (double)v11, -1.0, -4.0);
  dispatch_resume((dispatch_object_t)self->_throttledRetryTimer);
  if (dword_1007B3030 <= 30 && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _ensureThrottledRetryTimerStartedWithSuggestedDelay:]", 30, "Started throttled retry timer with delay: %d seconds\n", v11);
LABEL_23:

}

- (void)_ensureThrottledRetryTimerStopped
{
  OS_dispatch_source *throttledRetryTimer;
  NSObject *v4;
  OS_dispatch_source *v5;

  throttledRetryTimer = self->_throttledRetryTimer;
  if (throttledRetryTimer)
  {
    v4 = throttledRetryTimer;
    dispatch_source_cancel(v4);
    v5 = self->_throttledRetryTimer;
    self->_throttledRetryTimer = 0;

    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _ensureThrottledRetryTimerStopped]", 30, "Stopped throttled retry timer\n");
    }
  }
}

- (void)_handleAccountIdentifierValidationRecordMismatch
{
  if (self->_appleID)
  {
    -[SDAppleIDAgent _setCurrentAppleIDIdentity:](self, "_setCurrentAppleIDIdentity:", 0);
    -[SDAppleIDAgent _setCurrentAppleIDContactInfo:validationRecord:](self, "_setCurrentAppleIDContactInfo:validationRecord:", 0, 0);
    -[SDAppleIDAgent _verifyStateWithDelay:](self, "_verifyStateWithDelay:", 30.0);
  }
  else if (dword_1007B3030 <= 90
         && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 90)))
  {
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleAccountIdentifierValidationRecordMismatch]", 90, "Apple ID isn't set\n");
  }
}

- (void)_handleAppleIDChangedNotification
{
  if (dword_1007B3030 <= 30 && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleAppleIDChangedNotification]", 30, "Apple ID changed\n");
  -[SDAppleIDAgent _verifyStateWithDelay:](self, "_verifyStateWithDelay:", 15.0);
}

- (void)_handleAppleIDSignedInNotification
{
  void *v3;

  if (self->_agentEnabled)
  {
    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleAppleIDSignedInNotification]", 30, "Apple ID signed in\n");
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[SDAppleIDAgent _setMetaInfoValue:forKey:](self, "_setMetaInfoValue:forKey:", v3, CFSTR("LastSignInDate"));

    -[SDAppleIDAgent _updateAppleID](self, "_updateAppleID");
    sub_10016A6E8();
    -[SDAppleIDAgent _verifyStateWithDelay:](self, "_verifyStateWithDelay:", 15.0);
  }
}

- (void)_handleAppleIDSignedOutNotification
{
  void *v3;
  NSString *appleID;

  if (self->_agentEnabled)
  {
    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleAppleIDSignedOutNotification]", 30, "Apple ID signed out\n");
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[SDAppleIDAgent _setMetaInfoValue:forKey:](self, "_setMetaInfoValue:forKey:", v3, CFSTR("LastSignOutDate"));

    -[SDAppleIDAgent _setMetaInfoValue:forKey:](self, "_setMetaInfoValue:forKey:", self->_appleID, CFSTR("LastSignOutAppleID"));
    -[SDAppleIDAgent _clearAccount](self, "_clearAccount");
    appleID = self->_appleID;
    self->_appleID = 0;

    -[SDAppleIDAgent _verifyState](self, "_verifyState");
  }
}

- (void)_handleCertificateStatusUpdate:(int64_t)a3 forAppleID:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  id v13;

  v13 = a4;
  if ((objc_msgSend(v13, "isEqualToString:", self->_appleID) & 1) == 0)
  {
    if (dword_1007B3030 <= 60
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleCertificateStatusUpdate:forAppleID:]", 60, "### Apple ID %{mask} not currently signed in, cannot handle certifcate status \n", v13);
    }
    goto LABEL_39;
  }
  v6 = objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager accountForAppleID:](self->_dbManager, "accountForAppleID:", v13));
  if (!v6)
  {
    if (dword_1007B3030 <= 60
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleCertificateStatusUpdate:forAppleID:]", 60, "### No account for %{mask}, cannot handle certificate status\n", v13);
    }
LABEL_39:
    v7 = 0;
    goto LABEL_21;
  }
  v7 = (void *)v6;
  switch(a3)
  {
    case 0:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag sharedBag](AKURLBag, "sharedBag"));
      v9 = objc_msgSend(v8, "IDMSEnvironment");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "altDSID"));
      SFMetricsLogUnexpectedEvent(1, v9, v10);

      goto LABEL_5;
    case 1:
      break;
    case 2:
      if (dword_1007B3030 <= 30
        && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
      {
        LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleCertificateStatusUpdate:forAppleID:]", 30, "Certificate status %@\n", CFSTR("Pending"));
      }
      break;
    case 3:
    case 4:
    case 5:
LABEL_5:
      if (dword_1007B3030 <= 60
        && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
      {
        if ((unint64_t)a3 > 5)
          v11 = CFSTR("?");
        else
          v11 = *(&off_100719810 + a3);
        LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleCertificateStatusUpdate:forAppleID:]", 60, "### Certificate status %@, removing current identity\n", v11);
      }
      -[SDAppleIDAgent _setCurrentAppleIDIdentity:](self, "_setCurrentAppleIDIdentity:", 0);
      break;
    default:
      if (dword_1007B3030 <= 60
        && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
      {
        if ((unint64_t)a3 > 3)
          v12 = CFSTR("?");
        else
          v12 = *(&off_100719840 + a3);
        LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleCertificateStatusUpdate:forAppleID:]", 60, "### Unhandled certificate state %@\n", v12);
      }
      break;
  }
LABEL_21:

}

- (void)_handleFindPersonResponse:(id)a3 forRequest:(id)a4 emailOrPhone:(id)a5 withError:(id)a6 queue:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  uint64_t v29;
  id v30;
  NSString *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  void (**v40)(_QWORD, _QWORD, _QWORD);
  id v42;
  id v43;
  NSErrorUserInfoKey v44;
  const __CFString *v45;
  id v46;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)a7);
  v40 = (void (**)(_QWORD, _QWORD, _QWORD))v16;
  if (!v16)
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
LABEL_26:
    v22 = 0;
    goto LABEL_12;
  }
  if (v15)
  {
    v20 = v15;
    v18 = 0;
    v19 = 0;
    v21 = 0;
    v16 = 0;
    goto LABEL_26;
  }
  v18 = 0;
  v19 = 4294960534;
  v20 = 0;
  v21 = 0;
  v16 = 0;
  v22 = 0;
  if (v13 && v14)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v13));
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v22, CFSTR("MatchedValue"), TypeID, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
    v46 = v14;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
    v43 = 0;
    v19 = sub_10020A010(v25, 1, &v43);
    v18 = v43;

    if ((_DWORD)v19)
    {
      v20 = 0;
      v16 = 0;
      goto LABEL_12;
    }
    if (!v18 || objc_msgSend(v18, "count") != (id)1)
    {
      v20 = 0;
      v16 = 0;
LABEL_32:
      v19 = 4294960534;
      goto LABEL_12;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
    v27 = objc_msgSend(v21, "isEqualToString:", v26);

    if ((v27 & 1) != 0)
    {
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v14, CFSTR("MatchedValue"));
      v16 = objc_msgSend(objc_alloc((Class)SFAppleIDPersonInfo), "initWithDictionary:", v22);
      if (v16)
      {
        -[SDAppleIDDatabaseManager addPersonInfoToCache:](self->_dbManager, "addPersonInfoToCache:", v16);
        v19 = 0;
        v20 = 0;
        goto LABEL_12;
      }
      v20 = 0;
      goto LABEL_32;
    }
    if (dword_1007B3030 <= 60
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleFindPersonResponse:forRequest:emailOrPhone:withError:queue:completion:]", 60, "Find person response matched value doesn't match the request\n");
    }
    v20 = 0;
    v16 = 0;
    v19 = 4294960584;
  }
LABEL_12:
  v39 = v21;
  objc_msgSend(v17, "invalidate");
  -[NSMutableArray removeObject:](self->_findPersonRequests, "removeObject:", v17);

  if ((_DWORD)v19)
  {
    v42 = v15;
    v38 = v13;
    v28 = v22;
    v29 = (int)v19;
    v44 = NSLocalizedDescriptionKey;
    v30 = v14;
    v31 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v19, 0, 0));
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)v32;
    v34 = CFSTR("?");
    if (v32)
      v34 = (const __CFString *)v32;
    v45 = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
    v36 = v29;
    v22 = v28;
    v37 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v36, v35));

    v14 = v30;
    v20 = (id)v37;
    v13 = v38;
    v15 = v42;
  }
  if (v20
    && dword_1007B3030 <= 90
    && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 90)))
  {
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleFindPersonResponse:forRequest:emailOrPhone:withError:queue:completion:]", 90, "### Find Person request failed with error %@\n", v20);
  }
  if (v40)
    ((void (**)(_QWORD, id, id))v40)[2](v40, v16, v20);

}

- (void)_handleInfoResponse:(id)a3 forAppleID:(id)a4 infoRequest:(id)a5 certificateSerialNumber:(id)a6 withError:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  SDAppleIDServerTask *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  OS_dispatch_queue *dispatchQueue;
  id v28;
  OS_dispatch_queue *v29;
  id v30;
  SDAppleIDServerTask *infoRequest;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v34;
  uint64_t Int64Ranged;
  NSString *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  NSErrorDomain v41;
  uint64_t v42;
  NSErrorDomain v43;
  NSString *v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  const __CFString **v48;
  NSErrorUserInfoKey *v49;
  NSString *v50;
  uint64_t v51;
  const __CFString *v52;
  void *v53;
  NSString *v54;
  uint64_t v55;
  const __CFString *v56;
  NSString *v57;
  uint64_t v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  SDAppleIDServerTask *v62;
  _QWORD v63[5];
  id v64;
  id v65;
  id v66;
  id v67;
  NSErrorUserInfoKey v68;
  const __CFString *v69;
  NSErrorUserInfoKey v70;
  const __CFString *v71;
  NSErrorUserInfoKey v72;
  const __CFString *v73;
  NSErrorUserInfoKey v74;
  const __CFString *v75;
  NSErrorUserInfoKey v76;
  const __CFString *v77;

  v14 = a3;
  v15 = a4;
  v16 = (SDAppleIDServerTask *)a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v62 = v16;
  if (!v15)
  {
    v43 = NSOSStatusErrorDomain;
    v76 = NSLocalizedDescriptionKey;
    v44 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960591, 0, 0));
    v45 = objc_claimAutoreleasedReturnValue(v44);
    v46 = (void *)v45;
    v47 = CFSTR("?");
    if (v45)
      v47 = (const __CFString *)v45;
    v77 = v47;
    v48 = &v77;
    v49 = &v76;
    goto LABEL_46;
  }
  if (v18)
  {
    v30 = v18;
LABEL_47:
    v20 = 0;
    goto LABEL_35;
  }
  if (!v14)
  {
    v43 = NSOSStatusErrorDomain;
    v74 = NSLocalizedDescriptionKey;
    v50 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960591, 0, 0));
    v51 = objc_claimAutoreleasedReturnValue(v50);
    v46 = (void *)v51;
    v52 = CFSTR("?");
    if (v51)
      v52 = (const __CFString *)v51;
    v75 = v52;
    v48 = &v75;
    v49 = &v74;
LABEL_46:
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v49, 1));
    v30 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v43, -6705, v53));

    goto LABEL_47;
  }
  if (self->_infoRequest != v16)
  {
    if (dword_1007B3030 <= 60
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleInfoResponse:forAppleID:infoRequest:certificateSerialNumber:withError:completion:]", 60, "Outdated info request received, ignoring\n");
    }
    v20 = 0;
    v23 = 0;
    v30 = 0;
    goto LABEL_36;
  }
  if (!v17 || (objc_msgSend(v17, "isEqualToString:", &stru_10072FE60) & 1) != 0)
  {
    v20 = 0;
LABEL_8:
    v21 = 0;
    goto LABEL_9;
  }
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v14, CFSTR("CertificateSerialNumber"), TypeID, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v20 = v34;
  if (v34 && (objc_msgSend(v34, "isEqualToString:", v17) & 1) == 0)
  {
    if (dword_1007B3030 <= 60
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleInfoResponse:forAppleID:infoRequest:certificateSerialNumber:withError:completion:]", 60, "Response certSN %@ is different than the requested %@\n", v20, v17);
    }
    v72 = NSLocalizedDescriptionKey;
    v36 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(201207, 0, 0));
    v37 = objc_claimAutoreleasedReturnValue(v36);
    v38 = (void *)v37;
    v39 = CFSTR("?");
    if (v37)
      v39 = (const __CFString *)v37;
    v73 = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1));
    v41 = NSOSStatusErrorDomain;
    v42 = 201207;
    goto LABEL_34;
  }
  Int64Ranged = CFDictionaryGetInt64Ranged(v14, CFSTR("CertificateStatus"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  if (!(Int64Ranged << 32))
  {
    if (dword_1007B3030 <= 60
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleInfoResponse:forAppleID:infoRequest:certificateSerialNumber:withError:completion:]", 60, "No certificate status returned by server\n");
    }
    goto LABEL_8;
  }
  v21 = (int)Int64Ranged;
LABEL_9:
  -[SDAppleIDAgent _handleCertificateStatusUpdate:forAppleID:](self, "_handleCertificateStatusUpdate:forAppleID:", v21, v15);
  v22 = objc_msgSend(objc_alloc((Class)SFAppleIDContactInfo), "initWithDictionary:", v14);
  if (!v22)
  {
    v70 = NSLocalizedDescriptionKey;
    v54 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960534, 0, 0));
    v55 = objc_claimAutoreleasedReturnValue(v54);
    v38 = (void *)v55;
    v56 = CFSTR("?");
    if (v55)
      v56 = (const __CFString *)v55;
    v71 = v56;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1));
    v41 = NSOSStatusErrorDomain;
    v42 = -6762;
LABEL_34:
    v30 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v41, v42, v40));

LABEL_35:
    v23 = 0;
    goto LABEL_36;
  }
  v23 = v22;
  v24 = objc_msgSend(objc_alloc((Class)SFAppleIDValidationRecord), "initWithDictionary:", v14);
  if (v24)
  {
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "data"));
    dispatchQueue = self->_dispatchQueue;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_100189FD0;
    v63[3] = &unk_100719540;
    v63[4] = self;
    v64 = v15;
    v28 = v25;
    v65 = v28;
    v23 = v23;
    v66 = v23;
    v67 = v19;
    v29 = dispatchQueue;
    v18 = 0;
    SFAppleIDParseValidationRecordData(v26, v29, v63);

    v30 = 0;
    goto LABEL_12;
  }
  v68 = NSLocalizedDescriptionKey;
  v57 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960534, 0, 0));
  v58 = objc_claimAutoreleasedReturnValue(v57);
  v61 = (void *)v58;
  v59 = CFSTR("?");
  if (v58)
    v59 = (const __CFString *)v58;
  v69 = v59;
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1));
  v30 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6762, v60));

LABEL_36:
  v28 = 0;
LABEL_12:
  -[SDAppleIDServerTask invalidate](self->_infoRequest, "invalidate");
  infoRequest = self->_infoRequest;
  self->_infoRequest = 0;

  if (v30)
  {
    if (dword_1007B3030 <= 90
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 90)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleInfoResponse:forAppleID:infoRequest:certificateSerialNumber:withError:completion:]", 90, "### Info request failed with error %@\n", v30);
    }
    if (v19)
      (*((void (**)(id, id))v19 + 2))(v19, v30);
  }

}

- (void)_handleKeyBagFirstUnlockNotification
{
  if (dword_1007B3030 <= 30 && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleKeyBagFirstUnlockNotification]", 30, "Key Bag First Unlock notification\n");
  -[SDAppleIDAgent _handleUILockStatusChange](self, "_handleUILockStatusChange");
}

- (void)_handleKeyVerificationFailure
{
  if (dword_1007B3030 <= 30 && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleKeyVerificationFailure]", 30, "Handling key verification failure\n");
  -[SDAppleIDAgent _setCurrentAppleIDIdentity:](self, "_setCurrentAppleIDIdentity:", 0);
  -[SDAppleIDAgent _setCurrentAppleIDContactInfo:validationRecord:](self, "_setCurrentAppleIDContactInfo:validationRecord:", 0, 0);
  -[SDAppleIDAgent _verifyStateWithDelay:](self, "_verifyStateWithDelay:", 30.0);
}

- (void)_handleServerTaskCompletionWithError:(id)a3
{
  void *v4;
  id v5;
  int v6;
  void *v7;
  uint64_t Int64;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[SDAppleIDDatabaseManager setLastConnectionDate:](self->_dbManager, "setLastConnectionDate:", v4);
  v5 = v9;
  if (v9)
  {
    if (dword_1007B3030 <= 60)
    {
      if (dword_1007B3030 != -1 || (v6 = _LogCategory_Initialize(&dword_1007B3030, 60), v5 = v9, v6))
      {
        LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleServerTaskCompletionWithError:]", 60, "### Server task failed with error %@\n", v5);
        v5 = v9;
      }
    }
    if (NSErrorToOSStatus(v5) != -6723
      && NSErrorToOSStatus(v9) != 201224
      && NSErrorToOSStatus(v9) != 201225
      && NSErrorToOSStatus(v9) != 201226
      && NSErrorToOSStatus(v9) != 201229)
    {
      if (NSErrorToOSStatus(v9) == 201215)
        sub_100208994(self->_appleID);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
      Int64 = CFDictionaryGetInt64(v7, SFAppleIDErrorUserInfoRetryDelaySecondsKey, 0);

      -[SDAppleIDAgent _ensureThrottledRetryTimerStartedWithSuggestedDelay:](self, "_ensureThrottledRetryTimerStartedWithSuggestedDelay:", Int64);
    }
  }
  else
  {
    -[SDAppleIDDatabaseManager setLastSuccessfulConnectionDate:](self->_dbManager, "setLastSuccessfulConnectionDate:", v4);
    sub_10016A6E8();
    -[SDAppleIDAgent _verifyState](self, "_verifyState");
  }

}

- (void)_handleUILockStatusChangedNotification
{
  if (dword_1007B3030 <= 30 && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleUILockStatusChangedNotification]", 30, "UI Lock Status Change notification\n");
  -[SDAppleIDAgent _handleUILockStatusChange](self, "_handleUILockStatusChange");
}

- (void)_handleUILockStatusChange
{
  void *v3;
  unsigned int v4;
  const char *v5;

  if (self->_agentEnabled)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v4 = objc_msgSend(v3, "deviceWasUnlockedOnce");

    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      v5 = "no";
      if (v4)
        v5 = "yes";
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleUILockStatusChange]", 30, "Handling UI Lock status change. Device was unlocked once: %s\n", v5);
    }
    if (v4)
    {
      if (self->_throttledRetryTimer)
      {
        if (dword_1007B3030 <= 30
          && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
        {
          LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleUILockStatusChange]", 30, "Throttled retry already scheduled\n");
        }
      }
      else
      {
        -[SDAppleIDAgent _verifyState](self, "_verifyState");
      }
    }
  }
}

- (void)_handleUntrustedAppleIDCertificateChainForIdentity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager accountForAppleID:](self->_dbManager, "accountForAppleID:", self->_appleID));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identity"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identity"));
      v8 = objc_msgSend(v7, "isEqual:", v9);

      if (v8)
      {
        -[SDAppleIDAgent _setCurrentAppleIDIdentity:](self, "_setCurrentAppleIDIdentity:", 0);
        -[SDAppleIDAgent _verifyState](self, "_verifyState");
      }
    }
    else if (dword_1007B3030 <= 30
           && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleUntrustedAppleIDCertificateChainForIdentity:]", 30, "No identity for %{mask}\n", self->_appleID);
    }
  }
  else if (dword_1007B3030 <= 30
         && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
  {
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleUntrustedAppleIDCertificateChainForIdentity:]", 30, "Unable to get account for %{mask}\n", self->_appleID);
  }

}

- (void)_handleReceivedCertificateToken:(id)a3 privateKeyPersistentReference:(id)a4 forAppleID:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8 && v10 && v9)
  {
    -[SDAppleIDDatabaseManager setCertificateToken:privateKeyPersistentReference:forAppleID:](self->_dbManager, "setCertificateToken:privateKeyPersistentReference:forAppleID:", v10, v8, v9);
    sub_10016A6E8();
  }

}

- (void)_handleReceivedIdentity:(id)a3 forAppleID:(id)a4 identityRequest:(id)a5 withError:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  SDAppleIDIdentityRequest *v14;
  id v15;
  void (**v16)(id, id);
  id v17;
  SDAppleIDIdentityRequest *identityRequest;
  NSString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  NSErrorDomain v24;
  uint64_t v25;
  NSString *v26;
  uint64_t v27;
  const __CFString *v28;
  NSErrorUserInfoKey v29;
  const __CFString *v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;

  v12 = a3;
  v13 = a4;
  v14 = (SDAppleIDIdentityRequest *)a5;
  v15 = a6;
  v16 = (void (**)(id, id))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v15)
  {
    v17 = v15;
    goto LABEL_7;
  }
  if (!v12)
  {
    v31 = NSLocalizedDescriptionKey;
    v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960591, 0, 0));
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)v20;
    v22 = CFSTR("?");
    if (v20)
      v22 = (const __CFString *)v20;
    v32 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v24 = NSOSStatusErrorDomain;
    v25 = -6705;
    goto LABEL_17;
  }
  if ((objc_msgSend(v13, "isEqualToString:", self->_appleID) & 1) == 0)
  {
    v29 = NSLocalizedDescriptionKey;
    v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960587, 0, 0));
    v27 = objc_claimAutoreleasedReturnValue(v26);
    v21 = (void *)v27;
    v28 = CFSTR("?");
    if (v27)
      v28 = (const __CFString *)v27;
    v30 = v28;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v24 = NSOSStatusErrorDomain;
    v25 = -6709;
LABEL_17:
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v24, v25, v23));

    goto LABEL_7;
  }
  if (self->_identityRequest == v14)
  {
    -[SDAppleIDDatabaseManager setCertificateToken:privateKeyPersistentReference:forAppleID:](self->_dbManager, "setCertificateToken:privateKeyPersistentReference:forAppleID:", 0, 0, v13);
    -[SDAppleIDAgent _setCurrentAppleIDIdentity:](self, "_setCurrentAppleIDIdentity:", v12);
  }
  else if (dword_1007B3030 <= 60
         && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
  {
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleReceivedIdentity:forAppleID:identityRequest:withError:completion:]", 60, "Outdated identity request received, ignoring\n");
  }
  v17 = 0;
LABEL_7:
  -[SDAppleIDIdentityRequest invalidate](self->_identityRequest, "invalidate");
  identityRequest = self->_identityRequest;
  self->_identityRequest = 0;

  if (v16)
    v16[2](v16, v17);

}

- (void)_handlePeriodicVerifyTimerFired
{
  if (dword_1007B3030 <= 30 && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handlePeriodicVerifyTimerFired]", 30, "Periodic verify timer fired\n");
  if (self->_throttledRetryTimer)
  {
    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handlePeriodicVerifyTimerFired]", 30, "Throttled retry scheduled, ignoring periodic verify\n");
    }
  }
  else
  {
    -[SDAppleIDAgent _verifyState](self, "_verifyState");
  }
}

- (void)_handleThrottledRetryTimerFired
{
  if (dword_1007B3030 <= 30 && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _handleThrottledRetryTimerFired]", 30, "Throttled retry timer fired\n");
  -[SDAppleIDAgent _ensureThrottledRetryTimerStopped](self, "_ensureThrottledRetryTimerStopped");
  -[SDAppleIDAgent _verifyState](self, "_verifyState");
}

- (unint64_t)_keychainCleanupTag
{
  return CFGetInt64(-[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", CFSTR("KeychainCleanupTag")), 0);
}

- (id)_metaInfoValueForKey:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_agentMetaInfo, "objectForKeyedSubscript:", a3);
}

- (int)_performKeyVerificationForIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSNumber *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  double v19;
  _QWORD v20[3];
  _QWORD v21[3];

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", CFSTR("LastKeyVerificationDate")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v7 = v6;
    if (v5 && (objc_msgSend(v6, "timeIntervalSinceDate:", v5), v8 <= 86400.0))
    {
      if (dword_1007B3030 <= 30)
      {
        if (dword_1007B3030 != -1 || (v19 = v8, v18 = _LogCategory_Initialize(&dword_1007B3030, 30), v8 = v19, v18))
          LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _performKeyVerificationForIdentity:]", 30, "Skipping key verification. Last one peformed %g seconds ago.\n", v8);
      }
      LODWORD(v10) = 0;
    }
    else
    {
      v9 = mach_absolute_time();
      v10 = objc_msgSend(v4, "verifyKeys");
      v11 = mach_absolute_time();
      if ((_DWORD)v10)
      {
        if (dword_1007B3030 <= 30
          && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
        {
          LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _performKeyVerificationForIdentity:]", 30, "Verify keys failed with err=%#m\n", v10);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "altDSID"));
        SFMetricsLogUnexpectedEvent(2, (int)v10, v12);

      }
      v21[0] = &off_10074B9D0;
      v20[0] = CFSTR("operation");
      v20[1] = CFSTR("durationMs");
      v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", UpTicksToMilliseconds(v11 - v9));
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v21[1] = v14;
      v20[2] = CFSTR("success");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (_DWORD)v10 == 0));
      v21[2] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 3));
      SFMetricsLog(CFSTR("com.apple.sharing.OperationDuration"), v16);

      -[SDAppleIDAgent _setMetaInfoValue:forKey:](self, "_setMetaInfoValue:forKey:", v7, CFSTR("LastKeyVerificationDate"));
    }
  }
  else
  {
    if (dword_1007B3030 <= 60
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _performKeyVerificationForIdentity:]", 60, "### No identity\n");
    }
    LODWORD(v10) = 0;
    v5 = 0;
    v7 = 0;
  }

  return (int)v10;
}

- (int)_performKeychainCount
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSNumber *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  _QWORD v22[4];

  v19 = 0;
  v20 = 0;
  v18 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", CFSTR("LastKeychainCountDate")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    if (v6 <= 259200.0)
    {
LABEL_14:
      LODWORD(v8) = 0;
      goto LABEL_15;
    }
  }
  v7 = mach_absolute_time();
  v8 = SFAppleIDCertificateAndKeyCounts(&v20, &v19, &v18);
  v9 = mach_absolute_time();
  if (!(_DWORD)v8)
  {
    v10 = v9;
    v21[0] = CFSTR("certCount");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v20));
    v22[0] = v11;
    v21[1] = CFSTR("privKeyCount");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v19));
    v22[1] = v12;
    v21[2] = CFSTR("pubKeyCount");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v18));
    v22[2] = v13;
    v21[3] = CFSTR("latencyMs");
    v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", UpTicksToMilliseconds(v10 - v7));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v22[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 4));
    SFMetricsLog(CFSTR("com.apple.sharing.AIAKeychainCount"), v16);

    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _performKeychainCount]", 30, "Certs: %d, private keys: %d, public keys: %d\n", v20, v19, v18);
    }
    -[SDAppleIDAgent _setMetaInfoValue:forKey:](self, "_setMetaInfoValue:forKey:", v5, CFSTR("LastKeychainCountDate"));
    goto LABEL_14;
  }
  if (dword_1007B3030 <= 60 && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _performKeychainCount]", 60, "### SDAppleIDCertificateAndKeyCounts failed with err=%#m.\n", v8);
LABEL_15:

  return v8;
}

- (void)_performOtherTaskWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SDAppleIDIdentityRequest *testIdentityRequest;
  SDAppleIDIdentityRequest **p_testIdentityRequest;
  SDAppleIDIdentityRequest *v12;
  SDAppleIDIdentityRequest *v13;
  SDAppleIDIdentityRequest *v14;
  void *v15;
  void *v16;
  NSObject *dispatchQueue;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  int v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD block[5];
  id v37;
  _QWORD v38[5];
  id v39;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestType")));
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("createAndFetchCert")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("triggerPush")))
    {
      if (dword_1007B3030 <= 30
        && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
      {
        LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _performOtherTaskWithInfo:completion:]", 30, "Trigger push\n");
      }
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10018B948;
      block[3] = &unk_100714F40;
      block[4] = self;
      v37 = v7;
      dispatch_async(dispatchQueue, block);
      v18 = v37;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("triggerVerify")))
    {
      if (dword_1007B3030 <= 30
        && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
      {
        LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _performOtherTaskWithInfo:completion:]", 30, "Trigger verify\n");
      }
      -[SDAppleIDAgent _handlePeriodicVerifyTimerFired](self, "_handlePeriodicVerifyTimerFired");
      if (!v7)
        goto LABEL_35;
      v19 = self->_dispatchQueue;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10018B998;
      v34[3] = &unk_100717180;
      v35 = v7;
      dispatch_async(v19, v34);
      v18 = v35;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("removeAppleID")))
      {
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("setMetaInfo")))
        {
          if (dword_1007B3030 <= 30
            && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
          {
            LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _performOtherTaskWithInfo:completion:]", 30, "Set Meta Info Request\n");
          }
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("key")));
          if (v21)
          {
            v16 = (void *)v21;
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value")));
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            v23 = objc_msgSend(v15, "isEqual:", v22);

            if (v23)
            {

              v15 = 0;
            }
            -[SDAppleIDAgent _setMetaInfoValue:forKey:](self, "_setMetaInfoValue:forKey:", v15, v16);
            if (v7)
            {
              v24 = self->_dispatchQueue;
              v30[0] = _NSConcreteStackBlock;
              v30[1] = 3221225472;
              v30[2] = sub_10018B9C8;
              v30[3] = &unk_100717180;
              v31 = v7;
              dispatch_async(v24, v30);

            }
            goto LABEL_36;
          }
        }
        else if (dword_1007B3030 <= 90
               && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 90)))
        {
          LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _performOtherTaskWithInfo:completion:]", 90, "### Unsupported request type %@\n", v8);
        }
        v9 = 0;
LABEL_46:
        v25 = -6705;
        if (!v7)
        {
LABEL_48:
          v15 = 0;
          v16 = 0;
          v14 = 0;
          goto LABEL_37;
        }
LABEL_47:
        v26 = self->_dispatchQueue;
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_10018B9E0;
        v27[3] = &unk_100716EA8;
        v28 = v7;
        v29 = v25;
        dispatch_async(v26, v27);

        goto LABEL_48;
      }
      if (dword_1007B3030 <= 30
        && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
      {
        LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _performOtherTaskWithInfo:completion:]", 30, "Remove Apple ID Request\n");
      }
      -[SDAppleIDAgent _clearAccount](self, "_clearAccount");
      if (!v7)
      {
LABEL_35:
        v15 = 0;
        v16 = 0;
LABEL_36:
        v14 = 0;
        v9 = 0;
        goto LABEL_37;
      }
      v20 = self->_dispatchQueue;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10018B9B0;
      v32[3] = &unk_100717180;
      v33 = v7;
      dispatch_async(v20, v32);
      v18 = v33;
    }

    goto LABEL_35;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appleID")));
  if (!v9)
    goto LABEL_46;
  p_testIdentityRequest = &self->_testIdentityRequest;
  testIdentityRequest = self->_testIdentityRequest;
  if (testIdentityRequest)
  {
    -[SDAppleIDIdentityRequest invalidate](testIdentityRequest, "invalidate");
    v12 = *p_testIdentityRequest;
    *p_testIdentityRequest = 0;

  }
  v13 = -[SDAppleIDIdentityRequest initWithAppleID:]([SDAppleIDIdentityRequest alloc], "initWithAppleID:", v9);
  if (!v13)
  {
    v25 = -6728;
    if (!v7)
      goto LABEL_48;
    goto LABEL_47;
  }
  v14 = v13;
  -[SDAppleIDIdentityRequest setDispatchQueue:](v13, "setDispatchQueue:", self->_dispatchQueue);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10018B8C4;
  v38[3] = &unk_100719568;
  v38[4] = self;
  v39 = v7;
  -[SDAppleIDIdentityRequest setResponseHandler:](v14, "setResponseHandler:", v38);
  objc_storeStrong((id *)&self->_testIdentityRequest, v14);
  -[SDAppleIDIdentityRequest activate](self->_testIdentityRequest, "activate");

  v15 = 0;
  v16 = 0;
LABEL_37:

}

- (void)_performServerTaskWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  NSString *v7;
  dispatch_semaphore_t v8;
  dispatch_semaphore_t v9;
  dispatch_queue_global_t global_queue;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  uint64_t *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  const __CFString *v24;
  int v25;
  id v26;
  uint64_t v27;
  int v28;
  id v29;
  SDAppleIDServerTask *task;
  SDAppleIDServerTask *v31;
  SDAppleIDServerTask *v32;
  SDAppleIDServerTask *v33;
  NSObject *dispatchQueue;
  int v35;
  id v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD block[4];
  id v47;
  uint64_t *v48;
  _QWORD v49[5];
  id v50;
  uint64_t v51;
  id v52;
  id v53[2];
  _QWORD v54[4];
  NSObject *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  int v70;
  _QWORD v71[2];
  _QWORD v72[2];
  const __CFString *v73;
  uint64_t v74;
  const __CFString *v75;
  id v76;

  v6 = a3;
  v45 = a4;
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v43 = v6;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestType")));
  if (objc_msgSend(v44, "isEqualToString:", CFSTR("createCert")))
  {
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appleID")));
    if (v7)
    {
      v8 = dispatch_semaphore_create(0);
      if (v8)
      {
        v9 = v8;
        global_queue = dispatch_get_global_queue(0, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472;
        v54[2] = sub_10018C448;
        v54[3] = &unk_100719590;
        v56 = &v67;
        v57 = &v63;
        v58 = &v59;
        v12 = v9;
        v55 = v12;
        SFAppleIDCreateKeyPair(v7, v11, v54);

        v13 = dispatch_time(0, 15000000000);
        if (dispatch_semaphore_wait(v12, v13))
        {
          if (dword_1007B3030 <= 50
            && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 50)))
          {
            LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _performServerTaskWithInfo:completion:]", 50, "CreateCSIdentity semaphore timed out\n");
          }
          goto LABEL_6;
        }
        v14 = v68;
        if (*((_DWORD *)v68 + 6))
        {
LABEL_6:
          v40 = 0;
          v41 = 0;
          v38 = 0;
          v39 = 0;
          v15 = 0;
          v16 = 0;
          v42 = 0;
          v17 = 0;
LABEL_24:
          v21 = 0;
          v19 = 0;
          goto LABEL_36;
        }
        if (v60[3] && v64[3])
        {
          v53[1] = 0;
          v25 = SFAppleIDCreateCertificateRequestPEMStringForKeyPair(v7);
          v26 = 0;
          v17 = v26;
          v14 = v68;
          *((_DWORD *)v68 + 6) = v25;
          if (v25)
          {
            v40 = 0;
            v41 = 0;
            v38 = 0;
            v39 = 0;
            v15 = 0;
            v16 = 0;
            v42 = 0;
            goto LABEL_24;
          }
          if (v26)
          {
            v75 = CFSTR("csr");
            v76 = v26;
            v15 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1));
            v40 = 0;
            v41 = 0;
            v38 = 0;
            v39 = 0;
            v20 = 0;
            v16 = 0;
            v42 = 0;
            v21 = 0;
LABEL_32:
            v19 = 0;
            goto LABEL_33;
          }
          v40 = 0;
          v41 = 0;
          v38 = 0;
          v39 = 0;
          v15 = 0;
          v16 = 0;
          v42 = 0;
        }
        else
        {
          v40 = 0;
          v41 = 0;
          v38 = 0;
          v39 = 0;
          v15 = 0;
          v16 = 0;
          v42 = 0;
          v17 = 0;
        }
        v21 = 0;
        v19 = 0;
        goto LABEL_64;
      }
      v40 = 0;
      v41 = 0;
      v38 = 0;
      v39 = 0;
      v15 = 0;
      v12 = 0;
      v16 = 0;
      v42 = 0;
      v17 = 0;
      v21 = 0;
      v19 = 0;
      v14 = v68;
      v37 = -6728;
LABEL_53:
      *((_DWORD *)v14 + 6) = v37;
      goto LABEL_36;
    }
    goto LABEL_57;
  }
  if (!objc_msgSend(v44, "isEqualToString:", CFSTR("fetchCert")))
  {
    if (objc_msgSend(v44, "isEqualToString:", CFSTR("getMyInfo")))
    {
      v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appleID")));
      if (v7)
      {
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("certificateSN")));
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("vrid")));
        v16 = (void *)v22;
        if (v21)
          v23 = v21;
        else
          v23 = &stru_10072FE60;
        v71[0] = CFSTR("serialNumber");
        v71[1] = CFSTR("clientAidvrId");
        if (v22)
          v24 = (const __CFString *)v22;
        else
          v24 = &stru_10072FE60;
        v72[0] = v23;
        v72[1] = v24;
        v20 = 2;
        v15 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v72, v71, 2));
        v40 = 0;
        v41 = 0;
        v38 = 0;
        v39 = 0;
        v12 = 0;
        v42 = 0;
        v17 = 0;
        goto LABEL_32;
      }
      goto LABEL_57;
    }
    if (objc_msgSend(v44, "isEqualToString:", CFSTR("findPerson")))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("emails")));
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("phones")));
      v41 = (void *)v27;
      if (__PAIR128__((unint64_t)v42, v27) != 0)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        if (v42)
        {
          v53[0] = 0;
          v28 = sub_10020A010(v42, 0, v53);
          v29 = v53[0];
          v14 = v68;
          *((_DWORD *)v68 + 6) = v28;
          v39 = v29;
          if (v28)
          {
            v38 = 0;
LABEL_48:
            v15 = 0;
            v12 = 0;
            v16 = 0;
            v17 = 0;
            v21 = 0;
            v19 = 0;
            v7 = 0;
            goto LABEL_36;
          }
          if (!v29)
          {
            v38 = 0;
            v39 = 0;
            goto LABEL_71;
          }
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v29, CFSTR("emails"));
        }
        else
        {
          v39 = 0;
        }
        if (!v41)
        {
          v38 = 0;
LABEL_56:
          v7 = self->_appleID;
          v15 = v40;
          v12 = 0;
          v16 = 0;
          v17 = 0;
          v21 = 0;
          v19 = 0;
          v20 = 3;
          v40 = v15;
          goto LABEL_33;
        }
        v52 = 0;
        v35 = sub_10020A010(v41, 0, &v52);
        v36 = v52;
        v14 = v68;
        *((_DWORD *)v68 + 6) = v35;
        v38 = v36;
        if (v35)
          goto LABEL_48;
        if (v36)
        {
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v36, CFSTR("phones"));
          goto LABEL_56;
        }
        v38 = 0;
LABEL_71:
        v15 = 0;
        v12 = 0;
        v16 = 0;
        v17 = 0;
        v21 = 0;
        v19 = 0;
        v7 = 0;
LABEL_64:
        v37 = -6762;
        goto LABEL_53;
      }
    }
    else if (dword_1007B3030 <= 90
           && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 90)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _performServerTaskWithInfo:completion:]", 90, "### Unsupported request type %@\n", v44);
    }
    v40 = 0;
    v41 = 0;
    v38 = 0;
    v39 = 0;
    v15 = 0;
    v12 = 0;
    v16 = 0;
    v42 = 0;
    v17 = 0;
    v21 = 0;
    v19 = 0;
    v7 = 0;
LABEL_52:
    v14 = v68;
    v37 = -6705;
    goto LABEL_53;
  }
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appleID")));
  if (!v7)
  {
LABEL_57:
    v40 = 0;
    v41 = 0;
    v38 = 0;
    v39 = 0;
    v15 = 0;
    v12 = 0;
    v16 = 0;
    v42 = 0;
    v17 = 0;
    v21 = 0;
    v19 = 0;
    goto LABEL_52;
  }
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("certificateToken")));
  v19 = (void *)v18;
  if (!v18)
  {
    v40 = 0;
    v41 = 0;
    v38 = 0;
    v39 = 0;
    v15 = 0;
    v12 = 0;
    v16 = 0;
    v42 = 0;
    v17 = 0;
    v21 = 0;
    goto LABEL_52;
  }
  v73 = CFSTR("certificateToken");
  v74 = v18;
  v20 = 1;
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1));
  v40 = 0;
  v41 = 0;
  v38 = 0;
  v39 = 0;
  v12 = 0;
  v16 = 0;
  v42 = 0;
  v17 = 0;
  v21 = 0;
LABEL_33:
  task = self->_task;
  if (task)
  {
    -[SDAppleIDServerTask invalidate](task, "invalidate");
    v31 = self->_task;
    self->_task = 0;

  }
  v32 = -[SDAppleIDServerTask initWithType:appleID:info:]([SDAppleIDServerTask alloc], "initWithType:appleID:info:", v20, v7, v15);
  v33 = self->_task;
  self->_task = v32;

  -[SDAppleIDServerTask setDispatchQueue:](self->_task, "setDispatchQueue:", self->_dispatchQueue);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10018C474;
  v49[3] = &unk_1007195B8;
  v49[4] = self;
  v51 = v20;
  v50 = v45;
  -[SDAppleIDServerTask setResponseHandler:](self->_task, "setResponseHandler:", v49);

  -[SDAppleIDServerTask activate](self->_task, "activate");
  *((_DWORD *)v68 + 6) = 0;
LABEL_36:
  if (v45 && *((_DWORD *)v68 + 6))
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10018C524;
    block[3] = &unk_100716E80;
    v47 = v45;
    v48 = &v67;
    dispatch_async(dispatchQueue, block);

  }
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(&v67, 8);
}

- (void)_personInfoWithEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  OS_dispatch_queue *v12;
  uint64_t v13;
  void *v14;
  id v15;
  SDAppleIDServerTask *v16;
  __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  unsigned int v22;
  __CFString *v23;
  SDAppleIDServerTask *v24;
  SDAppleIDServerTask *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  int v29;
  _QWORD v30[5];
  SDAppleIDServerTask *v31;
  id v32;
  OS_dispatch_queue *v33;
  id v34;
  id v35;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    v12 = self->_dispatchQueue;
    if (v12)
    {
      if (v9)
        goto LABEL_6;
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDAppleIDAgent.m"), 1784, CFSTR("inQueue and _dispatchQueue both nil."));

      v12 = 0;
      if (v9)
        goto LABEL_6;
    }
LABEL_23:
    v19 = 0;
    if (!v11)
    {
      v16 = 0;
      v17 = 0;
      v18 = 0;
      goto LABEL_20;
    }
    v21 = -6705;
    v17 = 0;
    v18 = 0;
LABEL_12:
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10018CB08;
    v27[3] = &unk_100716EA8;
    v28 = v11;
    v29 = v21;
    dispatch_async((dispatch_queue_t)v12, v27);

    v15 = 0;
    v16 = 0;
    goto LABEL_19;
  }
  v12 = (OS_dispatch_queue *)v10;
  if (!v9)
    goto LABEL_23;
LABEL_6:
  if (!v11)
  {
    v19 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    goto LABEL_20;
  }
  v13 = objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager cachedPersonInfoWithEmailOrPhone:](self->_dbManager, "cachedPersonInfoWithEmailOrPhone:", v9));
  if (!v13)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    if (v19)
    {
      v39 = v9;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
      v35 = 0;
      v21 = sub_10020A010(v20, 0, &v35);
      v18 = v35;

      if (v21)
      {
        v17 = 0;
      }
      else
      {
        if (v18 && objc_msgSend(v18, "count") == (id)1)
        {
          v22 = objc_msgSend(v9, "containsString:", CFSTR("@"));
          v23 = CFSTR("phones");
          if (v22)
            v23 = CFSTR("emails");
          v17 = v23;
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v17);
          v24 = -[SDAppleIDServerTask initWithType:appleID:info:]([SDAppleIDServerTask alloc], "initWithType:appleID:info:", 3, self->_appleID, v19);
          if (v24)
          {
            v25 = v24;
            -[SDAppleIDServerTask setDispatchQueue:](v24, "setDispatchQueue:", v12);
            v30[0] = _NSConcreteStackBlock;
            v30[1] = 3221225472;
            v30[2] = sub_10018CA78;
            v30[3] = &unk_1007195E0;
            v30[4] = self;
            v16 = v25;
            v31 = v16;
            v32 = v9;
            v33 = v12;
            v34 = v11;
            -[SDAppleIDServerTask setResponseHandler:](v16, "setResponseHandler:", v30);

            -[NSMutableArray addObject:](self->_findPersonRequests, "addObject:", v16);
            -[SDAppleIDServerTask activate](v16, "activate");
            v15 = 0;
            goto LABEL_19;
          }
        }
        else
        {
          v17 = 0;
        }
        v21 = -6762;
      }
    }
    else
    {
      v17 = 0;
      v18 = 0;
      v21 = -6728;
    }
    goto LABEL_12;
  }
  v14 = (void *)v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018CA64;
  block[3] = &unk_1007159D0;
  v38 = v11;
  v15 = v14;
  v37 = v15;
  dispatch_async((dispatch_queue_t)v12, block);

  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = v38;
LABEL_19:

  v19 = v15;
LABEL_20:

}

- (void)_prefsChanged
{
  uint64_t Int64;
  BOOL v4;
  _BOOL4 v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  BOOL v9;
  _BOOL4 v10;
  const char *v11;
  const char *v12;
  CFTypeID TypeID;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  int v17;

  v17 = 0;
  if (-[SDAppleIDAgent eduModeEnabled](self, "eduModeEnabled"))
  {
    if (dword_1007B3030 <= 40
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 40)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _prefsChanged]", 40, "Device is in edu mode, agent disabled \n");
    }
    v5 = 0;
  }
  else
  {
    Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("aiaEnabled"), &v17);
    if (v17)
      v4 = 0;
    else
      v4 = Int64 == 0;
    v5 = !v4;
  }
  if (self->_agentEnabled != v5)
  {
    if (dword_1007B3030 <= 40
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 40)))
    {
      v6 = "yes";
      if (v5)
        v7 = "no";
      else
        v7 = "yes";
      if (!v5)
        v6 = "no";
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _prefsChanged]", 40, "Agent Enabled: %s -> %s\n", v7, v6);
    }
    self->_agentEnabled = v5;
    *(_WORD *)&self->_updatePush = 257;
  }
  v8 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("aiaLinkIdentityEnabled"), &v17);
  if (v17)
    v9 = 0;
  else
    v9 = v8 == 0;
  v10 = !v9;
  if (self->_linkIdentityEnabled != v10)
  {
    if (dword_1007B3030 <= 40
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 40)))
    {
      v11 = "yes";
      if (v10)
        v12 = "no";
      else
        v12 = "yes";
      if (!v10)
        v11 = "no";
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _prefsChanged]", 40, "Agent Link Identity Enabled: %s -> %s\n", v12, v11);
    }
    self->_linkIdentityEnabled = v10;
    self->_updatePeriodicVerifyTimer = 1;
  }
  TypeID = CFStringGetTypeID();
  v14 = (__CFString *)CFPrefs_CopyTypedValue(CFSTR("com.apple.Sharing"), CFSTR("aiaPushEnvironment"), TypeID, &v17);
  v15 = v14;
  if (v17)
  {

    v15 = CFSTR("production");
  }
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString lowercaseString](v15, "lowercaseString"));

  if ((-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("production")) & 1) == 0
    && (-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("development")) & 1) == 0)
  {

    v16 = CFSTR("production");
  }
  if ((-[__CFString isEqualToString:](v16, "isEqualToString:", self->_pushEnvironment) & 1) == 0)
  {
    if (dword_1007B3030 <= 40
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 40)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _prefsChanged]", 40, "Agent Push Environment: %@ -> %@\n", self->_pushEnvironment, v16);
    }
    objc_storeStrong((id *)&self->_pushEnvironment, v16);
    self->_updatePush = 1;
  }
  -[SDAppleIDAgent _update](self, "_update");

}

- (void)_removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_requestInfoForAppleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  SDAppleIDServerTask *v17;
  SDAppleIDServerTask *v18;
  SDAppleIDServerTask *infoRequest;
  SDAppleIDServerTask *v20;
  id v21;
  NSErrorDomain v22;
  uint64_t v23;
  NSString *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  NSObject *dispatchQueue;
  _QWORD block[4];
  id v31;
  SDAppleIDServerTask *v32;
  _QWORD v33[5];
  id v34;
  SDAppleIDServerTask *v35;
  __CFString *v36;
  id v37;
  NSErrorUserInfoKey v38;
  const __CFString *v39;
  _QWORD v40[2];
  _QWORD v41[2];

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v22 = NSOSStatusErrorDomain;
    v23 = -6705;
LABEL_29:
    v21 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v22, v23, 0));
    v9 = 0;
    v11 = 0;
    v16 = 0;
    v13 = 0;
    goto LABEL_30;
  }
  if (self->_infoRequest)
  {
    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _requestInfoForAppleID:completion:]", 30, "Info request already in progress\n");
    }
    v22 = NSOSStatusErrorDomain;
    v23 = 201225;
    goto LABEL_29;
  }
  if (dword_1007B3030 <= 30 && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _requestInfoForAppleID:completion:]", 30, "Request info for %{mask}\n", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager accountForAppleID:](self->_dbManager, "accountForAppleID:", v6));
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identity"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serialNumber"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "validationRecord"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));

  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  if (v11)
    v14 = v11;
  else
    v14 = &stru_10072FE60;
  v40[0] = CFSTR("serialNumber");
  v40[1] = CFSTR("clientAidvrId");
  if (v13)
    v15 = v13;
  else
    v15 = &stru_10072FE60;
  v41[0] = v14;
  v41[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2));
  v17 = -[SDAppleIDServerTask initWithType:appleID:info:]([SDAppleIDServerTask alloc], "initWithType:appleID:info:", 2, v6, v16);
  -[SDAppleIDServerTask setDispatchQueue:](v17, "setDispatchQueue:", self->_dispatchQueue);
  if (v17)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10018D3E8;
    v33[3] = &unk_1007195E0;
    v33[4] = self;
    v34 = v6;
    v18 = v17;
    v35 = v18;
    v11 = v11;
    v36 = v11;
    v37 = v7;
    -[SDAppleIDServerTask setResponseHandler:](v18, "setResponseHandler:", v33);

    infoRequest = self->_infoRequest;
    self->_infoRequest = v18;
    v20 = v18;

    -[SDAppleIDServerTask activate](self->_infoRequest, "activate");
    v21 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v38 = NSLocalizedDescriptionKey;
  v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960534, 0, 0));
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)v25;
  v27 = CFSTR("?");
  if (v25)
    v27 = (const __CFString *)v25;
  v39 = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6762, v28));

LABEL_30:
  if (v7 && v21)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10018D478;
    block[3] = &unk_1007159D0;
    v32 = (SDAppleIDServerTask *)v7;
    v21 = v21;
    v31 = v21;
    dispatch_async(dispatchQueue, block);

    v20 = v32;
    goto LABEL_18;
  }
LABEL_19:

}

- (void)_requestIdentityForAppleID:(id)a3 certificateToken:(id)a4 privateKeyPersistentReference:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  SDAppleIDIdentityRequest *v15;
  SDAppleIDIdentityRequest *v16;
  SDAppleIDIdentityRequest *v17;
  SDAppleIDIdentityRequest *identityRequest;
  SDAppleIDIdentityRequest *v19;
  id v20;
  NSString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  NSErrorDomain v26;
  uint64_t v27;
  NSString *v28;
  uint64_t v29;
  const __CFString *v30;
  NSObject *dispatchQueue;
  _QWORD block[4];
  id v33;
  SDAppleIDIdentityRequest *v34;
  _QWORD v35[5];
  id v36;
  SDAppleIDIdentityRequest *v37;
  id v38;
  _QWORD v39[5];
  id v40;
  NSErrorUserInfoKey v41;
  const __CFString *v42;
  NSErrorUserInfoKey v43;
  const __CFString *v44;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    if (!self->_identityRequest)
    {
      if (dword_1007B3030 <= 30
        && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
      {
        v14 = "yes";
        if (!v12)
          v14 = "no";
        LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _requestIdentityForAppleID:certificateToken:privateKeyPersistentReference:withCompletion:]", 30, "Request identity for %{mask}, certificate token %@, private key persistent ref %s\n", v10, v11, v14);
      }
      v15 = [SDAppleIDIdentityRequest alloc];
      if (v11 && v12)
      {
        v16 = -[SDAppleIDIdentityRequest initWithAppleID:certificateToken:privateKeyPersistentReference:](v15, "initWithAppleID:certificateToken:privateKeyPersistentReference:", v10, v11, v12);
      }
      else
      {
        v16 = -[SDAppleIDIdentityRequest initWithAppleID:](v15, "initWithAppleID:", v10);
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_10018D8BC;
        v39[3] = &unk_100719608;
        v39[4] = self;
        v40 = v10;
        -[SDAppleIDIdentityRequest setCertificateTokenHandler:](v16, "setCertificateTokenHandler:", v39);

      }
      -[SDAppleIDIdentityRequest setDispatchQueue:](v16, "setDispatchQueue:", self->_dispatchQueue);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10018D944;
      v35[3] = &unk_100719630;
      v35[4] = self;
      v36 = v10;
      v17 = v16;
      v37 = v17;
      v38 = v13;
      -[SDAppleIDIdentityRequest setResponseHandler:](v17, "setResponseHandler:", v35);

      identityRequest = self->_identityRequest;
      self->_identityRequest = v17;
      v19 = v17;

      -[SDAppleIDIdentityRequest activate](self->_identityRequest, "activate");
      v20 = 0;
      goto LABEL_14;
    }
    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _requestIdentityForAppleID:certificateToken:privateKeyPersistentReference:withCompletion:]", 30, "Identity request already in progress\n");
    }
    v41 = NSLocalizedDescriptionKey;
    v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(201224, 0, 0));
    v29 = objc_claimAutoreleasedReturnValue(v28);
    v23 = (void *)v29;
    v30 = CFSTR("?");
    if (v29)
      v30 = (const __CFString *)v29;
    v42 = v30;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
    v26 = NSOSStatusErrorDomain;
    v27 = 201224;
  }
  else
  {
    v43 = NSLocalizedDescriptionKey;
    v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960591, 0, 0));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)v22;
    v24 = CFSTR("?");
    if (v22)
      v24 = (const __CFString *)v22;
    v44 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
    v26 = NSOSStatusErrorDomain;
    v27 = -6705;
  }
  v20 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v26, v27, v25));

  if (v13 && v20)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10018D9D0;
    block[3] = &unk_1007159D0;
    v34 = (SDAppleIDIdentityRequest *)v13;
    v20 = v20;
    v33 = v20;
    dispatch_async(dispatchQueue, block);

    v19 = v34;
LABEL_14:

  }
}

- (void)_setCurrentAppleIDIdentity:(id)a3
{
  -[SDAppleIDDatabaseManager setIdentity:forAppleID:](self->_dbManager, "setIdentity:forAppleID:", a3, self->_appleID);
}

- (void)_setCurrentAppleIDContactInfo:(id)a3 validationRecord:(id)a4
{
  -[SDAppleIDDatabaseManager setContactInfo:validationRecord:forAppleID:](self->_dbManager, "setContactInfo:validationRecord:forAppleID:", a3, a4, self->_appleID);
}

- (void)_setMetaInfoValue:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_agentMetaInfo, "setObject:forKeyedSubscript:", a3, a4);
  -[SDAppleIDDatabaseManager setMetaInfo:](self->_dbManager, "setMetaInfo:", self->_agentMetaInfo);
}

- (id)_statusInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager statusInfo](self->_dbManager, "statusInfo"));
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAppleIDAgent _accountState](self, "_accountState")));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("AccountState"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _detailedDescription](self, "_detailedDescription"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("AgentDescription"));

    v7 = v3;
  }

  return v3;
}

- (void)_update
{
  if (self->_updatePush)
  {
    -[SDAppleIDAgent _ensurePushStopped](self, "_ensurePushStopped");
    -[SDAppleIDAgent _ensurePushStarted](self, "_ensurePushStarted");
    self->_updatePush = 0;
  }
  if (self->_updatePeriodicVerifyTimer)
  {
    -[SDAppleIDAgent _ensurePeriodicVerifyTimerStopped](self, "_ensurePeriodicVerifyTimerStopped");
    -[SDAppleIDAgent _ensurePeriodicVerifyTimerStarted](self, "_ensurePeriodicVerifyTimerStarted");
    self->_updatePeriodicVerifyTimer = 0;
  }
}

- (void)_updateAppleID
{
  void *v3;
  NSString *appleID;
  NSString **p_appleID;
  BOOL v6;
  unsigned __int8 v7;
  void *v8;
  id obj;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "myAppleID"));

  p_appleID = &self->_appleID;
  appleID = self->_appleID;
  if (appleID)
    v6 = 1;
  else
    v6 = obj == 0;
  if (!v6 || (v7 = -[NSString isEqualToString:](appleID, "isEqualToString:"), v8 = obj, (v7 & 1) == 0))
  {
    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _updateAppleID]", 30, "Apple ID changed from %{mask} to %{mask}\n", *p_appleID, obj);
    }
    if (*p_appleID)
      -[SDAppleIDAgent _clearAccount](self, "_clearAccount");
    objc_storeStrong((id *)&self->_appleID, obj);
    v8 = obj;
  }

}

- (void)_updateMyInfo
{
  if (self->_appleID)
  {
    -[SDAppleIDAgent _setCurrentAppleIDContactInfo:validationRecord:](self, "_setCurrentAppleIDContactInfo:validationRecord:", 0, 0);
    -[SDAppleIDAgent _verifyState](self, "_verifyState");
  }
  else if (dword_1007B3030 <= 60
         && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
  {
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _updateMyInfo]", 60, "AppleID is nil, unable to updated my info\n");
  }
}

- (void)_verifyState
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  SDAppleIDDatabaseManager *v6;
  SDAppleIDDatabaseManager *dbManager;
  NSMutableDictionary *v8;
  NSMutableDictionary *agentMetaInfo;
  NSMutableDictionary *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  void *v34;
  OS_dispatch_queue *dispatchQueue;
  NSString *appleID;
  void *v37;
  void *v38;
  _QWORD *v39;
  NSString *v40;
  _QWORD *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[6];

  if (!self->_agentEnabled)
  {
LABEL_68:
    v5 = 0;
    goto LABEL_69;
  }
  if (dword_1007B3030 <= 30 && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _verifyState]", 30, "Verifying state\n");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "deviceWasUnlockedOnce");

  if ((v4 & 1) == 0)
  {
    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _verifyState]", 30, "Device not unlocked yet\n");
    }
    goto LABEL_68;
  }
  if (self->_dbManager)
  {
    v5 = 0;
    goto LABEL_12;
  }
  v6 = (SDAppleIDDatabaseManager *)objc_claimAutoreleasedReturnValue(+[SDAppleIDDatabaseManager sharedManager](SDAppleIDDatabaseManager, "sharedManager"));
  dbManager = self->_dbManager;
  self->_dbManager = v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager metaInfo](self->_dbManager, "metaInfo"));
  v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  agentMetaInfo = self->_agentMetaInfo;
  self->_agentMetaInfo = v8;

  v10 = self->_agentMetaInfo;
  if (!v10)
  {
LABEL_69:
    v11 = 0;
    goto LABEL_66;
  }
  if (v5)
    -[NSMutableDictionary addEntriesFromDictionary:](v10, "addEntriesFromDictionary:", v5);
LABEL_12:
  -[SDAppleIDAgent _updateAppleID](self, "_updateAppleID");
  if (!self->_appleID)
  {
    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _verifyState]", 30, "My AppleID is nil, user probably not signed in\n");
    }
    goto LABEL_69;
  }
  v11 = (id)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager accountForAppleID:](self->_dbManager, "accountForAppleID:"));
  if (!v11)
  {
    -[SDAppleIDDatabaseManager addAppleID:](self->_dbManager, "addAppleID:", self->_appleID);
    v11 = (id)objc_claimAutoreleasedReturnValue(-[SDAppleIDDatabaseManager accountForAppleID:](self->_dbManager, "accountForAppleID:", self->_appleID));
    if (!v11)
    {
      if (dword_1007B3030 <= 30
        && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
      {
        LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _verifyState]", 30, "Unable to get account for %{mask}\n", self->_appleID);
      }
      goto LABEL_69;
    }
  }
  -[SDAppleIDAgent _cleanUpAccount:](self, "_cleanUpAccount:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identity"));

  if (!v12)
  {
    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _verifyState]", 30, "Account doesn't have an identity object\n");
    }
    appleID = self->_appleID;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "certificateToken"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateKeyPersistentReference"));
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10018E4A8;
    v49[3] = &unk_1007147C8;
    v49[4] = self;
    v39 = v49;
    goto LABEL_34;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identity"));
  if (objc_msgSend(v13, "isInvalid"))
  {

LABEL_18:
    if (dword_1007B3030 <= 30
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _verifyState]", 30, "Identity is invalid or needs renewal\n");
    }
    appleID = self->_appleID;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "certificateToken"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateKeyPersistentReference"));
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10018E514;
    v48[3] = &unk_1007147C8;
    v48[4] = self;
    v39 = v48;
LABEL_34:
    -[SDAppleIDAgent _requestIdentityForAppleID:certificateToken:privateKeyPersistentReference:withCompletion:](self, "_requestIdentityForAppleID:certificateToken:privateKeyPersistentReference:withCompletion:", appleID, v37, v38, v39);

    goto LABEL_66;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identity"));
  v15 = objc_msgSend(v14, "needsRenewal");

  if (v15)
    goto LABEL_18;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identity"));
  v17 = -[SDAppleIDAgent _performKeyVerificationForIdentity:](self, "_performKeyVerificationForIdentity:", v16);

  if (!v17)
  {
    -[SDAppleIDAgent _performKeychainCount](self, "_performKeychainCount");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "validationRecord"));

    if (!v18)
    {
      if (dword_1007B3030 <= 30
        && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
      {
        LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _verifyState]", 30, "Account doesn't have a validation record\n");
      }
      v40 = self->_appleID;
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_10018E580;
      v47[3] = &unk_1007147C8;
      v47[4] = self;
      v41 = v47;
      goto LABEL_37;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "validationRecord"));
    if (objc_msgSend(v19, "needsUpdate"))
    {

LABEL_25:
      if (dword_1007B3030 <= 30
        && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
      {
        LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _verifyState]", 30, "Validation Record needs update or is invalid\n");
      }
      v40 = self->_appleID;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_10018E5EC;
      v46[3] = &unk_1007147C8;
      v46[4] = self;
      v41 = v46;
LABEL_37:
      -[SDAppleIDAgent _requestInfoForAppleID:completion:](self, "_requestInfoForAppleID:completion:", v40, v41);
      goto LABEL_66;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "validationRecord"));
    v21 = objc_msgSend(v20, "isInvalid");

    if (v21)
      goto LABEL_25;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identity"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "accountIdentifier"));
    if (v23)
    {
      v24 = (void *)v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "validationRecord"));
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "altDSID"));
      if (v26)
      {
        v27 = (void *)v26;
        v43 = v5;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identity"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "accountIdentifier"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "validationRecord"));
        v42 = v22;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "altDSID"));
        v32 = objc_msgSend(v29, "hasSuffix:", v31);

        v5 = v43;
        if ((v32 & 1) != 0)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "validationRecord"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "data"));
          dispatchQueue = self->_dispatchQueue;
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_10018E658;
          v44[3] = &unk_100719680;
          v44[4] = self;
          v11 = v11;
          v45 = v11;
          SFAppleIDParseValidationRecordData(v34, dispatchQueue, v44);

          goto LABEL_66;
        }
        goto LABEL_61;
      }

    }
LABEL_61:
    if (dword_1007B3030 <= 60
      && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 60)))
    {
      LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _verifyState]", 60, "### Certificate account identifier does not match altDSID in the validation record\n");
    }
    -[SDAppleIDAgent _handleAccountIdentifierValidationRecordMismatch](self, "_handleAccountIdentifierValidationRecordMismatch");
    goto LABEL_66;
  }
  if (dword_1007B3030 <= 30 && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent _verifyState]", 30, "Key verificatin failed\n");
  -[SDAppleIDAgent _handleKeyVerificationFailure](self, "_handleKeyVerificationFailure");
LABEL_66:

}

- (void)_verifyStateWithDelay:(double)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018EB30;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)_wasIdentityLinkedOnce
{
  return CFGetInt64(-[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", CFSTR("IdentityLinkedOnce")), 0) != 0;
}

- (BOOL)_wasOldAgentIdentityQueried
{
  return CFGetInt64(-[SDAppleIDAgent _metaInfoValueForKey:](self, "_metaInfoValueForKey:", CFSTR("OldAgentIdentityQueried")), 0) != 0;
}

- (id)accountForAppleID:(id)a3
{
  id v4;
  SDAppleIDAgent *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _accountForAppleID:](v5, "_accountForAppleID:", v4));
  objc_sync_exit(v5);

  if (dword_1007B3030 <= 30
    && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 8388638)))
  {
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent accountForAppleID:]", 8388638, "Account for %{mask}:\n%@\n", v4, v6);
  }

  return v6;
}

- (id)accountStatusForAppleID:(id)a3
{
  SDAppleIDAgent *v4;
  id v5;
  NSString *v6;
  unsigned int v7;
  void *v8;

  v4 = self;
  v5 = a3;
  objc_sync_enter(v4);
  v6 = v4->_appleID;
  objc_sync_exit(v4);

  v7 = -[NSString isEqualToString:](v6, "isEqualToString:", v5);
  if (v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent statusInfo](v4, "statusInfo"));
  else
    v8 = 0;
  return v8;
}

- (void)activate
{
  SDAppleIDAgent *obj;

  obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDAgent _activate](obj, "_activate");
  objc_sync_exit(obj);

}

- (void)verifiedIdentityForEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  OS_dispatch_queue *v9;
  id v10;
  void *v11;
  OS_dispatch_queue *dispatchQueue;
  OS_dispatch_queue *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = (OS_dispatch_queue *)a4;
  v10 = a5;
  v11 = v10;
  dispatchQueue = v9;
  if (!v9)
    dispatchQueue = self->_dispatchQueue;
  if (v10)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10018EE74;
    v14[3] = &unk_1007196A8;
    v15 = v8;
    v16 = v11;
    v13 = dispatchQueue;
    -[SDAppleIDAgent queryVerifiedIdentityForEmailOrPhone:queue:completion:](self, "queryVerifiedIdentityForEmailOrPhone:queue:completion:", v15, v13, v14);

  }
}

- (void)verifiedIdentityForEmailOrPhone:(id)a3 completion:(id)a4
{
  -[SDAppleIDAgent verifiedIdentityForEmailOrPhone:queue:completion:](self, "verifiedIdentityForEmailOrPhone:queue:completion:", a3, self->_dispatchQueue, a4);
}

- (id)verifiedIdentityForEmailOrPhone:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  dispatch_queue_global_t global_queue;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  id v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_10018F0E4;
  v22 = sub_10018F0F4;
  v23 = 0;
  v5 = dispatch_semaphore_create(0);
  if (v5)
  {
    global_queue = dispatch_get_global_queue(2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_10018F0FC;
    v15 = &unk_1007196D0;
    v17 = &v18;
    v8 = v5;
    v16 = v8;
    -[SDAppleIDAgent verifiedIdentityForEmailOrPhone:queue:completion:](self, "verifiedIdentityForEmailOrPhone:queue:completion:", v4, v7, &v12);

    v9 = dispatch_time(0, 15000000000);
    if (dispatch_semaphore_wait(v8, v9))
    {
      if (dword_1007B3030 <= 50
        && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 50)))
      {
        LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent verifiedIdentityForEmailOrPhone:]", 50, "CreateCSIdentity semaphore timed out\n", v12, v13, v14, v15);
      }
    }
  }
  v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (id)verifiedIdentityForCertificateChain:(id)a3 emailOrPhone:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  SDAppleIDVerifiedIdentity *v12;
  id v13;
  NSErrorDomain v15;
  NSString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  const __CFString **v20;
  NSErrorUserInfoKey *v21;
  NSString *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  NSErrorDomain v26;
  uint64_t v27;
  uint64_t v28;
  NSString *v29;
  uint64_t v30;
  const __CFString *v31;
  NSString *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  NSString *v36;
  uint64_t v37;
  const __CFString *v38;
  id v39;
  int v40;
  NSErrorUserInfoKey v41;
  const __CFString *v42;
  NSErrorUserInfoKey v43;
  const __CFString *v44;
  NSErrorUserInfoKey v45;
  const __CFString *v46;
  NSErrorUserInfoKey v47;
  const __CFString *v48;
  NSErrorUserInfoKey v49;
  const __CFString *v50;

  v7 = a3;
  v8 = a4;
  v40 = 0;
  if (!objc_msgSend(v7, "count"))
  {
    v15 = NSOSStatusErrorDomain;
    v49 = NSLocalizedDescriptionKey;
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960591, 0, 0));
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)v17;
    v19 = CFSTR("?");
    if (v17)
      v19 = (const __CFString *)v17;
    v50 = v19;
    v20 = &v50;
    v21 = &v49;
    goto LABEL_14;
  }
  if (!v8)
  {
    v15 = NSOSStatusErrorDomain;
    v47 = NSLocalizedDescriptionKey;
    v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960591, 0, 0));
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v18 = (void *)v23;
    v24 = CFSTR("?");
    if (v23)
      v24 = (const __CFString *)v23;
    v48 = v24;
    v20 = &v48;
    v21 = &v47;
LABEL_14:
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v21, 1));
    v26 = v15;
    v27 = -6705;
LABEL_22:
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v26, v27, v25));
    v11 = 0;
    goto LABEL_26;
  }
  if ((SFAppleIDVerifyCertificateChainSync(v7, &v40) & 1) == 0)
  {
    v28 = v40;
    if (!v40)
    {
      v12 = 0;
      v13 = 0;
      v11 = 0;
      goto LABEL_7;
    }
    v45 = NSLocalizedDescriptionKey;
    v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v40, 0, 0));
    v30 = objc_claimAutoreleasedReturnValue(v29);
    v18 = (void *)v30;
    v31 = CFSTR("?");
    if (v30)
      v31 = (const __CFString *)v30;
    v46 = v31;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));
    v26 = NSOSStatusErrorDomain;
    v27 = v28;
    goto LABEL_22;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));

  if (!v9)
  {
    v43 = NSLocalizedDescriptionKey;
    v32 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960534, 0, 0));
    v33 = objc_claimAutoreleasedReturnValue(v32);
    v18 = (void *)v33;
    v34 = CFSTR("?");
    if (v33)
      v34 = (const __CFString *)v33;
    v44 = v34;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
    v26 = NSOSStatusErrorDomain;
    v27 = -6762;
    goto LABEL_22;
  }
  v39 = 0;
  v10 = SFAppleIDCommonNameForCertificate(v9, &v39);
  v11 = v39;
  v40 = v10;
  if (!(_DWORD)v10)
  {
    v12 = -[SDAppleIDVerifiedIdentity initWithAccountIdentifier:emailOrPhone:]([SDAppleIDVerifiedIdentity alloc], "initWithAccountIdentifier:emailOrPhone:", v11, v8);
    v13 = 0;
    goto LABEL_7;
  }
  v35 = (int)v10;
  v41 = NSLocalizedDescriptionKey;
  v36 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(v10, 0, 0));
  v37 = objc_claimAutoreleasedReturnValue(v36);
  v18 = (void *)v37;
  v38 = CFSTR("?");
  if (v37)
    v38 = (const __CFString *)v37;
  v42 = v38;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, v35, v25));
LABEL_26:

  v12 = 0;
  if (a5 && v13)
  {
    v13 = objc_retainAutorelease(v13);
    v12 = 0;
    *a5 = v13;
  }
LABEL_7:

  return v12;
}

- (__SecIdentity)copyIdentityForAppleID:(id)a3
{
  id v4;
  SDAppleIDAgent *v5;
  __SecIdentity *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[SDAppleIDAgent _copyIdentityForAppleID:](v5, "_copyIdentityForAppleID:", v4);
  objc_sync_exit(v5);

  if (dword_1007B3030 <= 30 && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent copyIdentityForAppleID:]", 30, "SecIdentity for %{mask}:\n%@\n", v4, v6);

  return v6;
}

- (void)queryVerifiedIdentityForEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  OS_dispatch_queue *v9;
  id v10;
  void *v11;
  OS_dispatch_queue *dispatchQueue;
  OS_dispatch_queue *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = (OS_dispatch_queue *)a4;
  v10 = a5;
  v11 = v10;
  dispatchQueue = v9;
  if (!v9)
    dispatchQueue = self->_dispatchQueue;
  if (v10)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10018F7C0;
    v14[3] = &unk_1007196F8;
    v15 = v8;
    v16 = v11;
    v13 = dispatchQueue;
    -[SDAppleIDAgent personInfoWithEmailOrPhone:queue:completion:](self, "personInfoWithEmailOrPhone:queue:completion:", v15, v13, v14);

  }
}

- (id)detailedDescription
{
  SDAppleIDAgent *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _detailedDescription](v2, "_detailedDescription"));
  objc_sync_exit(v2);

  return v3;
}

- (void)invalidate
{
  SDAppleIDAgent *obj;

  obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDAgent _invalidate](obj, "_invalidate");
  objc_sync_exit(obj);

}

- (id)myAccount
{
  SDAppleIDAgent *v3;
  void *v4;

  if (self->_appleID)
  {
    v3 = self;
    objc_sync_enter(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _accountForAppleID:](v3, "_accountForAppleID:", self->_appleID));
    objc_sync_exit(v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)personInfoWithEmailOrPhone:(id)a3 completion:(id)a4
{
  -[SDAppleIDAgent personInfoWithEmailOrPhone:queue:completion:](self, "personInfoWithEmailOrPhone:queue:completion:", a3, self->_dispatchQueue, a4);
}

- (void)personInfoWithEmailOrPhone:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  SDAppleIDAgent *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  -[SDAppleIDAgent _personInfoWithEmailOrPhone:queue:completion:](v10, "_personInfoWithEmailOrPhone:queue:completion:", v11, v8, v9);
  objc_sync_exit(v10);

}

- (void)prefsChanged
{
  SDAppleIDAgent *obj;

  obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDAgent _prefsChanged](obj, "_prefsChanged");
  objc_sync_exit(obj);

}

- (void)requestWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  SDAppleIDAgent *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("requestType")));
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("createCert")) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("fetchCert")) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("getMyInfo")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("findPerson")))
  {
    -[SDAppleIDAgent _performServerTaskWithInfo:completion:](v7, "_performServerTaskWithInfo:completion:", v9, v6);
  }
  else
  {
    -[SDAppleIDAgent _performOtherTaskWithInfo:completion:](v7, "_performOtherTaskWithInfo:completion:", v9, v6);
  }

  objc_sync_exit(v7);
}

+ (id)sharedAgent
{
  if (qword_1007C6B80 != -1)
    dispatch_once(&qword_1007C6B80, &stru_100719718);
  return gSDAppleIDAgent;
}

- (id)statusInfo
{
  SDAppleIDAgent *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _statusInfo](v2, "_statusInfo"));
  objc_sync_exit(v2);

  return v3;
}

- (id)validationRecordInfoForAppleID:(id)a3
{
  id v4;
  SDAppleIDAgent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent _accountForAppleID:](v5, "_accountForAppleID:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "validationRecord"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));
    objc_msgSend(v6, "setValue:forKey:", v9, CFSTR("AppleIDAccountValidationRecordData"));

    v10 = v6;
  }
  objc_sync_exit(v5);

  return v6;
}

- (void)handleAppleIDChangedNotification
{
  SDAppleIDAgent *obj;

  obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDAgent _handleAppleIDChangedNotification](obj, "_handleAppleIDChangedNotification");
  objc_sync_exit(obj);

}

- (void)handleAppleIDSignedInNotification
{
  SDAppleIDAgent *obj;

  obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDAgent _handleAppleIDSignedInNotification](obj, "_handleAppleIDSignedInNotification");
  objc_sync_exit(obj);

}

- (void)handleAppleIDSignedOutNotification
{
  SDAppleIDAgent *obj;

  obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDAgent _handleAppleIDSignedOutNotification](obj, "_handleAppleIDSignedOutNotification");
  objc_sync_exit(obj);

}

- (void)handleKeyBagFirstUnlockNotification
{
  SDAppleIDAgent *obj;

  obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDAgent _handleKeyBagFirstUnlockNotification](obj, "_handleKeyBagFirstUnlockNotification");
  objc_sync_exit(obj);

}

- (void)handleUILockStatusChangedNotification
{
  SDAppleIDAgent *obj;

  obj = self;
  objc_sync_enter(obj);
  -[SDAppleIDAgent _handleUILockStatusChangedNotification](obj, "_handleUILockStatusChangedNotification");
  objc_sync_exit(obj);

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_activity_scope_state_s state;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDAppleIDAgent/didReceiveToken", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  if (dword_1007B3030 <= 30 && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent connection:didReceiveToken:forTopic:identifier:]", 30, "Received push token '%.6@...', topic '%@', identifier '%@'\n", v10, v11, v12);
  os_activity_scope_leave(&state);

}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = a4;
  v7 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDAppleIDAgent/didReceivePublicToken", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (dword_1007B3030 <= 30 && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 30)))
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent connection:didReceivePublicToken:]", 30, "Received public push token '%.6@...'\n", v6);
  os_activity_scope_leave(&state);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  SDAppleIDAgent *v10;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDAppleIDAgent/didReceiveIncomingMessage", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3030 <= 50 && (dword_1007B3030 != -1 || _LogCategory_Initialize(&dword_1007B3030, 50)))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topic"));
    LogPrintF(&dword_1007B3030, "-[SDAppleIDAgent connection:didReceiveIncomingMessage:]", 50, "Received push notification topic '%@'\n", v9);

  }
  v10 = self;
  objc_sync_enter(v10);
  -[SDAppleIDAgent _updateMyInfo](v10, "_updateMyInfo");
  objc_sync_exit(v10);

  os_activity_scope_leave(&state);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttledRetryTimer, 0);
  objc_storeStrong((id *)&self->_testIdentityRequest, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_pushEnvironment, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_periodicVerifyTimer, 0);
  objc_storeStrong((id *)&self->_infoRequest, 0);
  objc_storeStrong((id *)&self->_identityRequest, 0);
  objc_storeStrong((id *)&self->_findPersonRequests, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_dbManager, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_agentMetaInfo, 0);
}

@end
