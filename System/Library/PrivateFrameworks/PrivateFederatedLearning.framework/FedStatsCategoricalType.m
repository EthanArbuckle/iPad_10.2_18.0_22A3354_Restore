@implementation FedStatsCategoricalType

- (void)setVersion:(unint64_t)a3
{
  NSArray *categories;
  NSDictionary *categoryMap;
  FedStatsSQLiteCategoryDatabase *categoryFile;

  self->_version = a3;
  categories = self->_categories;
  self->_categories = 0;

  categoryMap = self->_categoryMap;
  self->_categoryMap = 0;

  categoryFile = self->_categoryFile;
  self->_categoryFile = 0;

}

- (FedStatsCategoricalType)initWithCategories:(id)a3
{
  id v5;
  FedStatsCategoricalType *v6;
  FedStatsCategoricalType *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCategoricalType;
  v6 = -[FedStatsBoundedULongType initWithBound:](&v9, sel_initWithBound_, objc_msgSend(v5, "count"));
  v7 = v6;
  if (v6)
  {
    -[FedStatsCategoricalType setVersion:](v6, "setVersion:", 1);
    objc_storeStrong((id *)&v7->_categories, a3);
  }

  return v7;
}

- (FedStatsCategoricalType)initWithCategoryMap:(id)a3 categories:(id)a4
{
  id v7;
  id v8;
  FedStatsCategoricalType *v9;
  FedStatsCategoricalType *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FedStatsCategoricalType;
  v9 = -[FedStatsBoundedULongType initWithBound:](&v12, sel_initWithBound_, objc_msgSend(v8, "count"));
  v10 = v9;
  if (v9)
  {
    -[FedStatsCategoricalType setVersion:](v9, "setVersion:", 2);
    objc_storeStrong((id *)&v10->_categoryMap, a3);
    objc_storeStrong((id *)&v10->_categories, a4);
  }

  return v10;
}

- (FedStatsCategoricalType)initWithCategoryFile:(id)a3
{
  id v5;
  FedStatsCategoricalType *v6;
  FedStatsCategoricalType *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCategoricalType;
  v6 = -[FedStatsBoundedULongType initWithBound:](&v9, sel_initWithBound_, objc_msgSend(v5, "dimensionality"));
  v7 = v6;
  if (v6)
  {
    -[FedStatsCategoricalType setVersion:](v6, "setVersion:", 3);
    objc_storeStrong((id *)&v7->_categoryFile, a3);
  }

  return v7;
}

+ (id)createFromDict:(id)a3 possibleError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  uint64_t v43;
  const __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  Class v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _QWORD v77[6];

  v77[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("categories"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("categoryMap"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("categoryFile"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v10 = (v7 != 0) + 1;
  else
    v10 = v7 != 0;
  if (v9)
    ++v10;
  if (v10 != 1)
  {
    if (a4)
    {
      v77[0] = CFSTR("categories");
      v77[1] = CFSTR("categoryMap");
      v77[2] = CFSTR("categoryFile");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 3);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("You're allowed to have exactly one of {%@} as key in parameters"), v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 301, v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_59;
    }
    goto LABEL_61;
  }
  v55 = (Class)a1;
  if (!v7)
  {
    if (v8)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("categoryMap"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v11 = v11;
        v23 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v66;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v66 != v25)
                objc_enumerationMutation(v11);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_49;
            }
            v24 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
          }
          while (v24);
        }

        objc_msgSend(v11, "allKeys");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "sortedArrayUsingSelector:", sel_compare_);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v30 = v28;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
        if (!v31)
          goto LABEL_48;
        v54 = 0;
        v32 = *(_QWORD *)v62;
        v50 = v30;
        v46 = *(_QWORD *)v62;
        while (1)
        {
          v33 = 0;
          v47 = v31;
          do
          {
            if (*(_QWORD *)v62 != v32)
              objc_enumerationMutation(v30);
            v48 = v33;
            v52 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v33);
            objc_msgSend(v11, "objectForKey:");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a4)
              {
                +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v12);
                *a4 = (id)objc_claimAutoreleasedReturnValue();
              }
LABEL_71:

LABEL_72:
              v20 = 0;
              goto LABEL_73;
            }
            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            v49 = v34;
            obj = v34;
            v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
            if (!v35)
              goto LABEL_46;
            v36 = v35;
            v53 = *(_QWORD *)v58;
            while (2)
            {
              for (j = 0; j != v36; ++j)
              {
                if (*(_QWORD *)v58 != v53)
                  objc_enumerationMutation(obj);
                v38 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v34 = v49;
                  v30 = v50;
                  if (a4)
                  {
                    v45 = v12;
                    goto LABEL_69;
                  }
LABEL_70:

                  goto LABEL_71;
                }
                objc_msgSend(v29, "allKeys");
                v39 = v29;
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v40, "containsObject:", v38);

                if (v41)
                {
                  v29 = v39;
                  v34 = v49;
                  v30 = v50;
                  if (a4)
                  {
                    v45 = CFSTR("Subcategories must be distinct");
LABEL_69:
                    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v45);
                    *a4 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  goto LABEL_70;
                }
                +[FedStatsCategoricalTypeSubcategory categoryWithSuperCategory:index:](FedStatsCategoricalTypeSubcategory, "categoryWithSuperCategory:index:", v52, v54);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "setObject:forKey:", v42, v38);

                v29 = v39;
              }
              v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
              a1 = v55;
              if (v36)
                continue;
              break;
            }
LABEL_46:

            ++v54;
            v33 = v48 + 1;
            v30 = v50;
            v32 = v46;
          }
          while (v48 + 1 != v47);
          v31 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
          if (!v31)
          {
LABEL_48:

            v43 = objc_msgSend(objc_alloc((Class)a1), "initWithCategoryMap:categories:", v29, v30);
            goto LABEL_56;
          }
        }
      }
      goto LABEL_57;
    }
    if (v9)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("categoryFile"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v56 = 0;
        +[FedStatsSQLiteCategoryDatabase databaseWithFileURL:error:](FedStatsSQLiteCategoryDatabase, "databaseWithFileURL:error:", v11, &v56);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v56;
        if (v29)
        {
          v43 = objc_msgSend(objc_alloc((Class)a1), "initWithCategoryFile:", v29);
LABEL_56:
          v20 = (void *)v43;
        }
        else
        {
          if (!a4)
            goto LABEL_72;
          +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v30, CFSTR("Cannot create database from the provided URL"));
          v20 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_73:

        goto LABEL_60;
      }
      goto LABEL_57;
    }
LABEL_61:
    v20 = 0;
    goto LABEL_62;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("categories"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_57;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v11 = v11;
  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v70;
LABEL_11:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v70 != v15)
        objc_enumerationMutation(v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
        if (v14)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_49:
    if (a4)
    {
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_59;
  }
LABEL_17:

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  v19 = objc_msgSend(v11, "count");

  if (v18 != v19)
  {
LABEL_57:
    if (a4)
    {
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v12);
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_60;
    }
LABEL_59:
    v20 = 0;
    goto LABEL_60;
  }
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCategories:", v11);
LABEL_60:

LABEL_62:
  return v20;
}

- (id)encodeToIndex:(id)a3 possibleError:(id *)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v17;

  v6 = a3;
  v7 = -[FedStatsCategoricalType version](self, "version");
  switch(v7)
  {
    case 3uLL:
      -[FedStatsCategoricalType categoryFile](self, "categoryFile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      objc_msgSend(v11, "encode:error:", v6, &v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v17;

      if (v10)
      {
        v13 = v10;
      }
      else if (a4)
      {
        +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 401, v12, CFSTR("Error when encoding categorical type over database"));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      break;
    case 2uLL:
      -[FedStatsCategoricalType categoryMap](self, "categoryMap");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "index") + 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = &unk_24D0E0BA0;
      }

      break;
    case 1uLL:
      -[FedStatsCategoricalType categories](self, "categories");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "indexOfObject:", v6);

      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = &unk_24D0E0BA0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9 + 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      break;
    default:
      if (a4)
      {
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, CFSTR("The categorical type version is not supported"));
        v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      break;
  }

  return v10;
}

- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v15;

  v6 = a3;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (a4)
    {
      v10 = CFSTR("The decoder can only work with a non-null number type");
      v11 = 500;
LABEL_8:
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v11, v10);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  v7 = -[FedStatsCategoricalType version](self, "version");
  if (v7 - 1 < 2)
  {
    if (objc_msgSend(v6, "unsignedLongValue"))
    {
      -[FedStatsCategoricalType categories](self, "categories");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "unsignedLongValue") - 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[FedStatsCategoricalType kOutOfCategories](self, "kOutOfCategories");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_16;
  }
  if (v7 != 3)
  {
    if (a4)
    {
      v10 = CFSTR("The categorical type version is not supported");
      v11 = 900;
      goto LABEL_8;
    }
    goto LABEL_15;
  }
  -[FedStatsCategoricalType categoryFile](self, "categoryFile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v12, "decode:error:", objc_msgSend(v6, "unsignedLongValue"), &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v13 = v9;

LABEL_16:
  return v9;
}

- (int64_t)dataType
{
  return 3;
}

- (id)kOutOfCategories
{
  return CFSTR("FedStatsCategoricalDataOutOfBounds");
}

- (id)sampleForIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (!a3)
  {
LABEL_6:
    -[FedStatsCategoricalType kOutOfCategories](self, "kOutOfCategories");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = -[FedStatsCategoricalType version](self, "version");
  if (v5 == 3)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FedStatsCategoricalType decodeFromIndex:possibleError:](self, "decodeFromIndex:possibleError:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  if (v5 != 2)
  {
    if (v5 == 1)
      goto LABEL_5;
    goto LABEL_6;
  }
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[FedStatsCategoricalType categoryMap](self, "categoryMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __42__FedStatsCategoricalType_sampleForIndex___block_invoke;
  v11[3] = &unk_24D0D77B0;
  v11[4] = &v12;
  v11[5] = a3;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

  objc_msgSend((id)v13[5], "objectAtIndex:", arc4random_uniform(objc_msgSend((id)v13[5], "count")));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v12, 8);

  return v10;
}

void __42__FedStatsCategoricalType_sampleForIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  v5 = *(_QWORD *)(a1 + 40) - 1;
  if (v5 == objc_msgSend(a3, "index"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);

}

- (unint64_t)version
{
  return self->_version;
}

- (NSArray)categories
{
  return self->_categories;
}

- (NSDictionary)categoryMap
{
  return self->_categoryMap;
}

- (FedStatsSQLiteCategoryDatabase)categoryFile
{
  return self->_categoryFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryFile, 0);
  objc_storeStrong((id *)&self->_categoryMap, 0);
  objc_storeStrong((id *)&self->_categories, 0);
}

@end
