@implementation TPSyncingPolicy

- (TPSyncingPolicy)initWithModel:(id)a3 version:(id)a4 viewList:(id)a5 priorityViews:(id)a6 userControllableViews:(id)a7 syncUserControllableViews:(int)a8 viewsToPiggybackTLKs:(id)a9 keyViewMapping:(id)a10 isInheritedAccount:(BOOL)a11
{
  id v17;
  id v18;
  TPSyncingPolicy *v19;
  TPSyncingPolicy *v20;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v17 = a9;
  v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)TPSyncingPolicy;
  v19 = -[TPSyncingPolicy init](&v28, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_model, a3);
    objc_storeStrong((id *)&v20->_version, a4);
    objc_storeStrong((id *)&v20->_viewList, a5);
    objc_storeStrong((id *)&v20->_priorityViews, a6);
    objc_storeStrong((id *)&v20->_userControllableViews, a7);
    v20->_syncUserControllableViews = a8;
    objc_storeStrong((id *)&v20->_viewsToPiggybackTLKs, a9);
    objc_storeStrong((id *)&v20->_keyViewMapping, a10);
    v20->_isInheritedAccount = a11;
  }

  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TPSyncingPolicy version](self, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSyncingPolicy model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TPSyncingPolicy syncUserControllableViews](self, "syncUserControllableViews");
  if (v6 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1EA8BF708[v6];
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<TPSyncingPolicy: %@, %@, userViews: %@>"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)mapDictionaryToView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  __int128 v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TPSyncingPolicy keyViewMapping](self, "keyViewMapping");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v20;
    *(_QWORD *)&v7 = 138543618;
    v17 = v7;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "view", v17);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v10, "matchingRule");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v10, "matchingRule");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = 0;
            v14 = objc_msgSend(v13, "matches:error:", v4, &v18);
            v11 = v18;

            if (v11)
            {
              TPClassificationLog();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v17;
                v24 = v10;
                v25 = 2114;
                v26 = v11;
                _os_log_impl(&dword_1DE1BE000, v15, OS_LOG_TYPE_DEFAULT, "Error matching with rule %{public}@: %{public}@", buf, 0x16u);
              }

            }
            if ((v14 & 1) != 0)
            {
              objc_msgSend(v10, "view");
              v6 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_17;
            }
          }
          else
          {
            v11 = 0;
          }
        }

      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v6);
  }
LABEL_17:

  return v6;
}

- (BOOL)syncUserControllableViewsAsBoolean
{
  return (-[TPSyncingPolicy syncUserControllableViews](self, "syncUserControllableViews") & 0xFFFFFFFE) == 2;
}

- (BOOL)isSyncingEnabledForView:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;

  v4 = a3;
  -[TPSyncingPolicy viewList](self, "viewList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    if (-[TPSyncingPolicy syncUserControllableViewsAsBoolean](self, "syncUserControllableViewsAsBoolean"))
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      -[TPSyncingPolicy userControllableViews](self, "userControllableViews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "containsObject:", v4) ^ 1;

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[TPSyncingPolicy version](self, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("version"));

  -[TPSyncingPolicy model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("model"));

  -[TPSyncingPolicy keyViewMapping](self, "keyViewMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("keyViewMapping"));

  -[TPSyncingPolicy viewList](self, "viewList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("viewList"));

  -[TPSyncingPolicy priorityViews](self, "priorityViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("priorityViews"));

  -[TPSyncingPolicy userControllableViews](self, "userControllableViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("userControllableViews"));

  v10 = -[TPSyncingPolicy syncUserControllableViews](self, "syncUserControllableViews");
  if (v10 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1EA8BF708[v10];
  }
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("ucvShouldSync"));

  -[TPSyncingPolicy viewsToPiggybackTLKs](self, "viewsToPiggybackTLKs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("viewsToPiggybackTLKs"));

  objc_msgSend(v13, "encodeBool:forKey:", -[TPSyncingPolicy isInheritedAccount](self, "isInheritedAccount"), CFSTR("isInheritedAccount"));
}

- (TPSyncingPolicy)initWithCoder:(id)a3
{
  id v4;
  TPSyncingPolicy *v5;
  uint64_t v6;
  TPPolicyVersion *version;
  uint64_t v8;
  NSString *model;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *keyViewMapping;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSSet *viewList;
  uint64_t v20;
  NSSet *priorityViews;
  uint64_t v22;
  NSSet *userControllableViews;
  id v24;
  int v25;
  uint64_t v26;
  NSSet *viewsToPiggybackTLKs;
  objc_super v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TPSyncingPolicy;
  v5 = -[TPSyncingPolicy init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v6 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (TPPolicyVersion *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
    v8 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("keyViewMapping"));
    v13 = objc_claimAutoreleasedReturnValue();
    keyViewMapping = v5->_keyViewMapping;
    v5->_keyViewMapping = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("viewList"));
    v18 = objc_claimAutoreleasedReturnValue();
    viewList = v5->_viewList;
    v5->_viewList = (NSSet *)v18;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("priorityViews"));
    v20 = objc_claimAutoreleasedReturnValue();
    priorityViews = v5->_priorityViews;
    v5->_priorityViews = (NSSet *)v20;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("userControllableViews"));
    v22 = objc_claimAutoreleasedReturnValue();
    userControllableViews = v5->_userControllableViews;
    v5->_userControllableViews = (NSSet *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ucvShouldSync"));
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v25 = 0;
    }
    else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("DISABLED")) & 1) != 0)
    {
      v25 = 1;
    }
    else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("ENABLED")) & 1) != 0)
    {
      v25 = 2;
    }
    else if (objc_msgSend(v24, "isEqualToString:", CFSTR("FOLLOWING")))
    {
      v25 = 3;
    }
    else
    {
      v25 = 0;
    }

    v5->_syncUserControllableViews = v25;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("viewsToPiggybackTLKs"));
    v26 = objc_claimAutoreleasedReturnValue();
    viewsToPiggybackTLKs = v5->_viewsToPiggybackTLKs;
    v5->_viewsToPiggybackTLKs = (NSSet *)v26;

    v5->_isInheritedAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isInheritedAccount"));
  }

  return v5;
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (TPPolicyVersion)version
{
  return (TPPolicyVersion *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)keyViewMapping
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSSet)viewList
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (NSSet)priorityViews
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (NSSet)viewsToPiggybackTLKs
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (NSSet)userControllableViews
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)isInheritedAccount
{
  return self->_isInheritedAccount;
}

- (void)setIsInheritedAccount:(BOOL)a3
{
  self->_isInheritedAccount = a3;
}

- (int)syncUserControllableViews
{
  return self->_syncUserControllableViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userControllableViews, 0);
  objc_storeStrong((id *)&self->_viewsToPiggybackTLKs, 0);
  objc_storeStrong((id *)&self->_priorityViews, 0);
  objc_storeStrong((id *)&self->_viewList, 0);
  objc_storeStrong((id *)&self->_keyViewMapping, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
