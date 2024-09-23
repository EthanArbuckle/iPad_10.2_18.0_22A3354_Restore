@implementation VoiceDialFacetimeRecognitionAction

- (VoiceDialFacetimeRecognitionAction)initWithContactInfo:(id)a3 uid:(int)a4
{
  id v7;
  VoiceDialFacetimeRecognitionAction *v8;
  VoiceDialFacetimeRecognitionAction *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VoiceDialFacetimeRecognitionAction;
  v8 = -[VoiceDialFacetimeRecognitionAction init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contactInfo, a3);
    v9->_abID = a4;
  }

  return v9;
}

- (id)perform
{
  void *v3;
  NSObject *v4;
  NSString *contactInfo;
  int abID;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  objc_super v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[VSRecognitionURLAction URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    PHDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      contactInfo = self->_contactInfo;
      abID = self->_abID;
      *(_DWORD *)buf = 138412546;
      v21 = contactInfo;
      v22 = 1024;
      LODWORD(v23) = abID;
      _os_log_impl(&dword_21DBE2000, v4, OS_LOG_TYPE_DEFAULT, "Performing FaceTime voice dial for destination ID %@ and address book record ID %d", buf, 0x12u);
    }

    v7 = objc_alloc_init(MEMORY[0x24BDBACF8]);
    objc_msgSend(v7, "contactFromPersonID:keysToFetch:", self->_abID, MEMORY[0x24BDBD1A8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x24BEB4950]);
    v11 = objc_alloc(MEMORY[0x24BEB49D0]);
    objc_msgSend(v10, "faceTimeProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithProvider:", v12);

    objc_msgSend(MEMORY[0x24BEB49E8], "handleWithDestinationID:", self->_contactInfo);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHandle:", v14);

    objc_msgSend(v13, "setContactIdentifier:", v9);
    PHDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = (NSString *)v13;
      v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_21DBE2000, v15, OS_LOG_TYPE_DEFAULT, "Using dial request %@ to set URL %@", buf, 0x16u);

    }
    objc_msgSend(v13, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSRecognitionURLAction setURL:](self, "setURL:", v17);

  }
  v19.receiver = self;
  v19.super_class = (Class)VoiceDialFacetimeRecognitionAction;
  -[VSRecognitionURLAction perform](&v19, sel_perform);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactInfo, 0);
}

@end
