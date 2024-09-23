@implementation BYLocaleDataSource

+ (id)newWithLanguage:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setLanguage:", v3);

  return v4;
}

- (void)reloadData
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BYLocaleCountry *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  +[BYLocationController sharedBuddyLocationController](BYLocationController, "sharedBuddyLocationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "guessedCountries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BYLocaleDataSource language](self, "language");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5 && (v6 = (void *)v5, v7 = objc_msgSend(v4, "count"), v6, !v7))
  {
    v8 = (void *)MEMORY[0x1E0C99DC8];
    -[BYLocaleDataSource language](self, "language");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "baseLanguageFromLanguage:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "exemplarRegionForLanguage:", v10);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v38 = 0;
  }
  _BYLoggingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v45 = v38;
    v46 = 2114;
    v47 = v4;
    _os_log_impl(&dword_1A4E92000, v11, OS_LOG_TYPE_DEFAULT, "Setup Assistant Locale: initializing with exemplar region %{public}@ countries = %{public}@", buf, 0x16u);
  }
  v36 = v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYLocaleDataSource setSuggestedCountries:](self, "setSuggestedCountries:", v13);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYLocaleDataSource setMoreCountries:](self, "setMoreCountries:", v14);

  -[BYLocaleDataSource setHasRecommendedLocaleFromLanguage:](self, "setHasRecommendedLocaleFromLanguage:", 0);
  objc_msgSend(MEMORY[0x1E0C99DC8], "supportedRegions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v40 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v21 = (void *)MEMORY[0x1E0C99DC8];
        -[BYLocaleDataSource language](self, "language", v36);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localeWithLocaleIdentifier:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForRegion:context:short:", v20, 3, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v24, "isEqualToString:", v20))
        {
          _BYLoggingFacility();
          v25 = (BYLocaleCountry *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v25->super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v20;
            _os_log_impl(&dword_1A4E92000, &v25->super, OS_LOG_TYPE_DEFAULT, "Missing localization for country code: %{public}@", buf, 0xCu);
          }
        }
        else
        {
          if (!objc_msgSend(v24, "length"))
            goto LABEL_22;
          v25 = objc_alloc_init(BYLocaleCountry);
          -[BYLocaleCountry setName:](v25, "setName:", v24);
          -[BYLocaleCountry setCode:](v25, "setCode:", v20);
          if ((objc_msgSend(v12, "containsObject:", v25) & 1) == 0)
          {
            objc_msgSend(v12, "addObject:", v25);
            if ((objc_msgSend(v36, "containsObject:", v20) & 1) != 0
              || objc_msgSend(v38, "isEqualToString:", v20))
            {
              -[BYLocaleDataSource suggestedCountries](self, "suggestedCountries");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "addObject:", v25);

              if (objc_msgSend(v38, "isEqualToString:", v20))
                -[BYLocaleDataSource setHasRecommendedLocaleFromLanguage:](self, "setHasRecommendedLocaleFromLanguage:", 1);
            }
          }
        }

LABEL_22:
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v17);
  }
  -[BYLocaleDataSource setMoreCountries:](self, "setMoreCountries:", v12, v36);
  -[BYLocaleDataSource moreCountries](self, "moreCountries");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYLocaleDataSource suggestedCountries](self, "suggestedCountries");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removeObjectsInArray:", v28);

  -[BYLocaleDataSource language](self, "language");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "length"))
  {
    v30 = (void *)MEMORY[0x1E0C99DC8];
    -[BYLocaleDataSource language](self, "language");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localeWithLocaleIdentifier:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = 0;
  }

  +[BYLocaleCountry comparatorForLocale:](BYLocaleCountry, "comparatorForLocale:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYLocaleDataSource moreCountries](self, "moreCountries");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sortUsingComparator:", v33);

  -[BYLocaleDataSource suggestedCountries](self, "suggestedCountries");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sortUsingComparator:", v33);

}

- (unint64_t)numberOfRecommendedLocales
{
  void *v2;
  unint64_t v3;

  -[BYLocaleDataSource suggestedCountries](self, "suggestedCountries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)numberOfOtherLocales
{
  void *v2;
  unint64_t v3;

  -[BYLocaleDataSource moreCountries](self, "moreCountries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)recommendedLocaleAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[BYLocaleDataSource suggestedCountries](self, "suggestedCountries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)otherLocaleAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[BYLocaleDataSource moreCountries](self, "moreCountries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setLanguage:(id)a3
{
  id v4;
  BOOL v5;
  NSString *v6;
  NSString *language;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = -[NSString isEqualToString:](self->_language, "isEqualToString:", v4);
    v4 = v8;
    if (!v5)
    {
      v6 = (NSString *)objc_msgSend(v8, "copy");
      language = self->_language;
      self->_language = v6;

      -[BYLocaleDataSource reloadData](self, "reloadData");
      v4 = v8;
    }
  }

}

- (NSString)language
{
  return self->_language;
}

- (BOOL)hasRecommendedLocaleFromLanguage
{
  return self->_hasRecommendedLocaleFromLanguage;
}

- (void)setHasRecommendedLocaleFromLanguage:(BOOL)a3
{
  self->_hasRecommendedLocaleFromLanguage = a3;
}

- (NSMutableArray)suggestedCountries
{
  return self->_suggestedCountries;
}

- (void)setSuggestedCountries:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedCountries, a3);
}

- (NSMutableArray)moreCountries
{
  return self->_moreCountries;
}

- (void)setMoreCountries:(id)a3
{
  objc_storeStrong((id *)&self->_moreCountries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreCountries, 0);
  objc_storeStrong((id *)&self->_suggestedCountries, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end
