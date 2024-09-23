@implementation _UIPropertyBasedAppearance

- (BOOL)_isRecordingInvocations
{
  return 0;
}

+ (id)_appearanceMatchingProperties:(id)a3 forClass:(Class)a4 withContainerList:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;

  v8 = +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:withGuideClass:](_UIAppearanceCustomizableClassInfo, "_customizableClassInfoForViewClass:withGuideClass:", a4, 0);
  v9 = (void *)objc_msgSend(a1, "_appearanceNodeForClassInfo:containerList:", v8, a5);
  v10 = objc_msgSend(a1, "_appearanceObjectKeyForProperties:", a3);
  v11 = (_QWORD *)objc_msgSend(v9, "objectForKey:", v10);
  if (!v11)
  {
    v11 = (_QWORD *)objc_msgSend(a1, "_newAppearanceWithClassInfo:containerList:", v8, a5);
    v11[5] = a3;
    objc_msgSend(v9, "setObject:forKey:", v11, v10);
    objc_msgSend(v9, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("_UIAppearanceHasExtendedAppearancesKey"));
  }
  return v11;
}

+ (id)_appearanceObjectKeyForProperties:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return CFSTR("_UIAppearanceKey");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v4, "addObject:", v9);
        objc_msgSend(v4, "addObject:", objc_msgSend(a3, "objectForKey:", v9));
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return (id)objc_msgSend(v4, "componentsJoinedByString:", CFSTR(":"));
}

- (BOOL)_isValidAppearanceForCustomizableObject:(id)a3
{
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = -[_UIPropertyBasedAppearance _propertiesToMatch](self, "_propertiesToMatch", 0);
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9)), "isEqual:", -[NSDictionary objectForKey:](-[_UIPropertyBasedAppearance _propertiesToMatch](self, "_propertiesToMatch"), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9)));
      if (!v10)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (NSDictionary)_propertiesToMatch
{
  return self->_propertiesToMatch;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPropertyBasedAppearance;
  -[_UIAppearance dealloc](&v3, sel_dealloc);
}

- (void)_setPropertiesToMatch:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
