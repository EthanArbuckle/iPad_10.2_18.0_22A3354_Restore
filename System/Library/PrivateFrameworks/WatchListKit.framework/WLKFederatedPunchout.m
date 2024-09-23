@implementation WLKFederatedPunchout

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  id v13;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  -[WLKFederatedPunchout channelID](self, "channelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WLKFederatedPunchout.channelID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WLKFederatedPunchout isConsented](self, "isConsented"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WLKFederatedPunchout.consented"));

  -[WLKFederatedPunchout bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("WLKFederatedPunchout.bundleID"));

  -[WLKFederatedPunchout appAdamID](self, "appAdamID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("WLKFederatedPunchout.appAdamID"));

  -[WLKFederatedPunchout url](self, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("WLKFederatedPunchout.url"));

  -[WLKFederatedPunchout externalContentID](self, "externalContentID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("WLKFederatedPunchout.externalContentID"));

  -[WLKFederatedPunchout canonicalID](self, "canonicalID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("WLKFederatedPunchout.canonicalID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WLKFederatedPunchout resumeTimeSeconds](self, "resumeTimeSeconds"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("WLKFederatedPunchout.resumeTimeSeconds"));

  -[WLKFederatedPunchout punchoutTime](self, "punchoutTime");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("WLKFederatedPunchout.punchoutTime"));

}

- (WLKFederatedPunchout)initWithCoder:(id)a3
{
  id v4;
  WLKFederatedPunchout *v5;
  uint64_t v6;
  NSString *channelID;
  void *v8;
  uint64_t v9;
  NSString *bundleID;
  uint64_t v11;
  NSString *appAdamID;
  uint64_t v13;
  NSURL *url;
  uint64_t v15;
  NSString *externalContentID;
  uint64_t v17;
  NSString *canonicalID;
  void *v19;
  uint64_t v20;
  NSDate *punchoutTime;
  objc_super v23;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  v23.receiver = self;
  v23.super_class = (Class)WLKFederatedPunchout;
  v5 = -[WLKFederatedPunchout init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKFederatedPunchout.channelID"));
    v6 = objc_claimAutoreleasedReturnValue();
    channelID = v5->_channelID;
    v5->_channelID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKFederatedPunchout.consented"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_consented = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKFederatedPunchout.bundleID"));
    v9 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKFederatedPunchout.appAdamID"));
    v11 = objc_claimAutoreleasedReturnValue();
    appAdamID = v5->_appAdamID;
    v5->_appAdamID = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKFederatedPunchout.url"));
    v13 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKFederatedPunchout.externalContentID"));
    v15 = objc_claimAutoreleasedReturnValue();
    externalContentID = v5->_externalContentID;
    v5->_externalContentID = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKFederatedPunchout.canonicalID"));
    v17 = objc_claimAutoreleasedReturnValue();
    canonicalID = v5->_canonicalID;
    v5->_canonicalID = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKFederatedPunchout.resumeTimeSeconds"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_resumeTimeSeconds = objc_msgSend(v19, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKFederatedPunchout.punchoutTime"));
    v20 = objc_claimAutoreleasedReturnValue();
    punchoutTime = v5->_punchoutTime;
    v5->_punchoutTime = (NSDate *)v20;

  }
  return v5;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
  objc_storeStrong((id *)&self->_channelID, a3);
}

- (BOOL)isConsented
{
  return self->_consented;
}

- (void)setConsented:(BOOL)a3
{
  self->_consented = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)appAdamID
{
  return self->_appAdamID;
}

- (void)setAppAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_appAdamID, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)externalContentID
{
  return self->_externalContentID;
}

- (void)setExternalContentID:(id)a3
{
  objc_storeStrong((id *)&self->_externalContentID, a3);
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
  objc_storeStrong((id *)&self->_canonicalID, a3);
}

- (unint64_t)resumeTimeSeconds
{
  return self->_resumeTimeSeconds;
}

- (void)setResumeTimeSeconds:(unint64_t)a3
{
  self->_resumeTimeSeconds = a3;
}

- (NSDate)punchoutTime
{
  return self->_punchoutTime;
}

- (void)setPunchoutTime:(id)a3
{
  objc_storeStrong((id *)&self->_punchoutTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchoutTime, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_storeStrong((id *)&self->_externalContentID, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_appAdamID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
}

@end
