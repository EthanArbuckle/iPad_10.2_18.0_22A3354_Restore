@implementation SBPressTuple

- (SBPressTuple)initWithDurationDown:(double)a3 durationUp:(double)a4
{
  SBPressTuple *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPressTuple;
  result = -[SBPressTuple init](&v7, sel_init);
  if (result)
  {
    result->_durationDown = a3;
    result->_durationUp = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  char v9;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8
    && (-[SBPressTuple durationDown](self, "durationDown"),
        objc_msgSend(v8, "durationDown"),
        BSFloatEqualToFloat()))
  {
    -[SBPressTuple durationUp](self, "durationUp");
    objc_msgSend(v8, "durationUp");
    v9 = BSFloatEqualToFloat();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBPressTuple succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("durationDown"), self->_durationDown);
  v5 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("durationUp"), self->_durationUp);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBPressTuple descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)durationDown
{
  return self->_durationDown;
}

- (void)setDurationDown:(double)a3
{
  self->_durationDown = a3;
}

- (double)durationUp
{
  return self->_durationUp;
}

- (void)setDurationUp:(double)a3
{
  self->_durationUp = a3;
}

@end
