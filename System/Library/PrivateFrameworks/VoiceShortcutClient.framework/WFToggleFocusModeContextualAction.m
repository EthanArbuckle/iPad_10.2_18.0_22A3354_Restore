@implementation WFToggleFocusModeContextualAction

- (WFToggleFocusModeContextualAction)initWithFocusMode:(id)a3 operation:(unint64_t)a4 event:(id)a5
{
  id v9;
  id v10;
  WFContextualActionParameter *v11;
  void *v12;
  void *v13;
  void *v14;
  WFContextualActionParameter *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  WFContextualActionParameter *v28;
  WFContextualActionParameter *v29;
  WFContextualActionParameter *v30;
  WFContextualActionParameter *v31;
  void *v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  WFContextualActionParameter *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  WFToggleFocusModeContextualAction *v46;
  WFToggleFocusModeContextualAction *v47;
  void *v49;
  void *v50;
  id v51;
  WFToggleFocusModeContextualAction *v53;
  _QWORD v54[2];
  _QWORD v55[3];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFToggleFocusModeContextualAction.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusMode"));

  }
  if (a4 == 1 && !v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFToggleFocusModeContextualAction.m"), 134, CFSTR("If the operation is turn on until event ends, we need an event"));

  }
  v53 = self;
  v11 = [WFContextualActionParameter alloc];
  v57[0] = CFSTR("Identifier");
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = CFSTR("DisplayString");
  v58[0] = v12;
  objc_msgSend(v9, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:](v11, "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFDictionaryContentItem"), 0, CFSTR("FocusModes"), v14);
  v59[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.donotdisturb.mode.default"));

  v51 = v10;
  switch(a4)
  {
    case 0uLL:
    case 2uLL:
      v19 = (void *)MEMORY[0x1E0CB3940];
      if (a4)
      {
        if (v18)
        {
          v20 = CFSTR("Turn Off (Focus Mode)");
          v21 = CFSTR("Turn Off %@");
        }
        else
        {
          v20 = CFSTR("Turn Off (Focus Mode), with Focus appended");
          v21 = CFSTR("Turn Off %@ Focus");
        }
      }
      else if (v18)
      {
        v20 = CFSTR("Turn On (Focus Mode)");
        v21 = CFSTR("Turn On %@");
      }
      else
      {
        v20 = CFSTR("Turn On (Focus Mode), with Focus appended");
        v21 = CFSTR("Turn On %@ Focus");
      }
      WFLocalizedStringWithKey(v20, v21);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", v39, v40);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFStringContentItem"), 0, CFSTR("AssertionType"), CFSTR("Turned Off"));
      v56[0] = v28;
      v41 = [WFContextualActionParameter alloc];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4 == 0);
      v30 = (WFContextualActionParameter *)objc_claimAutoreleasedReturnValue();
      v31 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:](v41, "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFNumberContentItem"), 0, CFSTR("Enabled"), v30);
      v56[1] = v31;
      v32 = (void *)MEMORY[0x1E0C99D20];
      v33 = v56;
      v34 = 2;
      goto LABEL_24;
    case 1uLL:
      v23 = (void *)MEMORY[0x1E0CB3940];
      if (v18)
        v24 = CFSTR("Turn On %1$@ Until %2$@ Ends");
      else
        v24 = CFSTR("Turn On %1$@ Focus Until %2$@ Ends");
      WFLocalizedString(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "title");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", v25, v26, v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFStringContentItem"), 0, CFSTR("AssertionType"), CFSTR("Event Ends"));
      v55[0] = v28;
      v29 = [WFContextualActionParameter alloc];
      v30 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:](v29, "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFNumberContentItem"), 0, CFSTR("Enabled"), MEMORY[0x1E0C9AAB0]);
      v55[1] = v30;
      v31 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:isActionInput:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:isActionInput:", CFSTR("WFCalendarEventContentItem"), 0, CFSTR("Event"), 1);
      v55[2] = v31;
      v32 = (void *)MEMORY[0x1E0C99D20];
      v33 = v55;
      v34 = 3;
LABEL_24:
      objc_msgSend(v32, "arrayWithObjects:count:", v33, v34);
      v42 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v42);
      v38 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v42;
      goto LABEL_25;
    case 3uLL:
      if (v18)
      {
        WFLocalizedString(CFSTR("Do Not Disturb"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v35 = (void *)MEMORY[0x1E0CB3940];
        WFLocalizedStringWithKey(CFSTR("Toggle (Focus Mode), with Focus appended"), CFSTR("%@ Focus"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", v36, v37);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v28 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFStringContentItem"), 0, CFSTR("AssertionType"), CFSTR("Turned Off"));
      v54[0] = v28;
      v30 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFStringContentItem"), 0, CFSTR("Operation"), CFSTR("Toggle"));
      v54[1] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
      v31 = (WFContextualActionParameter *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v31);
      v38 = objc_claimAutoreleasedReturnValue();
LABEL_25:

      v16 = (void *)v38;
      v10 = v51;
      break;
    default:
      v22 = 0;
      break;
  }
  objc_msgSend(v9, "symbolName");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContextualActionIcon iconWithSystemName:](WFContextualActionIcon, "iconWithSystemName:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  WFLocalizedString(CFSTR("Focus Mode"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:](v53, "initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:", CFSTR("is.workflow.actions.dnd.set"), CFSTR("is.workflow.actions.dnd.set"), CFSTR("com.apple.Preferences"), v16, v22, v45, v22, v44);

  if (v46)
  {
    objc_storeStrong((id *)&v46->_focusMode, a3);
    v46->_operation = a4;
    objc_storeStrong((id *)&v46->_eventDescriptor, a5);
    v47 = v46;
  }

  return v46;
}

- (id)uniqueIdentifier
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = -[WFToggleFocusModeContextualAction operation](self, "operation");
  if (v3 > 3)
    v4 = 0;
  else
    v4 = off_1E5FC5548[v3];
  -[WFContextualAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFToggleFocusModeContextualAction focusMode](self, "focusMode", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("."));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  objc_super v12;

  v3 = (void *)objc_opt_new();
  v12.receiver = self;
  v12.super_class = (Class)WFToggleFocusModeContextualAction;
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v12, sel_hash));
  -[WFToggleFocusModeContextualAction focusMode](self, "focusMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "combine:", v5);

  v7 = (id)objc_msgSend(v3, "combineInteger:", -[WFToggleFocusModeContextualAction operation](self, "operation"));
  -[WFToggleFocusModeContextualAction eventDescriptor](self, "eventDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "combine:", v8);

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
  int v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFToggleFocusModeContextualAction;
  if (-[WFContextualAction isEqual:](&v19, sel_isEqual_, v4))
  {
    v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v5, "focusMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFToggleFocusModeContextualAction focusMode](self, "focusMode");
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
      v11 = objc_msgSend(v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_21;
    }
    v14 = objc_msgSend(v5, "operation");
    if (v14 != -[WFToggleFocusModeContextualAction operation](self, "operation"))
    {
      LOBYTE(v11) = 0;
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v5, "eventDescriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFToggleFocusModeContextualAction eventDescriptor](self, "eventDescriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;
    v17 = v16;
    v12 = v17;
    if (v13 == v17)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      if (v13 && v17)
        LOBYTE(v11) = objc_msgSend(v13, "isEqual:", v17);
    }

LABEL_20:
    goto LABEL_21;
  }
  LOBYTE(v11) = 0;
LABEL_23:

  return v11;
}

- (id)settingBiomeStreamIdentifier
{
  void (*v2)(void);
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id result;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  if (-[WFToggleFocusModeContextualAction operation](self, "operation") != 3)
  {
    v6 = 0;
    return v6;
  }
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v2 = (void (*)(void))getBiomeLibrarySymbolLoc_ptr;
  v14 = getBiomeLibrarySymbolLoc_ptr;
  if (!getBiomeLibrarySymbolLoc_ptr)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getBiomeLibrarySymbolLoc_block_invoke;
    v10[3] = &unk_1E5FC8858;
    v10[4] = &v11;
    __getBiomeLibrarySymbolLoc_block_invoke(v10);
    v2 = (void (*)(void))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v2)
  {
    v2();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UserFocus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ComputedMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BMRootLibrary> WFBiomeLibrary(void)");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("WFToggleFocusModeContextualAction.m"), 20, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (id)spotlightItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFToggleFocusModeContextualAction;
  -[WFContextualAction spotlightItem](&v10, sel_spotlightItem);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFToggleFocusModeContextualAction focusMode](self, "focusMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hexValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WFSpotlightResultRunnableTintColorNameIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forCustomKey:", v7, v8);

  return v3;
}

- (WFToggleFocusModeContextualAction)initWithCoder:(id)a3
{
  id v4;
  WFToggleFocusModeContextualAction *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  WFToggleFocusModeContextualAction *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFToggleFocusModeContextualAction;
  v5 = -[WFContextualAction initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("focusMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("operation"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventDescriptor"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v7 != 1 || v8)
      {
        objc_storeStrong((id *)&v5->_focusMode, v6);
        v5->_operation = v7;
        objc_storeStrong((id *)&v5->_eventDescriptor, v9);
        v10 = v5;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
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
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFToggleFocusModeContextualAction;
  v4 = a3;
  -[WFContextualAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFToggleFocusModeContextualAction focusMode](self, "focusMode", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("focusMode"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFToggleFocusModeContextualAction operation](self, "operation"), CFSTR("operation"));
  -[WFToggleFocusModeContextualAction eventDescriptor](self, "eventDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("eventDescriptor"));

}

- (WFToggleFocusModeContextualActionFocusMode)focusMode
{
  return self->_focusMode;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (WFContextualActionCalendarEventDescriptor)eventDescriptor
{
  return self->_eventDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDescriptor, 0);
  objc_storeStrong((id *)&self->_focusMode, 0);
}

+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3
{
  return CFSTR("focus");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)turnOn:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFocusMode:operation:event:", v4, 0, 0);

  return v5;
}

+ (id)turnOn:(id)a3 untilEventEnds:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFToggleFocusModeContextualAction.m"), 324, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventDescriptor"));

  }
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFocusMode:operation:event:", v7, 1, v8);

  return v9;
}

+ (id)turnOff:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFocusMode:operation:event:", v4, 2, 0);

  return v5;
}

+ (id)toggle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFocusMode:operation:event:", v4, 3, 0);

  return v5;
}

@end
