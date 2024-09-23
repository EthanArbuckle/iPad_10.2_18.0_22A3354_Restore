@implementation VoiceDialRecognitionAction

- (VoiceDialRecognitionAction)initWithPhoneNumber:(id)a3 uid:(int)a4
{
  id v7;
  VoiceDialRecognitionAction *v8;

  v7 = a3;
  v8 = -[VoiceDialRecognitionAction init](self, "init");
  if (v8)
  {
    if (objc_msgSend(v7, "length"))
    {
      objc_storeStrong((id *)&v8->_phoneNumber, a3);
      v8->_uid = a4;
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

- (id)perform
{
  void *v3;
  NSObject *v4;
  int uid;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  VoiceDialNumberToDialForNumber(self->_phoneNumber);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PHDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uid = self->_uid;
    *(_DWORD *)buf = 138412546;
    v21 = v3;
    v22 = 1024;
    LODWORD(v23) = uid;
    _os_log_impl(&dword_21DBE2000, v4, OS_LOG_TYPE_DEFAULT, "Performing voice dial for phone number %@ and address book record ID %d", buf, 0x12u);
  }

  v6 = objc_alloc_init(MEMORY[0x24BDBACF8]);
  objc_msgSend(v6, "contactFromPersonID:keysToFetch:", self->_uid, MEMORY[0x24BDBD1A8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BEB4950]);
  v10 = objc_alloc(MEMORY[0x24BEB49D0]);
  objc_msgSend(v9, "telephonyProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithProvider:", v11);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB49E8]), "initWithType:value:", 2, v3);
  objc_msgSend(v12, "setHandle:", v13);

  objc_msgSend(v12, "setContactIdentifier:", v8);
  PHDefaultLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v12;
    v22 = 2112;
    v23 = v15;
    _os_log_impl(&dword_21DBE2000, v14, OS_LOG_TYPE_DEFAULT, "Using dial request %@ to set URL %@", buf, 0x16u);

  }
  objc_msgSend(v12, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSRecognitionURLAction setURL:](self, "setURL:", v16);

  v19.receiver = self;
  v19.super_class = (Class)VoiceDialRecognitionAction;
  -[VSRecognitionURLAction perform](&v19, sel_perform);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end
