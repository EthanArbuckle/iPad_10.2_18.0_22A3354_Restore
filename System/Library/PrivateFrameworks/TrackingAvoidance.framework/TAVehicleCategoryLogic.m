@implementation TAVehicleCategoryLogic

+ (id)accumulatedTAVehicleCategoryHistoryFromVehicleStateNotificationInTAStore:(id)a3 since:(id)a4 to:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  TAVehicleCategory *v20;
  void *v21;
  TAVehicleCategory *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  TAVehicleCategory *v35;
  TAVehicleCategory *v36;
  unint64_t v37;
  uint64_t v38;
  void *v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8
    && v9
    && (objc_msgSend(v8, "earlierDate:", v9),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqual:", v8),
        v11,
        (v12 & 1) != 0))
  {
    v40 = v10;
    objc_msgSend(MEMORY[0x24BDD1508], "createIntervalSafelyWithStartDate:endDate:", v8, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      objc_msgSend(v13, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "endDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v50 = v16;
      v51 = 2113;
      v52 = v17;
      _os_log_impl(&dword_217877000, v15, OS_LOG_TYPE_DEFAULT, "#TAVehicleCategoryLogic Time Duration of Interest: Start Date - %{private}@ End Date - %{private}@", buf, 0x16u);

    }
    v41 = v8;
    v42 = v7;
    objc_msgSend(v7, "eventBuffer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "getAllTAEventsOf:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = [TAVehicleCategory alloc];
    objc_msgSend(v13, "startDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[TAVehicleCategory initWithVehicleCategoryType:andDate:](v20, "initWithVehicleCategoryType:andDate:", 0, v21);

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v23 = v19;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v45 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v28, "getDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "startDate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v29, "compare:", v30);

          if (v31 == -1)
          {
            v36 = [TAVehicleCategory alloc];
            v37 = +[TAVehicleCategory speculateTAVehicleCategoryTypeFromVehicleStateNotification:](TAVehicleCategory, "speculateTAVehicleCategoryTypeFromVehicleStateNotification:", v28);
            objc_msgSend(v13, "startDate");
            v35 = (TAVehicleCategory *)objc_claimAutoreleasedReturnValue();
            v38 = -[TAVehicleCategory initWithVehicleCategoryType:andDate:](v36, "initWithVehicleCategoryType:andDate:", v37, v35);

            v22 = (TAVehicleCategory *)v38;
          }
          else
          {
            objc_msgSend(v28, "getDate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "endDate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v32, "compare:", v33);

            if (v34 == 1)
              continue;
            v35 = -[TAVehicleCategory initWithTAVehicularStateNotification:]([TAVehicleCategory alloc], "initWithTAVehicularStateNotification:", v28);
            objc_msgSend(v43, "addObject:", v35);
          }

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v25);
    }

    objc_msgSend(v43, "insertObject:atIndex:", v22, 0);
    v8 = v41;
    v7 = v42;
    v10 = v40;
  }
  else
  {
    v43 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  }

  return v43;
}

+ (id)accumulatedTAVehicleCategoryHistoryFromGeoNavigationNotificationInTAStore:(id)a3 since:(id)a4 to:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  TAVehicleCategory *v19;
  void *v20;
  TAVehicleCategory *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  TAVehicleCategory *v34;
  TAVehicleCategory *v35;
  unint64_t v36;
  uint64_t v37;
  id v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "earlierDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v8);

  if ((v11 & 1) != 0)
  {
    v39 = v9;
    objc_msgSend(MEMORY[0x24BDD1508], "createIntervalSafelyWithStartDate:endDate:", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      objc_msgSend(v12, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v49 = v15;
      v50 = 2113;
      v51 = v16;
      _os_log_impl(&dword_217877000, v14, OS_LOG_TYPE_DEFAULT, "#TAVehicleCategoryLogic Time Duration of Interest: Start Date - %{private}@ End Date - %{private}@", buf, 0x16u);

    }
    v40 = v8;
    v41 = v7;
    objc_msgSend(v7, "eventBuffer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "getAllTAEventsOf:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v19 = [TAVehicleCategory alloc];
    objc_msgSend(v12, "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[TAVehicleCategory initWithVehicleCategoryType:andDate:](v19, "initWithVehicleCategoryType:andDate:", 0, v20);

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v22 = v18;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v44 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v27, "getDate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "startDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v28, "compare:", v29);

          if (v30 == -1)
          {
            v35 = [TAVehicleCategory alloc];
            v36 = +[TAVehicleCategory speculateTAVehicleCategoryTypeFromGeoNavigationNotification:](TAVehicleCategory, "speculateTAVehicleCategoryTypeFromGeoNavigationNotification:", v27);
            objc_msgSend(v12, "startDate");
            v34 = (TAVehicleCategory *)objc_claimAutoreleasedReturnValue();
            v37 = -[TAVehicleCategory initWithVehicleCategoryType:andDate:](v35, "initWithVehicleCategoryType:andDate:", v36, v34);

            v21 = (TAVehicleCategory *)v37;
          }
          else
          {
            objc_msgSend(v27, "getDate");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "endDate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v31, "compare:", v32);

            if (v33 == 1)
              continue;
            v34 = -[TAVehicleCategory initWithTAGeoNavigationNotification:]([TAVehicleCategory alloc], "initWithTAGeoNavigationNotification:", v27);
            objc_msgSend(v42, "addObject:", v34);
          }

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v24);
    }

    objc_msgSend(v42, "insertObject:atIndex:", v21, 0);
    v8 = v40;
    v7 = v41;
    v9 = v39;
  }
  else
  {
    v42 = objc_alloc_init(MEMORY[0x24BDBCE30]);
  }

  return v42;
}

+ (id)extractPrivateVehicleHintsFromTAStore:(id)a3 since:(id)a4 to:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TAPrivateVehicleClassificationReason *v14;
  void *v15;
  void *v16;
  TAPrivateVehicleClassificationReason *v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TAVehicleCategoryLogic accumulatedTAVehicleCategoryHistoryFromVehicleStateNotificationInTAStore:since:to:](TAVehicleCategoryLogic, "accumulatedTAVehicleCategoryHistoryFromVehicleStateNotificationInTAStore:since:to:", v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filteredArrayUsingPredicate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v14 = -[TAPrivateVehicleClassificationReason initWithReason:]([TAPrivateVehicleClassificationReason alloc], "initWithReason:", 2);
    objc_msgSend(v10, "addObject:", v14);

  }
  +[TAVehicleCategoryLogic accumulatedTAVehicleCategoryHistoryFromGeoNavigationNotificationInTAStore:since:to:](TAVehicleCategoryLogic, "accumulatedTAVehicleCategoryHistoryFromGeoNavigationNotificationInTAStore:since:to:", v7, v8, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "filteredArrayUsingPredicate:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count"))
  {
    v17 = -[TAPrivateVehicleClassificationReason initWithReason:]([TAPrivateVehicleClassificationReason alloc], "initWithReason:", 1);
    objc_msgSend(v10, "addObject:", v17);

  }
  return v10;
}

BOOL __73__TAVehicleCategoryLogic_extractPrivateVehicleHintsFromTAStore_since_to___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vehicleCategoryType") == 2;
}

@end
