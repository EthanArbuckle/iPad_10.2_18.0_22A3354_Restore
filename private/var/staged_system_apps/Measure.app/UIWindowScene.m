@implementation UIWindowScene

+ (void)setInterfaceLockedToPortrait:(BOOL)a3
{
  byte_10048BBF0 = a3;
}

+ (BOOL)interfaceLockedToPortrait
{
  return byte_10048BBF0;
}

+ (void)performWhileInterfaceOrientationLocked:(id)a3
{
  void (**v4)(_QWORD);
  id v5;

  v4 = (void (**)(_QWORD))a3;
  v5 = objc_msgSend(a1, "interfaceLockedToPortrait");
  objc_msgSend(a1, "setInterfaceLockedToPortrait:", 1);
  v4[2](v4);

  objc_msgSend(a1, "setInterfaceLockedToPortrait:", v5);
}

+ (void)load
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003784;
  block[3] = &unk_10043BAE0;
  block[4] = a1;
  if (qword_10048BBF8 != -1)
    dispatch_once(&qword_10048BBF8, block);
}

- (int64_t)xxx_interfaceOrientation
{
  if (+[UIWindowScene interfaceLockedToPortrait](UIWindowScene, "interfaceLockedToPortrait"))
    return 1;
  else
    return -[UIWindowScene xxx_interfaceOrientation](self, "xxx_interfaceOrientation");
}

@end
