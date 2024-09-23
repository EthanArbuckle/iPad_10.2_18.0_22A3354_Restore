@implementation SBSRemoteAlertActivationContext

- (SBSRemoteAlertActivationContext)init
{
  id v3;
  SBSRemoteAlertActivationContext *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v4 = -[SBSRemoteAlertActivationContext initWithActions:](self, "initWithActions:", v3);

  return v4;
}

- (SBSRemoteAlertActivationContext)initWithActions:(id)a3
{
  return -[SBSRemoteAlertActivationContext initWithActions:presentationTarget:](self, "initWithActions:presentationTarget:", a3, 0);
}

- (SBSRemoteAlertActivationContext)initWithActions:(id)a3 presentationTarget:(id)a4
{
  return -[SBSRemoteAlertActivationContext initWithActions:presentationTarget:userInfo:](self, "initWithActions:presentationTarget:userInfo:", a3, a4, 0);
}

- (SBSRemoteAlertActivationContext)initWithActions:(id)a3 presentationTarget:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBSRemoteAlertActivationContext *v11;
  uint64_t v12;
  NSSet *actions;
  uint64_t v14;
  NSDictionary *userInfo;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBSRemoteAlertActivationContext;
  v11 = -[SBSRemoteAlertActivationContext init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    actions = v11->_actions;
    v11->_actions = (NSSet *)v12;

    objc_storeStrong((id *)&v11->_presentationTarget, a4);
    v14 = objc_msgSend(v10, "copy");
    userInfo = v11->_userInfo;
    v11->_userInfo = (NSDictionary *)v14;

    v11->_presentationMode = 0;
  }

  return v11;
}

+ (id)activationContextWithLegacyAlertOptions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setLegacyAlertOptions:", v4);

  return v5;
}

- (NSString)description
{
  return (NSString *)-[SBSRemoteAlertActivationContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithActions:presentationTarget:userInfo:", self->_actions, self->_presentationTarget, self->_userInfo);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setReason:", self->_reason);
    objc_msgSend(v5, "setActivatingForSiri:", self->_activatingForSiri);
    objc_msgSend(v5, "setShouldDismissPresentedBanners:", self->_shouldDismissPresentedBanners);
    objc_msgSend(v5, "setShouldStashPictureInPictureIfNeeded:", self->_shouldStashPictureInPictureIfNeeded);
    objc_msgSend(v5, "setActivityContinuationIdentifier:", self->_activityContinuationIdentifier);
    objc_msgSend(v5, "setPresentationMode:", self->_presentationMode);
    objc_msgSend(v5, "setInitialSupportedInterfaceOrientations:", self->_initialSupportedInterfaceOrientations);
  }
  return v5;
}

- (SBSRemoteAlertActivationContext)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBSRemoteAlertActivationContext *v8;
  uint64_t v9;
  NSDictionary *legacyAlertOptions;
  uint64_t v11;
  NSString *reason;
  uint64_t v13;
  NSUUID *activityContinuationIdentifier;

  v4 = a3;
  BSDeserializeSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
  BSDeserializeCFValueFromXPCDictionaryWithKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBSRemoteAlertActivationContext initWithActions:presentationTarget:userInfo:](self, "initWithActions:presentationTarget:userInfo:", v5, v6, v7);
  if (v8)
  {
    BSDeserializeCFValueFromXPCDictionaryWithKey();
    v9 = objc_claimAutoreleasedReturnValue();
    legacyAlertOptions = v8->_legacyAlertOptions;
    v8->_legacyAlertOptions = (NSDictionary *)v9;

    BSDeserializeStringFromXPCDictionaryWithKey();
    v11 = objc_claimAutoreleasedReturnValue();
    reason = v8->_reason;
    v8->_reason = (NSString *)v11;

    v8->_activatingForSiri = xpc_dictionary_get_BOOL(v4, "activatingForSiri");
    objc_opt_class();
    BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
    v13 = objc_claimAutoreleasedReturnValue();
    activityContinuationIdentifier = v8->_activityContinuationIdentifier;
    v8->_activityContinuationIdentifier = (NSUUID *)v13;

    v8->_switcherEligible = xpc_dictionary_get_BOOL(v4, "switcherEligible");
    v8->_shouldInvalidateWhenDeactivated = xpc_dictionary_get_BOOL(v4, "shouldInvalidateWhenDeactivated");
    v8->_shouldDismissPresentedBanners = xpc_dictionary_get_BOOL(v4, "shouldDismissPresentedBanners");
    v8->_shouldStashPictureInPictureIfNeeded = xpc_dictionary_get_BOOL(v4, "shouldStashPictureInPictureIfNeeded");
    v8->_presentationMode = xpc_dictionary_get_int64(v4, "presentationMode");
    v8->_initialSupportedInterfaceOrientations = xpc_dictionary_get_int64(v4, "initialSupportedInterfaceOrientations");
  }

  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  void *v4;
  xpc_object_t xdict;

  xdict = a3;
  if (self->_reason)
    BSSerializeStringToXPCDictionaryWithKey();
  if (self->_legacyAlertOptions)
    BSSerializeCFValueToXPCDictionaryWithKey();
  if (self->_activityContinuationIdentifier)
    BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  if (-[NSSet count](self->_actions, "count"))
    BSSerializeSetToXPCDictionaryWithKey();
  if (self->_presentationTarget)
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  v4 = xdict;
  if (self->_userInfo)
  {
    BSSerializeCFValueToXPCDictionaryWithKey();
    v4 = xdict;
  }
  xpc_dictionary_set_BOOL(v4, "activatingForSiri", self->_activatingForSiri);
  xpc_dictionary_set_BOOL(xdict, "switcherEligible", self->_switcherEligible);
  xpc_dictionary_set_BOOL(xdict, "shouldInvalidateWhenDeactivated", self->_shouldInvalidateWhenDeactivated);
  xpc_dictionary_set_BOOL(xdict, "shouldDismissPresentedBanners", self->_shouldDismissPresentedBanners);
  xpc_dictionary_set_BOOL(xdict, "shouldStashPictureInPictureIfNeeded", self->_shouldStashPictureInPictureIfNeeded);
  xpc_dictionary_set_int64(xdict, "presentationMode", self->_presentationMode);
  xpc_dictionary_set_int64(xdict, "initialSupportedInterfaceOrientations", self->_initialSupportedInterfaceOrientations);

}

id __59__SBSRemoteAlertActivationContext_encodeWithXPCDictionary___block_invoke()
{
  return (id)BSCreateSerializedBSXPCEncodableObject();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBSRemoteAlertActivationContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SBSRemoteAlertActivationContext *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *reason;
  uint64_t v17;
  NSUUID *activityContinuationIdentifier;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("actions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("presentationTarget"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBSRemoteAlertActivationContext initWithActions:presentationTarget:](self, "initWithActions:presentationTarget:", v11, v10);

  if (v12)
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("legacyOptions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isNSDictionary"))
      objc_storeStrong((id *)&v12->_legacyAlertOptions, v13);
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isNSDictionary"))
      objc_storeStrong((id *)&v12->_userInfo, v14);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v15 = objc_claimAutoreleasedReturnValue();
    reason = v12->_reason;
    v12->_reason = (NSString *)v15;

    v12->_activatingForSiri = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("activatingForSiri"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityContinuationIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    activityContinuationIdentifier = v12->_activityContinuationIdentifier;
    v12->_activityContinuationIdentifier = (NSUUID *)v17;

    v12->_switcherEligible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("switcherEligible"));
    v12->_shouldInvalidateWhenDeactivated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldInvalidateWhenDeactivated"));
    v12->_shouldDismissPresentedBanners = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldDismissPresentedBanners"));
    v12->_shouldStashPictureInPictureIfNeeded = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldStashPictureInPictureIfNeeded"));
    v12->_presentationMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("presentationMode"));
    v12->_initialSupportedInterfaceOrientations = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("initialSupportedInterfaceOrientations"));

  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *actions;
  void *v5;
  NSUUID *activityContinuationIdentifier;
  NSDictionary *legacyAlertOptions;
  void *v8;
  NSString *reason;
  SBSRemoteAlertPresentationTarget *presentationTarget;
  NSDictionary *userInfo;
  id v12;

  v12 = a3;
  actions = self->_actions;
  if (actions)
  {
    -[NSSet allObjects](actions, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("actions"));

  }
  activityContinuationIdentifier = self->_activityContinuationIdentifier;
  if (activityContinuationIdentifier)
    objc_msgSend(v12, "encodeObject:forKey:", activityContinuationIdentifier, CFSTR("activityContinuationIdentifier"));
  legacyAlertOptions = self->_legacyAlertOptions;
  v8 = v12;
  if (legacyAlertOptions)
  {
    objc_msgSend(v12, "encodeObject:forKey:", legacyAlertOptions, CFSTR("legacyOptions"));
    v8 = v12;
  }
  reason = self->_reason;
  if (reason)
  {
    objc_msgSend(v12, "encodeObject:forKey:", reason, CFSTR("reason"));
    v8 = v12;
  }
  presentationTarget = self->_presentationTarget;
  if (presentationTarget)
  {
    objc_msgSend(v12, "encodeObject:forKey:", presentationTarget, CFSTR("presentationTarget"));
    v8 = v12;
  }
  userInfo = self->_userInfo;
  if (userInfo)
  {
    objc_msgSend(v12, "encodeObject:forKey:", userInfo, CFSTR("userInfo"));
    v8 = v12;
  }
  objc_msgSend(v8, "encodeBool:forKey:", self->_activatingForSiri, CFSTR("activatingForSiri"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_switcherEligible, CFSTR("switcherEligible"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_shouldInvalidateWhenDeactivated, CFSTR("shouldInvalidateWhenDeactivated"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_shouldDismissPresentedBanners, CFSTR("shouldDismissPresentedBanners"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_shouldStashPictureInPictureIfNeeded, CFSTR("shouldStashPictureInPictureIfNeeded"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_presentationMode, CFSTR("presentationMode"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_initialSupportedInterfaceOrientations, CFSTR("initialSupportedInterfaceOrientations"));

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSRemoteAlertActivationContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBSRemoteAlertActivationContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  -[SBSRemoteAlertActivationContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_reason, CFSTR("reason"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_actions, CFSTR("actions"));
  v7 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_activityContinuationIdentifier, CFSTR("activityContinuationIdentifier"), 1);
  v8 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_legacyAlertOptions, CFSTR("legacyAlertOptions"), 1);
  -[SBSRemoteAlertPresentationTarget description](self->_presentationTarget, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("presentationTarget"));

  v11 = (id)objc_msgSend(v4, "appendBool:withName:", self->_activatingForSiri, CFSTR("activatingForSiri"));
  v12 = (id)objc_msgSend(v4, "appendBool:withName:", self->_shouldInvalidateWhenDeactivated, CFSTR("shouldInvalidateWhenDeactivated"));
  v13 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_shouldDismissPresentedBanners, CFSTR("shouldDismissPresentedBanners"), 1);
  v14 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_shouldStashPictureInPictureIfNeeded, CFSTR("shouldStashPictureInPictureIfNeeded"), 1);
  v15 = (id)objc_msgSend(v4, "appendInteger:withName:", self->_presentationMode, CFSTR("presentationMode"));
  if (self->_initialSupportedInterfaceOrientations)
  {
    BSInterfaceOrientationMaskDescription();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v4, "appendObject:withName:", v16, CFSTR("initialSupportedInterfaceOrientations"));

  }
  -[NSDictionary description](self->_userInfo, "description");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v4, "appendObject:withName:", v18, 0);

  return v4;
}

- (void)setLegacyAlertOptions:(id)a3
{
  NSDictionary *v4;
  NSDictionary *legacyAlertOptions;
  BOOL v6;
  NSDictionary *v7;
  NSDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;

  v4 = (NSDictionary *)a3;
  legacyAlertOptions = self->_legacyAlertOptions;
  if (legacyAlertOptions != v4)
  {
    v14 = v4;
    v6 = -[NSDictionary isEqualToDictionary:](legacyAlertOptions, "isEqualToDictionary:", v4);
    v4 = v14;
    if (!v6)
    {
      v7 = (NSDictionary *)-[NSDictionary copy](v14, "copy");
      v8 = self->_legacyAlertOptions;
      self->_legacyAlertOptions = v7;

      v4 = v14;
      if (self->_legacyAlertOptions)
      {
        -[SBSRemoteAlertActivationContext reason](self, "reason");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          -[NSDictionary bs_safeStringForKey:](self->_legacyAlertOptions, "bs_safeStringForKey:", CFSTR("CustomActivationReason"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSRemoteAlertActivationContext setReason:](self, "setReason:", v10);

        }
        -[SBSRemoteAlertActivationContext activityContinuationIdentifier](self, "activityContinuationIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          -[NSDictionary bs_safeStringForKey:](self->_legacyAlertOptions, "bs_safeStringForKey:", CFSTR("ActivityContinuationIdentifier"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);
            if (v13)
              -[SBSRemoteAlertActivationContext setActivityContinuationIdentifier:](self, "setActivityContinuationIdentifier:", v13);

          }
        }
        -[SBSRemoteAlertActivationContext setActivatingForSiri:](self, "setActivatingForSiri:", -[NSDictionary bs_BOOLForKey:](self->_legacyAlertOptions, "bs_BOOLForKey:", CFSTR("ActivateForAssistant")));
        v4 = v14;
      }
    }
  }

}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isActivatingForSiri
{
  return self->_activatingForSiri;
}

- (void)setActivatingForSiri:(BOOL)a3
{
  self->_activatingForSiri = a3;
}

- (BOOL)shouldDismissPresentedBanners
{
  return self->_shouldDismissPresentedBanners;
}

- (void)setShouldDismissPresentedBanners:(BOOL)a3
{
  self->_shouldDismissPresentedBanners = a3;
}

- (BOOL)shouldStashPictureInPictureIfNeeded
{
  return self->_shouldStashPictureInPictureIfNeeded;
}

- (void)setShouldStashPictureInPictureIfNeeded:(BOOL)a3
{
  self->_shouldStashPictureInPictureIfNeeded = a3;
}

- (NSSet)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSUUID)activityContinuationIdentifier
{
  return self->_activityContinuationIdentifier;
}

- (void)setActivityContinuationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)initialSupportedInterfaceOrientations
{
  return self->_initialSupportedInterfaceOrientations;
}

- (void)setInitialSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_initialSupportedInterfaceOrientations = a3;
}

- (SBSRemoteAlertPresentationTarget)presentationTarget
{
  return self->_presentationTarget;
}

- (void)setPresentationTarget:(id)a3
{
  objc_storeStrong((id *)&self->_presentationTarget, a3);
}

- (NSDictionary)legacyAlertOptions
{
  return self->_legacyAlertOptions;
}

- (BOOL)shouldInvalidateWhenDeactivated
{
  return self->_shouldInvalidateWhenDeactivated;
}

- (void)setShouldInvalidateWhenDeactivated:(BOOL)a3
{
  self->_shouldInvalidateWhenDeactivated = a3;
}

- (BOOL)isSwitcherEligible
{
  return self->_switcherEligible;
}

- (void)setSwitcherEligible:(BOOL)a3
{
  self->_switcherEligible = a3;
}

- (int64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(int64_t)a3
{
  self->_presentationMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyAlertOptions, 0);
  objc_storeStrong((id *)&self->_presentationTarget, 0);
  objc_storeStrong((id *)&self->_activityContinuationIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
