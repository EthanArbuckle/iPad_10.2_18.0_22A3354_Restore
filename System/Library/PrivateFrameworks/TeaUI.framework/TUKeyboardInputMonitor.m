@implementation TUKeyboardInputMonitor

- (TUKeyboardInputMonitor)init
{
  return (TUKeyboardInputMonitor *)KeyboardInputMonitor.init()();
}

- (void)handle:(id)a3
{
  id v4;
  TUKeyboardInputMonitor *v5;

  v4 = a3;
  v5 = self;
  KeyboardInputMonitor.handle(_:)((UIEvent)v4);

}

@end
