@implementation AyHWzHEhbORltioL

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014D7C;
  block[3] = &unk_1004CE9E0;
  block[4] = a1;
  if (qword_100511560 != -1)
    dispatch_once(&qword_100511560, block);
  return (id)qword_100511558;
}

- (unint64_t)XIxEGt72u9dQYi43:(int)a3 S6srINK5PmHWLUdD:(unint64_t)a4
{
  unint64_t result;

  if (a3 > 0xA)
    return 0;
  result = 1;
  if (((1 << a3) & 0x40C) == 0)
    return 0;
  return result;
}

@end
