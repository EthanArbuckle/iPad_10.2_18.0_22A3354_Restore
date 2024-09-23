@implementation WFLinkContextualAction

- (WFLinkContextualAction)initWithAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 contextualParameters:(id)a6 authenticationPolicy:(int64_t)a7 icon:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  WFLinkContextualAction *v27;
  uint64_t v28;
  NSString *appBundleIdentifier;
  uint64_t v30;
  NSString *extensionBundleIdentifier;
  WFLinkContextualAction *v32;
  void *v34;
  void *v35;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkContextualAction.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkContextualAction.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appBundleIdentifier"));

LABEL_3:
  v37[0] = v16;
  objc_msgSend(v15, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "componentsJoinedByString:", CFSTR("."));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v18, "copy");
  v24 = (void *)v23;
  v25 = (void *)MEMORY[0x1E0C9AA60];
  if (v23)
    v25 = (void *)v23;
  v26 = v25;

  v27 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:](self, "initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:", v22, &stru_1E5FC92C0, v16, v26, CFSTR("Run Link Action"), CFSTR("Run Link Action"), 0, v19);
  if (v27)
  {
    objc_storeStrong((id *)&v27->_linkAction, a3);
    v28 = objc_msgSend(v16, "copy");
    appBundleIdentifier = v27->_appBundleIdentifier;
    v27->_appBundleIdentifier = (NSString *)v28;

    v30 = objc_msgSend(v17, "copy");
    extensionBundleIdentifier = v27->_extensionBundleIdentifier;
    v27->_extensionBundleIdentifier = (NSString *)v30;

    v27->_authenticationPolicy = a7;
    v32 = v27;
  }

  return v27;
}

- (id)copyWithParameters:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[WFLinkContextualAction linkAction](self, "linkAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkContextualAction appBundleIdentifier](self, "appBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkContextualAction extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFLinkContextualAction authenticationPolicy](self, "authenticationPolicy");
  -[WFContextualAction icon](self, "icon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithAction:appBundleIdentifier:extensionBundleIdentifier:contextualParameters:authenticationPolicy:icon:", v6, v7, v8, v4, v9, v10);

  return v11;
}

- (BOOL)showsUserInterfaceWhenRunning
{
  return 1;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  unint64_t v12;
  objc_super v14;

  v3 = (void *)objc_opt_new();
  v14.receiver = self;
  v14.super_class = (Class)WFLinkContextualAction;
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v14, sel_hash));
  -[WFLinkContextualAction appBundleIdentifier](self, "appBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v5);

  -[WFLinkContextualAction extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v7);

  -[WFLinkContextualAction linkAction](self, "linkAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "combine:", v9);

  v11 = (id)objc_msgSend(v3, "combineInteger:", -[WFLinkContextualAction authenticationPolicy](self, "authenticationPolicy"));
  v12 = objc_msgSend(v3, "finalize");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WFLinkContextualAction;
  if (-[WFContextualAction isEqual:](&v25, sel_isEqual_, v4))
  {
    v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(v5, "appBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLinkContextualAction appBundleIdentifier](self, "appBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {

    }
    else
    {
      LOBYTE(v11) = 0;
      v12 = v9;
      v13 = v8;
      if (!v8 || !v9)
        goto LABEL_27;
      v14 = objc_msgSend(v8, "isEqualToString:", v9);

      if (!v14)
      {
        LOBYTE(v11) = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    objc_msgSend(v5, "extensionBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLinkContextualAction extensionBundleIdentifier](self, "extensionBundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;
    v17 = v16;
    v12 = v17;
    if (v13 == v17)
    {

    }
    else
    {
      LOBYTE(v11) = 0;
      v18 = v17;
      v19 = v13;
      if (!v13 || !v17)
        goto LABEL_26;
      v20 = objc_msgSend(v13, "isEqualToString:", v17);

      if (!v20)
      {
        LOBYTE(v11) = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    objc_msgSend(v5, "linkAction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLinkContextualAction linkAction](self, "linkAction");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v21;
    v23 = v22;
    v18 = v23;
    if (v19 == v23)
    {

    }
    else
    {
      if (!v19 || !v23)
      {

        LOBYTE(v11) = 0;
        goto LABEL_26;
      }
      LODWORD(v11) = objc_msgSend(v19, "isEqual:", v23);

      if (!(_DWORD)v11)
        goto LABEL_26;
    }
    v11 = objc_msgSend(v5, "authenticationPolicy");
    LOBYTE(v11) = v11 == -[WFLinkContextualAction authenticationPolicy](self, "authenticationPolicy");
LABEL_26:

    goto LABEL_27;
  }
  LOBYTE(v11) = 0;
LABEL_30:

  return v11;
}

- (WFLinkContextualAction)initWithCoder:(id)a3
{
  id v4;
  WFLinkContextualAction *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  WFLinkContextualAction *v10;
  int64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFLinkContextualAction;
  v5 = -[WFContextualAction initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBundleIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkAction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("authenticationPolicy"));
    v10 = 0;
    if (v6 && v8)
    {
      v11 = v9;
      objc_storeStrong((id *)&v5->_linkAction, v8);
      objc_storeStrong((id *)&v5->_appBundleIdentifier, v6);
      objc_storeStrong((id *)&v5->_extensionBundleIdentifier, v7);
      v5->_authenticationPolicy = v11;
      v10 = v5;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFLinkContextualAction;
  v4 = a3;
  -[WFContextualAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_linkAction, CFSTR("linkAction"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_appBundleIdentifier, CFSTR("appBundleIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_extensionBundleIdentifier, CFSTR("extensionBundleIdentifier"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_authenticationPolicy, CFSTR("authenticationPolicy"));

}

- (id)workflowRunKind
{
  __CFString *v2;

  v2 = CFSTR("AppIntent");
  return CFSTR("AppIntent");
}

- (LNAction)linkAction
{
  return self->_linkAction;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (int64_t)authenticationPolicy
{
  return self->_authenticationPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_linkAction, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFLinkContextualAction)initWithAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 authenticationPolicy:(int64_t)a6
{
  return -[WFLinkContextualAction initWithAction:appBundleIdentifier:extensionBundleIdentifier:contextualParameters:authenticationPolicy:icon:](self, "initWithAction:appBundleIdentifier:extensionBundleIdentifier:contextualParameters:authenticationPolicy:icon:", a3, a4, a5, 0, a6, 0);
}

- (WFLinkContextualAction)initWithAction:(id)a3 bundleIdentifier:(id)a4
{
  return -[WFLinkContextualAction initWithAction:appBundleIdentifier:extensionBundleIdentifier:authenticationPolicy:](self, "initWithAction:appBundleIdentifier:extensionBundleIdentifier:authenticationPolicy:", a3, a4, 0, 0);
}

- (void)wf_launchAppIfNeededUsingSurface:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[WFLinkContextualAction linkAction](self, "linkAction");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WFLinkContextualAction appBundleIdentifier](self, "appBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkContextualAction linkAction](self, "linkAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualAction wf_launchAppIfNeededUsingSurface:linkAction:appBundleIdentifier:actionIdentifier:](self, "wf_launchAppIfNeededUsingSurface:linkAction:appBundleIdentifier:actionIdentifier:", a3, v8, v5, v7);

}

@end
