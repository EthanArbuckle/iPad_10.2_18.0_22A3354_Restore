@implementation TTSSpeechSynthesizer

+ (id)remapVoiceIdentifier:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend_voiceForIdentifier_(v4, v5, (uint64_t)v3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_identifier(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)voiceForIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  dispatch_semaphore_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  id v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  _BOOL4 v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[4];
  NSObject *v77;
  _BYTE *v78;
  uint8_t v79[128];
  _BYTE buf[24];
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_sharedInstance(TTSAXResourceMigrationUtilities, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convertIdentifierIfNeeded_(v9, v10, (uint64_t)v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (TTSUseCoreSynthesizerForTTS())
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v81 = sub_1A39806FC;
    v82 = sub_1A398070C;
    v83 = 0;
    v18 = dispatch_semaphore_create(0);
    objc_msgSend_shared(_TtC12TextToSpeech13VoiceResolver, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = sub_1A3980714;
    v76[3] = &unk_1E4AA0EC8;
    v78 = buf;
    v24 = v18;
    v77 = v24;
    objc_msgSend_voiceForIdentifier_preferringLanguage_completionHandler_(v23, v25, (uint64_t)v13, 0, (uint64_t)v76);

    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    v26 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend_sharedInstance(TTSAXResourceManager, v14, v15, v16, v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resourceWithVoiceId_(v27, v28, (uint64_t)v13, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_speechVoice(v31, v32, v33, v34, v35);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_serviceIdentifier(v26, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v40)
    {
      objc_msgSend__initializeServers(a1, v41, v42, v43, v44);
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v45 = (id)qword_1ED1B5BB8;
      v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v72, (uint64_t)v79, 16);
      if (v50)
      {
        v51 = *(_QWORD *)v73;
        while (2)
        {
          for (i = 0; i != v50; ++i)
          {
            if (*(_QWORD *)v73 != v51)
              objc_enumerationMutation(v45);
            v53 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            if (objc_msgSend_isVoiceValid_(v53, v47, (uint64_t)v26, v48, v49, (_QWORD)v72))
            {
              objc_msgSend_setService_(v26, v47, (uint64_t)v53, v48, v49);
              goto LABEL_14;
            }
          }
          v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v47, (uint64_t)&v72, (uint64_t)v79, 16);
          if (v50)
            continue;
          break;
        }
      }
LABEL_14:

    }
    objc_msgSend_serviceIdentifier(v26, v41, v42, v43, v44, (_QWORD)v72);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v54 == 0;

    if (v55)
    {
      objc_msgSend_sharedInstance(TTSAXResourceManager, v56, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_resourceWithVoiceId_(v60, v61, (uint64_t)v13, v62, v63);
      v64 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

      AXTTSLogCommon();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        sub_1A3AB22AC();

      if (objc_msgSend_isInstalled(v64, v66, v67, v68, v69))
      {
        AXTTSLogCommon();
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v26;
          *(_WORD *)&buf[22] = 2112;
          v81 = v64;
          _os_log_error_impl(&dword_1A3940000, v70, OS_LOG_TYPE_ERROR, "Unable to find voice service for identifier: %@, voice: %@, resource: %@", buf, 0x20u);
        }

      }
    }
  }

  return v26;
}

+ (void)initialize
{
  if (qword_1ED1B5BE0[0] != -1)
    dispatch_once(qword_1ED1B5BE0, &unk_1E4A9F408);
}

+ (void)_initializeServers
{
  if ((byte_1ED1B5BC0 & 1) == 0)
    dispatch_sync((dispatch_queue_t)qword_1ED1B5BD8, &unk_1E4AA0E80);
}

- (void)setPerVoiceSettings:(id)a3
{
  objc_storeStrong((id *)&self->_perVoiceSettings, a3);
}

- (id)getPerVoiceSettings
{
  return self->_perVoiceSettings;
}

+ (BOOL)isSystemVoice:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char isSystemVoice;

  objc_msgSend_voiceForIdentifier_(a1, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isSystemVoice = objc_msgSend_isSystemVoice(v5, v6, v7, v8, v9);

  return isSystemVoice;
}

+ (id)unavailableVoiceIdentifiers
{
  if (qword_1EE6D5708 != -1)
    dispatch_once(&qword_1EE6D5708, &unk_1E4AA0EA0);
  return (id)qword_1EE6D5700;
}

+ (BOOL)employSpeechMarkupForType:(int64_t)a3 identifier:(id)a4 withLanguage:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  char v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;

  v8 = a4;
  v9 = a5;
  if ((TTSUseCoreSynthesizerForTTS() & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v11 = 1;
    objc_msgSend__speechVoiceForIdentifier_language_footprint_(a1, v10, (uint64_t)v8, (uint64_t)v9, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_service(v12, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = objc_msgSend_employSpeechMarkupForType_language_(v17, v18, a3, (uint64_t)v9, v19);

  }
  return v11;
}

+ (id)genericMarkMarkupForIdentifier:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;

  v6 = a3;
  v7 = a4;
  if (TTSUseCoreSynthesizerForTTS())
  {
    objc_msgSend_genericMarkerMarkupWithName_(TTSSSEUtils, v8, (uint64_t)v7, v9, v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend__speechVoiceForIdentifier_language_footprint_(a1, v8, (uint64_t)v6, 0, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v12;
    if (v12)
    {
      objc_msgSend_service(v12, v13, v14, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_genericMarkerMarkupForVoice_name_(v18, v19, (uint64_t)v17, (uint64_t)v7, v20);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = &stru_1E4AA5CE8;
      }

    }
    else
    {
      AXTTSLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_1A3AB233C();

      v11 = &stru_1E4AA5CE8;
    }

  }
  return v11;
}

+ (id)combinedProsodyMarkupForIdentifier:(id)a3 string:(id)a4 rate:(id)a5 pitch:(id)a6 volume:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  __CFString *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  NSObject *v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (TTSUseCoreSynthesizerForTTS())
  {
    objc_msgSend_combinedProsodyMarkupForString_rate_pitch_volume_(TTSSSEUtils, v17, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, v16);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend__speechVoiceForIdentifier_language_footprint_(a1, v17, (uint64_t)v12, 0, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v19;
    if (v19)
    {
      objc_msgSend_service(v19, v20, v21, v22, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_combinedProsodyMarkupForVoice_string_rate_pitch_volume_(v25, v26, (uint64_t)v24, (uint64_t)v13, (uint64_t)v14, v15, v16);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = &stru_1E4AA5CE8;
      }

    }
    else
    {
      AXTTSLogCommon();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_1A3AB233C();

      v18 = &stru_1E4AA5CE8;
    }

  }
  return v18;
}

+ (id)speechMarkupStringForType:(int64_t)a3 forIdentifier:(id)a4 string:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  NSObject *v21;

  v8 = a4;
  v9 = a5;
  if (TTSUseCoreSynthesizerForTTS())
  {
    objc_msgSend_speechMarkupStringForType_string_(TTSSSEUtils, v10, a3, (uint64_t)v9, v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend__speechVoiceForIdentifier_language_footprint_(a1, v10, (uint64_t)v8, 0, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v13;
    if (v13)
    {
      objc_msgSend_service(v13, v14, v15, v16, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_speechMarkupStringForType_voice_string_(v19, v20, a3, (uint64_t)v18, (uint64_t)v9);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = &stru_1E4AA5CE8;
      }

    }
    else
    {
      AXTTSLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_1A3AB233C();

      v12 = &stru_1E4AA5CE8;
    }

  }
  return v12;
}

+ (void)testingSetAllVoices:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = qword_1ED1B5BD8;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A3980C2C;
  block[3] = &unk_1E4A9FAD0;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

+ (void)setVoiceAssetsForTesting:(id)a3
{
  objc_storeStrong((id *)&qword_1EE6D5710, a3);
}

+ (id)voiceAssetsForTesting
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_copy((void *)qword_1EE6D5710, a2, v2, v3, v4);
}

+ (id)synthesizerForSynthesizerID:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = (void *)qword_1ED1B5BC8;
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)testingLastRuleConversion
{
  return self->_testingLastRuleConversion;
}

- (void)testingSetLastRuleConversion:(id)a3 replacement:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *testingLastRuleConversion;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  v13 = a4;
  v6 = a3;
  v7 = (NSMutableDictionary *)objc_opt_new();
  testingLastRuleConversion = self->_testingLastRuleConversion;
  self->_testingLastRuleConversion = v7;

  objc_msgSend_setObject_forKeyedSubscript_(self->_testingLastRuleConversion, v9, (uint64_t)v6, (uint64_t)CFSTR("original"), v10);
  objc_msgSend_setObject_forKeyedSubscript_(self->_testingLastRuleConversion, v11, (uint64_t)v13, (uint64_t)CFSTR("replacement"), v12);

}

+ (id)voiceAccessQueue
{
  return (id)qword_1ED1B5BD8;
}

+ (id)availableLanguageCodes
{
  dispatch_semaphore_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1A39806FC;
  v21 = sub_1A398070C;
  v22 = (id)MEMORY[0x1E0C9AA60];
  v2 = dispatch_semaphore_create(0);
  objc_msgSend_shared(_TtC12TextToSpeech13VoiceResolver, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1A3980E78;
  v14[3] = &unk_1E4AA00B8;
  v16 = &v17;
  v8 = v2;
  v15 = v8;
  objc_msgSend_currentLocaleIdentifiersWithCompletionHandler_(v7, v9, (uint64_t)v14, v10, v11);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (TTSSpeechSynthesizer)init
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  id v12;
  void *v13;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  objc_super v46;

  v3 = (void *)objc_opt_class();
  objc_msgSend__initializeServers(v3, v4, v5, v6, v7);
  v46.receiver = self;
  v46.super_class = (Class)TTSSpeechSynthesizer;
  v8 = -[TTSSpeechSynthesizer init](&v46, sel_init);
  if (v8)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("TTSSpeechSynthesizer", v9);
    v11 = (void *)*((_QWORD *)v8 + 6);
    *((_QWORD *)v8 + 6) = v10;

    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = (void *)*((_QWORD *)v8 + 5);
    *((_QWORD *)v8 + 5) = v12;

    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)(v8 + 100) = _D0;
    *((_DWORD *)v8 + 27) = 1065353216;
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = (void *)*((_QWORD *)v8 + 7);
    *((_QWORD *)v8 + 7) = v19;

    objc_storeStrong((id *)v8 + 15, MEMORY[0x1E0C80D38]);
    v21 = voucher_copy();
    v22 = (void *)*((_QWORD *)v8 + 24);
    *((_QWORD *)v8 + 24) = v21;

    objc_msgSend_lock((void *)qword_1ED1B5BD0, v23, v24, v25, v26);
    v27 = ++qword_1ED1B51E0;
    *((_QWORD *)v8 + 9) = qword_1ED1B51E0;
    v28 = (void *)qword_1ED1B5BC8;
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v29, v27, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v28, v33, (uint64_t)v8, (uint64_t)v32, v34);

    objc_msgSend_unlock((void *)qword_1ED1B5BD0, v35, v36, v37, v38);
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v43, v44, (uint64_t)v8, (uint64_t)sel__mediaServicesDied, *MEMORY[0x1E0C89740], 0);

  }
  return (TTSSpeechSynthesizer *)v8;
}

- (_TtC12TextToSpeech15CoreSynthesizer)coreSynth
{
  _TtC12TextToSpeech15CoreSynthesizer *coreSynth;
  _TtC12TextToSpeech15CoreSynthesizer *v4;
  _TtC12TextToSpeech15CoreSynthesizer *v5;

  coreSynth = self->_coreSynth;
  if (!coreSynth)
  {
    v4 = objc_alloc_init(_TtC12TextToSpeech15CoreSynthesizer);
    v5 = self->_coreSynth;
    self->_coreSynth = v4;

    coreSynth = self->_coreSynth;
  }
  return coreSynth;
}

- (id)voiceResolver
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_coreSynth(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_voiceResolver(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_mediaServicesDied
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[16];

  AXTTSLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A3940000, v3, OS_LOG_TYPE_DEFAULT, "Media services reset", v8, 2u);
  }

  objc_msgSend_removeAllObjects(self->_channels, v4, v5, v6, v7);
}

- (void)dealloc
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend__stopSpeakingRequest_atNextBoundary_synchronously_error_(self, a2, 0, 0, 0, 0);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = (id)qword_1ED1B5BB8;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v5)
  {
    v10 = v5;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v3);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
        v14 = objc_msgSend_synthesizerInstanceID(self, v6, v7, v8, v9);
        objc_msgSend_synthesizerInstanceDestroyed_(v13, v15, v14, v16, v17);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v19, (uint64_t)v23, 16);
    }
    while (v10);
  }

  v18.receiver = self;
  v18.super_class = (Class)TTSSpeechSynthesizer;
  -[TTSSpeechSynthesizer dealloc](&v18, sel_dealloc);
}

- (void)_setDelegate:(id)a3
{
  id WeakRetained;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_BYTE *)&self->_synthesizerFlags = *(_BYTE *)&self->_synthesizerFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_BYTE *)&self->_synthesizerFlags = *(_BYTE *)&self->_synthesizerFlags & 0xFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_BYTE *)&self->_synthesizerFlags = *(_BYTE *)&self->_synthesizerFlags & 0xFB | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_BYTE *)&self->_synthesizerFlags = *(_BYTE *)&self->_synthesizerFlags & 0xF7 | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 16;
    else
      v8 = 0;
    *(_BYTE *)&self->_synthesizerFlags = *(_BYTE *)&self->_synthesizerFlags & 0xEF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 32;
    else
      v9 = 0;
    *(_BYTE *)&self->_synthesizerFlags = *(_BYTE *)&self->_synthesizerFlags & 0xDF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 64;
    else
      v10 = 0;
    *(_BYTE *)&self->_synthesizerFlags = *(_BYTE *)&self->_synthesizerFlags & 0xBF | v10;
  }

}

- (void)setVolume:(float)a3
{
  if (a3 > 1.0)
    a3 = 1.0;
  self->_volume = fmaxf(a3, 0.0001);
}

- (void)setPitch:(float)a3
{
  if (a3 > 2.0)
    a3 = 2.0;
  self->_pitch = fmaxf(a3, 0.5);
}

- (void)setOutputChannels:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  objc_storeStrong((id *)&self->_outputChannels, a3);
  if (TTSUseCoreSynthesizerForTTS())
  {
    objc_msgSend_coreSynth(self, v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setChannels_(v9, v10, (uint64_t)v13, v11, v12);

  }
}

- (NSArray)outputChannels
{
  return self->_outputChannels;
}

- (void)setUserSubstitutions:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSArray *v6;
  NSArray *userSubstitutions;
  uint64_t v8;
  uint64_t v9;

  v6 = (NSArray *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  userSubstitutions = self->_userSubstitutions;
  self->_userSubstitutions = v6;

  MEMORY[0x1E0DE7D20](self->_userSubstitutions, sel_enumerateObjectsUsingBlock_, &unk_1E4AA0F08, v8, v9);
}

- (void)setPhonemeSubstitutions:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSArray *v6;
  NSArray *phonemeSubstitutions;

  v6 = (NSArray *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  phonemeSubstitutions = self->_phonemeSubstitutions;
  self->_phonemeSubstitutions = v6;

}

- (NSString)resolvedVoiceIdentifier
{
  int v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *voiceIdentifier;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = TTSUseCoreSynthesizerForTTS();
  v4 = (void *)objc_opt_class();
  voiceIdentifier = self->_voiceIdentifier;
  if (v3)
    objc_msgSend_voiceForIdentifier_(v4, v5, (uint64_t)voiceIdentifier, v6, v7);
  else
    objc_msgSend__speechVoiceForIdentifier_language_footprint_(v4, v5, (uint64_t)voiceIdentifier, 0, self->_footprint);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (id)resolvedVoiceIdentifierForLanguageCode:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  if (TTSUseCoreSynthesizerForTTS())
  {
    objc_msgSend__resolveVoiceForLanguage_(self, v5, (uint64_t)v4, v6, v7);
  }
  else
  {
    v8 = (void *)objc_opt_class();
    objc_msgSend__speechVoiceForIdentifier_language_footprint_(v8, v9, 0, (uint64_t)v4, self->_footprint);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)voiceIdentifier
{
  NSString *voiceIdentifier;
  dispatch_semaphore_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  NSObject *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  voiceIdentifier = self->_voiceIdentifier;
  if (voiceIdentifier)
    return voiceIdentifier;
  if (TTSUseCoreSynthesizerForTTS())
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = sub_1A39806FC;
    v36 = sub_1A398070C;
    v37 = 0;
    v5 = dispatch_semaphore_create(0);
    objc_msgSend_voiceResolver(self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = sub_1A398176C;
    v29 = &unk_1E4AA0EC8;
    v31 = &v32;
    v11 = v5;
    v30 = v11;
    objc_msgSend_voiceForIdentifier_preferringLanguage_completionHandler_(v10, v12, 0, 0, (uint64_t)&v26);

    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend_identifier((void *)v33[5], v13, v14, v15, v16, v26, v27, v28, v29);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v32, 8);
    return (NSString *)v17;
  }
  else
  {
    v18 = (void *)objc_opt_class();
    objc_msgSend__speechVoiceForIdentifier_language_footprint_(v18, v19, 0, 0, self->_footprint);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v20, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v25;
  }
}

- (id)_preprocessText:(id)a3 languageCode:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  int isEqualToString;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  __int16 v50;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend_isEqual_(v6, v7, (uint64_t)CFSTR("he-IL"), v8, v9))
  {
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v5, v10, (uint64_t)CFSTR("/י"), (uint64_t)&stru_1E4AA5CE8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v13, v14, (uint64_t)CFSTR("/ה"), (uint64_t)&stru_1E4AA5CE8, v15);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v5, v16, (uint64_t)CFSTR("/ת"), (uint64_t)&stru_1E4AA5CE8, v17);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v23 = (void *)v18;

    v5 = v23;
    goto LABEL_6;
  }
  if (objc_msgSend_isEqual_(v6, v10, (uint64_t)CFSTR("ja-JP"), v11, v12))
  {
    AXSpeechReplaceJapaneseElongationCharactersIfNeeded(v5);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:
  if ((unint64_t)objc_msgSend_length(v5, v19, v20, v21, v22) >= 4)
  {
    objc_msgSend_localizedUppercaseString(v5, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v28, v29, (uint64_t)v5, v30, v31);

    if (isEqualToString)
    {
      objc_msgSend_localizedLowercaseString(v5, v24, v33, v34, v27);
      v35 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v35;
    }
  }
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v5, v24, (uint64_t)CFSTR("’"), (uint64_t)CFSTR("'"), v27);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v36, v37, (uint64_t)CFSTR("‘"), (uint64_t)CFSTR("'"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v39, v40, (uint64_t)CFSTR("−"), (uint64_t)CFSTR("-"), v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 12288;
  objc_msgSend_stringWithCharacters_length_(MEMORY[0x1E0CB3940], v43, (uint64_t)&v50, 1, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v42, v46, (uint64_t)v45, (uint64_t)CFSTR(" "), v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  return v48;
}

- (BOOL)_substitutionLanguageMatchesSpecialCase:(id)a3 withLanguage:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  char hasSuffix;

  v5 = a4;
  objc_msgSend_lowercaseString(a3, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hasSuffix_(v10, v11, (uint64_t)CFSTR("no"), v12, v13))
  {
    objc_msgSend_lowercaseString(v5, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    hasSuffix = objc_msgSend_hasSuffix_(v18, v19, (uint64_t)CFSTR("no"), v20, v21);

  }
  else
  {
    hasSuffix = 0;
  }

  return hasSuffix;
}

- (BOOL)_skipSubstition:(id)a3 language:(id)a4 bundleIdentifier:(id)a5 voice:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  const char *v53;
  uint64_t v54;
  char v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  char v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend_ignoreSubstitutions(self, v14, v15, v16, v17)
    && (objc_msgSend_isUserSubstitution(v10, v18, v19, v20, v21) & 1) != 0)
  {
    v22 = 1;
  }
  else
  {
    if ((objc_msgSend_appliesToAllApps(v10, v18, v19, v20, v21) & 1) != 0)
    {
      v27 = 0;
    }
    else
    {
      objc_msgSend_bundleIdentifiers(v10, v23, v24, v25, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend_containsObject_(v28, v29, (uint64_t)v12, v30, v31);

      v27 = v32 ^ 1;
    }
    objc_msgSend_languages(v10, v23, v24, v25, v26);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend_count(v33, v34, v35, v36, v37);

    if (v38)
    {
      v80 = v27;
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      objc_msgSend_languages(v10, v39, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v81, (uint64_t)v85, 16);
      if (v45)
      {
        v49 = v45;
        v50 = *(_QWORD *)v82;
        while (2)
        {
          for (i = 0; i != v49; ++i)
          {
            if (*(_QWORD *)v82 != v50)
              objc_enumerationMutation(v43);
            v52 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
            if ((objc_msgSend_isEqualToString_(v52, v46, (uint64_t)v11, v47, v48) & 1) != 0
              || (objc_msgSend__substitutionLanguageMatchesSpecialCase_withLanguage_(self, v53, (uint64_t)v52, (uint64_t)v11, v54) & 1) != 0)
            {
              v55 = 1;
              goto LABEL_21;
            }
          }
          v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v81, (uint64_t)v85, 16);
          v55 = 0;
          if (v49)
            continue;
          break;
        }
      }
      else
      {
        v55 = 0;
      }
LABEL_21:

      objc_msgSend_voiceIds(v10, v56, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v60, v61, v62, v63, v64))
      {
        objc_msgSend_voiceIds(v10, v65, v66, v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v13, v70, v71, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend_containsObject_(v69, v75, (uint64_t)v74, v76, v77);

        v55 &= v78;
      }
      else
      {

      }
      v27 = v80;
    }
    else
    {
      v55 = 1;
    }
    v22 = v27 | v55 ^ 1;
  }

  return v22;
}

- (void)_processUserSubstitutionsToText:(id)a3 request:(id)a4 bundleIdentifier:(id)a5 voice:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  const char *v64;
  char v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char IsMember;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  int hasPrefix;
  uint64_t v140;
  void *v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  const char *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  id v203;
  id v204;
  id obj;
  void *v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  TTSSpeechSynthesizer *v210;
  id v211;
  void *v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  _BYTE v217[128];
  uint64_t v218;

  v218 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v204 = a6;
  objc_msgSend_originalString(v10, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_phonemeSubstitutions(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_count(v27, v28, v29, v30, v31);

  if (v32)
  {
    objc_msgSend_phonemeSubstitutions(self, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v22, v38, (uint64_t)v37, v39, v40);

  }
  objc_msgSend_userSubstitutions(self, v33, v34, v35, v36);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend_count(v41, v42, v43, v44, v45);

  if (v46)
  {
    objc_msgSend_userSubstitutions(self, v47, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v22, v52, (uint64_t)v51, v53, v54);

  }
  v215 = 0u;
  v216 = 0u;
  v213 = 0u;
  v214 = 0u;
  obj = v22;
  v56 = v204;
  v208 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v55, (uint64_t)&v213, (uint64_t)v217, 16);
  if (v208)
  {
    v207 = *(_QWORD *)v214;
    v209 = v10;
    v210 = self;
    v211 = v11;
    v203 = v12;
    do
    {
      v61 = 0;
      do
      {
        if (*(_QWORD *)v214 != v207)
          objc_enumerationMutation(obj);
        v62 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * v61);
        objc_msgSend_languageCode(v11, v57, v58, v59, v60);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend__skipSubstition_language_bundleIdentifier_voice_(self, v64, (uint64_t)v62, (uint64_t)v63, (uint64_t)v12, v56);

        if ((v65 & 1) == 0)
        {
          objc_msgSend_punctuationCharacterSet(MEMORY[0x1E0CB3780], v57, v58, v59, v60);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_symbolCharacterSet(MEMORY[0x1E0CB3500], v67, v68, v69, v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_formUnionWithCharacterSet_(v66, v72, (uint64_t)v71, v73, v74);

          objc_msgSend_originalString(v62, v75, v76, v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend_characterAtIndex_(v79, v80, 0, v81, v82);
          if ((objc_msgSend_characterIsMember_(v66, v84, v83, v85, v86) & 1) != 0)
          {
            IsMember = 1;
          }
          else
          {
            objc_msgSend_originalString(v62, v87, v88, v89, v90);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_originalString(v62, v93, v94, v95, v96);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = objc_msgSend_length(v97, v98, v99, v100, v101);
            v106 = objc_msgSend_characterAtIndex_(v92, v103, v102 - 1, v104, v105);
            IsMember = objc_msgSend_characterIsMember_(v66, v107, v106, v108, v109);

          }
          objc_msgSend_originalString(v62, v110, v111, v112, v113);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_type(v10, v115, v116, v117, v118) == 1)
          {
            objc_msgSend_xmlEscaped(v114, v119, v120, v121, v122);
            v123 = objc_claimAutoreleasedReturnValue();

            v212 = (void *)v123;
          }
          else
          {
            v212 = v114;
          }
          objc_msgSend_languageCode(v11, v119, v120, v121, v122);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          v206 = v66;
          if (objc_msgSend_hasPrefix_(v124, v125, (uint64_t)CFSTR("ja"), v126, v127))
          {

            goto LABEL_20;
          }
          objc_msgSend_languageCode(v11, v128, v129, v130, v131);
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          hasPrefix = objc_msgSend_hasPrefix_(v135, v136, (uint64_t)CFSTR("zh"), v137, v138);

          if (hasPrefix)
          {
LABEL_20:
            v141 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend_escapedPatternForString_(MEMORY[0x1E0CB38E8], v132, (uint64_t)v212, v133, v134);
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(v141, v143, (uint64_t)CFSTR("%@"), v144, v145, v142);
            goto LABEL_21;
          }
          if ((IsMember & 1) != 0)
          {
            if (objc_msgSend_length(v17, v132, v140, v133, v134) == 1)
            {
              objc_msgSend_escapedPatternForString_(MEMORY[0x1E0CB38E8], v191, (uint64_t)v212, v192, v193);
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_22;
            }
            v198 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend_escapedPatternForString_(MEMORY[0x1E0CB38E8], v191, (uint64_t)v212, v192, v193);
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(v198, v199, (uint64_t)CFSTR("(?<=\\s|^)%@(?=\\s|$)"), v200, v201, v142);
          }
          else
          {
            v194 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend_escapedPatternForString_(MEMORY[0x1E0CB38E8], v132, (uint64_t)v212, v133, v134);
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(v194, v195, (uint64_t)CFSTR("\\b%@\\b"), v196, v197, v142);
          }
LABEL_21:
          v146 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
          v151 = objc_msgSend_length(v17, v147, v148, v149, v150);
          v156 = objc_msgSend_replacementRange(v62, v152, v153, v154, v155);
          if (v157 | v156)
          {
            v183 = v156;
            v184 = v157;
            objc_msgSend__determineSubstitution_speechString_wordRange_request_(v210, (const char *)v157, (uint64_t)v62, (uint64_t)v10, v156, v157, v211);
            v185 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_length(v185, v186, v187, v188, v189))
              objc_msgSend_transformRange_to_(v10, v190, v183, v184, (uint64_t)v185);

          }
          else if (v151)
          {
            v158 = 0;
            do
            {
              v159 = objc_msgSend_rangeOfString_options_range_(v17, (const char *)v157, (uint64_t)v146, 1025, v158, v151);
              if (v159 == 0x7FFFFFFFFFFFFFFFLL)
                break;
              v164 = v159;
              v165 = (uint64_t)v160;
              v166 = objc_msgSend_length(v17, v160, v161, v162, v163);
              objc_msgSend_substringWithRange_(v17, v167, v164, v165, v168);
              v169 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend_ignoreCase(v62, v170, v171, v172, v173) & 1) != 0
                || objc_msgSend_isEqualToString_(v212, v174, (uint64_t)v169, v175, v176))
              {
                objc_msgSend__determineSubstitution_speechString_wordRange_request_(v210, v174, (uint64_t)v62, (uint64_t)v209, v164, v165, v211);
                v177 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend_length(v177, v178, v179, v180, v181))
                  objc_msgSend_transformRange_to_(v209, v182, v164, v165, (uint64_t)v177);

              }
              v158 = v164 + v165;
              v151 = v166 - (v164 + v165);

            }
            while (v151);
          }

          v10 = v209;
          self = v210;
          v11 = v211;
          v12 = v203;
          v56 = v204;
        }
        ++v61;
      }
      while (v61 != v208);
      v202 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v57, (uint64_t)&v213, (uint64_t)v217, 16);
      v208 = v202;
    }
    while (v202);
  }

}

- (id)_determineSubstitution:(id)a3 speechString:(id)a4 wordRange:(_NSRange)a5 request:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  const char *v58;
  uint64_t v59;

  length = a5.length;
  location = a5.location;
  v9 = a4;
  v10 = a3;
  objc_msgSend_phonemes(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_replacementString(v10, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_length(v15, v21, v22, v23, v24) || objc_msgSend_length(v20, v25, v26, v27, v28))
  {
    objc_msgSend_originalString(v9, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend_length(v29, v30, v31, v32, v33);

    if (location + length <= v34)
    {
      v40 = v20;
      if (v40 && objc_msgSend_type(v9, v36, v37, v38, v39) == 1)
      {
        objc_msgSend_xmlEscaped(v40, v36, v37, v38, v39);
        v41 = objc_claimAutoreleasedReturnValue();

        v40 = (id)v41;
      }
      objc_msgSend_originalString(v9, v36, v37, v38, v39);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substringWithRange_(v42, v43, location, length, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_length(v15, v46, v47, v48, v49))
      {
        if (objc_msgSend_type(v9, v50, v51, v52, v53) == 1)
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v54, (uint64_t)CFSTR("<phoneme alphabet=\"ipa\" ph=\"%@\">%@</phoneme>"), v55, v56, v15, v45);
          v57 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
        if (TTSUseCoreSynthesizerForTTS())
        {
          objc_msgSend_enclosedStringWithPhonemes_originalString_(TTSSSEUtils, v58, (uint64_t)v15, (uint64_t)v45, v59);
          v57 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
      }
      if (!v40)
      {
        v35 = 0;
        goto LABEL_16;
      }
      v57 = v40;
LABEL_15:
      v35 = v57;
LABEL_16:

      goto LABEL_17;
    }
  }
  v35 = 0;
LABEL_17:

  return v35;
}

- (unint64_t)synthesizerInstanceID
{
  return self->_synthesizerInstanceID;
}

- (id)_resolveVoiceForLanguage:(id)a3
{
  uint64_t (*v4)(uint64_t, uint64_t);
  dispatch_semaphore_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSString *voiceIdentifier;
  NSObject *v12;
  const char *v13;
  id v14;
  NSString *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char isValid;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  BOOL v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  OS_dispatch_queue *queue;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  uint64_t (*v137)(uint64_t, uint64_t);
  void *v138;
  _QWORD v139[4];
  NSObject *v140;
  _BYTE *v141;
  _BYTE buf[24];
  uint64_t (*v143)(uint64_t, uint64_t);
  void (*v144)(uint64_t);
  id v145;
  uint64_t v146;

  v146 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (*)(uint64_t, uint64_t))a3;
  if (TTSUseCoreSynthesizerForTTS())
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v143 = sub_1A39806FC;
    v144 = sub_1A398070C;
    v145 = 0;
    v5 = dispatch_semaphore_create(0);
    objc_msgSend_voiceResolver(self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    voiceIdentifier = self->_voiceIdentifier;
    v139[0] = MEMORY[0x1E0C809B0];
    v139[1] = 3221225472;
    v139[2] = sub_1A39829B8;
    v139[3] = &unk_1E4AA0EC8;
    v141 = buf;
    v12 = v5;
    v140 = v12;
    objc_msgSend_voiceForIdentifier_preferringLanguage_completionHandler_(v10, v13, (uint64_t)voiceIdentifier, (uint64_t)v4, (uint64_t)v139);

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    v14 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
    goto LABEL_28;
  }
  v15 = self->_voiceIdentifier;
  AXTTSLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v15;
    _os_log_impl(&dword_1A3940000, v16, OS_LOG_TYPE_INFO, "Attempting to speak with identifier: %@", buf, 0xCu);
  }

  v17 = (void *)objc_opt_class();
  objc_msgSend__speechVoiceForIdentifier_language_footprint_(v17, v18, (uint64_t)v15, (uint64_t)v4, self->_footprint);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  AXTTSLogCommon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_service(v19, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v25;
    _os_log_impl(&dword_1A3940000, v20, OS_LOG_TYPE_INFO, "Found voice %@ with service: %@", buf, 0x16u);

  }
  objc_msgSend_identifier(v19, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_footprint(v19, v31, v32, v33, v34) == 2)
  {
    objc_msgSend_identifier(v19, v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend_containsString_(v39, v40, (uint64_t)CFSTR(".super-compact."), v41, v42);

    if ((v43 & 1) == 0)
    {
      objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v30, v35, (uint64_t)CFSTR(".compact."), (uint64_t)CFSTR(".super-compact."), v38);
      v44 = objc_claimAutoreleasedReturnValue();

      v30 = (void *)v44;
    }
  }
  objc_msgSend_sharedInstance(TTSAXResourceManager, v35, v36, v37, v38);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resourceWithVoiceId_(v45, v46, (uint64_t)v30, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_isInstalled(v49, v50, v51, v52, v53) & 1) != 0
    || objc_msgSend_footprint(v49, v54, v55, v56, v57) != 3)
  {
    v65 = v49;
  }
  else
  {
    objc_msgSend_sharedInstance(TTSAXResourceManager, v54, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v30, v59, (uint64_t)CFSTR(".compact."), (uint64_t)CFSTR(".super-compact."), v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resourceWithVoiceId_(v58, v62, (uint64_t)v61, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_speechVoice(v65, v66, v67, v68, v69);
    v70 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v70;
  }
  isValid = objc_msgSend_isValid(v65, v54, v55, v56, v57);
  if ((isValid & 1) == 0)
  {
    AXTTSLogCommon();
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_contentPath(v65, v77, v78, v79, v80);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v19, v128, v129, v130, v131);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = v4;
      if (!v4)
      {
        objc_msgSend_primaryLanguage(v65, v132, v133, v134, v135);
        v137 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v138;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v136;
      *(_WORD *)&buf[22] = 2112;
      v143 = v137;
      _os_log_error_impl(&dword_1A3940000, v76, OS_LOG_TYPE_ERROR, "File did not exist at content path: %@ %@. Attempting to fallback to default voice for language: %@", buf, 0x20u);
      if (!v4)

    }
    if (!v4)
    {
      objc_msgSend_primaryLanguage(v65, v71, v72, v73, v74);
      v4 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend_unavailableVoiceIdentifiers(TTSSpeechSynthesizer, v71, v72, v73, v74);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v19, v82, v83, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend_containsObject_(v81, v87, (uint64_t)v86, v88, v89);

  if (v90)
  {
    AXTTSLogCommon();
    v95 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v19;
      _os_log_impl(&dword_1A3940000, v95, OS_LOG_TYPE_INFO, "Voice %@ was unavailable or the speech service was nil, attempting to find on disk fallback", buf, 0xCu);
    }

    goto LABEL_23;
  }
  if ((isValid & 1) == 0)
  {
LABEL_23:
    v96 = (void *)objc_opt_class();
    objc_msgSend__speechVoiceForIdentifier_language_footprint_(v96, v97, 0, (uint64_t)v4, 2);
    v98 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v98;
  }
  objc_msgSend_service(v19, v91, v92, v93, v94);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v99 == 0;

  if (v100)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend_service(v19, v101, v102, v103, v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend_synthesizerInstanceID(self, v106, v107, v108, v109);
    objc_msgSend_initializeSpeechServerInstance_(v105, v111, v110, v112, v113);

    objc_msgSend_service(v19, v114, v115, v116, v117);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v124 = objc_msgSend_synthesizerInstanceID(self, v120, v121, v122, v123);
    objc_msgSend_setServiceQueue_forSynthesizerInstanceID_(v118, v125, (uint64_t)queue, v124, v126);

    v14 = v19;
  }

LABEL_28:
  return v14;
}

- (id)_makeRequestForVoice:(id)a3 andLanguageCode:(id)a4
{
  id v6;
  id v7;
  TTSSpeechRequest *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int hasPerVoiceSettings;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSDictionary *perVoiceSettings;
  void *v35;
  void *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  _QWORD v150[5];
  uint64_t v151;
  uint64_t *v152;
  uint64_t v153;
  uint64_t v154;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(TTSSpeechRequest);
  objc_msgSend_voucher(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVoucher_(v8, v14, (uint64_t)v13, v15, v16);

  objc_msgSend_setVoice_(v8, v17, (uint64_t)v6, v18, v19);
  objc_msgSend_synthesisProviderVoice(v6, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  hasPerVoiceSettings = objc_msgSend_hasPerVoiceSettings(v24, v25, v26, v27, v28);

  if (hasPerVoiceSettings)
  {
    perVoiceSettings = self->_perVoiceSettings;
    if (perVoiceSettings)
    {
      objc_msgSend_setVoiceSettings_(v8, v30, (uint64_t)perVoiceSettings, v32, v33);
    }
    else
    {
      objc_msgSend_speechSource(self, v30, 0, v32, v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        v151 = 0;
        v152 = &v151;
        v153 = 0x2050000000;
        v36 = (void *)qword_1ED1B5698;
        v154 = qword_1ED1B5698;
        if (!qword_1ED1B5698)
        {
          v150[0] = MEMORY[0x1E0C809B0];
          v150[1] = 3221225472;
          v150[2] = sub_1A3986314;
          v150[3] = &unk_1E4A9FC10;
          v150[4] = &v151;
          sub_1A3986314((uint64_t)v150, v30, v31, v32, v33);
          v36 = (void *)v152[3];
        }
        v37 = objc_retainAutorelease(v36);
        _Block_object_dispose(&v151, 8);
        objc_msgSend_sharedInstance(v37, v38, v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v6, v43, v44, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_speechSource(self, v48, v49, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_customSettingsForVoice_sourceKey_(v42, v53, (uint64_t)v47, (uint64_t)v52, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectForKeyedSubscript_(v55, v56, (uint64_t)CFSTR("TTSAUParamsKey"), v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setVoiceSettings_(v8, v60, (uint64_t)v59, v61, v62);

      }
    }
  }
  v63 = objc_msgSend_synthesizerInstanceID(self, v30, v31, v32, v33);
  objc_msgSend_setSynthesizerInstanceID_(v8, v64, v63, v65, v66);
  objc_msgSend_language(v6, v67, v68, v69, v70);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    objc_msgSend_language(v6, v71, v72, v73, v74);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLanguageCode_(v8, v77, (uint64_t)v76, v78, v79);

  }
  else
  {
    objc_msgSend_setLanguageCode_(v8, v71, (uint64_t)v7, v73, v74);
  }

  v84 = objc_msgSend_gender(v6, v80, v81, v82, v83);
  objc_msgSend_setGender_(v8, v85, v84, v86, v87);
  objc_msgSend_setPitch_(v8, v88, v89, v90, v91, self->_pitch);
  objc_msgSend_setRate_(v8, v92, v93, v94, v95, self->_rate);
  objc_msgSend_setVolume_(v8, v96, v97, v98, v99, self->_volume);
  objc_msgSend_setMaintainsInput_(v8, v100, *(_BYTE *)&self->_synthesizerFlags >> 7, v101, v102);
  objc_msgSend_outputChannels(self, v103, v104, v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setChannels_(v8, v108, (uint64_t)v107, v109, v110);

  objc_msgSend_audioBufferCallback(self, v111, v112, v113, v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAudioBufferCallback_(v8, v116, (uint64_t)v115, v117, v118);

  v123 = objc_msgSend_synthesizeSilently(self, v119, v120, v121, v122);
  objc_msgSend_setSynthesizeSilently_(v8, v124, v123, v125, v126);
  objc_msgSend_setDelegate_(v8, v127, (uint64_t)self, v128, v129);
  if (!self->_useSharedSession)
  {
    if (self->_audioSessionIDIsValid)
    {
      objc_msgSend_setAudioSessionID_(v8, v130, self->_audioSessionID, v132, v133);
    }
    else
    {
      objc_msgSend_sharedInstance(MEMORY[0x1E0C89AF0], v130, v131, v132, v133);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = objc_msgSend_opaqueSessionID(v137, v138, v139, v140, v141);

      objc_msgSend_setAudioSessionID_(v8, v143, v142, v144, v145);
    }
    objc_msgSend_setAudioSessionIDIsValid_(v8, v134, 1, v135, v136);
    objc_msgSend_setAudioQueueFlags_(v8, v146, self->_audioQueueFlags, v147, v148);
  }

  return v8;
}

- (BOOL)startSpeakingString:(id)a3 toURL:(id)a4 withLanguageCode:(id)a5 error:(id *)a6
{
  return MEMORY[0x1E0DE7D20](self, sel_startSpeakingString_withLanguageCode_error_, a3, a5, a6);
}

- (BOOL)startSpeakingString:(id)a3 toURL:(id)a4 withLanguageCode:(id)a5 request:(id *)a6 error:(id *)a7
{
  return MEMORY[0x1E0DE7D20](self, sel__startSpeakingString_orSSMLString_withLanguageCode_jobId_request_error_, a3, 0, a5);
}

- (BOOL)_startSpeakingString:(id)a3 orSSMLString:(id)a4 withLanguageCode:(id)a5 jobId:(id)a6 request:(id *)a7 error:(id *)a8
{
  uint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  CFErrorRef v17;
  BOOL v18;
  CFErrorRef v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *queue;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  char v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  char v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  char v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  TTSSpeechString *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  CFAbsoluteTime Current;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  NSObject *v161;
  id v163;
  void *v164;
  id v165;
  id *v166;
  unint64_t v167;
  _BOOL8 v168;
  void *v170;
  void *v171;
  _QWORD v172[5];
  id v173;
  id v174;
  _QWORD v175[4];
  id v176;
  id v177;
  id location;
  _QWORD block[6];

  v13 = (uint64_t)a3;
  v14 = (unint64_t)a4;
  v15 = a5;
  v16 = a6;
  v171 = v16;
  if (v13 | v14)
  {
    v20 = (uint64_t)v16;
    v168 = v14 != 0;
    v18 = v14 != 0;
  }
  else
  {
    v17 = TTSErrorCreate(0, CFSTR("TTSErrorDomain"), -4005, CFSTR("speech string is empty"));
    v18 = 0;
    if (v17)
    {
      v19 = v17;
      v170 = 0;
      if (!a8)
        goto LABEL_32;
      goto LABEL_31;
    }
    v168 = 0;
    v20 = (uint64_t)v171;
  }
  v166 = a8;
  if ((TTSUseCoreSynthesizerForTTS() & 1) == 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A3983390;
    block[3] = &unk_1E4A9FAD0;
    block[4] = self;
    dispatch_sync(queue, block);
  }
  objc_msgSend__resolveVoiceForLanguage_(self, v21, (uint64_t)v15, v22, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v25;
  if (v18)
  {
    v31 = (id)v14;
  }
  else
  {
    objc_msgSend_service(v25, v26, v27, v28, v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_opt_respondsToSelector();

    if ((v33 & 1) != 0)
    {
      objc_msgSend_service(v30, v34, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_embeddedRateMarkupForVoice_string_rate_(v38, v39, (uint64_t)v30, v13, v40, self->_rate);
      v41 = objc_claimAutoreleasedReturnValue();

      v13 = v41;
    }
    objc_msgSend_service(v30, v34, v35, v36, v37);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_opt_respondsToSelector();

    if ((v43 & 1) != 0)
    {
      objc_msgSend_service(v30, v44, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_embeddedPitchMarkupForVoice_string_pitch_(v48, v49, (uint64_t)v30, v13, v50, self->_pitch);
      v51 = objc_claimAutoreleasedReturnValue();

      v13 = v51;
    }
    objc_msgSend_service(v30, v44, v45, v46, v47);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_opt_respondsToSelector();

    if ((v53 & 1) != 0)
    {
      objc_msgSend_service(v30, v54, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_embeddedVolumeMarkupForVoice_string_volume_(v58, v59, (uint64_t)v30, v13, v60, self->_volume);
      v61 = objc_claimAutoreleasedReturnValue();

      v13 = v61;
    }
    objc_msgSend_language(v30, v54, v55, v56, v57);
    v62 = objc_claimAutoreleasedReturnValue();
    v65 = v62;
    if (v62)
      objc_msgSend__preprocessText_languageCode_(self, v63, v13, v62, v64);
    else
      objc_msgSend__preprocessText_languageCode_(self, v63, v13, (uint64_t)v15, v64);
    v31 = (id)objc_claimAutoreleasedReturnValue();

    v13 = v65;
    v20 = (uint64_t)v171;
  }

  v165 = v15;
  objc_msgSend__makeRequestForVoice_andLanguageCode_(self, v66, (uint64_t)v30, (uint64_t)v15, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v68;
  v167 = v14;
  if (v20)
  {
    objc_msgSend_setJobIdentifier_(v68, v69, v20, v71, v72);
  }
  else
  {
    objc_msgSend_shared(_TtC12TextToSpeech15TTSSpeechTracer, v69, v70, v71, v72);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_makeSpeechJobIdentifier(v78, v79, v80, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setJobIdentifier_(v73, v84, (uint64_t)v83, v85, v86);

  }
  objc_msgSend_shared(_TtC12TextToSpeech15TTSSpeechTracer, v74, v75, v76, v77);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_makeWithStart_(_TtC12TextToSpeech18TTSSpeechEventObjc, v88, (uint64_t)v31, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_jobIdentifier(v73, v92, v93, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitWithEvent_forIdentifier_(v87, v97, (uint64_t)v91, (uint64_t)v96, v98);

  v99 = [TTSSpeechString alloc];
  v170 = v31;
  v103 = (void *)objc_msgSend_initWithOriginalString_(v99, v100, (uint64_t)v31, v101, v102);
  objc_initWeak(&location, v73);
  objc_msgSend_date(MEMORY[0x1E0C99D68], v104, v105, v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v175[0] = MEMORY[0x1E0C809B0];
  v175[1] = 3221225472;
  v175[2] = sub_1A39833DC;
  v175[3] = &unk_1E4AA0F30;
  v163 = v108;
  v176 = v163;
  objc_copyWeak(&v177, &location);
  objc_msgSend_setLatencyCallback_(v73, v109, (uint64_t)v175, v110, v111);
  objc_msgSend_setType_(v103, v112, v168, v113, v114);
  objc_msgSend_bundleIdentifier(self, v115, v116, v117, v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__processUserSubstitutionsToText_request_bundleIdentifier_voice_(self, v120, (uint64_t)v103, (uint64_t)v73, (uint64_t)v119, v30);

  objc_msgSend_setSpeechString_(v73, v121, (uint64_t)v103, v122, v123);
  objc_msgSend_shared(_TtC12TextToSpeech15TTSSpeechTracer, v124, v125, v126, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_originalString(v103, v129, v130, v131, v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transformedString(v103, v134, v135, v136, v137);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_makeWithOtherRewrite_from_to_(_TtC12TextToSpeech18TTSSpeechEventObjc, v139, (uint64_t)CFSTR("user-substitutions"), (uint64_t)v133, (uint64_t)v138);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_jobIdentifier(v73, v141, v142, v143, v144);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitWithEvent_forIdentifier_(v128, v146, (uint64_t)v140, (uint64_t)v145, v147);

  if ((TTSIsBaseSystem() & 1) == 0)
  {
    objc_msgSend_synthesisProviderVoice(v30, v148, v149, v150, v151, v163);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSynthesisProviderVoice_(v73, v153, (uint64_t)v152, v154, v155);

  }
  objc_msgSend_setDelegate_(v73, v148, (uint64_t)self, v150, v151, v163);
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend_setDispatchTime_(v73, v157, v158, v159, v160, Current);
  if (v73)
  {
    v161 = self->_queue;
    v172[0] = MEMORY[0x1E0C809B0];
    v172[1] = 3221225472;
    v172[2] = sub_1A3983468;
    v172[3] = &unk_1E4AA0560;
    v172[4] = self;
    v173 = v73;
    v174 = v30;
    dispatch_sync(v161, v172);

  }
  if (a7)
    *a7 = objc_retainAutorelease(v73);
  objc_destroyWeak(&v177);

  objc_destroyWeak(&location);
  v19 = 0;
  v18 = 1;
  a8 = v166;
  v14 = v167;
  v15 = v165;
  if (v166)
LABEL_31:
    *a8 = objc_retainAutorelease(v19);
LABEL_32:

  return v18;
}

+ (id)audioFileSettingsForVoice:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  dispatch_semaphore_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  if (v6)
  {
    objc_msgSend_voiceForIdentifier_(TTSSpeechSynthesizer, v3, (uint64_t)v6, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = sub_1A39806FC;
    v33 = sub_1A398070C;
    v34 = 0;
    v8 = dispatch_semaphore_create(0);
    objc_msgSend_synthesisProviderVoice(v7, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = sub_1A3983644;
    v26 = &unk_1E4AA0F78;
    v28 = &v29;
    v14 = v8;
    v27 = v14;
    objc_msgSend_formatForVoice_completionHandler_(_TtC12TextToSpeech13TTSAURenderer, v15, (uint64_t)v13, (uint64_t)&v23, v16);

    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend_settings((void *)v30[5], v17, v18, v19, v20, v23, v24, v25, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)_speechVoiceForIdentifier:(id)a3 language:(id)a4 footprint:(int64_t)a5
{
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  dispatch_semaphore_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  id v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  int v47;
  NSObject *v48;
  id v49;
  id v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  NSObject *v97;
  uint64_t v98;
  void *v100;
  _QWORD v101[4];
  id v102;
  __int128 *v103;
  _QWORD block[4];
  id v105;
  id v106;
  uint64_t *v107;
  uint64_t *v108;
  int64_t v109;
  char v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t (*v114)(uint64_t, uint64_t);
  void (*v115)(uint64_t);
  id v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t);
  void (*v121)(uint64_t);
  id v122;
  _QWORD v123[4];
  id v124;
  _BYTE *v125;
  id v126;
  _QWORD v127[4];
  NSObject *v128;
  _BYTE *v129;
  __int128 v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  id v134;
  _BYTE buf[24];
  uint64_t (*v136)(uint64_t, uint64_t);
  void (*v137)(uint64_t);
  id v138;
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  v8 = (uint64_t)a3;
  v9 = (uint64_t)a4;
  if (TTSUseCoreSynthesizerForTTS())
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v136 = sub_1A39806FC;
    v137 = sub_1A398070C;
    v138 = 0;
    v14 = dispatch_semaphore_create(0);
    objc_msgSend_shared(_TtC12TextToSpeech13VoiceResolver, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v127[0] = MEMORY[0x1E0C809B0];
    v127[1] = 3221225472;
    v127[2] = sub_1A3983E54;
    v127[3] = &unk_1E4AA0EC8;
    v129 = buf;
    v20 = v14;
    v128 = v20;
    objc_msgSend_voiceForIdentifier_preferringLanguage_completionHandler_(v19, v21, v8, v9, (uint64_t)v127);

    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    v22 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
    goto LABEL_37;
  }
  if (!(v8 | v9))
  {
    objc_msgSend_preferredLanguages(MEMORY[0x1E0C99DC8], v10, v11, v12, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v23, v24, v25, v26, v27);
    v9 = objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (!v8)
    goto LABEL_9;
  objc_msgSend_voiceForIdentifier_(TTSSpeechSynthesizer, v10, v8, v12, v13);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  AXTTSLogCommon();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_service(v22, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v33;
    _os_log_impl(&dword_1A3940000, v28, OS_LOG_TYPE_INFO, "Voice was found for given identifier %@ with service %@", buf, 0x16u);

  }
  if (!v22)
  {
LABEL_9:
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v136 = sub_1A39806FC;
    v137 = sub_1A398070C;
    v138 = 0;
    objc_msgSend_sharedInstance(TTSAXResourceManager, v10, v11, v12, v13);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resourcesWithLanguage_type_(v34, v35, v9, 1, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v123[0] = MEMORY[0x1E0C809B0];
    v123[1] = 3221225472;
    v123[2] = sub_1A3983EA0;
    v123[3] = &unk_1E4AA0FA0;
    v38 = (id)v8;
    v124 = v38;
    v125 = buf;
    v126 = a1;
    objc_msgSend_ax_flatMappedArrayUsingBlock_(v37, v39, (uint64_t)v123, v40, v41);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v37;
    if (v8)
      v47 = objc_msgSend_isInstalled(*(void **)(*(_QWORD *)&buf[8] + 40), v42, v43, v44, v45) ^ 1;
    else
      v47 = 1;
    v117 = 0;
    v118 = &v117;
    v119 = 0x3032000000;
    v120 = sub_1A39806FC;
    v121 = sub_1A398070C;
    v122 = 0;
    v111 = 0;
    v112 = &v111;
    v113 = 0x3032000000;
    v114 = sub_1A39806FC;
    v115 = sub_1A398070C;
    v116 = 0;
    v48 = qword_1ED1B5BD8;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A3983F50;
    block[3] = &unk_1E4AA0FC8;
    v49 = v46;
    v105 = v49;
    v107 = &v111;
    v50 = v38;
    v106 = v50;
    v108 = &v117;
    v109 = a5;
    v110 = v47;
    dispatch_sync(v48, block);
    if (v118[5])
    {
      AXTTSLogCommon();
      v55 = v100;
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        v57 = v118[5];
        LODWORD(v130) = 138412290;
        *(_QWORD *)((char *)&v130 + 4) = v57;
        _os_log_impl(&dword_1A3940000, v56, OS_LOG_TYPE_INFO, "Found selected voice: %@", (uint8_t *)&v130, 0xCu);
      }

      v22 = (id)v118[5];
    }
    else
    {
      if (!v47)
      {
        v55 = v100;
        if (objc_msgSend_containsString_(v50, v51, (uint64_t)CFSTR("siri"), v53, v54)
          && objc_msgSend_containsString_(v50, v73, (uint64_t)CFSTR("premium"), v74, v75))
        {
          objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v50, v76, (uint64_t)CFSTR("premium"), (uint64_t)CFSTR("compact"), v77);
          v8 = objc_claimAutoreleasedReturnValue();

          objc_msgSend_predicateWithFormat_(MEMORY[0x1E0CB3880], v78, (uint64_t)CFSTR("identifier == %@"), v79, v80, v8);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_filteredArrayUsingPredicate_(v49, v82, (uint64_t)v81, v83, v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_firstObject(v85, v86, v87, v88, v89);
          v22 = (id)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
LABEL_36:

            _Block_object_dispose(&v111, 8);
            _Block_object_dispose(&v117, 8);

            _Block_object_dispose(buf, 8);
            goto LABEL_37;
          }
        }
        else
        {
          v8 = (uint64_t)v50;
        }
        *(_QWORD *)&v130 = 0;
        *((_QWORD *)&v130 + 1) = &v130;
        v131 = 0x3032000000;
        v132 = sub_1A39806FC;
        v133 = sub_1A398070C;
        v134 = (id)v112[5];
        if (!*(_QWORD *)(*((_QWORD *)&v130 + 1) + 40))
        {
          v90 = qword_1ED1B5BD8;
          v101[0] = MEMORY[0x1E0C809B0];
          v101[1] = 3221225472;
          v101[2] = sub_1A398412C;
          v101[3] = &unk_1E4A9FBE8;
          v102 = v49;
          v103 = &v130;
          dispatch_sync(v90, v101);

          if (!*(_QWORD *)(*((_QWORD *)&v130 + 1) + 40)
            && (objc_msgSend_isEqualToString_((void *)v9, v91, (uint64_t)CFSTR("en-US"), v92, v93) & 1) == 0)
          {
            objc_msgSend__speechVoiceForIdentifier_language_footprint_(a1, v94, 0, (uint64_t)CFSTR("en-US"), a5);
            v95 = objc_claimAutoreleasedReturnValue();
            v96 = *(void **)(*((_QWORD *)&v130 + 1) + 40);
            *(_QWORD *)(*((_QWORD *)&v130 + 1) + 40) = v95;

          }
        }
        v22 = *(id *)(*((_QWORD *)&v130 + 1) + 40);
        _Block_object_dispose(&v130, 8);

        v55 = v100;
        goto LABEL_36;
      }
      objc_msgSend_sharedInstance(TTSLocaleUtilities, v51, v52, v53, v54);
      v55 = v100;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_defaultVoiceIdentifierForGeneralLanguageCode_(v58, v59, v9, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (v62)
      {
        AXTTSLogCommon();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          v64 = v112[5];
          LODWORD(v130) = 138412290;
          *(_QWORD *)((char *)&v130 + 4) = v64;
          _os_log_impl(&dword_1A3940000, v63, OS_LOG_TYPE_INFO, "Found general default voice: %@", (uint8_t *)&v130, 0xCu);
        }

        objc_msgSend_sharedInstance(TTSAXResourceManager, v65, v66, v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_speechVoiceWithVoiceId_(v69, v70, (uint64_t)v62, v71, v72);
        v22 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        AXTTSLogCommon();
        v97 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
        {
          v98 = v112[5];
          LODWORD(v130) = 138412290;
          *(_QWORD *)((char *)&v130 + 4) = v98;
          _os_log_impl(&dword_1A3940000, v97, OS_LOG_TYPE_INFO, "Found default voice: %@", (uint8_t *)&v130, 0xCu);
        }

        v22 = (id)v112[5];
      }

    }
    v8 = (uint64_t)v50;
    goto LABEL_36;
  }
LABEL_37:

  return v22;
}

- (BOOL)_stopSpeakingRequest:(id)a3 atNextBoundary:(int64_t)a4 synchronously:(BOOL)a5 error:(id *)a6
{
  id v7;
  TTSSpeechSynthesizer *v8;
  NSMutableArray *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  dispatch_semaphore_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CFErrorRef v41;
  _QWORD v45[4];
  dispatch_semaphore_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v8 = self;
  v9 = self->_speechRequests;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v47, (uint64_t)v51, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v48 != v14)
          objc_enumerationMutation(v9);
        v16 = *(id *)(*((_QWORD *)&v47 + 1) + 8 * i);
        if (!v7 || v16 == v7)
        {
          if (TTSUseCoreSynthesizerForTTS())
          {
            v21 = dispatch_semaphore_create(0);
            objc_msgSend_coreSynth(v8, v22, v23, v24, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v45[0] = MEMORY[0x1E0C809B0];
            v45[1] = 3221225472;
            v45[2] = sub_1A3984498;
            v45[3] = &unk_1E4AA0790;
            v46 = v21;
            v27 = v21;
            objc_msgSend_stopSpeakingAt_completionHandler_(v26, v28, a4, (uint64_t)v45, v29);

            dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
            v30 = v46;
          }
          else
          {
            objc_msgSend_voice(v16, v17, v18, v19, v20);
            v27 = objc_claimAutoreleasedReturnValue();
            objc_msgSend_service(v27, v31, v32, v33, v34);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stopSpeechRequest_atMark_(v30, v35, (uint64_t)v16, a4 == 1, v36);
          }

        }
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v47, (uint64_t)v51, 16);
    }
    while (v13);
  }

  if (objc_msgSend_count(v8->_speechRequests, v37, v38, v39, v40))
    v41 = 0;
  else
    v41 = TTSErrorCreate(0, CFSTR("TTSErrorDomain"), -4003, CFSTR("not currently speaking"));
  if (a6)
    *a6 = objc_retainAutorelease(v41);

  return v41 == 0;
}

- (BOOL)_pauseSpeakingRequest:(id)a3 atNextBoundary:(int64_t)a4 synchronously:(BOOL)a5 error:(id *)a6
{
  id v7;
  NSMutableArray *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  dispatch_semaphore_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CFErrorRef v42;
  _QWORD v46[4];
  dispatch_semaphore_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v8 = self->_speechRequests;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v48, (uint64_t)v52, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v49 != v13)
          objc_enumerationMutation(v8);
        v15 = *(id *)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (!v7 || v15 == v7)
        {
          if (TTSUseCoreSynthesizerForTTS())
          {
            v20 = dispatch_semaphore_create(0);
            objc_msgSend_coreSynth(self, v21, v22, v23, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v46[0] = MEMORY[0x1E0C809B0];
            v46[1] = 3221225472;
            v46[2] = sub_1A39846E4;
            v46[3] = &unk_1E4AA0790;
            v47 = v20;
            v26 = v20;
            objc_msgSend_pauseSpeakingAt_completionHandler_(v25, v27, a4, (uint64_t)v46, v28);

            dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
            objc_msgSend_speechRequestDidPause_forService_(self, v29, (uint64_t)v15, 0, v30);
            v31 = v47;
          }
          else
          {
            objc_msgSend_voice(v15, v16, v17, v18, v19);
            v26 = objc_claimAutoreleasedReturnValue();
            objc_msgSend_service(v26, v32, v33, v34, v35);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_pauseSpeechRequest_atMark_(v31, v36, (uint64_t)v15, a4 == 1, v37);
          }

        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v48, (uint64_t)v52, 16);
    }
    while (v12);
  }

  if (objc_msgSend_count(self->_speechRequests, v38, v39, v40, v41))
    v42 = 0;
  else
    v42 = TTSErrorCreate(0, CFSTR("TTSErrorDomain"), -4003, CFSTR("not currently speaking"));
  if (a6)
    *a6 = objc_retainAutorelease(v42);

  return v42 == 0;
}

- (BOOL)_continueSpeakingRequest:(id)a3 withError:(id *)a4
{
  id v6;
  NSMutableArray *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CFErrorRef v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v7 = self->_speechRequests;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v41, (uint64_t)v45, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v42;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(v7);
        v14 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * v13);
        if (!v6 || v14 == v6)
        {
          if (TTSUseCoreSynthesizerForTTS())
          {
            objc_msgSend_coreSynth(self, v15, v16, v17, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend_continueSpeaking(v19, v20, v21, v22, v23);

            if (v24)
              objc_msgSend_speechRequestDidContinue_forService_(self, v10, (uint64_t)v14, 0, v25);
          }
          else
          {
            objc_msgSend_voice(v14, v15, v16, v17, v18, (_QWORD)v41);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_service(v26, v27, v28, v29, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_continueSpeechRequest_(v31, v32, (uint64_t)v14, v33, v34);

          }
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v41, (uint64_t)v45, 16);
    }
    while (v11);
  }

  if (!objc_msgSend_count(self->_speechRequests, v35, v36, v37, v38))
  {
    v39 = TTSErrorCreate(0, CFSTR("TTSErrorDomain"), -4003, CFSTR("no active speech job"));
    if (!a4)
      goto LABEL_17;
    goto LABEL_16;
  }
  v39 = 0;
  if (a4)
LABEL_16:
    *a4 = objc_retainAutorelease(v39);
LABEL_17:

  return v39 == 0;
}

- (NSArray)audioEffects
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_coreSynth(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_effects(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

- (void)setAudioEffects:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend_coreSynth(self, v5, v6, v7, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEffects_(v12, v9, (uint64_t)v4, v10, v11);

}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A39849C0;
  block[3] = &unk_1E4A9FB48;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (TTSSpeechSynthesizerDelegate)delegate
{
  return (TTSSpeechSynthesizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)startSpeakingString:(id)a3 error:(id *)a4
{
  return MEMORY[0x1E0DE7D20](self, sel_startSpeakingString_withLanguageCode_error_, a3, 0, a4);
}

- (BOOL)startSpeakingString:(id)a3 withLanguageCode:(id)a4 error:(id *)a5
{
  return MEMORY[0x1E0DE7D20](self, sel_startSpeakingString_withLanguageCode_error_, a3, a4, a5);
}

- (BOOL)stopSpeakingAtNextBoundary:(int64_t)a3 error:(id *)a4
{
  return objc_msgSend_stopSpeakingAtNextBoundary_synchronously_error_(self, a2, a3, 0, (uint64_t)a4);
}

- (BOOL)stopSpeakingAtNextBoundary:(int64_t)a3 synchronously:(BOOL)a4 error:(id *)a5
{
  NSObject *queue;
  char v6;
  _QWORD block[8];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A3984A98;
  block[3] = &unk_1E4AA0FF0;
  block[4] = self;
  block[5] = &v10;
  v9 = a4;
  block[6] = a3;
  block[7] = a5;
  dispatch_sync(queue, block);
  v6 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (BOOL)pauseSpeakingAtNextBoundary:(int64_t)a3 error:(id *)a4
{
  return MEMORY[0x1E0DE7D20](self, sel_pauseSpeakingAtNextBoundary_synchronously_error_, a3, 0, a4);
}

- (BOOL)pauseSpeakingAtNextBoundary:(int64_t)a3 synchronously:(BOOL)a4 error:(id *)a5
{
  NSObject *queue;
  char v6;
  _QWORD block[8];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A3984B78;
  block[3] = &unk_1E4AA0FF0;
  block[4] = self;
  block[5] = &v10;
  v9 = a4;
  block[6] = a3;
  block[7] = a5;
  dispatch_sync(queue, block);
  v6 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (BOOL)continueSpeakingWithError:(id *)a3
{
  NSObject *queue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A3984C48;
  block[3] = &unk_1E4AA1018;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isSpeaking
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char isPaused;
  NSObject *queue;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  if (TTSUseCoreSynthesizerForTTS())
  {
    objc_msgSend_coreSynth(self, v3, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isSpeaking(v7, v8, v9, v10, v11) & 1) != 0)
    {
      isPaused = 1;
    }
    else
    {
      objc_msgSend_coreSynth(self, v12, v13, v14, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      isPaused = objc_msgSend_isPaused(v18, v19, v20, v21, v22);

    }
  }
  else
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    queue = self->_queue;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1A3984D6C;
    v24[3] = &unk_1E4A9FBE8;
    v24[4] = self;
    v24[5] = &v25;
    dispatch_sync(queue, v24);
    isPaused = *((_BYTE *)v26 + 24) != 0;
    _Block_object_dispose(&v25, 8);
  }
  return isPaused;
}

- (id)speechString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  objc_msgSend_lastObject(self->_speechRequests, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_speechString(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_originalString(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend_speechString(v5, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_originalString(v20, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_text(v5, v16, v17, v18, v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

- (float)minimumRate
{
  return 0.5;
}

- (float)maximumRate
{
  return 4.0;
}

- (void)setFootprint:(int64_t)a3
{
  self->_footprint = a3;
}

- (int64_t)footprint
{
  return self->_footprint;
}

- (void)useSpecificAudioSession:(unsigned int)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  if (a3)
  {
    v3 = *(_QWORD *)&a3;
    self->_audioSessionID = a3;
    *(_WORD *)&self->_useSharedSession = 256;
    if (TTSUseCoreSynthesizerForTTS())
    {
      objc_msgSend_retrieveSessionWithID_(MEMORY[0x1E0C89AF0], v5, v3, v6, v7);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_coreSynth(self, v8, v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAudioSession_(v12, v13, (uint64_t)v16, v14, v15);

    }
  }
}

- (unsigned)audioQueueFlags
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;

  if (!TTSUseCoreSynthesizerForTTS())
    return self->_audioQueueFlags;
  objc_msgSend_coreSynth(self, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_audioQueueFlags(v7, v8, v9, v10, v11);

  return v12;
}

- (void)setAudioQueueFlags:(unsigned int)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v3 = *(_QWORD *)&a3;
  if (TTSUseCoreSynthesizerForTTS())
  {
    objc_msgSend_coreSynth(self, v5, v6, v7, v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAudioQueueFlags_(v12, v9, v3, v10, v11);

  }
  else
  {
    self->_audioQueueFlags = v3;
  }
}

+ (id)supportedIPAPhonemeLanguages
{
  return (id)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(TTSPhonemeSupport, sel_supportedIPAPhonemeLanguages);
}

- (BOOL)startSpeakingString:(id)a3 request:(id *)a4 error:(id *)a5
{
  return MEMORY[0x1E0DE7D20](self, sel__startSpeakingString_orSSMLString_withLanguageCode_jobId_request_error_, a3, 0, 0);
}

- (BOOL)startSpeakingString:(id)a3 withLanguageCode:(id)a4 jobIdentifier:(id)a5 request:(id *)a6 error:(id *)a7
{
  return MEMORY[0x1E0DE7D20](self, sel__startSpeakingString_orSSMLString_withLanguageCode_jobId_request_error_, a3, 0, a4);
}

- (BOOL)startSpeakingString:(id)a3 withLanguageCode:(id)a4 request:(id *)a5 error:(id *)a6
{
  return MEMORY[0x1E0DE7D20](self, sel__startSpeakingString_orSSMLString_withLanguageCode_jobId_request_error_, a3, 0, a4);
}

- (BOOL)startSpeakingSSML:(id)a3 withLanguageCode:(id)a4 request:(id *)a5 error:(id *)a6
{
  return MEMORY[0x1E0DE7D20](self, sel__startSpeakingString_orSSMLString_withLanguageCode_jobId_request_error_, 0, a3, a4);
}

- (BOOL)startSpeakingSSML:(id)a3 withLanguageCode:(id)a4 jobIdentifier:(id)a5 request:(id *)a6 error:(id *)a7
{
  return MEMORY[0x1E0DE7D20](self, sel__startSpeakingString_orSSMLString_withLanguageCode_jobId_request_error_, 0, a3, a4);
}

- (BOOL)stopSpeakingRequest:(id)a3 atNextBoundary:(int64_t)a4 error:(id *)a5
{
  return objc_msgSend__stopSpeakingRequest_atNextBoundary_synchronously_error_(self, a2, (uint64_t)a3, a4, 0, a5);
}

- (BOOL)pauseSpeakingRequest:(id)a3 atNextBoundary:(int64_t)a4 error:(id *)a5
{
  return objc_msgSend__pauseSpeakingRequest_atNextBoundary_synchronously_error_(self, a2, (uint64_t)a3, a4, 0, a5);
}

- (void)speechRequestDidStart:(id)a3 forService:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;

  v9 = a3;
  if ((*(_BYTE *)&self->_synthesizerFlags & 1) != 0)
  {
    objc_msgSend_delegateTargetQueue(self, v5, v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1A3985150;
    v11[3] = &unk_1E4A9FB48;
    v11[4] = self;
    v12 = v9;
    dispatch_async(v10, v11);

  }
}

- (void)speechRequestDidPause:(id)a3 forService:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;

  v9 = a3;
  if ((*(_BYTE *)&self->_synthesizerFlags & 8) != 0)
  {
    objc_msgSend_delegateTargetQueue(self, v5, v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1A3985230;
    v11[3] = &unk_1E4A9FB48;
    v11[4] = self;
    v12 = v9;
    dispatch_async(v10, v11);

  }
}

- (void)speechRequestDidContinue:(id)a3 forService:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;

  v9 = a3;
  if ((*(_BYTE *)&self->_synthesizerFlags & 0x10) != 0)
  {
    objc_msgSend_delegateTargetQueue(self, v5, v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1A3985310;
    v11[3] = &unk_1E4A9FB48;
    v11[4] = self;
    v12 = v9;
    dispatch_async(v10, v11);

  }
}

- (void)speechRequest:(id)a3 didStopWithSuccess:(BOOL)a4 phonemesSpoken:(id)a5 forService:(id)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v11 = a3;
  v12 = a5;
  v13 = a7;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A3985428;
  block[3] = &unk_1E4AA10B8;
  block[4] = self;
  v19 = v11;
  v22 = a4;
  v20 = v12;
  v21 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  dispatch_async(queue, block);

}

- (void)speechRequest:(id)a3 withMarker:(id)a4 didStartForService:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;

  v7 = a3;
  v8 = a4;
  objc_msgSend__processMarker_forRequest_(self, v9, (uint64_t)v8, (uint64_t)v7, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if ((*(_BYTE *)&self->_synthesizerFlags & 0x40) != 0)
    {
      objc_msgSend_delegateTargetQueue(self, v11, v12, v13, v14);
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1A39858CC;
      block[3] = &unk_1E4AA0560;
      block[4] = self;
      v27 = v15;
      v28 = v7;
      dispatch_async(v16, block);

    }
    if (objc_msgSend_markType(v8, v11, v12, v13, v14) == 1)
    {
      v21 = v8;
      if ((*(_BYTE *)&self->_synthesizerFlags & 0x20) != 0)
      {
        objc_msgSend_delegateTargetQueue(self, v17, v18, v19, v20);
        v22 = objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = sub_1A3985910;
        v23[3] = &unk_1E4AA0560;
        v23[4] = self;
        v24 = v21;
        v25 = v7;
        dispatch_async(v22, v23);

      }
    }
  }

}

- (id)_processMarker:(id)a3 forRequest:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v65;
  void *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  int v85;
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend_markType(v5, v7, v8, v9, v10) != 1)
    goto LABEL_10;
  v11 = v5;
  v16 = objc_msgSend_wordRange(v11, v12, v13, v14, v15);
  v18 = v17;
  objc_msgSend_text(v6, v17, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 > objc_msgSend_length(v22, v23, v24, v25, v26))
  {

LABEL_5:
    objc_msgSend_text(v6, v31, v32, v33, v34);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_length(v42, v43, v44, v45, v46);

    if (v16 >= v47)
    {

      v63 = 0;
      goto LABEL_11;
    }
    objc_msgSend_text(v6, v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend_length(v52, v53, v54, v55, v56);

    AXTTSLogCommon();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      v65 = v57 - v16;
      objc_msgSend_text(v6, v59, v60, v61, v62);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)MEMORY[0x1E0CB37E8];
      v72 = objc_msgSend_markType(v11, v68, v69, v70, v71);
      objc_msgSend_numberWithInteger_(v67, v73, v72, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v77, v16, v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v81, v65, v82, v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = 138413058;
      v86 = v66;
      v87 = 2112;
      v88 = v76;
      v89 = 2112;
      v90 = v80;
      v91 = 2112;
      v92 = v84;
      _os_log_error_impl(&dword_1A3940000, v58, OS_LOG_TYPE_ERROR, "Speech processing error: [%@] / mark: %@ / range: %@, %@", (uint8_t *)&v85, 0x2Au);

    }
    goto LABEL_9;
  }
  v35 = (unint64_t)&v18[v16];
  objc_msgSend_text(v6, v27, v28, v29, v30);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend_length(v36, v37, v38, v39, v40);

  if (v35 > v41)
    goto LABEL_5;
LABEL_9:

LABEL_10:
  v63 = v5;
LABEL_11:

  return v63;
}

- (NSString)speechSource
{
  return self->_speechSource;
}

- (void)setSpeechSource:(id)a3
{
  objc_storeStrong((id *)&self->_speechSource, a3);
}

- (OS_dispatch_queue)delegateTargetQueue
{
  return self->_delegateTargetQueue;
}

- (void)setDelegateTargetQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateTargetQueue, a3);
}

- (float)rate
{
  return self->_rate;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (float)pitch
{
  return self->_pitch;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVoiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_voiceIdentifier, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (unint64_t)requestClientIdentifier
{
  return self->_requestClientIdentifier;
}

- (void)setRequestClientIdentifier:(unint64_t)a3
{
  self->_requestClientIdentifier = a3;
}

- (void)speakingRequestClientContext
{
  return self->_speakingRequestClientContext;
}

- (void)setSpeakingRequestClientContext:(void *)a3
{
  self->_speakingRequestClientContext = a3;
}

- (BOOL)supportsAccurateWordCallbacks
{
  return self->_supportsAccurateWordCallbacks;
}

- (void)setSupportsAccurateWordCallbacks:(BOOL)a3
{
  self->_supportsAccurateWordCallbacks = a3;
}

- (BOOL)skipLuthorRules
{
  return self->_skipLuthorRules;
}

- (void)setSkipLuthorRules:(BOOL)a3
{
  self->_skipLuthorRules = a3;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (NSArray)userSubstitutions
{
  return self->_userSubstitutions;
}

- (NSArray)phonemeSubstitutions
{
  return self->_phonemeSubstitutions;
}

- (id)audioBufferCallback
{
  return self->_audioBufferCallback;
}

- (void)setAudioBufferCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSDictionary)perVoiceSettings
{
  return self->_perVoiceSettings;
}

- (BOOL)ignoreSubstitutions
{
  return self->_ignoreSubstitutions;
}

- (void)setIgnoreSubstitutions:(BOOL)a3
{
  self->_ignoreSubstitutions = a3;
}

- (BOOL)synthesizeSilently
{
  return self->_synthesizeSilently;
}

- (void)setSynthesizeSilently:(BOOL)a3
{
  self->_synthesizeSilently = a3;
}

- (OS_voucher)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_voucher, a3);
}

- (void)setCoreSynth:(id)a3
{
  objc_storeStrong((id *)&self->_coreSynth, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreSynth, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_perVoiceSettings, 0);
  objc_storeStrong(&self->_audioBufferCallback, 0);
  objc_storeStrong((id *)&self->_phonemeSubstitutions, 0);
  objc_storeStrong((id *)&self->_userSubstitutions, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_voiceIdentifier, 0);
  objc_storeStrong((id *)&self->_delegateTargetQueue, 0);
  objc_storeStrong((id *)&self->_speechSource, 0);
  objc_storeStrong((id *)&self->_testingLastRuleConversion, 0);
  objc_storeStrong((id *)&self->_outputChannels, 0);
  objc_storeStrong((id *)&self->_speechRequests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_channels, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
