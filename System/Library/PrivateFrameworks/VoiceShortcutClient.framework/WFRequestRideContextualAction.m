@implementation WFRequestRideContextualAction

- (WFRequestRideContextualAction)initWithApplicationBundleIdentifier:(id)a3 destination:(id)a4 name:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  WFContextualActionParameter *v21;
  void *v22;
  WFContextualActionParameter *v23;
  void *v24;
  void *v25;
  WFRequestRideContextualAction *v26;
  uint64_t v27;
  NSString *applicationBundleIdentifier;
  uint64_t v29;
  NSString *destinationName;
  WFRequestRideContextualAction *v31;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  void *v37;
  objc_super v38;
  const __CFString *v39;
  id v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  obj = a4;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRequestRideContextualAction.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationBundleIdentifier"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRequestRideContextualAction.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destination"));

LABEL_3:
  v37 = v10;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRequestRideContextualAction.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationName"));

  }
  v12 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Request ride to %@"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Request Ride"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v16, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("To %@"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", v19, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = [WFContextualActionParameter alloc];
  v39 = CFSTR("BundleIdentifier");
  v40 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:](v21, "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("INAppDescriptor"), 0, CFSTR("IntentAppDefinition"), v22);
  v41[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContextualActionIcon iconWithApplicationBundleIdentifier:](WFContextualActionIcon, "iconWithApplicationBundleIdentifier:", v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38.receiver = self;
  v38.super_class = (Class)WFRequestRideContextualAction;
  v26 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:](&v38, sel_initWithIdentifier_wfActionIdentifier_associatedAppBundleIdentifier_parameters_displayFormatString_title_subtitleFormatString_icon_, CFSTR("is.workflow.actions.ride.requestride"), CFSTR("is.workflow.actions.ride.requestride"), v9, v24, v14, v17, v20, v25);

  if (v26)
  {
    v27 = objc_msgSend(v9, "copy");
    applicationBundleIdentifier = v26->_applicationBundleIdentifier;
    v26->_applicationBundleIdentifier = (NSString *)v27;

    objc_storeStrong((id *)&v26->_destination, obj);
    v29 = objc_msgSend(v11, "copy");
    destinationName = v26->_destinationName;
    v26->_destinationName = (NSString *)v29;

    v31 = v26;
  }

  return v26;
}

- (id)uniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  -[WFContextualAction identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRequestRideContextualAction applicationBundleIdentifier](self, "applicationBundleIdentifier", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[WFRequestRideContextualAction destinationName](self, "destinationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("."));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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
  unint64_t v11;
  objc_super v13;

  v3 = (void *)objc_opt_new();
  v13.receiver = self;
  v13.super_class = (Class)WFRequestRideContextualAction;
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v13, sel_hash));
  -[WFRequestRideContextualAction applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v5);

  -[WFRequestRideContextualAction destination](self, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "combine:", v7);

  -[WFRequestRideContextualAction destinationName](self, "destinationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v9);

  v11 = objc_msgSend(v3, "finalize");
  return v11;
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
  int v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WFRequestRideContextualAction;
  if (-[WFContextualAction isEqual:](&v24, sel_isEqual_, v4))
  {
    v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_27:

      goto LABEL_28;
    }
    objc_msgSend(v5, "applicationBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRequestRideContextualAction applicationBundleIdentifier](self, "applicationBundleIdentifier");
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
        goto LABEL_25;
      v14 = objc_msgSend(v8, "isEqualToString:", v9);

      if (!v14)
      {
        LOBYTE(v11) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    objc_msgSend(v5, "destination");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRequestRideContextualAction destination](self, "destination");
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
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v11 = objc_msgSend(v13, "isEqual:", v17);

      if (!v11)
        goto LABEL_25;
    }
    objc_msgSend(v5, "destinationName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRequestRideContextualAction destinationName](self, "destinationName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v20;
    v22 = v21;
    v18 = v22;
    if (v19 == v22)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      if (v19 && v22)
        LOBYTE(v11) = objc_msgSend(v19, "isEqualToString:", v22);
    }

    goto LABEL_24;
  }
  LOBYTE(v11) = 0;
LABEL_28:

  return v11;
}

- (WFRequestRideContextualAction)initWithCoder:(id)a3
{
  id v4;
  WFRequestRideContextualAction *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  WFRequestRideContextualAction *v12;
  objc_super v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFRequestRideContextualAction;
  v5 = -[WFContextualAction initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationBundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v7 = (void *)getCLLocationClass_softClass_7960;
    v19 = getCLLocationClass_softClass_7960;
    if (!getCLLocationClass_softClass_7960)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __getCLLocationClass_block_invoke_7961;
      v15[3] = &unk_1E5FC8858;
      v15[4] = &v16;
      __getCLLocationClass_block_invoke_7961((uint64_t)v15);
      v7 = (void *)v17[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v16, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("destination"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationName"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = 0;
    if (v6 && v9 && v10)
    {
      objc_storeStrong((id *)&v5->_applicationBundleIdentifier, v6);
      objc_storeStrong((id *)&v5->_destination, v9);
      objc_storeStrong((id *)&v5->_destinationName, v11);
      v12 = v5;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFRequestRideContextualAction;
  v4 = a3;
  -[WFContextualAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationBundleIdentifier, CFSTR("applicationBundleIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_destination, CFSTR("destination"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_destinationName, CFSTR("destinationName"));

}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (CLLocation)destination
{
  return self->_destination;
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
