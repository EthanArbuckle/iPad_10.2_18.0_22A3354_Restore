@implementation WFSiriWorkflowRunnerClientOptions

- (WFSiriWorkflowRunnerClientOptions)initWithAirPlayRouteIDs:(id)a3 executionContext:(int64_t)a4 originatingDeviceIDSIdentifier:(id)a5 originatingDeviceRapportEffectiveIdentifier:(id)a6 originatingDeviceRapportMediaSystemIdentifier:(id)a7 isOwnedByCurrentUser:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[WFSiriWorkflowRunnerClientOptions initWithAirPlayRouteIDs:executionContext:originatingDeviceIDSIdentifier:originatingDeviceRapportEffectiveIdentifier:originatingDeviceRapportMediaSystemIdentifier:isOwnedByCurrentUser:disableSiriBehavior:](self, "initWithAirPlayRouteIDs:executionContext:originatingDeviceIDSIdentifier:originatingDeviceRapportEffectiveIdentifier:originatingDeviceRapportMediaSystemIdentifier:isOwnedByCurrentUser:disableSiriBehavior:", a3, a4, a5, a6, a7, a8, v9);
}

- (WFSiriWorkflowRunnerClientOptions)initWithAirPlayRouteIDs:(id)a3 executionContext:(int64_t)a4 originatingDeviceIDSIdentifier:(id)a5 originatingDeviceRapportEffectiveIdentifier:(id)a6 originatingDeviceRapportMediaSystemIdentifier:(id)a7 isOwnedByCurrentUser:(BOOL)a8 disableSiriBehavior:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  WFSiriWorkflowRunnerClientOptions *v19;
  uint64_t v20;
  NSArray *airPlayRouteIDs;
  uint64_t v22;
  NSString *originatingDeviceIDSIdentifier;
  uint64_t v24;
  NSString *originatingDeviceRapportEffectiveIdentifier;
  uint64_t v26;
  NSString *originatingDeviceRapportMediaSystemIdentifier;
  WFSiriWorkflowRunnerClientOptions *v28;
  objc_super v30;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v30.receiver = self;
  v30.super_class = (Class)WFSiriWorkflowRunnerClientOptions;
  v19 = -[WFSiriWorkflowRunnerClientOptions init](&v30, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    airPlayRouteIDs = v19->_airPlayRouteIDs;
    v19->_airPlayRouteIDs = (NSArray *)v20;

    v19->_executionContext = a4;
    v22 = objc_msgSend(v16, "copy");
    originatingDeviceIDSIdentifier = v19->_originatingDeviceIDSIdentifier;
    v19->_originatingDeviceIDSIdentifier = (NSString *)v22;

    v24 = objc_msgSend(v17, "copy");
    originatingDeviceRapportEffectiveIdentifier = v19->_originatingDeviceRapportEffectiveIdentifier;
    v19->_originatingDeviceRapportEffectiveIdentifier = (NSString *)v24;

    v26 = objc_msgSend(v18, "copy");
    originatingDeviceRapportMediaSystemIdentifier = v19->_originatingDeviceRapportMediaSystemIdentifier;
    v19->_originatingDeviceRapportMediaSystemIdentifier = (NSString *)v26;

    v19->_isOwnedByCurrentUser = a8;
    v19->_currentDeviceIdiom = 0;
    v19->_disableSiriBehavior = a9;
    v28 = v19;
  }

  return v19;
}

- (WFSiriWorkflowRunnerClientOptions)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  WFSiriWorkflowRunnerClientOptions *v16;
  uint64_t v18;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("airPlayRouteIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("executionContext"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatingDeviceIDSIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatingDeviceRapportEffectiveIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatingDeviceRapportMediaSystemIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("isOwnedByCurrentUser"));
  v14 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("currentDeviceIdiom"));
  v15 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("disableSiriBehavior"));

  LOBYTE(v18) = v15;
  v16 = -[WFSiriWorkflowRunnerClientOptions initWithAirPlayRouteIDs:executionContext:originatingDeviceIDSIdentifier:originatingDeviceRapportEffectiveIdentifier:originatingDeviceRapportMediaSystemIdentifier:isOwnedByCurrentUser:disableSiriBehavior:](self, "initWithAirPlayRouteIDs:executionContext:originatingDeviceIDSIdentifier:originatingDeviceRapportEffectiveIdentifier:originatingDeviceRapportMediaSystemIdentifier:isOwnedByCurrentUser:disableSiriBehavior:", v8, v9, v10, v11, v12, v13, v18);
  -[WFSiriWorkflowRunnerClientOptions setCurrentDeviceIdiom:](v16, "setCurrentDeviceIdiom:", v14);

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WFSiriWorkflowRunnerClientOptions airPlayRouteIDs](self, "airPlayRouteIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("airPlayRouteIDs"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[WFSiriWorkflowRunnerClientOptions executionContext](self, "executionContext"), CFSTR("executionContext"));
  -[WFSiriWorkflowRunnerClientOptions originatingDeviceIDSIdentifier](self, "originatingDeviceIDSIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("originatingDeviceIDSIdentifier"));

  -[WFSiriWorkflowRunnerClientOptions originatingDeviceRapportEffectiveIdentifier](self, "originatingDeviceRapportEffectiveIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("originatingDeviceRapportEffectiveIdentifier"));

  -[WFSiriWorkflowRunnerClientOptions originatingDeviceRapportMediaSystemIdentifier](self, "originatingDeviceRapportMediaSystemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("originatingDeviceRapportMediaSystemIdentifier"));

  objc_msgSend(v8, "encodeBool:forKey:", -[WFSiriWorkflowRunnerClientOptions isOwnedByCurrentUser](self, "isOwnedByCurrentUser"), CFSTR("isOwnedByCurrentUser"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[WFSiriWorkflowRunnerClientOptions currentDeviceIdiom](self, "currentDeviceIdiom"), CFSTR("currentDeviceIdiom"));
  objc_msgSend(v8, "encodeBool:forKey:", -[WFSiriWorkflowRunnerClientOptions disableSiriBehavior](self, "disableSiriBehavior"), CFSTR("disableSiriBehavior"));

}

- (NSArray)airPlayRouteIDs
{
  return self->_airPlayRouteIDs;
}

- (int64_t)executionContext
{
  return self->_executionContext;
}

- (NSString)originatingDeviceIDSIdentifier
{
  return self->_originatingDeviceIDSIdentifier;
}

- (NSString)originatingDeviceRapportEffectiveIdentifier
{
  return self->_originatingDeviceRapportEffectiveIdentifier;
}

- (NSString)originatingDeviceRapportMediaSystemIdentifier
{
  return self->_originatingDeviceRapportMediaSystemIdentifier;
}

- (BOOL)isOwnedByCurrentUser
{
  return self->_isOwnedByCurrentUser;
}

- (int64_t)currentDeviceIdiom
{
  return self->_currentDeviceIdiom;
}

- (void)setCurrentDeviceIdiom:(int64_t)a3
{
  self->_currentDeviceIdiom = a3;
}

- (BOOL)disableSiriBehavior
{
  return self->_disableSiriBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingDeviceRapportMediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_originatingDeviceRapportEffectiveIdentifier, 0);
  objc_storeStrong((id *)&self->_originatingDeviceIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_airPlayRouteIDs, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
