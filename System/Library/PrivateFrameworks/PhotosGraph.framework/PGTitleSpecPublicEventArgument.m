@implementation PGTitleSpecPublicEventArgument

- (PGTitleSpecPublicEventArgument)initWithPublicEventType:(unint64_t)a3
{
  PGTitleSpecPublicEventArgument *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGTitleSpecPublicEventArgument;
  result = -[PGTitleSpecPublicEventArgument init](&v5, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_shouldUseLongPublicEventTitle = 0;
  }
  return result;
}

- (PGTitleSpecPublicEventArgument)initWithPublicEventType:(unint64_t)a3 shouldUseLongPublicEventTitle:(BOOL)a4
{
  PGTitleSpecPublicEventArgument *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGTitleSpecPublicEventArgument;
  result = -[PGTitleSpecPublicEventArgument init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_shouldUseLongPublicEventTitle = a4;
  }
  return result;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[PGTitleSpecPublicEventArgument _commonPublicEventNodeForMomentNodes:](self, "_commonPublicEventNodeForMomentNodes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpecPublicEventArgument _resolvedStringWithPublicEventNode:inMomentNodes:](self, "_resolvedStringWithPublicEventNode:inMomentNodes:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "graph");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v16, "type", (_QWORD)v20) == 21)
        {
          objc_msgSend(v16, "nodeInGraph:", v10);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGTitleSpecPublicEventArgument _resolvedStringWithPublicEventNode:inMomentNodes:](self, "_resolvedStringWithPublicEventNode:inMomentNodes:", v18, v7);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_11:

  return v17;
}

- (id)_resolvedStringWithPublicEventNode:(id)a3 inMomentNodes:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    switch(self->_type)
    {
      case 0uLL:
        -[PGTitleSpecPublicEventArgument _generateTitleWithEventNameForPublicEventNode:](self, "_generateTitleWithEventNameForPublicEventNode:", v6);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 1uLL:
        -[PGTitleSpecPublicEventArgument _generateTitleWithBusinessNameForPublicEventNode:](self, "_generateTitleWithBusinessNameForPublicEventNode:", v6);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 2uLL:
        -[PGTitleSpecPublicEventArgument _generateTitleWithPerformerNamesForPublicEventNode:](self, "_generateTitleWithPerformerNamesForPublicEventNode:", v6);
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 3uLL:
        -[PGTitleSpecPublicEventArgument _generateTitleWithCategoryNameForPublicEventNode:](self, "_generateTitleWithCategoryNameForPublicEventNode:", v6);
        v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v10 = (void *)v8;
        break;
      default:
        v10 = 0;
        break;
    }
    v11 = objc_msgSend(v10, "length");
    if (!v11)
      goto LABEL_14;
    v12 = 45;
    if (!self->_shouldUseLongPublicEventTitle)
      v12 = 26;
    if (v11 <= v12)
    {
      v9 = v10;
      v10 = v9;
    }
    else
    {
LABEL_14:
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }

  return v9;
}

- (id)_commonPublicEventNodeForMomentNodes:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  id obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v3;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v40)
  {
    v5 = 0;
    v39 = *(_QWORD *)v52;
    do
    {
      v6 = 0;
      do
      {
        v42 = v5;
        if (*(_QWORD *)v52 != v39)
          objc_enumerationMutation(obj);
        v41 = v6;
        v7 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v6);
        v8 = objc_msgSend(v7, "numberOfAssets");
        objc_msgSend(v7, "publicEventNodes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v48 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
              objc_msgSend(v4, "objectForKey:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "unsignedIntegerValue") + v8);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKey:", v16, v14);

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
          }
          while (v11);
        }
        v5 = v8 + v42;

        v6 = v41 + 1;
      }
      while (v41 + 1 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v40);
    v17 = (double)v5;
  }
  else
  {
    v17 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyEnumerator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v44 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
        objc_msgSend(v4, "objectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "doubleValue");
        if (v28 / v17 >= 0.75)
          objc_msgSend(v18, "addObject:", v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
    }
    while (v23);
  }

  if (objc_msgSend(v18, "count") == 1)
  {
    objc_msgSend(v18, "anyObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "categories");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphPublicEventNode unsupportedCategoriesForTitles](PGGraphPublicEventNode, "unsupportedCategoriesForTitles");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "intersectsSet:", v31);

    if (v32)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "loggingConnection");
      v34 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v29, "name");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v56 = v35;
        _os_log_impl(&dword_1CA237000, v34, OS_LOG_TYPE_INFO, "Public event node has an unsupported category for titles \"%@\", buf, 0xCu);

      }
      v36 = 0;
    }
    else
    {
      v36 = v29;
    }

  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (id)_generateTitleWithEventNameForPublicEventNode:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_cleanUpEventName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)_generateTitleWithBusinessNameForPublicEventNode:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "businessNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_generateTitleWithPerformerNamesForPublicEventNode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __85__PGTitleSpecPublicEventArgument__generateTitleWithPerformerNamesForPublicEventNode___block_invoke;
  v18[3] = &unk_1E84290F0;
  v18[4] = &v19;
  objc_msgSend(v3, "enumeratePublicEventCategoryNodesUsingBlock:", v18);
  if (*((_BYTE *)v20 + 24))
  {
    objc_msgSend(v3, "performers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "count"))
    {
      v9 = 0;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", 0, 1, sel_localizedCompare_);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "count");
    if (v8 == 3)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("PGMemoryPublicEventTitleFormatWithPeformer %@ secondPerformer %@ thirdPerformer %@"), CFSTR("PGMemoryPublicEventTitleFormatWithPeformer %@ secondPerformer %@ thirdPerformer %@"), CFSTR("Localizable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithFormat:", v15, v10, v11, v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v8 != 2)
      {
        if (v8 == 1)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }
        goto LABEL_13;
      }
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PGMemoryPublicEventTitleFormatWithPeformer %@ otherPerformer %@"), CFSTR("PGMemoryPublicEventTitleFormatWithPeformer %@ otherPerformer %@"), CFSTR("Localizable"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringWithFormat:", v14, v10, v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_13:
    goto LABEL_14;
  }
  v9 = 0;
LABEL_15:
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (id)_generateTitleWithCategoryNameForPublicEventNode:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  unint64_t v13;
  unint64_t v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "preciseLocalizedCategoryNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v19;
      v10 = -1;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "length", (_QWORD)v18);
          if (v13 - 1 <= 0x19 && v13 < v10)
          {
            v15 = v13;
            v16 = v12;

            v8 = v16;
            v10 = v15;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)shouldUseLongPublicEventTitle
{
  return self->_shouldUseLongPublicEventTitle;
}

void __85__PGTitleSpecPublicEventArgument__generateTitleWithPerformerNamesForPublicEventNode___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  id v11;

  objc_msgSend(a2, "label");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B228], "nightLife");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", v5))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = a1 + 32;
    *(_BYTE *)(*(_QWORD *)(v7 + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4B228], "musicConcerts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "isEqualToString:", v8);
    v10 = *(_QWORD *)(a1 + 32);
    v6 = a1 + 32;
    *(_BYTE *)(*(_QWORD *)(v10 + 8) + 24) = v9;

  }
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 24);

}

+ (id)argumentWithPublicEventType:(unint64_t)a3
{
  return -[PGTitleSpecPublicEventArgument initWithPublicEventType:]([PGTitleSpecPublicEventArgument alloc], "initWithPublicEventType:", a3);
}

+ (id)argumentWithPublicEventType:(unint64_t)a3 shouldUseLongPublicEventTitle:(BOOL)a4
{
  return -[PGTitleSpecPublicEventArgument initWithPublicEventType:shouldUseLongPublicEventTitle:]([PGTitleSpecPublicEventArgument alloc], "initWithPublicEventType:shouldUseLongPublicEventTitle:", a3, a4);
}

+ (id)_cleanUpEventName:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "pg_stringByRemovingParenthesesAndBrackets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pg_stringByRemovingDates");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

@end
