@implementation _UIPassthroughTapGestureRecognizer

- (_UIPassthroughTapGestureRecognizer)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPassthroughTapGestureRecognizer.m"), 19, CFSTR("%@ does not support NSCoding"), objc_opt_class());

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPassthroughTapGestureRecognizer.m"), 24, CFSTR("%@ does not support NSCoding"), objc_opt_class());

}

- (void)setState:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPassthroughTapGestureRecognizer;
  -[UIGestureRecognizer setState:](&v5, sel_setState_);
  if (a3 == 3 && (*(_BYTE *)&self->_flags & 1) != 0)
    self->_tapWasCommandModified = 1;
}

- (void)reset
{
  *(_BYTE *)&self->_flags &= ~1u;
  self->_tapWasCommandModified = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPassthroughTapGestureRecognizer;
  -[UITapGestureRecognizer touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | ((-[UIGestureRecognizer modifierFlags](self, "modifierFlags") & 0x100000) != 0);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  if ((-[UIGestureRecognizer modifierFlags](self, "modifierFlags") & 0x100000) == 0)
    *(_BYTE *)&self->_flags &= ~1u;
  v8.receiver = self;
  v8.super_class = (Class)_UIPassthroughTapGestureRecognizer;
  -[UITapGestureRecognizer touchesMoved:withEvent:](&v8, sel_touchesMoved_withEvent_, v7, v6);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  if ((-[UIGestureRecognizer modifierFlags](self, "modifierFlags") & 0x100000) == 0)
    *(_BYTE *)&self->_flags &= ~1u;
  v8.receiver = self;
  v8.super_class = (Class)_UIPassthroughTapGestureRecognizer;
  -[UITapGestureRecognizer touchesEnded:withEvent:](&v8, sel_touchesEnded_withEvent_, v7, v6);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  if ((-[UIGestureRecognizer modifierFlags](self, "modifierFlags") & 0x100000) == 0)
    *(_BYTE *)&self->_flags &= ~1u;
  v8.receiver = self;
  v8.super_class = (Class)_UIPassthroughTapGestureRecognizer;
  -[UITapGestureRecognizer touchesCancelled:withEvent:](&v8, sel_touchesCancelled_withEvent_, v7, v6);

}

- (BOOL)tapWasCommandModified
{
  return self->_tapWasCommandModified;
}

@end
