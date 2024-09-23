@implementation _BCTransactionContextUnintializedSentinel

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_119D7C;
  block[3] = &unk_28B8C8;
  block[4] = a1;
  if (qword_3112E0 != -1)
    dispatch_once(&qword_3112E0, block);
  return (id)qword_3112E8;
}

@end
