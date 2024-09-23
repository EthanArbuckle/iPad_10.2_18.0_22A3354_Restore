@implementation WFToggleAlarmContextualAction

- (WFToggleAlarmContextualAction)initWithAlarmIdentifier:(id)a3 alarmName:(id)a4 operation:(unint64_t)a5
{
  return -[WFToggleAlarmContextualAction initWithAlarmIdentifier:alarmName:alarmData:operation:](self, "initWithAlarmIdentifier:alarmName:alarmData:operation:", a3, a4, MEMORY[0x1E0C9AA70], a5);
}

- (WFToggleAlarmContextualAction)initWithAlarmIdentifier:(id)a3 alarmName:(id)a4 alarmData:(id)a5 operation:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  WFContextualActionParameter *v14;
  WFContextualActionParameter *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  WFContextualActionParameter *v26;
  WFContextualActionParameter *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  WFToggleAlarmContextualAction *v32;
  uint64_t v33;
  NSString *alarmIdentifier;
  uint64_t v35;
  NSString *alarmName;
  WFToggleAlarmContextualAction *v37;
  void *v39;
  void *v40;
  unint64_t v41;
  WFContextualActionParameter *v42;
  WFContextualActionParameter *v43;
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFToggleAlarmContextualAction.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alarmIdentifier"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFToggleAlarmContextualAction.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alarmName"));

LABEL_3:
  v14 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFDictionaryContentItem"), 0, CFSTR("alarm"), v13);
  v15 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFStringContentItem"), 0, CFSTR("operation"), CFSTR("toggle"));
  v45[0] = v14;
  v45[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  v41 = a6;
  v42 = v15;
  v43 = v14;
  switch(a6)
  {
    case 0uLL:
      v18 = (void *)MEMORY[0x1E0CB3940];
      v19 = CFSTR("Turn On (Alarm)");
      v20 = CFSTR("Turn On %@");
      goto LABEL_7;
    case 1uLL:
      v18 = (void *)MEMORY[0x1E0CB3940];
      v19 = CFSTR("Turn Off (Alarm)");
      v20 = CFSTR("Turn Off");
LABEL_7:
      WFLocalizedStringWithKey(v19, v20);
      v23 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2uLL:
      v24 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedString(CFSTR("%@ Alarm"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", v25, v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = [WFContextualActionParameter alloc];
      v27 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:](v26, "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFNumberContentItem"), 0, CFSTR("ShowWhenRun"), MEMORY[0x1E0C9AAA0]);
      objc_msgSend(v17, "addObject:", v27);
      goto LABEL_11;
    case 3uLL:
      v18 = (void *)MEMORY[0x1E0CB3940];
      WFLocalizedString(CFSTR("Snooze"));
      v23 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v27 = (WFContextualActionParameter *)v23;
      objc_msgSend(v18, "stringWithFormat:", v23, v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      v21 = v13;

      break;
    default:
      v21 = v13;
      v22 = 0;
      break;
  }
  v44[0] = CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents.MTToggleAlarmIntent");
  v44[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "componentsJoinedByString:", CFSTR("."));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  WFLocalizedString(CFSTR("Alarm"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContextualActionIcon iconWithApplicationBundleIdentifier:](WFContextualActionIcon, "iconWithApplicationBundleIdentifier:", CFSTR("com.apple.mobiletimer"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:](self, "initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:", v29, CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents.MTToggleAlarmIntent"), CFSTR("com.apple.mobiletimer"), v17, v22, v30, v22, v31);

  if (v32)
  {
    v32->_operation = v41;
    v33 = objc_msgSend(v11, "copy");
    alarmIdentifier = v32->_alarmIdentifier;
    v32->_alarmIdentifier = (NSString *)v33;

    v35 = objc_msgSend(v12, "copy");
    alarmName = v32->_alarmName;
    v32->_alarmName = (NSString *)v35;

    v37 = v32;
  }

  return v32;
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

  if (-[WFToggleAlarmContextualAction operation](self, "operation") != 2)
  {
    v6 = 0;
    return v6;
  }
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v2 = (void (*)(void))getBiomeLibrarySymbolLoc_ptr_17581;
  v14 = getBiomeLibrarySymbolLoc_ptr_17581;
  if (!getBiomeLibrarySymbolLoc_ptr_17581)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getBiomeLibrarySymbolLoc_block_invoke_17582;
    v10[3] = &unk_1E5FC8858;
    v10[4] = &v11;
    __getBiomeLibrarySymbolLoc_block_invoke_17582(v10);
    v2 = (void (*)(void))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v2)
  {
    v2();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "Clock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "Alarm");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<BMRootLibrary> WFBiomeLibrary(void)");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("WFToggleAlarmContextualAction.m"), 19, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (id)uniqueIdentifier
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v3 = -[WFToggleAlarmContextualAction operation](self, "operation");
  if (v3 > 3)
    v4 = 0;
  else
    v4 = off_1E5FC8288[v3];
  -[WFContextualAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFToggleAlarmContextualAction alarmIdentifier](self, "alarmIdentifier", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  v10[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)showsUserInterfaceWhenRunning
{
  return -[WFToggleAlarmContextualAction operation](self, "operation") != 2;
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
  v12.super_class = (Class)WFToggleAlarmContextualAction;
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v12, sel_hash));
  -[WFToggleAlarmContextualAction alarmIdentifier](self, "alarmIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v5);

  -[WFToggleAlarmContextualAction alarmName](self, "alarmName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v7);

  v9 = (id)objc_msgSend(v3, "combineInteger:", -[WFToggleAlarmContextualAction operation](self, "operation"));
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
  v19.super_class = (Class)WFToggleAlarmContextualAction;
  if (-[WFContextualAction isEqual:](&v19, sel_isEqual_, v4))
  {
    v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v5, "alarmIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFToggleAlarmContextualAction alarmIdentifier](self, "alarmIdentifier");
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
      v14 = objc_msgSend(v8, "isEqualToString:", v9);

      if (!v14)
      {
        LOBYTE(v11) = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    objc_msgSend(v5, "alarmName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFToggleAlarmContextualAction alarmName](self, "alarmName");
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
    v11 = objc_msgSend(v5, "operation");
    LOBYTE(v11) = v11 == -[WFToggleAlarmContextualAction operation](self, "operation");
LABEL_20:

    goto LABEL_21;
  }
  LOBYTE(v11) = 0;
LABEL_23:

  return v11;
}

- (WFToggleAlarmContextualAction)initWithCoder:(id)a3
{
  id v4;
  WFToggleAlarmContextualAction *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  unint64_t v10;
  WFToggleAlarmContextualAction *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFToggleAlarmContextualAction;
  v5 = -[WFContextualAction initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alarmIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alarmName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("operation"));
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
    {
      v11 = 0;
    }
    else
    {
      v10 = v8;
      objc_storeStrong((id *)&v5->_alarmIdentifier, v6);
      objc_storeStrong((id *)&v5->_alarmName, v7);
      v5->_operation = v10;
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
  v5.super_class = (Class)WFToggleAlarmContextualAction;
  v4 = a3;
  -[WFContextualAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_alarmIdentifier, CFSTR("alarmIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_alarmName, CFSTR("alarmName"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_operation, CFSTR("operation"));

}

- (NSString)alarmIdentifier
{
  return self->_alarmIdentifier;
}

- (NSString)alarmName
{
  return self->_alarmName;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmName, 0);
  objc_storeStrong((id *)&self->_alarmIdentifier, 0);
}

+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3
{
  return CFSTR("alarm-toggle");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
