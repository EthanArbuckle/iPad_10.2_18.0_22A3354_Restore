@implementation NSDate(IMJSONSerializableValueProviding)

- (uint64_t)im_jsonSerializableValue
{
  void *v1;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  return objc_msgSend(v1, "numberWithDouble:");
}

@end
