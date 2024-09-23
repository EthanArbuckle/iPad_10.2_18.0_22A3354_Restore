@implementation PGGraphRemoteAddressEdge

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("REMOTE_ADDRESS"), 200);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("REMOTE_ADDRESS");
  return CFSTR("REMOTE_ADDRESS");
}

@end
