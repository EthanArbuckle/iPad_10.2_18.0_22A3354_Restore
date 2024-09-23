@implementation GEOWiFiQualityIndex(Serialization)

- (uint64_t)typeDescription
{
  return objc_msgSend(a1, "typeAsString:", objc_msgSend(a1, "type"));
}

- (uint64_t)score
{
  return objc_msgSend(a1, "value");
}

@end
