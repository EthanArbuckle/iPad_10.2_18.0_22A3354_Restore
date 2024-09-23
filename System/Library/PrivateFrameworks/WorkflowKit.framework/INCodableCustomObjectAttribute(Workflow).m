@implementation INCodableCustomObjectAttribute(Workflow)

- (uint64_t)wf_objectClass
{
  return objc_opt_class();
}

- (uint64_t)wf_facadeClass
{
  return objc_opt_class();
}

- (id)wf_parameterClass
{
  objc_msgSend(a1, "modifier");
  return (id)objc_opt_class();
}

- (id)wf_contentItemClass
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectTypeNamespace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wf_contentItemClassForCustomObjectWithNamespace:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)wf_contentItemForValue:()Workflow
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (!v6)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v13 = 136315906;
      v14 = "WFEnforceClass";
      v15 = 2114;
      v16 = v6;
      v17 = 2114;
      v18 = (id)objc_opt_class();
      v19 = 2114;
      v20 = v5;
      v11 = v18;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v13, 0x2Au);

    }
    goto LABEL_7;
  }
  v7 = (void *)objc_msgSend(a1, "wf_contentItemClass");
  INObjectWithTypedObject();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v9;
}

@end
