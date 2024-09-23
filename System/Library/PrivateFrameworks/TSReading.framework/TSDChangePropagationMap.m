@implementation TSDChangePropagationMap

- (TSDChangePropagationMap)init
{
  TSDChangePropagationMap *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDChangePropagationMap;
  v2 = -[TSDChangePropagationMap init](&v4, sel_init);
  if (v2)
  {
    v2->mDictionary = (TSUNoCopyDictionary *)objc_alloc_init(MEMORY[0x24BEB3CB8]);
    v2->mClassesOfChangedPrototypes = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDChangePropagationMap;
  -[TSDChangePropagationMap dealloc](&v3, sel_dealloc);
}

- (void)recordReplacementChangeForPrototype:(id)a3 replacement:(id)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_6:
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDChangePropagationMap recordReplacementChangeForPrototype:replacement:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 44, CFSTR("invalid nil value for '%s'"), "replacement");
    if (!a3)
      return;
    goto LABEL_7;
  }
  v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDChangePropagationMap recordReplacementChangeForPrototype:replacement:]");
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 43, CFSTR("invalid nil value for '%s'"), "prototype");
  if (!a4)
    goto LABEL_6;
LABEL_3:
  if (!a3)
    return;
LABEL_7:
  -[TSDChangePropagationMap p_addClassesForPrototype:](self, "p_addClassesForPrototype:", a3);
  v11 = (void *)-[TSUNoCopyDictionary objectForKey:](self->mDictionary, "objectForKey:", a3);
  if (v11)
  {
    v12 = v11;
    if (!objc_msgSend(v11, "prototypeIsBeingReplaced")
      || (objc_msgSend(v12, "prototypeIsBeingDeleted") & 1) != 0
      || (id)objc_msgSend(v12, "replacement") != a4)
    {
      v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDChangePropagationMap recordReplacementChangeForPrototype:replacement:]");
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 53, CFSTR("already have a prototypeChange for %@; can't combine replacement changes with any other changes"),
        a3);
    }
  }
  else
  {
    v15 = -[TSDReplaceDeletePrototypeChange initReplacePrototypeChangeForPrototype:toReplacement:]([TSDReplaceDeletePrototypeChange alloc], "initReplacePrototypeChangeForPrototype:toReplacement:", a3, a4);
    -[TSUNoCopyDictionary setObject:forUncopiedKey:](self->mDictionary, "setObject:forUncopiedKey:", v15, a3);

  }
}

- (void)recordModifyChangeForPrototype:(id)a3 property:(int)a4 oldBoxedValue:(id)a5 newBoxedValue:(id)a6
{
  uint64_t v7;
  void *v10;
  uint64_t v11;

  if (a3)
  {
    v7 = *(_QWORD *)&a4;
    -[TSDChangePropagationMap recordOldValueForModifyChangeForPrototype:property:oldBoxedValue:](self, "recordOldValueForModifyChangeForPrototype:property:oldBoxedValue:", a3, *(_QWORD *)&a4, a5);
    -[TSDChangePropagationMap recordNewValueForModifyChangeForPrototype:property:newBoxedValue:](self, "recordNewValueForModifyChangeForPrototype:property:newBoxedValue:", a3, v7, a6);
  }
  else
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", 0, *(_QWORD *)&a4, a5, a6);
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDChangePropagationMap recordModifyChangeForPrototype:property:oldBoxedValue:newBoxedValue:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 68, CFSTR("invalid nil value for '%s'"), "prototype");
  }
}

- (void)recordOldValueForModifyChangeForPrototype:(id)a3 property:(int)a4 oldBoxedValue:(id)a5
{
  uint64_t v6;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  if (a3)
  {
    v6 = *(_QWORD *)&a4;
    -[TSDChangePropagationMap p_addClassesForPrototype:](self, "p_addClassesForPrototype:");
    v9 = (void *)-[TSUNoCopyDictionary objectForKey:](self->mDictionary, "objectForKey:", a3);
    if (v9)
    {
      v10 = v9;
      if ((objc_msgSend(v9, "prototypeIsBeingModified") & 1) == 0)
      {
        v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDChangePropagationMap recordOldValueForModifyChangeForPrototype:property:oldBoxedValue:]");
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 100, CFSTR("can only combine modification changes"));
      }
    }
    else
    {
      v10 = -[TSDModifyPrototypeChange initModifyPrototypeChangeForPrototype:]([TSDModifyPrototypeChange alloc], "initModifyPrototypeChangeForPrototype:", a3);
      -[TSUNoCopyDictionary setObject:forUncopiedKey:](self->mDictionary, "setObject:forUncopiedKey:", v10, a3);

    }
    if ((objc_msgSend((id)objc_msgSend(v10, "changedPropertySet"), "containsProperty:", v6) & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(v10, "changedPropertySet"), "addProperty:", v6);
      objc_msgSend((id)objc_msgSend(v10, "i_propertiesWithOldValuesRecordedButNotNewValues"), "addProperty:", v6);
      if (a5)
        objc_msgSend((id)objc_msgSend(v10, "changedPropertyMapBeforeChange"), "setBoxedObject:forProperty:", a5, v6);
    }
  }
  else
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", 0, *(_QWORD *)&a4, a5);
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDChangePropagationMap recordOldValueForModifyChangeForPrototype:property:oldBoxedValue:]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 84, CFSTR("invalid nil value for '%s'"), "prototype");
  }
}

- (void)recordNewValueForModifyChangeForPrototype:(id)a3 property:(int)a4 newBoxedValue:(id)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (a3)
  {
    v6 = *(_QWORD *)&a4;
    v7 = (void *)-[TSUNoCopyDictionary objectForKey:](self->mDictionary, "objectForKey:");
    v8 = v7;
    if (!v7 || (objc_msgSend((id)objc_msgSend(v7, "changedPropertySet"), "containsProperty:", v6) & 1) == 0)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDChangePropagationMap recordNewValueForModifyChangeForPrototype:property:newBoxedValue:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 125, CFSTR("must record an old value before recording a new value"));
    }
    objc_msgSend((id)objc_msgSend(v8, "i_propertiesWithOldValuesRecordedButNotNewValues"), "removeProperty:", v6);
    if (a5)
      objc_msgSend((id)objc_msgSend(v8, "changedPropertyMapAfterChange"), "setBoxedObject:forProperty:", a5, v6);
  }
  else
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", 0, *(_QWORD *)&a4, a5);
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDChangePropagationMap recordNewValueForModifyChangeForPrototype:property:newBoxedValue:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 117, CFSTR("invalid nil value for '%s'"), "prototype");
  }
}

- (void)recordDeleteChangeForPrototype:(id)a3 replacement:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  if (a3)
  {
    v7 = (void *)-[TSUNoCopyDictionary objectForKey:](self->mDictionary, "objectForKey:");
    if (v7)
    {
      v8 = v7;
      if (!objc_msgSend(v7, "prototypeIsBeingDeleted") || (id)objc_msgSend(v8, "replacement") != a4)
      {
        v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDChangePropagationMap recordDeleteChangeForPrototype:replacement:]");
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 144, CFSTR("already have a prototypeChange for %@; can't combine delete changes with any other changes"),
          a3);
      }
    }
    else
    {
      -[TSDChangePropagationMap p_addClassesForPrototype:](self, "p_addClassesForPrototype:", a3);
      v13 = -[TSDReplaceDeletePrototypeChange initDeletePrototypeChangeForPrototype:replacement:]([TSDReplaceDeletePrototypeChange alloc], "initDeletePrototypeChangeForPrototype:replacement:", a3, a4);
      -[TSUNoCopyDictionary setObject:forUncopiedKey:](self->mDictionary, "setObject:forUncopiedKey:", v13, a3);

    }
  }
  else
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", 0, a4);
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDChangePropagationMap recordDeleteChangeForPrototype:replacement:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 136, CFSTR("invalid nil value for '%s'"), "prototype");
  }
}

- (BOOL)hasAnyChangesForPrototypesOfClasses:(id)a3
{
  return -[NSMutableSet intersectsSet:](self->mClassesOfChangedPrototypes, "intersectsSet:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", a3));
}

- (void)p_addClassesForPrototype:(id)a3
{
  void *i;

  for (i = (void *)objc_opt_class(); i != (void *)objc_opt_class(); i = (void *)objc_msgSend(i, "superclass"))
    -[NSMutableSet addObject:](self->mClassesOfChangedPrototypes, "addObject:", i);
}

- (id)prototypeChangeForPrototype:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)-[TSUNoCopyDictionary objectForKey:](self->mDictionary, "objectForKey:", a3);
  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend((id)objc_msgSend(v4, "i_propertiesWithOldValuesRecordedButNotNewValues"), "count"))
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDChangePropagationMap prototypeChangeForPrototype:]");
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDChangePropagationMap.m"), 180, CFSTR("PrototypeChange for prototype %@ was accessed before new values were recorded for these properties with old values recorded: %@"), objc_msgSend(v3, "prototype"), objc_msgSend(v5, "i_propertiesWithOldValuesRecordedButNotNewValues"));
    }
  }
  return v3;
}

- (id)prototypePassingTest:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)-[TSUNoCopyDictionary keyEnumerator](self->mDictionary, "keyEnumerator", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (((*((uint64_t (**)(id, void *))a3 + 2))(a3, v9) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

@end
