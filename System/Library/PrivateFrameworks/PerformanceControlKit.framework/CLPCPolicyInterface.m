@implementation CLPCPolicyInterface

+ (id)createClient:(id *)a3
{
  return -[CLPCUserClient init:]([CLPCPolicyClient alloc], "init:", a3);
}

@end
