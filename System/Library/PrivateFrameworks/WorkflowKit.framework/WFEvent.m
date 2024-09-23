@implementation WFEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

+ (id)serializablePropertyTransformers
{
  return 0;
}

- (id)serializableEvent
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(-[WFEvent codableEventClass](self, "codableEventClass"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[WFEvent propertyNames](self, "propertyNames", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[WFEvent valueForKey:](self, "valueForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "serializablePropertyTransformers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v12, "transformedValue:", v10);
          v13 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v13;
        }
        if (!v10)
        {
          objc_msgSend(v3, "valueForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v3, "setValue:forKey:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;

  -[WFEvent serializableEvent](self, "serializableEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)coreAnalyticsKey
{
  void *v2;
  void *v3;
  void *v4;

  -[WFEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("key"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(CFSTR("com.apple.shortcuts."), "stringByAppendingString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)propertyNames
{
  objc_class *v2;
  objc_property_t *v3;
  void *v4;
  unint64_t i;
  void *v6;
  unsigned int outCount;

  outCount = 0;
  v2 = (objc_class *)objc_opt_class();
  v3 = class_copyPropertyList(v2, &outCount);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", outCount);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getName(v3[i]));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v6);

      }
    }
    free(v3);
  }
  return v4;
}

- (Class)codableEventClass
{
  return (Class)objc_msgSend((id)objc_opt_class(), "codableEventClass");
}

- (void)track
{
  id v3;

  +[WFEventTracker sharedTracker](WFEventTracker, "sharedTracker");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trackEvent:", self);

}

- (id)description
{
  void *v2;
  void *v3;

  -[WFEvent serializableEvent](self, "serializableEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)debugDescription
{
  void *v2;
  void *v3;

  -[WFEvent serializableEvent](self, "serializableEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
