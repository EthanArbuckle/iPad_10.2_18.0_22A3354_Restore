@implementation _UIDragMovementCadenceSettings

- (_UIDragMovementCadenceSettings)initWithMovementPhase:(int64_t)a3 cadence:(int64_t)a4
{
  _UIDragMovementCadenceSettings *v7;
  _UIDragMovementCadenceSettings *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIDragMovementCadenceSettings;
  v7 = -[_UIDragMovementCadenceSettings init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    if (a3 == 1)
    {
      -[_UIDragMovementCadenceSettings _applyDragPlaceholderSubsequentPhaseDefaultsForCadence:](v7, "_applyDragPlaceholderSubsequentPhaseDefaultsForCadence:", a4);
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("_UIDragMovementCadenceSettings.m"), 31, CFSTR("Unhandled movement phase."));

    }
    else
    {
      -[_UIDragMovementCadenceSettings _applyDragPlaceholderInitialPhaseDefaultsForCadence:](v7, "_applyDragPlaceholderInitialPhaseDefaultsForCadence:", a4);
    }
  }
  return v8;
}

+ (id)defaultSettingsForMovementPhase:(int64_t)a3 cadence:(int64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMovementPhase:cadence:", a3, a4);
}

- (_UIDragMovementCadenceSettings)initWithVelocityMagnitudeThreshold:(double)a3 dwellTimeThreshold:(double)a4
{
  _UIDragMovementCadenceSettings *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIDragMovementCadenceSettings;
  result = -[_UIDragMovementCadenceSettings init](&v7, sel_init);
  if (result)
  {
    result->_velocityMagnitudeThreshold = a3;
    result->_dwellTimeThreshold = a4;
  }
  return result;
}

- (void)_applyDragPlaceholderInitialPhaseDefaultsForCadence:(int64_t)a3
{
  double v4;

  switch(a3)
  {
    case 2:
      -[_UIDragMovementCadenceSettings setDwellTimeThreshold:](self, "setDwellTimeThreshold:", 0.12);
      v4 = 200.0;
LABEL_7:
      -[_UIDragMovementCadenceSettings setVelocityMagnitudeThreshold:](self, "setVelocityMagnitudeThreshold:", v4);
      return;
    case 1:
      -[_UIDragMovementCadenceSettings setDwellTimeThreshold:](self, "setDwellTimeThreshold:", 0.06);
      v4 = 350.0;
      goto LABEL_7;
    case 0:
      -[_UIDragMovementCadenceSettings _applyImmediateSettings](self, "_applyImmediateSettings");
      break;
  }
}

- (void)_applyDragPlaceholderSubsequentPhaseDefaultsForCadence:(int64_t)a3
{
  double v4;
  double v5;

  if (a3 == 2 || a3 == 1)
  {
    -[_UIDragMovementCadenceSettings _applyDragPlaceholderInitialPhaseDefaultsForCadence:](self, "_applyDragPlaceholderInitialPhaseDefaultsForCadence:");
    -[_UIDragMovementCadenceSettings dwellTimeThreshold](self, "dwellTimeThreshold");
    -[_UIDragMovementCadenceSettings setDwellTimeThreshold:](self, "setDwellTimeThreshold:", v4 * 0.5);
    -[_UIDragMovementCadenceSettings velocityMagnitudeThreshold](self, "velocityMagnitudeThreshold");
    -[_UIDragMovementCadenceSettings setVelocityMagnitudeThreshold:](self, "setVelocityMagnitudeThreshold:", v5 + v5);
  }
  else if (!a3)
  {
    -[_UIDragMovementCadenceSettings _applyImmediateSettings](self, "_applyImmediateSettings");
  }
}

- (void)_applyInteractiveReorderInitialPhaseDefaultsForCadence:(int64_t)a3
{
  double v4;

  switch(a3)
  {
    case 2:
      -[_UIDragMovementCadenceSettings setDwellTimeThreshold:](self, "setDwellTimeThreshold:", 0.15);
      v4 = 200.0;
LABEL_7:
      -[_UIDragMovementCadenceSettings setVelocityMagnitudeThreshold:](self, "setVelocityMagnitudeThreshold:", v4);
      return;
    case 1:
      -[_UIDragMovementCadenceSettings setDwellTimeThreshold:](self, "setDwellTimeThreshold:", 0.075);
      v4 = 400.0;
      goto LABEL_7;
    case 0:
      -[_UIDragMovementCadenceSettings _applyImmediateSettings](self, "_applyImmediateSettings");
      break;
  }
}

- (void)_applyInteractiveReorderSubsequentPhaseDefaultsForCadence:(int64_t)a3
{
  double v4;
  double v5;

  if (a3 == 2 || a3 == 1)
  {
    -[_UIDragMovementCadenceSettings _applyInteractiveReorderInitialPhaseDefaultsForCadence:](self, "_applyInteractiveReorderInitialPhaseDefaultsForCadence:");
    -[_UIDragMovementCadenceSettings dwellTimeThreshold](self, "dwellTimeThreshold");
    -[_UIDragMovementCadenceSettings setDwellTimeThreshold:](self, "setDwellTimeThreshold:", v4 * 0.5);
    -[_UIDragMovementCadenceSettings velocityMagnitudeThreshold](self, "velocityMagnitudeThreshold");
    -[_UIDragMovementCadenceSettings setVelocityMagnitudeThreshold:](self, "setVelocityMagnitudeThreshold:", v5 + v5);
  }
  else if (!a3)
  {
    -[_UIDragMovementCadenceSettings _applyImmediateSettings](self, "_applyImmediateSettings");
  }
}

- (void)_applyImmediateSettings
{
  -[_UIDragMovementCadenceSettings setDwellTimeThreshold:](self, "setDwellTimeThreshold:", 0.0);
  -[_UIDragMovementCadenceSettings setVelocityMagnitudeThreshold:](self, "setVelocityMagnitudeThreshold:", 1.79769313e308);
}

- (double)velocityMagnitudeThreshold
{
  return self->_velocityMagnitudeThreshold;
}

- (void)setVelocityMagnitudeThreshold:(double)a3
{
  self->_velocityMagnitudeThreshold = a3;
}

- (double)dwellTimeThreshold
{
  return self->_dwellTimeThreshold;
}

- (void)setDwellTimeThreshold:(double)a3
{
  self->_dwellTimeThreshold = a3;
}

@end
