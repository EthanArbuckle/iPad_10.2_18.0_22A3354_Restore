@implementation SiriContinuityContext

- (SiriContinuityContext)initWithSpeechRequestOptions:(id)a3
{
  id v4;
  SiriContinuityContext *v5;
  SiriContinuityContext *v6;
  NSNumber *isTemporaryDevice;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSNumber *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SiriContinuityContext;
  v5 = -[SiriContext initWithSpeechRequestOptions:](&v16, sel_initWithSpeechRequestOptions_, v4);
  v6 = v5;
  if (v5)
  {
    isTemporaryDevice = v5->_isTemporaryDevice;
    v5->_isTemporaryDevice = (NSNumber *)MEMORY[0x1E0C9AAA0];

    objc_msgSend(v4, "activationDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "activationDeviceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v9);
      objc_msgSend(v10, "deviceFromIdentifier:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "device");
        BTDeviceIsTemporaryPaired();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v6->_isTemporaryDevice;
        v6->_isTemporaryDevice = (NSNumber *)v13;

      }
    }
  }

  return v6;
}

- (SiriContinuityContext)initWithRequestInfo:(id)a3
{
  id v5;
  SiriContinuityContext *v6;
  SiriContinuityContext *v7;
  NSNumber *isTemporaryDevice;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSNumber *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SiriContinuityContext;
  v6 = -[SiriContinuityContext init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    isTemporaryDevice = v6->_isTemporaryDevice;
    v6->_isTemporaryDevice = (NSNumber *)MEMORY[0x1E0C9AAA0];

    objc_msgSend(v5, "speechRequestOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activationDeviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v5, "speechRequestOptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "activationDeviceIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);
      objc_msgSend(v13, "deviceFromIdentifier:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v15, "device");
        BTDeviceIsTemporaryPaired();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v7->_isTemporaryDevice;
        v7->_isTemporaryDevice = (NSNumber *)v16;

      }
    }
    objc_storeStrong((id *)&v7->_requestInfo, a3);
  }

  return v7;
}

- (SiriContinuityContext)initWithUserActivity:(id)a3
{
  id v5;
  SiriContinuityContext *v6;
  SiriContinuityContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriContinuityContext;
  v6 = -[SiriContinuityContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userActivity, a3);

  return v7;
}

- (id)speechRequestOptions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SiriContinuityContext;
  -[SiriContext speechRequestOptions](&v8, sel_speechRequestOptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[AFRequestInfo speechRequestOptions](self->_requestInfo, "speechRequestOptions");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)isTemporaryDevice
{
  return -[NSNumber BOOLValue](self->_isTemporaryDevice, "BOOLValue");
}

- (id)description
{
  void *v3;
  void *v4;
  NSNumber *isTemporaryDevice;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SiriContext contextOverride](self, "contextOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isTemporaryDevice = self->_isTemporaryDevice;
  -[SiriContinuityContext speechRequestOptions](self, "speechRequestOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SiriContinuityContext contextOverride:%@ isTemporaryDevice:%@ speechRequestOptions:%@ requestInfo:%@ userActivity:%@>"), v4, isTemporaryDevice, v6, self->_requestInfo, self->_userActivity);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriContinuityContext)initWithCoder:(id)a3
{
  id v4;
  SiriContinuityContext *v5;
  uint64_t v6;
  NSNumber *isTemporaryDevice;
  uint64_t v8;
  AFRequestInfo *requestInfo;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSDictionary *userActivity;
  uint64_t v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SiriContinuityContext;
  v5 = -[SiriContext initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isTemporaryDevice"));
    v6 = objc_claimAutoreleasedReturnValue();
    isTemporaryDevice = v5->_isTemporaryDevice;
    v5->_isTemporaryDevice = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestInfo"));
    v8 = objc_claimAutoreleasedReturnValue();
    requestInfo = v5->_requestInfo;
    v5->_requestInfo = (AFRequestInfo *)v8;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v22, v10, v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("userActivity"));
    v19 = objc_claimAutoreleasedReturnValue();
    userActivity = v5->_userActivity;
    v5->_userActivity = (NSDictionary *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriContinuityContext;
  v4 = a3;
  -[SiriContext encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_isTemporaryDevice, CFSTR("isTemporaryDevice"), v7.receiver, v7.super_class);
  -[SiriContinuityContext requestInfo](self, "requestInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("requestInfo"));

  -[SiriContinuityContext userActivity](self, "userActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("userActivity"));

}

- (AFRequestInfo)requestInfo
{
  return self->_requestInfo;
}

- (NSDictionary)userActivity
{
  return self->_userActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_isTemporaryDevice, 0);
}

@end
