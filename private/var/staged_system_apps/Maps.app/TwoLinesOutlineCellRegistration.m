@implementation TwoLinesOutlineCellRegistration

+ (id)sharedRegistration
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10077C5AC;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D3208 != -1)
    dispatch_once(&qword_1014D3208, block);
  return (id)qword_1014D3200;
}

@end
