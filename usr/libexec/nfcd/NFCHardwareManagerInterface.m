@implementation NFCHardwareManagerInterface

+ (id)interface
{
  if (qword_10032A8E0 != -1)
    dispatch_once(&qword_10032A8E0, &stru_1002E68A8);
  return (id)qword_10032A8D8;
}

@end
