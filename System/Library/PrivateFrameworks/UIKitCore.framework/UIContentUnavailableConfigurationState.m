@implementation UIContentUnavailableConfigurationState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_customStates, 0);
}

void __88__UIContentUnavailableConfigurationState__readonlyContentUnavailableConfigurationState___block_invoke()
{
  UIContentUnavailableConfigurationState *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [UIContentUnavailableConfigurationState alloc];
  +[UITraitCollection _emptyTraitCollection]();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIContentUnavailableConfigurationState initWithTraitCollection:](v0, "initWithTraitCollection:", v3);
  v2 = (void *)_MergedGlobals_957;
  _MergedGlobals_957 = v1;

}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

+ (UIContentUnavailableConfigurationState)_readonlyContentUnavailableConfigurationState:(uint64_t)a1
{
  id v2;
  UIContentUnavailableConfigurationState *v3;
  UIContentUnavailableConfigurationState *v4;
  UIContentUnavailableConfigurationState *v5;
  void *v6;

  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = [UIContentUnavailableConfigurationState alloc];
      objc_msgSend(v2, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[UIContentUnavailableConfigurationState initWithTraitCollection:](v5, "initWithTraitCollection:", v6);

      goto LABEL_9;
    }
    v3 = (UIContentUnavailableConfigurationState *)v2;
  }
  else
  {
    if (qword_1ECD7CC98 != -1)
      dispatch_once(&qword_1ECD7CC98, &__block_literal_global_49);
    v3 = (UIContentUnavailableConfigurationState *)(id)_MergedGlobals_957;
  }
  v4 = v3;
LABEL_9:

  return v4;
}

- (void)setSearchText:(NSString *)searchText
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;

  v4 = searchText;
  v5 = self->_searchText;
  v6 = v4;
  v11 = v6;
  if (v5 == v6)
  {

    v9 = v11;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqual:](v5, "isEqual:", v6);

      v8 = v11;
      if ((v7 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

      v8 = v11;
    }
    ++self->_mutations;
    v10 = v8;
    v9 = self->_searchText;
    self->_searchText = v10;
  }

  v8 = v11;
LABEL_10:

}

- (UIContentUnavailableConfigurationState)initWithTraitCollection:(UITraitCollection *)traitCollection
{
  UITraitCollection *v6;
  UIContentUnavailableConfigurationState *v7;
  UIContentUnavailableConfigurationState *v8;
  void *v10;
  objc_super v11;

  v6 = traitCollection;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIContentUnavailableConfigurationState.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("traitCollection != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)UIContentUnavailableConfigurationState;
  v7 = -[UIContentUnavailableConfigurationState init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_traitCollection, traitCollection);

  return v8;
}

- (unint64_t)_mutations
{
  return self->_mutations;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (id)_customStatesForSwiftBridging
{
  return self->_customStates;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIContentUnavailableConfigurationState)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  void *v5;
  UIContentUnavailableConfigurationState *v6;
  UIContentUnavailableConfigurationState *v7;
  uint64_t v8;
  NSString *searchText;
  uint64_t v10;
  NSMutableDictionary *customStates;
  objc_super v13;

  v4 = coder;
  -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("traitCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)UIContentUnavailableConfigurationState;
    v6 = -[UIContentUnavailableConfigurationState init](&v13, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_traitCollection, v5);
      -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchText"));
      v8 = objc_claimAutoreleasedReturnValue();
      searchText = v7->_searchText;
      v7->_searchText = (NSString *)v8;

      if (!-[NSCoder requiresSecureCoding](v4, "requiresSecureCoding"))
      {
        -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("customStates"));
        v10 = objc_claimAutoreleasedReturnValue();
        customStates = v7->_customStates;
        v7->_customStates = (NSMutableDictionary *)v10;

      }
    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_traitCollection, CFSTR("traitCollection"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchText, CFSTR("searchText"));
  if ((objc_msgSend(v4, "requiresSecureCoding") & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_customStates, CFSTR("customStates"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  UIContentUnavailableConfigurationState *v5;
  UIContentUnavailableConfigurationState *v6;
  uint64_t v7;
  void *v8;
  void *v10;

  v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = self;
  v6 = v5;
  if (v4)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithState_, v4, CFSTR("UIContentUnavailableConfigurationState.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state != nil"));

    }
    v4 = objc_msgSend((id)v4, "initWithTraitCollection:", v6->_traitCollection);
    if (v4)
    {
      v7 = -[NSMutableDictionary mutableCopy](v6->_customStates, "mutableCopy");
      v8 = *(void **)(v4 + 16);
      *(_QWORD *)(v4 + 16) = v7;

      objc_storeStrong((id *)(v4 + 32), v6->_searchText);
    }
  }

  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  UIContentUnavailableConfigurationState *v4;
  UIContentUnavailableConfigurationState *v5;
  UIContentUnavailableConfigurationState *v6;
  UITraitCollection *traitCollection;
  UITraitCollection *v8;
  UITraitCollection *v9;
  UITraitCollection *v10;
  _BOOL4 v11;
  NSMutableDictionary *customStates;
  UITraitCollection *v13;
  NSString *searchText;
  NSString *v15;
  UITraitCollection *v16;

  v4 = (UIContentUnavailableConfigurationState *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        traitCollection = v6->_traitCollection;
        v8 = self->_traitCollection;
        v9 = traitCollection;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9)
            goto LABEL_23;
          v11 = -[UITraitCollection isEqual:](v8, "isEqual:", v9);

          if (!v11)
            goto LABEL_24;
        }
        customStates = v6->_customStates;
        v8 = self->_customStates;
        v13 = customStates;
        if (v8 == v13)
        {

LABEL_18:
          searchText = self->_searchText;
          v15 = v6->_searchText;
          v8 = searchText;
          v16 = v15;
          if (v8 == v16)
          {
            LOBYTE(v11) = 1;
            v10 = v8;
          }
          else
          {
            v10 = v16;
            LOBYTE(v11) = 0;
            if (v8 && v16)
              LOBYTE(v11) = -[UITraitCollection isEqual:](v8, "isEqual:", v16);
          }
          goto LABEL_23;
        }
        v10 = v13;
        LOBYTE(v11) = 0;
        if (v8 && v13)
        {
          v11 = -[UITraitCollection isEqual:](v8, "isEqual:", v13);

          if (!v11)
            goto LABEL_24;
          goto LABEL_18;
        }
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[UITraitCollection hash](self->_traitCollection, "hash");
  v4 = -[NSMutableDictionary hash](self->_customStates, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_searchText, "hash");
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("traitCollection = %@"), self->_traitCollection);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    if (self->_searchText)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("searchText = %@"), self->_searchText);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

    }
  }

  if (self->_customStates)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Custom = %@"), self->_customStates);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v9, self, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void)setTraitCollection:(UITraitCollection *)traitCollection
{
  UITraitCollection *v6;
  void *v7;
  UITraitCollection *v8;

  v6 = traitCollection;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIContentUnavailableConfigurationState.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("traitCollection != nil"));

    v6 = 0;
  }
  if (self->_traitCollection != v6)
  {
    ++self->_mutations;
    v8 = v6;
    objc_storeStrong((id *)&self->_traitCollection, traitCollection);
    v6 = v8;
  }

}

- (id)customStateForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_customStates, "objectForKeyedSubscript:", a3);
}

- (void)setCustomState:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *customStates;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (self)
    ++self->_mutations;
  customStates = self->_customStates;
  if (!customStates)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_customStates;
    self->_customStates = v8;

    customStates = self->_customStates;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](customStates, "setObject:forKeyedSubscript:", v10, v6);

}

- (NSString)searchControllerText
{
  return self->_searchText;
}

@end
