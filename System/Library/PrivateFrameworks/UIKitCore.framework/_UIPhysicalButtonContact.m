@implementation _UIPhysicalButtonContact

- (_UIPhysicalButtonContact)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonContact.m"), 29, CFSTR("%s: init is not allowed on %@"), "-[_UIPhysicalButtonContact init]", objc_opt_class());

  return 0;
}

- (id)_init
{
  objc_super v1;

  if (result)
  {
    v1.receiver = result;
    v1.super_class = (Class)_UIPhysicalButtonContact;
    return objc_msgSendSuper2(&v1, sel_init);
  }
  return result;
}

- (uint64_t)_appendProemDescriptionSansSelfToFormatter:(uint64_t)result
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (result)
  {
    v3 = result;
    v4 = (id)objc_msgSend(a2, "appendBool:withName:", *(unsigned __int8 *)(result + 8), CFSTR("isTouching"));
    v5 = MEMORY[0x1E0C809B0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __71___UIPhysicalButtonContact__appendProemDescriptionSansSelfToFormatter___block_invoke;
    v7[3] = &unk_1E16B8250;
    v7[4] = v3;
    objc_msgSend(a2, "appendCustomFormatWithName:block:", CFSTR("position"), v7);
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __71___UIPhysicalButtonContact__appendProemDescriptionSansSelfToFormatter___block_invoke_2;
    v6[3] = &unk_1E16B8250;
    v6[4] = v3;
    return objc_msgSend(a2, "appendCustomFormatWithName:block:", CFSTR("positionDelta"), v6);
  }
  return result;
}

- (void)_appendDebugBodyDescriptionToFormatter:(uint64_t)a1
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];

  if (a1)
  {
    v4 = (id)objc_msgSend(a2, "appendBool:withName:", *(unsigned __int8 *)(a1 + 8), CFSTR("isTouching"));
    v5 = (id)objc_msgSend(a2, "appendFloat:withName:decimalPrecision:", CFSTR("touchMajorRadius"), 1, *(double *)(a1 + 16));
    v6 = (id)objc_msgSend(a2, "appendFloat:withName:decimalPrecision:", CFSTR("touchMinorRadius"), 1, *(double *)(a1 + 24));
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67___UIPhysicalButtonContact__appendDebugBodyDescriptionToFormatter___block_invoke;
    v11[3] = &unk_1E16B8250;
    v11[4] = a1;
    objc_msgSend(a2, "appendCustomFormatWithName:block:", CFSTR("position"), v11);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __67___UIPhysicalButtonContact__appendDebugBodyDescriptionToFormatter___block_invoke_2;
    v10[3] = &unk_1E16B8250;
    v10[4] = a1;
    objc_msgSend(a2, "appendCustomFormatWithName:block:", CFSTR("positionDelta"), v10);
    _NSStringFromUITouchSenstiveButtonPositionHint(*(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(a2, "appendObject:withName:", v8, CFSTR("touchPositionHints"));

  }
}

- (void)appendDescriptionToFormatter:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57___UIPhysicalButtonContact_appendDescriptionToFormatter___block_invoke;
  v3[3] = &unk_1E16B1B50;
  v3[4] = self;
  v3[5] = a3;
  objc_msgSend(a3, "appendProem:block:", self, v3);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIPhysicalButtonContact succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  -[_UIPhysicalButtonContact _appendProemDescriptionSansSelfToFormatter:]((uint64_t)self, v3);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonContact descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonContact descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _UIPhysicalButtonContact *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66___UIPhysicalButtonContact_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v7 = (id)objc_msgSend(v6, "modifyBody:", v10);
  v8 = v6;

  return v8;
}

- (NSString)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[_UIPhysicalButtonContact appendDescriptionToFormatter:](self, "appendDescriptionToFormatter:", v3);
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[6];

  v3 = (void *)objc_opt_new();
  v4 = v3;
  if (self)
  {
    objc_msgSend(v3, "appendProem:block:", self, &__block_literal_global_221);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60___UIPhysicalButtonContact__appendDebugDescriptionToStream___block_invoke_2;
    v7[3] = &unk_1E16B1B50;
    v7[4] = self;
    v7[5] = v4;
    objc_msgSend(v4, "appendBodySectionWithName:block:", 0, v7);
  }
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isTouching
{
  return self->_touching;
}

- (double)touchMajorRadius
{
  return self->_touchMajorRadius;
}

- (double)touchMinorRadius
{
  return self->_touchMinorRadius;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->_position.x;
  y = self->_position.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)positionDelta
{
  double x;
  double y;
  CGPoint result;

  x = self->_positionDelta.x;
  y = self->_positionDelta.y;
  result.y = y;
  result.x = x;
  return result;
}

- (unint64_t)touchPositionHints
{
  return self->_touchPositionHints;
}

@end
