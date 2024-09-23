@implementation VCInteractionDonation

- (VCInteractionDonation)initWithIdentifier:(id)a3 sourceAppIdentifier:(id)a4 interaction:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCInteractionDonation *v12;
  NSString *v13;
  NSString *identifier;
  NSString *v15;
  NSString *sourceAppIdentifier;
  INInteraction *v17;
  INInteraction *interaction;
  void *v19;
  NSString *v20;
  NSString *title;
  NSString *v22;
  NSString *subtitle;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCInteractionDonation.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceAppIdentifier"));

    if (v11)
      goto LABEL_4;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCInteractionDonation.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interaction"));

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCInteractionDonation.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  if (!v10)
    goto LABEL_9;
LABEL_3:
  if (!v11)
    goto LABEL_10;
LABEL_4:
  v12 = 0;
  if (v9 && v10)
  {
    v28.receiver = self;
    v28.super_class = (Class)VCInteractionDonation;
    self = -[VCInteractionDonation init](&v28, sel_init);
    if (self)
    {
      v13 = (NSString *)objc_msgSend(v9, "copy");
      identifier = self->_identifier;
      self->_identifier = v13;

      v15 = (NSString *)objc_msgSend(v10, "copy");
      sourceAppIdentifier = self->_sourceAppIdentifier;
      self->_sourceAppIdentifier = v15;

      v17 = (INInteraction *)objc_msgSend(v11, "copy");
      interaction = self->_interaction;
      self->_interaction = v17;

      -[INInteraction intent](self->_interaction, "intent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_title");
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      title = self->_title;
      self->_title = v20;

      objc_msgSend(v19, "_subtitle");
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      subtitle = self->_subtitle;
      self->_subtitle = v22;

      self = self;
      v12 = self;
      goto LABEL_12;
    }
LABEL_11:
    v12 = 0;
  }
LABEL_12:

  return v12;
}

- (VCInteractionDonation)initWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  VCInteractionDonation *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A40], "serializedInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;
    if (v8)
    {
      objc_msgSend(v4, "UUID");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject UUIDString](v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "source");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[VCInteractionDonation initWithIdentifier:sourceAppIdentifier:interaction:](self, "initWithIdentifier:sourceAppIdentifier:interaction:", v11, v13, v8);

      v14 = self;
    }
    else
    {
      getWFVoiceShortcutClientLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v19 = "-[VCInteractionDonation initWithEvent:]";
        v20 = 2112;
        v21 = v4;
        v22 = 2112;
        v23 = v9;
        _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_DEFAULT, "%s Failed to unarchive interaction data for event: %@, error: %@", buf, 0x20u);
      }
      v14 = 0;
    }

  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v19 = "-[VCInteractionDonation initWithEvent:]";
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_1AF681000, v9, OS_LOG_TYPE_DEFAULT, "%s Missing interaction data from event.metadata=%@", buf, 0x16u);

    }
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  VCInteractionDonation *v4;
  BOOL v5;

  v4 = (VCInteractionDonation *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NSString isEqualToString:](self->_identifier, "isEqualToString:", v4->_identifier);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash") ^ 0xBADCA7;
}

- (NSString)sourceAppIdentifierForDisplay
{
  void *v2;
  void *v3;
  void *v4;

  -[VCInteractionDonation interaction](self, "interaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_intents_bundleIdForDisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)sourceAppIdentifierForLaunching
{
  void *v2;
  void *v3;
  void *v4;

  -[VCInteractionDonation interaction](self, "interaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_intents_bundleIdForLaunching");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSDate)date
{
  void *v2;
  void *v3;
  void *v4;

  -[VCInteractionDonation interaction](self, "interaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSString)subtitle
{
  void *v3;
  char v4;
  NSString *v5;

  -[VCInteractionDonation sourceAppIdentifierForDisplay](self, "sourceAppIdentifierForDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

  if ((v4 & 1) != 0)
    v5 = 0;
  else
    v5 = self->_subtitle;
  return v5;
}

- (NSString)fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v38;

  objc_msgSend((id)objc_opt_class(), "timestampDateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCInteractionDonation date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[VCInteractionDonation interaction](self, "interaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "formattedText");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (__CFString *)v8;
  else
    v10 = &stru_1E5FC92C0;
  v37 = v10;

  -[VCInteractionDonation interaction](self, "interaction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "intentResponse");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backingStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "formattedText");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (__CFString *)v14;
  else
    v16 = &stru_1E5FC92C0;
  v33 = v16;

  v30 = (id)MEMORY[0x1E0CB3940];
  -[VCInteractionDonation title](self, "title");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCInteractionDonation subtitle](self, "subtitle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCInteractionDonation interaction](self, "interaction");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "intent");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_className");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCInteractionDonation sourceAppIdentifierForDisplay](self, "sourceAppIdentifierForDisplay");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCInteractionDonation sourceAppIdentifierForLaunching](self, "sourceAppIdentifierForLaunching");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCInteractionDonation interaction](self, "interaction");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "intent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "launchId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCInteractionDonation interaction](self, "interaction");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "intent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_nanoLaunchId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCInteractionDonation interaction](self, "interaction");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "intent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "extensionBundleId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("Title: %@\nSubtitle: %@\nType: %@\nBundle Identifier for Display: %@\nBundle Identifier for Launch: %@\nDate: %@\nlaunchId: %@\nnanoLaunchId: %@\nExtension Bundle ID: %@\nIntent:\n%@\nResponse:\n%@"), v29, v36, v17, v26, v18, v38, v19, v21, v24, v37, v33);
  v31 = (id)objc_claimAutoreleasedReturnValue();

  return (NSString *)v31;
}

- (INShortcut)shortcut
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CBDBE8]);
  -[VCInteractionDonation interaction](self, "interaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithIntent:", v5);

  return (INShortcut *)v6;
}

- (NSString)suggestedPhrase
{
  void *v2;
  void *v3;
  void *v4;

  -[VCInteractionDonation interaction](self, "interaction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestedInvocationPhrase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)uniqueProperty
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[VCInteractionDonation sourceAppIdentifierForDisplay](self, "sourceAppIdentifierForDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[VCInteractionDonation sourceAppIdentifierForDisplay](self, "sourceAppIdentifierForDisplay");
  else
    -[VCInteractionDonation sourceAppIdentifier](self, "sourceAppIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VCInteractionDonation title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCInteractionDonation subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@-%@"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)sourceAppIdentifier
{
  return self->_sourceAppIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sourceAppIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)timestampDateFormatter
{
  if (timestampDateFormatter_onceToken_13438 != -1)
    dispatch_once(&timestampDateFormatter_onceToken_13438, &__block_literal_global_13439);
  return (id)timestampDateFormatter_dateFormatter_13440;
}

uint64_t __47__VCInteractionDonation_timestampDateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)timestampDateFormatter_dateFormatter_13440;
  timestampDateFormatter_dateFormatter_13440 = (uint64_t)v0;

  objc_msgSend((id)timestampDateFormatter_dateFormatter_13440, "setDateStyle:", 1);
  return objc_msgSend((id)timestampDateFormatter_dateFormatter_13440, "setTimeStyle:", 1);
}

@end
