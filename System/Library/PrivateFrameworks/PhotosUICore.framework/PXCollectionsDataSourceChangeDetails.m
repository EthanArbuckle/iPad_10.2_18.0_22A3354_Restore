@implementation PXCollectionsDataSourceChangeDetails

- (BOOL)isCountUpdateChange
{
  return self->_countUpdateChange;
}

- (void)setCountUpdateChange:(BOOL)a3
{
  self->_countUpdateChange = a3;
}

@end
