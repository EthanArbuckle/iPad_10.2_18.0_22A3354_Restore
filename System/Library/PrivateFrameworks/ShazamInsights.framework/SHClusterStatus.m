@implementation SHClusterStatus

- (NSString)uniqueHash
{
  void *v2;
  void *v3;

  -[SHClusterStatus metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)storefront
{
  void *v2;
  void *v3;

  -[SHClusterStatus metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storefront");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)creationDate
{
  void *v2;
  void *v3;

  -[SHClusterStatus metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (int64_t)clusterType
{
  void *v2;
  int64_t v3;

  -[SHClusterStatus metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "clusterType");

  return v3;
}

- (int64_t)loadStatus
{
  return self->_loadStatus;
}

- (void)setLoadStatus:(int64_t)a3
{
  self->_loadStatus = a3;
}

- (BOOL)isDataValid
{
  return self->_isDataValid;
}

- (void)setIsDataValid:(BOOL)a3
{
  self->_isDataValid = a3;
}

- (NSURL)dataURL
{
  return self->_dataURL;
}

- (void)setDataURL:(id)a3
{
  objc_storeStrong((id *)&self->_dataURL, a3);
}

- (SHClusterMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_dataURL, 0);
}

@end
