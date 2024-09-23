@implementation SmallDropDownOutlineCellRegistration

+ (id)sharedRegistration
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B53038;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D4110 != -1)
    dispatch_once(&qword_1014D4110, block);
  return (id)qword_1014D4108;
}

@end
