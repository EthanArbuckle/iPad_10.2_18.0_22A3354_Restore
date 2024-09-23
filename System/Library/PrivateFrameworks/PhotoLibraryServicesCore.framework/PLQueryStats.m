@implementation PLQueryStats

- (PLQueryStats)initWithContext:(id)a3
{
  id v6;
  PLQueryStats *v7;
  PLQueryStats *v8;
  uint64_t v9;
  NSSQLiteDatabaseStatistics *preStats;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLQueryStats.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PLQueryStats;
  v7 = -[PLQueryStats init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_context, a3);
    -[NSManagedObjectContext setTrackSQLiteDatabaseStatistics:](v8->_context, "setTrackSQLiteDatabaseStatistics:", 1);
    -[NSManagedObjectContext databaseStatistics](v8->_context, "databaseStatistics");
    v9 = objc_claimAutoreleasedReturnValue();
    preStats = v8->_preStats;
    v8->_preStats = (NSSQLiteDatabaseStatistics *)v9;

  }
  return v8;
}

- (id)stopRecordingDescriptionWithFetchCount:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  -[NSManagedObjectContext databaseStatistics](self->_context, "databaseStatistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObjectContext setTrackSQLiteDatabaseStatistics:](self->_context, "setTrackSQLiteDatabaseStatistics:", 1);
  objc_msgSend(v5, "databaseStatisticsBySubtracting:", self->_preStats);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLQueryStats byteCountFormatter](PLQueryStats, "byteCountFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromByteCount:", objc_msgSend(v6, "totalCachePages") * objc_msgSend(v6, "pageSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLQueryStats byteCountFormatter](PLQueryStats, "byteCountFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 < 1)
  {
    v11 = 0;
  }
  else
  {
    v10 = objc_msgSend(v6, "pageSize");
    v11 = (uint64_t)((double)(objc_msgSend(v6, "totalCachePages") * v10) / (double)a3);
  }
  objc_msgSend(v9, "stringFromByteCount:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Total I/O=%@, rows=%td [%@ / row]"), v8, a3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preStats, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

+ (id)startedQueryStatsWithContext:(id)a3
{
  id v4;
  PLQueryStats *v5;

  v4 = a3;
  if (v4 && objc_msgSend(a1, "allowedToTrack"))
    v5 = -[PLQueryStats initWithContext:]([PLQueryStats alloc], "initWithContext:", v4);
  else
    v5 = 0;

  return v5;
}

+ (BOOL)allowedToTrack
{
  int HasInternalDiagnostics;
  void *v3;
  char v4;

  HasInternalDiagnostics = PFOSVariantHasInternalDiagnostics();
  if (HasInternalDiagnostics)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("enableSQLStatisticTracking"));

    LOBYTE(HasInternalDiagnostics) = v4;
  }
  return HasInternalDiagnostics;
}

+ (id)byteCountFormatter
{
  if (byteCountFormatter_sOnceToken != -1)
    dispatch_once(&byteCountFormatter_sOnceToken, &__block_literal_global_1067);
  return (id)byteCountFormatter_sByteCountFormatter;
}

uint64_t __34__PLQueryStats_byteCountFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB34E8]);
  v1 = (void *)byteCountFormatter_sByteCountFormatter;
  byteCountFormatter_sByteCountFormatter = (uint64_t)v0;

  objc_msgSend((id)byteCountFormatter_sByteCountFormatter, "setCountStyle:", 3);
  return objc_msgSend((id)byteCountFormatter_sByteCountFormatter, "setAllowsNonnumericFormatting:", 0);
}

@end
