@implementation SBLockScreenElementOverride

+ (id)overrideForElement:(int64_t)a3
{
  SBLockScreenElementOverride *v4;

  v4 = objc_alloc_init(SBLockScreenElementOverride);
  -[SBLockScreenElementOverride setElement:](v4, "setElement:", a3);
  return v4;
}

+ (id)overrideForHiddenElement:(int64_t)a3
{
  void *v3;

  objc_msgSend(a1, "overrideForElement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);
  return v3;
}

- (id)description
{
  return -[SBLockScreenElementOverride descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBLockScreenElementOverride succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromLockScreenElement(self->_element);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("element"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_hidden, CFSTR("hidden"));
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_text, CFSTR("text"), 1);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBLockScreenElementOverride descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)element
{
  return self->_element;
}

- (void)setElement:(int64_t)a3
{
  self->_element = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
