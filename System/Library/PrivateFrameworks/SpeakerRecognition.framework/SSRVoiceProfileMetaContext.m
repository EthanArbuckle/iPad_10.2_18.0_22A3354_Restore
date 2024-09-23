@implementation SSRVoiceProfileMetaContext

- (SSRVoiceProfileMetaContext)initWithVoiceProfile:(id)a3
{
  id v4;
  SSRVoiceProfileMetaContext *v5;
  uint64_t v6;
  NSString *appDomain;
  uint64_t v8;
  NSString *profileId;
  uint64_t v10;
  NSString *sharedSiriId;
  uint64_t v12;
  NSString *languageCode;
  uint64_t v14;
  NSString *userName;
  uint64_t v16;
  NSDate *dateAdded;
  uint64_t v18;
  NSNumber *pitch;
  SSRVoiceProfileMetaContext *v20;
  NSObject *v21;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v23.receiver = self;
    v23.super_class = (Class)SSRVoiceProfileMetaContext;
    v5 = -[SSRVoiceProfileMetaContext init](&v23, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "appDomain");
      v6 = objc_claimAutoreleasedReturnValue();
      appDomain = v5->_appDomain;
      v5->_appDomain = (NSString *)v6;

      objc_msgSend(v4, "profileID");
      v8 = objc_claimAutoreleasedReturnValue();
      profileId = v5->_profileId;
      v5->_profileId = (NSString *)v8;

      objc_msgSend(v4, "siriProfileId");
      v10 = objc_claimAutoreleasedReturnValue();
      sharedSiriId = v5->_sharedSiriId;
      v5->_sharedSiriId = (NSString *)v10;

      objc_msgSend(v4, "locale");
      v12 = objc_claimAutoreleasedReturnValue();
      languageCode = v5->_languageCode;
      v5->_languageCode = (NSString *)v12;

      objc_msgSend(v4, "userName");
      v14 = objc_claimAutoreleasedReturnValue();
      userName = v5->_userName;
      v5->_userName = (NSString *)v14;

      objc_msgSend(v4, "dateAdded");
      v16 = objc_claimAutoreleasedReturnValue();
      dateAdded = v5->_dateAdded;
      v5->_dateAdded = (NSDate *)v16;

      objc_msgSend(v4, "profilePitch");
      v18 = objc_claimAutoreleasedReturnValue();
      pitch = v5->_pitch;
      v5->_pitch = (NSNumber *)v18;

    }
    self = v5;
    v20 = self;
  }
  else
  {
    v21 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[SSRVoiceProfileMetaContext initWithVoiceProfile:]";
      _os_log_error_impl(&dword_2117D4000, v21, OS_LOG_TYPE_ERROR, "%s ERR: voiceProfile is nil - Bailing out", buf, 0xCu);
    }
    v20 = 0;
  }

  return v20;
}

- (SSRVoiceProfileMetaContext)initWithSharedSiriId:(id)a3 languageCode:(id)a4 productCategory:(id)a5 version:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SSRVoiceProfileMetaContext *v15;
  SSRVoiceProfileMetaContext *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SSRVoiceProfileMetaContext;
  v15 = -[SSRVoiceProfileMetaContext init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sharedSiriId, a3);
    objc_storeStrong((id *)&v16->_languageCode, a4);
    objc_storeStrong((id *)&v16->_productCategory, a5);
    objc_storeStrong((id *)&v16->_version, a6);
  }

  return v16;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[profileId: %@, language: %@, product: %@, version: %@, homeId: %@, name: %@, pitch:%@ Hz]"), self->_sharedSiriId, self->_languageCode, self->_productCategory, self->_version, self->_homeId, self->_userName, self->_pitch);
}

- (NSString)appDomain
{
  return self->_appDomain;
}

- (void)setAppDomain:(id)a3
{
  objc_storeStrong((id *)&self->_appDomain, a3);
}

- (NSString)profileId
{
  return self->_profileId;
}

- (void)setProfileId:(id)a3
{
  objc_storeStrong((id *)&self->_profileId, a3);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (NSString)productCategory
{
  return self->_productCategory;
}

- (void)setProductCategory:(id)a3
{
  objc_storeStrong((id *)&self->_productCategory, a3);
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (void)setDateAdded:(id)a3
{
  objc_storeStrong((id *)&self->_dateAdded, a3);
}

- (NSNumber)pitch
{
  return self->_pitch;
}

- (void)setPitch:(id)a3
{
  objc_storeStrong((id *)&self->_pitch, a3);
}

- (NSString)sharedSiriId
{
  return self->_sharedSiriId;
}

- (void)setSharedSiriId:(id)a3
{
  objc_storeStrong((id *)&self->_sharedSiriId, a3);
}

- (NSString)homeId
{
  return self->_homeId;
}

- (void)setHomeId:(id)a3
{
  objc_storeStrong((id *)&self->_homeId, a3);
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
  objc_storeStrong((id *)&self->_userName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_homeId, 0);
  objc_storeStrong((id *)&self->_sharedSiriId, 0);
  objc_storeStrong((id *)&self->_pitch, 0);
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_productCategory, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_profileId, 0);
  objc_storeStrong((id *)&self->_appDomain, 0);
}

@end
