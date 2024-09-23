@implementation SBFluidSwitcherTouchPassThroughScrollView

+ (BOOL)superclassRespondsToVelocityScaleFactor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__SBFluidSwitcherTouchPassThroughScrollView_superclassRespondsToVelocityScaleFactor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (superclassRespondsToVelocityScaleFactor_once != -1)
    dispatch_once(&superclassRespondsToVelocityScaleFactor_once, block);
  return superclassRespondsToVelocityScaleFactor_superclassRespondsToVelocityScaleFactor;
}

uint64_t __84__SBFluidSwitcherTouchPassThroughScrollView_superclassRespondsToVelocityScaleFactor__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "superclass"), "instancesRespondToSelector:", NSSelectorFromString(CFSTR("_velocityScaleFactor")));
  superclassRespondsToVelocityScaleFactor_superclassRespondsToVelocityScaleFactor = result;
  return result;
}

+ (BOOL)superclassRespondsToSetVelocityScaleFactor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__SBFluidSwitcherTouchPassThroughScrollView_superclassRespondsToSetVelocityScaleFactor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (superclassRespondsToSetVelocityScaleFactor_once != -1)
    dispatch_once(&superclassRespondsToSetVelocityScaleFactor_once, block);
  return superclassRespondsToSetVelocityScaleFactor_superclassRespondsToSetVelocityScaleFactor;
}

uint64_t __87__SBFluidSwitcherTouchPassThroughScrollView_superclassRespondsToSetVelocityScaleFactor__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "superclass"), "instancesRespondToSelector:", NSSelectorFromString(CFSTR("_setVelocityScaleFactor:")));
  superclassRespondsToSetVelocityScaleFactor_superclassRespondsToSetVelocityScaleFactor = result;
  return result;
}

- (double)velocityScaleFactor
{
  double result;
  objc_super v4;

  if (!objc_msgSend((id)objc_opt_class(), "superclassRespondsToVelocityScaleFactor"))
    return 0.001;
  v4.receiver = self;
  v4.super_class = (Class)SBFluidSwitcherTouchPassThroughScrollView;
  -[SBFluidSwitcherTouchPassThroughScrollView _velocityScaleFactor](&v4, sel__velocityScaleFactor);
  return result;
}

- (void)setVelocityScaleFactor:(double)a3
{
  objc_super v5;

  if (objc_msgSend((id)objc_opt_class(), "superclassRespondsToSetVelocityScaleFactor"))
  {
    v5.receiver = self;
    v5.super_class = (Class)SBFluidSwitcherTouchPassThroughScrollView;
    -[SBFluidSwitcherTouchPassThroughScrollView _setVelocityScaleFactor:](&v5, sel__setVelocityScaleFactor_, a3);
  }
}

@end
