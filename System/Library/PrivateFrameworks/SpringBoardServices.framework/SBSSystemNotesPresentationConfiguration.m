@implementation SBSSystemNotesPresentationConfiguration

- (SBSSystemNotesPresentationConfiguration)initWithSceneBundleIdentifier:(id)a3
{
  return -[SBSSystemNotesPresentationConfiguration initWithSceneBundleIdentifier:userActivity:](self, "initWithSceneBundleIdentifier:userActivity:", a3, 0);
}

- (SBSSystemNotesPresentationConfiguration)initWithSceneBundleIdentifier:(id)a3 userActivity:(id)a4
{
  return -[SBSSystemNotesPresentationConfiguration initWithSceneBundleIdentifier:userActivity:preferredPresentationMode:](self, "initWithSceneBundleIdentifier:userActivity:preferredPresentationMode:", a3, a4, 1);
}

- (SBSSystemNotesPresentationConfiguration)initWithSceneBundleIdentifier:(id)a3 userActivity:(id)a4 preferredPresentationMode:(int64_t)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  SBSSystemNotesPresentationConfiguration *v12;

  v8 = (void *)MEMORY[0x1E0CB3A28];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBSSystemNotesPresentationConfiguration initWithSceneBundleIdentifier:userActivity:preferredPresentationMode:identifier:](self, "initWithSceneBundleIdentifier:userActivity:preferredPresentationMode:identifier:", v10, v9, a5, v11);

  return v12;
}

- (SBSSystemNotesPresentationConfiguration)initWithSceneBundleIdentifier:(id)a3 userActivity:(id)a4 preferredPresentationMode:(int64_t)a5 identifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  SBSSystemNotesPresentationConfiguration *v14;
  uint64_t v15;
  NSString *sceneBundleIdentifier;
  void *v18;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!SBSSystemNotesPresentationModeIsValid(a5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemNotesPresentationConfiguration.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("SBSSystemNotesPresentationModeIsValid(preferredPresentationMode)"));

  }
  v19.receiver = self;
  v19.super_class = (Class)SBSSystemNotesPresentationConfiguration;
  v14 = -[SBSSystemNotesPresentationConfiguration init](&v19, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v11, "copy");
    sceneBundleIdentifier = v14->_sceneBundleIdentifier;
    v14->_sceneBundleIdentifier = (NSString *)v15;

    objc_storeStrong((id *)&v14->_userActivity, a4);
    v14->_preferredPresentationMode = a5;
    objc_storeStrong((id *)&v14->_identifier, a6);
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  SBSSystemNotesPresentationConfiguration *v4;
  BOOL v5;

  v4 = (SBSSystemNotesPresentationConfiguration *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[SBSSystemNotesPresentationConfiguration isEqualToSystemNotesPresentationConfiguration:](self, "isEqualToSystemNotesPresentationConfiguration:", v4);
  }

  return v5;
}

- (BOOL)isEqualToSystemNotesPresentationConfiguration:(id)a3
{
  return SBSDiffSystemNotesPresentationConfigurations(self, a3) == 0;
}

- (SBSSystemNotesPresentationConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  SBSSystemNotesPresentationConfiguration *v12;
  SBSSystemNotesPresentationConfiguration *v13;
  SBSSystemNotesPresentationConfiguration *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneBundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userActivityData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityData:", v6);
    v8 = (void *)v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 0;
    if (v9)
    {
      v14 = 0;
    }
    else
    {
      v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredPresentationMode"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SBSSystemNotesPresentationConfiguration initWithSceneBundleIdentifier:userActivity:preferredPresentationMode:identifier:](self, "initWithSceneBundleIdentifier:userActivity:preferredPresentationMode:identifier:", v5, v8, v10, v11);
      v13 = v12;
      if (v12)
        objc_storeStrong((id *)&v12->_userActivityData, v6);
      self = v13;

      v14 = self;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  NSData *userActivityData;
  void *v7;
  id v8;

  v5 = a3;
  userActivityData = self->_userActivityData;
  v8 = v5;
  if (self->_userActivity)
  {
    if (userActivityData)
      goto LABEL_5;
    goto LABEL_3;
  }
  if (userActivityData)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemNotesPresentationConfiguration.m"), 112, CFSTR("attempting to encode an SBSSystemNotesPresentationConfiguration object with invalid NSUserActivity or its NSData representation. activity: %@; data: %@"),
      self->_userActivity,
      self->_userActivityData);

  }
LABEL_5:
  objc_msgSend(v8, "encodeObject:forKey:", self->_sceneBundleIdentifier, CFSTR("sceneBundleIdentifier"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_preferredPresentationMode, CFSTR("preferredPresentationMode"));
  if (self->_userActivity)
    objc_msgSend(v8, "encodeObject:forKey:", self->_userActivityData, CFSTR("userActivityData"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSceneBundleIdentifier:userActivity:preferredPresentationMode:identifier:", self->_sceneBundleIdentifier, self->_userActivity, self->_preferredPresentationMode, self->_identifier);
  objc_storeStrong(v4 + 1, self->_userActivityData);
  return v4;
}

- (NSString)description
{
  return (NSString *)-[SBSSystemNotesPresentationConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSSystemNotesPresentationConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("identifier"));

  objc_msgSend(v3, "appendString:withName:", self->_sceneBundleIdentifier, CFSTR("sceneBundleIdentifier"));
  SBSSystemNotesPresentationModeDescription(self->_preferredPresentationMode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("preferredPresentationMode"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSSystemNotesPresentationConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  -[SBSSystemNotesPresentationConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_userActivity, CFSTR("userActivity"), 1);
  return v4;
}

- (SBSSystemNotesPresentationConfiguration)presentationConfigurationWithPreferredPresentationMode:(int64_t)a3
{
  id *v4;

  v4 = (id *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSceneBundleIdentifier:userActivity:preferredPresentationMode:identifier:", self->_sceneBundleIdentifier, self->_userActivity, a3, self->_identifier);
  objc_storeStrong(v4 + 1, self->_userActivityData);
  return (SBSSystemNotesPresentationConfiguration *)v4;
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (void)prepareForXPCCall:(id)a3
{
  id v4;
  void *v5;
  NSUserActivity *userActivity;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  userActivity = self->_userActivity;
  if (userActivity && !self->_userActivityData)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__SBSSystemNotesPresentationConfiguration_prepareForXPCCall___block_invoke;
    v7[3] = &unk_1E288EF80;
    v7[4] = self;
    v8 = v4;
    -[NSUserActivity _createUserActivityDataWithOptions:completionHandler:](userActivity, "_createUserActivityDataWithOptions:completionHandler:", MEMORY[0x1E0C9AA70], v7);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __61__SBSSystemNotesPresentationConfiguration_prepareForXPCCall___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
  v6 = a2;
  v7 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSString)sceneBundleIdentifier
{
  return self->_sceneBundleIdentifier;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (int64_t)preferredPresentationMode
{
  return self->_preferredPresentationMode;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_sceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
}

@end
