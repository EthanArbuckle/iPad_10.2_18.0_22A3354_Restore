@implementation UIAnimatorScreenLink

uint64_t __52__UIAnimatorScreenLink_startTimerWithScreen_action___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
}

- (void)invalidate
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;
  _UIUpdateSequenceItemInternal *updateSequenceItem;
  int v6;

  self->_animationCount = 0;
  displayLink = self->_displayLink;
  if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v4 = self->_displayLink;
    self->_displayLink = 0;

  }
  if (_UIUpdateCycleEnabled())
  {
    updateSequenceItem = self->_updateSequenceItem;
    if (updateSequenceItem)
    {
      v6 = *((_DWORD *)updateSequenceItem + 6);
      if ((v6 & 1) != 0)
        *((_DWORD *)updateSequenceItem + 6) = v6 | 2;
      else
        _removeItem(updateSequenceItem);
      self->_updateSequenceItem = 0;
      _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, _animatorUpdateRequest, 0x10002Au);
    }
  }
}

- (unsigned)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(unsigned __int16)a3
{
  self->_animationCount = a3;
}

+ (id)startTimerWithScreen:(id)a3 action:(id)a4
{
  id v5;
  id v6;
  UIAnimatorScreenLink *v7;
  void *v8;
  id updateAction;
  CADisplayLink *displayLink;
  void *v11;
  uint64_t v12;
  CADisplayLink *v13;
  void *v14;
  _QWORD v16[4];
  UIAnimatorScreenLink *v17;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(UIAnimatorScreenLink);
  v8 = _Block_copy(v6);

  updateAction = v7->_updateAction;
  v7->_updateAction = v8;

  v7->_animationCount = 1;
  if (_UIUpdateCycleEnabled() && objc_msgSend(v5, "_isEmbeddedScreen"))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __52__UIAnimatorScreenLink_startTimerWithScreen_action___block_invoke;
    v16[3] = &unk_1E16B40A8;
    v17 = v7;
    v17->_updateSequenceItem = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceInsertItem(_UIUpdateSequenceCADisplayLinksItemInternal, 1, (uint64_t)"UIAnimation", 0, 0, v16);
    _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, _animatorUpdateRequest, 0x10002Au);
    displayLink = (CADisplayLink *)v17;
  }
  else
  {
    if (v5)
      v11 = v5;
    else
      v11 = (void *)MEMORY[0x1E0CD2730];
    objc_msgSend(v11, "displayLinkWithTarget:selector:", v7, sel_onDisplayLink_);
    v12 = objc_claimAutoreleasedReturnValue();
    displayLink = v7->_displayLink;
    v7->_displayLink = (CADisplayLink *)v12;
  }

  v13 = v7->_displayLink;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v13, "addToRunLoop:forMode:", v14, *MEMORY[0x1E0C99860]);

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateAction, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[UIAnimatorScreenLink invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UIAnimatorScreenLink;
  -[UIAnimatorScreenLink dealloc](&v3, sel_dealloc);
}

- (void)onDisplayLink:(id)a3
{
  void (**updateAction)(id);

  updateAction = (void (**)(id))self->_updateAction;
  objc_msgSend(a3, "timestamp");
  updateAction[2](updateAction);
}

@end
