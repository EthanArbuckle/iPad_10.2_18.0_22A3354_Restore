@implementation STContentPrivacyViewModel

- (STContentPrivacyViewModel)init
{
  STContentPrivacyViewModel *v2;
  STContentPrivacyViewModel *v3;
  uint64_t v4;
  NSSet *visibleRestrictions;
  uint64_t v6;
  NSMutableDictionary *valuesByRestriction;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STContentPrivacyViewModel;
  v2 = -[STContentPrivacyViewModel init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isLocalDevice = 0;
    v2->_restrictionsEnabled = 0;
    v4 = objc_opt_new();
    visibleRestrictions = v3->_visibleRestrictions;
    v3->_visibleRestrictions = (NSSet *)v4;

    v6 = objc_opt_new();
    valuesByRestriction = v3->_valuesByRestriction;
    v3->_valuesByRestriction = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (id)visibleRestrictionWithConfiguration:(id)a3 key:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  STRestrictionItem *v12;
  void *v13;
  void *v15;

  v7 = a3;
  v8 = a4;
  STSupportedConfigurations();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "objectForKeyedSubscript:", v7);

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STContentPrivacyViewModel.m"), 240, CFSTR("Unknown configuration"));

  }
  -[STContentPrivacyViewModel visibleRestrictions](self, "visibleRestrictions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", v7, v8, &stru_24DB8A1D0, 3, 0);

  objc_msgSend(v11, "member:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)defaultValueForRestriction:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "restrictionType");
  v6 = (void *)MEMORY[0x24BDBD1C8];
  switch(v5)
  {
    case 0:
      break;
    case 1:
      v6 = (void *)MEMORY[0x24BDBD1C0];
      break;
    case 2:
      v6 = (void *)MEMORY[0x24BDBD1A8];
      break;
    case 3:
      objc_msgSend(v4, "otherInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("STContentPrivacyViewModel.m"), 265, CFSTR("Unimplemented type %d"), v5);

      v6 = 0;
      break;
  }

  return v6;
}

- (BOOL)shouldEnableRestriction:(id)a3
{
  void *v4;
  int v5;
  STRestrictionItem *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;

  objc_msgSend(a3, "payloadKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("allowGameCenterNearbyMultiplayer"));

  if (!v5)
    return -[STContentPrivacyViewModel restrictionsEnabled](self, "restrictionsEnabled");
  v6 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", CFSTR("system.gamecenter"), CFSTR("allowedGameCenterOtherPlayerTypes"), &stru_24DB8A1D0, 3, 0);
  -[STContentPrivacyViewModel valuesByRestriction](self, "valuesByRestriction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v8, "integerValue");
    v10 = objc_msgSend(&unk_24DBBE898, "integerValue");
    v11 = -[STContentPrivacyViewModel restrictionsEnabled](self, "restrictionsEnabled");
    v12 = v9 != v10 && v11;
  }
  else
  {
    v12 = -[STContentPrivacyViewModel restrictionsEnabled](self, "restrictionsEnabled");
  }

  return v12;
}

- (BOOL)isEligibleForAppDistribution
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  +[STContentPrivacyViewModelCoordinator appRatingsRestrictionItem](STContentPrivacyViewModelCoordinator, "appRatingsRestrictionItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STContentPrivacyViewModel valuesByRestriction](self, "valuesByRestriction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToNumber:", &unk_24DBBE8B0);

  LOBYTE(v4) = v6 | +[STDistributionEligibility evaluateEligibilityForAppDistribution](STDistributionEligibility, "evaluateEligibilityForAppDistribution");
  return (char)v4;
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void)setIsLoaded:(BOOL)a3
{
  self->_isLoaded = a3;
}

- (BOOL)isLocalDevice
{
  return self->_isLocalDevice;
}

- (void)setIsLocalDevice:(BOOL)a3
{
  self->_isLocalDevice = a3;
}

- (BOOL)hasPasscode
{
  return self->_hasPasscode;
}

- (void)setHasPasscode:(BOOL)a3
{
  self->_hasPasscode = a3;
}

- (BOOL)restrictionsEnabled
{
  return self->_restrictionsEnabled;
}

- (void)setRestrictionsEnabled:(BOOL)a3
{
  self->_restrictionsEnabled = a3;
}

- (BOOL)shouldAllowEditing
{
  return self->_shouldAllowEditing;
}

- (void)setShouldAllowEditing:(BOOL)a3
{
  self->_shouldAllowEditing = a3;
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)userDSID
{
  return self->_userDSID;
}

- (void)setUserDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableDictionary)valuesByRestriction
{
  return self->_valuesByRestriction;
}

- (void)setValuesByRestriction:(id)a3
{
  objc_storeStrong((id *)&self->_valuesByRestriction, a3);
}

- (STCommunicationLimits)communicationLimits
{
  return (STCommunicationLimits *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCommunicationLimits:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)userIsManaged
{
  return self->_userIsManaged;
}

- (void)setUserIsManaged:(BOOL)a3
{
  self->_userIsManaged = a3;
}

- (BOOL)userIsRemote
{
  return self->_userIsRemote;
}

- (void)setUserIsRemote:(BOOL)a3
{
  self->_userIsRemote = a3;
}

- (unint64_t)userType
{
  return self->_userType;
}

- (void)setUserType:(unint64_t)a3
{
  self->_userType = a3;
}

- (NSSet)visibleRestrictions
{
  return self->_visibleRestrictions;
}

- (void)setVisibleRestrictions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleRestrictions, 0);
  objc_storeStrong((id *)&self->_communicationLimits, 0);
  objc_storeStrong((id *)&self->_valuesByRestriction, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_userName, 0);
}

@end
