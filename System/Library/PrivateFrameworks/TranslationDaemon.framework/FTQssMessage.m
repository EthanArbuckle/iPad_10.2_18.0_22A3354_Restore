@implementation FTQssMessage

- (FTQssMessage)initWithFlatbuffData:(id)a3
{
  return -[FTQssMessage initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTQssMessage initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTQssMessage)initWithFlatbuffData:(id)a3 root:(const QssMessage *)a4
{
  return -[FTQssMessage initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTQssMessage)initWithFlatbuffData:(id)a3 root:(const QssMessage *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTQssMessage *v10;
  FTQssMessage *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  uint64_t v19;
  siri::speech::qss_fb::QssMessage *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  FTQssMessage *v23;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FTQssMessage;
  v10 = -[FTQssMessage init](&v30, sel_init);
  v11 = v10;
  if (v10)
  {
    if (!v9 || !objc_msgSend(v9, "length"))
      goto LABEL_15;
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
      a4 = (const QssMessage *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      v14 = objc_msgSend(*p_data, "bytes");
      v15 = objc_msgSend(*p_data, "length");
      var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15)
        goto LABEL_15;
      v18 = objc_msgSend(*p_data, "bytes");
      v19 = objc_msgSend(*p_data, "length");
      v25 = v18;
      v26 = v19;
      v27 = xmmword_249338830;
      v28 = 0;
      LOBYTE(v29) = 1;
      root = (siri::speech::qss_fb::QssMessage *)v11->_root;
      if (root)
      {
        if (!siri::speech::qss_fb::QssMessage::Verify(root, (apple::aiml::flatbuffers2::Verifier *)&v25))
        {
LABEL_15:
          v23 = 0;
          goto LABEL_16;
        }
      }
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v25, v26, v27, v28, v29);
    v21 = objc_claimAutoreleasedReturnValue();
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;

  }
  v23 = v11;
LABEL_16:

  return v23;
}

- (FTErrorMessage)error_message
{
  FTErrorMessage *v3;
  FTErrorMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("error_message"));
  v3 = (FTErrorMessage *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTErrorMessage alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (v7 = *(unsigned __int16 *)v6[4].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTErrorMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("error_message"));
  }
  return v3;
}

- (FTDisableSessionLog)disable_session_log
{
  FTDisableSessionLog *v3;
  FTDisableSessionLog *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("disable_session_log"));
  v3 = (FTDisableSessionLog *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [FTDisableSessionLog alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[FTDisableSessionLog initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("disable_session_log"));
  }
  return v3;
}

- (int64_t)container_message_type
{
  const QssMessage *root;
  const QssMessage *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return root[v4].var0[0];
  else
    return 0;
}

- (FTApgPronGuessMessage)container_messageAsFTApgPronGuessMessage
{
  FTApgPronGuessMessage *v3;
  FTApgPronGuessMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTApgPronGuessMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTApgPronGuessMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTApgPronGuessMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAsrRecognitionMessage)container_messageAsFTAsrRecognitionMessage
{
  FTAsrRecognitionMessage *v3;
  FTAsrRecognitionMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTAsrRecognitionMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTAsrRecognitionMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTAsrRecognitionMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAsrErrorBlamerMessage)container_messageAsFTAsrErrorBlamerMessage
{
  FTAsrErrorBlamerMessage *v3;
  FTAsrErrorBlamerMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTAsrErrorBlamerMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTAsrErrorBlamerMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTAsrErrorBlamerMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAsrItnMessage)container_messageAsFTAsrItnMessage
{
  FTAsrItnMessage *v3;
  FTAsrItnMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTAsrItnMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTAsrItnMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTAsrItnMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAsrTextNormalizationMessage)container_messageAsFTAsrTextNormalizationMessage
{
  FTAsrTextNormalizationMessage *v3;
  FTAsrTextNormalizationMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTAsrTextNormalizationMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTAsrTextNormalizationMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTAsrTextNormalizationMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAsrPostItnHammerMessage)container_messageAsFTAsrPostItnHammerMessage
{
  FTAsrPostItnHammerMessage *v3;
  FTAsrPostItnHammerMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTAsrPostItnHammerMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTAsrPostItnHammerMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTAsrPostItnHammerMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAsrKeywordFinderMessage)container_messageAsFTAsrKeywordFinderMessage
{
  FTAsrKeywordFinderMessage *v3;
  FTAsrKeywordFinderMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTAsrKeywordFinderMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTAsrKeywordFinderMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTAsrKeywordFinderMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAsrCorrectionsValidatorMessage)container_messageAsFTAsrCorrectionsValidatorMessage
{
  FTAsrCorrectionsValidatorMessage *v3;
  FTAsrCorrectionsValidatorMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTAsrCorrectionsValidatorMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTAsrCorrectionsValidatorMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTAsrCorrectionsValidatorMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTAsrGraphemeToPhonemeMessage)container_messageAsFTAsrGraphemeToPhonemeMessage
{
  FTAsrGraphemeToPhonemeMessage *v3;
  FTAsrGraphemeToPhonemeMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTAsrGraphemeToPhonemeMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTAsrGraphemeToPhonemeMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTAsrGraphemeToPhonemeMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTBlazarMultiUserMessage)container_messageAsFTBlazarMultiUserMessage
{
  FTBlazarMultiUserMessage *v3;
  FTBlazarMultiUserMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTBlazarMultiUserMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTBlazarMultiUserMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTBlazarMultiUserMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTBlazarMultilingualMessage)container_messageAsFTBlazarMultilingualMessage
{
  FTBlazarMultilingualMessage *v3;
  FTBlazarMultilingualMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTBlazarMultilingualMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTBlazarMultilingualMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTBlazarMultilingualMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTBlazarSpeechTranslationMessage)container_messageAsFTBlazarSpeechTranslationMessage
{
  FTBlazarSpeechTranslationMessage *v3;
  FTBlazarSpeechTranslationMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 12)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTBlazarSpeechTranslationMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTBlazarSpeechTranslationMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTBlazarSpeechTranslationMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTBlazarBatchTranslationMessage)container_messageAsFTBlazarBatchTranslationMessage
{
  FTBlazarBatchTranslationMessage *v3;
  FTBlazarBatchTranslationMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 13)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTBlazarBatchTranslationMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTBlazarBatchTranslationMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTBlazarBatchTranslationMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTBlazarTextToSpeechRouterMessage)container_messageAsFTBlazarTextToSpeechRouterMessage
{
  FTBlazarTextToSpeechRouterMessage *v3;
  FTBlazarTextToSpeechRouterMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 14)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTBlazarTextToSpeechRouterMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTBlazarTextToSpeechRouterMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTBlazarTextToSpeechRouterMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTBlazarTextToSpeechRouterStreamingMessage)container_messageAsFTBlazarTextToSpeechRouterStreamingMessage
{
  FTBlazarTextToSpeechRouterStreamingMessage *v3;
  FTBlazarTextToSpeechRouterStreamingMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 15)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTBlazarTextToSpeechRouterStreamingMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTBlazarTextToSpeechRouterStreamingMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTBlazarTextToSpeechRouterStreamingMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTBlazarServiceDiscoveryMessage)container_messageAsFTBlazarServiceDiscoveryMessage
{
  FTBlazarServiceDiscoveryMessage *v3;
  FTBlazarServiceDiscoveryMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 16)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTBlazarServiceDiscoveryMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTBlazarServiceDiscoveryMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTBlazarServiceDiscoveryMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTLmtLmScorerMessage)container_messageAsFTLmtLmScorerMessage
{
  FTLmtLmScorerMessage *v3;
  FTLmtLmScorerMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 17)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTLmtLmScorerMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTLmtLmScorerMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTLmtLmScorerMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTNapgCreateLanguageProfileMessage)container_messageAsFTNapgCreateLanguageProfileMessage
{
  FTNapgCreateLanguageProfileMessage *v3;
  FTNapgCreateLanguageProfileMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 18)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTNapgCreateLanguageProfileMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTNapgCreateLanguageProfileMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTNapgCreateLanguageProfileMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTMtTranslationMessage)container_messageAsFTMtTranslationMessage
{
  FTMtTranslationMessage *v3;
  FTMtTranslationMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 19)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTMtTranslationMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTMtTranslationMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTMtTranslationMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTTtsTextToSpeechMessage)container_messageAsFTTtsTextToSpeechMessage
{
  FTTtsTextToSpeechMessage *v3;
  FTTtsTextToSpeechMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 20)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTTtsTextToSpeechMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTTtsTextToSpeechMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTTtsTextToSpeechMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTTtsTextToSpeechStreamingMessage)container_messageAsFTTtsTextToSpeechStreamingMessage
{
  FTTtsTextToSpeechStreamingMessage *v3;
  FTTtsTextToSpeechStreamingMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 21)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTTtsTextToSpeechStreamingMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTTtsTextToSpeechStreamingMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTTtsTextToSpeechStreamingMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTTtsTextToSpeechSpeechFeatureMessage)container_messageAsFTTtsTextToSpeechSpeechFeatureMessage
{
  FTTtsTextToSpeechSpeechFeatureMessage *v3;
  FTTtsTextToSpeechSpeechFeatureMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 22)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTTtsTextToSpeechSpeechFeatureMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTTtsTextToSpeechSpeechFeatureMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTTtsTextToSpeechSpeechFeatureMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTNlShortcutFuzzyMatchMessage)container_messageAsFTNlShortcutFuzzyMatchMessage
{
  FTNlShortcutFuzzyMatchMessage *v3;
  FTNlShortcutFuzzyMatchMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 23)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTNlShortcutFuzzyMatchMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTNlShortcutFuzzyMatchMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTNlShortcutFuzzyMatchMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTSlsLanguageDetectionMessage)container_messageAsFTSlsLanguageDetectionMessage
{
  FTSlsLanguageDetectionMessage *v3;
  FTSlsLanguageDetectionMessage *v4;
  const QssMessage *root;
  const QssMessage *v6;
  uint64_t v7;
  const QssMessage *v8;

  if (-[FTQssMessage container_message_type](self, "container_message_type") == 24)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("container_message"));
    v3 = (FTSlsLanguageDetectionMessage *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTSlsLanguageDetectionMessage alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTSlsLanguageDetectionMessage initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("container_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FLTBFBufferAccessor)container_message
{
  void *v3;

  switch(-[FTQssMessage container_message_type](self, "container_message_type"))
  {
    case 1:
      -[FTQssMessage container_messageAsFTApgPronGuessMessage](self, "container_messageAsFTApgPronGuessMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[FTQssMessage container_messageAsFTAsrRecognitionMessage](self, "container_messageAsFTAsrRecognitionMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[FTQssMessage container_messageAsFTAsrErrorBlamerMessage](self, "container_messageAsFTAsrErrorBlamerMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[FTQssMessage container_messageAsFTAsrItnMessage](self, "container_messageAsFTAsrItnMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[FTQssMessage container_messageAsFTAsrTextNormalizationMessage](self, "container_messageAsFTAsrTextNormalizationMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[FTQssMessage container_messageAsFTAsrPostItnHammerMessage](self, "container_messageAsFTAsrPostItnHammerMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[FTQssMessage container_messageAsFTAsrKeywordFinderMessage](self, "container_messageAsFTAsrKeywordFinderMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[FTQssMessage container_messageAsFTAsrCorrectionsValidatorMessage](self, "container_messageAsFTAsrCorrectionsValidatorMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[FTQssMessage container_messageAsFTAsrGraphemeToPhonemeMessage](self, "container_messageAsFTAsrGraphemeToPhonemeMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[FTQssMessage container_messageAsFTBlazarMultiUserMessage](self, "container_messageAsFTBlazarMultiUserMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[FTQssMessage container_messageAsFTBlazarMultilingualMessage](self, "container_messageAsFTBlazarMultilingualMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[FTQssMessage container_messageAsFTBlazarSpeechTranslationMessage](self, "container_messageAsFTBlazarSpeechTranslationMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      -[FTQssMessage container_messageAsFTBlazarBatchTranslationMessage](self, "container_messageAsFTBlazarBatchTranslationMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      -[FTQssMessage container_messageAsFTBlazarTextToSpeechRouterMessage](self, "container_messageAsFTBlazarTextToSpeechRouterMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      -[FTQssMessage container_messageAsFTBlazarTextToSpeechRouterStreamingMessage](self, "container_messageAsFTBlazarTextToSpeechRouterStreamingMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 16:
      -[FTQssMessage container_messageAsFTBlazarServiceDiscoveryMessage](self, "container_messageAsFTBlazarServiceDiscoveryMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 17:
      -[FTQssMessage container_messageAsFTLmtLmScorerMessage](self, "container_messageAsFTLmtLmScorerMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 18:
      -[FTQssMessage container_messageAsFTNapgCreateLanguageProfileMessage](self, "container_messageAsFTNapgCreateLanguageProfileMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 19:
      -[FTQssMessage container_messageAsFTMtTranslationMessage](self, "container_messageAsFTMtTranslationMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 20:
      -[FTQssMessage container_messageAsFTTtsTextToSpeechMessage](self, "container_messageAsFTTtsTextToSpeechMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 21:
      -[FTQssMessage container_messageAsFTTtsTextToSpeechStreamingMessage](self, "container_messageAsFTTtsTextToSpeechStreamingMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 22:
      -[FTQssMessage container_messageAsFTTtsTextToSpeechSpeechFeatureMessage](self, "container_messageAsFTTtsTextToSpeechSpeechFeatureMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 23:
      -[FTQssMessage container_messageAsFTNlShortcutFuzzyMatchMessage](self, "container_messageAsFTNlShortcutFuzzyMatchMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 24:
      -[FTQssMessage container_messageAsFTSlsLanguageDetectionMessage](self, "container_messageAsFTSlsLanguageDetectionMessage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return (FLTBFBufferAccessor *)v3;
}

+ (Class)container_message_immutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x17)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)container_message_typeForImmutableObject:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v4 = 23;
  }
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 24;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (Offset<siri::speech::qss_fb::QssMessage>)addObjectToBuffer:(void *)a3
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  unsigned __int8 v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
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
  uint64_t v38;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  uint64_t v61;
  uint64_t v62;

  -[FTQssMessage error_message](self, "error_message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "addObjectToBuffer:", a3);

  -[FTQssMessage disable_session_log](self, "disable_session_log");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "addObjectToBuffer:", a3);

  v9 = -[FTQssMessage container_message_type](self, "container_message_type");
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 1)
  {
    -[FTQssMessage container_messageAsFTApgPronGuessMessage](self, "container_messageAsFTApgPronGuessMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "addObjectToBuffer:", a3);

  }
  else
  {
    v11 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 2)
  {
    -[FTQssMessage container_messageAsFTAsrRecognitionMessage](self, "container_messageAsFTAsrRecognitionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "addObjectToBuffer:", a3);

  }
  else
  {
    v13 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 3)
  {
    -[FTQssMessage container_messageAsFTAsrErrorBlamerMessage](self, "container_messageAsFTAsrErrorBlamerMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "addObjectToBuffer:", a3);

  }
  else
  {
    v15 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 4)
  {
    -[FTQssMessage container_messageAsFTAsrItnMessage](self, "container_messageAsFTAsrItnMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "addObjectToBuffer:", a3);

  }
  else
  {
    v17 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 5)
  {
    -[FTQssMessage container_messageAsFTAsrTextNormalizationMessage](self, "container_messageAsFTAsrTextNormalizationMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v18, "addObjectToBuffer:", a3);

  }
  else
  {
    v60 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 6)
  {
    -[FTQssMessage container_messageAsFTAsrPostItnHammerMessage](self, "container_messageAsFTAsrPostItnHammerMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v19, "addObjectToBuffer:", a3);

  }
  else
  {
    v59 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 7)
  {
    -[FTQssMessage container_messageAsFTAsrKeywordFinderMessage](self, "container_messageAsFTAsrKeywordFinderMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v20, "addObjectToBuffer:", a3);

  }
  else
  {
    v58 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 8)
  {
    -[FTQssMessage container_messageAsFTAsrCorrectionsValidatorMessage](self, "container_messageAsFTAsrCorrectionsValidatorMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v21, "addObjectToBuffer:", a3);

  }
  else
  {
    v57 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 9)
  {
    -[FTQssMessage container_messageAsFTAsrGraphemeToPhonemeMessage](self, "container_messageAsFTAsrGraphemeToPhonemeMessage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v22, "addObjectToBuffer:", a3);

  }
  else
  {
    v56 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 10)
  {
    -[FTQssMessage container_messageAsFTBlazarMultiUserMessage](self, "container_messageAsFTBlazarMultiUserMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v23, "addObjectToBuffer:", a3);

  }
  else
  {
    v55 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 11)
  {
    -[FTQssMessage container_messageAsFTBlazarMultilingualMessage](self, "container_messageAsFTBlazarMultilingualMessage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v24, "addObjectToBuffer:", a3);

  }
  else
  {
    v54 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 12)
  {
    -[FTQssMessage container_messageAsFTBlazarSpeechTranslationMessage](self, "container_messageAsFTBlazarSpeechTranslationMessage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v25, "addObjectToBuffer:", a3);

  }
  else
  {
    v53 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 13)
  {
    -[FTQssMessage container_messageAsFTBlazarBatchTranslationMessage](self, "container_messageAsFTBlazarBatchTranslationMessage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v26, "addObjectToBuffer:", a3);

  }
  else
  {
    v52 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 14)
  {
    -[FTQssMessage container_messageAsFTBlazarTextToSpeechRouterMessage](self, "container_messageAsFTBlazarTextToSpeechRouterMessage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v27, "addObjectToBuffer:", a3);

  }
  else
  {
    v51 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 15)
  {
    -[FTQssMessage container_messageAsFTBlazarTextToSpeechRouterStreamingMessage](self, "container_messageAsFTBlazarTextToSpeechRouterStreamingMessage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v28, "addObjectToBuffer:", a3);

  }
  else
  {
    v50 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 16)
  {
    -[FTQssMessage container_messageAsFTBlazarServiceDiscoveryMessage](self, "container_messageAsFTBlazarServiceDiscoveryMessage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v29, "addObjectToBuffer:", a3);

  }
  else
  {
    v49 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 17)
  {
    -[FTQssMessage container_messageAsFTLmtLmScorerMessage](self, "container_messageAsFTLmtLmScorerMessage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v30, "addObjectToBuffer:", a3);

  }
  else
  {
    v48 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 18)
  {
    -[FTQssMessage container_messageAsFTNapgCreateLanguageProfileMessage](self, "container_messageAsFTNapgCreateLanguageProfileMessage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v31, "addObjectToBuffer:", a3);

  }
  else
  {
    v47 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 19)
  {
    -[FTQssMessage container_messageAsFTMtTranslationMessage](self, "container_messageAsFTMtTranslationMessage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v32, "addObjectToBuffer:", a3);

  }
  else
  {
    v46 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 20)
  {
    -[FTQssMessage container_messageAsFTTtsTextToSpeechMessage](self, "container_messageAsFTTtsTextToSpeechMessage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v33, "addObjectToBuffer:", a3);

  }
  else
  {
    v45 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 21)
  {
    -[FTQssMessage container_messageAsFTTtsTextToSpeechStreamingMessage](self, "container_messageAsFTTtsTextToSpeechStreamingMessage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v34, "addObjectToBuffer:", a3);

  }
  else
  {
    v44 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 22)
  {
    -[FTQssMessage container_messageAsFTTtsTextToSpeechSpeechFeatureMessage](self, "container_messageAsFTTtsTextToSpeechSpeechFeatureMessage");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v35, "addObjectToBuffer:", a3);

  }
  else
  {
    v43 = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 23)
  {
    -[FTQssMessage container_messageAsFTNlShortcutFuzzyMatchMessage](self, "container_messageAsFTNlShortcutFuzzyMatchMessage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v40) = objc_msgSend(v36, "addObjectToBuffer:", a3);

  }
  else
  {
    HIDWORD(v40) = 0;
  }
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 24)
  {
    -[FTQssMessage container_messageAsFTSlsLanguageDetectionMessage](self, "container_messageAsFTSlsLanguageDetectionMessage");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v40) = objc_msgSend(v37, "addObjectToBuffer:", a3);

  }
  else
  {
    LODWORD(v40) = 0;
  }
  *((_BYTE *)a3 + 70) = 1;
  v38 = *((_QWORD *)a3 + 4);
  v61 = *((_QWORD *)a3 + 6);
  v62 = *((_QWORD *)a3 + 5);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 4, v6);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v8);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 8, v9, 0);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 1)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v11);
  if (-[FTQssMessage container_message_type](self, "container_message_type", v40) == 2)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v13);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 3)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v15);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 4)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v17);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 5)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v60);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 6)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v59);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 7)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v58);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 8)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v57);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 9)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v56);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 10)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v55);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 11)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v54);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 12)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v53);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 13)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v52);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 14)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v51);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 15)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v50);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 16)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v49);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 17)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v48);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 18)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v47);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 19)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v46);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 20)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v45);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 21)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v44);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 22)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v43);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 23)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v42);
  if (-[FTQssMessage container_message_type](self, "container_message_type") == 24)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 10, v41);
  return (Offset<siri::speech::qss_fb::QssMessage>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v38- (unsigned __int16)v61+ (unsigned __int16)v62);
}

- (id)flatbuffData
{
  uint64_t v2;
  int v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  unsigned __int8 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;

  v11 = 0;
  v12 = 0;
  v13 = xmmword_249338840;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTQssMessage addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
  v2 = operator new();
  v3 = v12;
  v4 = v14;
  v5 = v15;
  v6 = (v14 + DWORD2(v14) - v15);
  *(_QWORD *)v2 = v11;
  *(_BYTE *)(v2 + 8) = v3;
  *(_QWORD *)(v2 + 16) = *((_QWORD *)&v4 + 1);
  *(_QWORD *)(v2 + 24) = v4;
  *(_QWORD *)(v2 + 32) = v5;
  *(_QWORD *)(v2 + 40) = v6;
  if (v3)
  {
    v11 = 0;
    v12 = 0;
  }
  v14 = 0u;
  v15 = 0u;
  v7 = objc_alloc(MEMORY[0x24BDBCE50]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __28__FTQssMessage_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__28__FTQssMessage_flatbuffData__block_invoke(uint64_t a1)
{
  apple::aiml::flatbuffers2::DetachedBuffer *result;

  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x2495AE51CLL);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
