@implementation PKInAppPaymentPresentationHostContext

- (id)copyWithZone:(_NSZone *)a3
{
  PKInAppPaymentPresentationHostContext *v4;
  uint64_t v5;
  NSString *identifier;
  uint64_t v7;
  NSString *sceneIdentifier;
  uint64_t v9;
  NSString *teamID;
  uint64_t v11;
  NSString *applicationName;
  uint64_t v13;
  NSString *bundleIdentifier;
  uint64_t v15;
  NSString *applicationIdentifier;
  uint64_t v17;
  NSString *sceneBundleIdentifier;

  v4 = -[PKInAppPaymentPresentationHostContext init](+[PKInAppPaymentPresentationHostContext allocWithZone:](PKInAppPaymentPresentationHostContext, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_identifier, "copy");
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  v7 = -[NSString copy](self->_sceneIdentifier, "copy");
  sceneIdentifier = v4->_sceneIdentifier;
  v4->_sceneIdentifier = (NSString *)v7;

  v9 = -[NSString copy](self->_teamID, "copy");
  teamID = v4->_teamID;
  v4->_teamID = (NSString *)v9;

  v11 = -[NSString copy](self->_applicationName, "copy");
  applicationName = v4->_applicationName;
  v4->_applicationName = (NSString *)v11;

  v13 = -[NSString copy](self->_bundleIdentifier, "copy");
  bundleIdentifier = v4->_bundleIdentifier;
  v4->_bundleIdentifier = (NSString *)v13;

  v15 = -[NSString copy](self->_applicationIdentifier, "copy");
  applicationIdentifier = v4->_applicationIdentifier;
  v4->_applicationIdentifier = (NSString *)v15;

  v17 = -[NSString copy](self->_sceneBundleIdentifier, "copy");
  sceneBundleIdentifier = v4->_sceneBundleIdentifier;
  v4->_sceneBundleIdentifier = (NSString *)v17;

  v4->_omitPresentationTarget = self->_omitPresentationTarget;
  return v4;
}

- (PKInAppPaymentPresentationHostContext)initWithCoder:(id)a3
{
  id v4;
  PKInAppPaymentPresentationHostContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKInAppPaymentPresentationHostContext;
  v5 = -[PKInAppPaymentPresentationHostContext init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKInAppPaymentPresentationHostContext setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKInAppPaymentPresentationHostContext setSceneIdentifier:](v5, "setSceneIdentifier:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("teamID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKInAppPaymentPresentationHostContext setTeamID:](v5, "setTeamID:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKInAppPaymentPresentationHostContext setApplicationName:](v5, "setApplicationName:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKInAppPaymentPresentationHostContext setBundleIdentifier:](v5, "setBundleIdentifier:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKInAppPaymentPresentationHostContext setApplicationIdentifier:](v5, "setApplicationIdentifier:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneBundleIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKInAppPaymentPresentationHostContext setSceneBundleIdentifier:](v5, "setSceneBundleIdentifier:", v12);

    -[PKInAppPaymentPresentationHostContext setOmitPresentationTarget:](v5, "setOmitPresentationTarget:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("omitPresentationTarget")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PKInAppPaymentPresentationHostContext identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[PKInAppPaymentPresentationHostContext sceneIdentifier](self, "sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("sceneIdentifier"));

  -[PKInAppPaymentPresentationHostContext teamID](self, "teamID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("teamID"));

  -[PKInAppPaymentPresentationHostContext applicationName](self, "applicationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("applicationName"));

  -[PKInAppPaymentPresentationHostContext bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("bundleIdentifier"));

  -[PKInAppPaymentPresentationHostContext applicationIdentifier](self, "applicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("applicationIdentifier"));

  -[PKInAppPaymentPresentationHostContext sceneBundleIdentifier](self, "sceneBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("sceneBundleIdentifier"));

  objc_msgSend(v11, "encodeBool:forKey:", -[PKInAppPaymentPresentationHostContext omitPresentationTarget](self, "omitPresentationTarget"), CFSTR("omitPresentationTarget"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_sceneIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_teamID);
  objc_msgSend(v3, "safelyAddObject:", self->_applicationName);
  objc_msgSend(v3, "safelyAddObject:", self->_bundleIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_applicationName);
  objc_msgSend(v3, "safelyAddObject:", self->_sceneBundleIdentifier);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_omitPresentationTarget);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  v8.receiver = self;
  v8.super_class = (Class)PKInAppPaymentPresentationHostContext;
  v5 = -[PKInAppPaymentPresentationHostContext hash](&v8, sel_hash);
  v6 = PKCombinedHash((uint64_t)v5, v3);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKInAppPaymentPresentationHostContext *v4;
  PKInAppPaymentPresentationHostContext *v5;
  BOOL v6;

  v4 = (PKInAppPaymentPresentationHostContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKInAppPaymentPresentationHostContext isEqualToHostContext:](self, "isEqualToHostContext:", v5);

  return v6;
}

- (BOOL)isEqualToHostContext:(id)a3
{
  id v4;
  void *v5;
  NSString *identifier;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  NSString *sceneIdentifier;
  void *v14;
  NSString *v15;
  NSString *v16;
  _BOOL4 v17;
  NSString *teamID;
  void *v19;
  NSString *v20;
  NSString *v21;
  _BOOL4 v22;
  NSString *applicationName;
  void *v24;
  NSString *v25;
  NSString *v26;
  _BOOL4 v27;
  NSString *bundleIdentifier;
  void *v29;
  NSString *v30;
  NSString *v31;
  NSString *v32;
  void *v33;
  NSString *v34;
  NSString *v35;
  NSString *sceneBundleIdentifier;
  void *v37;
  NSString *v38;
  NSString *v39;
  int omitPresentationTarget;
  _BOOL4 v42;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    identifier = self->_identifier;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = identifier;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {

    }
    else
    {
      LOBYTE(v11) = 0;
      if (!v8 || !v9)
      {
        v15 = v9;
LABEL_58:

        goto LABEL_59;
      }
      v12 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

      if (!v12)
      {
        LOBYTE(v11) = 0;
LABEL_60:

        goto LABEL_61;
      }
    }
    sceneIdentifier = self->_sceneIdentifier;
    objc_msgSend(v5, "sceneIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = sceneIdentifier;
    v16 = v14;
    v8 = v16;
    if (v15 == v16)
    {

    }
    else
    {
      LOBYTE(v11) = 0;
      if (!v15 || !v16)
      {
        v20 = v16;
LABEL_57:

        goto LABEL_58;
      }
      v17 = -[NSString isEqualToString:](v15, "isEqualToString:", v16);

      if (!v17)
      {
        LOBYTE(v11) = 0;
LABEL_59:

        goto LABEL_60;
      }
    }
    teamID = self->_teamID;
    objc_msgSend(v5, "teamID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = teamID;
    v21 = v19;
    v15 = v21;
    if (v20 == v21)
    {

    }
    else
    {
      LOBYTE(v11) = 0;
      if (!v20 || !v21)
      {
        v25 = v21;
LABEL_56:

        goto LABEL_57;
      }
      v22 = -[NSString isEqualToString:](v20, "isEqualToString:", v21);

      if (!v22)
      {
        LOBYTE(v11) = 0;
        goto LABEL_58;
      }
    }
    applicationName = self->_applicationName;
    objc_msgSend(v5, "applicationName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = applicationName;
    v26 = v24;
    v20 = v26;
    if (v25 == v26)
    {

    }
    else
    {
      LOBYTE(v11) = 0;
      if (!v25 || !v26)
      {
        v30 = v26;
LABEL_55:

        goto LABEL_56;
      }
      v27 = -[NSString isEqualToString:](v25, "isEqualToString:", v26);

      if (!v27)
      {
        LOBYTE(v11) = 0;
        goto LABEL_57;
      }
    }
    bundleIdentifier = self->_bundleIdentifier;
    objc_msgSend(v5, "bundleIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = bundleIdentifier;
    v31 = v29;
    v25 = v31;
    if (v30 == v31)
    {

    }
    else
    {
      LOBYTE(v11) = 0;
      if (!v30 || !v31)
      {
        v34 = v31;
LABEL_54:

        goto LABEL_55;
      }
      v11 = -[NSString isEqualToString:](v30, "isEqualToString:", v31);

      if (!v11)
        goto LABEL_56;
    }
    v32 = self->_applicationName;
    objc_msgSend(v5, "applicationName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v32;
    v35 = v33;
    v30 = v35;
    if (v34 == v35)
    {

    }
    else
    {
      if (!v34 || !v35)
      {

        goto LABEL_53;
      }
      v11 = -[NSString isEqualToString:](v34, "isEqualToString:", v35);

      if (!v11)
        goto LABEL_55;
    }
    sceneBundleIdentifier = self->_sceneBundleIdentifier;
    objc_msgSend(v5, "sceneBundleIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = sceneBundleIdentifier;
    v39 = v37;
    v34 = v39;
    if (v38 == v39)
    {

LABEL_51:
      omitPresentationTarget = self->_omitPresentationTarget;
      LOBYTE(v11) = omitPresentationTarget == objc_msgSend(v5, "omitPresentationTarget");
      goto LABEL_54;
    }
    if (v38 && v39)
    {
      v42 = -[NSString isEqualToString:](v38, "isEqualToString:", v39);

      if (!v42)
        goto LABEL_53;
      goto LABEL_51;
    }

LABEL_53:
    LOBYTE(v11) = 0;
    goto LABEL_54;
  }
  LOBYTE(v11) = 0;
LABEL_61:

  return v11;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)sceneBundleIdentifier
{
  return self->_sceneBundleIdentifier;
}

- (void)setSceneBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)omitPresentationTarget
{
  return self->_omitPresentationTarget;
}

- (void)setOmitPresentationTarget:(BOOL)a3
{
  self->_omitPresentationTarget = a3;
}

- (NSString)analyticsSubject
{
  return self->_analyticsSubject;
}

- (void)setAnalyticsSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)analyticsArchivedSessionToken
{
  return self->_analyticsArchivedSessionToken;
}

- (void)setAnalyticsArchivedSessionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsArchivedSessionToken, 0);
  objc_storeStrong((id *)&self->_analyticsSubject, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_sceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
}

@end
