@implementation QSSErrorBlamerRequest

- (QSSErrorBlamerRequest)initWithFlatbuffData:(id)a3
{
  return -[QSSErrorBlamerRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSErrorBlamerRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSErrorBlamerRequest)initWithFlatbuffData:(id)a3 root:(const ErrorBlamerRequest *)a4
{
  return -[QSSErrorBlamerRequest initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSErrorBlamerRequest)initWithFlatbuffData:(id)a3 root:(const ErrorBlamerRequest *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSErrorBlamerRequest *v10;
  QSSErrorBlamerRequest *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  flatbuffers::Table *root;
  unsigned __int16 *v21;
  uint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int16 *v26;
  uint64_t v27;
  const unsigned __int8 *v28;
  unsigned __int16 *v29;
  uint64_t v30;
  const unsigned __int8 *v31;
  unsigned __int16 *v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  char *v37;
  _DWORD *v38;
  unsigned __int16 *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned __int16 *v44;
  uint64_t v45;
  const unsigned __int8 *v46;
  uint64_t v47;
  NSMutableDictionary *storage;
  QSSErrorBlamerRequest *v49;
  uint64_t v51;
  unint64_t v52;
  __int128 v53;
  uint64_t v54;
  char v55;
  objc_super v56;

  v5 = a5;
  v9 = a3;
  v56.receiver = self;
  v56.super_class = (Class)QSSErrorBlamerRequest;
  v10 = -[QSSErrorBlamerRequest init](&v56, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_76;
  if (!v9 || !objc_msgSend(v9, "length"))
    goto LABEL_77;
  p_data = (id *)&v10->_data;
  objc_storeStrong(p_data, a3);
  if (!a4)
  {
    v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
    a4 = (const ErrorBlamerRequest *)v13 + *v13;
  }
  v11->_root = a4;
  if (!v5)
    goto LABEL_75;
  v14 = objc_msgSend(*p_data, "bytes");
  v15 = objc_msgSend(*p_data, "length");
  var0 = (unint64_t)v11->_root->var0;
  if (var0 < v14 || var0 > v14 + v15)
    goto LABEL_77;
  v18 = objc_msgSend(*p_data, "bytes");
  v19 = objc_msgSend(*p_data, "length");
  v51 = v18;
  v52 = v19;
  v53 = xmmword_21E34D540;
  v54 = 0;
  v55 = 1;
  if (v19 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  root = (flatbuffers::Table *)v11->_root;
  if (!root)
    goto LABEL_75;
  if (!flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)&v51, v11->_root->var0))
    goto LABEL_77;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v51, 4u))
    goto LABEL_77;
  v21 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v21 >= 5u)
  {
    v22 = v21[2];
    if (v22)
    {
      if (!siri::speech::schema_fb::StartSpeechRequest::Verify((flatbuffers::Table *)((char *)root + v22 + *(unsigned int *)((char *)root + v22)), (flatbuffers::Verifier *)&v51))goto LABEL_77;
    }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v51, 6u))
    goto LABEL_77;
  v23 = 0;
  v24 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v24) >= 7u)
  {
    if (!*(_WORD *)((char *)root - v24 + 6))
      goto LABEL_23;
    if (!flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v51, (const unsigned __int8 *)root+ *(unsigned __int16 *)((char *)root - v24 + 6)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v24 + 6)), 4uLL, 0))goto LABEL_77;
    v23 = 0;
    v24 = *(int *)root;
    if (*(unsigned __int16 *)((char *)root - v24) >= 7u)
    {
LABEL_23:
      v25 = *(unsigned __int16 *)((char *)root - v24 + 6);
      if (v25)
        v23 = (_DWORD *)((char *)root + v25 + *(unsigned int *)((char *)root + v25));
      else
        v23 = 0;
    }
  }
  if (!flatbuffers::Verifier::VerifyVectorOfStrings((flatbuffers::Verifier *)&v51, v23)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v51, 8u))
  {
    goto LABEL_77;
  }
  v26 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v26 >= 9u && (v27 = v26[4]) != 0)
    v28 = (const unsigned __int8 *)root + v27 + *(unsigned int *)((char *)root + v27);
  else
    v28 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v51, v28)
    || !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v51, 0xAu))
  {
    goto LABEL_77;
  }
  v29 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v29 >= 0xBu && (v30 = v29[5]) != 0)
    v31 = (const unsigned __int8 *)root + v30 + *(unsigned int *)((char *)root + v30);
  else
    v31 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v51, v31))
    goto LABEL_77;
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v51, 0xCu))
    goto LABEL_77;
  v32 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v32 >= 0xDu)
  {
    v33 = v32[6];
    if (v33)
    {
      if (!siri::speech::schema_fb::UserLanguageProfile::Verify((flatbuffers::Table *)((char *)root + v33 + *(unsigned int *)((char *)root + v33)), (flatbuffers::Verifier *)&v51))goto LABEL_77;
    }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v51, 0xEu))
    goto LABEL_77;
  v34 = *(int *)root;
  v35 = *(unsigned __int16 *)((char *)root - v34);
  if (v35 >= 0xF)
  {
    if (*(_WORD *)((char *)root - v34 + 14))
    {
      if (!siri::speech::schema_fb::UserAcousticProfile::Verify((flatbuffers::Table *)((char *)root+ *(unsigned __int16 *)((char *)root - v34 + 14)+ *(unsigned int *)((char *)root + *(unsigned __int16 *)((char *)root - v34 + 14))), (flatbuffers::Verifier *)&v51))goto LABEL_77;
      v34 = *(int *)root;
      v36 = -v34;
      v35 = *(unsigned __int16 *)((char *)root - v34);
    }
    else
    {
      v36 = -v34;
    }
    if (v35 >= 0x11)
    {
      v37 = (char *)root + v36;
      if (*((_WORD *)v37 + 8))
      {
        if (v52 < 9 || v52 - 8 < (unint64_t)root + *((unsigned __int16 *)v37 + 8) - v51)
          goto LABEL_77;
      }
      if (v35 >= 0x13
        && *((_WORD *)v37 + 9)
        && (v52 < 9 || v52 - 8 < (unint64_t)root + *((unsigned __int16 *)v37 + 9) - v51))
      {
        goto LABEL_77;
      }
    }
  }
  if (!flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v51, 0x14u))
    goto LABEL_77;
  v38 = 0;
  v39 = (unsigned __int16 *)((char *)root - (int)v34);
  if (*v39 < 0x15u)
    goto LABEL_68;
  v40 = v39[10];
  if (!v40)
  {
    v42 = -(uint64_t)(int)v34;
LABEL_65:
    v43 = *(unsigned __int16 *)((char *)root + v42 + 20);
    if (v43)
      v38 = (_DWORD *)((char *)root + v43 + *(unsigned int *)((char *)root + v43));
    else
      v38 = 0;
    goto LABEL_68;
  }
  if (!flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)&v51, (const unsigned __int8 *)root + v40 + *(unsigned int *)((char *)root + v40), 4uLL, 0))
  {
LABEL_77:
    v49 = 0;
    goto LABEL_78;
  }
  v38 = 0;
  v41 = *(int *)root;
  if (*(unsigned __int16 *)((char *)root - v41) >= 0x15u)
  {
    v42 = -v41;
    goto LABEL_65;
  }
LABEL_68:
  if (!flatbuffers::Verifier::VerifyVectorOfTables<siri::speech::schema_fb::AudioPacket>((flatbuffers::Verifier *)&v51, v38)|| !flatbuffers::Table::VerifyOffset(root, (const flatbuffers::Verifier *)&v51, 0x16u))
  {
    goto LABEL_77;
  }
  v44 = (unsigned __int16 *)((char *)root - *(int *)root);
  if (*v44 >= 0x17u && (v45 = v44[11]) != 0)
    v46 = (const unsigned __int8 *)root + v45 + *(unsigned int *)((char *)root + v45);
  else
    v46 = 0;
  if (!flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)&v51, v46))
    goto LABEL_77;
LABEL_75:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v51);
  v47 = objc_claimAutoreleasedReturnValue();
  storage = v11->_storage;
  v11->_storage = (NSMutableDictionary *)v47;

LABEL_76:
  v49 = v11;
LABEL_78:

  return v49;
}

- (QSSStartSpeechRequest)start_speech_request
{
  QSSStartSpeechRequest *v3;
  QSSStartSpeechRequest *v4;
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v6;
  uint64_t v7;
  const ErrorBlamerRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("start_speech_request"));
  v3 = (QSSStartSpeechRequest *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSStartSpeechRequest alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 5u && (v7 = *(unsigned __int16 *)v6[4].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSStartSpeechRequest initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("start_speech_request"));
  }
  return v3;
}

- (NSArray)contextual_text
{
  void *v3;
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v5;
  uint64_t v6;
  const ErrorBlamerRequest *v7;
  uint64_t v8;
  uint64_t v9;
  const ErrorBlamerRequest *v10;
  uint64_t v11;
  void *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("contextual_text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 7u)
    {
      v6 = *(unsigned __int16 *)v5[6].var0;
      if (v6)
      {
        v7 = &root[v6];
        v8 = *(unsigned int *)v7->var0;
        v10 = &v7[v8 + 4];
        v9 = *(unsigned int *)v7[v8].var0;
        if ((_DWORD)v9)
        {
          v11 = 4 * v9;
          do
          {
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v10[*(unsigned int *)v10->var0 + 4], *(unsigned int *)v10[*(unsigned int *)v10->var0].var0, 4);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("contextual_text"));
  }
  return (NSArray *)v3;
}

- (NSString)left_context
{
  const ErrorBlamerRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ErrorBlamerRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
  {
    v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    v4 = 0;
    v6 = 0;
    v5 = *(unsigned int *)root->var0;
  }
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
}

- (NSString)right_context
{
  const ErrorBlamerRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ErrorBlamerRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
  {
    v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    v4 = 0;
    v6 = 0;
    v5 = *(unsigned int *)root->var0;
  }
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
}

- (QSSUserLanguageProfile)user_language_profile
{
  QSSUserLanguageProfile *v3;
  QSSUserLanguageProfile *v4;
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v6;
  uint64_t v7;
  const ErrorBlamerRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("user_language_profile"));
  v3 = (QSSUserLanguageProfile *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSUserLanguageProfile alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (v7 = *(unsigned __int16 *)v6[12].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSUserLanguageProfile initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("user_language_profile"));
  }
  return v3;
}

- (QSSUserAcousticProfile)user_acoustic_profile
{
  QSSUserAcousticProfile *v3;
  QSSUserAcousticProfile *v4;
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v6;
  uint64_t v7;
  const ErrorBlamerRequest *v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("user_acoustic_profile"));
  v3 = (QSSUserAcousticProfile *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [QSSUserAcousticProfile alloc];
    root = self->_root;
    v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xFu && (v7 = *(unsigned __int16 *)v6[14].var0) != 0)
      v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    else
      v8 = 0;
    v3 = -[QSSUserAcousticProfile initWithFlatbuffData:root:verify:](v4, "initWithFlatbuffData:root:verify:", self->_data, v8, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("user_acoustic_profile"));
  }
  return v3;
}

- (double)latitude
{
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v3;
  double result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0x11u)
  {
    v5 = *(unsigned __int16 *)v3[16].var0;
    if (v5)
      return *(double *)root[v5].var0;
  }
  return result;
}

- (double)longitude
{
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v3;
  double result;
  uint64_t v5;

  root = self->_root;
  v3 = &root[-*(int *)root->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0x13u)
  {
    v5 = *(unsigned __int16 *)v3[18].var0;
    if (v5)
      return *(double *)root[v5].var0;
  }
  return result;
}

- (NSArray)audio_packets
{
  void *v3;
  const ErrorBlamerRequest *root;
  const ErrorBlamerRequest *v5;
  uint64_t v6;
  const ErrorBlamerRequest *v7;
  uint64_t v8;
  uint64_t v9;
  const ErrorBlamerRequest *v10;
  uint64_t v11;
  QSSAudioPacket *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("audio_packets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0x15u)
    {
      v6 = *(unsigned __int16 *)v5[20].var0;
      if (v6)
      {
        v7 = &root[v6];
        v8 = *(unsigned int *)v7->var0;
        v10 = &v7[v8 + 4];
        v9 = *(unsigned int *)v7[v8].var0;
        if ((_DWORD)v9)
        {
          v11 = 4 * v9;
          do
          {
            v12 = -[QSSAudioPacket initWithFlatbuffData:root:verify:]([QSSAudioPacket alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("audio_packets"));
  }
  return (NSArray *)v3;
}

- (NSString)ref_transcript
{
  const ErrorBlamerRequest *root;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const ErrorBlamerRequest *v6;

  root = self->_root;
  v3 = *(int *)root->var0;
  v4 = *(unsigned __int16 *)root[-v3 + 22].var0;
  if (*(_WORD *)root[-v3 + 22].var0)
  {
    v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    v4 = 0;
    v6 = 0;
    v5 = *(unsigned int *)root->var0;
  }
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &v6[4], *(unsigned int *)root[v4 + v5].var0, 4);
}

- (Offset<siri::speech::schema_fb::ErrorBlamerRequest>)addObjectToBuffer:(void *)a3
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int *begin;
  uint64_t v10;
  int *value;
  uint64_t i;
  const char *v13;
  size_t v14;
  int String;
  int v16;
  std::vector<int>::pointer end;
  int *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  int *v23;
  int v24;
  int *v25;
  __CFString *v26;
  __CFString *v27;
  const char *v28;
  size_t v29;
  __CFString *v30;
  __CFString *v31;
  const char *v32;
  size_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t j;
  int v50;
  int v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  int v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  int v64;
  unsigned int v65;
  __CFString *v66;
  __CFString *v67;
  const char *v68;
  size_t v69;
  unsigned int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  Offset<siri::speech::schema_fb::ErrorBlamerRequest> v75;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  std::vector<int> v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  -[QSSErrorBlamerRequest start_speech_request](self, "start_speech_request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "addObjectToBuffer:", a3);

  memset(&v93, 0, sizeof(v93));
  -[QSSErrorBlamerRequest contextual_text](self, "contextual_text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v93, objc_msgSend(v5, "count"));

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  -[QSSErrorBlamerRequest contextual_text](self, "contextual_text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
  v8 = v6;
  v82 = v4;
  begin = v93.__begin_;
  if (v7)
  {
    v10 = *(_QWORD *)v90;
    value = v93.__end_cap_.__value_;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v90 != v10)
          objc_enumerationMutation(v8);
        v13 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i)), "UTF8String");
        v14 = strlen(v13);
        String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v13, v14);
        v16 = String;
        end = v93.__end_;
        if (v93.__end_ >= value)
        {
          v19 = v93.__end_ - begin;
          v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 62)
          {
            v93.__begin_ = begin;
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          }
          if (((char *)value - (char *)begin) >> 1 > v20)
            v20 = ((char *)value - (char *)begin) >> 1;
          if ((unint64_t)((char *)value - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL)
            v21 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v21 = v20;
          if (v21)
            v21 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v21);
          else
            v22 = 0;
          v23 = (int *)(v21 + 4 * v19);
          *v23 = v16;
          v18 = v23 + 1;
          while (end != begin)
          {
            v24 = *--end;
            *--v23 = v24;
          }
          value = (int *)(v21 + 4 * v22);
          v93.__end_ = v18;
          if (begin)
            operator delete(begin);
          begin = v23;
        }
        else
        {
          *v93.__end_ = String;
          v18 = end + 1;
        }
        v93.__end_ = v18;
      }
      v93.__end_cap_.__value_ = value;
      v93.__begin_ = begin;
      v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
    }
    while (v7);
  }
  else
  {
    v18 = v93.__end_;
  }

  if (v18 == begin)
    v25 = (int *)&flatbuffers::data<flatbuffers::Offset<flatbuffers::String>,std::allocator<flatbuffers::Offset<flatbuffers::String>>>(std::vector<flatbuffers::Offset<flatbuffers::String>> const&)::t;
  else
    v25 = begin;
  v81 = flatbuffers::FlatBufferBuilder::CreateVector<siri::speech::schema_fb::RecognitionToken>((flatbuffers::FlatBufferBuilder *)a3, (uint64_t)v25, v18 - begin);
  -[QSSErrorBlamerRequest left_context](self, "left_context");
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (!v26)
    v26 = &stru_24E246F88;
  v28 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v26), "UTF8String");
  v29 = strlen(v28);
  v80 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v28, v29);

  -[QSSErrorBlamerRequest right_context](self, "right_context");
  v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (!v30)
    v30 = &stru_24E246F88;
  v32 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v30), "UTF8String");
  v33 = strlen(v32);
  v79 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v32, v33);

  -[QSSErrorBlamerRequest user_language_profile](self, "user_language_profile");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v34, "addObjectToBuffer:", a3);

  -[QSSErrorBlamerRequest user_acoustic_profile](self, "user_acoustic_profile");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v35, "addObjectToBuffer:", a3);

  -[QSSErrorBlamerRequest latitude](self, "latitude");
  v37 = v36;
  -[QSSErrorBlamerRequest longitude](self, "longitude");
  v39 = v38;
  -[QSSErrorBlamerRequest audio_packets](self, "audio_packets");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "count");
  if (v41)
  {
    if (v41 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v41);
    v44 = &v42[4 * v43];
  }
  else
  {
    v42 = 0;
    v44 = 0;
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  -[QSSErrorBlamerRequest audio_packets](self, "audio_packets");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
  if (v46)
  {
    v47 = *(_QWORD *)v86;
    v48 = v42;
    do
    {
      for (j = 0; j != v46; ++j)
      {
        if (*(_QWORD *)v86 != v47)
          objc_enumerationMutation(v45);
        v50 = objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * j), "addObjectToBuffer:", a3);
        v51 = v50;
        if (v48 >= v44)
        {
          v52 = (v48 - v42) >> 2;
          v53 = v52 + 1;
          if ((unint64_t)(v52 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v44 - v42) >> 1 > v53)
            v53 = (v44 - v42) >> 1;
          if ((unint64_t)(v44 - v42) >= 0x7FFFFFFFFFFFFFFCLL)
            v54 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v54 = v53;
          if (v54)
            v54 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v54);
          else
            v55 = 0;
          v56 = (char *)(v54 + 4 * v52);
          *(_DWORD *)v56 = v51;
          v57 = v56 + 4;
          while (v48 != v42)
          {
            v58 = *((_DWORD *)v48 - 1);
            v48 -= 4;
            *((_DWORD *)v56 - 1) = v58;
            v56 -= 4;
          }
          v44 = (char *)(v54 + 4 * v55);
          if (v42)
            operator delete(v42);
          v42 = v56;
          v48 = v57;
        }
        else
        {
          *(_DWORD *)v48 = v50;
          v48 += 4;
        }
      }
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
    }
    while (v46);
  }
  else
  {
    v48 = v42;
  }

  v59 = v48 - v42;
  if (v48 == v42)
    v60 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::AudioPacket>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::AudioPacket>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::AudioPacket>> const&)::t;
  else
    v60 = v42;
  v61 = v59 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v59 >> 2, 4uLL);
  if (v42 == v48)
  {
    LODWORD(v61) = 0;
  }
  else
  {
    v62 = v60 - 4;
    v63 = v61;
    do
    {
      v64 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v62[4 * v63]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v64);
      --v63;
    }
    while (v63);
  }
  v65 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v61);
  -[QSSErrorBlamerRequest ref_transcript](self, "ref_transcript");
  v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (!v66)
    v66 = &stru_24E246F88;
  v68 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v66), "UTF8String");
  v69 = strlen(v68);
  v70 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v68, v69);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((_BYTE *)a3 + 70) = 1;
  v71 = *((_DWORD *)a3 + 8);
  v72 = *((_DWORD *)a3 + 12);
  v73 = *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v82);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v81);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 8, v80);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v79);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v78);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v77);
  flatbuffers::FlatBufferBuilder::AddElement<double>((flatbuffers::vector_downward *)a3, 16, v37);
  flatbuffers::FlatBufferBuilder::AddElement<double>((flatbuffers::vector_downward *)a3, 18, v39);
  if (v65)
  {
    v74 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, v65);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 20, v74);
  }
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 22, v70);
  v75.var0 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v71 - v72 + v73);
  if (v42)
    operator delete(v42);
  if (v93.__begin_)
    operator delete(v93.__begin_);
  return v75;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::ErrorBlamerRequest> v2;
  const char *v3;
  flatbuffers::FlatBufferBuilder *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;

  v11 = 0;
  v12 = 0;
  v13 = xmmword_21E34D550;
  v14 = 0u;
  v15 = 0u;
  v16 = 0;
  v17 = 1;
  v18 = 256;
  v19 = 0;
  v2.var0 = -[QSSErrorBlamerRequest addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __37__QSSErrorBlamerRequest_flatbuffData__block_invoke;
  v10[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v10[4] = v4;
  v8 = (void *)objc_msgSend(v5, "initWithBytesNoCopy:length:deallocator:", v6, v7, v10);
  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)&v11);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

flatbuffers::DetachedBuffer *__37__QSSErrorBlamerRequest_flatbuffData__block_invoke(uint64_t a1)
{
  flatbuffers::DetachedBuffer *result;

  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x2207ADCC8);
  }
  return result;
}

@end
