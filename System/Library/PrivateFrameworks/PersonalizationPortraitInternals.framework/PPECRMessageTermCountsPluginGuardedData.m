@implementation PPECRMessageTermCountsPluginGuardedData

- (PPECRMessageTermCountsPluginGuardedData)init
{
  PPECRMessageTermCountsPluginGuardedData *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPECRMessageTermCountsPluginGuardedData;
  result = -[PPECRMessageTermCountsPluginGuardedData init](&v3, sel_init);
  if (result)
    result->_eventCount = 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamContentBloomFilter, 0);
}

@end
