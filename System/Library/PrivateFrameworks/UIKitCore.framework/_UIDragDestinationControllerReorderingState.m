@implementation _UIDragDestinationControllerReorderingState

- (void)didReorder
{
  uint64_t v2;
  void *v3;

  ++a1[3];
  a1[7] = 0;
  if (!a1[8])
  {
    a1[8] = 1;
    objc_msgSend(a1, "_reorderCadenceSettings");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)a1[4];
    a1[4] = v2;

  }
}

- (void)reorderResetToStartingLocation
{
  self->_reorderCount = 0;
}

- (id)_reorderCadenceSettings
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  _UIDragMovementCadenceSettings *v7;

  -[_UIDragDestinationControllerReorderingState collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "reorderingCadence");

  v5 = 0.0;
  if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD75F50, (uint64_t)CFSTR("DraggingCadenceVelocityThreshold")))v6 = 0.0;
  else
    v6 = *(double *)&qword_1ECD75F58;
  if (!_UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_901, (uint64_t)CFSTR("DraggingCadenceDwellTimeThreshold")))v5 = *(double *)&qword_1ECD75F48;
  if (v6 == 0.0 && v5 == 0.0)
  {
    +[_UIDragMovementCadenceSettings defaultSettingsForMovementPhase:cadence:](_UIDragMovementCadenceSettings, "defaultSettingsForMovementPhase:cadence:", -[_UIDragDestinationControllerReorderingState dragMovementPhase](self, "dragMovementPhase"), v4);
    v7 = (_UIDragMovementCadenceSettings *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = -[_UIDragMovementCadenceSettings initWithVelocityMagnitudeThreshold:dwellTimeThreshold:]([_UIDragMovementCadenceSettings alloc], "initWithVelocityMagnitudeThreshold:dwellTimeThreshold:", v6, v5);
  }
  return v7;
}

- (void)setVelocityIntegrator:(id)a3
{
  objc_storeStrong((id *)&self->_velocityIntegrator, a3);
}

- (void)setReorderCount:(int64_t)a3
{
  self->_reorderCount = a3;
}

- (void)setReorderCadenceSettings:(id)a3
{
  objc_storeStrong((id *)&self->_reorderCadenceSettings, a3);
}

- (void)setHasStartedInteractiveReorder:(BOOL)a3
{
  self->_hasStartedInteractiveReorder = a3;
}

- (_UIDragDestinationControllerSessionState)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(id)a3
{
  objc_storeStrong((id *)&self->_sessionState, a3);
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (double)reorderBecamePossibleTime
{
  return self->_reorderBecamePossibleTime;
}

- (void)setReorderBecamePossibleTime:(double)a3
{
  self->_reorderBecamePossibleTime = a3;
}

- (int64_t)dragMovementPhase
{
  return self->_dragMovementPhase;
}

- (void)setDragMovementPhase:(int64_t)a3
{
  self->_dragMovementPhase = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_reorderCadenceSettings, 0);
  objc_storeStrong((id *)&self->_velocityIntegrator, 0);
}

@end
