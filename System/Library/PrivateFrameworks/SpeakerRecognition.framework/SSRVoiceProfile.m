@implementation SSRVoiceProfile

- (SSRVoiceProfile)initWithCoder:(id)a3
{
  id v4;
  SSRVoiceProfile *v5;
  uint64_t v6;
  NSString *locale;
  uint64_t v8;
  NSString *appDomain;
  uint64_t v10;
  NSString *profileID;
  uint64_t v12;
  NSDate *dateAdded;
  uint64_t v14;
  NSString *profileBasePath;
  uint64_t v16;
  NSString *profileBasePathExclave;
  uint64_t v18;
  NSNumber *profilePitch;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SSRVoiceProfile;
  v5 = -[SSRVoiceProfile init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserVoiceProfileLocale"));
    v6 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserVoiceProfileAppDomain"));
    v8 = objc_claimAutoreleasedReturnValue();
    appDomain = v5->_appDomain;
    v5->_appDomain = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserVoiceProfileID"));
    v10 = objc_claimAutoreleasedReturnValue();
    profileID = v5->_profileID;
    v5->_profileID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserVoiceProfileDateTrained"));
    v12 = objc_claimAutoreleasedReturnValue();
    dateAdded = v5->_dateAdded;
    v5->_dateAdded = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserVoiceProfilePath"));
    v14 = objc_claimAutoreleasedReturnValue();
    profileBasePath = v5->_profileBasePath;
    v5->_profileBasePath = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserVoiceProfilePathExclave"));
    v16 = objc_claimAutoreleasedReturnValue();
    profileBasePathExclave = v5->_profileBasePathExclave;
    v5->_profileBasePathExclave = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserVoiceProfilePitch"));
    v18 = objc_claimAutoreleasedReturnValue();
    profilePitch = v5->_profilePitch;
    v5->_profilePitch = (NSNumber *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *locale;
  id v5;

  locale = self->_locale;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", locale, CFSTR("UserVoiceProfileLocale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appDomain, CFSTR("UserVoiceProfileAppDomain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_profileID, CFSTR("UserVoiceProfileID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateAdded, CFSTR("UserVoiceProfileDateTrained"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_profileBasePath, CFSTR("UserVoiceProfilePath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_profileBasePathExclave, CFSTR("UserVoiceProfilePathExclave"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_profilePitch, CFSTR("UserVoiceProfilePitch"));

}

- (id)initNewVoiceProfileWithLocale:(id)a3 withAppDomain:(id)a4
{
  id v7;
  id v8;
  SSRVoiceProfile *v9;
  void *v10;
  uint64_t v11;
  NSString *profileID;
  uint64_t v13;
  NSDate *dateAdded;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *profileBasePath;
  double v21;
  uint64_t v22;
  NSNumber *profilePitch;
  SSRVoiceProfile *v24;
  NSObject *v25;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)SSRVoiceProfile;
  v9 = -[SSRVoiceProfile init](&v27, sel_init);
  if (!v9)
    goto LABEL_5;
  if (v7 && v8)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();
    profileID = v9->_profileID;
    v9->_profileID = (NSString *)v11;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = objc_claimAutoreleasedReturnValue();
    dateAdded = v9->_dateAdded;
    v9->_dateAdded = (NSDate *)v13;

    +[SSRVoiceProfileManager sharedInstance](SSRVoiceProfileManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "SSRSpeakerProfilesBasePath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "stringByAppendingPathComponent:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathComponent:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingPathComponent:", v9->_profileID);
    v19 = objc_claimAutoreleasedReturnValue();
    profileBasePath = v9->_profileBasePath;
    v9->_profileBasePath = (NSString *)v19;

    objc_storeStrong((id *)&v9->_appDomain, a4);
    objc_storeStrong((id *)&v9->_locale, a3);
    LODWORD(v21) = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    profilePitch = v9->_profilePitch;
    v9->_profilePitch = (NSNumber *)v22;

LABEL_5:
    v24 = v9;
    goto LABEL_9;
  }
  v25 = *MEMORY[0x24BE28360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[SSRVoiceProfile initNewVoiceProfileWithLocale:withAppDomain:]";
    _os_log_impl(&dword_2117D4000, v25, OS_LOG_TYPE_DEFAULT, "%s ERR: missing arguments to create voice profile - Bailing out", buf, 0xCu);
  }
  v24 = 0;
LABEL_9:

  return v24;
}

- (SSRVoiceProfile)initWithDictionary:(id)a3
{
  id v4;
  SSRVoiceProfile *v5;
  NSString *profileID;
  void *v7;
  void *v8;
  NSDate *v9;
  NSDate *dateAdded;
  NSString *v11;
  NSString *profileBasePath;
  NSString *v13;
  NSString *profileBasePathExclave;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  NSString *locale;
  NSString *v19;
  NSString *siriProfileId;
  NSString *v21;
  NSString *appDomain;
  void *v23;
  NSNumber *v24;
  NSNumber *profilePitch;
  NSString *v26;
  NSString *userName;
  objc_super v29;

  v4 = a3;
  if (v4)
  {
    v29.receiver = self;
    v29.super_class = (Class)SSRVoiceProfile;
    self = -[SSRVoiceProfile init](&v29, sel_init);
    if (self)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserVoiceProfileID"));
      v5 = (SSRVoiceProfile *)objc_claimAutoreleasedReturnValue();
      profileID = self->_profileID;
      self->_profileID = (NSString *)&v5->super.isa;

      if (!v5)
      {
        NSLog(CFSTR("Creating SSRVoiceProfile with no profileId vpDict: %@"), v4);
        goto LABEL_11;
      }
      v7 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserVoiceProfileDateTrained"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      objc_msgSend(v7, "dateWithTimeIntervalSince1970:");
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
      dateAdded = self->_dateAdded;
      self->_dateAdded = v9;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserVoiceProfilePath"));
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      profileBasePath = self->_profileBasePath;
      self->_profileBasePath = v11;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserVoiceProfilePathExclave"));
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      profileBasePathExclave = self->_profileBasePathExclave;
      self->_profileBasePathExclave = v13;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserVoiceProfileID"));
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      v16 = self->_profileID;
      self->_profileID = v15;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserVoiceProfileLocale"));
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      locale = self->_locale;
      self->_locale = v17;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserSharedSiriID"));
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      siriProfileId = self->_siriProfileId;
      self->_siriProfileId = v19;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserVoiceProfileAppDomain"));
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      appDomain = self->_appDomain;
      self->_appDomain = v21;

      objc_msgSend(v4, "objectForKey:", CFSTR("UserVoiceProfilePitch"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("UserVoiceProfilePitch"));
        v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        profilePitch = self->_profilePitch;
        self->_profilePitch = v24;

      }
      if (CSIsInternalBuild())
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserVoiceProfileUserName"));
        v26 = (NSString *)objc_claimAutoreleasedReturnValue();
        userName = self->_userName;
        self->_userName = v26;

      }
    }
    self = self;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }
LABEL_11:

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSString *siriProfileId;
  NSString *userName;
  NSString *profileBasePathExclave;
  void *v11;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[NSDate timeIntervalSince1970](self->_dateAdded, "timeIntervalSince1970");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%f"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v6, CFSTR("UserVoiceProfileDateTrained"), self->_locale, CFSTR("UserVoiceProfileLocale"), self->_profileBasePath, CFSTR("UserVoiceProfilePath"), self->_profileID, CFSTR("UserVoiceProfileID"), self->_appDomain, CFSTR("UserVoiceProfileAppDomain"), self->_profilePitch, CFSTR("UserVoiceProfilePitch"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  siriProfileId = self->_siriProfileId;
  if (siriProfileId)
    objc_msgSend(v7, "setObject:forKey:", siriProfileId, CFSTR("UserSharedSiriID"));
  if (CSIsInternalBuild())
  {
    userName = self->_userName;
    if (userName)
      objc_msgSend(v7, "setObject:forKey:", userName, CFSTR("UserVoiceProfileUserName"));
  }
  profileBasePathExclave = self->_profileBasePathExclave;
  if (profileBasePathExclave)
    objc_msgSend(v7, "setObject:forKey:", profileBasePathExclave, CFSTR("UserVoiceProfilePathExclave"));
  v11 = (void *)objc_msgSend(v7, "copy");

  return v11;
}

- (id)description
{
  void *v2;
  void *v3;

  -[SSRVoiceProfile dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSharedSiriProfileId:(id)a3
{
  objc_storeStrong((id *)&self->_siriProfileId, a3);
}

- (id)voiceProfileModelFilePathForRecognizerType:(unint64_t)a3 spIdType:(unint64_t)a4
{
  void *v4;
  void *v5;

  -[SSRVoiceProfile voiceProfileModelDirForSpidType:recognizerType:](self, "voiceProfileModelDirForSpidType:recognizerType:", a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)exclaveVoiceProfileModelFilePathForRecognizerType:(unint64_t)a3 spIdType:(unint64_t)a4
{
  void *v4;
  void *v5;

  -[SSRVoiceProfile voiceProfileModelFilePathForRecognizerType:spIdType:](self, "voiceProfileModelFilePathForRecognizerType:spIdType:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathExtension:", CFSTR("exclave"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)copyTDAudioToTDTI
{
  void *v3;
  void *v4;
  void *v5;
  os_log_t *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCF48];
  -[SSRVoiceProfile _voiceProfilePathForSpidType:](self, "_voiceProfilePathForSpidType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (os_log_t *)MEMORY[0x24BE284B8];
  v7 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[SSRVoiceProfile copyTDAudioToTDTI]";
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s Copying TD audio files: %@ to TDTI", (uint8_t *)&v13, 0x16u);
  }
  -[SSRVoiceProfile getEnrollmentUtterancesForModelType:](self, "getEnrollmentUtterancesForModelType:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (unint64_t)objc_msgSend(v8, "count") >= 5)
  {
    v10 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = "-[SSRVoiceProfile copyTDAudioToTDTI]";
      _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s TDTI audio files exist. Aborting copy", (uint8_t *)&v13, 0xCu);
    }
    v11 = 0;
  }
  else
  {
    v11 = -[SSRVoiceProfile _copyExplicitAudio:withSpIdType:](self, "_copyExplicitAudio:withSpIdType:", v5, 3);
  }

  return v11;
}

- (unint64_t)_copyExplicitAudio:(id)a3 withSpIdType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  os_log_t *v10;
  void *v11;
  NSString *profileID;
  NSObject *v13;
  void *v14;
  void *v15;
  os_log_t v16;
  NSString *v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  os_log_t v22;
  NSObject *v23;
  uint64_t v24;
  NSString *v25;
  int v27;
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  NSString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("audio"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils getExplicitEnrollmentUtterancesFromDirectory:](SSRUtils, "getExplicitEnrollmentUtterancesFromDirectory:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (os_log_t *)MEMORY[0x24BE284B8];
  v11 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    profileID = self->_profileID;
    v13 = v11;
    objc_msgSend(v6, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 136315906;
    v28 = "-[SSRVoiceProfile _copyExplicitAudio:withSpIdType:]";
    v29 = 2114;
    v30 = v9;
    v31 = 2114;
    v32 = (unint64_t)profileID;
    v33 = 2114;
    v34 = (uint64_t)v14;
    _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s Importing %{public}@ of %{public}@ from import Dir %{public}@", (uint8_t *)&v27, 0x2Au);

  }
  -[SSRVoiceProfile addUtterances:spIdType:](self, "addUtterances:spIdType:", v8, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_profileID;
      v18 = v16;
      objc_msgSend(v6, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 136315906;
      v28 = "-[SSRVoiceProfile _copyExplicitAudio:withSpIdType:]";
      v29 = 2114;
      v30 = v9;
      v31 = 2114;
      v32 = (unint64_t)v17;
      v33 = 2114;
      v34 = (uint64_t)v19;
      _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, "%s Failed in importing %{public}@ of %{public}@ from import Dir %{public}@", (uint8_t *)&v27, 0x2Au);

    }
    v20 = 0;
  }
  else
  {
    -[SSRVoiceProfile getExplicitEnrollmentUtterancesForType:](self, "getExplicitEnrollmentUtterancesForType:", a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v21, "count");

    v22 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      v24 = objc_msgSend(v8, "count");
      v25 = self->_profileID;
      v27 = 136316162;
      v28 = "-[SSRVoiceProfile _copyExplicitAudio:withSpIdType:]";
      v29 = 2112;
      v30 = v9;
      v31 = 2050;
      v32 = v20;
      v33 = 2050;
      v34 = v24;
      v35 = 2114;
      v36 = v25;
      _os_log_impl(&dword_2117D4000, v23, OS_LOG_TYPE_DEFAULT, "%s Successfully imported %{publice}@ %{public}lu(%{public}lu) utterances to profile %{public}@", (uint8_t *)&v27, 0x34u);

    }
  }

  return v20;
}

- (id)importVoiceProfileAtPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  SSRVoiceProfile *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  unint64_t v32;
  os_log_t *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  const __CFString *v47;
  void *v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  unint64_t v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", self->_profileBasePath);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils createDirectoryIfDoesNotExist:](SSRUtils, "createDirectoryIfDoesNotExist:", v5);

  v37 = v4;
  +[SSRUtils getContentsOfDirectory:](SSRUtils, "getContentsOfDirectory:", v4);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
  if (v7)
  {
    v8 = v7;
    v39 = 0;
    v40 = 0;
    v9 = *(_QWORD *)v44;
    v38 = v6;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v10);
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if ((v14 & 1) == 0)
        {
          +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v12, "isEqualToString:", v15);

          if (v16)
          {
            if ((CSIsCommunalDevice() & 1) == 0)
              v39 = -[SSRVoiceProfile _copyExplicitAudio:withSpIdType:](self, "_copyExplicitAudio:withSpIdType:", v11, 1);
          }
          else
          {
            +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", 3);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v12, "isEqualToString:", v17);

            if (v18)
            {
              v40 = -[SSRVoiceProfile _copyExplicitAudio:withSpIdType:](self, "_copyExplicitAudio:withSpIdType:", v11, 3);
            }
            else
            {
              v19 = self;
              objc_msgSend(v11, "lastPathComponent");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "URLByAppendingPathComponent:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = 0;
              objc_msgSend(v22, "copyItemAtURL:toURL:error:", v11, v21, &v42);
              v23 = v42;

              v24 = *MEMORY[0x24BE284B8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                v50 = "-[SSRVoiceProfile importVoiceProfileAtPath:]";
                v51 = 2114;
                v52 = (unint64_t)v11;
                v53 = 2114;
                v54 = (unint64_t)v21;
                v55 = 2114;
                v56 = (unint64_t)v23;
                _os_log_impl(&dword_2117D4000, v24, OS_LOG_TYPE_DEFAULT, "%s Copied %{public}@ to %{public}@ with error %{public}@", buf, 0x2Au);
              }
              if (v23)
              {
                v26 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v19->_profileBasePath);

                v6 = v38;
                v27 = v38;
                v28 = v37;
                goto LABEL_21;
              }

              self = v19;
              v6 = v38;
            }
          }
        }

        ++v10;
      }
      while (v8 != v10);
      v25 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
      v8 = v25;
    }
    while (v25);
  }
  else
  {
    v39 = 0;
    v40 = 0;
  }

  v23 = 0;
  if (CSIsCommunalDevice())
  {
    v28 = v37;
    if (v40 <= 4)
    {
      +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "URLByAppendingPathComponent:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = -[SSRVoiceProfile _copyExplicitAudio:withSpIdType:](self, "_copyExplicitAudio:withSpIdType:", v31, 3);
      v33 = (os_log_t *)MEMORY[0x24BE284B8];
      v34 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v50 = "-[SSRVoiceProfile importVoiceProfileAtPath:]";
        v51 = 2050;
        v52 = v39;
        v53 = 2050;
        v54 = v32;
        v55 = 2050;
        v56 = v40;
        _os_log_impl(&dword_2117D4000, v34, OS_LOG_TYPE_DEFAULT, "%s Copied TD audio files %{public}lu to TDTI which now has %{public}lu(%{public}lu) utterances", buf, 0x2Au);
      }

      if (v32 > 2)
      {
        v23 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Too less audio files (%ld) for onboarding"), v32);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *v33;
        if (os_log_type_enabled(*v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v50 = "-[SSRVoiceProfile importVoiceProfileAtPath:]";
          v51 = 2114;
          v52 = (unint64_t)v27;
          _os_log_error_impl(&dword_2117D4000, v35, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
        }
        v36 = (void *)MEMORY[0x24BDD1540];
        v47 = CFSTR("reason");
        v48 = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 733, v12);
        v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

      }
    }
  }
  else
  {
    v28 = v37;
  }

  return v23;
}

- (id)addUtterances:(id)a3 spIdType:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSString *v33;
  NSObject *v34;
  NSString *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  NSString *profileID;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  SSRVoiceProfile *v49;
  void *v50;
  void *v51;
  void *v52;
  char *v53;
  id obj;
  uint64_t v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  const __CFString *v62;
  void *v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  NSString *v71;
  _BYTE v72[128];
  const __CFString *v73;
  _QWORD v74[4];

  v74[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v49 = self;
    -[SSRVoiceProfile voiceProfileAudioDirPathForSpidType:](self, "voiceProfileAudioDirPathForSpidType:", a4);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)v8;
    +[SSRUtils createDirectoryIfDoesNotExist:](SSRUtils, "createDirectoryIfDoesNotExist:", v8);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v51 = v7;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
    if (v12)
    {
      v13 = v12;
      v53 = 0;
      v14 = 0;
      v55 = *(_QWORD *)v59;
      v52 = v10;
      obj = v11;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v59 != v55)
            objc_enumerationMutation(obj);
          v16 = *(id *)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(v16, "lastPathComponent");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "URLByAppendingPathComponent:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "URLByDeletingPathExtension");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "URLByAppendingPathExtension:", CFSTR("json"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "lastPathComponent");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "URLByAppendingPathComponent:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v57 = v14;
          objc_msgSend(v10, "copyItemAtURL:toURL:error:", v16, v18, &v57);
          v23 = v57;

          v24 = *MEMORY[0x24BE284B8];
          v25 = *MEMORY[0x24BE284B8];
          if (v23)
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v32 = v24;
              objc_msgSend(v23, "localizedDescription");
              v33 = (NSString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              v65 = "-[SSRVoiceProfile addUtterances:spIdType:]";
              v66 = 2114;
              v67 = v16;
              v68 = 2114;
              v69 = (uint64_t)v18;
              v70 = 2114;
              v71 = v33;
              _os_log_error_impl(&dword_2117D4000, v32, OS_LOG_TYPE_ERROR, "%s Error to copy utterance from %{public}@ to %{public}@, error: %{public}@", buf, 0x2Au);

              v10 = v52;
            }
            v14 = v23;
          }
          else
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v65 = "-[SSRVoiceProfile addUtterances:spIdType:]";
              v66 = 2114;
              v67 = v16;
              v68 = 2114;
              v69 = (uint64_t)v18;
              _os_log_impl(&dword_2117D4000, v24, OS_LOG_TYPE_DEFAULT, "%s Copied Utterance from %{public}@ to %{public}@", buf, 0x20u);
            }
            objc_msgSend(v20, "path");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v10, "fileExistsAtPath:", v26);

            if (v27
              && (v56 = 0,
                  objc_msgSend(v10, "copyItemAtURL:toURL:error:", v20, v22, &v56),
                  (v28 = v56) != 0))
            {
              v14 = v28;
              v29 = (void *)*MEMORY[0x24BE284B8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
              {
                v34 = v29;
                objc_msgSend(v14, "localizedDescription");
                v35 = (NSString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315906;
                v65 = "-[SSRVoiceProfile addUtterances:spIdType:]";
                v66 = 2114;
                v67 = v20;
                v68 = 2114;
                v69 = (uint64_t)v22;
                v70 = 2114;
                v71 = v35;
                _os_log_error_impl(&dword_2117D4000, v34, OS_LOG_TYPE_ERROR, "%s Error to copy jsonFile from %{public}@ to %{public}@, error: %{public}@", buf, 0x2Au);

              }
              objc_msgSend(v18, "path");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v30);

              v10 = v52;
            }
            else
            {
              v14 = 0;
              ++v53;
            }
          }

        }
        v11 = obj;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
      }
      while (v13);
    }
    else
    {
      v53 = 0;
      v14 = 0;
    }

    v40 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v41 = v40;
      v42 = objc_msgSend(v11, "count");
      profileID = v49->_profileID;
      *(_DWORD *)buf = 136315906;
      v65 = "-[SSRVoiceProfile addUtterances:spIdType:]";
      v66 = 2050;
      v67 = v53;
      v68 = 2050;
      v69 = v42;
      v70 = 2114;
      v71 = profileID;
      _os_log_impl(&dword_2117D4000, v41, OS_LOG_TYPE_DEFAULT, "%s Successfully copied %{public}lu(%{public}lu) utterances to profile %{public}@", buf, 0x2Au);

    }
    v7 = v51;
    if (v53)
    {
      v39 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to copy utterances with error %@"), v14);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v65 = "-[SSRVoiceProfile addUtterances:spIdType:]";
        v66 = 2114;
        v67 = v44;
        _os_log_error_impl(&dword_2117D4000, v45, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      }
      v46 = (void *)MEMORY[0x24BDD1540];
      v62 = CFSTR("reason");
      v63 = v44;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 721, v47);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v36 = v50;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("utterances passed is nil!"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v65 = "-[SSRVoiceProfile addUtterances:spIdType:]";
      v66 = 2114;
      v67 = v36;
      _os_log_error_impl(&dword_2117D4000, v37, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    v38 = (void *)MEMORY[0x24BDD1540];
    v73 = CFSTR("reason");
    v74[0] = v36;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 727, v9);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v39;
}

- (id)getExplicitEnrollmentUtterancesForType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SSRVoiceProfile voiceProfileAudioDirPathForSpidType:](self, "voiceProfileAudioDirPathForSpidType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils getExplicitEnrollmentUtterancesFromDirectory:](SSRUtils, "getExplicitEnrollmentUtterancesFromDirectory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getExplicitMarkedEnrollmentUtterancesForType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SSRVoiceProfile voiceProfileAudioDirPathForSpidType:](self, "voiceProfileAudioDirPathForSpidType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils getExplicitMarkedEnrollmentUtterancesFromDirectory:](SSRUtils, "getExplicitMarkedEnrollmentUtterancesFromDirectory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getEnrollmentUtterancesForModelType:(unint64_t)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a3 == 4)
  {
    v3 = 3;
  }
  else
  {
    if (a3 != 5)
    {
      -[SSRVoiceProfile voiceProfileAudioDirPathForSpidType:](self, "voiceProfileAudioDirPathForSpidType:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[SSRUtils getEnrollmentUtterancesFromDirectory:](SSRUtils, "getEnrollmentUtterancesFromDirectory:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v3 = 1;
  }
  -[SSRVoiceProfile voiceProfileAudioDirPathForSpidType:](self, "voiceProfileAudioDirPathForSpidType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils getExplicitEnrollmentUtterancesFromDirectory:](SSRUtils, "getExplicitEnrollmentUtterancesFromDirectory:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v7 = (void *)v6;

  return v7;
}

- (id)getImplicitEnrollmentUtterancesPriorTo:(id)a3 forType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    -[SSRVoiceProfile voiceProfileAudioDirPathForSpidType:](self, "voiceProfileAudioDirPathForSpidType:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSRUtils getImplicitEnrollmentUtterancesFromDirectory:](SSRUtils, "getImplicitEnrollmentUtterancesFromDirectory:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD1758];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __66__SSRVoiceProfile_getImplicitEnrollmentUtterancesPriorTo_forType___block_invoke;
    v15[3] = &unk_24CC85348;
    v16 = v6;
    objc_msgSend(v10, "predicateWithBlock:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[SSRVoiceProfile getImplicitEnrollmentUtterancesPriorTo:forType:]";
      _os_log_error_impl(&dword_2117D4000, v13, OS_LOG_TYPE_ERROR, "%s ERR: date is nil - Bailing out", buf, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

- (id)getImplicitEnrollmentUtterancesForType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v3 = 0;
  }
  else
  {
    -[SSRVoiceProfile voiceProfileAudioDirPathForSpidType:](self, "voiceProfileAudioDirPathForSpidType:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSRUtils getImplicitEnrollmentUtterancesFromDirectory:](SSRUtils, "getImplicitEnrollmentUtterancesFromDirectory:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)profileLocallyAvailable
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[SSRVoiceProfile getEnrollmentUtterancesForModelType:](self, "getEnrollmentUtterancesForModelType:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if ((CSIsCommunalDevice() & 1) == 0)
  {
    -[SSRVoiceProfile getEnrollmentUtterancesForModelType:](self, "getEnrollmentUtterancesForModelType:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 += objc_msgSend(v5, "count");

  }
  return v4 != 0;
}

- (NSString)voiceProfileBasePath
{
  return self->_profileBasePath;
}

- (NSString)voiceProfileImplicitCacheDirPath
{
  return -[NSString stringByAppendingPathComponent:](self->_profileBasePath, "stringByAppendingPathComponent:", CFSTR("audiocache"));
}

- (id)voiceProfileAudioDirPathForSpidType:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = 3;
  if (a3 != 4)
    v3 = a3;
  if (a3 == 5)
    v4 = 1;
  else
    v4 = v3;
  -[SSRVoiceProfile _voiceProfilePathForSpidType:](self, "_voiceProfilePathForSpidType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("audio"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)voiceProfileModelDirForSpidType:(unint64_t)a3 recognizerType:(unint64_t)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  -[SSRVoiceProfile _voiceProfilePathForSpidType:](self, "_voiceProfilePathForSpidType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4 == 1)
  {
    v7 = CFSTR("td-sr-model");
  }
  else
  {
    if (a4 != 2)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = CFSTR("model");
  }
  objc_msgSend(v5, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (id)_voiceProfilePathForSpidType:(unint64_t)a3
{
  NSString *v5;
  void *v6;

  if (objc_msgSend(MEMORY[0x24BE28488], "isDarwinOS"))
  {
    v5 = self->_profileBasePath;
  }
  else
  {
    +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](self->_profileBasePath, "stringByAppendingPathComponent:", v6);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)deleteModelForSpidType:(unint64_t)a3 recognizerType:(unint64_t)a4
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_log_t *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  os_log_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  -[SSRVoiceProfile voiceProfileModelDirForSpidType:recognizerType:](self, "voiceProfileModelDirForSpidType:recognizerType:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, 0);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v4, &v32);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v32;

    if (v9 || !v8)
    {
      v22 = (void *)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v24 = v22;
        objc_msgSend(v9, "localizedDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v34 = "-[SSRVoiceProfile deleteModelForSpidType:recognizerType:]";
        v35 = 2114;
        v36 = v4;
        v37 = 2114;
        v38 = v25;
        _os_log_error_impl(&dword_2117D4000, v24, OS_LOG_TYPE_ERROR, "%s Couldn't delete invalidated speaker model at path %{public}@ %{public}@", buf, 0x20u);

      }
    }
    else
    {
      v26 = v8;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v29;
        v14 = (os_log_t *)MEMORY[0x24BE284B8];
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v29 != v13)
              objc_enumerationMutation(v10);
            if (*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v15))
            {
              objc_msgSend(v4, "stringByAppendingPathComponent:");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = 0;
              objc_msgSend(v17, "removeItemAtPath:error:", v16, &v27);
              v18 = v27;

              if (v18)
              {
                v19 = *v14;
                if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
                {
                  v20 = v19;
                  objc_msgSend(v18, "localizedDescription");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315650;
                  v34 = "-[SSRVoiceProfile deleteModelForSpidType:recognizerType:]";
                  v35 = 2114;
                  v36 = v16;
                  v37 = 2114;
                  v38 = v21;
                  _os_log_error_impl(&dword_2117D4000, v20, OS_LOG_TYPE_ERROR, "%s Couldn't delete invalidated speaker model at path %{public}@ %{public}@", buf, 0x20u);

                  v14 = (os_log_t *)MEMORY[0x24BE284B8];
                }
              }

            }
            ++v15;
          }
          while (v12 != v15);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
        }
        while (v12);
      }

      v9 = 0;
      v8 = v26;
    }

  }
  return 1;
}

- (unint64_t)voiceProfileVersion
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;

  -[SSRVoiceProfile _getProfileVersionFilePath](self, "_getProfileVersionFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils readJsonFileAtPath:](SSRUtils, "readJsonFileAtPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VoiceProfileCompatabiltyVersion"));
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VoiceProfileCompatabiltyVersion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (int)objc_msgSend(v5, "intValue");

  }
  return v4;
}

- (NSString)voiceProfileIdentity
{
  void *v2;
  void *v3;

  -[SSRVoiceProfile _getProfileVersionFilePath](self, "_getProfileVersionFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils getVoiceProfileIdentityFromVersionFilePath:](SSRUtils, "getVoiceProfileIdentityFromVersionFilePath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)productCategory
{
  void *v2;
  unint64_t v3;

  -[SSRVoiceProfile _getProfileVersionFilePath](self, "_getProfileVersionFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SSRUtils getVoiceProfileProductCategoryFromVersionFilePath:](SSRUtils, "getVoiceProfileProductCategoryFromVersionFilePath:", v2);

  return v3;
}

- (BOOL)markSATEnrollmentSuccess
{
  -[SSRVoiceProfile _updateVoiceProfileVersionFile](self, "_updateVoiceProfileVersionFile");
  return -[SSRVoiceProfile _markSATEnrollmentWithMarker:](self, "_markSATEnrollmentWithMarker:", CFSTR("enrollment_completed"));
}

- (BOOL)markSATEnrollmentMigrated
{
  return -[SSRVoiceProfile _markSATEnrollmentWithMarker:](self, "_markSATEnrollmentWithMarker:", CFSTR("enrollment_migrated"));
}

- (BOOL)isMarkedSATMigrated
{
  return -[SSRVoiceProfile _isSATMarkedWithMarker:](self, "_isSATMarkedWithMarker:", CFSTR("enrollment_migrated"));
}

- (BOOL)isMarkedSATEnrolled
{
  return -[SSRVoiceProfile _isSATMarkedWithMarker:](self, "_isSATMarkedWithMarker:", CFSTR("enrollment_completed"));
}

- (BOOL)_isSATMarkedWithMarker:(id)a3
{
  NSString *v4;
  NSString *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  int v21;
  const char *v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = (NSString *)a3;
  v5 = self->_profileBasePath;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, 0))
  {
    -[NSString stringByAppendingPathComponent:](v5, "stringByAppendingPathComponent:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, 0))
    {
      if ((CSIsIOS() & 1) != 0 || CSIsCommunalDevice())
      {
        v8 = 1;
        v9 = 3;
      }
      else
      {
        v8 = 0;
        v9 = 1;
      }
      -[SSRVoiceProfile voiceProfileAudioDirPathForSpidType:](self, "voiceProfileAudioDirPathForSpidType:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSRVoiceProfile getEnrollmentUtterancesForModelType:](self, "getEnrollmentUtterancesForModelType:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");
      v16 = v15;
      if (v8 && v15 <= 4 && CSIsIOS())
      {
        if (-[SSRVoiceProfile getTDAudioCount](self, "getTDAudioCount"))
        {
          objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "postNotificationName:object:", CFSTR("com.apple.speakerrecognition.migrateTDprofile"), 0);

          v18 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
          {
            v21 = 136315138;
            v22 = "-[SSRVoiceProfile _isSATMarkedWithMarker:]";
            _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, "%s Notification sent to trigger TD voice profile migration", (uint8_t *)&v21, 0xCu);
          }
          goto LABEL_16;
        }
      }
      else if (v16)
      {
LABEL_16:

        v11 = 1;
        goto LABEL_22;
      }
      v19 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v21 = 136315906;
        v22 = "-[SSRVoiceProfile _isSATMarkedWithMarker:]";
        v23 = 2114;
        v24 = v4;
        v25 = 1026;
        v26 = 0;
        v27 = 2114;
        v28 = v13;
        _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, "%s ERR: Removing %{public}@ as explicit utterances %{public}d from audio dir - %{public}@", (uint8_t *)&v21, 0x26u);
      }
      objc_msgSend(v6, "removeItemAtPath:error:", v7, 0);

    }
LABEL_21:
    v11 = 0;
    goto LABEL_22;
  }
  v10 = *MEMORY[0x24BE284B8];
  v11 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315394;
    v22 = "-[SSRVoiceProfile _isSATMarkedWithMarker:]";
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s SAT path doesnt exist - %@", (uint8_t *)&v21, 0x16u);
    goto LABEL_21;
  }
LABEL_22:

  return v11;
}

- (unint64_t)getTDAudioCount
{
  void *v2;
  unint64_t v3;

  -[SSRVoiceProfile getEnrollmentUtterancesForModelType:](self, "getEnrollmentUtterancesForModelType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)_markSATEnrollmentWithMarker:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = self->_profileBasePath;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, 0))
    {
      -[NSString stringByAppendingPathComponent:](v5, "stringByAppendingPathComponent:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "createFileAtPath:contents:attributes:", v7, 0, 0);
      v9 = *MEMORY[0x24BE284B8];
      if ((v8 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        {
          v13 = 136315650;
          v14 = "-[SSRVoiceProfile _markSATEnrollmentWithMarker:]";
          v15 = 2114;
          v16 = v4;
          v17 = 2114;
          v18 = v7;
          _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Marked SAT enrollment %{public}@ at path %{public}@", (uint8_t *)&v13, 0x20u);
        }

        v10 = 1;
        goto LABEL_14;
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v13 = 136315650;
        v14 = "-[SSRVoiceProfile _markSATEnrollmentWithMarker:]";
        v15 = 2114;
        v16 = v4;
        v17 = 2114;
        v18 = v7;
        _os_log_error_impl(&dword_2117D4000, v9, OS_LOG_TYPE_ERROR, "%s Coudn't mark SAT enrollment %{public}@ at path %{public}@", (uint8_t *)&v13, 0x20u);
      }

    }
    else
    {
      v11 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v13 = 136315394;
        v14 = "-[SSRVoiceProfile _markSATEnrollmentWithMarker:]";
        v15 = 2114;
        v16 = v4;
        _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, "%s We can't mark SAT %{public}@ when there is no audio directory", (uint8_t *)&v13, 0x16u);
      }
    }
    v10 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v10 = 0;
LABEL_15:

  return v10;
}

- (id)_getProfileVersionFilePath
{
  return -[NSString stringByAppendingPathComponent:](self->_profileBasePath, "stringByAppendingPathComponent:", CFSTR("enrollment_version.json"));
}

- (void)_updateVoiceProfileVersionFile
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  char v26;
  void *v27;
  int v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  char v37;
  _QWORD v38[5];
  _QWORD v39[5];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  -[SSRVoiceProfile _getProfileVersionFilePath](self, "_getProfileVersionFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend(MEMORY[0x24BE28488], "deviceProductType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = +[SSRUtils deviceCategoryForDeviceProductType:](SSRUtils, "deviceCategoryForDeviceProductType:", v4)) == 0)
  {
    v6 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[SSRVoiceProfile _updateVoiceProfileVersionFile]";
      v42 = 2114;
      v43 = v4;
      _os_log_error_impl(&dword_2117D4000, v6, OS_LOG_TYPE_ERROR, "%s ERR: Unknown device-category for device: %{public}@", buf, 0x16u);
    }
    v5 = 0;
  }
  if (objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v2, &v37))
    v7 = v37 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    v38[0] = CFSTR("VoiceProfileCompatabiltyVersion");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v8;
    v38[1] = CFSTR("VoiceProfileProductType");
    objc_msgSend(MEMORY[0x24BE28488], "deviceProductType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v9;
    v38[2] = CFSTR("VoiceProfileSWVersion");
    objc_msgSend(MEMORY[0x24BE28488], "deviceBuildVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v10;
    v38[3] = CFSTR("VoiceProfileCategoryType");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v11;
    v38[4] = CFSTR("VoiceProfileIdentifier");
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
    v35 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v14, 1, &v35);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v35;
    v25 = v24;
    if (!v23 || v24)
    {
      v29 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v41 = "-[SSRVoiceProfile _updateVoiceProfileVersionFile]";
        v42 = 2112;
        v43 = v14;
        v44 = 2112;
        v45 = v25;
        v30 = "%s ERR: error creating updatedVoiceProfileJsonData from: %@, err: %@";
        goto LABEL_36;
      }
    }
    else if (!objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v2, &v37)
           || v37
           || (v34 = 0,
               v26 = objc_msgSend(v3, "removeItemAtPath:error:", v2, &v34),
               v25 = v34,
               (v26 & 1) != 0))
    {
      v27 = v25;
      v33 = v25;
      v28 = objc_msgSend(v23, "writeToFile:options:error:", v2, 0, &v33);
      v25 = v33;

      if (v28 && !v25)
        goto LABEL_26;
      v29 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v41 = "-[SSRVoiceProfile _updateVoiceProfileVersionFile]";
        v42 = 2112;
        v43 = v2;
        v44 = 2112;
        v45 = v25;
        v30 = "%s ERR: Error writing voice profile version file at: %@, err:%@";
LABEL_36:
        _os_log_error_impl(&dword_2117D4000, v29, OS_LOG_TYPE_ERROR, v30, buf, 0x20u);
      }
    }
    else
    {
      v29 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v41 = "-[SSRVoiceProfile _updateVoiceProfileVersionFile]";
        v42 = 2112;
        v43 = v2;
        v44 = 2112;
        v45 = v25;
        v30 = "%s ERR: error removing voice profile version file at: %@, err: %@";
        goto LABEL_36;
      }
    }

LABEL_26:
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v2);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    v36 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v15, 0, &v36);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v36;
    v18 = v17;
    if (v9 && !v17)
    {

      v8 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKey:", v19, CFSTR("VoiceProfileCompatabiltyVersion"));

      objc_msgSend(MEMORY[0x24BE28488], "deviceProductType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKey:", v20, CFSTR("VoiceProfileProductType"));

      objc_msgSend(MEMORY[0x24BE28488], "deviceBuildVersion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKey:", v21, CFSTR("VoiceProfileSWVersion"));

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKey:", v22, CFSTR("VoiceProfileCategoryType"));

      v14 = (void *)objc_msgSend(v8, "copy");
      goto LABEL_15;
    }
    v32 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v41 = "-[SSRVoiceProfile _updateVoiceProfileVersionFile]";
      v42 = 2112;
      v43 = v2;
      v44 = 2112;
      v45 = v18;
      _os_log_error_impl(&dword_2117D4000, v32, OS_LOG_TYPE_ERROR, "%s Could not read existing %@ file: err: %@", buf, 0x20u);
    }

  }
  else
  {
    v31 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[SSRVoiceProfile _updateVoiceProfileVersionFile]";
      v42 = 2112;
      v43 = v2;
      _os_log_error_impl(&dword_2117D4000, v31, OS_LOG_TYPE_ERROR, "%s Unable to read data from file: %@", buf, 0x16u);
    }
  }
LABEL_32:

}

- (NSString)pruningCookie
{
  void *v2;
  void *v3;
  void *v4;

  -[SSRVoiceProfile _getProfileVersionFilePath](self, "_getProfileVersionFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils readJsonFileAtPath:](SSRUtils, "readJsonFileAtPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VoiceProfilePruningCookie"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VoiceProfilePruningCookie"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v4;
}

- (BOOL)updatePruningCookie:(id)a3
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
  id v13;
  BOOL v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  BOOL v18;
  char v19;
  void *v20;
  int v21;
  id v23;
  id v24;
  id v25;
  char v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRVoiceProfile _getProfileVersionFilePath](self, "_getProfileVersionFilePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils readJsonFileAtPath:](SSRUtils, "readJsonFileAtPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v26 = 0;
  if (v7)
  {
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, CFSTR("VoiceProfilePruningCookie"));
    v10 = (void *)MEMORY[0x24BDD1608];
    v11 = (void *)objc_msgSend(v9, "copy");
    v25 = 0;
    objc_msgSend(v10, "dataWithJSONObject:options:error:", v11, 1, &v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v25;

    if (v12)
      v14 = v13 == 0;
    else
      v14 = 0;
    if (!v14)
    {
      v15 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v28 = "-[SSRVoiceProfile updatePruningCookie:]";
        v29 = 2112;
        v30 = v8;
        v31 = 2112;
        v32 = v13;
        v16 = "%s ERR: error updating updatedVoiceProfileJsonData from: %@, err: %@";
LABEL_21:
        _os_log_error_impl(&dword_2117D4000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x20u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v26))
    {
      v24 = 0;
      v19 = objc_msgSend(v5, "removeItemAtPath:error:", v6, &v24);
      v13 = v24;
      if ((v19 & 1) == 0)
      {
        v15 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v28 = "-[SSRVoiceProfile updatePruningCookie:]";
          v29 = 2112;
          v30 = v6;
          v31 = 2112;
          v32 = v13;
          v16 = "%s ERR: error removing voice profile version file at: %@, err: %@";
          goto LABEL_21;
        }
LABEL_22:
        v18 = 0;
        goto LABEL_23;
      }
    }
    else
    {
      v13 = 0;
    }
    v20 = v13;
    v23 = v13;
    v21 = objc_msgSend(v12, "writeToFile:options:error:", v6, 0, &v23);
    v13 = v23;

    if (v21 && !v13)
    {
      v18 = 1;
LABEL_23:

      goto LABEL_24;
    }
    v15 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v28 = "-[SSRVoiceProfile updatePruningCookie:]";
      v29 = 2112;
      v30 = v6;
      v31 = 2112;
      v32 = v13;
      v16 = "%s ERR: Error writing voice profile version file at: %@, err:%@";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  v17 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[SSRVoiceProfile updatePruningCookie:]";
    _os_log_error_impl(&dword_2117D4000, v17, OS_LOG_TYPE_ERROR, "%s ERR: Profile dict is nil - Bailing out", buf, 0xCu);
  }
  v13 = 0;
  v9 = 0;
  v18 = 0;
LABEL_24:

  return v18;
}

- (void)updateVoiceProfilePathExclave:(id)a3
{
  objc_storeStrong((id *)&self->_profileBasePathExclave, a3);
}

- (id)voiceProfilePathExclave
{
  return self->_profileBasePathExclave;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSString)appDomain
{
  return self->_appDomain;
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (NSString)profileID
{
  return self->_profileID;
}

- (NSString)siriProfileId
{
  return self->_siriProfileId;
}

- (NSString)profileBasePath
{
  return self->_profileBasePath;
}

- (void)setProfileBasePath:(id)a3
{
  objc_storeStrong((id *)&self->_profileBasePath, a3);
}

- (NSString)profileBasePathExclave
{
  return self->_profileBasePathExclave;
}

- (void)setProfileBasePathExclave:(id)a3
{
  objc_storeStrong((id *)&self->_profileBasePathExclave, a3);
}

- (NSNumber)profilePitch
{
  return self->_profilePitch;
}

- (void)setProfilePitch:(id)a3
{
  objc_storeStrong((id *)&self->_profilePitch, a3);
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
  objc_storeStrong((id *)&self->_profilePitch, 0);
  objc_storeStrong((id *)&self->_profileBasePathExclave, 0);
  objc_storeStrong((id *)&self->_profileBasePath, 0);
  objc_storeStrong((id *)&self->_siriProfileId, 0);
  objc_storeStrong((id *)&self->_profileID, 0);
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_appDomain, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

uint64_t __66__SSRVoiceProfile_getImplicitEnrollmentUtterancesPriorTo_forType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("wav"));

  if (!v5)
    goto LABEL_9;
  objc_msgSend(v3, "URLByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathExtension:", CFSTR("json"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[SSRVoiceProfileMetadataManager recordedTimeStampOfFile:](SSRVoiceProfileMetadataManager, "recordedTimeStampOfFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[SSRVoiceProfileMetadataManager isUtteranceImplicitlyTrained:](SSRVoiceProfileMetadataManager, "isUtteranceImplicitlyTrained:", v7)|| !v8|| (objc_msgSend(v8, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32)), v9 >= 0.0))
  {

LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v10 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "-[SSRVoiceProfile getImplicitEnrollmentUtterancesPriorTo:forType:]_block_invoke";
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s Filtered %@ with enrolled date %@", (uint8_t *)&v13, 0x20u);
  }

  v11 = 1;
LABEL_10:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
