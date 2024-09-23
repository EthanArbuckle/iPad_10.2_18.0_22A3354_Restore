@implementation NFRemoteAdminManagerInterface

+ (id)interface
{
  if (qword_10005C370 != -1)
    dispatch_once(&qword_10005C370, &stru_100054800);
  return (id)qword_10005C368;
}

@end
