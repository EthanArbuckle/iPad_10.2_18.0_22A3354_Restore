@implementation SPRServiceXPC

+ (NSString)machServiceName
{
  return (NSString *)CFSTR("com.apple.softposreaderd");
}

+ (NSXPCInterface)interface
{
  if (qword_254DEDF50 != -1)
    dispatch_once(&qword_254DEDF50, &unk_24D3CCAD8);
  return (NSXPCInterface *)(id)qword_254DEDF58;
}

@end
