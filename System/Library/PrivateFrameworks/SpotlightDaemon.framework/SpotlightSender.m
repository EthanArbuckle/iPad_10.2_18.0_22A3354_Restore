@implementation SpotlightSender

+ (void)dispatchWithOptions:(int64_t)a3 block:(id)a4
{
  uint64_t i;
  uint64_t v7;
  void *v8;
  void (**v9)(id, uint64_t);

  v9 = (void (**)(id, uint64_t))a4;
  for (i = 0; i != 5; ++i)
  {
    v7 = sAllReceiverClientIDs[i];
    switch(v7)
    {
      case 0:
        if (objc_msgSend(a1, "jobForTest:", a3))
          goto LABEL_12;
        break;
      case 1:
        if ((objc_msgSend(a1, "jobForDuet:", a3) & 1) != 0)
          goto LABEL_12;
        break;
      case 2:
        if ((objc_msgSend(a1, "jobForSuggestions:", a3) & 1) != 0)
          goto LABEL_12;
        break;
      case 3:
        if ((objc_msgSend(a1, "jobForImages:", a3) & 1) != 0)
          goto LABEL_12;
        break;
      case 4:
        if ((objc_msgSend(a1, "jobForAssets:", a3) & 1) != 0)
        {
LABEL_12:
          +[SpotlightSender clientConnection:](SpotlightSender, "clientConnection:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
            v9[2](v9, v7);
        }
        break;
      default:
        continue;
    }
  }

}

+ (id)clientConnection:(int64_t)a3
{
  id v4;

  if ((unint64_t)a3 > 4)
    v4 = 0;
  else
    v4 = (id)*off_24D0EAA48[a3];
  if ((objc_msgSend(v4, "disabled") & 1) != 0
    || objc_msgSend((id)sSpotlightSenderState, "clientDisabled:", a3))
  {

    v4 = 0;
  }
  return v4;
}

+ (id)clientConnection:(int64_t)a3 jobType:(int)a4
{
  id v5;

  if ((unint64_t)a3 > 4)
    v5 = 0;
  else
    v5 = (id)*off_24D0EAA48[a3];
  if (!objc_msgSend(v5, "canRun")
    || objc_msgSend((id)sSpotlightSenderState, "clientDisabled:", a3))
  {

    v5 = 0;
  }
  return v5;
}

+ (BOOL)jobForTest:(int64_t)a3
{
  return (a3 & 0x24F) == 0 || (a3 & 8) != 0;
}

+ (BOOL)jobForSuggestions:(int64_t)a3
{
  return (a3 & 0x24F) == 0 || (a3 & 2) != 0;
}

+ (BOOL)jobForImages:(int64_t)a3
{
  return (a3 & 0x24F) == 0 || (a3 & 0x40) != 0;
}

+ (BOOL)jobForDuet:(int64_t)a3
{
  return ((a3 & 0x24F) == 0) | a3 & 1;
}

+ (BOOL)jobForAssets:(int64_t)a3
{
  return (a3 & 0x24F) == 0 || (a3 & 0x200) != 0;
}

+ (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 bundleID:(id)a4 client:(int64_t)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  +[SpotlightSender clientConnection:jobType:](SpotlightSender, "clientConnection:jobType:", a5, 4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteFromBundle:domainIdentifiers:", v7, v8);

}

+ (void)donateRelevantActions:(id)a3 bundleID:(id)a4 client:(int64_t)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  +[SpotlightSender clientConnection:jobType:](SpotlightSender, "clientConnection:jobType:", a5, 18432);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "donateRelevantActions:bundleID:", v8, v7);

}

+ (void)deleteAllUserActivities:(id)a3 client:(int64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  +[SpotlightSender clientConnection:jobType:](SpotlightSender, "clientConnection:jobType:", a4, 4096);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteAllUserActivities:", v5);

}

+ (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4 client:(int64_t)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  +[SpotlightSender clientConnection:jobType:](SpotlightSender, "clientConnection:jobType:", a5, 1024);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteAllInteractionsWithBundleID:protectionClass:", v8, v7);

}

+ (void)addOrUpdateSearchableItems:(id)a3 itemsContent:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 client:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  +[SpotlightSender clientConnection:jobType:](SpotlightSender, "clientConnection:jobType:", a7, 1);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "indexFromBundle:protectionClass:items:itemsContent:", v12, v11, v14, v13);

}

+ (void)addInteraction:(id)a3 intentClassName:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 client:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  +[SpotlightSender clientConnection:jobType:](SpotlightSender, "clientConnection:jobType:", a7, 128);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addInteraction:intentClassName:bundleID:protectionClass:", v14, v13, v12, v11);

}

+ (id)copyDiagnosticInfo
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v13 = (void *)objc_opt_new();
  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v19[0] = CFSTR("com.apple.corespotlight.receiver.coreduet");
    v19[1] = CFSTR("com.apple.corespotlight.receiver.suggestions");
    v19[2] = CFSTR("com.apple.corespotlight.receiver.photos");
    v19[3] = CFSTR("com.apple.corespotlight.receiver.images");
    v19[4] = CFSTR("com.apple.corespotlight.receiver.corespotlight");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 5);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v16;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v16 != v5)
            objc_enumerationMutation(obj);
          v7 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v6);
          v8 = objc_alloc(MEMORY[0x24BDBCF48]);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%s/%@.plist"), v2, "Library/Spotlight/CoreSpotlight", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(v8, "initFileURLWithPath:", v9);

          if (v10)
          {
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v10, 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "count"))
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v7);

          }
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v4);
    }

  }
  return v13;
}

+ (void)clearCache
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  int v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  id obj;
  unsigned __int8 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _QWORD v22[5];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v22[0] = CFSTR("com.apple.corespotlight.receiver.coreduet");
    v22[1] = CFSTR("com.apple.corespotlight.receiver.suggestions");
    v22[2] = CFSTR("com.apple.corespotlight.receiver.photos");
    v22[3] = CFSTR("com.apple.corespotlight.receiver.images");
    v22[4] = CFSTR("com.apple.corespotlight.receiver.corespotlight");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 5);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v17 != v5)
            objc_enumerationMutation(obj);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%s/%@.plist"), v2, "Library/Spotlight/CoreSpotlight", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 0;
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v7, &v15);
          v10 = v15;

          if (v9)
            v11 = v10 == 0;
          else
            v11 = 0;
          if (v11)
          {
            logForCSLogCategoryDefault();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v21 = v7;
              _os_log_impl(&dword_213CF1000, v12, OS_LOG_TYPE_DEFAULT, "Removing cache file  %@", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeItemAtPath:error:", v7, 0);

          }
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
      }
      while (v4);
    }

  }
}

+ (void)setup
{
  +[SpotlightReceiverConnection setup](SpotlightReceiverConnection, "setup");
}

+ (BOOL)enabledForClient:(int64_t)a3
{
  void *v3;
  BOOL v4;

  +[SpotlightSender clientConnection:](SpotlightSender, "clientConnection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (void)deleteSearchableItemsWithEncodedIdentifiers:(id)a3 bundleID:(id)a4 client:(int64_t)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  +[SpotlightSender clientConnection:jobType:](SpotlightSender, "clientConnection:jobType:", a5, 2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteFromBundle:encodedIdentifiers:", v7, v8);

}

+ (void)deleteSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4 contentType:(id)a5 client:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  +[SpotlightSender clientConnection:jobType:](SpotlightSender, "clientConnection:jobType:", a6, 2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteFromBundle:contentType:identifiers:", v10, v9, v11);

}

+ (void)deleteAllSearchableItemsWithBundleID:(id)a3 client:(int64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  +[SpotlightSender clientConnection:jobType:](SpotlightSender, "clientConnection:jobType:", a4, 8);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteFromBundle:", v5);

}

+ (void)deleteSearchableItemsSinceDate:(id)a3 bundleID:(id)a4 client:(int64_t)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  +[SpotlightSender clientConnection:jobType:](SpotlightSender, "clientConnection:jobType:", a5, 16);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteFromBundle:sinceDate:", v7, v8);

}

+ (void)purgeSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4 client:(int64_t)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  +[SpotlightSender clientConnection:jobType:](SpotlightSender, "clientConnection:jobType:", a5, 32);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "purgeFromBundle:identifiers:", v7, v8);

}

+ (void)addUserActions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 client:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  +[SpotlightSender clientConnection:jobType:](SpotlightSender, "clientConnection:jobType:", a6, 64);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addUserActions:bundleID:protectionClass:", v11, v10, v9);

}

+ (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4 client:(int64_t)a5 retainedData:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  +[SpotlightSender clientConnection:jobType:](SpotlightSender, "clientConnection:jobType:", a5, 0x2000);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteUserActivitiesWithPersistentIdentifiers:bundleID:retainedData:", v11, v10, v9);

}

+ (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 client:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  +[SpotlightSender clientConnection:jobType:](SpotlightSender, "clientConnection:jobType:", a6, 256);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteInteractionsWithIdentifiers:bundleID:protectionClass:", v11, v10, v9);

}

+ (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 client:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  +[SpotlightSender clientConnection:jobType:](SpotlightSender, "clientConnection:jobType:", a6, 512);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:", v11, v10, v9);

}

+ (id)connectionForClient:(int64_t)a3 jobType:(int64_t)a4
{
  void *v5;
  void *v6;

  +[SpotlightSender clientConnection:](SpotlightSender, "clientConnection:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4
    && v5
    && ((unint64_t)a4 > 0xF
     || ((1 << a4) & 0xC1CE) == 0
     || !objc_msgSend(v5, "canRun")
     || (objc_msgSend(v6, "supportedJobs") & 0x8000) == 0))
  {

    v6 = 0;
  }
  return v6;
}

@end
