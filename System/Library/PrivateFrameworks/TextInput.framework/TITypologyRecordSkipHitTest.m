@implementation TITypologyRecordSkipHitTest

- (TITypologyRecordSkipHitTest)initWithCoder:(id)a3
{
  id v4;
  TITypologyRecordSkipHitTest *v5;
  uint64_t v6;
  TIKeyboardTouchEvent *touchEvent;
  uint64_t v8;
  TIKeyboardState *keyboardState;
  uint64_t v10;
  TIKeyboardLayout *keyLayout;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TITypologyRecordSkipHitTest;
  v5 = -[TITypologyRecord initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("touchEvent"));
    v6 = objc_claimAutoreleasedReturnValue();
    touchEvent = v5->_touchEvent;
    v5->_touchEvent = (TIKeyboardTouchEvent *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardState"));
    v8 = objc_claimAutoreleasedReturnValue();
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyLayout"));
    v10 = objc_claimAutoreleasedReturnValue();
    keyLayout = v5->_keyLayout;
    v5->_keyLayout = (TIKeyboardLayout *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordSkipHitTest;
  v4 = a3;
  -[TITypologyRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_touchEvent, CFSTR("touchEvent"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardState, CFSTR("keyboardState"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyLayout, CFSTR("keyLayout"));

}

- (void)removeContextFromKeyboardState
{
  void *v3;
  id v4;

  -[TITypologyRecordSkipHitTest keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "copy");

  objc_msgSend(v4, "setInputContextHistory:", 0);
  -[TITypologyRecordSkipHitTest setKeyboardState:](self, "setKeyboardState:", v4);

}

- (id)shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[TITypologyRecordSkipHitTest touchEvent](self, "touchEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SKIP HIT TEST at %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)replaceDocumentState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TITypologyRecordSkipHitTest keyboardState](self, "keyboardState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDocumentState:", v4);

}

- (TIKeyboardTouchEvent)touchEvent
{
  return self->_touchEvent;
}

- (void)setTouchEvent:(id)a3
{
  objc_storeStrong((id *)&self->_touchEvent, a3);
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setKeyboardState:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardState, a3);
}

- (TIKeyboardLayout)keyLayout
{
  return self->_keyLayout;
}

- (void)setKeyLayout:(id)a3
{
  objc_storeStrong((id *)&self->_keyLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyLayout, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong((id *)&self->_touchEvent, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
  objc_msgSend(a3, "visitRecordSkipHitTest:", self);
}

@end
