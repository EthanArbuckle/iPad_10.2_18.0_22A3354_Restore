@implementation SBDashBoardCaptureLaunchDestination

+ (id)new
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_launchDestinationWithPlacement_entity_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBDashBoardCaptureLaunchPolicy.m"), 27, CFSTR("%s is unavailable; use %@ instead"),
    "+[SBDashBoardCaptureLaunchDestination new]",
    v5);

  return 0;
}

- (SBDashBoardCaptureLaunchDestination)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithPlacement_entity_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDashBoardCaptureLaunchPolicy.m"), 31, CFSTR("%s is unavailable; use %@ instead"),
    "-[SBDashBoardCaptureLaunchDestination init]",
    v5);

  return 0;
}

+ (id)launchDestinationWithPlacement:(id)a3 entity:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPlacement:entity:", v7, v6);

  return v8;
}

- (SBDashBoardCaptureLaunchDestination)initWithPlacement:(id)a3 entity:(id)a4
{
  id v7;
  id v8;
  SBDashBoardCaptureLaunchDestination *v9;
  SBDashBoardCaptureLaunchDestination *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBDashBoardCaptureLaunchDestination;
  v9 = -[SBDashBoardCaptureLaunchDestination init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placement, a3);
    objc_storeStrong((id *)&v10->_entity, a4);
  }

  return v10;
}

- (NSString)placement
{
  return self->_placement;
}

- (CSHostableEntity)entity
{
  return self->_entity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_placement, 0);
}

@end
