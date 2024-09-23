@implementation NSCoder(VisionCoreAdditions)

- (void)VisionCoreEncodeNSData:()VisionCoreAdditions forKey:
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "encodeObject:forKey:", v7, v6);

}

@end
