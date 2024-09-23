@implementation FTApplicationServices

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015444;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A38F0 != -1)
    dispatch_once(&qword_1000A38F0, block);
  return (id)qword_1000A38E8;
}

@end
