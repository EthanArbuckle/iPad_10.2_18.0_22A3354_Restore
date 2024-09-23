@implementation SMCarPlayAlertManager

- (SMCarPlayAlertManager)initWithQueue:(id)a3 defaultsManager:(id)a4 contactsManager:(id)a5 starkManager:(id)a6
{
  OS_dispatch_queue *v10;
  id v11;
  id v12;
  id v13;
  SMCarPlayAlertManager *v14;
  SMCarPlayAlertManager *v15;
  objc_super v17;

  v10 = (OS_dispatch_queue *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SMCarPlayAlertManager;
  v14 = -[SMCarPlayAlertManager init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_queue = v10;
    objc_storeStrong((id *)&v14->_defaultsManager, a4);
    objc_storeStrong((id *)&v15->_contactsManager, a5);
    objc_storeStrong((id *)&v15->_starkManager, a6);
  }

  return v15;
}

- (void)postCarPlayNotificationForNotificationType:(unint64_t)a3 sessionManagerState:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  unint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0D8B9E0], "carPlayNotificationTypeToString:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", objc_msgSend(v8, "sessionState"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v22 = "-[SMCarPlayAlertManager postCarPlayNotificationForNotificationType:sessionManagerState:handler:]";
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, trying to post to CarPlay, notificationType, %@, sessionManagerState, %@", buf, 0x20u);

  }
  v13 = (void *)objc_msgSend(v8, "copy");
  -[SMCarPlayAlertManager starkManager](self, "starkManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __96__SMCarPlayAlertManager_postCarPlayNotificationForNotificationType_sessionManagerState_handler___block_invoke;
  v17[3] = &unk_1E9297F58;
  v17[4] = self;
  v18 = v13;
  v19 = v9;
  v20 = a3;
  v15 = v9;
  v16 = v13;
  objc_msgSend(v14, "fetchConnectionStateWithHandler:", v17);

}

void __96__SMCarPlayAlertManager_postCarPlayNotificationForNotificationType_sessionManagerState_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96__SMCarPlayAlertManager_postCarPlayNotificationForNotificationType_sessionManagerState_handler___block_invoke_2;
  v11[3] = &unk_1E9297E20;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v5;
  v13 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  v16 = a2;
  v17 = v9;
  v14 = v8;
  v15 = *(id *)(a1 + 48);
  v10 = v5;
  dispatch_async(v6, v11);

}

void __96__SMCarPlayAlertManager_postCarPlayNotificationForNotificationType_sessionManagerState_handler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    +[RTStarkManager connectionStateToString:](RTStarkManager, "connectionStateToString:", *(_QWORD *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v12 = "-[SMCarPlayAlertManager postCarPlayNotificationForNotificationType:sessionManagerState:handler:]_block_invoke_2";
    v13 = 2112;
    v14 = v3;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s, carPlay connected, %@, error, %@", buf, 0x20u);

  }
  if (*(_QWORD *)(a1 + 64) == 1)
  {
    v5 = *(_QWORD *)(a1 + 72);
    v6 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __96__SMCarPlayAlertManager_postCarPlayNotificationForNotificationType_sessionManagerState_handler___block_invoke_13;
    v8[3] = &unk_1E92971A0;
    v10 = v5;
    v9 = *(id *)(a1 + 56);
    objc_msgSend(v6, "_postCarPlayNotificationForNotificationType:sessionManagerState:handler:", v5, v7, v8);

  }
}

void __96__SMCarPlayAlertManager_postCarPlayNotificationForNotificationType_sessionManagerState_handler___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0D8B9E0], "carPlayNotificationTypeToString:", *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("NO");
    v9 = 136315906;
    v10 = "-[SMCarPlayAlertManager postCarPlayNotificationForNotificationType:sessionManagerState:handler:]_block_invoke";
    if (!v3)
      v7 = CFSTR("YES");
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%s, posted carplay notification, type, %@, status, %@, error, %@", (uint8_t *)&v9, 0x2Au);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, BOOL, id))(v8 + 16))(v8, v3 == 0, v3);

}

- (void)_postCarPlayNotificationForNotificationType:(unint64_t)a3 sessionManagerState:(id)a4 handler:(id)a5
{
  id v8;
  void (**v9)(id, id);
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  RTUserNotificationAction *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  RTUserNotification *v37;
  RTUserNotification *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, id))a5;
  v47 = 0;
  -[SMCarPlayAlertManager _getCarPlayDisplayNameFromSessionManagerState:error:](self, "_getCarPlayDisplayNameFromSessionManagerState:error:", v8, &v47);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v47;
  if (v11)
  {
    v12 = v11;
    v9[2](v9, v11);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0D8B9E0];
    objc_msgSend(v8, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(v13, "getCarPlayNotificationTitleForNotificationType:sessionType:contactName:error:", a3, objc_msgSend(v14, "sessionType"), v10, &v46);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v46;

    if (v12)
    {
      v9[2](v9, v12);
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0D8B9E0];
      objc_msgSend(v8, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "sessionType");
      objc_msgSend(v8, "cacheReleaseDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      objc_msgSend(v16, "getCarPlayNotificationMessageForNotificationType:sessionType:contactName:cacheReleaseDate:error:", a3, v18, v10, v19, &v45);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v45;

      if (v12)
      {
        v9[2](v9, v12);
      }
      else
      {
        v21 = (void *)MEMORY[0x1E0D8B9E0];
        objc_msgSend(v8, "configuration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0;
        objc_msgSend(v21, "getCarPlayNotificationCategoryForNotificationType:sessionType:error:", a3, objc_msgSend(v22, "sessionType"), &v44);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v44;

        if (v12)
        {
          v9[2](v9, v12);
        }
        else
        {
          v24 = (void *)MEMORY[0x1E0D8B9E0];
          objc_msgSend(v8, "configuration");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 0;
          objc_msgSend(v24, "getCarPlayButtonActionIdentifierForNotificationType:sessionType:error:", a3, objc_msgSend(v25, "sessionType"), &v43);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v43;

          if (v12)
          {
            v9[2](v9, v12);
          }
          else
          {
            v26 = (void *)MEMORY[0x1E0D8B9E0];
            objc_msgSend(v8, "configuration");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = 0;
            objc_msgSend(v26, "getCarPlayButtonTitleForNotificationType:sessionType:error:", a3, objc_msgSend(v27, "sessionType"), &v42);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v42;

            if (v12)
            {
              v9[2](v9, v12);
            }
            else
            {
              v40 = (void *)objc_opt_new();
              if (v41 && v28)
              {
                v29 = -[RTUserNotificationAction initWithActionIdentifier:title:iconWithSystemImageName:handler:]([RTUserNotificationAction alloc], "initWithActionIdentifier:title:iconWithSystemImageName:handler:", v41, v28, 0, 0);
                objc_msgSend(v40, "addObject:", v29);

              }
              v39 = v28;
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                v31 = objc_msgSend(v40, "count");
                *(_DWORD *)buf = 136316418;
                v49 = "-[SMCarPlayAlertManager _postCarPlayNotificationForNotificationType:sessionManagerState:handler:]";
                v50 = 2112;
                v51 = v15;
                v52 = 2112;
                v53 = v20;
                v54 = 2048;
                v55 = v31;
                v56 = 2112;
                v57 = v41;
                v58 = 2112;
                v59 = v39;
                _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "%s, creating carplay notification with title, %@, message, %@, buttonActions count, %lu, first carPlayButtonActionIdentifier, %@, carPlayButtonTitle, %@", buf, 0x3Eu);
              }

              v37 = [RTUserNotification alloc];
              v36 = *MEMORY[0x1E0D8BBD0];
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "UUIDString");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = -[RTUserNotification initWithBundleIdentifier:notificationUUIDString:](v37, "initWithBundleIdentifier:notificationUUIDString:", v36, v33);

              LOBYTE(v32) = v41 == (void *)*MEMORY[0x1E0D8BB38];
              -[SMCarPlayAlertManager _getCarPlayUserInfoForSessionManagerState:](self, "_getCarPlayUserInfoForSessionManagerState:", v8);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              LOWORD(v35) = v32;
              -[RTUserNotification postNotificationWithTitle:subtitle:body:footer:defaultActionUrl:categoryIdentifier:interruptionLevel:destination:actions:suppressDismissActionInCarPlay:preventAutomaticRemoval:expirationDate:userInfo:handler:](v38, "postNotificationWithTitle:subtitle:body:footer:defaultActionUrl:categoryIdentifier:interruptionLevel:destination:actions:suppressDismissActionInCarPlay:preventAutomaticRemoval:expirationDate:userInfo:handler:", v15, v20, v20, 0, 0, v23, 3, 8, v40, v35, 0, v34, v9);

              v28 = v39;
            }

          }
        }

      }
    }

  }
}

- (id)_getCarPlayUserInfoForSessionManagerState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D8BB48], *MEMORY[0x1E0D8BB40]);
  objc_msgSend(v3, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D8BB50]);

  return v4;
}

- (id)_getCarPlayDisplayNameFromSessionManagerState:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_class *v47;
  id v48;
  void *v49;
  objc_class *v50;
  id v51;
  void *v52;
  void *v53;
  void *v56;
  _QWORD v58[4];
  NSObject *v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  _BYTE buf[12];
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  _QWORD v79[4];

  v79[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "receiverPrimaryHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") != 1)
  {
    objc_msgSend(v4, "configuration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "conversation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "displayName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = v30;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("group"), CFSTR("group"), 0);
      v31 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_29;
  }
  objc_msgSend(v7, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__77;
  v72 = __Block_byref_object_dispose__77;
  v73 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__77;
  v66 = __Block_byref_object_dispose__77;
  v67 = 0;
  v9 = dispatch_semaphore_create(0);
  -[SMCarPlayAlertManager contactsManager](self, "contactsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __77__SMCarPlayAlertManager__getCarPlayDisplayNameFromSessionManagerState_error___block_invoke;
  v58[3] = &unk_1E9296EE0;
  v60 = &v68;
  v61 = &v62;
  v11 = v9;
  v59 = v11;
  objc_msgSend(v10, "fetchContactsFromEmailOrPhoneNumberString:handler:", v8, v58);
  v56 = v8;

  v12 = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14))
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", v13);
  v17 = v16;
  v18 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_63);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v24 = (void *)MEMORY[0x1E0CB35C8];
  v79[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v79, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = objc_retainAutorelease(v26);

  }
  else
  {
LABEL_9:
    v27 = 0;
  }

  v32 = v27;
  v33 = v32;
  if (a4 && v32)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v47 = (objc_class *)objc_opt_class();
      NSStringFromClass(v47);
      v48 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v48;
      v75 = 2112;
      v76 = v49;
      v77 = 2112;
      v78 = v33;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v35 = objc_retainAutorelease(v33);
LABEL_20:
    v37 = 0;
    v31 = v56;
    *a4 = v35;
    goto LABEL_28;
  }
  if (a4 && v63[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v50 = (objc_class *)objc_opt_class();
      NSStringFromClass(v50);
      v51 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)v63[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v51;
      v75 = 2112;
      v76 = v52;
      v77 = 2112;
      v78 = v53;
      _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v35 = objc_retainAutorelease((id)v63[5]);
    goto LABEL_20;
  }
  if (objc_msgSend((id)v69[5], "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3850], "sharedNameComponents");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v69[5], "firstObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "givenName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setGivenName:", v41);

    objc_msgSend((id)v69[5], "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "familyName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setFamilyName:", v43);

    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v39, 1, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v56;
    if (objc_msgSend(v44, "length"))
    {
      v31 = v44;

    }
    v37 = 1;
  }
  else
  {
    v37 = 1;
    v31 = v56;
  }
LABEL_28:

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  if ((v37 & 1) == 0)
  {
    v45 = 0;
    goto LABEL_31;
  }
LABEL_29:
  v31 = v31;
  v45 = v31;
LABEL_31:

  return v45;
}

void __77__SMCarPlayAlertManager__getCarPlayDisplayNameFromSessionManagerState_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTStarkManager)starkManager
{
  return self->_starkManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_starkManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
}

@end
