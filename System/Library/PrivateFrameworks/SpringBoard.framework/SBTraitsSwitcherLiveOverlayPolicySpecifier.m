@implementation SBTraitsSwitcherLiveOverlayPolicySpecifier

- (void)_updateParticipant:(id)a3 withPolicy:(int64_t)a4 context:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  switch(a4)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoIsolation");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
      objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoForAssociatedParticipantWithRole:", CFSTR("SBTraitsParticipantRoleSwitcherRaw"));
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 4:
      objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoDeviceOrientation");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 5:
      objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoForAssociatedParticipantWithUniqueID:", self->_primaryElementParticipantIdentifier);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v11 = (void *)v10;
      objc_msgSend(v8, "setOrientationResolutionPolicyInfo:", v10);

      break;
    case 6:
      +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isUserLocked");

      if (v13)
      {
        +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "userLockOrientation");

        if ((unint64_t)(v15 - 3) > 1)
        {
          v21[0] = &unk_1E91D12B0;
          v21[1] = &unk_1E91D12C8;
          v22[0] = &unk_1E91CEB48;
          v22[1] = &unk_1E91CEB48;
          v21[2] = &unk_1E91D12E0;
          v22[2] = &unk_1E91CEB48;
          v16 = (void *)MEMORY[0x1E0C99D80];
          v17 = v22;
          v18 = v21;
        }
        else
        {
          v23[0] = &unk_1E91D1268;
          v23[1] = &unk_1E91D1280;
          v24[0] = &unk_1E91CEB48;
          v24[1] = &unk_1E91CEB48;
          v23[2] = &unk_1E91D1298;
          v24[2] = &unk_1E91CEB48;
          v16 = (void *)MEMORY[0x1E0C99D80];
          v17 = v24;
          v18 = v23;
        }
        objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoDeviceOrientationWithStateTypesBySupportedOrientationMask:", v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoDeviceOrientation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "setOrientationResolutionPolicyInfo:", v19);

      break;
    default:
      break;
  }

}

- (void)_updateAcquiredParticipantsPolicies:(id)a3 context:(id)a4
{
  id v7;
  int64_t primaryElementResolutionPolicy;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  int64_t *p_primaryElementResolutionPolicy;
  void *v18;
  void *v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v20 = a4;
  primaryElementResolutionPolicy = self->_primaryElementResolutionPolicy;
  if (!primaryElementResolutionPolicy)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherTraitsPolicySpecifiers.m"), 145, CFSTR("primary element unique identifier missing"));

    primaryElementResolutionPolicy = self->_primaryElementResolutionPolicy;
  }
  if (primaryElementResolutionPolicy == 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherTraitsPolicySpecifiers.m"), 146, CFSTR("Primary element asked to follow itself"));

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "role");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uniqueIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", self->_primaryElementParticipantIdentifier);

        p_primaryElementResolutionPolicy = &self->_primaryElementResolutionPolicy;
        if ((v16 & 1) == 0)
        {
          if (!objc_msgSend(v14, "isEqualToString:", CFSTR("SBTraitsParticipantRoleSwitcherLiveOverlay")))
            goto LABEL_15;
          p_primaryElementResolutionPolicy = &self->_nonPrimaryResolutionPolicy;
        }
        if (*p_primaryElementResolutionPolicy != 1)
          -[SBTraitsSwitcherLiveOverlayPolicySpecifier _updateParticipant:withPolicy:context:](self, "_updateParticipant:withPolicy:context:", v13, *p_primaryElementResolutionPolicy, v20);
LABEL_15:

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

}

- (int64_t)primaryElementResolutionPolicy
{
  return self->_primaryElementResolutionPolicy;
}

- (void)setNonPrimaryResolutionPolicy:(int64_t)a3
{
  void *v4;
  id v5;

  if (self->_nonPrimaryResolutionPolicy != a3)
  {
    self->_nonPrimaryResolutionPolicy = a3;
    -[SBAbstractTraitsSwitcherPolicySpecifier _blockBasedPolicySpecifier](self, "_blockBasedPolicySpecifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SBTraitsSwitcherLiveOverlayPolicySpecifier _specifierDescription](self, "_specifierDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSpecifierDescription:", v4);

  }
}

- (void)setPrimaryElementResolutionPolicy:(int64_t)a3
{
  void *v4;
  id v5;

  if (self->_primaryElementResolutionPolicy != a3)
  {
    self->_primaryElementResolutionPolicy = a3;
    -[SBAbstractTraitsSwitcherPolicySpecifier _blockBasedPolicySpecifier](self, "_blockBasedPolicySpecifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SBTraitsSwitcherLiveOverlayPolicySpecifier _specifierDescription](self, "_specifierDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSpecifierDescription:", v4);

  }
}

- (void)setPrimaryElementParticipantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)_specifierDescription
{
  unint64_t v2;
  const __CFString *v3;
  unint64_t v4;
  const __CFString *v5;

  v2 = self->_primaryElementResolutionPolicy - 2;
  if (v2 > 4)
    v3 = CFSTR("None");
  else
    v3 = off_1E8EB2F18[v2];
  v4 = self->_nonPrimaryResolutionPolicy - 2;
  if (v4 > 4)
    v5 = CFSTR("None");
  else
    v5 = off_1E8EB2F18[v4];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Switcher primary overlay: %@; non-primary overlays: %@;"),
               v3,
               v5);
}

- (SBTraitsSwitcherLiveOverlayPolicySpecifier)initWithComponentOrder:(id)a3 arbiter:(id)a4
{
  SBTraitsSwitcherLiveOverlayPolicySpecifier *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBTraitsSwitcherLiveOverlayPolicySpecifier;
  result = -[SBAbstractTraitsSwitcherPolicySpecifier initWithComponentOrder:arbiter:](&v5, sel_initWithComponentOrder_arbiter_, a3, a4);
  if (result)
  {
    result->_primaryElementResolutionPolicy = 1;
    result->_nonPrimaryResolutionPolicy = 1;
  }
  return result;
}

- (NSString)primaryElementParticipantIdentifier
{
  return self->_primaryElementParticipantIdentifier;
}

- (int64_t)nonPrimaryResolutionPolicy
{
  return self->_nonPrimaryResolutionPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryElementParticipantIdentifier, 0);
}

@end
