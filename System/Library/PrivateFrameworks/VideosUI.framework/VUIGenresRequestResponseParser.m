@implementation VUIGenresRequestResponseParser

- (VUIGenresRequestResponseParser)init
{
  VUIGenresRequestResponseParser *v2;
  os_log_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIGenresRequestResponseParser;
  v2 = -[VUIGenresRequestResponseParser init](&v6, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.tv.mediaAPI", "VUIGenresRequestResponseParser");
    v4 = (void *)sLogObject_7;
    sLogObject_7 = (uint64_t)v3;

  }
  return v2;
}

- (id)parseAMSURLResult:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "vui_arrayForKey:", CFSTR("data"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[VUIGenresRequestResponseParser _parseRawGenreResults:](self, "_parseRawGenreResults:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = sLogObject_7;
      if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Parsing AMS Genre Fetch with no data bag", v13, 2u);
      }
      v9 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v10 = sLogObject_7;
    if (os_log_type_enabled((os_log_t)sLogObject_7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Parsing AMS Genre Fetch with no object dictionary", buf, 2u);
    }
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (id)_parseRawGenreResults:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  VUIFamilySharingGenre *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id obj;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[16];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v4)
  {
    v5 = v4;
    v6 = &unk_1EDACA000;
    v7 = *(_QWORD *)v43;
    v32 = *(_QWORD *)v43;
    do
    {
      v8 = 0;
      v34 = v5;
      do
      {
        if (*(_QWORD *)v43 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "vui_dictionaryForKey:", CFSTR("attributes"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v10)
          {
            v11 = *((_QWORD *)v6 + 97);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Parsing AMS Genre with no Attributes", buf, 2u);
            }
          }
          objc_msgSend(v10, "vui_stringForKey:", CFSTR("name"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v9, "vui_stringForKey:", CFSTR("id"));
            v36 = objc_claimAutoreleasedReturnValue();
            v37 = 0u;
            v38 = 0u;
            v39 = 0u;
            v40 = 0u;
            v13 = v33;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v38;
              while (2)
              {
                for (i = 0; i != v15; ++i)
                {
                  if (*(_QWORD *)v38 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                  objc_msgSend(v18, "genreTitle");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v19, "isEqualToString:", v12);

                  if (v20)
                  {
                    v25 = objc_alloc(MEMORY[0x1E0C99DE8]);
                    objc_msgSend(v18, "genreIdentifiers");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = (void *)objc_msgSend(v25, "initWithArray:", v26);

                    v22 = (void *)v36;
                    objc_msgSend(v27, "addObject:", v36);
                    v28 = (void *)objc_msgSend(v27, "copy");
                    objc_msgSend(v18, "setGenreIdentifiers:", v28);

                    goto LABEL_23;
                  }
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
                if (v15)
                  continue;
                break;
              }
            }

            v21 = objc_alloc_init(VUIFamilySharingGenre);
            v22 = (void *)v36;
            v46 = v36;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIFamilySharingGenre setGenreIdentifiers:](v21, "setGenreIdentifiers:", v23);

            -[VUIFamilySharingGenre setGenreTitle:](v21, "setGenreTitle:", v12);
            objc_msgSend(v13, "addObject:", v21);

LABEL_23:
            v6 = &unk_1EDACA000;
            v5 = v34;
            v7 = v32;
          }
          else
          {
            v29 = *((_QWORD *)v6 + 97);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "Parsing AMS Genre with no Name", buf, 2u);
            }
            objc_msgSend(v9, "vui_stringForKey:", CFSTR("id"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          v24 = *((_QWORD *)v6 + 97);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D96EE000, v24, OS_LOG_TYPE_DEFAULT, "Parsing AMS Genre invalid genre dictionary", buf, 2u);
          }
        }
        ++v8;
      }
      while (v8 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v5);
  }

  v30 = (void *)objc_msgSend(v33, "copy");
  return v30;
}

@end
