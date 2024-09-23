@implementation NFRemoteAdminManagerCallbacks

+ (id)interface
{
  if (qword_10005C380 != -1)
    dispatch_once(&qword_10005C380, &stru_100054820);
  return (id)qword_10005C378;
}

@end
