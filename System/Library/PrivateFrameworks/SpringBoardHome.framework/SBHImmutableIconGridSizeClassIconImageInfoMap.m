@implementation SBHImmutableIconGridSizeClassIconImageInfoMap

- (SBHImmutableIconGridSizeClassIconImageInfoMap)initWithIconImageInfos:(id)a3
{
  id v4;
  SBHImmutableIconGridSizeClassIconImageInfoMap *v5;
  uint64_t v6;
  NSDictionary *iconImageInfos;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHImmutableIconGridSizeClassIconImageInfoMap;
  v5 = -[SBHIconGridSizeClassIconImageInfoMap initWithIconImageInfos:](&v9, sel_initWithIconImageInfos_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    iconImageInfos = v5->_iconImageInfos;
    v5->_iconImageInfos = (NSDictionary *)v6;

  }
  return v5;
}

- (id)_iconImageInfos
{
  return self->_iconImageInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageInfos, 0);
}

@end
