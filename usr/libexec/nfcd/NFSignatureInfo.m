@implementation NFSignatureInfo

- (NFSignatureInfo)initWithDictionary:(id)a3
{
  id v4;
  NFSignatureInfo *v5;
  uint64_t v6;
  NSString *rsaCert;
  uint64_t v8;
  NSString *eccCert;
  uint64_t v10;
  NSString *eckaCert;
  uint64_t v12;
  NSString *seid;
  uint64_t v14;
  NSString *platformId;
  uint64_t v16;
  NSString *jsblCounter;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NFSignatureInfo;
  v5 = -[NFSignatureInfo init](&v20, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rsa")));
    rsaCert = v5->_rsaCert;
    v5->_rsaCert = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ecc")));
    eccCert = v5->_eccCert;
    v5->_eccCert = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ecka")));
    eckaCert = v5->_eckaCert;
    v5->_eckaCert = (NSString *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("seid")));
    seid = v5->_seid;
    v5->_seid = (NSString *)v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platformid")));
    platformId = v5->_platformId;
    v5->_platformId = (NSString *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("jsblCounter")));
    jsblCounter = v5->_jsblCounter;
    v5->_jsblCounter = (NSString *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("certVersion")));
    v5->_certificateVersion = (unint64_t)objc_msgSend(v18, "unsignedIntegerValue");

  }
  return v5;
}

- (id)description
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *jsblCounter;
  const __CFString *seid;
  const __CFString *platformId;
  id v10;
  objc_super v12;

  v3 = objc_alloc((Class)NSString);
  v12.receiver = self;
  v12.super_class = (Class)NFSignatureInfo;
  v4 = -[NFSignatureInfo description](&v12, "description");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)v5;
  jsblCounter = &stru_1002ED8A8;
  seid = (const __CFString *)self->_seid;
  platformId = (const __CFString *)self->_platformId;
  if (!seid)
    seid = &stru_1002ED8A8;
  if (!platformId)
    platformId = &stru_1002ED8A8;
  if (self->_jsblCounter)
    jsblCounter = (const __CFString *)self->_jsblCounter;
  v10 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ { seid=%@ platformId=%@ jsblCounter=%@ certificateVersion=%lu }"), v5, seid, platformId, jsblCounter, self->_certificateVersion);

  return v10;
}

- (NFSignatureInfo)initWithCoder:(id)a3
{
  id v4;
  NFSignatureInfo *v5;
  id v6;
  uint64_t v7;
  NSString *rsaCert;
  id v9;
  uint64_t v10;
  NSString *eccCert;
  id v12;
  uint64_t v13;
  NSString *eckaCert;
  id v15;
  uint64_t v16;
  NSString *seid;
  id v18;
  uint64_t v19;
  NSString *platformId;
  id v21;
  uint64_t v22;
  NSString *jsblCounter;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NFSignatureInfo;
  v5 = -[NFSignatureInfo init](&v25, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("rsa"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    rsaCert = v5->_rsaCert;
    v5->_rsaCert = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("ecc"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    eccCert = v5->_eccCert;
    v5->_eccCert = (NSString *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("ecka"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    eckaCert = v5->_eckaCert;
    v5->_eckaCert = (NSString *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("seid"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    seid = v5->_seid;
    v5->_seid = (NSString *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("platformid"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    platformId = v5->_platformId;
    v5->_platformId = (NSString *)v19;

    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("jsblCounter"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    jsblCounter = v5->_jsblCounter;
    v5->_jsblCounter = (NSString *)v22;

    v5->_certificateVersion = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("certVersion"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *rsaCert;
  id v5;

  rsaCert = self->_rsaCert;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", rsaCert, CFSTR("rsa"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eccCert, CFSTR("ecc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eckaCert, CFSTR("ecka"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_seid, CFSTR("seid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_platformId, CFSTR("platformid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_jsblCounter, CFSTR("jsblCounter"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_certificateVersion, CFSTR("certVersion"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)rsaCert
{
  return self->_rsaCert;
}

- (NSString)eccCert
{
  return self->_eccCert;
}

- (NSString)eckaCert
{
  return self->_eckaCert;
}

- (NSString)seid
{
  return self->_seid;
}

- (NSString)platformId
{
  return self->_platformId;
}

- (NSString)jsblCounter
{
  return self->_jsblCounter;
}

- (unint64_t)certificateVersion
{
  return self->_certificateVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsblCounter, 0);
  objc_storeStrong((id *)&self->_platformId, 0);
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_eckaCert, 0);
  objc_storeStrong((id *)&self->_eccCert, 0);
  objc_storeStrong((id *)&self->_rsaCert, 0);
}

@end
