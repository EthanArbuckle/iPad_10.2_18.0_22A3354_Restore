@implementation VenueDropDownOutlineCellRegistration

+ (id)sharedRegistration
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002260A0;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D1DA8 != -1)
    dispatch_once(&qword_1014D1DA8, block);
  return (id)qword_1014D1DA0;
}

@end
