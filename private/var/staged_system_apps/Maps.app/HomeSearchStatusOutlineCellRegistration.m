@implementation HomeSearchStatusOutlineCellRegistration

+ (id)sharedRegistration
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024849C;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D1DD8 != -1)
    dispatch_once(&qword_1014D1DD8, block);
  return (id)qword_1014D1DD0;
}

@end
