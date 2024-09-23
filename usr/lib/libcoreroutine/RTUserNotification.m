@implementation RTUserNotification

- (RTUserNotification)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBundleIdentifier_notificationUUIDString_);
}

- (RTUserNotification)initWithBundleIdentifier:(id)a3 notificationUUIDString:(id)a4
{
  id v8;
  id v9;
  void *v10;
  RTUserNotification *v11;
  id *p_isa;
  NSObject *v13;
  objc_class *v14;
  char *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  NSObject *v23;
  RTUserNotification *v24;
  id v25;
  dispatch_queue_t v26;
  id v27;
  objc_super v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
LABEL_12:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[RTUserNotification initWithBundleIdentifier:notificationUUIDString:]";
      v32 = 1024;
      LODWORD(v33) = 52;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationUUIDString (in %s:%d)", buf, 0x12u);
    }

    if (v8)
      goto LABEL_4;
LABEL_15:
    v24 = 0;
    goto LABEL_19;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[RTUserNotification initWithBundleIdentifier:notificationUUIDString:]";
    v32 = 1024;
    LODWORD(v33) = 51;
    _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: bundleIdentifier (in %s:%d)", buf, 0x12u);
  }

  if (!v10)
    goto LABEL_12;
LABEL_3:
  if (!v8)
    goto LABEL_15;
LABEL_4:
  v29.receiver = self;
  v29.super_class = (Class)RTUserNotification;
  v11 = -[RTUserNotification init](&v29, sel_init);
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bundleIdentifier, a3);
    objc_storeStrong(p_isa + 3, a4);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v15;
      v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, %@, creating notification center", buf, 0x16u);

    }
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", v8);
    v18 = p_isa[1];
    p_isa[1] = (id)v17;

    objc_msgSend(p_isa[1], "setDelegate:", p_isa);
    objc_msgSend(p_isa[1], "setWantsNotificationResponsesDelivered");
    v19 = p_isa;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = (const char *)objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v19);
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = (const char *)objc_msgSend(v25, "UTF8String");

    }
    v26 = dispatch_queue_create(v21, v20);

    v27 = v19[5];
    v19[5] = v26;

  }
  self = p_isa;
  v24 = self;
LABEL_19:

  return v24;
}

- (void)postNotificationWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 footer:(id)a6 defaultActionUrl:(id)a7 categoryIdentifier:(id)a8 interruptionLevel:(unint64_t)a9 destination:(unint64_t)a10 actions:(id)a11 suppressDismissActionInCarPlay:(BOOL)a12 preventAutomaticRemoval:(BOOL)a13 expirationDate:(id)a14 userInfo:(id)a15 handler:(id)a16
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  SEL v51;
  NSObject *v52;
  objc_class *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  const __CFString *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id obj;
  _QWORD v76[4];
  id v77;
  id v78;
  RTUserNotification *v79;
  id v80;
  id v81;
  uint64_t v82;
  SEL v83;
  unint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  const __CFString *v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v23 = a4;
  v24 = a5;
  v25 = a6;
  v74 = a7;
  v73 = a8;
  v26 = a11;
  v27 = a14;
  v28 = a15;
  v65 = a16;
  v29 = (void *)objc_opt_new();
  v30 = v29;
  if (v22)
    objc_msgSend(v29, "setTitle:", v22);
  if (v23)
    objc_msgSend(v30, "setSubtitle:", v23);
  if (v24)
    objc_msgSend(v30, "setBody:", v24);
  if (v25)
    objc_msgSend(v30, "setFooter:", v25);
  v69 = v25;
  if (v73)
    objc_msgSend(v30, "setCategoryIdentifier:");
  v70 = v24;
  if (v28)
    objc_msgSend(v30, "setUserInfo:", v28);
  v67 = v28;
  if (v74)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v74);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setDefaultActionURL:", v31);

    objc_msgSend(v30, "userInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (!v32)
      v32 = (void *)MEMORY[0x1E0C9AA70];
    v34 = (void *)objc_msgSend(v32, "mutableCopy");

    objc_msgSend(v34, "setObject:forKeyedSubscript:", v74, CFSTR("defaultActionURLString"));
    v35 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v30, "setUserInfo:", v35);

  }
  v71 = v23;
  v72 = v22;
  -[RTUserNotification bundleIdentifier](self, "bundleIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setDefaultActionBundleIdentifier:", v36);

  objc_msgSend(v30, "setInterruptionLevel:", objc_msgSend((id)objc_opt_class(), "UNNotificationInterruptionLevelFromRTNotificationInterruptionLevel:", a9));
  objc_msgSend(MEMORY[0x1E0CEC760], "defaultSound");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSound:", v37);

  if (v27)
    objc_msgSend(v30, "setExpirationDate:", v27);
  v64 = v30;
  v68 = v27;
  v38 = (void *)objc_opt_new();
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v26;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v86 != v41)
          objc_enumerationMutation(obj);
        v43 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        v44 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend((id)objc_opt_class(), "_getUNNotificationActionFromRTUserNotificationAction:", v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTUserNotification actionIdentifierToActionMapper](self, "actionIdentifierToActionMapper");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "actionIdentifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setObject:forKeyedSubscript:", v43, v47);

        objc_msgSend(v38, "addObject:", v45);
        objc_autoreleasePoolPop(v44);
      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
    }
    while (v40);
  }

  if (a13)
    v48 = 131073;
  else
    v48 = 1;
  v49 = a10;
  if ((a10 & 8) != 0)
  {
    if (a12)
      v48 = 1101004806;
    else
      v48 = 27262982;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v52 = objc_claimAutoreleasedReturnValue();
    v51 = a2;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "destinationToString:", 8);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(obj, "count");
      *(_DWORD *)buf = 138413314;
      v58 = CFSTR("NO");
      v90 = v54;
      v91 = 2112;
      if (a12)
        v58 = CFSTR("YES");
      v92 = v55;
      v93 = 2112;
      v94 = v56;
      v95 = 2048;
      v96 = v57;
      v97 = 2112;
      v98 = v58;
      _os_log_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_INFO, "%@, %@, one of the destinations, %@, actions count, %lu, suppressDismissAction, %@", buf, 0x34u);

      v49 = a10;
    }

    v50 = v68;
  }
  else
  {
    v50 = v68;
    v51 = a2;
  }
  -[RTUserNotification notificationCenter](self, "notificationCenter");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __230__RTUserNotification_postNotificationWithTitle_subtitle_body_footer_defaultActionUrl_categoryIdentifier_interruptionLevel_destination_actions_suppressDismissActionInCarPlay_preventAutomaticRemoval_expirationDate_userInfo_handler___block_invoke;
  v76[3] = &unk_1E929CE38;
  v77 = v73;
  v78 = v38;
  v79 = self;
  v80 = v64;
  v83 = v51;
  v84 = v49;
  v81 = v65;
  v82 = v48;
  v60 = v65;
  v61 = v64;
  v62 = v38;
  v63 = v73;
  objc_msgSend(v59, "getNotificationCategoriesWithCompletionHandler:", v76);

}

void __230__RTUserNotification_postNotificationWithTitle_subtitle_body_footer_defaultActionUrl_categoryIdentifier_interruptionLevel_destination_actions_suppressDismissActionInCarPlay_preventAutomaticRemoval_expirationDate_userInfo_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CEC720], "categoryWithIdentifier:actions:intentIdentifiers:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 72));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __230__RTUserNotification_postNotificationWithTitle_subtitle_body_footer_defaultActionUrl_categoryIdentifier_interruptionLevel_destination_actions_suppressDismissActionInCarPlay_preventAutomaticRemoval_expirationDate_userInfo_handler___block_invoke_2;
    v21[3] = &unk_1E929CE10;
    v22 = *(id *)(a1 + 32);
    objc_msgSend(v3, "objectsPassingTest:", v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v5, "setByAddingObjectsFromSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v24 = v19;
    v25 = 2112;
    v26 = v20;
    v27 = 2112;
    v28 = v5;
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v7;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "%@, %@, updating notification categories, newCategories, %@, existingCategories, %@, supersetCategories, %@", buf, 0x34u);

  }
  objc_msgSend(*(id *)(a1 + 48), "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNotificationCategories:", v7);

  v10 = (void *)MEMORY[0x1E0CEC740];
  objc_msgSend(*(id *)(a1 + 48), "notificationUUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestWithIdentifier:content:trigger:destinations:", v11, *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 88));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v24 = v15;
    v25 = 2112;
    v26 = v16;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, %@, posting notification request, %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 48), "notificationCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addNotificationRequest:withCompletionHandler:", v12, *(_QWORD *)(a1 + 64));

}

uint64_t __230__RTUserNotification_postNotificationWithTitle_subtitle_body_footer_defaultActionUrl_categoryIdentifier_interruptionLevel_destination_actions_suppressDismissActionInCarPlay_preventAutomaticRemoval_expirationDate_userInfo_handler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

- (BOOL)deleteNotificationWithError:(id *)a3
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTUserNotification notificationUUIDString](self, "notificationUUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, %@, removing notification immediately for notificationUUID, %@", buf, 0x20u);

  }
  -[RTUserNotification notificationCenter](self, "notificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTUserNotification notificationUUIDString](self, "notificationUUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeDeliveredNotificationsWithIdentifiers:", v12);

  return 1;
}

+ (id)interruptionLevelToString:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("Default");
  else
    return off_1E929CE58[a3 - 1];
}

+ (id)destinationToString:(unint64_t)a3
{
  if (a3 - 1 > 7)
    return CFSTR("None");
  else
    return off_1E929CE78[a3 - 1];
}

+ (unint64_t)UNNotificationInterruptionLevelFromRTNotificationInterruptionLevel:(unint64_t)a3
{
  if (a3 > 4)
    return 0;
  else
    return qword_1D1EED5D8[a3];
}

+ (id)_getUNNotificationActionFromRTUserNotificationAction:(id)a3
{
  id v3;
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

  v3 = a3;
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CEC700];
  objc_msgSend(v3, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CEC710];
    objc_msgSend(v3, "iconWithSystemImageName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "iconWithSystemImageName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionWithIdentifier:title:url:options:icon:", v6, v7, v8, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CEC710];
    objc_msgSend(v3, "iconWithSystemImageName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "iconWithSystemImageName:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionWithIdentifier:title:options:icon:", v6, v7, 0, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundle identifier, %@"), self->_bundleIdentifier);
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, call before presenting notification", (uint8_t *)&v10, 0x16u);

  }
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  RTUserNotification *v17;
  void *v18;
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
  NSObject *v29;
  _BOOL4 v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void (**v38)(_QWORD, _QWORD, _QWORD, _QWORD);
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  const char *v43;
  objc_class *v44;
  objc_class *v45;
  void (**v46)(_QWORD);
  const char *v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD))a5;
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v48 = v9;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "notification");
    v46 = v11;
    v47 = a2;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "request");
    v17 = self;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "content");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "title");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v50 = v14;
    v51 = 2112;
    v52 = v15;
    v53 = 2112;
    v54 = v20;
    v55 = 2112;
    v56 = v21;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, %@, response from notification with title, %@, actionIdentifier, %@", buf, 0x2Au);

    self = v17;
    v11 = v46;
    a2 = v47;

    v9 = v48;
  }

  -[RTUserNotification actionIdentifierToActionMapper](self, "actionIdentifierToActionMapper");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[RTUserNotification actionIdentifierToActionMapper](self, "actionIdentifierToActionMapper");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
    if (v28)
    {
      if (v30)
      {
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "actionIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v50 = v32;
        v51 = 2112;
        v52 = v33;
        v53 = 2112;
        v54 = v34;
        _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "%@, %@, executing handler for actionIdentifier, %@", buf, 0x20u);

      }
      -[RTUserNotification actionIdentifierToActionMapper](self, "actionIdentifierToActionMapper");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "actionIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handler");
      v38 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, id, _QWORD))v38)[2](v38, v9, v10, 0);

      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "actionIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v50 = v40;
        v51 = 2112;
        v52 = v41;
        v53 = 2112;
        v54 = v42;
        v43 = "%@, %@, completed handler execution for actionIdentifier, %@";
LABEL_13:
        _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, v43, buf, 0x20u);

      }
    }
    else if (v30)
    {
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "actionIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v50 = v40;
      v51 = 2112;
      v52 = v41;
      v53 = 2112;
      v54 = v42;
      v43 = "%@, %@, missing handler for actionIdentifier, %@";
      goto LABEL_13;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "actionIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v50 = v40;
      v51 = 2112;
      v52 = v41;
      v53 = 2112;
      v54 = v42;
      v43 = "%@, %@, mapper doesn't have an entry for the actionIdentifier, %@";
      goto LABEL_13;
    }
  }

  v11[2](v11);
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSString)notificationUUIDString
{
  return self->_notificationUUIDString;
}

- (void)setNotificationUUIDString:(id)a3
{
  objc_storeStrong((id *)&self->_notificationUUIDString, a3);
}

- (NSMutableDictionary)actionIdentifierToActionMapper
{
  return self->_actionIdentifierToActionMapper;
}

- (void)setActionIdentifierToActionMapper:(id)a3
{
  objc_storeStrong((id *)&self->_actionIdentifierToActionMapper, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_actionIdentifierToActionMapper, 0);
  objc_storeStrong((id *)&self->_notificationUUIDString, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
