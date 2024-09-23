@implementation WFConfiguredTrigger

- (WFConfiguredTrigger)initWithIdentifier:(id)a3 workflowID:(id)a4 trigger:(id)a5 shouldPrompt:(BOOL)a6 shouldNotify:(BOOL)a7 shouldRecur:(BOOL)a8 enabled:(BOOL)a9 editableShortcut:(BOOL)a10 selectedEntryMetadata:(id)a11
{
  unsigned int v12;
  uint64_t v13;

  BYTE4(v13) = a10;
  LODWORD(v13) = 0;
  LOBYTE(v12) = a9;
  return -[WFConfiguredTrigger initWithIdentifier:workflowID:trigger:shouldPrompt:shouldNotify:shouldRecur:enabled:triggerSource:notificationLevel:editableShortcut:selectedEntryMetadata:](self, "initWithIdentifier:workflowID:trigger:shouldPrompt:shouldNotify:shouldRecur:enabled:triggerSource:notificationLevel:editableShortcut:selectedEntryMetadata:", a3, a4, a5, a6, a7, a8, v12, v13, a11);
}

- (WFConfiguredTrigger)initWithIdentifier:(id)a3 workflowID:(id)a4 trigger:(id)a5 shouldPrompt:(BOOL)a6 shouldNotify:(BOOL)a7 shouldRecur:(BOOL)a8 enabled:(BOOL)a9 triggerSource:(int)a10 notificationLevel:(int)a11 editableShortcut:(BOOL)a12 selectedEntryMetadata:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  NSString *v23;
  NSString *workflowID;
  WFConfiguredTrigger *v25;
  void *v27;
  objc_super v29;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a13;
  if (!v21)
    goto LABEL_6;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFConfiguredTrigger.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v29.receiver = self;
  v29.super_class = (Class)WFConfiguredTrigger;
  self = -[WFConfiguredTrigger initWithIdentifier:objectType:](&v29, sel_initWithIdentifier_objectType_, v19, 1);
  if (self)
  {
    v23 = (NSString *)objc_msgSend(v20, "copy");
    workflowID = self->_workflowID;
    self->_workflowID = v23;

    objc_storeStrong((id *)&self->_trigger, a5);
    self->_shouldPrompt = a6;
    self->_enabled = a9;
    self->_source = a10;
    self->_notificationLevel = a11;
    self->_shouldNotify = a7;
    self->_shouldRecur = a8;
    self->_editableShortcut = a12;
    objc_storeStrong((id *)&self->_selectedEntryMetadata, a13);
    self = self;
    v25 = self;
  }
  else
  {
LABEL_6:
    v25 = 0;
  }

  return v25;
}

- (WFConfiguredTrigger)initWithCoder:(id)a3
{
  id v4;
  WFConfiguredTrigger *v5;
  uint64_t v6;
  NSString *workflowID;
  uint64_t v8;
  WFTrigger *trigger;
  uint64_t v10;
  NSData *selectedEntryMetadata;
  WFConfiguredTrigger *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFConfiguredTrigger;
  v5 = -[WFConfiguredTrigger initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workflowID"));
    v6 = objc_claimAutoreleasedReturnValue();
    workflowID = v5->_workflowID;
    v5->_workflowID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trigger"));
    v8 = objc_claimAutoreleasedReturnValue();
    trigger = v5->_trigger;
    v5->_trigger = (WFTrigger *)v8;

    v5->_shouldPrompt = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldPrompt"));
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled"));
    v5->_source = objc_msgSend(v4, "decodeIntForKey:", CFSTR("source"));
    v5->_notificationLevel = objc_msgSend(v4, "decodeIntForKey:", CFSTR("notificationLevel"));
    v5->_shouldNotify = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldNotify"));
    v5->_shouldRecur = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldRecur"));
    v5->_editableShortcut = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("editableShortcut"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedEntryMetadata"));
    v10 = objc_claimAutoreleasedReturnValue();
    selectedEntryMetadata = v5->_selectedEntryMetadata;
    v5->_selectedEntryMetadata = (NSData *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFConfiguredTrigger;
  v4 = a3;
  -[WFConfiguredTrigger encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_workflowID, CFSTR("workflowID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_trigger, CFSTR("trigger"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldPrompt, CFSTR("shouldPrompt"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_enabled, CFSTR("enabled"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_notificationLevel, CFSTR("notificationLevel"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldNotify, CFSTR("shouldNotify"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldRecur, CFSTR("shouldRecur"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_editableShortcut, CFSTR("editableShortcut"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_selectedEntryMetadata, CFSTR("selectedEntryMetadata"));

}

- (BOOL)isEqual:(id)a3
{
  WFConfiguredTrigger *v4;
  WFConfiguredTrigger *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  int v22;
  _BOOL4 v23;
  void *v24;
  int v26;
  id v27;
  void *v28;
  objc_super v29;

  v4 = (WFConfiguredTrigger *)a3;
  if (v4 == self)
  {
    LOBYTE(v17) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v29.receiver = self;
      v29.super_class = (Class)WFConfiguredTrigger;
      if (!-[WFConfiguredTrigger isEqual:](&v29, sel_isEqual_, v5))
      {
        LOBYTE(v17) = 0;
LABEL_29:

        goto LABEL_30;
      }
      -[WFConfiguredTrigger trigger](v5, "trigger");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serializedData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFConfiguredTrigger trigger](self, "trigger");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serializedData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "isEqual:", v9))
      {
        LOBYTE(v17) = 0;
LABEL_28:

        goto LABEL_29;
      }
      -[WFConfiguredTrigger selectedEntryMetadata](v5, "selectedEntryMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFConfiguredTrigger selectedEntryMetadata](self, "selectedEntryMetadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "isEqual:", v11))
      {
        LOBYTE(v17) = 0;
LABEL_27:

        goto LABEL_28;
      }
      v28 = v10;
      -[WFConfiguredTrigger workflowID](self, "workflowID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFConfiguredTrigger workflowID](v5, "workflowID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12;
      v15 = v13;
      v16 = v15;
      if (v14 == v15)
      {
        v27 = v15;

      }
      else
      {
        if (!v14 || !v15)
        {

          v24 = v16;
          LOBYTE(v17) = 0;
          v10 = v28;
          goto LABEL_26;
        }
        v26 = objc_msgSend(v14, "isEqualToString:", v15);
        v27 = v16;

        if (!v26)
          goto LABEL_23;
      }
      v18 = -[WFConfiguredTrigger isEnabled](self, "isEnabled");
      if (v18 == -[WFConfiguredTrigger isEnabled](v5, "isEnabled"))
      {
        v19 = -[WFConfiguredTrigger shouldPrompt](self, "shouldPrompt");
        if (v19 == -[WFConfiguredTrigger shouldPrompt](v5, "shouldPrompt"))
        {
          v20 = -[WFConfiguredTrigger shouldNotify](self, "shouldNotify");
          if (v20 == -[WFConfiguredTrigger shouldNotify](v5, "shouldNotify"))
          {
            v21 = -[WFConfiguredTrigger shouldRecur](self, "shouldRecur");
            if (v21 == -[WFConfiguredTrigger shouldRecur](v5, "shouldRecur"))
            {
              v22 = -[WFConfiguredTrigger notificationLevel](self, "notificationLevel");
              if (v22 == -[WFConfiguredTrigger notificationLevel](v5, "notificationLevel"))
              {
                v23 = -[WFConfiguredTrigger editableShortcut](self, "editableShortcut");
                v17 = v23 ^ -[WFConfiguredTrigger editableShortcut](v5, "editableShortcut") ^ 1;
LABEL_24:
                v24 = v27;
                v10 = v28;
LABEL_26:

                goto LABEL_27;
              }
            }
          }
        }
      }
LABEL_23:
      LOBYTE(v17) = 0;
      goto LABEL_24;
    }
    LOBYTE(v17) = 0;
  }
LABEL_30:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  unint64_t v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)WFConfiguredTrigger;
  v3 = -[WFConfiguredTrigger hash](&v27, sel_hash);
  -[WFConfiguredTrigger workflowID](self, "workflowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[WFConfiguredTrigger trigger](self, "trigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serializedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5 ^ objc_msgSend(v7, "hash");
  -[WFConfiguredTrigger selectedEntryMetadata](self, "selectedEntryMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");
  -[WFConfiguredTrigger identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash") ^ v3;
  if (-[WFConfiguredTrigger shouldPrompt](self, "shouldPrompt"))
    v13 = 3203381950;
  else
    v13 = 3133065982;
  v14 = -[WFConfiguredTrigger isEnabled](self, "isEnabled");
  v15 = 3405774846;
  if (v14)
    v15 = 3133079551;
  v16 = v13 ^ v15;
  v17 = -[WFConfiguredTrigger shouldNotify](self, "shouldNotify");
  v18 = 3203332814;
  if (v17)
    v18 = 4282069247;
  v19 = v16 ^ v18;
  v20 = -[WFConfiguredTrigger shouldRecur](self, "shouldRecur");
  v21 = 3741249005;
  if (v20)
    v21 = 3735928559;
  v22 = v19 ^ v21;
  v23 = -[WFConfiguredTrigger editableShortcut](self, "editableShortcut");
  v24 = 3131817919;
  if (!v23)
    v24 = 3131817405;
  v25 = v12 ^ v22 ^ v24;

  return v25;
}

- (NSString)workflowID
{
  return self->_workflowID;
}

- (NSData)selectedEntryMetadata
{
  return self->_selectedEntryMetadata;
}

- (WFTrigger)trigger
{
  return self->_trigger;
}

- (BOOL)shouldPrompt
{
  return self->_shouldPrompt;
}

- (BOOL)shouldNotify
{
  return self->_shouldNotify;
}

- (BOOL)shouldRecur
{
  return self->_shouldRecur;
}

- (BOOL)editableShortcut
{
  return self->_editableShortcut;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (int)source
{
  return self->_source;
}

- (int)notificationLevel
{
  return self->_notificationLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_selectedEntryMetadata, 0);
  objc_storeStrong((id *)&self->_workflowID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
