@implementation OSIWalletMonitor

+ (id)wallet
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_100076848;
  if (!qword_100076848)
  {
    v3 = objc_alloc_init((Class)PKPassLibrary);
    v4 = (void *)qword_100076848;
    qword_100076848 = (uint64_t)v3;

    v2 = (void *)qword_100076848;
  }
  return v2;
}

- (OSIWalletMonitor)init
{
  OSIWalletMonitor *v2;
  os_log_t v3;
  OS_os_log *log;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OSIWalletMonitor;
  v2 = -[OSIWalletMonitor init](&v8, "init");
  v3 = os_log_create("com.apple.osintelligence", "walletmonitor");
  log = v2->_log;
  v2->_log = (OS_os_log *)v3;

  v5 = +[OSIWalletMonitor wallet](OSIWalletMonitor, "wallet");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", v2, "passLibraryDidChange:", PKPassLibraryDidChangeNotification, 0);

  return v2;
}

- (void)passLibraryDidChange:(id)a3
{
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = objc_claimAutoreleasedReturnValue(-[OSIWalletMonitor log](self, "log", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Boarding pass has changed", buf, 2u);
  }

  v5 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DCB0;
  block[3] = &unk_100060B48;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)relevantEventDeadline
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  NSObject *log;
  NSObject *v22;
  void *v23;
  void *v24;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OSIWalletMonitor wallet](OSIWalletMonitor, "wallet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "passesOfType:", 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:", -10800.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:", 86400.0));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "style") == (id)4)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "relevantDate"));

          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "relevantDate"));
            objc_msgSend(v14, "timeIntervalSinceDate:", v5);
            if (v15 < 0.0)
            {

            }
            else
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "relevantDate"));
              objc_msgSend(v16, "timeIntervalSinceDate:", v6);
              v18 = v17;

              if (v18 <= 0.0)
              {
                log = self->_log;
                if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                {
                  v22 = log;
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedName"));
                  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "relevantDate"));
                  *(_DWORD *)buf = 138412546;
                  v32 = v23;
                  v33 = 2112;
                  v34 = v24;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Found pass, forcing immediate charge: %@, %@", buf, 0x16u);

                }
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "relevantDate"));

                goto LABEL_18;
              }
            }
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v9)
        continue;
      break;
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
LABEL_18:

  return v19;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

@end
