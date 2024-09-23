@implementation TransitPassManager

- (TransitPassManager)initWithIsTourist:(BOOL)a3
{
  TransitPassManager *v4;
  TransitPassManager *v5;
  double Double;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *libraryQueue;
  id v11;
  OS_dispatch_queue *v12;
  MapsSuggestionsCanKicker *v13;
  MapsSuggestionsCanKicker *passKitLibraryDidChangeCanKicker;
  void *v15;
  void *v16;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)TransitPassManager;
  v4 = -[TransitPassManager init](&v24, "init");
  v5 = v4;
  if (v4)
  {
    v4->_isTourist = a3;
    objc_initWeak(&location, v4);
    Double = GEOConfigGetDouble(MapsConfig_TransitPayPassKitChangedNotificationCooldown, off_1014B4388);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.Maps.TransitPassManager", v8);
    libraryQueue = v5->_libraryQueue;
    v5->_libraryQueue = (OS_dispatch_queue *)v9;

    v11 = objc_alloc((Class)MapsSuggestionsCanKicker);
    v12 = v5->_libraryQueue;
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_1007BFF88;
    v21 = &unk_1011AD260;
    objc_copyWeak(&v22, &location);
    v13 = (MapsSuggestionsCanKicker *)objc_msgSend(v11, "initWithName:time:queue:block:", CFSTR("TransitPassManagerCanKicker"), v12, &v18, Double);
    passKitLibraryDidChangeCanKicker = v5->_passKitLibraryDidChangeCanKicker;
    v5->_passKitLibraryDidChangeCanKicker = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", v18, v19, v20, v21));
    objc_msgSend(v15, "addObserver:selector:name:object:", v5, "_passKitLibraryDidChange:", PKPassLibraryDidChangeNotification, 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", v5, "_applicationWillEnterForeground:", UIApplicationWillEnterForegroundNotification, 0);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MapsSuggestionsCanKicker cancel](self->_passKitLibraryDidChangeCanKicker, "cancel");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TransitPassManager;
  -[TransitPassManager dealloc](&v4, "dealloc");
}

- (void)userHasPaymentCardWithHandler:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id buf[2];

  v4 = a3;
  v5 = sub_10043253C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Looking through the user's wallet for a payment card", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1007C0134;
  v8[3] = &unk_1011C7138;
  objc_copyWeak(&v10, buf);
  v7 = v4;
  v9 = v7;
  -[TransitPassManager _fetchLibrary:](self, "_fetchLibrary:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);

}

- (void)_fetchLibrary:(id)a3
{
  id v4;
  OS_dispatch_queue *libraryQueue;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;
  _QWORD block[4];
  id v13;
  uint64_t *v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_1007C03F4;
  v20 = sub_1007C0404;
  v21 = 0;
  libraryQueue = self->_libraryQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1007C040C;
  v15[3] = &unk_1011ADF48;
  v15[4] = self;
  v15[5] = &v16;
  MapsSuggestionsDispatchSyncIfDifferent(libraryQueue, v15);
  if (v17[5])
  {
    v6 = self->_libraryQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007C0420;
    block[3] = &unk_1011AE540;
    v13 = v4;
    v14 = &v16;
    dispatch_async(v6, block);

  }
  else
  {
    objc_initWeak(&location, self);
    v7 = self->_libraryQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1007C0438;
    v8[3] = &unk_1011B0520;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    dispatch_async(v7, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v16, 8);

}

- (id)_messageFromBalance:(id)a3 passName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = v7;
  if (v5)
  {
    if (!v6)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MAPS_TRANSIT_PAY_LOW_BALANCE_AMOUNT_ONLY"), CFSTR("localized string not found"), 0));

      v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v9, v5, v14);
      goto LABEL_8;
    }
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MAPS_TRANSIT_PAY_LOW_BALANCE_FULL"), CFSTR("localized string not found"), 0));

    v10 = objc_alloc((Class)NSString);
    v14 = v5;
  }
  else
  {
    if (!v6)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MAPS_TRANSIT_PAY_LOW_BALANCE_GENERIC"), CFSTR("localized string not found"), 0));
      goto LABEL_9;
    }
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MAPS_TRANSIT_PAY_LOW_BALANCE_NAME_ONLY"), CFSTR("localized string not found"), 0));

    v10 = objc_alloc((Class)NSString);
  }
  v11 = objc_msgSend(v10, "initWithFormat:", v9, v6, v14);
LABEL_8:
  v12 = v11;
  v8 = (void *)v9;
LABEL_9:

  return v12;
}

- (id)_exclamationMarkImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", (uint64_t)UIFontWeightRegular, 30.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle"), v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_flatImageWithColor:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageWithRenderingMode:", 1));
  return v6;
}

- (BOOL)_balanceIsLessThanRouteCost:(id)a3 forPass:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  BOOL v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  NSObject *v40;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitProperties"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "balances"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currencyCode"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currency"));
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if ((v12 & 1) != 0)
    {
      v13 = objc_msgSend(objc_alloc((Class)NSDecimalNumber), "initWithDouble:", 0.0);
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitProperties", 0));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "balances"));

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v33;
        do
        {
          v19 = 0;
          v20 = v13;
          do
          {
            if (*(_QWORD *)v33 != v18)
              objc_enumerationMutation(v15);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1)
                                                                               + 8 * (_QWORD)v19), "amount"));
            v13 = objc_claimAutoreleasedReturnValue(-[NSObject decimalNumberByAdding:](v20, "decimalNumberByAdding:", v21));

            v19 = (char *)v19 + 1;
            v20 = v13;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v17);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "amount"));
      v23 = -[NSObject compare:](v13, "compare:", v22);

      if (v23 == (id)-1)
      {
        v30 = 1;
        goto LABEL_17;
      }
      v24 = sub_10043253C();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitProperties"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "balance"));
        v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "amount"));
        *(_DWORD *)buf = 138412546;
        v38 = v27;
        v39 = 2112;
        v40 = v28;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Comparison result of passProperties.balance:%@ and routeCost.amount:%@ is not as expected", buf, 0x16u);

      }
      goto LABEL_15;
    }
  }
  v29 = sub_10043253C();
  v13 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currency"));
    *(_DWORD *)buf = 138412546;
    v38 = v10;
    v39 = 2112;
    v40 = v25;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "passBalanceCurrency!=routeCost.currency passBalanceCurrency: %@, routeCost.currency: %@", buf, 0x16u);
LABEL_15:

  }
  v30 = 0;
LABEL_17:

  return v30;
}

- (void)_transitTopUpMessageForPass:(id)a3 paymentMethods:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  TransitPassManager *v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1007C0AFC;
  v14[3] = &unk_1011C7160;
  objc_copyWeak(&v19, &location);
  v11 = v8;
  v15 = v11;
  v12 = v10;
  v18 = v12;
  v16 = self;
  v13 = v9;
  v17 = v13;
  -[TransitPassManager _fetchLibrary:](self, "_fetchLibrary:", v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (id)_defaultPaymentCardsFromLibrary:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "defaultPaymentPassesWithRemotePasses:", 1));
  v4 = sub_10039E080(v3, &stru_1011C71A0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)_defaultPaymentCardExpressStatuses:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  uint32_t v23;
  unsigned int v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  __int128 v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  _BYTE v41[128];

  v3 = a3;
  v34 = objc_alloc_init((Class)PKPaymentService);
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v36;
    *(_QWORD *)&v7 = 138412290;
    v33 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "devicePrimaryPaymentApplication", v33));
        v13 = PKLegacyTransitNetworkIdentifierForCredentialType(objc_msgSend(v12, "paymentNetworkIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

        if (!v14)
        {
          v27 = sub_10043253C();
          v20 = objc_claimAutoreleasedReturnValue(v27);
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            goto LABEL_18;
          *(_WORD *)buf = 0;
          v21 = v20;
          v22 = "Default payment card has no TNI";
          v23 = 2;
          goto LABEL_15;
        }
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v14));
        if (v15)
        {
          v16 = (void *)v15;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v14));
          v18 = objc_msgSend(v17, "BOOLValue");

          if (v18)
          {
            v19 = sub_10043253C();
            v20 = objc_claimAutoreleasedReturnValue(v19);
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              goto LABEL_18;
            *(_DWORD *)buf = v33;
            v40 = v14;
            v21 = v20;
            v22 = "We've already found this default payment card (%@) and it has express enabled";
            v23 = 12;
LABEL_15:
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v22, buf, v23);
            goto LABEL_18;
          }
        }
        v24 = objc_msgSend(v11, "isRemotePass");
        v25 = objc_alloc((Class)NSNumber);
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueID"));
        if (v24)
          v26 = objc_msgSend(v34, "isExpressModeEnabledForRemotePassUniqueIdentifier:", v20);
        else
          v26 = objc_msgSend(v34, "isExpressModeEnabledForPassUniqueIdentifier:", v20);
        v28 = objc_msgSend(v25, "initWithBool:", v26);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, v14);

LABEL_18:
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v8);
  }

  v29 = sub_10043253C();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v4;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "_defaultPaymentCardExpressStatuses dictionary: %@", buf, 0xCu);
  }

  v31 = objc_msgSend(v4, "copy");
  return v31;
}

- (id)_userTransitPassesFromLibrary:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  char *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  char *v19;
  id v20;
  NSObject *v21;
  uint64_t Log;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init((Class)NSArray);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "passesOfType:", 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteSecureElementPasses"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7));

    v9 = sub_10043253C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = sub_10039DCD4(v8, &stru_1011C72F0);
      v12 = (char *)objc_claimAutoreleasedReturnValue(v11);
      v24 = 138412290;
      v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_userTransitPasses: %@", (uint8_t *)&v24, 0xCu);

    }
    v13 = sub_10039E080(v8, &stru_1011C71C0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_msgSend(v14, "count");
    if (v15 != -[NSObject count](v8, "count"))
    {
      v16 = sub_10043253C();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = sub_10039DCD4(v14, &stru_1011C72F0);
        v19 = (char *)objc_claimAutoreleasedReturnValue(v18);
        v24 = 138412290;
        v25 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Filtered non-transit passes. Returning: %@", (uint8_t *)&v24, 0xCu);

      }
    }
  }
  else
  {
    v20 = sub_10043253C();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      v24 = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPassManager.m";
      v26 = 1024;
      v27 = 392;
      v28 = 2082;
      v29 = "-[TransitPassManager _userTransitPassesFromLibrary:]";
      v30 = 2082;
      v31 = "library == nil";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. library CANNOT be nil", (uint8_t *)&v24, 0x26u);
    }

    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v8 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v24 = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/TransitPassManager.m";
      v26 = 1024;
      v27 = 392;
      v28 = 2082;
      v29 = "-[TransitPassManager _userTransitPassesFromLibrary:]";
      v30 = 2082;
      v31 = "library == nil";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. library CANNOT be nil", (uint8_t *)&v24, 0x26u);
    }
    v14 = 0;
  }

  return v14;
}

- (id)_identifiersForSecurePasses:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  TransitPassManager *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  if (v4)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v34 = v4;
    v6 = v4;
    v37 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (!v37)
      goto LABEL_23;
    v35 = v6;
    v36 = *(_QWORD *)v47;
    while (1)
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v36)
          objc_enumerationMutation(v6);
        v8 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "devicePrimaryPaymentApplication"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "supportedTransitNetworkIdentifiers"));

        if (objc_msgSend(v10, "count"))
        {
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          v38 = v10;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
          if (!v12)
            goto LABEL_20;
          v13 = v12;
          v14 = *(_QWORD *)v43;
          while (1)
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(_QWORD *)v43 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j);
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedDescription"));

              if (v17)
              {
                v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedDescription"));
              }
              else
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_allAvailablePasses, "objectForKeyedSubscript:", v16));

                if (!v19)
                  continue;
                v18 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_allAvailablePasses, "objectForKeyedSubscript:", v16));
              }
              v20 = (void *)v18;
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v16);

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
            if (!v13)
            {
LABEL_20:

              v6 = v35;
              v10 = v38;
              break;
            }
          }
        }

      }
      v37 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      if (!v37)
      {
LABEL_23:

        if (objc_msgSend(v5, "count"))
        {
          v21 = sub_10043253C();
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v23 = sub_10039DCD4(v6, &stru_1011C72F0);
            v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
            *(_DWORD *)buf = 138412546;
            v51 = v5;
            v52 = 2112;
            v53 = v24;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Found transit network identifiers %@ for passes: %@", buf, 0x16u);

          }
          v25 = objc_msgSend(v5, "copy");
        }
        else
        {
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_1007C1F90;
          v39[3] = &unk_1011C71E8;
          v28 = v5;
          v40 = v28;
          v41 = self;
          objc_msgSend(v6, "enumerateObjectsUsingBlock:", v39);
          v29 = sub_10043253C();
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = sub_10039DCD4(v6, &stru_1011C72F0);
            v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
            *(_DWORD *)buf = 138412546;
            v51 = v28;
            v52 = 2112;
            v53 = v32;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Using legacy transit network identifiers %@ for passes: %@", buf, 0x16u);

          }
          v25 = objc_msgSend(v28, "copy");

        }
        v4 = v34;
        goto LABEL_34;
      }
    }
  }
  v26 = sub_10043253C();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "securePasses is nil, returning an empty dictionary", buf, 2u);
  }

  v25 = v5;
LABEL_34:

  return v25;
}

- (void)_fetchAllAvailablePassesFromWallet
{
  id v3;
  NSObject *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *allAvailablePasses;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSMutableDictionary *v13;
  _QWORD v14[5];
  NSObject *v15;
  uint8_t buf[4];
  NSMutableDictionary *v17;

  if (-[NSMutableDictionary count](self->_allAvailablePasses, "count"))
  {
    v3 = sub_10043253C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_allAvailablePasses already exists. Not querying PKPaymentSetupViewController again.", buf, 2u);
    }
  }
  else
  {
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    allAvailablePasses = self->_allAvailablePasses;
    self->_allAvailablePasses = v5;

    v7 = sub_10043253C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "About to call +[PKPaymentSetupViewController paymentSetupFeaturesForConfiguration:completion:]", buf, 2u);
    }

    v4 = objc_alloc_init((Class)PKPaymentSetupConfiguration);
    v9 = dispatch_group_create();
    -[NSObject setReferrerIdentifier:](v4, "setReferrerIdentifier:", CFSTR("maps"));
    dispatch_group_enter(v9);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1007C22F0;
    v14[3] = &unk_1011B41D0;
    v14[4] = self;
    v10 = v9;
    v15 = v10;
    +[PKPaymentSetupViewController paymentSetupFeaturesForConfiguration:completion:](PKPaymentSetupViewController, "paymentSetupFeaturesForConfiguration:completion:", v4, v14);
    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    v11 = sub_10043253C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = self->_allAvailablePasses;
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Received response. Populated _allAvailablePasses: %@", buf, 0xCu);
    }

  }
}

- (void)fetchTransitMessageForRoute:(id)a3 paymentMethods:(id)a4 suggestions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  if (!v15)
  {
    if (!MapsFeature_IsEnabled_TransitPay())
      goto LABEL_6;
    if ((+[PKWalletVisibility isWalletVisible](PKWalletVisibility, "isWalletVisible") & 1) != 0)
    {
      objc_initWeak(location, self);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1007C26A4;
      v18[3] = &unk_1011C7238;
      objc_copyWeak(&v23, location);
      v18[4] = self;
      v22 = v13;
      v19 = v10;
      v20 = v11;
      v21 = v12;
      -[TransitPassManager _fetchLibrary:](self, "_fetchLibrary:", v18);

      objc_destroyWeak(&v23);
      objc_destroyWeak(location);
      goto LABEL_6;
    }
    v16 = sub_10043253C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Wallet is not visible. Returning.", (uint8_t *)location, 2u);
    }

  }
  (*((void (**)(id, id, _QWORD))v13 + 2))(v13, v10, 0);
LABEL_6:

}

- (id)_passForTopUpWithTransitPasses:(id)a3 forRouteTNIs:(id)a4 routeCost:(id)a5
{
  void *v5;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  double v25;
  void *i;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  id v37;
  NSObject *v38;
  double v39;
  id v40;
  NSObject *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  int v46;
  const __CFString *v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  const __CFString *v51;
  id v52;
  double v53;
  id v54;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  NSObject *obj;
  void *v63;
  uint64_t v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[5];
  id v76;
  uint8_t *v77;
  uint8_t buf[8];
  uint8_t *v79;
  uint64_t v80;
  char v81;
  _QWORD v82[4];
  id v83;
  uint8_t *v84;
  uint8_t v85[8];
  uint8_t *v86;
  uint64_t v87;
  char v88;
  _QWORD v89[4];
  id v90;
  uint8_t v91[4];
  id v92;
  _BYTE v93[128];
  _BYTE v94[128];

  v9 = a3;
  v10 = a4;
  v61 = a5;
  v59 = v9;
  v11 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v9);
  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_1007C3340;
  v89[3] = &unk_1011C7260;
  v60 = v10;
  v90 = v60;
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectsPassingTest:", v89));

  if (objc_msgSend(v63, "count"))
  {
    *(_QWORD *)v85 = 0;
    v86 = v85;
    v87 = 0x2020000000;
    v88 = 0;
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_1007C334C;
    v82[3] = &unk_1011C7288;
    v57 = objc_alloc_init((Class)PKPaymentService);
    v83 = v57;
    v84 = v85;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectsPassingTest:", v82));
    v58 = v12;
    if (v86[24])
    {
      v13 = sub_10043253C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "User has an express card which does not support top up, suppressing tip", buf, 2u);
      }

      v66 = 0;
      goto LABEL_65;
    }
    if (objc_msgSend(v12, "count"))
    {
      v17 = sub_10043253C();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "User has more than one express transit card, only considering those for top up", buf, 2u);
      }

      v19 = v58;
    }
    else
    {
      v19 = v63;
    }
    *(_QWORD *)buf = 0;
    v79 = buf;
    v80 = 0x2020000000;
    v81 = 0;
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_1007C3510;
    v75[3] = &unk_1011C72B0;
    v75[4] = self;
    v76 = v61;
    v77 = buf;
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectsPassingTest:", v75));

    if (v79[24])
    {
      v66 = 0;
LABEL_64:

      _Block_object_dispose(buf, 8);
LABEL_65:

      _Block_object_dispose(v85, 8);
      goto LABEL_66;
    }
    if (objc_msgSend(v63, "count"))
    {
      if (objc_msgSend(v63, "count") == (id)1)
      {
        v20 = sub_10043253C();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v91 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "User only has one remaining pass compatible with this route, using that.", v91, 2u);
        }

        v66 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "anyObject"));
        goto LABEL_64;
      }
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v23 = v63;
      v24 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v71, v94, 16);
      if (v24)
      {
        obj = v23;
        v66 = 0;
        v64 = *(_QWORD *)v72;
        v25 = -1.79769313e308;
        while (1)
        {
          v65 = v24;
          for (i = 0; i != v65; i = (char *)i + 1)
          {
            if (*(_QWORD *)v72 != v64)
              objc_enumerationMutation(obj);
            v27 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
            v28 = objc_msgSend(objc_alloc((Class)NSDecimalNumber), "initWithDouble:", 0.0);
            v69 = 0u;
            v70 = 0u;
            v67 = 0u;
            v68 = 0u;
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "transitProperties"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "balances"));

            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v93, 16);
            if (v31)
            {
              v32 = *(_QWORD *)v68;
              do
              {
                v33 = 0;
                v34 = v28;
                do
                {
                  if (*(_QWORD *)v68 != v32)
                    objc_enumerationMutation(v30);
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1)
                                                                                     + 8 * (_QWORD)v33), "amount"));
                  v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "decimalNumberByAdding:", v35));

                  v33 = (char *)v33 + 1;
                  v34 = v28;
                }
                while (v31 != v33);
                v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v93, 16);
              }
              while (v31);
            }

            objc_msgSend(v28, "doubleValue");
            if (v36 == v25)
            {
              if ((objc_msgSend(v27, "isRemotePass") & 1) != 0)
                goto LABEL_59;
              v37 = sub_10043253C();
              v38 = objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v91 = 0;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Two passes have the same balance. Using the local pass", v91, 2u);
              }

            }
            else
            {
              objc_msgSend(v28, "doubleValue");
              if (v39 <= v25)
                goto LABEL_59;
              v40 = sub_10043253C();
              v41 = objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                v42 = v27;
                v43 = objc_alloc((Class)NSString);
                v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedDescription"));
                v45 = (void *)v44;
                if (v44)
                {
                  v46 = 0;
                  v47 = (const __CFString *)v44;
                }
                else
                {
                  v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "organizationName"));
                  v5 = (void *)v48;
                  if (v48)
                  {
                    v46 = 0;
                    v47 = (const __CFString *)v48;
                  }
                  else
                  {
                    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedName"));
                    v56 = (void *)v49;
                    v5 = 0;
                    if (v49)
                      v47 = (const __CFString *)v49;
                    else
                      v47 = CFSTR("{pass has no description}");
                    v46 = 1;
                  }
                }
                v50 = objc_msgSend(v42, "isRemotePass");
                v51 = CFSTR("NO");
                if (v50)
                  v51 = CFSTR("YES");
                v52 = objc_msgSend(v43, "initWithFormat:", CFSTR("%@: %@, isRemote: %@"), v42, v47, v51);
                if (v46)

                if (!v45)
                *(_DWORD *)v91 = 138412290;
                v92 = v52;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Current pass with the highest value is %@", v91, 0xCu);

              }
              objc_msgSend(v28, "doubleValue");
              v25 = v53;
            }
            v54 = v27;

            v66 = v54;
LABEL_59:

          }
          v24 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, v94, 16);
          if (!v24)
          {
            v23 = obj;
            goto LABEL_63;
          }
        }
      }
    }
    else
    {
      v22 = sub_10043253C();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v91 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "User has no remaining passes that support top up with a balance less than the route cost", v91, 2u);
      }
    }
    v66 = 0;
LABEL_63:

    goto LABEL_64;
  }
  v15 = sub_10043253C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v85 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "User has no passes supported on the route", v85, 2u);
  }

  v66 = 0;
LABEL_66:

  return v66;
}

- (void)_passKitLibraryDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_10043253C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received _passKitLibraryDidChange, taking appropriate action.", v6, 2u);
  }

  -[MapsSuggestionsCanKicker kickCanBySameTime](self->_passKitLibraryDidChangeCanKicker, "kickCanBySameTime");
}

- (void)_passKitLibraryMayHaveChanged
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TransitPassManager delegate](self, "delegate"));
  objc_msgSend(v3, "transitPassManagerDidChange:", self);

}

- (id)transitSystemsForRoute:(id)a3 withSupportedPaymentMethods:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  id v28;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  NSObject *v37;
  _BYTE v38[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSMutableSet);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v30 = v5;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "baseTransitFares"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "cashOnly"))
        {
          v13 = sub_10043253C();
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
            *(_DWORD *)buf = 138412290;
            v37 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Checking the next fare because the fare with value %@ is cashOnly", buf, 0xCu);

          }
        }
        else
        {
          v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
          if (objc_msgSend(v12, "supportedPaymentMethodIndexsCount"))
          {
            v16 = 0;
            do
            {
              v17 = *((unsigned int *)objc_msgSend(v12, "supportedPaymentMethodIndexs") + v16);
              if ((unint64_t)objc_msgSend(v6, "count") > v17)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v17));
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
                -[NSObject addObject:](v14, "addObject:", v19);

              }
              ++v16;
            }
            while (v16 < (unint64_t)objc_msgSend(v12, "supportedPaymentMethodIndexsCount"));
          }
          v20 = sub_10043253C();
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v14;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Supported transit identifiers for fare: %@", buf, 0xCu);
          }

          if (!-[NSObject count](v14, "count"))
          {
            v22 = sub_10043253C();
            v23 = objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Route rejected because we found no supported cards in a fare", buf, 2u);
            }

            -[NSObject removeAllObjects](v7, "removeAllObjects");
            goto LABEL_30;
          }
          if (-[NSObject count](v7, "count"))
            -[NSObject intersectSet:](v7, "intersectSet:", v14);
          else
            -[NSObject unionSet:](v7, "unionSet:", v14);
          if (!-[NSObject count](v7, "count"))
          {
            v24 = sub_10043253C();
            v25 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Route rejected because there are no pass identifiers", buf, 2u);
            }

LABEL_30:
            goto LABEL_31;
          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_31:

  v26 = sub_10043253C();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v7;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Pass Identifiers: %@", buf, 0xCu);
  }

  v28 = -[NSObject copy](v7, "copy");
  return v28;
}

- (id)currencyAmountForRoute:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  const char *v28;
  id v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  NSObject *v37;
  __int16 v38;
  NSObject *v39;
  _BYTE v40[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "baseTransitFares"));
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "count"))
  {
    v24 = sub_10043253C();
    v7 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Route rejected because we found no base fares on route.", buf, 2u);
    }
    v23 = 0;
    goto LABEL_35;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currencyCode"));

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (!v9)
  {

    goto LABEL_25;
  }
  v10 = v9;
  v31 = v3;
  v11 = 0;
  v12 = *(_QWORD *)v33;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v33 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
      if ((objc_msgSend(v14, "cashOnly") & 1) == 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currencyCode"));
          v17 = -[NSObject isEqualToString:](v7, "isEqualToString:", v16);

          if ((v17 & 1) != 0)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
            v19 = v18;
            if (v11)
            {
              v20 = objc_claimAutoreleasedReturnValue(-[NSObject decimalNumberByAdding:](v11, "decimalNumberByAdding:", v18));

              v11 = v20;
            }
            else
            {
              v11 = v18;
            }

            continue;
          }
          v29 = sub_10043253C();
          v27 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v28 = "Mixed currencies are unsupported. Returning.";
            goto LABEL_31;
          }
        }
        else
        {
          v26 = sub_10043253C();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v28 = "fare.value is nil. Returning.";
LABEL_31:
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, v28, buf, 2u);
          }
        }
        v3 = v31;

        goto LABEL_33;
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v10)
      continue;
    break;
  }

  v3 = v31;
  if (v11)
  {
    v21 = sub_10043253C();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v11;
      v38 = 2112;
      v39 = v7;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "totalFareValue = %@, currencyCode = %@", buf, 0x16u);
    }

    v23 = objc_msgSend(objc_alloc((Class)PKCurrencyAmount), "initWithAmount:currency:exponent:", v11, v7, 0);
    goto LABEL_34;
  }
LABEL_25:
  v25 = sub_10043253C();
  v11 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "totalFareValue is nil. Are all fares cash only? Returning.", buf, 2u);
  }
LABEL_33:
  v23 = 0;
LABEL_34:

LABEL_35:
  return v23;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransitPassManager delegate](self, "delegate", a3, a4));
  objc_msgSend(v5, "transitPassManagerDidChange:", self);

}

- (TransitPassManagerDelegate)delegate
{
  return (TransitPassManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passKitLibraryDidChangeCanKicker, 0);
  objc_storeStrong((id *)&self->_allAvailablePasses, 0);
  objc_storeStrong((id *)&self->_libraryToNotUseDirectly, 0);
  objc_storeStrong((id *)&self->_libraryQueue, 0);
}

@end
