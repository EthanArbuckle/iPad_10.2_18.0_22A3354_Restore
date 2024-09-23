@implementation WFFocusConfigurationUIState

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  void *v5;

  if (!-[WFFocusConfigurationUIState isUIValid](self, "isUIValid"))
    return 0;
  -[WFFocusConfigurationUIState action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[WFFocusConfigurationUIState contextualAction](self, "contextualAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (WFFocusConfigurationUIState)initWithEnabled:(BOOL)a3 uiValidity:(BOOL)a4 action:(id)a5 displayRepresentation:(id)a6
{
  id v10;
  id v11;
  WFFocusConfigurationUIState *v12;
  WFFocusConfigurationUIState *v13;
  uint64_t v14;
  LNAction *action;
  uint64_t v16;
  LNDisplayRepresentation *displayRepresentation;
  WFFocusConfigurationUIState *v18;
  objc_super v20;

  v10 = a5;
  v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WFFocusConfigurationUIState;
  v12 = -[WFFocusConfigurationUIState init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_enabled = a3;
    v12->_isUIValid = a4;
    v14 = objc_msgSend(v10, "copy");
    action = v13->_action;
    v13->_action = (LNAction *)v14;

    v16 = objc_msgSend(v11, "copy");
    displayRepresentation = v13->_displayRepresentation;
    v13->_displayRepresentation = (LNDisplayRepresentation *)v16;

    v18 = v13;
  }

  return v13;
}

- (WFFocusConfigurationUIState)initWithEnabled:(BOOL)a3 uiValidity:(BOOL)a4 contextualAction:(id)a5
{
  id v9;
  WFFocusConfigurationUIState *v10;
  WFFocusConfigurationUIState *v11;
  WFFocusConfigurationUIState *v12;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)WFFocusConfigurationUIState;
  v10 = -[WFFocusConfigurationUIState init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_enabled = a3;
    v10->_isUIValid = a4;
    objc_storeStrong((id *)&v10->_contextualAction, a5);
    v12 = v11;
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFFocusConfigurationUIState isValid](self, "isValid"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[WFFocusConfigurationUIState isEnabled](self, "isEnabled"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[WFFocusConfigurationUIState isUIValid](self, "isUIValid"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  -[WFFocusConfigurationUIState action](self, "action");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFocusConfigurationUIState displayRepresentation](self, "displayRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFocusConfigurationUIState contextualAction](self, "contextualAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, isValid: %@, Enabled: %@, isUIValid: %@, link action: %@, link displayRepresentation: %@, contextual action: %@>"), v5, self, v6, v7, v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  if (-[WFFocusConfigurationUIState isEnabled](self, "isEnabled"))
    v3 = 3405691582;
  else
    v3 = 3133065982;
  if (-[WFFocusConfigurationUIState isUIValid](self, "isUIValid"))
    v4 = 3405691582;
  else
    v4 = 3133065982;
  v5 = v4 ^ v3;
  -[WFFocusConfigurationUIState action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[WFFocusConfigurationUIState displayRepresentation](self, "displayRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[WFFocusConfigurationUIState contextualAction](self, "contextualAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5 ^ v9 ^ objc_msgSend(v10, "hash");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  WFFocusConfigurationUIState *v4;
  WFFocusConfigurationUIState *v5;
  WFFocusConfigurationUIState *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  WFFocusConfigurationUIState *v10;
  void *v12;
  void *v13;
  WFFocusConfigurationUIState *v14;
  WFFocusConfigurationUIState *v15;
  WFFocusConfigurationUIState *v16;
  WFFocusConfigurationUIState *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  WFFocusConfigurationUIState *v21;
  WFFocusConfigurationUIState *v22;
  WFFocusConfigurationUIState *v23;
  void *v24;
  void *v25;
  WFFocusConfigurationUIState *v26;

  v4 = (WFFocusConfigurationUIState *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = -[WFFocusConfigurationUIState isEnabled](self, "isEnabled");
        if (v7 != -[WFFocusConfigurationUIState isEnabled](v6, "isEnabled")
          || (v8 = -[WFFocusConfigurationUIState isUIValid](self, "isUIValid"),
              v8 != -[WFFocusConfigurationUIState isUIValid](v6, "isUIValid")))
        {
          LOBYTE(v9) = 0;
LABEL_11:

          goto LABEL_12;
        }
        -[WFFocusConfigurationUIState action](self, "action");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFFocusConfigurationUIState action](v6, "action");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v12;
        v14 = v13;
        v15 = v14;
        if (v10 == v14)
        {

        }
        else
        {
          LOBYTE(v9) = 0;
          v16 = v14;
          v17 = v10;
          if (!v10 || !v14)
            goto LABEL_32;
          v18 = -[WFFocusConfigurationUIState isEqual:](v10, "isEqual:", v14);

          if (!v18)
          {
            LOBYTE(v9) = 0;
LABEL_33:

            goto LABEL_10;
          }
        }
        -[WFFocusConfigurationUIState displayRepresentation](self, "displayRepresentation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFFocusConfigurationUIState displayRepresentation](v6, "displayRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v19;
        v21 = v20;
        v16 = v21;
        if (v17 == v21)
        {

        }
        else
        {
          LOBYTE(v9) = 0;
          v22 = v21;
          v23 = v17;
          if (!v17 || !v21)
          {
LABEL_31:

LABEL_32:
            goto LABEL_33;
          }
          v9 = -[WFFocusConfigurationUIState isEqual:](v17, "isEqual:", v21);

          if (!v9)
            goto LABEL_32;
        }
        -[WFFocusConfigurationUIState contextualAction](self, "contextualAction");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFFocusConfigurationUIState contextualAction](v6, "contextualAction");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v24;
        v26 = v25;
        v22 = v26;
        if (v23 == v26)
        {
          LOBYTE(v9) = 1;
        }
        else
        {
          LOBYTE(v9) = 0;
          if (v23 && v26)
            LOBYTE(v9) = -[WFFocusConfigurationUIState isEqual:](v23, "isEqual:", v26);
        }

        goto LABEL_31;
      }
      LOBYTE(v9) = 0;
      v10 = v6;
      v6 = 0;
    }
    else
    {
      v10 = 0;
      LOBYTE(v9) = 0;
    }
LABEL_10:

    goto LABEL_11;
  }
  LOBYTE(v9) = 1;
LABEL_12:

  return v9;
}

- (WFFocusConfigurationUIState)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  WFFocusConfigurationUIState *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEnabled"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isUIValid"));
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v7 = (void *)getLNActionClass_softClass_1793;
  v24 = getLNActionClass_softClass_1793;
  if (!getLNActionClass_softClass_1793)
  {
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __getLNActionClass_block_invoke_1794;
    v19 = &unk_24C5AB7C0;
    v20 = &v21;
    __getLNActionClass_block_invoke_1794((uint64_t)&v16);
    v7 = (void *)v22[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v21, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("action"));
  v9 = objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v10 = (void *)getLNDisplayRepresentationClass_softClass;
  v24 = getLNDisplayRepresentationClass_softClass;
  if (!getLNDisplayRepresentationClass_softClass)
  {
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __getLNDisplayRepresentationClass_block_invoke;
    v19 = &unk_24C5AB7C0;
    v20 = &v21;
    __getLNDisplayRepresentationClass_block_invoke((uint64_t)&v16);
    v10 = (void *)v22[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v21, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, CFSTR("displayRepresentation"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (v9 | v12)
  {
    v13 = -[WFFocusConfigurationUIState initWithEnabled:uiValidity:action:displayRepresentation:](self, "initWithEnabled:uiValidity:action:displayRepresentation:", v5, v6, v9, v12);
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextualAction"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WFFocusConfigurationUIState initWithEnabled:uiValidity:contextualAction:](self, "initWithEnabled:uiValidity:contextualAction:", v5, v6, v14);

  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[WFFocusConfigurationUIState isEnabled](self, "isEnabled"), CFSTR("isEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFFocusConfigurationUIState isUIValid](self, "isUIValid"), CFSTR("isUIValid"));
  -[WFFocusConfigurationUIState action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("action"));

  -[WFFocusConfigurationUIState displayRepresentation](self, "displayRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayRepresentation"));

  -[WFFocusConfigurationUIState contextualAction](self, "contextualAction");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("contextualAction"));

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isUIValid
{
  return self->_isUIValid;
}

- (LNAction)action
{
  return self->_action;
}

- (LNDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (WFContextualAction)contextualAction
{
  return self->_contextualAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualAction, 0);
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
