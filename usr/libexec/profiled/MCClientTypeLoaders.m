@implementation MCClientTypeLoaders

+ (id)clientTypeLoaders
{
  if (qword_1000FD968 != -1)
    dispatch_once(&qword_1000FD968, &stru_1000E3FF8);
  return objc_msgSend((id)qword_1000FD960, "copy");
}

@end
