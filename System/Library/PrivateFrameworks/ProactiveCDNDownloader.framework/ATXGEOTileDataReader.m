@implementation ATXGEOTileDataReader

- (id)appAndClipEntryForTileData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v11;

  v4 = a3;
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXGEOTileDataReader readTileData:](self, "readTileData:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v7;

    goto LABEL_6;
  }
  objc_msgSend(v4, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXGEOTileDataReader readFileURL:](self, "readFileURL:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  __atxlog_handle_hero();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[ATXGEOTileDataReader appAndClipEntryForTileData:].cold.1(v11);

  v9 = 0;
LABEL_6:

  return v9;
}

- (id)readTileData:(id)a3
{
  return +[ATXHeroEntriesReader loadAppAndClipEntriesFromData:](ATXHeroEntriesReader, "loadAppAndClipEntriesFromData:", a3);
}

- (id)readFileURL:(id)a3
{
  return +[ATXHeroEntriesReader loadAppAndClipEntriesFromFileURL:](ATXHeroEntriesReader, "loadAppAndClipEntriesFromFileURL:", a3);
}

- (void)appAndClipEntryForTileData:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2147E2000, log, OS_LOG_TYPE_ERROR, "No data was found in the tile", v1, 2u);
}

@end
