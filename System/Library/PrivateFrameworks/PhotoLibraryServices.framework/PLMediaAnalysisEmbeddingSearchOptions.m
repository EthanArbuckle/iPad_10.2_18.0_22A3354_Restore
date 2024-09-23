@implementation PLMediaAnalysisEmbeddingSearchOptions

- (PLMediaAnalysisEmbeddingSearchOptions)initWithResultLimit:(int)a3
{
  PLMediaAnalysisEmbeddingSearchOptions *v4;
  PLMediaAnalysisEmbeddingSearchOptions *v5;
  NSArray *assetUUIDsForPrefilter;
  NSNumber *numConcurrentReaders;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLMediaAnalysisEmbeddingSearchOptions;
  v4 = -[PLMediaAnalysisEmbeddingSearchOptions init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_resultLimit = a3;
    assetUUIDsForPrefilter = v4->_assetUUIDsForPrefilter;
    v4->_assetUUIDsForPrefilter = 0;

    v5->_fullScan = 0;
    numConcurrentReaders = v5->_numConcurrentReaders;
    v5->_numConcurrentReaders = (NSNumber *)&unk_1E3760FC8;

  }
  return v5;
}

- (int)resultLimit
{
  return self->_resultLimit;
}

- (NSArray)assetUUIDsForPrefilter
{
  return self->_assetUUIDsForPrefilter;
}

- (void)setAssetUUIDsForPrefilter:(id)a3
{
  objc_storeStrong((id *)&self->_assetUUIDsForPrefilter, a3);
}

- (BOOL)fullScan
{
  return self->_fullScan;
}

- (void)setFullScan:(BOOL)a3
{
  self->_fullScan = a3;
}

- (NSNumber)numConcurrentReaders
{
  return self->_numConcurrentReaders;
}

- (void)setNumConcurrentReaders:(id)a3
{
  objc_storeStrong((id *)&self->_numConcurrentReaders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numConcurrentReaders, 0);
  objc_storeStrong((id *)&self->_assetUUIDsForPrefilter, 0);
}

@end
