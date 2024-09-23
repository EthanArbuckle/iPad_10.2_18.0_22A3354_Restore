@implementation SBPIPBehaviorOverrideAssertion

- (SBPIPBehaviorOverrideAssertion)initWithReason:(int64_t)a3 identifier:(id)a4 cameraSensorAttributionBundleIdentifier:(id)a5 invalidationBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  SBPIPBehaviorOverrideAssertion *v14;
  uint64_t v15;
  NSString *cameraSensorAttributionBundleIdentifier;
  void *v18;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPControllerOverrideAssertions.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason != SBPIPBehaviorOverrideReasonNone"));

  }
  v14 = -[SBPIPBehaviorOverrideAssertion initWithReason:identifier:invalidationBlock:](self, "initWithReason:identifier:invalidationBlock:", a3, v11, v13);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    cameraSensorAttributionBundleIdentifier = v14->_cameraSensorAttributionBundleIdentifier;
    v14->_cameraSensorAttributionBundleIdentifier = (NSString *)v15;

  }
  return v14;
}

- (SBPIPBehaviorOverrideAssertion)initWithReason:(int64_t)a3 identifier:(id)a4 invalidationBlock:(id)a5
{
  __CFString *v6;
  objc_super v8;

  if ((unint64_t)a3 > 9)
    v6 = 0;
  else
    v6 = off_1E8EB74F0[a3];
  v8.receiver = self;
  v8.super_class = (Class)SBPIPBehaviorOverrideAssertion;
  return -[BSSimpleAssertion initWithIdentifier:forReason:queue:invalidationBlock:](&v8, sel_initWithIdentifier_forReason_queue_invalidationBlock_, a4, v6, MEMORY[0x1E0C80D38], a5);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPIPBehaviorOverrideAssertion;
  -[BSSimpleAssertion descriptionBuilderWithMultilinePrefix:](&v7, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPIPBehaviorOverrideAssertion cameraSensorAttributionBundleIdentifier](self, "cameraSensorAttributionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", v5, CFSTR("camera sensor bundle identifier"), 1);

  return v4;
}

- (NSString)cameraSensorAttributionBundleIdentifier
{
  return self->_cameraSensorAttributionBundleIdentifier;
}

- (int64_t)behaviorOverrideReason
{
  void *v2;
  int64_t v3;

  -[BSSimpleAssertion reason](self, "reason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SBPIPStashStateOverrideReasonForString(v2);

  return v3;
}

- (SBPIPBehaviorOverrideAssertion)initWithReason:(int64_t)a3 invalidationBlock:(id)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  SBPIPBehaviorOverrideAssertion *v9;

  v6 = a4;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBPIPBehaviorOverrideAssertion initWithReason:identifier:invalidationBlock:](self, "initWithReason:identifier:invalidationBlock:", a3, v8, v6);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraSensorAttributionBundleIdentifier, 0);
}

@end
