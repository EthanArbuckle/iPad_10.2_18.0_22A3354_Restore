@implementation SVXVoiceMailMarkAsReadHandler

- (SVXVoiceMailMarkAsReadHandler)init
{
  SVXAFClientLiteFactory *v3;
  SVXPlistBinaryParser *v4;
  SVXVoiceMailMarkAsReadHandler *v5;

  v3 = objc_alloc_init(SVXAFClientLiteFactory);
  v4 = objc_alloc_init(SVXPlistBinaryParser);
  v5 = -[SVXVoiceMailMarkAsReadHandler initWithClientLiteFactory:plistBinaryParser:](self, "initWithClientLiteFactory:plistBinaryParser:", v3, v4);

  return v5;
}

- (SVXVoiceMailMarkAsReadHandler)initWithClientLiteFactory:(id)a3 plistBinaryParser:(id)a4
{
  id v7;
  id v8;
  SVXVoiceMailMarkAsReadHandler *v9;
  SVXVoiceMailMarkAsReadHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXVoiceMailMarkAsReadHandler;
  v9 = -[SVXVoiceMailMarkAsReadHandler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_afClientLiteFactory, a3);
    objc_storeStrong((id *)&v10->_plistBinaryParser, a4);
  }

  return v10;
}

- (void)markVoiceMailAsRead:(id)a3 forRemoteDevice:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  SVXPlistBinaryParser *plistBinaryParser;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[SVXVoiceMailMarkAsReadHandler markVoiceMailAsRead:forRemoteDevice:]";
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  v10 = objc_alloc_init(MEMORY[0x24BE814E8]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAceId:", v12);

  objc_msgSend(v10, "setIdentifier:", v6);
  v13 = objc_alloc_init(MEMORY[0x24BE810F0]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAceId:", v15);

  objc_msgSend(v13, "setObject:", v10);
  plistBinaryParser = self->_plistBinaryParser;
  objc_msgSend(v13, "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  -[SVXPlistBinaryParser dataWithPropertyList:format:options:error:](plistBinaryParser, "dataWithPropertyList:format:options:error:", v17, 200, 0, &v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v25;

  if (v18)
  {
    v20 = objc_alloc_init(MEMORY[0x24BE81260]);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAceId:", v22);

    objc_msgSend(v20, "setSerializedCommand:", v18);
    objc_msgSend(v20, "setRemoteDevice:", v7);
    -[SVXAFClientLiteFactory create](self->_afClientLiteFactory, "create");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleCommand:afterCurrentRequest:commandHandler:completion:", v20, 0, 0, &__block_literal_global_2872);

  }
  else
  {
    v24 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[SVXVoiceMailMarkAsReadHandler markVoiceMailAsRead:forRemoteDevice:]";
      v28 = 2112;
      v29 = v19;
      _os_log_error_impl(&dword_214934000, v24, OS_LOG_TYPE_ERROR, "%s Serialization failed: %@", buf, 0x16u);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistBinaryParser, 0);
  objc_storeStrong((id *)&self->_afClientLiteFactory, 0);
}

void __69__SVXVoiceMailMarkAsReadHandler_markVoiceMailAsRead_forRemoteDevice___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[SVXVoiceMailMarkAsReadHandler markVoiceMailAsRead:forRemoteDevice:]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_error_impl(&dword_214934000, v5, OS_LOG_TYPE_ERROR, "%s Error marking voicemail as read: %@", (uint8_t *)&v6, 0x16u);
    }
  }

}

@end
