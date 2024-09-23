@implementation MonitoredStates

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016E80;
  block[3] = &unk_10004D420;
  block[4] = a1;
  if (qword_100060238 != -1)
    dispatch_once(&qword_100060238, block);
  return (id)qword_100060230;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MonitoredStates)init
{
  self->_isImmersionLevelControllerPresentOnScreen = 0;
  return self;
}

- (MonitoredStates)initWithImmersionLevelControllerPresentOnScreen:(BOOL)a3
{
  MonitoredStates *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MonitoredStates;
  result = -[MonitoredStates init](&v5, "init");
  if (result)
    result->_isImmersionLevelControllerPresentOnScreen = a3;
  return result;
}

- (MonitoredStates)initWithCoder:(id)a3
{
  return -[MonitoredStates initWithImmersionLevelControllerPresentOnScreen:](self, "initWithImmersionLevelControllerPresentOnScreen:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isImmersionLevelControllerPresentOnScreen")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_isImmersionLevelControllerPresentOnScreen, CFSTR("isImmersionLevelControllerPresentOnScreen"));
}

- (BOOL)isImmersionLevelControllerPresentOnScreen
{
  return self->_isImmersionLevelControllerPresentOnScreen;
}

- (void)setIsImmersionLevelControllerPresentOnScreen:(BOOL)a3
{
  self->_isImmersionLevelControllerPresentOnScreen = a3;
}

@end
