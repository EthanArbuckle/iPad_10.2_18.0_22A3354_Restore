@implementation LNAppShortcutDynamicOptionsProviderReference(SerializableRepresentation)

- (id)initWithSerializedRepresentation:()SerializableRepresentation
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "valueForKey:", CFSTR("appShortcutsProviderMangledTypeName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("parameterIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("appShortcutIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("optionsProviderIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 0;
    if (v6 && v7 && v8 && v9)
    {
      a1 = (id)objc_msgSend(a1, "initWithAppShortcutsProviderMangledTypeName:parameterIdentifier:appShortcutIndex:optionsProviderIndex:", v6, v7, objc_msgSend(v8, "integerValue"), objc_msgSend(v9, "integerValue"));
      v11 = a1;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)serializableRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("appShortcutsProviderMangledTypeName");
  objc_msgSend(a1, "appShortcutsProviderMangledTypeName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("parameterIdentifier");
  objc_msgSend(a1, "parameterIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("appShortcutIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "appShortcutIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("optionsProviderIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "optionsProviderIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
