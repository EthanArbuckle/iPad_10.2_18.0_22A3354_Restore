@implementation CRCJKLowConfidenceTextFeatureFilterV2

- (CRCJKLowConfidenceTextFeatureFilterV2)initWithLowConfidenceThresholdFor1CharLines:(double)a3 for2PlusCharLines:(double)a4 forIsolated1CharLines:(double)a5
{
  CRCJKLowConfidenceTextFeatureFilterV2 *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRCJKLowConfidenceTextFeatureFilterV2;
  result = -[CRCJKLowConfidenceTextFeatureFilterV2 init](&v9, sel_init);
  if (result)
  {
    result->_lowConfidenceThreshold1CharLines = a3;
    result->_lowConfidenceThreshold2PlusCharLines = a4;
    result->_lowConfidenceThresholdIsolated1CharLines = a5;
  }
  return result;
}

- (BOOL)shouldFilterRegion:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v11;

  v4 = a3;
  objc_msgSend(v4, "activationProbability");
  v6 = v5;
  objc_msgSend(v4, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length") == 1)
  {
    -[CRCJKLowConfidenceTextFeatureFilterV2 lowConfidenceThreshold1CharLines](self, "lowConfidenceThreshold1CharLines");
    v9 = v8;

    if (v6 < v9)
      return 1;
  }
  else
  {

  }
  -[CRCJKLowConfidenceTextFeatureFilterV2 lowConfidenceThreshold2PlusCharLines](self, "lowConfidenceThreshold2PlusCharLines");
  return v6 < v11;
}

- (BOOL)shouldFilterRegionBasedOnGeometry:(id)a3 closestDistance:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  BOOL v14;

  v6 = a3;
  if (objc_msgSend(v6, "isIsolatedClosestRegionDistance:", a4))
  {
    objc_msgSend(v6, "firstTextRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "firstTextRegion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = 1.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "firstTextRegion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "activationProbability");
      v10 = v12;

    }
    v14 = 0;
    if (objc_msgSend(v8, "length") == 1)
    {
      -[CRCJKLowConfidenceTextFeatureFilterV2 lowConfidenceThresholdIsolated1CharLines](self, "lowConfidenceThresholdIsolated1CharLines");
      if (v10 < v13)
        v14 = 1;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (double)lowConfidenceThreshold1CharLines
{
  return self->_lowConfidenceThreshold1CharLines;
}

- (double)lowConfidenceThreshold2PlusCharLines
{
  return self->_lowConfidenceThreshold2PlusCharLines;
}

- (double)lowConfidenceThresholdIsolated1CharLines
{
  return self->_lowConfidenceThresholdIsolated1CharLines;
}

@end
