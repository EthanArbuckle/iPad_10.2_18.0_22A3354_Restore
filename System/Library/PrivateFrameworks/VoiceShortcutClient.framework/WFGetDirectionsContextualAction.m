@implementation WFGetDirectionsContextualAction

- (WFGetDirectionsContextualAction)initWithDestination:(id)a3 name:(id)a4 type:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  WFContextualActionParameter *v23;
  WFContextualActionParameter *v24;
  void *v25;
  void *v26;
  WFGetDirectionsContextualAction *v27;
  uint64_t v28;
  NSString *destinationName;
  WFGetDirectionsContextualAction *v30;
  void *v32;
  void *v33;
  unint64_t v35;
  WFGetDirectionsContextualAction *v36;
  void *v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  v37 = v9;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFGetDirectionsContextualAction.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destination"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFGetDirectionsContextualAction.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationName"));

LABEL_3:
  v35 = a5;
  v36 = self;
  if (a5 > 3)
  {
    v12 = 0;
    v13 = 0;
  }
  else
  {
    v12 = off_1E5FC63C8[a5];
    WFLocalizedString(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Get %@ directions to %@"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v15, v13, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Get %@ Directions"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", v18, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedStringWithKey(CFSTR("To %@ (Get Directions)"), CFSTR("To %@"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", v21, v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFStringContentItem"), 0, CFSTR("WFGetDirectionsActionMode"), v12);
  v38[0] = v23;
  v24 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:isActionInput:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:isActionInput:", CFSTR("WFLocationContentItem"), 0, CFSTR("WFDestination"), 1);
  v38[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContextualActionIcon iconWithApplicationBundleIdentifier:](WFContextualActionIcon, "iconWithApplicationBundleIdentifier:", CFSTR("com.apple.Maps"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:](v36, "initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:", CFSTR("is.workflow.actions.getdirections"), CFSTR("is.workflow.actions.getdirections"), CFSTR("com.apple.Maps"), v25, v16, v19, v22, v26);

  if (v27)
  {
    objc_storeStrong((id *)&v27->_destination, a3);
    v28 = objc_msgSend(v11, "copy");
    destinationName = v27->_destinationName;
    v27->_destinationName = (NSString *)v28;

    v27->_navigationType = v35;
    v30 = v27;
  }

  return v27;
}

- (id)uniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[WFContextualAction identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  -[WFGetDirectionsContextualAction destinationName](self, "destinationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  id v9;
  unint64_t v10;
  objc_super v12;

  v3 = (void *)objc_opt_new();
  v12.receiver = self;
  v12.super_class = (Class)WFGetDirectionsContextualAction;
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v12, sel_hash));
  -[WFGetDirectionsContextualAction destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "combine:", v5);

  -[WFGetDirectionsContextualAction destinationName](self, "destinationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v7);

  v9 = (id)objc_msgSend(v3, "combineInteger:", -[WFGetDirectionsContextualAction navigationType](self, "navigationType"));
  v10 = objc_msgSend(v3, "finalize");

  return v10;
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
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFGetDirectionsContextualAction;
  if (-[WFContextualAction isEqual:](&v19, sel_isEqual_, v4))
  {
    v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v5, "destination");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGetDirectionsContextualAction destination](self, "destination");
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
        goto LABEL_20;
      v14 = objc_msgSend(v8, "isEqual:", v9);

      if (!v14)
      {
        LOBYTE(v11) = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    objc_msgSend(v5, "destinationName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGetDirectionsContextualAction destinationName](self, "destinationName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;
    v17 = v16;
    v12 = v17;
    if (v13 == v17)
    {

    }
    else
    {
      if (!v13 || !v17)
      {

        LOBYTE(v11) = 0;
        goto LABEL_20;
      }
      LODWORD(v11) = objc_msgSend(v13, "isEqualToString:", v17);

      if (!(_DWORD)v11)
        goto LABEL_20;
    }
    v11 = objc_msgSend(v5, "navigationType");
    LOBYTE(v11) = v11 == -[WFGetDirectionsContextualAction navigationType](self, "navigationType");
LABEL_20:

    goto LABEL_21;
  }
  LOBYTE(v11) = 0;
LABEL_23:

  return v11;
}

- (WFGetDirectionsContextualAction)initWithCoder:(id)a3
{
  id v4;
  WFGetDirectionsContextualAction *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  WFGetDirectionsContextualAction *v11;
  unint64_t v12;
  objc_super v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFGetDirectionsContextualAction;
  v5 = -[WFContextualAction initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v6 = (void *)getCLLocationClass_softClass;
    v19 = getCLLocationClass_softClass;
    if (!getCLLocationClass_softClass)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __getCLLocationClass_block_invoke;
      v15[3] = &unk_1E5FC8858;
      v15[4] = &v16;
      __getCLLocationClass_block_invoke((uint64_t)v15);
      v6 = (void *)v17[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v16, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("destination"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("navigationType"));
    v11 = 0;
    if (v8 && v9)
    {
      v12 = v10;
      objc_storeStrong((id *)&v5->_destination, v8);
      objc_storeStrong((id *)&v5->_destinationName, v9);
      v5->_navigationType = v12;
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
  v5.super_class = (Class)WFGetDirectionsContextualAction;
  v4 = a3;
  -[WFContextualAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_destination, CFSTR("destination"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_destinationName, CFSTR("destinationName"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_navigationType, CFSTR("navigationType"));

}

- (CLLocation)destination
{
  return self->_destination;
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (unint64_t)navigationType
{
  return self->_navigationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
