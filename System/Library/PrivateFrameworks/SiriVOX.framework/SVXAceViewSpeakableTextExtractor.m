@implementation SVXAceViewSpeakableTextExtractor

- (BOOL)hasSpeakableTexts:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "views", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        -[SVXAceViewSpeakableTextExtractor extractWithAceView:](self, "extractWithAceView:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "length");

        if (v10)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)extractWithAceView:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v6 = v4;
    objc_msgSend(v6, "speakableText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (os_log_t *)MEMORY[0x24BE08FB0];
    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "-[SVXAceViewSpeakableTextExtractor extractWithAceView:]";
      v16 = 2112;
      v17 = v7;
      _os_log_debug_impl(&dword_214934000, v9, OS_LOG_TYPE_DEBUG, "%s speakablePrefix = %@", (uint8_t *)&v14, 0x16u);
    }
    if (objc_msgSend(v7, "length"))
      objc_msgSend(v5, "appendString:", v7);
    -[SVXAceViewSpeakableTextExtractor _speakableTextFromDisambiguationList:](self, "_speakableTextFromDisambiguationList:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v10);

    objc_msgSend(v6, "speakableSuffix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
    {
      v14 = 136315394;
      v15 = "-[SVXAceViewSpeakableTextExtractor extractWithAceView:]";
      v16 = 2112;
      v17 = v11;
      _os_log_debug_impl(&dword_214934000, v12, OS_LOG_TYPE_DEBUG, "%s speakableSuffix = %@", (uint8_t *)&v14, 0x16u);
    }
    if (objc_msgSend(v11, "length"))
      objc_msgSend(v5, "appendString:", v11);

  }
  else
  {
    objc_msgSend(v4, "speakableText");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_speakableTextFromDisambiguationList:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  __int128 v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v6 = objc_msgSend(v4, "count");
  objc_msgSend(v3, "speakableDelimiter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (os_log_t *)MEMORY[0x24BE08FB0];
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[SVXAceViewSpeakableTextExtractor _speakableTextFromDisambiguationList:]";
    v27 = 2112;
    v28 = (unint64_t)v24;
    _os_log_debug_impl(&dword_214934000, v8, OS_LOG_TYPE_DEBUG, "%s speakableDelimiter = %@", buf, 0x16u);
  }
  v23 = v3;
  objc_msgSend(v3, "speakableFinalDelimiter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[SVXAceViewSpeakableTextExtractor _speakableTextFromDisambiguationList:]";
    v27 = 2112;
    v28 = (unint64_t)v9;
    _os_log_debug_impl(&dword_214934000, v10, OS_LOG_TYPE_DEBUG, "%s speakableFinalDelimiter = %@", buf, 0x16u);
  }
  if (objc_msgSend(v4, "count"))
  {
    v12 = 0;
    v13 = 0;
    v14 = v6 - 1;
    *(_QWORD *)&v11 = 136315650;
    v22 = v11;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v13, v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "speakableText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v22;
        v26 = "-[SVXAceViewSpeakableTextExtractor _speakableTextFromDisambiguationList:]";
        v27 = 2048;
        v28 = v13;
        v29 = 2112;
        v30 = v16;
        _os_log_debug_impl(&dword_214934000, v17, OS_LOG_TYPE_DEBUG, "%s disambiguationListItems[%tu].speakableText = %@", buf, 0x20u);
      }
      if (!objc_msgSend(v16, "length"))
        goto LABEL_17;
      if ((v12 & 1) != 0)
      {
        if (v14 == v13)
        {
          v18 = objc_msgSend(v9, "length");
          v19 = v9;
          if (!v18)
            goto LABEL_16;
LABEL_15:
          objc_msgSend(v5, "appendString:", v19);
          goto LABEL_16;
        }
        v20 = objc_msgSend(v24, "length");
        v19 = v24;
        if (v20)
          goto LABEL_15;
      }
LABEL_16:
      objc_msgSend(v5, "appendString:", v16);
      v12 = 1;
LABEL_17:

      ++v13;
    }
    while (v13 < objc_msgSend(v4, "count"));
  }

  return v5;
}

@end
