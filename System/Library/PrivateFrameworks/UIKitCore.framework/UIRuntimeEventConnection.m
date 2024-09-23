@implementation UIRuntimeEventConnection

- (UIRuntimeEventConnection)initWithCoder:(id)a3
{
  id v4;
  UIRuntimeEventConnection *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIRuntimeEventConnection;
  v5 = -[UIRuntimeConnection initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->eventMask = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIEventMask"));

  return v5;
}

- (void)connect
{
  id v3;

  -[UIRuntimeConnection source](self, "source");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_connectInterfaceBuilderEventConnection:", self);

}

- (id)target
{
  void *v3;
  void *v4;

  -[UIRuntimeConnection destination](self, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == (void *)IBFirstResponderStandin)
  {
    v4 = 0;
  }
  else
  {
    -[UIRuntimeConnection destination](self, "destination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (SEL)action
{
  NSString *v2;
  const char *v3;

  -[UIRuntimeConnection label](self, "label");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = NSSelectorFromString(v2);

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t eventMask;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIRuntimeEventConnection;
  -[UIRuntimeConnection encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  eventMask = self->eventMask;
  if (eventMask)
    objc_msgSend(v4, "encodeInteger:forKey:", eventMask, CFSTR("UIEventMask"));

}

- (void)connectForSimulator
{
  void *v3;

  -[UIRuntimeConnection source](self, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_connectInterfaceBuilderEventConnection:", self);

  NSLog(CFSTR("Could not establish connection: %@"), self);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UIRuntimeConnection source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIRuntimeConnection destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIRuntimeConnection label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Action event connection with source %@, target %@, and selector %@."), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)eventMask
{
  return self->eventMask;
}

- (void)setEventMask:(unint64_t)a3
{
  self->eventMask = a3;
}

@end
