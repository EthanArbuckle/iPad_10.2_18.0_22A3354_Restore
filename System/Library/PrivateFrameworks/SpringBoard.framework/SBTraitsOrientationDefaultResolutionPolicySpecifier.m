@implementation SBTraitsOrientationDefaultResolutionPolicySpecifier

- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4
{
  id v7;
  id WeakRetained;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v35 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsOrientationStageComponents.m"), 109, CFSTR("%@ cannot start being queried without a policy data source in place"), v33);

  }
  v9 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v9, "defaultKeyboardFocusDrivenRoles");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultDeviceOrientationDrivenRoles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultActiveOrientationBelowDrivenRoles");
  v11 = objc_claimAutoreleasedReturnValue();
  v34 = v9;
  v12 = v9;
  v13 = (void *)v11;
  objc_msgSend(v12, "defaultOtherParticipantDrivenRoles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v40;
    v36 = v15;
    v37 = v10;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v40 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v20, "role");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "containsObject:", v21))
        {
          objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoDeviceOrientation");
          v22 = objc_claimAutoreleasedReturnValue();
LABEL_12:
          v23 = (void *)v22;
          goto LABEL_22;
        }
        if (objc_msgSend(v13, "containsObject:", v21))
        {
          objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoOrientationBelow");
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        v24 = v13;
        if (objc_msgSend(v38, "containsObject:", v21))
        {
          objc_msgSend(v35, "validatedInputs");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "keyboardInputs");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "focusedParticipantUniqueIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
            objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoForAssociatedParticipantWithUniqueID:", v27);
          else
            objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoOrientationBelow");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v36;

        }
        else
        {
          objc_msgSend(v14, "objectForKey:", v21);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = (void *)MEMORY[0x1E0DC08D0];
          if (v28)
          {
            objc_msgSend(v14, "objectForKey:", v21);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "resolutionPolicyInfoForAssociatedParticipantWithRole:", v30);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = v36;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoIsolation");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        v13 = v24;
        v10 = v37;
LABEL_22:
        objc_msgSend(v20, "setOrientationResolutionPolicyInfo:", v23);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v17);
  }

}

- (SBTraitsOrientationDefaultResolutionPolicySpecifier)initWithComponentOrder:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  SBTraitsOrientationDefaultResolutionPolicySpecifier *v9;
  SBTraitsOrientationDefaultResolutionPolicySpecifier *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTraitsOrientationStageComponents.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource"));

  }
  v13.receiver = self;
  v13.super_class = (Class)SBTraitsOrientationDefaultResolutionPolicySpecifier;
  v9 = -[SBTraitsOrientationStageComponent initWithComponentOrder:](&v13, sel_initWithComponentOrder_, v7);
  v10 = v9;
  if (v9)
    objc_storeWeak((id *)&v9->_dataSource, v8);

  return v10;
}

- (SBTraitsOrientationPolicySpecifierDataSource)dataSource
{
  return (SBTraitsOrientationPolicySpecifierDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
