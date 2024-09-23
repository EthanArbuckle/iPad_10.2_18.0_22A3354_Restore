@implementation AVURLAsset(Private)

+ (id)smm_alternativeConfigurationMediaIdentifierKey
{
  return (id)*MEMORY[0x24BDB2128];
}

+ (id)smm_alternativeConfigurationServiceIdentifierKey
{
  return (id)*MEMORY[0x24BDB2138];
}

+ (id)smm_alternativeConfigurationiTunesServiceMonitoringKey
{
  return (id)*MEMORY[0x24BDB2140];
}

+ (id)smm_alternativeConfigurationOptionsKey
{
  return (id)*MEMORY[0x24BDB2130];
}

+ (id)smm_iTunesStoreContentInfoKey
{
  return (id)*MEMORY[0x24BDB2228];
}

+ (id)smm_iTunesStoreContentHLSAssetURLStringKey
{
  return (id)*MEMORY[0x24BDB2218];
}

@end
