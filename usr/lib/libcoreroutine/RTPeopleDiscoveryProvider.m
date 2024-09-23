@implementation RTPeopleDiscoveryProvider

- (void)_fetchAndReconcileAdvertisements
{
  NSObject *v2;
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  dispatch_time_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  RTPeopleDiscoveryAdvertisement *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  RTPeopleDiscoveryAdvertisement *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *dsema;
  id obj;
  void *v65;
  _QWORD v66[4];
  id v67;
  id v68;
  _QWORD v69[5];
  id v70;
  uint8_t *v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  NSObject *v82;
  uint8_t *v83;
  uint64_t *v84;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t v87;
  double *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  uint8_t v101[8];
  uint8_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  _BYTE v107[128];
  _BYTE buf[12];
  __int16 v109;
  uint64_t v110;
  __int16 v111;
  uint64_t v112;
  __int16 v113;
  void *v114;
  _BYTE v115[128];
  _QWORD v116[4];

  v116[1] = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v101 = 0;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "#RTPeopleDiscoveryProvider fetching advertisements", v101, 2u);
  }

  *(_QWORD *)v101 = 0;
  v102 = v101;
  v103 = 0x3032000000;
  v104 = __Block_byref_object_copy__97;
  v105 = __Block_byref_object_dispose__97;
  v106 = (id)objc_opt_new();
  v95 = 0;
  v96 = &v95;
  v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__97;
  v99 = __Block_byref_object_dispose__97;
  v100 = 0;
  v3 = dispatch_semaphore_create(0);
  v91 = 0;
  v92 = &v91;
  v93 = 0x2020000000;
  v94 = 0;
  v87 = 0;
  v88 = (double *)&v87;
  v89 = 0x2020000000;
  v90 = 0;
  -[RTPeopleDiscoveryProvider advertisementManager](self, "advertisementManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __61__RTPeopleDiscoveryProvider__fetchAndReconcileAdvertisements__block_invoke;
  v81[3] = &unk_1E92A1288;
  v83 = v101;
  v84 = &v91;
  v85 = &v87;
  v86 = &v95;
  v5 = v3;
  v82 = v5;
  objc_msgSend(v4, "fetchAdvertisementsDetailedWithHandler:", v81);

  dsema = v5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_time(0, 60000000000);
  if (!dispatch_semaphore_wait(dsema, v7))
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v6);
  v10 = v9;
  v11 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_374);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filteredArrayUsingPredicate:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "submitToCoreAnalytics:type:duration:", v15, 1, v10);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v17 = (void *)MEMORY[0x1E0CB35C8];
  v116[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v116, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_retainAutorelease(v19);

  }
  else
  {
LABEL_8:
    v20 = 0;
  }

  v21 = v20;
  v61 = v21;
  if (v96[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v96[5], "description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v23;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fail to fetch advertisements, %@", buf, 0xCu);

    }
  }
  else if (v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v61, "description");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v24;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fail to fetch advertisements, %@", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v22 = objc_claimAutoreleasedReturnValue();
    v65 = (void *)objc_opt_new();
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = *((id *)v102 + 5);
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v115, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v78 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
          v29 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v28, "unixTime");
          objc_msgSend(v29, "dateWithTimeIntervalSince1970:");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = [RTPeopleDiscoveryAdvertisement alloc];
          objc_msgSend(v28, "address");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v28, "rssi");
          objc_msgSend(v28, "contactId");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[RTPeopleDiscoveryAdvertisement initWithAddress:rssi:scanDate:contactID:](v31, "initWithAddress:rssi:scanDate:contactID:", v32, v33, v30, v34);

          objc_msgSend(v65, "addObject:", v35);
          if (-[NSObject compare:](v22, "compare:", v30) == 1)
          {
            v36 = v30;

            v22 = v36;
          }

        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v115, 16);
      }
      while (v25);
    }

    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v38 = objc_msgSend(*((id *)v102 + 5), "count");
      v39 = v92[3];
      v40 = *((_QWORD *)v88 + 3);
      -[NSObject getFormattedDateString](v22, "getFormattedDateString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = v38;
      v109 = 2048;
      v110 = v39;
      v111 = 2048;
      v112 = v40;
      v113 = 2112;
      v114 = v41;
      _os_log_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider receive advertisements, incomingAdvs count %lu, countSinceLastFetch %lu, scanDuration %f, earliestAdvertisementDate, %@", buf, 0x2Au);

    }
    -[RTPeopleDiscoveryProvider peopleDensityRecord](self, "peopleDensityRecord");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "updateRecordOnFetchComplete:scanDuration:referenceDate:advertisements:", v92[3], v22, v65, v88[3]);

    -[RTPeopleDiscoveryProvider _fetchAllIdentities](self, "_fetchAllIdentities");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "count");
    if (v44 >= -[RTPeopleDiscoveryProvider minimumIdentities](self, "minimumIdentities"))
    {
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v46 = v65;
      v45 = 0;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v73, v107, 16);
      if (v47)
      {
        v48 = *(_QWORD *)v74;
        do
        {
          for (j = 0; j != v47; ++j)
          {
            if (*(_QWORD *)v74 != v48)
              objc_enumerationMutation(v46);
            v50 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
            objc_msgSend(v50, "contactID");
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            if (v51)
            {
              -[RTPeopleDiscoveryProvider contactRecord](self, "contactRecord");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "updateContactRecordOnAdvertisementReceived:", v50);

              ++v45;
            }
          }
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v73, v107, 16);
        }
        while (v47);
      }

    }
    else
    {
      v45 = 0;
    }
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __61__RTPeopleDiscoveryProvider__fetchAndReconcileAdvertisements__block_invoke_94;
    v69[3] = &unk_1E92A12B0;
    v69[4] = self;
    v71 = v101;
    v53 = v43;
    v70 = v53;
    v72 = v45;
    v54 = (void *)MEMORY[0x1D8232094](v69);
    v55 = objc_alloc(MEMORY[0x1E0CB3940]);
    v56 = (void *)objc_msgSend(v55, "initWithCString:encoding:", RTAnalyticsEventPeopleDiscoveryAdvertisement, 1);
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __61__RTPeopleDiscoveryProvider__fetchAndReconcileAdvertisements__block_invoke_2;
    v66[3] = &unk_1E929B460;
    v57 = v54;
    v68 = v57;
    v58 = v56;
    v67 = v58;
    v59 = (void *)MEMORY[0x1D8232094](v66);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);

  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(v101, 8);

}

- (unint64_t)minimumIdentities
{
  return self->_minimumIdentities;
}

- (CLLocationManagerGathering)advertisementManager
{
  return self->_advertisementManager;
}

void __61__RTPeopleDiscoveryProvider__fetchAndReconcileAdvertisements__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;

  v9 = a2;
  v10 = a4;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v9;
  v16 = v9;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a5;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v10;
  v15 = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __53__RTPeopleDiscoveryProvider__armNewInteractionsTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "Backup timer fires", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fetchAndReconcileAdvertisements");
  objc_msgSend(WeakRetained, "_monitorEvents");

}

void __48__RTPeopleDiscoveryProvider__fetchAllIdentities__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)saveShortTermRecord
{
  void *v3;
  void *v4;
  RTPeopleDiscoveryPersistenceStore *shortTermStore;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint8_t buf[4];
  NSObject *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "getStoreURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1D8231EA8]();
  shortTermStore = self->_shortTermStore;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", shortTermStore, 1, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (!v7)
  {
    v13 = 0;
    objc_msgSend(v6, "writeToURL:options:error:", v3, 805306369, &v13);
    v8 = v13;
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v10 = objc_claimAutoreleasedReturnValue();
    v9 = v10;
    if (v8)
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      -[NSObject description](v8, "description");
      v11 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider error writing short-term store, error, %@", buf, 0xCu);
    }
    else
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_10;
      objc_msgSend(v3, "path");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "length");
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      v17 = 2048;
      v18 = v12;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider successfully save short-term store to location, %@, bytes, %lu", buf, 0x16u);
    }

    goto LABEL_10;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "description");
    v9 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v9;
    _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider error archiving short-term store, error, %@", buf, 0xCu);
LABEL_10:

  }
  objc_autoreleasePoolPop(v4);

}

- (RTPeopleDensityRecord)peopleDensityRecord
{
  return self->_peopleDensityRecord;
}

- (BOOL)hasLoadedPersistedRecords
{
  return self->_hasLoadedPersistedRecords;
}

- (RTPeopleDiscoveryContactRecord)contactRecord
{
  return self->_contactRecord;
}

- (void)_monitorEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[RTPeopleDiscoveryProvider contactRecord](self, "contactRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "checkAndCloseProximityEventsIfNeeded:", v4);

  if (-[RTPeopleDiscoveryProvider hasLoadedPersistedRecords](self, "hasLoadedPersistedRecords"))
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "getStoreURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "fileExistsAtPath:", v7);

  if ((v8 & 1) == 0)
LABEL_3:
    -[RTPeopleDiscoveryProvider saveShortTermRecord](self, "saveShortTermRecord");
}

- (id)_fetchAllIdentities
{
  id v2;
  dispatch_semaphore_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  dispatch_time_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[16];
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0D838E8]);
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__97;
  v43 = __Block_byref_object_dispose__97;
  v44 = (id)objc_opt_new();
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__97;
  v37 = __Block_byref_object_dispose__97;
  v38 = 0;
  v3 = dispatch_semaphore_create(0);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __48__RTPeopleDiscoveryProvider__fetchAllIdentities__block_invoke;
  v29[3] = &unk_1E9296EE0;
  v31 = &v39;
  v32 = &v33;
  v4 = v3;
  v30 = v4;
  objc_msgSend(v2, "getIdentitiesWithFlags:completion:", 168, v29);
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_time(0, 60000000000);
  if (!dispatch_semaphore_wait(v5, v7))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v6);
  v10 = v9;
  v11 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_374);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filteredArrayUsingPredicate:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "submitToCoreAnalytics:type:duration:", v15, 1, v10);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v17 = (void *)MEMORY[0x1E0CB35C8];
  v46[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v46, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_retainAutorelease(v19);

  }
  else
  {
LABEL_6:
    v20 = 0;
  }

  v21 = v20;
  if (v34[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v34[5], "description");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v27;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Fail to get identities, error, %@\n", buf, 0xCu);

    }
LABEL_14:

    v24 = 0;
    goto LABEL_15;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v23 = objc_claimAutoreleasedReturnValue();
  v22 = v23;
  if (v21)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v21, "description");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v28;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Fail to get identities, error, %@\n", buf, 0xCu);

    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v26 = objc_msgSend((id)v40[5], "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v26;
    _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "Successfully get identities, count, %lu", buf, 0xCu);
  }

  objc_msgSend(v2, "invalidate");
  v24 = (id)v40[5];
LABEL_15:

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v24;
}

+ (id)getStoreURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3620], "routineCacheDirectoryPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", CFSTR("peopleDiscovery_records.bin"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (RTPeopleDiscoveryProvider)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager_);
}

- (RTPeopleDiscoveryProvider)initWithDefaultManager:(id)a3 proximityEventStore:(id)a4 peopleDensityStore:(id)a5 advertisementManager:(id)a6 dataProtectionManager:(id)a7 timerManager:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  RTPeopleDiscoveryProvider *v20;
  RTPeopleDiscoveryProvider *v21;
  RTPeopleDiscoveryContactRecord *v22;
  void *v23;
  void *v24;
  RTPeopleDiscoveryContactRecord *v25;
  void *v26;
  void *v27;
  void *v28;
  RTPeopleDensityRecord *v29;
  RTPeopleDiscoveryPersistenceStore *v30;
  void *v31;
  void *v32;
  RTPeopleDiscoveryPersistenceStore *v33;
  void *v34;
  void *v35;
  char isKindOfClass;
  double v37;
  void *v38;
  void *v39;
  unint64_t v40;
  NSObject *v41;
  const char *v42;
  RTPeopleDiscoveryProvider *v43;
  void *v45;
  uint64_t v46;
  RTDarwinNotificationHelper *notificationHelper;
  RTDarwinNotificationHelper *v48;
  RTDarwinNotificationHelper *v49;
  void *v50;
  RTPeopleDensityRecord *v51;
  id *location;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  id buf;
  objc_super v58;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    LOWORD(buf) = 0;
    v42 = "Invalid parameter not satisfying: defaultsManager";
LABEL_21:
    _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, v42, (uint8_t *)&buf, 2u);
    goto LABEL_22;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    LOWORD(buf) = 0;
    v42 = "Invalid parameter not satisfying: proximityEventStore";
    goto LABEL_21;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    LOWORD(buf) = 0;
    v42 = "Invalid parameter not satisfying: peopleDensityStore";
    goto LABEL_21;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    LOWORD(buf) = 0;
    v42 = "Invalid parameter not satisfying: advertisementManager";
    goto LABEL_21;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      v42 = "Invalid parameter not satisfying: dataProtectionManager";
      goto LABEL_21;
    }
LABEL_22:

    v43 = 0;
    goto LABEL_23;
  }
  v58.receiver = self;
  v58.super_class = (Class)RTPeopleDiscoveryProvider;
  v20 = -[RTNotifier init](&v58, sel_init);
  v21 = v20;
  if (v20)
  {
    -[RTPeopleDiscoveryProvider setDefaultsManager:](v20, "setDefaultsManager:", v14);
    -[RTPeopleDiscoveryProvider setProximityEventStore:](v21, "setProximityEventStore:", v15);
    -[RTPeopleDiscoveryProvider setPeopleDensityStore:](v21, "setPeopleDensityStore:", v16);
    -[RTPeopleDiscoveryProvider setAdvertisementManager:](v21, "setAdvertisementManager:", v17);
    -[RTPeopleDiscoveryProvider setProximityStoreAvailable:](v21, "setProximityStoreAvailable:", 0);
    -[RTPeopleDiscoveryProvider setPeopleDensityStoreAvailable:](v21, "setPeopleDensityStoreAvailable:", 0);
    -[RTPeopleDiscoveryProvider setContactScoreDataAvailable:](v21, "setContactScoreDataAvailable:", 0);
    -[RTPeopleDiscoveryProvider setHasLoadedPersistedRecords:](v21, "setHasLoadedPersistedRecords:", 0);
    v21->_broughtUp = 0;
    -[RTPeopleDiscoveryProvider setTimerManager:](v21, "setTimerManager:", v19);
    -[RTPeopleDiscoveryProvider setDataProtectionManager:](v21, "setDataProtectionManager:", v18);
    v22 = [RTPeopleDiscoveryContactRecord alloc];
    -[RTNotifier queue](v21, "queue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPeopleDiscoveryProvider defaultsManager](v21, "defaultsManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[RTPeopleDiscoveryContactRecord initWithQueue:defaultsManager:](v22, "initWithQueue:defaultsManager:", v23, v24);
    -[RTPeopleDiscoveryProvider setContactRecord:](v21, "setContactRecord:", v25);

    -[RTPeopleDiscoveryProvider contactRecord](v21, "contactRecord");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:", v21);

    v51 = [RTPeopleDensityRecord alloc];
    -[RTNotifier queue](v21, "queue");
    location = (id *)objc_claimAutoreleasedReturnValue();
    -[RTPeopleDiscoveryProvider peopleDensityStore](v21, "peopleDensityStore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPeopleDiscoveryProvider defaultsManager](v21, "defaultsManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[RTPeopleDensityRecord initWithQueue:peopleDensityStore:defaultsManager:](v51, "initWithQueue:peopleDensityStore:defaultsManager:", location, v27, v28);
    -[RTPeopleDiscoveryProvider setPeopleDensityRecord:](v21, "setPeopleDensityRecord:", v29);

    v30 = [RTPeopleDiscoveryPersistenceStore alloc];
    -[RTPeopleDiscoveryProvider contactRecord](v21, "contactRecord");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPeopleDiscoveryProvider peopleDensityRecord](v21, "peopleDensityRecord");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[RTPeopleDiscoveryPersistenceStore initWithContactRecord:densityRecord:](v30, "initWithContactRecord:densityRecord:", v31, v32);
    -[RTPeopleDiscoveryProvider setShortTermStore:](v21, "setShortTermStore:", v33);

    -[RTPeopleDiscoveryProvider defaultsManager](v21, "defaultsManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKey:", CFSTR("RTDefaultsPeopleDiscoveryProviderExpirationInterval"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v37 = 0.0;
    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v35, "doubleValue", 0.0);
    -[RTPeopleDiscoveryProvider setExpirationInterval:](v21, "setExpirationInterval:", v37);
    -[RTPeopleDiscoveryProvider defaultsManager](v21, "defaultsManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKey:", CFSTR("RTDefaultsPeopleDiscoveryProviderMinimumIdentities"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v50 = v39;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v40 = (unint64_t)(double)objc_msgSend(v39, "integerValue");
    else
      v40 = 10;
    -[RTPeopleDiscoveryProvider setMinimumIdentities:](v21, "setMinimumIdentities:", v40);
    v45 = (void *)objc_opt_new();
    -[RTPeopleDiscoveryProvider setClientConfigurations:](v21, "setClientConfigurations:", v45);

    objc_initWeak(&buf, v21);
    v46 = objc_opt_new();
    notificationHelper = v21->_notificationHelper;
    v21->_notificationHelper = (RTDarwinNotificationHelper *)v46;

    v48 = v21->_notificationHelper;
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __147__RTPeopleDiscoveryProvider_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager___block_invoke;
    v55[3] = &unk_1E92983E8;
    objc_copyWeak(&v56, &buf);
    -[RTDarwinNotificationHelper addObserverForNotificationName:handler:](v48, "addObserverForNotificationName:handler:", CFSTR("com.apple.locationd.gathering.bufferedDevicesReceived"), v55);
    v49 = v21->_notificationHelper;
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __147__RTPeopleDiscoveryProvider_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager___block_invoke_3;
    v53[3] = &unk_1E92983E8;
    objc_copyWeak(&v54, &buf);
    -[RTDarwinNotificationHelper addObserverForNotificationName:handler:](v49, "addObserverForNotificationName:handler:", CFSTR("com.apple.locationd.gathering.came_up"), v53);
    -[RTService setup](v21, "setup");
    objc_destroyWeak(&v54);
    objc_destroyWeak(&v56);
    objc_destroyWeak(&buf);

  }
  self = v21;
  v43 = self;
LABEL_23:

  return v43;
}

void __147__RTPeopleDiscoveryProvider_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __147__RTPeopleDiscoveryProvider_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager___block_invoke_2;
    block[3] = &unk_1E92977B8;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __147__RTPeopleDiscoveryProvider_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onBufferedDevicesReceivedNotification");
}

void __147__RTPeopleDiscoveryProvider_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __147__RTPeopleDiscoveryProvider_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager___block_invoke_4;
    block[3] = &unk_1E92977B8;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __147__RTPeopleDiscoveryProvider_initWithDefaultManager_proximityEventStore_peopleDensityStore_advertisementManager_dataProtectionManager_timerManager___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onCoreLocationProviderCameUpNotification");
}

- (void)_setup
{
  NSObject *v2;
  const char *v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  _QWORD block[5];
  uint8_t buf[16];

  if (self->_broughtUp)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v3 = "#RTPeopleDiscoveryProvider is already up";
LABEL_10:
      _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, v3, buf, 2u);
    }
  }
  else
  {
    +[RTPlatform currentPlatform](RTPlatform, "currentPlatform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "iPhoneDevice");

    if ((v6 & 1) != 0)
    {
      -[RTPeopleDiscoveryProvider proximityEventStore](self, "proximityEventStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:", self, sel_onProximityStoreNotification_, v8);

      -[RTPeopleDiscoveryProvider peopleDensityStore](self, "peopleDensityStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:", self, sel_onPeopleDensityStoreNotification_, v10);

      -[RTPeopleDiscoveryProvider dataProtectionManager](self, "dataProtectionManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTDataProtectionManagerNotificationEncryptedDataAvailability, "notificationName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:", self, sel_onDataProtectionNotification_, v12);

      if (!-[RTPeopleDiscoveryProvider hasLoadedPersistedRecords](self, "hasLoadedPersistedRecords"))
        -[RTPeopleDiscoveryProvider _loadAndMergeShortTermRecord](self, "_loadAndMergeShortTermRecord");
      -[RTNotifier queue](self, "queue");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __35__RTPeopleDiscoveryProvider__setup__block_invoke;
      block[3] = &unk_1E92977B8;
      block[4] = self;
      dispatch_async(v13, block);

      self->_broughtUp = 1;
      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      v18 = v14;
      v19 = 3221225472;
      v20 = __35__RTPeopleDiscoveryProvider__setup__block_invoke_72;
      v21 = &unk_1E929B460;
      v22 = (id)objc_msgSend(v15, "initWithCString:encoding:", RTAnalyticsEventPeopleDiscoveryEvents, 1);
      v23 = &__block_literal_global_78;
      v2 = v22;
      v16 = (void *)MEMORY[0x1D8232094](&v18);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v2, v18, v19, v20, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEventLazy();

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v3 = "#RTPeopleDiscoveryProvider disabled on platforms other than iPhone";
        goto LABEL_10;
      }
    }
  }

}

uint64_t __35__RTPeopleDiscoveryProvider__setup__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_fetchAndReconcileAdvertisements");
  objc_msgSend(*(id *)(a1 + 32), "_monitorEvents");
  return objc_msgSend(*(id *)(a1 + 32), "_armNewInteractionsTimer");
}

void *__35__RTPeopleDiscoveryProvider__setup__block_invoke_2()
{
  return &unk_1E932D6E0;
}

id __35__RTPeopleDiscoveryProvider__setup__block_invoke_72(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  log_analytics_submission(*(void **)(a1 + 32), v2);
  return v2;
}

- (void)_shutdownWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t v17[8];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  if (self->_broughtUp)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "shutdown people discovery", v17, 2u);
    }

    -[RTPeopleDiscoveryProvider notificationHelper](self, "notificationHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserverForNotificationName:", CFSTR("com.apple.locationd.gathering.bufferedDevicesReceived"));

    -[RTPeopleDiscoveryProvider notificationHelper](self, "notificationHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserverForNotificationName:", CFSTR("com.apple.locationd.gathering.came_up"));

    -[RTPeopleDiscoveryProvider dataProtectionManager](self, "dataProtectionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", self);

    -[RTPeopleDiscoveryProvider backupTimer](self, "backupTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[RTPeopleDiscoveryProvider backupTimer](self, "backupTimer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "invalidate");

      -[RTPeopleDiscoveryProvider setBackupTimer:](self, "setBackupTimer:", 0);
    }
    -[RTPeopleDiscoveryProvider scoringTimer](self, "scoringTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[RTPeopleDiscoveryProvider scoringTimer](self, "scoringTimer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "invalidate");

      -[RTPeopleDiscoveryProvider setScoringTimer:](self, "setScoringTimer:", 0);
    }
    self->_broughtUp = 0;
    if (v4)
      v4[2](v4, 0);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D18598];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("#RTPeopleDiscoveryProvider is already down");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 2, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, void *))v4)[2](v4, v16);
  }

}

- (BOOL)isProximityEventsEnabled
{
  NSObject *v3;
  int v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = -[NSMutableDictionary count](self->_clientConfigurations, "count");
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "isProximityEventsEnabled: _clientConfigurations %d", (uint8_t *)v6, 8u);
  }

  return -[NSMutableDictionary count](self->_clientConfigurations, "count") != 0;
}

- (BOOL)isPeopleDensityEventsEnabled
{
  NSObject *v3;
  int v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = -[NSMutableDictionary count](self->_clientConfigurations, "count");
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "isPeopleDensityEventsEnabled: _clientConfigurations %d", (uint8_t *)v6, 8u);
  }

  return -[NSMutableDictionary count](self->_clientConfigurations, "count") != 0;
}

- (void)_armNewInteractionsTimer
{
  RTTimer *backupTimer;
  RTTimer *v4;
  RTTimerManager *timerManager;
  void *v6;
  RTTimer *v7;
  RTTimer *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  backupTimer = self->_backupTimer;
  if (backupTimer)
  {
    -[RTTimer invalidate](backupTimer, "invalidate");
    v4 = self->_backupTimer;
    self->_backupTimer = 0;

  }
  objc_initWeak(&location, self);
  timerManager = self->_timerManager;
  -[RTNotifier queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __53__RTPeopleDiscoveryProvider__armNewInteractionsTimer__block_invoke;
  v13 = &unk_1E92983E8;
  objc_copyWeak(&v14, &location);
  -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", CFSTR("RTPeopleDiscoveryProviderBackupTimer"), v6, &v10);
  v7 = (RTTimer *)objc_claimAutoreleasedReturnValue();
  v8 = self->_backupTimer;
  self->_backupTimer = v7;

  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v17 = 900;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "Backup timer schedule after, %lu seconds", buf, 0xCu);
  }

  -[RTTimer fireAfterDelay:interval:](self->_backupTimer, "fireAfterDelay:interval:", 900.0, 900.0, v10, v11, v12, v13);
  -[RTTimer resume](self->_backupTimer, "resume");
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_computeDailyContactScores
{
  void *v3;

  -[RTPeopleDiscoveryProvider contactRecord](self, "contactRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateDailyContactScores");

  -[RTPeopleDiscoveryProvider saveShortTermRecord](self, "saveShortTermRecord");
}

- (void)_purgeEvents
{
  void *v3;
  double v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPeopleDiscoveryProvider expirationInterval](self, "expirationInterval");
  objc_msgSend(v3, "dateByAddingTimeInterval:", -v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[RTPeopleDiscoveryProvider expirationInterval](self, "expirationInterval");
    v8 = v7;
    objc_msgSend(v5, "getFormattedDateString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218242;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "_purgeEvents purging with expirationInterval: %f before date: %@", (uint8_t *)&v12, 0x16u);

  }
  -[RTPeopleDiscoveryProvider proximityEventStore](self, "proximityEventStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "purgeProximityEventsPredating:handler:", v5, &__block_literal_global_82);

  -[RTPeopleDiscoveryProvider peopleDensityStore](self, "peopleDensityStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "purgePeopleDensityPredating:handler:", v5, &__block_literal_global_84);

}

void __41__RTPeopleDiscoveryProvider__purgeEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fail to purge proximity events, error %@", (uint8_t *)&v5, 0xCu);

    }
  }

}

void __41__RTPeopleDiscoveryProvider__purgeEvents__block_invoke_83(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fail to purge density bundles, error %@", (uint8_t *)&v5, 0xCu);

    }
  }

}

- (void)_loadAndMergeShortTermRecord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[RTPeopleDiscoveryProvider loadShortTermRecord](self, "loadShortTermRecord");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[RTPeopleDiscoveryProvider contactRecord](self, "contactRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mergeWithAnotherContactRecord:", v4);

    -[RTPeopleDiscoveryProvider peopleDensityRecord](self, "peopleDensityRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "densityRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mergeWithAnotherDensityRecord:", v6);

    -[RTPeopleDiscoveryProvider setHasLoadedPersistedRecords:](self, "setHasLoadedPersistedRecords:", 1);
  }

}

- (void)onBufferedDevicesReceivedNotification
{
  NSObject *v3;
  uint8_t v4[16];

  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEFAULT, "onBufferedDevicesReceivedNotification", v4, 2u);
  }

  -[RTPeopleDiscoveryProvider _fetchAndReconcileAdvertisements](self, "_fetchAndReconcileAdvertisements");
  -[RTPeopleDiscoveryProvider _monitorEvents](self, "_monitorEvents");
  -[RTTimer fireAfterDelay:interval:](self->_backupTimer, "fireAfterDelay:interval:", 900.0, 900.0);
}

- (void)onCoreLocationProviderCameUpNotification
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEFAULT, "onCoreLocationProviderCameUpNotification", buf, 2u);
  }

  -[RTNotifier queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__RTPeopleDiscoveryProvider_onCoreLocationProviderCameUpNotification__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __69__RTPeopleDiscoveryProvider_onCoreLocationProviderCameUpNotification__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAggregatedConfiguration:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_aggregateAndApplyConfiguration");
}

- (void)onProximityStoreNotification:(id)a3
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
  v7[2] = __58__RTPeopleDiscoveryProvider_onProximityStoreNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __58__RTPeopleDiscoveryProvider_onProximityStoreNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onProximityStoreNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onProximityStoreNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
    -[RTPeopleDiscoveryProvider setProximityStoreAvailable:](self, "setProximityStoreAvailable:", objc_msgSend(v4, "availability") == 2);
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = -[RTPeopleDiscoveryProvider proximityStoreAvailable](self, "proximityStoreAvailable");
    v10 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "Proximity Store availability change to , %@", (uint8_t *)&v11, 0xCu);
  }

}

- (void)onPeopleDensityStoreNotification:(id)a3
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
  v7[2] = __62__RTPeopleDiscoveryProvider_onPeopleDensityStoreNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __62__RTPeopleDiscoveryProvider_onPeopleDensityStoreNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onPeopleDensityStoreNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onPeopleDensityStoreNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
    -[RTPeopleDiscoveryProvider setPeopleDensityStoreAvailable:](self, "setPeopleDensityStoreAvailable:", objc_msgSend(v4, "availability") == 2);
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = -[RTPeopleDiscoveryProvider peopleDensityStoreAvailable](self, "peopleDensityStoreAvailable");
    v10 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "People Density Store availability change to , %@", (uint8_t *)&v11, 0xCu);
  }

}

- (void)onDataProtectionNotification:(id)a3
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
  v7[2] = __58__RTPeopleDiscoveryProvider_onDataProtectionNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __58__RTPeopleDiscoveryProvider_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDataProtectionNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onDataProtectionNotification:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "availability");
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      +[RTDataProtectionManager encryptedDataAvailabilityToString:](RTDataProtectionManager, "encryptedDataAvailabilityToString:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[RTPeopleDiscoveryProvider _onDataProtectionNotification:]";
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, Received keybag notification, %@", (uint8_t *)&v10, 0x16u);

    }
    if (v5 == 2)
    {
      if (!-[RTPeopleDiscoveryProvider hasLoadedPersistedRecords](self, "hasLoadedPersistedRecords"))
        -[RTPeopleDiscoveryProvider _loadAndMergeShortTermRecord](self, "_loadAndMergeShortTermRecord");
      -[RTPeopleDiscoveryProvider setContactScoreDataAvailable:](self, "setContactScoreDataAvailable:", 1);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[RTPeopleDiscoveryProvider _onDataProtectionNotification:]";
      v12 = 2112;
      v13 = v9;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%s, unknown notification name, %@", (uint8_t *)&v10, 0x16u);

    }
  }

}

uint64_t __61__RTPeopleDiscoveryProvider__fetchAndReconcileAdvertisements__block_invoke_94(_QWORD *a1)
{
  return objc_msgSend((id)objc_opt_class(), "computeAdvMetrics:identities:numOfResolvedAdvs:", objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count"), a1[5], a1[7]);
}

id __61__RTPeopleDiscoveryProvider__fetchAndReconcileAdvertisements__block_invoke_2(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  log_analytics_submission(*(void **)(a1 + 32), v2);
  return v2;
}

- (void)didCloseProximityEvent:(id)a3
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
  v7[2] = __52__RTPeopleDiscoveryProvider_didCloseProximityEvent___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __52__RTPeopleDiscoveryProvider_didCloseProximityEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didCloseProximityEvent:", *(_QWORD *)(a1 + 40));
}

- (void)_didCloseProximityEvent:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  NSObject *v11;
  SEL v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "storing proximity event to database: %@", buf, 0xCu);

    }
    -[RTPeopleDiscoveryProvider proximityEventStore](self, "proximityEventStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__RTPeopleDiscoveryProvider__didCloseProximityEvent___block_invoke;
    v10[3] = &unk_1E9297628;
    v12 = a2;
    v11 = v5;
    objc_msgSend(v7, "storeProximityEvent:handler:", v11, v10);

    v8 = v11;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: event", buf, 2u);
    }
  }

}

void __53__RTPeopleDiscoveryProvider__didCloseProximityEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, event, %@, error, %@", (uint8_t *)&v7, 0x20u);

    }
  }

}

- (id)loadShortTermRecord
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "getStoreURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if ((v5 & 1) != 0)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v2, 2, &v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;
    if (v7)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v2, "absoluteString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject description](v7, "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v13;
        v21 = 2112;
        v22 = v14;
        _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fails to load short-term store, url, %@, error, %@", buf, 0x16u);

      }
      v9 = 0;
    }
    else
    {
      v17 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v17;
      if (v8)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGathering);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v2, "absoluteString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject description](v8, "description");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v20 = v15;
          v21 = 2112;
          v22 = v16;
          _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fails to unarchive short-term store, url, %@, error, %@", buf, 0x16u);

        }
        v9 = 0;
      }
      else
      {
        v9 = v10;
      }

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider short term record file does not exist", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (void)addClient:(id)a3 withIdentifier:(id)a4 withConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__RTPeopleDiscoveryProvider_addClient_withIdentifier_withConfiguration___block_invoke;
  v15[3] = &unk_1E929E650;
  v15[4] = self;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(v11, v15);

}

void __72__RTPeopleDiscoveryProvider_addClient_withIdentifier_withConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_addClientConfiguration:withIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_aggregateAndApplyConfiguration");
  objc_msgSend(*(id *)(a1 + 40), "densityCallbackConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider sending initial data to client %@", buf, 0xCu);
    }

    objc_msgSend((id)objc_opt_class(), "_convertObservationIntervalToDouble:", objc_msgSend(*(id *)(a1 + 40), "observationInterval"));
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__RTPeopleDiscoveryProvider_addClient_withIdentifier_withConfiguration___block_invoke_101;
    v9[3] = &unk_1E929C008;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v7, "_fetchPeopleDensityHistoryFromStartDate:endDate:completionHandler:", v6, v8, v9);

  }
}

void __72__RTPeopleDiscoveryProvider_addClient_withIdentifier_withConfiguration___block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  RTPeopleDensityUpdateNotification *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fail to retrieve initial data upon registration, error %@", (uint8_t *)&v9, 0xCu);
    }

  }
  else if (v5)
  {
    v8 = -[RTPeopleDensityUpdateNotification initWithPeopleDensityBundles:]([RTPeopleDensityUpdateNotification alloc], "initWithPeopleDensityBundles:", v5);
    objc_msgSend(*(id *)(a1 + 32), "postNotification:toObserver:", v8, *(_QWORD *)(a1 + 40));

  }
}

- (void)removeClient:(id)a3
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
  v7[2] = __42__RTPeopleDiscoveryProvider_removeClient___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __42__RTPeopleDiscoveryProvider_removeClient___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeClientConfiguration:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_aggregateAndApplyConfiguration");
}

- (void)_addClientConfiguration:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider _addClientConfiguration configuration %@ identifier %@", (uint8_t *)&v9, 0x16u);
  }

  if (v6 && v7)
    -[NSMutableDictionary setObject:forKey:](self->_clientConfigurations, "setObject:forKey:", v6, v7);

}

- (void)_removeClientConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider _removeClientConfiguration identifier %@", (uint8_t *)&v6, 0xCu);
  }

  if (v4)
    -[NSMutableDictionary removeObjectForKey:](self->_clientConfigurations, "removeObjectForKey:", v4);

}

+ (double)_convertObservationIntervalToDouble:(unint64_t)a3
{
  double result;

  result = 300.0;
  if (a3 != 2)
    result = 0.0;
  if (a3 == 1)
    return 900.0;
  return result;
}

+ (int)_scanLevelFromServiceLevel:(unint64_t)a3 observationInterval:(unint64_t)a4
{
  NSObject *v4;
  const char *v5;
  int v6;
  uint8_t *v7;
  __int16 v9;
  __int16 v10;

  if (a3 == 2)
  {
    if (a4 == 2)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v4 = objc_claimAutoreleasedReturnValue();
      v6 = 1;
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        return v6;
      }
      v9 = 0;
      v5 = "#RTPeopleDiscoveryProvider CL Scan Level: Default";
      v7 = (uint8_t *)&v9;
LABEL_9:
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, v5, v7, 2u);
      goto LABEL_11;
    }
    if (a4 == 1)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v4 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v6 = 2;
        goto LABEL_11;
      }
      v10 = 0;
      v5 = "#RTPeopleDiscoveryProvider CL Scan Level: Low";
      v6 = 2;
      v7 = (uint8_t *)&v10;
      goto LABEL_9;
    }
  }
  return -1;
}

- (void)_aggregateAndApplyConfiguration
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  _QWORD block[5];
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_clientConfigurations, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[RTPeopleDiscoveryProvider _logClientConfigurations](self, "_logClientConfigurations");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    v5 = objc_alloc(MEMORY[0x1E0D18418]);
    -[NSMutableDictionary allValues](self->_clientConfigurations, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithAggregation:", v6);

    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl(&dword_1D1A22000, (os_log_t)v8, OS_LOG_TYPE_INFO, "Aggregated Service Configuration: %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0D18418], "secondsForStorageDuration:", objc_msgSend(v7, "storageDuration"));
    -[RTPeopleDiscoveryProvider setExpirationInterval:](self, "setExpirationInterval:");
    LODWORD(v8) = objc_msgSend(v7, "shouldAdvertise");
    v10 = objc_msgSend((id)objc_opt_class(), "_scanLevelFromServiceLevel:observationInterval:", objc_msgSend(v7, "serviceLevel"), objc_msgSend(v7, "observationInterval"));
    if ((-[RTPeopleDiscoveryServiceConfiguration isEqual:](self->_aggregatedConfiguration, "isEqual:", v7) & 1) != 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "Aggregated Service Configuration did not change, skip sending", buf, 2u);
      }

    }
    else
    {
      -[RTNotifier queue](self, "queue");
      v14 = objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __60__RTPeopleDiscoveryProvider__aggregateAndApplyConfiguration__block_invoke;
      v17[3] = &unk_1E9297540;
      v17[4] = self;
      v18 = v7;
      dispatch_async(v14, v17);

    }
    v13 = v10 << 32;
    v8 = v8;
  }
  else
  {
    -[RTPeopleDiscoveryProvider setExpirationInterval:](self, "setExpirationInterval:", 0.0);
    -[RTNotifier queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__RTPeopleDiscoveryProvider__aggregateAndApplyConfiguration__block_invoke_104;
    block[3] = &unk_1E92977B8;
    block[4] = self;
    dispatch_async(v12, block);

    v8 = 0;
    v13 = 0;
  }
  -[RTPeopleDiscoveryProvider advertisementManager](self, "advertisementManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configure:withCompletionHandler:", v13 | v8, &__block_literal_global_111);

}

uint64_t __60__RTPeopleDiscoveryProvider__aggregateAndApplyConfiguration__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setup");
  return objc_msgSend(*(id *)(a1 + 32), "setAggregatedConfiguration:", *(_QWORD *)(a1 + 40));
}

uint64_t __60__RTPeopleDiscoveryProvider__aggregateAndApplyConfiguration__block_invoke_104(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shutdownWithHandler:", &__block_literal_global_105);
}

void __60__RTPeopleDiscoveryProvider__aggregateAndApplyConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  __CFString *v4;
  uint8_t buf[4];
  __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", error %@"), v2);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = CFSTR("OK");
    }
    *(_DWORD *)buf = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "done shutdown %@", buf, 0xCu);
    if (v2)

  }
}

void __60__RTPeopleDiscoveryProvider__aggregateAndApplyConfiguration__block_invoke_110(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  __CFString *v4;
  uint8_t buf[4];
  __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", error %@"), v2);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = CFSTR("OK");
    }
    *(_DWORD *)buf = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "CLLocationManagerGathering conf %@", buf, 0xCu);
    if (v2)

  }
}

- (void)fetchProximityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__RTPeopleDiscoveryProvider_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __90__RTPeopleDiscoveryProvider_fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_fetchProximityHistoryFromStartDate:endDate:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "_monitorEvents");
}

- (void)_fetchProximityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_semaphore_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  dispatch_time_t v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  NSObject *v55;
  _BYTE *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  const __CFString *v65;
  uint8_t v66[16];
  _BYTE buf[24];
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;
  void *v72;
  _QWORD v73[4];

  v73[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (objc_msgSend(v8, "compare:", v9) == 1)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v71 = *MEMORY[0x1E0CB2D50];
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "getFormattedDateString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getFormattedDateString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("startDate, %@, endDate, %@"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v10[2](v10, MEMORY[0x1E0C9AA60], v17);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "getFormattedDateString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getFormattedDateString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider fetching proximity history by date, start %@, end %@", buf, 0x16u);

    }
    v17 = (void *)objc_opt_new();
    v21 = (void *)objc_opt_new();
    if (-[RTPeopleDiscoveryProvider proximityStoreAvailable](self, "proximityStoreAvailable"))
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v68 = __Block_byref_object_copy__97;
      v69 = __Block_byref_object_dispose__97;
      v70 = (id)objc_opt_new();
      v58 = 0;
      v59 = &v58;
      v60 = 0x3032000000;
      v61 = __Block_byref_object_copy__97;
      v62 = __Block_byref_object_dispose__97;
      v63 = 0;
      v22 = dispatch_semaphore_create(0);
      -[RTPeopleDiscoveryProvider proximityEventStore](self, "proximityEventStore");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __91__RTPeopleDiscoveryProvider__fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke;
      v54[3] = &unk_1E9296EE0;
      v56 = buf;
      v57 = &v58;
      v24 = v22;
      v55 = v24;
      objc_msgSend(v23, "fetchProximityEventsFromDate:endDate:handler:", v8, v9, v54);

      v25 = v24;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = dispatch_time(0, 60000000000);
      if (!dispatch_semaphore_wait(v25, v26))
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "timeIntervalSinceDate:", v53);
      v28 = v27;
      v50 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_374);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "filteredArrayUsingPredicate:", v51);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v50, "submitToCoreAnalytics:type:duration:", v31, 1, v28);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v66 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v66, 2u);
      }

      v33 = (void *)MEMORY[0x1E0CB35C8];
      v73[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v66 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v73, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        v36 = objc_retainAutorelease(v35);

      }
      else
      {
LABEL_12:
        v36 = 0;
      }

      v40 = v36;
      if (v59[5])
        objc_msgSend(v21, "addObject:");
      if (v40)
        objc_msgSend(v21, "addObject:", v40);
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
        *(_DWORD *)v66 = 134217984;
        *(_QWORD *)&v66[4] = v42;
        _os_log_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider finish loading persisted records, count %lu", v66, 0xCu);
      }

      objc_msgSend(v17, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      _Block_object_dispose(&v58, 8);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v64 = *MEMORY[0x1E0CB2D50];
      v65 = CFSTR("historical data temporarily unavailable");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "addObject:", v39);
    }
    -[RTPeopleDiscoveryProvider contactRecord](self, "contactRecord");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "generateRealtimeProximityEventFromDate:endDate:referenceDate:", v8, v9, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      v49 = objc_msgSend(v45, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v49;
      _os_log_debug_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_DEBUG, "#RTPeopleDiscoveryProvider read %ld events from real-time records", buf, 0xCu);
    }

    objc_msgSend(v17, "addObjectsFromArray:", v45);
    if (objc_msgSend(v21, "count"))
    {
      _RTSafeArray();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v10)[2](v10, v17, v48);

    }
    else
    {
      ((void (**)(id, void *, void *))v10)[2](v10, v17, 0);
    }

  }
}

void __91__RTPeopleDiscoveryProvider__fetchProximityHistoryFromStartDate_endDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)fetchProximityHistoryFromEventIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__RTPeopleDiscoveryProvider_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __81__RTPeopleDiscoveryProvider_fetchProximityHistoryFromEventIDs_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_fetchProximityHistoryFromEventIDs:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_monitorEvents");
}

- (void)_fetchProximityHistoryFromEventIDs:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, void *, void *);
  NSObject *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v39;
  _QWORD v40[4];
  NSObject *v41;
  uint8_t *v42;
  __int128 *v43;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  const __CFString *v51;
  uint8_t v52[16];
  __int128 v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v5 = (void (**)(id, void *, void *))a4;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider fetching proximity history by eventIDs", buf, 2u);
  }

  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  *(_QWORD *)buf = 0;
  v45 = buf;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__97;
  v48 = __Block_byref_object_dispose__97;
  v49 = (id)objc_opt_new();
  if (-[RTPeopleDiscoveryProvider proximityStoreAvailable](self, "proximityStoreAvailable"))
  {
    *(_QWORD *)&v53 = 0;
    *((_QWORD *)&v53 + 1) = &v53;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__97;
    v56 = __Block_byref_object_dispose__97;
    v57 = 0;
    v9 = dispatch_semaphore_create(0);
    -[RTPeopleDiscoveryProvider proximityEventStore](self, "proximityEventStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __82__RTPeopleDiscoveryProvider__fetchProximityHistoryFromEventIDs_completionHandler___block_invoke;
    v40[3] = &unk_1E9296EE0;
    v42 = buf;
    v43 = &v53;
    v11 = v9;
    v41 = v11;
    objc_msgSend(v10, "fetchProximityEventsFromEventIDs:handler:", v39, v40);

    v12 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v12, v14))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "timeIntervalSinceDate:", v13);
      v16 = v15;
      v17 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_374);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "filteredArrayUsingPredicate:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "submitToCoreAnalytics:type:duration:", v21, 1, v16);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v52 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v52, 2u);
      }

      v23 = (void *)MEMORY[0x1E0CB35C8];
      v58[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v52 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v58, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
      v25 = (id)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v25 = objc_retainAutorelease(v25);

      }
    }
    else
    {
      v25 = 0;
    }

    v28 = v25;
    if (*(_QWORD *)(*((_QWORD *)&v53 + 1) + 40))
      objc_msgSend(v8, "addObject:");
    if (v28)
      objc_msgSend(v8, "addObject:", v28);
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = objc_msgSend(v7, "count");
      *(_DWORD *)v52 = 134217984;
      *(_QWORD *)&v52[4] = v30;
      _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider fetch by eventIDs from persisted records complete, count %lu", v52, 0xCu);
    }

    objc_msgSend(v7, "addObjectsFromArray:", *((_QWORD *)v45 + 5));
    _Block_object_dispose(&v53, 8);

  }
  else
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0CB2D50];
    v51 = CFSTR("historical data temporarily unavailable");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, v12);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addObject:", v27);
  }
  v31 = objc_msgSend(*((id *)v45 + 5), "count");
  if (v31 != objc_msgSend(v39, "count"))
  {
    -[RTPeopleDiscoveryProvider contactRecord](self, "contactRecord");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "queryRealTimeEventsByEventIDs:", v39);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v34 = objc_msgSend(v33, "count");
      LODWORD(v53) = 134217984;
      *(_QWORD *)((char *)&v53 + 4) = v34;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider query %ld events from real-time records", (uint8_t *)&v53, 0xCu);
    }

    objc_msgSend(v7, "addObjectsFromArray:", v33);
  }
  v35 = objc_msgSend(v8, "count");
  if (v35)
  {
    _RTSafeArray();
    v12 = objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  v5[2](v5, v7, v36);
  if (v35)
  {

  }
  _Block_object_dispose(buf, 8);

}

void __82__RTPeopleDiscoveryProvider__fetchProximityHistoryFromEventIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)fetchMostRecentPeopleDensity:(id)a3
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
  v7[2] = __58__RTPeopleDiscoveryProvider_fetchMostRecentPeopleDensity___block_invoke;
  v7[3] = &unk_1E9297678;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __58__RTPeopleDiscoveryProvider_fetchMostRecentPeopleDensity___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "peopleDensityRecord");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchCurrentObservationBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)fetchPeopleDensityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __94__RTPeopleDiscoveryProvider_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __94__RTPeopleDiscoveryProvider_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPeopleDensityHistoryFromStartDate:endDate:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_fetchPeopleDensityHistoryFromStartDate:(id)a3 endDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  dispatch_semaphore_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  dispatch_time_t v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  NSObject *v48;
  _BYTE *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  const __CFString *v58;
  uint8_t v59[16];
  _BYTE buf[24];
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  void *v65;
  _QWORD v66[4];

  v66[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (objc_msgSend(v8, "compare:", v9) == 1)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v64 = *MEMORY[0x1E0CB2D50];
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "getFormattedDateString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getFormattedDateString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("startDate, %@, endDate, %@"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v10[2](v10, MEMORY[0x1E0C9AA60], v17);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "getFormattedDateString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getFormattedDateString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider fetching people density history by date, start %@, end %@", buf, 0x16u);

    }
    v17 = (void *)objc_opt_new();
    if (-[RTPeopleDiscoveryProvider peopleDensityStoreAvailable](self, "peopleDensityStoreAvailable"))
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v61 = __Block_byref_object_copy__97;
      v62 = __Block_byref_object_dispose__97;
      v63 = (id)objc_opt_new();
      v51 = 0;
      v52 = &v51;
      v53 = 0x3032000000;
      v54 = __Block_byref_object_copy__97;
      v55 = __Block_byref_object_dispose__97;
      v56 = 0;
      v21 = dispatch_semaphore_create(0);
      -[RTPeopleDiscoveryProvider peopleDensityStore](self, "peopleDensityStore");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __95__RTPeopleDiscoveryProvider__fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke;
      v47[3] = &unk_1E9296EE0;
      v49 = buf;
      v50 = &v51;
      v23 = v21;
      v48 = v23;
      objc_msgSend(v22, "fetchPeopleDensityFromDate:endDate:handler:", v8, v9, v47);

      v24 = v23;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = dispatch_time(0, 60000000000);
      if (dispatch_semaphore_wait(v24, v25))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "timeIntervalSinceDate:", v46);
        v27 = v26;
        v44 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_374);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "filteredArrayUsingPredicate:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v44, "submitToCoreAnalytics:type:duration:", v31, 1, v27);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v59 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v59, 2u);
        }

        v33 = (void *)MEMORY[0x1E0CB35C8];
        v66[0] = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)v59 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v66, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v34);
        v35 = (id)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          v35 = objc_retainAutorelease(v35);

        }
      }
      else
      {
        v35 = 0;
      }

      v39 = v35;
      if (v52[5])
        ((void (*)(void (**)(id, _QWORD, void *), _QWORD))v10[2])(v10, MEMORY[0x1E0C9AA60]);
      if (v39)
        v10[2](v10, MEMORY[0x1E0C9AA60], v39);
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
        *(_DWORD *)v59 = 134217984;
        *(_QWORD *)&v59[4] = v41;
        _os_log_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider finish loading people density records, count %lu", v59, 0xCu);
      }

      objc_msgSend(v17, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      -[RTPeopleDiscoveryProvider peopleDensityRecord](self, "peopleDensityRecord");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "fetchOngoingPeopleDensityBundle:endDate:", v8, v9);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
        objc_msgSend(v17, "addObject:", v43);
      ((void (**)(id, void *, void *))v10)[2](v10, v17, 0);

      _Block_object_dispose(&v51, 8);
      _Block_object_dispose(buf, 8);

    }
    else
    {
      v36 = (void *)MEMORY[0x1E0CB35C8];
      v57 = *MEMORY[0x1E0CB2D50];
      v58 = CFSTR("historical data temporarily unavailable");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v10[2](v10, MEMORY[0x1E0C9AA60], v38);
    }
  }

}

void __95__RTPeopleDiscoveryProvider__fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)fetchContactScoresFromContactIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__RTPeopleDiscoveryProvider_fetchContactScoresFromContactIDs_completionHandler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __80__RTPeopleDiscoveryProvider_fetchContactScoresFromContactIDs_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchContactScoresFromContactIDs:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchContactScoresFromContactIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider fetching contact scores history by contactIDs", buf, 2u);
  }

  if (-[RTPeopleDiscoveryProvider contactScoreDataAvailable](self, "contactScoreDataAvailable"))
  {
    if (v6 && objc_msgSend(v6, "count"))
    {
      -[RTPeopleDiscoveryProvider contactRecord](self, "contactRecord");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "queryContactScoresWithContactIDs:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = 134217984;
        v22 = v12;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "#RTPeopleDiscoveryProvider returns %ld contact scores", buf, 0xCu);
      }

      v7[2](v7, v10, 0);
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D18598];
      v23 = *MEMORY[0x1E0CB2D50];
      v24[0] = CFSTR("contactIDs requires at least one element to fetch");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 7, v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v7)[2](v7, (void *)MEMORY[0x1E0C9AA60], v18);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D18598];
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = CFSTR("Data temporarily unavailable");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 5, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, void *, void *))v7)[2](v7, (void *)MEMORY[0x1E0C9AA60], v10);
  }

}

- (id)_logClientConfigurations
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("#RTPeopleDiscoveryProvider Associated Clients: {\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_clientConfigurations;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_clientConfigurations, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR(" <%@>: %@\n"), v9, v10, (_QWORD)v12);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("}"));
  return v3;
}

- (void)addProximityEvent:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider adding proximity event, %@", buf, 0xCu);

  }
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__RTPeopleDiscoveryProvider_addProximityEvent_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

uint64_t __55__RTPeopleDiscoveryProvider_addProximityEvent_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addProximityEvent:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_addProximityEvent:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  SEL v14;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    -[RTPeopleDiscoveryProvider proximityEventStore](self, "proximityEventStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__RTPeopleDiscoveryProvider__addProximityEvent_handler___block_invoke;
    v11[3] = &unk_1E9298100;
    v14 = a2;
    v12 = v7;
    v13 = v8;
    objc_msgSend(v9, "storeProximityEvent:handler:", v12, v11);

    v10 = v12;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: event", buf, 2u);
    }
  }

}

void __56__RTPeopleDiscoveryProvider__addProximityEvent_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void (*v5)(void);
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412802;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, event, %@, error, %@", (uint8_t *)&v8, 0x20u);

    }
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v5();

}

- (void)injectAdv:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider inject advertisement, %@", buf, 0xCu);

  }
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__RTPeopleDiscoveryProvider_injectAdv_handler___block_invoke;
  block[3] = &unk_1E9299330;
  v14 = v6;
  v15 = v7;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  dispatch_async(v10, block);

}

void __47__RTPeopleDiscoveryProvider_injectAdv_handler___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_fetchAllIdentities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (v3 >= objc_msgSend(*(id *)(a1 + 32), "minimumIdentities"))
  {
    objc_msgSend(*(id *)(a1 + 40), "contactID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "contactRecord");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateContactRecordOnAdvertisementReceived:", *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "saveShortTermRecord");
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0D18598];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = CFSTR("Not enough identities available on device");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v8);

  }
}

- (void)clearProximityEvents:(id)a3
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
  v7[2] = __50__RTPeopleDiscoveryProvider_clearProximityEvents___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __50__RTPeopleDiscoveryProvider_clearProximityEvents___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearProximityEvents:", *(_QWORD *)(a1 + 40));
}

- (void)_clearProximityEvents:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_semaphore_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  dispatch_time_t v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  NSObject *v40;
  __int128 *p_buf;
  id v42;
  uint64_t v43;
  const __CFString *v44;
  __int128 buf;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint8_t v51[16];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider remove all proximity events", (uint8_t *)&buf, 2u);
  }

  v6 = (void *)objc_opt_new();
  -[RTPeopleDiscoveryProvider contactRecord](self, "contactRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cleanUpOngoingContactRecordsAndScores");

  v8 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  +[RTPeopleDiscoveryProvider getStoreURL](RTPeopleDiscoveryProvider, "getStoreURL");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "getStoreURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(v8, "removeItemAtURL:error:", v11, &v42);
    v12 = v42;

    if (v12)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v12;
        _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fail to remove cache file, error, %@", (uint8_t *)&buf, 0xCu);
      }

      objc_msgSend(v6, "addObject:", v12);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "#RTPeopleDiscoveryProvider Unable to clear proximity events as it has been recently cleared", (uint8_t *)&buf, 2u);
    }
  }

  if (-[RTPeopleDiscoveryProvider proximityStoreAvailable](self, "proximityStoreAvailable"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__97;
    v48 = __Block_byref_object_dispose__97;
    v49 = 0;
    v14 = dispatch_semaphore_create(0);
    -[RTPeopleDiscoveryProvider proximityEventStore](self, "proximityEventStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __51__RTPeopleDiscoveryProvider__clearProximityEvents___block_invoke;
    v39[3] = &unk_1E9297038;
    p_buf = &buf;
    v16 = v14;
    v40 = v16;
    objc_msgSend(v15, "clearWithHandler:", v39);

    v17 = v16;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v17, v19))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "timeIntervalSinceDate:", v18);
      v21 = v20;
      v22 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_374);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "filteredArrayUsingPredicate:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "submitToCoreAnalytics:type:duration:", v26, 1, v21);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v51 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v51, 2u);
      }

      v28 = (void *)MEMORY[0x1E0CB35C8];
      v50 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v51 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v29);
      v30 = (id)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v30 = objc_retainAutorelease(v30);

      }
    }
    else
    {
      v30 = 0;
    }

    v34 = v30;
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
      objc_msgSend(v6, "addObject:");
    if (v34)
      objc_msgSend(v6, "addObject:", v34);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2D50];
    v44 = CFSTR("historical data temporarily unavailable");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v33);
  }
  if (objc_msgSend(v6, "count"))
  {
    _RTSafeArray();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v36);

  }
  else
  {
    v4[2](v4, 0);
  }

}

void __51__RTPeopleDiscoveryProvider__clearProximityEvents___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)addPeopleDensityBundle:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider adding people density bundle, %@", buf, 0xCu);

  }
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__RTPeopleDiscoveryProvider_addPeopleDensityBundle_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

uint64_t __60__RTPeopleDiscoveryProvider_addPeopleDensityBundle_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addPeopleDensityBundle:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_addPeopleDensityBundle:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  SEL v14;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    -[RTPeopleDiscoveryProvider peopleDensityStore](self, "peopleDensityStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__RTPeopleDiscoveryProvider__addPeopleDensityBundle_handler___block_invoke;
    v11[3] = &unk_1E9298100;
    v14 = a2;
    v12 = v7;
    v13 = v8;
    objc_msgSend(v9, "storePeopleDensity:handler:", v12, v11);

    v10 = v12;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: bundle", buf, 2u);
    }
  }

}

void __61__RTPeopleDiscoveryProvider__addPeopleDensityBundle_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void (*v5)(void);
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412802;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, event, %@, error, %@", (uint8_t *)&v8, 0x20u);

    }
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v5();

}

- (void)injectPeopleDensityStats:(unint64_t)a3 duration:(double)a4 date:(id)a5 advertisements:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  double v26;
  uint8_t buf[4];
  unint64_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "getFormattedDateString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v28 = a3;
    v29 = 2048;
    v30 = a4;
    v31 = 2112;
    v32 = v16;
    _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider inject people density stats, numOfAdvs %lu, duration %f, date %@", buf, 0x20u);

  }
  -[RTNotifier queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __91__RTPeopleDiscoveryProvider_injectPeopleDensityStats_duration_date_advertisements_handler___block_invoke;
  v21[3] = &unk_1E9297E20;
  v24 = v14;
  v25 = a3;
  v26 = a4;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(v17, v21);

}

uint64_t __91__RTPeopleDiscoveryProvider_injectPeopleDensityStats_duration_date_advertisements_handler___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "peopleDensityRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateRecordOnFetchComplete:scanDuration:referenceDate:advertisements:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 72));

  objc_msgSend(*(id *)(a1 + 32), "saveShortTermRecord");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)clearPeopleDensityBundles:(id)a3
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
  v7[2] = __55__RTPeopleDiscoveryProvider_clearPeopleDensityBundles___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __55__RTPeopleDiscoveryProvider_clearPeopleDensityBundles___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearPeopleDensityBundles:", *(_QWORD *)(a1 + 40));
}

- (void)_clearPeopleDensityBundles:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_semaphore_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  dispatch_time_t v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  NSObject *v40;
  __int128 *p_buf;
  id v42;
  uint64_t v43;
  const __CFString *v44;
  __int128 buf;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint8_t v51[16];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryProvider remove all people density bundles", (uint8_t *)&buf, 2u);
  }

  v6 = (void *)objc_opt_new();
  -[RTPeopleDiscoveryProvider peopleDensityRecord](self, "peopleDensityRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cleanUpOngoingPeopleDensityBundle");

  v8 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  +[RTPeopleDiscoveryProvider getStoreURL](RTPeopleDiscoveryProvider, "getStoreURL");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "getStoreURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(v8, "removeItemAtURL:error:", v11, &v42);
    v12 = v42;

    if (v12)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v12;
        _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "#RTPeopleDiscoveryProvider fail to remove cache file, error, %@", (uint8_t *)&buf, 0xCu);
      }

      objc_msgSend(v6, "addObject:", v12);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "#RTPeopleDiscoveryProvider Unable to clear people density bundles as it has been recently cleared", (uint8_t *)&buf, 2u);
    }
  }

  if (-[RTPeopleDiscoveryProvider peopleDensityStoreAvailable](self, "peopleDensityStoreAvailable"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__97;
    v48 = __Block_byref_object_dispose__97;
    v49 = 0;
    v14 = dispatch_semaphore_create(0);
    -[RTPeopleDiscoveryProvider peopleDensityStore](self, "peopleDensityStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __56__RTPeopleDiscoveryProvider__clearPeopleDensityBundles___block_invoke;
    v39[3] = &unk_1E9297038;
    p_buf = &buf;
    v16 = v14;
    v40 = v16;
    objc_msgSend(v15, "clearWithHandler:", v39);

    v17 = v16;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v17, v19))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "timeIntervalSinceDate:", v18);
      v21 = v20;
      v22 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_374);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "filteredArrayUsingPredicate:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "submitToCoreAnalytics:type:duration:", v26, 1, v21);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v51 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v51, 2u);
      }

      v28 = (void *)MEMORY[0x1E0CB35C8];
      v50 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v51 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v29);
      v30 = (id)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v30 = objc_retainAutorelease(v30);

      }
    }
    else
    {
      v30 = 0;
    }

    v34 = v30;
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
      objc_msgSend(v6, "addObject:");
    if (v34)
      objc_msgSend(v6, "addObject:", v34);
    v4[2](v4, 0);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0CB2D50];
    v44 = CFSTR("historical data temporarily unavailable");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObject:", v33);
  }
  if (objc_msgSend(v6, "count"))
  {
    _RTSafeArray();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v4)[2](v4, v36);

  }
  else
  {
    v4[2](v4, 0);
  }

}

void __56__RTPeopleDiscoveryProvider__clearPeopleDensityBundles___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)computeContactScores:(id)a3
{
  void (**v3)(id, void *);
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint8_t v9[8];
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, void *))a3;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "per-contact scores feature flag is not enabled", v9, 2u);
  }

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0D18598];
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = CFSTR("feature disabled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 13, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v3[2](v3, v8);
}

+ (id)computeAdvMetrics:(int64_t)a3 identities:(id)a4 numOfResolvedAdvs:(int64_t)a5
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v8);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "type");
        switch(v17)
        {
          case 8:
            ++v12;
            break;
          case 6:
            ++v11;
            break;
          case 4:
            ++v14;
            break;
          default:
            ++v13;
            break;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("numOfAdvs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("numOfIdentities"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("numOfResolvedAdvs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("numOfFamilyDevices"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("numOfFriendDevices"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("numOfPairedDevices"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("numOfUnknownDevices"));

  return v7;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  int64_t v13;
  uint8_t buf[16];

  v7 = a5;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "RTPurgable performPurgeOfType called", buf, 2u);
  }

  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__RTPeopleDiscoveryProvider_performPurgeOfType_referenceDate_completion___block_invoke;
  block[3] = &unk_1E9298E88;
  v12 = v7;
  v13 = a3;
  block[4] = self;
  v10 = v7;
  dispatch_async(v9, block);

}

uint64_t __73__RTPeopleDiscoveryProvider_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  if (!*(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "_purgeEvents");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (int64_t)periodicPurgePolicy
{
  return 0;
}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (void)setDataProtectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataProtectionManager, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (void)setContactRecord:(id)a3
{
  objc_storeStrong((id *)&self->_contactRecord, a3);
}

- (RTPeopleDiscoveryPersistenceStore)shortTermStore
{
  return self->_shortTermStore;
}

- (void)setShortTermStore:(id)a3
{
  objc_storeStrong((id *)&self->_shortTermStore, a3);
}

- (RTProximityEventStore)proximityEventStore
{
  return self->_proximityEventStore;
}

- (void)setProximityEventStore:(id)a3
{
  objc_storeStrong((id *)&self->_proximityEventStore, a3);
}

- (RTPeopleDensityStore)peopleDensityStore
{
  return self->_peopleDensityStore;
}

- (void)setPeopleDensityStore:(id)a3
{
  objc_storeStrong((id *)&self->_peopleDensityStore, a3);
}

- (void)setPeopleDensityRecord:(id)a3
{
  objc_storeStrong((id *)&self->_peopleDensityRecord, a3);
}

- (RTPersistentTimer)scoringTimer
{
  return self->_scoringTimer;
}

- (void)setScoringTimer:(id)a3
{
  objc_storeStrong((id *)&self->_scoringTimer, a3);
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (RTTimer)backupTimer
{
  return self->_backupTimer;
}

- (void)setBackupTimer:(id)a3
{
  objc_storeStrong((id *)&self->_backupTimer, a3);
}

- (void)setAdvertisementManager:(id)a3
{
  objc_storeStrong((id *)&self->_advertisementManager, a3);
}

- (BOOL)contactScoreDataAvailable
{
  return self->_contactScoreDataAvailable;
}

- (void)setContactScoreDataAvailable:(BOOL)a3
{
  self->_contactScoreDataAvailable = a3;
}

- (void)setHasLoadedPersistedRecords:(BOOL)a3
{
  self->_hasLoadedPersistedRecords = a3;
}

- (BOOL)broughtUp
{
  return self->_broughtUp;
}

- (void)setBroughtUp:(BOOL)a3
{
  self->_broughtUp = a3;
}

- (double)expirationInterval
{
  return self->_expirationInterval;
}

- (void)setExpirationInterval:(double)a3
{
  self->_expirationInterval = a3;
}

- (void)setMinimumIdentities:(unint64_t)a3
{
  self->_minimumIdentities = a3;
}

- (NSMutableDictionary)clientConfigurations
{
  return self->_clientConfigurations;
}

- (void)setClientConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_clientConfigurations, a3);
}

- (RTPeopleDiscoveryServiceConfiguration)aggregatedConfiguration
{
  return (RTPeopleDiscoveryServiceConfiguration *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAggregatedConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHelper, a3);
}

- (BOOL)proximityStoreAvailable
{
  return self->_proximityStoreAvailable;
}

- (void)setProximityStoreAvailable:(BOOL)a3
{
  self->_proximityStoreAvailable = a3;
}

- (BOOL)peopleDensityStoreAvailable
{
  return self->_peopleDensityStoreAvailable;
}

- (void)setPeopleDensityStoreAvailable:(BOOL)a3
{
  self->_peopleDensityStoreAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_aggregatedConfiguration, 0);
  objc_storeStrong((id *)&self->_clientConfigurations, 0);
  objc_storeStrong((id *)&self->_advertisementManager, 0);
  objc_storeStrong((id *)&self->_backupTimer, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_scoringTimer, 0);
  objc_storeStrong((id *)&self->_peopleDensityRecord, 0);
  objc_storeStrong((id *)&self->_peopleDensityStore, 0);
  objc_storeStrong((id *)&self->_proximityEventStore, 0);
  objc_storeStrong((id *)&self->_shortTermStore, 0);
  objc_storeStrong((id *)&self->_contactRecord, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
}

@end
