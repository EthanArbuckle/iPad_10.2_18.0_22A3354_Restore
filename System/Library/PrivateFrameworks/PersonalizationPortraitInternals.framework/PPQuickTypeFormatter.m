@implementation PPQuickTypeFormatter

- (id)makeShortEventFormatter
{
  PPQuickTypeFormatter *v2;
  NSDateFormatter *shortEventFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  void *v6;
  void *v7;
  id v8;
  NSDateFormatter *v9;
  NSDateFormatter *v10;

  v2 = self;
  objc_sync_enter(v2);
  shortEventFormatter = v2->_shortEventFormatter;
  if (shortEventFormatter)
  {
    v4 = shortEventFormatter;
  }
  else
  {
    v5 = (NSDateFormatter *)objc_opt_new();
    -[NSDateFormatter setLocale:](v5, "setLocale:", v2->_locale);
    -[PPQuickTypeFormatter _dateFormatForTemplate:]((uint64_t)v2, CFSTR("jmm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setDateFormat:](v5, "setDateFormat:", v6);

    v7 = (void *)objc_opt_new();
    v8 = -[NSDateFormatter stringFromDate:](v5, "stringFromDate:", v7);

    v9 = v2->_shortEventFormatter;
    v2->_shortEventFormatter = v5;
    v10 = v5;

    v4 = v2->_shortEventFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)makeLongEventFormatter
{
  PPQuickTypeFormatter *v2;
  NSDateFormatter *longEventFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  void *v6;
  void *v7;
  id v8;
  NSDateFormatter *v9;
  NSDateFormatter *v10;

  v2 = self;
  objc_sync_enter(v2);
  longEventFormatter = v2->_longEventFormatter;
  if (longEventFormatter)
  {
    v4 = longEventFormatter;
  }
  else
  {
    v5 = (NSDateFormatter *)objc_opt_new();
    -[NSDateFormatter setLocale:](v5, "setLocale:", v2->_locale);
    -[PPQuickTypeFormatter _dateFormatForTemplate:]((uint64_t)v2, CFSTR("eeejmm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setDateFormat:](v5, "setDateFormat:", v6);

    v7 = (void *)objc_opt_new();
    v8 = -[NSDateFormatter stringFromDate:](v5, "stringFromDate:", v7);

    v9 = v2->_longEventFormatter;
    v2->_longEventFormatter = v5;
    v10 = v5;

    v4 = v2->_longEventFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)makeYearlessChineseBirthdayFormatter
{
  PPQuickTypeFormatter *v2;
  NSDateFormatter *yearlessChineseBirthdayFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSDateFormatter *v15;
  NSDateFormatter *v16;

  v2 = self;
  objc_sync_enter(v2);
  yearlessChineseBirthdayFormatter = v2->_yearlessChineseBirthdayFormatter;
  if (yearlessChineseBirthdayFormatter)
  {
    v4 = yearlessChineseBirthdayFormatter;
  }
  else
  {
    v5 = (NSDateFormatter *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v5, "setTimeZone:", v6);

    v7 = *MEMORY[0x1E0C996A0];
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996A0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v5, "setCalendar:", v8);

    objc_msgSend(getIntlUtilityClass(), "localeForCalendarID:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v5, "setLocale:", v9);

    -[NSDateFormatter setDateStyle:](v5, "setDateStyle:", 3);
    -[NSDateFormatter setTimeStyle:](v5, "setTimeStyle:", 0);
    v10 = (void *)MEMORY[0x1E0CB3578];
    -[NSDateFormatter locale](v5, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateFormatFromTemplate:options:locale:", CFSTR("MMMMd"), 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setDateFormat:](v5, "setDateFormat:", v12);

    v13 = (void *)objc_opt_new();
    v14 = -[NSDateFormatter stringFromDate:](v5, "stringFromDate:", v13);

    v15 = v2->_yearlessChineseBirthdayFormatter;
    v2->_yearlessChineseBirthdayFormatter = v5;
    v16 = v5;

    v4 = v2->_yearlessChineseBirthdayFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)makeChineseBirthdayFormatter
{
  PPQuickTypeFormatter *v2;
  NSDateFormatter *chineseBirthdayFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSDateFormatter *v12;
  NSDateFormatter *v13;

  v2 = self;
  objc_sync_enter(v2);
  chineseBirthdayFormatter = v2->_chineseBirthdayFormatter;
  if (chineseBirthdayFormatter)
  {
    v4 = chineseBirthdayFormatter;
  }
  else
  {
    v5 = (NSDateFormatter *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v5, "setTimeZone:", v6);

    v7 = *MEMORY[0x1E0C996A0];
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996A0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v5, "setCalendar:", v8);

    objc_msgSend(getIntlUtilityClass(), "localeForCalendarID:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v5, "setLocale:", v9);

    -[NSDateFormatter setDateStyle:](v5, "setDateStyle:", 3);
    -[NSDateFormatter setTimeStyle:](v5, "setTimeStyle:", 0);
    v10 = (void *)objc_opt_new();
    v11 = -[NSDateFormatter stringFromDate:](v5, "stringFromDate:", v10);

    v12 = v2->_chineseBirthdayFormatter;
    v2->_chineseBirthdayFormatter = v5;
    v13 = v5;

    v4 = v2->_chineseBirthdayFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)makeBirthdayFormatter
{
  PPQuickTypeFormatter *v2;
  NSDateFormatter *birthdayFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSDateFormatter *v11;
  NSDateFormatter *v12;

  v2 = self;
  objc_sync_enter(v2);
  birthdayFormatter = v2->_birthdayFormatter;
  if (birthdayFormatter)
  {
    v4 = birthdayFormatter;
  }
  else
  {
    v5 = (NSDateFormatter *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v5, "setTimeZone:", v6);

    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v5, "setCalendar:", v7);

    -[NSDateFormatter setLocale:](v5, "setLocale:", v2->_locale);
    -[PPQuickTypeFormatter _dateFormatForTemplate:]((uint64_t)v2, CFSTR("MMMMd"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setDateFormat:](v5, "setDateFormat:", v8);

    v9 = (void *)objc_opt_new();
    v10 = -[NSDateFormatter stringFromDate:](v5, "stringFromDate:", v9);

    v11 = v2->_birthdayFormatter;
    v2->_birthdayFormatter = v5;
    v12 = v5;

    v4 = v2->_birthdayFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)formattedBirthday:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id IntlUtilityClass;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PPQuickTypeFormatter *v33;
  void *v34;
  PPQuickTypeFormatter *v35;
  void *v36;
  int v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pp_quicktype_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v38 = 138412290;
    v39 = v4;
    _os_log_debug_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEBUG, "formatting birthday: %@", (uint8_t *)&v38, 0xCu);
  }

  objc_msgSend(v4, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calendarIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C996C8]);

  if (v8)
  {
    pp_quicktype_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v38) = 0;
      _os_log_debug_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEBUG, "using gregorian formatter", (uint8_t *)&v38, 2u);
    }

    -[PPQuickTypeFormatter makeBirthdayFormatter](self, "makeBirthdayFormatter");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v18 = (void *)v10;
    goto LABEL_19;
  }
  objc_msgSend(v4, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "calendarIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C996A0]);

  if (v13)
  {
    v14 = -[PPQuickTypeFormatter _isYearlessComponents:]((uint64_t)self, v4);
    pp_quicktype_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      if (v16)
      {
        LOWORD(v38) = 0;
        _os_log_debug_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEBUG, "using yearless chinese formatter", (uint8_t *)&v38, 2u);
      }

      -[PPQuickTypeFormatter makeYearlessChineseBirthdayFormatter](self, "makeYearlessChineseBirthdayFormatter");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v16)
      {
        LOWORD(v38) = 0;
        _os_log_debug_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEBUG, "using chinese formatter", (uint8_t *)&v38, 2u);
      }

      -[PPQuickTypeFormatter makeChineseBirthdayFormatter](self, "makeChineseBirthdayFormatter");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_18;
  }
  pp_quicktype_log_handle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v38) = 0;
    _os_log_debug_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEBUG, "configuring a new formatter", (uint8_t *)&v38, 2u);
  }

  v18 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTimeZone:", v19);

  objc_msgSend(v4, "calendar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCalendar:", v20);

  IntlUtilityClass = getIntlUtilityClass();
  objc_msgSend(v4, "calendar");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "calendarIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(IntlUtilityClass, "localeForCalendarID:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLocale:", v24);

  -[PPQuickTypeFormatter _dateFormatForTemplate:]((uint64_t)self, CFSTR("MMMMd"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDateFormat:", v25);

LABEL_19:
  objc_msgSend(v4, "calendar");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (self)
  {
    v28 = v4;
    v29 = (void *)objc_msgSend(v27, "copy");

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTimeZone:", v30);

    v31 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v31, "setHour:", 12);
    objc_msgSend(v31, "setMinute:", 0);
    objc_msgSend(v31, "setSecond:", 0);
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTimeZone:", v32);

    objc_msgSend(v31, "setCalendar:", v29);
    if (-[PPQuickTypeFormatter _isYearlessComponents:]((uint64_t)self, v31))
    {
      objc_msgSend(getIntlUtilityClass(), "setYearlessYear:forCalendar:", v31, v29);
      objc_msgSend(v29, "dateFromComponents:", v31);
      self = (PPQuickTypeFormatter *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v31, "date");
      v33 = (PPQuickTypeFormatter *)objc_claimAutoreleasedReturnValue();
      self = v33;
      if (v29 && v33)
      {
        objc_msgSend(v29, "components:fromDate:", 2097182, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "dateFromComponents:", v34);
        v35 = (PPQuickTypeFormatter *)objc_claimAutoreleasedReturnValue();

        self = v35;
      }
    }

  }
  else
  {
    v29 = v26;
  }

  if (self)
  {
    objc_msgSend(v18, "stringFromDate:", self);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (id)formattedEventTime:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pp_quicktype_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_debug_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEBUG, "formatting event time: %@", (uint8_t *)&v11, 0xCu);
  }

  PPNextMidnight();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "compare:", v6);

  if (v7 == 1)
    -[PPQuickTypeFormatter makeLongEventFormatter](self, "makeLongEventFormatter");
  else
    -[PPQuickTypeFormatter makeShortEventFormatter](self, "makeShortEventFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromDate:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)formattedStringForLabel:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PPQuickTypeFormatter formattedStringsForLabels:](self, "formattedStringsForLabels:", v6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)formattedStringsForLabels:(id)a3
{
  id v4;
  uint64_t v5;
  _PASCachedResult *cachedContactsLabeledValuesLprojs;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[5];

  v4 = a3;
  if (formattedStringsForLabels__onceToken != -1)
    dispatch_once(&formattedStringsForLabels__onceToken, &__block_literal_global_47);
  v5 = MEMORY[0x1E0C809B0];
  cachedContactsLabeledValuesLprojs = self->_cachedContactsLabeledValuesLprojs;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __50__PPQuickTypeFormatter_formattedStringsForLabels___block_invoke_2;
  v23[3] = &unk_1E7E198E8;
  v23[4] = self;
  -[_PASCachedResult resultNonnullWithBlock:](cachedContactsLabeledValuesLprojs, "resultNonnullWithBlock:", v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__11599;
  v21 = __Block_byref_object_dispose__11600;
  v22 = 0;
  v8 = (void *)formattedStringsForLabels__lprojAndLabelToLocalizedStringCache;
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __50__PPQuickTypeFormatter_formattedStringsForLabels___block_invoke_3;
  v13[3] = &unk_1E7E19938;
  v16 = &v17;
  v9 = v4;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  objc_msgSend(v8, "runWithLockAcquired:", v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)localizedAppNameForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSString *fallbackLanguage;
  void *v9;
  id v11;
  _QWORD v12[2];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSCache objectForKey:](self->_appNameCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v11 = 0;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v11);
    v7 = v11;
    if (v6)
    {
      fallbackLanguage = self->_fallbackLanguage;
      v12[0] = self->_desiredLanguage;
      v12[1] = fallbackLanguage;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject localizedNameWithPreferredLocalizations:](v6, "localizedNameWithPreferredLocalizations:", v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        -[NSCache setObject:forKey:](self->_appNameCache, "setObject:forKey:", v5, v4);
    }
    else
    {
      pp_quicktype_log_handle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v4;
        v15 = 2112;
        v16 = v7;
        _os_log_error_impl(&dword_1C392E000, v6, OS_LOG_TYPE_ERROR, "PPQuickTypeFormatter: Failed to get application record for %@: %@", buf, 0x16u);
      }
      v5 = 0;
    }

  }
  return v5;
}

- (id)makeMeasurementWholeFormatter
{
  PPQuickTypeFormatter *v2;
  NSMeasurementFormatter *measurementWholeFormatter;
  NSMeasurementFormatter *v4;
  NSMeasurementFormatter *v5;
  void *v6;
  NSMeasurementFormatter *v7;
  NSMeasurementFormatter *v8;

  v2 = self;
  objc_sync_enter(v2);
  measurementWholeFormatter = v2->_measurementWholeFormatter;
  if (measurementWholeFormatter)
  {
    v4 = measurementWholeFormatter;
  }
  else
  {
    v5 = (NSMeasurementFormatter *)objc_opt_new();
    -[NSMeasurementFormatter setLocale:](v5, "setLocale:", v2->_locale);
    -[NSMeasurementFormatter setUnitOptions:](v5, "setUnitOptions:", 3);
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setMaximumFractionDigits:", 0);
    objc_msgSend(v6, "setMinimumFractionDigits:", 0);
    objc_msgSend(v6, "setMinimumIntegerDigits:", 1);
    -[NSMeasurementFormatter setNumberFormatter:](v5, "setNumberFormatter:", v6);
    v7 = v2->_measurementWholeFormatter;
    v2->_measurementWholeFormatter = v5;
    v8 = v5;

    v4 = v2->_measurementWholeFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)makeMeasurementDecimalFormatter
{
  PPQuickTypeFormatter *v2;
  NSMeasurementFormatter *measurementDecimalFormatter;
  NSMeasurementFormatter *v4;
  NSMeasurementFormatter *v5;
  void *v6;
  NSMeasurementFormatter *v7;
  NSMeasurementFormatter *v8;

  v2 = self;
  objc_sync_enter(v2);
  measurementDecimalFormatter = v2->_measurementDecimalFormatter;
  if (measurementDecimalFormatter)
  {
    v4 = measurementDecimalFormatter;
  }
  else
  {
    v5 = (NSMeasurementFormatter *)objc_opt_new();
    -[NSMeasurementFormatter setLocale:](v5, "setLocale:", v2->_locale);
    -[NSMeasurementFormatter setUnitOptions:](v5, "setUnitOptions:", 3);
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setMaximumFractionDigits:", 1);
    objc_msgSend(v6, "setMinimumFractionDigits:", 1);
    objc_msgSend(v6, "setMinimumIntegerDigits:", 1);
    -[NSMeasurementFormatter setNumberFormatter:](v5, "setNumberFormatter:", v6);
    v7 = v2->_measurementDecimalFormatter;
    v2->_measurementDecimalFormatter = v5;
    v8 = v5;

    v4 = v2->_measurementDecimalFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)makeMeasurementUnscaledFormatter
{
  PPQuickTypeFormatter *v2;
  NSMeasurementFormatter *measurementUnscaledFormatter;
  NSMeasurementFormatter *v4;
  NSMeasurementFormatter *v5;
  void *v6;
  NSMeasurementFormatter *v7;
  NSMeasurementFormatter *v8;

  v2 = self;
  objc_sync_enter(v2);
  measurementUnscaledFormatter = v2->_measurementUnscaledFormatter;
  if (measurementUnscaledFormatter)
  {
    v4 = measurementUnscaledFormatter;
  }
  else
  {
    v5 = (NSMeasurementFormatter *)objc_opt_new();
    -[NSMeasurementFormatter setLocale:](v5, "setLocale:", v2->_locale);
    -[NSMeasurementFormatter setUnitOptions:](v5, "setUnitOptions:", 1);
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setMaximumFractionDigits:", 0);
    objc_msgSend(v6, "setMinimumFractionDigits:", 0);
    objc_msgSend(v6, "setMinimumIntegerDigits:", 1);
    -[NSMeasurementFormatter setNumberFormatter:](v5, "setNumberFormatter:", v6);
    v7 = v2->_measurementUnscaledFormatter;
    v2->_measurementUnscaledFormatter = v5;
    v8 = v5;

    v4 = v2->_measurementUnscaledFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)formattedMeasurement:(id)a3 allowDecimals:(BOOL)a4 scaleUnits:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v6)
  {
    -[PPQuickTypeFormatter makeMeasurementDecimalFormatter](self, "makeMeasurementDecimalFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
      -[PPQuickTypeFormatter makeMeasurementWholeFormatter](self, "makeMeasurementWholeFormatter");
    else
      -[PPQuickTypeFormatter makeMeasurementUnscaledFormatter](self, "makeMeasurementUnscaledFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_msgSend(v9, "stringFromMeasurement:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)makeLengthFormatter
{
  PPQuickTypeFormatter *v2;
  NSLengthFormatter *lengthFormatter;
  NSLengthFormatter *v4;
  NSLengthFormatter *v5;
  void *v6;
  NSLengthFormatter *v7;
  NSLengthFormatter *v8;

  v2 = self;
  objc_sync_enter(v2);
  lengthFormatter = v2->_lengthFormatter;
  if (lengthFormatter)
  {
    v4 = lengthFormatter;
  }
  else
  {
    v5 = (NSLengthFormatter *)objc_opt_new();
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setMaximumFractionDigits:", 1);
    -[NSLengthFormatter setNumberFormatter:](v5, "setNumberFormatter:", v6);
    v7 = v2->_lengthFormatter;
    v2->_lengthFormatter = v5;
    v8 = v5;

    v4 = v2->_lengthFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)formattedLengthInMeters:(double)a3
{
  void *v4;
  void *v5;

  -[PPQuickTypeFormatter makeLengthFormatter](self, "makeLengthFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromMeters:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)formattedPostalAddress:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x1E0D26EC8];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "toCNPostalAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLocale languageCode](self->_locale, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLocale countryCode](self->_locale, "countryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithCNPostalAddress:language:country:phoneticLocale:", v7, v8, v9, self->_desiredLanguage);

  objc_msgSend(v10, "fullAddressNoCurrentCountryWithMultiline:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)makeDateComponentFormatter
{
  PPQuickTypeFormatter *v2;
  NSDateComponentsFormatter *dateComponentFormatter;
  NSDateComponentsFormatter *v4;
  NSDateComponentsFormatter *v5;
  void *v6;
  NSDateComponentsFormatter *v7;
  NSDateComponentsFormatter *v8;

  v2 = self;
  objc_sync_enter(v2);
  dateComponentFormatter = v2->_dateComponentFormatter;
  if (dateComponentFormatter)
  {
    v4 = dateComponentFormatter;
  }
  else
  {
    v5 = (NSDateComponentsFormatter *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLocale:", v2->_locale);
    -[NSDateComponentsFormatter setCalendar:](v5, "setCalendar:", v6);
    -[NSDateComponentsFormatter setUnitsStyle:](v5, "setUnitsStyle:", 5);
    -[NSDateComponentsFormatter setAllowedUnits:](v5, "setAllowedUnits:", 96);
    v7 = v2->_dateComponentFormatter;
    v2->_dateComponentFormatter = v5;
    v8 = v5;

    v4 = v2->_dateComponentFormatter;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)formattedTimeInterval:(double)a3
{
  void *v4;
  void *v5;

  -[PPQuickTypeFormatter makeDateComponentFormatter](self, "makeDateComponentFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromTimeInterval:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)navigationItemLabelForTypeLabel:(id)a3 destination:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    _PASValidatedFormat(v6, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPQuickTypeFormatter itemLabelForBundleId:typeLabel:](self, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PPQuickTypeFormatter destinationLabel](self, "destinationLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _PASValidatedFormat(v6, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPQuickTypeFormatter itemLabelForBundleId:typeLabel:](self, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)attributionPattern
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;

  -[PPQuickTypeFormatter _localizedStringForKey:](self, CFSTR("%@ (%@ App)"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.proactive.PersonalizationPortraitInternals"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%@ (%@ App)"), &stru_1E7E221D0, CFSTR("Localizable"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = CFSTR("%@ (%@ App)");
    }

  }
  return v3;
}

- (id)etaLabel
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;

  -[PPQuickTypeFormatter _localizedStringForKey:](self, CFSTR("arrival at %@"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.proactive.PersonalizationPortraitInternals"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.proactive.PersonalizationPortraitInternals"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("arrival at %@"), &stru_1E7E221D0, CFSTR("Localizable"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = CFSTR("arrival at %@");
    }

  }
  return v3;
}

- (id)destinationLabel
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;

  -[PPQuickTypeFormatter _localizedStringForKey:](self, CFSTR("destination"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.proactive.PersonalizationPortraitInternals"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.proactive.PersonalizationPortraitInternals"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("destination"), &stru_1E7E221D0, CFSTR("Localizable"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = CFSTR("destination");
    }

  }
  return v3;
}

- (id)distanceLabel
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;

  -[PPQuickTypeFormatter _localizedStringForKey:](self, CFSTR("distance to %@"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.proactive.PersonalizationPortraitInternals"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.proactive.PersonalizationPortraitInternals"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("distance to %@"), &stru_1E7E221D0, CFSTR("Localizable"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = CFSTR("distance to %@");
    }

  }
  return v3;
}

- (id)streetLabel
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;

  -[PPQuickTypeFormatter _localizedStringForKey:](self, CFSTR("street"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.proactive.PersonalizationPortraitInternals"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.proactive.PersonalizationPortraitInternals"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("street"), &stru_1E7E221D0, CFSTR("Localizable"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = CFSTR("street");
    }

  }
  return v3;
}

- (id)timeLeftLabel
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;

  -[PPQuickTypeFormatter _localizedStringForKey:](self, CFSTR("time to %@"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.proactive.PersonalizationPortraitInternals"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.proactive.PersonalizationPortraitInternals"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("time to %@"), &stru_1E7E221D0, CFSTR("Localizable"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = CFSTR("time to %@");
    }

  }
  return v3;
}

- (id)inviteLinkLabel
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;

  -[PPQuickTypeFormatter _localizedStringForKey:](self, CFSTR("FaceTime Invitation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.proactive.PersonalizationPortraitInternals"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.proactive.PersonalizationPortraitInternals"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FaceTime Invitation"), &stru_1E7E221D0, CFSTR("Localizable"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = CFSTR("FaceTime Invitation");
    }

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedContactsLabeledValuesLprojs, 0);
  objc_storeStrong((id *)&self->_localizedStringsCache, 0);
  objc_storeStrong((id *)&self->_dateComponentFormatter, 0);
  objc_storeStrong((id *)&self->_lengthFormatter, 0);
  objc_storeStrong((id *)&self->_measurementUnscaledFormatter, 0);
  objc_storeStrong((id *)&self->_measurementDecimalFormatter, 0);
  objc_storeStrong((id *)&self->_measurementWholeFormatter, 0);
  objc_storeStrong((id *)&self->_appNameCache, 0);
  objc_storeStrong((id *)&self->_dateFormatCache, 0);
  objc_storeStrong((id *)&self->_longEventFormatter, 0);
  objc_storeStrong((id *)&self->_shortEventFormatter, 0);
  objc_storeStrong((id *)&self->_yearlessChineseBirthdayFormatter, 0);
  objc_storeStrong((id *)&self->_chineseBirthdayFormatter, 0);
  objc_storeStrong((id *)&self->_birthdayFormatter, 0);
  objc_storeStrong((id *)&self->_fallbackLanguage, 0);
  objc_storeStrong((id *)&self->_desiredLanguage, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

- (_QWORD)_localizedStringForKey:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  uint64_t *v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__11599;
    v16 = __Block_byref_object_dispose__11600;
    v17 = 0;
    v5 = (void *)a1[17];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__PPQuickTypeFormatter__localizedStringForKey___block_invoke;
    v7[3] = &unk_1E7E19960;
    v10 = &v12;
    v11 = sel__localizedStringForKey_;
    v8 = v3;
    v9 = a1;
    objc_msgSend(v5, "runWithLockAcquired:", v7);
    a1 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }

  return a1;
}

void __47__PPQuickTypeFormatter__localizedStringForKey___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[2];
  uint8_t buf[4];
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", a1[4]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  else if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[5], CFSTR("PPQuickTypeFormatter.m"), 729, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[result isKindOfClass:[NSString class]]"));

    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.proactive.PersonalizationPortraitInternals"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(v10, "localizations");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = a1[5];
      v16 = *(_QWORD *)(v14 + 24);
      v15 = *(_QWORD *)(v14 + 32);
      v38[0] = v16;
      v38[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "preferredLocalizationsFromArray:forPreferences:", v13, v17);
      v18 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject count](v18, "count"))
      {
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v19 = v18;
        v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v20)
        {
          v21 = v20;
          v32 = v18;
          v22 = *(_QWORD *)v34;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v34 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              v25 = (void *)MEMORY[0x1C3BD6630]();
              objc_msgSend(v11, "localizedStringForKey:value:table:localization:", a1[4], 0, 0, v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v26;
              if (v26 && (objc_msgSend(v26, "isEqual:", a1[4]) & 1) == 0)
              {

                objc_autoreleasePoolPop(v25);
                goto LABEL_24;
              }

              objc_autoreleasePoolPop(v25);
            }
            v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
            if (v21)
              continue;
            break;
          }
          v27 = v4;
LABEL_24:
          v18 = v32;
        }
        else
        {
          v27 = v4;
        }

        objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, a1[4]);
        v30 = *(_QWORD *)(a1[6] + 8);
        v4 = v27;
        v28 = *(NSObject **)(v30 + 40);
        *(_QWORD *)(v30 + 40) = v4;
      }
      else
      {
        pp_quicktype_log_handle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = *(const __CFString **)(a1[5] + 24);
          *(_DWORD *)buf = 138412290;
          v40 = v29;
          _os_log_impl(&dword_1C392E000, v28, OS_LOG_TYPE_DEFAULT, "Could not determine localizations for %@", buf, 0xCu);
        }
      }

    }
    else
    {
      pp_quicktype_log_handle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v40 = CFSTR("com.apple.proactive.PersonalizationPortraitInternals");
        _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "Could not load bundle for %@", buf, 0xCu);
      }
    }

  }
}

- (id)itemLabelForBundleId:(void *)a1 typeLabel:(void *)a2
{
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("com.apple.Maps");
  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1, "localizedAppNameForBundleIdentifier:", CFSTR("com.apple.Maps"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attributionPattern");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    if (v7)
    {
      _PASValidatedFormat(v7, CFSTR("%@%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v5);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      pp_quicktype_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v20 = CFSTR("com.apple.Maps");
        v21 = 2112;
        v22 = v5;
        _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "Formatter failed to get label pattern for bundle: %@ label: %@", buf, 0x16u);
      }

      v15 = v5;
    }
    v17 = v15;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

id __50__PPQuickTypeFormatter_formattedStringsForLabels___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend((id)formattedStringsForLabels__cnBundle, "localizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v4 + 24);
  v5 = *(_QWORD *)(v4 + 32);
  v10[0] = v6;
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizationsFromArray:forPreferences:", v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __50__PPQuickTypeFormatter_formattedStringsForLabels___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__PPQuickTypeFormatter_formattedStringsForLabels___block_invoke_4;
  v9[3] = &unk_1E7E19910;
  v4 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = v3;
  v8 = v3;
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v9);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

id __50__PPQuickTypeFormatter_formattedStringsForLabels___block_invoke_4(uint64_t a1, void *a2)
{
  __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __CFString *v19;
  NSObject *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (-[__CFString hasPrefix:](v3, "hasPrefix:", CFSTR("_$!<"))
    && (-[__CFString hasSuffix:](v3, "hasSuffix:", CFSTR(">!$_")) & 1) != 0)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = *(id *)(a1 + 32);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v24 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v9 = (void *)MEMORY[0x1C3BD6630]();
          objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v8, v3);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            objc_msgSend((id)formattedStringsForLabels__cnBundle, "localizedStringForKey:value:table:localization:", v3, 0, formattedStringsForLabels__table, v8);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12;
            if (v12 && (objc_msgSend(v12, "isEqual:", v3) & 1) == 0)
            {
              v14 = v13;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v14 = (id)objc_claimAutoreleasedReturnValue();
            }
            v11 = v14;
            if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= 0x800)
            {
              pp_quicktype_log_handle();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "clearing formattedStringsForLabels cache due to size", buf, 2u);
              }

              objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
            }
            v16 = (void *)objc_msgSend(v11, "copy");
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v16, v10);

          }
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11 != v17)
          {
            pp_quicktype_log_handle();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v28 = CFSTR("cache miss");
              v29 = 2112;
              v30 = v3;
              v31 = 2112;
              v32 = v11;
              _os_log_debug_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEBUG, "(%@) localized label: %@ -> %@", buf, 0x20u);
            }

            objc_autoreleasePoolPop(v9);
            goto LABEL_26;
          }

          objc_autoreleasePoolPop(v9);
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
        if (v5)
          continue;
        break;
      }
    }

    pp_quicktype_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v28 = v3;
      _os_log_debug_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEBUG, "no localized label available for %{private}@ -- must be either a custom label, or localizations not available", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C97338], "localizedStringForLabel:", v3);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = v3;
  }
  v11 = v19;
LABEL_26:

  return v11;
}

void __50__PPQuickTypeFormatter_formattedStringsForLabels___block_invoke()
{
  uint64_t v0;
  void *v1;
  objc_class *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)formattedStringsForLabels__cnBundle;
  formattedStringsForLabels__cnBundle = v0;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)formattedStringsForLabels__table;
  formattedStringsForLabels__table = v3;

  v5 = objc_alloc(MEMORY[0x1E0D815F0]);
  v8 = (id)objc_opt_new();
  v6 = objc_msgSend(v5, "initWithGuardedData:", v8);
  v7 = (void *)formattedStringsForLabels__lprojAndLabelToLocalizedStringCache;
  formattedStringsForLabels__lprojAndLabelToLocalizedStringCache = v6;

}

- (uint64_t)_isYearlessComponents:(uint64_t)a1
{
  id v3;
  void *v4;
  id IntlUtilityClass;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (objc_msgSend(v3, "year") == 0x7FFFFFFFFFFFFFFFLL)
    {
      a1 = 1;
    }
    else
    {
      objc_msgSend(v4, "calendar");
      a1 = objc_claimAutoreleasedReturnValue();

      if (a1)
      {
        IntlUtilityClass = getIntlUtilityClass();
        objc_msgSend(v4, "calendar");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        a1 = objc_msgSend(IntlUtilityClass, "isYearlessDate:forCalendar:", v4, v6);

      }
    }
  }

  return a1;
}

- (id)_dateFormatForTemplate:(uint64_t)a1
{
  id v3;
  void *v4;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 80), "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", v3, 0, *(_QWORD *)(a1 + 16));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        objc_msgSend(*(id *)(a1 + 80), "setObject:forKey:", v4, v3);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)formatterWithQuery:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD aBlock[4];
  id v15;
  id v16;
  void **v17;
  void *v18;
  void **v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  v24[0] = CFSTR("locale");
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, v24, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

  }
  if (formatterWithQuery___pasOnceToken4 != -1)
    dispatch_once(&formatterWithQuery___pasOnceToken4, &__block_literal_global_11684);
  v8 = (id)formatterWithQuery___pasExprOnceResult;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__11599;
  v22 = __Block_byref_object_dispose__11600;
  v23 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[2] = __43__PPQuickTypeFormatter_formatterWithQuery___block_invoke_24;
  aBlock[3] = &unk_1E7E19938;
  aBlock[1] = 3221225472;
  v9 = v7;
  v15 = v9;
  v10 = v4;
  v16 = v10;
  v17 = &v18;
  v11 = _Block_copy(aBlock);

  objc_msgSend(v8, "runWithLockAcquired:", v11);
  v12 = v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __43__PPQuickTypeFormatter_formatterWithQuery___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D815E0]);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__PPQuickTypeFormatter_formatterWithQuery___block_invoke_2;
    v9[3] = &unk_1E7E198A0;
    v10 = *(id *)(a1 + 40);
    v4 = (void *)objc_msgSend(v5, "initWithBlock:", v9);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(v4, "result");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

PPQuickTypeFormatter *__43__PPQuickTypeFormatter_formatterWithQuery___block_invoke_2(uint64_t a1)
{
  PPQuickTypeFormatter *v2;
  void *v3;
  id v4;
  PPQuickTypeFormatter *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *desiredLanguage;
  uint64_t v14;
  NSString *fallbackLanguage;
  uint64_t v16;
  NSCache *dateFormatCache;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  NSCache *appNameCache;
  id v23;
  void *v24;
  uint64_t v25;
  _PASLock *localizedStringsCache;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  _PASCachedResult *cachedContactsLabeledValuesLprojs;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _QWORD v46[8];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = [PPQuickTypeFormatter alloc];
  v3 = *(void **)(a1 + 32);
  v4 = v3;
  if (v2)
  {
    v45.receiver = v2;
    v45.super_class = (Class)PPQuickTypeFormatter;
    v5 = (PPQuickTypeFormatter *)objc_msgSendSuper2(&v45, sel_init);
    v2 = v5;
    if (v5)
    {
      objc_storeStrong((id *)&v5->_query, v3);
      objc_msgSend(v4, "localeIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = (void *)MEMORY[0x1E0C99DC8];
        objc_msgSend(v4, "localeIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localeWithLocaleIdentifier:", v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v6)
        v11 = v6;
      else
        v11 = (void *)v9;
      objc_storeStrong((id *)&v2->_locale, v11);
      -[NSLocale localeIdentifier](v2->_locale, "localeIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();
      desiredLanguage = v2->_desiredLanguage;
      v2->_desiredLanguage = (NSString *)v12;

      objc_msgSend(v10, "localeIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();
      fallbackLanguage = v2->_fallbackLanguage;
      v2->_fallbackLanguage = (NSString *)v14;

      v16 = objc_opt_new();
      dateFormatCache = v2->_dateFormatCache;
      v2->_dateFormatCache = (NSCache *)v16;

      -[NSCache setCountLimit:](v2->_dateFormatCache, "setCountLimit:", 4);
      v18 = -[PPQuickTypeFormatter _dateFormatForTemplate:]((uint64_t)v2, CFSTR("MMMMd"));
      v19 = -[PPQuickTypeFormatter _dateFormatForTemplate:]((uint64_t)v2, CFSTR("jmm"));
      v20 = -[PPQuickTypeFormatter _dateFormatForTemplate:]((uint64_t)v2, CFSTR("eeejmm"));
      v21 = objc_opt_new();
      appNameCache = v2->_appNameCache;
      v2->_appNameCache = (NSCache *)v21;

      -[NSCache setCountLimit:](v2->_appNameCache, "setCountLimit:", 1);
      v23 = objc_alloc(MEMORY[0x1E0D815F0]);
      v24 = (void *)objc_opt_new();
      v25 = objc_msgSend(v23, "initWithGuardedData:", v24);
      localizedStringsCache = v2->_localizedStringsCache;
      v2->_localizedStringsCache = (_PASLock *)v25;

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v27 = objc_msgSend(&unk_1E7E5B5A8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v42;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v42 != v29)
              objc_enumerationMutation(&unk_1E7E5B5A8);
            v31 = -[PPQuickTypeFormatter _localizedStringForKey:](v2, *(void **)(*((_QWORD *)&v41 + 1) + 8 * v30++));
          }
          while (v28 != v30);
          v28 = objc_msgSend(&unk_1E7E5B5A8, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        }
        while (v28);
      }
      v32 = objc_opt_new();
      cachedContactsLabeledValuesLprojs = v2->_cachedContactsLabeledValuesLprojs;
      v2->_cachedContactsLabeledValuesLprojs = (_PASCachedResult *)v32;

      v34 = *MEMORY[0x1E0C97070];
      v46[0] = *MEMORY[0x1E0C96FF8];
      v46[1] = v34;
      v35 = *MEMORY[0x1E0C97020];
      v46[2] = *MEMORY[0x1E0C97028];
      v46[3] = v35;
      v36 = *MEMORY[0x1E0C97050];
      v46[4] = *MEMORY[0x1E0C97010];
      v46[5] = v36;
      v37 = *MEMORY[0x1E0C97000];
      v46[6] = *MEMORY[0x1E0C97038];
      v46[7] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 8);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[PPQuickTypeFormatter formattedStringsForLabels:](v2, "formattedStringsForLabels:", v38);

    }
  }

  return v2;
}

void __43__PPQuickTypeFormatter_formatterWithQuery___block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_alloc(MEMORY[0x1E0D815F0]);
  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v1, "initWithGuardedData:", v2);
  v4 = (void *)formatterWithQuery___pasExprOnceResult;
  formatterWithQuery___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

@end
