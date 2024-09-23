@implementation NSBundle

+ (id)fr_feldsparInternalExtrasBundle
{
  if (qword_10010A718 != -1)
    dispatch_once(&qword_10010A718, &stru_1000DD890);
  return (id)qword_10010A720;
}

@end
