@implementation PFImageMetadataBuilder

- (PFImageMetadataBuilder)init
{
  PFImageMetadataBuilder *v2;
  uint64_t v3;
  NSMutableDictionary *iptcMutableDictionary;
  uint64_t v5;
  NSMutableDictionary *exifMutableDictionary;
  uint64_t v7;
  NSMutableDictionary *tiffMutableDictionary;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PFImageMetadataBuilder;
  v2 = -[PFMetadataBuilder init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    iptcMutableDictionary = v2->_iptcMutableDictionary;
    v2->_iptcMutableDictionary = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    exifMutableDictionary = v2->_exifMutableDictionary;
    v2->_exifMutableDictionary = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    tiffMutableDictionary = v2->_tiffMutableDictionary;
    v2->_tiffMutableDictionary = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (void)setCreationDate:(id)a3 timeZone:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFImageMetadataBuilder;
  -[PFMetadataBuilder setCreationDate:timeZone:](&v5, sel_setCreationDate_timeZone_, a3, a4);
  -[PFImageMetadataBuilder _updateCreationDate](self, "_updateCreationDate");
}

- (void)_updateCreationDate
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
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend((id)objc_opt_class(), "iptcDateFormatter");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "iptcTimeFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadataBuilder creationTimeZone](self, "creationTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadataBuilder creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTimeZone:", v4);
  objc_msgSend(v3, "setTimeZone:", v4);
  -[PFImageMetadataBuilder iptcMutableDictionary](self, "iptcMutableDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringFromDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CBCED0]);

  v18 = v3;
  objc_msgSend(v3, "stringFromDate:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v6;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CBCF20]);

  objc_msgSend((id)objc_opt_class(), "_exifDateTimeFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_exifSubsecTimeFormatter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_exifTimeZoneOffsetFormatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v4);
  objc_msgSend(v10, "setTimeZone:", v4);
  objc_msgSend(v11, "setTimeZone:", v4);
  -[PFImageMetadataBuilder exifMutableDictionary](self, "exifMutableDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringFromDate:", v5);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "secondsFromGMT"))
  {

    v15 = CFSTR("+00:00");
  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CBCB40]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CBCCA0]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CBCC20]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CBCB38]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CBCC98]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CBCC18]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CBCC90]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CBCC10]);
  -[PFImageMetadataBuilder tiffMutableDictionary](self, "tiffMutableDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CBD088]);

}

- (void)setTitle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v8.receiver = self;
  v8.super_class = (Class)PFImageMetadataBuilder;
  -[PFMetadataBuilder setTitle:](&v8, sel_setTitle_, v4);

  v7.receiver = self;
  v7.super_class = (Class)PFImageMetadataBuilder;
  -[PFMetadataBuilder title](&v7, sel_title);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFImageMetadataBuilder iptcMutableDictionary](self, "iptcMutableDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CBCF18]);

}

- (void)setCaption:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v8.receiver = self;
  v8.super_class = (Class)PFImageMetadataBuilder;
  -[PFMetadataBuilder setCaption:](&v8, sel_setCaption_, v4);

  v7.receiver = self;
  v7.super_class = (Class)PFImageMetadataBuilder;
  -[PFMetadataBuilder caption](&v7, sel_caption);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFImageMetadataBuilder iptcMutableDictionary](self, "iptcMutableDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CBCEB8]);

}

- (void)setKeywords:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v8.receiver = self;
  v8.super_class = (Class)PFImageMetadataBuilder;
  -[PFMetadataBuilder setKeywords:](&v8, sel_setKeywords_, v4);

  v7.receiver = self;
  v7.super_class = (Class)PFImageMetadataBuilder;
  -[PFMetadataBuilder keywords](&v7, sel_keywords);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFImageMetadataBuilder iptcMutableDictionary](self, "iptcMutableDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CBCF10]);

}

- (void)setAccessibilityDescription:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v8.receiver = self;
  v8.super_class = (Class)PFImageMetadataBuilder;
  -[PFMetadataBuilder setAccessibilityDescription:](&v8, sel_setAccessibilityDescription_, v4);

  v7.receiver = self;
  v7.super_class = (Class)PFImageMetadataBuilder;
  -[PFMetadataBuilder accessibilityDescription](&v7, sel_accessibilityDescription);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFImageMetadataBuilder iptcMutableDictionary](self, "iptcMutableDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CBCEF0]);

}

- (void)setPeopleNames:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v8.receiver = self;
  v8.super_class = (Class)PFImageMetadataBuilder;
  -[PFMetadataBuilder setPeopleNames:](&v8, sel_setPeopleNames_, v4);

  v7.receiver = self;
  v7.super_class = (Class)PFImageMetadataBuilder;
  -[PFMetadataBuilder peopleNames](&v7, sel_peopleNames);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFImageMetadataBuilder iptcMutableDictionary](self, "iptcMutableDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CBCF00]);

}

- (NSDictionary)iptcDictionary
{
  void *v2;
  void *v3;

  -[PFImageMetadataBuilder iptcMutableDictionary](self, "iptcMutableDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (NSDictionary)exifDictionary
{
  void *v2;
  void *v3;

  -[PFImageMetadataBuilder exifMutableDictionary](self, "exifMutableDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (NSDictionary)tiffDictionary
{
  void *v2;
  void *v3;

  -[PFImageMetadataBuilder tiffMutableDictionary](self, "tiffMutableDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (NSMutableDictionary)iptcMutableDictionary
{
  return self->_iptcMutableDictionary;
}

- (void)setIptcMutableDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_iptcMutableDictionary, a3);
}

- (NSMutableDictionary)exifMutableDictionary
{
  return self->_exifMutableDictionary;
}

- (void)setExifMutableDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_exifMutableDictionary, a3);
}

- (NSMutableDictionary)tiffMutableDictionary
{
  return self->_tiffMutableDictionary;
}

- (void)setTiffMutableDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_tiffMutableDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiffMutableDictionary, 0);
  objc_storeStrong((id *)&self->_exifMutableDictionary, 0);
  objc_storeStrong((id *)&self->_iptcMutableDictionary, 0);
}

+ (id)iptcDateFormatter
{
  if (iptcDateFormatter_onceToken[0] != -1)
    dispatch_once(iptcDateFormatter_onceToken, &__block_literal_global_126);
  return (id)iptcDateFormatter_iptcDateFormatter;
}

+ (id)iptcTimeFormatter
{
  if (iptcTimeFormatter_onceToken[0] != -1)
    dispatch_once(iptcTimeFormatter_onceToken, &__block_literal_global_128);
  return (id)iptcTimeFormatter_iptcDateFormatter;
}

+ (id)_exifDateTimeFormatter
{
  if (_exifDateTimeFormatter_onceToken[0] != -1)
    dispatch_once(_exifDateTimeFormatter_onceToken, &__block_literal_global_129);
  return (id)_exifDateTimeFormatter_dateTimeFormatter;
}

+ (id)_exifSubsecTimeFormatter
{
  if (_exifSubsecTimeFormatter_onceToken != -1)
    dispatch_once(&_exifSubsecTimeFormatter_onceToken, &__block_literal_global_139);
  return (id)_exifSubsecTimeFormatter_subsecTimeFormatter;
}

+ (id)_exifTimeZoneOffsetFormatter
{
  if (_exifTimeZoneOffsetFormatter_onceToken[0] != -1)
    dispatch_once(_exifTimeZoneOffsetFormatter_onceToken, &__block_literal_global_142);
  return (id)_exifTimeZoneOffsetFormatter_exifTimeZoneOffsetFormatter;
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
  block[2] = __43__PFImageMetadataBuilder__gpsTimeFormatter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_gpsTimeFormatter_onceToken != -1)
    dispatch_once(&_gpsTimeFormatter_onceToken, block);
  return (id)_gpsTimeFormatter_timeFormatter;
}

+ (id)_gpsDateFormatter
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PFImageMetadataBuilder__gpsDateFormatter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_gpsDateFormatter_onceToken != -1)
    dispatch_once(&_gpsDateFormatter_onceToken, block);
  return (id)_gpsDateFormatter_dateFormatter;
}

uint64_t __43__PFImageMetadataBuilder__gpsDateFormatter__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_dateFormatterTemplate");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_gpsDateFormatter_dateFormatter;
  _gpsDateFormatter_dateFormatter = v1;

  return objc_msgSend((id)_gpsDateFormatter_dateFormatter, "setDateFormat:", CFSTR("yyyy:MM:dd"));
}

uint64_t __43__PFImageMetadataBuilder__gpsTimeFormatter__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_dateFormatterTemplate");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_gpsTimeFormatter_timeFormatter;
  _gpsTimeFormatter_timeFormatter = v1;

  return objc_msgSend((id)_gpsTimeFormatter_timeFormatter, "setDateFormat:", CFSTR("HH:mm:ss.SS"));
}

uint64_t __54__PFImageMetadataBuilder__exifTimeZoneOffsetFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v1 = (void *)_exifTimeZoneOffsetFormatter_exifTimeZoneOffsetFormatter;
  _exifTimeZoneOffsetFormatter_exifTimeZoneOffsetFormatter = (uint64_t)v0;

  return objc_msgSend((id)_exifTimeZoneOffsetFormatter_exifTimeZoneOffsetFormatter, "setFormatOptions:", 1088);
}

void __50__PFImageMetadataBuilder__exifSubsecTimeFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_exifSubsecTimeFormatter_subsecTimeFormatter;
  _exifSubsecTimeFormatter_subsecTimeFormatter = (uint64_t)v0;

  objc_msgSend((id)_exifSubsecTimeFormatter_subsecTimeFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)_exifSubsecTimeFormatter_subsecTimeFormatter, "setDateStyle:", 0);
  objc_msgSend((id)_exifSubsecTimeFormatter_subsecTimeFormatter, "setDateFormat:", CFSTR("SSS"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_exifSubsecTimeFormatter_subsecTimeFormatter, "setLocale:", v2);

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", CFSTR("en_US"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_exifSubsecTimeFormatter_subsecTimeFormatter, "setCalendar:", v3);

}

void __48__PFImageMetadataBuilder__exifDateTimeFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_exifDateTimeFormatter_dateTimeFormatter;
  _exifDateTimeFormatter_dateTimeFormatter = (uint64_t)v0;

  objc_msgSend((id)_exifDateTimeFormatter_dateTimeFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)_exifDateTimeFormatter_dateTimeFormatter, "setDateStyle:", 0);
  objc_msgSend((id)_exifDateTimeFormatter_dateTimeFormatter, "setDateFormat:", CFSTR("yyyy:MM:dd HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_exifDateTimeFormatter_dateTimeFormatter, "setLocale:", v2);

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", CFSTR("en_US"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_exifDateTimeFormatter_dateTimeFormatter, "setCalendar:", v3);

}

uint64_t __43__PFImageMetadataBuilder_iptcTimeFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v1 = (void *)iptcTimeFormatter_iptcDateFormatter;
  iptcTimeFormatter_iptcDateFormatter = (uint64_t)v0;

  return objc_msgSend((id)iptcTimeFormatter_iptcDateFormatter, "setFormatOptions:", 96);
}

uint64_t __43__PFImageMetadataBuilder_iptcDateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v1 = (void *)iptcDateFormatter_iptcDateFormatter;
  iptcDateFormatter_iptcDateFormatter = (uint64_t)v0;

  return objc_msgSend((id)iptcDateFormatter_iptcDateFormatter, "setFormatOptions:", 275);
}

@end
