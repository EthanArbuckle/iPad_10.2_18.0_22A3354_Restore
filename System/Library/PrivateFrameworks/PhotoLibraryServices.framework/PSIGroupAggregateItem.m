@implementation PSIGroupAggregateItem

- (void)reset
{
  PSIQueryToken *searchToken;
  NSValue *rangeMatchingToken;
  PSIGroup *group;
  NSArray *assetIds;
  NSArray *collectionIds;

  searchToken = self->_searchToken;
  self->_searchToken = 0;

  rangeMatchingToken = self->_rangeMatchingToken;
  self->_rangeMatchingToken = 0;

  group = self->_group;
  self->_group = 0;

  assetIds = self->_assetIds;
  self->_assetIds = 0;

  collectionIds = self->_collectionIds;
  self->_collectionIds = 0;

}

- (PSIQueryToken)searchToken
{
  return self->_searchToken;
}

- (void)setSearchToken:(id)a3
{
  objc_storeStrong((id *)&self->_searchToken, a3);
}

- (NSValue)rangeMatchingToken
{
  return self->_rangeMatchingToken;
}

- (void)setRangeMatchingToken:(id)a3
{
  objc_storeStrong((id *)&self->_rangeMatchingToken, a3);
}

- (PSIGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (NSArray)assetIds
{
  return self->_assetIds;
}

- (void)setAssetIds:(id)a3
{
  objc_storeStrong((id *)&self->_assetIds, a3);
}

- (NSArray)collectionIds
{
  return self->_collectionIds;
}

- (void)setCollectionIds:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_storeStrong((id *)&self->_assetIds, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_rangeMatchingToken, 0);
  objc_storeStrong((id *)&self->_searchToken, 0);
}

@end
