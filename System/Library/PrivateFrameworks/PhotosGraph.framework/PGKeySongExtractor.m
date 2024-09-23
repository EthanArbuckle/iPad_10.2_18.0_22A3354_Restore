@implementation PGKeySongExtractor

+ (id)appleMusicKeySongIDFromMemory:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_keySongIDFromMemory:forSongCatalog:", v3, *MEMORY[0x1E0D759E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)flexMusicKeySongIDFromMemory:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_keySongIDFromMemory:forSongCatalog:", v3, *MEMORY[0x1E0D759F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_keySongIDFromMemory:(id)a3 forSongCatalog:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "photosGraphProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("storyRecipeData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0D752E0]);
      v16 = 0;
      objc_msgSend(v9, "unarchivedRecipeWithData:error:", v8, &v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v16;
      if (v10)
      {
        objc_msgSend(v10, "seedSongIdentifiersByCatalog");
        v12 = objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "loggingConnection");
        v12 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v11;
          _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "[MemoriesMusic] Failed to unarchive recipe from recipe data, error: %@", buf, 0xCu);
        }
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

  return v13;
}

@end
