@implementation SBTraitsUserInterfaceStyleDefaultResolutionPolicySpecifier

- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        objc_msgSend(v9, "role");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("SBTraitsParticipantRoleAXUIServer")))
        {
          v11 = 0;
          goto LABEL_12;
        }
        if (_AXSClassicInvertColorsEnabled())
        {

LABEL_11:
          v13 = objc_alloc(MEMORY[0x1E0DC0900]);
          v14 = objc_alloc(MEMORY[0x1E0DC08E8]);
          objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v14, "initWithAnimationSettings:drawingFence:", v10, 0);
          v11 = (void *)objc_msgSend(v13, "initWithActuationContext:", v15);

LABEL_12:
          goto LABEL_13;
        }
        v12 = _AXSInvertColorsEnabled();

        if (v12)
          goto LABEL_11;
        v11 = 0;
LABEL_13:
        objc_msgSend(v9, "setUserInterfaceStyleResolutionPolicyInfo:", v11);

        ++v8;
      }
      while (v6 != v8);
      v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v6 = v16;
    }
    while (v16);
  }

}

@end
