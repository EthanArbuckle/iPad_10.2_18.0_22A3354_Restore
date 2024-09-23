@implementation SBTraitsUnlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation

- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "bs_containsObjectPassingTest:", &__block_literal_global_64_0))
  {
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_66);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoForAssociatedParticipantWithRole:", CFSTR("SBTraitsParticipantRoleCoverSheet"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v5, "reverseObjectEnumerator", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v22;
      v12 = *MEMORY[0x1E0CEBBD0] + -15.0;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
          if ((v10 & 1) != 0)
            goto LABEL_9;
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v13), "currentSettings");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "zOrderLevelSettings");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "zOrderLevel");
          v18 = v17;

          if (v18 < v12)
          {
LABEL_9:
            objc_msgSend(v14, "orientationResolutionPolicyInfo");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "resolutionPolicy");

            if (v20 == 1)
              objc_msgSend(v14, "setOrientationResolutionPolicyInfo:", v6);
            v10 = 1;
          }
          else
          {
            v10 = 0;
          }
          ++v13;
        }
        while (v9 != v13);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

  }
}

uint64_t __124__SBTraitsUnlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation_updateStageParticipantsResolutionPolicies_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "role");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SBTraitsParticipantRoleCoverSheet"));

  return v3;
}

uint64_t __124__SBTraitsUnlockedEnvironmentFollowsCoverSheetInsteadOfDeviceOrientation_updateStageParticipantsResolutionPolicies_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "currentZOrderLevel");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "currentZOrderLevel");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

@end
