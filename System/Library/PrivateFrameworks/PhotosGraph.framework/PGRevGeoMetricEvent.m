@implementation PGRevGeoMetricEvent

- (PGRevGeoMetricEvent)initWithNumberOfAssetClustersPerMomentMean:(double)a3 numberOfAssetClustersPerMomentStdDev:(double)a4 numberOfAssetsPerClusterMean:(double)a5 numberOfAssetsPerClusterStdDev:(double)a6 ratioAssetClustersWithin10mOfCenter:(double)a7 ratioAssetClustersWithin20mOfCenter:(double)a8 ratioAssetClustersWithin50mOfCenter:(double)a9 ratioAssetClustersWithin100mOfCenter:(double)a10 ratioAssetClusters100mPlusFromCenter:(double)a11
{
  PGRevGeoMetricEvent *result;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PGRevGeoMetricEvent;
  result = -[PGRevGeoMetricEvent init](&v20, sel_init);
  if (result)
  {
    result->_numberOfAssetClustersPerMomentMean = a3;
    result->_numberOfAssetClustersPerMomentStdDev = a4;
    result->_numberOfAssetsPerClusterMean = a5;
    result->_numberOfAssetsPerClusterStdDev = a6;
    result->_ratioAssetClustersWithin10mOfCenter = a7;
    result->_ratioAssetClustersWithin20mOfCenter = a8;
    result->_ratioAssetClustersWithin50mOfCenter = a9;
    result->_ratioAssetClustersWithin100mOfCenter = a10;
    result->_ratioAssetClusters100mPlusFromCenter = a11;
  }
  return result;
}

- (id)identifier
{
  return CFSTR("com.apple.Photos.Intelligence.RevGeo");
}

- (BOOL)shouldReportMetrics
{
  return 1;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[9];
  _QWORD v15[11];

  v15[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_numberOfAssetClustersPerMomentMean, CFSTR("numberOfAssetClustersPerMomentMean"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("numberOfAssetClustersPerMomentStdDev");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_numberOfAssetClustersPerMomentStdDev);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  v14[2] = CFSTR("numberOfAssetsPerClusterMean");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_numberOfAssetsPerClusterMean);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v5;
  v14[3] = CFSTR("numberOfAssetsPerClusterStdDev");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_numberOfAssetsPerClusterStdDev);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v6;
  v14[4] = CFSTR("ratioAssetClustersWithin10mOfCenter");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ratioAssetClustersWithin10mOfCenter);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v7;
  v14[5] = CFSTR("ratioAssetClustersWithin20mOfCenter");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ratioAssetClustersWithin20mOfCenter);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v8;
  v14[6] = CFSTR("ratioAssetClustersWithin50mOfCenter");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ratioAssetClustersWithin50mOfCenter);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v9;
  v14[7] = CFSTR("ratioAssetClustersWithin100mOfCenter");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ratioAssetClustersWithin100mOfCenter);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v10;
  v14[8] = CFSTR("ratioAssetClusters100mPlusFromCenter");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ratioAssetClusters100mPlusFromCenter);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)numberOfAssetClustersPerMomentMean
{
  return self->_numberOfAssetClustersPerMomentMean;
}

- (double)numberOfAssetClustersPerMomentStdDev
{
  return self->_numberOfAssetClustersPerMomentStdDev;
}

- (double)numberOfAssetsPerClusterMean
{
  return self->_numberOfAssetsPerClusterMean;
}

- (double)numberOfAssetsPerClusterStdDev
{
  return self->_numberOfAssetsPerClusterStdDev;
}

- (double)ratioAssetClustersWithin10mOfCenter
{
  return self->_ratioAssetClustersWithin10mOfCenter;
}

- (double)ratioAssetClustersWithin20mOfCenter
{
  return self->_ratioAssetClustersWithin20mOfCenter;
}

- (double)ratioAssetClustersWithin50mOfCenter
{
  return self->_ratioAssetClustersWithin50mOfCenter;
}

- (double)ratioAssetClustersWithin100mOfCenter
{
  return self->_ratioAssetClustersWithin100mOfCenter;
}

- (double)ratioAssetClusters100mPlusFromCenter
{
  return self->_ratioAssetClusters100mPlusFromCenter;
}

@end
