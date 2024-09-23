@implementation PGTitleSpecTimeArgument

- (PGTitleSpecTimeArgument)initWithTimeType:(unint64_t)a3
{
  PGTitleSpecTimeArgument *v4;
  PGTitleSpecTimeArgument *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGTitleSpecTimeArgument;
  v4 = -[PGTitleSpecTimeArgument init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    -[PGTitleSpecArgument setRequiresInput:](v4, "setRequiresInput:", a3 == 2);
  }
  return v5;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  switch(self->_type)
  {
    case 0uLL:
      -[PGTitleSpecTimeArgument _birthdayTitleWithMomentNodes:](self, "_birthdayTitleWithMomentNodes:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      -[PGTitleSpecTimeArgument _anniversaryTitleWithMomentNodes:](self, "_anniversaryTitleWithMomentNodes:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      -[PGTitleSpecTimeArgument _yearsAgoTitle](self, "_yearsAgoTitle");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
      -[PGTitleSpecTimeArgument _holidayTitleWithMomentNodes:](self, "_holidayTitleWithMomentNodes:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v9 = (void *)v8;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5
{
  return 0;
}

- (id)_yearsAgoTitle
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PGTitleSpecArgument inputVariable](self, "inputVariable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "integerValue");
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PGMemoryTitleFormatWithNumberOfYears %lu"), CFSTR("PGMemoryTitleFormatWithNumberOfYears %lu"), CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_anniversaryTitleWithMomentNodes:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[8];
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v21[0] = v9;
        v21[1] = 3221225472;
        v21[2] = __60__PGTitleSpecTimeArgument__anniversaryTitleWithMomentNodes___block_invoke;
        v21[3] = &unk_1E8434020;
        v22 = v4;
        objc_msgSend(v11, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("ANNIVERSARY"), 301, v21);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "loggingConnection");
      v14 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "More than one person with anniversary found for momentNodes. Taking any person.", buf, 2u);
      }

    }
    objc_msgSend(v12, "anniversaryDateComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "year");
    v17 = 0;
    if (v15 && v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PGTitleSpecTimeArgument _yearsAgoStringWithEventNodes:relativeToDateComponents:](self, "_yearsAgoStringWithEventNodes:relativeToDateComponents:", v5, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_birthdayTitleWithMomentNodes:(id)a3
{
  id v4;
  PGGraphMomentNodeCollection *v5;
  void *v6;
  void *v7;
  PGGraphMomentNodeCollection *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = [PGGraphMomentNodeCollection alloc];
    objc_msgSend(v4, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "graph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MAElementCollection initWithSet:graph:](v5, "initWithSet:graph:", v4, v7);

    -[PGGraphMomentNodeCollection birthdayPersonNodes](v8, "birthdayPersonNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "temporarySet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count") == 1)
    {
      objc_msgSend(v10, "anyObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "birthdayDateComponents");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "year");
      v14 = 0;
      if (v12 && v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[PGTitleSpecTimeArgument _yearsAgoStringWithEventNodes:relativeToDateComponents:](self, "_yearsAgoStringWithEventNodes:relativeToDateComponents:", v4, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_yearsAgoStringWithEventNodes:(id)a3 relativeToDateComponents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PGUseOrdinalAge"), CFSTR("PGUseOrdinalAge"), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8 && (objc_msgSend(v8, "isEqualToString:", CFSTR("1")) & 1) != 0;
  +[PGTimeTitleUtility numberOfYearsAgoWithMomentNodes:relativeToDateComponents:useOrdinal:](PGTimeTitleUtility, "numberOfYearsAgoWithMomentNodes:relativeToDateComponents:useOrdinal:", v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_holidayTitleWithMomentNodes:(id)a3
{
  void *v3;
  void *v4;

  +[PGCommonTitleUtility dateNodesFromMomentNodes:](PGCommonTitleUtility, "dateNodesFromMomentNodes:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGCommonTitleUtility holidayNameForDateNodes:](PGCommonTitleUtility, "holidayNameForDateNodes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

uint64_t __60__PGTitleSpecTimeArgument__anniversaryTitleWithMomentNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (id)argumentWithTimeType:(unint64_t)a3
{
  return -[PGTitleSpecTimeArgument initWithTimeType:]([PGTitleSpecTimeArgument alloc], "initWithTimeType:", a3);
}

@end
