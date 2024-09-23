@implementation SBEmbeddedKeyboardFocusCoalition

- (SBEmbeddedKeyboardFocusCoalition)init
{
  SBEmbeddedKeyboardFocusCoalition *v2;
  SBKeyboardFocusCoalitionPolicyEnforcer *v3;
  SBSystemKeyCommandCoalitionPolicyEnforcer *v4;
  SBCameraButtonPolicyEnforcer *v5;
  SBKeyboardFocusPolicyEnforcerPipeline *v6;
  void *v7;
  SBKeyboardFocusPolicyEnforcerPipeline *v8;
  objc_super v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)SBEmbeddedKeyboardFocusCoalition;
  v2 = -[SBKeyboardFocusCoalition _initWithDebugName:](&v10, sel__initWithDebugName_, CFSTR("embedded coalition"));
  if (v2)
  {
    v3 = objc_alloc_init(SBKeyboardFocusCoalitionPolicyEnforcer);
    v4 = objc_alloc_init(SBSystemKeyCommandCoalitionPolicyEnforcer);
    v5 = objc_alloc_init(SBCameraButtonPolicyEnforcer);
    v6 = [SBKeyboardFocusPolicyEnforcerPipeline alloc];
    v11[0] = v3;
    v11[1] = v4;
    v11[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBKeyboardFocusPolicyEnforcerPipeline initWithEnforcers:](v6, "initWithEnforcers:", v7);

    -[SBKeyboardFocusCoalition setPolicyEnforcer:](v2, "setPolicyEnforcer:", v8);
  }
  return v2;
}

@end
