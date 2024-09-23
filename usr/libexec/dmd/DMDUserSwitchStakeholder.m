@implementation DMDUserSwitchStakeholder

+ (id)sharedStakeholder
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005DADC;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EBA40 != -1)
    dispatch_once(&qword_1000EBA40, block);
  return (id)qword_1000EBA38;
}

- (BOOL)inEDUMode
{
  if (qword_1000EBA50 != -1)
    dispatch_once(&qword_1000EBA50, &stru_1000BBC00);
  return byte_1000EBA48;
}

@end
