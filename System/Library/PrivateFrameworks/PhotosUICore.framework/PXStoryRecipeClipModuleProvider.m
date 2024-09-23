@implementation PXStoryRecipeClipModuleProvider

- (PXStoryRecipeClipModuleProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRecipeClipModuleProvider.m"), 36, CFSTR("%s is not available as initializer"), "-[PXStoryRecipeClipModuleProvider init]");

  abort();
}

- (PXStoryRecipeClipModuleProvider)initWithConfiguration:(id)a3
{
  id v5;
  PXStoryRecipeClipModuleProvider *v6;
  PXStoryRecipeClipModuleProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryRecipeClipModuleProvider;
  v6 = -[PXStoryRecipeClipModuleProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, a3);

  return v7;
}

- (id)splitRanges:(id)a3 maxLength:(unint64_t)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v25 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "rangeValue");
        if (v11 <= a4)
        {
          objc_msgSend(v5, "addObject:", v9);
        }
        else
        {
          v12 = v11;
          v13 = (double)v11;
          v14 = vcvtpd_u64_f64((double)v11 / (double)a4);
          if (v14)
          {
            v15 = v10;
            v16 = 0;
            v17 = (double)v14;
            do
            {
              v18 = (unint64_t)((double)v16 / v17 * v13);
              if (!v16)
                v18 = 0;
              v19 = v16 + 1;
              if (v14 - 1 == v16)
                v20 = v12;
              else
                v20 = (unint64_t)(((double)v16 + 1.0) / v17 * v13);
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v18 + v15, v20 - v18);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v21);

              v16 = v19;
            }
            while (v14 != v19);
          }
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v7);
  }

  v22 = (void *)objc_msgSend(v5, "copy");
  return v22;
}

- (id)computeRunsForModuleType:(int64_t)a3 momentClipRange:(_NSRange)a4 withClipCatalog:(id)a5 maxModuleLength:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  __int128 v10;
  unint64_t v11;
  void *v12;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  _BOOL4 IsModuleType;
  int v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  NSObject *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  NSObject *v29;
  __CFString *v30;
  __CFString *v31;
  __int128 v32;
  void *v33;
  NSUInteger v34;
  NSUInteger v35;
  uint8_t buf[4];
  __CFString *v37;
  __int16 v38;
  NSUInteger v39;
  uint64_t v40;

  length = a4.length;
  location = a4.location;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (a3)
  {
    v33 = (void *)objc_opt_new();
    v11 = length - 1 + location;
    if (!__CFADD__(length - 1, location))
    {
      v14 = 0;
      v35 = 0;
      *(_QWORD *)&v10 = 138412546;
      v32 = v10;
      v15 = location;
      v34 = location;
      while (1)
      {
        v16 = v15;
        if (v15 <= location)
        {
          v18 = 1;
        }
        else
        {
          objc_msgSend(v9, "clipAtIndex:", v15 - 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = !clipIsModuleType(v17, a3);

        }
        objc_msgSend(v9, "clipAtIndex:", v15, v32);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        IsModuleType = clipIsModuleType(v19, a3);

        v15 = v16 + 1;
        if (v16 + 1 > v11)
          break;
        objc_msgSend(v9, "clipAtIndex:", v16 + 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = clipIsModuleType(v22, a3);

        v21 = v18 && IsModuleType && v23;
        if (v18 || !IsModuleType || !v23)
        {
          if (v14)
            goto LABEL_18;
          v24 = 0;
          if (v21)
            goto LABEL_23;
        }
        else
        {
          v24 = ++v14;
          if ((v21 & 1) != 0)
            goto LABEL_23;
        }
LABEL_28:
        location = v34;
        if (v15 > v11)
          goto LABEL_4;
      }
      if (!v14)
        goto LABEL_4;
      LOBYTE(v21) = 0;
LABEL_18:
      PLStoryGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v26 = CFSTR("??");
        if ((unint64_t)a3 <= 3)
          v26 = off_1E511F160[a3];
        v27 = v26;
        *(_DWORD *)buf = v32;
        v37 = v27;
        v38 = 1024;
        LODWORD(v39) = v14 + 1;
        _os_log_impl(&dword_1A6789000, v25, OS_LOG_TYPE_DEBUG, "%@ run ended after %d assets", buf, 0x12u);

      }
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v35, v14 + 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v28);

      v24 = 0;
      v14 = 0;
      if ((v21 & 1) == 0)
        goto LABEL_28;
LABEL_23:
      PLStoryGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v30 = CFSTR("??");
        if ((unint64_t)a3 <= 3)
          v30 = off_1E511F160[a3];
        v31 = v30;
        *(_DWORD *)buf = v32;
        v37 = v31;
        v38 = 2048;
        v39 = v16;
        _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_DEBUG, "Starting a run of %@ assets at clip index %ld", buf, 0x16u);

      }
      v14 = v24 + 1;
      v35 = v16;
      goto LABEL_28;
    }
LABEL_4:
    v12 = (void *)objc_msgSend(v33, "copy");

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)mergeModulesFromRangesByModuleType:(id)a3 momentClipRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  NSUInteger i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSUInteger v22;
  void *k;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  NSUInteger v32;
  unint64_t v33;
  _BOOL4 v35;
  BOOL v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  BOOL v40;
  uint64_t v41;
  PXStoryAutoEditModule *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSUInteger v49;
  NSUInteger v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  length = a4.length;
  location = a4.location;
  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  if (objc_msgSend(v6, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v7, "addObject:", &unk_1E53EB178);
      ++v8;
    }
    while (v8 < objc_msgSend(v6, "count"));
  }
  v54 = v7;
  v55 = (void *)objc_opt_new();
  v49 = location;
  v50 = location + length;
  v53 = v6;
  if (objc_msgSend(v6, "count"))
  {
    v9 = 0;
    do
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v50);
      for (i = v50; i; --i)
        objc_msgSend(v10, "addObject:", &unk_1E53EB178, v49);
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v51 = v9;
      objc_msgSend(v53, "objectAtIndexedSubscript:", v9, v49);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v57;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v57 != v15)
              objc_enumerationMutation(v12);
            v17 = objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * j), "rangeValue");
            if (v18)
            {
              v19 = v17;
              v20 = v18;
              do
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "setObject:atIndexedSubscript:", v21, v19);

                ++v19;
                --v20;
              }
              while (v20);
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
        }
        while (v14);
      }

      objc_msgSend(v55, "addObject:", v10);
      v6 = v53;
      v9 = v51 + 1;
    }
    while (v51 + 1 < (unint64_t)objc_msgSend(v53, "count"));
  }
  v52 = (void *)objc_opt_new();
  v22 = v49;
  for (k = v54; v22 < v50; v22 += v25)
  {
    if ((unint64_t)objc_msgSend(v6, "count", v49) < 2)
    {
      v25 = 0;
      v24 = 0;
    }
    else
    {
      v24 = 0;
      v25 = 0;
      v26 = -1;
      v27 = 1;
      do
      {
        objc_msgSend(k, "objectAtIndexedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "unsignedIntegerValue");

        objc_msgSend(v55, "objectAtIndexedSubscript:", v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectAtIndexedSubscript:", v22);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v22;
        v33 = objc_msgSend(v31, "integerValue");

        v35 = v29 < v26 || v33 > v25;
        v36 = !v35;
        if (v35)
          v37 = v33;
        else
          v37 = v25;
        if (v36)
          v38 = v26;
        else
          v38 = v29;
        if (v36)
          v39 = v24;
        else
          v39 = v27;
        if (v29 > v26)
        {
          v37 = v25;
          v38 = v26;
          v39 = v24;
        }
        v40 = v33 >= 2;
        v22 = v32;
        k = v54;
        if (v40)
          v25 = v37;
        if (v40)
          v26 = v38;
        if (v40)
          v24 = v39;
        ++v27;
      }
      while (v27 < objc_msgSend(v53, "count"));
    }
    v41 = PXStoryAutoEditModuleTypes[v24];
    if (v41)
    {
      v42 = -[PXStoryAutoEditModule initWithModuleType:range:]([PXStoryAutoEditModule alloc], "initWithModuleType:range:", v41, v22, v25);
      objc_msgSend(v52, "addObject:", v42);
      v43 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(k, "objectAtIndexedSubscript:", v24);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "numberWithUnsignedInteger:", objc_msgSend(v44, "unsignedIntegerValue") + 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(k, "setObject:atIndexedSubscript:", v45, v24);

    }
    else
    {
      v25 = 1;
    }
    v6 = v53;
  }
  v46 = v6;
  v47 = (void *)objc_msgSend(v52, "copy", v49);

  return v47;
}

- (id)_splitEmptySpaceInModules:(id)a3 maxEmptySpaceLength:(unint64_t)a4 momentClipRange:(_NSRange)a5 withClipCatalog:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSUInteger v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v30[5];
  id v31;
  unint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  length = a5.length;
  location = a5.location;
  v38 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", location, length);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v14);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v18), "range");
        objc_msgSend(v13, "removeIndexesInRange:", v19, v20);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v16);
  }

  v21 = length - 1 + location;
  if (!__CFADD__(length - 1, location))
  {
    do
    {
      objc_msgSend(v12, "clipAtIndex:", location);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "displayAssets");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

      if (v24 != 1 || (unint64_t)(objc_msgSend(v22, "playbackStyle") - 2) <= 3)
        objc_msgSend(v13, "removeIndex:", location);

      ++location;
    }
    while (location <= v21);
  }
  v25 = (void *)objc_opt_new();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __113__PXStoryRecipeClipModuleProvider__splitEmptySpaceInModules_maxEmptySpaceLength_momentClipRange_withClipCatalog___block_invoke;
  v30[3] = &unk_1E51191C8;
  v32 = a4;
  v30[4] = self;
  v26 = v25;
  v31 = v26;
  objc_msgSend(v13, "enumerateRangesUsingBlock:", v30);
  v27 = v31;
  v28 = v26;

  return v28;
}

- (void)provideModulesForMomentClipRange:(_NSRange)a3 withClipCatalog:(id)a4 maxModuleLength:(unint64_t)a5 maxEmptySpaceLength:(unint64_t)a6 usingBlock:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  length = a3.length;
  location = a3.location;
  v48 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v37 = a7;
  v13 = (void *)objc_opt_new();
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "autoEditUseMomentRecipes");

  if (v15)
    v16 = 4;
  else
    v16 = 2;
  v17 = PXStoryAutoEditModuleTypes;
  do
  {
    v18 = *v17++;
    -[PXStoryRecipeClipModuleProvider computeRunsForModuleType:momentClipRange:withClipCatalog:maxModuleLength:](self, "computeRunsForModuleType:momentClipRange:withClipCatalog:maxModuleLength:", v18, location, length, v12, a5, v37);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryRecipeClipModuleProvider splitRanges:maxLength:](self, "splitRanges:maxLength:", v19, a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v20);

    --v16;
  }
  while (v16);
  -[PXStoryRecipeClipModuleProvider mergeModulesFromRangesByModuleType:momentClipRange:](self, "mergeModulesFromRangesByModuleType:momentClipRange:", v13, location, length);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = a6;
  v40 = v12;
  -[PXStoryRecipeClipModuleProvider _splitEmptySpaceInModules:maxEmptySpaceLength:momentClipRange:withClipCatalog:](self, "_splitEmptySpaceInModules:maxEmptySpaceLength:momentClipRange:withClipCatalog:", v21, v22, location, length, v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __131__PXStoryRecipeClipModuleProvider_provideModulesForMomentClipRange_withClipCatalog_maxModuleLength_maxEmptySpaceLength_usingBlock___block_invoke;
  v45[3] = &unk_1E5135800;
  v24 = v37;
  v46 = v24;
  v38 = v23;
  objc_msgSend(v23, "enumerateIndexesUsingBlock:", v45);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v25 = v21;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v31 = objc_msgSend(v30, "moduleType");
        v32 = objc_msgSend(v30, "range");
        if (v32 < v32 + v33)
        {
          v34 = v32;
          v35 = v33;
          v36 = 0;
          do
          {
            (*((void (**)(id, BOOL, uint64_t, _QWORD, unint64_t))v24 + 2))(v24, v36 == 0, v31, 0, v34 + v36);
            ++v36;
          }
          while (v35 != v36);
        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v27);
  }

}

- (PFStoryAutoEditConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

uint64_t __131__PXStoryRecipeClipModuleProvider_provideModulesForMomentClipRange_withClipCatalog_maxModuleLength_maxEmptySpaceLength_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __113__PXStoryRecipeClipModuleProvider__splitEmptySpaceInModules_maxEmptySpaceLength_momentClipRange_withClipCatalog___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (a3 > *(_QWORD *)(a1 + 48))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a2, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "splitRanges:maxLength:", v7, *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "rangeValue", (_QWORD)v15);
          if (v14 != a2)
            objc_msgSend(*(id *)(a1 + 40), "addIndex:", v14);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

@end
