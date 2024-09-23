@implementation TAFilterKnownDevices

+ (id)removeDuplicateSuspiciousDevices:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
  {
    v21 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v23 = v3;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (!v6)
    goto LABEL_21;
  v7 = v6;
  v8 = *(_QWORD *)v25;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v25 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      if (v10)
      {
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "immediacyType"))
        {
          v15 = TAStatusLog;
          if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
            continue;
          *(_DWORD *)buf = 68289283;
          v29 = 0;
          v30 = 2082;
          v31 = "";
          v32 = 2113;
          v33 = v10;
          v12 = v15;
          v13 = OS_LOG_TYPE_ERROR;
          v14 = "{\"msg%{public}.0s\":\"#TAFilterKnownDevices got TANotificationImmediacyTypeNever device\", \"detection\"
                ":\"%{private}@\"}";
          goto LABEL_14;
        }
        if (objc_msgSend(v10, "immediacyType") == 3)
        {
          v11 = TAStatusLog;
          if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
            continue;
          *(_DWORD *)buf = 68289283;
          v29 = 0;
          v30 = 2082;
          v31 = "";
          v32 = 2113;
          v33 = v10;
          v12 = v11;
          v13 = OS_LOG_TYPE_FAULT;
          v14 = "{\"msg%{public}.0s\":\"#TAFilterKnownDevices got background immediate type. This is unexpected\", \"dete"
                "ction\":\"%{private}@\"}";
LABEL_14:
          _os_log_impl(&dword_217877000, v12, v13, v14, buf, 0x1Cu);
          continue;
        }
        objc_msgSend(v10, "address");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17 || (v18 = objc_msgSend(v17, "immediacyType"), objc_msgSend(v10, "immediacyType") > v18))
        {
          objc_msgSend(v10, "address");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v10, v19);

        }
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  }
  while (v7);
LABEL_21:

  objc_msgSend(v4, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");

  v3 = v23;
LABEL_23:

  return v21;
}

+ (id)removeKnownSuspiciousDevices:(id)a3 deviceRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  int v28;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  _BYTE v41[30];
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  _BOOL4 v47;
  __int16 v48;
  int v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = (void *)MEMORY[0x24BDBD1A8];
  if (v5 && v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v30 = v5;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v37;
      v32 = *(_QWORD *)v37;
      do
      {
        v12 = 0;
        v33 = v10;
        do
        {
          if (*(_QWORD *)v37 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v12);
          if (v13)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v12), "address");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v7, "isKnownDevice:", v14);

            objc_msgSend(v13, "address");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v7, "getDeviceNotificationState:", v16);

            if (objc_msgSend(v13, "immediacyType") == 2)
            {
              objc_msgSend(v13, "address");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v7, "hasStagedImmediateDetections:", v18) ^ 1;

            }
            else
            {
              v35 = 0;
            }
            v19 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
            {
              v20 = v19;
              objc_msgSend(v13, "address");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 68290563;
              *(_DWORD *)v41 = 0;
              *(_WORD *)&v41[4] = 2082;
              *(_QWORD *)&v41[6] = "";
              *(_WORD *)&v41[14] = 2113;
              *(_QWORD *)&v41[16] = v21;
              *(_WORD *)&v41[24] = 1026;
              *(_DWORD *)&v41[26] = v15;
              v42 = 1026;
              v43 = v17 == 0;
              v44 = 1026;
              v45 = v17 == 4;
              v46 = 1026;
              v47 = v17 == 3;
              v11 = v32;
              v10 = v33;
              v48 = 1026;
              v49 = v35;
              _os_log_impl(&dword_217877000, v20, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TAFilterKnownDevices decisions\", \"address\":\"%{private}@\", \"isKnownDevice\":%{public}hhd, \"isUnknownState\":%{public}hhd, \"isPendingReprompt\":%{public}hhd, \"isStaged\":%{public}hhd, \"isFirstImmediateType\":%{public}hhd}", buf, 0x3Au);

            }
            if ((v15 & 1) == 0 && ((v17 | 4) == 4 || (v17 == 3 ? (v28 = v35) : (v28 = 0), v28 == 1)))
            {
              objc_msgSend(v31, "addObject:", v13);
            }
            else
            {
              v22 = (void *)TAStatusLog;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
              {
                v23 = v22;
                objc_msgSend(v13, "address");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "hexString");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (v15)
                  v26 = "known device";
                else
                  v26 = "unknown device";
                +[TADeviceRecord notificationInternalStateToString:](TADeviceRecord, "notificationInternalStateToString:", v17);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138478339;
                *(_QWORD *)v41 = v25;
                *(_WORD *)&v41[8] = 2082;
                *(_QWORD *)&v41[10] = v26;
                *(_WORD *)&v41[18] = 2114;
                *(_QWORD *)&v41[20] = v27;
                _os_log_debug_impl(&dword_217877000, v23, OS_LOG_TYPE_DEBUG, "#TAFilterKnownDevices not surfacing notification for %{private}@ due to %{public}s and device state %{public}@", buf, 0x20u);

              }
            }
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
      }
      while (v10);
    }

    v8 = (void *)objc_msgSend(v31, "copy");
    v5 = v30;
  }

  return v8;
}

+ (id)removeAndProcessBackgroundDetections:(id)a3 deviceRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = (void *)MEMORY[0x24BDBD1A8];
  if (v5 && v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v15, "immediacyType", (_QWORD)v17) == 3)
            objc_msgSend(v7, "processBackgroundDetection:", v15);
          else
            objc_msgSend(v9, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    v8 = (void *)objc_msgSend(v9, "copy");
  }

  return v8;
}

+ (id)removeMetricsFromKnownDevices:(id)a3 deviceRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  TAOutgoingRequests *v22;
  void *v23;
  TAOutgoingRequests *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  void *v35;
  TAOutgoingRequests *v36;
  void *v37;
  TAOutgoingRequests *v38;
  id v40;
  id obj;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[16];
  _BYTE v61[128];
  _BYTE v62[16];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = (void *)MEMORY[0x24BDBD1A8];
  if (v5 && v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v40 = v5;
    obj = v5;
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (!v44)
      goto LABEL_38;
    v42 = *(_QWORD *)v57;
    while (1)
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v57 != v42)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v10, "key", v40);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("DonatingInterVisitMetrics"));

        if (v12)
        {
          v45 = v10;
          v47 = i;
          objc_msgSend(v10, "additionalInformation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v13, "mutableCopy");

          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          objc_msgSend(v14, "allKeys");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v53;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v53 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
                if (objc_msgSend(v7, "isKnownDevice:", v20))
                {
                  v21 = (void *)TAStatusLog;
                  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
                    +[TAFilterKnownDevices removeMetricsFromKnownDevices:deviceRecord:].cold.1((uint64_t)v62, v21);
                  objc_msgSend(v14, "removeObjectForKey:", v20);
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
            }
            while (v17);
          }

          v22 = [TAOutgoingRequests alloc];
          objc_msgSend(v45, "date");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[TAOutgoingRequests initWithRequestKey:additionalInformation:date:](v22, "initWithRequestKey:additionalInformation:date:", CFSTR("DonatingInterVisitMetrics"), v14, v23);

          objc_msgSend(v43, "addObject:", v24);
LABEL_34:
          i = v47;
          continue;
        }
        objc_msgSend(v10, "key");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("DonatingVisitMetrics"));

        if (v26)
        {
          v46 = v10;
          v47 = i;
          objc_msgSend(v10, "additionalInformation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v27, "mutableCopy");

          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          objc_msgSend(v28, "allKeys");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v49;
            do
            {
              for (k = 0; k != v31; ++k)
              {
                if (*(_QWORD *)v49 != v32)
                  objc_enumerationMutation(v29);
                v34 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * k);
                if (objc_msgSend(v7, "isKnownDevice:", v34))
                {
                  v35 = (void *)TAStatusLog;
                  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
                    +[TAFilterKnownDevices removeMetricsFromKnownDevices:deviceRecord:].cold.2((uint64_t)v60, v35);
                  objc_msgSend(v28, "removeObjectForKey:", v34);
                }
              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
            }
            while (v31);
          }

          v36 = [TAOutgoingRequests alloc];
          objc_msgSend(v46, "date");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[TAOutgoingRequests initWithRequestKey:additionalInformation:date:](v36, "initWithRequestKey:additionalInformation:date:", CFSTR("DonatingVisitMetrics"), v28, v37);

          objc_msgSend(v43, "addObject:", v38);
          goto LABEL_34;
        }
        objc_msgSend(v43, "addObject:", v10);
      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      if (!v44)
      {
LABEL_38:

        v8 = (void *)objc_msgSend(v43, "copy");
        v5 = v40;
        break;
      }
    }
  }

  return v8;
}

+ (id)removeIssuedDevices:(id)a3 deviceRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = (void *)MEMORY[0x24BDBD1A8];
  if (v5 && v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v14, "address");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v7, "getDeviceNotificationState:", v15);

          if (v16 == 2)
          {
            v17 = TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68289283;
              v25 = 0;
              v26 = 2082;
              v27 = "";
              v28 = 2113;
              v29 = v14;
              _os_log_impl(&dword_217877000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAFilterKnownDevices dropping detection due to Issued state\", \"detection\":\"%{private}@\"}", buf, 0x1Cu);
            }
          }
          else
          {
            objc_msgSend(v8, "addObject:", v14);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      }
      while (v11);
    }

    v5 = v19;
  }

  return v8;
}

+ (void)removeMetricsFromKnownDevices:(uint64_t)a1 deviceRecord:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_1(a1, a2);
  objc_msgSend(v3, "hexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *v4 = 138477827;
  *v2 = v6;
  OUTLINED_FUNCTION_0(&dword_217877000, v7, v8, "#TAFilterKnownDevices dropping %{private}@ intervisit metrics since it is from owner, shared, or ignored device");

  OUTLINED_FUNCTION_2();
}

+ (void)removeMetricsFromKnownDevices:(uint64_t)a1 deviceRecord:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  _DWORD *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_1(a1, a2);
  objc_msgSend(v3, "hexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *v4 = 138477827;
  *v2 = v6;
  OUTLINED_FUNCTION_0(&dword_217877000, v7, v8, "#TATrackingAvoidanceService dropping %{private}@ intervisit metrics since it is from owner, shared, or ignored device");

  OUTLINED_FUNCTION_2();
}

@end
