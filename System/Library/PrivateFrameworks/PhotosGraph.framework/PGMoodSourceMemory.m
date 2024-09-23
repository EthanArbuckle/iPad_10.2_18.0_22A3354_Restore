@implementation PGMoodSourceMemory

+ (id)_plistName
{
  return CFSTR("MoodSourceMemory");
}

- (double)weight
{
  _BOOL4 v2;
  double result;

  v2 = -[PGMoodSourceMemory _shouldProcessSource](self, "_shouldProcessSource");
  result = 0.0;
  if (v2)
    return 1.0;
  return result;
}

- (id)_plistMoodIdentifiersWithGraph:(id)a3
{
  void *v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (-[PGMoodSourceMemory _shouldProcessSource](self, "_shouldProcessSource", a3))
  {
    -[PGMoodSource enrichedMemory](self, "enrichedMemory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      return &unk_1E84E9B38;
    -[PGMoodSource assetCollection](self, "assetCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "assetCollectionType");

    if (v8 == 4)
    {
      -[PGMoodSource assetCollection](self, "assetCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "category");
      v11 = objc_msgSend(v9, "subcategory");
    }
    else
    {
      -[PGMoodSource options](self, "options");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "memoryCategory");

      -[PGMoodSource options](self, "options");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "memorySubcategory");
    }
    v13 = v11;

    v6 = &unk_1E84E9B50;
    if (v10 != 212 && v10 != 215)
    {
      objc_msgSend(MEMORY[0x1E0CD1630], "stringForCategory:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "capitalizedString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E8436F28);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD1630], "stringForSubcategory:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "capitalizedString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E8436F28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(v16, "containsString:", CFSTR("Holiday"));
      if (v10 != 218 && (v20 & 1) != 0 || (objc_msgSend(v19, "containsString:", CFSTR("Holiday")) & 1) != 0)
      {
        v6 = &unk_1E84E9B68;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v16, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v6;
}

- (BOOL)_shouldProcessSource
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[PGMoodSource enrichedMemory](self, "enrichedMemory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "memoryCategory");

  if (v4)
    return 1;
  -[PGMoodSource assetCollection](self, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "assetCollectionType") == 4)
  {
    v5 = 1;
  }
  else
  {
    -[PGMoodSource options](self, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "memoryCategory") != 0;

  }
  return v5;
}

@end
