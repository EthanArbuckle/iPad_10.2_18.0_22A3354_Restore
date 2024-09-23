@implementation OpenOfflineMapsManagementAction

- (GEOMapRegion)downloadRegion
{
  return self->_downloadRegion;
}

- (void)setDownloadRegion:(id)a3
{
  objc_storeStrong((id *)&self->_downloadRegion, a3);
}

- (NSString)downloadRegionName
{
  return self->_downloadRegionName;
}

- (void)setDownloadRegionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)path
{
  return self->_path;
}

- (void)setPath:(int64_t)a3
{
  self->_path = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadRegionName, 0);
  objc_storeStrong((id *)&self->_downloadRegion, 0);
}

@end
