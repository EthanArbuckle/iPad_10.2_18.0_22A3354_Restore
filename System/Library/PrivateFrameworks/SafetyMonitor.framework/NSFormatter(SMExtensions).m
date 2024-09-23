@implementation NSFormatter(SMExtensions)

+ (id)dateFormatter
{
  if (qword_254415CF8 != -1)
    dispatch_once(&qword_254415CF8, &__block_literal_global_1);
  return (id)_MergedGlobals_14;
}

+ (id)relativeDateFormatter
{
  if (qword_254415D08 != -1)
    dispatch_once(&qword_254415D08, &__block_literal_global_2);
  return (id)qword_254415D00;
}

+ (id)dateTimeFormatter
{
  if (qword_254415D18 != -1)
    dispatch_once(&qword_254415D18, &__block_literal_global_4);
  return (id)qword_254415D10;
}

+ (id)transcriptTimeIntervalFormatter
{
  if (qword_254415D28 != -1)
    dispatch_once(&qword_254415D28, &__block_literal_global_5);
  return (id)qword_254415D20;
}

+ (id)hourMinuteTimeIntervalFormatter
{
  if (qword_254415D38 != -1)
    dispatch_once(&qword_254415D38, &__block_literal_global_8);
  return (id)qword_254415D30;
}

+ (id)hourMinuteShortTimeIntervalFormatter
{
  if (qword_254415D48 != -1)
    dispatch_once(&qword_254415D48, &__block_literal_global_9);
  return (id)qword_254415D40;
}

@end
