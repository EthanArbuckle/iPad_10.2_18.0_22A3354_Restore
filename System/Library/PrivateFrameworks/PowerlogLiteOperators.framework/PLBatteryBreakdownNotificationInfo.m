@implementation PLBatteryBreakdownNotificationInfo

- (PLBatteryBreakdownNotificationInfo)initWithEntry:(id)a3
{
  id v4;
  PLBatteryBreakdownNotificationInfo *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  PLBatteryBreakdownNotificationInfo *v11;
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
  int v22;
  void *v23;
  int v24;
  void *v25;
  objc_super v27;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NotificationBundleID"));
  v5 = (PLBatteryBreakdownNotificationInfo *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_14;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NotificationType"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_10;
  v7 = (void *)v6;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BgWakingCount"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

LABEL_10:
    goto LABEL_11;
  }
  v9 = (void *)v8;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BgWakingNSEDuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_14;
  }
  v27.receiver = self;
  v27.super_class = (Class)PLBatteryBreakdownNotificationInfo;
  v11 = -[PLBatteryBreakdownNotificationInfo init](&v27, sel_init);
  if (v11)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NotificationBundleID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryBreakdownNotificationInfo setBundleID:](v11, "setBundleID:", v12);

    -[PLBatteryBreakdownNotificationInfo bundleID](v11, "bundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryBreakdownNotificationInfo setIsFirstParty:](v11, "setIsFirstParty:", objc_msgSend(v13, "hasPrefix:", CFSTR("com.apple.")));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NotificationType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryBreakdownNotificationInfo setNotificationType:](v11, "setNotificationType:", objc_msgSend(v14, "intValue"));

    if (!-[PLBatteryBreakdownNotificationInfo notificationType](v11, "notificationType")
      || -[PLBatteryBreakdownNotificationInfo notificationType](v11, "notificationType") == -1)
    {
      -[PLBatteryBreakdownNotificationInfo setBgWakingCount:](v11, "setBgWakingCount:", 0);
      -[PLBatteryBreakdownNotificationInfo setBgWakingNSEDuration:](v11, "setBgWakingNSEDuration:", 0.0);
      -[PLBatteryBreakdownNotificationInfo setFgWakingCount:](v11, "setFgWakingCount:", 0);
      -[PLBatteryBreakdownNotificationInfo setFgWakingNSEDuration:](v11, "setFgWakingNSEDuration:", 0.0);
      -[PLBatteryBreakdownNotificationInfo setNonWakingCount:](v11, "setNonWakingCount:", 0);
      -[PLBatteryBreakdownNotificationInfo setNonWakingNSEDuration:](v11, "setNonWakingNSEDuration:", 0.0);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BgWakingCount"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "intValue");
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FgWakingCount"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "intValue") + v22;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NonWakingCount"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBatteryBreakdownNotificationInfo setLocalCount:](v11, "setLocalCount:", (int)(v24 + objc_msgSend(v25, "intValue")));

    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BgWakingCount"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBatteryBreakdownNotificationInfo setBgWakingCount:](v11, "setBgWakingCount:", (int)objc_msgSend(v15, "intValue"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BgWakingNSEDuration"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      -[PLBatteryBreakdownNotificationInfo setBgWakingNSEDuration:](v11, "setBgWakingNSEDuration:");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FgWakingCount"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBatteryBreakdownNotificationInfo setFgWakingCount:](v11, "setFgWakingCount:", (int)objc_msgSend(v17, "intValue"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FgWakingNSEDuration"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      -[PLBatteryBreakdownNotificationInfo setFgWakingNSEDuration:](v11, "setFgWakingNSEDuration:");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NonWakingCount"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBatteryBreakdownNotificationInfo setNonWakingCount:](v11, "setNonWakingCount:", (int)objc_msgSend(v19, "intValue"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NonWakingNSEDuration"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      -[PLBatteryBreakdownNotificationInfo setNonWakingNSEDuration:](v11, "setNonWakingNSEDuration:");

      -[PLBatteryBreakdownNotificationInfo setLocalCount:](v11, "setLocalCount:", 0);
    }
  }
  self = v11;
  v5 = self;
LABEL_14:

  return v5;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[PLBatteryBreakdownNotificationInfo fgWakingCount](self, "fgWakingCount");
  -[PLBatteryBreakdownNotificationInfo fgWakingNSEDuration](self, "fgWakingNSEDuration");
  v6 = v5;
  v7 = -[PLBatteryBreakdownNotificationInfo bgWakingCount](self, "bgWakingCount");
  -[PLBatteryBreakdownNotificationInfo bgWakingNSEDuration](self, "bgWakingNSEDuration");
  v9 = v8;
  v10 = -[PLBatteryBreakdownNotificationInfo nonWakingCount](self, "nonWakingCount");
  -[PLBatteryBreakdownNotificationInfo nonWakingNSEDuration](self, "nonWakingNSEDuration");
  v12 = v11;
  v13 = -[PLBatteryBreakdownNotificationInfo localCount](self, "localCount");
  -[PLBatteryBreakdownNotificationInfo activeEnergy](self, "activeEnergy");
  v15 = v14;
  -[PLBatteryBreakdownNotificationInfo baseEnergy](self, "baseEnergy");
  v17 = v16;
  -[PLBatteryBreakdownNotificationInfo displayEnergy](self, "displayEnergy");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("FG Wake: %zu %.2fs, BG Wake: %zu %.2fs, Non-Wake: %zu %.2fs, Local: %zu, active: %.2f, base: %.2f, disp: %.2f"), v4, v6, v7, v9, v10, v12, v13, v15, v17, v18);
}

- (void)combineWith:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;

  if (a3)
  {
    v4 = a3;
    -[PLBatteryBreakdownNotificationInfo setBgWakingCount:](self, "setBgWakingCount:", -[PLBatteryBreakdownNotificationInfo bgWakingCount](self, "bgWakingCount") + objc_msgSend(v4, "bgWakingCount"));
    objc_msgSend(v4, "bgWakingNSEDuration");
    v6 = v5;
    -[PLBatteryBreakdownNotificationInfo bgWakingNSEDuration](self, "bgWakingNSEDuration");
    -[PLBatteryBreakdownNotificationInfo setBgWakingNSEDuration:](self, "setBgWakingNSEDuration:", v6 + v7);
    -[PLBatteryBreakdownNotificationInfo setFgWakingCount:](self, "setFgWakingCount:", -[PLBatteryBreakdownNotificationInfo fgWakingCount](self, "fgWakingCount") + objc_msgSend(v4, "fgWakingCount"));
    objc_msgSend(v4, "fgWakingNSEDuration");
    v9 = v8;
    -[PLBatteryBreakdownNotificationInfo fgWakingNSEDuration](self, "fgWakingNSEDuration");
    -[PLBatteryBreakdownNotificationInfo setFgWakingNSEDuration:](self, "setFgWakingNSEDuration:", v9 + v10);
    -[PLBatteryBreakdownNotificationInfo setNonWakingCount:](self, "setNonWakingCount:", -[PLBatteryBreakdownNotificationInfo nonWakingCount](self, "nonWakingCount") + objc_msgSend(v4, "nonWakingCount"));
    objc_msgSend(v4, "nonWakingNSEDuration");
    v12 = v11;
    -[PLBatteryBreakdownNotificationInfo nonWakingNSEDuration](self, "nonWakingNSEDuration");
    -[PLBatteryBreakdownNotificationInfo setNonWakingNSEDuration:](self, "setNonWakingNSEDuration:", v12 + v13);
    v14 = objc_msgSend(v4, "localCount");

    -[PLBatteryBreakdownNotificationInfo setLocalCount:](self, "setLocalCount:", -[PLBatteryBreakdownNotificationInfo localCount](self, "localCount") + v14);
  }
}

- (double)activeEnergy
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  int v15;
  double v16;

  -[PLBatteryBreakdownNotificationInfo fgWakingNSEDuration](self, "fgWakingNSEDuration");
  v3 = 0.1;
  -[PLBatteryBreakdownNotificationInfo calculateActiveEnergyForNSEDuration:andCount:withNominalEnergy:](self, "calculateActiveEnergyForNSEDuration:andCount:withNominalEnergy:", -[PLBatteryBreakdownNotificationInfo fgWakingCount](self, "fgWakingCount"), v4, 0.1);
  v6 = v5;
  -[PLBatteryBreakdownNotificationInfo bgWakingNSEDuration](self, "bgWakingNSEDuration");
  -[PLBatteryBreakdownNotificationInfo calculateActiveEnergyForNSEDuration:andCount:withNominalEnergy:](self, "calculateActiveEnergyForNSEDuration:andCount:withNominalEnergy:", -[PLBatteryBreakdownNotificationInfo bgWakingCount](self, "bgWakingCount"), v7, 0.1);
  v9 = v8;
  -[PLBatteryBreakdownNotificationInfo nonWakingNSEDuration](self, "nonWakingNSEDuration");
  -[PLBatteryBreakdownNotificationInfo calculateActiveEnergyForNSEDuration:andCount:withNominalEnergy:](self, "calculateActiveEnergyForNSEDuration:andCount:withNominalEnergy:", -[PLBatteryBreakdownNotificationInfo nonWakingCount](self, "nonWakingCount"), v10, 0.1);
  v12 = v11;
  if (-[PLBatteryBreakdownNotificationInfo isFirstParty](self, "isFirstParty"))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("com.apple.MobileSMS"), CFSTR("com.apple.mobilemail"), CFSTR("com.apple.mobilecal"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryBreakdownNotificationInfo bundleID](self, "bundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "containsObject:", v14);

    if (v15)
      v3 = 1.0;
    else
      v3 = 0.2;

  }
  -[PLBatteryBreakdownNotificationInfo calculateActiveEnergyForNSEDuration:andCount:withNominalEnergy:](self, "calculateActiveEnergyForNSEDuration:andCount:withNominalEnergy:", -[PLBatteryBreakdownNotificationInfo localCount](self, "localCount"), 0.0, v3);
  return v6 + 0.0 + v9 + v12 + v16;
}

- (double)calculateActiveEnergyForNSEDuration:(double)a3 andCount:(unint64_t)a4 withNominalEnergy:(double)a5
{
  double v5;

  if (a3 > 0.0)
  {
    v5 = a3 / 3600.0;
    a5 = 750.0;
    return v5 * a5;
  }
  if (a4)
  {
    v5 = (double)a4;
    return v5 * a5;
  }
  return 0.0;
}

- (double)baseEnergy
{
  unint64_t v3;

  v3 = -[PLBatteryBreakdownNotificationInfo fgWakingCount](self, "fgWakingCount");
  return (double)(-[PLBatteryBreakdownNotificationInfo bgWakingCount](self, "bgWakingCount") + v3) * 0.416666667;
}

- (double)displayEnergy
{
  double v3;

  +[PLBatteryBreakdownNotificationInfo representativeDisplayPower](PLBatteryBreakdownNotificationInfo, "representativeDisplayPower");
  return v3 * ((double)-[PLBatteryBreakdownNotificationInfo fgWakingCount](self, "fgWakingCount") * 0.00277777778);
}

- (double)notificationEnergy
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[PLBatteryBreakdownNotificationInfo baseEnergy](self, "baseEnergy");
  v4 = v3;
  -[PLBatteryBreakdownNotificationInfo activeEnergy](self, "activeEnergy");
  v6 = v4 + v5;
  -[PLBatteryBreakdownNotificationInfo displayEnergy](self, "displayEnergy");
  return v6 + v7;
}

+ (double)representativeDisplayPower
{
  if (_MergedGlobals_110 != -1)
    dispatch_once(&_MergedGlobals_110, &__block_literal_global_50);
  return *(double *)&qword_1ED887138;
}

void __64__PLBatteryBreakdownNotificationInfo_representativeDisplayPower__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D80200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT AVG(%@) AS %@ FROM %@ WHERE %@=%@ AND %@>0 LIMIT %d"), *MEMORY[0x1E0D80200], *MEMORY[0x1E0D80200], CFSTR("%@"), *MEMORY[0x1E0D80208], CFSTR("%d"), *MEMORY[0x1E0D80200], 100);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0D801F8];
  objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", *MEMORY[0x1E0D80378], *MEMORY[0x1E0D801F8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v1, v3, 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "displayPower: running query %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entriesForKey:withQuery:", v3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12 / 1000.0;

  }
  else
  {
    v13 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", *MEMORY[0x1E0D80380], v2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v1, v14, 56);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v15;
    _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "dynamicDisplayPower: running query %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "storage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "entriesForKey:withQuery:", v14, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", v0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22 / 1000.0;

  }
  else
  {
    v23 = 0.0;
  }
  *(double *)&qword_1ED887138 = v13 + v23;

}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)isFirstParty
{
  return self->_isFirstParty;
}

- (void)setIsFirstParty:(BOOL)a3
{
  self->_isFirstParty = a3;
}

- (int)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(int)a3
{
  self->_notificationType = a3;
}

- (unint64_t)bgWakingCount
{
  return self->_bgWakingCount;
}

- (void)setBgWakingCount:(unint64_t)a3
{
  self->_bgWakingCount = a3;
}

- (double)bgWakingNSEDuration
{
  return self->_bgWakingNSEDuration;
}

- (void)setBgWakingNSEDuration:(double)a3
{
  self->_bgWakingNSEDuration = a3;
}

- (unint64_t)fgWakingCount
{
  return self->_fgWakingCount;
}

- (void)setFgWakingCount:(unint64_t)a3
{
  self->_fgWakingCount = a3;
}

- (double)fgWakingNSEDuration
{
  return self->_fgWakingNSEDuration;
}

- (void)setFgWakingNSEDuration:(double)a3
{
  self->_fgWakingNSEDuration = a3;
}

- (unint64_t)nonWakingCount
{
  return self->_nonWakingCount;
}

- (void)setNonWakingCount:(unint64_t)a3
{
  self->_nonWakingCount = a3;
}

- (double)nonWakingNSEDuration
{
  return self->_nonWakingNSEDuration;
}

- (void)setNonWakingNSEDuration:(double)a3
{
  self->_nonWakingNSEDuration = a3;
}

- (unint64_t)localCount
{
  return self->_localCount;
}

- (void)setLocalCount:(unint64_t)a3
{
  self->_localCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
