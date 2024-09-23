@implementation UAUserActivityInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wasContinuedInfo, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_peerDeviceType, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_contentUserAction, 0);
  objc_storeStrong((id *)&self->_encodingOptions, 0);
  objc_storeStrong((id *)&self->_lastInterestingTime, 0);
  objc_storeStrong((id *)&self->_when, 0);
  objc_storeStrong((id *)&self->_requiredUserInfoKeys, 0);
  objc_storeStrong((id *)&self->_encodedUserInfoError, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_webpageURL, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_dynamicActivityType, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_payloads, 0);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (void)setPayloads:(id)a3
{
  UAUserActivityInfo *v4;
  uint64_t v5;
  NSMutableDictionary *payloads;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v7)
  {
    v5 = objc_msgSend(v7, "mutableCopy");
    payloads = v4->_payloads;
    v4->_payloads = (NSMutableDictionary *)v5;
  }
  else
  {
    payloads = v4->_payloads;
    v4->_payloads = 0;
  }

  objc_sync_exit(v4);
}

- (UAUserActivityInfo)initWithUserActivityInfo:(id)a3
{
  id v4;
  UAUserActivityInfo *v5;
  uint64_t v6;
  NSDate *when;
  void *v8;
  uint64_t v9;
  NSUUID *uuid;
  void *v11;
  uint64_t v12;
  NSDictionary *options;
  void *v14;
  uint64_t v15;
  NSString *activityType;
  void *v17;
  uint64_t v18;
  NSString *dynamicActivityType;
  void *v20;
  uint64_t v21;
  NSString *teamIdentifier;
  void *v23;
  uint64_t v24;
  NSString *bundleIdentifier;
  void *v26;
  uint64_t v27;
  NSString *title;
  uint64_t v29;
  NSURL *webpageURL;
  uint64_t v31;
  NSURL *referrerURL;
  uint64_t v33;
  NSString *targetContentIdentifier;
  void *v35;
  void *v36;
  uint64_t v37;
  NSMutableDictionary *payloads;
  void *v39;
  uint64_t v40;
  NSError *encodedUserInfoError;
  void *v42;
  uint64_t v43;
  NSString *contentUserAction;
  void *v45;
  uint64_t v46;
  NSSet *keywords;
  void *v48;
  uint64_t v49;
  NSDate *expirationDate;
  uint64_t v51;
  NSString *persistentIdentifier;
  void *v53;
  uint64_t v54;
  NSString *peerDeviceType;
  void *v56;
  uint64_t v57;
  SFPeerDevice *peerDevice;
  objc_super v60;

  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)UAUserActivityInfo;
  v5 = -[UAUserActivityInfo init](&v60, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "when");
    v6 = objc_claimAutoreleasedReturnValue();
    when = v5->_when;
    v5->_when = (NSDate *)v6;

    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v4, "uuid");
    else
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v9;

    v5->_type = objc_msgSend(v4, "type");
    objc_msgSend(v4, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    options = v5->_options;
    v5->_options = (NSDictionary *)v12;

    objc_msgSend(v4, "activityType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    activityType = v5->_activityType;
    v5->_activityType = (NSString *)v15;

    objc_msgSend(v4, "dynamicActivityType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    dynamicActivityType = v5->_dynamicActivityType;
    v5->_dynamicActivityType = (NSString *)v18;

    objc_msgSend(v4, "teamIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v21;

    objc_msgSend(v4, "bundleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v24;

    objc_msgSend(v4, "title");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v27;

    objc_msgSend(v4, "webpageURL");
    v29 = objc_claimAutoreleasedReturnValue();
    webpageURL = v5->_webpageURL;
    v5->_webpageURL = (NSURL *)v29;

    objc_msgSend(v4, "referrerURL");
    v31 = objc_claimAutoreleasedReturnValue();
    referrerURL = v5->_referrerURL;
    v5->_referrerURL = (NSURL *)v31;

    objc_msgSend(v4, "targetContentIdentifier");
    v33 = objc_claimAutoreleasedReturnValue();
    targetContentIdentifier = v5->_targetContentIdentifier;
    v5->_targetContentIdentifier = (NSString *)v33;

    objc_msgSend(v4, "payloads");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v4, "payloads");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "mutableCopy");
      payloads = v5->_payloads;
      v5->_payloads = (NSMutableDictionary *)v37;

    }
    else
    {
      v36 = v5->_payloads;
      v5->_payloads = 0;
    }

    objc_msgSend(v4, "encodedUserInfoError");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "copy");
    encodedUserInfoError = v5->_encodedUserInfoError;
    v5->_encodedUserInfoError = (NSError *)v40;

    v5->_eligibleForHandoff = objc_msgSend(v4, "eligibleForHandoff");
    v5->_eligibleForSearch = objc_msgSend(v4, "eligibleForSearch");
    v5->_eligibleForPublicIndexing = objc_msgSend(v4, "eligibleForPublicIndexing");
    v5->_eligibleForReminders = objc_msgSend(v4, "eligibleForReminders");
    objc_msgSend(v4, "contentUserAction");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "copy");
    contentUserAction = v5->_contentUserAction;
    v5->_contentUserAction = (NSString *)v43;

    objc_msgSend(v4, "keywords");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "copy");
    keywords = v5->_keywords;
    v5->_keywords = (NSSet *)v46;

    objc_msgSend(v4, "expirationDate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "copy");
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v49;

    v5->_eligibleForPrediction = objc_msgSend(v4, "eligibleForPrediction");
    objc_msgSend(v4, "persistentIdentifier");
    v51 = objc_claimAutoreleasedReturnValue();
    persistentIdentifier = v5->_persistentIdentifier;
    v5->_persistentIdentifier = (NSString *)v51;

    objc_msgSend(v4, "peerDeviceType");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "copy");
    peerDeviceType = v5->_peerDeviceType;
    v5->_peerDeviceType = (NSString *)v54;

    objc_msgSend(v4, "peerDevice");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "copy");
    peerDevice = v5->_peerDevice;
    v5->_peerDevice = (SFPeerDevice *)v57;

    v5->_active = objc_msgSend(v4, "active");
    v5->_universalLink = objc_msgSend(v4, "isUniversalLink");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
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
  Class SFPeerDeviceClass;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSSet *requiredUserInfoKeys;
  id v46;

  v46 = a3;
  objc_msgSend(v46, "encodeInt32:forKey:", 1, CFSTR("version"));
  -[UAUserActivityInfo error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UAUserActivityInfo error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "encodeObject:forKey:", v5, CFSTR("error"));
  }
  else
  {
    -[UAUserActivityInfo uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v46;
    v8 = objc_opt_class();
    encodeObjectOfType(v7, v6, v8, CFSTR("uuid"));

    objc_msgSend(v7, "encodeInteger:forKey:", -[UAUserActivityInfo type](self, "type"), CFSTR("type"));
    -[UAUserActivityInfo options](self, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    encodeDictionary(v7, v9, CFSTR("options"));

    -[UAUserActivityInfo title](self, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    encodeString(v7, v10, CFSTR("title"));

    -[UAUserActivityInfo webpageURL](self, "webpageURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    encodeURL(v7, v11, CFSTR("webpageURL"));

    -[UAUserActivityInfo referrerURL](self, "referrerURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    encodeURL(v7, v12, CFSTR("referrerURL"));

    -[UAUserActivityInfo targetContentIdentifier](self, "targetContentIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    encodeString(v7, v13, CFSTR("targetContentIdentifier"));

    -[UAUserActivityInfo activityType](self, "activityType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    encodeString(v7, v14, CFSTR("activityType"));

    -[UAUserActivityInfo dynamicActivityType](self, "dynamicActivityType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    encodeString(v7, v15, CFSTR("dynamicActivityType"));

    -[UAUserActivityInfo teamIdentifier](self, "teamIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    encodeString(v7, v16, CFSTR("teamIdentifier"));

    -[UAUserActivityInfo bundleIdentifier](self, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    encodeString(v7, v17, CFSTR("bundleIdentifier"));

    -[UAUserActivityInfo peerDevice](self, "peerDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    SFPeerDeviceClass = getSFPeerDeviceClass();
    encodeObjectOfType(v7, v18, (uint64_t)SFPeerDeviceClass, CFSTR("peerDevice"));

    -[UAUserActivityInfo peerDeviceType](self, "peerDeviceType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    encodeString(v7, v20, CFSTR("peerDeviceType"));

    -[UAUserActivityInfo when](self, "when");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_class();
    encodeObjectOfType(v7, v21, v22, CFSTR("when"));

    objc_msgSend(v7, "encodeBool:forKey:", -[UAUserActivityInfo active](self, "active"), CFSTR("isActive"));
    -[UAUserActivityInfo encodingOptions](self, "encodingOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", CFSTR("NSUserActivityMinimalExtraInfo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "BOOLValue");

    -[UAUserActivityInfo encodingOptions](self, "encodingOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKey:", CFSTR("NSUserActivityDontEncodePayload"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLValue");

    if (v25)
    {
      -[UAUserActivityInfo encodingOptions](self, "encodingOptions");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKey:", CFSTR("NSUserActivityDontEncodeContentAttributes"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "BOOLValue");

    }
    else
    {
      v31 = 1;
    }
    -[UAUserActivityInfo payloads](self, "payloads");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v32, "mutableCopy");

    objc_msgSend(v5, "objectForKey:", CFSTR("UAUserActivityStreamsPayload"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("UAUserActivityStreamsPayload"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      encodeData(v7, v34, CFSTR("streamsData"));

      objc_msgSend(v5, "removeObjectForKey:", CFSTR("UAUserActivityStreamsPayload"));
    }
    if (v31)
    {
      -[UAUserActivityInfo contentUserAction](self, "contentUserAction");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      encodeString(v7, v35, CFSTR("contentAction"));

      -[UAUserActivityInfo keywords](self, "keywords");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      encodeSet(v7, v36, CFSTR("keywords"));

    }
    objc_msgSend(v5, "objectForKey:", CFSTR("UAUserActivityContentAttributeSetPayloadKey"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("UAUserActivityContentAttributeSetPayloadKey"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      encodeData(v7, v38, CFSTR("contentAttributeSetData"));

      if (v31)
        objc_msgSend(v5, "removeObjectForKey:", CFSTR("UAUserActivityContentAttributeSetPayloadKey"));
    }
    if ((v28 & 1) == 0)
    {
      -[UAUserActivityInfo payloadForIdentifier:](self, "payloadForIdentifier:", CFSTR("UAUserActivityUserInfoPayload"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        encodeData(v7, v39, CFSTR("payload"));
        objc_msgSend(v5, "removeObjectForKey:", CFSTR("UAUserActivityUserInfoPayload"));
      }
      -[UAUserActivityInfo encodedUserInfoError](self, "encodedUserInfoError");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_opt_class();
      encodeObjectOfType(v7, v40, v41, CFSTR("payloadError"));

    }
    if (objc_msgSend(v5, "count"))
      encodeDictionary(v7, v5, CFSTR("payloads"));
    objc_msgSend(v7, "encodeBool:forKey:", -[UAUserActivityInfo eligibleForHandoff](self, "eligibleForHandoff"), CFSTR("eligibleForHandoff"));
    objc_msgSend(v7, "encodeBool:forKey:", -[UAUserActivityInfo eligibleForSearch](self, "eligibleForSearch"), CFSTR("eligibleForSearch"));
    objc_msgSend(v7, "encodeBool:forKey:", -[UAUserActivityInfo eligibleForPublicIndexing](self, "eligibleForPublicIndexing"), CFSTR("eligibleForPublicIndexing"));
    objc_msgSend(v7, "encodeBool:forKey:", -[UAUserActivityInfo eligibleForReminders](self, "eligibleForReminders"), CFSTR("eligibleForReminders"));
    objc_msgSend(v7, "encodeBool:forKey:", -[UAUserActivityInfo eligibleForPrediction](self, "eligibleForPrediction"), CFSTR("eligibleForPrediction"));
    -[UAUserActivityInfo persistentIdentifier](self, "persistentIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v42, CFSTR("persistentIdentifier"));

    -[UAUserActivityInfo expirationDate](self, "expirationDate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_opt_class();
    encodeObjectOfType(v7, v43, v44, CFSTR("expirationDate"));

    requiredUserInfoKeys = self->_requiredUserInfoKeys;
    if (requiredUserInfoKeys)
      encodeSet(v7, requiredUserInfoKeys, CFSTR("requiredKeys"));
    if (-[UAUserActivityInfo isUniversalLink](self, "isUniversalLink"))
      encodeObject(v7, MEMORY[0x1E0C9AAB0], CFSTR("universalLink"));
  }

}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)type
{
  return self->_type;
}

- (NSURL)webpageURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)eligibleForHandoff
{
  return self->_eligibleForHandoff;
}

- (NSDictionary)payloads
{
  UAUserActivityInfo *v2;
  NSMutableDictionary *payloads;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  payloads = v2->_payloads;
  if (payloads)
    v4 = (void *)-[NSMutableDictionary copy](payloads, "copy");
  else
    v4 = 0;
  objc_sync_exit(v2);

  return (NSDictionary *)v4;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)targetContentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSURL)referrerURL
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (NSDate)when
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)persistentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (BOOL)eligibleForSearch
{
  return self->_eligibleForSearch;
}

- (BOOL)eligibleForPublicIndexing
{
  return self->_eligibleForPublicIndexing;
}

- (NSDictionary)encodingOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 184, 1);
}

- (id)payloadForIdentifier:(id)a3
{
  id v4;
  UAUserActivityInfo *v5;
  NSMutableDictionary *payloads;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    payloads = v5->_payloads;
    if (payloads)
    {
      -[NSMutableDictionary objectForKey:](payloads, "objectForKey:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_sync_exit(v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isUniversalLink
{
  return self->_universalLink;
}

- (NSString)dynamicActivityType
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)teamIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (SFPeerDevice)peerDevice
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 192, 1);
}

- (NSString)peerDeviceType
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (NSSet)keywords
{
  return (NSSet *)objc_getProperty(self, a2, 160, 1);
}

- (NSError)encodedUserInfoError
{
  return (NSError *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)eligibleForReminders
{
  return self->_eligibleForReminders;
}

- (BOOL)eligibleForPrediction
{
  return self->_eligibleForPrediction;
}

- (NSString)contentUserAction
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setWhen:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (void)setWebpageURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)setTargetContentIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (void)setReferrerURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void)setPersistentIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (void)setEligibleForSearch:(BOOL)a3
{
  self->_eligibleForSearch = a3;
}

- (void)setEligibleForPublicIndexing:(BOOL)a3
{
  self->_eligibleForPublicIndexing = a3;
}

- (void)setEligibleForHandoff:(BOOL)a3
{
  self->_eligibleForHandoff = a3;
}

- (void)setTeamIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setUniversalLink:(BOOL)a3
{
  self->_universalLink = a3;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setRequiredUserInfoKeys:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (void)setKeywords:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (void)setEncodingOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (void)setEligibleForReminders:(BOOL)a3
{
  self->_eligibleForReminders = a3;
}

- (void)setEligibleForPrediction:(BOOL)a3
{
  self->_eligibleForPrediction = a3;
}

- (void)setDynamicActivityType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void)setContentUserAction:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (void)setActivityType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UAUserActivityInfo)initWithCoder:(id)a3
{
  id v4;
  UAUserActivityInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSUUID *uuid;
  uint64_t v10;
  NSDictionary *options;
  uint64_t v12;
  NSString *title;
  void *v14;
  uint64_t v15;
  NSURL *referrerURL;
  uint64_t v17;
  NSString *targetContentIdentifier;
  NSMutableDictionary *v19;
  NSMutableDictionary *payloads;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  char isKindOfClass;
  uint64_t v36;
  NSDate *when;
  uint64_t v38;
  NSString *peerDeviceType;
  uint64_t v40;
  SFPeerDevice *peerDevice;
  uint64_t v42;
  NSString *bundleIdentifier;
  uint64_t v44;
  NSString *activityType;
  uint64_t v46;
  NSString *dynamicActivityType;
  uint64_t v48;
  NSString *teamIdentifier;
  uint64_t v50;
  NSError *encodedUserInfoError;
  uint64_t v52;
  NSString *contentUserAction;
  uint64_t v54;
  NSSet *keywords;
  uint64_t v56;
  NSDate *expirationDate;
  uint64_t v58;
  NSString *persistentIdentifier;
  void *v60;
  uint64_t v61;
  NSSet *requiredUserInfoKeys;
  void *v63;
  void *v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  objc_super v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)UAUserActivityInfo;
  v5 = -[UAUserActivityInfo init](&v71, sel_init);
  if (!v5)
    goto LABEL_28;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setError:](v5, "setError:", v6);

  -[UAUserActivityInfo error](v5, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_28;
  if (initWithCoder__sOnce != -1)
    dispatch_once(&initWithCoder__sOnce, &__block_literal_global_1);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v8 = objc_claimAutoreleasedReturnValue();
  uuid = v5->_uuid;
  v5->_uuid = (NSUUID *)v8;

  v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__sAcceptableObjects, CFSTR("options"));
  v10 = objc_claimAutoreleasedReturnValue();
  options = v5->_options;
  v5->_options = (NSDictionary *)v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v12 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v12;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webpageURL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[UAUserActivity checkWebpageURL:actionType:throwIfFailed:](UAUserActivity, "checkWebpageURL:actionType:throwIfFailed:", v14, -[UAUserActivityInfo type](v5, "type"), 0))
  {
    objc_storeStrong((id *)&v5->_webpageURL, v14);
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referrerURL"));
  v15 = objc_claimAutoreleasedReturnValue();
  referrerURL = v5->_referrerURL;
  v5->_referrerURL = (NSURL *)v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetContentIdentifier"));
  v17 = objc_claimAutoreleasedReturnValue();
  targetContentIdentifier = v5->_targetContentIdentifier;
  v5->_targetContentIdentifier = (NSString *)v17;

  v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  payloads = v5->_payloads;
  v5->_payloads = v19;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("streamsData"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setPayload:identifier:](v5, "setPayload:identifier:", v21, CFSTR("UAUserActivityStreamsPayload"));

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo setPayload:identifier:](v5, "setPayload:identifier:", v22, CFSTR("UAUserActivityUserInfoPayload"));

  v23 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v24, v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("payloads"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    objc_msgSend(v27, "allKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
    if (v29)
    {
      v30 = v29;
      v65 = v14;
      v66 = v4;
      v31 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v68 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v27)
            {
              objc_msgSend(v27, "objectForKeyedSubscript:", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
                continue;
            }
          }

          v27 = 0;
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
      }
      while (v30);

      v14 = v65;
      v4 = v66;
      if (!v27)
        goto LABEL_23;
    }
    else
    {

    }
    -[NSMutableDictionary addEntriesFromDictionary:](v5->_payloads, "addEntriesFromDictionary:", v27);
  }
LABEL_23:
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("when"));
  v36 = objc_claimAutoreleasedReturnValue();
  when = v5->_when;
  v5->_when = (NSDate *)v36;

  v5->_active = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isActive"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerDeviceType"));
  v38 = objc_claimAutoreleasedReturnValue();
  peerDeviceType = v5->_peerDeviceType;
  v5->_peerDeviceType = (NSString *)v38;

  getSFPeerDeviceClass();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerDevice"));
  v40 = objc_claimAutoreleasedReturnValue();
  peerDevice = v5->_peerDevice;
  v5->_peerDevice = (SFPeerDevice *)v40;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v42 = objc_claimAutoreleasedReturnValue();
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v42;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityType"));
  v44 = objc_claimAutoreleasedReturnValue();
  activityType = v5->_activityType;
  v5->_activityType = (NSString *)v44;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dynamicActivityType"));
  v46 = objc_claimAutoreleasedReturnValue();
  dynamicActivityType = v5->_dynamicActivityType;
  v5->_dynamicActivityType = (NSString *)v46;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("teamIdentifier"));
  v48 = objc_claimAutoreleasedReturnValue();
  teamIdentifier = v5->_teamIdentifier;
  v5->_teamIdentifier = (NSString *)v48;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadError"));
  v50 = objc_claimAutoreleasedReturnValue();
  encodedUserInfoError = v5->_encodedUserInfoError;
  v5->_encodedUserInfoError = (NSError *)v50;

  v5->_eligibleForHandoff = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("eligibleForHandoff"));
  v5->_eligibleForSearch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("eligibleForSearch"));
  v5->_eligibleForPublicIndexing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("eligibleForPublicIndexing"));
  v5->_eligibleForReminders = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("eligibleForReminders"));
  if (initWithCoder__sKeywordsOnce != -1)
    dispatch_once(&initWithCoder__sKeywordsOnce, &__block_literal_global_67);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentActions"));
  v52 = objc_claimAutoreleasedReturnValue();
  contentUserAction = v5->_contentUserAction;
  v5->_contentUserAction = (NSString *)v52;

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__sKeywordsAcceptableObjects, CFSTR("keywords"));
  v54 = objc_claimAutoreleasedReturnValue();
  keywords = v5->_keywords;
  v5->_keywords = (NSSet *)v54;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
  v56 = objc_claimAutoreleasedReturnValue();
  expirationDate = v5->_expirationDate;
  v5->_expirationDate = (NSDate *)v56;

  v5->_eligibleForPrediction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("eligibleForPrediction"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persistentIdentifier"));
  v58 = objc_claimAutoreleasedReturnValue();
  persistentIdentifier = v5->_persistentIdentifier;
  v5->_persistentIdentifier = (NSString *)v58;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentAttributeSetData"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
    -[NSMutableDictionary setObject:forKey:](v5->_payloads, "setObject:forKey:", v60, CFSTR("UAUserActivityContentAttributeSetPayloadKey"));
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__sKeywordsAcceptableObjects, CFSTR("requiredKeys"));
  v61 = objc_claimAutoreleasedReturnValue();
  requiredUserInfoKeys = v5->_requiredUserInfoKeys;
  v5->_requiredUserInfoKeys = (NSSet *)v61;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("universalLink"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_universalLink = objc_msgSend(v63, "BOOLValue");

LABEL_28:
  return v5;
}

- (BOOL)setPayload:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  UAUserActivityInfo *v8;
  NSMutableDictionary *payloads;
  void *v10;
  char v11;
  uint64_t v12;
  NSMutableDictionary *v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    payloads = v8->_payloads;
    if (v6)
    {
      if (payloads)
      {
        -[NSMutableDictionary objectForKey:](payloads, "objectForKey:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v6, "isEqual:", v10);

        -[NSMutableDictionary setObject:forKey:](v8->_payloads, "setObject:forKey:", v6, v7);
LABEL_11:
        objc_sync_exit(v8);

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v6, v7);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v8->_payloads;
      v8->_payloads = (NSMutableDictionary *)v12;

    }
    else
    {
      if (!payloads)
      {
        v11 = 0;
        goto LABEL_11;
      }
      -[NSMutableDictionary removeObjectForKey:](payloads, "removeObjectForKey:", v7);
    }
    v11 = 1;
    goto LABEL_11;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (void)setEncodedUserInfoError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (void)_createUserActivityStrings:(id)a3 secondaryString:(id)a4 optionalData:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UAUserActivityInfo *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  UAUserActivityInfo *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t j;
  uint64_t v78;
  void *v79;
  char v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  UAUserActivityInfo *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[UAUserActivityInfo payloads](self, "payloads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("UAUserActivityUserInfoPayload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v10);
  v12 = _UACopyUnpackedObjectFromData(objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v7)
  {
    v96 = (void *)v13;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo dynamicActivityType](self, "dynamicActivityType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      -[UAUserActivityInfo dynamicActivityType](self, "dynamicActivityType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[UAUserActivity _encodeToString:](UAUserActivity, "_encodeToString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("dt=%@"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v20);

    }
    -[UAUserActivityInfo title](self, "title");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      -[UAUserActivityInfo title](self, "title");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length");

      if (v24)
      {
        v25 = (void *)MEMORY[0x1E0CB3940];
        -[UAUserActivityInfo title](self, "title");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[UAUserActivity _encodeToString:](UAUserActivity, "_encodeToString:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("t=%@"), v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v28);

      }
    }
    if (-[UAUserActivityInfo type](self, "type") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type=%ld"), -[UAUserActivityInfo type](self, "type"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v29);

    }
    -[UAUserActivityInfo webpageURL](self, "webpageURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = (void *)MEMORY[0x1E0CB3940];
      -[UAUserActivityInfo webpageURL](self, "webpageURL");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "absoluteString");
      v33 = self;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[UAUserActivity _encodeToString:](UAUserActivity, "_encodeToString:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("url=%@"), v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v36);

      self = v33;
    }
    -[UAUserActivityInfo referrerURL](self, "referrerURL");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = (void *)MEMORY[0x1E0CB3940];
      -[UAUserActivityInfo referrerURL](self, "referrerURL");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "absoluteString");
      v40 = self;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[UAUserActivity _encodeToString:](UAUserActivity, "_encodeToString:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", CFSTR("referrer=%@"), v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v43);

      self = v40;
    }
    -[UAUserActivityInfo targetContentIdentifier](self, "targetContentIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = (void *)MEMORY[0x1E0CB3940];
      -[UAUserActivityInfo targetContentIdentifier](self, "targetContentIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      +[UAUserActivity _encodeToString:](UAUserActivity, "_encodeToString:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringWithFormat:", CFSTR("targetIdentifier=%@"), v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v48);

    }
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAUserActivityInfo requiredUserInfoKeys](self, "requiredUserInfoKeys");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v11;
      v92 = v7;
      v89 = self;
      v94 = v15;
      if (v50)
      {
        -[UAUserActivityInfo requiredUserInfoKeys](self, "requiredUserInfoKeys");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "allObjects");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v12, "allKeys");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v87 = v52;
      sortedArrayOfNSStringValues(v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v104;
        do
        {
          for (i = 0; i != v55; ++i)
          {
            if (*(_QWORD *)v104 != v56)
              objc_enumerationMutation(v53);
            v58 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * i);
            objc_msgSend(v12, "objectForKey:", v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            +[UAUserActivity _encodeKeyAndValueIntoString:value:](UAUserActivity, "_encodeKeyAndValueIntoString:value:", v58, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "addObject:", v60);

          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
        }
        while (v55);
      }

      if (objc_msgSend(v49, "count"))
      {
        v61 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v49, "componentsJoinedByString:", CFSTR(","));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "stringWithFormat:", CFSTR("u={%@}"), v62, v87);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "addObject:", v63);

      }
      v11 = v90;
      v7 = v92;
      self = v89;
      v15 = v94;
    }
    if (-[UAUserActivityInfo isUniversalLink](self, "isUniversalLink"))
      objc_msgSend(v15, "addObject:", CFSTR("universalLink=1"));
    -[UAUserActivityInfo activityType](self, "activityType");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v96;
    objc_msgSend(v64, "stringByAddingPercentEncodingWithAllowedCharacters:", v96);
    v65 = v15;
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("v1.0/%@/"), v66);

    if (objc_msgSend(v65, "count"))
    {
      objc_msgSend(v65, "componentsJoinedByString:", CFSTR("&"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR("%@"), v67);

    }
  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      -[UAUserActivityInfo requiredUserInfoKeys](self, "requiredUserInfoKeys");
      v68 = objc_claimAutoreleasedReturnValue();
      if (v68)
      {
        v69 = (void *)v68;
        -[UAUserActivityInfo requiredUserInfoKeys](self, "requiredUserInfoKeys");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v70, "count");

        if (v71)
        {
          v97 = v14;
          v98 = v8;
          v91 = v11;
          v93 = v7;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "allKeys");
          v99 = 0u;
          v100 = 0u;
          v101 = 0u;
          v102 = 0u;
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          sortedArrayOfNSStringValues(v88);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
          if (v74)
          {
            v75 = v74;
            v76 = *(_QWORD *)v100;
            do
            {
              for (j = 0; j != v75; ++j)
              {
                if (*(_QWORD *)v100 != v76)
                  objc_enumerationMutation(v73);
                v78 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * j);
                -[UAUserActivityInfo requiredUserInfoKeys](self, "requiredUserInfoKeys");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                v80 = objc_msgSend(v79, "containsObject:", v78);

                if ((v80 & 1) == 0)
                {
                  objc_msgSend(v12, "objectForKey:", v78);
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  +[UAUserActivity _encodeKeyAndValueIntoString:value:](UAUserActivity, "_encodeKeyAndValueIntoString:value:", v78, v81);
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v72, "addObject:", v82);

                }
              }
              v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v99, v107, 16);
            }
            while (v75);
          }

          if (objc_msgSend(v72, "count"))
          {
            v83 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v72, "componentsJoinedByString:", CFSTR(","));
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "stringWithFormat:", CFSTR("ue={%@}"), v84, v88);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "addObject:", v85);

          }
          v11 = v91;
          v7 = v93;
          v14 = v97;
          v8 = v98;
        }
      }
    }
    if (objc_msgSend(v95, "count"))
    {
      objc_msgSend(v95, "componentsJoinedByString:", CFSTR("&"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR("%@"), v86);

    }
  }

}

- (NSSet)requiredUserInfoKeys
{
  return (NSSet *)objc_getProperty(self, a2, 120, 1);
}

- (UAUserActivityInfo)initWithUUID:(id)a3 type:(unint64_t)a4 options:(id)a5
{
  id v8;
  id v9;
  UAUserActivityInfo *v10;
  NSUUID *v11;
  NSUUID *uuid;
  uint64_t v13;
  NSDictionary *options;
  uint64_t v15;
  NSDate *when;
  objc_super v18;

  v8 = a3;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)UAUserActivityInfo;
  v10 = -[UAUserActivityInfo init](&v18, sel_init);
  if (v10)
  {
    if (v8)
      v11 = (NSUUID *)objc_msgSend(v8, "copy");
    else
      v11 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    uuid = v10->_uuid;
    v10->_uuid = v11;

    v10->_type = a4;
    v13 = objc_msgSend(v9, "copy");
    options = v10->_options;
    v10->_options = (NSDictionary *)v13;

    v10->_active = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = objc_claimAutoreleasedReturnValue();
    when = v10->_when;
    v10->_when = (NSDate *)v15;

  }
  return v10;
}

- (UAUserActivityInfo)initWithArchivedUserActivityInfo:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  UAUserActivityInfo *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3710];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initForReadingFromData:error:", v5, 0);

  v7 = -[UAUserActivityInfo initWithCoder:](self, "initWithCoder:", v6);
  objc_msgSend(v6, "finishDecoding");

  return v7;
}

void __36__UAUserActivityInfo_initWithCoder___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[11];

  v4[10] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)initWithCoder__sAcceptableObjects;
  initWithCoder__sAcceptableObjects = v2;

}

void __36__UAUserActivityInfo_initWithCoder___block_invoke_2()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)initWithCoder__sKeywordsAcceptableObjects;
  initWithCoder__sKeywordsAcceptableObjects = v2;

}

- (id)copyWithZone:(_NSZone *)a3
{
  UAUserActivityInfo *v4;
  uint64_t v5;
  NSUUID *uuid;
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
  uint64_t v17;
  NSMutableDictionary *payloads;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = -[UAUserActivityInfo init](+[UAUserActivityInfo allocWithZone:](UAUserActivityInfo, "allocWithZone:", a3), "init");
  if (v4)
  {
    -[UAUserActivityInfo uuid](self, "uuid");
    v5 = objc_claimAutoreleasedReturnValue();
    uuid = v4->_uuid;
    v4->_uuid = (NSUUID *)v5;

    -[UAUserActivityInfo setType:](v4, "setType:", -[UAUserActivityInfo type](self, "type"));
    -[UAUserActivityInfo options](self, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo setOptions:](v4, "setOptions:", v7);

    -[UAUserActivityInfo title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo setTitle:](v4, "setTitle:", v8);

    -[UAUserActivityInfo activityType](self, "activityType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo setActivityType:](v4, "setActivityType:", v9);

    -[UAUserActivityInfo dynamicActivityType](self, "dynamicActivityType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo setDynamicActivityType:](v4, "setDynamicActivityType:", v10);

    -[UAUserActivityInfo teamIdentifier](self, "teamIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo setTeamIdentifier:](v4, "setTeamIdentifier:", v11);

    -[UAUserActivityInfo webpageURL](self, "webpageURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo setWebpageURL:](v4, "setWebpageURL:", v12);

    -[UAUserActivityInfo referrerURL](self, "referrerURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo setReferrerURL:](v4, "setReferrerURL:", v13);

    -[UAUserActivityInfo targetContentIdentifier](self, "targetContentIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo setTargetContentIdentifier:](v4, "setTargetContentIdentifier:", v14);

    -[UAUserActivityInfo payloads](self, "payloads");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[UAUserActivityInfo payloads](self, "payloads");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "mutableCopy");
      payloads = v4->_payloads;
      v4->_payloads = (NSMutableDictionary *)v17;

    }
    else
    {
      v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v16 = v4->_payloads;
      v4->_payloads = v19;
    }

    -[UAUserActivityInfo encodedUserInfoError](self, "encodedUserInfoError");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo setEncodedUserInfoError:](v4, "setEncodedUserInfoError:", v20);

    -[UAUserActivityInfo requiredUserInfoKeys](self, "requiredUserInfoKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo setRequiredUserInfoKeys:](v4, "setRequiredUserInfoKeys:", v21);

    -[UAUserActivityInfo setUniversalLink:](v4, "setUniversalLink:", -[UAUserActivityInfo isUniversalLink](self, "isUniversalLink"));
    -[UAUserActivityInfo setEligibleForHandoff:](v4, "setEligibleForHandoff:", -[UAUserActivityInfo eligibleForHandoff](self, "eligibleForHandoff"));
    -[UAUserActivityInfo setEligibleForSearch:](v4, "setEligibleForSearch:", -[UAUserActivityInfo eligibleForSearch](self, "eligibleForSearch"));
    -[UAUserActivityInfo setEligibleForPublicIndexing:](v4, "setEligibleForPublicIndexing:", -[UAUserActivityInfo eligibleForPublicIndexing](self, "eligibleForPublicIndexing"));
    -[UAUserActivityInfo contentUserAction](self, "contentUserAction");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo setContentUserAction:](v4, "setContentUserAction:", v22);

    -[UAUserActivityInfo keywords](self, "keywords");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo setKeywords:](v4, "setKeywords:", v23);

    -[UAUserActivityInfo expirationDate](self, "expirationDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo setExpirationDate:](v4, "setExpirationDate:", v24);

    -[UAUserActivityInfo when](self, "when");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo setWhen:](v4, "setWhen:", v25);

    -[UAUserActivityInfo setActive:](v4, "setActive:", -[UAUserActivityInfo active](self, "active"));
    -[UAUserActivityInfo setEligibleForPrediction:](v4, "setEligibleForPrediction:", -[UAUserActivityInfo eligibleForPrediction](self, "eligibleForPrediction"));
    -[UAUserActivityInfo persistentIdentifier](self, "persistentIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo setPersistentIdentifier:](v4, "setPersistentIdentifier:", v26);

    -[UAUserActivityInfo error](self, "error");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo setError:](v4, "setError:", v27);

  }
  return v4;
}

- (id)payloadIdentifiers
{
  UAUserActivityInfo *v2;
  NSMutableDictionary *payloads;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  payloads = v2->_payloads;
  if (payloads)
  {
    -[NSMutableDictionary allKeys](payloads, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)userActivityString
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo _createUserActivityStrings:secondaryString:optionalData:](self, "_createUserActivityStrings:secondaryString:optionalData:", v3, 0, 0);
  if (v3 && objc_msgSend(v3, "length"))
    v4 = (void *)objc_msgSend(v3, "copy");
  else
    v4 = 0;

  return v4;
}

- (id)secondaryUserActivityString
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo _createUserActivityStrings:secondaryString:optionalData:](self, "_createUserActivityStrings:secondaryString:optionalData:", 0, v3, 0);
  if (v3 && objc_msgSend(v3, "length"))
    v4 = (void *)objc_msgSend(v3, "copy");
  else
    v4 = 0;

  return v4;
}

- (id)optionalUserActivityData
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo _createUserActivityStrings:secondaryString:optionalData:](self, "_createUserActivityStrings:secondaryString:optionalData:", 0, 0, v3);
  if (v3 && objc_msgSend(v3, "length"))
    v4 = (void *)objc_msgSend(v3, "copy");
  else
    v4 = 0;

  return v4;
}

- (BOOL)requestPayloadWithCompletionHandler:(id)a3
{
  return -[UAUserActivityInfo requestPayloadWithCompletionHandlerEvenIfClean:withCompletionHandler:](self, "requestPayloadWithCompletionHandlerEvenIfClean:withCompletionHandler:", 0, a3);
}

- (void)fetchAllNearbyAppSuggestions:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (BOOL)requestPayloadWithCompletionHandlerEvenIfClean:(BOOL)a3 withCompletionHandler:(id)a4
{
  (*((void (**)(id, _QWORD, BOOL))a4 + 2))(a4, 0, a3);
  return 1;
}

- (BOOL)wasResumedOnAnotherDeviceWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  return 1;
}

- (void)clearPayload
{
  -[UAUserActivityInfo setPayloadAvailable:](self, "setPayloadAvailable:", 0);
}

- (id)archiveUserActivityInfo
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "encodeObject:forKey:", self, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v3, "finishEncoding");
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)encodedInfoToOldEncodedInfo:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  const void *v7;
  void *v8;
  void *v9;

  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  v6 = _UACopyUnpackedObjectFromData(v4, v5, 0);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v8, "encodeObject:forKey:", v7, *MEMORY[0x1E0CB2CD0]);
    objc_msgSend(v8, "finishEncoding");
    objc_msgSend(v8, "encodedData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v7);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)logString
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
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;

  -[UAUserActivityInfo error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  if (v3)
  {
    -[UAUserActivityInfo error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("UAUserActivityInfo: error=%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    suggestedActionTypeString(-[UAUserActivityInfo type](self, "type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo uuid](self, "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo activityType](self, "activityType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UAUserActivityInfo dynamicActivityType](self, "dynamicActivityType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[UAUserActivityInfo dynamicActivityType](self, "dynamicActivityType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR(":%@"), v22);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = &stru_1E60084E8;
    }
    -[UAUserActivityInfo teamIdentifier](self, "teamIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      -[UAUserActivityInfo teamIdentifier](self, "teamIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("(%@)"), v21);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = &stru_1E60084E8;
    }
    -[UAUserActivityInfo encodedUserInfoError](self, "encodedUserInfoError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[UAUserActivityInfo encodedUserInfoError](self, "encodedUserInfoError");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "description");
    }
    else
    {
      -[UAUserActivityInfo payloads](self, "payloads");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", CFSTR("UAUserActivityUserInfoPayload"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      trimmedHexStringForData(v20, 16);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[UAUserActivityInfo webpageURL](self, "webpageURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("webPageURL=<private>");
    if (!v12)
      v13 = &stru_1E60084E8;
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3940];
    -[UAUserActivityInfo referrerURL](self, "referrerURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("referrer=<private>");
    if (!v16)
      v17 = &stru_1E60084E8;
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("UAInfo:{ %@ %@%@%@ %@; userInfo=%@/%@%@}"),
      v5,
      v26,
      v30,
      v29,
      v28,
      v10,
      v14,
      v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {

      v10 = v20;
    }

    if (v24)
    {

    }
    if (v25)
    {

    }
  }

  return v6;
}

- (id)description
{
  __CFString *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  UAUserActivityInfo *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  __CFString *i;
  void *v28;
  __CFString *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  UAUserActivityInfo *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __CFString *v54;
  __CFString *v55;
  __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  -[UAUserActivityInfo error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0x1E0CB3000uLL;
  v6 = (void *)MEMORY[0x1E0CB3940];
  if (v4)
  {
    -[UAUserActivityInfo error](self, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("UAUserActivityInfo: error=%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  suggestedActionTypeString(-[UAUserActivityInfo type](self, "type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo uuid](self, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo activityType](self, "activityType");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo dynamicActivityType](self, "dynamicActivityType");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo teamIdentifier](self, "teamIdentifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo persistentIdentifier](self, "persistentIdentifier");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    -[UAUserActivityInfo persistentIdentifier](self, "persistentIdentifier");
    v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v56 = CFSTR("-");
  }
  -[UAUserActivityInfo payloads](self, "payloads");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectForKey:", CFSTR("UAUserActivityUserInfoPayload"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  trimmedHexStringForData(v50, 64);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo webpageURL](self, "webpageURL");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = CFSTR(" webPageURL=<private>");
  v15 = &stru_1E60084E8;
  v48 = (void *)v13;
  if (!v13)
    v14 = &stru_1E60084E8;
  v44 = v14;
  -[UAUserActivityInfo referrerURL](self, "referrerURL");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = CFSTR(" referrerURL=<private>");
  v47 = (void *)v16;
  if (!v16)
    v17 = &stru_1E60084E8;
  v43 = v17;
  -[UAUserActivityInfo payloads](self, "payloads");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectForKey:", CFSTR("UAUserActivityStreamsPayload"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v6;
  if (v45)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    -[UAUserActivityInfo payloads](self, "payloads");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKey:", CFSTR("UAUserActivityStreamsPayload"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    trimmedHexStringForData(v40, 16);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR(" streamData=%@"), v39);
    v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  v55 = (__CFString *)v15;
  -[UAUserActivityInfo payloadForIdentifier:](self, "payloadForIdentifier:", CFSTR("UAUserActivityContentAttributeSetPayloadKey"));
  v19 = &stru_1E60084E8;
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v2 = &stru_1E60084E8;
    v20 = (void *)MEMORY[0x1E0CB3940];
    -[UAUserActivityInfo payloadForIdentifier:](self, "payloadForIdentifier:", CFSTR("UAUserActivityContentAttributeSetPayloadKey"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    trimmedHexStringForData(v38, 16);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v19 = &stru_1E60084E8;
    objc_msgSend(v21, "stringWithFormat:", CFSTR(" contentAttr=%@"), v37);
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v54 = &stru_1E60084E8;
  }
  v53 = (void *)v12;
  v22 = self;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[UAUserActivityInfo payloadIdentifiers](v22, "payloadIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v24)
  {
    v2 = (__CFString *)v24;
    v36 = v22;
    v25 = 0;
    v26 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v2; i = (__CFString *)((char *)i + 1))
      {
        if (*(_QWORD *)v62 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v28, "isEqual:", CFSTR("UAUserActivityStreamsPayload")) & 1) == 0
          && (objc_msgSend(v28, "isEqual:", CFSTR("UAUserActivityUserInfoPayload")) & 1) == 0
          && (objc_msgSend(v28, "isEqual:", CFSTR("UAUserActivityContentAttributeSetPayloadKey")) & 1) == 0)
        {
          if (v25)
          {
            objc_msgSend(v25, "appendFormat:", CFSTR(" %@"), v28);
          }
          else
          {
            v25 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
            objc_msgSend(v25, "appendFormat:", CFSTR("(%@"), v28);
          }
        }
      }
      v2 = (__CFString *)objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    }
    while (v2);

    if (!v25)
    {
      v29 = 0;
      v5 = 0x1E0CB3000uLL;
      v19 = &stru_1E60084E8;
      v22 = v36;
      goto LABEL_33;
    }
    objc_msgSend(v25, "appendFormat:", CFSTR(")"));
    v29 = (__CFString *)objc_msgSend(v25, "copy");
    v23 = v25;
    v5 = 0x1E0CB3000;
    v19 = &stru_1E60084E8;
    v22 = v36;
  }
  else
  {
    v29 = 0;
  }

LABEL_33:
  if (v29)
    v30 = v29;
  else
    v30 = &stru_1E60084E8;
  -[UAUserActivityInfo options](v22, "options");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = *(void **)(v5 + 2368);
    -[UAUserActivityInfo options](v22, "options");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    userActivityInfoOptionsDictionaryString(v2);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR(" opts=%@"), v5);
    v19 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[UAUserActivityInfo when](v22, "when");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "stringWithFormat:", CFSTR("UAUserActivityInfo:{ type = %@; uuid = %@; activityType = \"%@\"; dynamicActivityType = \"%@\"; teamID=%@; %@ userInfo = %@%@%@%@ - %@ - %@ %@; when = %@ }"),
    v10,
    v53,
    v60,
    v59,
    v58,
    v56,
    v57,
    v44,
    v43,
    v55,
    v54,
    v30,
    v19,
    v33);
  v34 = (__CFString *)v19;
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {

  }
  if (v42)
  {

  }
  if (v45)
  {

  }
  if (v52)

  return v35;
}

- (id)statusString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  unint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;

  -[UAUserActivityInfo payloads](self, "payloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("UAUserActivityUserInfoPayload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  trimmedHexStringForData(v4, 16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3940];
  suggestedActionTypeString(-[UAUserActivityInfo type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo activityType](self, "activityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo dynamicActivityType](self, "dynamicActivityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[UAUserActivityInfo dynamicActivityType](self, "dynamicActivityType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR(":%@"), v17);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_1E60084E8;
  }
  v12 = -[UAUserActivityInfo type](self, "type");
  -[UAUserActivityInfo webpageURL](self, "webpageURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v14 = CFSTR(" webPageURL=<private>");
  else
    v14 = &stru_1E60084E8;
  objc_msgSend(v18, "stringWithFormat:", CFSTR("UAInfo:%@%@ %@%@ type=%ld %@%@"), v5, v7, v8, v11, v12, v19, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {

  }
  return v15;
}

- (id)provenance
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UAUserActivityInfo uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo activityType](self, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAUserActivityInfo dynamicActivityType](self, "dynamicActivityType");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_1E60084E8;
  if (v6)
    v8 = (const __CFString *)v6;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("UAx:%@/%@-%@"), v4, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDate)lastInterestingTime
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLastInterestingTime:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (BOOL)eligibleToAdvertise
{
  return self->_eligibleToAdvertise;
}

- (BOOL)eligibleToAlwaysAdvertise
{
  return self->_eligibleToAlwaysAdvertise;
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (BOOL)isPayloadAvailable
{
  return self->_payloadAvailable;
}

- (void)setPayloadAvailable:(BOOL)a3
{
  self->_payloadAvailable = a3;
}

- (BOOL)isPayloadRequested
{
  return self->_payloadRequested;
}

- (void)setPayloadRequested:(BOOL)a3
{
  self->_payloadRequested = a3;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void)setPeerDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (void)setPeerDeviceType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (UAUserActivityAnalyticsInfo)wasContinuedInfo
{
  return (UAUserActivityAnalyticsInfo *)objc_getProperty(self, a2, 216, 1);
}

- (void)setWasContinuedInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

@end
