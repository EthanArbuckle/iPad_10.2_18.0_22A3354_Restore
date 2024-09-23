@implementation _UIVisualEffectConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentConfig, 0);
  objc_storeStrong((id *)&self->_layerConfigs, 0);
}

+ (_UIVisualEffectConfig)configWithContentConfig:(id)a3
{
  _UIVisualEffectLayerConfig *v3;
  _UIVisualEffectConfig *v4;
  _UIVisualEffectLayerConfig *contentConfig;

  v3 = (_UIVisualEffectLayerConfig *)a3;
  v4 = objc_alloc_init(_UIVisualEffectConfig);
  contentConfig = v4->_contentConfig;
  v4->_contentConfig = v3;

  return v4;
}

- (_UIVisualEffectLayerConfig)contentConfig
{
  return self->_contentConfig;
}

- (void)enumerateLayerConfigs:(id)a3
{
  id v4;
  NSMutableArray *layerConfigs;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  layerConfigs = self->_layerConfigs;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47___UIVisualEffectConfig_enumerateLayerConfigs___block_invoke;
  v7[3] = &unk_1E16B5260;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](layerConfigs, "enumerateObjectsUsingBlock:", v7);

}

+ (_UIVisualEffectConfig)configWithLayerConfigs:(id)a3
{
  id v3;
  _UIVisualEffectConfig *v4;
  uint64_t v5;
  NSMutableArray *layerConfigs;

  v3 = a3;
  v4 = objc_alloc_init(_UIVisualEffectConfig);
  v5 = objc_msgSend(v3, "mutableCopy");

  layerConfigs = v4->_layerConfigs;
  v4->_layerConfigs = (NSMutableArray *)v5;

  return v4;
}

- (void)addLayerConfig:(id)a3
{
  NSMutableArray *layerConfigs;
  NSMutableArray *v4;
  objc_class *v6;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *v9;

  layerConfigs = self->_layerConfigs;
  if (layerConfigs)
  {
    v9 = (NSMutableArray *)a3;
    -[NSMutableArray addObject:](layerConfigs, "addObject:", v9);
    v4 = v9;
  }
  else
  {
    v6 = (objc_class *)MEMORY[0x1E0C99DE8];
    v7 = a3;
    v8 = (NSMutableArray *)objc_msgSend([v6 alloc], "initWithObjects:", v7, 0);

    v4 = self->_layerConfigs;
    self->_layerConfigs = v8;
  }

}

- (id)description
{
  void *v3;
  _UIVisualEffectLayerConfig *contentConfig;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIVisualEffectConfig;
  -[_UIVisualEffectConfig description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  contentConfig = self->_contentConfig;
  -[NSMutableArray componentsJoinedByString:](self->_layerConfigs, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" contentConfig=%@; layerConfigs={%@}"), contentConfig, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)layerConfigs
{
  return &self->_layerConfigs->super;
}

@end
