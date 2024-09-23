@implementation PGDiscoveryFeedGenerationOptions

- (PGDiscoveryFeedGenerationOptions)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  PGDiscoveryFeedGenerationOptions *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGDiscoveryFeedGenerationOptions;
  v5 = -[PGDiscoveryFeedGenerationOptions init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72068]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "unsignedIntValue");
    else
      v8 = 0;
    v5->_discoveryRankingMode = v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_discoveryRankingMode;
  return result;
}

- (unint64_t)discoveryRankingMode
{
  return self->_discoveryRankingMode;
}

- (void)setDiscoveryRankingMode:(unint64_t)a3
{
  self->_discoveryRankingMode = a3;
}

@end
