@implementation SecureWindow

- (_TtC20UniversalControl_iOS12SecureWindow)initWithWindowScene:(id)a3
{
  return (_TtC20UniversalControl_iOS12SecureWindow *)sub_100008B40(a3);
}

- (_TtC20UniversalControl_iOS12SecureWindow)initWithCoder:(id)a3
{
  sub_100008C30();
}

- (unint64_t)_supportedInterfaceOrientationsForRootViewController
{
  _TtC20UniversalControl_iOS12SecureWindow *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_100008F40();

  return v3;
}

- (BOOL)_windowOwnsInterfaceOrientation
{
  _TtC20UniversalControl_iOS12SecureWindow *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100008FFC();

  return v3 & 1;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

+ (BOOL)_isSecure
{
  return 1;
}

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (BOOL)_supportsFocus
{
  return 0;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

- (_TtC20UniversalControl_iOS12SecureWindow)initWithFrame:(CGRect)a3
{
  sub_100009104((uint64_t)"init(frame:)", 12);
}

- (_TtC20UniversalControl_iOS12SecureWindow)initWithContentRect:(CGRect)a3
{
  sub_100009104((uint64_t)"init(contentRect:)", 18);
}

@end
