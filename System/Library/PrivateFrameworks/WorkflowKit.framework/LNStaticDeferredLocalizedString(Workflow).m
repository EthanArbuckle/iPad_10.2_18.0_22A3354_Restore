@implementation LNStaticDeferredLocalizedString(Workflow)

- (id)serializedRepresentation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "localizedStringWithPluralizationNumber:forLocaleIdentifier:", &unk_1E7B8B380, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_setObjectIfNonNil:forKey:", v3, CFSTR("key"));

  return v2;
}

- (__CFString)wf_localizedString
{
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;

  objc_msgSend(a1, "localizedStringWithPluralizationNumber:forLocaleIdentifier:", &unk_1E7B8B380, 0);
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = &stru_1E7AFA810;
  v3 = v1;

  return v3;
}

- (void)wf_getLocalizedStringWithCompletionHandler:()Workflow
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v5 = a3;
  objc_msgSend(a1, "wf_localizedString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD))a3)[2](v5, v6, 0);

}

- (id)initWithSerializedRepresentation:()Workflow variableProvider:parameter:
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (!v6)
  {
LABEL_10:
    v11 = 0;
    goto LABEL_13;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v15 = 136315906;
      v16 = "WFEnforceClass";
      v17 = 2114;
      v18 = v6;
      v19 = 2114;
      v20 = (id)objc_opt_class();
      v21 = 2114;
      v22 = v5;
      v10 = v20;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v15, 0x2Au);

    }
    goto LABEL_10;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("key"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v12 = v8;

  v13 = (void *)objc_msgSend(a1, "initWithKey:table:bundleURL:", v12, 0, 0);
  a1 = v13;

  v11 = a1;
LABEL_13:

  return v11;
}

@end
