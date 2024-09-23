@implementation SESSessionManagerCallbackInterface

+ (id)interface
{
  if (qword_10034BB10 != -1)
    dispatch_once(&qword_10034BB10, &stru_100304100);
  return (id)qword_10034BB08;
}

@end
