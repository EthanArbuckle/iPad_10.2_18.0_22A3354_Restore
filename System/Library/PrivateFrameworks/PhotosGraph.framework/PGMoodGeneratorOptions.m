@implementation PGMoodGeneratorOptions

- (unint64_t)memoryCategory
{
  return self->_memoryCategory;
}

- (void)setMemoryCategory:(unint64_t)a3
{
  self->_memoryCategory = a3;
}

- (unint64_t)memorySubcategory
{
  return self->_memorySubcategory;
}

- (void)setMemorySubcategory:(unint64_t)a3
{
  self->_memorySubcategory = a3;
}

- (NSArray)moodHistory
{
  return self->_moodHistory;
}

- (void)setMoodHistory:(id)a3
{
  objc_storeStrong((id *)&self->_moodHistory, a3);
}

- (NSSet)momentIDs
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMomentIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDate)referenceDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setReferenceDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)prefetchedAssets
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPrefetchedAssets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDictionary)sceneIdentifiersByMomentNodeIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSceneIdentifiersByMomentNodeIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PGMoodGenerationContext)moodGenerationContext
{
  return self->_moodGenerationContext;
}

- (void)setMoodGenerationContext:(id)a3
{
  objc_storeStrong((id *)&self->_moodGenerationContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moodGenerationContext, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiersByMomentNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_prefetchedAssets, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_momentIDs, 0);
  objc_storeStrong((id *)&self->_moodHistory, 0);
}

@end
