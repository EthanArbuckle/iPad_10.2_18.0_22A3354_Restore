@implementation TTSSiriSynthWrapper

- (TTSSiriSynthWrapper)initWithVoicePath:(id)a3 language:(id)a4 censorPlainText:(BOOL)a5 delegate:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  TTSSiriSynthWrapper *v13;
  TTSSynthesizer *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  TTSSiriSynthWrapper *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *synthesisQueue;
  uint64_t v27;
  NSMutableOrderedSet *voiceResources;
  TTSRulesetRunner *v29;
  TTSRulesetRunner *ruleSetRunner;
  uint64_t v31;
  AVAudioFormat *engineFormat;
  uint64_t v33;
  AVAudioFormat *outputFormat;
  uint64_t v35;
  AVAudioConverter *bufferConverter;
  void *__p;
  char v39;
  void *v40;
  char v41;
  objc_super v42;
  _BYTE buf[12];
  char v44;
  uint64_t v45;

  v7 = a5;
  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v42.receiver = self;
  v42.super_class = (Class)TTSSiriSynthWrapper;
  v13 = -[TTSSiriSynthWrapper init](&v42, sel_init);
  v14 = (TTSSynthesizer *)operator new();
  TTSSynthesizer::TTSSynthesizer(v14);
  v13->_synthesizer = v14;
  TTSSynthesizer::set_censor_plaintext(v14);
  AXTTSLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v16;
    _os_log_impl(&dword_215BA2000, v15, OS_LOG_TYPE_DEFAULT, "init TTSSiriSynthWrapper. censorPlainText=%@", buf, 0xCu);

  }
  objc_storeWeak((id *)&v13->_delegate, v12);
  objc_storeStrong((id *)&v13->_language, a4);
  -[TTSSiriSynthWrapper synthesizer](v13, "synthesizer");
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(&v40, "");
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  v17 = TTSSynthesizer::initialize();
  if (v39 < 0)
    operator delete(__p);
  if (v41 < 0)
    operator delete(v40);
  if (v44 < 0)
  {
    operator delete(*(void **)buf);
    if (v17)
      goto LABEL_9;
LABEL_15:
    -[TTSSiriSynthWrapper _neuralStyles](v13, "_neuralStyles");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTSSiriSynthWrapper setNeuralStyles:](v13, "setNeuralStyles:", v22);

    -[TTSSiriSynthWrapper setCurrentNeuralStyle:](v13, "setCurrentNeuralStyle:", 0);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
    v23 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v23, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue();

    v25 = dispatch_queue_create("com.siri.synthesis", v24);
    synthesisQueue = v13->_synthesisQueue;
    v13->_synthesisQueue = (OS_dispatch_queue *)v25;

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v27 = objc_claimAutoreleasedReturnValue();
    voiceResources = v13->_voiceResources;
    v13->_voiceResources = (NSMutableOrderedSet *)v27;

    v29 = (TTSRulesetRunner *)objc_alloc_init(MEMORY[0x24BEB6250]);
    ruleSetRunner = v13->_ruleSetRunner;
    v13->_ruleSetRunner = v29;

    v31 = objc_msgSend(objc_alloc(MEMORY[0x24BDB1820]), "initWithCommonFormat:sampleRate:channels:interleaved:", 3, 1, 0, 48000.0);
    engineFormat = v13->_engineFormat;
    v13->_engineFormat = (AVAudioFormat *)v31;

    v33 = objc_msgSend(objc_alloc(MEMORY[0x24BDB1820]), "initStandardFormatWithSampleRate:channels:", 1, 48000.0);
    outputFormat = v13->_outputFormat;
    v13->_outputFormat = (AVAudioFormat *)v33;

    v35 = objc_msgSend(objc_alloc(MEMORY[0x24BDB17F0]), "initFromFormat:toFormat:", v13->_engineFormat, v13->_outputFormat);
    bufferConverter = v13->_bufferConverter;
    v13->_bufferConverter = (AVAudioConverter *)v35;

    -[AVAudioConverter setPrimeMethod:](v13->_bufferConverter, "setPrimeMethod:", 2);
    v21 = v13;

    goto LABEL_16;
  }
  if (!v17)
    goto LABEL_15;
LABEL_9:
  AXTTSLogCommon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTSSiriSynthWrapper initWithVoicePath:language:censorPlainText:delegate:].cold.2(v19, buf, v18);
  }

  if (-[TTSSiriSynthWrapper synthesizer](v13, "synthesizer"))
  {
    v20 = MEMORY[0x2199ECE6C]();
    MEMORY[0x2199ECEE4](v20, 0x20C40A4A59CD2);
  }
  -[TTSSiriSynthWrapper setSynthesizer:](v13, "setSynthesizer:", 0);
  v21 = 0;
LABEL_16:

  return v21;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  if (-[TTSSiriSynthWrapper synthesizer](self, "synthesizer")
    && -[TTSSiriSynthWrapper synthesizer](self, "synthesizer"))
  {
    v3 = MEMORY[0x2199ECE6C]();
    MEMORY[0x2199ECEE4](v3, 0x20C40A4A59CD2);
  }
  v4.receiver = self;
  v4.super_class = (Class)TTSSiriSynthWrapper;
  -[TTSSiriSynthWrapper dealloc](&v4, sel_dealloc);
}

- (void)_setProsodyParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *__p;

  -[TTSSiriSynthWrapper currentNeuralStyle](self, "currentNeuralStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TTSSiriSynthWrapper synthesizer](self, "synthesizer");
    -[TTSSiriSynthWrapper currentNeuralStyle](self, "currentNeuralStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "getStyleVector");
    else
      __p = 0;
    TTSSynthesizer::set_neural_style();
    if (__p)
      operator delete(__p);

  }
}

- (id)_rawLiteralCharacterRegexForCurrentLanguage
{
  void *v2;
  int v3;
  void *v4;
  void *v5;

  -[TTSSiriSynthWrapper language](self, "language");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("da"));

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEB6240], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "regexForString:atStart:", CFSTR("[æøå]"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_neuralStyles
{
  void *v2;
  __int128 v3;
  __int128 *v4;
  __int128 *v5;
  TTSNeuralStyle *v6;
  __int128 v7;
  TTSNeuralStyle *v8;
  NSObject *v9;
  const std::string::value_type *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  void *__p;
  void *v16;
  uint64_t v17;
  std::string v18;
  void **v19[3];
  __int128 *v20;
  __int128 *v21;
  _BYTE buf[24];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  TTSSynthesizer::available_neural_styles((TTSSynthesizer *)-[TTSSiriSynthWrapper synthesizer](self, "synthesizer"));
  memset(v19, 0, sizeof(v19));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v20;
  v5 = v21;
  if (v20 != v21)
  {
    *(_QWORD *)&v3 = 136315138;
    v14 = v3;
    do
    {
      v6 = [TTSNeuralStyle alloc];
      if (*((char *)v4 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v18, *(const std::string::value_type **)v4, *((_QWORD *)v4 + 1));
      }
      else
      {
        v7 = *v4;
        v18.__r_.__value_.__r.__words[2] = *((_QWORD *)v4 + 2);
        *(_OWORD *)&v18.__r_.__value_.__l.__data_ = v7;
      }
      __p = 0;
      v16 = 0;
      v17 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, *((const void **)v4 + 6), *((_QWORD *)v4 + 7), (uint64_t)(*((_QWORD *)v4 + 7) - *((_QWORD *)v4 + 6)) >> 2);
      v8 = -[TTSNeuralStyle initWithName:vector:](v6, "initWithName:vector:", &v18, &__p);
      if (__p)
      {
        v16 = __p;
        operator delete(__p);
      }
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v18.__r_.__value_.__l.__data_);
        if (!v8)
        {
LABEL_12:
          AXTTSLogCommon();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          {
            v10 = (const std::string::value_type *)v4;
            if (*((char *)v4 + 23) < 0)
              v10 = *(const std::string::value_type **)v4;
            *(_DWORD *)buf = v14;
            *(_QWORD *)&buf[4] = v10;
            _os_log_fault_impl(&dword_215BA2000, v9, OS_LOG_TYPE_FAULT, "Siri returned style %s for which we have no localization.", buf, 0xCu);
          }

          goto LABEL_14;
        }
      }
      else if (!v8)
      {
        goto LABEL_12;
      }
      objc_msgSend(v2, "addObject:", v8, v14);
LABEL_14:

      v4 = (__int128 *)((char *)v4 + 72);
    }
    while (v4 != v5);
  }
  v11 = objc_msgSend(v2, "indexOfObjectPassingTest:", &__block_literal_global, v14);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObjectAtIndex:", v11);
    objc_msgSend(v2, "insertObject:atIndex:", v12, 0);

  }
  *(_QWORD *)buf = v19;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  v19[0] = (void **)&v20;
  std::vector<TTSSynthesizer::SpeakingStyle>::__destroy_vector::operator()[abi:ne180100](v19);
  return v2;
}

uint64_t __36__TTSSiriSynthWrapper__neuralStyles__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("siri"));

  return v3;
}

- (id)_applyPostRuleRewrites:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v4 = a3;
  -[TTSSiriSynthWrapper _rawLiteralCharacterRegexForCurrentLanguage](self, "_rawLiteralCharacterRegexForCurrentLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "originalString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB6240], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "regexForString:atStart:", CFSTR("((?<=(\\\\!|\\x1B)\\\\tn=spell\\\\)[\\s\\S]*?(?=((\\\\!|\\x1B)\\\\tn=)|$))"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "originalString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __46__TTSSiriSynthWrapper__applyPostRuleRewrites___block_invoke;
    v13[3] = &unk_24D44C170;
    v14 = v5;
    v11 = v6;
    v15 = v11;
    v16 = v4;
    objc_msgSend(v8, "enumerateMatchesInString:options:range:usingBlock:", v11, 2, 0, v10, v13);

  }
  return v4;
}

void __46__TTSSiriSynthWrapper__applyPostRuleRewrites___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v9 = v3;
    v6 = objc_msgSend(v3, "range");
    v8 = v7;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __46__TTSSiriSynthWrapper__applyPostRuleRewrites___block_invoke_2;
    v10[3] = &unk_24D44C148;
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v4, "enumerateMatchesInString:options:range:usingBlock:", v5, 2, v6, v8, v10);

    v3 = v9;
  }

}

void __46__TTSSiriSynthWrapper__applyPostRuleRewrites___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v12 = v3;
    v5 = objc_msgSend(v3, "range");
    objc_msgSend(v4, "substringWithRange:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\x1B\\tn=raw\\%@\x1B\\tn=spell\\"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 40);
    v10 = objc_msgSend(v12, "range");
    objc_msgSend(v9, "transformRange:to:", v10, v11, v8);

    v3 = v12;
  }

}

- (void)synthesizeString:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TTSSiriSynthWrapper synthesisQueue](self, "synthesisQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__TTSSiriSynthWrapper_synthesizeString___block_invoke;
  v7[3] = &unk_24D44C198;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __40__TTSSiriSynthWrapper_synthesizeString___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void ***v13;
  void **v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  void ***v18;
  uint64_t v19;
  void *v20[3];
  void *__p;
  void *v22;
  uint64_t v23;
  void *v24[2];
  char v25;
  _BYTE v26[24];
  _BYTE *v27;
  void **v28[3];
  void ***v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "bufferConverter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

  objc_msgSend(*(id *)(a1 + 32), "setSynthesizing:", 1);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "ruleSetRunner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processText:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setProcessedSpeechString:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "processedSpeechString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_applyPostRuleRewrites:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setProcessedSpeechString:", v8);

  objc_msgSend(*(id *)(a1 + 32), "processedSpeechString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transformedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v10);
  std::string::basic_string[abi:ne180100]<0>(v24, (char *)objc_msgSend(v11, "UTF8String"));
  __p = 0;
  v22 = 0;
  v23 = 0;
  memset(v20, 0, sizeof(v20));
  v12 = *(id *)(a1 + 32);
  v29 = 0;
  v13 = (void ***)operator new(0x28uLL);
  *v13 = (void **)&off_24D44C208;
  v14 = (void **)v12;
  v13[1] = v14;
  v13[2] = &__p;
  v13[3] = v20;
  v13[4] = v24;
  v29 = v13;

  objc_msgSend(*(id *)(a1 + 32), "_setProsodyParameters");
  objc_msgSend(*(id *)(a1 + 32), "synthesizer");
  v15 = (uint64_t)v29;
  if (!v29)
    goto LABEL_4;
  if (v29 != v28)
  {
    v15 = ((uint64_t (*)(void ***))(*v29)[2])(v29);
LABEL_4:
    v27 = (_BYTE *)v15;
    goto LABEL_6;
  }
  v27 = v26;
  (*((void (**)(void ***, _BYTE *))v28[0] + 3))(v28, v26);
LABEL_6:
  TTSSynthesizer::synthesize_text_with_markers_async();
  v16 = v27;
  if (v27 == v26)
  {
    v17 = 4;
    v16 = v26;
  }
  else
  {
    if (!v27)
      goto LABEL_11;
    v17 = 5;
  }
  (*(void (**)(void))(*v16 + 8 * v17))();
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "setSynthesizing:", 0);
  v18 = v29;
  if (v29 == v28)
  {
    v19 = 4;
    v18 = v28;
  }
  else
  {
    if (!v29)
      goto LABEL_16;
    v19 = 5;
  }
  ((void (*)(void))(*v18)[v19])();
LABEL_16:
  v28[0] = v20;
  std::vector<TTSSynthesizer::Marker>::__destroy_vector::operator()[abi:ne180100](v28);
  if (__p)
  {
    v22 = __p;
    operator delete(__p);
  }
  if (v25 < 0)
    operator delete(v24[0]);

}

- (void)stopSynthesis
{
  void *v3;
  NSObject *v4;

  -[TTSSiriSynthWrapper ruleSetRunner](self, "ruleSetRunner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelProcessing");

  TTSSynthesizer::stop_synthesis((TTSSynthesizer *)-[TTSSiriSynthWrapper synthesizer](self, "synthesizer"));
  -[TTSSiriSynthWrapper synthesisQueue](self, "synthesisQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v4, &__block_literal_global_93);

}

- (void)loadRuleset:(id)a3
{
  TTSSiriVoiceResource *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[TTSSiriVoiceResource init]([TTSSiriVoiceResource alloc], "init");
  -[TTSSiriVoiceResource setType:](v4, "setType:", 0);
  -[TTSSiriVoiceResource setRuleSet:](v4, "setRuleSet:", v7);
  -[TTSSiriSynthWrapper ruleSetRunner](self, "ruleSetRunner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadRuleSet:", v7);

  -[TTSSiriSynthWrapper voiceResources](self, "voiceResources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

}

- (BOOL)loadVoiceResource:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  std::string v36;
  uint64_t v37;
  std::string v38;

  v4 = a3;
  if (objc_msgSend(v4, "type"))
  {
    memset(&v38, 0, sizeof(v38));
    v5 = objc_msgSend(v4, "type");
    if (v5 < 3)
      std::string::__assign_external(&v38, off_24D44C2F0[v5], *(_QWORD *)&asc_215BB42A8[8 * v5]);
    v37 = 0;
    objc_msgSend(v4, "resourceData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "resourceData");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "bytes");

      objc_msgSend(v4, "resourceData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");
    }
    else
    {
      objc_msgSend(v4, "resourceString");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v12, "cStringUsingEncoding:", 4);

      objc_msgSend(v4, "resourceString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "lengthOfBytesUsingEncoding:", 4);
    }
    v37 = v9;

    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v36, v38.__r_.__value_.__l.__data_, v38.__r_.__value_.__l.__size_);
    else
      v36 = v38;
    -[TTSSiriSynthWrapper synthesizer](self, "synthesizer");
    TTSSynthesizer::load_voice_resource();
    v13 = v34 != 0;
    if (v34)
    {
      v32 = v34;
      v33 = v35;
      if (v35)
      {
        p_shared_owners = (unint64_t *)&v35->__shared_owners_;
        do
          v15 = __ldxr(p_shared_owners);
        while (__stxr(v15 + 1, p_shared_owners));
      }
      objc_msgSend(v4, "setSiriVoiceResource:", &v32);
      v16 = v33;
      if (v33)
      {
        v17 = (unint64_t *)&v33->__shared_owners_;
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
        }
      }
      -[TTSSiriSynthWrapper voiceResources](self, "voiceResources", v32);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v4);

    }
    v20 = v35;
    if (v35)
    {
      v21 = (unint64_t *)&v35->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v36.__r_.__value_.__l.__data_);
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v38.__r_.__value_.__l.__data_);
  }
  else
  {
    objc_msgSend(v4, "resourceData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v4, "resourceData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "resourceString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dataUsingEncoding:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v24 = (void *)MEMORY[0x24BEB6248];
    objc_msgSend(v4, "resourceName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTSSiriSynthWrapper voiceResources](self, "voiceResources");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rulesetWithData:identifier:priority:", v11, v25, objc_msgSend(v26, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRuleSet:", v27);

    -[TTSSiriSynthWrapper ruleSetRunner](self, "ruleSetRunner");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ruleSet");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "loadRuleSet:", v29);

    -[TTSSiriSynthWrapper voiceResources](self, "voiceResources");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v4);

    v13 = 1;
  }

  return v13;
}

- (BOOL)unloadVoiceResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;

  v4 = a3;
  -[TTSSiriSynthWrapper voiceResources](self, "voiceResources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  objc_msgSend(v4, "ruleSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TTSSiriSynthWrapper ruleSetRunner](self, "ruleSetRunner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ruleSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unloadRuleset:", v8);

    objc_msgSend(v4, "setRuleSet:", 0);
    v9 = 1;
  }
  else
  {
    -[TTSSiriSynthWrapper synthesizer](self, "synthesizer");
    if (v4)
    {
      objc_msgSend(v4, "siriVoiceResource");
    }
    else
    {
      v19 = 0;
      v20 = 0;
    }
    v10 = TTSSynthesizer::unload_resource();
    if (v20)
    {
      p_shared_owners = &v20->__shared_owners_;
      do
        v12 = __ldaxr((unint64_t *)p_shared_owners);
      while (__stlxr(v12 - 1, (unint64_t *)p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    v17 = 0;
    v18 = 0;
    objc_msgSend(v4, "setSiriVoiceResource:", &v17);
    v13 = v18;
    if (v18)
    {
      v14 = (unint64_t *)&v18->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v9 = v10 == 0;
  }

  return v9;
}

- (void)unloadAllVoiceResources
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[TTSSiriSynthWrapper voiceResources](self, "voiceResources", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        -[TTSSiriSynthWrapper unloadVoiceResource:](self, "unloadVoiceResource:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (TTSNeuralStyle)currentNeuralStyle
{
  return self->_currentNeuralStyle;
}

- (void)setCurrentNeuralStyle:(id)a3
{
  objc_storeStrong((id *)&self->_currentNeuralStyle, a3);
}

- (NSArray)neuralStyles
{
  return self->_neuralStyles;
}

- (void)setNeuralStyles:(id)a3
{
  objc_storeStrong((id *)&self->_neuralStyles, a3);
}

- (TTSRulesetRunner)ruleSetRunner
{
  return self->_ruleSetRunner;
}

- (void)setRuleSetRunner:(id)a3
{
  objc_storeStrong((id *)&self->_ruleSetRunner, a3);
}

- (BOOL)synthesizing
{
  return self->_synthesizing;
}

- (void)setSynthesizing:(BOOL)a3
{
  self->_synthesizing = a3;
}

- (void)synthesizer
{
  return self->_synthesizer;
}

- (void)setSynthesizer:(void *)a3
{
  self->_synthesizer = a3;
}

- (TTSSiriSynthWrapperDelegate)delegate
{
  return (TTSSiriSynthWrapperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableOrderedSet)voiceResources
{
  return self->_voiceResources;
}

- (void)setVoiceResources:(id)a3
{
  objc_storeStrong((id *)&self->_voiceResources, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (TTSSpeechString)processedSpeechString
{
  return self->_processedSpeechString;
}

- (void)setProcessedSpeechString:(id)a3
{
  objc_storeStrong((id *)&self->_processedSpeechString, a3);
}

- (OS_dispatch_queue)synthesisQueue
{
  return self->_synthesisQueue;
}

- (void)setSynthesisQueue:(id)a3
{
  objc_storeStrong((id *)&self->_synthesisQueue, a3);
}

- (AVAudioFormat)engineFormat
{
  return self->_engineFormat;
}

- (void)setEngineFormat:(id)a3
{
  objc_storeStrong((id *)&self->_engineFormat, a3);
}

- (AVAudioFormat)outputFormat
{
  return self->_outputFormat;
}

- (void)setOutputFormat:(id)a3
{
  objc_storeStrong((id *)&self->_outputFormat, a3);
}

- (AVAudioConverter)bufferConverter
{
  return self->_bufferConverter;
}

- (void)setBufferConverter:(id)a3
{
  objc_storeStrong((id *)&self->_bufferConverter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferConverter, 0);
  objc_storeStrong((id *)&self->_outputFormat, 0);
  objc_storeStrong((id *)&self->_engineFormat, 0);
  objc_storeStrong((id *)&self->_synthesisQueue, 0);
  objc_storeStrong((id *)&self->_processedSpeechString, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_voiceResources, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ruleSetRunner, 0);
  objc_storeStrong((id *)&self->_neuralStyles, 0);
  objc_storeStrong((id *)&self->_currentNeuralStyle, 0);
}

- (void)initWithVoicePath:(uint64_t)a3 language:(uint64_t)a4 censorPlainText:(uint64_t)a5 delegate:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215BA2000, a1, a3, "SiriTTSSynthesizer initialization exception", a5, a6, a7, a8, 0);
}

- (void)initWithVoicePath:(os_log_t)log language:censorPlainText:delegate:.cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_215BA2000, log, OS_LOG_TYPE_ERROR, "SiriTTSSynthesizer initialization error: %@", buf, 0xCu);

}

void __40__TTSSiriSynthWrapper_synthesizeString___block_invoke_cold_1(const std::logic_error *a1, NSObject *a2)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = std::logic_error::what(a1);
  _os_log_fault_impl(&dword_215BA2000, a2, OS_LOG_TYPE_FAULT, "Siri threw an exception instead of reporting an error via callback: %s", (uint8_t *)&v3, 0xCu);
}

- (void)loadVoiceResource:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_215BA2000, a1, a3, "Siri resource load exception.", a5, a6, a7, a8, 0);
}

@end
