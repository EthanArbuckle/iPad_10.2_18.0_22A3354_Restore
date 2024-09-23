@implementation PGSensitiveLocationBlocklistConfiguration

- (PGSensitiveLocationBlocklistConfiguration)initWithConfigurationDictionary:(id)a3
{
  void *v4;
  PGDictionaryConfigurationSource *v5;
  void *v6;
  PGSensitiveLocationBlocklistConfiguration *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  +[PGSensitiveLocationBlocklistConfiguration resolveConfigurationDictionary:](PGSensitiveLocationBlocklistConfiguration, "resolveConfigurationDictionary:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGDictionaryConfigurationSource initWithDictionary:]([PGDictionaryConfigurationSource alloc], "initWithDictionary:", v4);
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PGSensitiveLocationBlocklistConfiguration;
  v7 = -[PGConfiguration initWithSources:version:](&v9, sel_initWithSources_version_, v6, 1.0);

  return v7;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)radius
{
  return self->_radius;
}

- (NSArray)sensitiveDateIntervals
{
  return self->_sensitiveDateIntervals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitiveDateIntervals, 0);
}

+ (id)resolveConfigurationDictionary:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("e"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGSensitiveLocationBlocklistConfiguration dateFormatter](PGSensitiveLocationBlocklistConfiguration, "dateFormatter");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v32 = v4;
    v33 = v3;
    v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v31 = v5;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v37 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("d"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("d"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            +[PGObfuscation plaintextDateFromObfuscatedString:usingDateFormatter:](PGObfuscation, "plaintextDateFromObfuscatedString:usingDateFormatter:", v13, v35);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("l"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("l"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            +[PGObfuscation plaintextDateFromObfuscatedString:usingDateFormatter:](PGObfuscation, "plaintextDateFromObfuscatedString:usingDateFormatter:", v15, v35);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12 && v16)
            {
              v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v12, v16);
              objc_msgSend(v34, "addObject:", v17);

            }
          }
          else
          {
            v16 = 0;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v8);
    }

    v4 = v32;
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v34, CFSTR("sensitiveDateIntervals"));

    v3 = v33;
    v5 = v31;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("n"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    +[PGObfuscation plaintextNumberFromObfuscatedString:](PGObfuscation, "plaintextNumberFromObfuscatedString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("latitude"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("latitude"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("c"));
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      +[PGObfuscation plaintextNumberFromObfuscatedString:](PGObfuscation, "plaintextNumberFromObfuscatedString:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("longitude"));

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("longitude"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("g"));
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        +[PGObfuscation plaintextNumberFromObfuscatedString:](PGObfuscation, "plaintextNumberFromObfuscatedString:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("radius"));

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("radius"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
        objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E84EB308, CFSTR("radius"));
      v27 = v4;

    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "loggingConnection");
      v24 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v3;
        _os_log_error_impl(&dword_1CA237000, v24, OS_LOG_TYPE_ERROR, "[PGSensitiveLocationBlocklistConfiguration] Error unobfuscating blocklist, couldn't find or unobfuscate required key longitude in entry. Entry is %@", buf, 0xCu);
      }
      v27 = 0;
    }

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "loggingConnection");
    v21 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v3;
      _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "[PGSensitiveLocationBlocklistConfiguration] Error unobfuscating blocklist, couldn't find or unobfuscate required key latitude in entry. Entry is %@", buf, 0xCu);
    }
    v27 = 0;
  }

  return v27;
}

+ (id)sensitiveLocationBlocklist
{
  PGRemoteConfiguration *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v9[16];

  v3 = objc_alloc_init(PGRemoteConfiguration);
  -[PGRemoteConfiguration dictionaryValueForKey:withFallbackValue:](v3, "dictionaryValueForKey:withFallbackValue:", CFSTR("com.apple.photos.memories.sbl"), MEMORY[0x1E0C9AA70]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggingConnection");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "[PGSenLoc] Couldn't load the senloc, falling back...", v9, 2u);
    }

    objc_msgSend(a1, "sensitiveLocationBlocklistLocal");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }

  return v4;
}

+ (id)sensitiveLocationBlocklistConfigurations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PGSensitiveLocationBlocklistConfiguration_sensitiveLocationBlocklistConfigurations__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sensitiveLocationBlocklistConfigurations_onceToken != -1)
    dispatch_once(&sensitiveLocationBlocklistConfigurations_onceToken, block);
  return (id)sensitiveLocationBlocklistConfigurations_locationBlocklistConfigurations;
}

+ (BOOL)isSensitiveLocation:(id)a3 duringDateInterval:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  CLLocationDegrees v16;
  CLLocationDegrees v17;
  CLLocationCoordinate2D v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  BOOL v23;
  char v24;
  BOOL v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    objc_msgSend(a3, "coordinate");
    v31 = v7;
    v32 = v8;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(a1, "sensitiveLocationBlocklistConfigurations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v14, "latitude");
          v16 = v15;
          objc_msgSend(v14, "longitude");
          v18 = CLLocationCoordinate2DMake(v16, v17);
          CLLocationCoordinate2DGetDistanceFrom();
          v20 = v19;
          objc_msgSend(v14, "sensitiveDateIntervals", *(_QWORD *)&v18.latitude, *(_QWORD *)&v18.longitude);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "radius");
          v23 = v20 <= v22 && v21 == 0;
          v24 = v23;
          if (!v23 && v20 <= v22)
            v24 = objc_msgSend(a1, "dateInterval:intersectsSensitiveDateIntervals:", v6, v21);

          if ((v24 & 1) != 0)
          {
            v25 = 1;
            goto LABEL_21;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        if (v11)
          continue;
        break;
      }
    }
    v25 = 0;
LABEL_21:

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (BOOL)dateInterval:(id)a3 intersectsSensitiveDateIntervals:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v5, "intersectsDateInterval:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (BOOL)isAssetAtSensitiveLocationAndDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  uint8_t v14[16];

  v4 = a3;
  objc_msgSend(v4, "localCreationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v4, "localCreationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localCreationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "initWithStartDate:endDate:", v7, v8);

    objc_msgSend(v4, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(a1, "isSensitiveLocation:duringDateInterval:", v10, v9);

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "[PGSenLoc] Error: Asset passed in with no local creation date.", v14, 2u);
    }
    v11 = 0;
  }

  return v11;
}

+ (id)unobfuscatedBlocklistFromObfuscatedBlocklist:(id)a3
{
  id v3;
  id v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id obj;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[PGSensitiveLocationBlocklistConfiguration dateFormatter](PGSensitiveLocationBlocklistConfiguration, "dateFormatter");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v4 = v3;
  v32 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v32)
  {
    v29 = v4;
    v30 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v45 != v30)
          objc_enumerationMutation(v4);
        v6 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("e"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          v33 = v6;
          v34 = v8;
          v35 = v7;
          v36 = i;
          v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          obj = v37;
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v41;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v41 != v12)
                  objc_enumerationMutation(obj);
                v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
                v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("d"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (v16)
                {
                  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("d"));
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PGObfuscation plaintextDateFromObfuscatedString:usingDateFormatter:](PGObfuscation, "plaintextDateFromObfuscatedString:usingDateFormatter:", v17, v39);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("startDate"));

                }
                objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("l"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                if (v19)
                {
                  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("l"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PGObfuscation plaintextDateFromObfuscatedString:usingDateFormatter:](PGObfuscation, "plaintextDateFromObfuscatedString:usingDateFormatter:", v20, v39);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("endDate"));

                }
                objc_msgSend(v9, "addObject:", v15);

              }
              v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            }
            while (v11);
          }

          v8 = v34;
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v9, CFSTR("sensitiveDateIntervalsAsDictionaries"));

          v4 = v29;
          v7 = v35;
          i = v36;
          v6 = v33;
        }
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          +[PGObfuscation plaintextNumberFromObfuscatedString:](PGObfuscation, "plaintextNumberFromObfuscatedString:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("latitude"));

        }
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("c"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          +[PGObfuscation plaintextNumberFromObfuscatedString:](PGObfuscation, "plaintextNumberFromObfuscatedString:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("longitude"));

        }
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("g"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          +[PGObfuscation plaintextNumberFromObfuscatedString:](PGObfuscation, "plaintextNumberFromObfuscatedString:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, CFSTR("radius"));

        }
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v8, v6);

      }
      v32 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v32);
  }

  return v31;
}

+ (id)obfuscatedBlocklistFromUnobfuscatedBlocklist:(id)a3
{
  id v3;
  id v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id obj;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[PGSensitiveLocationBlocklistConfiguration dateFormatter](PGSensitiveLocationBlocklistConfiguration, "dateFormatter");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v4 = v3;
  v32 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v32)
  {
    v29 = v4;
    v30 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v45 != v30)
          objc_enumerationMutation(v4);
        v6 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sensitiveDateIntervalsAsDictionaries"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          v33 = v6;
          v34 = v8;
          v35 = v7;
          v36 = i;
          v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          obj = v37;
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v41;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v41 != v12)
                  objc_enumerationMutation(obj);
                v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
                v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("startDate"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (v16)
                {
                  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("startDate"));
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PGObfuscation obfuscatedStringFromPlaintextDate:usingDateFormatter:](PGObfuscation, "obfuscatedStringFromPlaintextDate:usingDateFormatter:", v17, v39);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("d"));

                }
                objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("endDate"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                if (v19)
                {
                  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("endDate"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PGObfuscation obfuscatedStringFromPlaintextDate:usingDateFormatter:](PGObfuscation, "obfuscatedStringFromPlaintextDate:usingDateFormatter:", v20, v39);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("l"));

                }
                objc_msgSend(v9, "addObject:", v15);

              }
              v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            }
            while (v11);
          }

          v8 = v34;
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v9, CFSTR("e"));

          v4 = v29;
          v7 = v35;
          i = v36;
          v6 = v33;
        }
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("latitude"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          +[PGObfuscation obfuscatedStringFromPlaintextNumber:](PGObfuscation, "obfuscatedStringFromPlaintextNumber:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("n"));

        }
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("longitude"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          +[PGObfuscation obfuscatedStringFromPlaintextNumber:](PGObfuscation, "obfuscatedStringFromPlaintextNumber:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("c"));

        }
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("radius"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          +[PGObfuscation obfuscatedStringFromPlaintextNumber:](PGObfuscation, "obfuscatedStringFromPlaintextNumber:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, CFSTR("g"));

        }
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v8, v6);

      }
      v32 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v32);
  }

  return v31;
}

+ (id)sensitiveLocationBlocklistLocal
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("assets_394/sbl"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v3, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (v5)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "[PGSenLoc] Error loading local file: %@", buf, 0xCu);
    }

  }
  if (!objc_msgSend(v4, "count"))
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "[PGSenLoc] Error: Empty local file loaded.", buf, 2u);
    }

  }
  return v4;
}

+ (id)sensitiveLocationBlocklistConfigurationsLocal
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  PGSensitiveLocationBlocklistConfiguration *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sensitiveLocationBlocklistLocal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[PGSensitiveLocationBlocklistConfiguration initWithConfigurationDictionary:]([PGSensitiveLocationBlocklistConfiguration alloc], "initWithConfigurationDictionary:", v9);
          if (v10)
            objc_msgSend(v3, "addObject:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = (id)MEMORY[0x1E0C9AA60];
  }

  return v3;
}

+ (id)dateFormatter
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  return v2;
}

void __85__PGSensitiveLocationBlocklistConfiguration_sensitiveLocationBlocklistConfigurations__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  PGSensitiveLocationBlocklistConfiguration *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sensitiveLocationBlocklist");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = (void *)sensitiveLocationBlocklistConfigurations_locationBlocklistConfigurations;
    sensitiveLocationBlocklistConfigurations_locationBlocklistConfigurations = (uint64_t)v2;

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = v1;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[PGSensitiveLocationBlocklistConfiguration initWithConfigurationDictionary:]([PGSensitiveLocationBlocklistConfiguration alloc], "initWithConfigurationDictionary:", v9);
          if (v10)
            objc_msgSend((id)sensitiveLocationBlocklistConfigurations_locationBlocklistConfigurations, "addObject:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

@end
