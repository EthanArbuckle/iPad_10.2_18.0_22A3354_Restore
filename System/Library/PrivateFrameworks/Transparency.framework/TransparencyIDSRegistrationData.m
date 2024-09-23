@implementation TransparencyIDSRegistrationData

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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  -[TransparencyIDSRegistrationData application](self, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("application"));

  -[TransparencyIDSRegistrationData tbsKTIDSRegistrationData](self, "tbsKTIDSRegistrationData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("registrationData"));

  -[TransparencyIDSRegistrationData signature](self, "signature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("signature"));

  -[TransparencyIDSRegistrationData publicKey](self, "publicKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("publicKey"));

  -[TransparencyIDSRegistrationData pushToken](self, "pushToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("pushToken"));

  -[TransparencyIDSRegistrationData state](self, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("state"));

  -[TransparencyIDSRegistrationData error](self, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("error"));

  -[TransparencyIDSRegistrationData createdAt](self, "createdAt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("createdAt"));

  -[TransparencyIDSRegistrationData signedAt](self, "signedAt");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("signedAt"));

  -[TransparencyIDSRegistrationData uploadedAt](self, "uploadedAt");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("uploadedAt"));

  -[TransparencyIDSRegistrationData nextRetryAt](self, "nextRetryAt");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("nextRetryAt"));

  -[TransparencyIDSRegistrationData orderedTimestamp](self, "orderedTimestamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("orderedTimestamp"));

  -[TransparencyIDSRegistrationData altDSID](self, "altDSID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("altDSID"));

  -[TransparencyIDSRegistrationData dsid](self, "dsid");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("dsid"));

}

- (TransparencyIDSRegistrationData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
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
  void *v19;
  void *v20;
  TransparencyIDSRegistrationData *v21;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("application"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("registrationData"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8
    || (self = -[TransparencyIDSRegistrationData initWithApplication:registrationData:](self, "initWithApplication:registrationData:", v5, v6)) == 0)
  {
    v21 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyIDSRegistrationData setSignature:](self, "setSignature:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyIDSRegistrationData setPublicKey:](self, "setPublicKey:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pushToken"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyIDSRegistrationData setPushToken:](self, "setPushToken:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyIDSRegistrationData setState:](self, "setState:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyIDSRegistrationData setError:](self, "setError:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createdAt"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyIDSRegistrationData setCreatedAt:](self, "setCreatedAt:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signedAt"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyIDSRegistrationData setSignedAt:](self, "setSignedAt:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nextRetryAt"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyIDSRegistrationData setNextRetryAt:](self, "setNextRetryAt:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uploadedAt"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyIDSRegistrationData setUploadedAt:](self, "setUploadedAt:", v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orderedTimestamp"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyIDSRegistrationData setOrderedTimestamp:](self, "setOrderedTimestamp:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyIDSRegistrationData setAltDSID:](self, "setAltDSID:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dsid"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyIDSRegistrationData setDsid:](self, "setDsid:", v20);

    self = self;
    v21 = self;
  }

  return v21;
}

- (TransparencyIDSRegistrationData)initWithApplication:(id)a3 registrationData:(id)a4
{
  id v6;
  id v7;
  TransparencyIDSRegistrationData *v8;
  TransparencyIDSRegistrationData *v9;
  TransparencyIDSRegistrationData *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TransparencyIDSRegistrationData;
  v8 = -[TransparencyIDSRegistrationData init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[TransparencyIDSRegistrationData setApplication:](v8, "setApplication:", v6);
    -[TransparencyIDSRegistrationData setTbsKTIDSRegistrationData:](v9, "setTbsKTIDSRegistrationData:", v7);
    -[TransparencyIDSRegistrationData setPushToken:](v9, "setPushToken:", 0);
    v10 = v9;
  }

  return v9;
}

- (id)humanDiagnosticsString
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v15 = (void *)MEMORY[0x24BDD17C8];
  -[TransparencyIDSRegistrationData application](self, "application");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TransparencyIDSRegistrationData signature](self, "signature");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TransparencyIDSRegistrationData createdAt](self, "createdAt");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TransparencyIDSRegistrationData signedAt](self, "signedAt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TransparencyIDSRegistrationData uploadedAt](self, "uploadedAt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TransparencyIDSRegistrationData altDSID](self, "altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TransparencyIDSRegistrationData dsid](self, "dsid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TransparencyIDSRegistrationData pushToken](self, "pushToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "kt_hexString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("app: %@ sig: %d created: %@ signed: %@ uploaded: %@ altDSID: %@[%@] push: %@"), v14, v17 != 0, v3, v5, v7, v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)diagnosticsJsonDictionary
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[10];
  _QWORD v35[12];

  v35[10] = *MEMORY[0x24BDAC8D0];
  v34[0] = CFSTR("app");
  -[TransparencyIDSRegistrationData application](self, "application");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v33;
  v34[1] = CFSTR("signature");
  -[TransparencyIDSRegistrationData signature](self, "signature");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "kt_hexString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v31;
  v34[2] = CFSTR("tbs");
  -[TransparencyIDSRegistrationData tbsKTIDSRegistrationData](self, "tbsKTIDSRegistrationData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "kt_hexString");
  v3 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v3;
  if (v3)
    v4 = (const __CFString *)v3;
  else
    v4 = CFSTR("-");
  v35[2] = v4;
  v34[3] = CFSTR("createdAt");
  -[TransparencyIDSRegistrationData createdAt](self, "createdAt");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "description");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("-");
  v35[3] = v7;
  v34[4] = CFSTR("signedAt");
  -[TransparencyIDSRegistrationData signedAt](self, "signedAt");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "description");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("-");
  v35[4] = v10;
  v34[5] = CFSTR("uploadedAt");
  -[TransparencyIDSRegistrationData uploadedAt](self, "uploadedAt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "description");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("-");
  v35[5] = v14;
  v34[6] = CFSTR("publicKey");
  -[TransparencyIDSRegistrationData publicKey](self, "publicKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "kt_hexString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v16;
  v34[7] = CFSTR("altDSID");
  -[TransparencyIDSRegistrationData altDSID](self, "altDSID");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = CFSTR("-");
  v35[7] = v19;
  v34[8] = CFSTR("dsid");
  -[TransparencyIDSRegistrationData dsid](self, "dsid");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (const __CFString *)v20;
  else
    v22 = CFSTR("-");
  v35[8] = v22;
  v34[9] = CFSTR("pushToken");
  -[TransparencyIDSRegistrationData pushToken](self, "pushToken");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "kt_hexString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 10);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSData)tbsKTIDSRegistrationData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTbsKTIDSRegistrationData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSignature:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)publicKey
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPublicKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSData)pushToken
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPushToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDate)orderedTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOrderedTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)state
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDate)createdAt
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCreatedAt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDate)signedAt
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSignedAt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDate)uploadedAt
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUploadedAt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSDate)nextRetryAt
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNextRetryAt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDsid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_nextRetryAt, 0);
  objc_storeStrong((id *)&self->_uploadedAt, 0);
  objc_storeStrong((id *)&self->_signedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_orderedTimestamp, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_tbsKTIDSRegistrationData, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end
