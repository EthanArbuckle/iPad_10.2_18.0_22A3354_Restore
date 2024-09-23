@implementation NSString(SRDeletionRecordPrivate)

- (uint64_t)sr_sensorByDeletingDeletionRecord
{
  if (objc_msgSend(a1, "hasSuffix:", CFSTR(".tombstones")))
    return objc_msgSend(a1, "stringByDeletingPathExtension");
  else
    return (uint64_t)a1;
}

@end
