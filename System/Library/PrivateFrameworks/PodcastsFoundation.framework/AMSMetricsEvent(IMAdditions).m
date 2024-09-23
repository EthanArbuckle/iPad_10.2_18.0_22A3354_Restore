@implementation AMSMetricsEvent(IMAdditions)

- (void)im_addPropertiesWithDictionary:()IMAdditions
{
  id v4;

  objc_msgSend(a3, "im_jsonSerializableValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addPropertiesWithDictionary:", v4);

}

- (void)im_setProperty:()IMAdditions forBodyKey:
{
  id v6;
  id v7;
  int v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EEB0D0E0);
  if (!v6 || v8)
  {
    objc_msgSend(v6, "im_jsonSerializableValue");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v6;
    _IMStoreLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1A904E000, v10, OS_LOG_TYPE_ERROR, "The property %@ for key %@ isn't JSON serializable", (uint8_t *)&v11, 0x16u);
    }

  }
  objc_msgSend(a1, "setProperty:forBodyKey:", v9, v7);

}

@end
