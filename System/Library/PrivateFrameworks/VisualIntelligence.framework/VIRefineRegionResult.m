@implementation VIRefineRegionResult

- (VIRefineRegionResult)initWithRefinedRegions:(id)a3 version:(unint64_t)a4
{
  id v6;
  VIRefineRegionResult *v7;
  uint64_t v8;
  NSArray *refinedRegions;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VIRefineRegionResult;
  v7 = -[VIRefineRegionResult init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    refinedRegions = v7->_refinedRegions;
    v7->_refinedRegions = (NSArray *)v8;

    v7->_version = a4;
  }

  return v7;
}

- (NSArray)refinedRegions
{
  return self->_refinedRegions;
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinedRegions, 0);
}

@end
