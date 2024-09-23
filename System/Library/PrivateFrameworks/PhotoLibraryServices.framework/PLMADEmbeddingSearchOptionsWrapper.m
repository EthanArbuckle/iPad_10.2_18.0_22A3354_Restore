@implementation PLMADEmbeddingSearchOptionsWrapper

- (PLMADEmbeddingSearchOptionsWrapper)initWithResultLimit:(unint64_t)a3
{
  PLMADEmbeddingSearchOptionsWrapper *v4;
  PLMADEmbeddingSearchOptionsWrapper *v5;
  NSNumber *numberOfProbes;
  NSNumber *batchSize;
  NSNumber *numConcurrentReaders;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLMADEmbeddingSearchOptionsWrapper;
  v4 = -[PLMADEmbeddingSearchOptionsWrapper init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_includePayload = 0;
    numberOfProbes = v4->_numberOfProbes;
    v4->_resultLimit = a3;
    v4->_numberOfProbes = 0;

    batchSize = v5->_batchSize;
    v5->_batchSize = 0;

    numConcurrentReaders = v5->_numConcurrentReaders;
    v5->_numConcurrentReaders = (NSNumber *)&unk_1E3760FC8;

  }
  return v5;
}

- (unint64_t)resultLimit
{
  return self->_resultLimit;
}

- (void)setResultLimit:(unint64_t)a3
{
  self->_resultLimit = a3;
}

- (BOOL)includePayload
{
  return self->_includePayload;
}

- (void)setIncludePayload:(BOOL)a3
{
  self->_includePayload = a3;
}

- (NSNumber)numberOfProbes
{
  return self->_numberOfProbes;
}

- (void)setNumberOfProbes:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfProbes, a3);
}

- (NSNumber)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(id)a3
{
  objc_storeStrong((id *)&self->_batchSize, a3);
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
  objc_storeStrong((id *)&self->_batchSize, 0);
  objc_storeStrong((id *)&self->_numberOfProbes, 0);
}

+ (id)defaultOptions
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithResultLimit:", 10);
}

@end
