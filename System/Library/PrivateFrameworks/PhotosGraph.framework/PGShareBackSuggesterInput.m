@implementation PGShareBackSuggesterInput

- (PGShareBackSuggesterInput)initWithDictionary:(id)a3
{
  id v4;
  PGShareBackSuggesterInput *v5;
  uint64_t v6;
  NSDate *creationDate;
  uint64_t v8;
  NSTimeZone *timeZone;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  double v17;
  uint64_t v18;
  NSString *localIdentifier;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PGShareBackSuggesterInput;
  v5 = -[PGShareBackSuggesterInput init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHSuggestedContributionsAssetsMetadataCreationDateKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHSuggestedContributionsAssetsMetadataTimeZoneKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHSuggestedContributionsAssetsMetadataLatitudeKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "doubleValue");
      v5->_latitude = v12;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHSuggestedContributionsAssetsMetadataLongitudeKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
    }
    else
    {
      v15 = MEMORY[0x1E0C9E500];
      v5->_latitude = *(double *)MEMORY[0x1E0C9E500];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHSuggestedContributionsAssetsMetadataLongitudeKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(double *)(v15 + 8);
    }
    v5->_longitude = v14;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHSuggestedContributionsAssetsMetadataHorizontalAccuracyKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v5->_horizontalAccuracy = v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PHSuggestedContributionsAssetsMetadataLocalIdentifierKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v18;

  }
  return v5;
}

- (CLLocation)location
{
  double v3;
  CLLocationDegrees v4;
  CLLocationDegrees v5;
  double latitude;
  double longitude;
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  CLLocationCoordinate2D v14;

  -[PGShareBackSuggesterInput latitude](self, "latitude");
  v4 = v3;
  -[PGShareBackSuggesterInput longitude](self, "longitude");
  v14 = CLLocationCoordinate2DMake(v4, v5);
  latitude = v14.latitude;
  longitude = v14.longitude;
  if (CLLocationCoordinate2DIsValid(v14))
  {
    v8 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    -[PGShareBackSuggesterInput horizontalAccuracy](self, "horizontalAccuracy");
    v10 = v9;
    -[PGShareBackSuggesterInput creationDate](self, "creationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v11, latitude, longitude, 0.0, v10, 0.0);

  }
  else
  {
    v12 = 0;
  }
  return (CLLocation *)v12;
}

- (NSDate)localCreationDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PGShareBackSuggesterInput creationDate](self, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGShareBackSuggesterInput timeZone](self, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D4B130], "localDateFromUniversalDate:inTimeZone:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PGShareBackSuggesterInput location](self, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(MEMORY[0x1E0D4B130], "localDateFromUniversalDate:atLocation:", v3, v6);
    else
      objc_msgSend(MEMORY[0x1E0D4B130], "localDateFromUniversalDate:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSDate *)v5;
}

- (PHAsset)asset
{
  return 0;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

+ (id)suggesterInputsWithDictionaries:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PGShareBackSuggesterInput *v11;
  PGShareBackSuggesterInput *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [PGShareBackSuggesterInput alloc];
        v12 = -[PGShareBackSuggesterInput initWithDictionary:](v11, "initWithDictionary:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)localDateIntervalForSuggesterInputs:(id)a3 withTimeIntervalPadding:(double)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (!v6)
  {
    v9 = 0;
    v8 = 0;
    goto LABEL_17;
  }
  v7 = v6;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "localCreationDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v9)
      {
        objc_msgSend(v9, "earlierDate:", v12);
        v14 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v14;
        if (v8)
          goto LABEL_8;
      }
      else
      {
        v9 = v12;
        if (v8)
        {
LABEL_8:
          objc_msgSend(v8, "laterDate:", v13);
          v15 = objc_claimAutoreleasedReturnValue();

          v8 = (id)v15;
          goto LABEL_11;
        }
      }
      v8 = v13;
LABEL_11:

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  }
  while (v7);
  if (v9 && v8)
  {
    objc_msgSend(v9, "dateByAddingTimeInterval:", -a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateByAddingTimeInterval:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v16, v17);

    goto LABEL_20;
  }
LABEL_17:
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "loggingConnection");
  v20 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "+[PGShareBackSuggesterInput localDateIntervalForSuggesterInputs:withTimeIntervalPadding:]";
    v28 = 2112;
    v29 = v5;
    _os_log_error_impl(&dword_1CA237000, v20, OS_LOG_TYPE_ERROR, "%s: Start or endDate nil for %@", buf, 0x16u);
  }

  v18 = objc_alloc_init(MEMORY[0x1E0CB3588]);
LABEL_20:

  return v18;
}

+ (id)universalDateIntervalForSuggesterInputs:(id)a3 withTimeIntervalPadding:(double)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (!v6)
  {
    v9 = 0;
    v8 = 0;
    goto LABEL_17;
  }
  v7 = v6;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "creationDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v9)
      {
        objc_msgSend(v9, "earlierDate:", v12);
        v14 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v14;
        if (v8)
          goto LABEL_8;
      }
      else
      {
        v9 = v12;
        if (v8)
        {
LABEL_8:
          objc_msgSend(v8, "laterDate:", v13);
          v15 = objc_claimAutoreleasedReturnValue();

          v8 = (id)v15;
          goto LABEL_11;
        }
      }
      v8 = v13;
LABEL_11:

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  }
  while (v7);
  if (v9 && v8)
  {
    objc_msgSend(v9, "dateByAddingTimeInterval:", -a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateByAddingTimeInterval:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v16, v17);

    goto LABEL_20;
  }
LABEL_17:
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "loggingConnection");
  v20 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "+[PGShareBackSuggesterInput universalDateIntervalForSuggesterInputs:withTimeIntervalPadding:]";
    v28 = 2112;
    v29 = v5;
    _os_log_error_impl(&dword_1CA237000, v20, OS_LOG_TYPE_ERROR, "%s: Start or endDate nil for %@", buf, 0x16u);
  }

  v18 = objc_alloc_init(MEMORY[0x1E0CB3588]);
LABEL_20:

  return v18;
}

@end
