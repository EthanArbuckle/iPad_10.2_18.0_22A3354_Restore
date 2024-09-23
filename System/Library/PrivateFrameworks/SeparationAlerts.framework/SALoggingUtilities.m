@implementation SALoggingUtilities

+ (void)logTAEvent:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  +[SALoggingUtilities computeMessagesForEvent:](SALoggingUtilities, "computeMessagesForEvent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = TASAEventsLog;
        if (os_log_type_enabled((os_log_t)TASAEventsLog, OS_LOG_TYPE_DEBUG))
        {
          v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
          *(_DWORD *)buf = 138412290;
          v15 = v9;
          _os_log_debug_impl(&dword_1CA04F000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v5);
  }

}

+ (id)computeMessagesForEvent:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  void *v23;
  void *context;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t v30[128];
  uint8_t buf[8];
  _BYTE v32[10];
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v3)
  {
LABEL_15:
    v21 = v4;
    goto LABEL_16;
  }
  v5 = (void *)MEMORY[0x1CAA49754]();
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v29;
  objc_msgSend(v6, "base64EncodedStringWithOptions:", 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7 && !objc_msgSend(v8, "isEqual:", &stru_1E83D18B8))
  {
    context = v5;
    *(_QWORD *)buf = 0;
    *(_QWORD *)v32 = 0;
    v12 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v12, "getUUIDBytes:", buf);

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "base64EncodedStringWithOptions:", 32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v23 = v9;
    +[SALoggingUtilities stringToSplit:maxSplitSize:](SALoggingUtilities, "stringToSplit:maxSplitSize:", v9, 1015 - objc_msgSend(v14, "length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v14, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v17);
    }

    objc_autoreleasePoolPop(context);
    goto LABEL_15;
  }
  v10 = TASALog;
  if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)buf = 68289539;
    *(_WORD *)v32 = 2082;
    *(_QWORD *)&v32[2] = "";
    v33 = 2113;
    v34 = v7;
    v35 = 2113;
    v36 = v9;
    _os_log_impl(&dword_1CA04F000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Archiver error\", \"Error\":\"%{private}@\", \"String\":\"%{private}@\"}", buf, 0x26u);
  }
  v11 = v4;

  objc_autoreleasePoolPop(v5);
LABEL_16:

  return v4;
}

+ (id)stringToSplit:(id)a3 maxSplitSize:(unint64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5 && a4 && (objc_msgSend(v5, "isEqual:", &stru_1E83D18B8) & 1) == 0)
  {
    if (objc_msgSend(v5, "length") <= a4)
    {
      v7 = 0;
    }
    else
    {
      v7 = 0;
      do
      {
        objc_msgSend(v5, "substringWithRange:", v7, a4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v8);

        v7 += a4;
      }
      while (a4 + v7 < objc_msgSend(v5, "length"));
    }
    objc_msgSend(v5, "substringWithRange:", v7, objc_msgSend(v5, "length") - objc_msgSend(v6, "count") * a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
  return v6;
}

+ (id)extractUniqueIdentifierFromMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 0x19)
  {
    v6 = 0;
  }
  else
  {
    v8[0] = 0;
    v8[1] = 0;
    objc_msgSend(v3, "substringWithRange:", 0, 24);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v4, 1);
    objc_msgSend(v5, "getBytes:length:", v8, 16);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v8);

  }
  return v6;
}

+ (id)extractEventFromMessages:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  _QWORD v26[23];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v9), "substringWithRange:", 24, objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v9), "length") - 24);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v7);
  }

  v11 = (void *)MEMORY[0x1E0C99E60];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v26[2] = objc_opt_class();
  v26[3] = objc_opt_class();
  v26[4] = objc_opt_class();
  v26[5] = objc_opt_class();
  v26[6] = objc_opt_class();
  v26[7] = objc_opt_class();
  v26[8] = objc_opt_class();
  v26[9] = objc_opt_class();
  v26[10] = objc_opt_class();
  v26[11] = objc_opt_class();
  v26[12] = objc_opt_class();
  v26[13] = objc_opt_class();
  v26[14] = objc_opt_class();
  v26[15] = objc_opt_class();
  v26[16] = objc_opt_class();
  v26[17] = objc_opt_class();
  v26[18] = objc_opt_class();
  v26[19] = objc_opt_class();
  v26[20] = objc_opt_class();
  v26[21] = objc_opt_class();
  v26[22] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v4, 1);
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v13, v14, &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v19;
  if (v16)
  {
    v17 = TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v16;
      _os_log_impl(&dword_1CA04F000, v17, OS_LOG_TYPE_DEFAULT, "unarchive error: %@", buf, 0xCu);
    }
  }

  return v15;
}

@end
