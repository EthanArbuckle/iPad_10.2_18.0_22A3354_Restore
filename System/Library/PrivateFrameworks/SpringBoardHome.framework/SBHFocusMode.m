@implementation SBHFocusMode

- (SBHFocusMode)initWithIdentifier:(id)a3 folder:(id)a4
{
  id v7;
  id v8;
  SBHFocusMode *v9;
  id *p_isa;
  SBHFocusMode *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (v7 && objc_msgSend(v7, "length"))
  {
    v13.receiver = self;
    v13.super_class = (Class)SBHFocusMode;
    v9 = -[SBHFocusMode init](&v13, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_identifier, a3);
      objc_storeStrong(p_isa + 10, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)customizedHomeScreenPagesEnabled
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SBHFocusMode folder](self, "folder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lists");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[SBHFocusMode wantsListVisible:](self, "wantsListVisible:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)addToList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "focusModeIdentifiers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v7);
  -[SBHFocusMode identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_msgSend(v4, "setFocusModeIdentifiers:", v5);
}

- (void)removeFromList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "focusModeIdentifiers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v7);
  -[SBHFocusMode identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  objc_msgSend(v4, "setFocusModeIdentifiers:", v5);
}

- (BOOL)wantsListVisible:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "focusModeIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHFocusMode identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (NSArray)lists
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SBHFocusMode folder](self, "folder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "lists", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[SBHFocusMode wantsListVisible:](self, "wantsListVisible:", v10))
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (NSString)description
{
  return (NSString *)-[SBHFocusMode descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHFocusMode succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHFocusMode descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;

  -[SBHFocusMode succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHFocusMode identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("identifier"));

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isSleepFocus
{
  return self->_sleepFocus;
}

- (void)setSleepFocus:(BOOL)a3
{
  self->_sleepFocus = a3;
}

- (BOOL)showsOnlyAllowedApplicationBadges
{
  return self->_showsOnlyAllowedApplicationBadges;
}

- (void)setShowsOnlyAllowedApplicationBadges:(BOOL)a3
{
  self->_showsOnlyAllowedApplicationBadges = a3;
}

- (BOOL)hidesOnlyDeniedApplicationBadges
{
  return self->_hidesOnlyDeniedApplicationBadges;
}

- (void)setHidesOnlyDeniedApplicationBadges:(BOOL)a3
{
  self->_hidesOnlyDeniedApplicationBadges = a3;
}

- (NSMutableSet)allowedApplicationBundleIdentifiers
{
  return self->_allowedApplicationBundleIdentifiers;
}

- (void)setAllowedApplicationBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSMutableSet)deniedApplicationBundleIdentifiers
{
  return self->_deniedApplicationBundleIdentifiers;
}

- (void)setDeniedApplicationBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (SBIconListModel)dockList
{
  return self->_dockList;
}

- (void)setDockList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (SBFolder)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
  objc_storeStrong((id *)&self->_folder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_dockList, 0);
  objc_storeStrong((id *)&self->_deniedApplicationBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedApplicationBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
