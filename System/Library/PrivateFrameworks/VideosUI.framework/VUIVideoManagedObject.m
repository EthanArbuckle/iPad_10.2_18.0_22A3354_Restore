@implementation VUIVideoManagedObject

+ (id)keyPathsForValuesAffectingLocalPlaybackURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("localPlaybackRelativeFilePath"));
}

+ (id)keyPathsForValuesAffectingExpirationDate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("hasExpirationDate"), CFSTR("fpsKeyInfo"), 0);
}

- (NSURL)localPlaybackURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[VUIVideoManagedObject localPlaybackRelativeFilePath](self, "localPlaybackRelativeFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    NSHomeDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURLWithPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURLWithPath:relativeToURL:", v2, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSURL *)v6;
}

- (void)setLocalPlaybackURL:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "relativeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByRemovingPercentEncoding");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[VUIVideoManagedObject setLocalPlaybackRelativeFilePath:](self, "setLocalPlaybackRelativeFilePath:", v5);
}

- (NSDictionary)additionalFPSRequestParams
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  -[VUIVideoManagedObject additionalFPSRequestParamsJSONData](self, "additionalFPSRequestParamsJSONData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v2, 0, &v15);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v15;
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v3;
LABEL_11:

        goto LABEL_12;
      }
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v6)
        -[VUIVideoManagedObject(VideosUIDerivedProperties) additionalFPSRequestParams].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[VUIVideoManagedObject(VideosUIDerivedProperties) additionalFPSRequestParams].cold.1((uint64_t)v4);
    }
    v5 = 0;
    goto LABEL_11;
  }
  v5 = 0;
LABEL_12:

  return (NSDictionary *)v5;
}

- (NSDictionary)mediaMetrics
{
  void *v2;
  void *v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  -[VUIVideoManagedObject mediaMetricsJSONData](self, "mediaMetricsJSONData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v2, 0, &v22);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = v3;
LABEL_11:

        goto LABEL_12;
      }
      v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v13)
        -[VUIVideoManagedObject(VideosUIDerivedProperties) mediaMetrics].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v5)
        -[VUIVideoManagedObject(VideosUIDerivedProperties) mediaMetrics].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    v4 = 0;
    goto LABEL_11;
  }
  v4 = 0;
LABEL_12:

  return (NSDictionary *)v4;
}

- (NSArray)playbackModes
{
  void *v2;
  void *v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  -[VUIVideoManagedObject playbackModesJSONData](self, "playbackModesJSONData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v2, 0, &v22);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = v3;
LABEL_11:

        goto LABEL_12;
      }
      v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v13)
        -[VUIVideoManagedObject(VideosUIDerivedProperties) playbackModes].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v5)
        -[VUIVideoManagedObject(VideosUIDerivedProperties) playbackModes].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    v4 = 0;
    goto LABEL_11;
  }
  v4 = 0;
LABEL_12:

  return (NSArray *)v4;
}

- (NSDate)expirationDate
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[VUIVideoManagedObject fpsKeyInfo](self, "fpsKeyInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[VUIVideoManagedObject fpsKeyInfo](self, "fpsKeyInfo", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "expirationDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            if (v8)
            {
              objc_msgSend(v8, "earlierDate:", v11);
              v13 = objc_claimAutoreleasedReturnValue();

              v8 = (id)v13;
            }
            else
            {
              v8 = v11;
            }
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    if (-[VUIVideoManagedObject hasExpirationDate](self, "hasExpirationDate"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
    }
    v8 = 0;
  }
  return (NSDate *)v8;
}

- (void)setRedownloadProductResponseDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", v4, 200))
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    if (objc_msgSend(v5, "length"))
    {
      -[VUIVideoManagedObject setRedownloadProductResponse:](self, "setRedownloadProductResponse:", v5);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1D96EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to serialize redownloadProductResponseDictionary data: %@", buf, 0xCu);
    }

  }
}

- (NSDictionary)redownloadProductResponseDictionary
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;

  -[VUIVideoManagedObject redownloadProductResponse](self, "redownloadProductResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v2, 0, 0, &v23);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v23;
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v3;
LABEL_11:

        goto LABEL_12;
      }
      v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v14)
        -[VUIVideoManagedObject(VideosUIDerivedProperties) redownloadProductResponseDictionary].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    else
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v6)
        -[VUIVideoManagedObject(VideosUIDerivedProperties) redownloadProductResponseDictionary].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    v5 = 0;
    goto LABEL_11;
  }
  v5 = 0;
LABEL_12:

  return (NSDictionary *)v5;
}

@end
