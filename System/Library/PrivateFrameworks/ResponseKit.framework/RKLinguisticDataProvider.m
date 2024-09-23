@implementation RKLinguisticDataProvider

- (RKLinguisticDataProvider)init
{
  RKLinguisticDataProvider *v2;
  uint64_t v3;
  NSMutableDictionary *polarityMapsByLanguageID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RKLinguisticDataProvider;
  v2 = -[RKLinguisticDataProvider init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    polarityMapsByLanguageID = v2->_polarityMapsByLanguageID;
    v2->_polarityMapsByLanguageID = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (NSMutableDictionary)polarityMapsByLanguageID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPolarityMapsByLanguageID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polarityMapsByLanguageID, 0);
}

@end
