@implementation FTBlazarBatchTranslationMessage

- (FTBlazarBatchTranslationMessage)initWithFlatbuffData:(id)a3
{
  return -[FTBlazarBatchTranslationMessage initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[FTBlazarBatchTranslationMessage initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (FTBlazarBatchTranslationMessage)initWithFlatbuffData:(id)a3 root:(const BlazarBatchTranslationMessage *)a4
{
  return -[FTBlazarBatchTranslationMessage initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (FTBlazarBatchTranslationMessage)initWithFlatbuffData:(id)a3 root:(const BlazarBatchTranslationMessage *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  FTBlazarBatchTranslationMessage *v10;
  FTBlazarBatchTranslationMessage *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  uint64_t v19;
  siri::speech::qss_fb::BlazarBatchTranslationMessage *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  FTBlazarBatchTranslationMessage *v23;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FTBlazarBatchTranslationMessage;
  v10 = -[FTBlazarBatchTranslationMessage init](&v30, sel_init);
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
      a4 = (const BlazarBatchTranslationMessage *)v13 + *v13;
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
      root = (siri::speech::qss_fb::BlazarBatchTranslationMessage *)v11->_root;
      if (root)
      {
        if (!siri::speech::qss_fb::BlazarBatchTranslationMessage::Verify(root, (apple::aiml::flatbuffers2::Verifier *)&v25))
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

- (int64_t)session_message_type
{
  const BlazarBatchTranslationMessage *root;
  const BlazarBatchTranslationMessage *v3;
  uint64_t v4;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return root[v4].var0[0];
  else
    return 0;
}

- (FTBatchTranslationRequest)session_messageAsFTBatchTranslationRequest
{
  FTBatchTranslationRequest *v3;
  FTBatchTranslationRequest *v4;
  const BlazarBatchTranslationMessage *root;
  const BlazarBatchTranslationMessage *v6;
  uint64_t v7;
  const BlazarBatchTranslationMessage *v8;

  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTBatchTranslationRequest *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTBatchTranslationRequest alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTBatchTranslationRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTBatchTranslationFeedbackRequest)session_messageAsFTBatchTranslationFeedbackRequest
{
  FTBatchTranslationFeedbackRequest *v3;
  FTBatchTranslationFeedbackRequest *v4;
  const BlazarBatchTranslationMessage *root;
  const BlazarBatchTranslationMessage *v6;
  uint64_t v7;
  const BlazarBatchTranslationMessage *v8;

  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 2)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTBatchTranslationFeedbackRequest *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTBatchTranslationFeedbackRequest alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTBatchTranslationFeedbackRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTBatchTranslationLoggingRequest)session_messageAsFTBatchTranslationLoggingRequest
{
  FTBatchTranslationLoggingRequest *v3;
  FTBatchTranslationLoggingRequest *v4;
  const BlazarBatchTranslationMessage *root;
  const BlazarBatchTranslationMessage *v6;
  uint64_t v7;
  const BlazarBatchTranslationMessage *v8;

  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTBatchTranslationLoggingRequest *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTBatchTranslationLoggingRequest alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTBatchTranslationLoggingRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTTranslationSupportedLanguagesRequest)session_messageAsFTTranslationSupportedLanguagesRequest
{
  FTTranslationSupportedLanguagesRequest *v3;
  FTTranslationSupportedLanguagesRequest *v4;
  const BlazarBatchTranslationMessage *root;
  const BlazarBatchTranslationMessage *v6;
  uint64_t v7;
  const BlazarBatchTranslationMessage *v8;

  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTTranslationSupportedLanguagesRequest *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTTranslationSupportedLanguagesRequest alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTTranslationSupportedLanguagesRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTBatchTranslationResponse)session_messageAsFTBatchTranslationResponse
{
  FTBatchTranslationResponse *v3;
  FTBatchTranslationResponse *v4;
  const BlazarBatchTranslationMessage *root;
  const BlazarBatchTranslationMessage *v6;
  uint64_t v7;
  const BlazarBatchTranslationMessage *v8;

  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTBatchTranslationResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTBatchTranslationResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTBatchTranslationResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTFinalBlazarResponse)session_messageAsFTFinalBlazarResponse
{
  FTFinalBlazarResponse *v3;
  FTFinalBlazarResponse *v4;
  const BlazarBatchTranslationMessage *root;
  const BlazarBatchTranslationMessage *v6;
  uint64_t v7;
  const BlazarBatchTranslationMessage *v8;

  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTFinalBlazarResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTFinalBlazarResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTFinalBlazarResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FTTranslationSupportedLanguagesResponse)session_messageAsFTTranslationSupportedLanguagesResponse
{
  FTTranslationSupportedLanguagesResponse *v3;
  FTTranslationSupportedLanguagesResponse *v4;
  const BlazarBatchTranslationMessage *root;
  const BlazarBatchTranslationMessage *v6;
  uint64_t v7;
  const BlazarBatchTranslationMessage *v8;

  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("session_message"));
    v3 = (FTTranslationSupportedLanguagesResponse *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [FTTranslationSupportedLanguagesResponse alloc];
      root = self->_root;
      v6 = &root[-*(int *)root->var0];
      if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
        v8 = &root[v7 + *(unsigned int *)root[v7].var0];
      else
        v8 = 0;
      v3 = -[FTTranslationSupportedLanguagesResponse initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("session_message"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (FLTBFBufferAccessor)session_message
{
  void *v3;

  switch(-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type"))
  {
    case 1:
      -[FTBlazarBatchTranslationMessage session_messageAsFTBatchTranslationRequest](self, "session_messageAsFTBatchTranslationRequest");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[FTBlazarBatchTranslationMessage session_messageAsFTBatchTranslationFeedbackRequest](self, "session_messageAsFTBatchTranslationFeedbackRequest");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[FTBlazarBatchTranslationMessage session_messageAsFTBatchTranslationLoggingRequest](self, "session_messageAsFTBatchTranslationLoggingRequest");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[FTBlazarBatchTranslationMessage session_messageAsFTTranslationSupportedLanguagesRequest](self, "session_messageAsFTTranslationSupportedLanguagesRequest");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[FTBlazarBatchTranslationMessage session_messageAsFTBatchTranslationResponse](self, "session_messageAsFTBatchTranslationResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[FTBlazarBatchTranslationMessage session_messageAsFTFinalBlazarResponse](self, "session_messageAsFTFinalBlazarResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[FTBlazarBatchTranslationMessage session_messageAsFTTranslationSupportedLanguagesResponse](self, "session_messageAsFTTranslationSupportedLanguagesResponse");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return (FLTBFBufferAccessor *)v3;
}

+ (Class)session_message_immutableClassForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)session_message_typeForImmutableObject:(id)a3
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
  else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (Offset<siri::speech::qss_fb::BlazarBatchTranslationMessage>)addObjectToBuffer:(void *)a3
{
  unsigned __int8 v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v26;
  int v27;
  int v28;

  v5 = -[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type");
  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 1)
  {
    -[FTBlazarBatchTranslationMessage session_messageAsFTBatchTranslationRequest](self, "session_messageAsFTBatchTranslationRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "addObjectToBuffer:", a3);

  }
  else
  {
    v7 = 0;
  }
  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 2)
  {
    -[FTBlazarBatchTranslationMessage session_messageAsFTBatchTranslationFeedbackRequest](self, "session_messageAsFTBatchTranslationFeedbackRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "addObjectToBuffer:", a3);

  }
  else
  {
    v9 = 0;
  }
  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 3)
  {
    -[FTBlazarBatchTranslationMessage session_messageAsFTBatchTranslationLoggingRequest](self, "session_messageAsFTBatchTranslationLoggingRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "addObjectToBuffer:", a3);

  }
  else
  {
    v11 = 0;
  }
  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 4)
  {
    -[FTBlazarBatchTranslationMessage session_messageAsFTTranslationSupportedLanguagesRequest](self, "session_messageAsFTTranslationSupportedLanguagesRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "addObjectToBuffer:", a3);

  }
  else
  {
    v13 = 0;
  }
  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 5)
  {
    -[FTBlazarBatchTranslationMessage session_messageAsFTBatchTranslationResponse](self, "session_messageAsFTBatchTranslationResponse");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "addObjectToBuffer:", a3);

  }
  else
  {
    v15 = 0;
  }
  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 6)
  {
    -[FTBlazarBatchTranslationMessage session_messageAsFTFinalBlazarResponse](self, "session_messageAsFTFinalBlazarResponse");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "addObjectToBuffer:", a3);

    v26 = v17;
  }
  else
  {
    v26 = 0;
  }
  v28 = v11;
  v27 = v15;
  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 7)
  {
    -[FTBlazarBatchTranslationMessage session_messageAsFTTranslationSupportedLanguagesResponse](self, "session_messageAsFTTranslationSupportedLanguagesResponse");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "addObjectToBuffer:", a3);
    v20 = v13;

    v21 = v19;
  }
  else
  {
    v20 = v13;
    v21 = 0;
  }
  *((_BYTE *)a3 + 70) = 1;
  v22 = *((_QWORD *)a3 + 5);
  v23 = *((_QWORD *)a3 + 6);
  v24 = *((_QWORD *)a3 + 4);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((char *)a3, 4, v5, 0);
  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 1)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v7);
  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 2)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v9);
  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 3)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v28);
  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 4)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v20);
  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 5)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v27);
  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 6)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v26);
  if (-[FTBlazarBatchTranslationMessage session_message_type](self, "session_message_type") == 7)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((char *)a3, 6, v21);
  return (Offset<siri::speech::qss_fb::BlazarBatchTranslationMessage>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v24- (unsigned __int16)v23+ (unsigned __int16)v22);
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11, -[FTBlazarBatchTranslationMessage addObjectToBuffer:](self, "addObjectToBuffer:", &v11), 0, 0);
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
  v10[2] = __47__FTBlazarBatchTranslationMessage_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v2;
  v8 = (void *)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v5, v6, v10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v11);
  return v8;
}

apple::aiml::flatbuffers2::DetachedBuffer *__47__FTBlazarBatchTranslationMessage_flatbuffData__block_invoke(uint64_t a1)
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
