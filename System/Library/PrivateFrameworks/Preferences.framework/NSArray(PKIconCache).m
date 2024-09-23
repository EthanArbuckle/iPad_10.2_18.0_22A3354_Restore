@implementation NSArray(PKIconCache)

+ (void)pk_updateSpecifiers:()PKIconCache withIconsFromCache:isInterfaceRTL:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v9, "_calendarDirection");

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v36;
    *(_QWORD *)&v11 = 138412290;
    v31 = v11;
    do
    {
      v14 = 0;
      v32 = v12;
      do
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v14);
        objc_msgSend(v15, "propertyForKey:", CFSTR("iconCache"), v31);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "propertyForKey:", CFSTR("iconImageShouldFlipForRightToLeft"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "BOOLValue");

        objc_msgSend(v15, "propertyForKey:", CFSTR("iconImageShouldFlipForRightToLeftCalendarKey"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "BOOLValue");

        if (v16)
        {
          if ((_DWORD)a5)
          {
            v21 = v13;
            v22 = v8;
            v23 = a5;
            objc_msgSend(v15, "propertyForKey:", CFSTR("iconImageShouldLoadAlternateImageForRightToLeftKey"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "BOOLValue");

            if (v25)
            {
              objc_msgSend(CFSTR("RTL-"), "stringByAppendingString:", v16);
              v26 = objc_claimAutoreleasedReturnValue();

              v16 = (void *)v26;
            }
            a5 = v23;
            v8 = v22;
            v13 = v21;
            v12 = v32;
          }
          objc_msgSend(v8, "imageForKey:", v16);
          v27 = objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v28 = v27;
            if (v33 == 1)
              v29 = v20;
            else
              v29 = 0;
            if ((v18 | v29) == 1)
            {
              -[NSObject imageFlippedForRightToLeftLayoutDirection](v27, "imageFlippedForRightToLeftLayoutDirection");
              v30 = objc_claimAutoreleasedReturnValue();

              v28 = v30;
            }
            objc_msgSend(v15, "setProperty:forKey:", v28, CFSTR("iconImage"));
          }
          else
          {
            _PSLoggingFacility();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v31;
              v40 = v16;
              _os_log_impl(&dword_1A3819000, v28, OS_LOG_TYPE_DEFAULT, "############ Icon for key \"%@\" is missing from the cache.", buf, 0xCu);
            }
          }

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v12);
  }

}

+ (void)pk_updateSpecifiers:()PKIconCache withIconsFromCache:
{
  id v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  id v9;

  v9 = a3;
  v5 = a4;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "layoutDirection") == 1;

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "pk_updateSpecifiers:withIconsFromCache:isInterfaceRTL:", v9, v5, v8);

}

@end
