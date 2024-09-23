@implementation TransitPayFeatureDiscoveryMetadataStore

- (TransitPayFeatureDiscoveryMetadataStore)initWithTouristStatus:(BOOL)a3
{
  TransitPayFeatureDiscoveryMetadataStore *v4;
  TransitPayFeatureDiscoveryMetadataStore *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *defaultsDictionary;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *tipInfoDictionary;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TransitPayFeatureDiscoveryMetadataStore;
  v4 = -[TransitPayFeatureDiscoveryMetadataStore init](&v19, "init");
  v5 = v4;
  if (v4)
  {
    v4->_isTourist = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dictionaryForKey:", CFSTR("__internal__TransitPayTipInfoKey")));
    v8 = (NSMutableDictionary *)objc_msgSend(v7, "mutableCopy");
    defaultsDictionary = v5->_defaultsDictionary;
    v5->_defaultsDictionary = v8;

    v10 = v5->_defaultsDictionary;
    if (!v10)
    {
      v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v12 = v5->_defaultsDictionary;
      v5->_defaultsDictionary = v11;

      v10 = v5->_defaultsDictionary;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v10, "objectForKey:", CFSTR("TransitPayTipInfoDictionary")));
    v14 = (NSMutableDictionary *)objc_msgSend(v13, "mutableCopy");
    tipInfoDictionary = v5->_tipInfoDictionary;
    v5->_tipInfoDictionary = v14;

    if (!v5->_tipInfoDictionary)
    {
      v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v17 = v5->_tipInfoDictionary;
      v5->_tipInfoDictionary = v16;

    }
  }
  return v5;
}

- (BOOL)shouldDisplayTipInMarket:(unint64_t)a3 tipType:(int)a4 sinkType:(int)a5
{
  uint64_t v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  NSMutableDictionary *tipInfoDictionary;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  NSString *v27;
  void *v28;
  id v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t UInteger;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v45;
  id v46;
  uint8_t buf[4];
  unint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  unint64_t v52;

  if (a3)
  {
    v5 = *(_QWORD *)&a4;
    if (a4 == 5)
    {
      v6 = sub_10043253C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      v8 = 1;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No teardown logic for top-up tips", buf, 2u);
      }
      goto LABEL_29;
    }
    tipInfoDictionary = self->_tipInfoDictionary;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a3));
    v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](tipInfoDictionary, "objectForKey:", v15));

    if (!v7)
    {
      v24 = sub_10043253C();
      v23 = objc_claimAutoreleasedReturnValue(v24);
      v8 = 1;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v25 = (void *)objc_opt_class(self);
        v26 = v25;
        v27 = NSStringFromSelector(a2);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        *(_DWORD *)buf = 138412802;
        v48 = (unint64_t)v25;
        v49 = 2112;
        v50 = v28;
        v51 = 2048;
        v52 = a3;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%@ %@: This market: %llu has no tip data", buf, 0x20u);

      }
      goto LABEL_28;
    }
    v16 = v7;
    v46 = 0;
    v17 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(_TransitPayTipInteractionRecord), v16, &v46);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = v46;
    if (v19)
    {
      v20 = sub_10043253C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "debugDescription"));
        *(_DWORD *)buf = 138412290;
        v48 = (unint64_t)v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "There was an error unarchiving the tip metadata: %@", buf, 0xCu);

      }
      v23 = 0;
    }
    else
    {
      v23 = v18;
    }

    if (-[TransitPayFeatureDiscoveryMetadataStore _userHasBecomeLocalAndTipShouldDisplayInMarket:tipType:currentTip:](self, "_userHasBecomeLocalAndTipShouldDisplayInMarket:tipType:currentTip:", a3, v5, v23))
    {
      v29 = sub_10043253C();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      v8 = 1;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v48 = a3;
        v31 = "The user dismissed the open-loop tip when they were a tourist and are now being shown the closed-loop tip "
              "since they are a local in this market: %llu";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, v31, buf, 0xCu);
      }
    }
    else
    {
      if (a5 == 4)
      {
        v32 = objc_claimAutoreleasedReturnValue(-[NSObject dismissalDate](v23, "dismissalDate"));
        if (v32)
        {
          v33 = (void *)v32;
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dismissalDate](v23, "dismissalDate"));
          UInteger = GEOConfigGetUInteger(MapsConfig_TransitPayDismissalDuration, off_1014B43B8);
          v36 = v34;
          v37 = objc_alloc_init((Class)NSDateComponents);
          objc_msgSend(v37, "setDay:", -UInteger);
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "dateByAddingComponents:toDate:options:", v37, v39, 0));

          v41 = objc_msgSend(v36, "compare:", v40);
          if (v41 == (id)-1)
          {
            v45 = sub_10043253C();
            v30 = objc_claimAutoreleasedReturnValue(v45);
            v8 = 1;
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              goto LABEL_27;
            *(_DWORD *)buf = 134217984;
            v48 = a3;
            v31 = "The tip has been dismissed in this market, but it is now reappearing: %llu";
            goto LABEL_19;
          }
        }
      }
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dismissalDate](v23, "dismissalDate"));

      if (!v42)
      {
        v8 = 1;
        goto LABEL_28;
      }
      v43 = sub_10043253C();
      v30 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v48 = a3;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "The tip was either manually or automatically dismissed in this market: %llu", buf, 0xCu);
      }
      v8 = 0;
    }
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  v9 = sub_10043253C();
  v7 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v48 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Server gave us invalid market MUID: %llu", buf, 0xCu);
  }
  v8 = 0;
LABEL_29:

  return v8;
}

- (void)handleManualTipDismissForMarket:(unint64_t)a3 tipType:(int)a4 sinkType:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  id v14;
  NSMutableDictionary *tipInfoDictionary;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (a3)
  {
    if ((_DWORD)v6 == 5)
    {
      v9 = sub_10043253C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v11 = "No teardown logic for top-up tips";
        v12 = v10;
        v13 = 2;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
      }
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(-[TransitPayFeatureDiscoveryMetadataStore _tipInfoForMarket:tipType:](self, "_tipInfoForMarket:tipType:", a3, v6));
      -[NSObject userDismissedInSink:](v10, "userDismissedInSink:", v5);
      tipInfoDictionary = self->_tipInfoDictionary;
      v23 = 0;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v23));
      v17 = v23;
      if (v17)
      {
        v18 = sub_10043253C();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedDescription"));
          *(_DWORD *)buf = 138412290;
          v25 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "There was an error archiving the tip metadata: %@", buf, 0xCu);

        }
        v21 = 0;
      }
      else
      {
        v21 = v16;
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a3));
      -[NSMutableDictionary setObject:forKey:](tipInfoDictionary, "setObject:forKey:", v21, v22);

      -[TransitPayFeatureDiscoveryMetadataStore _persistData](self, "_persistData");
    }
  }
  else
  {
    v14 = sub_10043253C();
    v10 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v25 = 0;
      v11 = "Server gave us invalid market MUID: %llu";
      v12 = v10;
      v13 = 12;
      goto LABEL_7;
    }
  }

}

- (void)handleTipDisplayForMarket:(unint64_t)a3 tipType:(int)a4 sinkType:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  id v23;
  NSObject *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  uint64_t UInteger;
  NSMutableDictionary *tipInfoDictionary;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  uint8_t buf[4];
  unint64_t v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (a3)
  {
    if ((_DWORD)v6 == 5)
    {
      v9 = sub_10043253C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v11 = "No teardown logic for top-up tips";
        v12 = v10;
        v13 = 2;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
      }
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(-[TransitPayFeatureDiscoveryMetadataStore _tipInfoForMarket:tipType:](self, "_tipInfoForMarket:tipType:", a3, v6));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastDisplayed](v10, "lastDisplayed"));
      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastDisplayed](v10, "lastDisplayed"));
        v17 = objc_alloc_init((Class)NSDateComponents);
        objc_msgSend(v17, "setDay:", -1);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dateByAddingComponents:toDate:options:", v17, v19, 0));

        v21 = objc_msgSend(v16, "compare:", v20) == (id)-1;
      }
      else
      {
        v21 = 1;
      }

      if ((_DWORD)v5 == 4 || (_DWORD)v5 == 2 && v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject incrementDisplayCountForSink:](v10, "incrementDisplayCountForSink:", v5));
        v23 = sub_10043253C();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = CFSTR("UNKNOWN SINK TYPE");
          if ((_DWORD)v5 == 4)
            v25 = CFSTR("SinkTypeRoutePlanning");
          if ((_DWORD)v5 == 2)
            v26 = CFSTR("SinkTypeMapsHome");
          else
            v26 = v25;
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastDisplayed](v10, "lastDisplayed"));
          *(_DWORD *)buf = 134218754;
          v39 = a3;
          v40 = 2112;
          v41 = v26;
          v42 = 2112;
          v43 = v27;
          v44 = 2112;
          v45 = v22;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Incremented tip displays in market: %llu for %@. Last tip display: %@. Current count: %@", buf, 0x2Au);

        }
        UInteger = GEOConfigGetUInteger(MapsConfig_TransitPayMaxAmountOfTipDisplays, off_1014B43A8);
        if ((uint64_t)-[NSObject displayCountForSink:](v10, "displayCountForSink:", v5) >= UInteger)
          -[NSObject userDismissedInSink:](v10, "userDismissedInSink:", v5);
        tipInfoDictionary = self->_tipInfoDictionary;
        v37 = 0;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v37));
        v31 = v37;
        if (v31)
        {
          v32 = sub_10043253C();
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedDescription"));
            *(_DWORD *)buf = 138412290;
            v39 = (unint64_t)v34;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "There was an error archiving the tip metadata: %@", buf, 0xCu);

          }
          v35 = 0;
        }
        else
        {
          v35 = v30;
        }

        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a3));
        -[NSMutableDictionary setObject:forKey:](tipInfoDictionary, "setObject:forKey:", v35, v36);

        -[TransitPayFeatureDiscoveryMetadataStore _persistData](self, "_persistData");
      }
    }
  }
  else
  {
    v14 = sub_10043253C();
    v10 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v39 = 0;
      v11 = "Server gave us invalid market MUID: %llu";
      v12 = v10;
      v13 = 12;
      goto LABEL_7;
    }
  }

}

- (id)_tipInfoForMarket:(unint64_t)a3 tipType:(int)a4
{
  uint64_t v4;
  NSMutableDictionary *tipInfoDictionary;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  _TransitPayTipInteractionRecord *v17;
  id v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  unint64_t v23;

  v4 = *(_QWORD *)&a4;
  tipInfoDictionary = self->_tipInfoDictionary;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](tipInfoDictionary, "objectForKey:", v8));

  if (v9)
  {
    v10 = v9;
    v21 = 0;
    v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(_TransitPayTipInteractionRecord), v10, &v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = v21;
    if (v13)
    {
      v14 = sub_10043253C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "debugDescription"));
        *(_DWORD *)buf = 138412290;
        v23 = (unint64_t)v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "There was an error unarchiving the tip metadata: %@", buf, 0xCu);

      }
      v17 = 0;
    }
    else
    {
      v17 = v12;
    }

  }
  else
  {
    v18 = sub_10043253C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v23 = a3;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "This market: %llu has no tip data", buf, 0xCu);
    }

    v17 = -[_TransitPayTipInteractionRecord initWithTipType:isTourist:]([_TransitPayTipInteractionRecord alloc], "initWithTipType:isTourist:", v4, self->_isTourist);
  }

  return v17;
}

- (BOOL)_userHasBecomeLocalAndTipShouldDisplayInMarket:(unint64_t)a3 tipType:(int)a4 currentTip:(id)a5
{
  id v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  _TransitPayTipInteractionRecord *v12;
  NSMutableDictionary *tipInfoDictionary;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  char *v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t Log;
  void *v23;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;

  v8 = a5;
  v9 = v8;
  v10 = v8 != 0;
  if (!v8)
  {
    v20 = sub_10043253C();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/TransitPayFeatureDiscoveryMetadataStore.m";
      v28 = 1024;
      v29 = 218;
      v30 = 2082;
      v31 = "-[TransitPayFeatureDiscoveryMetadataStore _userHasBecomeLocalAndTipShouldDisplayInMarket:tipType:currentTip:]";
      v32 = 2082;
      v33 = "nil == currentTip";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Current tip cannot be nil", buf, 0x26u);
    }

    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v12 = (_TransitPayTipInteractionRecord *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/TransitPayFeatureDiscoveryMetadataStore.m";
      v28 = 1024;
      v29 = 218;
      v30 = 2082;
      v31 = "-[TransitPayFeatureDiscoveryMetadataStore _userHasBecomeLocalAndTipShouldDisplayInMarket:tipType:currentTip:]";
      v32 = 2082;
      v33 = "nil == currentTip";
      _os_log_impl((void *)&_mh_execute_header, &v12->super, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Current tip cannot be nil", buf, 0x26u);
    }
    goto LABEL_18;
  }
  if ((objc_msgSend(v8, "tipType") == 1 || objc_msgSend(v9, "tipType") == 2)
    && objc_msgSend(v9, "isTourist"))
  {
    v11 = 0;
    if (a4 == 3 && !self->_isTourist)
    {
      v12 = -[_TransitPayTipInteractionRecord initWithTipType:isTourist:]([_TransitPayTipInteractionRecord alloc], "initWithTipType:isTourist:", 3, self->_isTourist);
      tipInfoDictionary = self->_tipInfoDictionary;
      v25 = 0;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v25));
      v15 = v25;
      if (v15)
      {
        v16 = sub_10043253C();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedDescription"));
          *(_DWORD *)buf = 138412290;
          v27 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "There was an error archiving the tip metadata: %@", buf, 0xCu);

        }
        v19 = 0;
      }
      else
      {
        v19 = v14;
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a3));
      -[NSMutableDictionary setObject:forKey:](tipInfoDictionary, "setObject:forKey:", v19, v23);

      -[TransitPayFeatureDiscoveryMetadataStore _persistData](self, "_persistData");
LABEL_18:

      v11 = v10;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_persistData
{
  NSMutableDictionary *defaultsDictionary;
  id v4;
  id v5;
  id v6;

  defaultsDictionary = self->_defaultsDictionary;
  v4 = -[NSMutableDictionary copy](self->_tipInfoDictionary, "copy");
  -[NSMutableDictionary setObject:forKey:](defaultsDictionary, "setObject:forKey:", v4, CFSTR("TransitPayTipInfoDictionary"));

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = -[NSMutableDictionary copy](self->_defaultsDictionary, "copy");
  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("__internal__TransitPayTipInfoKey"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipInfoDictionary, 0);
  objc_storeStrong((id *)&self->_defaultsDictionary, 0);
}

@end
