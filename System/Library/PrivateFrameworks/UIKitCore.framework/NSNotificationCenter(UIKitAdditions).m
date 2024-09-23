@implementation NSNotificationCenter(UIKitAdditions)

+ (id)uikitCenter
{
  if (qword_1ECD7F818 != -1)
    dispatch_once(&qword_1ECD7F818, &__block_literal_global_1_16);
  return (id)qword_1ECD7F810;
}

@end
