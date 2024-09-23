@implementation TIKeyboardInteractionProtocolEventChangingContextWithTrigger

- (TIKeyboardInteractionProtocolEventChangingContextWithTrigger)initWithContextChangeTrigger:(id)a3
{
  id v5;
  TIKeyboardInteractionProtocolEventChangingContextWithTrigger *v6;
  TIKeyboardInteractionProtocolEventChangingContextWithTrigger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventChangingContextWithTrigger;
  v6 = -[TIKeyboardInteractionProtocolEventChangingContextWithTrigger init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contextChangeTrigger, a3);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_contextChangeTrigger, CFSTR("contextChangeTrigger"));
}

- (TIKeyboardInteractionProtocolEventChangingContextWithTrigger)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardInteractionProtocolEventChangingContextWithTrigger *v5;
  uint64_t v6;
  NSString *contextChangeTrigger;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventChangingContextWithTrigger;
  v5 = -[TIKeyboardInteractionProtocolEventChangingContextWithTrigger init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextChangeTrigger"));
    v6 = objc_claimAutoreleasedReturnValue();
    contextChangeTrigger = v5->_contextChangeTrigger;
    v5->_contextChangeTrigger = (NSString *)v6;

  }
  return v5;
}

- (void)sendTo:(id)a3
{
  objc_msgSend(a3, "changingContextWithTrigger:", self->_contextChangeTrigger);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Changing Context With Trigger: %@>"), self->_contextChangeTrigger);
}

- (NSString)contextChangeTrigger
{
  return self->_contextChangeTrigger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextChangeTrigger, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
