@implementation SUAutoInstallForecast

- (SUAutoInstallForecast)init
{
  SUAutoInstallForecast *v2;
  SUAutoInstallForecast *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUAutoInstallForecast;
  v2 = -[SUAutoInstallForecast init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SUAutoInstallForecast setUnlockStartDate:](v2, "setUnlockStartDate:", 0);
    -[SUAutoInstallForecast setUnlockEndDate:](v3, "setUnlockEndDate:", 0);
    -[SUAutoInstallForecast setSuStartDate:](v3, "setSuStartDate:", 0);
    -[SUAutoInstallForecast setSuEndDate:](v3, "setSuEndDate:", 0);
    -[SUAutoInstallForecast setFirstUnlock:](v3, "setFirstUnlock:", 0);
  }
  return v3;
}

- (int64_t)scheduleType
{
  void *v2;
  int64_t v3;

  -[SUAutoInstallForecast _forecastDateCache](self, "_forecastDateCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scheduleType");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  const __CFString *v13;
  void *v14;
  void *v16;
  void *v17;

  v16 = (void *)MEMORY[0x24BDD17C8];
  -[SUAutoInstallForecast unlockStartDate](self, "unlockStartDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUAutoInstallForecast unlockEndDate](self, "unlockEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUAutoInstallForecast suStartDate](self, "suStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUAutoInstallForecast suEndDate](self, "suEndDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUAutoInstallForecast firstUnlock](self, "firstUnlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SUAutoInstallForecast scheduleType](self, "scheduleType");
  if ((unint64_t)(v12 - 1) > 2)
    v13 = CFSTR("Unknown");
  else
    v13 = off_24CE3E320[v12 - 1];
  objc_msgSend(v16, "stringWithFormat:", CFSTR("AutoInstallForecast <%p> :\n            unlockStart = %@\n            unlockEnd = %@\n            suStart = %@\n            suEnd = %@\n            firstUnlock = %@\n            _scheduleType = %@\n"), self, v3, v5, v7, v9, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  SUAutoInstallForecast *v4;
  SUAutoInstallForecast *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;

  v4 = (SUAutoInstallForecast *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SUAutoInstallForecast unlockStartDate](self, "unlockStartDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUAutoInstallForecast unlockStartDate](v5, "unlockStartDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToDate:", v7))
      {
        -[SUAutoInstallForecast unlockEndDate](self, "unlockEndDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUAutoInstallForecast unlockEndDate](v5, "unlockEndDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToDate:", v9))
        {
          -[SUAutoInstallForecast suStartDate](self, "suStartDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUAutoInstallForecast suStartDate](v5, "suStartDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToDate:", v11))
          {
            -[SUAutoInstallForecast suEndDate](self, "suEndDate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUAutoInstallForecast suEndDate](v5, "suEndDate");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v15, "isEqualToDate:", v12);

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)_calendar
{
  void *v2;
  void *v3;

  -[SUAutoInstallForecast _forecastDateCache](self, "_forecastDateCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_isForecastLogicallyExpired
{
  SUAutoInstallForecast *v2;
  void *v3;

  v2 = self;
  -[SUAutoInstallForecast suStartDate](self, "suStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[SUAutoInstallForecast _isDateExpired:](v2, "_isDateExpired:", v3);

  return (char)v2;
}

- (BOOL)_isForecastExpired
{
  SUAutoInstallForecast *v2;
  void *v3;

  v2 = self;
  -[SUAutoInstallForecast suEndDate](self, "suEndDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[SUAutoInstallForecast _isDateExpired:](v2, "_isDateExpired:", v3);

  return (char)v2;
}

- (id)_roundedStartTime
{
  void *v2;
  void *v3;

  -[SUAutoInstallForecast _forecastDateCache](self, "_forecastDateCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "roundedStartTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_roundedEndTime
{
  void *v2;
  void *v3;

  -[SUAutoInstallForecast _forecastDateCache](self, "_forecastDateCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "roundedEndTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_forecastDateCache
{
  _SUAutoInstallForecastDateCache *lazy_forecastDateCache;
  _SUAutoInstallForecastDateCache *v4;
  _SUAutoInstallForecastDateCache *v5;

  lazy_forecastDateCache = self->_lazy_forecastDateCache;
  if (!lazy_forecastDateCache)
  {
    v4 = -[_SUAutoInstallForecastDateCache initWithForecast:]([_SUAutoInstallForecastDateCache alloc], "initWithForecast:", self);
    v5 = self->_lazy_forecastDateCache;
    self->_lazy_forecastDateCache = v4;

    lazy_forecastDateCache = self->_lazy_forecastDateCache;
  }
  return lazy_forecastDateCache;
}

- (BOOL)_isDateExpired:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "laterDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

+ (id)createForecast
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  SUAutoInstallForecast *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  SUAutoInstallForecast *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  double v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;

  v2 = objc_alloc_init(MEMORY[0x24BE1AFD8]);
  objc_msgSend(v2, "getUnlockAndSoftwareUpdateTimes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE1B168]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  if (v4)
  {
    objc_msgSend(v4, "dateByAddingTimeInterval:", -7200.0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE1B158]);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        SULogInfo(CFSTR("Duet failed to return kCDSleepAutoSuExpirationTimeKey"), v16, v17, v18, v19, v20, v21, v22, v111);
        goto LABEL_8;
      }
      v23 = (void *)v15;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "laterDate:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25 != v23)
      {
        SULogInfo(CFSTR("unlock end date has already passed"), v26, v27, v28, v29, v30, v31, v32, v111);

LABEL_8:
        v33 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v123 = v23;
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      specificTimeOnDate(v34, 2, 0, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      specificTimeOnDate(v34, 4, 0, 0);
      v36 = objc_claimAutoreleasedReturnValue();
      specificTimeOnDate(v34, 5, 0, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "dateByAddingTimeInterval:", 86400.0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "dateByAddingTimeInterval:", 86400.0);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v34, "compare:", v35);
      v122 = v35;
      v41 = v35;
      v42 = v37;
      if (v40 != -1)
      {
        v43 = objc_msgSend(v34, "compare:", v36);
        if (v43 == -1)
          v41 = v34;
        else
          v41 = v38;
        if (v43 == -1)
          v42 = v37;
        else
          v42 = (void *)v39;
      }
      v124 = (void *)v39;
      v119 = v34;
      v120 = v37;
      v121 = (void *)v36;
      v44 = v41;
      v45 = v42;
      objc_msgSend(v45, "dateByAddingTimeInterval:", 86400.0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v44);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v46);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("suStartDate = %@, suEndDate = %@"), v48, v49, v50, v51, v52, v53, v54, (uint64_t)v47);

      v55 = objc_alloc_init(SUAutoInstallForecast);
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("unrestricted_sleep_end"));
      v56 = objc_claimAutoreleasedReturnValue();
      if (v56)
        -[SUAutoInstallForecast setFirstUnlock:](v55, "setFirstUnlock:", v56);
      v117 = (void *)v56;
      if (MGGetBoolAnswer())
      {
        +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "autoSUStartDelta");
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (v58)
        {
          +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "autoSUStartDelta");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = (double)(unint64_t)(60 * objc_msgSend(v60, "unsignedIntegerValue"));

          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v61);
          v62 = objc_claimAutoreleasedReturnValue();

          +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v62);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          SULogInfo(CFSTR("Overriding suStartDate with time interval: %f : %@"), v63, v64, v65, v66, v67, v68, v69, *(uint64_t *)&v61);

          v44 = (id)v62;
        }
        +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "autoSUEndDelta");
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        if (v71)
        {
          +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "autoSUEndDelta");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = (double)(unint64_t)(60 * objc_msgSend(v73, "unsignedIntegerValue"));

          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v74);
          v75 = objc_claimAutoreleasedReturnValue();

          +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v75);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          SULogInfo(CFSTR("Overriding suEndDate with time interval: %f : %@"), v76, v77, v78, v79, v80, v81, v82, *(uint64_t *)&v74);

          v46 = (void *)v75;
        }
        +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "autoSUUnlockStartDelta");
        v84 = (void *)objc_claimAutoreleasedReturnValue();

        v118 = v46;
        if (v84)
        {
          +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "autoSUUnlockStartDelta");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = (double)(unint64_t)(60 * objc_msgSend(v86, "unsignedIntegerValue"));

          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v87);
          v88 = objc_claimAutoreleasedReturnValue();

          +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v88);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          SULogInfo(CFSTR("Overriding unlockStartDate with time interval: %f : %@"), v89, v90, v91, v92, v93, v94, v95, *(uint64_t *)&v87);

          v14 = (void *)v88;
        }
        v96 = v44;
        +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "autoSUUnlockEndDelta");
        v98 = (void *)objc_claimAutoreleasedReturnValue();

        if (v98)
        {
          +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "autoSUUnlockEndDelta");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = (double)(unint64_t)(60 * objc_msgSend(v100, "unsignedIntegerValue"));

          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();

          +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v102);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          SULogInfo(CFSTR("Overriding unlockEndDate with time interval: %f : %@"), v103, v104, v105, v106, v107, v108, v109, *(uint64_t *)&v101);

LABEL_29:
          -[SUAutoInstallForecast setUnlockStartDate:](v55, "setUnlockStartDate:", v14);
          -[SUAutoInstallForecast setUnlockEndDate:](v55, "setUnlockEndDate:", v102);
          -[SUAutoInstallForecast setSuStartDate:](v55, "setSuStartDate:", v96);
          -[SUAutoInstallForecast setSuEndDate:](v55, "setSuEndDate:", v118);
          v33 = v55;

          goto LABEL_30;
        }
      }
      else
      {
        v118 = v46;
        v96 = v44;
      }
      v102 = v123;
      goto LABEL_29;
    }
  }
  SULogInfo(CFSTR("Duet failed to return kCDSleepAutoSuUnlockKey"), v5, v6, v7, v8, v9, v10, v11, v111);
  v33 = 0;
LABEL_31:

  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUAutoInstallForecast)initWithCoder:(id)a3
{
  id v4;
  SUAutoInstallForecast *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUAutoInstallForecast;
  v5 = -[SUAutoInstallForecast init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UnlockStart"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUAutoInstallForecast setUnlockStartDate:](v5, "setUnlockStartDate:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UnlockEnd"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUAutoInstallForecast setUnlockEndDate:](v5, "setUnlockEndDate:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SUStart"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUAutoInstallForecast setSuStartDate:](v5, "setSuStartDate:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SUEnd"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUAutoInstallForecast setSuEndDate:](v5, "setSuEndDate:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstUnlock"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUAutoInstallForecast setFirstUnlock:](v5, "setFirstUnlock:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[SUAutoInstallForecast unlockStartDate](self, "unlockStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UnlockStart"));

  -[SUAutoInstallForecast unlockEndDate](self, "unlockEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("UnlockEnd"));

  -[SUAutoInstallForecast suStartDate](self, "suStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("SUStart"));

  -[SUAutoInstallForecast suEndDate](self, "suEndDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("SUEnd"));

  -[SUAutoInstallForecast firstUnlock](self, "firstUnlock");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("firstUnlock"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  SUAutoInstallForecast *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init(SUAutoInstallForecast);
  -[SUAutoInstallForecast unlockStartDate](self, "unlockStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUAutoInstallForecast setUnlockStartDate:](v4, "setUnlockStartDate:", v5);

  -[SUAutoInstallForecast unlockEndDate](self, "unlockEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUAutoInstallForecast setUnlockEndDate:](v4, "setUnlockEndDate:", v6);

  -[SUAutoInstallForecast suStartDate](self, "suStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUAutoInstallForecast setSuStartDate:](v4, "setSuStartDate:", v7);

  -[SUAutoInstallForecast suEndDate](self, "suEndDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUAutoInstallForecast setSuEndDate:](v4, "setSuEndDate:", v8);

  -[SUAutoInstallForecast firstUnlock](self, "firstUnlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUAutoInstallForecast setFirstUnlock:](v4, "setFirstUnlock:", v9);

  return v4;
}

- (NSDate)unlockStartDate
{
  return self->_unlockStartDate;
}

- (void)setUnlockStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_unlockStartDate, a3);
}

- (NSDate)unlockEndDate
{
  return self->_unlockEndDate;
}

- (void)setUnlockEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_unlockEndDate, a3);
}

- (NSDate)suStartDate
{
  return self->_suStartDate;
}

- (void)setSuStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_suStartDate, a3);
}

- (NSDate)suEndDate
{
  return self->_suEndDate;
}

- (void)setSuEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_suEndDate, a3);
}

- (NSDate)firstUnlock
{
  return self->_firstUnlock;
}

- (void)setFirstUnlock:(id)a3
{
  objc_storeStrong((id *)&self->_firstUnlock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazy_forecastDateCache, 0);
  objc_storeStrong((id *)&self->_firstUnlock, 0);
  objc_storeStrong((id *)&self->_suEndDate, 0);
  objc_storeStrong((id *)&self->_suStartDate, 0);
  objc_storeStrong((id *)&self->_unlockEndDate, 0);
  objc_storeStrong((id *)&self->_unlockStartDate, 0);
}

@end
