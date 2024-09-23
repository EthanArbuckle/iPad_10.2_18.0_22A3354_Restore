@implementation NavPedestrianSignLayoutCompactWidth

+ (id)sharedPedestrianSignCompactWidthLayout
{
  if (qword_1014D41A8 != -1)
    dispatch_once(&qword_1014D41A8, &stru_1011E7110);
  return (id)qword_1014D41A0;
}

@end
