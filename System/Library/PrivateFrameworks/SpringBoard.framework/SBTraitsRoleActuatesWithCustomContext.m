@implementation SBTraitsRoleActuatesWithCustomContext

- (SBTraitsRoleActuatesWithCustomContext)initWithComponentOrder:(id)a3
{
  return -[SBTraitsRoleActuatesWithCustomContext initWithComponentOrder:actuationContext:](self, "initWithComponentOrder:actuationContext:", a3, 0);
}

- (SBTraitsRoleActuatesWithCustomContext)initWithComponentOrder:(id)a3 actuationContext:(id)a4
{
  id v6;
  SBTraitsRoleActuatesWithCustomContext *v7;
  SBTraitsRoleActuatesWithCustomContext *v8;
  uint64_t v9;
  NSString *role;
  uint64_t v11;
  TRASettingsActuationContext *actuationContext;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBTraitsRoleActuatesWithCustomContext;
  v7 = -[SBTraitsOrientationStageComponent initWithComponentOrder:](&v14, sel_initWithComponentOrder_, a3);
  v8 = v7;
  if (v7)
  {
    -[SBTraitsRoleActuatesWithCustomContext role](v7, "role");
    v9 = objc_claimAutoreleasedReturnValue();
    role = v8->_role;
    v8->_role = (NSString *)v9;

    v11 = objc_msgSend(v6, "copy");
    actuationContext = v8->_actuationContext;
    v8->_actuationContext = (TRASettingsActuationContext *)v11;

  }
  return v8;
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
        v12 = objc_msgSend(v11, "isEqualToString:", self->_role);

        if (v12)
        {
          objc_msgSend(v10, "orientationResolutionPolicyInfo");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setActuationContext:", self->_actuationContext);

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

- (NSString)role
{
  return self->_role;
}

- (TRASettingsActuationContext)actuationContext
{
  return self->_actuationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actuationContext, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

@end
