@implementation TRAArbiterUpdateContext

- (TRASettingsActuationContext)orientationActuationContext
{
  return self->_orientationActuationContext;
}

- (NSArray)requestingParticipantsUniqueIdentifiers
{
  return self->_requestingParticipantsUniqueIdentifiers;
}

- (BOOL)_hasDefaultOrientationActuationContext
{
  return self->__hasDefaultOrientationActuationContext;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)forceOrientationResolution
{
  return self->_forceOrientationResolution;
}

- (TRAArbiterUpdateContext)initWithBuilder:(id)a3
{
  void (**v5)(id, TRAArbiterUpdateContext *);
  TRAArbiterUpdateContext *v6;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_super v12;

  v5 = (void (**)(id, TRAArbiterUpdateContext *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbiter.m"), 519, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builderBlock"));

  }
  v12.receiver = self;
  v12.super_class = (Class)TRAArbiterUpdateContext;
  v6 = -[TRAArbiterUpdateContext init](&v12, sel_init);
  if (v6)
  {
    v5[2](v5, v6);
    if (!v6->_reason)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("TRAArbiter.m"), 523, CFSTR("%@ was built without specifying a reason."), v11);

    }
  }

  return v6;
}

- (void)_setDrawingConfigurationProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  TRASettingsActuationContext *v7;
  TRASettingsActuationContext *orientationActuationContext;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__drawingConfigProvider);

  v5 = v9;
  if (WeakRetained != v9 && !self->_orientationActuationContext)
  {
    objc_msgSend(v9, "defaultOrientationAnimationSettingsAnimatable:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TRASettingsActuationContext initWithAnimationSettings:drawingFence:]([TRASettingsActuationContext alloc], "initWithAnimationSettings:drawingFence:", v6, 0);
    orientationActuationContext = self->_orientationActuationContext;
    self->_orientationActuationContext = v7;

    self->__hasDefaultOrientationActuationContext = 1;
    v5 = v9;
  }

}

- (void)setReason:(id)a3
{
  NSString *v4;
  NSString *reason;

  if (self->_reason != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    reason = self->_reason;
    self->_reason = v4;

  }
}

- (void)setRequestingParticipantsUniqueIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setOrientationActuationContext:(id)a3
{
  TRASettingsActuationContext *v4;
  TRASettingsActuationContext *orientationActuationContext;

  if (self->_orientationActuationContext != a3)
  {
    v4 = (TRASettingsActuationContext *)objc_msgSend(a3, "copy");
    orientationActuationContext = self->_orientationActuationContext;
    self->_orientationActuationContext = v4;

    self->__hasDefaultOrientationActuationContext = 0;
  }
}

- (void)setForceOrientationResolution:(BOOL)a3
{
  self->_forceOrientationResolution = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__drawingConfigProvider);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_requestingParticipantsUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleActuationContext, 0);
  objc_storeStrong((id *)&self->_orientationActuationContext, 0);
}

- (TRASettingsActuationContext)userInterfaceStyleActuationContext
{
  return self->_userInterfaceStyleActuationContext;
}

- (void)setUserInterfaceStyleActuationContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)hasAnyActuationContext
{
  return self->_orientationActuationContext || self->_userInterfaceStyleActuationContext != 0;
}

- (NSString)debugDescription
{
  return (NSString *)-[TRAArbiterUpdateContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAArbiterUpdateContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAArbiterUpdateContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  -[TRAArbiterUpdateContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", self->_reason, CFSTR("reason"));
  -[TRAArbiterUpdateContext requestingParticipantsUniqueIdentifiers](self, "requestingParticipantsUniqueIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v5, CFSTR("Requesting Participants"), 0);

  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_userInterfaceStyleActuationContext, CFSTR("UserInterfaceStyle actuation context"));
  v7 = (id)objc_msgSend(v4, "appendBool:withName:", self->_forceOrientationResolution, CFSTR("Force Orientation resolution"));
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", self->_orientationActuationContext, CFSTR("Orientation actuation context"));
  return v4;
}

- (TRAArbiterDrawingDataSource)_drawingConfigProvider
{
  return (TRAArbiterDrawingDataSource *)objc_loadWeakRetained((id *)&self->__drawingConfigProvider);
}

@end
