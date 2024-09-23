@implementation TSSThemeAssetMapper

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSSThemeAssetMapper;
  -[TSSThemeAssetMapper dealloc](&v3, sel_dealloc);
}

- (TSSThemeAssetMapper)initWithFromTheme:(id)a3 toTheme:(id)a4
{
  TSSThemeAssetMapper *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSSThemeAssetMapper;
  v6 = -[TSSThemeAssetMapper init](&v8, sel_init);
  if (v6)
  {
    v6->mFromTheme = (TSSTheme *)a3;
    v6->mToTheme = (TSSTheme *)a4;
    v6->mAssetMap = (TSUCustomCallBackDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3C48]), "initForThemeAssetMapperWithCapacity:", 0);
  }
  return v6;
}

- (TSSThemeAssetMapper)init
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSThemeAssetMapper init]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSThemeAssetMapper.m"), 76, CFSTR("-init not supported, call designated initializer instead."));

  return 0;
}

- (id)mappedAssetForAsset:(id)a3
{
  void *v5;
  uint64_t v6;
  char *v7;
  void *v8;

  v5 = (void *)-[TSUCustomCallBackDictionary objectForKeyedSubscript:](self->mAssetMap, "objectForKeyedSubscript:");
  if (!v5)
  {
    if (!objc_msgSend(a3, "conformsToProtocol:", &unk_254F6FC90)
      || (v6 = objc_msgSend(a3, "presetKind"), String == v6)
      || -[TSSThemeAssetMapper p_hasCachedMappingsForPresetsOfKind:](self, "p_hasCachedMappingsForPresetsOfKind:", v6)
      || ((objc_opt_respondsToSelector() & 1) == 0
        ? (v7 = sel_mapPresetsWithKindFromPreset_)
        : (v7 = (char *)objc_msgSend(a3, "mapThemePresetsSelector")),
          v8 = (void *)-[TSSThemeAssetMapper performSelector:withObject:](self, "performSelector:withObject:", v7, a3),
          -[TSSThemeAssetMapper cacheAssetMappings:](self, "cacheAssetMappings:", v8),
          (v5 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", a3)) == 0))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v5 = (void *)-[TSSThemeAssetMapper performSelector:withObject:](self, "performSelector:withObject:", objc_msgSend(a3, "mapThemeAssetSelector"), a3);
        if (v5)
          -[TSSThemeAssetMapper cacheMappingFromAsset:toAsset:](self, "cacheMappingFromAsset:toAsset:", a3, v5);
      }
      else
      {
        return 0;
      }
    }
  }
  return v5;
}

- (id)mapPresetsWithKindFromPreset:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = objc_msgSend(a3, "presetKind");
  if (String == v4)
    goto LABEL_18;
  v5 = v4;
  v6 = -[TSSTheme presetsOfKind:](-[TSSThemeAssetMapper fromTheme](self, "fromTheme"), "presetsOfKind:", v4);
  v7 = -[TSSTheme presetsOfKind:](-[TSSThemeAssetMapper toTheme](self, "toTheme"), "presetsOfKind:", v5);
  v8 = v7;
  if (v6)
  {
    v9 = objc_msgSend(v6, "count");
    if (v8)
      goto LABEL_4;
  }
  else
  {
    v9 = 0;
    if (v7)
    {
LABEL_4:
      v10 = objc_msgSend(v8, "count") - 1;
      if (v9)
        goto LABEL_5;
LABEL_18:
      v12 = 0;
      return v12;
    }
  }
  v10 = -1;
  if (!v9)
    goto LABEL_18;
LABEL_5:
  v11 = 0;
  v12 = 0;
  do
  {
    if (v8)
    {
      v13 = v11 >= v10 ? v10 : v11;
      v14 = objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
      if (v14)
      {
        v15 = v14;
        if (!v12)
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3C48]), "initWithCapacity:", v9);
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, objc_msgSend(v6, "objectAtIndexedSubscript:", v11));
      }
    }
    ++v11;
    --v9;
  }
  while (v9);
  return v12;
}

- (id)mapStyle:(id)a3
{
  TSSStylesheet *v5;
  id v6;
  uint64_t v7;
  void *v8;
  TSSStylesheet *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = -[TSSTheme stylesheet](self->mFromTheme, "stylesheet");
  if (v5 == (TSSStylesheet *)objc_msgSend(a3, "stylesheet"))
  {
    v8 = 0;
    v12 = 0;
    v6 = a3;
    if (a3)
      goto LABEL_7;
LABEL_11:
    v15 = TSUObjectReferenceDescription();
    NSLog((NSString *)CFSTR("Failed to find original theme style when mapping style %@."), v15);
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_22:
      v18 = TSUObjectReferenceDescription();
      NSLog((NSString *)CFSTR("Failed to find mapped theme style when mapping style %@."), v18);
LABEL_23:
      v19 = TSUObjectReferenceDescription();
      NSLog((NSString *)CFSTR("Failed to find mapped style for style %@."), v19);
      return 0;
    }
    v6 = 0;
    v8 = v12;
    goto LABEL_13;
  }
  v6 = (id)objc_msgSend(a3, "parent");
  v7 = objc_msgSend(a3, "overridePropertyMap");
  v8 = (void *)v7;
  if (!v6)
  {
    v12 = (id)v7;
    goto LABEL_11;
  }
  while (1)
  {
    v9 = (TSSStylesheet *)objc_msgSend(v6, "stylesheet");
    if (v9 == -[TSSTheme stylesheet](self->mFromTheme, "stylesheet"))
      break;
    v10 = TSUObjectReferenceDescription();
    v11 = TSUObjectReferenceDescription();
    NSLog((NSString *)CFSTR("Mapping style %@ whose ancestor %@ is not in the original theme stylesheet."), v10, v11);
    v12 = (id)objc_msgSend((id)objc_msgSend(v6, "overridePropertyMap"), "copy");
    objc_msgSend(v12, "addValuesFromPropertyMap:", v8);
    v6 = (id)objc_msgSend(v6, "parent");
    v8 = v12;
    if (!v6)
      goto LABEL_11;
  }
LABEL_7:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
LABEL_13:
    v14 = (id)-[TSSThemeAssetMapper performSelector:withObject:](self, "performSelector:withObject:", objc_msgSend(a3, "mapThemeStyleSelector"), v6);
    goto LABEL_14;
  }
  v13 = objc_msgSend(v6, "styleIdentifier");
  if (!v13)
  {
    v17 = TSUObjectReferenceDescription();
    NSLog((NSString *)CFSTR("Original theme style %@ has no identifier."), v17);
    goto LABEL_22;
  }
  v14 = -[TSSStylesheet styleWithIdentifier:](-[TSSTheme stylesheet](-[TSSThemeAssetMapper toTheme](self, "toTheme"), "stylesheet"), "styleWithIdentifier:", v13);
LABEL_14:
  v16 = v14;
  if (!v14)
    goto LABEL_22;
  if (v8 && objc_msgSend(v8, "count"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (void *)-[TSSThemeAssetMapper performSelector:withObject:](self, "performSelector:withObject:", objc_msgSend(a3, "mapThemePropertyMapSelector"), v8);
    v16 = (void *)objc_msgSend((id)objc_msgSend(-[TSPObject documentRoot](self->mFromTheme, "documentRoot"), "stylesheet"), "variationOfStyle:propertyMap:", v16, v8);
    if (!v16)
      goto LABEL_23;
  }
  return v16;
}

- (void)cacheMappingFromAsset:(id)a3 toAsset:(id)a4
{
  -[TSUCustomCallBackDictionary setObject:forUncopiedKey:](self->mAssetMap, "setObject:forUncopiedKey:", a4, a3);
}

- (void)cacheAssetMappings:(id)a3
{
  -[TSUCustomCallBackDictionary addEntriesFromDictionary:](self->mAssetMap, "addEntriesFromDictionary:", a3);
}

- (void)clearMappingCache
{
  -[TSUCustomCallBackDictionary removeAllObjects](self->mAssetMap, "removeAllObjects");
}

- (TSSTheme)fromTheme
{
  return self->mFromTheme;
}

- (TSSTheme)toTheme
{
  return self->mToTheme;
}

- (BOOL)p_hasCachedMappingsForPresetsOfKind:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = -[TSSTheme presetOfKind:index:](self->mFromTheme, "presetOfKind:index:", a3, 0);
  if (!v4
    || (v5 = -[TSUCustomCallBackDictionary objectForKeyedSubscript:](self->mAssetMap, "objectForKeyedSubscript:", v4)) != 0)
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

@end
