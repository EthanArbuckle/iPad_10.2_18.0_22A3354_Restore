@implementation PRSRankingItemCollection

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)PRSRankingItemCollection;
  -[PRSRankingItemCollection description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSRankingItemCollection bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PRSRankingItemCollection countOfVisibleResults](self, "countOfVisibleResults");
  -[PRSRankingItemCollection arrayOfRankingItems](self, "arrayOfRankingItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ visible:%llu items:%llu"), v4, v5, v6, objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)arrayOfRankingItems
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setArrayOfRankingItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)countOfVisibleResults
{
  return self->_countOfVisibleResults;
}

- (void)setCountOfVisibleResults:(unint64_t)a3
{
  self->_countOfVisibleResults = a3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)mapResultIdToProtectionClass
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMapResultIdToProtectionClass:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapResultIdToProtectionClass, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_arrayOfRankingItems, 0);
}

@end
