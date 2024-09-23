@implementation PLBatteryUIResponseTypeChargingIntervals

- (id)dependencies
{
  return 0;
}

- (void)configure:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("end"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeChargingIntervals setStart:](self, "setStart:", v11);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeChargingIntervals setEnd:](self, "setEnd:", v12);

  -[PLBatteryUIResponseTypeChargingIntervals start](self, "start");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeChargingIntervals end](self, "end");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSince1970");
  v16 = v15;
  objc_msgSend(v14, "timeIntervalSince1970");
  v18 = v17 - v16;

  v19 = objc_alloc(MEMORY[0x1E0D80080]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v20, 5);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("Level"), &unk_1EA1C0188, 3);
  +[PLOperator entryKeyForType:andName:](PLBatteryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BatteryUI"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeChargingIntervals responderService](self, "responderService");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "storage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v21;
  v31[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lastEntryForKey:withComparisons:isSingleton:", v23, v26, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeChargingIntervals setLastBattEntry:](self, "setLastBattEntry:", v27);

  -[PLBatteryUIResponseTypeChargingIntervals responderService](self, "responderService");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "storage");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "entriesForKey:inTimeRange:withFilters:", v23, 0, v16, v18);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeChargingIntervals setBattEntries:](self, "setBattEntries:", v30);

}

- (void)run
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "Last Entry isCharging: %d", (uint8_t *)v2, 8u);
}

- (id)result
{
  -[PLBatteryUIResponseTypeChargingIntervals setBattEntries:](self, "setBattEntries:", 0);
  -[PLBatteryUIResponseTypeChargingIntervals setLastBattEntry:](self, "setLastBattEntry:", 0);
  return -[PLBatteryUIResponseTypeChargingIntervals resultArray](self, "resultArray");
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponderService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEnd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)battEntries
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBattEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PLEntry)lastBattEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastBattEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)resultArray
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setResultArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultArray, 0);
  objc_storeStrong((id *)&self->_lastBattEntry, 0);
  objc_storeStrong((id *)&self->_battEntries, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

@end
