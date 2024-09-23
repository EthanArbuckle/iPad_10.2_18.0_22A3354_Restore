@implementation REMLExplanationFormatter

- (REMLExplanationFormatter)init
{
  REMLExplanationFormatter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)REMLExplanationFormatter;
  v2 = -[REMLExplanationFormatter init](&v4, sel_init);
  if (v2)
    v2->_style = REMLExplanationsEnabled();
  return v2;
}

- (id)descriptionFromExplanations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  __CFString *v31;
  id v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v31 = &stru_24CF92178;
    goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v33 = v4;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (!v7)
    goto LABEL_19;
  v8 = v7;
  v9 = *(_QWORD *)v41;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v41 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v35;
LABEL_14:
        objc_msgSend(v12, "addObject:", v11, v33);
        goto LABEL_15;
      }
      if (!objc_msgSend(v5, "count"))
      {
LABEL_13:
        v12 = v5;
        goto LABEL_14;
      }
      v13 = 0;
      while (1)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v13, v33);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "canCombineExplanationWithExplanation:", v14))
          break;

        if (++v13 >= (unint64_t)objc_msgSend(v5, "count"))
          goto LABEL_13;
      }
      objc_msgSend(v11, "explanationByCombiningWithExplanation:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setObject:atIndexedSubscript:", v15, v13);
LABEL_15:
      ++v10;
    }
    while (v10 != v8);
    v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    v8 = v16;
  }
  while (v16);
LABEL_19:

  +[_REMLFeatureExplanation combinedExplanationsFromExplanations:](_REMLFeatureExplanation, "combinedExplanationsFromExplanations:", v35);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v18);

  if (objc_msgSend(v5, "count"))
  {
    v19 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v19, v33);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "shouldProvideExplanation") & 1) == 0)
        objc_msgSend(v5, "removeObjectAtIndex:", v19--);

      ++v19;
    }
    while (v19 < objc_msgSend(v5, "count"));
  }
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_36, v33);
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v5, "count");
  v23 = 5;
  if (!self->_style)
    v23 = 1;
  v36 = 0u;
  v37 = 0u;
  if (v22 >= v23)
    v24 = v23;
  else
    v24 = v22;
  v38 = 0uLL;
  v39 = 0uLL;
  objc_msgSend(v5, "subarrayWithRange:", 0, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "explanationWithStyle:", self->_style);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "appendString:", v30);

        objc_msgSend(v21, "appendString:", CFSTR("\n"));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v27);
  }

  v31 = (__CFString *)objc_msgSend(v21, "copy");
  v4 = v34;
LABEL_38:

  return v31;
}

uint64_t __56__REMLExplanationFormatter_descriptionFromExplanations___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rankExplanationToExplanation:");
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

@end
