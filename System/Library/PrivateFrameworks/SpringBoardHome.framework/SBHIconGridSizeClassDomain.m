@implementation SBHIconGridSizeClassDomain

+ (SBHIconGridSizeClassDomain)builtInDomain
{
  if (builtInDomain_onceToken != -1)
    dispatch_once(&builtInDomain_onceToken, &__block_literal_global_37);
  return (SBHIconGridSizeClassDomain *)(id)builtInDomain_builtInDomain;
}

void __43__SBHIconGridSizeClassDomain_builtInDomain__block_invoke()
{
  SBHBuiltInIconGridSizeClassDomain *v0;
  void *v1;

  v0 = objc_alloc_init(SBHBuiltInIconGridSizeClassDomain);
  v1 = (void *)builtInDomain_builtInDomain;
  builtInDomain_builtInDomain = (uint64_t)v0;

}

+ (SBHMutableIconGridSizeClassDomain)globalDomain
{
  if (globalDomain_onceToken != -1)
    dispatch_once(&globalDomain_onceToken, &__block_literal_global_1_0);
  return (SBHMutableIconGridSizeClassDomain *)(id)globalDomain_globalDomain;
}

void __42__SBHIconGridSizeClassDomain_globalDomain__block_invoke()
{
  SBHGlobalIconGridSizeClassDomain *v0;
  void *v1;

  v0 = objc_alloc_init(SBHGlobalIconGridSizeClassDomain);
  v1 = (void *)globalDomain_globalDomain;
  globalDomain_globalDomain = (uint64_t)v0;

}

+ (SBHIconGridSizeClassDomain)allocWithZone:(_NSZone *)a3
{
  id v5;
  objc_super v7;

  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
    return (SBHIconGridSizeClassDomain *)+[SBHIconGridSizeClassDomain allocWithZone:](SBHImmutableIconGridSizeClassDomain, "allocWithZone:", a3);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___SBHIconGridSizeClassDomain;
  return (SBHIconGridSizeClassDomain *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

- (SBHIconGridSizeClassDomain)init
{
  return -[SBHIconGridSizeClassDomain initWithGridSizeClasses:](self, "initWithGridSizeClasses:", MEMORY[0x1E0C9AA70]);
}

- (SBHIconGridSizeClassDomain)initWithGridSizeClass:(id)a3 info:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  SBHIconGridSizeClassDomain *v10;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SBHIconGridSizeClassDomain initWithGridSizeClasses:](self, "initWithGridSizeClasses:", v9);
  return v10;
}

- (SBHIconGridSizeClassDomain)initWithGridSizeClasses:(id)a3
{
  id v4;
  void *v5;
  SBHIconGridSizeClassDomain *v6;

  v4 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBHIconGridSizeClassDomain initWithGridSizeClasses:order:fallbackDomain:](self, "initWithGridSizeClasses:order:fallbackDomain:", v4, v5, 0);

  return v6;
}

- (SBHIconGridSizeClassDomain)initWithGridSizeClasses:(id)a3 order:(id)a4 fallbackDomain:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHIconGridSizeClassDomain;
  return -[SBHIconGridSizeClassDomain init](&v6, sel_init, a3, a4, a5);
}

- (SBHIconGridSizeClassDomain)initWithIconGridSizeClassDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBHIconGridSizeClassDomain *v8;

  v4 = a3;
  objc_msgSend(v4, "registeredGridSizeClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registeredGridSizeClassOrder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fallbackDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBHIconGridSizeClassDomain initWithGridSizeClasses:order:fallbackDomain:](self, "initWithGridSizeClasses:order:fallbackDomain:", v5, v6, v7);
  return v8;
}

- (id)infoValueForGridSizeClass:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[SBHIconGridSizeClassDomain infoForIconGridSizeClass:](self, "infoForIconGridSizeClass:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)iconGridSizeClassPassingTest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__SBHIconGridSizeClassDomain_iconGridSizeClassPassingTest___block_invoke;
  v12[3] = &unk_1E8D891C0;
  v12[4] = self;
  v5 = v4;
  v13 = v5;
  v14 = &v15;
  -[SBHIconGridSizeClassDomain enumerateGridSizeClassesUsingBlock:](self, "enumerateGridSizeClassesUsingBlock:", v12);
  v6 = (void *)v16[5];
  if (!v6)
  {
    -[SBHIconGridSizeClassDomain fallbackDomain](self, "fallbackDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iconGridSizeClassPassingTest:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v16[5];
    v16[5] = v8;

    v6 = (void *)v16[5];
  }
  v10 = v6;

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __59__SBHIconGridSizeClassDomain_iconGridSizeClassPassingTest___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "infoForIconGridSizeClass:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (id)descriptionForGridSizeClass:(id)a3
{
  return -[SBHIconGridSizeClassDomain infoValueForGridSizeClass:forKey:](self, "infoValueForGridSizeClass:forKey:", a3, CFSTR("SBHIconGridSizeClassRegistrationInfoKeyDescription"));
}

- (id)shortDescriptionForGridSizeClass:(id)a3
{
  return -[SBHIconGridSizeClassDomain infoValueForGridSizeClass:forKey:](self, "infoValueForGridSizeClass:forKey:", a3, CFSTR("SBHIconGridSizeClassRegistrationInfoKeyShortDescription"));
}

- (id)archiveValueForGridSizeClass:(id)a3
{
  return -[SBHIconGridSizeClassDomain infoValueForGridSizeClass:forKey:](self, "infoValueForGridSizeClass:forKey:", a3, CFSTR("SBHIconGridSizeClassRegistrationInfoKeyArchiveValue"));
}

- (id)gridSizeClassForDescription:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__SBHIconGridSizeClassDomain_gridSizeClassForDescription___block_invoke;
  v8[3] = &unk_1E8D891E8;
  v9 = v4;
  v5 = v4;
  -[SBHIconGridSizeClassDomain iconGridSizeClassPassingTest:](self, "iconGridSizeClassPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __58__SBHIconGridSizeClassDomain_gridSizeClassForDescription___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKey:", CFSTR("SBHIconGridSizeClassRegistrationInfoKeyDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v3);

  return v4;
}

- (id)gridSizeClassForArchiveValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__SBHIconGridSizeClassDomain_gridSizeClassForArchiveValue___block_invoke;
  v8[3] = &unk_1E8D891E8;
  v9 = v4;
  v5 = v4;
  -[SBHIconGridSizeClassDomain iconGridSizeClassPassingTest:](self, "iconGridSizeClassPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __59__SBHIconGridSizeClassDomain_gridSizeClassForArchiveValue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKey:", CFSTR("SBHIconGridSizeClassRegistrationInfoKeyArchiveValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v3);

  return v4;
}

- (BOOL)containsGridSizeClass:(id)a3
{
  void *v3;
  BOOL v4;

  -[SBHIconGridSizeClassDomain infoForIconGridSizeClass:](self, "infoForIconGridSizeClass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (SBHIconGridSizeClassSet)allGridSizeClasses
{
  SBHIconGridSizeClassSet *allGridSizeClasses;
  SBHDomainIconGridSizeClassSet *v4;
  SBHIconGridSizeClassSet *v5;

  allGridSizeClasses = self->_allGridSizeClasses;
  if (!allGridSizeClasses)
  {
    v4 = -[SBHDomainIconGridSizeClassSet initWithGridSizeClassDomain:]([SBHDomainIconGridSizeClassSet alloc], "initWithGridSizeClassDomain:", self);
    v5 = self->_allGridSizeClasses;
    self->_allGridSizeClasses = &v4->super;

    allGridSizeClasses = self->_allGridSizeClasses;
  }
  return allGridSizeClasses;
}

- (SBHIconGridSizeClassSet)allNonDefaultGridSizeClasses
{
  SBHIconGridSizeClassSet *allNonDefaultGridSizeClasses;
  SBHDomainIconGridSizeClassSet *v4;
  SBHIconGridSizeClassSet *v5;

  allNonDefaultGridSizeClasses = self->_allNonDefaultGridSizeClasses;
  if (!allNonDefaultGridSizeClasses)
  {
    v4 = -[SBHDomainIconGridSizeClassSet initWithGridSizeClassDomain:filter:]([SBHDomainIconGridSizeClassSet alloc], "initWithGridSizeClassDomain:filter:", self, &__block_literal_global_13_0);
    v5 = self->_allNonDefaultGridSizeClasses;
    self->_allNonDefaultGridSizeClasses = &v4->super;

    allNonDefaultGridSizeClasses = self->_allNonDefaultGridSizeClasses;
  }
  return allNonDefaultGridSizeClasses;
}

uint64_t __58__SBHIconGridSizeClassDomain_allNonDefaultGridSizeClasses__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) ^ 1;
  else
    return 0;
}

- (void)enumerateGridSizeClassesUsingBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SBHIconGridSizeClassDomain gridSizeClassOrder](self, "gridSizeClassOrder");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__SBHIconGridSizeClassDomain_enumerateGridSizeClassesUsingBlock___block_invoke;
  v8[3] = &unk_1E8D89230;
  v9 = v4;
  v5 = v4;
  objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2, v8);
  -[SBHIconGridSizeClassDomain fallbackDomain](self, "fallbackDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumerateGridSizeClassesUsingBlock:", v5);

}

uint64_t __65__SBHIconGridSizeClassDomain_enumerateGridSizeClassesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateGridSizeClassesFilteredBySet:(id)a3 usingBlock:(id)a4
{
  void (**v6)(id, uint64_t, char *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t, char *))a4;
  if (a3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(a3, "allGridSizeClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          -[SBHIconGridSizeClassDomain infoForIconGridSizeClass:](self, "infoForIconGridSizeClass:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = 0;
            v6[2](v6, v12, &v14);
            if (v14)
            {

              goto LABEL_14;
            }
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    -[SBHIconGridSizeClassDomain enumerateGridSizeClassesUsingBlock:](self, "enumerateGridSizeClassesUsingBlock:", v6);
  }

}

+ (id)effectiveGridSizeClassDomainForDomain:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(a1, "globalDomain");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)gridSizeClassOrder
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[SBHIconGridSizeClassDomain registeredGridSizeClassOrder](self, "registeredGridSizeClassOrder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("SBHIconGridSizeClassDefault");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)registeredGridSizeClassOrder
{
  return 0;
}

- (id)registeredGridSizeClasses
{
  return 0;
}

- (id)infoForIconGridSizeClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0)
  {
    -[SBHIconGridSizeClassDomain registeredGridSizeClasses](self, "registeredGridSizeClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[SBHIconGridSizeClassDomain fallbackDomain](self, "fallbackDomain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "infoForIconGridSizeClass:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = &unk_1E8E176A0;
  }

  return v6;
}

- (void)addIconGridSizeClassesToSet:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBHIconGridSizeClassDomain registeredGridSizeClassOrder](self, "registeredGridSizeClassOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v6, "addObjectsFromArray:", v4);
  -[SBHIconGridSizeClassDomain fallbackDomain](self, "fallbackDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addIconGridSizeClassesToSet:", v6);

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBHIconGridSizeClassDomain initWithIconGridSizeClassDomain:]([SBHMutableIconGridSizeClassDomain alloc], "initWithIconGridSizeClassDomain:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allNonDefaultGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_allGridSizeClasses, 0);
}

- (unint64_t)atxStackLayoutSizeForIconGridSizeClass:(id)a3
{
  void *v3;
  unint64_t v4;

  -[SBHIconGridSizeClassDomain infoValueForGridSizeClass:forKey:](self, "infoValueForGridSizeClass:forKey:", a3, CFSTR("SBHIconGridSizeClassRegistrationInfoKeyATXStackLayoutSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)iconGridSizeClassForATXStackLayoutSize:(unint64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92__SBHIconGridSizeClassDomain_SBHATXStackLayoutSize__iconGridSizeClassForATXStackLayoutSize___block_invoke;
  v4[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
  v4[4] = a3;
  -[SBHIconGridSizeClassDomain iconGridSizeClassPassingTest:](self, "iconGridSizeClassPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __92__SBHIconGridSizeClassDomain_SBHATXStackLayoutSize__iconGridSizeClassForATXStackLayoutSize___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "objectForKey:", CFSTR("SBHIconGridSizeClassRegistrationInfoKeyATXStackLayoutSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == *(_QWORD *)(a1 + 32);

  return v4;
}

- (int64_t)chsWidgetFamilyForIconGridSizeClass:(id)a3
{
  void *v3;
  int64_t v4;

  -[SBHIconGridSizeClassDomain infoValueForGridSizeClass:forKey:](self, "infoValueForGridSizeClass:forKey:", a3, CFSTR("SBHIconGridSizeClassRegistrationInfoKeyCHSWidgetFamily"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)iconGridSizeClassForCHSWidgetFamily:(int64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__SBHIconGridSizeClassDomain_SBHCHSWidgetFamily__iconGridSizeClassForCHSWidgetFamily___block_invoke;
  v4[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
  v4[4] = a3;
  -[SBHIconGridSizeClassDomain iconGridSizeClassPassingTest:](self, "iconGridSizeClassPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __86__SBHIconGridSizeClassDomain_SBHCHSWidgetFamily__iconGridSizeClassForCHSWidgetFamily___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "objectForKey:", CFSTR("SBHIconGridSizeClassRegistrationInfoKeyCHSWidgetFamily"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == *(_QWORD *)(a1 + 32);

  return v4;
}

- (unint64_t)filterKnownCHSWidgetFamilies:(unint64_t)a3
{
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__SBHIconGridSizeClassDomain_SBHCHSWidgetFamily__filterKnownCHSWidgetFamilies___block_invoke;
  v6[3] = &unk_1E8D8B2D0;
  v6[4] = self;
  v6[5] = &v7;
  -[SBHIconGridSizeClassDomain enumerateGridSizeClassesUsingBlock:](self, "enumerateGridSizeClassesUsingBlock:", v6);
  v4 = v8[3] & a3;
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __79__SBHIconGridSizeClassDomain_SBHCHSWidgetFamily__filterKnownCHSWidgetFamilies___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "chsWidgetFamilyForIconGridSizeClass:", a2);
  if (result)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 1 << result;
  return result;
}

@end
