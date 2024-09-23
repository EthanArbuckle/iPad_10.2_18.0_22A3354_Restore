@implementation _UIBarItemAppearance

- (void)_handleSetterInvocation:(id)a3
{
  NSArray *blindViewAppearances;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  blindViewAppearances = self->_blindViewAppearances;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](blindViewAppearances, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(blindViewAppearances);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "_handleSetterInvocation:", a3);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](blindViewAppearances, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

+ (id)_appearanceForClass:(Class)a3 withContainerList:(id)a4
{
  id *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS____UIBarItemAppearance;
  v6 = (id *)objc_msgSendSuper2(&v17, sel__appearanceForClass_withContainerList_);
  if (!v6[5])
  {
    v7 = (void *)-[objc_class _appearanceBlindViewClasses](a3, "_appearanceBlindViewClasses");
    v6[5] = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6[5], "addObject:", +[_UIAppearance _appearanceWithClassInfo:containerList:](_UIAppearance, "_appearanceWithClassInfo:containerList:", +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:withGuideClass:](_UIAppearanceCustomizableClassInfo, "_customizableClassInfoForViewClass:withGuideClass:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), a3), a4));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v9);
    }
  }
  return v6;
}

+ (id)_rootAppearancesNode
{
  id result;

  result = (id)_rootAppearancesNode_appearances;
  if (!_rootAppearancesNode_appearances)
  {
    result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    _rootAppearancesNode_appearances = (uint64_t)result;
  }
  return result;
}

- (void)_handleGetterInvocation:(id)a3
{
  objc_msgSend(-[NSArray lastObject](self->_blindViewAppearances, "lastObject"), "_handleGetterInvocation:", a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIBarItemAppearance;
  -[_UIAppearance dealloc](&v3, sel_dealloc);
}

@end
