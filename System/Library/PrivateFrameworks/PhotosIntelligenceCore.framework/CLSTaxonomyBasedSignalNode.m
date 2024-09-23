@implementation CLSTaxonomyBasedSignalNode

- (CLSTaxonomyBasedSignalNode)initWithTaxonomyNode:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CLSTaxonomyBasedSignalNode *v12;
  double v13;
  double v14;
  double v15;
  objc_super v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "extendedSceneClassId");
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "f1Threshold");
  v8 = v7;
  objc_msgSend(v4, "f0point5Threshold");
  v10 = v9;
  objc_msgSend(v4, "f2Threshold");
  v17.receiver = self;
  v17.super_class = (Class)CLSTaxonomyBasedSignalNode;
  v12 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:](&v17, sel_initWithIdentifier_name_operatingPoint_highPrecisionOperatingPoint_highRecallOperatingPoint_, v5, v6, v8, v10, v11);

  if (v12)
  {
    objc_msgSend(v4, "searchThreshold");
    v12->_searchThreshold = v13;
    objc_msgSend(v4, "graphHighPrecisionThreshold");
    v12->_graphHighPrecisionThreshold = v14;
    objc_msgSend(v4, "graphHighRecallThreshold");
    v12->_graphHighRecallThreshold = v15;
  }

  return v12;
}

- (double)searchThreshold
{
  return self->_searchThreshold;
}

- (void)setSearchThreshold:(double)a3
{
  self->_searchThreshold = a3;
}

- (double)graphHighPrecisionThreshold
{
  return self->_graphHighPrecisionThreshold;
}

- (void)setGraphHighPrecisionThreshold:(double)a3
{
  self->_graphHighPrecisionThreshold = a3;
}

- (double)graphHighRecallThreshold
{
  return self->_graphHighRecallThreshold;
}

- (void)setGraphHighRecallThreshold:(double)a3
{
  self->_graphHighRecallThreshold = a3;
}

@end
