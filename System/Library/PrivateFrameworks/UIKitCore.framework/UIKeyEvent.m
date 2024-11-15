@implementation UIKeyEvent

- (UIKeyEvent)initWithWebEvent:(id)a3
{
  id v5;
  UIKeyEvent *v6;
  uint64_t v7;
  NSString *characters;
  uint64_t v9;
  NSString *charactersIgnoringModifiers;
  double v11;
  uint64_t v12;
  NSString *inputManagerHint;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIKeyEvent;
  v6 = -[UIKeyEvent init](&v15, sel_init);
  if (v6)
  {
    v6->_type = objc_msgSend((id)objc_opt_class(), "typeFromWebEventType:", objc_msgSend(v5, "type"));
    objc_msgSend(v5, "characters");
    v7 = objc_claimAutoreleasedReturnValue();
    characters = v6->_characters;
    v6->_characters = (NSString *)v7;

    objc_msgSend(v5, "charactersIgnoringModifiers");
    v9 = objc_claimAutoreleasedReturnValue();
    charactersIgnoringModifiers = v6->_charactersIgnoringModifiers;
    v6->_charactersIgnoringModifiers = (NSString *)v9;

    v6->_keyRepeating = objc_msgSend(v5, "isKeyRepeating");
    v6->_keyCode = objc_msgSend(v5, "keyCode");
    objc_msgSend(v5, "timestamp");
    v6->_timestamp = v11;
    v6->_modifierFlags = objc_msgSend((id)objc_opt_class(), "modifierFlagsFromWebFlags:", objc_msgSend(v5, "modifierFlags"));
    objc_storeStrong((id *)&v6->_webEvent, a3);
    objc_msgSend(v5, "inputManagerHint");
    v12 = objc_claimAutoreleasedReturnValue();
    inputManagerHint = v6->_inputManagerHint;
    v6->_inputManagerHint = (NSString *)v12;

    v6->_inputFlags = objc_msgSend(v5, "keyboardFlags");
  }

  return v6;
}

- (id)copyWithUpdatedKeyEventType:(int64_t)a3
{
  void *v5;
  void *v8;

  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyEvent.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type == UIKeyEventKeyDown || type == UIKeyEventKeyUp"));

  }
  v5 = (void *)-[UIKeyEvent copy](self, "copy");
  objc_msgSend(v5, "setType:", a3);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIKeyEvent *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc_init(UIKeyEvent);
  -[UIKeyEvent characters](self, "characters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[UIKeyEvent setCharacters:](v4, "setCharacters:", v6);

  -[UIKeyEvent charactersIgnoringModifiers](self, "charactersIgnoringModifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[UIKeyEvent setCharactersIgnoringModifiers:](v4, "setCharactersIgnoringModifiers:", v8);

  -[UIKeyEvent setType:](v4, "setType:", -[UIKeyEvent type](self, "type"));
  -[UIKeyEvent setKeyRepeating:](v4, "setKeyRepeating:", -[UIKeyEvent isKeyRepeating](self, "isKeyRepeating"));
  -[UIKeyEvent setKeyCode:](v4, "setKeyCode:", -[UIKeyEvent keyCode](self, "keyCode"));
  -[UIKeyEvent timestamp](self, "timestamp");
  -[UIKeyEvent setTimestamp:](v4, "setTimestamp:");
  -[UIKeyEvent setModifierFlags:](v4, "setModifierFlags:", -[UIKeyEvent modifierFlags](self, "modifierFlags"));
  -[UIKeyEvent webEvent](self, "webEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyEvent setWebEvent:](v4, "setWebEvent:", v9);

  -[UIKeyEvent setInputFlags:](v4, "setInputFlags:", -[UIKeyEvent inputFlags](self, "inputFlags"));
  -[UIKeyEvent inputManagerHint](self, "inputManagerHint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[UIKeyEvent setInputManagerHint:](v4, "setInputManagerHint:", v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyEvent characters](self, "characters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyEvent charactersIgnoringModifiers](self, "charactersIgnoringModifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringFromKeyEventType:", -[UIKeyEvent type](self, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIKeyEvent isKeyRepeating](self, "isKeyRepeating");
  v10 = -[UIKeyEvent keyCode](self, "keyCode");
  -[UIKeyEvent timestamp](self, "timestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p chars: %@, charsIgnoringModifiers: %@, type: %@, repeating: %d, keyCode: 0x%.4lX, timestamp: %lf, modifierFlags: %lX>"), v5, self, v6, v7, v8, v9, v10, v11, -[UIKeyEvent modifierFlags](self, "modifierFlags"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)stringFromKeyEventType:(int64_t)a3
{
  if (a3 == 1)
    return CFSTR("KeyDown");
  else
    return CFSTR("KeyUp");
}

+ (int64_t)typeFromWebEventType:(int)a3
{
  if (a3 == 5)
    return 2;
  else
    return a3 == 4;
}

+ (int64_t)modifierFlagsFromWebFlags:(unsigned int)a3
{
  unint64_t v3;

  if ((a3 & 0x220000) != 0)
    v3 = ((unint64_t)((a3 & 0x1010000) != 0) << 20) | 0x20000;
  else
    v3 = (unint64_t)((a3 & 0x1010000) != 0) << 20;
  if ((a3 & 0x480000) != 0)
    v3 |= 0x80000uLL;
  if ((a3 & 0x900000) != 0)
    v3 |= 0x40000uLL;
  return v3 | (a3 >> 2) & 0x10000;
}

- (NSString)characters
{
  return self->_characters;
}

- (void)setCharacters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)charactersIgnoringModifiers
{
  return self->_charactersIgnoringModifiers;
}

- (void)setCharactersIgnoringModifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)isKeyRepeating
{
  return self->_keyRepeating;
}

- (void)setKeyRepeating:(BOOL)a3
{
  self->_keyRepeating = a3;
}

- (int64_t)keyCode
{
  return self->_keyCode;
}

- (void)setKeyCode:(int64_t)a3
{
  self->_keyCode = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (int64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (void)setModifierFlags:(int64_t)a3
{
  self->_modifierFlags = a3;
}

- (int)inputFlags
{
  return self->_inputFlags;
}

- (void)setInputFlags:(int)a3
{
  self->_inputFlags = a3;
}

- (NSString)inputManagerHint
{
  return self->_inputManagerHint;
}

- (void)setInputManagerHint:(id)a3
{
  objc_storeStrong((id *)&self->_inputManagerHint, a3);
}

- (WebEvent)webEvent
{
  return self->_webEvent;
}

- (void)setWebEvent:(id)a3
{
  objc_storeStrong((id *)&self->_webEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webEvent, 0);
  objc_storeStrong((id *)&self->_inputManagerHint, 0);
  objc_storeStrong((id *)&self->_charactersIgnoringModifiers, 0);
  objc_storeStrong((id *)&self->_characters, 0);
}

@end
