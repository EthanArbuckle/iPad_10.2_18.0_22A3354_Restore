@implementation _UIHIDEventSenderDescriptor

+ (id)descriptorWithEvent:(__IOHIDEvent *)a3
{
  uint64_t SenderID;

  if (!a3)
    return 0;
  SenderID = IOHIDEventGetSenderID();
  return -[_UIHIDEventSenderDescriptor initWithSenderID:eventType:]([_UIHIDEventSenderDescriptor alloc], "initWithSenderID:eventType:", SenderID, IOHIDEventGetType());
}

- (_UIHIDEventSenderDescriptor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHIDEventSenderDescriptor.m"), 32, CFSTR("%s: init is not allowed on %@"), "-[_UIHIDEventSenderDescriptor init]", objc_opt_class());

  return 0;
}

- (_UIHIDEventSenderDescriptor)initWithSenderID:(unint64_t)a3 eventType:(unsigned int)a4
{
  _UIHIDEventSenderDescriptor *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIHIDEventSenderDescriptor;
  result = -[_UIHIDEventSenderDescriptor init](&v7, sel_init);
  if (result)
  {
    result->_senderID = a3;
    result->_eventType = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;

  if (a3 == self)
    return 1;
  if (!a3 || !_NSIsNSObject())
    return 0;
  v5 = a3;
  v6 = objc_opt_class();
  v8 = v6 == objc_opt_class()
    && (v7 = -[_UIHIDEventSenderDescriptor hash](self, "hash"), v7 == objc_msgSend(v5, "hash"))
    && self->_senderID == *((_QWORD *)v5 + 2)
    && self->_eventType == *((_DWORD *)v5 + 2);

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_senderID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_eventType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  v7 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v6 ^ (v6 >> 30))) >> 27));
  return v7 ^ (v7 >> 31);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIHIDEventSenderDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHIDEventSenderDescriptor appendDescriptionToFormatter:](self, "appendDescriptionToFormatter:", v3);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIHIDEventSenderDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60___UIHIDEventSenderDescriptor_appendDescriptionToFormatter___block_invoke;
  v3[3] = &unk_1E16B1B50;
  v3[4] = a3;
  v3[5] = self;
  objc_msgSend(a3, "appendProem:block:", self, v3);
}

@end
