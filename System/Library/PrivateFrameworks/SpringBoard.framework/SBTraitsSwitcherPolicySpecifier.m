@implementation SBTraitsSwitcherPolicySpecifier

uint64_t __79__SBTraitsSwitcherPolicySpecifier__updateAcquiredParticipantsPolicies_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "role");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", CFSTR("SBTraitsParticipantRoleSwitcherRaw"));

  return v3;
}

- (void)_updateAcquiredParticipantsPolicies:(id)a3 context:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "bs_firstObjectPassingTest:", &__block_literal_global_218, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  switch(self->_resolutionPolicy)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoOrientationBelow");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      if (!self->_primaryElementParticipantIdentifier)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherTraitsPolicySpecifiers.m"), 95, CFSTR("SBTraitsSwitcherPolicySpecifier set to be following primary element but its identifier is nil."));

      }
      objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoForAssociatedParticipantWithUniqueID:");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoDeviceOrientation");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 5:
      objc_msgSend(MEMORY[0x1E0DC08D0], "resolutionPolicyInfoIsolation");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v8 = (void *)v7;
      objc_msgSend(v10, "setOrientationResolutionPolicyInfo:", v7);

      v6 = v10;
      break;
    default:
      break;
  }

}

- (void)setResolutionPolicy:(int64_t)a3
{
  void *v4;
  id v5;

  if (self->_resolutionPolicy != a3)
  {
    self->_resolutionPolicy = a3;
    -[SBAbstractTraitsSwitcherPolicySpecifier _blockBasedPolicySpecifier](self, "_blockBasedPolicySpecifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SBTraitsSwitcherPolicySpecifier _specifierDescription](self, "_specifierDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSpecifierDescription:", v4);

  }
}

- (int64_t)resolutionPolicy
{
  return self->_resolutionPolicy;
}

- (void)setPrimaryElementParticipantIdentifier:(id)a3
{
  NSString *v4;
  NSString *primaryElementParticipantIdentifier;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSString isEqualToString:](self->_primaryElementParticipantIdentifier, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    primaryElementParticipantIdentifier = self->_primaryElementParticipantIdentifier;
    self->_primaryElementParticipantIdentifier = v4;

    -[SBAbstractTraitsSwitcherPolicySpecifier _blockBasedPolicySpecifier](self, "_blockBasedPolicySpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTraitsSwitcherPolicySpecifier _specifierDescription](self, "_specifierDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSpecifierDescription:", v7);

  }
}

- (id)_specifierDescription
{
  unint64_t v2;
  const __CFString *v3;

  v2 = self->_resolutionPolicy - 2;
  if (v2 > 3)
    v3 = CFSTR("None");
  else
    v3 = off_1E8EB2EF8[v2];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Switcher policy: %@; primary element identifier: %@"),
               v3,
               self->_primaryElementParticipantIdentifier);
}

- (SBTraitsSwitcherPolicySpecifier)initWithComponentOrder:(id)a3 arbiter:(id)a4
{
  SBTraitsSwitcherPolicySpecifier *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBTraitsSwitcherPolicySpecifier;
  result = -[SBAbstractTraitsSwitcherPolicySpecifier initWithComponentOrder:arbiter:](&v5, sel_initWithComponentOrder_arbiter_, a3, a4);
  if (result)
    result->_resolutionPolicy = 1;
  return result;
}

- (NSString)primaryElementParticipantIdentifier
{
  return self->_primaryElementParticipantIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryElementParticipantIdentifier, 0);
}

@end
