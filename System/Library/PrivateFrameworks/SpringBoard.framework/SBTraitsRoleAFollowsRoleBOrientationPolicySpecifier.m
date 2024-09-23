@implementation SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier

- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "role", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", self->_roleA);

        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoForAssociatedParticipantWithRole:", self->_roleB);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setForceResolution:", self->_force);
          if (self->_animate)
          {
            objc_msgSend(v13, "setActuationContext:", 0);
          }
          else
          {
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC08E8]), "initWithAnimationSettings:drawingFence:", 0, 0);
            objc_msgSend(v13, "setActuationContext:", v14);

          }
          objc_msgSend(v10, "setOrientationResolutionPolicyInfo:", v13);

          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:

}

- (SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier)initWithComponentOrder:(id)a3
{
  SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier *v3;
  SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier *v4;
  uint64_t v5;
  NSString *roleA;
  uint64_t v7;
  NSString *roleB;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier;
  v3 = -[SBTraitsOrientationStageComponent initWithComponentOrder:](&v10, sel_initWithComponentOrder_, a3);
  v4 = v3;
  if (v3)
  {
    -[SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier roleA](v3, "roleA");
    v5 = objc_claimAutoreleasedReturnValue();
    roleA = v4->_roleA;
    v4->_roleA = (NSString *)v5;

    -[SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier roleB](v4, "roleB");
    v7 = objc_claimAutoreleasedReturnValue();
    roleB = v4->_roleB;
    v4->_roleB = (NSString *)v7;

    v4->_force = -[SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier force](v4, "force");
    v4->_animate = -[SBTraitsRoleAFollowsRoleBOrientationPolicySpecifier animate](v4, "animate");
  }
  return v4;
}

- (BOOL)force
{
  return 0;
}

- (BOOL)animate
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roleB, 0);
  objc_storeStrong((id *)&self->_roleA, 0);
}

- (NSString)roleA
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsOrientationStageComponents.m"), 451, CFSTR("This class[%@] shouldn't be directly used, pick a subclass."), v6);

  return 0;
}

- (NSString)roleB
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsOrientationStageComponents.m"), 456, CFSTR("This class[%@] shouldn't be directly used, pick a subclass."), v6);

  return 0;
}

@end
