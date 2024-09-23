@implementation PUFilmstripDataSource

- (PUFilmstripDataSource)init
{
  return -[PUFilmstripDataSource initWithAsset:numberOfIndexes:indicatorInfos:](self, "initWithAsset:numberOfIndexes:indicatorInfos:", 0, 0, 0);
}

- (PUFilmstripDataSource)initWithAsset:(id)a3 numberOfIndexes:(int64_t)a4 indicatorInfos:(id)a5
{
  id v9;
  id v10;
  PUFilmstripDataSource *v11;
  PUFilmstripDataSource *v12;
  uint64_t v13;
  NSArray *indicatorInfos;
  NSMutableDictionary *v15;
  NSMutableDictionary *assetByIndexPath;
  uint64_t v17;
  NSMapTable *indexPathByAsset;
  objc_super v20;

  v9 = a3;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PUFilmstripDataSource;
  v11 = -[PUTilingDataSource init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_asset, a3);
    v13 = objc_msgSend(v10, "copy");
    indicatorInfos = v12->_indicatorInfos;
    v12->_indicatorInfos = (NSArray *)v13;

    v12->_numberOfIndexes = a4;
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assetByIndexPath = v12->_assetByIndexPath;
    v12->_assetByIndexPath = v15;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    indexPathByAsset = v12->_indexPathByAsset;
    v12->_indexPathByAsset = (NSMapTable *)v17;

  }
  return v12;
}

- (int64_t)numberOfSubItemsAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  int64_t numberOfIndexes;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFilmstripView.m"), 535, CFSTR("invalid indexPath %@"), v5);

    numberOfIndexes = 0;
  }
  else
  {
    numberOfIndexes = self->_numberOfIndexes;
  }

  return numberOfIndexes;
}

- (double)_normalizedTimeForIndex:(int64_t)a3
{
  int64_t numberOfIndexes;
  double result;
  void *v8;

  numberOfIndexes = self->_numberOfIndexes;
  if (numberOfIndexes <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFilmstripView.m"), 543, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index < maxIndex"));

  }
  result = fmax((double)a3 / (double)numberOfIndexes, 0.0);
  if (result > 1.0)
    return 1.0;
  return result;
}

- (id)assetAtIndexPath:(id)a3
{
  id v5;
  PUFilmstripAsset *v6;
  double v7;
  double v8;
  PUFilmstripAsset *v9;
  void *v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFilmstripView.m"), 551, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assetByIndexPath, "objectForKeyedSubscript:", v5);
  v6 = (PUFilmstripAsset *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[PUFilmstripDataSource _normalizedTimeForIndex:](self, "_normalizedTimeForIndex:", objc_msgSend(v5, "indexAtPosition:", 0));
    v8 = v7;
    v9 = [PUFilmstripAsset alloc];
    -[PUFilmstripDataSource asset](self, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PUFilmstripAsset initWithNormalizedTime:asset:](v9, "initWithNormalizedTime:asset:", v10, v8);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assetByIndexPath, "setObject:forKeyedSubscript:", v6, v5);
    -[NSMapTable setObject:forKey:](self->_indexPathByAsset, "setObject:forKey:", v5, v6);
  }

  return v6;
}

- (id)indexPathForAsset:(id)a3
{
  return -[NSMapTable objectForKey:](self->_indexPathByAsset, "objectForKey:", a3);
}

- ($0FD61D44AD30C1CDCD15B60AC4039C90)timeRangeRepresentedByAssetAtIndex:(SEL)a3
{
  double v6;
  Float64 v7;
  void *v8;
  void *v9;
  int32_t v10;
  CMTime v12;
  CMTime start;
  CMTime time;
  CMTime v15;
  CMTime v16;

  -[PUFilmstripDataSource _normalizedTimeForIndex:](self, "_normalizedTimeForIndex:", a4);
  v7 = v6;
  memset(&v16, 0, sizeof(v16));
  -[PUFilmstripDataSource asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "duration");
  else
    memset(&v16, 0, sizeof(v16));

  memset(&v15, 0, sizeof(v15));
  time = v16;
  CMTimeMultiplyByFloat64(&v15, &time, v7);
  memset(&time, 0, sizeof(time));
  v10 = -[PUFilmstripDataSource numberOfIndexes](self, "numberOfIndexes");
  start = v16;
  CMTimeMultiplyByRatio(&time, &start, 1, v10);
  start = v15;
  v12 = time;
  return ($0FD61D44AD30C1CDCD15B60AC4039C90 *)CMTimeRangeMake((CMTimeRange *)retstr, &start, &v12);
}

- (AVAsset)asset
{
  return self->_asset;
}

- (int64_t)numberOfIndexes
{
  return self->_numberOfIndexes;
}

- (NSArray)indicatorInfos
{
  return self->_indicatorInfos;
}

- (void)setIndicatorInfos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorInfos, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_indexPathByAsset, 0);
  objc_storeStrong((id *)&self->_assetByIndexPath, 0);
}

@end
