@implementation HDSHPluginServer

- (HDSHPluginServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11;
  HDSHPluginServer *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HDSHProfileExtension *profileExtension;
  dispatch_queue_t v17;
  OS_dispatch_queue *serializer;
  void *v19;
  objc_super v21;

  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HDSHPluginServer;
  v12 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v21, sel_initWithUUID_configuration_client_delegate_, a3, a4, v11, a6);
  if (v12)
  {
    objc_msgSend(v11, "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v12->_profile, v13);

    objc_msgSend(v11, "profile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "profileExtensionWithIdentifier:", *MEMORY[0x24BEA99B8]);
    v15 = objc_claimAutoreleasedReturnValue();
    profileExtension = v12->_profileExtension;
    v12->_profileExtension = (HDSHProfileExtension *)v15;

    objc_storeStrong((id *)&v12->_client, a5);
    v17 = dispatch_queue_create("com.apple.HDSHPluginServer.serial", 0);
    serializer = v12->_serializer;
    v12->_serializer = (OS_dispatch_queue *)v17;

    objc_msgSend(MEMORY[0x24BE40E10], "sharedDiagnosticManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v12);

  }
  return v12;
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend((id)objc_opt_class(), "taskIdentifier");
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDD3310];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)remote_updateCurrentSleepSchedules:(id)a3 sleepDurationGoal:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *serializer;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  HDSHPluginServer *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  serializer = self->_serializer;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __84__HDSHPluginServer_remote_updateCurrentSleepSchedules_sleepDurationGoal_completion___block_invoke;
  v15[3] = &unk_24DDB8BD8;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(serializer, v15);

}

void __84__HDSHPluginServer_remote_updateCurrentSleepSchedules_sleepDurationGoal_completion___block_invoke(_QWORD *a1)
{
  id v2;
  id v3;
  os_log_t *v4;
  os_log_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  id v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  char v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void (*v32)(void);
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = (os_log_t *)MEMORY[0x24BDD3060];
  if (a1[4])
  {
    _HKInitializeLogging();
    v5 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = (void *)objc_opt_class();
      v8 = (void *)a1[4];
      *(_DWORD *)buf = 138543618;
      v37 = v7;
      v38 = 2112;
      v39 = v8;
      v9 = v7;
      _os_log_impl(&dword_21AB9E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating current sleep schedules: %@", buf, 0x16u);

    }
    v11 = a1[4];
    v10 = (void *)a1[5];
    v35 = 0;
    v12 = objc_msgSend(v10, "_populateSamplesToInsert:samplesToDelete:forSleepSchedules:error:", v2, v3, v11, &v35);
    v13 = v35;
    v14 = v13;
    if ((v12 & 1) == 0)
      goto LABEL_14;

  }
  if (a1[6])
  {
    _HKInitializeLogging();
    v15 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v17 = (void *)objc_opt_class();
      v18 = (void *)a1[6];
      *(_DWORD *)buf = 138543618;
      v37 = v17;
      v38 = 2112;
      v39 = v18;
      v19 = v17;
      _os_log_impl(&dword_21AB9E000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating sleep duration goal: %@", buf, 0x16u);

    }
    v20 = (void *)a1[5];
    v21 = a1[6];
    v34 = 0;
    v22 = objc_msgSend(v20, "_populateSamplesToInsert:samplesToDelete:forSleepDurationGoal:error:", v2, v3, v21, &v34);
    v23 = v34;
    v14 = v23;
    if ((v22 & 1) != 0)
    {

      goto LABEL_11;
    }
LABEL_14:
    v32 = *(void (**)(void))(a1[7] + 16);
    goto LABEL_15;
  }
LABEL_11:
  v24 = (void *)a1[5];
  v33 = 0;
  v25 = objc_msgSend(v24, "_replaceSamples:withSamples:error:", v3, v2, &v33);
  v14 = v33;
  _HKInitializeLogging();
  v26 = *v4;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = v26;
    v28 = (void *)objc_opt_class();
    v29 = (void *)MEMORY[0x24BDD16E0];
    v30 = v28;
    objc_msgSend(v29, "numberWithBool:", v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v28;
    v38 = 2112;
    v39 = v31;
    _os_log_impl(&dword_21AB9E000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finished replace with success: %@", buf, 0x16u);

  }
  v32 = *(void (**)(void))(a1[7] + 16);
LABEL_15:
  v32();

}

- (BOOL)_populateSamplesToInsert:(id)a3 samplesToDelete:(id)a4 forSleepSchedules:(id)a5 error:(id *)a6
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  id WeakRetained;
  void *v23;
  void *v24;
  id v25;
  BOOL v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  BOOL v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  uint64_t v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  double v74;
  double v75;
  uint64_t v76;
  void *v77;
  NSObject *v79;
  void *v80;
  id v81;
  NSObject *v82;
  void *v83;
  id v84;
  NSObject *v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  id obj;
  void *v91;
  id v92;
  void *v94;
  id *v96;
  id v97;
  id v98;
  uint64_t v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  uint8_t v125[128];
  uint8_t buf[4];
  void *v127;
  __int16 v128;
  id v129;
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x24BDAC8D0];
  v92 = a3;
  v98 = a4;
  v89 = a5;
  objc_msgSend(v89, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  HKSleepScheduleWeekdayArrayFromWeekdays();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObject:", &unk_24DDBB7D8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v118, v130, 16);
  v94 = v12;
  obj = v13;
  if (!v14)
  {
    v16 = 0;
    goto LABEL_19;
  }
  v15 = v14;
  v96 = a6;
  v16 = 0;
  v17 = *(_QWORD *)v119;
  while (2)
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v119 != v17)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
      v20 = (void *)MEMORY[0x24BE40C08];
      v21 = objc_msgSend(v19, "integerValue");
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(MEMORY[0x24BE40A98], "hk_timeZoneEncodingOptions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = v16;
      objc_msgSend(v20, "mostRecentSleepScheduleForWeekday:beforeDate:profile:encodingOptions:error:", v21, 0, WeakRetained, v23, &v117);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v117;

      v16 = v25;
      v12 = v94;
      objc_msgSend(v94, "setObject:forKeyedSubscript:", v24, v19);
      if (v24)
        v26 = 1;
      else
        v26 = v25 == 0;
      if (!v26)
      {
        if (!objc_msgSend(v25, "hk_isDatabaseAccessibilityError"))
        {
          if (v96)
          {
            v16 = objc_retainAutorelease(v25);
            v31 = 0;
            *v96 = v16;
          }
          else
          {
            _HKLogDroppedError();
            v31 = 0;
          }
          v77 = obj;
          v33 = obj;
          goto LABEL_75;
        }
        _HKInitializeLogging();
        v27 = (void *)*MEMORY[0x24BDD3060];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
        {
          v28 = v27;
          v29 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v127 = v29;
          v128 = 2112;
          v129 = v25;
          v30 = v29;
          _os_log_impl(&dword_21AB9E000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cannot retrieve most recent sample for weekday, protected data unavailable: %@", buf, 0x16u);

        }
      }

    }
    v13 = obj;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v130, 16);
    if (v15)
      continue;
    break;
  }
LABEL_19:
  v88 = v16;

  _HKInitializeLogging();
  v32 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEBUG))
  {
    v79 = v32;
    v80 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v127 = v80;
    v128 = 2112;
    v129 = v12;
    v81 = v80;
    _os_log_debug_impl(&dword_21AB9E000, v79, OS_LOG_TYPE_DEBUG, "[%{public}@] Old schedules: %@", buf, 0x16u);

  }
  v33 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v97 = v89;
  v34 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
  if (v34)
  {
    v35 = v34;
    v99 = *(_QWORD *)v114;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v114 != v99)
          objc_enumerationMutation(v97);
        v37 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v112 = 0u;
        objc_msgSend(v37, "weekdays");
        HKSleepScheduleWeekdayArrayFromWeekdays();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v110;
          do
          {
            for (k = 0; k != v40; ++k)
            {
              if (*(_QWORD *)v110 != v41)
                objc_enumerationMutation(v38);
              v43 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * k);
              objc_msgSend(v33, "objectForKeyedSubscript:", v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              if (v44)
              {
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSHPluginServer.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newSchedulesByWeekday[weekdayNumber] == nil"));

              }
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v37, v43);
            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
          }
          while (v40);
        }

      }
      v35 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
    }
    while (v35);
  }

  _HKInitializeLogging();
  v46 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEBUG))
  {
    v82 = v46;
    v83 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v127 = v83;
    v128 = 2112;
    v129 = v33;
    v84 = v83;
    _os_log_debug_impl(&dword_21AB9E000, v82, OS_LOG_TYPE_DEBUG, "[%{public}@] New schedules: %@", buf, 0x16u);

  }
  v47 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v48 = obj;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v105, v123, 16);
  v12 = v94;
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v106;
    do
    {
      for (m = 0; m != v50; ++m)
      {
        if (*(_QWORD *)v106 != v51)
          objc_enumerationMutation(v48);
        v53 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * m);
        if ((objc_msgSend(v47, "containsObject:", v53) & 1) == 0)
        {
          objc_msgSend(v94, "objectForKeyedSubscript:", v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", v53);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v54, "hasEquivalentTimesToSleepSchedule:", v55);
          if (v55 && (v56 & 1) == 0)
          {
            if (v54)
              goto LABEL_51;
            objc_msgSend(v55, "bedTimeComponents");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            if (v57)
            {

              goto LABEL_51;
            }
            objc_msgSend(v55, "wakeTimeComponents");
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            if (v58)
            {
LABEL_51:
              objc_msgSend(v92, "addObject:", v55);
              objc_msgSend(v55, "weekdays");
              HKSleepScheduleWeekdayArrayFromWeekdays();
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "addObjectsFromArray:", v59);

            }
          }

          continue;
        }
      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v105, v123, 16);
    }
    while (v50);
  }

  _HKInitializeLogging();
  v60 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEBUG))
  {
    v85 = v60;
    v86 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v127 = v86;
    v128 = 2112;
    v129 = v47;
    v87 = v86;
    _os_log_debug_impl(&dword_21AB9E000, v85, OS_LOG_TYPE_DEBUG, "[%{public}@] Changed schedules: %@", buf, 0x16u);

  }
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v100 = v47;
  v61 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v101, v122, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v102;
    do
    {
      v64 = 0;
      do
      {
        if (*(_QWORD *)v102 != v63)
          objc_enumerationMutation(v100);
        v65 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * v64);
        objc_msgSend(v12, "objectForKeyedSubscript:", v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", v65);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if (v66)
        {
          if ((objc_msgSend(v98, "containsObject:", v66) & 1) == 0)
          {
            v68 = (void *)MEMORY[0x24BDBCF20];
            objc_msgSend(v66, "weekdays");
            HKSleepScheduleWeekdayArrayFromWeekdays();
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setWithArray:", v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "hk_minus:", v100);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = objc_msgSend(v71, "count");

            v12 = v94;
            if (!v72
              && (objc_msgSend(v66, "weekdays")
               || objc_msgSend(v66, "hasEquivalentOverrideDayToSleepSchedule:", v67)))
            {
              objc_msgSend(v66, "startDate");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "timeIntervalSinceDate:", v91);
              v75 = v74;

              if (v75 > -3600.0)
                objc_msgSend(v98, "addObject:", v66);
            }
          }
        }

        ++v64;
      }
      while (v62 != v64);
      v76 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v101, v122, 16);
      v62 = v76;
    }
    while (v76);
  }

  v31 = 1;
  v77 = obj;
  v16 = v88;
LABEL_75:

  return v31;
}

- (BOOL)_populateSamplesToInsert:(id)a3 samplesToDelete:(id)a4 forSleepDurationGoal:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  id v17;
  BOOL v18;
  BOOL v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v29;
  void *v30;
  double v31;
  double v32;
  NSObject *v34;
  void *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x24BE40B90];
  objc_msgSend(MEMORY[0x24BDD3DC0], "sleepDurationGoalType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v37 = 0;
  objc_msgSend(v13, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v14, WeakRetained, 0, 0, 0, &v37);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v37;

  if (v16)
    v18 = 1;
  else
    v18 = v17 == 0;
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v16, "quantity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "quantity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (v22)
    {
      _HKInitializeLogging();
      v23 = (void *)*MEMORY[0x24BDD3060];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
      {
        v24 = v23;
        v25 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v39 = v25;
        v26 = v25;
        _os_log_impl(&dword_21AB9E000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping saving unchanged sleep duration goal", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v10, "addObject:", v12);
      if (v16)
      {
        objc_msgSend(v16, "startDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "startDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "timeIntervalSinceDate:", v30);
        v32 = v31;

        if (v32 > -3600.0)
          objc_msgSend(v11, "addObject:", v16);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v27 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_ERROR))
    {
      v34 = v27;
      v35 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v39 = v35;
      v40 = 2114;
      v41 = v17;
      v36 = v35;
      _os_log_error_impl(&dword_21AB9E000, v34, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving latest sleep duration goal: %{public}@", buf, 0x16u);

    }
    if (a6)
      *a6 = objc_retainAutorelease(v17);
    else
      _HKLogDroppedError();
  }

  return v19;
}

- (void)remote_startSleepTrackingSession
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)v7 = 138543362;
    *(_QWORD *)&v7[4] = objc_opt_class();
    v5 = *(id *)&v7[4];
    _os_log_impl(&dword_21AB9E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep tracking session started", v7, 0xCu);

  }
  -[HDSHProfileExtension accessibilityAssertionManager](self->_profileExtension, "accessibilityAssertionManager", *(_OWORD *)v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginObservingContentProtectionState");

}

- (void)remote_stopSleepTrackingSession
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)v8 = 138543362;
    *(_QWORD *)&v8[4] = objc_opt_class();
    v5 = *(id *)&v8[4];
    _os_log_impl(&dword_21AB9E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep tracking session stopped", v8, 0xCu);

  }
  -[HDSHProfileExtension accessibilityAssertionManager](self->_profileExtension, "accessibilityAssertionManager", *(_OWORD *)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopObservingContentProtectionState");

  -[HDSHProfileExtension accessibilityAssertionManager](self->_profileExtension, "accessibilityAssertionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateAccessibilityAssertion");

}

- (void)remote_saveSleepTrackingSamples:(id)a3 replacingSamplesInDateInterval:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __94__HDSHPluginServer_remote_saveSleepTrackingSamples_replacingSamplesInDateInterval_completion___block_invoke;
  v16[3] = &unk_24DDB8BD8;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "performWhenDataProtectedByFirstUnlockIsAvailable:", v16);

}

uint64_t __94__HDSHPluginServer_remote_saveSleepTrackingSamples_replacingSamplesInDateInterval_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveSleepTrackingSamplesAfterFirstUnlock:replacingSamplesInDateInterval:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_saveSleepTrackingSamplesAfterFirstUnlock:(id)a3 replacingSamplesInDateInterval:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, id);
  os_log_t *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  id v19;
  void *v20;
  void *v21;
  os_log_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  id WeakRetained;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void *v39;
  HDSHPluginServer *v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, id))a5;
  _HKInitializeLogging();
  v11 = (os_log_t *)MEMORY[0x24BDD3060];
  v12 = (void *)*MEMORY[0x24BDD3060];
  v13 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (!v13)
      goto LABEL_7;
    v14 = v12;
    *(_DWORD *)buf = 138543874;
    v45 = (id)objc_opt_class();
    v46 = 2112;
    v47 = v9;
    v48 = 2112;
    v49 = v8;
    v15 = v45;
    v16 = "[%{public}@] replacing sleep tracking samples in %@ with %@";
    v17 = v14;
    v18 = 32;
  }
  else
  {
    if (!v13)
      goto LABEL_7;
    v14 = v12;
    *(_DWORD *)buf = 138543618;
    v45 = (id)objc_opt_class();
    v46 = 2112;
    v47 = v8;
    v15 = v45;
    v16 = "[%{public}@] saving sleep tracking samples %@";
    v17 = v14;
    v18 = 22;
  }
  _os_log_impl(&dword_21AB9E000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);

LABEL_7:
  v19 = objc_alloc_init(MEMORY[0x24BE40B20]);
  -[HDSHProfileExtension accessibilityAssertionManager](self->_profileExtension, "accessibilityAssertionManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "accessibilityAssertion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    _HKInitializeLogging();
    v22 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      v24 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v45 = v24;
      v25 = v24;
      _os_log_impl(&dword_21AB9E000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] adding accessibility assertion to transaction context", buf, 0xCu);

    }
    objc_msgSend(v19, "addAccessibilityAssertion:", v21);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v36 = MEMORY[0x24BDAC760];
  v37 = 3221225472;
  v38 = __104__HDSHPluginServer__saveSleepTrackingSamplesAfterFirstUnlock_replacingSamplesInDateInterval_completion___block_invoke;
  v39 = &unk_24DDB8C00;
  v40 = self;
  v28 = v8;
  v41 = v28;
  v29 = v9;
  v42 = v29;
  v30 = objc_msgSend(v27, "performWithTransactionContext:error:block:", v19, &v43, &v36);
  v31 = v43;

  if ((_DWORD)v30)
  {
    -[HDSHPluginServer _performNanoSyncWithAccessibilityAssertion:](self, "_performNanoSyncWithAccessibilityAssertion:", v21, v36, v37, v38, v39, v40, v41);
    -[HDSHPluginServer _performCloudSync](self, "_performCloudSync");
  }
  else
  {
    _HKInitializeLogging();
    v32 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_ERROR))
    {
      v33 = v32;
      v34 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v45 = v34;
      v46 = 2114;
      v47 = v31;
      v35 = v34;
      _os_log_error_impl(&dword_21AB9E000, v33, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save samples with error: %{public}@", buf, 0x16u);

    }
  }
  v10[2](v10, v30, v31);

}

uint64_t __104__HDSHPluginServer__saveSleepTrackingSamplesAfterFirstUnlock_replacingSamplesInDateInterval_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertSleepSamplesWithClientSource:replacingSamplesInDateInterval:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

- (void)_performNanoSyncWithAccessibilityAssertion:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "nanoSyncManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      *(_DWORD *)buf = 138543362;
      v15 = (id)objc_opt_class();
      v9 = v15;
      _os_log_impl(&dword_21AB9E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] nano syncing health data", buf, 0xCu);

    }
    v10 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v10, "nanoSyncManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] Sleep samples saved"), self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __63__HDSHPluginServer__performNanoSyncWithAccessibilityAssertion___block_invoke;
    v13[3] = &unk_24DDB8B38;
    v13[4] = self;
    objc_msgSend(v11, "syncHealthDataWithOptions:reason:accessibilityAssertion:completion:", 0, v12, v4, v13);

  }
}

void __63__HDSHPluginServer__performNanoSyncWithAccessibilityAssertion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      v8 = 138543618;
      v9 = (id)objc_opt_class();
      v10 = 2114;
      v11 = v4;
      v7 = v9;
      _os_log_error_impl(&dword_21AB9E000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to nano sync health data with error: %{public}@", (uint8_t *)&v8, 0x16u);

    }
  }

}

- (void)_performCloudSync
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v5;
  int v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "cloudSyncManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v6 = objc_msgSend(v5, "canPerformCloudSyncWithError:", &v22);
  v7 = v22;

  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x24BDD3060];
  v9 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      v10 = v8;
      v11 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      v12 = v11;
      _os_log_impl(&dword_21AB9E000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] cloud syncing health data", buf, 0xCu);

    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3998]), "initWithPush:pull:lite:", 1, 0, 1);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3A00]), "initWithChangesSyncRequest:", v13);
    v15 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v15, "cloudSyncManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] Sleep samples saved"), self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __37__HDSHPluginServer__performCloudSync__block_invoke;
    v21[3] = &unk_24DDB8B38;
    v21[4] = self;
    objc_msgSend(v16, "syncWithRequest:reason:completion:", v14, v17, v21);

  }
  else if (v9)
  {
    v18 = v8;
    v19 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v24 = v19;
    v25 = 2112;
    v26 = v7;
    v20 = v19;
    _os_log_impl(&dword_21AB9E000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping cloud sync for sleep sample update: %@", buf, 0x16u);

  }
}

void __37__HDSHPluginServer__performCloudSync__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      v8 = 138543618;
      v9 = (id)objc_opt_class();
      v10 = 2114;
      v11 = v4;
      v7 = v9;
      _os_log_error_impl(&dword_21AB9E000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to cloud sync health data with error: %{public}@", (uint8_t *)&v8, 0x16u);

    }
  }

}

- (BOOL)_replaceSamples:(id)a3 withSamples:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  BOOL v16;
  id v17;
  id v18;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 138543874;
    v23 = (id)objc_opt_class();
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v12 = v23;
    _os_log_impl(&dword_21AB9E000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Replacing old samples: %@ with new samples: %@", buf, 0x20u);

  }
  v21 = 0;
  v13 = -[HDSHPluginServer _insertSamplesWithClientSource:error:](self, "_insertSamplesWithClientSource:error:", v9, &v21);
  v14 = v21;
  v15 = v14;
  if (v13)
  {
    v20 = v14;
    v16 = -[HDSHPluginServer _deleteSamples:error:](self, "_deleteSamples:error:", v8, &v20);
    v17 = v20;

    v15 = v17;
  }
  else
  {
    v16 = 0;
  }
  v18 = v15;
  if (v18)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v18);
    else
      _HKLogDroppedError();
  }

  return v16;
}

- (BOOL)_deleteSamples:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "hk_map:", &__block_literal_global);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)v15 = 138543618;
    *(_QWORD *)&v15[4] = objc_opt_class();
    *(_WORD *)&v15[12] = 2112;
    *(_QWORD *)&v15[14] = v6;
    v9 = *(id *)&v15[4];
    _os_log_impl(&dword_21AB9E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleting UUIDs: %@", v15, 0x16u);

  }
  -[HDStandardTaskServer profile](self, "profile", *(_OWORD *)v15, *(_QWORD *)&v15[16]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x24BE40A90]);
  v13 = objc_msgSend(v11, "deleteObjectsWithUUIDCollection:configuration:error:", v6, v12, a4);

  return v13;
}

uint64_t __41__HDSHPluginServer__deleteSamples_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

- (BOOL)_insertSleepSamplesWithClientSource:(id)a3 replacingSamplesInDateInterval:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;

  v8 = a3;
  v9 = a4;
  v10 = (!v9
      || -[HDSHPluginServer _deleteSleepSamplesWithClientSourceInDateInterval:error:](self, "_deleteSleepSamplesWithClientSourceInDateInterval:error:", v9, a5))&& -[HDSHPluginServer _insertSamplesWithClientSource:error:](self, "_insertSamplesWithClientSource:error:", v8, a5);

  return v10;
}

- (BOOL)_insertSamplesWithClientSource:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  os_log_t *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  HDHealthStoreClient *client;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  os_log_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  HDHealthStoreClient *v27;
  int v29;
  void *v30;
  __int16 v31;
  HDHealthStoreClient *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "sourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createOrUpdateSourceForClient:error:", self->_client, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v10 = (os_log_t *)MEMORY[0x24BDD3060];
  v11 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = (void *)objc_opt_class();
    client = self->_client;
    v29 = 138543874;
    v30 = v13;
    v31 = 2112;
    v32 = client;
    v33 = 2112;
    v34 = v9;
    v15 = v13;
    _os_log_impl(&dword_21AB9E000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Inserting for client: %@, source: %@", (uint8_t *)&v29, 0x20u);

  }
  if (v9)
  {
    v16 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v16, "dataProvenanceManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localDataProvenanceForSourceEntity:version:deviceEntity:", v9, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v19, "dataManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:error:", v6, v18, 0, a4, CFAbsoluteTimeGetCurrent());

    _HKInitializeLogging();
    v22 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      v24 = (void *)objc_opt_class();
      v25 = (void *)MEMORY[0x24BDD16E0];
      v26 = v24;
      objc_msgSend(v25, "numberWithBool:", v21);
      v27 = (HDHealthStoreClient *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v24;
      v31 = 2112;
      v32 = v27;
      _os_log_impl(&dword_21AB9E000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Success inserting: %@", (uint8_t *)&v29, 0x16u);

    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (BOOL)_deleteSleepSamplesWithClientSourceInDateInterval:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  HDHealthStoreClient *client;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  HDHealthStoreClient *v28;
  void *v29;
  id v30;
  void *v31;
  id v33;
  HDHealthStoreClient *v34;
  _QWORD v35[3];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  HDHealthStoreClient *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "sourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceForClient:error:", self->_client, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = (void *)objc_opt_class();
    client = self->_client;
    *(_DWORD *)buf = 138544130;
    v37 = v12;
    v38 = 2112;
    v39 = client;
    v40 = 2112;
    v41 = v9;
    v42 = 2112;
    v43 = v6;
    v14 = v12;
    _os_log_impl(&dword_21AB9E000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleting for client: %@, source: %@, dateInterval: %@", buf, 0x2Au);

  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD3990], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A28]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BE40E20];
    v33 = v6;
    HDSampleEntityPredicateForDateInterval();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v17;
    HDSampleEntityPredicateForDataType();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v18;
    HDDataEntityPredicateForSourceEntity();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateMatchingAllPredicates:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0;
    v22 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v22, "dataManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "deleteDataObjectsOfClass:predicate:limit:deletedSampleCount:notifyObservers:generateDeletedObjects:recursiveDeleteAuthorizationBlock:error:", objc_opt_class(), v21, *MEMORY[0x24BE40E68], &v34, 1, 1, 0, a4);

    _HKInitializeLogging();
    v25 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      v27 = (void *)objc_opt_class();
      v28 = v34;
      v29 = (void *)MEMORY[0x24BDD16E0];
      v30 = v27;
      objc_msgSend(v29, "numberWithBool:", v24);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v27;
      v38 = 2048;
      v39 = v28;
      v40 = 2112;
      v41 = v31;
      _os_log_impl(&dword_21AB9E000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Success deleting %ld samples: %@", buf, 0x20u);

    }
    v6 = v33;
  }
  else
  {
    LOBYTE(v24) = 0;
  }

  return v24;
}

- (id)diagnosticDescription
{
  return &stru_24DDB8FF8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_profileExtension, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
