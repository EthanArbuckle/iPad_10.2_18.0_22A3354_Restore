@implementation WFDebugUtilities

+ (void)startLogStream
{
  sub_10002D14C();
}

+ (void)setupDebuggingForWindow:(id)a3
{
  id v3;

  v3 = a3;
  sub_10002CFC0(v3);

}

- (WFDebugUtilities)init
{
  return (WFDebugUtilities *)sub_10002D1B4();
}

@end
