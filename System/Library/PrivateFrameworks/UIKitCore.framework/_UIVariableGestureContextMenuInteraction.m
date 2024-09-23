@implementation _UIVariableGestureContextMenuInteraction

- (BOOL)_presentOnTouchDown
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)didMoveToView:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[_UIVariableGestureContextMenuInteraction _interactionDrivers](self, "_interactionDrivers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContextMenuInteraction setDrivers:](self, "setDrivers:", v5);

  v6.receiver = self;
  v6.super_class = (Class)_UIVariableGestureContextMenuInteraction;
  -[UIContextMenuInteraction didMoveToView:](&v6, sel_didMoveToView_, v4);

}

- (id)_interactionDrivers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v3, "addObject:", v6);

    v5 = (void *)objc_opt_new();
    v12[0] = 4;
    memset(&v12[1], 0, 24);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v12, "{_UIPressTrigger=qqdB}");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTriggers:", v8);

  }
  else
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "addObject:", v4);

    v5 = (void *)objc_opt_new();
  }
  objc_msgSend(v3, "addObject:", v5);

  if (objc_msgSend(v3, "count"))
    v9 = v3;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

- (void)_setPresentOnTouchDown:(BOOL)a3
{
  char flags;
  id v5;

  flags = (char)self->_flags;
  if (((((flags & 1) == 0) ^ a3) & 1) == 0)
  {
    *(_BYTE *)&self->_flags = flags & 0xFE | a3;
    -[_UIVariableGestureContextMenuInteraction _interactionDrivers](self, "_interactionDrivers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UIContextMenuInteraction setDrivers:](self, "setDrivers:", v5);

  }
}

- (_UIVariableGestureContextMenuInteraction)initWithDelegate:(id)a3
{
  _UIVariableGestureContextMenuInteraction *v3;
  _UIVariableGestureContextMenuInteraction *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIVariableGestureContextMenuInteraction;
  v3 = -[UIContextMenuInteraction initWithDelegate:](&v6, sel_initWithDelegate_, a3);
  v4 = v3;
  if (v3)
    -[_UIVariableGestureContextMenuInteraction _setPrefersCompactAppearance:](v3, "_setPrefersCompactAppearance:", 1);
  return v4;
}

- (void)_setPrefersCompactAppearance:(BOOL)a3
{
  self->__prefersCompactAppearance = a3;
}

- (int64_t)menuAppearance
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIVariableGestureContextMenuInteraction;
  v3 = -[UIContextMenuInteraction menuAppearance](&v5, sel_menuAppearance);
  if (-[_UIVariableGestureContextMenuInteraction _prefersCompactAppearance](self, "_prefersCompactAppearance")
    && v3 != 0)
  {
    return 2;
  }
  else
  {
    return (int64_t)v3;
  }
}

- (void)_willBeginWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIVariableGestureContextMenuInteraction;
  -[UIContextMenuInteraction _willBeginWithConfiguration:](&v6, sel__willBeginWithConfiguration_, v4);
  -[UIContextMenuInteraction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_contextMenuInteraction:willBeginWithConfiguration:", self, v4);

}

- (BOOL)_clickPresentationInteractionShouldPlayFeedback:(id)a3
{
  return 0;
}

- (BOOL)_prefersCompactAppearance
{
  return self->__prefersCompactAppearance;
}

@end
