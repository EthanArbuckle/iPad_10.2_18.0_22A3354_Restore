@implementation TPPBPolicyDocument

- (void)setPolicyVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_policyVersion = a3;
}

- (void)setHasPolicyVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPolicyVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearModelToCategorys
{
  -[NSMutableArray removeAllObjects](self->_modelToCategorys, "removeAllObjects");
}

- (void)addModelToCategory:(id)a3
{
  id v4;
  NSMutableArray *modelToCategorys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  modelToCategorys = self->_modelToCategorys;
  v8 = v4;
  if (!modelToCategorys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_modelToCategorys;
    self->_modelToCategorys = v6;

    v4 = v8;
    modelToCategorys = self->_modelToCategorys;
  }
  -[NSMutableArray addObject:](modelToCategorys, "addObject:", v4);

}

- (unint64_t)modelToCategorysCount
{
  return -[NSMutableArray count](self->_modelToCategorys, "count");
}

- (id)modelToCategoryAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_modelToCategorys, "objectAtIndex:", a3);
}

- (void)clearCategoriesByViews
{
  -[NSMutableArray removeAllObjects](self->_categoriesByViews, "removeAllObjects");
}

- (void)addCategoriesByView:(id)a3
{
  id v4;
  NSMutableArray *categoriesByViews;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  categoriesByViews = self->_categoriesByViews;
  v8 = v4;
  if (!categoriesByViews)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_categoriesByViews;
    self->_categoriesByViews = v6;

    v4 = v8;
    categoriesByViews = self->_categoriesByViews;
  }
  -[NSMutableArray addObject:](categoriesByViews, "addObject:", v4);

}

- (unint64_t)categoriesByViewsCount
{
  return -[NSMutableArray count](self->_categoriesByViews, "count");
}

- (id)categoriesByViewAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_categoriesByViews, "objectAtIndex:", a3);
}

- (void)clearIntroducersByCategorys
{
  -[NSMutableArray removeAllObjects](self->_introducersByCategorys, "removeAllObjects");
}

- (void)addIntroducersByCategory:(id)a3
{
  id v4;
  NSMutableArray *introducersByCategorys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  introducersByCategorys = self->_introducersByCategorys;
  v8 = v4;
  if (!introducersByCategorys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_introducersByCategorys;
    self->_introducersByCategorys = v6;

    v4 = v8;
    introducersByCategorys = self->_introducersByCategorys;
  }
  -[NSMutableArray addObject:](introducersByCategorys, "addObject:", v4);

}

- (unint64_t)introducersByCategorysCount
{
  return -[NSMutableArray count](self->_introducersByCategorys, "count");
}

- (id)introducersByCategoryAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_introducersByCategorys, "objectAtIndex:", a3);
}

- (void)clearRedactions
{
  -[NSMutableArray removeAllObjects](self->_redactions, "removeAllObjects");
}

- (void)addRedactions:(id)a3
{
  id v4;
  NSMutableArray *redactions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  redactions = self->_redactions;
  v8 = v4;
  if (!redactions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_redactions;
    self->_redactions = v6;

    v4 = v8;
    redactions = self->_redactions;
  }
  -[NSMutableArray addObject:](redactions, "addObject:", v4);

}

- (unint64_t)redactionsCount
{
  return -[NSMutableArray count](self->_redactions, "count");
}

- (id)redactionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_redactions, "objectAtIndex:", a3);
}

- (void)clearKeyViewMappings
{
  -[NSMutableArray removeAllObjects](self->_keyViewMappings, "removeAllObjects");
}

- (void)addKeyViewMapping:(id)a3
{
  id v4;
  NSMutableArray *keyViewMappings;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  keyViewMappings = self->_keyViewMappings;
  v8 = v4;
  if (!keyViewMappings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_keyViewMappings;
    self->_keyViewMappings = v6;

    v4 = v8;
    keyViewMappings = self->_keyViewMappings;
  }
  -[NSMutableArray addObject:](keyViewMappings, "addObject:", v4);

}

- (unint64_t)keyViewMappingsCount
{
  return -[NSMutableArray count](self->_keyViewMappings, "count");
}

- (id)keyViewMappingAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_keyViewMappings, "objectAtIndex:", a3);
}

- (void)clearUserControllableViews
{
  -[NSMutableArray removeAllObjects](self->_userControllableViews, "removeAllObjects");
}

- (void)addUserControllableViews:(id)a3
{
  id v4;
  NSMutableArray *userControllableViews;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  userControllableViews = self->_userControllableViews;
  v8 = v4;
  if (!userControllableViews)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_userControllableViews;
    self->_userControllableViews = v6;

    v4 = v8;
    userControllableViews = self->_userControllableViews;
  }
  -[NSMutableArray addObject:](userControllableViews, "addObject:", v4);

}

- (unint64_t)userControllableViewsCount
{
  return -[NSMutableArray count](self->_userControllableViews, "count");
}

- (id)userControllableViewsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_userControllableViews, "objectAtIndex:", a3);
}

- (void)clearPiggybackViews
{
  -[NSMutableArray removeAllObjects](self->_piggybackViews, "removeAllObjects");
}

- (void)addPiggybackViews:(id)a3
{
  id v4;
  NSMutableArray *piggybackViews;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  piggybackViews = self->_piggybackViews;
  v8 = v4;
  if (!piggybackViews)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_piggybackViews;
    self->_piggybackViews = v6;

    v4 = v8;
    piggybackViews = self->_piggybackViews;
  }
  -[NSMutableArray addObject:](piggybackViews, "addObject:", v4);

}

- (unint64_t)piggybackViewsCount
{
  return -[NSMutableArray count](self->_piggybackViews, "count");
}

- (id)piggybackViewsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_piggybackViews, "objectAtIndex:", a3);
}

- (void)clearPriorityViews
{
  -[NSMutableArray removeAllObjects](self->_priorityViews, "removeAllObjects");
}

- (void)addPriorityViews:(id)a3
{
  id v4;
  NSMutableArray *priorityViews;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  priorityViews = self->_priorityViews;
  v8 = v4;
  if (!priorityViews)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_priorityViews;
    self->_priorityViews = v6;

    v4 = v8;
    priorityViews = self->_priorityViews;
  }
  -[NSMutableArray addObject:](priorityViews, "addObject:", v4);

}

- (unint64_t)priorityViewsCount
{
  return -[NSMutableArray count](self->_priorityViews, "count");
}

- (id)priorityViewsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_priorityViews, "objectAtIndex:", a3);
}

- (void)clearInheritedExcludedViews
{
  -[NSMutableArray removeAllObjects](self->_inheritedExcludedViews, "removeAllObjects");
}

- (void)addInheritedExcludedViews:(id)a3
{
  id v4;
  NSMutableArray *inheritedExcludedViews;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  inheritedExcludedViews = self->_inheritedExcludedViews;
  v8 = v4;
  if (!inheritedExcludedViews)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_inheritedExcludedViews;
    self->_inheritedExcludedViews = v6;

    v4 = v8;
    inheritedExcludedViews = self->_inheritedExcludedViews;
  }
  -[NSMutableArray addObject:](inheritedExcludedViews, "addObject:", v4);

}

- (unint64_t)inheritedExcludedViewsCount
{
  return -[NSMutableArray count](self->_inheritedExcludedViews, "count");
}

- (id)inheritedExcludedViewsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_inheritedExcludedViews, "objectAtIndex:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)TPPBPolicyDocument;
  -[TPPBPolicyDocument description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBPolicyDocument dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  void *v33;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t n;
  void *v39;
  NSMutableArray *userControllableViews;
  NSMutableArray *piggybackViews;
  NSMutableArray *priorityViews;
  NSMutableArray *inheritedExcludedViews;
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
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_policyVersion);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("policyVersion"));

  }
  if (-[NSMutableArray count](self->_modelToCategorys, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_modelToCategorys, "count"));
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v6 = self->_modelToCategorys;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v62 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("modelToCategory"));
  }
  if (-[NSMutableArray count](self->_categoriesByViews, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_categoriesByViews, "count"));
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v13 = self->_categoriesByViews;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v58 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("categoriesByView"));
  }
  if (-[NSMutableArray count](self->_introducersByCategorys, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_introducersByCategorys, "count"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v20 = self->_introducersByCategorys;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v54;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v54 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * k), "dictionaryRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("introducersByCategory"));
  }
  if (-[NSMutableArray count](self->_redactions, "count"))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_redactions, "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v27 = self->_redactions;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v50;
      do
      {
        for (m = 0; m != v29; ++m)
        {
          if (*(_QWORD *)v50 != v30)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * m), "dictionaryRepresentation");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v32);

        }
        v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
      }
      while (v29);
    }

    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("redactions"));
  }
  if (-[NSMutableArray count](self->_keyViewMappings, "count"))
  {
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_keyViewMappings, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v34 = self->_keyViewMappings;
    v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v45, v65, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v46;
      do
      {
        for (n = 0; n != v36; ++n)
        {
          if (*(_QWORD *)v46 != v37)
            objc_enumerationMutation(v34);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * n), "dictionaryRepresentation", (_QWORD)v45);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v39);

        }
        v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v45, v65, 16);
      }
      while (v36);
    }

    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("keyViewMapping"));
  }
  userControllableViews = self->_userControllableViews;
  if (userControllableViews)
    objc_msgSend(v3, "setObject:forKey:", userControllableViews, CFSTR("user_controllable_views"));
  piggybackViews = self->_piggybackViews;
  if (piggybackViews)
    objc_msgSend(v3, "setObject:forKey:", piggybackViews, CFSTR("piggyback_views"));
  priorityViews = self->_priorityViews;
  if (priorityViews)
    objc_msgSend(v3, "setObject:forKey:", priorityViews, CFSTR("priority_views"));
  inheritedExcludedViews = self->_inheritedExcludedViews;
  if (inheritedExcludedViews)
    objc_msgSend(v3, "setObject:forKey:", inheritedExcludedViews, CFSTR("inherited_excluded_views"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyDocumentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
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
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v5 = self->_modelToCategorys;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v83;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v83 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
    }
    while (v7);
  }

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v10 = self->_categoriesByViews;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v78, v93, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v79;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v79 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v78, v93, 16);
    }
    while (v12);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v15 = self->_introducersByCategorys;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v75;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v75 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
    }
    while (v17);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v20 = self->_redactions;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v71;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v71 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
    }
    while (v22);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v25 = self->_keyViewMappings;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v67;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v67 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
    }
    while (v27);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v30 = self->_userControllableViews;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v62, v89, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v63;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v63 != v33)
          objc_enumerationMutation(v30);
        PBDataWriterWriteStringField();
        ++v34;
      }
      while (v32 != v34);
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v62, v89, 16);
    }
    while (v32);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v35 = self->_piggybackViews;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v58, v88, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v59;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v59 != v38)
          objc_enumerationMutation(v35);
        PBDataWriterWriteStringField();
        ++v39;
      }
      while (v37 != v39);
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v58, v88, 16);
    }
    while (v37);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v40 = self->_priorityViews;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v54, v87, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v55;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v55 != v43)
          objc_enumerationMutation(v40);
        PBDataWriterWriteStringField();
        ++v44;
      }
      while (v42 != v44);
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v54, v87, 16);
    }
    while (v42);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v45 = self->_inheritedExcludedViews;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v50, v86, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v51;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v51 != v48)
          objc_enumerationMutation(v45);
        PBDataWriterWriteStringField();
        ++v49;
      }
      while (v47 != v49);
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v50, v86, 16);
    }
    while (v47);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t n;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t ii;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t jj;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t kk;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t mm;
  void *v40;
  id v41;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_policyVersion;
    *((_BYTE *)v4 + 88) |= 1u;
  }
  v41 = v4;
  if (-[TPPBPolicyDocument modelToCategorysCount](self, "modelToCategorysCount"))
  {
    objc_msgSend(v41, "clearModelToCategorys");
    v5 = -[TPPBPolicyDocument modelToCategorysCount](self, "modelToCategorysCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[TPPBPolicyDocument modelToCategoryAtIndex:](self, "modelToCategoryAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addModelToCategory:", v8);

      }
    }
  }
  if (-[TPPBPolicyDocument categoriesByViewsCount](self, "categoriesByViewsCount"))
  {
    objc_msgSend(v41, "clearCategoriesByViews");
    v9 = -[TPPBPolicyDocument categoriesByViewsCount](self, "categoriesByViewsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[TPPBPolicyDocument categoriesByViewAtIndex:](self, "categoriesByViewAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addCategoriesByView:", v12);

      }
    }
  }
  if (-[TPPBPolicyDocument introducersByCategorysCount](self, "introducersByCategorysCount"))
  {
    objc_msgSend(v41, "clearIntroducersByCategorys");
    v13 = -[TPPBPolicyDocument introducersByCategorysCount](self, "introducersByCategorysCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[TPPBPolicyDocument introducersByCategoryAtIndex:](self, "introducersByCategoryAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addIntroducersByCategory:", v16);

      }
    }
  }
  if (-[TPPBPolicyDocument redactionsCount](self, "redactionsCount"))
  {
    objc_msgSend(v41, "clearRedactions");
    v17 = -[TPPBPolicyDocument redactionsCount](self, "redactionsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[TPPBPolicyDocument redactionsAtIndex:](self, "redactionsAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addRedactions:", v20);

      }
    }
  }
  if (-[TPPBPolicyDocument keyViewMappingsCount](self, "keyViewMappingsCount"))
  {
    objc_msgSend(v41, "clearKeyViewMappings");
    v21 = -[TPPBPolicyDocument keyViewMappingsCount](self, "keyViewMappingsCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        -[TPPBPolicyDocument keyViewMappingAtIndex:](self, "keyViewMappingAtIndex:", n);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addKeyViewMapping:", v24);

      }
    }
  }
  if (-[TPPBPolicyDocument userControllableViewsCount](self, "userControllableViewsCount"))
  {
    objc_msgSend(v41, "clearUserControllableViews");
    v25 = -[TPPBPolicyDocument userControllableViewsCount](self, "userControllableViewsCount");
    if (v25)
    {
      v26 = v25;
      for (ii = 0; ii != v26; ++ii)
      {
        -[TPPBPolicyDocument userControllableViewsAtIndex:](self, "userControllableViewsAtIndex:", ii);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addUserControllableViews:", v28);

      }
    }
  }
  if (-[TPPBPolicyDocument piggybackViewsCount](self, "piggybackViewsCount"))
  {
    objc_msgSend(v41, "clearPiggybackViews");
    v29 = -[TPPBPolicyDocument piggybackViewsCount](self, "piggybackViewsCount");
    if (v29)
    {
      v30 = v29;
      for (jj = 0; jj != v30; ++jj)
      {
        -[TPPBPolicyDocument piggybackViewsAtIndex:](self, "piggybackViewsAtIndex:", jj);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addPiggybackViews:", v32);

      }
    }
  }
  if (-[TPPBPolicyDocument priorityViewsCount](self, "priorityViewsCount"))
  {
    objc_msgSend(v41, "clearPriorityViews");
    v33 = -[TPPBPolicyDocument priorityViewsCount](self, "priorityViewsCount");
    if (v33)
    {
      v34 = v33;
      for (kk = 0; kk != v34; ++kk)
      {
        -[TPPBPolicyDocument priorityViewsAtIndex:](self, "priorityViewsAtIndex:", kk);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addPriorityViews:", v36);

      }
    }
  }
  if (-[TPPBPolicyDocument inheritedExcludedViewsCount](self, "inheritedExcludedViewsCount"))
  {
    objc_msgSend(v41, "clearInheritedExcludedViews");
    v37 = -[TPPBPolicyDocument inheritedExcludedViewsCount](self, "inheritedExcludedViewsCount");
    if (v37)
    {
      v38 = v37;
      for (mm = 0; mm != v38; ++mm)
      {
        -[TPPBPolicyDocument inheritedExcludedViewsAtIndex:](self, "inheritedExcludedViewsAtIndex:", mm);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addInheritedExcludedViews:", v40);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSMutableArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSMutableArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
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
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_policyVersion;
    *(_BYTE *)(v5 + 88) |= 1u;
  }
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v7 = self->_modelToCategorys;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v95;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v95 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend(v6, "addModelToCategory:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
    }
    while (v9);
  }

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v13 = self->_categoriesByViews;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v91;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v91 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * v17), "copyWithZone:", a3);
        objc_msgSend(v6, "addCategoriesByView:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
    }
    while (v15);
  }

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v19 = self->_introducersByCategorys;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v87;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v87 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * v23), "copyWithZone:", a3);
        objc_msgSend(v6, "addIntroducersByCategory:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
    }
    while (v21);
  }

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v25 = self->_redactions;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v82, v103, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v83;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v83 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * v29), "copyWithZone:", a3);
        objc_msgSend(v6, "addRedactions:", v30);

        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v82, v103, 16);
    }
    while (v27);
  }

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v31 = self->_keyViewMappings;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v78, v102, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v79;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v79 != v34)
          objc_enumerationMutation(v31);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * v35), "copyWithZone:", a3);
        objc_msgSend(v6, "addKeyViewMapping:", v36);

        ++v35;
      }
      while (v33 != v35);
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v78, v102, 16);
    }
    while (v33);
  }

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v37 = self->_userControllableViews;
  v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v74, v101, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v75;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v75 != v40)
          objc_enumerationMutation(v37);
        v42 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * v41), "copyWithZone:", a3);
        objc_msgSend(v6, "addUserControllableViews:", v42);

        ++v41;
      }
      while (v39 != v41);
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v74, v101, 16);
    }
    while (v39);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v43 = self->_piggybackViews;
  v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v70, v100, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v71;
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v71 != v46)
          objc_enumerationMutation(v43);
        v48 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v47), "copyWithZone:", a3);
        objc_msgSend(v6, "addPiggybackViews:", v48);

        ++v47;
      }
      while (v45 != v47);
      v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v70, v100, 16);
    }
    while (v45);
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v49 = self->_priorityViews;
  v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v66, v99, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v67;
    do
    {
      v53 = 0;
      do
      {
        if (*(_QWORD *)v67 != v52)
          objc_enumerationMutation(v49);
        v54 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * v53), "copyWithZone:", a3);
        objc_msgSend(v6, "addPriorityViews:", v54);

        ++v53;
      }
      while (v51 != v53);
      v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v66, v99, 16);
    }
    while (v51);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v55 = self->_inheritedExcludedViews;
  v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v62, v98, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v63;
    do
    {
      v59 = 0;
      do
      {
        if (*(_QWORD *)v63 != v58)
          objc_enumerationMutation(v55);
        v60 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * v59), "copyWithZone:", a3, (_QWORD)v62);
        objc_msgSend(v6, "addInheritedExcludedViews:", v60);

        ++v59;
      }
      while (v57 != v59);
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v62, v98, 16);
    }
    while (v57);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *modelToCategorys;
  NSMutableArray *categoriesByViews;
  NSMutableArray *introducersByCategorys;
  NSMutableArray *redactions;
  NSMutableArray *keyViewMappings;
  NSMutableArray *userControllableViews;
  NSMutableArray *piggybackViews;
  NSMutableArray *priorityViews;
  NSMutableArray *inheritedExcludedViews;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_policyVersion != *((_QWORD *)v4 + 1))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
LABEL_25:
    v14 = 0;
    goto LABEL_26;
  }
  modelToCategorys = self->_modelToCategorys;
  if ((unint64_t)modelToCategorys | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](modelToCategorys, "isEqual:"))
  {
    goto LABEL_25;
  }
  categoriesByViews = self->_categoriesByViews;
  if ((unint64_t)categoriesByViews | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](categoriesByViews, "isEqual:"))
      goto LABEL_25;
  }
  introducersByCategorys = self->_introducersByCategorys;
  if ((unint64_t)introducersByCategorys | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](introducersByCategorys, "isEqual:"))
      goto LABEL_25;
  }
  redactions = self->_redactions;
  if ((unint64_t)redactions | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](redactions, "isEqual:"))
      goto LABEL_25;
  }
  keyViewMappings = self->_keyViewMappings;
  if ((unint64_t)keyViewMappings | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](keyViewMappings, "isEqual:"))
      goto LABEL_25;
  }
  userControllableViews = self->_userControllableViews;
  if ((unint64_t)userControllableViews | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](userControllableViews, "isEqual:"))
      goto LABEL_25;
  }
  piggybackViews = self->_piggybackViews;
  if ((unint64_t)piggybackViews | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](piggybackViews, "isEqual:"))
      goto LABEL_25;
  }
  priorityViews = self->_priorityViews;
  if ((unint64_t)priorityViews | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](priorityViews, "isEqual:"))
      goto LABEL_25;
  }
  inheritedExcludedViews = self->_inheritedExcludedViews;
  if ((unint64_t)inheritedExcludedViews | *((_QWORD *)v4 + 3))
    v14 = -[NSMutableArray isEqual:](inheritedExcludedViews, "isEqual:");
  else
    v14 = 1;
LABEL_26:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_policyVersion;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_modelToCategorys, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_categoriesByViews, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_introducersByCategorys, "hash");
  v7 = -[NSMutableArray hash](self->_redactions, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_keyViewMappings, "hash");
  v9 = v6 ^ v8 ^ -[NSMutableArray hash](self->_userControllableViews, "hash");
  v10 = -[NSMutableArray hash](self->_piggybackViews, "hash");
  v11 = v10 ^ -[NSMutableArray hash](self->_priorityViews, "hash");
  return v9 ^ v11 ^ -[NSMutableArray hash](self->_inheritedExcludedViews, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
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
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
    self->_policyVersion = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v6 = *((id *)v4 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v84;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v84 != v9)
          objc_enumerationMutation(v6);
        -[TPPBPolicyDocument addModelToCategory:](self, "addModelToCategory:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
    }
    while (v8);
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v11 = v5[2];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v80;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v80 != v14)
          objc_enumerationMutation(v11);
        -[TPPBPolicyDocument addCategoriesByView:](self, "addCategoriesByView:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
    }
    while (v13);
  }

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v16 = v5[4];
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v76;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v76 != v19)
          objc_enumerationMutation(v16);
        -[TPPBPolicyDocument addIntroducersByCategory:](self, "addIntroducersByCategory:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v20++));
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
    }
    while (v18);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v21 = v5[9];
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v72;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v72 != v24)
          objc_enumerationMutation(v21);
        -[TPPBPolicyDocument addRedactions:](self, "addRedactions:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v25++));
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
    }
    while (v23);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v26 = v5[5];
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v67, v91, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v68;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v68 != v29)
          objc_enumerationMutation(v26);
        -[TPPBPolicyDocument addKeyViewMapping:](self, "addKeyViewMapping:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v30++));
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v67, v91, 16);
    }
    while (v28);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v31 = v5[10];
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v63, v90, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v64;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v64 != v34)
          objc_enumerationMutation(v31);
        -[TPPBPolicyDocument addUserControllableViews:](self, "addUserControllableViews:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v35++));
      }
      while (v33 != v35);
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v63, v90, 16);
    }
    while (v33);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v36 = v5[7];
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v89, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v60;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v60 != v39)
          objc_enumerationMutation(v36);
        -[TPPBPolicyDocument addPiggybackViews:](self, "addPiggybackViews:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v40++));
      }
      while (v38 != v40);
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v89, 16);
    }
    while (v38);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v41 = v5[8];
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v88, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v56;
    do
    {
      v45 = 0;
      do
      {
        if (*(_QWORD *)v56 != v44)
          objc_enumerationMutation(v41);
        -[TPPBPolicyDocument addPriorityViews:](self, "addPriorityViews:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v45++));
      }
      while (v43 != v45);
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v55, v88, 16);
    }
    while (v43);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v46 = v5[3];
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v51, v87, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v52;
    do
    {
      v50 = 0;
      do
      {
        if (*(_QWORD *)v52 != v49)
          objc_enumerationMutation(v46);
        -[TPPBPolicyDocument addInheritedExcludedViews:](self, "addInheritedExcludedViews:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v50++), (_QWORD)v51);
      }
      while (v48 != v50);
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v51, v87, 16);
    }
    while (v48);
  }

}

- (unint64_t)policyVersion
{
  return self->_policyVersion;
}

- (NSMutableArray)modelToCategorys
{
  return self->_modelToCategorys;
}

- (void)setModelToCategorys:(id)a3
{
  objc_storeStrong((id *)&self->_modelToCategorys, a3);
}

- (NSMutableArray)categoriesByViews
{
  return self->_categoriesByViews;
}

- (void)setCategoriesByViews:(id)a3
{
  objc_storeStrong((id *)&self->_categoriesByViews, a3);
}

- (NSMutableArray)introducersByCategorys
{
  return self->_introducersByCategorys;
}

- (void)setIntroducersByCategorys:(id)a3
{
  objc_storeStrong((id *)&self->_introducersByCategorys, a3);
}

- (NSMutableArray)redactions
{
  return self->_redactions;
}

- (void)setRedactions:(id)a3
{
  objc_storeStrong((id *)&self->_redactions, a3);
}

- (NSMutableArray)keyViewMappings
{
  return self->_keyViewMappings;
}

- (void)setKeyViewMappings:(id)a3
{
  objc_storeStrong((id *)&self->_keyViewMappings, a3);
}

- (NSMutableArray)userControllableViews
{
  return self->_userControllableViews;
}

- (void)setUserControllableViews:(id)a3
{
  objc_storeStrong((id *)&self->_userControllableViews, a3);
}

- (NSMutableArray)piggybackViews
{
  return self->_piggybackViews;
}

- (void)setPiggybackViews:(id)a3
{
  objc_storeStrong((id *)&self->_piggybackViews, a3);
}

- (NSMutableArray)priorityViews
{
  return self->_priorityViews;
}

- (void)setPriorityViews:(id)a3
{
  objc_storeStrong((id *)&self->_priorityViews, a3);
}

- (NSMutableArray)inheritedExcludedViews
{
  return self->_inheritedExcludedViews;
}

- (void)setInheritedExcludedViews:(id)a3
{
  objc_storeStrong((id *)&self->_inheritedExcludedViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userControllableViews, 0);
  objc_storeStrong((id *)&self->_redactions, 0);
  objc_storeStrong((id *)&self->_priorityViews, 0);
  objc_storeStrong((id *)&self->_piggybackViews, 0);
  objc_storeStrong((id *)&self->_modelToCategorys, 0);
  objc_storeStrong((id *)&self->_keyViewMappings, 0);
  objc_storeStrong((id *)&self->_introducersByCategorys, 0);
  objc_storeStrong((id *)&self->_inheritedExcludedViews, 0);
  objc_storeStrong((id *)&self->_categoriesByViews, 0);
}

+ (Class)modelToCategoryType
{
  return (Class)objc_opt_class();
}

+ (Class)categoriesByViewType
{
  return (Class)objc_opt_class();
}

+ (Class)introducersByCategoryType
{
  return (Class)objc_opt_class();
}

+ (Class)redactionsType
{
  return (Class)objc_opt_class();
}

+ (Class)keyViewMappingType
{
  return (Class)objc_opt_class();
}

+ (Class)userControllableViewsType
{
  return (Class)objc_opt_class();
}

+ (Class)piggybackViewsType
{
  return (Class)objc_opt_class();
}

+ (Class)priorityViewsType
{
  return (Class)objc_opt_class();
}

+ (Class)inheritedExcludedViewsType
{
  return (Class)objc_opt_class();
}

@end
