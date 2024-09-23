@implementation HomeOutlineHiddenCellRegistration

+ (id)sharedRegistration
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10076E820;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D31E0 != -1)
    dispatch_once(&qword_1014D31E0, block);
  return (id)qword_1014D31D8;
}

@end
