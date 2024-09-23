@implementation TIUnknownContextChangeEvent

- (TIUnknownContextChangeEvent)initWithTIKeyboardState:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIUnknownContextChangeEvent;
  return -[TIContextChangeEvent initWithTIKeyboardState:andActionType:](&v4, sel_initWithTIKeyboardState_andActionType_, a3, 12);
}

@end
