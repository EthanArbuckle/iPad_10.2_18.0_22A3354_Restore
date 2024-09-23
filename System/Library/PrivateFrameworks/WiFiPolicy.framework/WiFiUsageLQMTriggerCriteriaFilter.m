@implementation WiFiUsageLQMTriggerCriteriaFilter

- (NSMutableSet)features
{
  return self->_features;
}

- (NSPredicate)filterSamplesPredicate
{
  return self->_filterSamplesPredicate;
}

- (NSMutableArray)criterias
{
  return self->_criterias;
}

- (WiFiUsageLQMTriggerCriteriaFilter)initWith:(id)a3 forFields:(id)a4 andFeatures:(id)a5
{
  WiFiUsageLQMTriggerCriteriaFilter *v5;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  uint64_t i;
  uint64_t v25;
  WiFiUsageLQMTriggerCriteria *v26;
  void *v27;
  WiFiUsageLQMTriggerCriteria *v28;
  WiFiUsageLQMTriggerCriteriaFilter *v29;
  int v30;
  void *v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  id v36;
  objc_super v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "objectForKey:", CFSTR("type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

  }
  else
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("test"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      NSLog(CFSTR("%s -  Failed to parse (Criteria does not contain key 'type'): %@"), "-[WiFiUsageLQMTriggerCriteriaFilter initWith:forFields:andFeatures:]", v9);
LABEL_36:
      v5 = 0;
      goto LABEL_37;
    }
  }
  v36 = (id)objc_opt_new();
  v14 = (void *)objc_opt_new();
  objc_msgSend(v9, "objectForKey:", CFSTR("type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("type"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("type"));
      v5 = (WiFiUsageLQMTriggerCriteriaFilter *)objc_claimAutoreleasedReturnValue();
      v17 = -[WiFiUsageLQMTriggerCriteriaFilter isEqualToString:](v5, "isEqualToString:", CFSTR("filter"));

      if (v17)
      {
        objc_msgSend(v9, "objectForKey:", CFSTR("filterconditions"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v9, "objectForKey:", CFSTR("filterconditions"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend(v9, "objectForKey:", CFSTR("conditions")),
                (v5 = (WiFiUsageLQMTriggerCriteriaFilter *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            objc_msgSend(v9, "objectForKey:", CFSTR("conditions"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v9, "objectForKey:", CFSTR("filterconditions"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "parseCriteria:intoRequiredFields:andFeatures:forFields:withType:isFilter:", v32, 0, 0, v10, 0, 1);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = 0u;
                v41 = 0u;
                v38 = 0u;
                v39 = 0u;
                objc_msgSend(v9, "objectForKey:", CFSTR("conditions"));
                obj = (id)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
                if (v35)
                {
                  v34 = *(_QWORD *)v39;
                  while (2)
                  {
                    for (i = 0; i != v35; ++i)
                    {
                      if (*(_QWORD *)v39 != v34)
                        objc_enumerationMutation(obj);
                      v25 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        NSLog(CFSTR("%s -  Failed to parse keys 'conditions': %@"), "-[WiFiUsageLQMTriggerCriteriaFilter initWith:forFields:andFeatures:]", v9);

                        goto LABEL_34;
                      }
                      v26 = -[WiFiUsageLQMTriggerCriteria initWith:forFields:andFeatures:]([WiFiUsageLQMTriggerCriteria alloc], "initWith:forFields:andFeatures:", v25, v10, v36);
                      if (v26)
                      {
                        +[WiFiUsageLQMTriggerCriteria predicateNoQuotes:](WiFiUsageLQMTriggerCriteria, "predicateNoQuotes:", v23);
                        v5 = (WiFiUsageLQMTriggerCriteriaFilter *)objc_claimAutoreleasedReturnValue();
                        -[WiFiUsageLQMTriggerCriteria setFilterCriteria:](v26, "setFilterCriteria:", v5);

                        objc_msgSend(v14, "addObject:", v26);
                      }

                    }
                    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
                    if (v35)
                      continue;
                    break;
                  }
                }

              }
              else
              {
                v23 = 0;
              }

              goto LABEL_26;
            }
          }
          else
          {

          }
        }
        NSLog(CFSTR("%s -  Failed to parse keys 'filterconditions' and/or 'conditions': %@"), "-[WiFiUsageLQMTriggerCriteriaFilter initWith:forFields:andFeatures:]", v9);
        goto LABEL_33;
      }
    }
    else
    {

    }
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("test"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = -[WiFiUsageLQMTriggerCriteria initWith:forFields:andFeatures:]([WiFiUsageLQMTriggerCriteria alloc], "initWith:forFields:andFeatures:", v9, v10, v11);
    objc_msgSend(v14, "addObject:", v28);

    v22 = 0;
    v23 = 0;
LABEL_26:
    if (objc_msgSend(v14, "count"))
    {
      v37.receiver = self;
      v37.super_class = (Class)WiFiUsageLQMTriggerCriteriaFilter;
      v29 = -[WiFiUsageLQMTriggerCriteriaFilter init](&v37, sel_init);
      objc_storeStrong((id *)&v29->_filterSamplesPredicate, v23);
      objc_storeStrong((id *)&v29->_features, v36);
      objc_storeStrong((id *)&v29->_criterias, v14);
      self = v29;
      v30 = 0;
      v5 = self;
    }
    else
    {
      v30 = 0;
      v5 = 0;
    }
    goto LABEL_35;
  }
  NSLog(CFSTR("%s -  Failed to parse (Criteria does not contain key 'test'): %@"), "-[WiFiUsageLQMTriggerCriteriaFilter initWith:forFields:andFeatures:]", v9);
LABEL_33:
  v22 = 0;
  v23 = 0;
LABEL_34:
  v30 = 1;
LABEL_35:

  if (v30)
    goto LABEL_36;
LABEL_37:

  return v5;
}

- (id)description
{
  return (id)-[NSMutableArray description](self->_criterias, "description");
}

- (void)setFilterSamplesPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_filterSamplesPredicate, a3);
}

- (void)setCriterias:(id)a3
{
  objc_storeStrong((id *)&self->_criterias, a3);
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_criterias, 0);
  objc_storeStrong((id *)&self->_filterSamplesPredicate, 0);
}

@end
