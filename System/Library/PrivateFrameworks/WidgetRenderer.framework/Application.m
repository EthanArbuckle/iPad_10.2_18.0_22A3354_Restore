@implementation Application

- (BOOL)_supportsAlwaysOnDisplay
{
  return 1;
}

- (BOOL)_shouldAllowKeyboardArbiter
{
  return 0;
}

+ (BOOL)_suppressesTextEffectsWindow
{
  return 1;
}

- (BOOL)_hostsSystemStatusBar
{
  return 0;
}

- (BOOL)_isSpringBoard
{
  return 1;
}

- (_TtC14WidgetRenderer11Application)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Application();
  return -[Application init](&v3, sel_init);
}

@end
