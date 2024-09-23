@implementation SBTraitsCoverSheetFollowsSecureAppOrientationPolicySpecifier

- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4
{
  __CFString *v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = CFSTR("SBTraitsParticipantRoleSecureApp");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __114__SBTraitsCoverSheetFollowsSecureAppOrientationPolicySpecifier_updateStageParticipantsResolutionPolicies_context___block_invoke;
  v10[3] = &unk_1E8EA7DF8;
  v11 = v5;
  v6 = a3;
  v7 = objc_msgSend(v6, "bs_containsObjectPassingTest:", v10);
  objc_msgSend(v6, "bs_firstObjectPassingTest:", &__block_literal_global_89);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v7)
  {
    objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoForAssociatedParticipantWithRole:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOrientationResolutionPolicyInfo:", v9);

  }
}

uint64_t __114__SBTraitsCoverSheetFollowsSecureAppOrientationPolicySpecifier_updateStageParticipantsResolutionPolicies_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "role");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __114__SBTraitsCoverSheetFollowsSecureAppOrientationPolicySpecifier_updateStageParticipantsResolutionPolicies_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "role");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SBTraitsParticipantRoleCoverSheet"));

  return v3;
}

@end
