@implementation TUICapslockAccessory

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUICapslockAccessory;
  -[TUICursorAccessory encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (TUICapslockAccessory)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUICapslockAccessory;
  return -[TUICursorAccessory initWithCoder:](&v4, sel_initWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
