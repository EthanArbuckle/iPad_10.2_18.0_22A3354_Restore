@implementation PhoneRotateFromDayToWeekViewColdDelayTest

- (void)_rotationTest
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_willChangeOrientation:", UIWindowWillRotateNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)PhoneRotateFromDayToWeekViewColdDelayTest;
  -[RotationTest _rotationTest](&v4, "_rotationTest");
}

- (void)_willChangeOrientation:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, UIWindowWillRotateNotification, 0);

  -[RotationTest _finishTest](self, "_finishTest");
}

@end
