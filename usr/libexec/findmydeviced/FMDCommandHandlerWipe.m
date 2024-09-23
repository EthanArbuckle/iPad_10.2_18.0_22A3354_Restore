@implementation FMDCommandHandlerWipe

- (void)handleCommand
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  void *v27;
  __CFString *v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  const __CFString *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[3];
  _QWORD v45[3];
  uint8_t buf[4];
  __CFString *v47;
  __int16 v48;
  __CFString *v49;
  _BYTE v50[128];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler fm_logID](self, "fm_logID"));
    *(_DWORD *)buf = 138412290;
    v47 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: Handling a Remote Wipe command from server...", buf, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v13));

        if (CFPropertyListIsValid(v15, kCFPropertyListBinaryFormat_v1_0))
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("commandParams"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "account"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "authId"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("authId"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("mode")));

  if (+[FMDPreferencesMgr simulateWipe](FMDPreferencesMgr, "simulateWipe")
    || objc_msgSend(v20, "isEqualToString:", CFSTR("fake")))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("fake"), CFSTR("wipeMode"));
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("maxDelayInSecs")));
  objc_msgSend(v22, "doubleValue");
  v24 = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("message")));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("ownerNbr")));

  v29 = sub_1000031B8();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v47 = v26;
    v48 = 2112;
    v49 = v28;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Lock screen message : %@, phone number : %@", buf, 0x16u);
  }

  if (-[__CFString length](v26, "length") || -[__CFString length](v28, "length"))
  {
    v31 = sub_1000031B8();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Saving lock screen info to be preserved across wipe", buf, 2u);
    }

    v44[0] = CFSTR("lostModeEnabled");
    v44[1] = CFSTR("lostModeMessage");
    v33 = &stru_1002CD590;
    if (v26)
      v34 = v26;
    else
      v34 = &stru_1002CD590;
    v45[0] = &__kCFBooleanTrue;
    v45[1] = v34;
    v44[2] = CFSTR("lostModeOwnerNumber");
    if (v28)
      v33 = v28;
    v45[2] = v33;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 3));
    +[FMDPreferencesMgr setFMIPWipeLostModeInfo:](FMDPreferencesMgr, "setFMIPWipeLostModeInfo:", v35);

  }
  +[FMDPreferencesMgr setWipeInfo:](FMDPreferencesMgr, "setWipeInfo:", v6);
  +[FMDPreferencesMgr setWipeState:](FMDPreferencesMgr, "setWipeState:", 1);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100018EC8;
  v37[3] = &unk_1002C1C10;
  v37[4] = self;
  v38 = (id)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  v39 = v24;
  v36 = v38;
  +[FMDDispatchTransaction dispatchTransactionAsync:transactionName:block:](FMDDispatchTransaction, "dispatchTransactionAsync:transactionName:block:", &_dispatch_main_q, CFSTR("FMDCommandHandlerWipeDispatchAction"), v37);

}

- (void)sendAckWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

@end
