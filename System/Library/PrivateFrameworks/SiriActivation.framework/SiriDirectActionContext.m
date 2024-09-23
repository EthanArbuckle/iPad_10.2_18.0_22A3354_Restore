@implementation SiriDirectActionContext

- (SiriDirectActionContext)initWithPayload:(id)a3
{
  id v5;
  SiriDirectActionContext *v6;
  SiriDirectActionContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriDirectActionContext;
  v6 = -[SiriDirectActionContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_payload, a3);

  return v7;
}

- (SiriDirectActionContext)initWithBBBulletin:(id)a3
{
  id v5;
  SiriDirectActionContext *v6;
  SiriDirectActionContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriDirectActionContext;
  v6 = -[SiriDirectActionContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bulletin, a3);

  return v7;
}

- (SiriDirectActionContext)initWithUNNotification:(id)a3
{
  id v5;
  SiriDirectActionContext *v6;
  SiriDirectActionContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriDirectActionContext;
  v6 = -[SiriDirectActionContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_notification, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SiriContext contextOverride](self, "contextOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriDirectActionContext payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriDirectActionContext bulletin](self, "bulletin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriDirectActionContext notification](self, "notification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriDirectActionContext directActionEvent](self, "directActionEvent");
  AFDirectActionEventGetName();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriDirectActionContext bundleId](self, "bundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SiriDirectActionContext contextOverride:%@, payload:%@, bulletin:%@, notification:%@, directActionEvent:%@, bundleId:%@>"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)directActionEvent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  void *v9;

  -[SiriDirectActionContext payload](self, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SiriDirectActionContext payload](self, "payload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CFEB80]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");
  }
  else
  {
    -[SiriDirectActionContext bulletin](self, "bulletin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriDirectActionContext notification](self, "notification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SiriDirectActionContext _directActionEventFromContentTypesOfBulletin:notification:](self, "_directActionEventFromContentTypesOfBulletin:notification:", v8, v9);

    if (v7)
      return v7;
    -[SiriDirectActionContext bulletin](self, "bulletin");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriDirectActionContext notification](self, "notification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SiriDirectActionContext _directActionEventFromAppIdsAndIntentIdentifiersOfBulletin:notification:](self, "_directActionEventFromAppIdsAndIntentIdentifiersOfBulletin:notification:", v4, v5);
  }
  v7 = v6;

  return v7;
}

- (id)bundleId
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[SiriDirectActionContext payload](self, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SiriDirectActionContext payload](self, "payload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("SBSAssistantActivationContextBundleID"));
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = (void *)v5;

    return v7;
  }
  -[SiriDirectActionContext bulletin](self, "bulletin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SiriDirectActionContext bulletin](self, "bulletin");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sectionID");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[SiriDirectActionContext notification](self, "notification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SiriDirectActionContext notification](self, "notification");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriDirectActionContext)initWithCoder:(id)a3
{
  id v4;
  SiriDirectActionContext *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *payload;
  uint64_t v12;
  BBBulletin *bulletin;
  uint64_t v14;
  UNNotification *notification;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SiriDirectActionContext;
  v5 = -[SiriContext initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("payload"));
    v10 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bulletin"));
    v12 = objc_claimAutoreleasedReturnValue();
    bulletin = v5->_bulletin;
    v5->_bulletin = (BBBulletin *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notification"));
    v14 = objc_claimAutoreleasedReturnValue();
    notification = v5->_notification;
    v5->_notification = (UNNotification *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SiriDirectActionContext;
  v4 = a3;
  -[SiriContext encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[SiriDirectActionContext payload](self, "payload", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("payload"));

  -[SiriDirectActionContext bulletin](self, "bulletin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bulletin"));

  -[SiriDirectActionContext notification](self, "notification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("notification"));

}

- (id)_intentIdentifiersFromBulletin:(id)a3 notification:(id)a4
{
  if (a3)
    objc_msgSend(a3, "intentIDs");
  else
    objc_msgSend(a4, "intentIdentifiers");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_directActionEventFromContentTypesOfBulletin:(id)a3 notification:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v26[6];
  _QWORD v27[6];
  _QWORD v28[6];
  _QWORD v29[8];

  v29[6] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0D03648];
  v28[0] = *MEMORY[0x1E0D03630];
  v28[1] = v6;
  v29[0] = &unk_1E920E280;
  v29[1] = &unk_1E920E280;
  v7 = *MEMORY[0x1E0D03610];
  v28[2] = *MEMORY[0x1E0D03620];
  v28[3] = v7;
  v29[2] = &unk_1E920E298;
  v29[3] = &unk_1E920E2B0;
  v8 = *MEMORY[0x1E0D03668];
  v28[4] = *MEMORY[0x1E0D03658];
  v28[5] = v8;
  v29[4] = &unk_1E920E2B0;
  v29[5] = &unk_1E920E2C8;
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = a3;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = v13;
    v15 = objc_msgSend(v13, "integerValue");
  }
  else
  {
    v16 = *MEMORY[0x1E0CEC880];
    v26[0] = *MEMORY[0x1E0CEC870];
    v26[1] = v16;
    v27[0] = &unk_1E920E280;
    v27[1] = &unk_1E920E280;
    v17 = *MEMORY[0x1E0CEC848];
    v26[2] = *MEMORY[0x1E0CEC858];
    v26[3] = v17;
    v27[2] = &unk_1E920E298;
    v27[3] = &unk_1E920E2B0;
    v18 = *MEMORY[0x1E0CEC898];
    v26[4] = *MEMORY[0x1E0CEC888];
    v26[5] = v18;
    v27[4] = &unk_1E920E2B0;
    v27[5] = &unk_1E920E2C8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "request");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "content");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contentType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v23;
    if (v23)
    {
      v15 = objc_msgSend(v23, "integerValue");
    }
    else
    {
      if (objc_msgSend(v12, "length") || objc_msgSend(v22, "length"))
      {
        v24 = *MEMORY[0x1E0CFE6A0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
          -[SiriDirectActionContext _directActionEventFromContentTypesOfBulletin:notification:].cold.1((uint64_t)v12, (uint64_t)v22, v24);
      }
      v15 = 0;
    }

  }
  return v15;
}

- (int64_t)_directActionEventFromAppIdsAndIntentIdentifiersOfBulletin:(id)a3 notification:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[SiriDirectActionContext bundleId](self, "bundleId", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[SiriDirectActionContext bundleId](self, "bundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("com.apple.MobileSMS"));

    if (!v8)
      return 4;
  }
  -[SiriDirectActionContext bundleId](self, "bundleId");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        -[SiriDirectActionContext bundleId](self, "bundleId"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("com.apple.Home")),
        v11,
        v10,
        !v12))
  {
    -[SiriDirectActionContext bulletin](self, "bulletin");
    v29 = objc_claimAutoreleasedReturnValue();
    -[SiriDirectActionContext notification](self, "notification");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriDirectActionContext _intentIdentifiersFromBulletin:notification:](self, "_intentIdentifiersFromBulletin:notification:", v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v29) = objc_msgSend(v31, "containsObject:", *MEMORY[0x1E0CBD610]);
    if ((v29 & 1) != 0)
      return 16;
  }
  else
  {
    -[SiriDirectActionContext bundleId](self, "bundleId");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[SiriDirectActionContext bundleId](self, "bundleId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "caseInsensitiveCompare:", CFSTR("com.apple.shortcuts"));

      if (!v16)
        return 17;
    }
    -[SiriDirectActionContext bulletin](self, "bulletin");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriDirectActionContext notification](self, "notification");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriDirectActionContext _intentIdentifiersFromBulletin:notification:](self, "_intentIdentifiersFromBulletin:notification:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v34;
      v24 = *MEMORY[0x1E0CBD638];
      v25 = *MEMORY[0x1E0CBD630];
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v34 != v23)
            objc_enumerationMutation(v20);
          v27 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((objc_msgSend(v27, "containsString:", v24, (_QWORD)v33) & 1) != 0
            || (objc_msgSend(v27, "containsString:", v25) & 1) != 0)
          {

            return 4;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v22)
          continue;
        break;
      }
    }

  }
  v32 = (void *)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    -[SiriDirectActionContext _directActionEventFromAppIdsAndIntentIdentifiersOfBulletin:notification:].cold.1(v32, self);
  return 0;
}

+ (id)messageAmbiguousDirectActionWithAppBundleId:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithDirectActionEvent:appBundleId:conversationGUID:fullName:phoneOrEmailAddress:", 1, v3, 0, 0, 0);

  return v4;
}

+ (id)messageComposeDirectActionWithAppBundleId:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithDirectActionEvent:appBundleId:conversationGUID:fullName:phoneOrEmailAddress:", 2, v3, 0, 0, 0);

  return v4;
}

+ (id)messageComposeNewThreadDirectActionWithAppBundleId:(id)a3 fullName:(id)a4 phoneOrEmailAddress:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithDirectActionEvent:appBundleId:conversationGUID:fullName:phoneOrEmailAddress:", 3, v9, 0, v8, v7);

  return v10;
}

+ (id)messageReadDirectActionWithAppBundleId:(id)a3 conversationGUID:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithDirectActionEvent:appBundleId:conversationGUID:fullName:phoneOrEmailAddress:", 4, v6, v5, 0, 0);

  return v7;
}

+ (id)messageReplyDirectActionWithAppBundleId:(id)a3 conversationGUID:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithDirectActionEvent:appBundleId:conversationGUID:fullName:phoneOrEmailAddress:", 5, v6, v5, 0, 0);

  return v7;
}

+ (id)mapSearchDirectActionWithAppBundleId:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithDirectActionEvent:appBundleId:conversationGUID:fullName:phoneOrEmailAddress:", 6, v3, 0, 0, 0);

  return v4;
}

+ (id)mapShareEtaDirectActionWithAppBundleId:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithDirectActionEvent:appBundleId:conversationGUID:fullName:phoneOrEmailAddress:", 18, v3, 0, 0, 0);

  return v4;
}

+ (id)musicSearchDirectActionWithAppBundleId:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithDirectActionEvent:appBundleId:conversationGUID:fullName:phoneOrEmailAddress:", 7, v3, 0, 0, 0);

  return v4;
}

+ (id)phoneAmbiguousDirectActionWithAppBundleId:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithDirectActionEvent:appBundleId:conversationGUID:fullName:phoneOrEmailAddress:", 12, v3, 0, 0, 0);

  return v4;
}

+ (id)phoneCallDirectActionWithAppBundleId:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithDirectActionEvent:appBundleId:conversationGUID:fullName:phoneOrEmailAddress:", 13, v3, 0, 0, 0);

  return v4;
}

+ (id)appLaunchDirectActionWithAppBundleId:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithDirectActionEvent:appBundleId:conversationGUID:fullName:phoneOrEmailAddress:", 15, v3, 0, 0, 0);

  return v4;
}

- (id)_initWithDirectActionEvent:(int64_t)a3 appBundleId:(id)a4 conversationGUID:(id)a5 fullName:(id)a6 phoneOrEmailAddress:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  SiriDirectActionContext *v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x1E0C99E08];
  v23[0] = *MEMORY[0x1E0CFEB80];
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = a4;
  objc_msgSend(v16, "numberWithInteger:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = CFSTR("SBSAssistantActivationContextBundleID");
  v24[0] = v18;
  v24[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryWithDictionary:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CFEB88]);
  if (objc_msgSend(v13, "length"))
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CFEB90]);
  if (objc_msgSend(v14, "length"))
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CFEB98]);
  v21 = -[SiriDirectActionContext initWithPayload:](self, "initWithPayload:", v20);

  return v21;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (BBBulletin)bulletin
{
  return self->_bulletin;
}

- (UNNotification)notification
{
  return self->_notification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_bulletin, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

- (void)_directActionEventFromContentTypesOfBulletin:(NSObject *)a3 notification:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "-[SiriDirectActionContext _directActionEventFromContentTypesOfBulletin:notification:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  OUTLINED_FUNCTION_2_0(&dword_1D132F000, a3, (uint64_t)a3, "%s Couldn't determine direct action from bulletin content \"%@\" or notification content \"%@\".", (uint8_t *)&v3);
}

- (void)_directActionEventFromAppIdsAndIntentIdentifiersOfBulletin:(void *)a1 notification:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "bulletin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "notification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "_intentIdentifiersFromBulletin:notification:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 136315650;
  v10 = "-[SiriDirectActionContext _directActionEventFromAppIdsAndIntentIdentifiersOfBulletin:notification:]";
  v11 = 2112;
  v12 = v4;
  v13 = 2112;
  v14 = v7;
  OUTLINED_FUNCTION_2_0(&dword_1D132F000, v3, v8, "%s Couldn't determine direct action from bundleId: \"%@\" and intent identifiers: \"%@\", (uint8_t *)&v9);

}

@end
