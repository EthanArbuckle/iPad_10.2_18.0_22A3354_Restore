@implementation WFSmartPromptApprovalResult

- (WFSmartPromptApprovalResult)initWithActionUUID:(id)a3
{
  return -[WFSmartPromptApprovalResult initWithAllowedStates:deniedStates:undefinedStates:restrictedStates:actionUUID:previousAttributions:](self, "initWithAllowedStates:deniedStates:undefinedStates:restrictedStates:actionUUID:previousAttributions:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], a3, 0);
}

- (WFSmartPromptApprovalResult)initWithAllowedStates:(id)a3 deniedStates:(id)a4 undefinedStates:(id)a5 restrictedStates:(id)a6 actionUUID:(id)a7 previousAttributions:(id)a8
{
  id v15;
  id v16;
  id v17;
  WFSmartPromptApprovalResult *v18;
  WFSmartPromptApprovalResult *v19;
  WFSmartPromptApprovalResult *v20;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v22 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)WFSmartPromptApprovalResult;
  v18 = -[WFSmartPromptApprovalResult init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_allowedStates, a3);
    objc_storeStrong((id *)&v19->_deniedStates, a4);
    objc_storeStrong((id *)&v19->_undefinedStates, a5);
    objc_storeStrong((id *)&v19->_restrictedStates, a6);
    objc_storeStrong((id *)&v19->_actionUUID, a7);
    objc_storeStrong((id *)&v19->_previousAttributions, a8);
    v20 = v19;
  }

  return v19;
}

- (id)resultByAddingDatabaseResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  WFSmartPromptApprovalResult *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  WFSmartPromptApprovalResult *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFSmartPromptApprovalResult previousAttributions](self, "previousAttributions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_msgSend(v4, "previousAttribution"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = (void *)MEMORY[0x1E0D13EA0];
    -[WFSmartPromptApprovalResult previousAttributions](self, "previousAttributions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v8;
    v9 = (void *)MEMORY[0x1E0D13EA0];
    objc_msgSend(v4, "previousAttribution");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributionSetWithAttributions:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributionSetByMergingAttributionSets:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }
  else
  {
    objc_msgSend(v4, "previousAttribution");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v35 = v5;
      goto LABEL_8;
    }
    v16 = (void *)MEMORY[0x1E0D13EA0];
    objc_msgSend(v4, "previousAttribution");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attributionSetWithAttributions:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
  }

  v35 = (void *)v14;
LABEL_8:
  v17 = self;
  -[WFSmartPromptApprovalResult allowedStates](v17, "allowedStates");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowedStates");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "arrayByAddingObjectsFromArray:", v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSmartPromptApprovalResult deniedStates](v17, "deniedStates");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deniedStates");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "arrayByAddingObjectsFromArray:", v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSmartPromptApprovalResult undefinedStates](v17, "undefinedStates");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undefinedStates");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v21);
  v22 = v4;
  v30 = v4;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSmartPromptApprovalResult restrictedStates](v17, "restrictedStates");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "restrictedStates");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSmartPromptApprovalResult actionUUID](v17, "actionUUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[WFSmartPromptApprovalResult initWithAllowedStates:deniedStates:undefinedStates:restrictedStates:actionUUID:previousAttributions:](v17, "initWithAllowedStates:deniedStates:undefinedStates:restrictedStates:actionUUID:previousAttributions:", v18, v19, v23, v26, v27, v35);

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFSmartPromptApprovalResult allowedStates](self, "allowedStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("allowedStates"));

  -[WFSmartPromptApprovalResult deniedStates](self, "deniedStates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("deniedStates"));

  -[WFSmartPromptApprovalResult undefinedStates](self, "undefinedStates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("undefinedStates"));

  -[WFSmartPromptApprovalResult restrictedStates](self, "restrictedStates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("restrictedStates"));

  -[WFSmartPromptApprovalResult actionUUID](self, "actionUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("actionUUID"));

  -[WFSmartPromptApprovalResult previousAttributions](self, "previousAttributions");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("previousAttributions"));

}

- (WFSmartPromptApprovalResult)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v22;
  WFSmartPromptApprovalResult *v23;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("allowedStates"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("deniedStates"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, CFSTR("undefinedStates"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0C99E60];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v19, CFSTR("restrictedStates"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionUUID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousAttributions"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[WFSmartPromptApprovalResult initWithAllowedStates:deniedStates:undefinedStates:restrictedStates:actionUUID:previousAttributions:](self, "initWithAllowedStates:deniedStates:undefinedStates:restrictedStates:actionUUID:previousAttributions:", v8, v12, v16, v20, v21, v22);
  return v23;
}

- (NSArray)allowedStates
{
  return self->_allowedStates;
}

- (NSArray)deniedStates
{
  return self->_deniedStates;
}

- (NSArray)undefinedStates
{
  return self->_undefinedStates;
}

- (NSArray)restrictedStates
{
  return self->_restrictedStates;
}

- (WFContentAttributionSet)previousAttributions
{
  return self->_previousAttributions;
}

- (NSString)actionUUID
{
  return self->_actionUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionUUID, 0);
  objc_storeStrong((id *)&self->_previousAttributions, 0);
  objc_storeStrong((id *)&self->_restrictedStates, 0);
  objc_storeStrong((id *)&self->_undefinedStates, 0);
  objc_storeStrong((id *)&self->_deniedStates, 0);
  objc_storeStrong((id *)&self->_allowedStates, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
