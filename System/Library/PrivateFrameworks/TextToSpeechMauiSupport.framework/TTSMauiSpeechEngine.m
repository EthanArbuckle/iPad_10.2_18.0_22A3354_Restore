@implementation TTSMauiSpeechEngine

- (TTSMauiSpeechEngine)initWithVoice:(id)a3
{
  id v5;
  TTSMauiSpeechEngine *v6;
  TTSMauiSpeechEngine *v7;
  uint64_t v8;
  NSMutableDictionary *pathDictionary;
  NSCondition *v10;
  NSCondition *producedBuffers;
  TTSRulesetRunner *v12;
  TTSRulesetRunner *ruleSetRunner;
  uint64_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *synthesisQueue;
  uint64_t v18;
  NSMutableOrderedSet *voiceResources;
  NSNumber *pitch;
  NSNumber *volume;
  NSNumber *rate;
  NSNumber *timbre;
  NSNumber *postSentencePauseDuration;
  uint64_t v25;
  NSMutableOrderedSet *finishedBuffers;
  TTSMauiSpeechEngine *v27;
  uint64_t v29;
  uint64_t v30;
  id (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id location;
  objc_super v35;

  v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)TTSMauiSpeechEngine;
  v6 = -[TTSMauiSpeechEngine init](&v35, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_3;
  objc_storeStrong((id *)&v6->_currentVoice, a3);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = objc_claimAutoreleasedReturnValue();
  pathDictionary = v7->_pathDictionary;
  v7->_pathDictionary = (NSMutableDictionary *)v8;

  v10 = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
  producedBuffers = v7->_producedBuffers;
  v7->_producedBuffers = v10;

  v12 = (TTSRulesetRunner *)objc_alloc_init(MEMORY[0x24BEB6250]);
  ruleSetRunner = v7->_ruleSetRunner;
  v7->_ruleSetRunner = v12;

  objc_initWeak(&location, v7);
  v29 = MEMORY[0x24BDAC760];
  v30 = 3221225472;
  v31 = __37__TTSMauiSpeechEngine_initWithVoice___block_invoke;
  v32 = &unk_24D27CA80;
  objc_copyWeak(&v33, &location);
  -[TTSRulesetRunner setPostRuleWriter:](v7->_ruleSetRunner, "setPostRuleWriter:", &v29);
  v7->_bufferLock._os_unfair_lock_opaque = 0;
  v7->_state = 0;
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = dispatch_queue_create("com.maui.synthesis", v15);
  synthesisQueue = v7->_synthesisQueue;
  v7->_synthesisQueue = (OS_dispatch_queue *)v16;

  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet", v29, v30, v31, v32);
  v18 = objc_claimAutoreleasedReturnValue();
  voiceResources = v7->_voiceResources;
  v7->_voiceResources = (NSMutableOrderedSet *)v18;

  pitch = v7->_pitch;
  v7->_pitch = (NSNumber *)&unk_24D2A12C0;

  volume = v7->_volume;
  v7->_volume = (NSNumber *)&unk_24D2A12D8;

  rate = v7->_rate;
  v7->_rate = (NSNumber *)&unk_24D2A12C0;

  timbre = v7->_timbre;
  v7->_timbre = (NSNumber *)&unk_24D2A12C0;

  postSentencePauseDuration = v7->_postSentencePauseDuration;
  v7->_postSentencePauseDuration = (NSNumber *)&unk_24D2A12F0;

  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v25 = objc_claimAutoreleasedReturnValue();
  finishedBuffers = v7->_finishedBuffers;
  v7->_finishedBuffers = (NSMutableOrderedSet *)v25;

  LOBYTE(v14) = -[TTSMauiSpeechEngine _initializeEngine](v7, "_initializeEngine");
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
  if ((v14 & 1) == 0)
    v27 = 0;
  else
LABEL_3:
    v27 = v7;

  return v27;
}

id __37__TTSMauiSpeechEngine_initWithVoice___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_applyPostRuleRewrites:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[TTSMauiSpeechEngine _deinitializeEngine](self, "_deinitializeEngine");
  v3.receiver = self;
  v3.super_class = (Class)TTSMauiSpeechEngine;
  -[TTSMauiSpeechEngine dealloc](&v3, sel_dealloc);
}

- (BOOL)setVoice:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TTSMauiSpeechEngine cancelSpeaking](self, "cancelSpeaking");
  -[TTSMauiSpeechEngine unloadAllVoiceResources](self, "unloadAllVoiceResources");
  -[TTSMauiSpeechEngine _deinitializeEngine](self, "_deinitializeEngine");
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTSMauiSpeechEngine setVoiceResources:](self, "setVoiceResources:", v5);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTSMauiSpeechEngine setPathDictionary:](self, "setPathDictionary:", v6);

  -[TTSMauiSpeechEngine setBrokerString:](self, "setBrokerString:", 0);
  -[TTSMauiSpeechEngine setCurrentVoice:](self, "setCurrentVoice:", v4);

  return -[TTSMauiSpeechEngine _initializeEngine](self, "_initializeEngine");
}

- (NSOrderedSet)loadedResources
{
  return (NSOrderedSet *)self->_voiceResources;
}

- (VE_DATA_STREAM_INTERFACE_S)dataStreamImpl
{
  if (dataStreamImpl_onceToken != -1)
    dispatch_once(&dataStreamImpl_onceToken, &__block_literal_global);
  return (VE_DATA_STREAM_INTERFACE_S *)&dataStreamImpl_interface;
}

__n128 __37__TTSMauiSpeechEngine_dataStreamImpl__block_invoke()
{
  uint64_t (**DataStreamImpl)();
  __n128 result;
  __int128 v2;
  __int128 v3;

  DataStreamImpl = TTSMauiVocalizerGetDataStreamImpl();
  v2 = *((_OWORD *)DataStreamImpl + 1);
  result = *((__n128 *)DataStreamImpl + 2);
  v3 = *(_OWORD *)DataStreamImpl;
  qword_254DA7170 = (uint64_t)DataStreamImpl[6];
  xmmword_254DA7150 = v2;
  unk_254DA7160 = result;
  dataStreamImpl_interface = v3;
  *(_QWORD *)&dataStreamImpl_interface = MauiStreamOpen;
  return result;
}

- (VE_DATA_MAPPING_INTERFACE_S)dataMapImpl
{
  if (dataMapImpl_onceToken != -1)
    dispatch_once(&dataMapImpl_onceToken, &__block_literal_global_87);
  return (VE_DATA_MAPPING_INTERFACE_S *)&dataMapImpl_interface;
}

__n128 __34__TTSMauiSpeechEngine_dataMapImpl__block_invoke()
{
  uint64_t (**DataMappingImpl)();
  uint64_t v1;
  __n128 result;

  DataMappingImpl = TTSMauiVocalizerGetDataMappingImpl();
  v1 = (uint64_t)DataMappingImpl[4];
  result = *((__n128 *)DataMappingImpl + 1);
  dataMapImpl_interface = *(_OWORD *)DataMappingImpl;
  *(__n128 *)algn_254DA7190 = result;
  qword_254DA71A0 = v1;
  *(_QWORD *)&dataMapImpl_interface = MauiMappingOpen;
  return result;
}

- (unsigned)open:(id)a3 mode:(id)a4 outPointer:(__sFILE *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  const char *v12;
  id v13;
  FILE *v14;
  unsigned int v15;

  v8 = a4;
  v9 = a3;
  -[TTSMauiSpeechEngine pathDictionary](self, "pathDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation");
    v13 = objc_retainAutorelease(v8);
    v14 = fopen(v12, (const char *)objc_msgSend(v13, "cStringUsingEncoding:", objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding")));
    if (v14)
    {
      v15 = 0;
      *a5 = v14;
    }
    else
    {
      v15 = -2147483645;
    }
  }
  else
  {
    v15 = -2147483628;
  }

  return v15;
}

- (id)emptyBufferForVocalizer
{
  if (-[TTSMauiSpeechEngine state](self, "state") == 3)
    return 0;
  AX_PERFORM_WITH_LOCK();
  -[TTSMauiSpeechEngine inProgressBuffer](self, "inProgressBuffer");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __46__TTSMauiSpeechEngine_emptyBufferForVocalizer__block_invoke(uint64_t a1)
{
  TTSMauiVocalizerBuffer *v2;

  v2 = objc_alloc_init(TTSMauiVocalizerBuffer);
  objc_msgSend(*(id *)(a1 + 32), "setInProgressBuffer:", v2);

}

- (void)bufferDone:(id *)a3
{
  AX_PERFORM_WITH_LOCK();
}

void __34__TTSMauiSpeechEngine_bufferDone___block_invoke(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "inProgressBuffer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8);
    objc_msgSend(*(id *)(a1 + 32), "inProgressBuffer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioBuffer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "format");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v3 / *(_DWORD *)(objc_msgSend(v6, "streamDescription") + 24);

    objc_msgSend(*(id *)(a1 + 32), "inProgressBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "audioBuffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFrameLength:", v7);

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
    objc_msgSend(*(id *)(a1 + 32), "inProgressBuffer");
    v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v11[225] = v10;

    objc_msgSend(*(id *)(a1 + 32), "inProgressBuffer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "proccessedSpeechString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "computeMarkers:", v13);

    objc_msgSend(*(id *)(a1 + 32), "finishedBuffers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "inProgressBuffer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

    objc_msgSend(*(id *)(a1 + 32), "setInProgressBuffer:", 0);
    objc_msgSend(*(id *)(a1 + 32), "producedBuffers");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "broadcast");

  }
}

- (id)nextBuffer
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  NSCondition *producedBuffers;
  void *v7;
  void *v8;

  while (1)
  {
    v3 = -[TTSMauiSpeechEngine state](self, "state");
    v4 = v3;
    if (v3 != 4 && v3 != 2)
      break;
    -[TTSMauiSpeechEngine _nextBuffer](self, "_nextBuffer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      return v5;
    if (v4 != 2)
      break;
    producedBuffers = self->_producedBuffers;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingTimeInterval:", 0.5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCondition waitUntilDate:](producedBuffers, "waitUntilDate:", v8);

  }
  v5 = 0;
  return v5;
}

- (id)_nextBuffer
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  v9 = 0;
  AX_PERFORM_WITH_LOCK();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __34__TTSMauiSpeechEngine__nextBuffer__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "finishedBuffers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedBuffers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(a1 + 32), "finishedBuffers");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  }
}

- (unsigned)processingCallback:(id *)a3
{
  void *v4;
  void *v5;

  if (a3->var0 == 16)
  {
    -[TTSMauiSpeechEngine bufferDone:](self, "bufferDone:", a3->var2);
    return 0;
  }
  if (a3->var0 != 8)
    return 0;
  -[TTSMauiSpeechEngine emptyBufferForVocalizer](self, "emptyBufferForVocalizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "fillInOutDataForBuffer:", a3->var2);

    return 0;
  }
  return -2147481593;
}

- (void)speakSSMLString:(id)a3
{
  -[TTSMauiSpeechEngine _speakString:withFormat:](self, "_speakString:withFormat:", a3, 1);
}

- (void)speakString:(id)a3
{
  -[TTSMauiSpeechEngine _speakString:withFormat:](self, "_speakString:withFormat:", a3, 0);
}

- (id)_preprocessText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "precomposedStringWithCanonicalMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTSMauiSpeechEngine currentVoice](self, "currentVoice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("ko"));

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BEB6240], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "regexForString:atStart:", CFSTR("[\\u1100-\\u1112\\u1161-\\u1175\\u11A8-\\u11AF\\u11B7-\\u11C2\\uD558]"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v10;
    objc_msgSend(v10, "matchesInString:options:range:", v5, 2, 0, objc_msgSend(v5, "length"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v15);
          if (v16)
          {
            v17 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v15), "range");
            objc_msgSend(v5, "substringWithRange:", v17, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v16, "range");
            v22 = v21;
            TTSChoseong_JongseongToHangul();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", v20, v22, v23);
            v24 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v24;
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v13);
    }

  }
  return v5;
}

- (void)_speakString:(id)a3 withFormat:(int)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  int v14;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  -[TTSMauiSpeechEngine cancelSpeaking](self, "cancelSpeaking");
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy_;
  v15[4] = __Block_byref_object_dispose_;
  v7 = v6;
  v16 = v7;
  -[TTSMauiSpeechEngine _preprocessText:](self, "_preprocessText:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TTSMauiSpeechEngine setState:](self, "setState:", 2);
  -[TTSMauiSpeechEngine synthesisQueue](self, "synthesisQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__TTSMauiSpeechEngine__speakString_withFormat___block_invoke;
  v11[3] = &unk_24D27CB80;
  v11[4] = self;
  v12 = v8;
  v13 = v15;
  v14 = a4;
  v10 = v8;
  dispatch_async(v9, v11);

  _Block_object_dispose(v15, 8);
}

void __47__TTSMauiSpeechEngine__speakString_withFormat___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
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
  void *v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  _QWORD v32[3];

  v2 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "ruleSetRunner");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processText:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setProccessedSpeechString:", v4);

    objc_msgSend(*(id *)(a1 + 32), "proccessedSpeechString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transformedString");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = CFSTR(" ");

    }
    objc_msgSend(MEMORY[0x24BEB6240], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "regexForString:atStart:", CFSTR("((\\\\!|\\x1B)\\\\(rate|pitch|vol|tn)=(\\d|spell|normal)*\\\\)*(?=(((\\\\!|\\x1B)\\\\pause=(\\d)*\\\\)*$))"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "firstMatchInString:options:range:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 2, 0, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v16 = objc_msgSend(v13, "range");
      objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", v16, v17, &stru_24D29CC78);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

    }
    objc_msgSend(MEMORY[0x24BEB6240], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "regexForString:", CFSTR("(?:(?:\\\\!|\\x1B)\\\\pause=(?:\\d)*\\\\)+\\s*$"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "firstMatchInString:options:range:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 2, 0, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "length"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23 == 0;

    objc_msgSend(*(id *)(a1 + 32), "setTrimEndingSilences:", v24);
    v32[0] = 0;
    LODWORD(v32[0]) = *(_DWORD *)(a1 + 56);
    v32[1] = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "lengthOfBytesUsingEncoding:", 10);
    v32[2] = objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)), "cStringUsingEncoding:", 10);
    v25 = objc_msgSend(*(id *)(a1 + 32), "vocalizerInstanceHandle");
    v27 = ve_ttsProcessText2Speech(v25, v26, (uint64_t)v32);
    if ((_DWORD)v27 != -2147481593)
    {
      v28 = v27;
      if ((_DWORD)v27)
      {
        AXTTSLogCommon();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          __47__TTSMauiSpeechEngine__speakString_withFormat___block_invoke_cold_1(v2, v28, v30);

        v29 = 3;
      }
      else
      {
        v29 = 4;
      }
      objc_msgSend(*v2, "setState:", v29);
    }
    objc_msgSend(*v2, "producedBuffers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "broadcast");

  }
}

- (void)cancelSpeaking
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[TTSMauiSpeechEngine setState:](self, "setState:", 3);
  -[TTSMauiSpeechEngine ruleSetRunner](self, "ruleSetRunner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelProcessing");

  -[TTSMauiSpeechEngine synthesisQueue](self, "synthesisQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__TTSMauiSpeechEngine_cancelSpeaking__block_invoke;
  block[3] = &unk_24D27CB08;
  block[4] = self;
  dispatch_sync(v4, block);

}

uint64_t __37__TTSMauiSpeechEngine_cancelSpeaking__block_invoke(uint64_t a1)
{
  AX_PERFORM_WITH_LOCK();
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
}

void __37__TTSMauiSpeechEngine_cancelSpeaking__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setInProgressBuffer:", 0);
  objc_msgSend(*(id *)(a1 + 32), "finishedBuffers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "setInProgressBuffer:", 0);
  objc_msgSend(*(id *)(a1 + 32), "producedBuffers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "broadcast");

}

- (void)setRate:(id)a3
{
  NSNumber *v4;
  NSNumber *rate;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToNumber:", self->_rate) & 1) == 0)
  {
    -[TTSMauiSpeechEngine _vocalizerClampNumber:between:and:](self, "_vocalizerClampNumber:between:and:", v6, 50, 400);
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    rate = self->_rate;
    self->_rate = v4;

    -[TTSMauiSpeechEngine _syncParametersWithEngine](self, "_syncParametersWithEngine");
  }

}

- (void)setPitch:(id)a3
{
  NSNumber *v4;
  NSNumber *pitch;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToNumber:", self->_pitch) & 1) == 0)
  {
    -[TTSMauiSpeechEngine _vocalizerClampNumber:between:and:](self, "_vocalizerClampNumber:between:and:", v6, 50, 200);
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    pitch = self->_pitch;
    self->_pitch = v4;

    -[TTSMauiSpeechEngine _syncParametersWithEngine](self, "_syncParametersWithEngine");
  }

}

- (void)setVolume:(id)a3
{
  NSNumber *v4;
  NSNumber *volume;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToNumber:", self->_volume) & 1) == 0)
  {
    -[TTSMauiSpeechEngine _vocalizerClampNumber:between:and:](self, "_vocalizerClampNumber:between:and:", v6, 0, 100);
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    volume = self->_volume;
    self->_volume = v4;

    -[TTSMauiSpeechEngine _syncParametersWithEngine](self, "_syncParametersWithEngine");
  }

}

- (void)setTimbre:(id)a3
{
  NSNumber *v4;
  NSNumber *timbre;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToNumber:", self->_timbre) & 1) == 0)
  {
    -[TTSMauiSpeechEngine _vocalizerClampNumber:between:and:](self, "_vocalizerClampNumber:between:and:", v6, 50, 200);
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    timbre = self->_timbre;
    self->_timbre = v4;

    -[TTSMauiSpeechEngine _syncParametersWithEngine](self, "_syncParametersWithEngine");
  }

}

- (void)setPostSentencePauseDuration:(id)a3
{
  NSNumber *v4;
  NSNumber *postSentencePauseDuration;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToNumber:", self->_postSentencePauseDuration) & 1) == 0)
  {
    -[TTSMauiSpeechEngine _vocalizerClampNumber:between:and:](self, "_vocalizerClampNumber:between:and:", v6, 0, 9);
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    postSentencePauseDuration = self->_postSentencePauseDuration;
    self->_postSentencePauseDuration = v4;

    -[TTSMauiSpeechEngine _syncParametersWithEngine](self, "_syncParametersWithEngine");
  }

}

- (id)_vocalizerClampNumber:(id)a3 between:(unsigned __int16)a4 and:(unsigned __int16)a5
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  v5 = a5;
  v6 = a4;
  v7 = objc_msgSend(a3, "unsignedShortValue");
  if (v7 >= v5)
    v8 = v5;
  else
    v8 = v7;
  if (v7 >= v6)
    v9 = v8;
  else
    v9 = v6;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v9);
}

- (BOOL)_initializeVoiceDataFiles
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:inDirectory:", CFSTR("common"), 0, CFSTR("TTSResources"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[TTSMauiSpeechEngine _addPathDictionaryEntriesForDirectory:](self, "_addPathDictionaryEntriesForDirectory:", v4))
  {
    AXTTSLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[TTSMauiSpeechEngine _initializeVoiceDataFiles].cold.1();

  }
  -[TTSMauiSpeechEngine currentVoice](self, "currentVoice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TTSMauiSpeechEngine _addPathDictionaryEntriesForDirectory:](self, "_addPathDictionaryEntriesForDirectory:", v7);

  return v8;
}

- (BOOL)_addPathDictionaryEntriesForDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v18;
  NSObject *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, &v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v24;

  if (v7)
  {
    AXTTSLogCommon();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      -[TTSMauiSpeechEngine _addPathDictionaryEntriesForDirectory:].cold.1();
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = v6;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v8)
    {
      v9 = v8;
      v18 = v6;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v4, "stringByAppendingPathComponent:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByDeletingPathExtension");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("/"));
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v12, "hasSuffix:", CFSTR(".hdr")) & 1) != 0
            || objc_msgSend(v12, "hasSuffix:", CFSTR(".hdr.asset")))
          {

            v15 = CFSTR("broker");
          }
          -[TTSMauiSpeechEngine pathDictionary](self, "pathDictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, v15);

        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v9);
      v7 = 0;
      v6 = v18;
    }
  }

  return v7 == 0;
}

- (id)_parseBrokerString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v26;
  id v27;
  id obj;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BEB6240], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regexForString:atStart:", CFSTR("([\\s]*<(?<parameter>.*)>(?<value>.*)<\\/.*>\\n)"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v26 = v5;
  v29 = v3;
  objc_msgSend(v5, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    v9 = CFSTR("parameter");
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "rangeWithName:", v9);
        v14 = v13;
        v15 = objc_msgSend(v11, "rangeWithName:", CFSTR("value"));
        if (v14)
          v17 = v16 == 0;
        else
          v17 = 1;
        if (!v17)
        {
          v18 = v15;
          v19 = v16;
          v20 = v9;
          objc_msgSend(v29, "substringWithRange:", v12, v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "uppercaseString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("COMPONENT"));

          if ((v23 & 1) == 0)
          {
            objc_msgSend(v29, "substringWithRange:", v18, v19);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setObject:forKeyedSubscript:", v24, v21);

          }
          v9 = v20;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }

  return v27;
}

- (void)_deinitializeEngine
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  v3 = -[TTSMauiSpeechEngine vocalizerInstanceHandle](self, "vocalizerInstanceHandle");
  ve_ttsClose(v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = -[TTSMauiSpeechEngine vocalizerClassHandle](self, "vocalizerClassHandle");
  ve_ttsUnInitialize(v11, v12);
  -[TTSMauiSpeechEngine setState:](self, "setState:", 0);
}

- (void)setTrimEndingSilences:(BOOL)a3
{
  __int16 v3;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _WORD v12[1054];
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  bzero(v12, 0x83CuLL);
  v11 = 22;
  v12[0] = v3;
  v5 = -[TTSMauiSpeechEngine vocalizerInstanceHandle](self, "vocalizerInstanceHandle");
  ve_ttsSetParamList(v5, v6, &v11, 1, v7, v8, v9, v10);
}

- (BOOL)_initializeEngine
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  NSObject *v42;
  char *__source;
  _QWORD v44[2];
  uint64_t v45;
  uint64_t v46;
  uint64_t __b;
  uint64_t v48;
  _QWORD v49[17];
  id v50;
  int v51;
  char v52[128];
  int v53;
  char v54[128];
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  if (-[TTSMauiSpeechEngine _initializeVoiceDataFiles](self, "_initializeVoiceDataFiles"))
  {
    -[TTSMauiSpeechEngine pathDictionary](self, "pathDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("broker"));
    v4 = objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      AXTTSLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[TTSMauiSpeechEngine _initializeEngine].cold.1(self);
      v14 = 0;
      goto LABEL_19;
    }
    v50 = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v4, 4, &v50);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v50;
    v7 = v6;
    if (!v5 || v6)
    {
      AXTTSLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[TTSMauiSpeechEngine _initializeEngine].cold.2(self);
      goto LABEL_17;
    }
    -[TTSMauiSpeechEngine setBrokerString:](self, "setBrokerString:", v5);
    -[TTSMauiSpeechEngine brokerString](self, "brokerString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTSMauiSpeechEngine _parseBrokerString:](self, "_parseBrokerString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v49[0] = 8963;
    -[TTSMauiSpeechEngine brokerString](self, "brokerString");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v49[1] = objc_msgSend(v10, "cStringUsingEncoding:", objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
    v49[2] = TTSMauiVocalizerGetHeapImpl();
    v49[3] = 0;
    v49[4] = TTSMauiVocalizerGetCriticalSectionImpl();
    v49[5] = 0;
    v49[6] = -[TTSMauiSpeechEngine dataStreamImpl](self, "dataStreamImpl");
    v49[7] = -[TTSMauiSpeechEngine dataMapImpl](self, "dataMapImpl");
    v49[8] = TTSMauiVocalizerGetDLDImpl();
    v49[9] = self;
    v49[10] = TTSMauiVocalizerGetLogImpl();
    memset(&v49[11], 0, 24);
    v49[14] = TTSMauiVocalizerGetThreadImpl();
    v49[15] = TTSMauiVocalizerGetSemaphoreImpl();
    v49[16] = 0;

    __b = 0;
    v48 = 0;
    v11 = ve_ttsInitialize((uint64_t)v49, &__b);
    if ((_DWORD)v11)
    {
      v12 = v11;
      AXTTSLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[TTSMauiSpeechEngine _initializeEngine].cold.7(self, v12, v13);

LABEL_17:
      v14 = 0;
LABEL_18:

LABEL_19:
      goto LABEL_20;
    }
    -[TTSMauiSpeechEngine setVocalizerClassHandle:](self, "setVocalizerClassHandle:", __b, v48);
    v45 = 0;
    v46 = 0;
    v16 = -[TTSMauiSpeechEngine vocalizerClassHandle](self, "vocalizerClassHandle");
    if (ve_ttsOpen(v16, v17, 0, 0, (uint64_t)&v45, v18, v19, v20))
    {
      AXTTSLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[TTSMauiSpeechEngine _initializeEngine].cold.6(self);
      v14 = 0;
      goto LABEL_35;
    }
    -[TTSMauiSpeechEngine setVocalizerInstanceHandle:](self, "setVocalizerInstanceHandle:", v45, v46);
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("voice"));
    v21 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("langcode"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v21 && v22)
    {
      v24 = objc_retainAutorelease(v21);
      __source = (char *)-[NSObject cStringUsingEncoding:](v24, "cStringUsingEncoding:", objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
      v25 = objc_retainAutorelease(v23);
      v26 = (const char *)objc_msgSend(v25, "cStringUsingEncoding:", objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
      bzero(v52, 0x83CuLL);
      v51 = 1;
      strlcpy(v52, v26, 0x80uLL);
      v53 = 2;
      strlcpy(v54, __source, 0x80uLL);
      v55 = 19;
      v56 = 1;
      v57 = 7;
      v58 = 1;
      v27 = -[TTSMauiSpeechEngine vocalizerInstanceHandle](self, "vocalizerInstanceHandle");
      if (!ve_ttsSetParamList(v27, v28, &v51, 4, v29, v30, v31, v32))
      {
        v44[0] = self;
        v44[1] = MauiProcCallback;
        v34 = -[TTSMauiSpeechEngine vocalizerInstanceHandle](self, "vocalizerInstanceHandle");
        v41 = ve_ttsSetOutDevice(v34, v35, (uint64_t)v44, v36, v37, v38, v39, v40);
        v14 = v41 == 0;
        if (v41)
        {
          AXTTSLogCommon();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            -[TTSMauiSpeechEngine _initializeEngine].cold.4(self);

        }
        else
        {
          -[TTSMauiSpeechEngine setState:](self, "setState:", 1);
          -[TTSMauiSpeechEngine _syncParametersWithEngine](self, "_syncParametersWithEngine");
        }
        goto LABEL_34;
      }
      AXTTSLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[TTSMauiSpeechEngine _initializeEngine].cold.5(self);
    }
    else
    {
      AXTTSLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[TTSMauiSpeechEngine _initializeEngine].cold.3(self);
    }

    v14 = 0;
LABEL_34:

LABEL_35:
    goto LABEL_18;
  }
  AXTTSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[TTSMauiSpeechEngine _initializeEngine].cold.8(self);
  v14 = 0;
LABEL_20:

  return v14;
}

- (id)_rawLiteralCharacterRegexForCurrentLanguage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  -[TTSMauiSpeechEngine currentVoice](self, "currentVoice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "hasPrefix:", CFSTR("el")))
  {
    objc_msgSend(MEMORY[0x24BEB6240], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("[\\u03B1-\\u03C9]");
  }
  else if (objc_msgSend(v3, "hasPrefix:", CFSTR("da")))
  {
    objc_msgSend(MEMORY[0x24BEB6240], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("[æøå]");
  }
  else
  {
    if (!objc_msgSend(v3, "hasPrefix:", CFSTR("ja")))
    {
      v7 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BEB6240], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("[\\u30a0-\\u30ff]");
  }
  objc_msgSend(v4, "regexForString:atStart:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v7;
}

- (id)_applyPostRuleRewrites:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;

  v4 = a3;
  -[TTSMauiSpeechEngine _rawLiteralCharacterRegexForCurrentLanguage](self, "_rawLiteralCharacterRegexForCurrentLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTSMauiSpeechEngine currentVoice](self, "currentVoice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("ja"));

  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    objc_msgSend(v4, "originalString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB6240], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "regexForString:atStart:", CFSTR("((?<=(\\\\!|\\x1B)\\\\tn=spell\\\\)[\\s\\S]*?(?=((\\\\!|\\x1B)\\\\tn=)|$))"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEB6240], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "regexForString:atStart:", CFSTR("[ぁぃぅぇぉっゃゅょァィゥェォッャュョァィゥェォャュョッㇱっ]"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "originalString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");
    v30[0] = v9;
    v30[1] = 3221225472;
    v30[2] = __46__TTSMauiSpeechEngine__applyPostRuleRewrites___block_invoke;
    v30[3] = &unk_24D27CBD0;
    v31 = v14;
    v32 = v10;
    v33 = v4;
    v17 = v10;
    v18 = v14;
    objc_msgSend(v12, "enumerateMatchesInString:options:range:usingBlock:", v17, 2, 0, v16, v30);

  }
  if (v5)
  {
    objc_msgSend(v4, "originalString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB6240], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "regexForString:atStart:", CFSTR("((?<=(\\\\!|\\x1B)\\\\tn=spell\\\\)[\\s\\S]*?(?=((\\\\!|\\x1B)\\\\tn=)|$))"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "originalString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");
    v26[0] = v9;
    v26[1] = 3221225472;
    v26[2] = __46__TTSMauiSpeechEngine__applyPostRuleRewrites___block_invoke_3;
    v26[3] = &unk_24D27CBD0;
    v27 = v5;
    v28 = v19;
    v29 = v4;
    v24 = v19;
    objc_msgSend(v21, "enumerateMatchesInString:options:range:usingBlock:", v24, 2, 0, v23, v26);

  }
  return v4;
}

void __46__TTSMauiSpeechEngine__applyPostRuleRewrites___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = objc_msgSend(a2, "range");
    v7 = v6;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __46__TTSMauiSpeechEngine__applyPostRuleRewrites___block_invoke_2;
    v8[3] = &unk_24D27CBA8;
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v3, "enumerateMatchesInString:options:range:usingBlock:", v4, 2, v5, v7, v8);

  }
}

void __46__TTSMauiSpeechEngine__applyPostRuleRewrites___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    v5 = objc_msgSend(v4, "range");
    objc_msgSend(v3, "substringWithRange:", v5, v6);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("っ")) & 1) != 0
      || (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("ッ")) & 1) != 0
      || (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("ッ")) & 1) != 0
      || -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("ㇱ")))
    {

      v7 = CFSTR("つ");
    }
    else
    {
      v7 = v13;
    }
    v14 = (__CFString *)v7;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\x1B\\tn=normal\\%@\x1B\\pause=100\\%@\x1B\\pause=100\\\x1B\\tn=spell\\"), CFSTR("小さい"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 40);
    v10 = objc_msgSend(v4, "range");
    v12 = v11;

    objc_msgSend(v9, "transformRange:to:", v10, v12, v8);
  }
}

void __46__TTSMauiSpeechEngine__applyPostRuleRewrites___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = objc_msgSend(a2, "range");
    v7 = v6;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __46__TTSMauiSpeechEngine__applyPostRuleRewrites___block_invoke_4;
    v8[3] = &unk_24D27CBA8;
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v3, "enumerateMatchesInString:options:range:usingBlock:", v4, 2, v5, v7, v8);

  }
}

void __46__TTSMauiSpeechEngine__applyPostRuleRewrites___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    v5 = objc_msgSend(v4, "range");
    objc_msgSend(v3, "substringWithRange:", v5, v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\x1B\\tn=raw\\%@\x1B\\tn=spell\\"), v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 40);
    v9 = objc_msgSend(v4, "range");
    v11 = v10;

    objc_msgSend(v8, "transformRange:to:", v9, v11, v7);
  }
}

- (void)_syncParametersWithEngine
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "rate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pitch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "volume");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timbre");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138413314;
  v12 = v6;
  v13 = 2112;
  v14 = v7;
  v15 = 2112;
  v16 = v8;
  v17 = 2112;
  v18 = v9;
  v19 = 2112;
  v20 = v10;
  _os_log_error_impl(&dword_214A39000, a3, OS_LOG_TYPE_ERROR, "Failed to set vocalizer paramters rate: %@ pitch: %@ volume: %@ timbre: %@ error: %@", (uint8_t *)&v11, 0x34u);

}

- (BOOL)loadVoiceResource:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[TTSMauiSpeechEngine synthesisQueue](self, "synthesisQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__TTSMauiSpeechEngine_loadVoiceResource___block_invoke;
  block[3] = &unk_24D27CBF8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __41__TTSMauiSpeechEngine_loadVoiceResource___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_loadVoiceResource:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)loadRuleset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  TTSMauiVoiceResource *v7;

  v4 = a3;
  v7 = -[TTSMauiVoiceResource init]([TTSMauiVoiceResource alloc], "init");
  -[TTSMauiVoiceResource setType:](v7, "setType:", 0);
  -[TTSMauiVoiceResource setRuleSet:](v7, "setRuleSet:", v4);
  -[TTSMauiSpeechEngine ruleSetRunner](self, "ruleSetRunner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadRuleSet:", v4);

  -[TTSMauiSpeechEngine voiceResources](self, "voiceResources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

- (BOOL)_loadVoiceResource:(id)a3
{
  id v4;
  unint64_t v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  if (objc_msgSend(v4, "type"))
  {
    v5 = objc_msgSend(v4, "type");
    if (v5 > 2)
      v6 = "";
    else
      v6 = off_24D27CC18[v5];
    objc_msgSend(v4, "resourceData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "resourceData");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = (char *)objc_msgSend(v10, "bytes");

      objc_msgSend(v4, "resourceData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");
    }
    else
    {
      objc_msgSend(v4, "resourceString");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = (char *)objc_msgSend(v14, "cStringUsingEncoding:", 4);

      objc_msgSend(v4, "resourceString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "lengthOfBytesUsingEncoding:", 4);
    }
    v15 = v13;

    v31 = 0;
    v32 = 0;
    v16 = -[TTSMauiSpeechEngine vocalizerInstanceHandle](self, "vocalizerInstanceHandle");
    v20 = ve_ttsResourceLoad(v16, v17, v6, v15, v11, &v31, v18, v19);
    v21 = v20 == 0;
    if (!v20)
    {
      objc_msgSend(v4, "setVoiceResourceHandle:", v31, v32);
      -[TTSMauiSpeechEngine voiceResources](self, "voiceResources");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v4);

    }
  }
  else
  {
    objc_msgSend(v4, "resourceData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "resourceData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "resourceString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dataUsingEncoding:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v24 = (void *)MEMORY[0x24BEB6248];
    objc_msgSend(v4, "resourceName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TTSMauiSpeechEngine loadedResources](self, "loadedResources");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rulesetWithData:identifier:priority:", v8, v25, objc_msgSend(v26, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setRuleSet:", v27);
    -[TTSMauiSpeechEngine ruleSetRunner](self, "ruleSetRunner");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "loadRuleSet:", v27);

    -[TTSMauiSpeechEngine voiceResources](self, "voiceResources");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v4);

    v21 = 1;
  }

  return v21;
}

- (BOOL)unloadVoiceResource:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[TTSMauiSpeechEngine synthesisQueue](self, "synthesisQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__TTSMauiSpeechEngine_unloadVoiceResource___block_invoke;
  block[3] = &unk_24D27CBF8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __43__TTSMauiSpeechEngine_unloadVoiceResource___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "queue_unloadVoiceResource:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)queue_unloadVoiceResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  -[TTSMauiSpeechEngine voiceResources](self, "voiceResources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  objc_msgSend(v4, "ruleSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TTSMauiSpeechEngine ruleSetRunner](self, "ruleSetRunner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ruleSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unloadRuleset:", v8);

    objc_msgSend(v4, "setRuleSet:", 0);
    v9 = 0;
  }
  else
  {
    v10 = -[TTSMauiSpeechEngine vocalizerInstanceHandle](self, "vocalizerInstanceHandle");
    v12 = v11;
    v13 = (uint64_t *)objc_msgSend(v4, "voiceResourceHandle");
    v9 = ve_ttsResourceUnload(v10, v12, v13, v14, v15, v16, v17, v18) == 0;
  }

  return v9;
}

- (void)unloadAllVoiceResources
{
  NSObject *v3;
  _QWORD block[5];

  -[TTSMauiSpeechEngine synthesisQueue](self, "synthesisQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__TTSMauiSpeechEngine_unloadAllVoiceResources__block_invoke;
  block[3] = &unk_24D27CB08;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __46__TTSMauiSpeechEngine_unloadAllVoiceResources__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_unloadAllVoiceResources");
}

- (void)queue_unloadAllVoiceResources
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[TTSMauiSpeechEngine voiceResources](self, "voiceResources", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[TTSMauiSpeechEngine queue_unloadVoiceResource:](self, "queue_unloadVoiceResource:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (TTSRulesetRunner)ruleSetRunner
{
  return self->_ruleSetRunner;
}

- (void)setRuleSetRunner:(id)a3
{
  objc_storeStrong((id *)&self->_ruleSetRunner, a3);
}

- (NSNumber)pitch
{
  return self->_pitch;
}

- (NSNumber)rate
{
  return self->_rate;
}

- (NSNumber)volume
{
  return self->_volume;
}

- (NSNumber)timbre
{
  return self->_timbre;
}

- (NSNumber)postSentencePauseDuration
{
  return self->_postSentencePauseDuration;
}

- (TTSAXResource)currentVoice
{
  return self->_currentVoice;
}

- (void)setCurrentVoice:(id)a3
{
  objc_storeStrong((id *)&self->_currentVoice, a3);
}

- (NSMutableDictionary)pathDictionary
{
  return self->_pathDictionary;
}

- (void)setPathDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_pathDictionary, a3);
}

- (NSString)brokerString
{
  return self->_brokerString;
}

- (void)setBrokerString:(id)a3
{
  objc_storeStrong((id *)&self->_brokerString, a3);
}

- (_VE_HSAFE)vocalizerClassHandle
{
  uint64_t v2;
  void *pHandleData;
  _VE_HSAFE result;

  v2 = *(_QWORD *)&self->_vocalizerClassHandle.u32Check;
  pHandleData = self->_vocalizerClassHandle.pHandleData;
  result.u32Check = v2;
  result.pHandleData = pHandleData;
  return result;
}

- (void)setVocalizerClassHandle:(_VE_HSAFE)a3
{
  self->_vocalizerClassHandle = a3;
}

- (_VE_HSAFE)vocalizerInstanceHandle
{
  uint64_t v2;
  void *pHandleData;
  _VE_HSAFE result;

  v2 = *(_QWORD *)&self->_vocalizerInstanceHandle.u32Check;
  pHandleData = self->_vocalizerInstanceHandle.pHandleData;
  result.u32Check = v2;
  result.pHandleData = pHandleData;
  return result;
}

- (void)setVocalizerInstanceHandle:(_VE_HSAFE)a3
{
  self->_vocalizerInstanceHandle = a3;
}

- (NSCondition)producedBuffers
{
  return self->_producedBuffers;
}

- (void)setProducedBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_producedBuffers, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSMutableOrderedSet)finishedBuffers
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFinishedBuffers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (TTSMauiVocalizerBuffer)inProgressBuffer
{
  return self->_inProgressBuffer;
}

- (void)setInProgressBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_inProgressBuffer, a3);
}

- (OS_dispatch_queue)synthesisQueue
{
  return self->_synthesisQueue;
}

- (void)setSynthesisQueue:(id)a3
{
  objc_storeStrong((id *)&self->_synthesisQueue, a3);
}

- (NSMutableOrderedSet)voiceResources
{
  return self->_voiceResources;
}

- (void)setVoiceResources:(id)a3
{
  objc_storeStrong((id *)&self->_voiceResources, a3);
}

- (TTSSpeechString)proccessedSpeechString
{
  return self->_proccessedSpeechString;
}

- (void)setProccessedSpeechString:(id)a3
{
  objc_storeStrong((id *)&self->_proccessedSpeechString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proccessedSpeechString, 0);
  objc_storeStrong((id *)&self->_voiceResources, 0);
  objc_storeStrong((id *)&self->_synthesisQueue, 0);
  objc_storeStrong((id *)&self->_inProgressBuffer, 0);
  objc_storeStrong((id *)&self->_finishedBuffers, 0);
  objc_storeStrong((id *)&self->_producedBuffers, 0);
  objc_storeStrong((id *)&self->_brokerString, 0);
  objc_storeStrong((id *)&self->_pathDictionary, 0);
  objc_storeStrong((id *)&self->_currentVoice, 0);
  objc_storeStrong((id *)&self->_postSentencePauseDuration, 0);
  objc_storeStrong((id *)&self->_timbre, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_rate, 0);
  objc_storeStrong((id *)&self->_pitch, 0);
  objc_storeStrong((id *)&self->_ruleSetRunner, 0);
}

void __47__TTSMauiSpeechEngine__speakString_withFormat___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "currentVoice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_214A39000, a3, v7, "ve_ttsProcessText2Speech failed for resource: %@ nuanceError: %@", v8);

  OUTLINED_FUNCTION_4();
}

- (void)_initializeVoiceDataFiles
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_214A39000, v0, OS_LOG_TYPE_ERROR, "Failed to load common resources at %@", v1, 0xCu);
}

- (void)_addPathDictionaryEntriesForDirectory:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_3(&dword_214A39000, v1, (uint64_t)v1, "Maui vocalizer failed to load files in directory %@ with error %@", v2);
}

- (void)_initializeEngine
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "currentVoice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214A39000, v2, v3, "Failed to initialize engine for resource: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
