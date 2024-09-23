@implementation SBDisplayControllerInfo

- (SBDisplayControllerInfo)initWithController:(id)a3 windowingMode:(int64_t)a4 priorityLevel:(unint64_t)a5 deactivationReasons:(unint64_t)a6
{
  id v12;
  SBDisplayControllerInfo *v13;
  SBDisplayControllerInfo *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayControlling.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayController"));

  }
  if (!SBDisplayAssertionLevelIsValid(a5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayControlling.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("SBDisplayAssertionLevelIsValid(priorityLevel)"));

  }
  v18.receiver = self;
  v18.super_class = (Class)SBDisplayControllerInfo;
  v13 = -[SBDisplayControllerInfo init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_displayController, a3);
    v14->_windowingMode = a4;
    v14->_priorityLevel = a5;
    v14->_deactivationReasons = a6;
  }

  return v14;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_displayController, CFSTR("displayController"));
  SBDisplayWindowingModeDescription(self->_windowingMode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("windowingMode"));

  SBDisplayAssertionLevelDescription(self->_priorityLevel);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("priorityLevel"));

  UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("deactivationReasons"));

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (SBDisplayControlling)displayController
{
  return self->_displayController;
}

- (int64_t)windowingMode
{
  return self->_windowingMode;
}

- (unint64_t)priorityLevel
{
  return self->_priorityLevel;
}

- (unint64_t)deactivationReasons
{
  return self->_deactivationReasons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayController, 0);
}

@end
