@implementation NFCHardwareManagerCallbacks

+ (id)interface
{
  if (qword_10032A8F0 != -1)
    dispatch_once(&qword_10032A8F0, &stru_1002E68C8);
  return (id)qword_10032A8E8;
}

@end
