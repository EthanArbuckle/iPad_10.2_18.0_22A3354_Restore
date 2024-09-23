@implementation PPMediaPlayerDelegate

- (PPMediaPlayerDelegate)init
{
  void *v3;
  PPMediaPlayerDelegate *v4;

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    self = -[PPMediaPlayerDelegate initWithNamedEntityStore:donationDelaySeconds:registersResponseLoading:useNamedEntityDissector:](self, "initWithNamedEntityStore:donationDelaySeconds:registersResponseLoading:useNamedEntityDissector:", v3, 1, 1, 32.0);
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (PPMediaPlayerDelegate)initWithNamedEntityStore:(id)a3 donationDelaySeconds:(double)a4 registersResponseLoading:(BOOL)a5 useNamedEntityDissector:(BOOL)a6
{
  _BOOL4 v7;
  id v12;
  PPMediaPlayerDelegate *v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *dispatchQueue;
  PPMediaPlayerResponse *pendingDonation;
  NSDate *pendingDonationTimestamp;
  void *v21;
  objc_super v22;

  v7 = a5;
  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPMediaPlayerDelegate.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namedEntityStore"));

  }
  v22.receiver = self;
  v22.super_class = (Class)PPMediaPlayerDelegate;
  v13 = -[PPMediaPlayerDelegate init](&v22, sel_init);
  if (v13)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_BACKGROUND, 0);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = dispatch_queue_create("PPMediaPlayerDelegateQueue", v15);
    dispatchQueue = v13->_dispatchQueue;
    v13->_dispatchQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v13->_namedEntityStore, a3);
    v13->_donationDelaySeconds = a4;
    v13->_useNamedEntityDissector = a6;
    pendingDonation = v13->_pendingDonation;
    v13->_pendingDonation = 0;

    pendingDonationTimestamp = v13->_pendingDonationTimestamp;
    v13->_pendingDonationTimestamp = 0;

    if (v7)
      -[PPMediaPlayerDelegate _registerForNowPlayingNotifications](v13, "_registerForNowPlayingNotifications");

  }
  return v13;
}

- (void)_registerForNowPlayingNotifications
{
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v4;

  MRMediaRemoteSetWantsNowPlayingNotifications();
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)_nowPlayingInfoCallback, (CFStringRef)*MEMORY[0x1E0D4CA08], 0, CFNotificationSuspensionBehaviorDrop);
  v4 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)_nowPlayingInfoCallback, (CFStringRef)*MEMORY[0x1E0D4C920], 0, CFNotificationSuspensionBehaviorDrop);
}

- (void)_donateDelayedResponse:(id)a3 timePlayed:(double)a4 bundleId:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  PPMediaPlayerDelegate *v73;
  NSObject *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  NSObject *v94;
  uint64_t v95;
  PPNamedEntityStore *namedEntityStore;
  void *v97;
  void *v98;
  void *v99;
  BOOL v100;
  id v101;
  PPNamedEntityStore *v102;
  BOOL v103;
  NSObject *v104;
  NSObject *v105;
  NSObject *v106;
  NSObject *v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  PPMediaPlayerDelegate *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  id v124;
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint8_t buf[4];
  uint64_t v143;
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(v8, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      if (objc_msgSend(v9, "length"))
      {
        objc_msgSend(v8, "duration");
        v13 = fmin(a4 / v12, 1.0);
        if (v13 < 0.0)
          v13 = 0.0;
        if (v12 > 0.0)
          v14 = v13;
        else
          v14 = 1.0;
        v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D70C80]), "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", a4, v12, 0, 0, 0, 0);
        objc_msgSend(v8, "storeItemID");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16
          && (v17 = (void *)v16,
              objc_msgSend(v8, "storeItemID"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              v19 = objc_msgSend(v18, "longValue"),
              v18,
              v17,
              v19))
        {
          v20 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v8, "storeItemID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "initWithFormat:", CFSTR("storeAdamID:%@"), v21);
        }
        else
        {
          v21 = (void *)objc_opt_new();
          objc_msgSend(v21, "UUIDString");
          v22 = objc_claimAutoreleasedReturnValue();
        }
        v23 = (void *)v22;

        v24 = objc_alloc(MEMORY[0x1E0D70C78]);
        v25 = *MEMORY[0x1E0D70ED8];
        v26 = (void *)objc_opt_new();
        v27 = (void *)objc_msgSend(v24, "initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:", v9, v25, v23, v26, 0, 0, 0, v15);

        v28 = objc_opt_new();
        v29 = (void *)v28;
        v113 = self;
        v114 = v23;
        if (self->_useNamedEntityDissector)
        {
          v123 = (void *)v28;
          v107 = v15;
          +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "language");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = v9;
          objc_msgSend(v30, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", v9, v31, 1, 1);
          v32 = objc_claimAutoreleasedReturnValue();

          +[PPNamedEntityDissector sharedInstance](PPNamedEntityDissector, "sharedInstance");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = v8;
          objc_msgSend(v8, "title");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = v33;
          v110 = (void *)v32;
          v111 = v27;
          objc_msgSend(v33, "entitiesInPlainText:eligibleRegions:source:cloudSync:algorithms:", v34, 0, v27, 0, v32);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v140 = 0u;
          v141 = 0u;
          v138 = 0u;
          v139 = 0u;
          v36 = v35;
          v117 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v138, v147, 16);
          if (v117)
          {
            v115 = *(_QWORD *)v139;
            v119 = v36;
            do
            {
              v37 = 0;
              do
              {
                if (*(_QWORD *)v139 != v115)
                  objc_enumerationMutation(v36);
                v121 = v37;
                v38 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * v37);
                v134 = 0u;
                v135 = 0u;
                v136 = 0u;
                v137 = 0u;
                objc_msgSend(v38, "entities");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v134, v146, 16);
                if (v40)
                {
                  v41 = v40;
                  v42 = *(_QWORD *)v135;
                  do
                  {
                    for (i = 0; i != v41; ++i)
                    {
                      if (*(_QWORD *)v135 != v42)
                        objc_enumerationMutation(v39);
                      v44 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * i);
                      v45 = (void *)MEMORY[0x1C3BD6630]();
                      v46 = objc_alloc(MEMORY[0x1E0D70BC0]);
                      objc_msgSend(v44, "item");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v47, "name");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v44, "item");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v49, "bestLanguage");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      v51 = (void *)objc_msgSend(v46, "initWithName:category:language:", v48, 6, v50);

                      v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v51, v14);
                      objc_msgSend(v123, "addObject:", v52);

                      objc_autoreleasePoolPop(v45);
                    }
                    v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v134, v146, 16);
                  }
                  while (v41);
                }

                v36 = v119;
                v37 = v121 + 1;
              }
              while (v121 + 1 != v117);
              v117 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v138, v147, 16);
            }
            while (v117);
          }

          v8 = v112;
          objc_msgSend(v112, "album");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "length");

          if (v54)
          {
            objc_msgSend(v112, "album");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "entitiesInPlainText:eligibleRegions:source:cloudSync:algorithms:", v55, 0, v111, 0, v110);
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            v132 = 0u;
            v133 = 0u;
            v130 = 0u;
            v131 = 0u;
            v36 = v56;
            v118 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v130, v145, 16);
            if (v118)
            {
              v116 = *(_QWORD *)v131;
              v120 = v36;
              do
              {
                v57 = 0;
                do
                {
                  if (*(_QWORD *)v131 != v116)
                    objc_enumerationMutation(v36);
                  v122 = v57;
                  v58 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * v57);
                  v126 = 0u;
                  v127 = 0u;
                  v128 = 0u;
                  v129 = 0u;
                  objc_msgSend(v58, "entities");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v126, v144, 16);
                  if (v60)
                  {
                    v61 = v60;
                    v62 = *(_QWORD *)v127;
                    do
                    {
                      for (j = 0; j != v61; ++j)
                      {
                        if (*(_QWORD *)v127 != v62)
                          objc_enumerationMutation(v59);
                        v64 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * j);
                        v65 = (void *)MEMORY[0x1C3BD6630]();
                        v66 = objc_alloc(MEMORY[0x1E0D70BC0]);
                        objc_msgSend(v64, "item");
                        v67 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v67, "name");
                        v68 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v64, "item");
                        v69 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v69, "bestLanguage");
                        v70 = (void *)objc_claimAutoreleasedReturnValue();
                        v71 = (void *)objc_msgSend(v66, "initWithName:category:language:", v68, 6, v70);

                        v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v71, v14);
                        objc_msgSend(v123, "addObject:", v72);

                        objc_autoreleasePoolPop(v65);
                      }
                      v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v126, v144, 16);
                    }
                    while (v61);
                  }

                  v36 = v120;
                  v57 = v122 + 1;
                }
                while (v122 + 1 != v118);
                v118 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v130, v145, 16);
              }
              while (v118);
            }

            v8 = v112;
          }
          v15 = v107;
          v9 = v108;
          v73 = v113;
          v27 = v111;
          v29 = v123;

        }
        else
        {
          v75 = objc_alloc(MEMORY[0x1E0D70BC0]);
          objc_msgSend(v8, "title");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D70D00], "currentLocaleLanguageCode");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = (void *)objc_msgSend(v75, "initWithName:category:language:", v76, 6, v77);

          v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v78, v14);
          objc_msgSend(v29, "addObject:", v79);
          objc_msgSend(v8, "album");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(v80, "length");

          if (v81)
          {
            v82 = objc_alloc(MEMORY[0x1E0D70BC0]);
            objc_msgSend(v8, "album");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D70D00], "currentLocaleLanguageCode");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = (void *)objc_msgSend(v82, "initWithName:category:language:", v83, 6, v84);

            v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v85, v14);
            objc_msgSend(v29, "addObject:", v86);

          }
          v73 = v113;
        }
        objc_msgSend(v8, "artist");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v87, "length");

        if (v88)
        {
          v89 = objc_alloc(MEMORY[0x1E0D70BC0]);
          objc_msgSend(v8, "artist");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D70D00], "currentLocaleLanguageCode");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = (void *)objc_msgSend(v89, "initWithName:category:language:", v90, 7, v91);

          v93 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v92, v14);
          objc_msgSend(v29, "addObject:", v93);

        }
        pp_entities_log_handle();
        v94 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          v95 = objc_msgSend(v29, "count");
          *(_DWORD *)buf = 134217984;
          v143 = v95;
          _os_log_impl(&dword_1C392E000, v94, OS_LOG_TYPE_DEFAULT, "PPMediaPlayerDelegate: entity count: %tu", buf, 0xCu);
        }

        if (objc_msgSend(v29, "count"))
        {
          namedEntityStore = v73->_namedEntityStore;
          v125 = 0;
          v97 = v29;
          v98 = v29;
          v99 = v27;
          v100 = -[PPNamedEntityStore donateNamedEntities:source:algorithm:cloudSync:sentimentScore:error:](namedEntityStore, "donateNamedEntities:source:algorithm:cloudSync:sentimentScore:error:", v98, v27, 8, 0, &v125, 0.0);
          v101 = v125;
          if (v100)
          {
            v102 = v73->_namedEntityStore;
            v124 = 0;
            v103 = -[PPNamedEntityStore flushDonationsWithError:](v102, "flushDonationsWithError:", &v124);
            v104 = v124;
            if (!v103)
            {
              pp_default_log_handle();
              v105 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v143 = (uint64_t)v104;
                _os_log_impl(&dword_1C392E000, v105, OS_LOG_TYPE_DEFAULT, "PPMediaPlayerDelegate: Warning: failed to flush: %@", buf, 0xCu);
              }

            }
            pp_entities_log_handle();
            v106 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C392E000, v106, OS_LOG_TYPE_DEFAULT, "PPMediaPlayerDelegate: completed donation.", buf, 2u);
            }

          }
          else
          {
            pp_entities_log_handle();
            v104 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v143 = (uint64_t)v101;
              _os_log_error_impl(&dword_1C392E000, v104, OS_LOG_TYPE_ERROR, "PPMediaPlayerDelegate: failed to donate named entities: %@", buf, 0xCu);
            }
          }

          v27 = v99;
          v29 = v97;
        }

      }
      else
      {
        pp_entities_log_handle();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C392E000, v74, OS_LOG_TYPE_ERROR, "PPMediaPlayerDelegate: previous MRPlaybackQueue has no playerPath.bundleID", buf, 2u);
        }

        +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
        v15 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v15, &__block_literal_global_20573);
      }

    }
  }

}

- (id)getResponse
{
  void *v2;
  NSObject *v3;
  const void *Default;
  id v5;
  NSObject *v6;
  id v7;
  id v9;
  NSObject *v10;

  v2 = (void *)objc_opt_new();
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  Default = (const void *)MRPlaybackQueueRequestCreateDefault();
  v9 = v2;
  v10 = v3;
  MRMediaRemoteRequestNowPlayingPlaybackQueueSync();
  dispatch_group_enter(v10);
  v5 = v9;
  v6 = v10;
  MRMediaRemoteGetNowPlayingApplicationPlaybackState();
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (Default)
    CFRelease(Default);
  v7 = v5;

  return v7;
}

- (void)processResponse:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  PPMediaPlayerResponse **p_pendingDonation;
  PPMediaPlayerResponse *v9;
  NSDate *v10;
  NSDate *v11;
  PPMediaPlayerResponse *v12;
  NSDate *pendingDonationTimestamp;
  void *v14;
  double v15;
  double v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  unsigned int v20;
  void *v21;
  NSObject *dispatchQueue;
  uint64_t v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD block[5];
  PPMediaPlayerResponse *v30;
  id v31;
  double v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  pp_entities_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "title");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v28, "length");
    v24 = objc_msgSend(v5, "state");
    objc_msgSend(v5, "bundleID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playerID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v34 = v23;
    v35 = 1024;
    v36 = v24;
    v37 = 2112;
    v38 = v6;
    v39 = 2112;
    v40 = v25;
    v41 = 2112;
    v42 = v26;
    _os_log_debug_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEBUG, "PPMediaPlayerDelegate: processResponse: title.length:%tu state:%d timestamp:%@ bundleId:%@ playerId:%@", buf, 0x30u);

  }
  if (objc_msgSend(v5, "state") != 1
    || (objc_msgSend(v5, "isEqualToResponse:", self->_pendingDonation) & 1) == 0)
  {
    p_pendingDonation = &self->_pendingDonation;
    v9 = self->_pendingDonation;
    v10 = self->_pendingDonationTimestamp;
    if (objc_msgSend(v5, "state") == 1)
    {
      objc_storeStrong((id *)&self->_pendingDonation, a3);
      v11 = v6;
    }
    else
    {
      v12 = *p_pendingDonation;
      *p_pendingDonation = 0;

      v11 = 0;
    }
    pendingDonationTimestamp = self->_pendingDonationTimestamp;
    self->_pendingDonationTimestamp = v11;

    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "timeIntervalSinceDate:", v10);
    v16 = v15;

    if (v9 && v16 >= self->_donationDelaySeconds)
    {
      -[PPMediaPlayerResponse bundleID](v9, "bundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "hasPrefix:", CFSTR("com.apple.WebKit")) & 1) == 0
        && (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D70E68]) & 1) == 0)
      {
        pp_entities_log_handle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          -[PPMediaPlayerResponse title](v9, "title");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v27, "length");
          v20 = -[PPMediaPlayerResponse state](v9, "state");
          -[PPMediaPlayerResponse playerID](v9, "playerID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v34 = v19;
          v35 = 1024;
          v36 = v20;
          v37 = 2112;
          v38 = v17;
          v39 = 2112;
          v40 = v21;
          _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPMediaPlayerDelegate: donating response: title.length:%tu state:%d bundleId:%@ playerId:%@", buf, 0x26u);

        }
        dispatchQueue = self->_dispatchQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __41__PPMediaPlayerDelegate_processResponse___block_invoke;
        block[3] = &unk_1E7E1E8F0;
        block[4] = self;
        v30 = v9;
        v32 = v16;
        v31 = v17;
        dispatch_async(dispatchQueue, block);

      }
    }

  }
}

- (void)waitForQueueEmpty
{
  dispatch_sync((dispatch_queue_t)self->_dispatchQueue, &__block_literal_global_125_20561);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_pendingDonationTimestamp, 0);
  objc_storeStrong((id *)&self->_pendingDonation, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
}

uint64_t __41__PPMediaPlayerDelegate_processResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_donateDelayedResponse:timePlayed:bundleId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

void __36__PPMediaPlayerDelegate_getResponse__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a2;
  objc_msgSend(v31, "resolvedPlayerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPlayerID:", v5);

  objc_msgSend(v31, "resolvedPlayerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBundleID:", v8);

  objc_msgSend(v31, "contentItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(v31, "contentItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTitle:", v14);

    objc_msgSend(v31, "contentItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "metadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "albumName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAlbum:", v18);

    objc_msgSend(v31, "contentItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "metadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trackArtistName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setArtist:", v22);

    v23 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v31, "contentItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "metadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "numberWithLongLong:", objc_msgSend(v26, "iTunesStoreIdentifier"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setStoreItemID:", v27);

    objc_msgSend(v31, "contentItems");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "metadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "duration");
    objc_msgSend(*(id *)(a1 + 32), "setDuration:");

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __36__PPMediaPlayerDelegate_getResponse__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setState:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __68__PPMediaPlayerDelegate__donateDelayedResponse_timePlayed_bundleId___block_invoke()
{
  void *v0;
  id v1;

  v1 = (id)objc_opt_new();
  objc_msgSend(v1, "setSource:", 19);
  objc_msgSend(v1, "setErrorMessage:", CFSTR("PPMediaPlayerDelegate: previous MRPlaybackQueue has no playerPath.bundleID."));
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "trackScalarForMessage:", v1);

}

+ (id)bundleIdOfCurrentForegroundApp
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForForegroundApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

@end
