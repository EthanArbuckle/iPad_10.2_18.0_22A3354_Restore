@implementation SXJSONObjectComponentSupport

BOOL __47__SXJSONObjectComponentSupport_purgeClassBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  _BOOL8 v13;
  uint64_t v14;
  void *v15;
  SXComponentConditions *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("role"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      +[SXLegacySupport deprecatedComponentForType:andVersion:]((uint64_t)SXLegacySupport, v7, v6);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
      {
        -[SXFullscreenCaption caption](v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11 == 0;
      }
      else
      {
        +[SXComponentClassification classificationForComponentWithType:](SXComponentClassification, "classificationForComponentWithType:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_opt_class();
        v12 = v14 == objc_opt_class();
      }
      v13 = v12;

    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v5, "valueForKey:", CFSTR("conditions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = -[SXJSONObject initWithJSONObject:andVersion:]([SXComponentConditions alloc], "initWithJSONObject:andVersion:", v15, v6);
        -[SXComponentConditions greaterThanSpecVersion](v16, "greaterThanSpecVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          v18 = v13;
        else
          v18 = 1;

        if ((v18 & 1) == 0)
        {
          -[SXComponentConditions greaterThanSpecVersion](v16, "greaterThanSpecVersion");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "specVersion");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = SXSpecVersionCompare(v19, v20) != -1;

        }
        -[SXComponentConditions lessThanSpecVersion](v16, "lessThanSpecVersion");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21 && !v13)
        {
          -[SXComponentConditions lessThanSpecVersion](v16, "lessThanSpecVersion");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "specVersion");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = SXSpecVersionCompare(v22, v23) != 1;

        }
      }
    }

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

id __53__SXJSONObjectComponentSupport_objectValueClassBlock__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a4;
  v6 = a2;
  objc_msgSend(v6, "objectForKey:", CFSTR("role"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[SXComponentClassification classificationForComponentWithType:role:](SXComponentClassification, "classificationForComponentWithType:role:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "componentModelClass");
  if (!v10 || (v11 = objc_opt_class(), v11 == objc_opt_class()))
  {
    +[SXLegacySupport deprecatedComponentForType:andVersion:]((uint64_t)SXLegacySupport, v8, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCaption caption]((uint64_t)v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[SXFullscreenCaption caption]((uint64_t)v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v14, "componentModelClass");

    }
  }
  v15 = v10;

  return v15;
}

- (id)purgeClassBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__SXJSONObjectComponentSupport_purgeClassBlock__block_invoke;
  v3[3] = &unk_24D68B450;
  v3[4] = self;
  return (id)MEMORY[0x219A070A8](v3, a2);
}

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_57);
  return (id)shared_shared;
}

- (id)objectValueClassBlock
{
  return &__block_literal_global_2_1;
}

void __38__SXJSONObjectComponentSupport_shared__block_invoke()
{
  SXJSONObjectComponentSupport *v0;
  void *v1;

  v0 = -[SXJSONObjectComponentSupport initWithSpecVersion:]([SXJSONObjectComponentSupport alloc], "initWithSpecVersion:", CFSTR("1.28"));
  v1 = (void *)shared_shared;
  shared_shared = (uint64_t)v0;

}

- (SXJSONObjectComponentSupport)initWithSpecVersion:(id)a3
{
  id v5;
  SXJSONObjectComponentSupport *v6;
  SXJSONObjectComponentSupport *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXJSONObjectComponentSupport;
  v6 = -[SXJSONObjectComponentSupport init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_specVersion, a3);

  return v7;
}

- (NSString)specVersion
{
  return self->_specVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specVersion, 0);
}

@end
