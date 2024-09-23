@implementation NFReaderModeCardIngestionCALogger

+ (void)postAnalyticsReaderModeCardIngestionSession:(id)a3 prepOnly:(BOOL)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  double v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;

  v5 = a3;
  if (v5)
  {
    v48 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("state"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)qword_1ECFF6AF8;
      qword_1ECFF6AF8 = v8;

    }
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("spStatus"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("spStatus"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)qword_1ECFF6AD8;
      qword_1ECFF6AD8 = v12;

    }
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("sessionStatus"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v15 = objc_opt_isKindOfClass();

    if ((v15 & 1) != 0)
    {
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("sessionStatus"));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)qword_1ECFF6AE0;
      qword_1ECFF6AE0 = v16;

    }
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("cardValidationStatus"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v19 = objc_opt_isKindOfClass();

    if ((v19 & 1) != 0)
    {
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("cardValidationStatus"));
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)qword_1ECFF6AE8;
      qword_1ECFF6AE8 = v20;

    }
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("technology"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = objc_opt_isKindOfClass();

    if ((v23 & 1) != 0)
    {
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("technology"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)qword_1ECFF6AF0;
      qword_1ECFF6AF0 = v24;

    }
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("sessionStartTime"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v27 = objc_opt_isKindOfClass();

    if ((v27 & 1) != 0)
    {
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("sessionStartTime"));
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)_MergedGlobals_6;
      _MergedGlobals_6 = v28;

    }
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("sessionEndTime"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v31 = objc_opt_isKindOfClass();

    if ((v31 & 1) != 0)
    {
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("sessionEndTime"));
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)qword_1ECFF6AD0;
      qword_1ECFF6AD0 = v32;

    }
    v5 = v48;
    if (!a4)
    {
      v34 = 0;
      if (_MergedGlobals_6 && qword_1ECFF6AD0)
      {
        objc_msgSend((id)qword_1ECFF6AD0, "timeIntervalSinceDate:");
        v34 = (unint64_t)(v35 * 1000.0);
      }
      v36 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, CFSTR("duration"));

      v38 = +[NFCALogger getBatteryPercent](NFCALogger, "getBatteryPercent");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v39, CFSTR("currentBatteryLevel"));

      if (qword_1ECFF6AF8)
        objc_msgSend(v36, "setObject:forKeyedSubscript:", qword_1ECFF6AF8, CFSTR("state"));
      if (qword_1ECFF6AD8)
        objc_msgSend(v36, "setObject:forKeyedSubscript:", qword_1ECFF6AD8, CFSTR("spStatus"));
      if (qword_1ECFF6AE0)
        objc_msgSend(v36, "setObject:forKeyedSubscript:", qword_1ECFF6AE0, CFSTR("sessionStatus"));
      if (qword_1ECFF6AE8)
        objc_msgSend(v36, "setObject:forKeyedSubscript:", qword_1ECFF6AE8, CFSTR("cardValidationStatus"));
      if (qword_1ECFF6AF0)
        objc_msgSend(v36, "setObject:forKeyedSubscript:", qword_1ECFF6AF0, CFSTR("technology"));
      +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.cardIngestionSessionStateChangeEvent"), v36);

      v41 = (void *)_MergedGlobals_6;
      _MergedGlobals_6 = 0;

      v42 = (void *)qword_1ECFF6AD0;
      qword_1ECFF6AD0 = 0;

      v43 = (void *)qword_1ECFF6AD8;
      qword_1ECFF6AD8 = 0;

      v44 = (void *)qword_1ECFF6AE0;
      qword_1ECFF6AE0 = 0;

      v45 = (void *)qword_1ECFF6AE8;
      qword_1ECFF6AE8 = 0;

      v46 = (void *)qword_1ECFF6AF0;
      qword_1ECFF6AF0 = 0;

      v47 = (void *)qword_1ECFF6AF8;
      qword_1ECFF6AF8 = 0;

      v5 = v48;
    }
  }

}

@end
