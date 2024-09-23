@implementation SATextDecorationRegion(SiriUI)

- (uint64_t)siriui_range
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "start");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");
  objc_msgSend(a1, "length");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unsignedIntegerValue");

  return v3;
}

@end
