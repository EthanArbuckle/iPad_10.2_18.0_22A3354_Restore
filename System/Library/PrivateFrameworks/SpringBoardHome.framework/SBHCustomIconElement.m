@implementation SBHCustomIconElement

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (int64_t)suggestionSource
{
  return self->_suggestionSource;
}

+ (Class)elementClassWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[7];

  v24[6] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v4;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v5;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v6;
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v7;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v8;
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v10;
  v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "elementIdentifier", (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v3, "isEqualToString:", v16);

        if ((v17 & 1) != 0)
        {
          v12 = v15;
          goto LABEL_11;
        }
      }
      v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  return (Class)v12;
}

- (SBHCustomIconElement)initWithUniqueIdentifier:(id)a3
{
  id v4;
  SBHCustomIconElement *v5;
  uint64_t v6;
  NSString *uniqueIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHCustomIconElement;
  v5 = -[SBHCustomIconElement init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v6;

    v5->_suggestionSource = 0;
  }

  return v5;
}

- (SBHCustomIconElement)init
{
  void *v3;
  void *v4;
  SBHCustomIconElement *v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBHCustomIconElement initWithUniqueIdentifier:](self, "initWithUniqueIdentifier:", v4);

  return v5;
}

- (id)copyWithSuggestionSource:(int64_t)a3
{
  id result;

  result = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUniqueIdentifier:", self->_uniqueIdentifier);
  *((_QWORD *)result + 3) = a3;
  return result;
}

- (id)copyWithUniqueIdentifier
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v3 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)objc_msgSend(v3, "initWithUniqueIdentifier:", v5);

  v6[3] = self->_suggestionSource;
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUniqueIdentifier:", self->_uniqueIdentifier);
  *((_QWORD *)result + 3) = self->_suggestionSource;
  return result;
}

+ (NSString)elementIdentifier
{
  return (NSString *)&stru_1E8D8E958;
}

+ (NSString)elementKind
{
  return (NSString *)&stru_1E8D8E958;
}

- (NSString)displayName
{
  return (NSString *)&stru_1E8D8E958;
}

- (SBHIconGridSizeClassSet)supportedGridSizeClasses
{
  return (SBHIconGridSizeClassSet *)+[SBHIconGridSizeClassSet gridSizeClassSetForAllNonDefaultGridSizeClasses](SBHIconGridSizeClassSet, "gridSizeClassSetForAllNonDefaultGridSizeClasses");
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 0;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
