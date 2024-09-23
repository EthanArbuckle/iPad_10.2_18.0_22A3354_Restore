@implementation PGSuggestionNotificationProfile

- (PGSuggestionNotificationProfile)initWithExistingSuggestions:(id)a3 serviceManager:(id)a4
{
  id v7;
  id v8;
  PGSuggestionNotificationProfile *v9;
  PGSuggestionNotificationProfile *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGSuggestionNotificationProfile;
  v9 = -[PGSuggestionNotificationProfile init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_existingSuggestions, a3);
    objc_storeStrong((id *)&v10->_serviceManager, a4);
  }

  return v10;
}

- (BOOL)eligibleForNotification
{
  PGSuggestionNotificationProfile *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_userType)
    -[PGSuggestionNotificationProfile _determineUserTypeAndEligibility](v2, "_determineUserTypeAndEligibility");
  objc_sync_exit(v2);

  return v2->_eligibleForNotification;
}

- (unsigned)userType
{
  PGSuggestionNotificationProfile *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_userType)
    -[PGSuggestionNotificationProfile _determineUserTypeAndEligibility](v2, "_determineUserTypeAndEligibility");
  objc_sync_exit(v2);

  return v2->_userType;
}

- (id)shareParticipantContactIdentifiers
{
  PGSuggestionNotificationProfile *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_userType)
    -[PGSuggestionNotificationProfile _determineUserTypeAndEligibility](v2, "_determineUserTypeAndEligibility");
  objc_sync_exit(v2);

  return v2->_shareParticipantContactIdentifiers;
}

- (NSDate)dateOfLastNotification
{
  PGSuggestionNotificationProfile *v2;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_userType)
    -[PGSuggestionNotificationProfile _determineUserTypeAndEligibility](v2, "_determineUserTypeAndEligibility");
  objc_sync_exit(v2);

  return v2->_dateOfLastNotification;
}

- (BOOL)shouldNotifyForSuggestion:(id)a3 withOptions:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  unsigned int v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *loggingConnection;
  OS_os_log *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  const __CFString *v26;
  int v28;
  _BYTE v29[28];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(a4, "localToday");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "universalDateFromLocalDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "universalEndDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  if (v11 < 0.0)
    v11 = -v11;
  if (v11 <= 604800.0)
  {
    v14 = -[PGSuggestionNotificationProfile userType](self, "userType");
    v15 = objc_msgSend(v6, "notificationQuality");
    if (v15 >= objc_msgSend((id)objc_opt_class(), "_requiredNotificationQualityForUserType:", v14))
    {
      -[PGSuggestionNotificationProfile dateOfLastNotification](self, "dateOfLastNotification");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend((id)objc_opt_class(), "_requiredTimeIntervalFromLastNotificationForUserType:", v14);
        v18 = v17;
        objc_msgSend(v9, "timeIntervalSinceDate:", v16);
        if (v19 >= 0.0)
          v20 = v19;
        else
          v20 = -v19;
        v13 = v20 > v18;
        loggingConnection = self->_loggingConnection;
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 67109634;
          *(_DWORD *)v29 = v20 > v18;
          *(_WORD *)&v29[4] = 2048;
          *(double *)&v29[6] = v18 / 86400.0;
          *(_WORD *)&v29[14] = 2112;
          *(_QWORD *)&v29[16] = v9;
          _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Should notify for suggestion: %d (requiredTimeIntervalFromLastNotification %.0f - queryDate %@)", (uint8_t *)&v28, 0x1Cu);
        }
      }
      else
      {
        v13 = 1;
      }

    }
    else
    {
      v13 = 0;
    }
    v22 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
    {
      if (v15 > 4)
        v23 = CFSTR("Unknown");
      else
        v23 = off_1E842E198[v15];
      v24 = v23;
      v25 = v24;
      if (v14 > 4)
        v26 = CFSTR("Unknown");
      else
        v26 = off_1E84282C8[v14];
      v28 = 67109634;
      *(_DWORD *)v29 = v13;
      *(_WORD *)&v29[4] = 2112;
      *(_QWORD *)&v29[6] = v24;
      *(_WORD *)&v29[14] = 2112;
      *(_QWORD *)&v29[16] = v26;
      _os_log_impl(&dword_1CA237000, (os_log_t)v22, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Should notify for suggestion: %d (notification quality %@ - user type %@)", (uint8_t *)&v28, 0x1Cu);

    }
  }
  else
  {
    v12 = self->_loggingConnection;
    LOBYTE(v13) = 0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 134218498;
      *(_QWORD *)v29 = 7;
      *(_WORD *)&v29[8] = 2112;
      *(_QWORD *)&v29[10] = v9;
      *(_WORD *)&v29[18] = 2112;
      *(_QWORD *)&v29[20] = v10;
      _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Cannot notify suggestion: above time window limit of %lu days (query date %@, suggestion date %@)", (uint8_t *)&v28, 0x20u);
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (void)_determineUserTypeAndEligibility
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *loggingConnection;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  NSDate *dateOfLastNotification;
  NSDate *v30;
  NSDate *v31;
  NSDate *v32;
  NSDate *v33;
  NSDate *v34;
  void *v35;
  uint64_t v37;
  void *v38;
  BOOL v39;
  int v40;
  int v41;
  double v42;
  NSObject *v43;
  NSSet *shareParticipantContactIdentifiers;
  unint64_t v45;
  id obj;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  _BYTE v68[10];
  _BYTE v69[10];
  __int16 v70;
  int v71;
  __int16 v72;
  unint64_t v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  unint64_t v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = objc_claimAutoreleasedReturnValue();

  v54 = (id)objc_opt_new();
  v48 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 7, 0x7FFFFFFFFFFFFFFFLL, v4);
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
  v5 = 0;
  if (v49)
  {
    v45 = 0;
    v47 = *(_QWORD *)v64;
    do
    {
      v6 = 0;
      do
      {
        v52 = v5;
        if (*(_QWORD *)v64 != v47)
          objc_enumerationMutation(obj);
        v50 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v6);
        v51 = v6;
        objc_msgSend(MEMORY[0x1E0CD17A8], "fetchParticipantsInShare:options:", v45);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v60;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v60 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v11);
              objc_msgSend(v12, "emailAddress");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (v13 || (objc_msgSend(v12, "phoneNumber"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
              {
                -[CLSServiceManager personForPersonHandle:](self->_serviceManager, "personForPersonHandle:", v13);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "CNIdentifier");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v15, "length"))
                {
                  objc_msgSend(v54, "addObject:", v15);
                }
                else
                {
                  loggingConnection = self->_loggingConnection;
                  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)v68 = v12;
                    *(_WORD *)&v68[8] = 2112;
                    *(_QWORD *)v69 = v13;
                    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] No person node found for share participant: %@, identifier: %@", buf, 0x16u);
                  }
                }

              }
              else
              {
                v17 = self->_loggingConnection;
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v68 = v12;
                  _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] No identifier available for share participant: %@", buf, 0xCu);
                }
              }
              ++v11;
            }
            while (v9 != v11);
            v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
            v9 = v18;
          }
          while (v18);
        }
        objc_msgSend(v50, "creationDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v52)
        {
          objc_msgSend(v19, "laterDate:", v52);
          v21 = objc_claimAutoreleasedReturnValue();

          v5 = (id)v21;
        }
        else
        {
          v5 = v19;
        }

        v6 = v51 + 1;
      }
      while (v51 + 1 != v49);
      v45 += v49;
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
    }
    while (v49);
  }
  else
  {
    v45 = 0;
  }
  objc_storeStrong((id *)&self->_shareParticipantContactIdentifiers, v54);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v22 = self->_existingSuggestions;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v55, v80, 16);
  if (v23)
  {
    v24 = v23;
    v25 = 0;
    v53 = 0;
    v26 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v56 != v26)
          objc_enumerationMutation(v22);
        v28 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        if (objc_msgSend(v28, "notificationState", v45))
        {
          dateOfLastNotification = self->_dateOfLastNotification;
          objc_msgSend(v28, "creationDate");
          v30 = (NSDate *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (dateOfLastNotification)
          {
            -[NSDate laterDate:](dateOfLastNotification, "laterDate:", v30);
            v32 = (NSDate *)objc_claimAutoreleasedReturnValue();
            v33 = self->_dateOfLastNotification;
            self->_dateOfLastNotification = v32;

          }
          else
          {
            v34 = self->_dateOfLastNotification;
            self->_dateOfLastNotification = v30;
            v31 = v34;
          }

          if (objc_msgSend(v28, "state") == 3)
          {
            ++v53;
          }
          else if (objc_msgSend(v28, "state") == 4)
          {
            ++v25;
          }
        }
        objc_msgSend(v28, "creationDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "state") == 3 && v35 != 0)
        {
          if (v5)
          {
            objc_msgSend(v35, "laterDate:", v5);
            v37 = objc_claimAutoreleasedReturnValue();

            v5 = (id)v37;
          }
          else
          {
            v5 = v35;
          }
        }

      }
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v55, v80, 16);
    }
    while (v24);
  }
  else
  {
    v25 = 0;
    v53 = 0;
  }

  v38 = v5;
  if (v5)
    v39 = v45 == 0;
  else
    v39 = 1;
  v40 = v39;
  if (v39 && v25 < 2)
  {
    v41 = 1;
  }
  else if (v45 >= 3 && v53)
  {
    v41 = 2;
  }
  else if (v25 > 1 || v38 && (objc_msgSend(v38, "timeIntervalSinceNow"), v42 > 2592000.0))
  {
    v41 = 3;
  }
  else
  {
    v41 = 4;
  }
  self->_userType = v41;
  self->_eligibleForNotification = v25 < 4;
  v43 = self->_loggingConnection;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    shareParticipantContactIdentifiers = self->_shareParticipantContactIdentifiers;
    *(_DWORD *)buf = 67110914;
    *(_DWORD *)v68 = v25 < 4;
    *(_WORD *)&v68[4] = 1024;
    *(_DWORD *)&v68[6] = v41;
    *(_WORD *)v69 = 2112;
    *(_QWORD *)&v69[2] = shareParticipantContactIdentifiers;
    v70 = 1024;
    v71 = v40;
    v72 = 2048;
    v73 = v45;
    v74 = 2112;
    v75 = v38;
    v76 = 2048;
    v77 = v53;
    v78 = 2048;
    v79 = v25;
    _os_log_impl(&dword_1CA237000, v43, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Summary for Notification Profile:\n\teligibleForNotification: %d\n\tuserType: %d\n\tshareParticipantContactIdentifiers: %@\n\tuserNeverShared: %d\n\tnumberOfMomentShare: %lu\n\tlastMomentShare: %@\n\tnumberOfSuccessfulNotifications: %lu\n\tnumberOfUnsuccessfulNotifications: %lu\n\t", buf, 0x46u);
  }

}

- (unsigned)notificationQualityForHighlightNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  unsigned __int8 v13;
  char v14;
  NSObject *loggingConnection;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "meaningLabels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __71__PGSuggestionNotificationProfile_notificationQualityForHighlightNode___block_invoke;
  v34[3] = &unk_1E84282A8;
  v34[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v34);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredSetUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  if (objc_msgSend(v5, "count"))
  {
    +[PGGraph mostSignificantMeaningLabels](PGGraph, "mostSignificantMeaningLabels");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "intersectsSet:", v10) & 1) != 0)
    {

LABEL_9:
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = (uint64_t)v5;
        _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlight node notification quality must see: %@", buf, 0xCu);
      }
      v13 = 4;
      goto LABEL_36;
    }
    v29 = v9;
    v14 = objc_msgSend(v4, "isPartOfTrip");

    if ((v14 & 1) != 0)
      goto LABEL_9;
    v27 = v8;
    v28 = v6;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = v6;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = 0;
      v21 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(v16);
          v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if ((objc_msgSend(v23, "isMeNode") & 1) == 0)
          {
            v19 += objc_msgSend(v23, "isFavorite");
            v20 += objc_msgSend(v23, "belongsToBestSocialGroups");
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
      }
      while (v18);
    }
    else
    {
      v19 = 0;
      v20 = 0;
    }

    v24 = self->_loggingConnection;
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v29 || v19 || v20)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138413058;
        v36 = (uint64_t)v5;
        v37 = 2048;
        v38 = v29;
        v39 = 2048;
        v40 = v19;
        v41 = 2048;
        v42 = v20;
        _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlight node notification quality stellar: it has a meaning %@ and important people (previous sharing recipients %lu, favorites %lu, best social group %lu)", buf, 0x2Au);
      }
      v13 = 3;
    }
    else
    {
      if (v25)
      {
        *(_DWORD *)buf = 138412290;
        v36 = (uint64_t)v5;
        _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlight node notification quality great: it has a meaning %@", buf, 0xCu);
      }
      v13 = 2;
    }
    v8 = v27;
    v6 = v28;
  }
  else
  {
    v11 = self->_loggingConnection;
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        *(_DWORD *)buf = 134217984;
        v36 = v9;
        _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlight node notification quality great: it contains %lu previous sharing recipients", buf, 0xCu);
      }
      v13 = 2;
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_DEFAULT, "[Sharing Suggestion] Highlight node notification quality other", buf, 2u);
      }
      v13 = 1;
    }
  }
LABEL_36:

  return v13;
}

- (unsigned)notificationQualityForEnrichableEvent:(id)a3
{
  return 4;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void)setLoggingConnection:(id)a3
{
  self->_loggingConnection = (OS_os_log *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastNotification, 0);
  objc_storeStrong((id *)&self->_shareParticipantContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_existingSuggestions, 0);
}

uint64_t __71__PGSuggestionNotificationProfile_notificationQualityForHighlightNode___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "shareParticipantContactIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

+ (unsigned)_requiredNotificationQualityForUserType:(unsigned __int8)a3
{
  unint64_t v3;

  v3 = 0x304020300uLL >> (8 * a3);
  if (a3 >= 5u)
    LOBYTE(v3) = 0;
  return v3 & 7;
}

+ (double)_requiredTimeIntervalFromLastNotificationForUserType:(unsigned __int8)a3
{
  if ((a3 - 1) > 3u)
    return 978307200.0;
  else
    return dbl_1CA8EC7D0[(a3 - 1)];
}

@end
