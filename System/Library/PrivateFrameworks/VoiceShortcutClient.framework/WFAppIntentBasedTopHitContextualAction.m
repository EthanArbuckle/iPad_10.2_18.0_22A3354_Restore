@implementation WFAppIntentBasedTopHitContextualAction

- (id)uniqueIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  -[WFAppIntentBasedTopHitContextualAction parameterValue](self, "parameterValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFContextualAction identifier](self, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    -[WFAppIntentBasedTopHitContextualAction parameterValue](self, "parameterValue", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v7;
    -[WFAppIntentBasedTopHitContextualAction parameterValue](self, "parameterValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(":"));
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v12;
  }
  return v5;
}

- (WFAppIntentBasedTopHitContextualAction)initWithAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 authenticationPolicy:(int64_t)a6 associatedAppBundleIdentifier:(id)a7 parameterValue:(id)a8 displayFormatString:(id)a9 title:(id)a10 subtitleFormatString:(id)a11 primaryColor:(unint64_t)a12 icon:(id)a13 accessoryIcon:(id)a14 namedQueryInfo:(id)a15
{
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  WFAppIntentBasedTopHitContextualAction *v33;
  WFAppIntentBasedTopHitContextualAction *v34;
  uint64_t v35;
  NSString *appBundleIdentifier;
  uint64_t v37;
  NSString *extensionBundleIdentifier;
  WFAppIntentBasedTopHitContextualAction *v39;
  void *v41;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[3];
  _QWORD v56[4];

  v56[2] = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = a4;
  v49 = a5;
  v48 = a7;
  v45 = a8;
  v21 = a8;
  v22 = v19;
  v23 = v21;
  v47 = a9;
  v46 = a10;
  v54 = a11;
  v53 = a13;
  v52 = a14;
  v51 = a15;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAppIntentBasedTopHitContextualAction.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  }
  v56[0] = v20;
  objc_msgSend(v19, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "componentsJoinedByString:", CFSTR("."));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v55[0] = v26;
    objc_msgSend(v23, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v27;
    objc_msgSend(v23, "value");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "value");
    v29 = v20;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "componentsJoinedByString:", CFSTR(":"));
    v32 = (id)objc_claimAutoreleasedReturnValue();

    v20 = v29;
  }
  else
  {
    v32 = v26;
  }
  v33 = -[WFTopHitItemContextualAction initWithItem:identifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:primaryColor:icon:accessoryIcon:namedQueryInfo:](self, "initWithItem:identifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:primaryColor:icon:accessoryIcon:namedQueryInfo:", v22, v26, &stru_1E5FC92C0, v48, MEMORY[0x1E0C9AA60], v47, v46, v54, a12, v53, v52, v51);
  v34 = v33;
  if (v33)
  {
    objc_storeStrong((id *)&v33->_linkAction, a3);
    v35 = objc_msgSend(v20, "copy");
    appBundleIdentifier = v34->_appBundleIdentifier;
    v34->_appBundleIdentifier = (NSString *)v35;

    v37 = objc_msgSend(v49, "copy");
    extensionBundleIdentifier = v34->_extensionBundleIdentifier;
    v34->_extensionBundleIdentifier = (NSString *)v37;

    v34->_authenticationPolicy = a6;
    objc_storeStrong((id *)&v34->_parameterValue, v45);
    v39 = v34;
  }

  return v34;
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
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  objc_super v18;

  v3 = (void *)objc_opt_new();
  v18.receiver = self;
  v18.super_class = (Class)WFAppIntentBasedTopHitContextualAction;
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFTopHitItemContextualAction hash](&v18, sel_hash));
  -[WFAppIntentBasedTopHitContextualAction linkAction](self, "linkAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "combine:", v5);

  -[WFAppIntentBasedTopHitContextualAction appBundleIdentifier](self, "appBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v7);

  -[WFAppIntentBasedTopHitContextualAction extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WFAppIntentBasedTopHitContextualAction extensionBundleIdentifier](self, "extensionBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v10);

  }
  v12 = (id)objc_msgSend(v3, "combineInteger:", -[WFAppIntentBasedTopHitContextualAction authenticationPolicy](self, "authenticationPolicy"));
  -[WFAppIntentBasedTopHitContextualAction parameterValue](self, "parameterValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[WFAppIntentBasedTopHitContextualAction parameterValue](self, "parameterValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v3, "combine:", v14);

  }
  v16 = objc_msgSend(v3, "finalize");

  return v16;
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
  id v11;
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
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  int v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)WFAppIntentBasedTopHitContextualAction;
  if (-[WFTopHitItemContextualAction isEqual:](&v35, sel_isEqual_, v4))
  {
    v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_37:

      goto LABEL_38;
    }
    objc_msgSend(v5, "appBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentBasedTopHitContextualAction appBundleIdentifier](self, "appBundleIdentifier");
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
        goto LABEL_35;
      v14 = objc_msgSend(v8, "isEqualToString:", v9);

      if (!v14)
      {
        LOBYTE(v11) = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    objc_msgSend(v5, "extensionBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentBasedTopHitContextualAction extensionBundleIdentifier](self, "extensionBundleIdentifier");
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
        goto LABEL_34;
      v20 = objc_msgSend(v13, "isEqualToString:", v17);

      if (!v20)
      {
        LOBYTE(v11) = 0;
LABEL_35:

        goto LABEL_36;
      }
    }
    objc_msgSend(v5, "linkAction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentBasedTopHitContextualAction linkAction](self, "linkAction");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v21;
    v23 = v22;
    v18 = v23;
    v34 = v19;
    if (v19 == v23)
    {

    }
    else
    {
      LOBYTE(v11) = 0;
      v24 = v23;
      if (!v19 || !v23)
        goto LABEL_33;
      LODWORD(v11) = objc_msgSend(v19, "isEqual:", v23);

      if (!(_DWORD)v11)
        goto LABEL_34;
    }
    objc_msgSend(v5, "parameterValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppIntentBasedTopHitContextualAction parameterValue](self, "parameterValue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v25;
    v26 = v32;
    if (v11 == v26)
    {
      v31 = v26;

      v33 = v11;
    }
    else
    {
      if (!v11 || !v26)
      {
        v28 = v26;

        v24 = v28;
        v19 = v11;
        LOBYTE(v11) = 0;
        goto LABEL_33;
      }
      v27 = v26;
      v30 = objc_msgSend(v11, "isEqual:", v26);
      v31 = v27;

      v33 = v11;
      if (!v30)
      {
        LOBYTE(v11) = 0;
LABEL_31:
        v24 = v31;
        v19 = v33;
LABEL_33:

        v19 = v34;
LABEL_34:

        goto LABEL_35;
      }
    }
    v11 = (id)objc_msgSend(v5, "authenticationPolicy");
    LOBYTE(v11) = v11 == (id)-[WFAppIntentBasedTopHitContextualAction authenticationPolicy](self, "authenticationPolicy");
    goto LABEL_31;
  }
  LOBYTE(v11) = 0;
LABEL_38:

  return (char)v11;
}

- (WFAppIntentBasedTopHitContextualAction)initWithCoder:(id)a3
{
  id v4;
  WFAppIntentBasedTopHitContextualAction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  WFAppIntentBasedTopHitContextualAction *v11;
  int64_t v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFAppIntentBasedTopHitContextualAction;
  v5 = -[WFContextualAction initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBundleIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkAction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("authenticationPolicy"));
    v11 = 0;
    if (v6 && v8)
    {
      v12 = v10;
      objc_storeStrong((id *)&v5->_linkAction, v8);
      objc_storeStrong((id *)&v5->_parameterValue, v9);
      objc_storeStrong((id *)&v5->_appBundleIdentifier, v6);
      objc_storeStrong((id *)&v5->_extensionBundleIdentifier, v7);
      v5->_authenticationPolicy = v12;
      v11 = v5;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAppIntentBasedTopHitContextualAction;
  v4 = a3;
  -[WFContextualAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_linkAction, CFSTR("linkAction"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_parameterValue, CFSTR("parameterValue"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_appBundleIdentifier, CFSTR("appBundleIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_extensionBundleIdentifier, CFSTR("extensionBundleIdentifier"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_authenticationPolicy, CFSTR("authenticationPolicy"));

}

- (LNAction)linkAction
{
  return self->_linkAction;
}

- (LNProperty)parameterValue
{
  return self->_parameterValue;
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
  objc_storeStrong((id *)&self->_parameterValue, 0);
  objc_storeStrong((id *)&self->_linkAction, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
