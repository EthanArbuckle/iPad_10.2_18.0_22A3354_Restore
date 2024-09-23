@implementation PGMeaningPublicEventCriteria

+ (id)criteriaKey
{
  return CFSTR("PublicEvent");
}

+ (id)criteriaWithDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("publicEventCategory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "setPublicEventCategoryNameString:", v6);
    objc_msgSend(a1, "_publicEventCategoryForPublicEventCategoryName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPublicEventCategory:", v7);

  }
  return v5;
}

+ (id)_publicEventCategoryForPublicEventCategoryName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  _QWORD v24[13];
  _QWORD v25[15];

  v25[13] = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v24[0] = CFSTR("musicConcerts");
  objc_msgSend(MEMORY[0x1E0D4B228], "musicConcerts");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  v24[1] = CFSTR("nightLife");
  objc_msgSend(MEMORY[0x1E0D4B228], "nightLife");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v20;
  v24[2] = CFSTR("theater");
  objc_msgSend(MEMORY[0x1E0D4B228], "theater");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v19;
  v24[3] = CFSTR("dance");
  objc_msgSend(MEMORY[0x1E0D4B228], "dance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v17;
  v24[4] = CFSTR("festivalsAndFairs");
  objc_msgSend(MEMORY[0x1E0D4B228], "festivalsAndFairs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v3;
  v24[5] = CFSTR("artsAndMuseums");
  objc_msgSend(MEMORY[0x1E0D4B228], "artsAndMuseums");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v4;
  v24[6] = CFSTR("sports");
  objc_msgSend(MEMORY[0x1E0D4B228], "sports");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v5;
  v24[7] = CFSTR("businessAndTechnology");
  objc_msgSend(MEMORY[0x1E0D4B228], "businessAndTechnology");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v6;
  v24[8] = CFSTR("community");
  objc_msgSend(MEMORY[0x1E0D4B228], "community");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v7;
  v24[9] = CFSTR("educational");
  objc_msgSend(MEMORY[0x1E0D4B228], "educational");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v8;
  v24[10] = CFSTR("familyEvents");
  objc_msgSend(MEMORY[0x1E0D4B228], "familyEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[10] = v9;
  v24[11] = CFSTR("tours");
  objc_msgSend(MEMORY[0x1E0D4B228], "tours");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[11] = v10;
  v24[12] = CFSTR("appleEvents");
  objc_msgSend(MEMORY[0x1E0D4B228], "appleEvents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[12] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "loggingConnection");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v18;
      _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Invalid public event category name \"%@\", buf, 0xCu);
    }

  }
  return v13;
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  -[PGMeaningPublicEventCriteria publicEventCategory](self, "publicEventCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PGMeaningPublicEventCriteria publicEventCategory](self, "publicEventCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "graph");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphPublicEventCategoryNodeCollection publicEventCategoryNodesForCategory:inGraph:](PGGraphPublicEventCategoryNodeCollection, "publicEventCategoryNodesForCategory:inGraph:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v7, "publicEventCategoryNodes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "intersectsCollection:", v11);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (BOOL)passesForAssets:(id)a3
{
  return 1;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[PGMeaningPublicEventCriteria publicEventCategory](self, "publicEventCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggingConnection");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[PGMeaningPublicEventCriteria publicEventCategoryNameString](self, "publicEventCategoryNameString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1CA237000, v5, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Invalid public event category name \"%@\", (uint8_t *)&v8, 0xCu);

    }
  }
  return v3 != 0;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PGMeaningPublicEventCriteria publicEventCategory](self, "publicEventCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("publicEventCategory: %@\n"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)publicEventCategory
{
  return self->_publicEventCategory;
}

- (void)setPublicEventCategory:(id)a3
{
  objc_storeStrong((id *)&self->_publicEventCategory, a3);
}

- (NSString)publicEventCategoryNameString
{
  return self->_publicEventCategoryNameString;
}

- (void)setPublicEventCategoryNameString:(id)a3
{
  objc_storeStrong((id *)&self->_publicEventCategoryNameString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicEventCategoryNameString, 0);
  objc_storeStrong((id *)&self->_publicEventCategory, 0);
}

@end
