@implementation PHSettings

+ (NSString)suiteName
{
  return (NSString *)(id)_suiteName;
}

+ (void)setSuiteName:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)_suiteName;
  _suiteName = v3;

}

+ (id)sharedSettings
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHSettings.m"), 30, CFSTR("Concrete subclass must implement. Use either PHSettingsImplementRootSettings() or PHSettingsImplementChildSettings() macro for this."));

  return 0;
}

+ (id)createSharedSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  if (!MEMORY[0x1BCCC6824](a1, a2))
    goto LABEL_9;
  objc_msgSend(a1, "_userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_defaultsKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("archive"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("signature"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_signatureDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToDictionary:", v8);

  if (v9)
  {
    if (!v6)
    {

LABEL_9:
      v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDefaultValues");
      return v10;
    }
    objc_msgSend(a1, "settingsFromArchiveDictionary:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  if (!v10)
    goto LABEL_9;
  return v10;
}

+ (id)_userDefaults
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "suiteName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;

  return v4;
}

+ (id)_signatureDictionary
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDefaultValues");
  objc_msgSend(v3, "archiveDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("__defaultValues"));

  return v2;
}

- (id)parentSettings
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSettings.m"), 35, CFSTR("Concrete subclass must implement. Use either PHSettingsImplementRootSettings() or PHSettingsImplementChildSettings() macro for this."));

  return 0;
}

- (void)save
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PHSettings parentSettings](self, "parentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  if (v3)
  {
    objc_msgSend(v3, "save");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_userDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_defaultsKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTSettings archiveDictionary](self, "archiveDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("archive"));

    objc_msgSend((id)objc_opt_class(), "_signatureDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("signature"));

    objc_msgSend(v4, "setObject:forKey:", v6, v5);
    objc_msgSend(v4, "synchronize");

  }
}

@end
