@implementation SCSharingReminderCache

+ (id)new
{
  id result;
  _BYTE v3[8];
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  v7 = xmmword_2516623E8;
  v8 = unk_2516623F8;
  result = [SCSharingReminderCache alloc];
  v3[0] = 0;
  v4 = 0;
  v5 = MEMORY[0x24BDBD1A8];
  v6 = MEMORY[0x24BDBD1B8];
  if (result)
    return (id)objc_msgSend(result, "initFromState:", v3);
  return result;
}

+ (id)cacheWithState:(id *)a3
{
  id var1;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  SCSharingReminderCache *v10;
  id v11;
  id v13[4];
  _BYTE v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  var1 = a3->var1;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(var1, "laterDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToDate:", a3->var1);

  if (v7)
  {
    SCLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      localizedDateStringFromUTC((uint64_t)a3->var1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SCSharingReminderCache cacheWithState:].cold.1(v9, (uint64_t)v14, v8);
    }
    goto LABEL_7;
  }
  v10 = [SCSharingReminderCache alloc];
  __copy_constructor_8_8_t0w1_s8_s16_s24((uint64_t)v13, (uint64_t)a3);
  if (!v10)
  {

    v8 = v13[3];
LABEL_7:

    v11 = 0;
    goto LABEL_8;
  }
  v11 = -[SCSharingReminderCache initFromState:](v10, "initFromState:", v13);
LABEL_8:
  __destructor_8_s8_s16_s24((id *)a3);
  return v11;
}

- (id)initFromState:(id *)a3
{
  SCSharingReminderCache *v4;
  uint64_t v5;
  NSMutableOrderedSet *scheduledSharingReminders;
  uint64_t v7;
  NSMutableDictionary *sharingRemindersByType;
  uint64_t v9;
  NSMutableDictionary *ignorableIdentifiersByType;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SCSharingReminderCache;
  v4 = -[SCSharingReminderCache init](&v12, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    scheduledSharingReminders = v4->_scheduledSharingReminders;
    v4->_scheduledSharingReminders = (NSMutableOrderedSet *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    sharingRemindersByType = v4->_sharingRemindersByType;
    v4->_sharingRemindersByType = (NSMutableDictionary *)v7;

    v4->_consecutiveNotificationCount = a3->var0;
    objc_storeStrong((id *)&v4->_lastFiredDate, a3->var1);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3->var3);
    v9 = objc_claimAutoreleasedReturnValue();
    ignorableIdentifiersByType = v4->_ignorableIdentifiersByType;
    v4->_ignorableIdentifiersByType = (NSMutableDictionary *)v9;

    -[SCSharingReminderCache addSharingReminders:](v4, "addSharingReminders:", a3->var2);
  }
  __destructor_8_s8_s16_s24((id *)a3);
  return v4;
}

- (void)addSharingReminders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
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
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    -[SCSharingReminderCache scheduledSharingReminders](self, "scheduledSharingReminders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v5);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v21 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v12, "type");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCSharingReminderCache sharingRemindersByType](self, "sharingRemindersByType");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "valueForKey:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            -[SCSharingReminderCache sharingRemindersByType](self, "sharingRemindersByType");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setValue:forKey:", v17, v13);

          }
          -[SCSharingReminderCache sharingRemindersByType](self, "sharingRemindersByType");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "valueForKey:", v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "addObject:", v12);
          -[SCSharingReminderCache sharingRemindersByType](self, "sharingRemindersByType");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setValue:forKey:", v19, v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    v5 = v21;
  }

}

- (void)removeSharingReminders:(id)a3 wereDelivered:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x24BDAC8D0];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = a3;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v27)
  {
    v6 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[SCSharingReminderCache scheduledSharingReminders](self, "scheduledSharingReminders");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "indexOfObject:", v8);

        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          SCLogger();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v8;
            _os_log_impl(&dword_2454C0000, v11, OS_LOG_TYPE_INFO, "\"Asked to remove a reminder that cache doesn't have: [%@]\", buf, 0xCu);
          }
        }
        else
        {
          -[SCSharingReminderCache scheduledSharingReminders](self, "scheduledSharingReminders");
          v11 = objc_claimAutoreleasedReturnValue();
          -[NSObject removeObjectAtIndex:](v11, "removeObjectAtIndex:", v10);
        }

        objc_msgSend(v8, "type");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCSharingReminderCache sharingRemindersByType](self, "sharingRemindersByType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          SCLogger();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            goto LABEL_18;
          *(_DWORD *)buf = 138412290;
          v33 = v8;
          v17 = v16;
          v18 = "\"Asked to remove a reminder type that cache type map doesn't have: [%@]\";
          goto LABEL_16;
        }
        v15 = objc_msgSend(v14, "indexOfObject:", v8);
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        {
          SCLogger();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            goto LABEL_18;
          *(_DWORD *)buf = 138412290;
          v33 = v8;
          v17 = v16;
          v18 = "\"Asked to remove a reminder that cache type map doesn't have: [%@]\";
LABEL_16:
          _os_log_impl(&dword_2454C0000, v17, OS_LOG_TYPE_INFO, v18, buf, 0xCu);
          goto LABEL_18;
        }
        objc_msgSend(v14, "removeObjectAtIndex:", v15);
        -[SCSharingReminderCache sharingRemindersByType](self, "sharingRemindersByType");
        v16 = objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v16, "setObject:forKey:", v14, v12);
LABEL_18:

        if (v4)
        {
          v19 = v6;
          v20 = v4;
          objc_msgSend(MEMORY[0x24BDBCE60], "now");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCSharingReminderCache setLastFiredDate:](self, "setLastFiredDate:", v21);

          objc_msgSend(v8, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SCSharingReminderCache ignorableIdentifiersByType](self, "ignorableIdentifiersByType");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "valueForKey:", v12);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
          {
            objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (objc_msgSend(v24, "containsObject:", v22))
          {
            SCLogger();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v33 = v8;
              _os_log_error_impl(&dword_2454C0000, v25, OS_LOG_TYPE_ERROR, "@\"Delivered a reminder: %@ whose identifier is already in our delivered list\", buf, 0xCu);
            }
          }
          else
          {
            objc_msgSend(v24, "addObject:", v22);
            -[SCSharingReminderCache ignorableIdentifiersByType](self, "ignorableIdentifiersByType");
            v25 = objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKey:](v25, "setObject:forKey:", v24, v12);
          }

          v4 = v20;
          v6 = v19;
        }

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v27);
  }

}

- (void)removeRemindersWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SCLogger();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl(&dword_2454C0000, v5, OS_LOG_TYPE_INFO, "\"Removing sharing reminders with the following identifiers: %@\", buf, 0xCu);
  }

  -[SCSharingReminderCache scheduledSharingReminders](self, "scheduledSharingReminders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(v4, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13), (_QWORD)v18);
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v15 = v14;
          -[SCSharingReminderCache scheduledSharingReminders](self, "scheduledSharingReminders");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v17);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  -[SCSharingReminderCache removeSharingReminders:wereDelivered:](self, "removeSharingReminders:wereDelivered:", v8, 0);
}

- (void)deliverGeneralSharingReminderAfter:(double)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  NSObject *v10;

  if (a3 >= 0.0)
  {
    -[SCSharingReminderCache sharingRemindersByType](self, "sharingRemindersByType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", CFSTR("com.apple.safetycheckd.general"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "array");
    v4 = objc_claimAutoreleasedReturnValue();

    if ((unint64_t)-[NSObject count](v4, "count") >= 2)
    {
      SCLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[SCSharingReminderCache deliverGeneralSharingReminderAfter:].cold.2(v4, v10);

    }
    -[SCSharingReminderCache removeSharingReminders:wereDelivered:](self, "removeSharingReminders:wereDelivered:", v4, 0);
  }
  else
  {
    SCLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SCSharingReminderCache deliverGeneralSharingReminderAfter:].cold.1(v4, a3, v5, v6);
  }

}

- (void)resetNotificationCount
{
  self->_consecutiveNotificationCount = 0;
}

- (void)incrementNotificationCount
{
  ++self->_consecutiveNotificationCount;
}

- (id)remindersDueBy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SCSharingReminderCache scheduledSharingReminders](self, "scheduledSharingReminders", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "scheduledDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "earlierDate:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "scheduledDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 == v14)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSArray)scheduledReminders
{
  void *v2;
  void *v3;

  -[SCSharingReminderCache scheduledSharingReminders](self, "scheduledSharingReminders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- ($036EC2AD71A582527DAFF881AF25695D)toCacheState
{
  void *v5;
  $036EC2AD71A582527DAFF881AF25695D *result;
  id v7;

  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  retstr->var0 = -[SCSharingReminderCache consecutiveNotificationCount](self, "consecutiveNotificationCount");
  -[SCSharingReminderCache lastFiredDate](self, "lastFiredDate");
  retstr->var1 = (id)objc_claimAutoreleasedReturnValue();
  -[SCSharingReminderCache scheduledSharingReminders](self, "scheduledSharingReminders");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  retstr->var2 = (id)objc_msgSend(v7, "copy");
  -[SCSharingReminderCache ignorableIdentifiersByType](self, "ignorableIdentifiersByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var3 = (id)objc_msgSend(v5, "copy");

  return result;
}

- (void)addIgnoredIdentifiers:(id)a3 withType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SCSharingReminderCache ignorableIdentifiersByType](self, "ignorableIdentifiersByType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "addObjectsFromArray:", v10);
  -[SCSharingReminderCache ignorableIdentifiersByType](self, "ignorableIdentifiersByType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v8, v6);

}

- (id)ignoredIdentifiersForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SCSharingReminderCache ignorableIdentifiersByType](self, "ignorableIdentifiersByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)ignoredIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SCSharingReminderCache ignorableIdentifiersByType](self, "ignorableIdentifiersByType", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "allObjects");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SCSharingReminderCache scheduledSharingReminders](self, "scheduledSharingReminders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("scheduledSharingReminders"));

  -[SCSharingReminderCache ignorableIdentifiersByType](self, "ignorableIdentifiersByType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("deliveredIdentifiersMap"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SCSharingReminderCache consecutiveNotificationCount](self, "consecutiveNotificationCount"), CFSTR("consecutiveNotificationCount"));
  -[SCSharingReminderCache lastFiredDate](self, "lastFiredDate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("lastFiredDate"));

}

- (SCSharingReminderCache)initWithCoder:(id)a3
{
  id v4;
  SCSharingReminderCache *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableOrderedSet *scheduledSharingReminders;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *ignorableIdentifiersByType;
  uint64_t v17;
  NSDate *lastFiredDate;
  objc_super v20;
  _QWORD v21[3];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SCSharingReminderCache;
  v5 = -[SCSharingReminderCache init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("scheduledSharingReminders"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithArray:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    scheduledSharingReminders = v5->_scheduledSharingReminders;
    v5->_scheduledSharingReminders = (NSMutableOrderedSet *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("deliveredIdentifiersMap"));
    v15 = objc_claimAutoreleasedReturnValue();
    ignorableIdentifiersByType = v5->_ignorableIdentifiersByType;
    v5->_ignorableIdentifiersByType = (NSMutableDictionary *)v15;

    v5->_consecutiveNotificationCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("consecutiveNotificationCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastFiredDate"));
    v17 = objc_claimAutoreleasedReturnValue();
    lastFiredDate = v5->_lastFiredDate;
    v5->_lastFiredDate = (NSDate *)v17;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SCSharingReminderCache *v4;
  SCSharingReminderCache *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;

  v4 = (SCSharingReminderCache *)a3;
  if (v4 == self)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SCSharingReminderCache consecutiveNotificationCount](v5, "consecutiveNotificationCount");
      if (v6 != -[SCSharingReminderCache consecutiveNotificationCount](self, "consecutiveNotificationCount"))
        goto LABEL_9;
      -[SCSharingReminderCache scheduledSharingReminders](v5, "scheduledSharingReminders");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hash");
      -[SCSharingReminderCache scheduledSharingReminders](self, "scheduledSharingReminders");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hash");

      if (v8 != v10)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCSharingReminderCache lastFiredDate](v5, "lastFiredDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCSharingReminderCache lastFiredDate](self, "lastFiredDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isDate:inSameDayAsDate:", v12, v13);

      if (v14)
      {
        -[SCSharingReminderCache ignoredIdentifiers](v5, "ignoredIdentifiers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCSharingReminderCache ignoredIdentifiers](self, "ignoredIdentifiers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqualToArray:", v16);

      }
      else
      {
LABEL_9:
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SCSharingReminderCache scheduledSharingReminders](self, "scheduledSharingReminders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SCSharingReminderCache consecutiveNotificationCount](self, "consecutiveNotificationCount");
  -[SCSharingReminderCache lastFiredDate](self, "lastFiredDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  localizedDateStringFromUTC((uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCSharingReminderCache ignoredIdentifiers](self, "ignoredIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[SCSharingReminderCache] Reminders: %@ notification count: %lu last fired date: %@ ignored: %@"), v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)consecutiveNotificationCount
{
  return self->_consecutiveNotificationCount;
}

- (NSDate)lastFiredDate
{
  return self->_lastFiredDate;
}

- (void)setLastFiredDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastFiredDate, a3);
}

- (NSMutableOrderedSet)scheduledSharingReminders
{
  return self->_scheduledSharingReminders;
}

- (void)setScheduledSharingReminders:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledSharingReminders, a3);
}

- (NSMutableDictionary)sharingRemindersByType
{
  return self->_sharingRemindersByType;
}

- (void)setSharingRemindersByType:(id)a3
{
  objc_storeStrong((id *)&self->_sharingRemindersByType, a3);
}

- (NSMutableDictionary)ignorableIdentifiersByType
{
  return self->_ignorableIdentifiersByType;
}

- (void)setIgnorableIdentifiersByType:(id)a3
{
  objc_storeStrong((id *)&self->_ignorableIdentifiersByType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignorableIdentifiersByType, 0);
  objc_storeStrong((id *)&self->_sharingRemindersByType, 0);
  objc_storeStrong((id *)&self->_scheduledSharingReminders, 0);
  objc_storeStrong((id *)&self->_lastFiredDate, 0);
}

+ (void)cacheWithState:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_2454C0000, a3, (uint64_t)a3, "\"Error: initiating cache with a nonsensical last fired date [%@]\", (uint8_t *)a2);

}

- (void)deliverGeneralSharingReminderAfter:(uint64_t)a3 .cold.1(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 134217984;
  v5 = (uint64_t)a2;
  OUTLINED_FUNCTION_0(&dword_2454C0000, a1, a4, "@\"Cache was asked to deliver a sharing reminder in the past: %ld\", (uint8_t *)&v4);
}

- (void)deliverGeneralSharingReminderAfter:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "count");
  _os_log_debug_impl(&dword_2454C0000, a2, OS_LOG_TYPE_DEBUG, "\"Expected 0 or 1 general sharing reminder while resetting but found: %lu\", (uint8_t *)&v3, 0xCu);
}

@end
