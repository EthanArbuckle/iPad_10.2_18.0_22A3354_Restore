@implementation PHSpringBoardPreferences

+ (id)sharedPreferences
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021E58;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A3708 != -1)
    dispatch_once(&qword_1000A3708, block);
  return (id)qword_1000A3700;
}

- (id)domain
{
  return CFSTR("com.apple.springboard");
}

- (BOOL)isProximitySensorAvailable
{
  return !-[PHPreferences BOOLForKey:defaultValue:](self, "BOOLForKey:defaultValue:", CFSTR("SBDisableProximity"), 0);
}

@end
