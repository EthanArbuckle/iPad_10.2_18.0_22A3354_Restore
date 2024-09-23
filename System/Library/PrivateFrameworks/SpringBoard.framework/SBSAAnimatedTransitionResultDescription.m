@implementation SBSAAnimatedTransitionResultDescription

- (SBSAAnimatedTransitionResultDescription)initWithAnimatedTransitionResultDescription:(id)a3
{
  id v4;
  SBSAAnimatedTransitionResultDescription *v5;
  uint64_t v6;
  NSUUID *animatedTransitionIdentifier;
  uint64_t v8;
  SBSAInterfaceElementPropertyIdentifying *associatedInterfaceElementPropertyIdentity;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBSAAnimatedTransitionResultDescription;
  v5 = -[SBSAAnimatedTransitionResultDescription init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "animatedTransitionIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    animatedTransitionIdentifier = v5->_animatedTransitionIdentifier;
    v5->_animatedTransitionIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "associatedInterfaceElementPropertyIdentity");
    v8 = objc_claimAutoreleasedReturnValue();
    associatedInterfaceElementPropertyIdentity = v5->_associatedInterfaceElementPropertyIdentity;
    v5->_associatedInterfaceElementPropertyIdentity = (SBSAInterfaceElementPropertyIdentifying *)v8;

    objc_msgSend(v4, "targetedMilestone");
    v5->_targetedMilestone = v10;
    v5->_transitionEndTargeted = objc_msgSend(v4, "isTransitionEndTargeted");
    v5->_finished = objc_msgSend(v4, "finished");
    v5->_retargeted = objc_msgSend(v4, "retargeted");
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSUUID *animatedTransitionIdentifier;
  uint64_t v6;
  id v7;
  void *v8;
  SBSAInterfaceElementPropertyIdentifying *associatedInterfaceElementPropertyIdentity;
  id v10;
  void *v11;
  double targetedMilestone;
  id v13;
  void *v14;
  _BOOL8 transitionEndTargeted;
  id v16;
  void *v17;
  _BOOL8 finished;
  id v19;
  void *v20;
  uint64_t retargeted;
  id v22;
  void *v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  animatedTransitionIdentifier = self->_animatedTransitionIdentifier;
  v6 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke;
  v36[3] = &unk_1E8EA4320;
  v7 = v4;
  v37 = v7;
  objc_msgSend(v25, "appendObject:counterpart:", animatedTransitionIdentifier, v36);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  associatedInterfaceElementPropertyIdentity = self->_associatedInterfaceElementPropertyIdentity;
  v34[0] = v6;
  v34[1] = 3221225472;
  v34[2] = __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_2;
  v34[3] = &unk_1E8EA4320;
  v10 = v7;
  v35 = v10;
  objc_msgSend(v8, "appendObject:counterpart:", associatedInterfaceElementPropertyIdentity, v34);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  targetedMilestone = self->_targetedMilestone;
  v32[0] = v6;
  v32[1] = 3221225472;
  v32[2] = __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_3;
  v32[3] = &unk_1E8EA8460;
  v13 = v10;
  v33 = v13;
  objc_msgSend(v11, "appendCGFloat:counterpart:", v32, targetedMilestone);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  transitionEndTargeted = self->_transitionEndTargeted;
  v30[0] = v6;
  v30[1] = 3221225472;
  v30[2] = __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_4;
  v30[3] = &unk_1E8EA3E78;
  v16 = v13;
  v31 = v16;
  objc_msgSend(v14, "appendBool:counterpart:", transitionEndTargeted, v30);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  finished = self->_finished;
  v28[0] = v6;
  v28[1] = 3221225472;
  v28[2] = __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_5;
  v28[3] = &unk_1E8EA3E78;
  v19 = v16;
  v29 = v19;
  objc_msgSend(v17, "appendBool:counterpart:", finished, v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  retargeted = self->_retargeted;
  v26[0] = v6;
  v26[1] = 3221225472;
  v26[2] = __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_6;
  v26[3] = &unk_1E8EA3E78;
  v27 = v19;
  v22 = v19;
  objc_msgSend(v20, "appendBool:counterpart:", retargeted, v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(retargeted) = objc_msgSend(v23, "isEqual");

  return retargeted;
}

uint64_t __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animatedTransitionIdentifier");
}

uint64_t __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "associatedInterfaceElementPropertyIdentity");
}

uint64_t __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "targetedMilestone");
}

uint64_t __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isTransitionEndTargeted");
}

uint64_t __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finished");
}

uint64_t __51__SBSAAnimatedTransitionResultDescription_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "retargeted");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_animatedTransitionIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:", self->_associatedInterfaceElementPropertyIdentity);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendCGFloat:", self->_targetedMilestone);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendBool:", self->_transitionEndTargeted);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendBool:", self->_finished);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendBool:", self->_retargeted);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  return v10;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  NSUUID *animatedTransitionIdentifier;
  SBSAInterfaceElementPropertyIdentifying *associatedInterfaceElementPropertyIdentity;
  _BOOL4 transitionEndTargeted;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  animatedTransitionIdentifier = self->_animatedTransitionIdentifier;
  associatedInterfaceElementPropertyIdentity = self->_associatedInterfaceElementPropertyIdentity;
  transitionEndTargeted = self->_transitionEndTargeted;
  if (self->_transitionEndTargeted)
  {
    v8 = CFSTR("transition end");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_targetedMilestone);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  NSStringFromBOOL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; animatedTransitionIdentifier: %@; associatedInterfaceElementPropertyIdentity: %@; targetedMilestone: %@, transitionEndTargeted: %@; finished: %@; retargeted: %@>"),
    v4,
    self,
    animatedTransitionIdentifier,
    associatedInterfaceElementPropertyIdentity,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!transitionEndTargeted)
  return (NSString *)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAnimatedTransitionResultDescription:", self);
}

+ (id)instanceWithBlock:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)objc_msgSend(v4, "copyWithBlock:", v3);

  return v5;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[SBSAAnimatedTransitionResultDescription copy](self, "copy");
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithAnimatedTransitionResultDescription:", v5);
    v4[2](v4, v6);

  }
  return v5;
}

- (NSUUID)animatedTransitionIdentifier
{
  return self->_animatedTransitionIdentifier;
}

- (void)_setAnimatedTransitionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SBSAInterfaceElementPropertyIdentifying)associatedInterfaceElementPropertyIdentity
{
  return self->_associatedInterfaceElementPropertyIdentity;
}

- (void)_setAssociatedInterfaceElementPropertyIdentityIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)targetedMilestone
{
  return self->_targetedMilestone;
}

- (void)_setTargetedMilestone:(double)a3
{
  self->_targetedMilestone = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)_setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)retargeted
{
  return self->_retargeted;
}

- (void)_setRetargeted:(BOOL)a3
{
  self->_retargeted = a3;
}

- (BOOL)isTransitionEndTargeted
{
  return self->_transitionEndTargeted;
}

- (void)_setTransitionEndTargeted:(BOOL)a3
{
  self->_transitionEndTargeted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedInterfaceElementPropertyIdentity, 0);
  objc_storeStrong((id *)&self->_animatedTransitionIdentifier, 0);
}

@end
