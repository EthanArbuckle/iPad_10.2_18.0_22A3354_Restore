@implementation PFSharingUtilities

+ (id)addAccessibilityDescription:(id)a3 toAVMetadata:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138477827;
    v10 = v5;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Adding custom accessibility label to video: %{private}@", (uint8_t *)&v9, 0xCu);
  }
  +[PFSharingUtilities setString:forKey:inKeySpace:inAVMetadata:](PFSharingUtilities, "setString:forKey:inKeySpace:inAVMetadata:", v5, *MEMORY[0x1E0C8A878], *MEMORY[0x1E0C8A9D0], v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)addDescription:(id)a3 toAVMetadata:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138477827;
    v10 = v5;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Adding description label to video: %{private}@", (uint8_t *)&v9, 0xCu);
  }
  +[PFSharingUtilities setString:forKey:inKeySpace:inAVMetadata:](PFSharingUtilities, "setString:forKey:inKeySpace:inAVMetadata:", v5, *MEMORY[0x1E0C8A898], *MEMORY[0x1E0C8A9D0], v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)setString:(id)a3 forKey:(id)a4 inKeySpace:(id)a5 inAVMetadata:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412803;
    v24 = v11;
    v25 = 2112;
    v26 = v10;
    v27 = 2113;
    v28 = v9;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Setting '%@''s '%@' to '%{private}@' to video", buf, 0x20u);
  }
  v22 = v9;
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v12, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    v15 = 0;
    v16 = MEMORY[0x1E0C81028];
    do
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObject:", v17);

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412547;
        v24 = v10;
        v25 = 2113;
        v26 = v18;
        _os_log_impl(&dword_1A16EE000, v16, OS_LOG_TYPE_DEFAULT, "Removing existing metadata '%@': %{private}@", buf, 0x16u);

      }
      ++v15;
    }
    while (objc_msgSend(v14, "count") > v15);
  }
  objc_msgSend(MEMORY[0x1E0C8B278], "metadataItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setKeySpace:", v11);
  objc_msgSend(v19, "setKey:", v10);
  objc_msgSend(v19, "setValue:", v22);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLocale:", v20);

  objc_msgSend(v13, "addObject:", v19);
  return v13;
}

+ (id)addCustomDate:(id)a3 toAVMetadata:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v19 = v5;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Adding custom date to video: %{private}@", buf, 0xCu);
  }
  v17 = v5;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = *MEMORY[0x1E0C8A890];
  v9 = *MEMORY[0x1E0C8A9D0];
  objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v6, *MEMORY[0x1E0C8A890], *MEMORY[0x1E0C8A9D0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v11 = 0;
    v12 = MEMORY[0x1E0C81028];
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v13);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138477827;
        v19 = v14;
        _os_log_impl(&dword_1A16EE000, v12, OS_LOG_TYPE_DEFAULT, "Removing existing metadata creation date: %{private}@", buf, 0xCu);

      }
      ++v11;
    }
    while (objc_msgSend(v10, "count") > v11);
  }
  objc_msgSend(MEMORY[0x1E0C8B278], "metadataItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setKeySpace:", v9);
  objc_msgSend(v15, "setKey:", v8);
  objc_msgSend(v15, "setValue:", v17);
  objc_msgSend(v7, "addObject:", v15);

  return v7;
}

+ (id)addCustomLocation:(id)a3 toAVMetadata:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v21 = v5;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Adding custom location to video: %{private}@", buf, 0xCu);
  }
  v19 = v5;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = *MEMORY[0x1E0C8A8A0];
  v9 = *MEMORY[0x1E0C8A9D0];
  objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v6, *MEMORY[0x1E0C8A8A0], *MEMORY[0x1E0C8A9D0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v11 = 0;
    v12 = MEMORY[0x1E0C81028];
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v13);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138477827;
        v21 = v14;
        _os_log_impl(&dword_1A16EE000, v12, OS_LOG_TYPE_DEFAULT, "Removing existing metadata location: %{private}@", buf, 0xCu);

      }
      ++v11;
    }
    while (objc_msgSend(v10, "count") > v11);
  }
  objc_msgSend(v19, "iso6709Notation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B278], "metadataItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setKeySpace:", v9);
  objc_msgSend(v16, "setKey:", v8);
  objc_msgSend(v16, "setValue:", v15);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLocale:", v17);

  objc_msgSend(v7, "addObject:", v16);
  return v7;
}

+ (id)_dateFormatterTemplate
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", CFSTR("en_US"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCalendar:", v4);

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v5);

  return v2;
}

+ (id)_gpsTimeFormatter
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PFSharingUtilities__gpsTimeFormatter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_gpsTimeFormatter_onceToken_5058 != -1)
    dispatch_once(&_gpsTimeFormatter_onceToken_5058, block);
  return (id)_gpsTimeFormatter_timeFormatter_5059;
}

+ (id)_gpsDateFormatter
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PFSharingUtilities__gpsDateFormatter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_gpsDateFormatter_onceToken_5054 != -1)
    dispatch_once(&_gpsDateFormatter_onceToken_5054, block);
  return (id)_gpsDateFormatter_dateFormatter_5055;
}

+ (id)gpsDictionaryForLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  const __CFString *v10;
  double v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  CLLocationCoordinate2D v32;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "coordinate"), CLLocationCoordinate2DIsValid(v32)))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coordinate");
    v8 = v7;
    objc_msgSend(v5, "coordinate");
    if (v8 >= 0.0)
      v10 = CFSTR("N");
    else
      v10 = CFSTR("S");
    if (v8 < 0.0)
      v8 = -v8;
    v11 = -v9;
    if (v9 >= 0.0)
      v12 = CFSTR("E");
    else
      v12 = CFSTR("W");
    if (v9 >= 0.0)
      v11 = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CBCDA0]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CBCD90]);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CBCD98]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CBCDA8]);
    objc_msgSend(v5, "timestamp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(a1, "_gpsTimeFormatter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringFromDate:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CBCDE8]);
      objc_msgSend(a1, "_gpsDateFormatter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringFromDate:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0CBCD20]);
    }
    objc_msgSend(v5, "verticalAccuracy");
    if (v20 >= 0.0)
    {
      objc_msgSend(v5, "altitude");
      v22 = v21 < 0.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CBCD00]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CBCD08]);

    }
    objc_msgSend(v5, "horizontalAccuracy");
    if (v25 >= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CBCD78]);

    }
    objc_msgSend(v5, "speed");
    if (v27 >= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27 * 3.6);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0CBCDD0]);

      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("K"), *MEMORY[0x1E0CBCDD8]);
    }
    objc_msgSend(v5, "course");
    if (v29 >= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0CBCD80]);

      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("T"), *MEMORY[0x1E0CBCD88]);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_exifDateTimeFormatter
{
  if (_exifDateTimeFormatter_onceToken_5036 != -1)
    dispatch_once(&_exifDateTimeFormatter_onceToken_5036, &__block_literal_global_5037);
  return (id)_exifDateTimeFormatter_dateTimeFormatter_5038;
}

+ (id)_exifSubsecTimeFormatter
{
  if (_exifSubsecTimeFormatter_onceToken_5025 != -1)
    dispatch_once(&_exifSubsecTimeFormatter_onceToken_5025, &__block_literal_global_40);
  return (id)_exifSubsecTimeFormatter_subsecTimeFormatter_5026;
}

+ (id)exifDateTimeFromDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_exifDateTimeFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)exifSubsecTimeFromDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_exifSubsecTimeFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)addCreationDate:(id)a3 toExifDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = (void *)objc_msgSend(a4, "mutableCopy");
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)objc_opt_class(), "exifDateTimeFromDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "exifSubsecTimeFromDate:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CBCB40]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CBCCA0]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CBCB38]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CBCC98]);

  return v6;
}

+ (id)addCreationDate:(id)a3 toTIFFDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_msgSend(a4, "mutableCopy");
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)objc_opt_class(), "exifDateTimeFromDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CBD088]);
  return v6;
}

void __46__PFSharingUtilities__exifSubsecTimeFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_exifSubsecTimeFormatter_subsecTimeFormatter_5026;
  _exifSubsecTimeFormatter_subsecTimeFormatter_5026 = (uint64_t)v0;

  objc_msgSend((id)_exifSubsecTimeFormatter_subsecTimeFormatter_5026, "setTimeStyle:", 0);
  objc_msgSend((id)_exifSubsecTimeFormatter_subsecTimeFormatter_5026, "setDateStyle:", 0);
  objc_msgSend((id)_exifSubsecTimeFormatter_subsecTimeFormatter_5026, "setDateFormat:", CFSTR("SSS"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_exifSubsecTimeFormatter_subsecTimeFormatter_5026, "setLocale:", v2);

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", CFSTR("en_US"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_exifSubsecTimeFormatter_subsecTimeFormatter_5026, "setCalendar:", v3);

}

void __44__PFSharingUtilities__exifDateTimeFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_exifDateTimeFormatter_dateTimeFormatter_5038;
  _exifDateTimeFormatter_dateTimeFormatter_5038 = (uint64_t)v0;

  objc_msgSend((id)_exifDateTimeFormatter_dateTimeFormatter_5038, "setTimeStyle:", 0);
  objc_msgSend((id)_exifDateTimeFormatter_dateTimeFormatter_5038, "setDateStyle:", 0);
  objc_msgSend((id)_exifDateTimeFormatter_dateTimeFormatter_5038, "setDateFormat:", CFSTR("yyyy:MM:dd HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_exifDateTimeFormatter_dateTimeFormatter_5038, "setLocale:", v2);

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", CFSTR("en_US"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_exifDateTimeFormatter_dateTimeFormatter_5038, "setCalendar:", v3);

}

uint64_t __39__PFSharingUtilities__gpsDateFormatter__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_dateFormatterTemplate");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_gpsDateFormatter_dateFormatter_5055;
  _gpsDateFormatter_dateFormatter_5055 = v1;

  return objc_msgSend((id)_gpsDateFormatter_dateFormatter_5055, "setDateFormat:", CFSTR("yyyy:MM:dd"));
}

uint64_t __39__PFSharingUtilities__gpsTimeFormatter__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_dateFormatterTemplate");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_gpsTimeFormatter_timeFormatter_5059;
  _gpsTimeFormatter_timeFormatter_5059 = v1;

  return objc_msgSend((id)_gpsTimeFormatter_timeFormatter_5059, "setDateFormat:", CFSTR("HH:mm:ss.SS"));
}

@end
