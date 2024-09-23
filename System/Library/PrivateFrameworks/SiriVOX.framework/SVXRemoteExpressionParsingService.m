@implementation SVXRemoteExpressionParsingService

void __74___SVXRemoteExpressionParsingService_parseExpressions_targetDevice_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "parsedExpressions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, 1, v5);

  }
  else
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[_SVXRemoteExpressionParsingService parseExpressions:targetDevice:reply:]_block_invoke";
      v10 = 2112;
      v11 = v3;
      _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s Got an unknown response %@ when attempting to parse expressions. Bailing", (uint8_t *)&v8, 0x16u);
    }
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, 0, 0);
  }

}

@end
