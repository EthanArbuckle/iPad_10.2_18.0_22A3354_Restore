@implementation TRAuthenticationOperation

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _BOOL4 v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  TRCompanionAuthOperation *v33;
  void *v34;
  void *v35;
  NSString *v36;
  NSObject *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  TRProxyAuthOperation *v54;
  void *v55;
  TRProxyAuthOperation *v56;
  void *v57;
  NSString *rawPassword;
  NSObject *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  NSObject *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  int v82;
  uint64_t v83;
  BOOL v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  _BOOL4 v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint8_t buf[4];
  const char *v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  _BYTE v106[18];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  if (-[TRAuthenticationOperation isCancelled](self, "isCancelled"))
  {
    objc_msgSend((id)objc_opt_class(), "userCancelledError");
    v95 = (id)objc_claimAutoreleasedReturnValue();
    -[TROperation finishWithError:](self, "finishWithError:");

    return;
  }
  v3 = (void *)MEMORY[0x24BDBCEF0];
  -[TRAuthenticationOperation targetedServices](self, "targetedServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[TRAuthenticationOperation shouldForceInteractiveAuth](self, "shouldForceInteractiveAuth");
      -[TRAuthenticationOperation presentingViewController](self, "presentingViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v102 = "-[TRAuthenticationOperation execute]";
      v103 = 2112;
      v104 = v5;
      v105 = 1024;
      *(_DWORD *)v106 = v8;
      *(_WORD *)&v106[4] = 2112;
      *(_QWORD *)&v106[6] = v9;
      _os_log_impl(&dword_20A2BF000, v7, OS_LOG_TYPE_DEFAULT, "%s: services: %@, shouldForceInteractiveAuth? %d, presentingViewController? %@", buf, 0x26u);

    }
  }
  if (!objc_msgSend(v5, "count"))
  {
    v49 = v6;
LABEL_124:
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v102 = "-[TRAuthenticationOperation execute]";
        v103 = 2112;
        v104 = v92;
        _os_log_impl(&dword_20A2BF000, v85, OS_LOG_TYPE_DEFAULT, "%s finishing with result: %@", buf, 0x16u);
      }

    }
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v92, CFSTR("TRAuthenticationOperationUnauthenticatedServicesKey"));
    if (v49)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v49, CFSTR("TRAuthenticationOperationErrorKey"));
    v86 = (void *)objc_msgSend(v16, "copy");
    -[TROperation finishWithResult:](self, "finishWithResult:", v86);
    goto LABEL_142;
  }
  v10 = 0x24C2E4000uLL;
  v93 = v5;
  while (1)
  {
    objc_msgSend(v5, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    objc_msgSend(*(id *)(v10 + 1776), "idmsAccountForAccountService:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          StringFromTRAccountService(v12);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v102 = "-[TRAuthenticationOperation execute]";
          v103 = 2112;
          v104 = v24;
          _os_log_impl(&dword_20A2BF000, v23, OS_LOG_TYPE_DEFAULT, "%s Failed to find IDMS account for service: %@", buf, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObject:", v16);
      goto LABEL_104;
    }
    v14 = (void *)v13;
    objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transportableAuthKitAccount:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v10 + 1776), "associatedAccountServicesForIDMSAccount:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithSet:", v17);
    objc_msgSend(v18, "intersectSet:", v5);
    objc_msgSend(v5, "minusSet:", v18);
    v19 = v18;
    v20 = -[TRAuthenticationOperation shouldForceInteractiveAuth](self, "shouldForceInteractiveAuth");
    -[TRAuthenticationOperation presentingViewController](self, "presentingViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      v22 = 1;
    else
      v22 = self->_isCLIMode && self->_rawPassword != 0;

    v96 = (id)v17;
    if (-[TRAuthenticationOperation _canDoMagicAuthForAccount:](self, "_canDoMagicAuthForAccount:", v16))
    {
      v25 = !v20;
      goto LABEL_29;
    }
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v102 = "-[TRAuthenticationOperation execute]";
        _os_log_impl(&dword_20A2BF000, v26, OS_LOG_TYPE_DEFAULT, "%s: this device cannot do magic auth", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -12001, 0);
    v27 = objc_claimAutoreleasedReturnValue();

    if (self->_isCLIMode && !self->_rawPassword)
      break;
    v25 = 0;
    v6 = (void *)v27;
LABEL_29:
    if (+[TRDefaults forceProxyAuth](TRDefaults, "forceProxyAuth"))
    {
      if (_TRLogEnabled != 1)
      {
LABEL_62:
        v29 = v19;
LABEL_63:
        v94 = v19;
        if (v22)
        {
          if (self->_authType == 1)
            v50 = 3;
          else
            v50 = 2;
          self->_authType = v50;
          objc_msgSend(v29, "anyObject");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "intValue");

          if (_TRLogEnabled == 1)
          {
            TRLogHandle();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v102 = "-[TRAuthenticationOperation execute]";
              _os_log_impl(&dword_20A2BF000, v53, OS_LOG_TYPE_DEFAULT, "%s attempting proxy auth", buf, 0xCu);
            }

          }
          v54 = [TRProxyAuthOperation alloc];
          -[TROperation session](self, "session");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = -[TROperation initWithSession:](v54, "initWithSession:", v55);

          -[TRProxyAuthOperation setAccount:](v56, "setAccount:", v16);
          -[TRProxyAuthOperation setTargetedServices:](v56, "setTargetedServices:", v29);
          -[TRAuthenticationOperation presentingViewController](self, "presentingViewController");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRProxyAuthOperation setPresentingViewController:](v56, "setPresentingViewController:", v57);

          -[TRProxyAuthOperation setShouldUseAIDA:](v56, "setShouldUseAIDA:", -[TRAuthenticationOperation shouldUseAIDA](self, "shouldUseAIDA"));
          -[TRProxyAuthOperation setIsForHomePod:](v56, "setIsForHomePod:", self->_shouldSetupHomePod);
          -[TRProxyAuthOperation setIsCLIMode:](v56, "setIsCLIMode:", self->_isCLIMode);
          -[TRProxyAuthOperation setCanDoTermsAndConditions:](v56, "setCanDoTermsAndConditions:", self->_canDoTermsAndConditions);
          -[TRProxyAuthOperation setForceFail:](v56, "setForceFail:", self->_forceFail);
          -[TRProxyAuthOperation setPresentingChildViewController:](v56, "setPresentingChildViewController:", self->_presentingChildViewController);
          if (self->_isCLIMode)
          {
            rawPassword = self->_rawPassword;
            if (rawPassword)
            {
              if (_TRLogEnabled == 1)
              {
                TRLogHandle();
                v59 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_20A2BF000, v59, OS_LOG_TYPE_DEFAULT, "TRAuthenticationOperation->TRProxyAuthOperation isClIMode enabled, setting passed in password", buf, 2u);
                }

                rawPassword = self->_rawPassword;
              }
              -[TRProxyAuthOperation setRawPassword:](v56, "setRawPassword:", rawPassword);
            }
          }
          self->_proxyAuthStartTicks = mach_absolute_time();
          -[TRProxyAuthOperation start](v56, "start");
          mach_absolute_time();
          UpTicksToSecondsF();
          v61 = v60;
          -[TROperation result](v56, "result");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[TROperation error](v56, "error");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v63)
          {
            objc_msgSend(v62, "objectForKey:", CFSTR("TRProxyAuthOperationErrorKey"));
            v63 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (self->_shouldSetupHomePod)
            v64 = 1;
          else
            v64 = 2;
          -[TRAuthenticationOperation _reportAuthMetrics:durationSeconds:authType:deviceType:sessionID:authServiceType:](self, "_reportAuthMetrics:durationSeconds:authType:deviceType:sessionID:authServiceType:", v63, 2, v64, self->_sessionID, v52, v61);
          if (_TRLogEnabled == 1)
          {
            TRLogHandle();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v102 = "-[TRAuthenticationOperation execute]";
              v103 = 2112;
              v104 = v62;
              _os_log_impl(&dword_20A2BF000, v65, OS_LOG_TYPE_DEFAULT, "%s Proxy auth finished with results %@", buf, 0x16u);
            }

          }
          if (!v62)
          {
            -[TROperation error](v56, "error");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            if (_TRLogEnabled == 1)
            {
              TRLogHandle();
              v90 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v102 = "-[TRAuthenticationOperation execute]";
                v103 = 2112;
                v104 = v89;
                _os_log_impl(&dword_20A2BF000, v90, OS_LOG_TYPE_DEFAULT, "%s Proxy auth failed with error: %@", buf, 0x16u);
              }

            }
            -[TROperation finishWithError:](self, "finishWithError:", v89);

            v5 = v93;
            goto LABEL_139;
          }
          objc_msgSend(v62, "objectForKey:", CFSTR("TRProxyAuthOperationUnauthenticatedServicesKey"));
          v66 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v62, "objectForKey:", CFSTR("TRProxyAuthOperationErrorKey"));
          v67 = objc_claimAutoreleasedReturnValue();

          v29 = (void *)v66;
          v6 = (void *)v67;
          v5 = v93;
          v19 = v94;
        }
        if (!objc_msgSend(v29, "count"))
        {
LABEL_103:

          v10 = 0x24C2E4000;
LABEL_104:

          v49 = v6;
          goto LABEL_105;
        }
        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = 0u;
        v98 = 0u;
        v99 = 0u;
        v100 = 0u;
        v69 = v5;
        v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
        if (v70)
        {
          v71 = v70;
          v72 = *(_QWORD *)v98;
          do
          {
            for (i = 0; i != v71; ++i)
            {
              if (*(_QWORD *)v98 != v72)
                objc_enumerationMutation(v69);
              StringFromTRAccountService(objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * i), "unsignedIntegerValue"));
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "appendString:", v74);

            }
            v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
          }
          while (v71);
        }

        v5 = v93;
        if (_TRLogEnabled == 1)
        {
          TRLogHandle();
          v75 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v102 = "-[TRAuthenticationOperation execute]";
            v103 = 2112;
            v104 = v68;
            v105 = 2112;
            *(_QWORD *)v106 = v29;
            *(_WORD *)&v106[8] = 2112;
            *(_QWORD *)&v106[10] = v6;
            _os_log_impl(&dword_20A2BF000, v75, OS_LOG_TYPE_DEFAULT, "%s Failed to authenticate with services: %@ (%@), last know error %@", buf, 0x2Au);
          }

        }
        if (-[TRAuthenticationOperation shouldIgnoreAuthFailures](self, "shouldIgnoreAuthFailures"))
        {
          objc_msgSend(v92, "unionSet:", v29);

          v19 = v94;
          goto LABEL_103;
        }
        objc_msgSend(v69, "unionSet:", v29);
        v87 = (void *)objc_opt_new();
        objc_msgSend(v87, "setObject:forKeyedSubscript:", v69, CFSTR("TRAuthenticationOperationUnauthenticatedServicesKey"));
        if (v6)
          objc_msgSend(v87, "setObject:forKeyedSubscript:", v6, CFSTR("TRAuthenticationOperationErrorKey"));
        v88 = (void *)objc_msgSend(v87, "copy");
        -[TROperation finishWithResult:](self, "finishWithResult:", v88);

LABEL_139:
        v19 = v94;
        goto LABEL_141;
      }
      v91 = v22;
      TRLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v102 = "-[TRAuthenticationOperation execute]";
        _os_log_impl(&dword_20A2BF000, v28, OS_LOG_TYPE_DEFAULT, "%s: Force Proxy Auth Default enabled", buf, 0xCu);
      }
      v29 = v19;
LABEL_61:

      v22 = v91;
      goto LABEL_63;
    }
    if (!v25)
      goto LABEL_62;
    self->_authType = 1;
    objc_msgSend(v19, "anyObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "intValue");

    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v102 = "-[TRAuthenticationOperation execute]";
        _os_log_impl(&dword_20A2BF000, v32, OS_LOG_TYPE_DEFAULT, "%s attempting companion auth", buf, 0xCu);
      }

    }
    v91 = v22;
    v33 = [TRCompanionAuthOperation alloc];
    -[TROperation session](self, "session");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[TROperation initWithSession:](v33, "initWithSession:", v34);

    -[NSObject setAccount:](v28, "setAccount:", v16);
    -[NSObject setTargetedServices:](v28, "setTargetedServices:", v19);
    -[NSObject setShouldUseAIDA:](v28, "setShouldUseAIDA:", -[TRAuthenticationOperation shouldUseAIDA](self, "shouldUseAIDA"));
    -[TRAuthenticationOperation presentingViewController](self, "presentingViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPresentingViewController:](v28, "setPresentingViewController:", v35);

    -[NSObject setIsForHomePod:](v28, "setIsForHomePod:", self->_shouldSetupHomePod);
    -[NSObject setIsCLIMode:](v28, "setIsCLIMode:", self->_isCLIMode);
    -[NSObject setCanDoTermsAndConditions:](v28, "setCanDoTermsAndConditions:", self->_canDoTermsAndConditions);
    -[NSObject setForceFail:](v28, "setForceFail:", self->_forceFail);
    -[NSObject setPresentingChildViewController:](v28, "setPresentingChildViewController:", self->_presentingChildViewController);
    if (self->_isCLIMode)
    {
      v36 = self->_rawPassword;
      if (v36)
      {
        if (_TRLogEnabled == 1)
        {
          TRLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20A2BF000, v37, OS_LOG_TYPE_DEFAULT, "TRAuthenticationOperation->TRCompanionAuthOperation isClIMode enabled, setting passed in password", buf, 2u);
          }

          v36 = self->_rawPassword;
        }
        -[NSObject setRawPassword:](v28, "setRawPassword:", v36);
      }
    }
    self->_companionAuthStartTicks = mach_absolute_time();
    -[NSObject start](v28, "start");
    mach_absolute_time();
    UpTicksToSecondsF();
    v39 = v38;
    -[NSObject result](v28, "result");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject error](v28, "error");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v41)
    {
      objc_msgSend(v40, "objectForKey:", CFSTR("TRCompanionAuthOperationErrorKey"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v42 = v19;
    if (self->_shouldSetupHomePod)
      v43 = 1;
    else
      v43 = 2;
    -[TRAuthenticationOperation _reportAuthMetrics:durationSeconds:authType:deviceType:sessionID:authServiceType:](self, "_reportAuthMetrics:durationSeconds:authType:deviceType:sessionID:authServiceType:", v41, 1, v43, self->_sessionID, v31, v39);
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v102 = "-[TRAuthenticationOperation execute]";
        v103 = 2112;
        v104 = v40;
        _os_log_impl(&dword_20A2BF000, v44, OS_LOG_TYPE_DEFAULT, "%s companion auth finished with results %@", buf, 0x16u);
      }

    }
    if (!v40)
    {
      -[NSObject error](v28, "error");
      v76 = objc_claimAutoreleasedReturnValue();
      v77 = (void *)v76;
      if (_TRLogEnabled == 1)
      {
        v78 = (void *)v76;
        TRLogHandle();
        v79 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
LABEL_116:
          *(_DWORD *)buf = 136315394;
          v102 = "-[TRAuthenticationOperation execute]";
          v103 = 2112;
          v104 = v78;
          _os_log_impl(&dword_20A2BF000, v79, OS_LOG_TYPE_DEFAULT, "%s Companion auth failed with error: %@", buf, 0x16u);
        }
LABEL_117:

        v77 = v78;
      }
LABEL_118:
      -[TROperation finishWithError:](self, "finishWithError:", v77);
      v82 = 1;
      v29 = v42;
LABEL_119:

      v49 = v6;
      goto LABEL_120;
    }
    if (self->_shouldSetupHomePod)
    {
      -[NSObject error](v28, "error");
      v45 = objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        v46 = (void *)v45;
        -[NSObject error](v28, "error");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "ak_isEligibleForProxiedAuthFallback");

        if ((v48 & 1) == 0)
        {
          -[NSObject error](v28, "error");
          v83 = objc_claimAutoreleasedReturnValue();
          v77 = (void *)v83;
          if (_TRLogEnabled == 1)
          {
            v78 = (void *)v83;
            TRLogHandle();
            v79 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
              goto LABEL_116;
            goto LABEL_117;
          }
          goto LABEL_118;
        }
      }
    }
    objc_msgSend(v40, "objectForKey:", CFSTR("TRCompanionAuthOperationUnauthenticatedServicesKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "objectForKey:", CFSTR("TRCompanionAuthOperationErrorKey"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v29, "count"))
    {

      v6 = v49;
      v5 = v93;
      v19 = v42;
      goto LABEL_61;
    }
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v102 = "-[TRAuthenticationOperation execute]";
        _os_log_impl(&dword_20A2BF000, v80, OS_LOG_TYPE_DEFAULT, "%s Companion auth successful. Authenticating remaining services", buf, 0xCu);
      }
      v81 = v80;
      v82 = 4;
      v6 = v49;
      v77 = v81;
      goto LABEL_119;
    }
    v82 = 4;
LABEL_120:

    v84 = v82 == 4;
    v5 = v93;
    v10 = 0x24C2E4000;
    if (!v84)
      goto LABEL_143;
LABEL_105:
    v6 = v49;
    if (!objc_msgSend(v5, "count"))
      goto LABEL_124;
  }
  -[TROperation finishWithError:](self, "finishWithError:", v27);
  v29 = v19;
  v6 = (void *)v27;
LABEL_141:

  v49 = v6;
  v86 = v96;
LABEL_142:

LABEL_143:
}

- (BOOL)_canDoMagicAuthForAccount:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE0AC98];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passwordResetTokenForAccount:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (void)_reportAuthMetrics:(id)a3 durationSeconds:(double)a4 authType:(int)a5 deviceType:(int)a6 sessionID:(id)a7 authServiceType:(int)a8
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  const __CFString *v25;
  uint64_t v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v51;
  void *v52;
  __CFString *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  __CFString *v65;
  uint8_t buf[4];
  void *v67;
  _QWORD v68[18];
  _QWORD v69[20];

  v69[18] = *MEMORY[0x24BDAC8D0];
  v54 = (__CFString *)a7;
  v48 = a3;
  v63 = objc_msgSend(v48, "code");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v63);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "domain");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "underlyingErrors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = objc_msgSend(v13, "code");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v59);
  v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "domain");
  v14 = objc_claimAutoreleasedReturnValue();
  v61 = v13;
  objc_msgSend(v13, "underlyingErrors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = objc_msgSend(v16, "code");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v16);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "domain");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v58 = v16;
  objc_msgSend(v16, "underlyingErrors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = objc_msgSend(v20, "code");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v55 = v20;
  objc_msgSend(v20, "domain");
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v68[0] = CFSTR("duration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (a4 * 1000.0));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v47;
  v68[1] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v63);
  v23 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v23;
  v62 = (void *)v11;
  v64 = (void *)v10;
  if (v10)
    v24 = (const __CFString *)v10;
  else
    v24 = CFSTR("0");
  v69[1] = v23;
  v69[2] = v24;
  v68[2] = CFSTR("errorCodeString");
  v68[3] = CFSTR("errorDomain");
  if (v11)
    v25 = (const __CFString *)v11;
  else
    v25 = CFSTR("NoDomain");
  v69[3] = v25;
  v68[4] = CFSTR("underlyingErrorCode0");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v59);
  v26 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v26;
  if (v65)
    v27 = v65;
  else
    v27 = CFSTR("0");
  v69[4] = v26;
  v69[5] = v27;
  v68[5] = CFSTR("underlyingErrorCodeString0");
  v68[6] = CFSTR("underlyingErrorDomain0");
  v60 = (void *)v14;
  if (v14)
    v28 = (const __CFString *)v14;
  else
    v28 = CFSTR("NoDomain");
  v69[6] = v28;
  v68[7] = CFSTR("underlyingErrorCode1");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v56);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  v57 = (void *)v17;
  if (v17)
    v31 = (const __CFString *)v17;
  else
    v31 = CFSTR("0");
  v69[7] = v29;
  v69[8] = v31;
  v68[8] = CFSTR("underlyingErrorCodeString1");
  v68[9] = CFSTR("underlyingErrorDomain1");
  if (v18)
    v32 = v18;
  else
    v32 = CFSTR("NoDomain");
  v69[9] = v32;
  v68[10] = CFSTR("underlyingErrorCode2");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v51);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  v52 = (void *)v21;
  if (v21)
    v35 = (const __CFString *)v21;
  else
    v35 = CFSTR("0");
  v69[10] = v33;
  v69[11] = v35;
  v68[11] = CFSTR("underlyingErrorCodeString2");
  v68[12] = CFSTR("underlyingErrorDomain2");
  if (v22)
    v36 = v22;
  else
    v36 = CFSTR("NoDomain");
  v69[12] = v36;
  v68[13] = CFSTR("authType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v69[13] = v37;
  v68[14] = CFSTR("deviceAuthType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a6);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v69[14] = v38;
  v68[15] = CFSTR("authServiceType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v69[15] = v39;
  v68[16] = CFSTR("success");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v48 == 0);
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v40;
  v68[17] = CFSTR("sessionID");
  v42 = CFSTR("nil");
  if (v54)
    v42 = v54;
  v69[16] = v40;
  v69[17] = v42;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 18);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  TRMetricsLog(CFSTR("com.apple.touchremote.authentication"), v43);
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v43;
      _os_log_impl(&dword_20A2BF000, v44, OS_LOG_TYPE_DEFAULT, "TouchRemote Auth Metric sent: %@\n", buf, 0xCu);
    }

  }
}

- (NSSet)targetedServices
{
  return self->_targetedServices;
}

- (void)setTargetedServices:(id)a3
{
  objc_storeStrong((id *)&self->_targetedServices, a3);
}

- (BOOL)shouldIgnoreAuthFailures
{
  return self->_shouldIgnoreAuthFailures;
}

- (void)setShouldIgnoreAuthFailures:(BOOL)a3
{
  self->_shouldIgnoreAuthFailures = a3;
}

- (BOOL)shouldForceInteractiveAuth
{
  return self->_shouldForceInteractiveAuth;
}

- (void)setShouldForceInteractiveAuth:(BOOL)a3
{
  self->_shouldForceInteractiveAuth = a3;
}

- (BOOL)shouldUseAIDA
{
  return self->_shouldUseAIDA;
}

- (void)setShouldUseAIDA:(BOOL)a3
{
  self->_shouldUseAIDA = a3;
}

- (BOOL)shouldSetupHomePod
{
  return self->_shouldSetupHomePod;
}

- (void)setShouldSetupHomePod:(BOOL)a3
{
  self->_shouldSetupHomePod = a3;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (UIViewController)presentingChildViewController
{
  return self->_presentingChildViewController;
}

- (void)setPresentingChildViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingChildViewController, a3);
}

- (BOOL)isCLIMode
{
  return self->_isCLIMode;
}

- (void)setIsCLIMode:(BOOL)a3
{
  self->_isCLIMode = a3;
}

- (NSString)rawPassword
{
  return self->_rawPassword;
}

- (void)setRawPassword:(id)a3
{
  objc_storeStrong((id *)&self->_rawPassword, a3);
}

- (BOOL)canDoTermsAndConditions
{
  return self->_canDoTermsAndConditions;
}

- (void)setCanDoTermsAndConditions:(BOOL)a3
{
  self->_canDoTermsAndConditions = a3;
}

- (int)authType
{
  return self->_authType;
}

- (void)setAuthType:(int)a3
{
  self->_authType = a3;
}

- (BOOL)forceFail
{
  return self->_forceFail;
}

- (void)setForceFail:(BOOL)a3
{
  self->_forceFail = a3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_rawPassword, 0);
  objc_storeStrong((id *)&self->_presentingChildViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_targetedServices, 0);
}

@end
