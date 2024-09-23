@implementation PGGraphUserBehaviorEnrichmentProcessor

- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  OS_os_log *v19;
  OS_os_log *loggingConnection;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  mach_timebase_info v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint32_t denom;
  uint32_t numer;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint32_t v35;
  uint32_t v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  PGBehavioralScoreProcessor *v41;
  mach_timebase_info v42;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  double v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "enrichmentLoggingConnection");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = v12;
  v15 = v14;
  v16 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PGGraphUserBehaviorEnrichmentProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v17 = mach_absolute_time();
  v18 = objc_msgSend(v11, "isResumingFullAnalysis");

  if (v18 && +[PGUserDefaults isBehavioralCurationEnabled](PGUserDefaults, "isBehavioralCurationEnabled"))
  {
    v40 = v17;
    objc_msgSend(v9, "enrichmentLoggingConnection");
    v19 = (OS_os_log *)objc_claimAutoreleasedReturnValue();
    loggingConnection = self->_loggingConnection;
    self->_loggingConnection = v19;

    -[PGGraphUserBehaviorEnrichmentProcessor loggingConnection](self, "loggingConnection");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_signpost_id_generate(v21);
    v23 = v21;
    v24 = v23;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "UserBehaviorEnrichment", ", buf, 2u);
    }

    v42 = 0;
    mach_timebase_info(&v42);
    v39 = mach_absolute_time();
    v41 = -[PGBehavioralScoreProcessor initWithGraphManager:algorithm:]([PGBehavioralScoreProcessor alloc], "initWithGraphManager:algorithm:", v9, 1);
    -[PGBehavioralScoreProcessor processBehavioralScoresWithProgressBlock:](v41, "processBehavioralScoresWithProgressBlock:", v10);
    v25 = mach_absolute_time();
    v26 = v42;
    v27 = v24;
    v28 = v27;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v28, OS_SIGNPOST_INTERVAL_END, v22, "UserBehaviorEnrichment", ", buf, 2u);
    }

    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "UserBehaviorEnrichment";
      v46 = 2048;
      v47 = (float)((float)((float)((float)(v25 - v39) * (float)v26.numer) / (float)v26.denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v29 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v32 = v15;
    v33 = v32;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v33, OS_SIGNPOST_INTERVAL_END, v13, "PGGraphUserBehaviorEnrichmentProcessor", ", buf, 2u);
    }

    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "PGGraphUserBehaviorEnrichmentProcessor";
      v46 = 2048;
      v47 = (float)((float)((float)((float)(v29 - v40) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

  }
  else
  {
    v34 = mach_absolute_time();
    v36 = info.numer;
    v35 = info.denom;
    v37 = v15;
    v38 = v37;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v38, OS_SIGNPOST_INTERVAL_END, v13, "PGGraphUserBehaviorEnrichmentProcessor", ", buf, 2u);
    }

    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "PGGraphUserBehaviorEnrichmentProcessor";
      v46 = 2048;
      v47 = (float)((float)((float)((float)(v34 - v17) * (float)v36) / (float)v35) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v38, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }

}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

@end
