@implementation WiFiLocaleManager

- (id)applySetCountryCodeExceptions:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  int v6;
  __CFString *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v4 = v3;
  if (!-[__CFString caseInsensitiveCompare:](v3, "caseInsensitiveCompare:", CFSTR("EU")))
  {

    v4 = CFSTR("DE");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = v3;
      v8 = 2112;
      v9 = CFSTR("DE");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Switching locale %@ => %@", (uint8_t *)&v6, 0x16u);
    }
  }
  if (!-[__CFString caseInsensitiveCompare:](v3, "caseInsensitiveCompare:", CFSTR("IR"))
    || !-[__CFString caseInsensitiveCompare:](v3, "caseInsensitiveCompare:", CFSTR("KP")))
  {

    v4 = &stru_1E881F240;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = v3;
      v8 = 2112;
      v9 = &stru_1E881F240;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Switching locale %@ => %@", (uint8_t *)&v6, 0x16u);
    }
  }

  return v4;
}

- (void)determineLocale:(unsigned __int8)a3
{
  int v3;
  double v5;
  double v6;
  void *v7;
  BOOL v8;
  void *v9;
  __CFString *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  int v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  NSObject *v36;
  int v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v3 = a3;
  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5;
  -[WiFiLocaleManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "suspendLocaleCheck") == 1)
  {

LABEL_4:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[WiFiLocaleManager determineLocale:].cold.1(v3, self);
    v9 = 0;
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v8 = -[WiFiLocaleManager localeCheckSuspended](self, "localeCheckSuspended");

  if (v8)
    goto LABEL_4;
  -[WiFiLocaleManager delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getDeviceCountryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v9))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Default locale in use, determine fresh locale", (uint8_t *)&v37, 2u);
    }
    -[WiFiLocaleManager setLocaleCountryCode:](self, "setLocaleCountryCode:", 0);
    -[WiFiLocaleManager setLocaleSource:](self, "setLocaleSource:", 0);
  }
  if (!v3 && !-[WiFiLocaleManager shouldDetermineNewLocale](self, "shouldDetermineNewLocale"))
  {
    -[WiFiLocaleManager localeLastUpdatedTime](self, "localeLastUpdatedTime");
    v13 = v6 - v12;
    -[WiFiLocaleManager localeTimeout](self, "localeTimeout");
    if (v13 < v14)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[WiFiLocaleManager localeCountryCode](self, "localeCountryCode");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WiFiLocaleManager dateFormatter](self, "dateFormatter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0C99D68];
        -[WiFiLocaleManager localeLastUpdatedTime](self, "localeLastUpdatedTime");
        objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringFromDate:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[WiFiLocaleManager localeLastUpdatedTime](self, "localeLastUpdatedTime");
        v21 = (v6 - v20) / 60.0;
        -[WiFiLocaleManager localeTimeout](self, "localeTimeout");
        v37 = 138413058;
        v38 = v15;
        v39 = 2112;
        v40 = v19;
        v41 = 2048;
        v42 = v21;
        v43 = 2048;
        v44 = v22 / 60.0;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Locale <%@> was determined at %@, has been valid for %.2f mins [cache timeout %.2f mins]", (uint8_t *)&v37, 0x2Au);

      }
      goto LABEL_7;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v37 = 67109120;
    LODWORD(v38) = v3;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Trying to determine locale (forceCheck %d)...", (uint8_t *)&v37, 8u);
  }
  -[WiFiLocaleManager getLocaleFromCompanion](self, "getLocaleFromCompanion");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v10))
  {
    v26 = 1;
    goto LABEL_46;
  }
  -[WiFiLocaleManager locationManager](self, "locationManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isAuthorized");

  if (v24)
  {
    -[WiFiLocaleManager getLocaleFromMcc](self, "getLocaleFromMcc");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v25))
    {
      v26 = 2;
LABEL_45:
      v10 = v25;
      goto LABEL_46;
    }
  }
  else
  {
    v25 = v10;
  }
  -[WiFiLocaleManager locationManager](self, "locationManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isAuthorized");

  if (v28)
  {
    -[WiFiLocaleManager locationManager](self, "locationManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "latestLocation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[WiFiLocaleManager localeTimeout](self, "localeTimeout");
    v31 = +[WiFiLocationManager isLocationValid:uptoSeconds:isHighAccuracy:](WiFiLocationManager, "isLocationValid:uptoSeconds:isHighAccuracy:", v30, 0);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v37 = 67109120;
      LODWORD(v38) = v31;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Trying to get cached/leeched location (isValid %d)", (uint8_t *)&v37, 8u);
    }
    if (v31)
    {
      -[WiFiLocaleManager getLocaleFromLocation:](self, "getLocaleFromLocation:", v30);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v10))
      {

        v26 = 3;
        goto LABEL_46;
      }
    }
    else
    {
      v10 = v25;
    }

  }
  else
  {
    v10 = v25;
  }
  -[WiFiLocaleManager locationManager](self, "locationManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isAuthorized");

  if (v33)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Trying to get low accuracy location", (uint8_t *)&v37, 2u);
    }
    -[WiFiLocaleManager locationManager](self, "locationManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "requestLowAccuracyLocationUpdate");

    -[WiFiLocaleManager setIsWaitingForLocationUpdate:](self, "setIsWaitingForLocationUpdate:", 1);
    v26 = 0;
LABEL_46:
    if (!v10)
      goto LABEL_8;
    goto LABEL_47;
  }
  -[WiFiLocaleManager getLocaleFromMultiple80211d](self, "getLocaleFromMultiple80211d");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v25))
  {
    v26 = 4;
    goto LABEL_45;
  }
  -[WiFiLocaleManager getLocaleFromPeer](self, "getLocaleFromPeer");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v10))
  {
    v26 = 5;
    goto LABEL_46;
  }
  -[WiFiLocaleManager getLocaleFromTimezone](self, "getLocaleFromTimezone");
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v25))
  {
    v26 = 6;
    goto LABEL_45;
  }
  -[WiFiLocaleManager getLocaleFromUserDefaults](self, "getLocaleFromUserDefaults");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v10))
  {
    v26 = 7;
    goto LABEL_46;
  }

  v26 = 0;
  v10 = &stru_1E881F240;
LABEL_47:
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[WiFiLocaleManager setLocaleLastUpdatedTime:](self, "setLocaleLastUpdatedTime:");
  -[WiFiLocaleManager setAggressiveRetryAttemptsRemaining:](self, "setAggressiveRetryAttemptsRemaining:", 5);
  -[WiFiLocaleManager retryTimer](self, "retryTimer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[WiFiLocaleManager retryTimer](self, "retryTimer");
    v36 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v36);

    -[WiFiLocaleManager setRetryTimer:](self, "setRetryTimer:", 0);
  }
  -[WiFiLocaleManager setCountryCode:source:](self, "setCountryCode:source:", v10, v26);
LABEL_8:

}

- (BOOL)isDefaultCountryCode:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = v3 == 0;
  if (!objc_msgSend(v3, "caseInsensitiveCompare:", &stru_1E881F240)
    || !objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("X0"))
    || !objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("X2"))
    || !objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("X3"))
    || !objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("XZ")))
  {
    v4 = 1;
  }

  return v4;
}

- (void)setCountryCode:(id)a3 source:(int)a4
{
  uint64_t v4;
  id v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  WiFiLocaleManager *v33;
  uint64_t v34;
  int v35;
  void *v36;
  NSObject *v37;
  dispatch_source_t v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  dispatch_time_t v42;
  dispatch_time_t v43;
  _QWORD handler[4];
  id v45;
  WiFiLocaleManager *v46;
  int v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v4 = *(_QWORD *)&a4;
  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[WiFiLocaleManager aggressiveRetryAttemptsRemaining](self, "aggressiveRetryAttemptsRemaining");
  if (!v6)
  {
    v11 = 0;
    goto LABEL_46;
  }
  v8 = v7;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[WiFiLocaleManager localeCountryCode](self, "localeCountryCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiLocaleManager getStringOfLocaleSource:](WiFiLocaleManager, "getStringOfLocaleSource:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v49 = v9;
    v50 = 2112;
    v51 = v6;
    v52 = 2112;
    v53 = v10;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Current locale: <%@>, determined new locale: <%@> using locale source: <%@>", buf, 0x20u);

  }
  -[WiFiLocaleManager applySetCountryCodeExceptions:](self, "applySetCountryCodeExceptions:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiLocaleManager delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[WiFiLocaleManager delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uppercaseString");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUserDefaultCountryCode:", v13);

  }
  -[WiFiLocaleManager localeCountryCode](self, "localeCountryCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[WiFiLocaleManager localeCountryCode](self, "localeCountryCode");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "caseInsensitiveCompare:", v13))
    {

      goto LABEL_31;
    }
  }
  -[WiFiLocaleManager localeCountryCode](self, "localeCountryCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

    if (v15)
    {

    }
  }
  else
  {
    v17 = objc_msgSend(v11, "caseInsensitiveCompare:", &stru_1E881F240);

    if (v15)
    {

    }
    if (!v17)
    {
LABEL_31:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v20 = MEMORY[0x1E0C81028];
        v21 = "Locale has not changed, no need to set country code";
        goto LABEL_33;
      }
      goto LABEL_46;
    }
  }
  -[WiFiLocaleManager localeCountryCode](self, "localeCountryCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v18)
    || !-[WiFiLocaleManager isDefaultCountryCode:](self, "isDefaultCountryCode:", v11))
  {

LABEL_21:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v11;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Attempting to set locale to <%@>", buf, 0xCu);
    }
    -[WiFiLocaleManager delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uppercaseString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "setDeviceCountryCode:", v23);

    if (v24 == 1)
    {
      -[WiFiLocaleManager retryTimer](self, "retryTimer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[WiFiLocaleManager retryTimer](self, "retryTimer");
        v26 = objc_claimAutoreleasedReturnValue();
        dispatch_source_cancel(v26);

        -[WiFiLocaleManager setRetryTimer:](self, "setRetryTimer:", 0);
      }
      v27 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v11, "uppercaseString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v27, "initWithString:", v28);
      -[WiFiLocaleManager setLocaleCountryCode:](self, "setLocaleCountryCode:", v29);

      -[WiFiLocaleManager setLocaleSource:](self, "setLocaleSource:", v4);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[WiFiLocaleManager localeCountryCode](self, "localeCountryCode");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v49 = v30;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Locale set to: <%@>", buf, 0xCu);

      }
      if (-[WiFiLocaleManager testModeEnabled](self, "testModeEnabled"))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("Country Code was set"), 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "postNotification:", v32);

      }
      v33 = self;
      v34 = 5;
    }
    else
    {
      -[WiFiLocaleManager setLocaleCountryCode:](self, "setLocaleCountryCode:", 0);
      -[WiFiLocaleManager setLocaleSource:](self, "setLocaleSource:", 0);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        if (v8 > 0)
          v35 = 1;
        else
          v35 = 30;
        *(_DWORD *)buf = 138412546;
        v49 = v6;
        v50 = 1024;
        LODWORD(v51) = v35;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error: Failed to set locale, retrying %@ every %u seconds", buf, 0x12u);
      }
      -[WiFiLocaleManager retryTimer](self, "retryTimer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
      {
        -[WiFiLocaleManager queue](self, "queue");
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v37);
        -[WiFiLocaleManager setRetryTimer:](self, "setRetryTimer:", v38);

        -[WiFiLocaleManager retryTimer](self, "retryTimer");
        v39 = objc_claimAutoreleasedReturnValue();
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __43__WiFiLocaleManager_setCountryCode_source___block_invoke;
        handler[3] = &unk_1E881C988;
        v45 = v6;
        v46 = self;
        v47 = v4;
        dispatch_source_set_event_handler(v39, handler);

        -[WiFiLocaleManager retryTimer](self, "retryTimer");
        v40 = objc_claimAutoreleasedReturnValue();
        dispatch_activate(v40);

      }
      -[WiFiLocaleManager retryTimer](self, "retryTimer");
      v41 = objc_claimAutoreleasedReturnValue();
      if (v8 < 1)
      {
        v43 = dispatch_time(0, 30000000000);
        dispatch_source_set_timer(v41, v43, 0xFFFFFFFFFFFFFFFFLL, 0);

        goto LABEL_46;
      }
      v42 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v41, v42, 0xFFFFFFFFFFFFFFFFLL, 0);

      if (-[WiFiLocaleManager aggressiveRetryAttemptsRemaining](self, "aggressiveRetryAttemptsRemaining") < 1)
        goto LABEL_46;
      v34 = -[WiFiLocaleManager aggressiveRetryAttemptsRemaining](self, "aggressiveRetryAttemptsRemaining")- 1;
      v33 = self;
    }
    -[WiFiLocaleManager setAggressiveRetryAttemptsRemaining:](v33, "setAggressiveRetryAttemptsRemaining:", v34);
    goto LABEL_46;
  }
  v19 = -[WiFiLocaleManager testModeEnabled](self, "testModeEnabled");

  if (v19)
    goto LABEL_21;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v20 = MEMORY[0x1E0C81028];
    v21 = "New locale could not be determined, continue using previously determined locale";
LABEL_33:
    _os_log_impl(&dword_1CC44E000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
  }
LABEL_46:

}

- (WiFiLocaleManagerDelegate)delegate
{
  return (WiFiLocaleManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)localeCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (id)getLocaleFromMcc
{
  void *v3;
  CFStringRef v4;
  __CTServerConnection *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFStringRef cf;
  uint8_t buf[32];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  cf = 0;
  if (-[WiFiLocaleManager testMcc](self, "testMcc") == 0xFFFF)
  {
    cf = 0;
    v3 = 0;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Locale from MCC is disabled", buf, 2u);
  }
  else if (-[WiFiLocaleManager testMcc](self, "testMcc"))
  {
    v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%d"), -[WiFiLocaleManager testMcc](self, "testMcc"));
    cf = v4;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Using testMcc [%@]", buf, 0xCu);
    }
    if (v4)
    {
      if (!MEMORY[0x1E0CA6EB0] || !_CTServerConnectionCopyISOForMCC())
      {
        objc_msgSend(0, "uppercaseString");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[WiFiLocaleManager getLocaleFromMcc].cold.2();
    }
  }
  else if (MEMORY[0x1E0CA6EC8])
  {
    if (self->_ctServerConnectionRef
      || (v17 = 0,
          memset(buf, 0, sizeof(buf)),
          v5 = (__CTServerConnection *)_CTServerConnectionCreateWithIdentifier(),
          (self->_ctServerConnectionRef = v5) != 0))
    {
      if (_CTServerConnectionCopyMobileCountryCode()
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[WiFiLocaleManager getLocaleFromMcc].cold.3();
      }
    }
    else
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v6)
        -[WiFiLocaleManager getLocaleFromMcc].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v3 = 0;
LABEL_23:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = cf;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v3;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Locale from MCC [%@]: <%@>", buf, 0x16u);
  }
  if (cf)
    CFRelease(cf);
  return v3;
}

- (int)testMcc
{
  return self->_testMcc;
}

uint64_t __25__WiFiLocaleManager_init__block_invoke(uint64_t a1)
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Locale timer fired", v3, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "determineLocale:", 0);
}

- (BOOL)shouldDetermineNewLocale
{
  WiFiLocaleManager *v2;
  void *v3;

  v2 = self;
  -[WiFiLocaleManager localeCountryCode](self, "localeCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[WiFiLocaleManager isDefaultCountryCode:](v2, "isDefaultCountryCode:", v3);

  return (char)v2;
}

- (void)setLocaleLastUpdatedTime:(double)a3
{
  self->_localeLastUpdatedTime = a3;
}

- (void)setAggressiveRetryAttemptsRemaining:(int)a3
{
  self->_aggressiveRetryAttemptsRemaining = a3;
}

- (OS_dispatch_source)retryTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 80, 1);
}

- (WiFiLocationManager)locationManager
{
  return (WiFiLocationManager *)objc_getProperty(self, a2, 96, 1);
}

- (int)localeSource
{
  return self->_localeSource;
}

- (BOOL)localeCheckSuspended
{
  return self->_localeCheckSuspended;
}

- (id)getLocaleFromCompanion
{
  return 0;
}

- (int)aggressiveRetryAttemptsRemaining
{
  return self->_aggressiveRetryAttemptsRemaining;
}

+ (id)getStringOfLocaleSource:(int)a3
{
  if (a3 > 7)
    return CFSTR("unknown");
  else
    return off_1E881CA98[a3];
}

- (WiFiLocaleManager)init
{
  WiFiLocaleManager *v2;
  WiFiLocaleManager *v3;
  id v4;
  void *v5;
  dispatch_queue_t v6;
  NSObject *v7;
  dispatch_source_t v8;
  NSObject *v9;
  WiFiLocaleManager *v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD handler[4];
  WiFiLocaleManager *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)WiFiLocaleManager;
  v2 = -[WiFiLocaleManager init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WiFiLocaleManager setLocaleCheckSuspended:](v2, "setLocaleCheckSuspended:", 0);
    -[WiFiLocaleManager setLocaleCountryCode:](v3, "setLocaleCountryCode:", 0);
    -[WiFiLocaleManager setLocaleSource:](v3, "setLocaleSource:", 0);
    -[WiFiLocaleManager setLocaleLastUpdatedTime:](v3, "setLocaleLastUpdatedTime:", 0.0);
    -[WiFiLocaleManager setLocaleTimeout:](v3, "setLocaleTimeout:", 3600.0);
    -[WiFiLocaleManager setAggressiveRetryAttemptsRemaining:](v3, "setAggressiveRetryAttemptsRemaining:", 5);
    -[WiFiLocaleManager setTestMcc:](v3, "setTestMcc:", 0);
    -[WiFiLocaleManager setTestHost11d:](v3, "setTestHost11d:", 0);
    -[WiFiLocaleManager setTestPeer:](v3, "setTestPeer:", 0);
    v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    -[WiFiLocaleManager setDateFormatter:](v3, "setDateFormatter:", v4);

    -[WiFiLocaleManager dateFormatter](v3, "dateFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));

    v6 = dispatch_queue_create("WiFiLocaleManager", 0);
    -[WiFiLocaleManager setQueue:](v3, "setQueue:", v6);

    -[WiFiLocaleManager queue](v3, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v7);
    -[WiFiLocaleManager setLocaleTimer:](v3, "setLocaleTimer:", v8);

    -[WiFiLocaleManager localeTimer](v3, "localeTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __25__WiFiLocaleManager_init__block_invoke;
    handler[3] = &unk_1E881C8E8;
    v10 = v3;
    v18 = v10;
    dispatch_source_set_event_handler(v9, handler);

    -[WiFiLocaleManager localeTimer](v10, "localeTimer");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v11, v12, 0x1BF08EB000uLL, 0);

    -[WiFiLocaleManager localeTimer](v10, "localeTimer");
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_activate(v13);

    +[WiFiLocationManager sharedWiFiLocationManager](WiFiLocationManager, "sharedWiFiLocationManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiLocaleManager setLocationManager:](v10, "setLocationManager:", v14);

    -[WiFiLocaleManager locationManager](v10, "locationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", v10);

    -[WiFiLocaleManager setIsWaitingForLocationUpdate:](v10, "setIsWaitingForLocationUpdate:", 0);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  objc_super v6;

  -[WiFiLocaleManager setTestHost11d:](self, "setTestHost11d:", 0);
  -[WiFiLocaleManager setTestPeer:](self, "setTestPeer:", 0);
  -[WiFiLocaleManager setLocationManager:](self, "setLocationManager:", 0);
  -[WiFiLocaleManager localeTimer](self, "localeTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WiFiLocaleManager localeTimer](self, "localeTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[WiFiLocaleManager setLocaleTimer:](self, "setLocaleTimer:", 0);
  }
  -[WiFiLocaleManager queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[WiFiLocaleManager setQueue:](self, "setQueue:", 0);
  v6.receiver = self;
  v6.super_class = (Class)WiFiLocaleManager;
  -[WiFiLocaleManager dealloc](&v6, sel_dealloc);
}

- (void)determineAndSetLocale:(unsigned __int8)a3
{
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  unsigned __int8 v8;

  -[WiFiLocaleManager queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WiFiLocaleManager queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__WiFiLocaleManager_determineAndSetLocale___block_invoke;
    v7[3] = &unk_1E881C960;
    v7[4] = self;
    v8 = a3;
    dispatch_async(v6, v7);

  }
}

uint64_t __43__WiFiLocaleManager_determineAndSetLocale___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "determineLocale:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setLocaleTestParams:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  WiFiLocaleManager *v9;

  v4 = a3;
  -[WiFiLocaleManager queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WiFiLocaleManager queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__WiFiLocaleManager_setLocaleTestParams___block_invoke;
    v7[3] = &unk_1E881C8C0;
    v8 = v4;
    v9 = self;
    dispatch_async(v6, v7);

  }
}

void __41__WiFiLocaleManager_setLocaleTestParams___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  double v36;
  dispatch_time_t v37;
  double v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  int v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  double v54;
  dispatch_time_t v55;
  double v56;
  void *v57;
  void *v58;
  int v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;
  _BYTE v67[10];
  _BYTE v68[10];
  _BYTE v69[10];
  _BYTE v70[10];
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  double v80;
  __int16 v81;
  int v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("enableTestMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("localeCheckSuspended"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("mcc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("cachedLocaleTimeout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("host11d"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("peer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("timeZoneCC"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("userDefaults"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("forceCheck"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v15, "BOOLValue");

  v16 = *(void **)(a1 + 40);
  if (!v3)
  {
    if (objc_msgSend(v16, "testModeEnabled"))
    {
      objc_msgSend(*(id *)(a1 + 40), "setTestModeEnabled:", 0);
      objc_msgSend(*(id *)(a1 + 40), "setLocaleCheckSuspended:", 0);
      objc_msgSend(*(id *)(a1 + 40), "setTestMcc:", 0);
      objc_msgSend(*(id *)(a1 + 40), "setLocaleTimeout:", 3600.0);
      objc_msgSend(*(id *)(a1 + 40), "setTestHost11d:", 0);
      objc_msgSend(*(id *)(a1 + 40), "setTestPeer:", 0);
      objc_msgSend(*(id *)(a1 + 40), "setLocaleCountryCode:", 0);
      objc_msgSend(*(id *)(a1 + 40), "setLocaleSource:", 0);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v27 = objc_msgSend(*(id *)(a1 + 40), "localeCheckSuspended");
        v28 = objc_msgSend(*(id *)(a1 + 40), "testMcc");
        objc_msgSend(*(id *)(a1 + 40), "testHost11d");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "testPeer");
        v30 = v13;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "localeTimeout");
        *(_DWORD *)buf = 136316674;
        v61 = "-[WiFiLocaleManager setLocaleTestParams:]_block_invoke";
        v62 = 1024;
        v63 = v27;
        v64 = 1024;
        v65 = v28;
        v66 = 2112;
        *(_QWORD *)v67 = v29;
        *(_WORD *)&v67[8] = 2112;
        *(_QWORD *)v68 = v31;
        *(_WORD *)&v68[8] = 2048;
        *(_QWORD *)v69 = v32;
        *(_WORD *)&v69[8] = 1024;
        *(_DWORD *)v70 = v59;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: resetting test params: localeCheckSuspended %d, MCC %d, host11d %@, peer %@, timeout %.2f seconds, forceCheck %d", buf, 0x3Cu);

        v13 = v30;
      }
      objc_msgSend(*(id *)(a1 + 40), "retryTimer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(*(id *)(a1 + 40), "retryTimer");
        v34 = objc_claimAutoreleasedReturnValue();
        dispatch_source_set_timer(v34, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

      }
      objc_msgSend(*(id *)(a1 + 40), "localeTimer");
      v35 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "localeTimeout");
      v37 = dispatch_time(0, (uint64_t)(v36 * 1000000000.0));
      objc_msgSend(*(id *)(a1 + 40), "localeTimeout");
      dispatch_source_set_timer(v35, v37, (unint64_t)(v38 * 1000000000.0), 0);

      if (v59)
        goto LABEL_27;
    }
    goto LABEL_28;
  }
  objc_msgSend(v16, "setTestModeEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setLocaleCheckSuspended:", v5);
  if (HIWORD(v7))
    v17 = 0;
  else
    v17 = v7;
  objc_msgSend(*(id *)(a1 + 40), "setTestMcc:", v17);
  objc_msgSend(*(id *)(a1 + 40), "setLocaleTimeout:", fmax(v10, 120.0));
  if (v11)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v11, "uppercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithString:", v19);
    objc_msgSend(*(id *)(a1 + 40), "setTestHost11d:", v20);

    if (v12)
      goto LABEL_7;
LABEL_17:
    objc_msgSend(*(id *)(a1 + 40), "setTestPeer:", 0);
    if (v13)
      goto LABEL_8;
    goto LABEL_18;
  }
  objc_msgSend(*(id *)(a1 + 40), "setTestHost11d:", 0);
  if (!v12)
    goto LABEL_17;
LABEL_7:
  v21 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v12, "uppercaseString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithString:", v22);
  objc_msgSend(*(id *)(a1 + 40), "setTestPeer:", v23);

  if (v13)
  {
LABEL_8:
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v13, "uppercaseString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithString:", v25);
    objc_msgSend(*(id *)(a1 + 40), "setTestTimeZoneCC:", v26);

    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(*(id *)(a1 + 40), "setTestTimeZoneCC:", 0);
LABEL_19:
  v57 = v13;
  v58 = v12;
  if (v14)
  {
    v39 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v14, "uppercaseString");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v39, "initWithString:", v40);
    objc_msgSend(*(id *)(a1 + 40), "setTestUserDefaults:", v41);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setTestUserDefaults:", 0);
  }
  v42 = v11;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v43 = v14;
    v44 = v5;
    v45 = objc_msgSend(*(id *)(a1 + 40), "localeCheckSuspended");
    v46 = objc_msgSend(*(id *)(a1 + 40), "testMcc");
    objc_msgSend(*(id *)(a1 + 40), "testHost11d");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "testPeer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "testUserDefaults");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "localeTimeout");
    *(_DWORD *)buf = 136318466;
    v61 = "-[WiFiLocaleManager setLocaleTestParams:]_block_invoke";
    v62 = 1024;
    v63 = v45;
    v64 = 1024;
    v65 = v44;
    v14 = v43;
    v66 = 1024;
    *(_DWORD *)v67 = v46;
    *(_WORD *)&v67[4] = 1024;
    *(_DWORD *)&v67[6] = v7;
    *(_WORD *)v68 = 2112;
    *(_QWORD *)&v68[2] = v47;
    *(_WORD *)v69 = 2112;
    *(_QWORD *)&v69[2] = v42;
    *(_WORD *)v70 = 2112;
    *(_QWORD *)&v70[2] = v48;
    v71 = 2112;
    v72 = v58;
    v73 = 2112;
    v74 = v49;
    v75 = 2112;
    v76 = v43;
    v77 = 2048;
    v78 = v50;
    v79 = 2048;
    v80 = v10;
    v81 = 1024;
    v82 = v59;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: setting test params: localeCheckSuspended %d (requested %d), MCC %d (requested %d), host11d %@ (requested %@), peer %@ (requested %@), userDefaults %@ (requested %@), timeout %.2f seconds (requested %.2f seconds), forceCheck %d", buf, 0x7Au);

  }
  objc_msgSend(*(id *)(a1 + 40), "retryTimer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    objc_msgSend(*(id *)(a1 + 40), "retryTimer");
    v52 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v52, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);

  }
  objc_msgSend(*(id *)(a1 + 40), "localeTimer");
  v53 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "localeTimeout");
  v55 = dispatch_time(0, (uint64_t)(v54 * 1000000000.0));
  objc_msgSend(*(id *)(a1 + 40), "localeTimeout");
  dispatch_source_set_timer(v53, v55, (unint64_t)(v56 * 1000000000.0), 0);

  v11 = v42;
  v13 = v57;
  v12 = v58;
  if ((v59 & 1) != 0)
LABEL_27:
    objc_msgSend(*(id *)(a1 + 40), "determineLocale:", 1);
LABEL_28:

}

- (id)getLocaleFromLocation:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = getenv("__OSINSTALL_ENVIRONMENT");
  if (v4)
  {
    v6 = v5;
    if (v5)
      goto LABEL_3;
    -[WiFiLocaleManager getLocaleUsingGeoLocationCache:](self, "getLocaleUsingGeoLocationCache:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Locale from location services using geolocation cache: <%@>", (uint8_t *)&v9, 0xCu);
    }
    if (!v7)
    {
LABEL_3:
      -[WiFiLocaleManager getLocaleUsingBoundingBoxes:](self, "getLocaleUsingBoundingBoxes:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Locale from location services using bounding boxes: <%@>", (uint8_t *)&v9, 0xCu);
      }
      if (!((unint64_t)v6 | v7))
      {
        -[WiFiLocaleManager getLocaleUsingReverseGeocoder:](self, "getLocaleUsingReverseGeocoder:", v4);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v9 = 138412290;
          v10 = v7;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Locale from location services using reverse geocoder: <%@>", (uint8_t *)&v9, 0xCu);
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return (id)v7;
}

- (id)getLocaleFromMultiple80211d
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  NSObject *v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  __int128 v27;
  unint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  -[WiFiLocaleManager testHost11d](self, "testHost11d");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[WiFiLocaleManager delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[WiFiLocaleManager testUserDefaults](self, "testUserDefaults");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {

        goto LABEL_21;
      }
      v11 = (void *)v10;
      -[WiFiLocaleManager testUserDefaults](self, "testUserDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "caseInsensitiveCompare:", CFSTR("OFF"));

      if (!v13)
      {
LABEL_21:
        -[WiFiLocaleManager delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "get80211dCountryCodes:", &v28);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v17 = objc_msgSend(v8, "count");
          *(_DWORD *)buf = 134218240;
          v30 = v17;
          v31 = 2048;
          v32 = v28;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%lu country code(s) currently advertised by %lu networks", buf, 0x16u);
        }
        if (v28 >= 3)
        {
          objc_msgSend(v8, "objectEnumerator");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "nextObject");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0;
          if (v7)
          {
            v21 = 0;
            v22 = 0;
            v23 = MEMORY[0x1E0C81028];
            *(_QWORD *)&v19 = 138412290;
            v27 = v19;
            do
            {
              v24 = v22;
              v22 = objc_msgSend(v8, "countForObject:", v7, v27);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v30 = (uint64_t)v7;
                v31 = 2048;
                v32 = v22;
                _os_log_impl(&dword_1CC44E000, v23, OS_LOG_TYPE_DEFAULT, "Country <%@> IE count %lu", buf, 0x16u);
              }
              if (v22 < 2 || v22 < v24)
              {
                v22 = v24;
              }
              else
              {
                v25 = v7;

                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v27;
                  v30 = (uint64_t)v25;
                  _os_log_impl(&dword_1CC44E000, v23, OS_LOG_TYPE_DEFAULT, "Currently highest country <%@>", buf, 0xCu);
                }
                v21 = v24;
                v20 = v25;
              }
              objc_msgSend(v18, "nextObject");
              v26 = objc_claimAutoreleasedReturnValue();

              v7 = (void *)v26;
            }
            while (v26);
            if (v22 == v21)
              v7 = 0;
            else
              v7 = (void *)objc_msgSend(v20, "copy");
          }

          goto LABEL_14;
        }
        goto LABEL_13;
      }
    }
    else
    {

    }
    v14 = 0;
    return v14;
  }
  -[WiFiLocaleManager testHost11d](self, "testHost11d");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("OFF"));

  if (v5)
  {
    -[WiFiLocaleManager testHost11d](self, "testHost11d");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = (uint64_t)v7;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Using testHost11d [%@]", buf, 0xCu);
    }
    v8 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Locale from 80211d info is disabled", buf, 2u);
  }
  v8 = 0;
LABEL_13:
  v7 = 0;
LABEL_14:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = (uint64_t)v7;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Locale from multiple 80211d info: <%@>", buf, 0xCu);
  }
  v14 = v7;

  return v14;
}

- (id)getLocaleFromPeer
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[WiFiLocaleManager testPeer](self, "testPeer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[WiFiLocaleManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[WiFiLocaleManager delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "getPeerCountryCode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    goto LABEL_9;
  }
  -[WiFiLocaleManager testPeer](self, "testPeer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("OFF"));

  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Locale from peer is disabled", (uint8_t *)&v12, 2u);
    }
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  -[WiFiLocaleManager testPeer](self, "testPeer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Using testPeer [%@]", (uint8_t *)&v12, 0xCu);
  }
LABEL_10:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Locale from peer: <%@>", (uint8_t *)&v12, 0xCu);
  }
  return v7;
}

- (id)getLocaleFromTimezone
{
  void *v3;
  void *v4;
  NSString *testTimeZoneCC;
  NSString *v6;
  NSString *v7;
  __CFString *v8;
  __CFString *v9;
  int v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[WiFiLocaleManager getRestrictedCountryCodeFromTimezone](self, "getRestrictedCountryCodeFromTimezone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiLocaleManager getRestrictedCountryCodeFromRegionInfo](self, "getRestrictedCountryCodeFromRegionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  testTimeZoneCC = self->_testTimeZoneCC;
  if (testTimeZoneCC)
  {
    v6 = testTimeZoneCC;

    v7 = self->_testTimeZoneCC;
    v3 = v6;
    v4 = v7;
  }
  v8 = 0;
  if (v3 && v4)
  {
    if (objc_msgSend(v3, "compare:options:", v4, 1))
      v8 = CFSTR("XZ");
    else
      v8 = v3;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Locale from timezone: <%@>", (uint8_t *)&v11, 0xCu);
  }
  v9 = v8;

  return v9;
}

- (id)getLocaleFromUserDefaults
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[WiFiLocaleManager testUserDefaults](self, "testUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[WiFiLocaleManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[WiFiLocaleManager testHost11d](self, "testHost11d");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {

LABEL_17:
        -[WiFiLocaleManager delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "getCountryCodeFromUserDefaults");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
      v10 = (void *)v9;
      -[WiFiLocaleManager testHost11d](self, "testHost11d");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("OFF"));

      if (!v12)
        goto LABEL_17;
    }
    else
    {

    }
LABEL_12:
    v7 = 0;
    goto LABEL_13;
  }
  -[WiFiLocaleManager testUserDefaults](self, "testUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("OFF"));

  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Locale from user defaults is disabled", (uint8_t *)&v15, 2u);
    }
    goto LABEL_12;
  }
  -[WiFiLocaleManager testUserDefaults](self, "testUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Using user defaults [%@]", (uint8_t *)&v15, 0xCu);
  }
LABEL_13:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Locale from user defaults <%@>", (uint8_t *)&v15, 0xCu);
  }
  return v7;
}

uint64_t __43__WiFiLocaleManager_setCountryCode_source___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Set locale retry timer fired. Retrying for country code : %@", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 40), "retrySetCountryCode:source:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48));
}

- (void)didChangeAuthorizationStatus
{
  NSObject *v3;
  _QWORD block[5];

  -[WiFiLocaleManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__WiFiLocaleManager_didChangeAuthorizationStatus__block_invoke;
  block[3] = &unk_1E881C8E8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __49__WiFiLocaleManager_didChangeAuthorizationStatus__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "determineLocale:", 1);
}

- (void)didUpdateLocations:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WiFiLocaleManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__WiFiLocaleManager_didUpdateLocations___block_invoke;
  v7[3] = &unk_1E881C8C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __40__WiFiLocaleManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  __CFString *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  NSObject *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isWaitingForLocationUpdate"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsWaitingForLocationUpdate:", 0);
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "localeTimeout");
    v3 = +[WiFiLocationManager isLocationValid:uptoSeconds:isHighAccuracy:](WiFiLocationManager, "isLocationValid:uptoSeconds:isHighAccuracy:", v2, 0);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = v3;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Trying to get locale from updated location (isValid %d)", (uint8_t *)v12, 8u);
    }
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "getLocaleFromLocation:", *(_QWORD *)(a1 + 40));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(*(id *)(a1 + 32), "isDefaultCountryCode:", v4))
      {
        v5 = 3;
        if (!v4)
          return;
        goto LABEL_24;
      }
    }
    else
    {
      v4 = 0;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "shouldDetermineNewLocale"))
    {
      objc_msgSend(*(id *)(a1 + 32), "getLocaleFromMultiple80211d");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(*(id *)(a1 + 32), "isDefaultCountryCode:", v6))
      {
        objc_msgSend(*(id *)(a1 + 32), "getLocaleFromPeer");
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(*(id *)(a1 + 32), "isDefaultCountryCode:", v4))
        {
          v5 = 5;
          if (!v4)
            return;
          goto LABEL_24;
        }
        objc_msgSend(*(id *)(a1 + 32), "getLocaleFromTimezone");
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(*(id *)(a1 + 32), "isDefaultCountryCode:", v6))
        {
          objc_msgSend(*(id *)(a1 + 32), "getLocaleFromUserDefaults");
          v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(*(id *)(a1 + 32), "isDefaultCountryCode:", v4))
          {

            v5 = 0;
            v4 = &stru_1E881F240;
          }
          else
          {
            v5 = 7;
            if (!v4)
              return;
          }
          goto LABEL_24;
        }
        v5 = 6;
      }
      else
      {
        v5 = 4;
      }
      v4 = v6;
      if (!v6)
        return;
    }
    else
    {
      v5 = 0;
      if (!v4)
        return;
    }
LABEL_24:
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(*(id *)(a1 + 32), "setLocaleLastUpdatedTime:");
    objc_msgSend(*(id *)(a1 + 32), "setAggressiveRetryAttemptsRemaining:", 5);
    objc_msgSend(*(id *)(a1 + 32), "retryTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "retryTimer");
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_source_cancel(v8);

      objc_msgSend(*(id *)(a1 + 32), "setRetryTimer:", 0);
    }
    objc_msgSend(*(id *)(a1 + 32), "setCountryCode:source:", v4, v5);

    return;
  }
  v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v9)
    __40__WiFiLocaleManager_didUpdateLocations___block_invoke_cold_1(v9, v10, v11);
}

- (void)didFailWithError:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[WiFiLocaleManager queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__WiFiLocaleManager_didFailWithError___block_invoke;
  block[3] = &unk_1E881C8E8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __38__WiFiLocaleManager_didFailWithError___block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  if (!objc_msgSend(*(id *)(a1 + 32), "shouldDetermineNewLocale"))
    return;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Trying to determine locale when location services failed", v7, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "getLocaleFromMultiple80211d");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 32), "isDefaultCountryCode:", v2))
  {
    v4 = 4;
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "getLocaleFromPeer");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(*(id *)(a1 + 32), "isDefaultCountryCode:", v3))
  {
    v4 = 5;
LABEL_13:
    v2 = v3;
LABEL_14:
    if (!v2)
      return;
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(a1 + 32), "getLocaleFromTimezone");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(*(id *)(a1 + 32), "isDefaultCountryCode:", v2))
  {
    v4 = 6;
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "getLocaleFromUserDefaults");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(*(id *)(a1 + 32), "isDefaultCountryCode:", v3))
  {
    v4 = 7;
    goto LABEL_13;
  }

  v4 = 0;
  v2 = &stru_1E881F240;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(*(id *)(a1 + 32), "setLocaleLastUpdatedTime:");
  objc_msgSend(*(id *)(a1 + 32), "setAggressiveRetryAttemptsRemaining:", 5);
  objc_msgSend(*(id *)(a1 + 32), "retryTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "retryTimer");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v6);

    objc_msgSend(*(id *)(a1 + 32), "setRetryTimer:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "setCountryCode:source:", v2, v4);

}

- (unsigned)getNetworkReachability
{
  const __SCNetworkReachability *v2;
  const __SCNetworkReachability *v3;
  SCNetworkReachabilityFlags flags;
  sockaddr address;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  address = (sockaddr)xmmword_1CC50E7F0;
  v2 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &address);
  flags = 0;
  if (v2)
  {
    v3 = v2;
    SCNetworkReachabilityGetFlags(v2, &flags);
    CFRelease(v3);
    LOBYTE(v2) = (flags & 0x40002) == 2;
  }
  return v2;
}

- (id)getLocaleUsingGeoLocationCache:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v3 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  if (v3)
  {
    v4 = dispatch_semaphore_create(0);
    objc_msgSend(v3, "coordinate");
    v6 = v5;
    objc_msgSend(v3, "coordinate");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27160]), "initWithGEOCoordinate:", v6, v7);
    if (v8)
    {
      objc_msgSend(v3, "altitude");
      objc_msgSend(v8, "setAltitude:", (int)v9);
      objc_msgSend(v3, "horizontalAccuracy");
      objc_msgSend(v8, "setHorizontalAccuracy:");
      objc_msgSend(v3, "verticalAccuracy");
      objc_msgSend(v8, "setVerticalAccuracy:");
      v10 = objc_msgSend(v3, "referenceFrame");
      if (v10 == 1)
        v11 = 1;
      else
        v11 = 2 * (v10 == 2);
      objc_msgSend(v8, "setReferenceFrame:", v11);
    }
    v12 = (void *)MEMORY[0x1E0D270D8];
    v13 = MEMORY[0x1E0C80D38];
    v14 = MEMORY[0x1E0C80D38];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke;
    v18[3] = &unk_1E881C9B0;
    v20 = &v21;
    v15 = v4;
    v19 = v15;
    objc_msgSend(v12, "fetchPossibleTerritoriesForLocation:responseQueue:responseBlock:", v8, v13, v18);

    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    v16 = (id)v22[5];

  }
  else
  {
    v16 = 0;
  }
  _Block_object_dispose(&v21, 8);

  return v16;
}

void __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  uint8_t v41;
  _BYTE v42[15];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke_cold_4((uint64_t)v5, (uint64_t)v6);
    if (v6)
    {
LABEL_3:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke_cold_3((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
      goto LABEL_44;
    }
  }
  else if (v6)
  {
    goto LABEL_3;
  }
  if (v5)
  {
    v38 = v6;
    v39 = a1;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v40 = v5;
    v14 = v5;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = 0;
      v19 = *(_QWORD *)v44;
      v20 = MEMORY[0x1E0C81028];
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v44 != v19)
            objc_enumerationMutation(v14);
          v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v21);
          if (v22)
          {
            if (objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v21), "isDisputed"))
            {
              if (!v17)
              {
                objc_msgSend(v22, "disputedTerritoryName");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (v17)
                {
                  objc_msgSend(v22, "disputedTerritoryName");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "length");

                  if (v24)
                  {
                    objc_msgSend(v22, "disputedTerritoryName");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v48 = v17;
                      _os_log_impl(&dword_1CC44E000, v20, OS_LOG_TYPE_DEFAULT, "disputed region appointed: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v17 = 0;
                  }
                }
              }
            }
            else if (!v18)
            {
              objc_msgSend(v22, "iso3166CountryCode2");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
              {
                objc_msgSend(v22, "iso3166CountryCode2");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "length");

                if (v27)
                {
                  objc_msgSend(v22, "iso3166CountryCode2");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v22, "iso3166CountryCode2");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v48 = v28;
                    _os_log_impl(&dword_1CC44E000, v20, OS_LOG_TYPE_DEFAULT, "iso appointed: %@", buf, 0xCu);

                  }
                }
                else
                {
                  v18 = 0;
                }
              }
            }
          }
          else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke_cold_2(&v41, v42, v25);
          }
          ++v21;
        }
        while (v16 != v21);
        v29 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        v16 = v29;
      }
      while (v29);
    }
    else
    {
      v17 = 0;
      v18 = 0;
    }

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      if (v17)
        v33 = v17;
      else
        v33 = v18;
      *(_DWORD *)buf = 138412290;
      v48 = v33;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "iso returned: %@", buf, 0xCu);
    }
    if (v17)
      v34 = v17;
    else
      v34 = v18;
    a1 = v39;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v39 + 40) + 8) + 40), v34);
    v35 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v39 + 40) + 8) + 40), "copy");
    v36 = *(_QWORD *)(*(_QWORD *)(v39 + 40) + 8);
    v37 = *(void **)(v36 + 40);
    *(_QWORD *)(v36 + 40) = v35;

    v5 = v40;
    v6 = v38;
  }
  else
  {
    v30 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v30)
      __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke_cold_1(v30, v31, v32);
  }
LABEL_44:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)getLocaleUsingBoundingBoxes:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "coordinate");
    v6 = v5;
    objc_msgSend(v4, "coordinate");
    v8 = 0;
    while (v7 < *(double *)&boundingBoxes[v8]
         || v7 > *(double *)&boundingBoxes[v8 + 2]
         || v6 > *(double *)&boundingBoxes[v8 + 1]
         || v6 < *(double *)&boundingBoxes[v8 + 3])
    {
      v8 += 5;
      if (v8 == 500)
        goto LABEL_8;
    }
    v9 = (id)boundingBoxes[v8 + 4];
  }
  else
  {
LABEL_8:
    v9 = 0;
  }

  return v9;
}

- (id)getLocaleUsingReverseGeocoder:(id)a3
{
  id v4;
  id v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
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
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  if (!v4)
  {
    v8 = 0;
    goto LABEL_9;
  }
  if (!-[WiFiLocaleManager getNetworkReachability](self, "getNetworkReachability"))
  {
    v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v9)
      -[WiFiLocaleManager getLocaleUsingReverseGeocoder:].cold.1(v9, v10, v11);
    goto LABEL_8;
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C9E388]);
  if (!v5)
  {
LABEL_8:
    v8 = (id)v17[5];
    goto LABEL_9;
  }
  v6 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__WiFiLocaleManager_getLocaleUsingReverseGeocoder___block_invoke;
  v13[3] = &unk_1E881C9D8;
  v15 = &v16;
  v7 = v6;
  v14 = v7;
  objc_msgSend(v5, "reverseGeocodeLocation:completionHandler:", v4, v13);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v8 = (id)v17[5];

LABEL_9:
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __51__WiFiLocaleManager_getLocaleUsingReverseGeocoder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  if (!a3)
  {
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "objectAtIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = v5;
        objc_msgSend(v5, "ISOcountryCode");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "copy");
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)getRestrictedCountryCodeFromRegionInfo
{
  void *v2;
  void *v3;
  const __CFString **v4;
  const __CFString *v5;
  const __CFString *v6;
  id v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = xmmword_1E881CA18;
  v13 = *(_OWORD *)&off_1E881CA28;
  v14 = xmmword_1E881CA38;
  v10 = xmmword_1E881C9F8;
  v11 = *(_OWORD *)&off_1E881CA08;
  v2 = (void *)MGCopyAnswer();
  v3 = 0;
  if (v2)
  {
    v4 = (const __CFString **)&v11;
    v5 = CFSTR("PA");
    while (objc_msgSend(v2, "compare:options:", v5, 1, v10, v11, v12, v13, v14))
    {
      v6 = *v4;
      v4 += 2;
      v5 = v6;
      if (!v6)
      {
        v3 = 0;
        goto LABEL_7;
      }
    }
    v3 = (void *)-[__CFString copy]((id)*(v4 - 1), "copy");
  }
LABEL_7:
  v7 = v3;

  for (i = 72; i != -8; i -= 8)
  return v7;
}

- (id)getRestrictedCountryCodeFromTimezone
{
  void *v2;
  void *v3;
  uint64_t *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone", 0x1E8820BC0, 0x1E8820760, CFSTR("Asia/Jayapura"), CFSTR("ID"), 0x1E8820C00, 0x1E8820760, CFSTR("Asia/Pontianak"), CFSTR("ID"), 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (uint64_t *)&v12;
    while (1)
    {
      objc_msgSend(v3, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "compare:options:", *(v4 - 2), 1);

      if (!v6)
        break;
      v7 = *v4;
      v4 += 2;
      if (!v7)
      {
        v2 = 0;
        goto LABEL_7;
      }
    }
    v2 = (void *)objc_msgSend((id)*(v4 - 1), "copy");
  }
LABEL_7:
  v8 = v2;

  for (i = 72; i != -8; i -= 8)
  return v8;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setLocaleCheckSuspended:(BOOL)a3
{
  self->_localeCheckSuspended = a3;
}

- (void)setLocaleCountryCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setLocaleSource:(int)a3
{
  self->_localeSource = a3;
}

- (double)localeTimeout
{
  return self->_localeTimeout;
}

- (void)setLocaleTimeout:(double)a3
{
  self->_localeTimeout = a3;
}

- (double)localeLastUpdatedTime
{
  return self->_localeLastUpdatedTime;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (OS_dispatch_source)localeTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLocaleTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setRetryTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDateFormatter)dateFormatter
{
  return (NSDateFormatter *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDateFormatter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setLocationManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (unsigned)isWaitingForLocationUpdate
{
  return self->_isWaitingForLocationUpdate;
}

- (void)setIsWaitingForLocationUpdate:(unsigned __int8)a3
{
  self->_isWaitingForLocationUpdate = a3;
}

- (unsigned)testModeEnabled
{
  return self->_testModeEnabled;
}

- (void)setTestModeEnabled:(unsigned __int8)a3
{
  self->_testModeEnabled = a3;
}

- (void)setTestMcc:(int)a3
{
  self->_testMcc = a3;
}

- (NSString)testHost11d
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTestHost11d:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)testPeer
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTestPeer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)testTimeZoneCC
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTestTimeZoneCC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)testUserDefaults
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTestUserDefaults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testUserDefaults, 0);
  objc_storeStrong((id *)&self->_testTimeZoneCC, 0);
  objc_storeStrong((id *)&self->_testPeer, 0);
  objc_storeStrong((id *)&self->_testHost11d, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_localeTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localeCountryCode, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)determineLocale:(unsigned __int8)a1 .cold.1(unsigned __int8 a1, void *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = objc_msgSend(a2, "localeCheckSuspended");
  _os_log_error_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error: Locale check was suspended (forceCheck %d, localeCheckSuspended %d), exit", (uint8_t *)v2, 0xEu);
}

- (void)getLocaleFromMcc
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1CC44E000, MEMORY[0x1E0C81028], v0, "%s: Error _CTServerConnectionCopyMobileCountryCode: %d %d", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __40__WiFiLocaleManager_didUpdateLocations___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "Error: not waiting for location update, ignoring update", v3);
  OUTLINED_FUNCTION_5();
}

void __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "fetchPossibleTerritoriesForLocation succeed but no ISO", v3);
  OUTLINED_FUNCTION_5();
}

void __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke_cold_2(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "empty territory element!", a1);
}

void __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "fetchPossibleTerritoriesForLocation failed: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __52__WiFiLocaleManager_getLocaleUsingGeoLocationCache___block_invoke_cold_4(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "fetchPossibleTerritoriesForLocation replied: %@, error: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)getLocaleUsingReverseGeocoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0(&dword_1CC44E000, MEMORY[0x1E0C81028], a3, "Error: network is not available", v3);
  OUTLINED_FUNCTION_5();
}

@end
