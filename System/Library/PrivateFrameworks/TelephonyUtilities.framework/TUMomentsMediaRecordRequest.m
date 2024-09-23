@implementation TUMomentsMediaRecordRequest

- (TUMomentsMediaRecordRequest)initWithCallUUID:(id)a3 URL:(id)a4 mediaTokens:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUMomentsMediaRecordRequest *v12;
  TUMomentsMediaRecordRequest *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUMomentsMediaRecordRequest;
  v12 = -[TUMomentsMediaRecordRequest init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_callUUID, a3);
    objc_storeStrong((id *)&v13->_sandboxURL, a4);
    objc_storeStrong((id *)&v13->_mediaTokens, a5);
  }

  return v13;
}

- (TUMomentsMediaRecordRequest)initWithCall:(id)a3 URL:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  TUMomentsMediaRecordRequest *v13;
  void *v14;
  uint64_t v15;
  NSString *remoteCaptionsFileName;
  void *v17;
  uint64_t v18;
  void *localCaptionsFileName;
  void *v20;
  uint64_t v21;
  NSString *v22;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0CB3A28];
  v8 = a4;
  v9 = [v7 alloc];
  objc_msgSend(v6, "callUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);
  objc_msgSend(v6, "tokens");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[TUMomentsMediaRecordRequest initWithCallUUID:URL:mediaTokens:](self, "initWithCallUUID:URL:mediaTokens:", v11, v8, v12);

  if (v13)
  {
    objc_msgSend(v6, "handle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "normalizedValue");
    v15 = objc_claimAutoreleasedReturnValue();
    remoteCaptionsFileName = v13->_remoteCaptionsFileName;
    v13->_remoteCaptionsFileName = (NSString *)v15;

    objc_msgSend(v6, "localMemberHandleValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v6, "localMemberHandleValue");
      v18 = objc_claimAutoreleasedReturnValue();
      localCaptionsFileName = v13->_localCaptionsFileName;
      v13->_localCaptionsFileName = (NSString *)v18;
    }
    else
    {
      objc_msgSend(v6, "localSenderIdentity");
      localCaptionsFileName = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(localCaptionsFileName, "handle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "normalizedValue");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v13->_localCaptionsFileName;
      v13->_localCaptionsFileName = (NSString *)v21;

    }
  }

  return v13;
}

- (TUMomentsMediaRecordRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  TUMomentsMediaRecordRequest *v23;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_callUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_sandboxURL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_mediaTokens);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_opt_class();
  NSStringFromSelector(sel_localeIdentifier);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_opt_class();
  NSStringFromSelector(sel_localCaptionsFileName);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_opt_class();
  NSStringFromSelector(sel_remoteCaptionsFileName);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  if (v7 && v10 && v13)
  {
    self = -[TUMomentsMediaRecordRequest initWithCallUUID:URL:mediaTokens:](self, "initWithCallUUID:URL:mediaTokens:", v7, v10, v13);
    -[TUMomentsMediaRecordRequest setLocaleIdentifier:](self, "setLocaleIdentifier:", v16);
    -[TUMomentsMediaRecordRequest setLocalCaptionsFileName:](self, "setLocalCaptionsFileName:", v19);
    -[TUMomentsMediaRecordRequest setRemoteCaptionsFileName:](self, "setRemoteCaptionsFileName:", v22);
    v23 = self;
  }

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  id v16;

  v4 = a3;
  -[TUMomentsMediaRecordRequest callUUID](self, "callUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_callUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUMomentsMediaRecordRequest sandboxURL](self, "sandboxURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sandboxURL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUMomentsMediaRecordRequest mediaTokens](self, "mediaTokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_mediaTokens);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[TUMomentsMediaRecordRequest localeIdentifier](self, "localeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localeIdentifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[TUMomentsMediaRecordRequest localCaptionsFileName](self, "localCaptionsFileName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localCaptionsFileName);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[TUMomentsMediaRecordRequest remoteCaptionsFileName](self, "remoteCaptionsFileName");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_remoteCaptionsFileName);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, v15);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)localCaptionsFileName
{
  NSString *localCaptionsFileName;

  if (!-[NSString length](self->_localCaptionsFileName, "length"))
  {
    localCaptionsFileName = self->_localCaptionsFileName;
    self->_localCaptionsFileName = (NSString *)CFSTR("LOCAL");

  }
  return self->_localCaptionsFileName;
}

- (NSString)remoteCaptionsFileName
{
  NSString *remoteCaptionsFileName;

  if (!-[NSString length](self->_remoteCaptionsFileName, "length"))
  {
    remoteCaptionsFileName = self->_remoteCaptionsFileName;
    self->_remoteCaptionsFileName = (NSString *)CFSTR("REMOTE");

  }
  return self->_remoteCaptionsFileName;
}

- (NSUUID)callUUID
{
  return self->_callUUID;
}

- (TUSandboxExtendedURL)sandboxURL
{
  return self->_sandboxURL;
}

- (TUMediaTokens)mediaTokens
{
  return self->_mediaTokens;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setLocalCaptionsFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setRemoteCaptionsFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCaptionsFileName, 0);
  objc_storeStrong((id *)&self->_localCaptionsFileName, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaTokens, 0);
  objc_storeStrong((id *)&self->_sandboxURL, 0);
  objc_storeStrong((id *)&self->_callUUID, 0);
}

@end
