@implementation TSSStylesheet

- (id)defaultColumnStyle
{
  return -[TSSStylesheet _defaultColumnStyleWasCreated:](self, "_defaultColumnStyleWasCreated:", 0);
}

- (id)defaultCharacterStyle
{
  return -[TSSStylesheet _defaultCharacterStyleWasCreated:](self, "_defaultCharacterStyleWasCreated:", 0);
}

- (id)variationOfStyle:(id)a3 propertyMap:(id)a4
{
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  char v19;

  if (!a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStylesheet variationOfStyle:propertyMap:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 713, CFSTR("invalid nil value for '%s'"), "style");
  }
  v9 = a3;
  if (objc_msgSend(a3, "isVariation"))
    v9 = (id)objc_msgSend(a3, "parent");
  if (!v9)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStylesheet variationOfStyle:propertyMap:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 717, CFSTR("Cannot create a variation of variation style <%p> with no parent"), a3);
  }
  if (objc_msgSend(v9, "isVariation"))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStylesheet variationOfStyle:propertyMap:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 718, CFSTR("Can't create variation with a variation base style <%p>."), v9);
  }
  v14 = (void *)objc_msgSend(a3, "newOverridePropertyMapWithPropertyMap:", a4);
  if (objc_msgSend(v14, "count"))
  {
    if (!v9)
      goto LABEL_15;
  }
  else
  {

    v14 = 0;
    if (!v9)
      goto LABEL_15;
  }
  if (!v14)
  {
    v15 = v9;
    goto LABEL_24;
  }
LABEL_15:
  if (v9 != a3
    && (TSSStylesheet *)objc_msgSend(a3, "stylesheet") == self
    && (v19 = objc_msgSend(a3, "overridePropertyMapIsEqualTo:", v14), a3)
    && (v19 & 1) != 0)
  {
    v15 = a3;
  }
  else
  {
    objc_sync_enter(self);
    v16 = (void *)-[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->mParentToChildrenStyleMap, "objectForKeyedSubscript:", v9);
    v17 = objc_msgSend(v16, "count") - 1;
    do
    {
      if (v17 == -1)
      {
        objc_sync_exit(self);
        goto LABEL_23;
      }
      v15 = (id)objc_msgSend(v16, "objectAtIndexedSubscript:", v17--);
    }
    while ((objc_msgSend(v15, "overridePropertyMapIsEqualTo:", v14) & 1) == 0);
    objc_sync_exit(self);
    if (v15)
      goto LABEL_24;
LABEL_23:
    v15 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:name:overridePropertyMap:isVariation:", -[TSPObject context](self, "context"), 0, v14, 1);
    -[TSPObject willModify](self, "willModify");
    objc_sync_enter(self);
    -[TSSStylesheet p_addStyle:withParent:identifier:](self, "p_addStyle:withParent:identifier:", v15, v9, 0);
    objc_sync_exit(self);

  }
LABEL_24:

  return v15;
}

- (id)_defaultParagraphStyleWasCreated:(BOOL *)a3
{
  BOOL *v4;
  id v5;
  char v7;

  v7 = 0;
  if (a3)
    v4 = a3;
  else
    v4 = (BOOL *)&v7;
  v5 = -[TSSStylesheet _defaultStyleOfClass:withIdentifier:wasCreated:usingBlock:](self, "_defaultStyleOfClass:withIdentifier:wasCreated:usingBlock:", objc_opt_class(), CFSTR("paragraph-style-default"), v4, &__block_literal_global_58);
  if (*v4)
    objc_msgSend(v5, "setInitialListStyle:", -[TSSStylesheet defaultListStyle](self, "defaultListStyle"));
  return v5;
}

- (id)_defaultStyleOfClass:(Class)a3 withIdentifier:(id)a4 wasCreated:(BOOL *)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;

  v10 = -[TSSStylesheet cascadedStyleWithIdentifier:](self, "cascadedStyleWithIdentifier:", a4);
  if (!v10)
  {
    objc_sync_enter(self);
    v10 = -[TSSStylesheet cascadedStyleWithIdentifier:](self, "cascadedStyleWithIdentifier:", a4);
    if (!v10)
    {
      v11 = -[TSSStylesheet rootAncestor](self, "rootAncestor");
      v12 = objc_msgSend(v11, "isLocked");
      objc_msgSend(v11, "setIsLocked:", 0);
      v10 = (id)(*((uint64_t (**)(id, uint64_t))a6 + 2))(a6, objc_msgSend(v11, "context"));
      objc_msgSend(v11, "addStyle:withIdentifier:", v10, a4);
      objc_msgSend(v11, "setIsLocked:", v12);
      if (a5)
        *a5 = 1;

    }
    objc_sync_exit(self);
  }
  return v10;
}

- (id)cascadedStyleWithIdentifier:(id)a3
{
  id result;

  result = -[TSSStylesheet styleWithIdentifier:](self, "styleWithIdentifier:");
  if (!result)
    return -[TSSStylesheet cascadedStyleWithIdentifier:](self->mParent, "cascadedStyleWithIdentifier:", a3);
  return result;
}

- (id)styleWithIdentifier:(id)a3
{
  void *v5;

  objc_sync_enter(self);
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->mIdentifierToStyleMap, "objectForKeyedSubscript:", a3);
  objc_sync_exit(self);
  return v5;
}

- (void)setIsLocked:(BOOL)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mIsLocked = a3;
}

- (id)rootAncestor
{
  TSSStylesheet *v2;

  while (1)
  {
    v2 = self;
    if (!-[TSSStylesheet parent](self, "parent"))
      break;
    self = -[TSSStylesheet parent](v2, "parent");
  }
  return v2;
}

- (TSSStylesheet)parent
{
  return self->mParent;
}

- (BOOL)isLocked
{
  return self->mIsLocked;
}

- (void)addStyle:(id)a3 withIdentifier:(id)a4
{
  -[TSSStylesheet addStyle:withParent:identifier:](self, "addStyle:withParent:identifier:", a3, 0, a4);
}

TSWPColumnStyle *__64__TSSStylesheet_TSText_Internal___defaultColumnStyleWasCreated___block_invoke(uint64_t a1, uint64_t a2)
{
  return -[TSSStyle initWithContext:name:overridePropertyMap:isVariation:]([TSWPColumnStyle alloc], "initWithContext:name:overridePropertyMap:isVariation:", a2, 0, 0, 0);
}

- (id)_defaultColumnStyleWasCreated:(BOOL *)a3
{
  return -[TSSStylesheet _defaultStyleOfClass:withIdentifier:wasCreated:usingBlock:](self, "_defaultStyleOfClass:withIdentifier:wasCreated:usingBlock:", objc_opt_class(), CFSTR("column-style-default"), a3, &__block_literal_global_66_0);
}

- (TSSStylesheet)initWithContext:(id)a3 canCullStyles:(BOOL)a4
{
  TSSStylesheet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSSStylesheet;
  v5 = -[TSPObject initWithContext:](&v7, sel_initWithContext_, a3);
  if (v5)
  {
    v5->mStyles = (TSUMutableRetainedPointerSet *)objc_alloc_init(MEMORY[0x24BEB3CB0]);
    v5->mIdentifierToStyleMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5->mParentToChildrenStyleMap = (TSURetainedPointerKeyDictionary *)objc_alloc_init(MEMORY[0x24BEB3D00]);
    v5->mCanCullStyles = a4;
  }
  return v5;
}

- (id)defaultListStyle
{
  return -[TSSStylesheet _defaultListStyleWasCreated:](self, "_defaultListStyleWasCreated:", 0);
}

- (id)_defaultListStyleWasCreated:(BOOL *)a3
{
  return -[TSSStylesheet _defaultStyleOfClass:withIdentifier:wasCreated:usingBlock:](self, "_defaultStyleOfClass:withIdentifier:wasCreated:usingBlock:", objc_opt_class(), CFSTR("text-0-liststyle-None"), a3, &__block_literal_global_63);
}

- (id)defaultParagraphStyle
{
  return -[TSSStylesheet _defaultParagraphStyleWasCreated:](self, "_defaultParagraphStyleWasCreated:", 0);
}

- (id)_defaultCharacterStyleWasCreated:(BOOL *)a3
{
  return -[TSSStylesheet _defaultStyleOfClass:withIdentifier:wasCreated:usingBlock:](self, "_defaultStyleOfClass:withIdentifier:wasCreated:usingBlock:", objc_opt_class(), CFSTR("character-style-null"), a3, &__block_literal_global_61);
}

TSWPListStyle *__62__TSSStylesheet_TSText_Internal___defaultListStyleWasCreated___block_invoke(uint64_t a1, uint64_t a2)
{
  return -[TSWPListStyle initWithContext:name:overridePropertyMap:isVariation:]([TSWPListStyle alloc], "initWithContext:name:overridePropertyMap:isVariation:", a2, objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("None"), &stru_24D82FEB0, CFSTR("TSText")), +[TSWPListStyle defaultPropertyMap](TSWPListStyle, "defaultPropertyMap"), 0);
}

TSWPParagraphStyle *__67__TSSStylesheet_TSText_Internal___defaultParagraphStyleWasCreated___block_invoke(uint64_t a1, uint64_t a2)
{
  return -[TSSStyle initWithContext:name:overridePropertyMap:isVariation:]([TSWPParagraphStyle alloc], "initWithContext:name:overridePropertyMap:isVariation:", a2, objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Free Form"), &stru_24D82FEB0, CFSTR("TSText")), +[TSWPParagraphStyle defaultPropertyMap](TSWPParagraphStyle, "defaultPropertyMap"), 0);
}

TSWPCharacterStyle *__67__TSSStylesheet_TSText_Internal___defaultCharacterStyleWasCreated___block_invoke(uint64_t a1, uint64_t a2)
{
  return -[TSSStyle initWithContext:name:overridePropertyMap:isVariation:]([TSWPCharacterStyle alloc], "initWithContext:name:overridePropertyMap:isVariation:", a2, objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("None"), &stru_24D82FEB0, CFSTR("TSText")), 0, 0);
}

- (void)addStyle:(id)a3 withParent:(id)a4 identifier:(id)a5
{
  -[TSPObject willModify](self, "willModify");
  objc_sync_enter(self);
  -[TSSStylesheet p_addStyle:withParent:identifier:](self, "p_addStyle:withParent:identifier:", a3, a4, a5);
  objc_sync_exit(self);
}

- (void)p_setIdentifier:(id)a3 ofStyle:(id)a4
{
  char v7;
  id v8;

  v7 = objc_msgSend(a3, "isEqual:", &stru_24D82FEB0);
  if (a4 && (v7 & 1) == 0)
  {
    objc_sync_enter(self);
    if (-[TSSStylesheet containsStyle:](self, "containsStyle:", a4))
    {
      if ((TSSStylesheet *)objc_msgSend(a4, "stylesheet") == self)
      {
        v8 = -[TSSStylesheet styleWithIdentifier:](self, "styleWithIdentifier:", a3);
        if (v8 != a4)
        {
          if (v8)
            -[TSSStylesheet p_setIdentifier:ofStyle:](self, "p_setIdentifier:ofStyle:", 0, v8);
          if (objc_msgSend(a4, "styleIdentifier"))
            -[NSMutableDictionary removeObjectForKey:](self->mIdentifierToStyleMap, "removeObjectForKey:", objc_msgSend(a4, "styleIdentifier"));
          objc_msgSend(a4, "setStyleIdentifier:", a3);
          if (a3)
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->mIdentifierToStyleMap, "setObject:forKeyedSubscript:", a4, a3);
        }
      }
    }
    objc_sync_exit(self);
  }
}

- (void)p_setParent:(id)a3 ofStyle:(id)a4
{
  if (a4)
  {
    objc_sync_enter(self);
    if (-[TSSStylesheet containsStyle:](self, "containsStyle:", a4)
      && (TSSStylesheet *)objc_msgSend(a4, "stylesheet") == self)
    {
      if (objc_msgSend(a4, "parent"))
        -[TSSStylesheet p_removeStyleFromParentChildren:](self, "p_removeStyleFromParentChildren:", a4);
      objc_msgSend(a4, "setParent:", a3);
      if (a3)
        -[TSSStylesheet p_addStyleToParentChildren:](self, "p_addStyleToParentChildren:", a4);
    }
    objc_sync_exit(self);
  }
}

- (void)p_addStyle:(id)a3 withParent:(id)a4 identifier:(id)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a3)
  {
    objc_sync_enter(self);
    if (-[TSSStylesheet containsStyle:](self, "containsStyle:", a3) || objc_msgSend(a3, "stylesheet"))
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStylesheet p_addStyle:withParent:identifier:]");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m");
      v12 = TSUObjectReferenceDescription();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 995, CFSTR("Adding style %@ to stylesheet %@ when style is already in a stylesheet."), v12, TSUObjectReferenceDescription());
      if ((TSSStylesheet *)objc_msgSend(a3, "stylesheet") != self)
        objc_msgSend((id)objc_msgSend(a3, "stylesheet"), "removeStyle:", a3);
    }
    -[TSUMutableRetainedPointerSet addObject:](self->mStyles, "addObject:", a3);
    objc_msgSend(a3, "setStylesheet:", self);
    if (a4)
      -[TSSStylesheet p_setParent:ofStyle:](self, "p_setParent:ofStyle:", a4, a3);
    if (a5)
      -[TSSStylesheet p_setIdentifier:ofStyle:](self, "p_setIdentifier:ofStyle:", a5, a3);
    objc_sync_exit(self);
  }
}

- (BOOL)containsStyle:(id)a3
{
  objc_sync_enter(self);
  LOBYTE(a3) = -[TSUMutableRetainedPointerSet containsObject:](self->mStyles, "containsObject:", a3);
  objc_sync_exit(self);
  return (char)a3;
}

- (void)p_addStyleToParentChildren:(id)a3
{
  void *v5;
  void *v6;
  void *v7;

  objc_sync_enter(self);
  v5 = (void *)-[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->mParentToChildrenStyleMap, "objectForKeyedSubscript:", objc_msgSend(a3, "parent"));
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "indexOfObjectIdenticalTo:", a3) == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v6, "addObject:", a3);
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", a3, 0);
    -[TSURetainedPointerKeyDictionary setObject:forKeyedSubscript:](self->mParentToChildrenStyleMap, "setObject:forKeyedSubscript:", v7, objc_msgSend(a3, "parent"));

  }
  objc_sync_exit(self);
}

- (TSSStylesheet)initWithContext:(id)a3
{
  return -[TSSStylesheet initWithContext:canCullStyles:](self, "initWithContext:canCullStyles:", a3, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSSStylesheet;
  -[TSSStylesheet dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  int v6;

  if (a3 == self)
    return 1;
  if (a3)
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      objc_sync_enter(self);
      objc_sync_enter(a3);
      if ((objc_msgSend(*((id *)a3 + 8), "isEqual:", self->mStyles) & 1) != 0)
      {
        v6 = objc_msgSend(*((id *)a3 + 9), "isEqualToDictionary:", self->mIdentifierToStyleMap);
        objc_sync_exit(a3);
        objc_sync_exit(self);
        if (v6)
          return 1;
      }
      else
      {
        objc_sync_exit(a3);
        objc_sync_exit(self);
      }
    }
  }
  return 0;
}

- (BOOL)canCullStyles
{
  return self->mCanCullStyles;
}

- (void)setCanCullStyles:(BOOL)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mCanCullStyles = a3;
}

- (NSSet)styles
{
  void *v3;

  objc_sync_enter(self);
  v3 = (void *)-[TSUMutableRetainedPointerSet copy](self->mStyles, "copy");
  objc_sync_exit(self);
  return (NSSet *)v3;
}

- (void)setParent:(id)a3
{
  -[TSSStylesheet setParent:withParentStyleMap:](self, "setParent:withParentStyleMap:", a3, 0);
}

- (void)setParent:(id)a3 withParentStyleMap:(__CFDictionary *)a4
{
  TSSStylesheet *mParent;
  TSSStylesheet *v7;

  -[TSPObject willModify](self, "willModify", a3, a4);
  mParent = self->mParent;
  if (mParent)
  {
    mParent->mChild = 0;

    self->mParent = 0;
  }
  v7 = (TSSStylesheet *)a3;
  self->mParent = v7;
  if (v7)
    v7->mChild = self;
}

- (BOOL)isChildOf:(id)a3
{
  return self->mParent == a3;
}

- (BOOL)isParentOf:(id)a3
{
  return objc_msgSend(a3, "parent") == (_QWORD)self;
}

- (BOOL)isDescendentOf:(id)a3
{
  TSSStylesheet *mParent;

  mParent = self->mParent;
  if (mParent)
    LOBYTE(mParent) = mParent == a3 || -[TSSStylesheet isDescendentOf:](mParent, "isDescendentOf:");
  return (char)mParent;
}

- (BOOL)isAncestorOf:(id)a3
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "parent");
  if (v5)
    LOBYTE(v5) = (TSSStylesheet *)objc_msgSend(a3, "parent") == self
              || -[TSSStylesheet isAncestorOf:](self, "isAncestorOf:", objc_msgSend(a3, "parent"));
  return v5;
}

- (unint64_t)descendantCount
{
  TSSStylesheet *v2;
  unint64_t i;

  v2 = self;
  for (i = 0; -[TSSStylesheet child](v2, "child"); v2 = -[TSSStylesheet child](v2, "child"))
    ++i;
  return i;
}

- (void)addStyle:(id)a3
{
  -[TSSStylesheet addStyle:withParent:identifier:](self, "addStyle:withParent:identifier:", a3, 0, 0);
}

- (void)addStyle:(id)a3 withParent:(id)a4
{
  -[TSSStylesheet addStyle:withParent:identifier:](self, "addStyle:withParent:identifier:", a3, a4, 0);
}

- (void)removeStyle:(id)a3
{
  -[TSPObject willModify](self, "willModify");
  objc_sync_enter(self);
  -[TSSStylesheet p_removeStyle:](self, "p_removeStyle:", a3);
  objc_sync_exit(self);
}

- (BOOL)cascadedContainsStyle:(id)a3
{
  TSSStylesheet *mParent;

  if (-[TSSStylesheet containsStyle:](self, "containsStyle:"))
  {
    LOBYTE(mParent) = 1;
  }
  else
  {
    mParent = self->mParent;
    if (mParent)
      LOBYTE(mParent) = -[TSSStylesheet cascadedContainsStyle:](mParent, "cascadedContainsStyle:", a3);
  }
  return (char)mParent;
}

- (id)styleWithIdentifier:(id)a3 componentMask:(int)a4
{
  const char *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  int v20;
  void *v21;
  unsigned int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  v7 = (void *)String(a3, v6);
  v8 = (unint64_t)objc_msgSend(v7, "count") > 2;
  v9 = (unint64_t)objc_msgSend(v7, "count") > 2;
  v10 = (unint64_t)objc_msgSend(v7, "count") > 2;
  v11 = objc_msgSend(v7, "count") == 4;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = (void *)-[NSMutableDictionary keyEnumerator](self->mIdentifierToStyleMap, "keyEnumerator");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = a4 & v8;
    v15 = v9 & (a4 >> 1);
    v16 = v10 & (a4 >> 2);
    v24 = v11 & (a4 >> 3);
    v17 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v12);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (!v14
          || objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 0), "isEqual:", String(v19)))
        {
          if (!v15
            || (v20 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 1), "intValue"),
                String(v19) == v20))
          {
            if ((!v16
               || objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 2), "isEqual:", String(v19)))&& (!v24|| objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", 3), "isEqual:", String(v19))))
            {
              v21 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->mIdentifierToStyleMap, "objectForKeyedSubscript:", v19);
              goto LABEL_18;
            }
          }
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v13)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_18:
  objc_sync_exit(self);
  return v21;
}

- (id)cascadedStyleWithIdentifier:(id)a3 componentMask:(int)a4
{
  uint64_t v4;
  id result;

  v4 = *(_QWORD *)&a4;
  result = -[TSSStylesheet styleWithIdentifier:componentMask:](self, "styleWithIdentifier:componentMask:");
  if (!result)
    return -[TSSStylesheet cascadedStyleWithIdentifier:componentMask:](self->mParent, "cascadedStyleWithIdentifier:componentMask:", a3, v4);
  return result;
}

- (void)setIdentifier:(id)a3 ofStyle:(id)a4
{
  -[TSPObject willModify](self, "willModify");
  objc_sync_enter(self);
  -[TSSStylesheet p_setIdentifier:ofStyle:](self, "p_setIdentifier:ofStyle:", a3, a4);
  objc_sync_exit(self);
}

- (void)setParent:(id)a3 ofStyle:(id)a4
{
  -[TSPObject willModify](self, "willModify");
  objc_sync_enter(self);
  -[TSSStylesheet p_setParent:ofStyle:](self, "p_setParent:ofStyle:", a3, a4);
  objc_sync_exit(self);
}

- (id)childrenOfStyle:(id)a3
{
  void *v5;

  objc_sync_enter(self);
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", -[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->mParentToChildrenStyleMap, "objectForKeyedSubscript:", a3));
  objc_sync_exit(self);
  return v5;
}

- (id)firstStyleWithName:(id)a3
{
  TSUMutableRetainedPointerSet *mStyles;
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
  objc_sync_enter(self);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  mStyles = self->mStyles;
  v6 = -[TSUMutableRetainedPointerSet countByEnumeratingWithState:objects:count:](mStyles, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(mStyles);
      v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
      if ((objc_msgSend(a3, "isEqualToString:", objc_msgSend(v9, "name")) & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = -[TSUMutableRetainedPointerSet countByEnumeratingWithState:objects:count:](mStyles, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }
  objc_sync_exit(self);
  return v9;
}

- (id)cascadedFirstStyleWithName:(id)a3
{
  id result;

  result = -[TSSStylesheet firstStyleWithName:](self, "firstStyleWithName:");
  if (!result)
    return -[TSSStylesheet cascadedFirstStyleWithName:](-[TSSStylesheet parent](self, "parent"), "cascadedFirstStyleWithName:", a3);
  return result;
}

- (id)stylesWithName:(id)a3
{
  TSUMutableRetainedPointerSet *mStyles;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mStyles = self->mStyles;
  v6 = 0;
  v7 = -[TSUMutableRetainedPointerSet countByEnumeratingWithState:objects:count:](mStyles, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(mStyles);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v10, "name")))
        {
          if (!v6)
            v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v6, "addObject:", v10);
        }
      }
      v7 = -[TSUMutableRetainedPointerSet countByEnumeratingWithState:objects:count:](mStyles, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  objc_sync_exit(self);
  return v6;
}

- (id)stylesWithName:(id)a3 ofClass:(Class)a4
{
  TSUMutableRetainedPointerSet *mStyles;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  mStyles = self->mStyles;
  v8 = 0;
  v9 = -[TSUMutableRetainedPointerSet countByEnumeratingWithState:objects:count:](mStyles, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(mStyles);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v12, "name"))
          && objc_msgSend(v12, "isMemberOfClass:", a4))
        {
          if (!v8)
            v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v8, "addObject:", v12);
        }
      }
      v9 = -[TSUMutableRetainedPointerSet countByEnumeratingWithState:objects:count:](mStyles, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  objc_sync_exit(self);
  return v8;
}

- (id)stylesOfClass:(Class)a3
{
  TSUMutableRetainedPointerSet *mStyles;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mStyles = self->mStyles;
  v6 = 0;
  v7 = -[TSUMutableRetainedPointerSet countByEnumeratingWithState:objects:count:](mStyles, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(mStyles);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isMemberOfClass:", a3))
        {
          if (!v6)
            v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v6, "addObject:", v10);
        }
      }
      v7 = -[TSUMutableRetainedPointerSet countByEnumeratingWithState:objects:count:](mStyles, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  objc_sync_exit(self);
  return v6;
}

- (id)identifiedStyles
{
  void *v3;

  objc_sync_enter(self);
  v3 = (void *)-[NSMutableDictionary allValues](self->mIdentifierToStyleMap, "allValues");
  objc_sync_exit(self);
  return v3;
}

- (id)identifiedStylesOfClass:(Class)a3
{
  NSMutableDictionary *mIdentifierToStyleMap;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mIdentifierToStyleMap = self->mIdentifierToStyleMap;
  v6 = 0;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](mIdentifierToStyleMap, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(mIdentifierToStyleMap);
        v10 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->mIdentifierToStyleMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        if (objc_msgSend(v10, "isMemberOfClass:", a3))
        {
          if (!v6)
            v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v6, "addObject:", v10);
        }
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](mIdentifierToStyleMap, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  objc_sync_exit(self);
  return v6;
}

- (void)enumerateStylesUsingBlock:(id)a3
{
  TSUMutableRetainedPointerSet *mStyles;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  mStyles = self->mStyles;
  v6 = -[TSUMutableRetainedPointerSet countByEnumeratingWithState:objects:count:](mStyles, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(mStyles);
      v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
      v10 = 0;
      (*((void (**)(id, uint64_t, char *))a3 + 2))(a3, v9, &v10);
      if (v10)
        break;
      if (v6 == ++v8)
      {
        v6 = -[TSUMutableRetainedPointerSet countByEnumeratingWithState:objects:count:](mStyles, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  objc_sync_exit(self);
}

- (void)enumerateCascadedStylesUsingBlock:(id)a3
{
  -[TSSStylesheet enumerateStylesUsingBlock:](self, "enumerateStylesUsingBlock:");
  if (-[TSSStylesheet parent](self, "parent"))
    -[TSSStylesheet enumerateStylesUsingBlock:](-[TSSStylesheet parent](self, "parent"), "enumerateStylesUsingBlock:", a3);
}

- (id)stylesPassingTest:(id)a3
{
  TSUMutableRetainedPointerSet *mStyles;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  mStyles = self->mStyles;
  v6 = 0;
  v7 = -[TSUMutableRetainedPointerSet countByEnumeratingWithState:objects:count:](mStyles, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(mStyles);
      v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
      v12 = 0;
      if ((*((unsigned int (**)(id, uint64_t, char *))a3 + 2))(a3, v10, &v12))
      {
        if (!v6)
          v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v6, "addObject:", v10);
      }
      if (v12)
        break;
      if (v7 == ++v9)
      {
        v7 = -[TSUMutableRetainedPointerSet countByEnumeratingWithState:objects:count:](mStyles, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  objc_sync_exit(self);
  if (v6)
    return v6;
  else
    return (id)MEMORY[0x24BDBD1A8];
}

- (id)namedStylesOfClass:(Class)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__TSSStylesheet_namedStylesOfClass___block_invoke;
  v4[3] = &unk_24D82B070;
  v4[4] = a3;
  return -[TSSStylesheet stylesPassingTest:](self, "stylesPassingTest:", v4);
}

uint64_t __36__TSSStylesheet_namedStylesOfClass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "name");
  if (result)
    return objc_msgSend(a2, "isMemberOfClass:", *(_QWORD *)(a1 + 32));
  return result;
}

- (id)firstRootlessStyleOfClass:(Class)a3 withOverridePropertyMap:(id)a4
{
  TSUMutableRetainedPointerSet *mStyles;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  mStyles = self->mStyles;
  v8 = -[TSUMutableRetainedPointerSet countByEnumeratingWithState:objects:count:](mStyles, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(mStyles);
      v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
      if (objc_msgSend(v11, "isMemberOfClass:", a3))
      {
        if (!objc_msgSend(v11, "styleIdentifier")
          && (objc_msgSend(v11, "isVariation") & 1) == 0
          && !objc_msgSend(v11, "parent")
          && (objc_msgSend(v11, "overridePropertyMapIsEqualTo:", a4) & 1) != 0)
        {
          break;
        }
      }
      if (v8 == ++v10)
      {
        v8 = -[TSUMutableRetainedPointerSet countByEnumeratingWithState:objects:count:](mStyles, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    v11 = 0;
  }
  objc_sync_exit(self);
  return v11;
}

- (id)variationOfStyleMatchingStyle:(id)a3 withNewParentStyle:(id)a4
{
  return -[TSSStylesheet variationOfStyle:propertyMap:](self, "variationOfStyle:propertyMap:", a4, objc_msgSend(a3, "propertyMap"));
}

- (id)variationOfStyle:(id)a3 propertyMap:(id)a4 context:(id)a5
{
  if (-[TSPObject context](self, "context") == a5)
    return -[TSSStylesheet variationOfStyle:propertyMap:](self, "variationOfStyle:propertyMap:", a3, a4);
  else
    return -[TSSStylesheet pVariationOfStyle:propertyMap:matchStyles:context:](self, "pVariationOfStyle:propertyMap:matchStyles:context:", a3, a4, 0, a5);
}

- (id)variationOfStyle:(id)a3 propertyMap:(id)a4 matchStyles:(id)a5 context:(id)a6
{
  if (-[TSPObject context](self, "context") == a6)
    return -[TSSStylesheet variationOfStyle:propertyMap:](self, "variationOfStyle:propertyMap:", a3, a4);
  else
    return -[TSSStylesheet pVariationOfStyle:propertyMap:matchStyles:context:](self, "pVariationOfStyle:propertyMap:matchStyles:context:", a3, a4, a5, a6);
}

- (id)variationOfStyle:(id)a3 exactPropertyMap:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v19 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStylesheet variationOfStyle:exactPropertyMap:]");
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 837, CFSTR("invalid nil value for '%s'"), "originalStyle");
    if (a4)
      goto LABEL_3;
  }
  v21 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStylesheet variationOfStyle:exactPropertyMap:]");
  objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 838, CFSTR("invalid nil value for '%s'"), "propertyMap");
LABEL_3:
  v7 = a3;
  if (objc_msgSend(a3, "isVariation"))
    v7 = (id)objc_msgSend(a3, "parent");
  if (!v7)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStylesheet variationOfStyle:exactPropertyMap:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 841, CFSTR("Cannot create a variation of variation style <%p> with no parent"), a3);
  }
  if (objc_msgSend(v7, "isVariation"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStylesheet variationOfStyle:exactPropertyMap:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 842, CFSTR("Can't create variation with a variation base style <%p>."), v7);
  }
  v12 = a4;
  objc_sync_enter(self);
  v13 = (void *)-[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->mParentToChildrenStyleMap, "objectForKeyedSubscript:", v7);
  v14 = objc_msgSend(v13, "count");
  if (!v14)
  {
LABEL_14:
    objc_sync_exit(self);
LABEL_15:
    v17 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:name:overridePropertyMap:isVariation:", -[TSPObject context](self, "context"), 0, v12, 1);
    -[TSPObject willModify](self, "willModify");
    objc_sync_enter(self);
    -[TSSStylesheet p_addStyle:withParent:identifier:](self, "p_addStyle:withParent:identifier:", v17, v7, 0);
    objc_sync_exit(self);

    goto LABEL_16;
  }
  v15 = v14 - 1;
  while (1)
  {
    v16 = (id)objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
    v17 = v16;
    if (v16 != a3 && (objc_msgSend(v16, "overridePropertyMapIsEqualTo:", v12) & 1) != 0)
      break;
    if (--v15 == -1)
      goto LABEL_14;
  }
  objc_sync_exit(self);
  if (!v17)
    goto LABEL_15;
LABEL_16:

  return v17;
}

- (void)didLoadChildObjectFromDocumentSupport:(id)a3
{
  void *v4;
  void *v5;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    v5 = v4;
    if ((TSSStylesheet *)objc_msgSend(v4, "stylesheet") == self)
    {
      objc_sync_enter(self);
      if ((-[TSUMutableRetainedPointerSet containsObject:](self->mStyles, "containsObject:", v5) & 1) == 0)
      {
        -[TSPObject willModify](self, "willModify");
        if (objc_msgSend(v5, "styleIdentifier"))
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->mIdentifierToStyleMap, "setObject:forKeyedSubscript:", v5, objc_msgSend(v5, "styleIdentifier"));
        if (objc_msgSend(v5, "parent"))
          -[TSSStylesheet p_addStyleToParentChildren:](self, "p_addStyleToParentChildren:", v5);
        -[TSUMutableRetainedPointerSet addObject:](self->mStyles, "addObject:", v5);
      }
      objc_sync_exit(self);
    }
  }
}

- (void)unlockStylesheetForDurationOfBlock:(id)a3
{
  BOOL mIsLocked;

  mIsLocked = self->mIsLocked;
  self->mIsLocked = 0;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->mIsLocked = mIsLocked;
}

- (void)p_removeStyle:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a3)
  {
    objc_sync_enter(self);
    if (!-[TSSStylesheet containsStyle:](self, "containsStyle:", a3)
      || (TSSStylesheet *)objc_msgSend(a3, "stylesheet") != self)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStylesheet p_removeStyle:]");
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m");
      v8 = TSUObjectReferenceDescription();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 1037, CFSTR("Removing style %@ from stylesheet %@ when style not in stylesheet."), v8, TSUObjectReferenceDescription());
    }
    if (objc_msgSend(a3, "parent"))
      -[TSSStylesheet p_setParent:ofStyle:](self, "p_setParent:ofStyle:", 0, a3);
    if (objc_msgSend(a3, "styleIdentifier"))
      -[TSSStylesheet p_setIdentifier:ofStyle:](self, "p_setIdentifier:ofStyle:", 0, a3);
    objc_msgSend(a3, "setStylesheet:", 0);
    -[TSUMutableRetainedPointerSet removeObject:](self->mStyles, "removeObject:", a3);
    objc_sync_exit(self);
  }
}

- (void)p_removeStyleFromParentChildren:(id)a3
{
  void *v5;
  uint64_t v6;

  objc_sync_enter(self);
  v5 = (void *)-[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->mParentToChildrenStyleMap, "objectForKeyedSubscript:", objc_msgSend(a3, "parent"));
  v6 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "removeObjectAtIndex:", v6);
  if (v5 && !objc_msgSend(v5, "count", v6))
    -[TSURetainedPointerKeyDictionary removeObjectForKey:](self->mParentToChildrenStyleMap, "removeObjectForKey:", objc_msgSend(a3, "parent"));
  objc_sync_exit(self);
}

- (id)pVariationOfStyle:(id)a3 propertyMap:(id)a4 matchStyles:(id)a5 context:(id)a6
{
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  char v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStylesheet pVariationOfStyle:propertyMap:matchStyles:context:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 1173, CFSTR("invalid nil value for '%s'"), "style");
  }
  v13 = a3;
  if (objc_msgSend(a3, "isVariation"))
    v13 = (id)objc_msgSend(a3, "parent");
  if (!v13)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStylesheet pVariationOfStyle:propertyMap:matchStyles:context:]");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 1177, CFSTR("Cannot create a variation of variation style <%p> with no parent"), a3);
  }
  if (objc_msgSend(v13, "isVariation"))
  {
    v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStylesheet pVariationOfStyle:propertyMap:matchStyles:context:]");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStylesheet.m"), 1178, CFSTR("Can't create variation with a variation base style <%p>."), v13);
  }
  v18 = (void *)objc_msgSend(a3, "newOverridePropertyMapWithPropertyMap:", a4);
  if (objc_msgSend(v18, "count"))
  {
    if (!v13)
      goto LABEL_15;
  }
  else
  {

    v18 = 0;
    if (!v13)
      goto LABEL_15;
  }
  if (!v18)
  {
    v19 = v13;
    goto LABEL_40;
  }
LABEL_15:
  if (v13 != a3 && (TSSStylesheet *)objc_msgSend(a3, "stylesheet") == self)
  {
    v26 = objc_msgSend(a3, "overridePropertyMapIsEqualTo:", v18);
    if (a3)
    {
      if ((v26 & 1) != 0)
      {
        v19 = a3;
        goto LABEL_40;
      }
    }
  }
  objc_sync_enter(self);
  v20 = (void *)-[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->mParentToChildrenStyleMap, "objectForKeyedSubscript:", v13);
  v21 = objc_msgSend(v20, "count") - 1;
  while (v21 != -1)
  {
    v19 = (id)objc_msgSend(v20, "objectAtIndexedSubscript:", v21--);
    if ((objc_msgSend(v19, "overridePropertyMapIsEqualTo:", v18) & 1) != 0)
      goto LABEL_22;
  }
  v19 = 0;
LABEL_22:
  objc_sync_exit(self);
  if (!a5 || v19)
  {
LABEL_33:
    if (v19)
      goto LABEL_40;
    goto LABEL_34;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v22 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v29;
LABEL_26:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v23)
        objc_enumerationMutation(a5);
      v19 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * v24);
      if ((objc_msgSend(v19, "overridePropertyMapIsEqualTo:", v18) & 1) != 0)
        goto LABEL_33;
      if (v22 == ++v24)
      {
        v22 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v22)
          goto LABEL_26;
        break;
      }
    }
  }
LABEL_34:
  v19 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:name:overridePropertyMap:isVariation:", a6, 0, v18, 1);
  objc_msgSend(v19, "setParent:", v13);
  if (a5)
    objc_msgSend(a5, "addObject:", v19);
  v25 = v19;
LABEL_40:

  return v19;
}

- (id)unusedStyleIdentifierWithPackageString:(id)a3 styleDescriptor:(id)a4 contentTag:(id)a5
{
  uint64_t v9;
  void *v10;
  void *v11;

  v9 = 0;
  do
  {
    v10 = (void *)String((uint64_t)a3, v9, (uint64_t)a4);
    v11 = v10;
    if (a5)
      v11 = (void *)String(v10, (uint64_t)a5);
    ++v9;
  }
  while (-[TSSStylesheet styleWithIdentifier:](self, "styleWithIdentifier:", v11));
  return v11;
}

- (TSSStylesheet)child
{
  return self->mChild;
}

- (id)p_variationMapForVaryingCharacterStyle:(id)a3 overParagraphStyle:(id)a4 withPropertyMap:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  v8 = +[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap");
  if (a3)
  {
    v9 = objc_msgSend(a3, "baseStyleForVariation");
    if (objc_msgSend(a3, "isVariation"))
      objc_msgSend(v8, "addValuesFromPropertyMap:", objc_msgSend(a3, "overridePropertyMap"));
    if (a5)
      goto LABEL_5;
  }
  else
  {
    v9 = 0;
    if (a5)
LABEL_5:
      objc_msgSend(v8, "addValuesFromPropertyMap:", a5);
  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__19;
  v19 = __Block_byref_object_dispose__19;
  v20 = 0;
  v10 = (void *)objc_msgSend(v8, "allProperties");
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __111__TSSStylesheet_TSWPStyleAdditions__p_variationMapForVaryingCharacterStyle_overParagraphStyle_withPropertyMap___block_invoke;
  v14[3] = &unk_24D82BEE8;
  v14[4] = v8;
  v14[5] = v9;
  v14[6] = a4;
  v14[7] = &v15;
  objc_msgSend(v10, "enumeratePropertiesUsingBlock:", v14);
  if (v16[5])
  {
    objc_msgSend(v8, "removeValuesForProperties:");

  }
  if (!v8)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStylesheet(TSWPStyleAdditions) p_variationMapForVaryingCharacterStyle:overParagraphStyle:withPropertyMap:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStylesheetAdditions.mm"), 127, CFSTR("invalid nil value for '%s'"), "newPropertyMap");
  }
  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t __111__TSSStylesheet_TSWPStyleAdditions__p_variationMapForVaryingCharacterStyle_overParagraphStyle_withPropertyMap___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  void *v8;

  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "boxedObjectForProperty:", a2);
  if (v4 == (void *)objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    v4 = 0;
  v5 = objc_msgSend(*(id *)(a1 + 40), "boxedValueForProperty:", a2);
  if (!v5)
    v5 = objc_msgSend(*(id *)(a1 + 48), "boxedValueForProperty:", a2);
  if (v5 == objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    v6 = 0;
  else
    v6 = (void *)v5;
  if (v4 == v6 || (result = objc_msgSend(v4, "isEqual:"), (_DWORD)result))
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v8)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_alloc_init(TSSMutablePropertySet);
      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    return objc_msgSend(v8, "addProperty:", a2);
  }
  return result;
}

- (id)variationOfCharacterStyle:(id)a3 paragraphStyle:(id)a4 propertyMap:(id)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (a4)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStylesheet(TSWPStyleAdditions) variationOfCharacterStyle:paragraphStyle:propertyMap:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStylesheetAdditions.mm"), 160, CFSTR("invalid nil value for '%s'"), "inParagraphStyle");
    if (a5)
      goto LABEL_3;
  }
  v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStylesheet(TSWPStyleAdditions) variationOfCharacterStyle:paragraphStyle:propertyMap:]");
  objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStylesheetAdditions.mm"), 161, CFSTR("invalid nil value for '%s'"), "inPropertyMap");
LABEL_3:
  v9 = -[TSSStylesheet p_variationMapForVaryingCharacterStyle:overParagraphStyle:withPropertyMap:](self, "p_variationMapForVaryingCharacterStyle:overParagraphStyle:withPropertyMap:", a3, a4, a5);
  if (a3)
    v10 = (id)objc_msgSend(a3, "baseStyleForVariation");
  else
    v10 = -[TSSStylesheet defaultCharacterStyle](self, "defaultCharacterStyle");
  v15 = v10;
  if (!v10)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStylesheet(TSWPStyleAdditions) variationOfCharacterStyle:paragraphStyle:propertyMap:]");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStylesheetAdditions.mm"), 170, CFSTR("invalid nil value for '%s'"), "baseStyle");
  }
  v18 = -[TSSStylesheet variationOfStyle:propertyMap:](self, "variationOfStyle:propertyMap:", v15, v9);
  if (v18 == -[TSSStylesheet defaultCharacterStyle](self, "defaultCharacterStyle"))
    return 0;
  else
    return v18;
}

- (id)hyperlinkStyle
{
  return -[TSSStylesheet _hyperlinkStyleWasCreated:](self, "_hyperlinkStyleWasCreated:", 0);
}

- (id)headerAndFooterStyle
{
  id result;

  objc_opt_class();
  -[TSSStylesheet cascadedFirstStyleWithName:](self, "cascadedFirstStyleWithName:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Header & Footer"), &stru_24D82FEB0, CFSTR("TSText")));
  result = (id)TSUDynamicCast();
  if (!result)
    return -[TSSStylesheet defaultParagraphStyle](self, "defaultParagraphStyle");
  return result;
}

- (id)_hyperlinkStyleWasCreated:(BOOL *)a3
{
  return -[TSSStylesheet _defaultStyleOfClass:withIdentifier:wasCreated:usingBlock:](self, "_defaultStyleOfClass:withIdentifier:wasCreated:usingBlock:", objc_opt_class(), CFSTR("character-style-hyperlink"), a3, &__block_literal_global_54);
}

TSWPCharacterStyle *__60__TSSStylesheet_TSText_Internal___hyperlinkStyleWasCreated___block_invoke(uint64_t a1, uint64_t a2)
{
  return -[TSSStyle initWithContext:name:overridePropertyMap:isVariation:]([TSWPCharacterStyle alloc], "initWithContext:name:overridePropertyMap:isVariation:", a2, objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Link"), &stru_24D82FEB0, CFSTR("TSText")), +[TSSPropertyMap propertyMapWithPropertiesAndValues:](TSSPropertyMap, "propertyMapWithPropertiesAndValues:", 22, 1, 0), 0);
}

@end
