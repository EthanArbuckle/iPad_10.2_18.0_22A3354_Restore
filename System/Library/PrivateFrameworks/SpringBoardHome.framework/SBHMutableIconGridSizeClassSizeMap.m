@implementation SBHMutableIconGridSizeClassSizeMap

- (SBHMutableIconGridSizeClassSizeMap)initWithGridSizeClassSizes:(id)a3
{
  id v4;
  SBHMutableIconGridSizeClassSizeMap *v5;
  uint64_t v6;
  NSMutableDictionary *sizes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHMutableIconGridSizeClassSizeMap;
  v5 = -[SBHIconGridSizeClassSizeMap initWithGridSizeClassSizes:](&v9, sel_initWithGridSizeClassSizes_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    sizes = v5->_sizes;
    v5->_sizes = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (void)setGridSize:(SBHIconGridSize)a3 forGridSizeClass:(id)a4
{
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *sizes;
  void *v8;
  SBHIconGridSize v9;

  v9 = a3;
  v5 = a4;
  if (!self->_sizes)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sizes = self->_sizes;
    self->_sizes = v6;

  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v9, "{SBHIconGridSize=SS}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_sizes, "setObject:forKey:", v8, v5);

}

- (id)_sizes
{
  return self->_sizes;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBHIconGridSizeClassSizeMap initWithIconGridSizeClassSizeMap:](+[SBHIconGridSizeClassSizeMap allocWithZone:](SBHImmutableIconGridSizeClassSizeMap, "allocWithZone:", a3), "initWithIconGridSizeClassSizeMap:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizes, 0);
}

@end
