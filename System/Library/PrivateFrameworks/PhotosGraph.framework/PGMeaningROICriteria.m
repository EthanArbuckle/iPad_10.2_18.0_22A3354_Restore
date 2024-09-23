@implementation PGMeaningROICriteria

+ (id)criteriaKey
{
  return CFSTR("ROI");
}

+ (id)criteriaWithDictionary:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("positiveROIs"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v9 = (void *)v6;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = v9;

  objc_msgSend(v5, "setPositiveROIs:", v10);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumNumberOfROIs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  if (v12 <= 1)
    v13 = 1;
  else
    v13 = v12;
  objc_msgSend(v5, "setMinimumNumberOfROIs:", v13);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("negativeROIs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    v15 = v14;
  else
    v15 = v8;
  v16 = v15;

  objc_msgSend(v5, "setNegativeROIs:", v16);
  return v5;
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  _QWORD v15[8];
  _QWORD v16[4];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  BOOL v20;

  v6 = a3;
  v7 = a4;
  -[PGMeaningROICriteria positiveROIs](self, "positiveROIs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  -[PGMeaningROICriteria negativeROIs](self, "negativeROIs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 | v11)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = v9 == 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    objc_msgSend(v7, "roiNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__PGMeaningROICriteria_passesForMomentNode_momentNodeCache___block_invoke;
    v15[3] = &unk_1E8430E50;
    v15[4] = self;
    v15[5] = &v17;
    v15[6] = v16;
    v15[7] = v11;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);
    v12 = *((_BYTE *)v18 + 24) != 0;

    _Block_object_dispose(v16, 8);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (BOOL)passesForAssets:(id)a3
{
  return 1;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PGMeaningROICriteria positiveROIs](self, "positiveROIs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningROICriteria negativeROIs](self, "negativeROIs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphROINode validROILabels](PGGraphROINode, "validROILabels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v20;
    v12 = 1;
    *(_QWORD *)&v9 = 138412290;
    v18 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v14, v18, (_QWORD)v19) & 1) == 0)
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "loggingConnection");
          v16 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v18;
            v24 = v14;
            _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Invalid roi \"%@\", buf, 0xCu);
          }

          v12 = 0;
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 1;
  }

  return v12 & 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningROICriteria positiveROIs](self, "positiveROIs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMeaningROICriteria negativeROIs](self, "negativeROIs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendFormat:", CFSTR("\t\tpositiveROIs: %@\n"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("\t\tnegativeROIs: %@\n"), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("\t\tminimumNumberOfROIs: %d\n"), -[PGMeaningROICriteria minimumNumberOfROIs](self, "minimumNumberOfROIs"));

  return (NSString *)v3;
}

- (NSArray)positiveROIs
{
  return self->_positiveROIs;
}

- (void)setPositiveROIs:(id)a3
{
  objc_storeStrong((id *)&self->_positiveROIs, a3);
}

- (NSArray)negativeROIs
{
  return self->_negativeROIs;
}

- (void)setNegativeROIs:(id)a3
{
  objc_storeStrong((id *)&self->_negativeROIs, a3);
}

- (unint64_t)minimumNumberOfROIs
{
  return self->_minimumNumberOfROIs;
}

- (void)setMinimumNumberOfROIs:(unint64_t)a3
{
  self->_minimumNumberOfROIs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeROIs, 0);
  objc_storeStrong((id *)&self->_positiveROIs, 0);
}

void __60__PGMeaningROICriteria_passesForMomentNode_momentNodeCache___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  unint64_t v7;
  void *v8;
  int v9;
  id v10;

  objc_msgSend(a2, "label");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "positiveROIs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v10);

    if (v6)
    {
      v7 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (v7 >= objc_msgSend(*(id *)(a1 + 32), "minimumNumberOfROIs"))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "negativeROIs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v10);

    if (v9)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a3 = 1;
    }
  }

}

@end
