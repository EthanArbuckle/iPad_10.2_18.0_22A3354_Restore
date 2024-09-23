@implementation PSSpecifierDataSource

- (id)specifiersForSpecifier:(id)a3 observer:(id)a4
{
  if (!-[PSSpecifierDataSource areSpecifiersLoaded](self, "areSpecifiersLoaded", a3, a4))
  {
    -[PSSpecifierDataSource loadSpecifiers](self, "loadSpecifiers");
    self->_specifiersLoaded = 1;
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_specifiers);
}

- (BOOL)areSpecifiersLoaded
{
  return self->_specifiersLoaded;
}

- (void)addObserver:(id)a3
{
  NSMutableSet *observerRefs;
  id v4;

  if (a3)
  {
    observerRefs = self->_observerRefs;
    +[PSWeakReference weakReferenceWithObject:](PSWeakReference, "weakReferenceWithObject:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](observerRefs, "addObject:", v4);

  }
}

- (NSMutableArray)specifiers
{
  return self->_specifiers;
}

- (id)readPreferenceValue:(id)a3
{
  return +[PSRootController readPreferenceValue:](PSRootController, "readPreferenceValue:", a3);
}

- (PSSpecifierDataSource)init
{
  PSSpecifierDataSource *v2;
  uint64_t v3;
  NSMutableSet *observerRefs;
  uint64_t v5;
  NSMutableArray *specifiers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSSpecifierDataSource;
  v2 = -[PSSpecifierDataSource init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    observerRefs = v2->_observerRefs;
    v2->_observerRefs = (NSMutableSet *)v3;

    v5 = objc_opt_new();
    specifiers = v2->_specifiers;
    v2->_specifiers = (NSMutableArray *)v5;

  }
  return v2;
}

+ (PSSpecifierDataSource)sharedInstance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_23);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sharedInstance_instanceCache, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)objc_opt_new();
    +[PSWeakReference weakReferenceWithObject:](PSWeakReference, "weakReferenceWithObject:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)sharedInstance_instanceCache, "setObject:forKeyedSubscript:", v7, v3);
    v4 = (void *)v7;
  }

  return (PSSpecifierDataSource *)v6;
}

void __39__PSSpecifierDataSource_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instanceCache;
  sharedInstance_instanceCache = v0;

}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSMutableSet removeObject:](self->_observerRefs, "removeObject:");
}

- (id)observers
{
  return -[PSSpecifierDataSource observersOfClass:](self, "observersOfClass:", 0);
}

- (void)enumerateObserversUsingBlock:(id)a3
{
  -[PSSpecifierDataSource enumerateObserversOfClass:usingBlock:](self, "enumerateObserversOfClass:usingBlock:", 0, a3);
}

- (id)observersOfClass:(Class)a3
{
  void *v5;
  NSMutableSet *observerRefs;
  id v7;
  _QWORD v9[4];
  id v10;
  Class v11;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSMutableSet count](self->_observerRefs, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  observerRefs = self->_observerRefs;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__PSSpecifierDataSource_observersOfClass___block_invoke;
  v9[3] = &unk_1E4A67CC8;
  v11 = a3;
  v7 = v5;
  v10 = v7;
  -[NSMutableSet enumerateObjectsUsingBlock:](observerRefs, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

void __42__PSSpecifierDataSource_observersOfClass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  char isKindOfClass;
  void *v6;

  objc_msgSend(a2, "object");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v6 = (void *)v3;
    if (!*(_QWORD *)(a1 + 40) || (isKindOfClass = objc_opt_isKindOfClass(), v4 = v6, (isKindOfClass & 1) != 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
      v4 = v6;
    }
  }

}

- (void)enumerateObserversOfClass:(Class)a3 usingBlock:(id)a4
{
  id v6;
  NSMutableSet *observerRefs;
  id v8;
  _QWORD v9[4];
  id v10;
  Class v11;

  v6 = a4;
  observerRefs = self->_observerRefs;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PSSpecifierDataSource_enumerateObserversOfClass_usingBlock___block_invoke;
  v9[3] = &unk_1E4A67CF0;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[NSMutableSet enumerateObjectsUsingBlock:](observerRefs, "enumerateObjectsUsingBlock:", v9);

}

void __62__PSSpecifierDataSource_enumerateObserversOfClass_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  char isKindOfClass;
  void *v6;

  objc_msgSend(a2, "object");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v6 = (void *)v3;
    if (!*(_QWORD *)(a1 + 40) || (isKindOfClass = objc_opt_isKindOfClass(), v4 = v6, (isKindOfClass & 1) != 0))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v4 = v6;
    }
  }

}

- (void)performUpdates:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PSSpecifierDataSource_performUpdates___block_invoke;
  v6[3] = &unk_1E4A67D18;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PSSpecifierDataSource enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v6);

}

uint64_t __40__PSSpecifierDataSource_performUpdates___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dataSource:performUpdates:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (id)loadSpecifiersFromPlist:(id)a3 inBundle:(id)a4 target:(id)a5 stringsTable:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "pathForResource:ofType:", v9, CFSTR("plist"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SpecifiersFromPlist(v14, 0, v11, v12, v10, 0, 0, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_clearAllSpecifiers
{
  -[NSMutableArray removeAllObjects](self->_specifiers, "removeAllObjects");
  self->_specifiersLoaded = 0;
}

- (void)_invalidateSpecifiersForObservers
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__PSSpecifierDataSource__invalidateSpecifiersForObservers__block_invoke;
  v2[3] = &unk_1E4A67D40;
  v2[4] = self;
  -[PSSpecifierDataSource enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v2);
}

uint64_t __58__PSSpecifierDataSource__invalidateSpecifiersForObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidateSpecifiersForDataSource:", *(_QWORD *)(a1 + 32));
}

- (void)loadSpecifiers
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%s is an abstract method and must be overriden by subclasses"), "-[PSSpecifierDataSource loadSpecifiers]");
}

- (void)reloadSpecifiers
{
  -[PSSpecifierDataSource _clearAllSpecifiers](self, "_clearAllSpecifiers");
  -[PSSpecifierDataSource loadSpecifiers](self, "loadSpecifiers");
  self->_specifiersLoaded = 1;
  -[PSSpecifierDataSource _invalidateSpecifiersForObservers](self, "_invalidateSpecifiersForObservers");
}

- (void)performUpdatesAnimated:(BOOL)a3 usingBlock:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, void *);
  NSObject *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *specifiers;

  v4 = a3;
  v6 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject sf_isInternalInstall](v7, "sf_isInternalInstall"))
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");

    if ((v8 & 1) != 0)
      goto LABEL_6;
    _PSLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PSSpecifierDataSource performUpdatesAnimated:usingBlock:].cold.1(v7);
  }

LABEL_6:
  if (v6)
  {
    +[PSSpecifierUpdates updatesWithSpecifiers:](PSSpecifierUpdates, "updatesWithSpecifiers:", self->_specifiers);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAnimated:", v4);

    v6[2](v6, v9);
    v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v9, "currentSpecifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (NSMutableArray *)objc_msgSend(v11, "initWithArray:", v12);
    specifiers = self->_specifiers;
    self->_specifiers = v13;

    -[PSSpecifierDataSource performUpdates:](self, "performUpdates:", v9);
  }

}

- (id)specifierForID:(id)a3
{
  return (id)-[NSMutableArray specifierForID:](self->_specifiers, "specifierForID:", a3);
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  +[PSRootController setPreferenceValue:specifier:](PSRootController, "setPreferenceValue:specifier:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_observerRefs, 0);
}

- (void)performUpdatesAnimated:(NSObject *)a1 usingBlock:.cold.1(NSObject *a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1A3819000, a1, OS_LOG_TYPE_ERROR, "performUpdatesAnimated:usingBlock: is caled off the main thread from: %@", (uint8_t *)&v3, 0xCu);

}

@end
