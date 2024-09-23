@implementation TIKeyboardInteractionProtocolEventAddTouchEvent

- (TIKeyboardInteractionProtocolEventAddTouchEvent)initWithTouchEvent:(id)a3
{
  id v5;
  TIKeyboardInteractionProtocolEventAddTouchEvent *v6;
  TIKeyboardInteractionProtocolEventAddTouchEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventAddTouchEvent;
  v6 = -[TIKeyboardInteractionProtocolEventAddTouchEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_touchEvent, a3);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_touchEvent, CFSTR("touchEvent"));
}

- (TIKeyboardInteractionProtocolEventAddTouchEvent)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardInteractionProtocolEventAddTouchEvent *v5;
  uint64_t v6;
  TIKeyboardTouchEvent *touchEvent;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventAddTouchEvent;
  v5 = -[TIKeyboardInteractionProtocolEventAddTouchEvent init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("touchEvent"));
    v6 = objc_claimAutoreleasedReturnValue();
    touchEvent = v5->_touchEvent;
    v5->_touchEvent = (TIKeyboardTouchEvent *)v6;

  }
  return v5;
}

- (void)sendTo:(id)a3
{
  objc_msgSend(a3, "addTouchEvent:", self->_touchEvent);
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[TIKeyboardTouchEvent shortDescription](self->_touchEvent, "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<TouchEvent: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (TIKeyboardTouchEvent)touchEvent
{
  return self->_touchEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchEvent, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
