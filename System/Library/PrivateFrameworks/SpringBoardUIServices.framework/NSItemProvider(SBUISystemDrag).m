@implementation NSItemProvider(SBUISystemDrag)

- (id)sbui_preferredApplicationBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  getPBItemMetadataKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_metadataValueForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SBUIPreferredApplicationBundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)sbui_setPreferredApplicationBundleIdentifier:()SBUISystemDrag
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = a3;
  getPBItemMetadataKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_metadataValueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v9;

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v4, CFSTR("SBUIPreferredApplicationBundleIdentifier"));
  getPBItemMetadataKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setMetadataValue:forKey:", v11, v10);

}

- (id)sbui_requiredApplicationBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  getPBItemMetadataKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_metadataValueForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SBUIRequiredApplicationBundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)sbui_setRequiredApplicationBundleIdentifier:()SBUISystemDrag
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = a3;
  getPBItemMetadataKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_metadataValueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v9;

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v4, CFSTR("SBUIRequiredApplicationBundleIdentifier"));
  getPBItemMetadataKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setMetadataValue:forKey:", v11, v10);

}

- (uint64_t)sbui_isIgnored
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  getPBItemMetadataKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_metadataValueForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SBUIIgnore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)sbui_setIgnored:()SBUISystemDrag
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  getPBItemMetadataKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_metadataValueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("SBUIIgnore"));

  getPBItemMetadataKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setMetadataValue:forKey:", v12, v11);

}

@end
