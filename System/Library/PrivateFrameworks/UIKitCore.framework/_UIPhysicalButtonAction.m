@implementation _UIPhysicalButtonAction

+ (char)_actionFromPhysicalButtonBSAction:(uint64_t)a3 andDriver:
{
  uint64_t v5;
  _UIPhysicalButtonAction *v6;
  char *v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  int64x2_t v12;
  uint64_t v14;
  void *v15;
  objc_super v16;

  v5 = objc_opt_self();
  if (!a2)
  {
    v14 = v5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__actionFromPhysicalButtonBSAction_andDriver_, v14, CFSTR("_UIPhysicalButtonInteraction.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("physicalButtonBSAction"));

  }
  v6 = [_UIPhysicalButtonAction alloc];
  if (v6)
  {
    v16.receiver = v6;
    v16.super_class = (Class)_UIPhysicalButtonAction;
    v7 = (char *)objc_msgSendSuper2(&v16, sel_init);
    v8 = objc_msgSend(a2, "button");
    if (v7)
    {
      *((_QWORD *)v7 + 1) = v8;
      *((_QWORD *)v7 + 2) = objc_msgSend(a2, "state");
      *((_QWORD *)v7 + 3) = objc_msgSend(a2, "behavior");
      *((_QWORD *)v7 + 4) = a3;
      *((CFTimeInterval *)v7 + 5) = CACurrentMediaTime();
      objc_storeStrong((id *)v7 + 6, 0);
      v9 = 0;
      *(int64x2_t *)(v7 + 56) = vdupq_n_s64(1uLL);
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(a2, "button");
  }
  objc_msgSend(a2, "state");
  objc_msgSend(a2, "behavior");
  CACurrentMediaTime();
  v7 = 0;
  v9 = 1;
LABEL_6:
  v10 = objc_msgSend(a2, "state");
  if ((v9 & 1) == 0)
  {
    if (v10 >= 4)
      v11 = 1;
    else
      v11 = v10;
    *((_QWORD *)v7 + 9) = v11;
    v12 = vdupq_n_s64(0x7FF8000000000000uLL);
    *((int64x2_t *)v7 + 5) = v12;
    *((int64x2_t *)v7 + 6) = v12;
    *((_QWORD *)v7 + 14) = 0x7FF8000000000000;
  }
  return v7;
}

+ (id)_actionFromDynamicButton:(void *)a3 withConfiguration:(uint64_t)a4 state:(uint64_t)a5 andDriver:
{
  uint64_t v9;
  _UIPhysicalButtonAction *v10;
  id v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  _BYTE *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v9 = objc_opt_self();
  if (!a2)
  {
    v33 = v9;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", sel__actionFromDynamicButton_withConfiguration_state_andDriver_, v33, CFSTR("_UIPhysicalButtonInteraction.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dynamicButton"));

  }
  v10 = [_UIPhysicalButtonAction alloc];
  if (v10)
  {
    v37.receiver = v10;
    v37.super_class = (Class)_UIPhysicalButtonAction;
    v11 = objc_msgSendSuper2(&v37, sel_init);
    v12 = objc_msgSend(a2, "_physicalButton");
    if (v11)
    {
      *((_QWORD *)v11 + 1) = v12;
      *((_QWORD *)v11 + 2) = a4;
      *((_QWORD *)v11 + 3) = objc_msgSend(a3, "_behavior");
      *((_QWORD *)v11 + 4) = a5;
      objc_msgSend(a2, "_timestamp");
      v13 = 0;
      *((_QWORD *)v11 + 5) = v14;
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(a2, "_physicalButton");
  }
  objc_msgSend(a3, "_behavior");
  objc_msgSend(a2, "_timestamp");
  v11 = 0;
  v13 = 1;
LABEL_6:
  v15 = -[_UIPhysicalButtonContact _init]([_UIPhysicalButtonContact alloc]);
  v16 = objc_msgSend(a2, "_isTouching");
  if (v15)
  {
    v15[8] = v16;
    objc_msgSend(a2, "_touchMajorRadius");
    *((_QWORD *)v15 + 2) = v17;
    objc_msgSend(a2, "_touchMinorRadius");
    *((_QWORD *)v15 + 3) = v18;
    objc_msgSend(a2, "_position");
    *((_QWORD *)v15 + 5) = v19;
    *((_QWORD *)v15 + 6) = v20;
    objc_msgSend(a2, "_positionDelta");
    *((_QWORD *)v15 + 7) = v21;
    *((_QWORD *)v15 + 8) = v22;
    *((_QWORD *)v15 + 4) = objc_msgSend(a2, "_touchPositionHints");
    if (!v11)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(a2, "_touchMajorRadius");
  objc_msgSend(a2, "_touchMinorRadius");
  objc_msgSend(a2, "_position");
  objc_msgSend(a2, "_positionDelta");
  objc_msgSend(a2, "_touchPositionHints");
  if (v11)
LABEL_8:
    objc_storeStrong((id *)v11 + 6, v15);
LABEL_9:
  v23 = objc_msgSend(a2, "_stage");
  if (v13)
  {
    objc_msgSend(v11, "_button");
  }
  else
  {
    *((_QWORD *)v11 + 7) = v23;
    if (objc_msgSend(v11, "_button") == 5)
      v24 = 5;
    else
      v24 = 1;
    *((_QWORD *)v11 + 8) = v24;
  }
  v25 = objc_msgSend(a2, "_phase");
  v26 = 1;
  switch(v25)
  {
    case 0:
      v26 = 0;
      if (!v13)
        goto LABEL_21;
      goto LABEL_24;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIPhysicalButtonStagePhase _UIPhysicalButtonStagePhaseForDynamicButtonPhase(_UIDynamicButtonPhase)");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("_UIPhysicalButtonInteraction.m"), 127, CFSTR("Invalid state: attempting to resolve physical button stage for stationary dynamic button"));

      v26 = 1;
      if (v13)
        goto LABEL_24;
      goto LABEL_21;
    case 3:
      v26 = 2;
      if (v13)
        goto LABEL_24;
      goto LABEL_21;
    case 4:
      v26 = 3;
      goto LABEL_20;
    default:
LABEL_20:
      if (v13)
      {
LABEL_24:
        objc_msgSend(a2, "_normalizedForce");
        objc_msgSend(a2, "_normalizedForceVelocity");
        objc_msgSend(a2, "_releaseStageNormalizedForceThreshold");
        objc_msgSend(a2, "_pressedStageNormalizedForceThreshold");
        objc_msgSend(a2, "_nextStageNormalizedForceThreshold");
      }
      else
      {
LABEL_21:
        *((_QWORD *)v11 + 9) = v26;
        objc_msgSend(a2, "_normalizedForce");
        *((_QWORD *)v11 + 10) = v27;
        objc_msgSend(a2, "_normalizedForceVelocity");
        *((_QWORD *)v11 + 11) = v28;
        objc_msgSend(a2, "_releaseStageNormalizedForceThreshold");
        *((_QWORD *)v11 + 12) = v29;
        objc_msgSend(a2, "_pressedStageNormalizedForceThreshold");
        *((_QWORD *)v11 + 13) = v30;
        objc_msgSend(a2, "_nextStageNormalizedForceThreshold");
        *((_QWORD *)v11 + 14) = v31;
      }

      return v11;
  }
}

- (_UIPhysicalButtonAction)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonInteraction.m"), 266, CFSTR("%s: init is not allowed on %@"), "-[_UIPhysicalButtonAction init]", objc_opt_class());

  return 0;
}

- (CGPoint)_position
{
  double v2;
  double v3;
  CGPoint result;

  -[_UIPhysicalButtonContact position](self->_contact, "position");
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)_positionDelta
{
  double v2;
  double v3;
  CGPoint result;

  -[_UIPhysicalButtonContact positionDelta](self->_contact, "positionDelta");
  result.y = v3;
  result.x = v2;
  return result;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIPhysicalButtonAction debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", &stru_1E16EDF20);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIPhysicalButtonAction succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  unint64_t stagePhase;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _NSStringFromUIPhysicalButton(self->_button);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("button"));
  _NSStringFromUIPhysicalButtonBehavior(self->_behavior);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("behavior"));
  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", self->_stage, CFSTR("stage"));
  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", self->_numberOfStages, CFSTR("numberOfStages"));
  stagePhase = self->_stagePhase;
  if (stagePhase > 3)
    v9 = &stru_1E16EDF20;
  else
    v9 = off_1E16E3820[stagePhase];
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("stagePhase"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonAction descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonAction descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _UIPhysicalButtonAction *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65___UIPhysicalButtonAction_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v6 = v5;
  v11 = v6;
  v12 = self;
  v7 = (id)objc_msgSend(v6, "modifyBody:", v10);
  v8 = v6;

  return v8;
}

- (unint64_t)_button
{
  return self->_button;
}

- (unint64_t)_state
{
  return self->_state;
}

- (unint64_t)_behavior
{
  return self->_behavior;
}

- (double)_timestamp
{
  return self->_timestamp;
}

- (_UIPhysicalButtonContact)_contact
{
  return self->_contact;
}

- (unint64_t)_stage
{
  return self->_stage;
}

- (unint64_t)_numberOfStages
{
  return self->_numberOfStages;
}

- (unint64_t)_stagePhase
{
  return self->_stagePhase;
}

- (double)_normalizedForce
{
  return self->_normalizedForce;
}

- (double)_normalizedForceVelocity
{
  return self->_normalizedForceVelocity;
}

- (double)_releaseStageNormalizedForceThreshold
{
  return self->_releaseStageNormalizedForceThreshold;
}

- (double)_pressedStageNormalizedForceThreshold
{
  return self->_pressedStageNormalizedForceThreshold;
}

- (double)_nextStageNormalizedForceThreshold
{
  return self->_nextStageNormalizedForceThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
