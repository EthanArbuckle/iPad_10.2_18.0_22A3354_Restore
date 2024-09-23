@implementation TPPolicy

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[TPPolicy version](self, "version");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<TPPolicy: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)categoryForModel:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  __CFString *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (AllowiProdOverrideSet == 1)
  {
    if (!AllowiProdOverrideValue)
      goto LABEL_7;
  }
  else if (!_os_feature_enabled_impl())
  {
    goto LABEL_7;
  }
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("iProd")) & 1) != 0)
  {
    v5 = CFSTR("full");
    goto LABEL_18;
  }
LABEL_7:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[TPPolicy modelToCategory](self, "modelToCategory", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (__CFString *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (__CFString *)((char *)i + 1))
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "prefix");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "hasPrefix:", v10);

        if ((v11 & 1) != 0)
        {
          objc_msgSend(v9, "category");
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
      }
      v5 = (__CFString *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_17:

LABEL_18:
  return v5;
}

- (BOOL)trustedPeerInCategory:(id)a3 canIntroduceCategory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[TPPolicy introducersByCategory](self, "introducersByCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v9, "containsObject:", v7);
  return (char)v6;
}

- (BOOL)peerInCategory:(id)a3 canAccessView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[TPPolicy categoriesByView](self, "categoriesByView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v9, "containsObject:", v7);
  return (char)v6;
}

- (id)syncingPolicyForModel:(id)a3 syncUserControllableViews:(int)a4 isInheritedAccount:(BOOL)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  TPSyncingPolicy *v21;
  void *v22;
  void *v23;
  TPSyncingPolicy *v24;
  uint64_t v26;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  -[TPPolicy viewsForModel:error:](self, "viewsForModel:error:", v10, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v24 = 0;
    goto LABEL_16;
  }
  -[TPPolicy userControllableViewList](self, "userControllableViewList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPolicy piggybackViews](self, "piggybackViews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPolicy version](self, "version");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v14, "versionNumber") <= 7)
  {
    v15 = objc_msgSend(v12, "count");

    if (v15)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA8C7BE0);
    v14 = v12;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  -[TPPolicy version](self, "version");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v16, "versionNumber") <= 7)
  {
    v17 = objc_msgSend(v13, "count");

    if (v17)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA8C7BF8);
    v16 = v13;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  -[TPPolicy priorityViews](self, "priorityViews");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPolicy version](self, "version");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v19, "versionNumber") > 8)
  {
LABEL_13:

    goto LABEL_14;
  }
  v20 = objc_msgSend(v18, "count");

  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA8C7C10);
    v19 = v18;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
LABEL_14:
  v21 = [TPSyncingPolicy alloc];
  -[TPPolicy version](self, "version");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPolicy keyViewMapping](self, "keyViewMapping");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = a5;
  v24 = -[TPSyncingPolicy initWithModel:version:viewList:priorityViews:userControllableViews:syncUserControllableViews:viewsToPiggybackTLKs:keyViewMapping:isInheritedAccount:](v21, "initWithModel:version:viewList:priorityViews:userControllableViews:syncUserControllableViews:viewsToPiggybackTLKs:keyViewMapping:isInheritedAccount:", v10, v22, v11, v18, v12, v8, v13, v23, v26);

LABEL_16:
  return v24;
}

- (id)viewsForModel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  const __CFString *v27;
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TPPolicy categoryForModel:](self, "categoryForModel:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[TPPolicy categoriesByView](self, "categoriesByView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v20 = v6;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[TPPolicy categoriesByView](self, "categoriesByView", v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "containsObject:", v7);

          if (v16)
            objc_msgSend(v21, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
      v6 = v20;
    }
  }
  else
  {
    if (!a4)
    {
      v21 = 0;
      goto LABEL_15;
    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = TPErrorDomain;
    v27 = CFSTR("model");
    v28[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 9, v8);
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_15:
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[TPPolicy modelToCategory](self, "modelToCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("modelToCategory"));

  -[TPPolicy categoriesByView](self, "categoriesByView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("categoriesByView"));

  -[TPPolicy introducersByCategory](self, "introducersByCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("introducersByCategory"));

  -[TPPolicy keyViewMapping](self, "keyViewMapping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("keyViewMapping"));

  objc_msgSend(v4, "encodeBool:forKey:", -[TPPolicy unknownRedactions](self, "unknownRedactions"), CFSTR("unknownRedactions"));
  -[TPPolicy userControllableViewList](self, "userControllableViewList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("ucvList"));

  -[TPPolicy piggybackViews](self, "piggybackViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("piggybackingList"));

  -[TPPolicy priorityViews](self, "priorityViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("priorityViews"));

  -[TPPolicy inheritedExcludedViews](self, "inheritedExcludedViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("inheritedExcludedViews"));

  -[TPPolicy version](self, "version");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("version"));

}

- (TPPolicy)initWithCoder:(id)a3
{
  id v4;
  TPPolicy *v5;
  uint64_t v6;
  TPPolicyVersion *version;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *modelToCategory;
  uint64_t v16;
  NSDictionary *categoriesByView;
  uint64_t v18;
  NSDictionary *introducersByCategory;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSSet *userControllableViewList;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSSet *piggybackViews;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSSet *priorityViews;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSSet *inheritedExcludedViews;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSArray *keyViewMapping;
  objc_super v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[4];

  v53[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)TPPolicy;
  v5 = -[TPPolicy init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v6 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (TPPolicyVersion *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v53[0] = objc_opt_class();
    v53[1] = objc_opt_class();
    v53[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C99E60];
    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("modelToCategory"));
    v14 = objc_claimAutoreleasedReturnValue();
    modelToCategory = v5->_modelToCategory;
    v5->_modelToCategory = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("categoriesByView"));
    v16 = objc_claimAutoreleasedReturnValue();
    categoriesByView = v5->_categoriesByView;
    v5->_categoriesByView = (NSDictionary *)v16;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("introducersByCategory"));
    v18 = objc_claimAutoreleasedReturnValue();
    introducersByCategory = v5->_introducersByCategory;
    v5->_introducersByCategory = (NSDictionary *)v18;

    v5->_unknownRedactions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("unknownRedactions"));
    v20 = (void *)MEMORY[0x1E0C99E60];
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("ucvList"));
    v23 = objc_claimAutoreleasedReturnValue();
    userControllableViewList = v5->_userControllableViewList;
    v5->_userControllableViewList = (NSSet *)v23;

    v25 = (void *)MEMORY[0x1E0C99E60];
    v50[0] = objc_opt_class();
    v50[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWithArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("piggybackingList"));
    v28 = objc_claimAutoreleasedReturnValue();
    piggybackViews = v5->_piggybackViews;
    v5->_piggybackViews = (NSSet *)v28;

    v30 = (void *)MEMORY[0x1E0C99E60];
    v49[0] = objc_opt_class();
    v49[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("priorityViews"));
    v33 = objc_claimAutoreleasedReturnValue();
    priorityViews = v5->_priorityViews;
    v5->_priorityViews = (NSSet *)v33;

    v35 = (void *)MEMORY[0x1E0C99E60];
    v48[0] = objc_opt_class();
    v48[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setWithArray:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("inheritedExcludedViews"));
    v38 = objc_claimAutoreleasedReturnValue();
    inheritedExcludedViews = v5->_inheritedExcludedViews;
    v5->_inheritedExcludedViews = (NSSet *)v38;

    v40 = (void *)MEMORY[0x1E0C99E60];
    v47[0] = objc_opt_class();
    v47[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setWithArray:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("keyViewMapping"));
    v43 = objc_claimAutoreleasedReturnValue();
    keyViewMapping = v5->_keyViewMapping;
    v5->_keyViewMapping = (NSArray *)v43;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  TPPolicy *v4;
  TPPolicy *v5;
  BOOL v6;

  v4 = (TPPolicy *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[TPPolicy isEqualToPolicy:](self, "isEqualToPolicy:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToPolicy:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = a3;
  -[TPPolicy version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "versionNumber");
  objc_msgSend(v4, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == objc_msgSend(v7, "versionNumber"))
  {
    -[TPPolicy modelToCategory](self, "modelToCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelToCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v9))
    {
      -[TPPolicy categoriesByView](self, "categoriesByView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "categoriesByView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToDictionary:", v11))
      {
        -[TPPolicy introducersByCategory](self, "introducersByCategory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "introducersByCategory");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToDictionary:", v13))
        {
          v27 = v13;
          v28 = v12;
          -[TPPolicy keyViewMapping](self, "keyViewMapping");
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "keyViewMapping");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)v14;
          if (+[TPPolicyDocument isEqualKeyViewMapping:other:](TPPolicyDocument, "isEqualKeyViewMapping:other:", v14))
          {
            -[TPPolicy userControllableViewList](self, "userControllableViewList");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "userControllableViewList");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v15;
            if (objc_msgSend(v15, "isEqualToSet:", v25))
            {
              -[TPPolicy piggybackViews](self, "piggybackViews");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "piggybackViews");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v24, "isEqualToSet:"))
              {
                -[TPPolicy priorityViews](self, "priorityViews");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "priorityViews");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v16;
                v13 = v27;
                if (objc_msgSend(v16, "isEqualToSet:"))
                {
                  -[TPPolicy inheritedExcludedViews](self, "inheritedExcludedViews");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "inheritedExcludedViews");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = objc_msgSend(v20, "isEqualToSet:", v17);

                }
                else
                {
                  v18 = 0;
                }
                v12 = v28;

              }
              else
              {
                v18 = 0;
                v13 = v27;
                v12 = v28;
              }

            }
            else
            {
              v18 = 0;
              v13 = v27;
              v12 = v28;
            }

          }
          else
          {
            v18 = 0;
            v13 = v27;
          }

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (TPPolicyVersion)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSArray)modelToCategory
{
  return self->_modelToCategory;
}

- (void)setModelToCategory:(id)a3
{
  objc_storeStrong((id *)&self->_modelToCategory, a3);
}

- (NSDictionary)categoriesByView
{
  return self->_categoriesByView;
}

- (void)setCategoriesByView:(id)a3
{
  objc_storeStrong((id *)&self->_categoriesByView, a3);
}

- (NSDictionary)introducersByCategory
{
  return self->_introducersByCategory;
}

- (void)setIntroducersByCategory:(id)a3
{
  objc_storeStrong((id *)&self->_introducersByCategory, a3);
}

- (NSArray)keyViewMapping
{
  return self->_keyViewMapping;
}

- (void)setKeyViewMapping:(id)a3
{
  objc_storeStrong((id *)&self->_keyViewMapping, a3);
}

- (NSSet)userControllableViewList
{
  return self->_userControllableViewList;
}

- (void)setUserControllableViewList:(id)a3
{
  objc_storeStrong((id *)&self->_userControllableViewList, a3);
}

- (NSSet)piggybackViews
{
  return self->_piggybackViews;
}

- (void)setPiggybackViews:(id)a3
{
  objc_storeStrong((id *)&self->_piggybackViews, a3);
}

- (NSSet)priorityViews
{
  return self->_priorityViews;
}

- (void)setPriorityViews:(id)a3
{
  objc_storeStrong((id *)&self->_priorityViews, a3);
}

- (NSSet)inheritedExcludedViews
{
  return self->_inheritedExcludedViews;
}

- (void)setInheritedExcludedViews:(id)a3
{
  objc_storeStrong((id *)&self->_inheritedExcludedViews, a3);
}

- (BOOL)unknownRedactions
{
  return self->_unknownRedactions;
}

- (void)setUnknownRedactions:(BOOL)a3
{
  self->_unknownRedactions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inheritedExcludedViews, 0);
  objc_storeStrong((id *)&self->_priorityViews, 0);
  objc_storeStrong((id *)&self->_piggybackViews, 0);
  objc_storeStrong((id *)&self->_userControllableViewList, 0);
  objc_storeStrong((id *)&self->_keyViewMapping, 0);
  objc_storeStrong((id *)&self->_introducersByCategory, 0);
  objc_storeStrong((id *)&self->_categoriesByView, 0);
  objc_storeStrong((id *)&self->_modelToCategory, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

+ (id)policyWithModelToCategory:(id)a3 categoriesByView:(id)a4 introducersByCategory:(id)a5 keyViewMapping:(id)a6 unknownRedactions:(BOOL)a7 userControllableViewList:(id)a8 piggybackViews:(id)a9 priorityViews:(id)a10 inheritedExcludedViews:(id)a11 version:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  TPPolicy *v25;
  _BOOL4 v27;
  id v28;

  v27 = a7;
  v28 = a12;
  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = objc_alloc_init(TPPolicy);
  -[TPPolicy setModelToCategory:](v25, "setModelToCategory:", v24);

  -[TPPolicy setCategoriesByView:](v25, "setCategoriesByView:", v23);
  -[TPPolicy setIntroducersByCategory:](v25, "setIntroducersByCategory:", v22);

  -[TPPolicy setKeyViewMapping:](v25, "setKeyViewMapping:", v21);
  -[TPPolicy setUnknownRedactions:](v25, "setUnknownRedactions:", v27);
  -[TPPolicy setUserControllableViewList:](v25, "setUserControllableViewList:", v20);

  -[TPPolicy setPiggybackViews:](v25, "setPiggybackViews:", v19);
  -[TPPolicy setPriorityViews:](v25, "setPriorityViews:", v18);

  -[TPPolicy setInheritedExcludedViews:](v25, "setInheritedExcludedViews:", v17);
  -[TPPolicy setVersion:](v25, "setVersion:", v28);

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
