@implementation TIPathAction

- (TIPathAction)initWithSyllableCount:(unint64_t)a3 keyboardState:(id)a4
{
  TIPathAction *v5;
  TIPathAction *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIPathAction;
  v5 = -[TIUserAction initWithTIKeyboardState:](&v8, sel_initWithTIKeyboardState_, a4);
  v6 = v5;
  if (v5)
  {
    -[TIUserAction setActionType:](v5, "setActionType:", 4);
    v6->_syllableCount = a3;
  }
  return v6;
}

- (TIPathAction)initWithCoder:(id)a3
{
  id v4;
  TIPathAction *v5;
  TIPathAction *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TIPathAction;
  v5 = -[TIUserAction initWithCoder:](&v8, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[TIUserAction setActionType:](v5, "setActionType:", 4);
    v6->_syllableCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("syllableCount"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIPathAction;
  v4 = a3;
  -[TIUserAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_syllableCount, CFSTR("syllableCount"), v5.receiver, v5.super_class);

}

- (unint64_t)syllableCount
{
  return self->_syllableCount;
}

@end
