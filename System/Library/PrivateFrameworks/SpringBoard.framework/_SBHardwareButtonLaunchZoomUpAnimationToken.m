@implementation _SBHardwareButtonLaunchZoomUpAnimationToken

- (_SBHardwareButtonLaunchZoomUpAnimationToken)initWithPreludeAnimating:(id)a3 invalidationBlock:(id)a4
{
  id v8;
  id v9;
  void *v10;
  _SBHardwareButtonLaunchZoomUpAnimationToken *v11;
  _SBHardwareButtonLaunchZoomUpAnimationToken *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BSSimpleAssertion *underlyingAssertion;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHardwareButtonBezelEffectsCoordinator.m"), 615, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coordinator != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHardwareButtonBezelEffectsCoordinator.m"), 616, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationBlock != nil"));

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)_SBHardwareButtonLaunchZoomUpAnimationToken;
  v11 = -[_SBHardwareButtonLaunchZoomUpAnimationToken init](&v23, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bezelEffectsCoordinator, a3);
    v13 = objc_alloc(MEMORY[0x1E0D01868]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __90___SBHardwareButtonLaunchZoomUpAnimationToken_initWithPreludeAnimating_invalidationBlock___block_invoke;
    v21[3] = &unk_1E8EAD8E8;
    v22 = v10;
    v16 = objc_msgSend(v13, "initWithIdentifier:forReason:queue:invalidationBlock:", v15, CFSTR("Zoom Up"), MEMORY[0x1E0C80D38], v21);
    underlyingAssertion = v12->_underlyingAssertion;
    v12->_underlyingAssertion = (BSSimpleAssertion *)v16;

    v12->_valid = 1;
  }

  return v12;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_valid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHardwareButtonBezelEffectsCoordinator.m"), 630, CFSTR("Failed to invalidate (by way of cancel, or triggering completion handler) before deallocation"));

  }
  v5.receiver = self;
  v5.super_class = (Class)_SBHardwareButtonLaunchZoomUpAnimationToken;
  -[_SBHardwareButtonLaunchZoomUpAnimationToken dealloc](&v5, sel_dealloc);
}

- (double)requestedDropletWindowLevel
{
  return self->_requestedWindowLevel;
}

- (CGPoint)preludeAnimationVelocity
{
  double v3;
  double v4;
  void *v6;
  CGPoint result;

  if (!self->_valid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHardwareButtonBezelEffectsCoordinator.m"), 639, CFSTR("Object has been invalidated"));

  }
  -[SBCaptureButtonPreludeAnimatingPrivate preludeAnimationVelocity](self->_bezelEffectsCoordinator, "preludeAnimationVelocity");
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)animatingDroplet
{
  return (id)-[SBCaptureButtonPreludeAnimatingPrivate animatingDroplet](self->_bezelEffectsCoordinator, "animatingDroplet");
}

- (id)animatingDropletContext
{
  return (id)-[SBCaptureButtonPreludeAnimatingPrivate animatingDropletContext](self->_bezelEffectsCoordinator, "animatingDropletContext");
}

- (void)setRequestedDropletWindowLevel:(double)a3
{
  void *v6;

  if (!self->_valid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHardwareButtonBezelEffectsCoordinator.m"), 652, CFSTR("Object has been invalidated"));

  }
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_requestedWindowLevel = a3;
    -[SBCaptureButtonPreludeAnimatingPrivate updateLaunchAnimationWindowLevelBasedOnRequests](self->_bezelEffectsCoordinator, "updateLaunchAnimationWindowLevelBasedOnRequests");
  }
}

- (id)associatedBezelEffectsCoordinator
{
  void *v5;

  if (!self->_valid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHardwareButtonBezelEffectsCoordinator.m"), 660, CFSTR("Object has been invalidated"));

  }
  return self->_bezelEffectsCoordinator;
}

- (BOOL)isHardwareButtonZoomUpAnimationToken
{
  return 1;
}

- (void)invalidate
{
  void *v4;

  if (!self->_valid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHardwareButtonBezelEffectsCoordinator.m"), 671, CFSTR("Can't invalidate twice"));

  }
  self->_valid = 0;
  -[BSSimpleAssertion invalidate](self->_underlyingAssertion, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingAssertion, 0);
  objc_storeStrong((id *)&self->_bezelEffectsCoordinator, 0);
}

@end
