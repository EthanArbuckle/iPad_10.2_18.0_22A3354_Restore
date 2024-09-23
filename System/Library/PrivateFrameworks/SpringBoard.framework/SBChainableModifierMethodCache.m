@implementation SBChainableModifierMethodCache

- (SBModifierCacheCoordinator)cacheCoordinator
{
  return self->_cacheCoordinator;
}

- (void)setCacheCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_cacheCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheCoordinator, 0);
}

- (void)setModifier:(id)a3
{
  self->_modifier = (SBChainableModifier *)a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void **imps;
  SBModifierCacheSelectorList *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  imps = self->_imps;
  v6 = -[SBModifierCacheSelectorList initWithSelectors:count:]([SBModifierCacheSelectorList alloc], "initWithSelectors:count:", self->_selectors, self->_selectorCount);
  v7 = (void *)objc_msgSend(v4, "initWithIMPs:selectorList:subsequentMethodCacheFunc:", imps, v6, self->_nextFunc);

  return v7;
}

- (SBChainableModifierMethodCache)initWithIMPs:(void *)a3 selectorList:(id)a4 subsequentMethodCacheFunc:(void *)a5
{
  _QWORD *v7;
  SBChainableModifierMethodCache *v8;
  SBModifierCacheCoordinator *v9;
  SBModifierCacheCoordinator *cacheCoordinator;
  size_t v11;
  SEL *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBChainableModifierMethodCache;
  v7 = a4;
  v8 = -[SBChainableModifierMethodCache init](&v14, sel_init);
  v9 = objc_alloc_init(SBModifierCacheCoordinator);
  cacheCoordinator = v8->_cacheCoordinator;
  v8->_cacheCoordinator = v9;

  v8->_imps = a3;
  v11 = v7[1];
  v12 = (SEL *)v7[2];
  v8->_selectorCount = v11;

  v8->_selectors = v12;
  v8->_dispatchCache = (SBModifierCacheDispatchData *)malloc_type_calloc(v11, 0x10uLL, 0x80040803F642BuLL);
  v8->_nextFunc = a5;
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_dispatchCache);
  v3.receiver = self;
  v3.super_class = (Class)SBChainableModifierMethodCache;
  -[SBChainableModifierMethodCache dealloc](&v3, sel_dealloc);
}

- (BOOL)hasNonTrampolineIMPs
{
  return self->_imps != 0;
}

- (SBChainableModifier)modifier
{
  return self->_modifier;
}

@end
