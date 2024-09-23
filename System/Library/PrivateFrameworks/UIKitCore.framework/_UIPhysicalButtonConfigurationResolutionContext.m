@implementation _UIPhysicalButtonConfigurationResolutionContext

- (_UIPhysicalButtonConfigurationSet)configurations
{
  return self->_configurations;
}

- (void)setConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setConfigurationToInteractionMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  _UIPhysicalButtonConfigurationSet *v9;
  _UIPhysicalButtonConfigurationSet *v10;
  _UIPhysicalButtonConfigurationSet *v11;
  _BOOL4 v12;
  NSDictionary *configurationToInteractionMap;
  void *v15;
  _UIPhysicalButtonConfigurationSet *v16;

  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if (a3 && _NSIsNSObject())
    {
      v5 = a3;
      v6 = objc_opt_class();
      if (v6 == objc_opt_class()
        && (v7 = -[_UIPhysicalButtonConfigurationResolutionContext hash](self, "hash"), v7 == objc_msgSend(v5, "hash")))
      {
        v8 = (void *)v5[1];
        v9 = self->_configurations;
        v10 = v8;
        if (v9 == v10)
        {

          goto LABEL_17;
        }
        v11 = v10;
        LOBYTE(v12) = 0;
        if (!v9 || !v10)
        {
LABEL_22:

          goto LABEL_14;
        }
        v12 = -[_UIPhysicalButtonConfigurationSet isEqual:](v9, "isEqual:", v10);

        if (v12)
        {
LABEL_17:
          configurationToInteractionMap = self->_configurationToInteractionMap;
          v15 = (void *)v5[2];
          v9 = configurationToInteractionMap;
          v16 = v15;
          if (v9 == v16)
          {
            LOBYTE(v12) = 1;
            v11 = v9;
          }
          else
          {
            v11 = v16;
            LOBYTE(v12) = 0;
            if (v9 && v16)
              LOBYTE(v12) = -[_UIPhysicalButtonConfigurationSet isEqual:](v9, "isEqual:", v16);
          }
          goto LABEL_22;
        }
      }
      else
      {
        LOBYTE(v12) = 0;
      }
LABEL_14:

      return v12;
    }
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_configurations);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_configurationToInteractionMap);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (id)description
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  __CFString *v11;
  id v12;

  v2 = (uint64_t)self;
  if (self)
  {
    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIPhysicalButtonSuccinctConfigurationsDescriptionForSet(*(_QWORD **)(v2 + 8));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("configurations"));

    v6 = *(void **)(v2 + 16);
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = v6;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p>"), v10, v8);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = CFSTR("(nil)");
    }
    v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("configurationToInteractionMap"));

    objc_msgSend(v3, "build");
    v2 = objc_claimAutoreleasedReturnValue();

  }
  return (id)v2;
}

- (id)debugDescription
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  void *v13;

  v2 = self;
  if (self)
  {
    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setActiveMultilinePrefix:", &stru_1E16EDF20);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __89___UIPhysicalButtonConfigurationResolutionContext_descriptionBuilderWithMultilinePrefix___block_invoke;
    v11 = &unk_1E16B1B50;
    v4 = v3;
    v12 = v4;
    v13 = v2;
    v5 = (id)objc_msgSend(v4, "modifyBody:", &v8);
    v6 = v4;

    objc_msgSend(v6, "build", v8, v9, v10, v11);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setConfigurations:", self->_configurations);
  objc_msgSend(v4, "setConfigurationToInteractionMap:", self->_configurationToInteractionMap);
  return v4;
}

- (NSDictionary)configurationToInteractionMap
{
  return self->_configurationToInteractionMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationToInteractionMap, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
}

@end
