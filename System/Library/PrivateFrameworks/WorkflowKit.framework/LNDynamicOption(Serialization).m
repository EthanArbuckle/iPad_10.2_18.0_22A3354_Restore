@implementation LNDynamicOption(Serialization)

- (void)setContainsSensitiveContent:()Serialization
{
  const void *v2;
  id v3;

  v2 = (const void *)LNDynamicOptionSensitiveContentKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v2, v3, (void *)1);

}

- (uint64_t)containsSensitiveContent
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  objc_getAssociatedObject(a1, (const void *)LNDynamicOptionSensitiveContentKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v1;
    else
      v2 = 0;
  }
  else
  {
    v2 = 0;
  }
  v3 = v2;

  v4 = objc_msgSend(v3, "BOOLValue");
  return v4;
}

- (id)wfSerializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(a1, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v3, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (v6)
  {
    getWFAppIntentsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[LNDynamicOption(Serialization) wfSerializedRepresentation]";
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_FAULT, "%s Could not archive LNValue into data: %@", buf, 0x16u);
    }

    v8 = 0;
  }
  else
  {
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("WFLinkDynamicOptionValue"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "indentationLevel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("WFLinkDynamicOptionIndentationLevel"));

    v8 = v2;
  }

  return v8;
}

+ (id)objectWithWFSerializedRepresentation:()Serialization
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("WFLinkDynamicOptionValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v7)
  {
    getWFAppIntentsLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "+[LNDynamicOption(Serialization) objectWithWFSerializedRepresentation:]";
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s Failed to decode LNValue from data: %@", buf, 0x16u);
    }

    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("WFLinkDynamicOptionIndentationLevel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    v9 = (void *)objc_msgSend([a1 alloc], "initWithValue:indentationLevel:", v6, v11);
  }

  return v9;
}

@end
