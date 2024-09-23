@implementation FMDCommandHandlerDataUpdate

- (void)handleCommand
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  id v38;
  id v39;
  NSObject *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *i;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  id v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  _BYTE v81[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", off_1003050E0));
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtConfigurationRegistry sharedInstance](FMDExtConfigurationRegistry, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configurations"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));

    objc_msgSend(v6, "fetchSupportedAccessoryTypes");
    objc_msgSend(v6, "fetchConfigForAccessoryTypes:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", off_1003050B8));
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", off_1003050B0));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", off_1003050C0));

    v17 = objc_opt_class(NSArray, v16);
    if ((objc_opt_isKindOfClass(v13, v17) & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
      v20 = objc_opt_class(FMDFMIPServiceProvider, v19);
      if ((objc_opt_isKindOfClass(v18, v20) & 1) != 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "detachNotificationManager"));
        objc_msgSend(v21, "updateAccessoryIds:version:withCompletion:", v13, v15, 0);

      }
    }

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", off_1003050D0));
  v24 = objc_msgSend(v23, "BOOLValue");

  v25 = sub_1000031B8();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    sub_100229DF4(self, v26);

  if (v24)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", off_1003050C8));

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", off_1003050D8));

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeDataStore sharedInstance](FMDMagSafeDataStore, "sharedInstance"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "readLostModeAccessoriesListVersion"));

    v34 = objc_opt_class(NSArray, v33);
    if ((objc_opt_isKindOfClass(v28, v34) & 1) != 0
      && (objc_msgSend(v30, "isEqualToString:", v32) & 1) == 0)
    {
      v68 = v32;
      v39 = sub_1000031B8();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        sub_100229D70((uint64_t)v30, (uint64_t)v28, v40);

      v41 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeDataStore sharedInstance](FMDMagSafeDataStore, "sharedInstance"));
      v42 = objc_msgSend(v41, "writeLostModeInfo:version:", v28, v30);

      v36 = objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject accessoryRegistry](v36, "accessoryRegistry"));
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "allAccessories"));
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v70;
        while (2)
        {
          for (i = 0; i != v45; i = (char *)i + 1)
          {
            if (*(_QWORD *)v70 != v46)
              objc_enumerationMutation(v43);
            v48 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v48, "connectionState") == (id)1)
            {
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "accessoryIdentifier"));
              v50 = objc_msgSend(v28, "containsObject:", v49);

              if (v50)
              {
                v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
                objc_msgSend(v51, "postNotificationName:object:", CFSTR("com.apple.accessories.connection.passedMFi4Auth"), 0);

                goto LABEL_29;
              }
            }
          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
          if (v45)
            continue;
          break;
        }
      }
LABEL_29:

      v32 = v68;
    }
    else
    {
      v35 = sub_1000031B8();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v74 = v28;
        v75 = 2112;
        v76 = (id)objc_opt_class(v28, v37);
        v77 = 2112;
        v78 = v32;
        v79 = 2112;
        v80 = v30;
        v38 = v76;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "lostModeInfo got unexpected info = %@, %@, cachedVersion = %@, newVersion = %@", buf, 0x2Au);

      }
    }

  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKey:", off_1003050F0));

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v55 = v54;
  if (!v53)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKey:", off_1003050E8));

    if (!v59)
    {
LABEL_45:

      goto LABEL_46;
    }
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLocalActivationLockInfoManager sharedInstance](FMDLocalActivationLockInfoManager, "sharedInstance"));
    v64 = v63;
    goto LABEL_40;
  }
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKey:", off_1003050F0));
  v57 = objc_msgSend(v56, "BOOLValue");

  if (v57)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKey:", off_1003050E8));

    v62 = v59
       && (v61 = objc_opt_class(NSNull, v60), (objc_opt_isKindOfClass(v59, v61) & 1) == 0)
       && objc_msgSend(v59, "length") != 0;
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLocalActivationLockInfoManager sharedInstance](FMDLocalActivationLockInfoManager, "sharedInstance"));
    v64 = v63;
    if (!v62)
    {
      v65 = sub_1000031B8();
      v66 = objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Clearing maskedAppleID via dataUpdate command", buf, 2u);
      }

      objc_msgSend(v64, "clearMaskedAppleIDValue");
      goto LABEL_44;
    }
LABEL_40:
    objc_msgSend(v63, "updateMaskedAppleID:", v59);
LABEL_44:

    goto LABEL_45;
  }
LABEL_46:
  -[FMDCommandHandler didHandleCommandWithAckData:](self, "didHandleCommandWithAckData:", 0);
}

- (void)sendAckWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  FMDRequestAckDataUpdate *v9;
  void *v10;
  void *v11;
  FMDRequestAckDataUpdate *v12;
  id v13;
  uint8_t v14[8];
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ackURL")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
    v9 = [FMDRequestAckDataUpdate alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "account"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v12 = -[FMDRequestAckDataUpdate initWithAccount:dataUpdateCommand:ackURL:](v9, "initWithAccount:dataUpdateCommand:ackURL:", v10, v11, v8);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100064120;
    v15[3] = &unk_1002C1130;
    v16 = v4;
    -[FMDRequest setCompletionHandler:](v12, "setCompletionHandler:", v15);
    objc_msgSend(v7, "enqueueRequest:", v12);

  }
  else
  {
    v13 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not acking the dataUpdate command because there is no ack URL", v14, 2u);
    }
  }

}

@end
