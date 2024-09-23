@implementation PFAdjustment

- (PFAdjustment)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-init unsupported, use one of the other initializers"));

  return 0;
}

- (PFAdjustment)initWithIdentifier:(id)a3 settings:(id)a4 enabled:(BOOL)a5
{
  return -[PFAdjustment initWithIdentifier:settings:autoIdentifier:autoSettings:enabled:](self, "initWithIdentifier:settings:autoIdentifier:autoSettings:enabled:", a3, a4, 0, 0, a5);
}

- (PFAdjustment)initWithIdentifier:(id)a3 settings:(id)a4 autoIdentifier:(id)a5 autoSettings:(id)a6 enabled:(BOOL)a7
{
  return -[PFAdjustment initWithIdentifier:settings:autoIdentifier:autoSettings:enabled:maskUUID:](self, "initWithIdentifier:settings:autoIdentifier:autoSettings:enabled:maskUUID:", a3, a4, a5, a6, a7, 0);
}

- (PFAdjustment)initWithIdentifier:(id)a3 settings:(id)a4 autoIdentifier:(id)a5 autoSettings:(id)a6 enabled:(BOOL)a7 maskUUID:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  PFAdjustment *v18;
  PFAdjustment *v19;
  PFAdjustment *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  id v26;
  objc_super v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v26 = a6;
  v17 = a8;
  if (!v14)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99768];
    v23 = CFSTR("Attempting to initialize adjustment with nil identifier");
LABEL_8:
    objc_msgSend(v21, "raise:format:", v22, v23);
    v20 = 0;
    goto LABEL_9;
  }
  if (!v15)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99768];
    v23 = CFSTR("Attempting to initialize adjustment with nil settings");
    goto LABEL_8;
  }
  v27.receiver = self;
  v27.super_class = (Class)PFAdjustment;
  v18 = -[PFAdjustment init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_settings, a4);
    objc_storeStrong((id *)&v19->_autoIdentifier, a5);
    objc_storeStrong((id *)&v19->_autoSettings, a6);
    v19->_enabled = a7;
    objc_storeStrong((id *)&v19->_maskUUID, a8);
    v19->_formatVersion = 1;
  }
  self = v19;
  v20 = self;
LABEL_9:

  return v20;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p identifer=%@ maskUUID=%@ enabled=%d settings=%@"), objc_opt_class(), self, self->_identifier, self->_maskUUID, self->_enabled, self->_settings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(_OWORD *)&self->_autoIdentifier != 0)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" autoIdentifier=%@ autoSettings=%@"), self->_autoIdentifier, self->_autoSettings);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(">"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)formatVersion
{
  return self->_formatVersion;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)settings
{
  return self->_settings;
}

- (NSString)autoIdentifier
{
  return self->_autoIdentifier;
}

- (NSDictionary)autoSettings
{
  return self->_autoSettings;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSString)maskUUID
{
  return self->_maskUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskUUID, 0);
  objc_storeStrong((id *)&self->_autoSettings, 0);
  objc_storeStrong((id *)&self->_autoIdentifier, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (PFAdjustment)initWithArchiveDictionary:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PFAdjustment *v14;
  uint64_t v15;
  PFAdjustment *v16;
  unint64_t v18;

  if (a3)
  {
    v4 = PFAdjustmentFormatVersionKey;
    v5 = a3;
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", PFAdjustmentIdentifierKey);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", PFAdjustmentArchivedSettingsKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", PFAdjustmentEnabledKey);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", PFAdjustmentMaskUUIDKey);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", PFAdjustmentAutoKey);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", PFAdjustmentSettingsAutoCurrentKey);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    else
    {
      v12 = 0;
    }
    v13 = 0;
LABEL_8:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v6, "unsignedIntegerValue");
      if (!v7)
        goto LABEL_24;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = objc_msgSend(v6, "integerValue");
        if (!v7)
          goto LABEL_24;
      }
      else
      {
        if (v6)
          goto LABEL_24;
        v15 = 0;
        if (!v7)
          goto LABEL_24;
      }
    }
    v18 = v15;
    objc_opt_class();
    v14 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_25;
    if (!v8)
      goto LABEL_25;
    objc_opt_class();
    v14 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0 || !v9)
      goto LABEL_25;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[PFAdjustment initWithIdentifier:settings:autoIdentifier:autoSettings:enabled:maskUUID:](self, "initWithIdentifier:settings:autoIdentifier:autoSettings:enabled:maskUUID:", v7, v8, v12, v13, objc_msgSend(v9, "BOOLValue"), v10);
      if (v16)
        v16->_formatVersion = v18;
      self = v16;
      v14 = self;
      goto LABEL_25;
    }
LABEL_24:
    v14 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v14 = 0;
LABEL_26:

  return v14;
}

- (id)archiveDictionary
{
  void *v3;
  void *v4;
  void *v5;
  NSString *maskUUID;
  NSDictionary *settings;
  NSString *autoIdentifier;
  NSDictionary *autoSettings;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_formatVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, PFAdjustmentFormatVersionKey);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, PFAdjustmentIdentifierKey);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enabled);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, PFAdjustmentEnabledKey);

  maskUUID = self->_maskUUID;
  if (maskUUID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", maskUUID, PFAdjustmentMaskUUIDKey);
  settings = self->_settings;
  if (settings)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", settings, PFAdjustmentArchivedSettingsKey);
  autoIdentifier = self->_autoIdentifier;
  if (autoIdentifier)
  {
    autoSettings = self->_autoSettings;
    if (autoSettings)
    {
      v12[0] = PFAdjustmentSettingsAutoCurrentKey;
      v12[1] = autoIdentifier;
      v13[0] = autoIdentifier;
      v13[1] = autoSettings;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, PFAdjustmentAutoKey);

    }
  }
  return v3;
}

+ (BOOL)isValidArchiveDictionary:(id)a3 errors:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  int v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    if (+[PFAdjustmentSerialization validateArchive:containsEntryWithKey:ofType:errors:](PFAdjustmentSerialization, "validateArchive:containsEntryWithKey:ofType:errors:", v5, PFAdjustmentFormatVersionKey, objc_opt_class(), v6))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", PFAdjustmentFormatVersionKey);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedIntegerValue");
      v9 = v8 == 1;
      if (v8 != 1)
      {
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v21 = PFAdjustmentFormatVersionKey;
        v22[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("PFAdjustmentErrorDomain"), 4, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

      }
    }
    else
    {
      v9 = 0;
    }
    v15 = v9 & +[PFAdjustmentSerialization validateArchive:containsEntryWithKey:ofType:errors:](PFAdjustmentSerialization, "validateArchive:containsEntryWithKey:ofType:errors:", v5, PFAdjustmentIdentifierKey, objc_opt_class(), v6);
    v16 = +[PFAdjustmentSerialization validateArchive:containsEntryWithKey:ofType:errors:](PFAdjustmentSerialization, "validateArchive:containsEntryWithKey:ofType:errors:", v5, PFAdjustmentArchivedSettingsKey, objc_opt_class(), v6);
    v14 = (+[PFAdjustmentSerialization validateArchive:containsEntryWithKey:ofType:errors:](PFAdjustmentSerialization, "validateArchive:containsEntryWithKey:ofType:errors:", v5, PFAdjustmentEnabledKey, objc_opt_class(), v6)&& v16) & v15;
    objc_msgSend(v5, "objectForKeyedSubscript:", PFAdjustmentAutoKey);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (+[PFAdjustmentSerialization validateValue:isOfType:errors:](PFAdjustmentSerialization, "validateValue:isOfType:errors:", v17, objc_opt_class(), v6)&& v14)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", PFAdjustmentSettingsAutoCurrentKey);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", PFAdjustmentSettingsAutoCurrentKey);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = +[PFAdjustmentSerialization validateValue:isOfType:errors:](PFAdjustmentSerialization, "validateValue:isOfType:errors:", v19, objc_opt_class(), v6);
          if (v14 && v19)
            LOBYTE(v14) = +[PFAdjustmentSerialization validateArchive:containsEntryWithKey:ofType:errors:](PFAdjustmentSerialization, "validateArchive:containsEntryWithKey:ofType:errors:", v17, v19, objc_opt_class(), v6);
        }
        else
        {
          v19 = 0;
          LOBYTE(v14) = 1;
        }
      }
      else
      {
        v19 = 0;
        LOBYTE(v14) = 0;
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PFAdjustmentErrorDomain"), 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v13);

    LOBYTE(v14) = 0;
  }

  return v14;
}

@end
