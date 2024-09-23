@implementation TRILogEvent(Factory)

+ (id)currentTime
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC0EF0];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "logTimeFromDate:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)contextWithTrackingId:()Factory projectId:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(a1, "currentTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDeviceLogTime:", v8);

  v9 = (void *)MEMORY[0x1E0DC0EF0];
  objc_msgSend(v6, "time");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logTimeFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDeviceTrackingTime:", v11);

  objc_msgSend(v6, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTrackingId:", v13);

  objc_msgSend(v7, "setProjectId:", a4);
  return v7;
}

+ (id)eventWithTrackingId:()Factory projectId:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLogEventId:", v9);

  objc_msgSend(a1, "contextWithTrackingId:projectId:", v6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContext:", v10);

  v11 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDenormalizedEvent:", v11);

  objc_msgSend(v6, "subject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "denormalizedEvent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSubject:", v12);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v6, "treatments", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v18);
        objc_msgSend(v7, "denormalizedEvent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addTreatment:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  return v7;
}

@end
