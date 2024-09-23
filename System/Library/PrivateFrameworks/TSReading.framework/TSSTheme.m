@implementation TSSTheme

+ (TSSTheme)themeWithContext:(id)a3 alternate:(int)a4
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)&a4;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContext:", a3);
  objc_msgSend(v5, "bootstrapThemeAlternate:", v4);
  return (TSSTheme *)v5;
}

- (TSSTheme)initWithContext:(id)a3
{
  TSSTheme *v4;
  TSSStylesheet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSSTheme;
  v4 = -[TSPObject initWithContext:](&v7, sel_initWithContext_);
  if (v4)
  {
    v5 = -[TSSStylesheet initWithContext:]([TSSStylesheet alloc], "initWithContext:", a3);
    v4->mStylesheet = v5;
    -[TSSStylesheet setIsLocked:](v5, "setIsLocked:", 1);
    v4->mPresetsByKind = (NSMutableDictionary *)objc_opt_new();
    -[TSSTheme disablePresetValidation](v4, "disablePresetValidation");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSSTheme;
  -[TSSTheme dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  if (a3 == self)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_opt_class();
    v4 = (_QWORD *)TSUDynamicCast();
    if (v4)
    {
      v5 = v4;
      if ((TSSStylesheet *)objc_msgSend(v4, "stylesheet") == self->mStylesheet
        || (LODWORD(v4) = objc_msgSend((id)objc_msgSend(v5, "stylesheet"), "isEqual:", self->mStylesheet), (_DWORD)v4))
      {
        LOBYTE(v4) = -[NSMutableDictionary isEqual:](self->mPresetsByKind, "isEqual:", v5[8]);
      }
    }
  }
  return (char)v4;
}

- (void)setThemeIdentifier:(id)a3
{
  -[TSPObject willModify](self, "willModify");
  self->mThemeIdentifier = (NSString *)objc_msgSend(a3, "copy");
}

- (NSString)themeIdentifier
{
  return self->mThemeIdentifier;
}

- (BOOL)isLocked
{
  return -[TSSStylesheet isLocked](self->mStylesheet, "isLocked");
}

- (void)setIsLocked:(BOOL)a3
{
  -[TSSStylesheet setIsLocked:](self->mStylesheet, "setIsLocked:", a3);
}

+ (id)presetSources
{
  if (presetSources_onceToken != -1)
    dispatch_once(&presetSources_onceToken, &__block_literal_global_20);
  return (id)presetSources_presetSources;
}

uint64_t __25__TSSTheme_presetSources__block_invoke()
{
  uint64_t result;

  result = objc_opt_new();
  presetSources_presetSources = result;
  return result;
}

+ (void)registerPresetSourceClasses
{
  objc_msgSend(a1, "registerPresetSourceClass:", objc_opt_class());
}

+ (void)registerPresetSourceClass:(Class)a3
{
  void *v5;
  _QWORD v6[6];

  v5 = (void *)-[objc_class presetKinds](a3, "presetKinds");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__TSSTheme_registerPresetSourceClass___block_invoke;
  v6[3] = &unk_24D82B0E0;
  v6[4] = a1;
  v6[5] = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
}

uint64_t __38__TSSTheme_registerPresetSourceClass___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "presetSources"), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), a2);
}

- (id)presetsOfKind:(id)a3
{
  if (a3)
    return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->mPresetsByKind, "objectForKeyedSubscript:");
  else
    return 0;
}

- (BOOL)hasPresetsOfKind:(id)a3
{
  return a3 && -[NSMutableDictionary objectForKeyedSubscript:](self->mPresetsByKind, "objectForKeyedSubscript:") != 0;
}

- (void)setPresets:(id)a3 ofKind:(id)a4
{
  void *v7;
  uint64_t v8;

  if (!a4)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSTheme setPresets:ofKind:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSTheme.m"), 210, CFSTR("invalid nil value for '%s'"), "kind");
  }
  -[TSPObject willModify](self, "willModify");
  if (a3 && objc_msgSend(a3, "count"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->mPresetsByKind, "setObject:forKeyedSubscript:", (id)objc_msgSend(a3, "mutableCopy"), a4);
  else
    -[NSMutableDictionary removeObjectForKey:](self->mPresetsByKind, "removeObjectForKey:", a4);
}

- (void)addPreset:(id)a3 ofKind:(id)a4
{
  void *v7;

  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->mPresetsByKind, "objectForKeyedSubscript:", a4);
  if (!v7 || (objc_msgSend(v7, "containsObject:", a3) & 1) == 0)
    -[TSSTheme insertPreset:ofKind:atIndex:](self, "insertPreset:ofKind:atIndex:", a3, a4, -1);
}

- (void)insertPreset:(id)a3 ofKind:(id)a4 atIndex:(unint64_t)a5
{
  void *v9;

  -[TSPObject willModify](self, "willModify");
  v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->mPresetsByKind, "objectForKeyedSubscript:", a4);
  if (!v9)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->mPresetsByKind, "setObject:forKeyedSubscript:", v9, a4);
  }
  if (a5 == -1 || objc_msgSend(v9, "count") <= a5)
    objc_msgSend(v9, "addObject:", a3);
  else
    objc_msgSend(v9, "insertObject:atIndex:", a3, a5);
}

- (void)removePreset:(id)a3
{
  uint64_t v5;
  void *v6;

  if (a3)
  {
    v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->mPresetsByKind, "objectForKeyedSubscript:", objc_msgSend(a3, "presetKind"));
    if (v5)
    {
      v6 = (void *)v5;
      -[TSPObject willModify](self, "willModify");
      objc_msgSend(v6, "removeObject:", a3);
    }
  }
}

- (void)movePresetOfKind:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  id v9;
  id v10;
  id v11;

  v9 = (id)objc_msgSend(-[TSSTheme presetsOfKind:](self, "presetsOfKind:"), "mutableCopy");
  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = v9;
  if (objc_msgSend(v9, "count") > a4 && objc_msgSend(v11, "count") > a5)
  {
    v10 = -[TSSTheme presetOfKind:index:](self, "presetOfKind:index:", a3, a4);
    objc_msgSend(v11, "removeObject:", v10);
    objc_msgSend(v11, "insertObject:atIndex:", v10, a5);
    -[TSSTheme setPresets:ofKind:](self, "setPresets:ofKind:", v11, a3);
  }

}

- (id)presetOfKind:(id)a3 index:(unint64_t)a4
{
  id v6;
  void *v8;
  uint64_t v9;

  v6 = -[TSSTheme presetsOfKind:](self, "presetsOfKind:");
  if (objc_msgSend(v6, "count") > a4)
    return (id)objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSTheme presetOfKind:index:]");
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSTheme.m"), 303, CFSTR("Attempt to request %@ preset for out of bounds index %lu."), a3, a4);
  return 0;
}

- (unint64_t)indexOfPreset:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;

  v5 = objc_msgSend(a3, "presetKind");
  if (v5 != String
    && (v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->mPresetsByKind, "objectForKeyedSubscript:", v5)) != 0&& (v7 = v6, objc_msgSend(v6, "count")))
  {
    return objc_msgSend(v7, "indexOfObjectIdenticalTo:", a3);
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)colors
{
  return -[TSSTheme presetsOfKind:](self, "presetsOfKind:", String);
}

- (BOOL)containsCGColor:(CGColor *)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[TSSTheme colors](self, "colors", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if (CGColorEqualToColor(a3, (CGColorRef)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "CGColor")))
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return v5;
}

- (id)childEnumerator
{
  id v3;
  NSMutableDictionary *mPresetsByKind;
  _QWORD v6[5];

  v3 = (id)objc_opt_new();
  mPresetsByKind = self->mPresetsByKind;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __27__TSSTheme_childEnumerator__block_invoke;
  v6[3] = &unk_24D82B108;
  v6[4] = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mPresetsByKind, "enumerateKeysAndObjectsUsingBlock:", v6);
  return v3;
}

uint64_t __27__TSSTheme_childEnumerator__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  if (result)
  {
    result = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "conformsToProtocol:", &unk_254F2D9E0);
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(a3, "objectEnumerator"));
  }
  return result;
}

- (id)modelPathComponentForChild:(id)a3
{
  void *v5;

  objc_opt_class();
  v5 = (void *)TSUClassAndProtocolCast();
  if (v5)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%lu"), String(objc_msgSend(v5, "presetKind", &unk_254F6FC90)), -[TSSTheme indexOfPreset:](self, "indexOfPreset:", v5));
  else
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("?%s-%p?"), object_getClassName(a3), a3);
}

- (id)p_identifierForBootstrapTheme:(int)a3
{
  return off_24D82B128[a3];
}

+ (id)presetBootstrapOrder
{
  _QWORD v3[14];

  v3[13] = *MEMORY[0x24BDAC8D0];
  v3[0] = String;
  v3[1] = String;
  v3[2] = String;
  v3[3] = String;
  v3[4] = String;
  v3[5] = String;
  v3[6] = String;
  v3[7] = String;
  v3[8] = String;
  v3[9] = String;
  v3[10] = String;
  v3[11] = String;
  v3[12] = String;
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 13);
}

- (void)bootstrapThemeAlternate:(int)a3
{
  uint64_t v3;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v5 = -[TSSTheme isLocked](self, "isLocked");
  -[TSSTheme setIsLocked:](self, "setIsLocked:", 0);
  if ((-[TSSTheme isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = (void *)objc_msgSend((id)objc_opt_class(), "presetBootstrapOrder", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "presetSources"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10)), "bootstrapPresetsOfKind:inTheme:alternate:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10), self, v3);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }
  -[TSSTheme setThemeIdentifier:](self, "setThemeIdentifier:", -[TSSTheme p_identifierForBootstrapTheme:](self, "p_identifierForBootstrapTheme:", v3));
  -[TSSTheme setIsLocked:](self, "setIsLocked:", v5);
}

- (void)checkThemeStylesheetConsistency
{
  TSKDocumentModelEnumerator *v3;
  _QWORD v4[5];

  v3 = -[TSKDocumentModelEnumerator initWithRootModelObject:filter:]([TSKDocumentModelEnumerator alloc], "initWithRootModelObject:filter:", self, 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__TSSTheme_checkThemeStylesheetConsistency__block_invoke;
  v4[3] = &unk_24D82B168;
  v4[4] = self;
  -[TSKDocumentModelEnumerator enumerateReferencedStylesUsingBlock:](v3, "enumerateReferencedStylesUsingBlock:", v4);

}

uint64_t __43__TSSTheme_checkThemeStylesheetConsistency__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t result;
  void *v6;
  uint64_t v7;

  if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "stylesheet"), "containsStyle:", a2)
    || (v4 = objc_msgSend(a2, "stylesheet"), result = objc_msgSend(*(id *)(a1 + 32), "stylesheet"), v4 != result))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSTheme checkThemeStylesheetConsistency]_block_invoke");
    return objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSTheme.m"), 440, CFSTR("theme content refers to a style %@ not in the theme stylesheet"), a2);
  }
  return result;
}

- (TSSStylesheet)stylesheet
{
  return self->mStylesheet;
}

@end
