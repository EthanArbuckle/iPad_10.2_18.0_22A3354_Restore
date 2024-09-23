@implementation PXGFocusableView

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  objc_super v18;

  -[PXGFocusableView userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "focusability");
  objc_msgSend(v3, "debugName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB37A0]);
  if (v4)
  {
    if (v4 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *PXGFocusableViewFocusabilityDescription(PXGFocusableViewFocusability)");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXGFocusableView.m"), 22, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v7 = CFSTR("Invisible");
  }
  else
  {
    v7 = CFSTR("Default");
  }
  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("; focusability = %@"), v7);
  v9 = v8;
  if (v5)
    objc_msgSend(v8, "appendFormat:", CFSTR("; debugName = '%@'"), v5);
  v18.receiver = self;
  v18.super_class = (Class)PXGFocusableView;
  -[PXGFocusableView description](&v18, sel_description);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 59, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "rangeOfCharacterFromSet:", v12);

  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v11, "appendString:", v9);
  else
    objc_msgSend(v11, "insertString:atIndex:", v9, v13);
  v14 = (void *)objc_msgSend(v11, "copy");

  return v14;
}

- (BOOL)_isEligibleForFocusInteraction
{
  void *v4;
  uint64_t v5;
  void *v7;
  objc_super v8;

  -[PXGFocusableView userData](self, "userData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "focusability");

  if (v5 == 1)
    return 0;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGFocusableView.m"), 106, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8.receiver = self;
  v8.super_class = (Class)PXGFocusableView;
  return -[PXGFocusableView _isEligibleForFocusInteraction](&v8, sel__isEligibleForFocusInteraction);
}

- (BOOL)canBecomeFocused
{
  void *v4;
  uint64_t v5;
  void *v7;

  -[PXGFocusableView userData](self, "userData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "focusability");

  if (!v5)
    return 1;
  if (v5 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGFocusableView.m"), 117, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    v6 = a4;
    v7 = a3;
    -[PXGFocusableView userData](self, "userData");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "focusableView:didUpdateFocusInContext:withAnimationCoordinator:", self, v7, v6);

  }
}

- (void)didHintFocusMovement:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    v4 = a3;
    -[PXGFocusableView userData](self, "userData");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "focusableView:didHintFocusMovement:", self, v4);

  }
}

- (void)setUserData:(id)a3
{
  PXGFocusableViewConfiguration *v4;
  void *v5;
  PXGFocusableViewConfiguration *v6;
  BOOL v7;
  PXGFocusableViewConfiguration *v8;
  PXGFocusableViewConfiguration *userData;
  void *v10;
  char v11;
  char v12;
  char delegateFlags;
  char v14;
  PXGFocusableViewConfiguration *v15;

  v15 = (PXGFocusableViewConfiguration *)a3;
  v4 = self->_userData;
  v5 = v15;
  if (v4 == v15)
  {
LABEL_11:

    goto LABEL_12;
  }
  v6 = v4;
  v7 = -[PXGFocusableViewConfiguration isEqual:](v4, "isEqual:", v15);

  if (!v7)
  {
    v8 = (PXGFocusableViewConfiguration *)-[PXGFocusableViewConfiguration copy](v15, "copy");
    userData = self->_userData;
    self->_userData = v8;

    -[PXGFocusableView setNeedsLayout](self, "setNeedsLayout");
    -[PXGFocusableView userData](self, "userData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 2;
    else
      v11 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v11;
    v12 = objc_opt_respondsToSelector();
    delegateFlags = (char)self->_delegateFlags;
    if ((v12 & 1) != 0)
      v14 = 4;
    else
      v14 = 0;
    *(_BYTE *)&self->_delegateFlags = delegateFlags & 0xFB | v14;
    if ((delegateFlags & 1) != 0)
      objc_msgSend(v5, "focusableViewDidUpdateUserInfo:", self);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)addHostedLayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXGFocusableView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSublayer:", v4);

}

- (CGPoint)convertHostedChildCenter:(CGPoint)a3 fromGlobalLayer:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PXGFocusableView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromLayer:", v7, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXGFocusableViewConfiguration)userData
{
  return self->_userData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
}

@end
