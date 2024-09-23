@implementation ATXHeroEntriesReader

+ (id)appAndClipEntryFromPbEntries:(id)a3 position:(unint64_t)a4
{
  id v5;
  double v6;
  double v7;
  int v8;
  int v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  ATXHeroEntry *v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  void *v25;

  v5 = a3;
  v6 = (double)*(int *)(objc_msgSend(v5, "deltaLatitudes") + 4 * a4);
  v7 = (v6 + (double)(int)objc_msgSend(v5, "tileLatitudeE7")) / 10000000.0;
  v8 = *(_DWORD *)(objc_msgSend(v5, "deltaLongitudes") + 4 * a4);
  v9 = objc_msgSend(v5, "tileLongitudeE7");
  if (v7 < -90.0 || v7 > 90.0 || (v10 = ((double)v8 + (double)v9) / 10000000.0, v10 < -180.0) || v10 > 180.0)
  {
    __atxlog_handle_hero();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      +[ATXHeroEntriesReader appAndClipEntryFromPbEntries:position:].cold.1(a4, v18);

    v19 = 0;
  }
  else
  {
    v11 = *(unsigned int *)(objc_msgSend(v5, "adamIds") + 4 * a4);
    if (objc_msgSend(v5, "urlHashsCount")
      && (objc_msgSend(v5, "urlHashs"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "objectAtIndexedSubscript:", a4),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "length"),
          v13,
          v12,
          v14 == 32))
    {
      objc_msgSend(v5, "urlHashs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXDigestConverter binToHex:](ATXDigestConverter, "binToHex:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    if (objc_msgSend(v5, "radiusCount"))
      v20 = *(unsigned int *)(objc_msgSend(v5, "radius") + 4 * a4);
    else
      v20 = 0;
    if (objc_msgSend(v5, "ranksCount"))
      v21 = *(unsigned int *)(objc_msgSend(v5, "ranks") + 4 * a4);
    else
      v21 = 1;
    if (objc_msgSend(v5, "isTouristAppsCount"))
      v22 = *(_BYTE *)(objc_msgSend(v5, "isTouristApps") + a4) != 0;
    else
      v22 = 0;
    objc_msgSend(v5, "poiCategorys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "muidsCount"))
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLongLong:", *(_QWORD *)(objc_msgSend(v5, "muids") + 8 * a4));
    else
      v25 = 0;
    v19 = -[ATXHeroEntry initWithAdamId:urlHash:location:radiusInMeters:rank:isTouristApp:poiCategory:poiMuid:]([ATXHeroEntry alloc], "initWithAdamId:urlHash:location:radiusInMeters:rank:isTouristApp:poiCategory:poiMuid:", v11, v17, v20, v21, v22, v24, v7, v10, v25);

  }
  return v19;
}

+ (BOOL)validateReader:(id)a3 pbEntries:(id)a4
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  NSObject *v9;

  v5 = (char *)a4;
  if ((ATXHeroEntriesPbReadFrom(v5, (uint64_t)a3) & 1) == 0)
  {
    __atxlog_handle_hero();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[ATXHeroEntriesReader validateReader:pbEntries:].cold.7();
    goto LABEL_22;
  }
  v6 = objc_msgSend(v5, "deltaLatitudesCount");
  if ((unint64_t)(v6 - 100001) < 0xFFFFFFFFFFFE7960
    || (v7 = v6, objc_msgSend(v5, "deltaLongitudesCount") != v6))
  {
    __atxlog_handle_hero();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[ATXHeroEntriesReader validateReader:pbEntries:].cold.1();
    goto LABEL_22;
  }
  if (objc_msgSend(v5, "adamIdsCount") != v7)
  {
    __atxlog_handle_hero();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[ATXHeroEntriesReader validateReader:pbEntries:].cold.6();
    goto LABEL_22;
  }
  if (objc_msgSend(v5, "radiusCount")
    && ((unint64_t)objc_msgSend(v5, "radiusCount") > 0x186A0 || v7 != objc_msgSend(v5, "radiusCount")))
  {
    __atxlog_handle_hero();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[ATXHeroEntriesReader validateReader:pbEntries:].cold.5();
    goto LABEL_22;
  }
  if (objc_msgSend(v5, "ranksCount")
    && ((unint64_t)objc_msgSend(v5, "ranksCount") > 0x186A0 || v7 != objc_msgSend(v5, "ranksCount")))
  {
    __atxlog_handle_hero();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[ATXHeroEntriesReader validateReader:pbEntries:].cold.4();
    goto LABEL_22;
  }
  if (objc_msgSend(v5, "urlHashsCount")
    && ((unint64_t)objc_msgSend(v5, "urlHashsCount") > 0x186A0 || v7 != objc_msgSend(v5, "urlHashsCount")))
  {
    __atxlog_handle_hero();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[ATXHeroEntriesReader validateReader:pbEntries:].cold.3();
    goto LABEL_22;
  }
  if (objc_msgSend(v5, "poiCategorysCount")
    && ((unint64_t)objc_msgSend(v5, "poiCategorysCount") > 0x186A0 || v7 != objc_msgSend(v5, "poiCategorysCount")))
  {
    __atxlog_handle_hero();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[ATXHeroEntriesReader validateReader:pbEntries:].cold.2();
LABEL_22:

    v8 = 0;
    goto LABEL_23;
  }
  v8 = 1;
LABEL_23:

  return v8;
}

+ (id)loadAppAndClipEntriesFromFileURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v9 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:options:error:", v3, 1, &v9);
  v5 = v9;
  if (v4 && objc_msgSend(v4, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "loadAppAndClipEntriesFromData:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_hero();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_2147E2000, v7, OS_LOG_TYPE_DEFAULT, "ATXCDN: Ignore reading nil or 0-byte file %@: %@", buf, 0x16u);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)loadAppAndClipEntriesFromData:(id)a3
{
  id v4;
  ATXHeroEntriesPb *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = objc_alloc_init(ATXHeroEntriesPb);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7AEF8]), "initWithData:", v4);
  if (objc_msgSend(a1, "validateReader:pbEntries:", v6, v5))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[ATXHeroEntriesPb adamIdsCount](v5, "adamIdsCount"));
    if (-[ATXHeroEntriesPb adamIdsCount](v5, "adamIdsCount"))
    {
      v8 = 0;
      do
      {
        v9 = (void *)MEMORY[0x2199D60F4]();
        objc_msgSend(a1, "appAndClipEntryFromPbEntries:position:", v5, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v7, "addObject:", v10);

        objc_autoreleasePoolPop(v9);
        ++v8;
      }
      while (v8 < -[ATXHeroEntriesPb adamIdsCount](v5, "adamIdsCount"));
    }
    if (objc_msgSend(v7, "count"))
      v11 = v7;
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (void)appAndClipEntryFromPbEntries:(uint64_t)a1 position:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_2147E2000, a2, OS_LOG_TYPE_DEBUG, "ATXCDN: Skipping malformed entry at position: %lu", (uint8_t *)&v2, 0xCu);
}

+ (void)validateReader:pbEntries:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2147E2000, v0, v1, "ATXCDN: Malformed protobuf - lat/lng count mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)validateReader:pbEntries:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2147E2000, v0, v1, "ATXCDN: Malformed protobuf - poiCategory count mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)validateReader:pbEntries:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2147E2000, v0, v1, "ATXCDN: Malformed protobuf - urlHash count mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)validateReader:pbEntries:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2147E2000, v0, v1, "ATXCDN: Malformed protobuf - rank count mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)validateReader:pbEntries:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2147E2000, v0, v1, "ATXCDN: Malformed protobuf - radius count mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)validateReader:pbEntries:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2147E2000, v0, v1, "ATXCDN: Malformed protobuf - adamId count mismatch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)validateReader:pbEntries:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2147E2000, v0, v1, "ATXCDN: Unable deserialize protobuf", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
