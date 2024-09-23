@implementation SKUISettingsDescriptionUpdate

- (SKUISettingsDescriptionUpdate)initWithUpdateType:(int64_t)a3
{
  SKUISettingsDescriptionUpdate *result;
  objc_super v6;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISettingsDescriptionUpdate initWithUpdateType:].cold.1();
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUISettingsDescriptionUpdate;
  result = -[SKUISettingsDescriptionUpdate init](&v6, sel_init);
  if (result)
    result->_updateType = a3;
  return result;
}

- (NSArray)indexPaths
{
  return self->_indexPaths;
}

- (void)setIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_indexPaths, a3);
}

- (NSIndexSet)indexSet
{
  return self->_indexSet;
}

- (void)setIndexSet:(id)a3
{
  objc_storeStrong((id *)&self->_indexSet, a3);
}

- (int64_t)updateType
{
  return self->_updateType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSet, 0);
  objc_storeStrong((id *)&self->_indexPaths, 0);
}

- (void)initWithUpdateType:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISettingsDescriptionUpdate initWithUpdateType:]";
}

@end
