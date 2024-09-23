@implementation STDeviceBedtime

- (STDeviceBedtime)init
{
  return -[STDeviceBedtime initWithBlueprint:](self, "initWithBlueprint:", 0);
}

- (STDeviceBedtime)initWithBlueprint:(id)a3
{
  id v4;
  STDeviceBedtime *v5;
  STDeviceBedtime *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  STBlueprintScheduleSimpleItem *v11;
  void *simpleSchedule;
  uint64_t v13;
  STBlueprintScheduleSimpleItem *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSDictionary *scheduleByWeekdayIndex;
  void *v19;
  uint64_t v20;
  STBlueprintScheduleSimpleItem *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  id v40;
  objc_super v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)STDeviceBedtime;
  v5 = -[STDeviceBedtime init](&v41, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v5->_deviceBedtimeEnabled = objc_msgSend(v4, "enabled");
      objc_msgSend(v4, "schedule");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scheduleRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "simpleSchedule");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
        simpleSchedule = v6->_simpleSchedule;
        v6->_simpleSchedule = v11;
      }
      else
      {
        objc_msgSend(v8, "customScheduleItems");
        simpleSchedule = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_alloc(MEMORY[0x24BDBCE70]);
        objc_msgSend(simpleSchedule, "valueForKey:", CFSTR("day"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "initWithObjects:forKeys:", simpleSchedule, v16);
        scheduleByWeekdayIndex = v6->_scheduleByWeekdayIndex;
        v6->_scheduleByWeekdayIndex = (NSDictionary *)v17;

        objc_msgSend(simpleSchedule, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = objc_opt_new();
          v21 = v6->_simpleSchedule;
          v6->_simpleSchedule = (STBlueprintScheduleSimpleItem *)v20;

          objc_msgSend(v19, "startTime");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[STBlueprintScheduleSimpleItem setStartTime:](v6->_simpleSchedule, "setStartTime:", v22);

          objc_msgSend(v19, "endTime");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[STBlueprintScheduleSimpleItem setEndTime:](v6->_simpleSchedule, "setEndTime:", v23);
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "defaultBedtimeSchedule");
          v24 = objc_claimAutoreleasedReturnValue();
          v23 = v6->_simpleSchedule;
          v6->_simpleSchedule = (STBlueprintScheduleSimpleItem *)v24;
        }

      }
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("objectID.URIRepresentation.absoluteString"), 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v25;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "configurations");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sortedArrayUsingDescriptors:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        v30 = (void *)MEMORY[0x24BE190A0];
        objc_msgSend(v29, "payloadPlist");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0;
        objc_msgSend(v30, "declarationForData:error:", v31, &v40);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v40;

        objc_msgSend(v32, "payloadMode");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "isEqualToString:", *MEMORY[0x24BE19048]);

        if (v35)
        {
          v6->_askForMoreTime = 0;
        }
        else
        {
          objc_msgSend(v32, "payloadMode");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "isEqualToString:", *MEMORY[0x24BE19040]);

          if (v37)
          {
            v6->_askForMoreTime = 1;
          }
          else if (!v32 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          {
            -[STDeviceBedtime initWithBlueprint:].cold.1();
          }
        }
        objc_msgSend(v32, "unknownPayloadKeys");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_shouldAllowEditing = objc_msgSend(v38, "count") == 0;

      }
    }
    else
    {
      *(_WORD *)&v5->_deviceBedtimeEnabled = 0;
      objc_msgSend((id)objc_opt_class(), "defaultBedtimeSchedule");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v6->_simpleSchedule;
      v6->_simpleSchedule = (STBlueprintScheduleSimpleItem *)v13;

      v6->_shouldAllowEditing = 1;
    }
  }

  return v6;
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
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  -[STDeviceBedtime scheduleByWeekdayIndex](self, "scheduleByWeekdayIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BE84510];
    v6 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __31__STDeviceBedtime_scheduleText__block_invoke;
    v19[3] = &unk_24DB87DF0;
    v20 = v3;
    v14 = v6;
    v15 = 3221225472;
    v16 = __31__STDeviceBedtime_scheduleText__block_invoke_2;
    v17 = &unk_24DB87E18;
    v18 = v20;
    objc_msgSend(v5, "scheduleTextWithLocale:weekdayScheduleComparator:scheduleTimeGetter:", 0, v19, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle", v14, v15, v16, v17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DeviceDowntimeDailyScheduleOff"), &stru_24DB8A1D0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v9 = v20;
  }
  else
  {
    -[STDeviceBedtime simpleSchedule](self, "simpleSchedule");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BE84510];
    objc_msgSend(v9, "startTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "simpleScheduleTimeRangeWithStartTimeComponents:endTimeComponents:", v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v7;
}

uint64_t __31__STDeviceBedtime_scheduleText__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2 - 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "startTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqual:", v12))
    {
      objc_msgSend(v10, "endTime");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endTime");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id __31__STDeviceBedtime_scheduleText__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2 - 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BE84510];
    objc_msgSend(v4, "startTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "customScheduleTimeRangeWithLocale:startTimeComponents:endTimeComponents:", 0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBlueprint:", 0);
  *(_BYTE *)(v5 + 8) = self->_deviceBedtimeEnabled;
  *(_BYTE *)(v5 + 9) = self->_askForMoreTime;
  v6 = -[STBlueprintScheduleSimpleItem copyWithZone:](self->_simpleSchedule, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSDictionary copyWithZone:](self->_scheduleByWeekdayIndex, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  return (id)v5;
}

+ (STBlueprintScheduleSimpleItem)defaultBedtimeSchedule
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE84510], "defaultStartTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStartTime:", v3);

  objc_msgSend(MEMORY[0x24BE84510], "defaultEndTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEndTime:", v4);

  return (STBlueprintScheduleSimpleItem *)v2;
}

- (BOOL)deviceBedtimeEnabled
{
  return self->_deviceBedtimeEnabled;
}

- (void)setDeviceBedtimeEnabled:(BOOL)a3
{
  self->_deviceBedtimeEnabled = a3;
}

- (BOOL)askForMoreTime
{
  return self->_askForMoreTime;
}

- (void)setAskForMoreTime:(BOOL)a3
{
  self->_askForMoreTime = a3;
}

- (BOOL)shouldAllowEditing
{
  return self->_shouldAllowEditing;
}

- (void)setShouldAllowEditing:(BOOL)a3
{
  self->_shouldAllowEditing = a3;
}

- (STBlueprintScheduleSimpleItem)simpleSchedule
{
  return (STBlueprintScheduleSimpleItem *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSimpleSchedule:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSDictionary)scheduleByWeekdayIndex
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setScheduleByWeekdayIndex:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleByWeekdayIndex, 0);
  objc_storeStrong((id *)&self->_simpleSchedule, 0);
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
  OUTLINED_FUNCTION_0_0(&dword_219AB4000, MEMORY[0x24BDACB70], v0, "Error creating category declaration from plist: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

@end
