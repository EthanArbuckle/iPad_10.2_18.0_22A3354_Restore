@implementation SXResourceDataSourceContainer

- (void)registerResourceDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_resourceDataSource, a3);
}

- (SXResourceDataSource)resourceDataSource
{
  return self->_resourceDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceDataSource, 0);
}

@end
