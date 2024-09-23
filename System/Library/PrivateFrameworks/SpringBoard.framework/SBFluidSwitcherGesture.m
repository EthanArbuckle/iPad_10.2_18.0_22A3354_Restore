@implementation SBFluidSwitcherGesture

- (SBFluidSwitcherGesture)initWithType:(int64_t)a3 eventProvider:(id)a4
{
  id v7;
  SBFluidSwitcherGesture *v8;
  SBFluidSwitcherGesture *v9;
  uint64_t v10;
  id eventProvider;
  void *v13;
  objc_super v14;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherGesture.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventProvider"));

  }
  v14.receiver = self;
  v14.super_class = (Class)SBFluidSwitcherGesture;
  v8 = -[SBFluidSwitcherGesture init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    v10 = objc_msgSend(v7, "copy");
    eventProvider = v9->_eventProvider;
    v9->_eventProvider = (id)v10;

    v9->_state = 1;
  }

  return v9;
}

- (id)gestureEvent
{
  void *v4;
  void *v6;

  (*((void (**)(void))self->_eventProvider + 2))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherGesture.m"), 107, CFSTR("The event provider must return a gesture event."));

  }
  return v4;
}

- (id)studyLogData
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  if (self->_gestureRecognizerForStudyLog)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_gestureRecognizerForStudyLog);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("address"));

    -[UIGestureRecognizer name](self->_gestureRecognizerForStudyLog, "name");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (const __CFString *)v5;
    else
      v7 = &stru_1E8EC7EC0;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("name"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[UIGestureRecognizer state](self->_gestureRecognizerForStudyLog, "state"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("state"));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSString)description
{
  return (NSString *)-[SBFluidSwitcherGesture descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFluidSwitcherGesture succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFluidSwitcherGesture descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBFluidSwitcherGesture *v11;

  v4 = a3;
  -[SBFluidSwitcherGesture succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__SBFluidSwitcherGesture_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

uint64_t __64__SBFluidSwitcherGesture_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  __CFString *v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) - 1;
  if (v3 > 0xA)
    v4 = 0;
  else
    v4 = off_1E8EA9220[v3];
  return objc_msgSend(v2, "appendString:withName:", v4, CFSTR("type"));
}

- (int64_t)state
{
  return self->_state;
}

- (void)_setState:(int64_t)a3
{
  self->_state = a3;
}

- (SBAppLayout)selectedAppLayout
{
  return self->_selectedAppLayout;
}

- (void)_setSelectedAppLayout:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAppLayout, a3);
}

- (UIGestureRecognizer)gestureRecognizerForStudyLog
{
  return self->_gestureRecognizerForStudyLog;
}

- (void)_setGestureRecognizerForStudyLog:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizerForStudyLog, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)selectedLayoutRole
{
  return self->_selectedLayoutRole;
}

- (void)_setSelectedLayoutRole:(int64_t)a3
{
  self->_selectedLayoutRole = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizerForStudyLog, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong(&self->_eventProvider, 0);
}

@end
