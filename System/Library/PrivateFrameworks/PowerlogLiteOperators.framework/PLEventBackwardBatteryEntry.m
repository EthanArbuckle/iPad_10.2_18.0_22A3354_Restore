@implementation PLEventBackwardBatteryEntry

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PLEventBackwardBatteryEntry;
  -[PLEventBackwardBatteryEntry dealloc](&v2, sel_dealloc);
}

void __64__PLEventBackwardBatteryEntry_populateQmaxForEntry_withRawData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a2;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("QmaxCell%d"), a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

}

+ (id)entryKey
{
  return +[PLOperator entryKeyForType:andName:](PLBatteryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("Battery"));
}

- (id)initEntryWithRawData:(id)a3
{
  id v4;
  void *v5;
  PLEventBackwardBatteryEntry *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  +[PLEventBackwardBatteryEntry entryKey](PLEventBackwardBatteryEntry, "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)PLEventBackwardBatteryEntry;
  v6 = -[PLEntry initWithEntryKey:withRawData:](&v15, sel_initWithEntryKey_withRawData_, v5, v4);

  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "populateQmaxForEntry:withRawData:", v6, v4);
    objc_msgSend((id)objc_opt_class(), "populateDODForEntry:withRawData:", v6, v4);
    objc_msgSend((id)objc_opt_class(), "populateCellVoltageForEntry:withRawData:", v6, v4);
    objc_msgSend((id)objc_opt_class(), "populatewRaForEntry:withRawData:", v6, v4);
    -[PLEventBackwardBatteryEntry populatePresentDODFromRawData:](v6, "populatePresentDODFromRawData:", v4);
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Temperature"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v7, "numberWithDouble:", v9 / 100.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v10, CFSTR("Temperature"));

    -[PLEventBackwardBatteryEntry levelWithRawData:](v6, "levelWithRawData:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v11, CFSTR("Level"));

    -[PLEventBackwardBatteryEntry rawLevelWithRawData:](v6, "rawLevelWithRawData:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v12, CFSTR("RawLevel"));

    -[PLEventBackwardBatteryEntry absoluteLevelWithRawData:](v6, "absoluteLevelWithRawData:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v13, CFSTR("AbsoluteLevel"));

    -[PLEventBackwardBatteryEntry populateTLCCounterWithRawData:](v6, "populateTLCCounterWithRawData:", v4);
    -[PLEventBackwardBatteryEntry populateAdapterPowerTierWithRawData:](v6, "populateAdapterPowerTierWithRawData:", v4);
  }

  return v6;
}

+ (void)populateQmaxForEntry:(id)a3 withRawData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (v5 && a4)
  {
    v8 = v5;
    objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("BatteryData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Qmax"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__PLEventBackwardBatteryEntry_populateQmaxForEntry_withRawData___block_invoke;
    v9[3] = &unk_1E857F760;
    v10 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

    v5 = v8;
  }

}

- (id)rawLevelWithRawData:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("AppleRawCurrentCapacity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6 * 100.0;
  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("AppleRawMaxCapacity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v4, "numberWithDouble:", v7 / v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)populateTLCCounterWithRawData:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ChargerData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TimeChargingThermallyLimited"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v5, CFSTR("TimeChargingThermallyLimited"));

    v4 = v6;
  }

}

- (void)populatePresentDODFromRawData:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("BatteryData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PresentDOD"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntry setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v5, CFSTR("PresentDOD"));

}

- (id)levelWithRawData:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("CurrentCapacity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6 * 100.0;
  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("MaxCapacity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v4, "numberWithDouble:", v7 / v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)absoluteLevelWithRawData:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("AbsoluteCapacity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6 * 100.0;
  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("QmaxCell0"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v4, "numberWithDouble:", v7 / v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)populatewRaForEntry:(id)a3 withRawData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("BatteryData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WeightedRa"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("WeightedRa"));

    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __63__PLEventBackwardBatteryEntry_populatewRaForEntry_withRawData___block_invoke;
      v11[3] = &unk_1E857F760;
      v12 = v5;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("WeightedRa"));
    }
    else
    {
      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "className");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v10;
        _os_log_error_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_ERROR, "unknown wRa format: %@", buf, 0xCu);

      }
    }
  }

}

+ (void)populateDODForEntry:(id)a3 withRawData:(id)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("BatteryData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DOD0"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DOD%d"), v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, v9);

      ++v7;
    }
    while (objc_msgSend(v6, "count") > v7);
  }

}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLEventBackwardBatteryEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (void)populateCellWOMForEntry:(id)a3 withRawData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (v5 && a4)
  {
    v8 = v5;
    objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("BatteryData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CellWom"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__PLEventBackwardBatteryEntry_populateCellWOMForEntry_withRawData___block_invoke;
    v9[3] = &unk_1E857F760;
    v10 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

    v5 = v8;
  }

}

void __67__PLEventBackwardBatteryEntry_populateCellWOMForEntry_withRawData___block_invoke(uint64_t a1, void *a2, int a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (a3 + 1);
  v6 = a2;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Wom_%d"), v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

}

void __63__PLEventBackwardBatteryEntry_populatewRaForEntry_withRawData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = a2;
    objc_msgSend(v5, "stringWithFormat:", CFSTR("WeightedRaCell%d"), a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

  }
}

- (void)populateAdapterPowerTierWithRawData:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AdapterDetails"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AdapterPowerTier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v5, CFSTR("AdapterPowerTier"));

    v4 = v6;
  }

}

@end
