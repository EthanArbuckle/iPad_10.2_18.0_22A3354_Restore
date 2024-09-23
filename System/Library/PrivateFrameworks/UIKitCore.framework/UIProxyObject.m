@implementation UIProxyObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->proxiedObjectIdentifier, 0);
}

- (UIProxyObject)initWithCoder:(id)a3
{
  id v4;
  UIProxyObject *v5;
  void *v6;
  uint64_t v7;
  NSString *proxiedObjectIdentifier;
  void *v9;
  void *v10;
  void *v11;
  UIProxyObject *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIProxyObject;
  v5 = -[UIProxyObject init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIProxiedObjectIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    proxiedObjectIdentifier = v5->proxiedObjectIdentifier;
    v5->proxiedObjectIdentifier = (NSString *)v7;

    v9 = (void *)objc_opt_class();
    -[UIProxyObject proxiedObjectIdentifier](v5, "proxiedObjectIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mappedObjectForCoder:withIdentifier:", v4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = v11;

      v5 = v12;
    }
    else
    {
      NSLog(CFSTR("Missing proxy for identifier %@"), v5->proxiedObjectIdentifier);
    }

  }
  return v5;
}

- (id)proxiedObjectIdentifier
{
  return self->proxiedObjectIdentifier;
}

+ (id)mappedObjectForCoder:(id)a3 withIdentifier:(id)a4
{
  id v5;
  id v6;
  const __CFDictionary *v7;
  const __CFDictionary *Value;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (const __CFDictionary *)objc_msgSend((id)objc_opt_class(), "proxyDecodingMap");
  Value = (const __CFDictionary *)CFDictionaryGetValue(v7, v6);

  if (Value)
    v9 = (void *)CFDictionaryGetValue(Value, v5);
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

+ (void)addMappingFromIdentifier:(id)a3 toObject:(id)a4 forCoder:(id)a5
{
  id v8;
  id v9;
  void *Value;
  id key;

  key = a3;
  v8 = a4;
  v9 = a5;
  Value = (void *)CFDictionaryGetValue((CFDictionaryRef)objc_msgSend(a1, "proxyDecodingMap"), v9);
  if (!Value)
  {
    Value = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue((CFMutableDictionaryRef)objc_msgSend(a1, "proxyDecodingMap"), v9, Value);
    CFRelease(Value);
  }
  CFDictionarySetValue((CFMutableDictionaryRef)Value, key, v8);

}

+ (__CFDictionary)proxyDecodingMap
{
  __CFDictionary *result;
  __int128 v3;
  CFDictionaryKeyCallBacks v4;

  result = (__CFDictionary *)proxyDecodingMap_proxyDecodingMap;
  if (!proxyDecodingMap_proxyDecodingMap)
  {
    v3 = *(_OWORD *)(MEMORY[0x1E0C9B390] + 16);
    *(_OWORD *)&v4.version = *MEMORY[0x1E0C9B390];
    *(_OWORD *)&v4.release = v3;
    v4.equal = 0;
    v4.hash = 0;
    result = CFDictionaryCreateMutable(0, 0, &v4, MEMORY[0x1E0C9B3A0]);
    proxyDecodingMap_proxyDecodingMap = (uint64_t)result;
  }
  return result;
}

+ (void)removeMappingsForCoder:(id)a3
{
  id key;

  key = a3;
  CFDictionaryRemoveValue((CFMutableDictionaryRef)objc_msgSend(a1, "proxyDecodingMap"), key);

}

+ (void)addMappings:(id)a3 forCoder:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v5, "allKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIProxyObject addMappingFromIdentifier:toObject:forCoder:](UIProxyObject, "addMappingFromIdentifier:toObject:forCoder:", v12, v13, v6);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->proxiedObjectIdentifier, CFSTR("UIProxiedObjectIdentifier"));
}

- (void)setProxiedObjectIdentifier:(id)a3
{
  NSString *v4;
  NSString *proxiedObjectIdentifier;

  if (self->proxiedObjectIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    proxiedObjectIdentifier = self->proxiedObjectIdentifier;
    self->proxiedObjectIdentifier = v4;

  }
}

@end
