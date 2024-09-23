@implementation PLPTPDebugAnalytics

+ (BOOL)_isRender:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;

  v3 = _isRender__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_isRender__onceToken, &__block_literal_global_78946);
  v5 = objc_msgSend((id)_isRender__isRenderedRegex, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  return v5 != 0;
}

+ (void)countResourceTypes:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id obj;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (countResourceTypes__onceToken != -1)
    dispatch_once(&countResourceTypes__onceToken, &__block_literal_global_2_78938);
  ++totalAssetCount;
  v4 = objc_msgSend(v3, "count");
  totalResourceCount += v4;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v5)
  {
    v6 = v5;
    v38 = *(_QWORD *)v40;
    v35 = *MEMORY[0x1E0CEC640];
    v34 = *MEMORY[0x1E0CEC568];
    v32 = *MEMORY[0x1E0CEC5B8];
    v31 = *MEMORY[0x1E0CEC450];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v40 != v38)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v7);
        objc_msgSend(v8, "assetHandle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "type");

        objc_msgSend(v8, "contentType");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
        }
        else
        {
          v13 = (void *)MEMORY[0x1E0CEC3F8];
          objc_msgSend(v8, "createdFilename");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (!v14)
          {
            objc_msgSend(v8, "filename");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v14;
          }
          objc_msgSend(v14, "pathExtension");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "typeWithFilenameExtension:", v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          if (!v12)
          {
            PLPTPGetLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v8;
              _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Expected a contentType: %@", buf, 0xCu);
            }

            v12 = 0;
          }
        }
        if (v10 > 0xB)
        {
          objc_msgSend(v8, "filename");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "pathExtension");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("DBG"));

          if ((v29 & 1) != 0)
          {
            v10 = 19;
            goto LABEL_20;
          }
LABEL_38:
          objc_msgSend((id)unknownResources, "addObject:", v8);
          v10 = 23;
          goto LABEL_20;
        }
        if (((1 << v10) & 0xFF6) != 0)
          goto LABEL_20;
        if (v10)
        {
          if ((objc_msgSend(v12, "conformsToType:", v35) & 1) == 0
            && !objc_msgSend(v12, "conformsToType:", v34))
          {
            if ((objc_msgSend(v12, "conformsToType:", v32) & 1) != 0)
            {
              v10 = 16;
              goto LABEL_20;
            }
            if ((objc_msgSend(v12, "conformsToType:", v31) & 1) != 0)
            {
              v10 = 15;
              goto LABEL_20;
            }
            goto LABEL_38;
          }
          objc_msgSend(v8, "originalFilename");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(a1, "_isRender:", v25);

          if (v26)
            v10 = 14;
          else
            v10 = 13;
        }
        else if ((objc_msgSend(v12, "conformsToType:", v35) & 1) != 0
               || objc_msgSend(v12, "conformsToType:", v34))
        {
          v10 = 12;
        }
        else
        {
          v10 = 0;
        }
LABEL_20:
        v18 = (void *)MEMORY[0x1E0CB37E8];
        v19 = (void *)resourceCountsByType;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v21, "unsignedIntegerValue") + 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)resourceCountsByType;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v24);

        ++v7;
      }
      while (v6 != v7);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      v6 = v30;
    }
    while (v30);
  }

}

+ (void)reportResourceCounts
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("PLPTPAssetManager resource counts for assets: %lu==>\n"), totalAssetCount);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (id)resourceCountsByType;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        switch(objc_msgSend(v8, "unsignedIntegerValue"))
        {
          case 0:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("photo: %@\n"), v9);
            break;
          case 1:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("adj: %@\n"), v9);
            break;
          case 2:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", &unk_1E37600B0);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("sec_adj: %@\n"), v9);
            break;
          case 4:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("full_photo: %@\n"), v9);
            break;
          case 5:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("full_video: %@\n"), v9);
            break;
          case 6:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("soc_photo: %@\n"), v9);
            break;
          case 7:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("soc_video: %@\n"), v9);
            break;
          case 8:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("soc_paired_video: %@\n"), v9);
            break;
          case 9:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("orig_adj: %@\n"), v9);
            break;
          case 10:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("base_photo: %@\n"), v9);
            break;
          case 11:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("base_video: %@\n"), v9);
            break;
          case 12:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("video: %@\n"), v9);
            break;
          case 13:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("paired_video: %@\n"), v9);
            break;
          case 14:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("full_paired_video: %@\n"), v9);
            break;
          case 15:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("audio: %@\n"), v9);
            break;
          case 16:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("raw: %@\n"), v9);
            break;
          case 17:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("xmp: %@\n"), v9);
            break;
          case 18:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("adj_overflow: %@\n"), v9);
            break;
          case 19:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("diag: %@\n"), v9);
            break;
          case 20:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("photo_proxy: %@\n"), v9);
            break;
          case 21:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("alch: %@\n"), v9);
            break;
          case 22:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("base_paired_video: %@\n"), v9);
            break;
          case 23:
            objc_msgSend((id)resourceCountsByType, "objectForKeyedSubscript:", &unk_1E37600C8);
            v9 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "appendFormat:", CFSTR("unknown: %@\n"), v9);
            break;
          default:
            PLPTPGetLog();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              v10 = objc_msgSend(v8, "unsignedIntegerValue");
              *(_DWORD *)buf = 134217984;
              v18 = v10;
              _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Unexpected resource type: %lu", buf, 0xCu);
            }
            break;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v5);
  }

  PLPTPGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v18 = (uint64_t)v2;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  if (objc_msgSend((id)unknownResources, "count"))
  {
    PLPTPGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v18 = unknownResources;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

  }
}

void __42__PLPTPDebugAnalytics_countResourceTypes___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)resourceCountsByType;
  resourceCountsByType = v0;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)unknownResources;
  unknownResources = v2;

}

void __33__PLPTPDebugAnalytics__isRender___block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\D{4}E\\d{4}"), 0, &v4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v4;
  v2 = (void *)_isRender__isRenderedRegex;
  _isRender__isRenderedRegex = v0;

  if (v1)
  {
    PLImportGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v1;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Unable to search for regular expession '\\D{4}E\\d{4}': %@", buf, 0xCu);
    }

  }
}

@end
