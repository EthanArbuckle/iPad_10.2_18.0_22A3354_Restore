@implementation PUContainedDataSourceInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  NSRange v9;

  v8.receiver = self;
  v8.super_class = (Class)PUContainedDataSourceInfo;
  -[PUContainedDataSourceInfo description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9.location = -[PUContainedDataSourceInfo externalSections](self, "externalSections");
  NSStringFromRange(v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUContainedDataSourceInfo assetsDataSource](self, "assetsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" externalSections:%@ assetsDataSource:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PUAssetsDataSource)assetsDataSource
{
  return self->_assetsDataSource;
}

- (void)setAssetsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_assetsDataSource, a3);
}

- (_NSRange)externalSections
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_externalSections.length;
  location = self->_externalSections.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setExternalSections:(_NSRange)a3
{
  self->_externalSections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsDataSource, 0);
}

@end
