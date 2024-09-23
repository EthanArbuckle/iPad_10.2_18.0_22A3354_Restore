@implementation VSDownloadOptions

- (BOOL)allowCellularData
{
  return self->_allowCellularData;
}

- (void)setAllowCellularData:(BOOL)a3
{
  self->_allowCellularData = a3;
}

- (BOOL)allowDiscretionary
{
  return self->_allowDiscretionary;
}

- (void)setAllowDiscretionary:(BOOL)a3
{
  self->_allowDiscretionary = a3;
}

@end
