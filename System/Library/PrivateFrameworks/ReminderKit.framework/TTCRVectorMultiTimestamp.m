@implementation TTCRVectorMultiTimestamp

- (TTCRVectorMultiTimestamp)initWithCapacity:(unint64_t)a3
{
  void *i;
  TTCRVectorTimestamp *v6;
  TTCRVectorMultiTimestamp *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
  {
    v6 = objc_alloc_init(TTCRVectorTimestamp);
    objc_msgSend(i, "addObject:", v6);

  }
  v9.receiver = self;
  v9.super_class = (Class)TTCRVectorMultiTimestamp;
  v7 = -[TTVectorMultiTimestamp initWithTimestamps:](&v9, sel_initWithTimestamps_, i);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TTCRVectorMultiTimestamp *v4;

  v4 = objc_alloc_init(TTCRVectorMultiTimestamp);
  -[TTVectorMultiTimestamp mergeWithTimestamp:](v4, "mergeWithTimestamp:", self);
  return v4;
}

- (BOOL)isDocumentShared
{
  return 1;
}

@end
