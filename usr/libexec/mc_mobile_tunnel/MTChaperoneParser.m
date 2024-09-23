@implementation MTChaperoneParser

- (MTChaperoneParser)init
{
  MTChaperoneParser *v2;
  MTIPCUTunnelParser *v3;
  MTIPCUTunnelParser *iPCUParser;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTChaperoneParser;
  v2 = -[MTChaperoneParser initWithManagingProfileIdentifier:](&v6, "initWithManagingProfileIdentifier:", 0);
  if (v2)
  {
    v3 = objc_alloc_init(MTIPCUTunnelParser);
    iPCUParser = v2->_iPCUParser;
    v2->_iPCUParser = v3;

    -[MTChaperoneParser setIsMDM:](v2, "setIsMDM:", 0);
  }
  return v2;
}

- (void)processRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  -[MTChaperoneParser processRequest:accessRights:assertion:completionBlock:](self, "processRequest:accessRights:assertion:completionBlock:", a3, 0x1FFFLL, a4, a5);
}

- (void)_processRequest:(id)a3 accessRights:(unint64_t)a4 assertion:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  objc_super v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", kMCTPRequestTypeKey));
  v14 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
    goto LABEL_8;
  if (!objc_msgSend(v13, "isEqualToString:", CFSTR("DefaultMDMOptions")))
  {
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("SetDefaultMDMOptions")))
    {
      -[MTChaperoneParser commandSetDefaultMDMOptionsRequest:completionBlock:](self, "commandSetDefaultMDMOptionsRequest:completionBlock:", v10, v12);
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("ProceedWithKeybagMigration")))
    {
      -[MTChaperoneParser commandProceedWithKeybagMigrationRequest:completionBlock:](self, "commandProceedWithKeybagMigrationRequest:completionBlock:", v10, v12);
      goto LABEL_9;
    }
LABEL_8:
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000067F0;
    v16[3] = &unk_100010830;
    v16[4] = self;
    v17 = v10;
    v18 = v11;
    v19 = v12;
    v15.receiver = self;
    v15.super_class = (Class)MTChaperoneParser;
    -[MTChaperoneParser _processRequest:accessRights:assertion:completionBlock:](&v15, "_processRequest:accessRights:assertion:completionBlock:", v17, a4, v18, v16);

    goto LABEL_9;
  }
  -[MTChaperoneParser commandDefaultMDMOptionsCompletionBlock:](self, "commandDefaultMDMOptionsCompletionBlock:", v12);
LABEL_9:

}

- (id)_allCommands
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006988;
  block[3] = &unk_1000107A0;
  block[4] = self;
  if (qword_100014BE0 != -1)
    dispatch_once(&qword_100014BE0, block);
  return (id)qword_100014BC8;
}

- (unint64_t)_profileInstallationStyleForRequest:(id)a3
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", kMCTPRequestTypeKey));
  v4 = objc_msgSend(v3, "isEqualToString:", kMDMPRequestTypeInstallProfileSilent);

  return v4;
}

- (void)_installApplication:(id)a3 completionBlock:(id)a4
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v4 = a4;
  if (v4)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006DEC;
    block[3] = &unk_100010858;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

- (id)_applyRedemptionCode:(id)a3
{
  return +[MTChaperoneParser responseWithStatus:](MTChaperoneParser, "responseWithStatus:", kMCTPStatusCommandFormatError);
}

- (id)_managedApplicationList:(id)a3
{
  return +[MTChaperoneParser responseWithStatus:](MTChaperoneParser, "responseWithStatus:", kMCTPStatusCommandFormatError);
}

- (id)_removeApplication:(id)a3
{
  return +[MTChaperoneParser responseWithStatus:](MTChaperoneParser, "responseWithStatus:", kMCTPStatusCommandFormatError);
}

- (id)_profileList:(id)a3
{
  return -[MTChaperoneParser _profileList:filterFlags:](self, "_profileList:filterFlags:", a3, 85);
}

- (id)_removeProfile:(id)a3
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", kIdentifierKey));
  v5 = (void *)v4;
  if (v4)
  {
    v6 = *(NSObject **)DMCLogObjects(v4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v13 = 138543362;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Chaperone requested removal of profile “%{public}@”", (uint8_t *)&v13, 0xCu);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MDMMCInterface profileIdentifiersWithFilterFlags:](MDMMCInterface, "profileIdentifiersWithFilterFlags:", 69));
    v8 = objc_msgSend(v7, "containsObject:", v5);
    if ((v8 & 1) != 0)
    {
      v9 = objc_claimAutoreleasedReturnValue(-[MTChaperoneParser _removeProfileWithIdentifier:installationType:](self, "_removeProfileWithIdentifier:installationType:", v5, 0));
    }
    else
    {
      v11 = *(NSObject **)DMCLogObjects(v8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Chaperone attempted to remove profile unavailable to Chaperone", (uint8_t *)&v13, 2u);
      }
      v9 = objc_claimAutoreleasedReturnValue(+[MDMParser responseWithStatus:](MDMParser, "responseWithStatus:", kMCTPStatusAcknowledged));
    }
    v10 = (void *)v9;

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MDMParser responseWithStatus:](MDMParser, "responseWithStatus:", kMCTPStatusCommandFormatError));
  }

  return v10;
}

- (id)_requestUnlockToken:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v8;

  if (+[MDMMCInterface isPasscodeSet](MDMMCInterface, "isPasscodeSet", a3))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", DMCKeybagErrorDomain, 37002, 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTChaperoneParser responseWithError:](MTChaperoneParser, "responseWithError:", v3));
  }
  else
  {
    v8 = 0;
    v5 = MDMKeybagCreateSupervisionEscrowWithPasscode(0, &v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v3 = v8;
    if (v6)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTChaperoneParser responseWithStatus:](MTChaperoneParser, "responseWithStatus:", kMCTPStatusAcknowledged));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("UnlockToken"));
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTChaperoneParser responseWithError:](MTChaperoneParser, "responseWithError:", v3));
    }

  }
  return v4;
}

- (id)_clearPasscode:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", kMDMPUnlockTokenKey));
  v14 = 0;
  v4 = MDMKeybagRetrieveSupervisionEscrowSecret(&v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v14;
  v7 = v6;
  if (!v5)
  {
    v9 = v6;
LABEL_6:
    v10 = objc_claimAutoreleasedReturnValue(+[MDMParser responseWithError:](MDMParser, "responseWithError:", v7));
    goto LABEL_7;
  }
  v13 = v6;
  v8 = +[MDMMCInterface clearPasscodeWithEscrowKeybagData:secret:outError:](MDMMCInterface, "clearPasscodeWithEscrowKeybagData:secret:outError:", v3, v5, &v13);
  v9 = v13;

  if ((v8 & 1) == 0)
  {
    v7 = v9;
    goto LABEL_6;
  }
  v10 = objc_claimAutoreleasedReturnValue(+[MDMParser responseWithStatus:](MDMParser, "responseWithStatus:", kMCTPStatusAcknowledged));
LABEL_7:
  v11 = (void *)v10;

  return v11;
}

- (void)commandDefaultMDMOptionsCompletionBlock:(id)a3
{
  void *v3;
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTChaperoneParser responseWithStatus:](MTChaperoneParser, "responseWithStatus:", kMCTPStatusAcknowledged));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MDMOptionsUtilities defaultMDMOptions](MDMOptionsUtilities, "defaultMDMOptions"));
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("DefaultMDMOptions"));
  if (v5)
    v5[2](v5, v3);

}

- (void)commandSetDefaultMDMOptionsRequest:(id)a3 completionBlock:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DefaultMDMOptions")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MDMOptionsUtilities validatedMDMOptionsFromOptionsDictionary:](MDMOptionsUtilities, "validatedMDMOptionsFromOptionsDictionary:", v5));
  +[MDMOptionsUtilities setDefaultMDMOptions:](MDMOptionsUtilities, "setDefaultMDMOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTChaperoneParser responseWithStatus:](MTChaperoneParser, "responseWithStatus:", kMCTPStatusAcknowledged));
  if (v8)
    v8[2](v8, v7);

}

- (BOOL)isKeybagRollingNeeded
{
  void *CFProperty;
  NSObject *v3;
  _DWORD v5[2];

  if (qword_100014BF0 != -1)
    dispatch_once(&qword_100014BF0, &stru_100010878);
  CFProperty = (void *)IORegistryEntryCreateCFProperty(dword_100014BEC, CFSTR("enable-rolld-dev1"), 0, 0);
  v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 67109120;
    v5[1] = CFProperty != 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Is keybag rolling needed: %d", (uint8_t *)v5, 8u);
  }

  return CFProperty != 0;
}

- (void)waitUntilKeybagRollingHasBeenPerformedCompletionBlock:(id)a3 timeRemaining:(double)a4
{
  id v6;
  uint64_t SystemGeneration;
  int v8;
  NSObject *v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  void *v12;
  _BOOL8 v13;
  _BOOL8 v14;
  NSObject *v15;
  dispatch_time_t v16;
  dispatch_queue_global_t v17;
  NSObject *v18;
  NSObject *v19;
  dispatch_queue_global_t v20;
  NSObject *v21;
  NSObject *v22;
  dispatch_queue_global_t v23;
  NSObject *v24;
  dispatch_queue_global_t v25;
  NSObject *v26;
  _QWORD block[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  id v32;
  double v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  int v39;
  uint8_t buf[4];
  int v41;

  v6 = a3;
  v39 = 0;
  SystemGeneration = MKBKeyBagGetSystemGeneration(&v39);
  v8 = SystemGeneration;
  v9 = *(NSObject **)DMCLogObjects(SystemGeneration);
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not get keybag system generation number.", buf, 2u);
    }
    if (v6)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v11 = objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100007AD4;
      block[3] = &unk_100010858;
      v28 = v6;
      dispatch_async(v11, block);

      v12 = v28;
LABEL_26:

    }
  }
  else
  {
    v13 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v13)
    {
      *(_DWORD *)buf = 67109120;
      v41 = v39;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Keybag system generation status: %d", buf, 8u);
    }
    if (!v39 || (v39 & 5) != 0)
    {
      v19 = *(NSObject **)DMCLogObjects(v13);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Keybag system generation is sufficient to proceed.", buf, 2u);
      }
      if (v6)
      {
        v20 = dispatch_get_global_queue(0, 0);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_10000797C;
        v37[3] = &unk_100010858;
        v38 = v6;
        dispatch_async(v21, v37);

        v12 = v38;
        goto LABEL_26;
      }
    }
    else
    {
      v14 = -[MTChaperoneParser isKeybagRollingNeeded](self, "isKeybagRollingNeeded");
      if (!v14)
      {
        v22 = *(NSObject **)DMCLogObjects(v14);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Keybag rolling is not needed.", buf, 2u);
        }
        v23 = dispatch_get_global_queue(0, 0);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_1000079D4;
        v35[3] = &unk_100010858;
        v36 = v6;
        dispatch_async(v24, v35);

        v12 = v36;
        goto LABEL_26;
      }
      v15 = *(NSObject **)DMCLogObjects(v14);
      if (a4 > 0.0)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Polling keybag status...", buf, 2u);
        }
        v16 = dispatch_time(0, 200000000);
        v17 = dispatch_get_global_queue(0, 0);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100007A40;
        v31[3] = &unk_1000108A0;
        v31[4] = self;
        v32 = v6;
        v33 = a4;
        v34 = 0x3FC999999999999ALL;
        dispatch_after(v16, v18, v31);

        v12 = v32;
        goto LABEL_26;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Timed out waiting for keybag migration.", buf, 2u);
      }
      if (v6)
      {
        v25 = dispatch_get_global_queue(0, 0);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_100007A54;
        v29[3] = &unk_100010858;
        v30 = v6;
        dispatch_async(v26, v29);

        v12 = v30;
        goto LABEL_26;
      }
    }
  }

}

- (void)commandProceedWithKeybagMigrationRequest:(id)a3 completionBlock:(id)a4
{
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  id v9;

  v5 = (const __CFString *)kMDMKeybagMigrationHasBeenClearedByHostKey;
  v6 = (const __CFString *)kMDMNotBackedUpPreferencesDomain;
  v7 = (const __CFString *)kMDMPreferencesMobileUserName;
  v9 = a4;
  CFPreferencesSetValue(v5, kCFBooleanTrue, v6, v7, kCFPreferencesAnyHost);
  v8 = CFPreferencesSynchronize(v6, v7, kCFPreferencesAnyHost);
  MDMSendTriggerRollKeybagsNotification(v8);
  -[MTChaperoneParser waitUntilKeybagRollingHasBeenPerformedCompletionBlock:timeRemaining:](self, "waitUntilKeybagRollingHasBeenPerformedCompletionBlock:timeRemaining:", v9, 300.0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iPCUParser, 0);
}

@end
