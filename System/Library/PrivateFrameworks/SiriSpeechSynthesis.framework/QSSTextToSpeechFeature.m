@implementation QSSTextToSpeechFeature

- (QSSTextToSpeechFeature)initWithFlatbuffData:(id)a3
{
  return -[QSSTextToSpeechFeature initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 0);
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return -[QSSTextToSpeechFeature initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, 0, 1);
}

- (QSSTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4
{
  return -[QSSTextToSpeechFeature initWithFlatbuffData:root:verify:](self, "initWithFlatbuffData:root:verify:", a3, a4, 0);
}

- (QSSTextToSpeechFeature)initWithFlatbuffData:(id)a3 root:(const TextToSpeechFeature *)a4 verify:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  QSSTextToSpeechFeature *v10;
  QSSTextToSpeechFeature *v11;
  id *p_data;
  unsigned int *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t var0;
  uint64_t v18;
  unint64_t v19;
  siri::speech::schema_fb::TextToSpeechFeature *root;
  uint64_t v21;
  NSMutableDictionary *storage;
  QSSTextToSpeechFeature *v23;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v5 = a5;
  v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSTextToSpeechFeature;
  v10 = -[QSSTextToSpeechFeature init](&v30, sel_init);
  v11 = v10;
  if (v10)
  {
    if (!v9 || !objc_msgSend(v9, "length"))
      goto LABEL_16;
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      v13 = (unsigned int *)objc_msgSend(*p_data, "bytes");
      a4 = (const TextToSpeechFeature *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      v14 = objc_msgSend(*p_data, "bytes");
      v15 = objc_msgSend(*p_data, "length");
      var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15)
        goto LABEL_16;
      v18 = objc_msgSend(*p_data, "bytes");
      v19 = objc_msgSend(*p_data, "length");
      v25 = v18;
      v26 = v19;
      v27 = xmmword_21E34D540;
      v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF)
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      root = (siri::speech::schema_fb::TextToSpeechFeature *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::TextToSpeechFeature::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          v23 = 0;
          goto LABEL_17;
        }
      }
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v25, v26, v27, v28, v29);
    v21 = objc_claimAutoreleasedReturnValue();
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;

  }
  v23 = v11;
LABEL_17:

  return v23;
}

- (NSArray)normalized_text
{
  void *v3;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v5;
  uint64_t v6;
  const TextToSpeechFeature *v7;
  uint64_t v8;
  uint64_t v9;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  QSSTTSNormalizedText *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("normalized_text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 5u)
    {
      v6 = *(unsigned __int16 *)v5[4].var0;
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
            v12 = -[QSSTTSNormalizedText initWithFlatbuffData:root:verify:]([QSSTTSNormalizedText alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("normalized_text"));
  }
  return (NSArray *)v3;
}

- (NSArray)phoneme_sequence
{
  void *v3;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v5;
  uint64_t v6;
  const TextToSpeechFeature *v7;
  uint64_t v8;
  uint64_t v9;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  QSSTTSPhonemeSequence *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("phoneme_sequence"));
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
            v12 = -[QSSTTSPhonemeSequence initWithFlatbuffData:root:verify:]([QSSTTSPhonemeSequence alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("phoneme_sequence"));
  }
  return (NSArray *)v3;
}

- (NSArray)prompts
{
  void *v3;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v5;
  uint64_t v6;
  const TextToSpeechFeature *v7;
  uint64_t v8;
  uint64_t v9;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  QSSTTSPrompts *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("prompts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 9u)
    {
      v6 = *(unsigned __int16 *)v5[8].var0;
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
            v12 = -[QSSTTSPrompts initWithFlatbuffData:root:verify:]([QSSTTSPrompts alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("prompts"));
  }
  return (NSArray *)v3;
}

- (NSArray)replacement
{
  void *v3;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v5;
  uint64_t v6;
  const TextToSpeechFeature *v7;
  uint64_t v8;
  uint64_t v9;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  QSSTTSReplacement *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("replacement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xBu)
    {
      v6 = *(unsigned __int16 *)v5[10].var0;
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
            v12 = -[QSSTTSReplacement initWithFlatbuffData:root:verify:]([QSSTTSReplacement alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("replacement"));
  }
  return (NSArray *)v3;
}

- (NSArray)neural_phoneme_sequence
{
  void *v3;
  const TextToSpeechFeature *root;
  const TextToSpeechFeature *v5;
  uint64_t v6;
  const TextToSpeechFeature *v7;
  uint64_t v8;
  uint64_t v9;
  const TextToSpeechFeature *v10;
  uint64_t v11;
  QSSTTSNeuralPhonemeSequence *v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", CFSTR("neural_phoneme_sequence"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    root = self->_root;
    v5 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v5->var0 >= 0xDu)
    {
      v6 = *(unsigned __int16 *)v5[12].var0;
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
            v12 = -[QSSTTSNeuralPhonemeSequence initWithFlatbuffData:root:verify:]([QSSTTSNeuralPhonemeSequence alloc], "initWithFlatbuffData:root:verify:", self->_data, &v10[*(unsigned int *)v10->var0], 0);
            objc_msgSend(v3, "addObject:", v12);

            v10 += 4;
            v11 -= 4;
          }
          while (v11);
        }
      }
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v3, CFSTR("neural_phoneme_sequence"));
  }
  return (NSArray *)v3;
}

- (Offset<siri::speech::schema_fb::TextToSpeechFeature>)addObjectToBuffer:(void *)a3
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t i;
  int v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  int v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  int v27;
  int v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t j;
  int v39;
  int v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  int v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  int v54;
  int v55;
  void *v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t k;
  int v66;
  int v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  int v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  int v80;
  void *v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  void *v86;
  uint64_t v87;
  char *v88;
  uint64_t m;
  int v90;
  int v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  char *v96;
  char *v97;
  int v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  int v104;
  void *v105;
  unint64_t v106;
  char *v107;
  uint64_t v108;
  char *v109;
  void *v110;
  uint64_t v111;
  char *v112;
  uint64_t n;
  int v114;
  int v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t v119;
  char *v120;
  char *v121;
  int v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  flatbuffers::FlatBufferBuilder *v128;
  int v129;
  unsigned int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  Offset<siri::speech::schema_fb::TextToSpeechFeature> v139;
  uint64_t v141;
  unsigned int v142;
  unsigned int v143;
  void *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  char *__p;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  uint64_t v178;

  v178 = *MEMORY[0x24BDAC8D0];
  -[QSSTextToSpeechFeature normalized_text](self, "normalized_text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    if (v4 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    __p = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v4);
    v6 = &__p[4 * v5];
  }
  else
  {
    __p = 0;
    v6 = 0;
  }

  v171 = 0u;
  v172 = 0u;
  v169 = 0u;
  v170 = 0u;
  -[QSSTextToSpeechFeature normalized_text](self, "normalized_text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v169, v177, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v170;
    v10 = __p;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v170 != v9)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v169 + 1) + 8 * i), "addObjectToBuffer:", a3);
        v13 = v12;
        if (v10 >= v6)
        {
          v14 = (v10 - __p) >> 2;
          v15 = v14 + 1;
          if ((unint64_t)(v14 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v6 - __p) >> 1 > v15)
            v15 = (v6 - __p) >> 1;
          if ((unint64_t)(v6 - __p) >= 0x7FFFFFFFFFFFFFFCLL)
            v16 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v16 = v15;
          if (v16)
            v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v16);
          else
            v17 = 0;
          v18 = (char *)(v16 + 4 * v14);
          *(_DWORD *)v18 = v13;
          v19 = v18 + 4;
          if (v10 == __p)
          {
            v20 = __p;
          }
          else
          {
            v20 = __p;
            do
            {
              v21 = *((_DWORD *)v10 - 1);
              v10 -= 4;
              *((_DWORD *)v18 - 1) = v21;
              v18 -= 4;
            }
            while (v10 != __p);
          }
          v6 = (char *)(v16 + 4 * v17);
          if (v20)
            operator delete(v20);
          __p = v18;
          v10 = v19;
        }
        else
        {
          *(_DWORD *)v10 = v12;
          v10 += 4;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v169, v177, 16);
    }
    while (v8);
  }
  else
  {
    v10 = __p;
  }

  v22 = v10 - __p;
  if (v10 == __p)
    v23 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TTSNormalizedText>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TTSNormalizedText>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TTSNormalizedText>> const&)::t;
  else
    v23 = __p;
  v24 = v22 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v22 >> 2, 4uLL);
  if (__p == v10)
  {
    LODWORD(v24) = 0;
  }
  else
  {
    v25 = v23 - 4;
    v26 = v24;
    do
    {
      v27 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v25[4 * v26]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v27);
      --v26;
    }
    while (v26);
  }
  v28 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v24);
  -[QSSTextToSpeechFeature phoneme_sequence](self, "phoneme_sequence");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");
  HIDWORD(v141) = v28;
  if (v30)
  {
    if (v30 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v150 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v30);
    v32 = &v150[4 * v31];
  }
  else
  {
    v150 = 0;
    v32 = 0;
  }

  v167 = 0u;
  v168 = 0u;
  v165 = 0u;
  v166 = 0u;
  -[QSSTextToSpeechFeature phoneme_sequence](self, "phoneme_sequence");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = a3;
  v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v165, v176, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v166;
    v37 = v150;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v166 != v36)
          objc_enumerationMutation(v33);
        v39 = objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * j), "addObjectToBuffer:", v34);
        v40 = v39;
        if (v37 >= v32)
        {
          v41 = (v37 - v150) >> 2;
          v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v32 - v150) >> 1 > v42)
            v42 = (v32 - v150) >> 1;
          if ((unint64_t)(v32 - v150) >= 0x7FFFFFFFFFFFFFFCLL)
            v43 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v43 = v42;
          if (v43)
            v43 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v43);
          else
            v44 = 0;
          v45 = (char *)(v43 + 4 * v41);
          *(_DWORD *)v45 = v40;
          v46 = v45 + 4;
          if (v37 == v150)
          {
            v47 = v150;
          }
          else
          {
            v47 = v150;
            do
            {
              v48 = *((_DWORD *)v37 - 1);
              v37 -= 4;
              *((_DWORD *)v45 - 1) = v48;
              v45 -= 4;
            }
            while (v37 != v150);
          }
          v32 = (char *)(v43 + 4 * v44);
          if (v47)
            operator delete(v47);
          v150 = v45;
          v37 = v46;
          v34 = a3;
        }
        else
        {
          *(_DWORD *)v37 = v39;
          v37 += 4;
        }
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v165, v176, 16);
    }
    while (v35);
  }
  else
  {
    v37 = v150;
  }

  v49 = v37 - v150;
  if (v37 == v150)
    v50 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TTSPhonemeSequence>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TTSPhonemeSequence>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TTSPhonemeSequence>> const&)::t;
  else
    v50 = v150;
  v51 = v49 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v49 >> 2, 4uLL);
  if (v150 == v37)
  {
    LODWORD(v51) = 0;
  }
  else
  {
    v52 = v50 - 4;
    v53 = v51;
    do
    {
      v54 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v52[4 * v53]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v54);
      --v53;
    }
    while (v53);
  }
  v55 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v51);
  -[QSSTextToSpeechFeature prompts](self, "prompts");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "count");
  LODWORD(v141) = v55;
  if (v57)
  {
    if (v57 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v57);
    v60 = &v58[4 * v59];
  }
  else
  {
    v58 = 0;
    v60 = 0;
  }

  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  -[QSSTextToSpeechFeature prompts](self, "prompts");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v161, v175, 16);
  if (v62)
  {
    v63 = *(_QWORD *)v162;
    v64 = v58;
    v147 = v61;
    do
    {
      for (k = 0; k != v62; ++k)
      {
        if (*(_QWORD *)v162 != v63)
          objc_enumerationMutation(v61);
        v66 = objc_msgSend(*(id *)(*((_QWORD *)&v161 + 1) + 8 * k), "addObjectToBuffer:", a3, v141);
        v67 = v66;
        if (v64 >= v60)
        {
          v68 = (v64 - v58) >> 2;
          v69 = v68 + 1;
          if ((unint64_t)(v68 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v60 - v58) >> 1 > v69)
            v69 = (v60 - v58) >> 1;
          if ((unint64_t)(v60 - v58) >= 0x7FFFFFFFFFFFFFFCLL)
            v70 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v70 = v69;
          if (v70)
            v70 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v70);
          else
            v71 = 0;
          v72 = (char *)(v70 + 4 * v68);
          *(_DWORD *)v72 = v67;
          v73 = v72 + 4;
          while (v64 != v58)
          {
            v74 = *((_DWORD *)v64 - 1);
            v64 -= 4;
            *((_DWORD *)v72 - 1) = v74;
            v72 -= 4;
          }
          v60 = (char *)(v70 + 4 * v71);
          if (v58)
            operator delete(v58);
          v58 = v72;
          v64 = v73;
          v61 = v147;
        }
        else
        {
          *(_DWORD *)v64 = v66;
          v64 += 4;
        }
      }
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v161, v175, 16);
    }
    while (v62);
  }
  else
  {
    v64 = v58;
  }

  v75 = v64 - v58;
  if (v64 == v58)
    v76 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TTSPrompts>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TTSPrompts>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TTSPrompts>> const&)::t;
  else
    v76 = v58;
  v77 = v75 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v75 >> 2, 4uLL);
  if (v58 == v64)
  {
    LODWORD(v77) = 0;
  }
  else
  {
    v78 = v76 - 4;
    v79 = v77;
    do
    {
      v80 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v78[4 * v79]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v80);
      --v79;
    }
    while (v79);
  }
  v143 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v77);
  -[QSSTextToSpeechFeature replacement](self, "replacement");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v81, "count");
  if (v82)
  {
    if (v82 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v82);
    v85 = &v83[4 * v84];
  }
  else
  {
    v83 = 0;
    v85 = 0;
  }

  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  -[QSSTextToSpeechFeature replacement](self, "replacement");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v157, v174, 16);
  if (v87)
  {
    v145 = v86;
    v148 = *(_QWORD *)v158;
    v88 = v83;
    do
    {
      for (m = 0; m != v87; ++m)
      {
        if (*(_QWORD *)v158 != v148)
          objc_enumerationMutation(v86);
        v90 = objc_msgSend(*(id *)(*((_QWORD *)&v157 + 1) + 8 * m), "addObjectToBuffer:", a3, v141);
        v91 = v90;
        if (v88 >= v85)
        {
          v92 = (v88 - v83) >> 2;
          v93 = v92 + 1;
          if ((unint64_t)(v92 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v85 - v83) >> 1 > v93)
            v93 = (v85 - v83) >> 1;
          if ((unint64_t)(v85 - v83) >= 0x7FFFFFFFFFFFFFFCLL)
            v94 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v94 = v93;
          if (v94)
            v94 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v94);
          else
            v95 = 0;
          v96 = (char *)(v94 + 4 * v92);
          *(_DWORD *)v96 = v91;
          v97 = v96 + 4;
          while (v88 != v83)
          {
            v98 = *((_DWORD *)v88 - 1);
            v88 -= 4;
            *((_DWORD *)v96 - 1) = v98;
            v96 -= 4;
          }
          v85 = (char *)(v94 + 4 * v95);
          if (v83)
            operator delete(v83);
          v83 = v96;
          v88 = v97;
          v86 = v145;
        }
        else
        {
          *(_DWORD *)v88 = v90;
          v88 += 4;
        }
      }
      v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v157, v174, 16);
    }
    while (v87);
  }
  else
  {
    v88 = v83;
  }

  v99 = v88 - v83;
  if (v88 == v83)
    v100 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TTSReplacement>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TTSReplacement>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TTSReplacement>> const&)::t;
  else
    v100 = v83;
  v101 = v99 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v99 >> 2, 4uLL);
  if (v83 == v88)
  {
    LODWORD(v101) = 0;
  }
  else
  {
    v102 = v100 - 4;
    v103 = v101;
    do
    {
      v104 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v102[4 * v103]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v104);
      --v103;
    }
    while (v103);
  }
  v142 = flatbuffers::FlatBufferBuilder::EndVector((flatbuffers::FlatBufferBuilder *)a3, v101);
  -[QSSTextToSpeechFeature neural_phoneme_sequence](self, "neural_phoneme_sequence");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend(v105, "count");
  if (v106)
  {
    if (v106 >> 62)
      std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
    v107 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v106);
    v109 = &v107[4 * v108];
  }
  else
  {
    v107 = 0;
    v109 = 0;
  }

  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  -[QSSTextToSpeechFeature neural_phoneme_sequence](self, "neural_phoneme_sequence");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v153, v173, 16);
  if (v111)
  {
    v146 = v110;
    v149 = *(_QWORD *)v154;
    v112 = v107;
    do
    {
      for (n = 0; n != v111; ++n)
      {
        if (*(_QWORD *)v154 != v149)
          objc_enumerationMutation(v110);
        v114 = objc_msgSend(*(id *)(*((_QWORD *)&v153 + 1) + 8 * n), "addObjectToBuffer:", a3, v141);
        v115 = v114;
        if (v112 >= v109)
        {
          v116 = (v112 - v107) >> 2;
          v117 = v116 + 1;
          if ((unint64_t)(v116 + 1) >> 62)
            std::vector<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>::__throw_length_error[abi:ne180100]();
          if ((v109 - v107) >> 1 > v117)
            v117 = (v109 - v107) >> 1;
          if ((unint64_t)(v109 - v107) >= 0x7FFFFFFFFFFFFFFCLL)
            v118 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v118 = v117;
          if (v118)
            v118 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<flatbuffers::Offset<siri::speech::schema_fb::RecognitionToken>>>(v118);
          else
            v119 = 0;
          v120 = (char *)(v118 + 4 * v116);
          *(_DWORD *)v120 = v115;
          v121 = v120 + 4;
          while (v112 != v107)
          {
            v122 = *((_DWORD *)v112 - 1);
            v112 -= 4;
            *((_DWORD *)v120 - 1) = v122;
            v120 -= 4;
          }
          v109 = (char *)(v118 + 4 * v119);
          if (v107)
            operator delete(v107);
          v107 = v120;
          v112 = v121;
          v110 = v146;
        }
        else
        {
          *(_DWORD *)v112 = v114;
          v112 += 4;
        }
      }
      v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v153, v173, 16);
    }
    while (v111);
  }
  else
  {
    v112 = v107;
  }

  v123 = v112 - v107;
  if (v112 == v107)
    v124 = (char *)&flatbuffers::data<flatbuffers::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>,std::allocator<flatbuffers::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>>>(std::vector<flatbuffers::Offset<siri::speech::schema_fb::TTSNeuralPhonemeSequence>> const&)::t;
  else
    v124 = v107;
  v125 = v123 >> 2;
  flatbuffers::FlatBufferBuilder::StartVector((flatbuffers::FlatBufferBuilder *)a3, v123 >> 2, 4uLL);
  if (v107 == v112)
  {
    LODWORD(v125) = 0;
    v128 = (flatbuffers::FlatBufferBuilder *)a3;
  }
  else
  {
    v126 = v124 - 4;
    v127 = v125;
    v128 = (flatbuffers::FlatBufferBuilder *)a3;
    do
    {
      v129 = flatbuffers::FlatBufferBuilder::ReferTo((flatbuffers::FlatBufferBuilder *)a3, *(_DWORD *)&v126[4 * v127]);
      flatbuffers::FlatBufferBuilder::PushElement<unsigned int>((uint64_t)a3, v129);
      --v127;
    }
    while (v127);
  }
  v130 = flatbuffers::FlatBufferBuilder::EndVector(v128, v125);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)v128);
  *((_BYTE *)v128 + 70) = 1;
  v131 = *((_DWORD *)v128 + 8);
  v132 = *((_DWORD *)v128 + 12);
  v133 = *((_DWORD *)v128 + 10);
  if (HIDWORD(v141))
  {
    v134 = flatbuffers::FlatBufferBuilder::ReferTo(v128, HIDWORD(v141));
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 4, v134);
  }
  if ((_DWORD)v141)
  {
    v135 = flatbuffers::FlatBufferBuilder::ReferTo(v128, v141);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 6, v135);
  }
  if (v143)
  {
    v136 = flatbuffers::FlatBufferBuilder::ReferTo(v128, v143);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 8, v136);
  }
  if (v142)
  {
    v137 = flatbuffers::FlatBufferBuilder::ReferTo(v128, v142);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 10, v137);
  }
  if (v130)
  {
    v138 = flatbuffers::FlatBufferBuilder::ReferTo(v128, v130);
    flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)v128, 12, v138);
  }
  v139.var0 = flatbuffers::FlatBufferBuilder::EndTable(v128, v131 - v132 + v133);
  if (v107)
    operator delete(v107);
  if (v83)
    operator delete(v83);
  if (v58)
    operator delete(v58);
  if (v150)
    operator delete(v150);
  if (__p)
    operator delete(__p);
  return v139;
}

- (id)flatbuffData
{
  Offset<siri::speech::schema_fb::TextToSpeechFeature> v2;
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
  v2.var0 = -[QSSTextToSpeechFeature addObjectToBuffer:](self, "addObjectToBuffer:", &v11);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v11, v2.var0, v3);
  v4 = (flatbuffers::FlatBufferBuilder *)operator new();
  flatbuffers::FlatBufferBuilder::Release(v4, (uint64_t)&v11);
  v5 = objc_alloc(MEMORY[0x24BDBCE50]);
  v6 = *((_QWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__QSSTextToSpeechFeature_flatbuffData__block_invoke;
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

flatbuffers::DetachedBuffer *__38__QSSTextToSpeechFeature_flatbuffData__block_invoke(uint64_t a1)
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
