@implementation PGPublicEventSummarizedFeature

- (PGPublicEventSummarizedFeature)initWithIntervalsPresent:(id)a3 isMandatoryForKeyAsset:(BOOL)a4 publicEventLabel:(id)a5
{
  id v8;
  id v9;
  PGPublicEventSummarizedFeature *v10;
  PGPublicEventSummarizedFeature *v11;
  uint64_t v12;
  NSSet *intervalsPresent;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGPublicEventSummarizedFeature;
  v10 = -[PGPublicEventSummarizedFeature init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = 4;
    PGSummarizedFeatureConsolidatedDateIntervals(v8);
    v12 = objc_claimAutoreleasedReturnValue();
    intervalsPresent = v11->_intervalsPresent;
    v11->_intervalsPresent = (NSSet *)v12;

    v11->_isMandatoryForKeyAsset = a4;
    objc_storeStrong((id *)&v11->_publicEventLabel, a5);
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

- (NSString)publicEventLabel
{
  return self->_publicEventLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicEventLabel, 0);
  objc_storeStrong((id *)&self->_intervalsPresent, 0);
}

@end
