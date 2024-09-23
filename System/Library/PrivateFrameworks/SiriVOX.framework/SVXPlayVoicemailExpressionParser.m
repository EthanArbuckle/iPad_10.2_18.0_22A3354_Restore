@implementation SVXPlayVoicemailExpressionParser

void __62___SVXPlayVoicemailExpressionParser_parsePlayVoicemail_reply___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  os_log_t *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (os_log_t *)MEMORY[0x24BE08FB0];
    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v15 = 136315394;
      v16 = "-[_SVXPlayVoicemailExpressionParser parsePlayVoicemail:reply:]_block_invoke";
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s Service successfully parsed expression: %@", (uint8_t *)&v15, 0x16u);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v7, "attachment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, 1, v11);

    }
    else
    {
      v13 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        v15 = 136315394;
        v16 = "-[_SVXPlayVoicemailExpressionParser parsePlayVoicemail:reply:]_block_invoke";
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s Parsed expression has no data: %@", (uint8_t *)&v15, 0x16u);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    v12 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v14 = *(void **)(a1 + 32);
      v15 = 136315394;
      v16 = "-[_SVXPlayVoicemailExpressionParser parsePlayVoicemail:reply:]_block_invoke";
      v17 = 2112;
      v18 = v14;
      _os_log_error_impl(&dword_214934000, v12, OS_LOG_TYPE_ERROR, "%s Service failed to parse expression: %@", (uint8_t *)&v15, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

@end
