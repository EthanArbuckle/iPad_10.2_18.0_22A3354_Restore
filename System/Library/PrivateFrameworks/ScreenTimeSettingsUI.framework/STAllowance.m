@implementation STAllowance

- (STAllowance)init
{
  return -[STAllowance initWithBlueprint:](self, "initWithBlueprint:", 0);
}

- (STAllowance)initWithBlueprint:(id)a3
{
  id v4;
  STAllowance *v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  void *time;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *identifier;
  NSArray *bundleIdentifiers;
  NSArray *v25;
  NSArray *webDomains;
  NSArray *categoryIdentifiers;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *timeByDay;
  NSDictionary *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  NSDateComponents *v65;
  void *v67;
  uint64_t v68;
  NSArray *v69;
  NSArray *v70;
  NSArray *v71;
  NSArray *v72;
  void *v73;
  uint64_t v74;
  NSArray *v75;
  NSArray *v76;
  NSArray *v77;
  NSArray *v78;
  uint64_t v79;
  NSArray *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  id v95;
  objc_super v96;
  _BYTE v97[128];
  _QWORD v98[3];

  v98[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v96.receiver = self;
  v96.super_class = (Class)STAllowance;
  v5 = -[STAllowance init](&v96, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v18 = objc_alloc(MEMORY[0x24BDD17C8]);
      v19 = *MEMORY[0x24BE846A0];
      v20 = (void *)objc_opt_new();
      objc_msgSend(v20, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v18, "initWithFormat:", CFSTR("%@_%@"), v19, v21);

      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v22;

      *(_WORD *)&v5->_allowanceEnabled = 257;
      bundleIdentifiers = v5->_bundleIdentifiers;
      v25 = (NSArray *)MEMORY[0x24BDBD1A8];
      v5->_bundleIdentifiers = (NSArray *)MEMORY[0x24BDBD1A8];

      webDomains = v5->_webDomains;
      v5->_webDomains = v25;

      categoryIdentifiers = v5->_categoryIdentifiers;
      v5->_categoryIdentifiers = v25;

      -[STAllowance defaultBudgetTime](v5, "defaultBudgetTime");
      v28 = objc_claimAutoreleasedReturnValue();
      time = v5->_time;
      v5->_time = (NSDateComponents *)v28;
LABEL_41:

      goto LABEL_42;
    }
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_allowanceEnabled = objc_msgSend(v4, "limitEnabled");
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("objectID.URIRepresentation.absoluteString"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 1);
    time = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "configurations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedArrayUsingDescriptors:", time);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BE190A0];
    v86 = v12;
    objc_msgSend(v12, "payloadPlist");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = 0;
    objc_msgSend(v13, "declarationForData:error:", v14, &v95);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v95;

    if (!v15)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        -[STAllowance initWithBlueprint:].cold.1();
LABEL_13:
      objc_msgSend(v15, "unknownPayloadKeys");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_shouldAllowEditing = objc_msgSend(v29, "count") == 0;

      objc_msgSend(v4, "usageLimit");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "usageItemType");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "applicationIdentifiers");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "websiteIdentifiers");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "categoryIdentifiersVersion2");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v33)
      {
        v35 = v33;
      }
      else
      {
        objc_msgSend(v30, "categoryIdentifiers");
        v35 = (id)objc_claimAutoreleasedReturnValue();
      }
      v89 = v35;

      v88 = time;
      if (objc_msgSend(v32, "count") || objc_msgSend(v90, "count") || objc_msgSend(v89, "count"))
      {
        v36 = v31;
        v37 = v32;
        v38 = objc_msgSend(v32, "copy");
        v39 = (void *)v38;
        v40 = (void *)MEMORY[0x24BDBD1A8];
        if (v38)
          v41 = (void *)v38;
        else
          v41 = (void *)MEMORY[0x24BDBD1A8];
        objc_storeStrong((id *)&v5->_bundleIdentifiers, v41);

        v42 = objc_msgSend(v90, "copy");
        v43 = (void *)v42;
        if (v42)
          v44 = (void *)v42;
        else
          v44 = v40;
        objc_storeStrong((id *)&v5->_webDomains, v44);

        v45 = objc_msgSend(v89, "copy");
        v46 = (void *)v45;
        if (v45)
          v47 = (void *)v45;
        else
          v47 = v40;
        objc_storeStrong((id *)&v5->_categoryIdentifiers, v47);
        goto LABEL_29;
      }
      if (objc_msgSend(v31, "isEqualToString:", *MEMORY[0x24BE846D8]))
      {
        v36 = v31;
        v37 = v32;
        objc_msgSend(v30, "itemIdentifiers");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "copy");
        v69 = v5->_bundleIdentifiers;
        v5->_bundleIdentifiers = (NSArray *)v68;

        v70 = v5->_webDomains;
        v71 = (NSArray *)MEMORY[0x24BDBD1A8];
        v5->_webDomains = (NSArray *)MEMORY[0x24BDBD1A8];

      }
      else
      {
        if (!objc_msgSend(v31, "isEqualToString:", *MEMORY[0x24BE846E8]))
        {
          if (!objc_msgSend(v31, "isEqualToString:", *MEMORY[0x24BE846E0]))
            goto LABEL_30;
          v36 = v31;
          v37 = v32;
          v76 = v5->_bundleIdentifiers;
          v77 = (NSArray *)MEMORY[0x24BDBD1A8];
          v5->_bundleIdentifiers = (NSArray *)MEMORY[0x24BDBD1A8];

          v78 = v5->_webDomains;
          v5->_webDomains = v77;

          objc_msgSend(v30, "itemIdentifiers");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend(v46, "copy");
          v80 = v5->_categoryIdentifiers;
          v5->_categoryIdentifiers = (NSArray *)v79;

LABEL_29:
          v32 = v37;
          v31 = v36;
          time = v88;
LABEL_30:
          v48 = v15;
          objc_msgSend(v30, "budgetLimitScheduleRepresentation");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "simpleSchedule");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50)
          {
            v51 = (void *)objc_opt_class();
            objc_msgSend(v50, "budgetLimit");
            objc_msgSend(v51, "dateComponentsForDuration:");
            v52 = objc_claimAutoreleasedReturnValue();
            timeByDay = v5->_time;
            v5->_time = (NSDateComponents *)v52;
          }
          else
          {
            v81 = v32;
            v82 = v31;
            v83 = v30;
            v84 = v48;
            v85 = v4;
            v54 = (NSDictionary *)objc_opt_new();
            v91 = 0u;
            v92 = 0u;
            v93 = 0u;
            v94 = 0u;
            objc_msgSend(v49, "customScheduleItems");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
            if (v56)
            {
              v57 = v56;
              v58 = *(_QWORD *)v92;
              do
              {
                for (i = 0; i != v57; ++i)
                {
                  if (*(_QWORD *)v92 != v58)
                    objc_enumerationMutation(v55);
                  v60 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
                  v61 = (void *)objc_opt_class();
                  objc_msgSend(v60, "budgetLimit");
                  objc_msgSend(v61, "dateComponentsForDuration:");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v60, "day"));
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSDictionary setObject:forKeyedSubscript:](v54, "setObject:forKeyedSubscript:", v62, v63);

                }
                v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
              }
              while (v57);
            }

            -[NSDictionary objectForKeyedSubscript:](v54, "objectForKeyedSubscript:", &unk_24DBBECE8);
            v64 = objc_claimAutoreleasedReturnValue();
            v65 = v5->_time;
            v5->_time = (NSDateComponents *)v64;

            timeByDay = v5->_timeByDay;
            v5->_timeByDay = v54;
            v48 = v84;
            v4 = v85;
            time = v88;
            v31 = v82;
            v30 = v83;
            v50 = 0;
            v32 = v81;
          }

          goto LABEL_41;
        }
        v36 = v31;
        v37 = v32;
        v72 = v5->_bundleIdentifiers;
        v71 = (NSArray *)MEMORY[0x24BDBD1A8];
        v5->_bundleIdentifiers = (NSArray *)MEMORY[0x24BDBD1A8];

        objc_msgSend(v30, "itemIdentifiers");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v73, "copy");
        v75 = v5->_webDomains;
        v5->_webDomains = (NSArray *)v74;

      }
      v46 = v5->_categoryIdentifiers;
      v5->_categoryIdentifiers = v71;
      goto LABEL_29;
    }
    objc_msgSend(v15, "payloadMode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BE19048]) & 1) != 0)
    {
      v17 = 0;
    }
    else
    {
      if (!objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BE19040]))
      {
LABEL_12:

        goto LABEL_13;
      }
      v17 = 1;
    }
    v5->_behaviorType = v17;
    goto LABEL_12;
  }
LABEL_42:

  return v5;
}

- (double)timeToday
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[STAllowance timeByDay](self, "timeByDay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    v6 = objc_msgSend(v4, "component:fromDate:", 16, v5);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[STAllowance time](self, "time");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)objc_opt_class(), "timeIntervalForAllowanceDateComponents:", v8);
  v10 = v9;

  return v10;
}

- (NSString)scheduleText
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  -[STAllowance timeByDay](self, "timeByDay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setFormattingContext:", 1);
  objc_msgSend(v4, "setUnitsStyle:", 5);
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BE84510];
    v6 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __27__STAllowance_scheduleText__block_invoke;
    v21[3] = &unk_24DB87DF0;
    v22 = v3;
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __27__STAllowance_scheduleText__block_invoke_2;
    v18[3] = &unk_24DB87E40;
    v19 = v22;
    v20 = v4;
    objc_msgSend(v5, "scheduleTextWithLocale:weekdayScheduleComparator:scheduleTimeGetter:", 0, v21, v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AppLimitOff"), &stru_24DB8A1D0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v9 = v22;
  }
  else
  {
    -[STAllowance time](self, "time");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[STAllowance timeIntervalForAllowanceDateComponents:](STAllowance, "timeIntervalForAllowanceDateComponents:", v10);
    v12 = v11;

    objc_msgSend(v4, "stringFromTimeInterval:", v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("AppLimitEveryDayFormat"), &stru_24DB8A1D0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v15, "initWithFormat:locale:", v14, v16, v9);

  }
  return (NSString *)v7;
}

uint64_t __27__STAllowance_scheduleText__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "isEqual:", v7);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __27__STAllowance_scheduleText__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[STAllowance timeIntervalForAllowanceDateComponents:](STAllowance, "timeIntervalForAllowanceDateComponents:", v5);
    objc_msgSend(*(id *)(a1 + 40), "stringFromTimeInterval:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  STAllowance *v5;
  uint64_t v6;
  NSArray *bundleIdentifiers;
  uint64_t v8;
  NSArray *webDomains;
  uint64_t v10;
  NSArray *categoryIdentifiers;
  uint64_t v12;
  NSDateComponents *time;
  uint64_t v14;
  NSDictionary *timeByDay;

  v5 = -[STAllowance initWithBlueprint:](+[STAllowance allocWithZone:](STAllowance, "allocWithZone:"), "initWithBlueprint:", 0);
  v5->_allowanceEnabled = self->_allowanceEnabled;
  objc_storeStrong((id *)&v5->_identifier, self->_identifier);
  v6 = -[NSArray copyWithZone:](self->_bundleIdentifiers, "copyWithZone:", a3);
  bundleIdentifiers = v5->_bundleIdentifiers;
  v5->_bundleIdentifiers = (NSArray *)v6;

  v8 = -[NSArray copyWithZone:](self->_webDomains, "copyWithZone:", a3);
  webDomains = v5->_webDomains;
  v5->_webDomains = (NSArray *)v8;

  v10 = -[NSArray copyWithZone:](self->_categoryIdentifiers, "copyWithZone:", a3);
  categoryIdentifiers = v5->_categoryIdentifiers;
  v5->_categoryIdentifiers = (NSArray *)v10;

  v5->_behaviorType = self->_behaviorType;
  v12 = -[NSDateComponents copy](self->_time, "copy");
  time = v5->_time;
  v5->_time = (NSDateComponents *)v12;

  v14 = -[NSDictionary copy](self->_timeByDay, "copy");
  timeByDay = v5->_timeByDay;
  v5->_timeByDay = (NSDictionary *)v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  char v17;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[STAllowance timeByDay](self, "timeByDay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeByDay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[STAllowance allowanceEnabled](self, "allowanceEnabled");
    if (v8 == objc_msgSend(v5, "allowanceEnabled"))
    {
      -[STAllowance identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", v10)
        && (v11 = -[STAllowance behaviorType](self, "behaviorType"), v11 == objc_msgSend(v5, "behaviorType")))
      {
        -[STAllowance bundleIdentifiers](self, "bundleIdentifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleIdentifiers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToArray:", v13))
        {
          -[STAllowance webDomains](self, "webDomains");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "webDomains");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "isEqualToArray:", v14))
          {
            -[STAllowance categoryIdentifiers](self, "categoryIdentifiers");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "categoryIdentifiers");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "isEqualToArray:", v21))
            {
              -[STAllowance time](self, "time");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "time");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (STCompareHourMinuteTimeComponents())
              {
                v16 = 0;
              }
              else
              {
                v19 = objc_msgSend(v6, "count");
                v16 = v19 == objc_msgSend(v7, "count");
              }
              *((_BYTE *)v28 + 24) = v16;

            }
            else
            {
              *((_BYTE *)v28 + 24) = 0;
            }

          }
          else
          {
            *((_BYTE *)v28 + 24) = 0;
          }

        }
        else
        {
          *((_BYTE *)v28 + 24) = 0;
        }

      }
      else
      {
        *((_BYTE *)v28 + 24) = 0;
      }

      if (*((_BYTE *)v28 + 24))
      {
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __23__STAllowance_isEqual___block_invoke;
        v24[3] = &unk_24DB87E68;
        v25 = v7;
        v26 = &v27;
        objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v24);

      }
    }
    else
    {
      *((_BYTE *)v28 + 24) = 0;
    }

  }
  v17 = *((_BYTE *)v28 + 24);
  _Block_object_dispose(&v27, 8);

  return v17;
}

void __23__STAllowance_isEqual___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || STCompareHourMinuteTimeComponents())
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  v3 = -[STAllowance allowanceEnabled](self, "allowanceEnabled");
  -[STAllowance identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[STAllowance bundleIdentifiers](self, "bundleIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;
  -[STAllowance webDomains](self, "webDomains");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[STAllowance categoryIdentifiers](self, "categoryIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  v12 = v7 ^ v11 ^ -[STAllowance behaviorType](self, "behaviorType");
  -[STAllowance time](self, "time");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");
  -[STAllowance timeByDay](self, "timeByDay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12 ^ v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

+ (id)dateComponentsForDuration:(double)a3
{
  uint64_t v3;
  void *v4;

  v3 = (uint64_t)a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setHour:", v3 / 3600 % 24);
  objc_msgSend(v4, "setMinute:", v3 / 60 % 60);
  objc_msgSend(v4, "setSecond:", v3 % 60);
  return v4;
}

+ (double)timeIntervalForAllowanceDateComponents:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3;
  v4 = 3600 * objc_msgSend(v3, "hour");
  v5 = objc_msgSend(v3, "minute");

  return (double)(v4 + 60 * v5);
}

- (id)defaultBudgetTime
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setHour:", 0);
  objc_msgSend(v2, "setMinute:", 0);
  return v2;
}

- (id)defaultTimeByDay
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;

  -[STAllowance time](self, "time");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "timeIntervalForAllowanceDateComponents:", v2);
  if (!v2 || v3 <= 0.0)
  {
    v4 = (void *)objc_opt_new();

    objc_msgSend(v4, "setHour:", 0);
    objc_msgSend(v4, "setMinute:", 0);
    v2 = v4;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 1; i != 8; ++i)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v2, v7);

  }
  return v5;
}

- (NSArray)bundleIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleIdentifiers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSArray)webDomains
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWebDomains:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSArray)categoryIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCategoryIdentifiers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)allowanceEnabled
{
  return self->_allowanceEnabled;
}

- (void)setAllowanceEnabled:(BOOL)a3
{
  self->_allowanceEnabled = a3;
}

- (BOOL)shouldAllowEditing
{
  return self->_shouldAllowEditing;
}

- (void)setShouldAllowEditing:(BOOL)a3
{
  self->_shouldAllowEditing = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)behaviorType
{
  return self->_behaviorType;
}

- (void)setBehaviorType:(unint64_t)a3
{
  self->_behaviorType = a3;
}

- (NSDateComponents)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)timeByDay
{
  return self->_timeByDay;
}

- (void)setTimeByDay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeByDay, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifiers, 0);
  objc_storeStrong((id *)&self->_webDomains, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
}

- (void)initWithBlueprint:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, MEMORY[0x24BDACB70], v0, "failed to deserialize configuration plist: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

@end
