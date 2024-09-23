@implementation TIPasteEvent

- (TIPasteEvent)initWithTIKeyboardState:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIPasteEvent;
  return -[TIContextChangeEvent initWithTIKeyboardState:andActionType:](&v4, sel_initWithTIKeyboardState_andActionType_, a3, 9);
}

@end
