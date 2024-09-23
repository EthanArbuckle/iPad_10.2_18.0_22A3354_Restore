@implementation _UIGenericGestureHIDEventDescriptor

+ (_UIGenericGestureHIDEventDescriptor)descriptorWithEvent:(__IOHIDEvent *)a3
{
  int Type;
  uint64_t SenderID;
  unsigned int IntegerValue;
  uint64_t v9;
  _UIGenericGestureHIDEventDescriptor *v10;
  void *v11;
  objc_super v13;

  Type = IOHIDEventGetType();
  if (a3 && Type == 39)
  {
    SenderID = IOHIDEventGetSenderID();
    IntegerValue = IOHIDEventGetIntegerValue();
    v9 = IOHIDEventGetIntegerValue();
    v10 = [_UIGenericGestureHIDEventDescriptor alloc];
    if (v10)
    {
      v13.receiver = v10;
      v13.super_class = (Class)_UIGenericGestureHIDEventDescriptor;
      v10 = objc_msgSendSuper2(&v13, sel_initWithSenderID_eventType_, SenderID, 39);
      if (v10)
      {
        v10->_gestureType = IntegerValue;
        v10->_tapCount = v9;
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIGenericGestureHIDEventDescriptor.m"), 25, CFSTR("Invalid event for %@: %@"), a1, a3);

    v10 = 0;
  }
  return v10;
}

- (_UIGenericGestureHIDEventDescriptor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIGenericGestureHIDEventDescriptor.m"), 36, CFSTR("%s: init is not allowed on %@"), "-[_UIGenericGestureHIDEventDescriptor init]", objc_opt_class());

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIGenericGestureHIDEventDescriptor;
  v5 = -[_UIHIDEventSenderDescriptor isEqual:](&v7, sel_isEqual_);
  if (v5)
    LOBYTE(v5) = self->_gestureType == *((_DWORD *)a3 + 6) && self->_tapCount == *((_QWORD *)a3 + 4);
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIGenericGestureHIDEventDescriptor;
  v3 = -[_UIHIDEventSenderDescriptor hash](&v10, sel_hash);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_gestureType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_tapCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  v8 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) >> 27));
  return v8 ^ (v8 >> 31);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIGenericGestureHIDEventDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  -[_UIGenericGestureHIDEventDescriptor appendDescriptionToFormatter:](self, "appendDescriptionToFormatter:", v3);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIGenericGestureHIDEventDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  v3[2] = __68___UIGenericGestureHIDEventDescriptor_appendDescriptionToFormatter___block_invoke;
  v3[3] = &unk_1E16B1B50;
  v3[4] = a3;
  v3[5] = self;
  objc_msgSend(a3, "appendProem:block:", self, v3);
}

@end
