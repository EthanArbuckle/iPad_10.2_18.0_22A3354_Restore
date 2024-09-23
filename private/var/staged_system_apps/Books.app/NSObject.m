@implementation NSObject

- (void)_bkaxIgnoreNextNotification:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100099F98;
  v3[3] = &unk_1008E84E8;
  v3[4] = self;
  v4 = a3;
  sub_100099F24(v3);
}

@end
