@implementation _UIWindowRotationAnimationController

- (id)animations
{
  return self->_animations;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animations, 0);
}

- (void)setAnimations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setUpdateStatusBarIfNecessary:(BOOL)a3
{
  self->_updateStatusBarIfNecessary = a3;
}

- (void)setSkipCallbacks:(BOOL)a3
{
  self->_skipCallbacks = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  BOOL v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  id v16;
  id v17;
  void (**v18)(void *, uint64_t);
  int v19;
  int v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD aBlock[5];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  BOOL v33;
  BOOL v34;

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIWindowRotationAnimationController transitionDuration:](self, "transitionDuration:", v4);
  v7 = v6;
  v8 = -[_UIWindowRotationAnimationController skipCallbacks](self, "skipCallbacks");
  v9 = -[_UIWindowRotationAnimationController updateStatusBarIfNecessary](self, "updateStatusBarIfNecessary");
  v10 = objc_msgSend(v5, "_toWindowOrientation");
  v11 = objc_msgSend((id)UIApp, "_safeInterfaceOrientationForWindowIfExists:", v5);
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58___UIWindowRotationAnimationController_animateTransition___block_invoke;
  aBlock[3] = &unk_1E16C2CD0;
  aBlock[4] = self;
  v27 = v4;
  v13 = v5;
  v33 = v8;
  v28 = v13;
  v30 = v10;
  v31 = v11;
  v34 = v9;
  v14 = v27;
  v29 = v14;
  v32 = v7;
  v15 = (void (**)(_QWORD))_Block_copy(aBlock);
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __58___UIWindowRotationAnimationController_animateTransition___block_invoke_4;
  v23[3] = &unk_1E16B2B40;
  v23[4] = self;
  v16 = v14;
  v24 = v16;
  v17 = v13;
  v25 = v17;
  v18 = (void (**)(void *, uint64_t))_Block_copy(v23);
  if (objc_msgSend(v16, "isAnimated"))
  {
    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v19 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar < 1)
      goto LABEL_5;
    v20 = _UIInternalPreference_120HzRotationEnabled;
    if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_120HzRotationEnabled)
      goto LABEL_5;
    while (v19 >= v20)
    {
      _UIInternalPreferenceSync(v19, &_UIInternalPreference_120HzRotationEnabled, (uint64_t)CFSTR("120HzRotationEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      v20 = _UIInternalPreference_120HzRotationEnabled;
      if (v19 == _UIInternalPreference_120HzRotationEnabled)
        goto LABEL_5;
    }
    if (byte_1EDDA7F24)
    {
LABEL_5:
      v21[0] = v12;
      v21[1] = 3221225472;
      v21[2] = __58___UIWindowRotationAnimationController_animateTransition___block_invoke_6;
      v21[3] = &unk_1E16B1BF8;
      v22 = v15;
      v15 = (void (**)(_QWORD))_Block_copy(v21);

    }
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v15, v18, v7, 0.0);
    objc_msgSend(v16, "_setTransitionIsInFlight:", 1);
  }
  else
  {
    v15[2](v15);
    v18[2](v18, 1);
  }

}

- (BOOL)skipCallbacks
{
  return self->_skipCallbacks;
}

- (BOOL)updateStatusBarIfNecessary
{
  return self->_updateStatusBarIfNecessary;
}

- (double)transitionDuration:(id)a3
{
  return self->_duration;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIWindowRotationAnimationController setAnimations:](self, "setAnimations:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_UIWindowRotationAnimationController;
  -[_UIWindowRotationAnimationController dealloc](&v3, sel_dealloc);
}

- (double)duration
{
  return self->_duration;
}

@end
