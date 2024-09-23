@implementation SBFZStackParticipantPreferences

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setActivationPolicyForParticipantsBelow:", self->_activationPolicyForParticipantsBelow);
  objc_msgSend(v4, "setAssertIsAboveParticipantIdentifiers:", self->_assertIsAboveParticipantIdentifiers);
  objc_msgSend(v4, "setHomeGestureConsumption:", self->_homeGestureConsumption);
  objc_msgSend(v4, "setHomeAffordanceDrawingSuppression:", self->_homeAffordanceDrawingSuppression);
  objc_msgSend(v4, "setSuppressSystemApertureForSystemChromeSuppression:", self->_suppressSystemApertureForSystemChromeSuppression);
  objc_msgSend(v4, "setAssociatedSceneIdentifiersToSuppressInSystemAperture:", self->_associatedSceneIdentifiersToSuppressInSystemAperture);
  objc_msgSend(v4, "setAssociatedBundleIdentifiersToSuppressInSystemAperture:", self->_associatedBundleIdentifiersToSuppressInSystemAperture);
  objc_msgSend(v4, "setPhysicalButtonSceneTargets:", self->_physicalButtonSceneTargets);
  objc_msgSend(v4, "setCaptureButtonFullFidelityEventRequestingScenes:", self->_captureButtonFullFidelityEventRequestingScenes);
  objc_msgSend(v4, "setForegroundCaptureSceneTargets:", self->_foregroundCaptureSceneTargets);
  objc_msgSend(v4, "setAudioCategoriesDisablingVolumeHUD:", self->_audioCategoriesDisablingVolumeHUD);
  objc_msgSend(v4, "setAllowsDimmingWhenForegroundInactive:", self->_allowsDimmingWhenForegroundInactive);
  return v4;
}

- (void)setAudioCategoriesDisablingVolumeHUD:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setSuppressSystemApertureForSystemChromeSuppression:(BOOL)a3
{
  self->_suppressSystemApertureForSystemChromeSuppression = a3;
}

- (void)setPhysicalButtonSceneTargets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setHomeGestureConsumption:(int64_t)a3
{
  self->_homeGestureConsumption = a3;
}

- (void)setHomeAffordanceDrawingSuppression:(int64_t)a3
{
  self->_homeAffordanceDrawingSuppression = a3;
}

- (void)setAssociatedSceneIdentifiersToSuppressInSystemAperture:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setAssociatedBundleIdentifiersToSuppressInSystemAperture:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setActivationPolicyForParticipantsBelow:(int64_t)a3
{
  self->_activationPolicyForParticipantsBelow = a3;
}

- (void)setAssertIsAboveParticipantIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)homeGestureConsumption
{
  return self->_homeGestureConsumption;
}

- (NSSet)associatedSceneIdentifiersToSuppressInSystemAperture
{
  return self->_associatedSceneIdentifiersToSuppressInSystemAperture;
}

- (NSSet)associatedBundleIdentifiersToSuppressInSystemAperture
{
  return self->_associatedBundleIdentifiersToSuppressInSystemAperture;
}

- (BOOL)suppressSystemApertureForSystemChromeSuppression
{
  return self->_suppressSystemApertureForSystemChromeSuppression;
}

- (int64_t)homeAffordanceDrawingSuppression
{
  return self->_homeAffordanceDrawingSuppression;
}

- (NSIndexSet)assertIsAboveParticipantIdentifiers
{
  return self->_assertIsAboveParticipantIdentifiers;
}

- (NSArray)physicalButtonSceneTargets
{
  return self->_physicalButtonSceneTargets;
}

- (NSSet)audioCategoriesDisablingVolumeHUD
{
  return self->_audioCategoriesDisablingVolumeHUD;
}

- (int64_t)activationPolicyForParticipantsBelow
{
  return self->_activationPolicyForParticipantsBelow;
}

- (id)initInternal
{
  SBFZStackParticipantPreferences *v2;
  SBFZStackParticipantPreferences *v3;
  NSIndexSet *assertIsAboveParticipantIdentifiers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFZStackParticipantPreferences;
  v2 = -[SBFZStackParticipantPreferences init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    assertIsAboveParticipantIdentifiers = v2->_assertIsAboveParticipantIdentifiers;
    v2->_activationPolicyForParticipantsBelow = 0;
    v2->_assertIsAboveParticipantIdentifiers = 0;

    v3->_allowsDimmingWhenForegroundInactive = 0;
    v3->_homeGestureConsumption = 0;
    v3->_homeAffordanceDrawingSuppression = 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
  objc_storeStrong((id *)&self->_foregroundCaptureSceneTargets, 0);
  objc_storeStrong((id *)&self->_captureButtonFullFidelityEventRequestingScenes, 0);
  objc_storeStrong((id *)&self->_physicalButtonSceneTargets, 0);
  objc_storeStrong((id *)&self->_associatedSceneIdentifiersToSuppressInSystemAperture, 0);
  objc_storeStrong((id *)&self->_associatedBundleIdentifiersToSuppressInSystemAperture, 0);
  objc_storeStrong((id *)&self->_assertIsAboveParticipantIdentifiers, 0);
}

- (NSString)description
{
  return (NSString *)-[SBFZStackParticipantPreferences descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isEqual:(id)a3
{
  SBFZStackParticipantPreferences *v4;
  int64_t v5;
  void *v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  _BOOL4 v10;
  BOOL v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = (SBFZStackParticipantPreferences *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[SBFZStackParticipantPreferences activationPolicyForParticipantsBelow](self, "activationPolicyForParticipantsBelow"), v5 == -[SBFZStackParticipantPreferences activationPolicyForParticipantsBelow](v4, "activationPolicyForParticipantsBelow")))
    {
      -[SBFZStackParticipantPreferences assertIsAboveParticipantIdentifiers](self, "assertIsAboveParticipantIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFZStackParticipantPreferences assertIsAboveParticipantIdentifiers](v4, "assertIsAboveParticipantIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects()
        && (v8 = -[SBFZStackParticipantPreferences homeGestureConsumption](self, "homeGestureConsumption"),
            v8 == -[SBFZStackParticipantPreferences homeGestureConsumption](v4, "homeGestureConsumption"))
        && (v9 = -[SBFZStackParticipantPreferences homeAffordanceDrawingSuppression](self, "homeAffordanceDrawingSuppression"), v9 == -[SBFZStackParticipantPreferences homeAffordanceDrawingSuppression](v4, "homeAffordanceDrawingSuppression"))&& (v10 = -[SBFZStackParticipantPreferences suppressSystemApertureForSystemChromeSuppression](self, "suppressSystemApertureForSystemChromeSuppression"), v10 == -[SBFZStackParticipantPreferences suppressSystemApertureForSystemChromeSuppression](v4, "suppressSystemApertureForSystemChromeSuppression")))
      {
        -[SBFZStackParticipantPreferences associatedBundleIdentifiersToSuppressInSystemAperture](self, "associatedBundleIdentifiersToSuppressInSystemAperture");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFZStackParticipantPreferences associatedBundleIdentifiersToSuppressInSystemAperture](v4, "associatedBundleIdentifiersToSuppressInSystemAperture");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualSets())
        {
          -[SBFZStackParticipantPreferences associatedSceneIdentifiersToSuppressInSystemAperture](self, "associatedSceneIdentifiersToSuppressInSystemAperture");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBFZStackParticipantPreferences associatedSceneIdentifiersToSuppressInSystemAperture](v4, "associatedSceneIdentifiersToSuppressInSystemAperture");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (BSEqualSets())
          {
            -[SBFZStackParticipantPreferences physicalButtonSceneTargets](self, "physicalButtonSceneTargets");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBFZStackParticipantPreferences physicalButtonSceneTargets](v4, "physicalButtonSceneTargets");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (BSEqualArrays())
            {
              v27 = v17;
              -[SBFZStackParticipantPreferences captureButtonFullFidelityEventRequestingScenes](self, "captureButtonFullFidelityEventRequestingScenes");
              v19 = objc_claimAutoreleasedReturnValue();
              -[SBFZStackParticipantPreferences captureButtonFullFidelityEventRequestingScenes](v4, "captureButtonFullFidelityEventRequestingScenes");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = (void *)v19;
              if (BSEqualArrays())
              {
                -[SBFZStackParticipantPreferences foregroundCaptureSceneTargets](self, "foregroundCaptureSceneTargets");
                v20 = objc_claimAutoreleasedReturnValue();
                -[SBFZStackParticipantPreferences foregroundCaptureSceneTargets](v4, "foregroundCaptureSceneTargets");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = (void *)v20;
                if (BSEqualArrays())
                {
                  -[SBFZStackParticipantPreferences audioCategoriesDisablingVolumeHUD](self, "audioCategoriesDisablingVolumeHUD");
                  v21 = objc_claimAutoreleasedReturnValue();
                  -[SBFZStackParticipantPreferences audioCategoriesDisablingVolumeHUD](v4, "audioCategoriesDisablingVolumeHUD");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = (void *)v21;
                  if (BSEqualSets())
                  {
                    v22 = -[SBFZStackParticipantPreferences allowsDimmingWhenForegroundInactive](self, "allowsDimmingWhenForegroundInactive");
                    v11 = v22 == -[SBFZStackParticipantPreferences allowsDimmingWhenForegroundInactive](v4, "allowsDimmingWhenForegroundInactive");
                  }
                  else
                  {
                    v11 = 0;
                  }
                  v17 = v27;

                }
                else
                {
                  v11 = 0;
                  v17 = v27;
                }

              }
              else
              {
                v11 = 0;
                v17 = v27;
              }

            }
            else
            {
              v11 = 0;
            }

          }
          else
          {
            v11 = 0;
          }

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFZStackParticipantPreferences succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFZStackParticipantPreferences descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBFZStackParticipantPreferences *v11;

  v4 = a3;
  -[SBFZStackParticipantPreferences succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__SBFZStackParticipantPreferences_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E200E2A0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

uint64_t __73__SBFZStackParticipantPreferences_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  __CFString *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  __CFString *v37;
  _QWORD v39[4];
  id v40;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "activationPolicyForParticipantsBelow");
  if (v3 > 2)
    v4 = 0;
  else
    v4 = off_1E200F2A8[v3];
  objc_msgSend(v2, "appendString:withName:", v4, CFSTR("activationPolicyForParticipantsBelow"));
  v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(*(id *)(a1 + 40), "homeGestureConsumption");
  if (v6 > 2)
    v7 = 0;
  else
    v7 = off_1E200F2C0[v6];
  objc_msgSend(v5, "appendString:withName:", v7, CFSTR("homeGestureConsumption"));
  v8 = *(void **)(a1 + 32);
  v9 = objc_msgSend(*(id *)(a1 + 40), "homeAffordanceDrawingSuppression");
  if (v9 > 2)
    v10 = 0;
  else
    v10 = off_1E200F2D8[v9];
  objc_msgSend(v8, "appendString:withName:", v10, CFSTR("homeAffordanceDrawingSuppression"));
  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "assertIsAboveParticipantIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = ___SBFZStackParticipantIdentifierDescriptionsForIdentifiers_block_invoke;
  v39[3] = &unk_1E200F170;
  v40 = v13;
  v14 = v13;
  objc_msgSend(v12, "enumerateIndexesUsingBlock:", v39);

  objc_msgSend(v11, "appendArraySection:withName:skipIfEmpty:", v14, CFSTR("assertIsAboveParticipantIdentifiers"), 1);
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "suppressSystemApertureForSystemChromeSuppression"), CFSTR("suppressSystemApertureForSystemChromeSuppression"), 1);
  v16 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "associatedSceneIdentifiersToSuppressInSystemAperture");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "description");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendString:withName:skipIfEmpty:", v18, CFSTR("associatedSceneIdentifiersToSuppressInSystemAperture"), 1);

  v19 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "associatedBundleIdentifiersToSuppressInSystemAperture");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "description");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendString:withName:skipIfEmpty:", v21, CFSTR("associatedBundleIdentifiersToSuppressInSystemAperture"), 1);

  v22 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "physicalButtonSceneTargets");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "description");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendString:withName:skipIfEmpty:", v24, CFSTR("physicalButtonSceneTargets"), 1);

  v25 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "captureButtonFullFidelityEventRequestingScenes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bs_map:", &__block_literal_global_262);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "description");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendString:withName:skipIfEmpty:", v28, CFSTR("captureButtonFullFidelityEventRequestingScenes"), 1);

  v29 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "foregroundCaptureSceneTargets");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "description");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "appendString:withName:skipIfEmpty:", v31, CFSTR("foregroundCaptureSceneTargets"), 1);

  v32 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "audioCategoriesDisablingVolumeHUD");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "description");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "appendString:withName:skipIfEmpty:", v34, CFSTR("audioCategoriesDisablingVolumeHUD"), 1);

  v35 = *(void **)(a1 + 32);
  v36 = objc_msgSend(*(id *)(a1 + 40), "allowsDimmingWhenForegroundInactive");
  if (v36 > 2)
    v37 = 0;
  else
    v37 = off_1E200F2F0[v36];
  return objc_msgSend(v35, "appendString:withName:", v37, CFSTR("contentAppearanceForTypeToSiri"));
}

id __73__SBFZStackParticipantPreferences_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "identityToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)captureButtonFullFidelityEventRequestingScenes
{
  return self->_captureButtonFullFidelityEventRequestingScenes;
}

- (void)setCaptureButtonFullFidelityEventRequestingScenes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)foregroundCaptureSceneTargets
{
  return self->_foregroundCaptureSceneTargets;
}

- (void)setForegroundCaptureSceneTargets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)allowsDimmingWhenForegroundInactive
{
  return self->_allowsDimmingWhenForegroundInactive;
}

- (void)setAllowsDimmingWhenForegroundInactive:(int64_t)a3
{
  self->_allowsDimmingWhenForegroundInactive = a3;
}

@end
