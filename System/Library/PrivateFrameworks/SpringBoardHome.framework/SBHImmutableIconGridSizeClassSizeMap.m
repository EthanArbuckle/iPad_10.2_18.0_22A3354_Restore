@implementation SBHImmutableIconGridSizeClassSizeMap

- (SBHImmutableIconGridSizeClassSizeMap)initWithGridSizeClassSizes:(id)a3
{
  id v4;
  SBHImmutableIconGridSizeClassSizeMap *v5;
  uint64_t v6;
  NSDictionary *sizes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHImmutableIconGridSizeClassSizeMap;
  v5 = -[SBHIconGridSizeClassSizeMap initWithGridSizeClassSizes:](&v9, sel_initWithGridSizeClassSizes_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sizes = v5->_sizes;
    v5->_sizes = (NSDictionary *)v6;

  }
  return v5;
}

- (id)_sizes
{
  return self->_sizes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizes, 0);
}

@end
