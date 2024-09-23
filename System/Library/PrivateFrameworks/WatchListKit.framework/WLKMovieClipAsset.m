@implementation WLKMovieClipAsset

+ (id)movieClipAssetsWithArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  WLKMovieClipAsset *v12;
  WLKMovieClipAsset *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (v10)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v11 = v10;
              v12 = [WLKMovieClipAsset alloc];
              v13 = -[WLKMovieClipAsset initWithDictionary:](v12, "initWithDictionary:", v11, (_QWORD)v16);

              objc_msgSend(v4, "addObject:", v13);
            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v14 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (WLKMovieClipAsset)initWithDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  WLKMovieClipAsset *v13;

  v4 = a3;
  if (v4)
  {
    v5 = -[WLKMovieClipAsset _init](self, "_init");
    if (v5)
    {
      objc_msgSend(v4, "wlk_numberForKey:", CFSTR("durationInMilliseconds"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5[1] = objc_msgSend(v6, "unsignedIntegerValue") / 0x3E8uLL;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("flavor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      v9 = (void *)v5[2];
      v5[2] = v8;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("url"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      v12 = (void *)v5[3];
      v5[3] = v11;

    }
    self = v5;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WLKMovieClipAsset;
  return -[WLKMovieClipAsset init](&v3, sel_init);
}

- (WLKMovieClipAsset)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKMovieClipAsset"), CFSTR("-init is not supported. Use -initWithDictionary:"));

  return 0;
}

- (NSString)durationString
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_duration / 0x3C);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_duration % 0x3C >= 0xA)
    v4 = CFSTR("%lu");
  else
    v4 = CFSTR("0%lu");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%lu"), 0, self->_duration % 0x3C);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (NSString)flavor
{
  return self->_flavor;
}

- (NSString)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_flavor, 0);
}

@end
