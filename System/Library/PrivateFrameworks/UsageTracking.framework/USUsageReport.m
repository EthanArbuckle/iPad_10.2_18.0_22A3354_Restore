@implementation USUsageReport

- (USUsageReport)initWithScreenTime:(double)a3 longestSession:(id)a4 categoryUsage:(id)a5 notifications:(id)a6 pickupsByBundleIdentifier:(id)a7 pickupsWithoutApplicationUsage:(unint64_t)a8 firstPickup:(id)a9 interval:(id)a10 timeZone:(id)a11 lastEventDate:(id)a12
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  USUsageReport *v26;

  v20 = a12;
  v21 = a11;
  v22 = a10;
  v23 = a9;
  v24 = a4;
  -[USUsageReport _addNotifications:andPickups:toApplicationUsageInCategoryUsage:](self, "_addNotifications:andPickups:toApplicationUsageInCategoryUsage:", a6, a7, a5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[USUsageReport initWithScreenTime:longestSession:categoryUsage:pickupsWithoutApplicationUsage:firstPickup:interval:timeZone:lastEventDate:](self, "initWithScreenTime:longestSession:categoryUsage:pickupsWithoutApplicationUsage:firstPickup:interval:timeZone:lastEventDate:", v24, v25, a8, v23, v22, v21, a3, v20);

  return v26;
}

- (id)_addNotifications:(id)a3 andPickups:(id)a4 toApplicationUsageInCategoryUsage:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  USCategoryUsageReport *v30;
  USCategoryUsageReport *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  id obj;
  uint64_t v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_msgSend(a3, "mutableCopy");
  v42 = v7;
  v10 = (void *)objc_msgSend(v7, "mutableCopy");
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v11 = v8;
  v45 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v45)
  {
    v43 = *(_QWORD *)v59;
    v44 = v11;
    v12 = 0x24BDBC000uLL;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v59 != v43)
          objc_enumerationMutation(v11);
        v46 = v13;
        v14 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v13);
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        objc_msgSend(v14, "applicationUsage");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
        if (v15)
        {
          v16 = v15;
          v48 = *(_QWORD *)v55;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v55 != v48)
                objc_enumerationMutation(obj);
              v18 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
              objc_msgSend(v18, "canonicalBundleIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "objectForKeyedSubscript:", v19);
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = (void *)v20;
              if (v20)
              {
                v64 = v19;
                v65 = v20;
                objc_msgSend(*(id *)(v12 + 3696), "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setUserNotificationsByBundleIdentifier:", v22);

                objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v19);
              }
              objc_msgSend(v10, "objectForKeyedSubscript:", v19);
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = (void *)v23;
              if (v23)
              {
                v62 = v19;
                v63 = v23;
                objc_msgSend(*(id *)(v12 + 3696), "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
                v25 = v10;
                v26 = v9;
                v27 = v12;
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setPickupsByBundleIdentifier:", v28);

                v12 = v27;
                v9 = v26;
                v10 = v25;
                objc_msgSend(v25, "setObject:forKeyedSubscript:", 0, v19);
              }

            }
            v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
          }
          while (v16);
        }

        v13 = v46 + 1;
        v11 = v44;
      }
      while (v46 + 1 != v45);
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v45);
  }

  if (objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
  {
    v29 = objc_msgSend(v11, "indexOfObjectPassingTest:", &__block_literal_global_0);
    if (v29 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v30 = [USCategoryUsageReport alloc];
      v31 = -[USCategoryUsageReport initWithCategoryIdentifier:totalUsageTime:applicationUsage:webUsage:](v30, "initWithCategoryIdentifier:totalUsageTime:applicationUsage:webUsage:", *MEMORY[0x24BE157A8], MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], 0.0);
      objc_msgSend(v11, "arrayByAddingObject:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", v29);
      v31 = (USCategoryUsageReport *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
    }
    -[USCategoryUsageReport applicationUsage](v31, "applicationUsage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "mutableCopy");

    v35 = MEMORY[0x24BDAC760];
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __80__USUsageReport__addNotifications_andPickups_toApplicationUsageInCategoryUsage___block_invoke_2;
    v51[3] = &unk_24C7DB620;
    v36 = v10;
    v52 = v36;
    v37 = v34;
    v53 = v37;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v51);
    v49[0] = v35;
    v49[1] = 3221225472;
    v49[2] = __80__USUsageReport__addNotifications_andPickups_toApplicationUsageInCategoryUsage___block_invoke_3;
    v49[3] = &unk_24C7DAF28;
    v50 = v37;
    v38 = v37;
    objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v49);
    -[USCategoryUsageReport setApplicationUsage:](v31, "setApplicationUsage:", v38);

  }
  else
  {
    v32 = 0;
  }
  if (v32)
    v39 = v32;
  else
    v39 = v11;
  v40 = v39;

  return v40;
}

uint64_t __80__USUsageReport__addNotifications_andPickups_toApplicationUsageInCategoryUsage___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "categoryIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE157A8]);

  return v3;
}

void __80__USUsageReport__addNotifications_andPickups_toApplicationUsageInCategoryUsage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  USApplicationUsageReport *v11;
  void *v12;
  USApplicationUsageReport *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v16 = v5;
    v17[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBD1B8];
  }
  v10 = *(void **)(a1 + 40);
  v11 = [USApplicationUsageReport alloc];
  v14 = v5;
  v15 = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[USApplicationUsageReport initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:](v11, "initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:", v5, 1, MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1B8], v12, v9, 0.0);
  objc_msgSend(v10, "addObject:", v13);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, v5);
}

void __80__USUsageReport__addNotifications_andPickups_toApplicationUsageInCategoryUsage___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  USApplicationUsageReport *v7;
  void *v8;
  USApplicationUsageReport *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v7 = [USApplicationUsageReport alloc];
  v10 = v6;
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[USApplicationUsageReport initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:](v7, "initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:", v6, 1, MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1B8], v8, 0.0);
  objc_msgSend(v4, "addObject:", v9);

}

- (USUsageReport)initWithScreenTime:(double)a3 longestSession:(id)a4 categoryUsage:(id)a5 pickupsWithoutApplicationUsage:(unint64_t)a6 firstPickup:(id)a7 interval:(id)a8 timeZone:(id)a9 lastEventDate:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  USUsageReport *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)USUsageReport;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a5;
  v22 = a4;
  v23 = -[USUsageReport init](&v25, sel_init);
  -[USUsageReport _usUsageReportCommonInitWithScreenTime:longestSession:categoryUsage:pickupsWithoutApplicationUsage:firstPickup:interval:timeZone:lastEventDate:](v23, "_usUsageReportCommonInitWithScreenTime:longestSession:categoryUsage:pickupsWithoutApplicationUsage:firstPickup:interval:timeZone:lastEventDate:", v22, v21, a6, v20, v19, v18, a3, v17);

  return v23;
}

- (void)_usUsageReportCommonInitWithScreenTime:(double)a3 longestSession:(id)a4 categoryUsage:(id)a5 pickupsWithoutApplicationUsage:(unint64_t)a6 firstPickup:(id)a7 interval:(id)a8 timeZone:(id)a9 lastEventDate:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSDateInterval *v22;
  NSDateInterval *longestSession;
  NSArray *v24;
  NSArray *categoryUsage;
  NSDate *v26;
  NSDate *firstPickup;
  NSDateInterval *v28;
  NSDateInterval *interval;
  NSTimeZone *v30;
  NSTimeZone *timeZone;
  NSDate *v32;
  NSDate *lastEventDate;

  self->_screenTime = a3;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a5;
  v22 = (NSDateInterval *)objc_msgSend(a4, "copy");
  longestSession = self->_longestSession;
  self->_longestSession = v22;

  v24 = (NSArray *)objc_msgSend(v21, "copy");
  categoryUsage = self->_categoryUsage;
  self->_categoryUsage = v24;

  self->_pickupsWithoutApplicationUsage = a6;
  v26 = (NSDate *)objc_msgSend(v20, "copy");

  firstPickup = self->_firstPickup;
  self->_firstPickup = v26;

  v28 = (NSDateInterval *)objc_msgSend(v19, "copy");
  interval = self->_interval;
  self->_interval = v28;

  v30 = (NSTimeZone *)objc_msgSend(v18, "copy");
  timeZone = self->_timeZone;
  self->_timeZone = v30;

  v32 = (NSDate *)objc_msgSend(v17, "copy");
  lastEventDate = self->_lastEventDate;
  self->_lastEventDate = v32;

}

- (USUsageReport)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  USUsageReport *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  USUsageReport *v25;
  void *v26;
  uint64_t v28;
  void *v29;
  USUsageReport *v30;
  uint64_t v31;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCF20]);
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("CategoryUsage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Interval"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TimeZone"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastEventDate"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v8
    && v9
    && v10
    && v11
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("LongestSession"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("ScreenTime"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("PickupsWithoutApplicationUsage"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("FirstPickup")))
  {
    v32.receiver = self;
    v32.super_class = (Class)USUsageReport;
    v13 = -[USUsageReport init](&v32, sel_init);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LongestSession"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ScreenTime"));
    v16 = v15;
    v31 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PickupsWithoutApplicationUsage"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FirstPickup"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("ApplicationUsageIncludesPickupsAndNotifications")) & 1) == 0)
    {
      v29 = v14;
      v30 = v13;
      v18 = objc_alloc(MEMORY[0x24BDBCF20]);
      v19 = objc_opt_class();
      v20 = objc_opt_class();
      v21 = (void *)objc_msgSend(v18, "initWithObjects:", v19, v20, objc_opt_class(), 0);
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("UserNotificationsByBundleIdentifier"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("PickupsByBundleIdentifier"));
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (v22 && v23)
      {
        -[USUsageReport _addNotifications:andPickups:toApplicationUsageInCategoryUsage:](v30, "_addNotifications:andPickups:toApplicationUsageInCategoryUsage:", v22, v23, v8);
        v28 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v28;
      }

      v14 = v29;
      v13 = v30;
    }
    -[USUsageReport _usUsageReportCommonInitWithScreenTime:longestSession:categoryUsage:pickupsWithoutApplicationUsage:firstPickup:interval:timeZone:lastEventDate:](v13, "_usUsageReportCommonInitWithScreenTime:longestSession:categoryUsage:pickupsWithoutApplicationUsage:firstPickup:interval:timeZone:lastEventDate:", v14, v8, v31, v17, v9, v10, v16, v12);

    self = v13;
    v25 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v34 = v8;
      v35 = 2114;
      v36 = v9;
      v37 = 2114;
      v38 = v10;
      v39 = 2114;
      v40 = v12;
      _os_log_error_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to decode USUsageReport with categoryUsage: %{public}@, interval: %{public}@, timeZone: %{public}@, lastEventDate: %{public}@", buf, 0x2Au);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4865, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v26);

    v25 = 0;
  }

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  double screenTime;
  id v5;
  void *v6;
  id v7;

  screenTime = self->_screenTime;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("ScreenTime"), screenTime);
  objc_msgSend(v5, "encodeObject:forKey:", self->_longestSession, CFSTR("LongestSession"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_categoryUsage, CFSTR("CategoryUsage"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pickupsWithoutApplicationUsage, CFSTR("PickupsWithoutApplicationUsage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstPickup, CFSTR("FirstPickup"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interval, CFSTR("Interval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("TimeZone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastEventDate, CFSTR("LastEventDate"));
  objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("ApplicationUsageIncludesPickupsAndNotifications"));
  -[USUsageReport userNotificationsByBundleIdentifier](self, "userNotificationsByBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("UserNotificationsByBundleIdentifier"));

  -[USUsageReport pickupsByBundleIdentifier](self, "pickupsByBundleIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("PickupsByBundleIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)userNotificationsByBundleIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[USUsageReport categoryUsage](self, "categoryUsage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v9, "applicationUsage", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "userNotificationsByBundleIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addEntriesFromDictionary:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (NSDictionary)pickupsByBundleIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[USUsageReport categoryUsage](self, "categoryUsage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v9, "applicationUsage", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "pickupsByBundleIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addEntriesFromDictionary:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v16.receiver = self;
  v16.super_class = (Class)USUsageReport;
  -[USUsageReport description](&v16, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[USUsageReport screenTime](self, "screenTime");
  v6 = v5;
  -[USUsageReport longestSession](self, "longestSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[USUsageReport categoryUsage](self, "categoryUsage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[USUsageReport pickupsWithoutApplicationUsage](self, "pickupsWithoutApplicationUsage");
  -[USUsageReport firstPickup](self, "firstPickup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[USUsageReport interval](self, "interval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[USUsageReport timeZone](self, "timeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[USUsageReport lastEventDate](self, "lastEventDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, ScreenTime: %f, LongestSession: %@, CategoryUsage: %@\nPickupsWithoutApplicationUsage: %lu, First Pickup: %@, Interval: %@, TimeZone: %@, LastEventDate: %@"), v4, v6, v7, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)emptyReportForInterval:(id)a3
{
  id v3;
  USUsageReport *v4;
  void *v5;
  void *v6;
  USUsageReport *v7;

  v3 = a3;
  v4 = [USUsageReport alloc];
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[USUsageReport initWithScreenTime:longestSession:categoryUsage:pickupsWithoutApplicationUsage:firstPickup:interval:timeZone:lastEventDate:](v4, "initWithScreenTime:longestSession:categoryUsage:pickupsWithoutApplicationUsage:firstPickup:interval:timeZone:lastEventDate:", 0, MEMORY[0x24BDBD1A8], 0, 0, v3, v5, 0.0, v6);

  return v7;
}

- (double)screenTime
{
  return self->_screenTime;
}

- (NSDateInterval)longestSession
{
  return (NSDateInterval *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)categoryUsage
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)pickupsWithoutApplicationUsage
{
  return self->_pickupsWithoutApplicationUsage;
}

- (NSDate)firstPickup
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSDateInterval)interval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 48, 1);
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)lastEventDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEventDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_interval, 0);
  objc_storeStrong((id *)&self->_firstPickup, 0);
  objc_storeStrong((id *)&self->_categoryUsage, 0);
  objc_storeStrong((id *)&self->_longestSession, 0);
}

@end
