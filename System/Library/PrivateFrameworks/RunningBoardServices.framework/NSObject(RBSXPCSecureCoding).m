@implementation NSObject(RBSXPCSecureCoding)

- (uint64_t)supportsRBSXPCSecureCoding
{
  return objc_msgSend((id)objc_opt_class(), "supportsRBSXPCSecureCoding");
}

+ (uint64_t)supportsRBSXPCSecureCoding
{
  return 0;
}

@end
