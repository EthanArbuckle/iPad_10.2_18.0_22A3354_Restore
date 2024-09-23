@implementation PKAnalyticsReporter

+ (void)subject:(id)a3 category:(int64_t)a4 sendEvent:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  objc_msgSend(a1, "reporterForSubject:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendEvent:withCategory:", v8, a4);

}

+ (void)subjects:(id)a3 category:(int64_t)a4 sendEvent:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(a1, "reporterForSubject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sendEvent:withCategory:", v9, a4);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

+ (void)endSubjectReporting:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&lockCollections);
  +[PKAnalyticsReporter subjectDictionary](PKAnalyticsReporter, "subjectDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject(0x15uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "_reportingSessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v3;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Terminating RTC reporting for subject: %@ session ID: %@", (uint8_t *)&v10, 0x16u);

  }
  +[PKAnalyticsReporter subjectDictionary](PKAnalyticsReporter, "subjectDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v3);

  +[PKAnalyticsReporter subjectSessionStateDateDictionary](PKAnalyticsReporter, "subjectSessionStateDateDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&lockCollections);
}

+ (id)subjectDictionary
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)subjectDictionary_subjectDictionary;
  if (!subjectDictionary_subjectDictionary)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)subjectDictionary_subjectDictionary;
    subjectDictionary_subjectDictionary = (uint64_t)v3;

    v2 = (void *)subjectDictionary_subjectDictionary;
  }
  return v2;
}

+ (id)subjectSessionStateDateDictionary
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)subjectSessionStateDateDictionary_dateDictionary;
  if (!subjectSessionStateDateDictionary_dateDictionary)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)subjectSessionStateDateDictionary_dateDictionary;
    subjectSessionStateDateDictionary_dateDictionary = (uint64_t)v3;

    v2 = (void *)subjectSessionStateDateDictionary_dateDictionary;
  }
  return v2;
}

+ (void)subject:(id)a3 sendEvent:(id)a4
{
  objc_msgSend(a1, "subject:category:sendEvent:", a3, 1, a4);
}

+ (void)subjects:(id)a3 sendEvent:(id)a4
{
  objc_msgSend(a1, "subjects:category:sendEvent:", a3, 1, a4);
}

void __51__PKAnalyticsReporter_initWithParentToken_subject___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  PKLogFacilityTypeGetObject(0x15uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "getReportingSessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "RTC reporting for subject: %@ initiated with session ID: %@", (uint8_t *)&v8, 0x16u);

  }
  if (!a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "No RTC backends found, no logs will be sent at this time.", (uint8_t *)&v8, 2u);
    }

  }
}

- (void)sendEvent:(id)a3 withCategory:(int64_t)a4
{
  void *v6;
  __CFString *v7;
  __CFString *v8;
  char v9;
  __CFString *v10;
  __CFString *v11;
  char v12;
  __CFString *v13;
  __CFString *v14;
  char v15;
  NSString *v16;
  __CFString *v17;
  __CFString *v18;
  BOOL v19;
  __CFString *v20;
  __CFString *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  NSString *subject;
  __CFString *v36;
  __CFString *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  NSString *v46;
  __CFString *v47;
  __CFString *v48;
  char v49;
  __CFString *v50;
  __CFString *v51;
  char v52;
  __CFString *v53;
  __CFString *v54;
  char v55;
  __CFString *v56;
  __CFString *v57;
  char v58;
  __CFString *v59;
  __CFString *v60;
  char v61;
  __CFString *v62;
  __CFString *v63;
  char v64;
  __CFString *v65;
  __CFString *v66;
  char v67;
  __CFString *v68;
  __CFString *v69;
  char v70;
  __CFString *v71;
  __CFString *v72;
  char v73;
  __CFString *v74;
  __CFString *v75;
  char v76;
  __CFString *v77;
  __CFString *v78;
  char v79;
  void *v80;
  uint8_t buf[4];
  NSString *v82;
  __int16 v83;
  void *v84;
  _QWORD v85[3];
  _QWORD v86[4];

  v86[3] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v7 = self->_subject;
  if (v7 == CFSTR("appleCardEngagement"))
    goto LABEL_22;
  v8 = v7;
  if (v7)
  {
    v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("appleCardEngagement"));

    if ((v9 & 1) != 0)
      goto LABEL_22;
  }
  v10 = self->_subject;
  if (v10 == CFSTR("appleCardOnboarding"))
    goto LABEL_22;
  v11 = v10;
  if (v10)
  {
    v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("appleCardOnboarding"));

    if ((v12 & 1) != 0)
      goto LABEL_22;
  }
  v13 = self->_subject;
  if (v13 == CFSTR("fhOnboarding"))
    goto LABEL_22;
  v14 = v13;
  if (v13)
  {
    v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("fhOnboarding"));

    if ((v15 & 1) != 0)
      goto LABEL_22;
  }
  v16 = self->_subject;
  v17 = CFSTR("fpsEngagement");
  if (v16 == (NSString *)v17)
    goto LABEL_21;
  v18 = v17;
  if (v16 && v17)
  {
    v19 = -[NSString isEqualToString:](v16, "isEqualToString:", v17);

    if (v19)
      goto LABEL_22;
  }
  else
  {

  }
  v16 = self->_subject;
  v20 = CFSTR("fpsOnboarding");
  if (v16 == (NSString *)v20)
  {
LABEL_21:

    goto LABEL_22;
  }
  v21 = v20;
  if (!v16 || !v20)
  {

    goto LABEL_40;
  }
  v22 = -[NSString isEqualToString:](v16, "isEqualToString:", v20);

  if (v22)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PKDateIgnoringSmallerUnitsWithTimeZone(v23, 16, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v24, "timeIntervalSince1970");
    objc_msgSend(v25, "numberWithDouble:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v26, CFSTR("roundedClientTS"));

    v27 = 1;
    goto LABEL_23;
  }
LABEL_40:
  v47 = self->_subject;
  if (v47 == CFSTR("shareInitiation"))
    goto LABEL_22;
  v48 = v47;
  if (v47)
  {
    v49 = -[__CFString isEqualToString:](v47, "isEqualToString:", CFSTR("shareInitiation"));

    if ((v49 & 1) != 0)
      goto LABEL_22;
  }
  v50 = self->_subject;
  if (v50 == CFSTR("shareRedemption"))
    goto LABEL_22;
  v51 = v50;
  if (v50)
  {
    v52 = -[__CFString isEqualToString:](v50, "isEqualToString:", CFSTR("shareRedemption"));

    if ((v52 & 1) != 0)
      goto LABEL_22;
  }
  v53 = self->_subject;
  if (v53 == CFSTR("orderManagement"))
    goto LABEL_22;
  v54 = v53;
  if (v53)
  {
    v55 = -[__CFString isEqualToString:](v53, "isEqualToString:", CFSTR("orderManagement"));

    if ((v55 & 1) != 0)
      goto LABEL_22;
  }
  v56 = self->_subject;
  if (v56 == CFSTR("passManagement"))
    goto LABEL_22;
  v57 = v56;
  if (v56)
  {
    v58 = -[__CFString isEqualToString:](v56, "isEqualToString:", CFSTR("passManagement"));

    if ((v58 & 1) != 0)
      goto LABEL_22;
  }
  v59 = self->_subject;
  if (v59 == CFSTR("identityInApp"))
    goto LABEL_22;
  v60 = v59;
  if (v59)
  {
    v61 = -[__CFString isEqualToString:](v59, "isEqualToString:", CFSTR("identityInApp"));

    if ((v61 & 1) != 0)
      goto LABEL_22;
  }
  v62 = self->_subject;
  if (v62 == CFSTR("accessProvisioning"))
    goto LABEL_22;
  v63 = v62;
  if (v62)
  {
    v64 = -[__CFString isEqualToString:](v62, "isEqualToString:", CFSTR("accessProvisioning"));

    if ((v64 & 1) != 0)
      goto LABEL_22;
  }
  v65 = self->_subject;
  if (v65 == CFSTR("expressPresentment"))
    goto LABEL_22;
  v66 = v65;
  if (v65)
  {
    v67 = -[__CFString isEqualToString:](v65, "isEqualToString:", CFSTR("expressPresentment"));

    if ((v67 & 1) != 0)
      goto LABEL_22;
  }
  v68 = self->_subject;
  if (v68 == CFSTR("inApp"))
    goto LABEL_22;
  v69 = v68;
  if (v68)
  {
    v70 = -[__CFString isEqualToString:](v68, "isEqualToString:", CFSTR("inApp"));

    if ((v70 & 1) != 0)
      goto LABEL_22;
  }
  v71 = self->_subject;
  if (v71 == CFSTR("vasPasses"))
    goto LABEL_22;
  v72 = v71;
  if (v71)
  {
    v73 = -[__CFString isEqualToString:](v71, "isEqualToString:", CFSTR("vasPasses"));

    if ((v73 & 1) != 0)
      goto LABEL_22;
  }
  v74 = self->_subject;
  if (v74 == CFSTR("walletProvisioning"))
    goto LABEL_22;
  v75 = v74;
  if (v74)
  {
    v76 = -[__CFString isEqualToString:](v74, "isEqualToString:", CFSTR("walletProvisioning"));

    if ((v76 & 1) != 0)
      goto LABEL_22;
  }
  v77 = self->_subject;
  if (v77 == CFSTR("p2p"))
    goto LABEL_22;
  v78 = v77;
  if (v77)
  {
    v79 = -[__CFString isEqualToString:](v77, "isEqualToString:", CFSTR("p2p"));

    if ((v79 & 1) != 0)
      goto LABEL_22;
  }
  v27 = 0;
LABEL_23:
  PKCurrentRegion();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    objc_msgSend(v6, "setObject:forKey:", v28, CFSTR("Locale"));
  if (v27)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&lockCollections);
    +[PKAnalyticsReporter subjectSessionStateDateDictionary](PKAnalyticsReporter, "subjectSessionStateDateDictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", self->_subject);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&lockCollections);
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "components:fromDate:toDate:options:", 128, v30, v31, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "second");

    }
    else
    {
      PKLogFacilityTypeGetObject(0x15uLL);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        subject = self->_subject;
        *(_DWORD *)buf = 138412290;
        v82 = subject;
        _os_log_impl(&dword_18FC92000, v34, OS_LOG_TYPE_DEFAULT, "Error: There is no analytics start date for subject: %@", buf, 0xCu);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)&lockCollections);
      v33 = 0;
    }
    v36 = self->_subject;
    if (v36 == CFSTR("p2p")
      || (v37 = v36) != 0
      && (v38 = -[__CFString isEqualToString:](v36, "isEqualToString:", CFSTR("p2p")), v37, v38))
    {
      v33 = -[PKAnalyticsReporter bucketedSessionDurationFromDuration:](self, "bucketedSessionDurationFromDuration:", v33);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v33);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v39, CFSTR("sessionDuration"));

  }
  v40 = (void *)objc_msgSend(v6, "copy");
  v85[0] = *MEMORY[0x1E0D83850];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = *MEMORY[0x1E0D83868];
  v86[0] = v41;
  v86[1] = &unk_1E2C3F3A0;
  v43 = *MEMORY[0x1E0D83860];
  v85[1] = v42;
  v85[2] = v43;
  v86[2] = v40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTCReporting sendMessageWithDictionary:error:](self->_session, "sendMessageWithDictionary:error:", v44, 0);
  PKLogFacilityTypeGetObject(0x15uLL);
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = self->_subject;
    *(_DWORD *)buf = 138412546;
    v82 = v46;
    v83 = 2112;
    v84 = v40;
    _os_log_impl(&dword_18FC92000, v45, OS_LOG_TYPE_DEFAULT, "subject: %@ event: %@", buf, 0x16u);
  }

}

- (void)sendEvent:(id)a3
{
  -[PKAnalyticsReporter sendEvent:withCategory:](self, "sendEvent:withCategory:", a3, 1);
}

- (PKAnalyticsReporter)initWithSubject:(id)a3
{
  return -[PKAnalyticsReporter initWithParent:subject:](self, "initWithParent:subject:", 0, a3);
}

- (PKAnalyticsReporter)initWithParentToken:(id)a3 subject:(id)a4
{
  id v6;
  id v7;
  PKAnalyticsReporter *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *sessionToken;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  RTCReporting *session;
  RTCReporting *v28;
  _QWORD v30[4];
  id v31;
  id v32;
  objc_super v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[6];
  _QWORD v37[6];
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)PKAnalyticsReporter;
  v8 = -[PKAnalyticsReporter init](&v33, sel_init);
  if (v8)
  {
    PKLogFacilityTypeGetObject(0x15uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v7;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Initiating RTC reporting for subject: %@", buf, 0xCu);
    }

    v8->_lockArchive._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_subject, a4);
    v10 = objc_msgSend(MEMORY[0x1E0D83848], "newHierarchyTokenFromParentToken:", v6);
    sessionToken = v8->_sessionToken;
    v8->_sessionToken = v10;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = &stru_1E2ADF4C0;
    if (v13)
      v15 = (__CFString *)v13;
    v16 = v15;

    v36[0] = *MEMORY[0x1E0D83880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[PKAnalyticsReporter clientTypeForSubject:](PKAnalyticsReporter, "clientTypeForSubject:", v7));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0D83888];
    v37[0] = v17;
    v37[1] = &unk_1E2C41670;
    v19 = *MEMORY[0x1E0D83878];
    v36[1] = v18;
    v36[2] = v19;
    v20 = *MEMORY[0x1E0D838A8];
    v37[2] = v16;
    v37[3] = &unk_1E2C3F388;
    v21 = *MEMORY[0x1E0D83870];
    v36[3] = v20;
    v36[4] = v21;
    v37[4] = MEMORY[0x1E0C9AAB0];
    v36[5] = *MEMORY[0x1E0D83898];
    v37[5] = v8->_sessionToken;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = *MEMORY[0x1E0D838B8];
    v34[0] = *MEMORY[0x1E0D838B0];
    v34[1] = v23;
    v35[0] = CFSTR("wallet");
    v35[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc(MEMORY[0x1E0D83848]);
    v26 = objc_msgSend(v25, "initWithSessionInfo:userInfo:frameworksToCheck:", v22, v24, MEMORY[0x1E0C9AA60]);
    session = v8->_session;
    v8->_session = (RTCReporting *)v26;

    objc_initWeak((id *)buf, v8->_session);
    v28 = v8->_session;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __51__PKAnalyticsReporter_initWithParentToken_subject___block_invoke;
    v30[3] = &unk_1E2AD5C98;
    objc_copyWeak(&v32, (id *)buf);
    v31 = v7;
    -[RTCReporting startConfigurationWithCompletionHandler:](v28, "startConfigurationWithCompletionHandler:", v30);

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);

  }
  return v8;
}

- (PKAnalyticsReporter)initWithParent:(id)a3 subject:(id)a4
{
  if (a3)
    a3 = (id)*((_QWORD *)a3 + 3);
  return -[PKAnalyticsReporter initWithParentToken:subject:](self, "initWithParentToken:subject:", a3, a4);
}

- (id)archivedSessionToken
{
  os_unfair_lock_s *p_lockArchive;
  NSData *v4;
  NSData *archivedSessionToken;

  p_lockArchive = &self->_lockArchive;
  os_unfair_lock_lock(&self->_lockArchive);
  if (!self->_archivedSessionToken)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_sessionToken, 1, 0);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    archivedSessionToken = self->_archivedSessionToken;
    self->_archivedSessionToken = v4;

  }
  os_unfair_lock_unlock(p_lockArchive);
  return self->_archivedSessionToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_archivedSessionToken, 0);
}

+ (int)clientTypeForSubject:(id)a3
{
  uint64_t v3;
  id v4;
  int v5;

  v3 = _MergedGlobals_262;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_MergedGlobals_262, &__block_literal_global_168);
  v5 = objc_msgSend((id)qword_1ECF229F8, "containsObject:", v4);

  if (v5)
    return 31;
  else
    return 55;
}

+ (void)beginSubjectReporting:(id)a3
{
  id v3;
  PKAnalyticsReporter *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[PKAnalyticsReporter initWithSubject:]([PKAnalyticsReporter alloc], "initWithSubject:", v3);
  os_unfair_lock_lock((os_unfair_lock_t)&lockCollections);
  +[PKAnalyticsReporter subjectDictionary](PKAnalyticsReporter, "subjectDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKAnalyticsReporter subjectSessionStateDateDictionary](PKAnalyticsReporter, "subjectSessionStateDateDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v9, v3);

  }
  objc_msgSend(v5, "setObject:forKey:", v4, v3);
  os_unfair_lock_unlock((os_unfair_lock_t)&lockCollections);
  if (v7)
  {
    v17 = CFSTR("eventType");
    v18[0] = CFSTR("reporterCollision");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendEvent:", v10);

  }
  v11 = (__CFString *)v3;
  v12 = v11;
  if (v11 == CFSTR("appleCardEngagement")
    || v11
    && (v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("appleCardEngagement")),
        v12,
        v13))
  {
    v15[0] = CFSTR("eventType");
    v15[1] = CFSTR("dnuIsEnabled");
    v16[0] = CFSTR("reportDNUState");
    v16[1] = CFSTR("false");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", v12, v14);

  }
}

+ (id)virtualCardReferralSource:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("pushNotification");
  if (a3 == 1)
    v3 = CFSTR("summaryTile");
  if (a3 == 2)
    return CFSTR("wallet");
  else
    return (id)v3;
}

+ (id)subjectToReportDashboardAnalyticsForPass:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  __CFString **v7;
  __CFString *v8;

  v3 = a3;
  if (objc_msgSend(v3, "passType") == 1)
  {
    v4 = v3;
    objc_msgSend(v4, "associatedAccountServiceAccountIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_msgSend(v4, "associatedAccountFeatureIdentifier");
      if ((unint64_t)(v6 - 1) < 3)
      {
        v7 = off_1E2AC2BD0[v6 - 1];
LABEL_13:
        v8 = *v7;
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      if ((objc_msgSend(v4, "hasAssociatedPeerPaymentAccount") & 1) != 0)
      {
        v7 = PKAnalyticsSubjectAppleCashEngagement;
        goto LABEL_13;
      }
      if ((objc_msgSend(v4, "isIdentityPass") & 1) != 0
        || (objc_msgSend(v4, "hasMerchantTokens") & 1) != 0
        || !objc_msgSend(v4, "associatedAccountFeatureIdentifier")
        || (objc_msgSend(v4, "supportsVirtualCardNumber") & 1) != 0)
      {
        v7 = PKAnalyticsSubjectPassManagement;
        goto LABEL_13;
      }
    }
    v8 = 0;
    goto LABEL_15;
  }
  v8 = 0;
LABEL_16:

  return v8;
}

+ (id)subjectToReportDashboardAnalyticsForAccount:(id)a3
{
  return (id)objc_msgSend(a1, "subjectToReportDashboardAnalyticsForFeature:", objc_msgSend(a3, "feature"));
}

+ (id)subjectToReportDashboardAnalyticsForFeature:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return *off_1E2AC2BD0[a3 - 1];
}

+ (void)updateIdentityEventToReportDashboardAnalytics:(id)a3 forPass:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  __CFString **v9;
  void *v10;
  void *v11;
  __CFString *v12;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "secureElementPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "identityType");

  if ((unint64_t)(v8 - 1) > 2)
    v9 = PKAnalyticsReportOtherValue;
  else
    v9 = off_1E2AC2BE8[v8 - 1];
  v12 = *v9;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("identity"), CFSTR("productType"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("productSubType"));
  objc_msgSend(v5, "paymentPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "issuerAdministrativeAreaCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("issuer"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("wallet"), CFSTR("referralSource"));
}

+ (void)reportDashboardEventIfNecessary:(id)a3 forPass:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  if (v6 && a4)
  {
    v9 = v6;
    objc_msgSend(a1, "subjectToReportDashboardAnalyticsForPass:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)objc_msgSend(v9, "copy");
      +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", v7, v8);

    }
    v6 = v9;
  }

}

+ (void)reportAccountRewardsEventIfNecessary:(id)a3
{
  id v3;

  if (a3)
  {
    v3 = (id)objc_msgSend(a3, "copy");
    +[PKAnalyticsReporter subject:sendEvent:](PKAnalyticsReporter, "subject:sendEvent:", CFSTR("appleCardEngagement"), v3);

  }
}

+ (id)reporterForAnalyticsSubject:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&lockCollections);
  +[PKAnalyticsReporter subjectDictionary](PKAnalyticsReporter, "subjectDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&lockCollections);
  return v5;
}

+ (void)beginSubjectReporting:(id)a3 withArchivedParent:(id)a4
{
  id v5;
  id v6;
  PKAnalyticsReporter *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = -[PKAnalyticsReporter initWithArchivedParent:subject:]([PKAnalyticsReporter alloc], "initWithArchivedParent:subject:", v6, v5);

  os_unfair_lock_lock((os_unfair_lock_t)&lockCollections);
  +[PKAnalyticsReporter subjectDictionary](PKAnalyticsReporter, "subjectDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v5);
  +[PKAnalyticsReporter subjectSessionStateDateDictionary](PKAnalyticsReporter, "subjectSessionStateDateDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, v5);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&lockCollections);
  if (v9)
  {
    PKLogFacilityTypeGetObject(0x15uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Conflicting reporter found for subject: %@", buf, 0xCu);
    }

    v15 = CFSTR("eventType");
    v16 = CFSTR("reporterCollision");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendEvent:", v14);

  }
}

void __44__PKAnalyticsReporter_clientTypeForSubject___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("wallet"), CFSTR("fieldDetect"), CFSTR("contactless"), CFSTR("inApp"), CFSTR("inAppProvisioning"), CFSTR("appleCardEngagement"), CFSTR("appleCashEngagement"), CFSTR("fpsEngagement"), CFSTR("secureUIService"), CFSTR("bridge"), CFSTR("discoveryCard"), CFSTR("appleCardOnboarding"), CFSTR("fhOnboarding"), CFSTR("appleCashOnboarding"), CFSTR("fpsOnboarding"), CFSTR("shareInitiation"), CFSTR("shareRedemption"),
         CFSTR("passManagement"),
         CFSTR("identityInApp"),
         CFSTR("walletProvisioning"),
         CFSTR("orderManagement"),
         CFSTR("walletGeolocation"),
         CFSTR("walletSettings"),
         CFSTR("expressPresentment"),
         CFSTR("general"),
         CFSTR("tapToPay"),
         CFSTR("identity"),
         0);
  v1 = (void *)qword_1ECF229F8;
  qword_1ECF229F8 = v0;

}

+ (void)sendSingularEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[5];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E2ADF4C0;
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  v24[0] = *MEMORY[0x1E0D83880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a1, "clientTypeForSubject:", CFSTR("general")));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D83888];
  v25[0] = v11;
  v25[1] = &unk_1E2C41670;
  v13 = *MEMORY[0x1E0D83878];
  v24[1] = v12;
  v24[2] = v13;
  v14 = *MEMORY[0x1E0D838A8];
  v25[2] = v10;
  v25[3] = &unk_1E2C3F388;
  v15 = *MEMORY[0x1E0D83870];
  v24[3] = v14;
  v24[4] = v15;
  v25[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *MEMORY[0x1E0D838B8];
  v22[0] = *MEMORY[0x1E0D838B0];
  v22[1] = v17;
  v23[0] = CFSTR("wallet");
  v23[1] = CFSTR("general");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 0, 0);
  v21 = v19;
  objc_msgSend(MEMORY[0x1E0D83848], "sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:", v16, v18, 1, 100, v5, &v21);

  v20 = v21;
}

+ (id)archivedSessionTokenForAnalyticsSubject:(id)a3
{
  void *v3;
  void *v4;

  +[PKAnalyticsReporter reporterForSubject:](PKAnalyticsReporter, "reporterForSubject:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "archivedSessionToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)analyticsErrorTextForError:(int64_t)a3
{
  id result;

  if (a3 <= 60001)
  {
    if (a3 > 40455)
    {
      if (a3 == 40456)
        return CFSTR("invalidVerificationCode");
      if (a3 == 40457)
        return CFSTR("expiredVerificationCode");
    }
    else
    {
      if (a3 == 40423)
        return CFSTR("verificationRequestLimitReached");
      if (a3 == 40454)
        return CFSTR("verificationAttemptLimitReached");
    }
    return CFSTR("invalidUndefinedField");
  }
  else
  {
    result = CFSTR("invalidFirstName");
    switch(a3)
    {
      case 60039:
        return result;
      case 60040:
        return CFSTR("invalidLastName");
      case 60041:
        return CFSTR("invalidDateOfBirth");
      case 60042:
        return CFSTR("POBoxNotAllowed");
      case 60043:
        return CFSTR("invalidStreet1");
      case 60044:
        return CFSTR("invalidStreet2");
      case 60045:
        return CFSTR("invalidPhoneNumber");
      case 60046:
        return CFSTR("invalidIncome");
      case 60047:
        return CFSTR("invalidCitizenship");
      case 60048:
        return CFSTR("invalidSSNSuffix");
      case 60049:
        return CFSTR("invalidSSN");
      case 60050:
        return CFSTR("invalidPostalCode");
      case 60051:
      case 60054:
      case 60055:
      case 60057:
      case 60058:
      case 60059:
      case 60060:
      case 60061:
      case 60062:
      case 60063:
      case 60064:
      case 60065:
      case 60066:
      case 60067:
      case 60068:
        return CFSTR("invalidUndefinedField");
      case 60052:
        return CFSTR("invalidCity");
      case 60053:
        return CFSTR("invalidState");
      case 60056:
        return CFSTR("invalidRegion");
      case 60069:
        return CFSTR("invalidTotalIncome");
      case 60070:
        return CFSTR("invalidTotalAssets");
      default:
        if (a3 == 60002)
        {
          result = CFSTR("minimumAgeRequirementsNotMet");
        }
        else
        {
          if (a3 != 60092)
            return CFSTR("invalidUndefinedField");
          result = CFSTR("verificationAlreadyCompleted");
        }
        break;
    }
  }
  return result;
}

- (PKAnalyticsReporter)initWithArchivedParent:(id)a3 subject:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  PKAnalyticsReporter *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C99E60];
  v8 = a3;
  v9 = [v7 alloc];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = (void *)objc_msgSend(v9, "initWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v13, v8, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v19;
  if (v15)
  {
    PKLogFacilityTypeGetObject(0x15uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v15;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Failed to unarchive parent token with error %@", buf, 0xCu);
    }

  }
  v17 = -[PKAnalyticsReporter initWithParentToken:subject:](self, "initWithParentToken:subject:", v14, v6);

  return v17;
}

- (id)_reportingSessionID
{
  return (id)-[RTCReporting getReportingSessionID](self->_session, "getReportingSessionID");
}

- (int64_t)bucketedSessionDurationFromDuration:(int64_t)a3
{
  if (a3 <= 119)
    return 5 * (a3 / 5);
  else
    return 120;
}

@end
