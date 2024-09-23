@implementation CBLocalServiceInterface

+ (id)clientInterface
{
  if (qword_100012E70 != -1)
    dispatch_once(&qword_100012E70, &stru_10000C570);
  return (id)qword_100012E78;
}

+ (id)serverInterface
{
  if (qword_100012E80 != -1)
    dispatch_once(&qword_100012E80, &stru_10000C590);
  return (id)qword_100012E88;
}

@end
