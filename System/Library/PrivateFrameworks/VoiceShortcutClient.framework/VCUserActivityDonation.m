@implementation VCUserActivityDonation

- (VCUserActivityDonation)initWithUserActivity:(id)a3 identifier:(id)a4 sourceAppIdentifier:(id)a5 date:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  VCUserActivityDonation *v15;
  id v16;
  void *v17;
  INShortcut *v18;
  INShortcut *shortcut;
  NSString *v20;
  NSString *identifier;
  NSString *v22;
  NSString *sourceAppIdentifier;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCUserActivityDonation.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userActivity"));

    if (v12)
    {
LABEL_3:
      if (v13)
        goto LABEL_4;
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCUserActivityDonation.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceAppIdentifier"));

      if (v14)
        goto LABEL_5;
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCUserActivityDonation.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

      goto LABEL_14;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCUserActivityDonation.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  if (!v13)
    goto LABEL_12;
LABEL_4:
  if (!v14)
    goto LABEL_13;
LABEL_5:
  v15 = 0;
  if (v11 && v12 && v13)
  {
    v29.receiver = self;
    v29.super_class = (Class)VCUserActivityDonation;
    self = -[VCUserActivityDonation init](&v29, sel_init);
    if (self)
    {
      v16 = objc_alloc(MEMORY[0x1E0CBDBE8]);
      INDisplayableOrLaunchableBundleIdForBundleIdFromUserActivity();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (INShortcut *)objc_msgSend(v16, "initWithUserActivity:bundleIdentifier:", v11, v17);
      shortcut = self->_shortcut;
      self->_shortcut = v18;

      v20 = (NSString *)objc_msgSend(v12, "copy");
      identifier = self->_identifier;
      self->_identifier = v20;

      v22 = (NSString *)objc_msgSend(v13, "copy");
      sourceAppIdentifier = self->_sourceAppIdentifier;
      self->_sourceAppIdentifier = v22;

      objc_storeStrong((id *)&self->_date, a6);
      self = self;
      v15 = self;
      goto LABEL_15;
    }
LABEL_14:
    v15 = 0;
  }
LABEL_15:

  return v15;
}

- (VCUserActivityDonation)initWithEvent:(id)a3
{
  id v4;
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
  dispatch_semaphore_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  dispatch_time_t v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  VCUserActivityDonation *v41;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  _QWORD v53[4];
  NSObject *v54;
  _BYTE *v55;
  void *v56;
  _QWORD v57[2];
  _BYTE buf[24];
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46 = v4;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v5, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15998], "userActivityRequiredString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityStrings:secondaryString:optionalData:", v50, 0, 0);
      objc_msgSend(v5, "metadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15998], "suggestedInvocationPhrase");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setSuggestedInvocationPhrase:", v10);

      objc_msgSend(v5, "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15998], "isEligibleForPrediction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v12);
      v45 = objc_claimAutoreleasedReturnValue();

      if (v45)
        objc_msgSend(v52, "setEligibleForPrediction:", -[NSObject BOOLValue](v45, "BOOLValue"));
      objc_msgSend(v5, "metadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15998], "itemRelatedContentURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v14);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15998], "itemRelatedUniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v16);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15998], "contentDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v18);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v59 = __Block_byref_object_copy_;
      v60 = __Block_byref_object_dispose_;
      v61 = 0;
      v19 = dispatch_semaphore_create(0);
      objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x1E0CA6960];
      v57[0] = CFSTR("_kMDItemThumbnailDataPath");
      v57[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "source");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bundleID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "metadata");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15998], "itemIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *MEMORY[0x1E0CB2AB0];
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __VCUserActivityFromEvent_block_invoke;
      v53[3] = &unk_1E5FC4BE8;
      v55 = buf;
      v29 = v19;
      v54 = v29;
      objc_msgSend(v44, "slowFetchAttributes:protectionClass:bundleID:identifiers:completionHandler:", v21, v28, v23, v27, v53);

      v30 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v29, v30);
      if (v49 || v48 || v47 || *(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        v31 = objc_alloc(MEMORY[0x1E0CA6B50]);
        objc_msgSend((id)*MEMORY[0x1E0CEC498], "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v31, "initWithItemContentType:", v32);

        objc_msgSend(v33, "setRelatedUniqueIdentifier:", v48);
        objc_msgSend(v33, "setContentURL:", v49);
        objc_msgSend(v33, "setContentDescription:", v47);
        objc_msgSend(v33, "setThumbnailURL:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        objc_msgSend(v52, "setContentAttributeSet:", v33);

      }
      _Block_object_dispose(buf, 8);

      v34 = v45;
    }
    else
    {
      getWFVoiceShortcutClientLogObject();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "metadata");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "VCUserActivityFromEvent";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v35;
        _os_log_impl(&dword_1AF681000, v34, OS_LOG_TYPE_DEFAULT, "%s Missing user activity required string from event.metadata=%@", buf, 0x16u);

      }
      v52 = 0;
    }

    if (v52)
    {
      objc_msgSend(v5, "UUID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "UUIDString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringValue");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[VCUserActivityDonation initWithUserActivity:identifier:sourceAppIdentifier:date:](self, "initWithUserActivity:identifier:sourceAppIdentifier:date:", v52, v37, v39, v40);

      v41 = self;
    }
    else
    {
      v41 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCUserActivityDonation.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

    v41 = 0;
  }

  return v41;
}

- (NSUserActivity)userActivity
{
  void *v2;
  void *v3;

  -[VCUserActivityDonation shortcut](self, "shortcut");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUserActivity *)v3;
}

- (BOOL)isEqual:(id)a3
{
  VCUserActivityDonation *v4;
  BOOL v5;

  v4 = (VCUserActivityDonation *)a3;
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
  return -[NSString hash](self->_identifier, "hash") ^ 0xC001F00D;
}

- (NSString)sourceAppIdentifierForDisplay
{
  void *v2;
  void *v3;

  -[VCUserActivityDonation shortcut](self, "shortcut");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sourceAppIdentifierForLaunching
{
  void *v2;
  void *v3;

  -[VCUserActivityDonation shortcut](self, "shortcut");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)dateString
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "timestampDateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCUserActivityDonation date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[VCUserActivityDonation userActivity](self, "userActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)subtitle
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[VCUserActivityDonation sourceAppIdentifierForDisplay](self, "sourceAppIdentifierForDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[VCUserActivityDonation shortcut](self, "shortcut");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activitySubtitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (NSString)fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v15;

  -[VCUserActivityDonation userActivity](self, "userActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCUserActivityDonation sourceAppIdentifier](self, "sourceAppIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCUserActivityDonation dateString](self, "dateString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requiredUserInfoKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "webpageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_isEligibleForPrediction"))
    v11 = CFSTR("Yes");
  else
    v11 = CFSTR("No");
  objc_msgSend(v3, "interaction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Title: %@\nActivity Type: %@\nBundle Identifier: %@\nDate: %@\nRequired User Info Keys: %@\nUser Info: %@\nWeb Page URL: %@\nEligible For Prediction: %@\nInteraction: %@\n"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSString)suggestedPhrase
{
  void *v2;
  void *v3;

  -[VCUserActivityDonation userActivity](self, "userActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suggestedInvocationPhrase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)uniqueProperty
{
  void *v3;
  void *v4;
  void *v5;
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
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;

  -[VCUserActivityDonation userActivity](self, "userActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[VCUserActivityDonation userActivity](self, "userActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requiredUserInfoKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __40__VCUserActivityDonation_uniqueProperty__block_invoke;
    v20 = &unk_1E5FC4BC0;
    v21 = v7;
    v22 = v5;
    objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", &v17);

  }
  -[VCUserActivityDonation sourceAppIdentifierForDisplay](self, "sourceAppIdentifierForDisplay", v17, v18, v19, v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[VCUserActivityDonation sourceAppIdentifierForDisplay](self, "sourceAppIdentifierForDisplay");
  else
    -[VCUserActivityDonation sourceAppIdentifier](self, "sourceAppIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("VCUserActivitySourceAppIdentifier"));

  -[VCUserActivityDonation userActivity](self, "userActivity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activityType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("VCUserActivityType"));

  -[VCUserActivityDonation userActivity](self, "userActivity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "webpageURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[VCUserActivityDonation userActivity](self, "userActivity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "webpageURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("VCUserActivityWebpageURL"));

  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)sourceAppIdentifier
{
  return self->_sourceAppIdentifier;
}

- (NSDate)date
{
  return self->_date;
}

- (INShortcut)shortcut
{
  return self->_shortcut;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_sourceAppIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __40__VCUserActivityDonation_uniqueProperty__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) == 0)
    {
      getWFVoiceShortcutClientLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315394;
        v7 = "-[VCUserActivityDonation uniqueProperty]_block_invoke";
        v8 = 2112;
        v9 = v4;
        _os_log_impl(&dword_1AF681000, v5, OS_LOG_TYPE_DEFAULT, "%s %@ is not a required key; ignoring it in the donation's uniqueProperty.",
          (uint8_t *)&v6,
          0x16u);
      }

      objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v4);
    }

  }
}

+ (id)timestampDateFormatter
{
  if (timestampDateFormatter_onceToken != -1)
    dispatch_once(&timestampDateFormatter_onceToken, &__block_literal_global_1145);
  return (id)timestampDateFormatter_dateFormatter;
}

uint64_t __48__VCUserActivityDonation_timestampDateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)timestampDateFormatter_dateFormatter;
  timestampDateFormatter_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)timestampDateFormatter_dateFormatter, "setDateStyle:", 1);
  return objc_msgSend((id)timestampDateFormatter_dateFormatter, "setTimeStyle:", 1);
}

@end
