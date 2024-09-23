@implementation _SVXPlayAudioExpressionParser

- (void)parsePlayAudio:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (os_log_t *)MEMORY[0x24BE08FB0];
    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[_SVXPlayAudioExpressionParser parsePlayAudio:reply:]";
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s Looking for parseable expressions in command %@", buf, 0x16u);
    }
    v10 = objc_alloc_init(MEMORY[0x24BE81908]);
    objc_msgSend(v6, "message");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAceId:", v13);

    objc_msgSend(v10, "setAttachmentExpression:", v11);
    objc_msgSend(v10, "setContext:", v11);
    if (v11)
    {
      objc_msgSend(v11, "groupIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[_SVXSpeakableNamespaceDomainOccurrenceProvider providerForDomain:](_SVXSpeakableNamespaceDomainOccurrenceProvider, "providerForDomain:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0
        && (objc_msgSend(v15, "attachmentURLForExpression:", *MEMORY[0x24BE82518]),
            (v16 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v17 = (void *)v16;
        v18 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v28 = "-[_SVXPlayAudioExpressionParser parsePlayAudio:reply:]";
          v29 = 2112;
          v30 = v11;
          _os_log_impl(&dword_214934000, v18, OS_LOG_TYPE_INFO, "%s Expression doesn't require remote parse: %@", buf, 0x16u);
        }
        (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
      }
      else
      {
        v19 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v28 = "-[_SVXPlayAudioExpressionParser parsePlayAudio:reply:]";
          v29 = 2112;
          v30 = v10;
          _os_log_impl(&dword_214934000, v19, OS_LOG_TYPE_INFO, "%s Parsing expression with parsing service: %@", buf, 0x16u);
        }
        -[_SVXExpressionParser parsingService](self, "parsingService");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __54___SVXPlayAudioExpressionParser_parsePlayAudio_reply___block_invoke;
        v23[3] = &unk_24D24D118;
        v25 = v7;
        v24 = v10;
        objc_msgSend(v20, "parseExpressions:targetDevice:reply:", v21, 0, v23);

        v17 = v25;
      }

    }
    else
    {
      v22 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[_SVXPlayAudioExpressionParser parsePlayAudio:reply:]";
        v29 = 2112;
        v30 = v6;
        _os_log_impl(&dword_214934000, v22, OS_LOG_TYPE_INFO, "%s No expression to parse for PlayAudio: %@", buf, 0x16u);
      }
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }

  }
}

@end
