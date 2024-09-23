@implementation BSUITemplate

+ (id)manager
{
  if (qword_32BFA0 != -1)
    dispatch_once(&qword_32BFA0, &stru_2E4628);
  return (id)qword_32BF98;
}

+ (id)factory
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_13608;
  block[3] = &unk_2E4068;
  block[4] = a1;
  if (qword_32BFB0 != -1)
    dispatch_once(&qword_32BFB0, block);
  return (id)qword_32BFA8;
}

@end
