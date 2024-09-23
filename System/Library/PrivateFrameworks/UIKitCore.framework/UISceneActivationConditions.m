@implementation UISceneActivationConditions

- (BOOL)isEqual:(id)a3
{
  UISceneActivationConditions *v4;
  void *v5;
  unint64_t v6;
  NSPredicate *prefersPredicate;
  NSPredicate *canActivatePredicate;
  char v9;

  v4 = (UISceneActivationConditions *)a3;
  if (v4 == self)
    goto LABEL_11;
  v5 = (void *)objc_opt_class();
  if (!objc_msgSend(v5, "isEqual:", objc_opt_class()))
    goto LABEL_10;
  v6 = -[UISceneActivationConditions hash](self, "hash");
  if (v6 != -[UISceneActivationConditions hash](v4, "hash"))
    goto LABEL_10;
  prefersPredicate = self->_prefersPredicate;
  if (prefersPredicate != v4->_prefersPredicate
    && (!prefersPredicate || !-[NSPredicate isEqual:](prefersPredicate, "isEqual:")))
  {
    goto LABEL_10;
  }
  canActivatePredicate = self->_canActivatePredicate;
  if (canActivatePredicate == v4->_canActivatePredicate)
  {
LABEL_11:
    v9 = 1;
    goto LABEL_12;
  }
  if (!canActivatePredicate)
  {
LABEL_10:
    v9 = 0;
    goto LABEL_12;
  }
  v9 = -[NSPredicate isEqual:](canActivatePredicate, "isEqual:");
LABEL_12:

  return v9;
}

- (unint64_t)hash
{
  NSPredicate *prefersPredicate;
  unint64_t v4;
  NSPredicate *canActivatePredicate;

  prefersPredicate = self->_prefersPredicate;
  if (prefersPredicate)
    v4 = -[NSPredicate hash](prefersPredicate, "hash") + 113569;
  else
    v4 = 337;
  canActivatePredicate = self->_canActivatePredicate;
  if (canActivatePredicate)
    return -[NSPredicate hash](canActivatePredicate, "hash") + 337 * v4;
  return v4;
}

- (void)_setUIScene:(id)a3
{
  objc_storeWeak((id *)&self->_uiScene, a3);
}

- (UISceneActivationConditions)init
{
  UISceneActivationConditions *v2;
  uint64_t v3;
  NSPredicate *canActivatePredicate;
  uint64_t v5;
  NSPredicate *prefersPredicate;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UISceneActivationConditions;
  v2 = -[UISceneActivationConditions init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v3 = objc_claimAutoreleasedReturnValue();
    canActivatePredicate = v2->_canActivatePredicate;
    v2->_canActivatePredicate = (NSPredicate *)v3;

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    prefersPredicate = v2->_prefersPredicate;
    v2->_prefersPredicate = (NSPredicate *)v5;

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_uiScene);
  objc_storeStrong((id *)&self->_prefersPredicate, 0);
  objc_storeStrong((id *)&self->_canActivatePredicate, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSPredicate *canActivatePredicate;
  id v5;

  canActivatePredicate = self->_canActivatePredicate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", canActivatePredicate, CFSTR("_UISceneActivationConditionsCanActivatePredicate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_prefersPredicate, CFSTR("_UISceneActivationConditionsPrefersPredicate"));

}

- (void)setCanActivateForTargetContentIdentifierPredicate:(NSPredicate *)canActivateForTargetContentIdentifierPredicate
{
  NSPredicate *v5;
  _UITargetContentIdentifierPredicateValidator *v6;
  _BOOL4 v7;
  id v8;
  id v9;
  NSPredicate *v10;
  NSPredicate *canActivatePredicate;
  id WeakRetained;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = canActivateForTargetContentIdentifierPredicate;
  if ((-[NSPredicate isEqual:](self->_canActivatePredicate, "isEqual:", v5) & 1) == 0)
  {
    v6 = objc_alloc_init(_UITargetContentIdentifierPredicateValidator);
    v16 = 0;
    v17 = 0;
    v7 = -[_UITargetContentIdentifierPredicateValidator validatePredicate:compileTimeIssues:runTimeIssues:](v6, "validatePredicate:compileTimeIssues:runTimeIssues:", v5, &v17, &v16);
    v8 = v17;
    v9 = v16;
    if (v7)
    {
      v10 = (NSPredicate *)-[NSPredicate copy](v5, "copy");
      canActivatePredicate = self->_canActivatePredicate;
      self->_canActivatePredicate = v10;

      WeakRetained = objc_loadWeakRetained((id *)&self->_uiScene);
      objc_msgSend(WeakRetained, "_refreshActivationConditions");

    }
    else
    {
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISceneActivationConditions.m"), 170, CFSTR("%@"), v8);

      }
      v13 = setCanActivateForTargetContentIdentifierPredicate____s_category;
      if (!setCanActivateForTargetContentIdentifierPredicate____s_category)
      {
        v13 = __UILogCategoryGetNode("UISceneActivationConditions", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v13, (unint64_t *)&setCanActivateForTargetContentIdentifierPredicate____s_category);
      }
      v14 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[UISceneActivationConditions setCanActivateForTargetContentIdentifierPredicate:]";
        v20 = 2112;
        v21 = v9;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "%s: %@", buf, 0x16u);
      }
    }

  }
}

- (void)setPrefersToActivateForTargetContentIdentifierPredicate:(NSPredicate *)prefersToActivateForTargetContentIdentifierPredicate
{
  NSPredicate *v5;
  _UITargetContentIdentifierPredicateValidator *v6;
  _BOOL4 v7;
  id v8;
  id v9;
  NSPredicate *v10;
  NSPredicate *prefersPredicate;
  id WeakRetained;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = prefersToActivateForTargetContentIdentifierPredicate;
  if ((-[NSPredicate isEqual:](self->_prefersPredicate, "isEqual:", v5) & 1) == 0)
  {
    v6 = objc_alloc_init(_UITargetContentIdentifierPredicateValidator);
    v16 = 0;
    v17 = 0;
    v7 = -[_UITargetContentIdentifierPredicateValidator validatePredicate:compileTimeIssues:runTimeIssues:](v6, "validatePredicate:compileTimeIssues:runTimeIssues:", v5, &v17, &v16);
    v8 = v17;
    v9 = v16;
    if (v7)
    {
      v10 = (NSPredicate *)-[NSPredicate copy](v5, "copy");
      prefersPredicate = self->_prefersPredicate;
      self->_prefersPredicate = v10;

      WeakRetained = objc_loadWeakRetained((id *)&self->_uiScene);
      objc_msgSend(WeakRetained, "_refreshActivationConditions");

    }
    else
    {
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISceneActivationConditions.m"), 189, CFSTR("%@"), v8);

      }
      v13 = setPrefersToActivateForTargetContentIdentifierPredicate____s_category;
      if (!setPrefersToActivateForTargetContentIdentifierPredicate____s_category)
      {
        v13 = __UILogCategoryGetNode("UISceneActivationConditions", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v13, (unint64_t *)&setPrefersToActivateForTargetContentIdentifierPredicate____s_category);
      }
      v14 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[UISceneActivationConditions setPrefersToActivateForTargetContentIdentifierPredicate:]";
        v20 = 2112;
        v21 = v9;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "%s: %@", buf, 0x16u);
      }
    }

  }
}

- (NSPredicate)canActivateForTargetContentIdentifierPredicate
{
  return (NSPredicate *)(id)-[NSPredicate copy](self->_canActivatePredicate, "copy");
}

- (NSPredicate)prefersToActivateForTargetContentIdentifierPredicate
{
  return (NSPredicate *)(id)-[NSPredicate copy](self->_prefersPredicate, "copy");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p can=%@, prefers=%@>"), v5, self, self->_canActivatePredicate, self->_prefersPredicate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_validateCompileTimeIssues:(id *)a3 runTimeIssues:(id *)a4
{
  _UITargetContentIdentifierPredicateValidator *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  BOOL v11;

  v7 = objc_alloc_init(_UITargetContentIdentifierPredicateValidator);
  -[UISceneActivationConditions canActivateForTargetContentIdentifierPredicate](self, "canActivateForTargetContentIdentifierPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_UITargetContentIdentifierPredicateValidator validatePredicate:compileTimeIssues:runTimeIssues:](v7, "validatePredicate:compileTimeIssues:runTimeIssues:", v8, a3, a4);

  if (v9)
  {
    -[UISceneActivationConditions prefersToActivateForTargetContentIdentifierPredicate](self, "prefersToActivateForTargetContentIdentifierPredicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_UITargetContentIdentifierPredicateValidator validatePredicate:compileTimeIssues:runTimeIssues:](v7, "validatePredicate:compileTimeIssues:runTimeIssues:", v10, a3, a4);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)_suitabilityForTargetContentIdentifier:(id)a3 errorString:(id *)a4
{
  id v5;
  void *v6;
  int64_t v7;
  void *v8;

  v5 = a3;
  -[UISceneActivationConditions prefersToActivateForTargetContentIdentifierPredicate](self, "prefersToActivateForTargetContentIdentifierPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "evaluateWithObject:", v5) & 1) != 0)
  {
    v7 = 2;
  }
  else
  {
    -[UISceneActivationConditions canActivateForTargetContentIdentifierPredicate](self, "canActivateForTargetContentIdentifierPredicate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "evaluateWithObject:", v5);

  }
  return v7;
}

- (UISceneActivationConditions)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  UISceneActivationConditions *v5;
  void *v6;
  uint64_t v7;
  NSPredicate *canActivatePredicate;
  void *v9;
  uint64_t v10;
  NSPredicate *prefersPredicate;
  objc_super v13;

  v4 = aDecoder;
  v13.receiver = self;
  v13.super_class = (Class)UISceneActivationConditions;
  v5 = -[UISceneActivationConditions init](&v13, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", v6, CFSTR("_UISceneActivationConditionsCanActivatePredicate"));
    v7 = objc_claimAutoreleasedReturnValue();
    canActivatePredicate = v5->_canActivatePredicate;
    v5->_canActivatePredicate = (NSPredicate *)v7;

    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", v9, CFSTR("_UISceneActivationConditionsPrefersPredicate"));
    v10 = objc_claimAutoreleasedReturnValue();
    prefersPredicate = v5->_prefersPredicate;
    v5->_prefersPredicate = (NSPredicate *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UISceneActivationConditions *v4;

  v4 = -[UISceneActivationConditions init](+[UISceneActivationConditions allocWithZone:](UISceneActivationConditions, "allocWithZone:", a3), "init");
  -[UISceneActivationConditions setCanActivateForTargetContentIdentifierPredicate:](v4, "setCanActivateForTargetContentIdentifierPredicate:", self->_canActivatePredicate);
  -[UISceneActivationConditions setPrefersToActivateForTargetContentIdentifierPredicate:](v4, "setPrefersToActivateForTargetContentIdentifierPredicate:", self->_prefersPredicate);
  return v4;
}

- (UIScene)_UIScene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_uiScene);
}

@end
