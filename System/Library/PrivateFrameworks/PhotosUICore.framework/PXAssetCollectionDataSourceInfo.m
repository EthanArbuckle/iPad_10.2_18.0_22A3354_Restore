@implementation PXAssetCollectionDataSourceInfo

- (void)_setUUIDFilterHidesSomeAssets:(BOOL)a3
{
  self->_UUIDFilterHidesSomeAssets = a3;
}

- (BOOL)explicitlyDisableFilters
{
  return self->_explicitlyDisableFilters;
}

- (BOOL)UUIDFilterHidesSomeAssets
{
  return self->_UUIDFilterHidesSomeAssets;
}

- (void)_setExplicitlyDisableFilters:(BOOL)a3
{
  self->_explicitlyDisableFilters = a3;
}

- (NSSet)allowedUUIDs
{
  return self->_allowedUUIDs;
}

- (void)setAllowedUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_allowedUUIDs, a3);
}

- (NSArray)manualOrderUUIDs
{
  return self->_manualOrderUUIDs;
}

- (void)setManualOrderUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_manualOrderUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manualOrderUUIDs, 0);
  objc_storeStrong((id *)&self->_allowedUUIDs, 0);
}

@end
