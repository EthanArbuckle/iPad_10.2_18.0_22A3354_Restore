@implementation WFReverseContextualAction

- (WFReverseContextualAction)initWithActionToReverse:(id)a3 reversalState:(id)a4
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSData *v22;
  NSData *reversalState;
  WFReverseContextualAction *v24;
  WFReverseContextualAction *v25;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFReverseContextualAction.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionToReverse"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFReverseContextualAction.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reversalState"));

LABEL_3:
  if (objc_msgSend(v8, "isReversible"))
  {
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v11;
    v30[1] = CFSTR("reverse");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("Reverse '%@'"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayFormatString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "wfActionIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "associatedAppBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parameters");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "icon");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29.receiver = self;
    v29.super_class = (Class)WFReverseContextualAction;
    self = -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:](&v29, sel_initWithIdentifier_wfActionIdentifier_associatedAppBundleIdentifier_parameters_displayFormatString_title_subtitleFormatString_icon_, v13, v18, v19, v20, v17, v17, 0, v21);

    if (self)
    {
      objc_storeStrong((id *)&self->_actionToReverse, a3);
      v22 = (NSData *)objc_msgSend(v10, "copy");
      reversalState = self->_reversalState;
      self->_reversalState = v22;

      v24 = self;
    }

    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  objc_super v11;

  v3 = (void *)objc_opt_new();
  v11.receiver = self;
  v11.super_class = (Class)WFReverseContextualAction;
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v11, sel_hash));
  -[WFReverseContextualAction actionToReverse](self, "actionToReverse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "combine:", v5);

  -[WFReverseContextualAction reversalState](self, "reversalState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v7);

  v9 = objc_msgSend(v3, "finalize");
  return v9;
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
  void *v14;
  void *v15;
  id v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFReverseContextualAction;
  if (-[WFContextualAction isEqual:](&v18, sel_isEqual_, v4))
  {
    v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v5, "actionToReverse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFReverseContextualAction actionToReverse](self, "actionToReverse");
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
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v11 = objc_msgSend(v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_19;
    }
    objc_msgSend(v5, "reversalState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFReverseContextualAction reversalState](self, "reversalState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;
    v16 = v15;
    v12 = v16;
    if (v13 == v16)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      if (v13 && v16)
        LOBYTE(v11) = objc_msgSend(v13, "isEqual:", v16);
    }

    goto LABEL_18;
  }
  LOBYTE(v11) = 0;
LABEL_21:

  return v11;
}

- (WFReverseContextualAction)initWithCoder:(id)a3
{
  id v4;
  WFReverseContextualAction *v5;
  uint64_t v6;
  WFContextualAction *actionToReverse;
  uint64_t v8;
  NSData *reversalState;
  WFReverseContextualAction *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFReverseContextualAction;
  v5 = -[WFContextualAction initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionToReverse"));
    v6 = objc_claimAutoreleasedReturnValue();
    actionToReverse = v5->_actionToReverse;
    v5->_actionToReverse = (WFContextualAction *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reversalState"));
    v8 = objc_claimAutoreleasedReturnValue();
    reversalState = v5->_reversalState;
    v5->_reversalState = (NSData *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFReverseContextualAction;
  v4 = a3;
  -[WFContextualAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFReverseContextualAction actionToReverse](self, "actionToReverse", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actionToReverse"));

  -[WFReverseContextualAction reversalState](self, "reversalState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("reversalState"));

}

- (WFContextualAction)actionToReverse
{
  return self->_actionToReverse;
}

- (NSData)reversalState
{
  return self->_reversalState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reversalState, 0);
  objc_storeStrong((id *)&self->_actionToReverse, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
