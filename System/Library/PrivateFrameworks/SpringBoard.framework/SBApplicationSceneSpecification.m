@implementation SBApplicationSceneSpecification

- (id)defaultExtensions
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)SBApplicationSceneSpecification;
  -[UIApplicationSceneSpecification defaultExtensions](&v10, sel_defaultExtensions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  v5 = v4;

  v11[0] = objc_opt_class();
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v11[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (Class)uiSceneMinimumClass
{
  return (Class)objc_opt_self();
}

- (id)baseSceneComponentClassDictionary
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBApplicationSceneSpecification;
  -[UIApplicationSceneSpecification baseSceneComponentClassDictionary](&v5, sel_baseSceneComponentClassDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKey:", objc_opt_class(), *MEMORY[0x1E0CEC1D8]);
  return v3;
}

@end
