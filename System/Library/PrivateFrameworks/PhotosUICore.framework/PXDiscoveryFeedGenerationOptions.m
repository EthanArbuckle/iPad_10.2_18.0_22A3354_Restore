@implementation PXDiscoveryFeedGenerationOptions

- (PXDiscoveryFeedGenerationOptions)init
{
  PXDiscoveryFeedGenerationOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDiscoveryFeedGenerationOptions;
  result = -[PXDiscoveryFeedGenerationOptions init](&v3, sel_init);
  if (result)
  {
    result->_usePhotoAnalysisdThroughXPC = 1;
    result->_discoveryRankingMode = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_BYTE *)result + 8) = self->_usePhotoAnalysisdThroughXPC;
  *((_QWORD *)result + 2) = self->_discoveryRankingMode;
  return result;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D72068];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PXDiscoveryFeedGenerationOptions discoveryRankingMode](self, "discoveryRankingMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)usePhotoAnalysisdThroughXPC
{
  return self->_usePhotoAnalysisdThroughXPC;
}

- (void)setUsePhotoAnalysisdThroughXPC:(BOOL)a3
{
  self->_usePhotoAnalysisdThroughXPC = a3;
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
