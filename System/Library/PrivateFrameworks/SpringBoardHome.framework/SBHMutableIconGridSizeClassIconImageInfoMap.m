@implementation SBHMutableIconGridSizeClassIconImageInfoMap

- (SBHMutableIconGridSizeClassIconImageInfoMap)initWithIconImageInfos:(id)a3
{
  id v4;
  SBHMutableIconGridSizeClassIconImageInfoMap *v5;
  uint64_t v6;
  NSMutableDictionary *iconImageInfos;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHMutableIconGridSizeClassIconImageInfoMap;
  v5 = -[SBHIconGridSizeClassIconImageInfoMap initWithIconImageInfos:](&v9, sel_initWithIconImageInfos_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    iconImageInfos = v5->_iconImageInfos;
    v5->_iconImageInfos = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3 forGridSizeClass:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSMutableDictionary *v13;
  NSMutableDictionary *iconImageInfos;
  void *v15;
  SBIconImageInfo *v16;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v16 = a3;
  if (!self->_iconImageInfos)
  {
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    iconImageInfos = self->_iconImageInfos;
    self->_iconImageInfos = v13;

  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "sbh_valueWithSBIconImageInfo:", v11, v10, v9, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_iconImageInfos, "setObject:forKey:", v15, v16);

}

- (id)_iconImageInfos
{
  return self->_iconImageInfos;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBHIconGridSizeClassIconImageInfoMap initWithIconGridSizeClassIconImageInfoMap:](+[SBHIconGridSizeClassIconImageInfoMap allocWithZone:](SBHImmutableIconGridSizeClassIconImageInfoMap, "allocWithZone:", a3), "initWithIconGridSizeClassIconImageInfoMap:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageInfos, 0);
}

@end
