@implementation TRASettingsActuationContext

- (TRASettingsActuationContext)initWithAnimationSettings:(id)a3 drawingFence:(id)a4 preventTouchCancellation:(BOOL)a5
{
  id v8;
  id v9;
  TRASettingsActuationContext *v10;
  TRASettingsActuationContext *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TRASettingsActuationContext;
  v10 = -[TRASettingsActuationContext init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_preventTouchCancellation = a5;
    -[TRASettingsActuationContext setAnimationSettings:](v10, "setAnimationSettings:", v8);
    objc_storeStrong(&v11->_drawingFence, a4);
  }

  return v11;
}

- (void)setAnimationSettings:(id)a3
{
  BSAnimationSettings *v4;
  BSAnimationSettings *v5;
  BSAnimationSettings *animationSettings;
  BSAnimationSettings *v7;

  v4 = (BSAnimationSettings *)a3;
  if (!v4)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x24BE0BD98], "settingsWithDuration:", 0.0);
    v5 = (BSAnimationSettings *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (self->_animationSettings != v4)
  {
    v7 = v4;
    v5 = (BSAnimationSettings *)-[BSAnimationSettings copy](v4, "copy");
LABEL_5:
    animationSettings = self->_animationSettings;
    self->_animationSettings = v5;

    v4 = v7;
  }

}

- (TRASettingsActuationContext)initWithAnimationSettings:(id)a3 drawingFence:(id)a4
{
  return -[TRASettingsActuationContext initWithAnimationSettings:drawingFence:preventTouchCancellation:](self, "initWithAnimationSettings:drawingFence:preventTouchCancellation:", a3, a4, 0);
}

- (id)drawingFence
{
  return self->_drawingFence;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_drawingFence, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

- (BOOL)preventTouchCancellation
{
  return self->_preventTouchCancellation;
}

- (BSAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (TRASettingsActuationContext)initWithSettingsActuationContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  TRASettingsActuationContext *v9;

  v4 = a3;
  objc_msgSend(v4, "animationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE0BD98], "settingsWithDuration:", 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "drawingFence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "preventTouchCancellation");

  v9 = -[TRASettingsActuationContext initWithAnimationSettings:drawingFence:preventTouchCancellation:](self, "initWithAnimationSettings:drawingFence:preventTouchCancellation:", v6, v7, v8);
  if (!v5)

  return v9;
}

- (TRASettingsActuationContext)init
{
  return -[TRASettingsActuationContext initWithAnimationSettings:drawingFence:preventTouchCancellation:](self, "initWithAnimationSettings:drawingFence:preventTouchCancellation:", 0, 0, 0);
}

- (BOOL)isEqualToSettingsActuationContext:(id)a3
{
  TRASettingsActuationContext *v5;
  BSAnimationSettings *animationSettings;
  void *v7;
  id drawingFence;
  void *v9;
  _BOOL4 preventTouchCancellation;
  BOOL v11;
  void *v13;

  v5 = (TRASettingsActuationContext *)a3;
  if (!v5)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRASettings.m"), 690, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settingsActuationContext == nil || [settingsActuationContext isKindOfClass:[TRASettingsActuationContext class]]"));

  }
  if (self == v5)
  {
    v11 = 1;
    goto LABEL_10;
  }
  animationSettings = self->_animationSettings;
  -[TRASettingsActuationContext animationSettings](v5, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(animationSettings) = -[BSAnimationSettings isEqual:](animationSettings, "isEqual:", v7);

  if (!(_DWORD)animationSettings)
    goto LABEL_8;
  drawingFence = self->_drawingFence;
  -[TRASettingsActuationContext drawingFence](v5, "drawingFence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(drawingFence) = objc_msgSend(drawingFence, "isEqual:", v9);

  if ((_DWORD)drawingFence)
  {
    preventTouchCancellation = self->_preventTouchCancellation;
    v11 = preventTouchCancellation == -[TRASettingsActuationContext preventTouchCancellation](v5, "preventTouchCancellation");
  }
  else
  {
LABEL_8:
    v11 = 0;
  }
LABEL_10:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  TRASettingsActuationContext *v4;
  BOOL v5;

  v4 = (TRASettingsActuationContext *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TRASettingsActuationContext isEqualToSettingsActuationContext:](self, "isEqualToSettingsActuationContext:", v4);
  }

  return v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRASettingsActuationContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAnimationSettings duration](self->_animationSettings, "duration");
  v4 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", CFSTR("animation duration"), 1);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_drawingFence, CFSTR("drawing fence"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRASettingsActuationContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setDrawingFence:(id)a3
{
  objc_storeStrong(&self->_drawingFence, a3);
}

@end
