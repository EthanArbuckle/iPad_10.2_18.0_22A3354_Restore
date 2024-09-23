@implementation STMutableDictionaryData

- (void)setObjectsAndKeys:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *objectsAndKeys;
  id v10;

  v10 = a3;
  v4 = -[NSMutableDictionary isEqual:](self->super._objectsAndKeys, "isEqual:", v10);
  v5 = v10;
  if ((v4 & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v10, "mutableCopy");
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    objectsAndKeys = self->super._objectsAndKeys;
    self->super._objectsAndKeys = v8;

    v5 = v10;
  }

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._objectsAndKeys, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)removeObjectForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->super._objectsAndKeys, "removeObjectForKey:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  STDictionaryData *v4;
  STDictionaryData *v5;
  void *v6;
  STDictionaryData *v7;

  v4 = +[STDictionaryData allocWithZone:](STDictionaryData, "allocWithZone:", a3);
  if (!v4)
    return 0;
  v5 = v4;
  -[STDictionaryData objectsAndKeys](self, "objectsAndKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[STDictionaryData initWithObjectsAndKeys:](v5, "initWithObjectsAndKeys:", v6);

  return v7;
}

- (BOOL)applyDiff:(id)a3
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v4, "applyToMutableDictionaryData:", self);

  return isKindOfClass & 1;
}

@end
