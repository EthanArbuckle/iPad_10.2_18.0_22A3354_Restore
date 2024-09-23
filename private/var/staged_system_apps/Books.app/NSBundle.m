@implementation NSBundle

+ (id)internalExtrasBundle
{
  if (qword_1009CE580 != -1)
    swift_once(&qword_1009CE580, sub_100011784);
  return (id)qword_100A1E948;
}

@end
