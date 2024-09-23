@implementation CRKUser

+ (id)stu_sharedMeCardUserProvider
{
  if (qword_1000FC030 != -1)
    dispatch_once(&qword_1000FC030, &stru_1000C99D8);
  return (id)qword_1000FC038;
}

@end
