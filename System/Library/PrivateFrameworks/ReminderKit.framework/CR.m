@implementation CR

uint64_t __CR_REMObjectID_registerClass_block_invoke()
{
  return +[CRCoder registerClass:forType:](CRCoder, "registerClass:forType:", objc_opt_class(), CFSTR("com.apple.CRDT.REMObjectID"));
}

uint64_t __CR_NSString_registerClass_block_invoke()
{
  return +[CRCoder registerClass:forType:](CRCoder, "registerClass:forType:", objc_opt_class(), CFSTR("com.apple.CRDT.NSString"));
}

@end
