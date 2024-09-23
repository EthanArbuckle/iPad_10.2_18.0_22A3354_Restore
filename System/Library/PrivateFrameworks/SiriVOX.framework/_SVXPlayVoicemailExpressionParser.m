@implementation _SVXPlayVoicemailExpressionParser

- (void)parsePlayVoicemail:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (os_log_t *)MEMORY[0x24BE08FB0];
    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[_SVXPlayVoicemailExpressionParser parsePlayVoicemail:reply:]";
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s Looking for parseable expressions in command %@", buf, 0x16u);
    }
    v10 = objc_alloc_init(MEMORY[0x24BE81908]);
    v11 = objc_alloc_init(MEMORY[0x24BE814E8]);
    objc_msgSend(v6, "voiceMailId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIdentifier:", v12);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAceId:", v14);

    objc_msgSend(v10, "setAttachmentExpression:", v11);
    objc_msgSend(v10, "setContext:", v11);
    objc_msgSend(v6, "targetDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = *v8;
    v18 = os_log_type_enabled(*v8, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v18)
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[_SVXPlayVoicemailExpressionParser parsePlayVoicemail:reply:]";
        v27 = 2112;
        v28 = v10;
        _os_log_impl(&dword_214934000, v17, OS_LOG_TYPE_INFO, "%s Parsing expression with parsing service: %@", buf, 0x16u);
      }
      -[_SVXExpressionParser parsingService](self, "parsingService");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __62___SVXPlayVoicemailExpressionParser_parsePlayVoicemail_reply___block_invoke;
      v21[3] = &unk_24D24D118;
      v23 = v7;
      v22 = v10;
      objc_msgSend(v19, "parseExpressions:targetDevice:reply:", v20, v15, v21);

    }
    else
    {
      if (v18)
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[_SVXPlayVoicemailExpressionParser parsePlayVoicemail:reply:]";
        v27 = 2112;
        v28 = v6;
        _os_log_impl(&dword_214934000, v17, OS_LOG_TYPE_INFO, "%s No expression to parse for PlayVoicemail: %@", buf, 0x16u);
      }
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }

  }
}

@end
