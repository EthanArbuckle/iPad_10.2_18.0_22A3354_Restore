@implementation SectionHeaderOutlineCellRegistration

+ (id)sharedRegistration
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10098BBB0;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D3B68 != -1)
    dispatch_once(&qword_1014D3B68, block);
  return (id)qword_1014D3B60;
}

@end
