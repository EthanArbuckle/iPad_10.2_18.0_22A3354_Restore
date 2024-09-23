@implementation RTContactsManager

+ (unint64_t)labelStringToAddressLabelType:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C97000]) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96FF8]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C97070]) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C97060]))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (RTContactsManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDataProtectionManager_mapServiceManager_distanceCalculator_);
}

- (RTContactsManager)initWithDataProtectionManager:(id)a3 mapServiceManager:(id)a4 distanceCalculator:(id)a5
{
  id v9;
  id v10;
  id v11;
  RTContactsManager *v12;
  RTContactsManager *v13;
  id *p_isa;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_12:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTContactsManager initWithDataProtectionManager:mapServiceManager:distanceCalculator:]";
      v22 = 1024;
      v23 = 142;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapServiceManager (in %s:%d)", buf, 0x12u);
    }

    if (v11)
      goto LABEL_4;
    goto LABEL_15;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[RTContactsManager initWithDataProtectionManager:mapServiceManager:distanceCalculator:]";
    v22 = 1024;
    v23 = 141;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dataProtectionManager (in %s:%d)", buf, 0x12u);
  }

  if (!v10)
    goto LABEL_12;
LABEL_3:
  if (v11)
  {
LABEL_4:
    v12 = 0;
    if (v9 && v10)
    {
      v19.receiver = self;
      v19.super_class = (Class)RTContactsManager;
      v13 = -[RTNotifier init](&v19, sel_init);
      p_isa = (id *)&v13->super.super.super.isa;
      if (v13)
      {
        objc_storeStrong((id *)&v13->_dataProtectionManager, a3);
        objc_storeStrong(p_isa + 6, a4);
        objc_storeStrong(p_isa + 7, a5);
        objc_msgSend(p_isa, "setup");
      }
      self = p_isa;
      v12 = self;
    }
    goto LABEL_18;
  }
LABEL_15:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[RTContactsManager initWithDataProtectionManager:mapServiceManager:distanceCalculator:]";
    v22 = 1024;
    v23 = 143;
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator (in %s:%d)", buf, 0x12u);
  }

  v12 = 0;
LABEL_18:

  return v12;
}

- (void)_setup
{
  void *v3;
  void *v4;

  -[RTContactsManager dataProtectionManager](self, "dataProtectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTDataProtectionManagerNotificationUnlockedSinceBoot, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:", self, sel_onDataProtectionNotification_, v4);

  -[RTContactsManager setAvailable:](self, "setAvailable:", 0);
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[RTContactsManager dataProtectionManager](self, "dataProtectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[RTContactsManager setAvailable:](self, "setAvailable:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    v6 = v7;
  }

}

- (id)_contactColumnKeysToFetch
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C96780];
  v6[0] = *MEMORY[0x1E0C966D0];
  v6[1] = v2;
  v3 = *MEMORY[0x1E0C967F0];
  v6[2] = *MEMORY[0x1E0C966C0];
  v6[3] = v3;
  v4 = *MEMORY[0x1E0C966A8];
  v6[4] = *MEMORY[0x1E0C967C0];
  v6[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_getMeCardWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  if (v5)
  {
    -[RTContactsManager _contactColumnKeysToFetch](self, "_contactColumnKeysToFetch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v5, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v6, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;

    if (a3)
    {
      v8 = objc_retainAutorelease(v8);
      *a3 = v8;
    }
  }
  else
  {
    if (!a3)
    {
      v7 = 0;
      goto LABEL_9;
    }
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = CFSTR("Unable to create a contact store to get the 'Me' card.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 0, v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = *a3;
      *(_DWORD *)buf = 138412290;
      v14 = v11;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v7 = 0;
  }

LABEL_9:
  return v7;
}

- (void)setMeCard:(id)a3
{
  CNContact *v5;
  CNContact **p_meCard;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (CNContact *)a3;
  p_meCard = &self->_meCard;
  if (*p_meCard != v5 && (-[CNContact isEqual:](*p_meCard, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)p_meCard, a3);
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[CNContact _rt_toString](*p_meCard, "_rt_toString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContact postalAddresses](*p_meCard, "postalAddresses");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v8;
      v13 = 2048;
      v14 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "set meCard, %@, postal addresses, %lu", (uint8_t *)&v11, 0x16u);

    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      -[CNContact postalAddresses](*p_meCard, "postalAddresses");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", &__block_literal_global_83);

    }
  }

}

void __31__RTContactsManager_setMeCard___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityContacts);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = a3 + 1;
    v7 = (void *)MEMORY[0x1E0C97338];
    objc_msgSend(v4, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForLabel:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_rt_toString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218498;
    v13 = v6;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%lu, label, %@, address, %@", (uint8_t *)&v12, 0x20u);

  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v8) == 1)
  {
    +[RTNotification notificationName](RTContactsManagerContactStoreDidChangeNotification, "notificationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = (_QWORD *)MEMORY[0x1E0C96870];
LABEL_6:
      objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_onContactStoreNotification_, *v13, 0);

      goto LABEL_10;
    }
    +[RTNotification notificationName](RTContactsManagerContactStoreMeContactDidChangeNotification, "notificationName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v8, "isEqualToString:", v14);

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = (_QWORD *)MEMORY[0x1E0C96878];
      goto LABEL_6;
    }
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412802;
      v21 = v17;
      v22 = 2112;
      v23 = v8;
      v24 = 2112;
      v25 = v19;
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@, observer, %@", (uint8_t *)&v20, 0x20u);

    }
  }
LABEL_10:

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v8))
  {
    +[RTNotification notificationName](RTContactsManagerContactStoreDidChangeNotification, "notificationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10
      || (+[RTNotification notificationName](RTContactsManagerContactStoreMeContactDidChangeNotification, "notificationName"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v12 = objc_msgSend(v8, "isEqualToString:", v11), v11, v12))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObserver:name:object:", self, *MEMORY[0x1E0C96870], 0);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityContacts);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412802;
        v19 = v15;
        v20 = 2112;
        v21 = v8;
        v22 = 2112;
        v23 = v17;
        _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@, observer, %@", (uint8_t *)&v18, 0x20u);

      }
    }
  }

}

- (void)onContactStoreNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__RTContactsManager_onContactStoreNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __48__RTContactsManager_onContactStoreNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onContactStoreNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onContactStoreNotification:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  NSObject *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityContacts);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v8 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v7;
    v33 = 2112;
    v34 = v8;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, recieved notification, %@", buf, 0x16u);

  }
  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C96870]);

  if (v10)
  {
    v11 = (void *)objc_opt_new();
    -[RTNotifier postNotification:](self, "postNotification:", v11);

    v30 = 0;
    -[RTContactsManager _getMeCardWithError:](self, "_getMeCardWithError:", &v30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v30;
    if (v13)
      goto LABEL_5;
    -[RTContactsManager meCard](self, "meCard");
    v25 = objc_claimAutoreleasedReturnValue();
    if ((void *)v25 == v12)
    {

    }
    else
    {
      v26 = (void *)v25;
      -[RTContactsManager meCard](self, "meCard");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqual:", v12);

      if (!v28)
        goto LABEL_17;
    }
LABEL_5:
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v12, "_rt_toString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v15;
      v33 = 2112;
      v34 = v13;
LABEL_22:
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "no change to meCard, %@, error, %@", buf, 0x16u);

      goto LABEL_23;
    }
    goto LABEL_23;
  }
  objc_msgSend(v5, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0C96878]);

  if (v17)
  {
    v29 = 0;
    -[RTContactsManager _getMeCardWithError:](self, "_getMeCardWithError:", &v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v29;
    v13 = v18;
    if (!v18 || -[NSObject code](v18, "code") == 200)
    {
      -[RTContactsManager meCard](self, "meCard");
      v19 = objc_claimAutoreleasedReturnValue();
      if ((void *)v19 == v12)
      {

      }
      else
      {
        v20 = (void *)v19;
        -[RTContactsManager meCard](self, "meCard");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqual:", v12);

        if (!v22)
        {
LABEL_17:
          -[RTContactsManager setMeCard:](self, "setMeCard:", v12);
          v14 = objc_opt_new();
          -[RTNotifier postNotification:](self, "postNotification:", v14);
          goto LABEL_23;
        }
      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v12, "_rt_toString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v15;
      v33 = 2112;
      v34 = v13;
      goto LABEL_22;
    }
LABEL_23:

    goto LABEL_24;
  }
  _rt_log_facility_get_os_log(RTLogFacilityContacts);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v24 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v23;
    v33 = 2112;
    v34 = v24;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, unsupported notification, %@", buf, 0x16u);

  }
LABEL_24:

}

- (void)_fetchMeCardWithHandler:(id)a3
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *, _QWORD))a3;
  if (v5)
  {
    if (-[RTContactsManager available](self, "available"))
    {
      v17 = 0;
      -[RTContactsManager _getMeCardWithError:](self, "_getMeCardWithError:", &v17);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v17;
      _rt_log_facility_get_os_log(RTLogFacilityContacts);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_rt_toString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v19 = v9;
        v20 = 2112;
        v21 = v10;
        v22 = 2112;
        v23 = v7;
        _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, meCard, %@, error, %@", buf, 0x20u);

      }
      -[RTContactsManager setMeCard:](self, "setMeCard:", v6);

      -[RTContactsManager meCard](self, "meCard");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[RTContactsManager meCard](self, "meCard");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTContactsManager _getRTContactFromCNContact:](self, "_getRTContactFromCNContact:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
      }
      v5[2](v5, v13, 0);
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0D18598];
      v24 = *MEMORY[0x1E0CB2D50];
      v25[0] = CFSTR("resource temporarily unavailable.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 5, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v5)[2](v5, 0, v16);

    }
  }

}

- (void)onDataProtectionNotification:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  RTContactsManager *v10;
  SEL v11;

  v5 = a3;
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__RTContactsManager_onDataProtectionNotification___block_invoke;
  block[3] = &unk_1E9297BC8;
  v9 = v5;
  v10 = self;
  v11 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

void __50__RTContactsManager_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTDataProtectionManagerNotificationUnlockedSinceBoot, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4 && objc_msgSend(*(id *)(a1 + 32), "unlockedSinceBoot"))
  {
    objc_msgSend(*(id *)(a1 + 40), "setAvailable:", 1);
    v5 = *(void **)(a1 + 40);
    v11 = 0;
    objc_msgSend(v5, "_getMeCardWithError:", &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_rt_toString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, RTDataProtectionManagerNotificationUnlockedSinceBoot, meCard, %@, error, %@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setMeCard:", v6);

  }
}

- (BOOL)labelTypeValidForDonation:(unint64_t)a3
{
  return a3 - 1 < 3;
}

- (void)fetchMeCardWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__RTContactsManager_fetchMeCardWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __44__RTContactsManager_fetchMeCardWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchMeCardWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)__donateAddressFromMapItem:(id)a3 addressLabelType:(unint64_t)a4 donationStore:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const __CFString **v29;
  uint64_t *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  void (**v35)(id, _QWORD, void *);
  unint64_t v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  const __CFString *v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, void *))a6;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[RTContactsManager __donateAddressFromMapItem:addressLabelType:donationStore:handler:]";
      v45 = 1024;
      v46 = 446;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem (in %s:%d)", buf, 0x12u);
    }

    if (v11)
    {
LABEL_3:
      if (v10)
        goto LABEL_4;
LABEL_13:
      if (!v12)
        goto LABEL_21;
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0D18598];
      v41 = *MEMORY[0x1E0CB2D50];
      v42 = CFSTR("requires a map item.");
      v28 = (void *)MEMORY[0x1E0C99D80];
      v29 = &v42;
      v30 = &v41;
LABEL_19:
      objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v29, v30, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 7, v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v21);
      goto LABEL_20;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[RTContactsManager __donateAddressFromMapItem:addressLabelType:donationStore:handler:]";
    v45 = 1024;
    v46 = 447;
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: donationStore (in %s:%d)", buf, 0x12u);
  }

  if (!v10)
    goto LABEL_13;
LABEL_4:
  if (!-[RTContactsManager labelTypeValidForDonation:](self, "labelTypeValidForDonation:", a4))
  {
    if (!v12)
      goto LABEL_21;
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0D18598];
    v39 = *MEMORY[0x1E0CB2D50];
    v40 = CFSTR("donation is only supported for label type home, work, or school.");
    v28 = (void *)MEMORY[0x1E0C99D80];
    v29 = &v40;
    v30 = &v39;
    goto LABEL_19;
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0D136D8]);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultsDomain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "labelTypeToString:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateByAddingTimeInterval:", 259200.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v14, "initWithBundleIdentifier:donationIdentifier:donationDate:expirationDate:", v15, v16, v13, v17);

    v18 = objc_alloc(MEMORY[0x1E0D183F8]);
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithUseBackgroundTraits:analyticsIdentifier:", 1, v20);

    -[RTContactsManager mapServiceManager](self, "mapServiceManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __87__RTContactsManager___donateAddressFromMapItem_addressLabelType_donationStore_handler___block_invoke;
    v32[3] = &unk_1E92A1F08;
    v35 = v12;
    v36 = a4;
    v33 = v31;
    v34 = v11;
    v23 = v31;
    objc_msgSend(v22, "fetchPostalAddressForMapItem:options:handler:", v10, v21, v32);

LABEL_20:
    goto LABEL_21;
  }
  if (v12)
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0D18598];
    v37 = *MEMORY[0x1E0CB2D50];
    v38 = CFSTR("donation requires a valid donation store.");
    v28 = (void *)MEMORY[0x1E0C99D80];
    v29 = &v38;
    v30 = &v37;
    goto LABEL_19;
  }
LABEL_21:

}

void __87__RTContactsManager___donateAddressFromMapItem_addressLabelType_donationStore_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C973A8], "_rt_labelStringWithAddressLabelType:", *(_QWORD *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D136E8], "donationValueWithPostalAddress:style:label:origin:", v5, 1, v8, *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 40);
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __87__RTContactsManager___donateAddressFromMapItem_addressLabelType_donationStore_handler___block_invoke_2;
    v12[3] = &unk_1E9297AA8;
    v14 = *(id *)(a1 + 48);
    v13 = v5;
    objc_msgSend(v10, "donateMeCardValues:completionHandler:", v11, v12);

  }
}

void __87__RTContactsManager___donateAddressFromMapItem_addressLabelType_donationStore_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "error from contacts donating place, %@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, *(_QWORD *)(a1 + 32), v3);

}

- (void)_donateAddressFromMapItem:(id)a3 addressLabelType:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[RTContactsManager _donateAddressFromMapItem:addressLabelType:handler:]";
      v14 = 1024;
      v15 = 519;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem (in %s:%d)", (uint8_t *)&v12, 0x12u);
    }

  }
  v11 = (void *)objc_opt_new();
  -[RTContactsManager __donateAddressFromMapItem:addressLabelType:donationStore:handler:](self, "__donateAddressFromMapItem:addressLabelType:donationStore:handler:", v8, a4, v11, v9);

}

- (void)donateAddressFromMapItem:(id)a3 addressLabelType:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__RTContactsManager_donateAddressFromMapItem_addressLabelType_handler___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __71__RTContactsManager_donateAddressFromMapItem_addressLabelType_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_donateAddressFromMapItem:addressLabelType:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

+ (id)addressLabelTypeToLabel:(unint64_t)a3
{
  if (a3 > 3)
    return 0;
  else
    return **((id **)&unk_1E92A2010 + a3);
}

+ (id)addressLabelTypeToString:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E92A2030[a3];
}

+ (id)addressDictionaryFromMapItem:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mergedThoroughfare");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0C970C8]);

  objc_msgSend(v4, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subLocality");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C970D8]);

  objc_msgSend(v4, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "locality");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0C97098]);

  objc_msgSend(v4, "address");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subAdministrativeArea");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0C970D0]);

  objc_msgSend(v4, "address");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "administrativeArea");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0C970C0]);

  objc_msgSend(v4, "address");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postalCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0C970B0]);

  objc_msgSend(v4, "address");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "country");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0C970A0]);

  objc_msgSend(v4, "address");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "countryCode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0C970A8]);

  return v5;
}

- (BOOL)removeAddressOfContact:(id)a3 withAddressIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  NSObject *v19;
  __CFString *v20;
  const __CFString *v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      v35 = &v34;
      v36 = 0x2020000000;
      v37 = 0;
      objc_msgSend(v7, "postalAddresses");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __72__RTContactsManager_removeAddressOfContact_withAddressIdentifier_error___block_invoke;
      v30[3] = &unk_1E92A1F30;
      v28 = v9;
      v31 = v28;
      v33 = &v34;
      v12 = v10;
      v32 = v12;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v30);

      if (*((_BYTE *)v35 + 24))
      {
        v13 = (void *)objc_msgSend(v7, "mutableCopy");
        objc_msgSend(v13, "setPostalAddresses:", v12);
        v14 = (void *)objc_opt_new();
        objc_msgSend(v14, "updateContact:", v13);
        v15 = (void *)objc_opt_new();
        v29 = 0;
        v16 = objc_msgSend(v15, "executeSaveRequest:error:", v14, &v29);
        v17 = v29;
        v18 = v17;
        if (a5)
          *a5 = objc_retainAutorelease(v17);
        _rt_log_facility_get_os_log(RTLogFacilityContacts);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v13, "_rt_toString");
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v21 = CFSTR("NO");
          *(_DWORD *)buf = 138413058;
          v39 = v20;
          if (v16)
            v21 = CFSTR("YES");
          v40 = 2112;
          v41 = v28;
          v42 = 2112;
          v43 = v21;
          v44 = 2112;
          v45 = v18;
          _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "removed addess of contact, %@, with address identifier, %@, success, %@, error, %@", buf, 0x2Au);

        }
      }
      else
      {
        LOBYTE(v16) = 1;
      }

      _Block_object_dispose(&v34, 8);
      goto LABEL_23;
    }
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v39 = CFSTR("cannot remove address of contact. address identifier required");
      _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a5)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v46 = *MEMORY[0x1E0CB2D50];
      v47 = CFSTR("cannot remove address of contact. address identifier required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 0, v12);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v39 = CFSTR("cannot remove address of contact. contact required");
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a5)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v48 = *MEMORY[0x1E0CB2D50];
      v49[0] = CFSTR("cannot remove address of contact. contact required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 0, v12);
      v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
      LOBYTE(v16) = 0;
      *a5 = v24;
LABEL_23:

      goto LABEL_24;
    }
  }
  LOBYTE(v16) = 0;
LABEL_24:

  return v16;
}

void __72__RTContactsManager_removeAddressOfContact_withAddressIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  else
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (BOOL)removeAddressOfMeCardWithAddressIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[RTContactsManager meCard](self, "meCard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RTContactsManager meCard](self, "meCard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a4) = -[RTContactsManager removeAddressOfContact:withAddressIdentifier:error:](self, "removeAddressOfContact:withAddressIdentifier:error:", v8, v6, a4);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = CFSTR("cannot remove address. meCard required");
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a4)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2D50];
      v14 = CFSTR("cannot remove address. meCard required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 1, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

- (id)addressIdentifierOfMeCardWithAddressFromMapItem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[RTContactsManager meCard](self, "meCard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RTContactsManager meCard](self, "meCard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTContactsManager addressIdentifierOfContact:withAddressFromMapItem:error:](self, "addressIdentifierOfContact:withAddressFromMapItem:error:", v8, v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("cannot get address identifier, %@. no meCard"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a4)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2D50];
      v18 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 1, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v9 = 0;
  }

  return v9;
}

- (id)addressIdentifierOfContact:(id)a3 withAddressFromMapItem:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  objc_class *v29;
  void *v30;
  RTMapServiceManager *mapServiceManager;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  dispatch_time_t v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  char v51;
  _BOOL4 v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t i;
  void *v59;
  RTDistanceCalculator *distanceCalculator;
  void *v61;
  void *v62;
  double v63;
  double v64;
  id v65;
  NSObject *v66;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v75;
  id obj;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  dispatch_semaphore_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[4];
  id v94;
  NSObject *v95;
  __int128 *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[4];
  id v102;
  __int128 *v103;
  _BYTE buf[12];
  __int16 v105;
  id v106;
  __int16 v107;
  void *v108;
  _BYTE v109[128];
  uint8_t v110[128];
  __int128 v111;
  uint64_t v112;
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  id v115;
  uint64_t v116;
  const __CFString *v117;
  uint64_t v118;
  const __CFString *v119;
  _QWORD v120[4];

  v120[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v75 = v6;
  v86 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LODWORD(v111) = 138412290;
      *(_QWORD *)((char *)&v111 + 4) = CFSTR("cannot get address identifier. contact required");
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v111, 0xCu);
    }

    if (a5)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v118 = *MEMORY[0x1E0CB2D50];
      v119 = CFSTR("cannot get address identifier. contact required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 0, v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
      v12 = 0;
      *a5 = v19;
LABEL_63:

      goto LABEL_64;
    }
LABEL_20:
    v12 = 0;
    goto LABEL_64;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LODWORD(v111) = 138412290;
      *(_QWORD *)((char *)&v111 + 4) = CFSTR("cannot get address identifier. mapItem required");
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v111, 0xCu);
    }

    if (a5)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v116 = *MEMORY[0x1E0CB2D50];
      v117 = CFSTR("cannot get address identifier. mapItem required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 0, v18);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  objc_msgSend(v7, "extendedAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addressIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_22;
  *(_QWORD *)&v111 = 0;
  *((_QWORD *)&v111 + 1) = &v111;
  v112 = 0x2020000000;
  LOBYTE(v113) = 0;
  objc_msgSend(v6, "postalAddresses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v101[0] = MEMORY[0x1E0C809B0];
  v101[1] = 3221225472;
  v101[2] = __77__RTContactsManager_addressIdentifierOfContact_withAddressFromMapItem_error___block_invoke;
  v101[3] = &unk_1E92A1F58;
  v11 = v86;
  v102 = v11;
  v103 = &v111;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v101);

  _rt_log_facility_get_os_log(RTLogFacilityContacts);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(*((_QWORD *)&v111 + 1) + 24))
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v13;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "addressIdentifier from mapItem's client attributes is still a valid handle to an address, %@", buf, 0xCu);
  }

  v14 = *(unsigned __int8 *)(*((_QWORD *)&v111 + 1) + 24);
  if (*(_BYTE *)(*((_QWORD *)&v111 + 1) + 24))
  {
    objc_msgSend(v11, "extendedAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addressIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v111, 8);
  if (!v14)
  {
LABEL_22:
    v82 = (void *)objc_opt_new();
    *(_QWORD *)&v111 = 0;
    *((_QWORD *)&v111 + 1) = &v111;
    v112 = 0x3032000000;
    v113 = __Block_byref_object_copy__107;
    v114 = __Block_byref_object_dispose__107;
    v115 = 0;
    v81 = dispatch_semaphore_create(0);
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    objc_msgSend(v6, "postalAddresses");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
    obj = v22;
    v24 = 0;
    if (v23)
    {
      v77 = *MEMORY[0x1E0D18598];
      v78 = *MEMORY[0x1E0CB2D50];
      v80 = *(_QWORD *)v98;
LABEL_24:
      v25 = v23;
      v26 = 0;
      v83 = v24;
      while (1)
      {
        if (*(_QWORD *)v98 != v80)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v26);
        v28 = objc_alloc(MEMORY[0x1E0D183F8]);
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = (void *)objc_msgSend(v28, "initWithUseBackgroundTraits:analyticsIdentifier:", 1, v30);

        mapServiceManager = self->_mapServiceManager;
        objc_msgSend(v27, "value");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "dictionaryRepresentation");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v93[0] = MEMORY[0x1E0C809B0];
        v93[1] = 3221225472;
        v93[2] = __77__RTContactsManager_addressIdentifierOfContact_withAddressFromMapItem_error___block_invoke_86;
        v93[3] = &unk_1E929BBF8;
        v96 = &v111;
        v94 = v82;
        v34 = v81;
        v95 = v34;
        -[RTMapServiceManager fetchMapItemsFromAddressDictionary:options:handler:](mapServiceManager, "fetchMapItemsFromAddressDictionary:options:handler:", v33, v84, v93);

        v35 = v34;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v35, v37))
          goto LABEL_32;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "timeIntervalSinceDate:", v36);
        v40 = v39;
        v41 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_222);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "filteredArrayUsingPredicate:", v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "firstObject");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v41, "submitToCoreAnalytics:type:duration:", v45, 1, v40);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v47 = (void *)MEMORY[0x1E0CB35C8];
        v120[0] = v78;
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v120, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "errorWithDomain:code:userInfo:", v77, 15, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          v50 = objc_retainAutorelease(v49);

          v51 = 0;
        }
        else
        {
LABEL_32:
          v51 = 1;
          v50 = v83;
        }

        v24 = v50;
        if ((v51 & 1) == 0)
          objc_storeStrong((id *)(*((_QWORD *)&v111 + 1) + 40), v50);
        v52 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 40) == 0;

        if (!v52)
          break;
        ++v26;
        v83 = v24;
        if (v25 == v26)
        {
          v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
          if (v23)
            goto LABEL_24;
          break;
        }
      }
    }
    v79 = v24;

    v53 = *(void **)(*((_QWORD *)&v111 + 1) + 40);
    if (v53)
    {
      v18 = 0;
      if (*a5)
        *a5 = objc_retainAutorelease(v53);
    }
    else
    {
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v54 = v82;
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
      if (v55)
      {
        v85 = 0;
        v56 = *(_QWORD *)v90;
        v57 = INFINITY;
        do
        {
          for (i = 0; i != v55; ++i)
          {
            if (*(_QWORD *)v90 != v56)
              objc_enumerationMutation(v54);
            v59 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
            distanceCalculator = self->_distanceCalculator;
            objc_msgSend(v86, "location");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "location");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = 0;
            -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v61, v62, &v88);
            v64 = v63;
            v65 = v88;

            if (v65)
            {
              _rt_log_facility_get_os_log(RTLogFacilityContacts);
              v66 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v86;
                v105 = 2112;
                v106 = v65;
                _os_log_error_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_ERROR, "error determining distance for map item, %@, error, %@", buf, 0x16u);
              }
            }
            else if (v64 < 200.0 && v64 < v57)
            {
              objc_msgSend(v59, "extendedAttributes");
              v66 = objc_claimAutoreleasedReturnValue();
              -[NSObject addressIdentifier](v66, "addressIdentifier");
              v72 = objc_claimAutoreleasedReturnValue();

              v85 = (void *)v72;
              v57 = v64;
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilityContacts);
              v66 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v59, "extendedAttributes");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "addressIdentifier");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "address");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "address");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v69;
                v105 = 2112;
                v106 = v70;
                v107 = 2112;
                v108 = v71;
                _os_log_debug_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_DEBUG, "contact's address identifier, %@, address, \"%@\", too far from address of mapItem, %@", buf, 0x20u);

              }
            }

          }
          v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
        }
        while (v55);
      }
      else
      {
        v85 = 0;
      }

      v18 = v85;
    }

    _Block_object_dispose(&v111, 8);
    v12 = v18;
    goto LABEL_63;
  }
LABEL_64:

  return v12;
}

void __77__RTContactsManager_addressIdentifierOfContact_withAddressFromMapItem_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "extendedAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addressIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if (v9)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __77__RTContactsManager_addressIdentifierOfContact_withAddressFromMapItem_error___block_invoke_86(uint64_t a1, void *a2, id obj)
{
  id v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v7 = obj;
  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v6);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)addAddressToContact:(id)a3 addressLabelType:(unint64_t)a4 addressFromMapItem:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  const __CFString **v35;
  uint64_t *v36;
  NSObject *v37;
  id v39;
  id v40;
  int v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  uint8_t buf[4];
  const __CFString *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  const __CFString *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;
  const __CFString *v62;
  uint64_t v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
      v44 = v10;
      objc_msgSend((id)objc_opt_class(), "addressDictionaryFromMapItem:", v10);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "addressLabelTypeToLabel:", a4);
      v13 = objc_claimAutoreleasedReturnValue();
      v43 = (void *)v12;
      objc_msgSend(MEMORY[0x1E0C973A8], "postalAddressWithDictionaryRepresentation:", v12);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)v13;
      v45 = (void *)v14;
      objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", v13, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);
      objc_msgSend(v15, "postalAddresses");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __83__RTContactsManager_addAddressToContact_addressLabelType_addressFromMapItem_error___block_invoke;
      v47[3] = &unk_1E92A1F80;
      v19 = v16;
      v48 = v19;
      objc_msgSend(v18, "enumerateObjectsUsingBlock:", v47);

      objc_msgSend(v15, "setPostalAddresses:", v19);
      v20 = (void *)objc_opt_new();
      objc_msgSend(v20, "updateContact:", v15);
      v21 = (void *)objc_opt_new();
      v46 = 0;
      v41 = objc_msgSend(v21, "executeSaveRequest:error:", v20, &v46);
      v22 = v46;
      v23 = v22;
      if (a6)
        *a6 = objc_retainAutorelease(v22);
      _rt_log_facility_get_os_log(RTLogFacilityContacts);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v17, "identifier");
        v39 = v19;
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_rt_toString");
        v40 = v9;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "addressLabelTypeToString:", a4);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v27;
        *(_DWORD *)buf = 138413570;
        v29 = CFSTR("NO");
        v50 = v25;
        v51 = 2112;
        if (v41)
          v29 = CFSTR("YES");
        v52 = v26;
        v53 = 2112;
        v54 = v27;
        v55 = 2112;
        v56 = v45;
        v57 = 2112;
        v58 = v29;
        v59 = 2112;
        v60 = v23;
        _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "add address with identifier, %@, to contact, %@, address label type, %@, address, \"%@\", success, %@, error, %@", buf, 0x3Eu);

        v19 = v39;
        v9 = v40;
      }

      objc_msgSend(v17, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = v43;
      v11 = v44;
      goto LABEL_19;
    }
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v50 = CFSTR("cannot add address. mapItem required");
      _os_log_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a6)
    {
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v61 = *MEMORY[0x1E0CB2D50];
      v62 = CFSTR("cannot add address. mapItem required");
      v34 = (void *)MEMORY[0x1E0C99D80];
      v35 = &v62;
      v36 = &v61;
      goto LABEL_18;
    }
LABEL_20:
    v30 = 0;
    goto LABEL_21;
  }
  _rt_log_facility_get_os_log(RTLogFacilityContacts);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v50 = CFSTR("cannot add address. contact required");
    _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  if (!a6)
    goto LABEL_20;
  v33 = (void *)MEMORY[0x1E0CB35C8];
  v63 = *MEMORY[0x1E0CB2D50];
  v64[0] = CFSTR("cannot add address. contact required");
  v34 = (void *)MEMORY[0x1E0C99D80];
  v35 = (const __CFString **)v64;
  v36 = &v63;
LABEL_18:
  objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 0, v31);
  v30 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_21:
  return v30;
}

uint64_t __83__RTContactsManager_addAddressToContact_addressLabelType_addressFromMapItem_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)addAddressToMeCardWithAddressLabelType:(unint64_t)a3 addressFromMapItem:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  const __CFString *v16;
  uint8_t buf[4];
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[RTContactsManager meCard](self, "meCard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[RTContactsManager meCard](self, "meCard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTContactsManager addAddressToContact:addressLabelType:addressFromMapItem:error:](self, "addAddressToContact:addressLabelType:addressFromMapItem:error:", v10, a3, v8, a5);
    a5 = (id *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = CFSTR("cannot add address. meCard required");
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a5)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2D50];
      v16 = CFSTR("cannot add address. meCard required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 1, v13);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      a5 = 0;
    }
  }

  return a5;
}

- (BOOL)updateAddressOfContact:(id)a3 withAddressIdentifier:(id)a4 toAddressFromMapItem:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  NSObject *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint8_t buf[4];
  const __CFString *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  id v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;
  const __CFString *v64;
  uint64_t v65;
  const __CFString *v66;
  uint64_t v67;
  _QWORD v68[4];

  v68[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v38 = v11;
  if (v9)
  {
    if (v10)
    {
      if (v11)
      {
        objc_msgSend((id)objc_opt_class(), "addressDictionaryFromMapItem:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0;
        v46 = &v45;
        v47 = 0x3032000000;
        v48 = __Block_byref_object_copy__107;
        v49 = __Block_byref_object_dispose__107;
        v50 = 0;
        objc_msgSend(MEMORY[0x1E0C973A8], "postalAddressWithDictionaryRepresentation:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v9, "mutableCopy");
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "postalAddresses");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __93__RTContactsManager_updateAddressOfContact_withAddressIdentifier_toAddressFromMapItem_error___block_invoke;
        v40[3] = &unk_1E92A1FA8;
        v35 = v10;
        v41 = v35;
        v44 = &v45;
        v37 = v15;
        v42 = v37;
        v36 = v13;
        v43 = v36;
        objc_msgSend(v16, "enumerateObjectsUsingBlock:", v40);

        objc_msgSend(v14, "setPostalAddresses:", v37);
        v17 = (void *)objc_opt_new();
        objc_msgSend(v17, "updateContact:", v14);
        v18 = (void *)objc_opt_new();
        v39 = 0;
        v19 = objc_msgSend(v18, "executeSaveRequest:error:", v17, &v39);
        v20 = v39;
        v21 = v20;
        if (a6)
          *a6 = objc_retainAutorelease(v20);
        _rt_log_facility_get_os_log(RTLogFacilityContacts);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v14, "_rt_toString");
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v23;
          v25 = v46[5];
          v26 = CFSTR("NO");
          *(_DWORD *)buf = 138413570;
          if (v19)
            v26 = CFSTR("YES");
          v52 = (const __CFString *)v23;
          v53 = 2112;
          v54 = v35;
          v55 = 2112;
          v56 = v25;
          v57 = 2112;
          v58 = v36;
          v59 = 2112;
          v60 = v26;
          v61 = 2112;
          v62 = v21;
          _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "updated address of contact, %@, with address identifier, %@, from address, \"%@\", to address, \"%@\", success, %@, error, %@", buf, 0x3Eu);

        }
        _Block_object_dispose(&v45, 8);

        goto LABEL_24;
      }
      _rt_log_facility_get_os_log(RTLogFacilityContacts);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v52 = CFSTR("cannot update address. mapItem required");
        _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }

      if (a6)
      {
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v63 = *MEMORY[0x1E0CB2D50];
        v64 = CFSTR("cannot update address. mapItem required");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 0, v12);
        v29 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
LABEL_25:
      LOBYTE(v19) = 0;
      goto LABEL_26;
    }
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v52 = CFSTR("cannot update address. address identifier required");
      _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (!a6)
      goto LABEL_25;
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v65 = *MEMORY[0x1E0CB2D50];
    v66 = CFSTR("cannot update address. address identifier required");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 0, v12);
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v52 = CFSTR("cannot update address. contact required");
      _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (!a6)
      goto LABEL_25;
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v67 = *MEMORY[0x1E0CB2D50];
    v68[0] = CFSTR("cannot update address. contact required");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 0, v12);
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_23:
  LOBYTE(v19) = 0;
  *a6 = v29;
LABEL_24:

LABEL_26:
  return v19;
}

void __93__RTContactsManager_updateAddressOfContact_withAddressIdentifier_toAddressFromMapItem_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    objc_msgSend(v10, "value");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = *(void **)(a1 + 40);
    objc_msgSend(v10, "labeledValueBySettingValue:", *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
  }

}

- (BOOL)updateAddressOfMeCardWithAddressIdentifier:(id)a3 toAddressFromMapItem:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[RTContactsManager meCard](self, "meCard");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[RTContactsManager meCard](self, "meCard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a5) = -[RTContactsManager updateAddressOfContact:withAddressIdentifier:toAddressFromMapItem:error:](self, "updateAddressOfContact:withAddressIdentifier:toAddressFromMapItem:error:", v11, v8, v9, a5);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = CFSTR("cannot set address label type. meCard required");
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a5)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      v17 = CFSTR("cannot set address label type. meCard required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 1, v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a5) = 0;
    }
  }

  return (char)a5;
}

- (BOOL)updateAddressLabelTypeOfContact:(id)a3 withAddressIdentifier:(id)a4 toAddressLabelType:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  const __CFString *v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  const __CFString *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  id v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  _QWORD v60[4];

  v60[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v32 = v10;
  if (v9)
  {
    if (v10)
    {
      v11 = (__CFString *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v40 = &v39;
      v41 = 0x3032000000;
      v42 = __Block_byref_object_copy__107;
      v43 = __Block_byref_object_dispose__107;
      v44 = 0;
      objc_msgSend((id)objc_opt_class(), "addressLabelTypeToLabel:", a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString postalAddresses](v11, "postalAddresses");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __100__RTContactsManager_updateAddressLabelTypeOfContact_withAddressIdentifier_toAddressLabelType_error___block_invoke;
      v34[3] = &unk_1E92A1FA8;
      v15 = v32;
      v35 = v15;
      v38 = &v39;
      v16 = v12;
      v36 = v16;
      v17 = v13;
      v37 = v17;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v34);

      -[__CFString setPostalAddresses:](v11, "setPostalAddresses:", v16);
      v18 = (void *)objc_opt_new();
      objc_msgSend(v18, "updateContact:", v11);
      v19 = (void *)objc_opt_new();
      v33 = 0;
      v20 = objc_msgSend(v19, "executeSaveRequest:error:", v18, &v33);
      v21 = v33;
      v22 = v21;
      if (a6)
        *a6 = objc_retainAutorelease(v21);
      _rt_log_facility_get_os_log(RTLogFacilityContacts);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = v40[5];
        v25 = CFSTR("NO");
        *(_DWORD *)buf = 138413570;
        if (v20)
          v25 = CFSTR("YES");
        v46 = v11;
        v47 = 2112;
        v48 = v15;
        v49 = 2112;
        v50 = v24;
        v51 = 2112;
        v52 = v17;
        v53 = 2112;
        v54 = v25;
        v55 = 2112;
        v56 = v22;
        _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "updated address label type of contact, %@, with address identifier, %@, from address label type, %@, to address label type, %@, success, %@, error, %@", buf, 0x3Eu);
      }

      _Block_object_dispose(&v39, 8);
      goto LABEL_19;
    }
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v46 = CFSTR("cannot update address label type. address identifier required");
      _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a6)
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v57 = *MEMORY[0x1E0CB2D50];
      v58 = CFSTR("cannot update address label type. address identifier required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1, v32);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 0, v11);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_20:
    LOBYTE(v20) = 0;
    goto LABEL_21;
  }
  _rt_log_facility_get_os_log(RTLogFacilityContacts);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v46 = CFSTR("cannot update address label type. contact required");
    _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  if (!a6)
    goto LABEL_20;
  v27 = (void *)MEMORY[0x1E0CB35C8];
  v59 = *MEMORY[0x1E0CB2D50];
  v60[0] = CFSTR("cannot update address label type. contact required");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1, v32);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 0, v11);
  v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
  LOBYTE(v20) = 0;
  *a6 = v28;
LABEL_19:

LABEL_21:
  return v20;
}

void __100__RTContactsManager_updateAddressLabelTypeOfContact_withAddressIdentifier_toAddressLabelType_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    objc_msgSend(v10, "label");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = *(void **)(a1 + 40);
    objc_msgSend(v10, "labeledValueBySettingLabel:", *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
  }

}

- (BOOL)updateAddressLabelTypeOfMeCardWithAddressIdentifier:(id)a3 toAddressLabelType:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  const __CFString *v16;
  uint8_t buf[4];
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[RTContactsManager meCard](self, "meCard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[RTContactsManager meCard](self, "meCard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a5) = -[RTContactsManager updateAddressLabelTypeOfContact:withAddressIdentifier:toAddressLabelType:error:](self, "updateAddressLabelTypeOfContact:withAddressIdentifier:toAddressLabelType:error:", v10, v8, a4, a5);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityContacts);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = CFSTR("cannot update address label type. meCard required");
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    if (a5)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2D50];
      v16 = CFSTR("cannot update address label type. meCard required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 1, v13);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a5) = 0;
    }
  }

  return (char)a5;
}

- (void)fetchFormattedPostalAddressesFromMeCard:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[RTContactsManager fetchFormattedPostalAddressesFromMeCard:]";
      v12 = 1024;
      v13 = 1132;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__RTContactsManager_fetchFormattedPostalAddressesFromMeCard___block_invoke;
  v8[3] = &unk_1E9297650;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __61__RTContactsManager_fetchFormattedPostalAddressesFromMeCard___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = 0;
  objc_msgSend(v2, "_getMeCardWithError:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "formattedPostalAddressesForContact:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

+ (id)formattedPostalAddressesForContact:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v30 = 0;
    goto LABEL_20;
  }
  v34 = a1;
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "postalAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v32 = v4;
  objc_msgSend(v4, "postalAddresses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v7)
    goto LABEL_18;
  v8 = v7;
  v9 = *(_QWORD *)v40;
  v10 = *MEMORY[0x1E0C96FF8];
  v37 = *MEMORY[0x1E0C97070];
  v11 = 0x1E0CB3000uLL;
  v33 = *MEMORY[0x1E0C96FF8];
  do
  {
    v12 = 0;
    v36 = v8;
    do
    {
      if (*(_QWORD *)v40 != v9)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v12);
      objc_msgSend(v13, "label");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToString:", v10))
      {

      }
      else
      {
        objc_msgSend(v13, "label");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v37);

        if (!v16)
          goto LABEL_16;
      }
      v17 = (void *)MEMORY[0x1E0C973B0];
      objc_msgSend(v13, "value");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringFromPostalAddress:style:", v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = *(void **)(v11 + 2024);
        objc_msgSend(v13, "label");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v34, "labelStringToAddressLabelType:", v21));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKey:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(v23, "addObject:", v19);
        }
        else
        {
          v24 = objc_alloc(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v32, "postalAddresses");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v24, "initWithCapacity:", objc_msgSend(v25, "count"));

          objc_msgSend(v26, "addObject:", v19);
          v27 = *(void **)(v11 + 2024);
          objc_msgSend(v13, "label");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v34, "labelStringToAddressLabelType:", v28));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKey:", v26, v29);

        }
        v10 = v33;
        v8 = v36;
        v11 = 0x1E0CB3000;
      }

LABEL_16:
      ++v12;
    }
    while (v8 != v12);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  }
  while (v8);
LABEL_18:

  v4 = v32;
  v30 = v35;
LABEL_20:

  return v30;
}

- (void)fetchContactsFromEmailOrPhoneNumberString:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
LABEL_3:
      -[RTNotifier queue](self, "queue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71__RTContactsManager_fetchContactsFromEmailOrPhoneNumberString_handler___block_invoke;
      block[3] = &unk_1E9296F70;
      block[4] = self;
      v13 = v6;
      v14 = v8;
      dispatch_async(v9, block);

      goto LABEL_10;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[RTContactsManager fetchContactsFromEmailOrPhoneNumberString:handler:]";
      v17 = 1024;
      v18 = 1185;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: emailOrPhoneNumberString (in %s:%d)", buf, 0x12u);
    }

    if (v8)
      goto LABEL_3;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[RTContactsManager fetchContactsFromEmailOrPhoneNumberString:handler:]";
    v17 = 1024;
    v18 = 1186;
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }

LABEL_10:
}

uint64_t __71__RTContactsManager_fetchContactsFromEmailOrPhoneNumberString_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchContactsFromEmailOrPhoneNumberString:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchContactsFromEmailOrPhoneNumberString:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  int IsEmail;
  int v11;
  int v12;
  NSObject *v13;
  objc_class *v14;
  char *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  char *v29;
  char *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  objc_class *v45;
  char *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  const char *aSelector;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  uint8_t v62[128];
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  char *v72;
  uint64_t v73;
  _QWORD v74[4];

  v74[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
    {
      IsEmail = IMStringIsEmail();
      v11 = MEMORY[0x1D823141C](v7);
      v12 = v11;
      if ((IsEmail & 1) == 0 && (v11 & 1) == 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilityContacts);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v15 = (char *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v64 = v15;
          v65 = 2112;
          v66 = v16;
          v67 = 2112;
          v68 = (uint64_t)v7;
          _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, %@, invalid string passed, %@,", buf, 0x20u);

        }
LABEL_11:
        v9[2](v9, 0, 0);
        goto LABEL_42;
      }
      -[RTContactsManager _contactColumnKeysToFetch](self, "_contactColumnKeysToFetch");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_opt_new();
      if (!v20)
      {
        v73 = *MEMORY[0x1E0CB2D50];
        v74[0] = CFSTR("Unable to create contacts store to get the 'Me' card.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 0, v21);
        v23 = (char *)objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityContacts);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v23;
          _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        ((void (**)(_QWORD, _QWORD, char *))v9)[2](v9, 0, v23);
        goto LABEL_41;
      }
      aSelector = a2;
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v19);
      if (IsEmail)
      {
        objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setPredicate:", v22);
      }
      else
      {
        if (!v12)
        {
LABEL_24:
          v61 = 0;
          objc_msgSend(v20, "executeFetchRequest:error:", v21, &v61);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (char *)v61;
          _rt_log_facility_get_os_log(RTLogFacilityContacts);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = (objc_class *)objc_opt_class();
            NSStringFromClass(v28);
            v53 = v21;
            v29 = (char *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v55 = v19;
            v30 = v23;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "value");
            v51 = v26;
            v32 = v20;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "count");
            *(_DWORD *)buf = 138413314;
            v64 = v29;
            v65 = 2112;
            v66 = v31;
            v67 = 2112;
            v68 = (uint64_t)v7;
            v69 = 2048;
            v70 = v34;
            v71 = 2112;
            v72 = v30;
            _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "%@, %@, input string, %@, fetched contacts count, %lu, fetch request error, %@", buf, 0x34u);

            v20 = v32;
            v26 = v51;

            v23 = v30;
            v19 = v55;

            v21 = v53;
          }

          if (v23)
          {
            ((void (**)(_QWORD, _QWORD, char *))v9)[2](v9, 0, v23);
          }
          else
          {
            v49 = v20;
            v54 = v21;
            v56 = v19;
            v35 = (void *)objc_opt_new();
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            v60 = 0u;
            v52 = v26;
            objc_msgSend(v26, "value");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
            if (v37)
            {
              v38 = v37;
              v39 = *(_QWORD *)v58;
              do
              {
                for (i = 0; i != v38; ++i)
                {
                  if (*(_QWORD *)v58 != v39)
                    objc_enumerationMutation(v36);
                  v41 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
                  v42 = (void *)MEMORY[0x1D8231EA8]();
                  -[RTContactsManager _getRTContactFromCNContact:](self, "_getRTContactFromCNContact:", v41);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v43)
                    objc_msgSend(v35, "addObject:", v43);

                  objc_autoreleasePoolPop(v42);
                }
                v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
              }
              while (v38);
            }

            _rt_log_facility_get_os_log(RTLogFacilityContacts);
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              v45 = (objc_class *)objc_opt_class();
              NSStringFromClass(v45);
              v46 = (char *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = objc_msgSend(v35, "count");
              *(_DWORD *)buf = 138412802;
              v64 = v46;
              v65 = 2112;
              v66 = v47;
              v67 = 2048;
              v68 = v48;
              _os_log_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_INFO, "%@, %@, resultContacts count, %lu", buf, 0x20u);

            }
            ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v35, 0);

            v21 = v54;
            v19 = v56;
            v23 = 0;
            v20 = v49;
            v26 = v52;
          }

LABEL_41:
          goto LABEL_42;
        }
        objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setPredicate:", v25);

      }
      goto LABEL_24;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v64 = "-[RTContactsManager _fetchContactsFromEmailOrPhoneNumberString:handler:]";
      v65 = 1024;
      LODWORD(v66) = 1202;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: emailOrPhoneNumberString (in %s:%d)", buf, 0x12u);
    }

    if (v9)
      goto LABEL_11;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v64 = "-[RTContactsManager _fetchContactsFromEmailOrPhoneNumberString:handler:]";
    v65 = 1024;
    LODWORD(v66) = 1203;
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }

LABEL_42:
}

- (void)fetchContactsUsingContactIdentifiers:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[RTContactsManager fetchContactsUsingContactIdentifiers:handler:]";
      v17 = 1024;
      v18 = 1292;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactIdentifiers (in %s:%d)", buf, 0x12u);
    }

    if (v8)
      goto LABEL_8;
LABEL_9:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[RTContactsManager fetchContactsUsingContactIdentifiers:handler:]";
      v17 = 1024;
      v18 = 1293;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_11;
  }
  if (!v7)
    goto LABEL_9;
  if (!objc_msgSend(v6, "count"))
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NSObject *, _QWORD))v8)[2](v8, v11, 0);
LABEL_11:

    goto LABEL_12;
  }
  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__RTContactsManager_fetchContactsUsingContactIdentifiers_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v13 = v6;
  v14 = v8;
  dispatch_async(v9, block);

LABEL_12:
}

uint64_t __66__RTContactsManager_fetchContactsUsingContactIdentifiers_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchContactsUsingContactIdentifiers:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchContactsUsingContactIdentifiers:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  NSObject *v11;
  objc_class *v12;
  char *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char *v20;
  NSObject *v21;
  objc_class *v22;
  char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  uint8_t v48[128];
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  char *v58;
  uint64_t v59;
  _QWORD v60[4];

  v60[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
    {
      if (objc_msgSend(v7, "count"))
      {
        v10 = objc_opt_new();
        if (v10)
        {
          _rt_log_facility_get_os_log(RTLogFacilityContacts);
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v12 = (objc_class *)objc_opt_class();
            NSStringFromClass(v12);
            v13 = (char *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v50 = v13;
            v51 = 2112;
            v52 = v14;
            v53 = 2048;
            v54 = objc_msgSend(v7, "count");
            _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, %@, contact identifiers count, %lu,", buf, 0x20u);

          }
          v15 = objc_alloc(MEMORY[0x1E0C97210]);
          -[RTContactsManager _contactColumnKeysToFetch](self, "_contactColumnKeysToFetch");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v15, "initWithKeysToFetch:", v16);

          objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsWithIdentifiers:", v7);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setPredicate:", v18);

          v47 = 0;
          -[NSObject executeFetchRequest:error:](v10, "executeFetchRequest:error:", v17, &v47);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (char *)v47;
          _rt_log_facility_get_os_log(RTLogFacilityContacts);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = (objc_class *)objc_opt_class();
            NSStringFromClass(v22);
            v23 = (char *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v17;
            v25 = objc_msgSend(v7, "count");
            objc_msgSend(v19, "value");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v39, "count");
            *(_DWORD *)buf = 138413314;
            v50 = v23;
            v51 = 2112;
            v52 = v24;
            v53 = 2048;
            v54 = v25;
            v17 = v41;
            v55 = 2048;
            v56 = v26;
            v57 = 2112;
            v58 = v20;
            _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "%@, %@, contact identifiers count, %lu, fetched contacts count, %lu, fetch request error, %@", buf, 0x34u);

          }
          if (v20)
          {
            ((void (**)(_QWORD, _QWORD, char *))v9)[2](v9, 0, v20);
          }
          else
          {
            v40 = v7;
            v42 = v17;
            v29 = (void *)objc_opt_new();
            v43 = 0u;
            v44 = 0u;
            v45 = 0u;
            v46 = 0u;
            v38 = v19;
            objc_msgSend(v19, "value");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v44;
              do
              {
                for (i = 0; i != v32; ++i)
                {
                  if (*(_QWORD *)v44 != v33)
                    objc_enumerationMutation(v30);
                  v35 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
                  v36 = (void *)MEMORY[0x1D8231EA8]();
                  -[RTContactsManager _getRTContactFromCNContact:](self, "_getRTContactFromCNContact:", v35);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v37)
                    objc_msgSend(v29, "addObject:", v37);

                  objc_autoreleasePoolPop(v36);
                }
                v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
              }
              while (v32);
            }

            ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v29, 0);
            v7 = v40;
            v17 = v42;
            v19 = v38;
            v20 = 0;
          }

        }
        else
        {
          v59 = *MEMORY[0x1E0CB2D50];
          v60[0] = CFSTR("Unable to create contacts store to get the 'Me' card.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 0, v17);
          v20 = (char *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityContacts);
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v50 = v20;
            _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }

          ((void (**)(_QWORD, _QWORD, char *))v9)[2](v9, 0, v20);
        }

        goto LABEL_32;
      }
LABEL_14:
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v10 = objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, NSObject *, _QWORD))v9)[2](v9, v10, 0);
      goto LABEL_32;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "-[RTContactsManager _fetchContactsUsingContactIdentifiers:handler:]";
      v51 = 1024;
      LODWORD(v52) = 1314;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactIdentifiers (in %s:%d)", buf, 0x12u);
    }

    if (v9)
      goto LABEL_14;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v50 = "-[RTContactsManager _fetchContactsUsingContactIdentifiers:handler:]";
    v51 = 1024;
    LODWORD(v52) = 1315;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }
LABEL_32:

}

- (void)fetchFavoriteContactsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__RTContactsManager_fetchFavoriteContactsWithHandler___block_invoke;
    v7[3] = &unk_1E9297650;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[RTContactsManager fetchFavoriteContactsWithHandler:]";
      v11 = 1024;
      v12 = 1381;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

uint64_t __54__RTContactsManager_fetchFavoriteContactsWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchFavoriteContactsWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchFavoriteContactsWithHandler:(id)a3
{
  void (**v5)(id, void *, _QWORD);
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  char *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  const char *aSelector;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *, _QWORD))a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C972F8], "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      aSelector = a2;
      v27 = v6;
      -[NSObject entries](v6, "entries");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_opt_new();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v29 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            v16 = (void *)MEMORY[0x1D8231EA8]();
            objc_msgSend(v15, "contactProperty");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "contact");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            -[RTContactsManager _getRTContactFromCNContact:](self, "_getRTContactFromCNContact:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              objc_msgSend(v9, "addObject:", v19);

            objc_autoreleasePoolPop(v16);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
        }
        while (v12);
      }

      _rt_log_facility_get_os_log(RTLogFacilityContacts);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (char *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v9, "count");
        *(_DWORD *)buf = 138412802;
        v33 = v22;
        v34 = 2112;
        v35 = v23;
        v36 = 2048;
        v37 = v24;
        _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, %@, favorite contacts count, %lu", buf, 0x20u);

      }
      v5[2](v5, v9, 0);
      v7 = v27;
    }
    else
    {
      v39 = *MEMORY[0x1E0CB2D50];
      v40[0] = CFSTR("Unable to create favorites store to get the 'Me' card.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 0, v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityContacts);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v33 = (const char *)v9;
        _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      ((void (**)(id, void *, void *))v5)[2](v5, 0, v9);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[RTContactsManager _fetchFavoriteContactsWithHandler:]";
      v34 = 1024;
      LODWORD(v35) = 1395;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

- (void)fetchRelationshipContactsFromMeCardWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__RTContactsManager_fetchRelationshipContactsFromMeCardWithHandler___block_invoke;
    v7[3] = &unk_1E9297650;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[RTContactsManager fetchRelationshipContactsFromMeCardWithHandler:]";
      v11 = 1024;
      v12 = 1447;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

uint64_t __68__RTContactsManager_fetchRelationshipContactsFromMeCardWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchRelationshipContactsFromMeCardWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchRelationshipContactsFromMeCardWithHandler:(id)a3
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  char *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void (**v33)(id, void *, _QWORD);
  const char *aSelector;
  id obj;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  NSObject *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;
  _QWORD v56[4];

  v56[1] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *, _QWORD))a3;
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v7 = (void *)objc_opt_new();
    if (v7)
    {
      aSelector = a2;
      -[RTContactsManager _contactColumnKeysToFetch](self, "_contactColumnKeysToFetch");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arrayByAddingObject:", *MEMORY[0x1E0C96840]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      objc_msgSend(v7, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v9, &v46);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v46;

      if (v10)
      {
        v32 = v7;
        v33 = v5;
        v31 = v10;
        objc_msgSend(v10, "contactRelations");
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
        if (v12)
        {
          v13 = v12;
          v36 = *(_QWORD *)v43;
          do
          {
            v14 = 0;
            v15 = v11;
            do
            {
              if (*(_QWORD *)v43 != v36)
                objc_enumerationMutation(obj);
              objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v14), "value");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "name");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = v15;
              -[RTContactsManager _queryContactsForGivenName:error:](self, "_queryContactsForGivenName:error:", v17, &v41);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = v41;

              v39 = 0u;
              v40 = 0u;
              v37 = 0u;
              v38 = 0u;
              v19 = v18;
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
              if (v20)
              {
                v21 = v20;
                v22 = *(_QWORD *)v38;
                do
                {
                  for (i = 0; i != v21; ++i)
                  {
                    if (*(_QWORD *)v38 != v22)
                      objc_enumerationMutation(v19);
                    -[RTContactsManager _getRTContactFromCNContact:](self, "_getRTContactFromCNContact:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v6, "addObject:", v24);

                  }
                  v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
                }
                while (v21);
              }

              ++v14;
              v15 = v11;
            }
            while (v14 != v13);
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
          }
          while (v13);
        }

        v7 = v32;
        v5 = v33;
        v10 = v31;
      }
      _rt_log_facility_get_os_log(RTLogFacilityContacts);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (char *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v6, "count");
        *(_DWORD *)buf = 138412802;
        v48 = v27;
        v49 = 2112;
        v50 = v28;
        v51 = 2048;
        v52 = v29;
        _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, %@, relation contacts count, %lu", buf, 0x20u);

      }
      v5[2](v5, v6, 0);
    }
    else
    {
      v55 = *MEMORY[0x1E0CB2D50];
      v56[0] = CFSTR("Unable to create contacts store to get the 'Me' card.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 0, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityContacts);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v48 = (const char *)v11;
        _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      ((void (**)(id, void *, NSObject *))v5)[2](v5, 0, v11);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[RTContactsManager _fetchRelationshipContactsFromMeCardWithHandler:]";
      v49 = 1024;
      LODWORD(v50) = 1461;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

- (id)_queryContactsForGivenName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingName:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTContactsManager _contactColumnKeysToFetch](self, "_contactColumnKeysToFetch");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      objc_msgSend(v7, "unifiedContactsMatchingPredicate:keysToFetch:error:", v8, v9, &v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v15;

      if (a4)
      {
        v11 = objc_retainAutorelease(v11);
        *a4 = v11;
      }
    }
    else
    {
      v18 = *MEMORY[0x1E0CB2D50];
      v19[0] = CFSTR("Unable to create contacts store to get the 'Me' card.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTContactsManagerErrorDomain"), 0, v8);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityContacts);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      if (a4)
        *a4 = objc_retainAutorelease(v11);
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("name"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_getRTContactFromCNContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  RTContact *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  RTContact *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[RTContactsManager _getRTContactFromCNContact:]";
      v26 = 1024;
      v27 = 1535;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: self.queue (in %s:%d)", buf, 0x12u);
    }

    if (v4)
    {
LABEL_3:
      if ((objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x1E0C967F0]) & 1) != 0)
      {
        objc_msgSend(v4, "postalAddresses");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTContactsManager _getPostalAddressesUsingCNContactPostalAddresses:](self, "_getPostalAddressesUsingCNContactPostalAddresses:", v6);
        v7 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      if ((objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x1E0C967C0]) & 1) != 0)
      {
        objc_msgSend(v4, "phoneNumbers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTContactsManager _getPhoneNumberStringsUsingCNContactPhoneNumbers:](self, "_getPhoneNumberStringsUsingCNContactPhoneNumbers:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if ((objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x1E0C966A8]) & 1) != 0)
      {
        objc_msgSend(v4, "emailAddresses");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTContactsManager _getEmailAddressStringsUsingCNContactEmailAddresses:](self, "_getEmailAddressStringsUsingCNContactEmailAddresses:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v14 = [RTContact alloc];
      objc_msgSend(v4, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "givenName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "middleName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "familyName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v7;
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v19 = v11;
      if (v11)
      {
        if (v13)
          goto LABEL_22;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
LABEL_22:
          v9 = -[RTContact initWithIdentifier:givenName:middleName:familyName:postalAddresses:phoneNumbers:emailAddresses:](v14, "initWithIdentifier:givenName:middleName:familyName:postalAddresses:phoneNumbers:emailAddresses:", v23, v15, v16, v17, v18, v19, v13);
          if (v11)
          {
LABEL_24:
            if (!v7)

            goto LABEL_27;
          }
LABEL_23:

          goto LABEL_24;
        }
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v22 = v13;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RTContact initWithIdentifier:givenName:middleName:familyName:postalAddresses:phoneNumbers:emailAddresses:](v14, "initWithIdentifier:givenName:middleName:familyName:postalAddresses:phoneNumbers:emailAddresses:", v23, v15, v16, v17, v18, v19, v21);

      v13 = v22;
      if (v11)
        goto LABEL_24;
      goto LABEL_23;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[RTContactsManager _getRTContactFromCNContact:]";
    v26 = 1024;
    v27 = 1536;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contact (in %s:%d)", buf, 0x12u);
  }
  v9 = 0;
LABEL_27:

  return v9;
}

- (id)_getPostalAddressesUsingCNContactPostalAddresses:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", 4838400.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__RTContactsManager__getPostalAddressesUsingCNContactPostalAddresses___block_invoke;
  v15[3] = &unk_1E92A1FD0;
  v15[4] = self;
  v16 = v7;
  v17 = v8;
  v9 = v6;
  v18 = v9;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v15);

  v12 = v18;
  v13 = v9;

  return v13;
}

void __70__RTContactsManager__getPostalAddressesUsingCNContactPostalAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  RTContactPostalAddress *v4;
  void *v5;
  void *v6;
  void *v7;
  RTContactPostalAddress *v8;
  RTContactPostalAddress *v9;

  v3 = a2;
  v4 = [RTContactPostalAddress alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  objc_msgSend(v3, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RTContactPostalAddress initWithIdentifier:CNPostalAddress:lableType:creationDate:expirationDate:](v4, "initWithIdentifier:CNPostalAddress:lableType:creationDate:expirationDate:", v5, v3, objc_msgSend(v6, "labelStringToAddressLabelType:", v7), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v8 = v9;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
    v8 = v9;
  }

}

- (id)_getPhoneNumberStringsUsingCNContactPhoneNumbers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__RTContactsManager__getPhoneNumberStringsUsingCNContactPhoneNumbers___block_invoke;
  v7[3] = &unk_1E92A1F80;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __70__RTContactsManager__getPhoneNumberStringsUsingCNContactPhoneNumbers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

- (id)_getEmailAddressStringsUsingCNContactEmailAddresses:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__RTContactsManager__getEmailAddressStringsUsingCNContactEmailAddresses___block_invoke;
  v7[3] = &unk_1E92A1F80;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __73__RTContactsManager__getEmailAddressStringsUsingCNContactEmailAddresses___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (void)setDataProtectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataProtectionManager, a3);
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (CNContact)meCard
{
  return self->_meCard;
}

- (BOOL)available
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meCard, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
}

@end
