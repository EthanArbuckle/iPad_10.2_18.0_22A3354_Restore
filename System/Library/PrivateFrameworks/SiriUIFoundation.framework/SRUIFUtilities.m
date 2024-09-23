@implementation SRUIFUtilities

+ (id)parsedUtteranceFromText:(id)a3 context:(id)a4 spekableObjectProviding:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BE09310], "sruif_speakableUtteranceParserForCurrentLanguage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (v8 && objc_msgSend(v10, "sruif_hasExternalDomainsForStringWithFormat:shouldRedactLog:", v11, 0))
  {
    objc_msgSend(v9, "speakableProviderForObject:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v10, "registerProvider:forNamespace:", v12, *MEMORY[0x24BE09468]);

  }
  v17 = 0;
  objc_msgSend(v10, "parseStringWithFormat:error:", v11, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v17;
  if (v14)
  {
    v15 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      +[SRUIFUtilities parsedUtteranceFromText:context:spekableObjectProviding:].cold.1((uint64_t)v14, v15);
  }

  return v13;
}

+ (id)descriptionForAddViews:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDD16A8]);
  v5 = objc_opt_class();
  objc_msgSend(v3, "aceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@: %@ refId:%@>\n"), v5, v6, v7);

  objc_msgSend(v3, "responseMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "responseMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("responseMode=%@\n"), v10);

  }
  objc_msgSend(v3, "patternId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "patternId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("patternId=%@\n"), v12);

  }
  objc_msgSend(v3, "patternType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v3, "patternType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("patternType=%@\n"), v14);

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v3, "views");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        +[SRUIFUtilities descriptionForAceView:](SRUIFUtilities, "descriptionForAceView:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendFormat:", CFSTR("%@\n"), v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v17);
  }

  return v8;
}

+ (id)descriptionForAddDialogs:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDD16A8]);
  v5 = objc_opt_class();
  objc_msgSend(v3, "aceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@: %@>\n"), v5, v6);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "dialogs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        +[SRUIFUtilities descriptionForDialog:](SRUIFUtilities, "descriptionForDialog:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("%@\n"), v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

+ (id)descriptionForDialog:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDD16A8]);
  v5 = objc_opt_class();
  objc_msgSend(v3, "aceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@: %@\n"), v5, v6);

  objc_msgSend(v3, "caption");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "caption");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v3, "caption");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR("caption.text=\"%@\"\n"), v12);

    }
    objc_msgSend(v3, "caption");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "speakableTextOverride");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v3, "caption");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "speakableTextOverride");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR("caption.speakableTextOverride=\"%@\"\n"), v16);

    }
  }
  objc_msgSend(v3, "content");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v3, "content");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "text");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      if ((objc_msgSend(v3, "canUseServerTTS") & 1) != 0)
      {
        objc_msgSend(v3, "content");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "text");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("content.text=\"%@\"\n"), v21);

      }
      else
      {
        objc_msgSend(v7, "appendFormat:", CFSTR("content.text=\"%@\"\n"), CFSTR("<private>"));
      }
    }
    objc_msgSend(v3, "content");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "speakableTextOverride");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      if ((objc_msgSend(v3, "canUseServerTTS") & 1) != 0)
      {
        objc_msgSend(v3, "content");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "speakableTextOverride");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("content.speakableTextOverride=\"%@\"\n"), v25);

      }
      else
      {
        objc_msgSend(v7, "appendFormat:", CFSTR("content.speakableTextOverride=\"%@\"\n"), CFSTR("<private>"));
      }
    }
  }
  if (objc_msgSend(v3, "canUseServerTTS"))
    objc_msgSend(v7, "appendFormat:", CFSTR("canUseServerTTS=%i\n"), objc_msgSend(v3, "canUseServerTTS"));
  objc_msgSend(v3, "dialogIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v3, "dialogIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("dialogIdentifier=%@\n"), v27);

  }
  objc_msgSend(v3, "refId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v3, "refId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("refId=%@\n"), v29);

  }
  objc_msgSend(v3, "configuration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v3, "configuration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "languageCode");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v31, "languageCode");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR("languageCode=%@\n"), v33);

    }
    objc_msgSend(v31, "gender");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v31, "gender");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR("gender=%@\n"), v35);

    }
    objc_msgSend(v31, "context");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v31, "context");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR("context=%@\n"), v37);

    }
  }
  objc_msgSend(v7, "appendFormat:", CFSTR(">"));

  return v7;
}

+ (id)descriptionForAceView:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
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
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDD16A8]);
  v5 = objc_opt_class();
  objc_msgSend(v3, "aceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@: %@\n"), v5, v6);

  objc_msgSend(v3, "speakableText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((objc_msgSend(v3, "canUseServerTTS") & 1) != 0)
    {
      objc_msgSend(v3, "speakableText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR("speakableText=\"%@\"\n"), v9);

    }
    else
    {
      objc_msgSend(v7, "appendFormat:", CFSTR("speakableText=\"%@\"\n"), CFSTR("<private>"));
    }
  }
  if (objc_msgSend(v3, "canUseServerTTS"))
    objc_msgSend(v7, "appendFormat:", CFSTR("canUseServerTTS=%i\n"), objc_msgSend(v3, "canUseServerTTS"));
  objc_msgSend(v3, "listenAfterSpeaking");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v3, "listenAfterSpeaking");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("listenAfterSpeaking=%@\n"), v11);

  }
  objc_msgSend(v3, "refId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v3, "refId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("refId=%@\n"), v13);

  }
  objc_msgSend(v3, "dialog");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v3, "dialog");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SRUIFUtilities descriptionForDialog:](SRUIFUtilities, "descriptionForDialog:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("dialog=%@\n"), v16);

  }
  objc_msgSend(v3, "itemType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v3, "itemType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("itemType = %@\n"), v18);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v3;
    objc_msgSend(v19, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      if ((objc_msgSend(v19, "canUseServerTTS") & 1) != 0)
      {
        objc_msgSend(v19, "text");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("text=\"%@\"\n"), v21);

      }
      else
      {
        objc_msgSend(v7, "appendFormat:", CFSTR("text=\"%@\"\n"), CFSTR("<private>"));
      }
    }
    objc_msgSend(v19, "dialogIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v19, "dialogIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR("dialogIdentifier=%@\n"), v23);

    }
  }
  objc_msgSend(v7, "appendFormat:", CFSTR(">"));

  return v7;
}

+ (id)descriptionForSayIt:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDD16A8]);
  v5 = objc_opt_class();
  objc_msgSend(v3, "aceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@: %@\n"), v5, v6);

  objc_msgSend(v3, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((objc_msgSend(v3, "canUseServerTTS") & 1) != 0)
    {
      objc_msgSend(v3, "message");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR("message=\"%@\"\n"), v9);

    }
    else
    {
      objc_msgSend(v7, "appendFormat:", CFSTR("message=\"%@\"\n"), CFSTR("<private>"));
    }
  }
  objc_msgSend(v3, "audioData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v3, "audioData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "audioBuffer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("audioData=%tu Bytes\n"), objc_msgSend(v12, "length"));

  }
  objc_msgSend(v3, "audioDataUrl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v3, "audioDataUrl");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("audioDataUrl=%@n"), v14);

  }
  objc_msgSend(v3, "listenAfterSpeaking");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v3, "listenAfterSpeaking");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("listenAfterSpeaking=%@\n"), v16);

  }
  if (objc_msgSend(v3, "canUseServerTTS"))
    objc_msgSend(v7, "appendFormat:", CFSTR("canUseServerTTS=%i\n"), objc_msgSend(v3, "canUseServerTTS"));
  objc_msgSend(v3, "dialogIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v3, "dialogIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("dialogIdentifier=%@\n"), v18);

  }
  objc_msgSend(v3, "gender");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v3, "gender");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("gender=%@\n"), v20);

  }
  objc_msgSend(v3, "languageCode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v3, "languageCode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("languageCode=%@\n"), v22);

  }
  if (objc_msgSend(v3, "repeatable"))
    objc_msgSend(v7, "appendFormat:", CFSTR("repeatable=%i\n"), objc_msgSend(v3, "repeatable"));
  objc_msgSend(v3, "refId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v3, "refId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("refId=%@\n"), v24);

  }
  objc_msgSend(v3, "listenAfterSpeakingBehavior");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v3, "listenAfterSpeakingBehavior");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "startAlertSoundID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("listenAfterSpeakingBehavior=%@\n"), v27);

  }
  objc_msgSend(v7, "appendFormat:", CFSTR(">"));

  return v7;
}

+ (BOOL)string:(id)a3 equalToString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

+ (BOOL)string:(id)a3 isSameAsUserUtterance:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a1, "_normalizeTextString:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bestTextInterpretation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_normalizeTextString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v7, "localizedStandardCompare:", v9) == 0;

  return (char)v6;
}

+ (BOOL)shouldRedactSpeakableTextForAceObject:(id)a3
{
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    LODWORD(v4) = objc_msgSend(v3, "canUseServerTTS") ^ 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      objc_msgSend(v3, "views", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v4);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "canUseServerTTS"))
            {

              LOBYTE(v4) = 1;
              goto LABEL_5;
            }
          }
          v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v7)
            continue;
          break;
        }
      }

    }
    LOBYTE(v4) = 0;
  }
LABEL_5:

  return (char)v4;
}

+ (id)_normalizeTextString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("“"), CFSTR("\"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)parsedUtteranceFromText:(uint64_t)a1 context:(NSObject *)a2 spekableObjectProviding:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "+[SRUIFUtilities parsedUtteranceFromText:context:spekableObjectProviding:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_219F26000, a2, OS_LOG_TYPE_ERROR, "%s utterance parsing failed with error %@", (uint8_t *)&v2, 0x16u);
}

@end
