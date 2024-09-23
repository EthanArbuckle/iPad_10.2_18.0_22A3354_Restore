@implementation UABestAppSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UABestAppSuggestion)initWithBundleIdentifier:(id)a3 uuid:(id)a4 activityType:(id)a5 dynamicIdentifier:(id)a6 lastUpdateTime:(id)a7 lastActiveTime:(id)a8 type:(unint64_t)a9 deviceName:(id)a10 deviceIdentifier:(id)a11 deviceType:(id)a12 options:(id)a13 isActive:(BOOL)a14
{
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  UABestAppSuggestion *v29;
  uint64_t v30;
  NSDictionary *options;
  id v32;
  uint64_t v33;
  NSString *bundleIdentifier;
  NSUUID *v35;
  NSUUID *uniqueIdentifier;
  uint64_t v37;
  NSString *dynamicIdentifier;
  NSDate *v39;
  NSDate *lastUpdateTime;
  NSDate *v41;
  NSDate *lastActiveTime;
  uint64_t v43;
  NSString *originatingDeviceName;
  uint64_t v45;
  NSString *originatingDeviceIdentifier;
  uint64_t v47;
  NSString *originatingDeviceType;
  id obj;
  id v52;
  id v53;

  v19 = a3;
  v20 = a4;
  obj = a5;
  v21 = a5;
  v22 = v20;
  v52 = v21;
  v53 = a6;
  v23 = a7;
  v24 = a8;
  v25 = a10;
  v26 = a11;
  v27 = a12;
  v28 = a13;
  v29 = -[UABestAppSuggestion init](self, "init");
  if (v29)
  {
    v30 = objc_msgSend(v28, "copy");
    options = v29->_options;
    v29->_options = (NSDictionary *)v30;

    v29->_type = a9;
    if (v19)
    {
      v32 = v19;
      v33 = objc_msgSend(v19, "copy", obj);
      bundleIdentifier = v29->_bundleIdentifier;
      v29->_bundleIdentifier = (NSString *)v33;
    }
    else
    {
      v32 = 0;
      bundleIdentifier = v29->_bundleIdentifier;
      v29->_bundleIdentifier = 0;
    }

    if (v22)
      v35 = v22;
    else
      v35 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    uniqueIdentifier = v29->_uniqueIdentifier;
    v29->_uniqueIdentifier = v35;

    objc_storeStrong((id *)&v29->_activityType, obj);
    v37 = objc_msgSend(v53, "copy");
    dynamicIdentifier = v29->_dynamicIdentifier;
    v29->_dynamicIdentifier = (NSString *)v37;

    if (v23)
      v39 = (NSDate *)v23;
    else
      v39 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    lastUpdateTime = v29->_lastUpdateTime;
    v29->_lastUpdateTime = v39;

    if (v24)
      v41 = (NSDate *)v24;
    else
      v41 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    lastActiveTime = v29->_lastActiveTime;
    v29->_lastActiveTime = v41;

    v29->_confidence = 0.75;
    v43 = objc_msgSend(v25, "copy");
    originatingDeviceName = v29->_originatingDeviceName;
    v29->_originatingDeviceName = (NSString *)v43;

    v45 = objc_msgSend(v26, "copy");
    originatingDeviceIdentifier = v29->_originatingDeviceIdentifier;
    v29->_originatingDeviceIdentifier = (NSString *)v45;

    v47 = objc_msgSend(v27, "copy");
    originatingDeviceType = v29->_originatingDeviceType;
    v29->_originatingDeviceType = (NSString *)v47;

    v29->_isActive = a14;
    v19 = v32;
  }

  return v29;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  suggestedActionTypeString(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_uniqueIdentifier, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("UABestAppSuggestion(%@ %@ %@ %@:%@ %@ from:%@/%@/%@)"), v4, v5, self->_bundleIdentifier, self->_activityType, self->_dynamicIdentifier, self->_lastActiveTime, self->_originatingDeviceName, self->_originatingDeviceIdentifier, self->_originatingDeviceType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[UABestAppSuggestion options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (v4 = (void *)MEMORY[0x1E0CB36D8],
        -[UABestAppSuggestion options](self, "options"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "dataWithJSONObject:options:error:", v5, 0, 0),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    v7 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);

  }
  else
  {
    v7 = &stru_1E60084E8;
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[UABestAppSuggestion bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UABestAppSuggestion uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UABestAppSuggestion lastUpdateTime](self, "lastUpdateTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("BestApp: %@ %@ %@ %d %@"), v9, v11, v12, -[UABestAppSuggestion type](self, "type"), v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSDate)when
{
  return self->_lastUpdateTime;
}

- (BOOL)isEqual:(id)a3
{
  UABestAppSuggestion *v4;
  UABestAppSuggestion *v5;
  NSUUID *uniqueIdentifier;
  void *v7;
  char v8;
  objc_super v10;

  v4 = (UABestAppSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4
         && (v10.receiver = self,
             v10.super_class = (Class)UABestAppSuggestion,
             -[UABestAppSuggestion isEqual:](&v10, sel_isEqual_, v4)))
  {
    uniqueIdentifier = self->_uniqueIdentifier;
    -[UABestAppSuggestion uniqueIdentifier](v5, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSUUID isEqual:](uniqueIdentifier, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_uniqueIdentifier, "hash");
}

- (UABestAppSuggestion)initWithCoder:(id)a3
{
  id v4;
  UABestAppSuggestion *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSDate *lastUpdateTime;
  uint64_t v10;
  NSDate *lastActiveTime;
  uint64_t v12;
  NSString *originatingDeviceIdentifier;
  uint64_t v14;
  NSString *originatingDeviceName;
  uint64_t v16;
  NSString *originatingDeviceType;
  uint64_t v18;
  NSUUID *uniqueIdentifier;
  uint64_t v20;
  NSString *activityType;
  uint64_t v22;
  NSString *dynamicIdentifier;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UABestAppSuggestion;
  v5 = -[UABestAppSuggestion init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdateTime"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastUpdateTime = v5->_lastUpdateTime;
    v5->_lastUpdateTime = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastActiveTime"));
    v10 = objc_claimAutoreleasedReturnValue();
    lastActiveTime = v5->_lastActiveTime;
    v5->_lastActiveTime = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatingDeviceIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    originatingDeviceIdentifier = v5->_originatingDeviceIdentifier;
    v5->_originatingDeviceIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatingDeviceName"));
    v14 = objc_claimAutoreleasedReturnValue();
    originatingDeviceName = v5->_originatingDeviceName;
    v5->_originatingDeviceName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatingDeviceType"));
    v16 = objc_claimAutoreleasedReturnValue();
    originatingDeviceType = v5->_originatingDeviceType;
    v5->_originatingDeviceType = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityType"));
    v20 = objc_claimAutoreleasedReturnValue();
    activityType = v5->_activityType;
    v5->_activityType = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dynamicIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    dynamicIdentifier = v5->_dynamicIdentifier;
    v5->_dynamicIdentifier = (NSString *)v22;

    v5->_isActive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isActive"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[UABestAppSuggestion bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("bundleIdentifier"));

  -[UABestAppSuggestion lastUpdateTime](self, "lastUpdateTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("lastUpdateTime"));

  -[UABestAppSuggestion lastActiveTime](self, "lastActiveTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("lastActiveTime"));

  -[UABestAppSuggestion originatingDeviceIdentifier](self, "originatingDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("originatingDeviceIdentifier"));

  -[UABestAppSuggestion originatingDeviceName](self, "originatingDeviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("originatingDeviceName"));

  -[UABestAppSuggestion originatingDeviceType](self, "originatingDeviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("originatingDeviceType"));

  -[UABestAppSuggestion uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("uniqueIdentifier"));

  -[UABestAppSuggestion activityType](self, "activityType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("activityType"));

  -[UABestAppSuggestion dynamicIdentifier](self, "dynamicIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("dynamicIdentifier"));

  objc_msgSend(v13, "encodeBool:forKey:", -[UABestAppSuggestion isActive](self, "isActive"), CFSTR("isActive"));
}

- (unint64_t)type
{
  return self->_type;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setActivityType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)dynamicIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)lastUpdateTime
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (double)confidence
{
  return self->_confidence;
}

- (NSString)originatingDeviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)originatingDeviceName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)originatingDeviceType
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSDate)lastActiveTime
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActiveTime, 0);
  objc_storeStrong((id *)&self->_originatingDeviceType, 0);
  objc_storeStrong((id *)&self->_originatingDeviceName, 0);
  objc_storeStrong((id *)&self->_originatingDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);
  objc_storeStrong((id *)&self->_dynamicIdentifier, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (NSString)userActivityTypeIdentifier
{
  return self->_activityType;
}

@end
