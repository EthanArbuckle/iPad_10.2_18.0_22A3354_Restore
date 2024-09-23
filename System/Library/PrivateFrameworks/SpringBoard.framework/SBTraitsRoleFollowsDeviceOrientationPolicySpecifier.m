@implementation SBTraitsRoleFollowsDeviceOrientationPolicySpecifier

- (SBTraitsRoleFollowsDeviceOrientationPolicySpecifier)initWithComponentOrder:(id)a3
{
  SBTraitsRoleFollowsDeviceOrientationPolicySpecifier *v3;
  SBTraitsRoleFollowsDeviceOrientationPolicySpecifier *v4;
  uint64_t v5;
  NSString *targetRole;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBTraitsRoleFollowsDeviceOrientationPolicySpecifier;
  v3 = -[SBTraitsOrientationStageComponent initWithComponentOrder:](&v8, sel_initWithComponentOrder_, a3);
  v4 = v3;
  if (v3)
  {
    -[SBTraitsRoleFollowsDeviceOrientationPolicySpecifier targetRole](v3, "targetRole");
    v5 = objc_claimAutoreleasedReturnValue();
    targetRole = v4->_targetRole;
    v4->_targetRole = (NSString *)v5;

    -[SBTraitsRoleFollowsDeviceOrientationPolicySpecifier setDeviceOrientationStateTypes:](v4, "setDeviceOrientationStateTypes:", 0);
  }
  return v4;
}

- (NSString)targetRole
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsOrientationStageComponents.m"), 496, CFSTR("This class[%@] shouldn't be directly used, pick a subclass."), v6);

  return 0;
}

- (void)setDeviceOrientationStateTypes:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *deviceOrientationStateTypes;

  v4 = (NSArray *)a3;
  v5 = (NSArray *)&unk_1E91CEF98;
  if (v4)
    v5 = v4;
  deviceOrientationStateTypes = self->_deviceOrientationStateTypes;
  self->_deviceOrientationStateTypes = v5;

}

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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "role", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", self->_targetRole);

        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoDeviceOrientationWithStateTypes:", self->_deviceOrientationStateTypes);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setOrientationResolutionPolicyInfo:", v13);

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (NSArray)deviceOrientationStateTypes
{
  return self->_deviceOrientationStateTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceOrientationStateTypes, 0);
  objc_storeStrong((id *)&self->_targetRole, 0);
}

@end
