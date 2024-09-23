@implementation _UIPhysicalButtonBehaviorOptions

- (BOOL)isEqual:(id)a3
{
  _QWORD *v5;
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
    && (v7 = -[_UIPhysicalButtonBehaviorOptions hash](self, "hash"), v7 == objc_msgSend(v5, "hash"))
    && self->_behavior == v5[1];

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_behavior);
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (unint64_t)_behavior
{
  return self->_behavior;
}

- (id)_initWithBehavior:(unint64_t)a3
{
  objc_class *v6;
  id result;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  objc_super v13;

  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButton.m"), 303, CFSTR("Invalid behavior: %lu"), a3);

  }
  v6 = (objc_class *)objc_opt_class();
  if (v6 != _UIPhysicalButtonBehaviorOptionsClassForBehavior(a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (a3 > 2)
      v12 = &stru_1E16EDF20;
    else
      v12 = off_1E16B2D90[a3];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButton.m"), 307, CFSTR("Invalid behavior options class for button behavior: class: %@; behavior: %@"),
      v10,
      v12);

  }
  v13.receiver = self;
  v13.super_class = (Class)_UIPhysicalButtonBehaviorOptions;
  result = -[_UIPhysicalButtonBehaviorOptions init](&v13, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_behavior);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "encodeObject:forKey:", v4, CFSTR("behavior"));

}

- (_UIPhysicalButtonBehaviorOptions)initWithBSXPCCoder:(id)a3
{
  void *v6;
  _UIPhysicalButtonBehaviorOptions *v7;
  _UIPhysicalButtonBehaviorOptions *v8;
  void *v10;
  objc_super v11;

  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("behavior"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIPhysicalButtonBehaviorOptions;
    v7 = -[_UIPhysicalButtonBehaviorOptions init](&v11, sel_init);
    if (v7)
      v7->_behavior = objc_msgSend(v6, "unsignedIntegerValue");
    self = v7;
    v8 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButton.m"), 438, CFSTR("Invalid encoded behavior options: %@"), a3);

    v8 = 0;
  }

  return v8;
}

+ (id)behaviorOptions
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIPhysicalButton.m"), 292, CFSTR("%s: behaviorOptions is not allowed on %@"), "+[_UIPhysicalButtonBehaviorOptions behaviorOptions]", objc_opt_class());

  return 0;
}

- (_UIPhysicalButtonBehaviorOptions)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButton.m"), 297, CFSTR("%s: init is not allowed on %@"), "-[_UIPhysicalButtonBehaviorOptions init]", objc_opt_class());

  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIPhysicalButtonBehaviorOptions debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", &stru_1E16EDF20);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIPhysicalButtonBehaviorOptions succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  unint64_t behavior;
  const __CFString *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  behavior = self->_behavior;
  if (behavior > 2)
    v6 = &stru_1E16EDF20;
  else
    v6 = off_1E16B2D90[behavior];
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("behavior"));
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonBehaviorOptions descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonBehaviorOptions descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  unint64_t behavior;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  behavior = self->_behavior;
  if (behavior > 2)
    v7 = &stru_1E16EDF20;
  else
    v7 = off_1E16B2D90[behavior];
  objc_msgSend(v5, "appendString:withName:", v7, CFSTR("behavior"));
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_UIPhysicalButtonBehaviorOptions _initWithBehavior:]([_UIPhysicalButtonBehaviorOptions alloc], "_initWithBehavior:", self->_behavior);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_behavior);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "encodeObject:forKey:", v4, CFSTR("behavior"));

}

- (_UIPhysicalButtonBehaviorOptions)initWithCoder:(id)a3
{
  void *v6;
  _UIPhysicalButtonBehaviorOptions *v7;
  _UIPhysicalButtonBehaviorOptions *v8;
  void *v10;
  objc_super v11;

  objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("behavior"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIPhysicalButtonBehaviorOptions;
    v7 = -[_UIPhysicalButtonBehaviorOptions init](&v11, sel_init);
    if (v7)
      v7->_behavior = objc_msgSend(v6, "unsignedIntegerValue");
    self = v7;
    v8 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButton.m"), 395, CFSTR("Invalid encoded behavior options: %@"), a3);

    v8 = 0;
  }

  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_dictionary_set_uint64(a3, (const char *)objc_msgSend(CFSTR("behavior"), "UTF8String"), self->_behavior);
}

- (_UIPhysicalButtonBehaviorOptions)initWithXPCDictionary:(id)a3
{
  _UIPhysicalButtonBehaviorOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPhysicalButtonBehaviorOptions;
  v4 = -[_UIPhysicalButtonBehaviorOptions init](&v6, sel_init);
  if (v4)
    v4->_behavior = xpc_dictionary_get_uint64(a3, (const char *)objc_msgSend(CFSTR("behavior"), "UTF8String"));
  return v4;
}

@end
