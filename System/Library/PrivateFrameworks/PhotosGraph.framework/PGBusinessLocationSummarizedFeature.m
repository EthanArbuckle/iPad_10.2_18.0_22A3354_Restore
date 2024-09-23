@implementation PGBusinessLocationSummarizedFeature

- (PGBusinessLocationSummarizedFeature)initWithIntervalsPresent:(id)a3 isMandatoryForKeyAsset:(BOOL)a4 businessNode:(id)a5
{
  id v8;
  id v9;
  PGBusinessLocationSummarizedFeature *v10;
  PGBusinessLocationSummarizedFeature *v11;
  uint64_t v12;
  NSSet *intervalsPresent;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGBusinessLocationSummarizedFeature;
  v10 = -[PGBusinessLocationSummarizedFeature init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = 2;
    PGSummarizedFeatureConsolidatedDateIntervals(v8);
    v12 = objc_claimAutoreleasedReturnValue();
    intervalsPresent = v11->_intervalsPresent;
    v11->_intervalsPresent = (NSSet *)v12;

    v11->_isMandatoryForKeyAsset = a4;
    objc_storeStrong((id *)&v11->_businessNode, a5);
  }

  return v11;
}

- (unsigned)type
{
  return self->_type;
}

- (NSSet)intervalsPresent
{
  return self->_intervalsPresent;
}

- (BOOL)isMandatoryForKeyAsset
{
  return self->_isMandatoryForKeyAsset;
}

- (PGGraphBusinessNode)businessNode
{
  return self->_businessNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessNode, 0);
  objc_storeStrong((id *)&self->_intervalsPresent, 0);
}

@end
