@implementation NSString(SRDeletionRecord)

- (uint64_t)sr_sensorForDeletionRecordsFromSensor
{
  if ((objc_msgSend(a1, "hasSuffix:", CFSTR(".tombstones")) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a1, "stringByAppendingString:", CFSTR(".tombstones"));
}

@end
