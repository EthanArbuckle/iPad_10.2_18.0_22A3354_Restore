@implementation CLPCReportingInterface

+ (id)createClient:(id *)a3
{
  return -[CLPCReportingClient init:]([CLPCReportingClient alloc], "init:", a3);
}

@end
