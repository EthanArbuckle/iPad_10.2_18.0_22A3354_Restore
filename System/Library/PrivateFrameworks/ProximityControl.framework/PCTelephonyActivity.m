@implementation PCTelephonyActivity

- (id)initFromSensitiveCall:(id)a3
{
  id v4;
  PCTelephonyActivity *v5;
  PCTelephonyActivity *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PCTelephonyActivity;
  v5 = -[PCTelephonyActivity initWithActivityType:](&v17, sel_initWithActivityType_, CFSTR("com.apple.ProximityControl.activity.call"));
  v6 = v5;
  if (v5)
  {
    makeIneligibleForProcessing(v5);
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v4, "callUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("callUUID"));

    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeConversationForCall:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("conversationUUID"));

    }
    objc_msgSend(v4, "sourceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "sourceIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("sourceAppID"));

    }
    if (objc_msgSend(v4, "service"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "service"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v14, CFSTR("service"));

    }
    v15 = (void *)objc_msgSend(v7, "copy");
    -[PCTelephonyActivity setUserInfo:](v6, "setUserInfo:", v15);

    v6->_hostedOnCurrentDeviceIsValid = 0;
    v6->_hostedOnCurrentDevice = 0;
    v6->_isVideo = objc_msgSend(v4, "isVideo");

  }
  return v6;
}

- (id)initFromKnownCall:(id)a3
{
  id v4;
  PCTelephonyActivity *v5;
  PCTelephonyActivity *v6;
  id v7;
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PCTelephonyActivity;
  v5 = -[PCTelephonyActivity initWithActivityType:](&v26, sel_initWithActivityType_, CFSTR("com.apple.ProximityControl.activity.call"));
  v6 = v5;
  if (!v5)
    goto LABEL_20;
  makeIneligibleForProcessing(v5);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "callUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("callUUID"));

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeConversationForCall:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("conversationUUID"));

  }
  objc_msgSend(v4, "sourceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "sourceIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("sourceAppID"));

  }
  objc_msgSend(v4, "dateConnected");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v4, "dateConnected");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v15, CFSTR("dateCon"));

  }
  if (objc_msgSend(v4, "service"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "service"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v16, CFSTR("service"));

  }
  objc_msgSend(v4, "suggestedDisplayName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v4, "suggestedDisplayName");
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v21 = (void *)v18;
    objc_msgSend(v7, "setObject:forKey:", v18, CFSTR("displayName"));

    goto LABEL_17;
  }
  objc_msgSend(v4, "displayName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v4, "displayName");
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_msgSend(v4, "displayFirstName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v4, "displayFirstName");
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
LABEL_17:
  objc_msgSend(v4, "contactIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    objc_msgSend(v7, "setObject:forKey:", v23, CFSTR("contactID"));

  v24 = (void *)objc_msgSend(v7, "copy");
  -[PCTelephonyActivity setUserInfo:](v6, "setUserInfo:", v24);

  v6->_hostedOnCurrentDeviceIsValid = 1;
  v6->_hostedOnCurrentDevice = objc_msgSend(v4, "isHostedOnCurrentDevice");
  v6->_isVideo = objc_msgSend(v4, "isVideo");

LABEL_20:
  return v6;
}

- (id)initFromSensitiveConversation:(id)a3
{
  id v4;
  PCTelephonyActivity *v5;
  PCTelephonyActivity *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PCTelephonyActivity;
  v5 = -[PCTelephonyActivity initWithActivityType:](&v14, sel_initWithActivityType_, CFSTR("com.apple.ProximityControl.activity.call"));
  v6 = v5;
  if (v5)
  {
    makeIneligibleForProcessing(v5);
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v4, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("conversationUUID"));

    objc_msgSend(v4, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v7, "setObject:forKey:", *MEMORY[0x24BEB4A68], CFSTR("sourceAppID"));
    v10 = objc_msgSend(v4, "resolvedAudioVideoMode");
    if (v10 == 1)
    {
      v11 = &unk_24CCFB400;
    }
    else
    {
      if (v10 != 2)
      {
LABEL_9:
        v12 = (void *)objc_msgSend(v7, "copy");
        -[PCTelephonyActivity setUserInfo:](v6, "setUserInfo:", v12);

        v6->_hostedOnCurrentDeviceIsValid = 0;
        v6->_hostedOnCurrentDevice = 0;
        v6->_isVideo = objc_msgSend(v4, "resolvedAudioVideoMode") == 3;

        goto LABEL_10;
      }
      v11 = &unk_24CCFB418;
    }
    objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("service"));
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (id)initFromKnownConversation:(id)a3
{
  id v4;
  PCTelephonyActivity *v5;
  PCTelephonyActivity *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PCTelephonyActivity;
  v5 = -[PCTelephonyActivity initWithActivityType:](&v16, sel_initWithActivityType_, CFSTR("com.apple.ProximityControl.activity.call"));
  v6 = v5;
  if (v5)
  {
    makeIneligibleForProcessing(v5);
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v4, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("conversationUUID"));

    objc_msgSend(v4, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v7, "setObject:forKey:", *MEMORY[0x24BEB4A68], CFSTR("sourceAppID"));
    v10 = objc_msgSend(v4, "resolvedAudioVideoMode");
    if (v10 == 1)
    {
      v11 = &unk_24CCFB400;
    }
    else
    {
      if (v10 != 2)
      {
LABEL_9:
        objc_msgSend(v4, "displayName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("displayName"));

        v13 = (void *)objc_msgSend(v7, "copy");
        -[PCTelephonyActivity setUserInfo:](v6, "setUserInfo:", v13);

        v6->_hostedOnCurrentDeviceIsValid = 1;
        objc_msgSend(v4, "presentationContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v6->_hostedOnCurrentDevice = objc_msgSend(v14, "mode") == 2;

        v6->_isVideo = objc_msgSend(v4, "resolvedAudioVideoMode") == 3;
        goto LABEL_10;
      }
      v11 = &unk_24CCFB418;
    }
    objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("service"));
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (PCTelephonyActivity)initWithActivity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  PCTelephonyActivity *v8;
  void *v9;
  PCTelephonyActivity *v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(CFSTR("com.apple.ProximityControl.activity.call"), "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(v4, "activityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12.receiver = self;
    v12.super_class = (Class)PCTelephonyActivity;
    v8 = -[PCTelephonyActivity initWithActivityType:](&v12, sel_initWithActivityType_, v7);

    if (v8)
    {
      makeIneligibleForProcessing(v8);
      objc_msgSend(v4, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCTelephonyActivity setUserInfo:](v8, "setUserInfo:", v9);

    }
    self = v8;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)title
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v2 = -[PCTelephonyActivity service](self, "service");
  v3 = 2;
  if (v2 == 2)
    v3 = 3;
  if (v2 == 3)
    v4 = 4;
  else
    v4 = v3;
  return +[PCLocalizedString localizedStringForKey:](PCLocalizedString, "localizedStringForKey:", v4);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PCTelephonyActivity displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCTelephonyActivity dateConnected](self, "dateConnected");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v5);
    +[PCActivityUtility formattedDurationFor:](PCActivityUtility, "formattedDurationFor:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - %@"), v3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PCTelephonyActivity title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PCTelephonyActivity userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[PCTelephonyActivity userInfo](self, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (id)dateConnected
{
  void *v3;
  void *v4;
  void *v5;

  -[PCTelephonyActivity userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PCTelephonyActivity userInfo](self, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("dateCon"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)displayName
{
  void *v3;
  void *v4;
  void *v5;

  -[PCTelephonyActivity userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PCTelephonyActivity userInfo](self, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("displayName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)callUUID
{
  void *v3;
  void *v4;
  void *v5;

  -[PCTelephonyActivity userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PCTelephonyActivity userInfo](self, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("callUUID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)conversationUUID
{
  void *v3;
  void *v4;
  void *v5;

  -[PCTelephonyActivity userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PCTelephonyActivity userInfo](self, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("conversationUUID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)contactIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  -[PCTelephonyActivity userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PCTelephonyActivity userInfo](self, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("contactID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)callImage
{
  UIImage *callImage;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  UIImage *v21;
  UIImage *v22;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  callImage = self->_callImage;
  if (!callImage)
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "contactStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBAE38], "descriptorForRequiredKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BDBA2F0];
    v27[0] = v5;
    v27[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PCTelephonyActivity contactIdentifier](self, "contactIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v4, "unifiedContactWithIdentifier:keysToFetch:error:", v8, v7, &v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v25;

    if (v9)
      v11 = v9;
    else
      v11 = (id)objc_opt_new();
    v12 = v11;
    v13 = objc_alloc(MEMORY[0x24BDBAE38]);
    objc_msgSend(MEMORY[0x24BDBAE40], "defaultSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithSettings:", v14);

    v16 = (void *)MEMORY[0x24BDBAE48];
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    objc_msgSend(v16, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, 44.0, 44.0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "avatarImageForContacts:scope:", v20, v19);
    v21 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v22 = self->_callImage;
    self->_callImage = v21;

    callImage = self->_callImage;
  }
  return callImage;
}

- (BOOL)hostedOnCurrentDeviceIsValid
{
  return self->_hostedOnCurrentDeviceIsValid;
}

- (BOOL)hostedOnCurrentDevice
{
  return self->_hostedOnCurrentDevice;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (int)service
{
  void *v2;
  void *v3;
  int v4;

  -[PCTelephonyActivity userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (unint64_t)pcactivityType
{
  return 0;
}

- (id)bundleIdentifier
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;

  -[PCTelephonyActivity userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("sourceAppID"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PCTelephonyActivity userInfo](self, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("service"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = CFSTR("com.apple.mobilephone");
    if (v6 && objc_msgSend(v6, "integerValue") == 3)
      v4 = CFSTR("com.apple.facetime");

  }
  return v4;
}

- (id)image
{
  void *v2;
  void *v3;

  -[PCTelephonyActivity bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PCActivityUtility iconForBundleIdentifier:](PCActivityUtility, "iconForBundleIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "pcactivityType");
  if (v5 == -[PCTelephonyActivity pcactivityType](self, "pcactivityType"))
  {
    objc_msgSend(v4, "dateConnected");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCTelephonyActivity dateConnected](self, "dateConnected");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callImage, 0);
}

@end
