@implementation SVXAceViewHandler

- (SVXAceViewHandler)initWithModule:(id)a3 instrumentationUtils:(id)a4 modeProvider:(id)a5 speechSynthesizer:(id)a6 synthesisResultConverter:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SVXAceViewSpeakableTextExtractor *v17;
  SVXAFUtilitiesWrapper *v18;
  SVXAceViewHandler *v19;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_alloc_init(SVXAceViewSpeakableTextExtractor);
  v18 = objc_alloc_init(SVXAFUtilitiesWrapper);
  v19 = -[SVXAceViewHandler initWithModule:instrumentationUtils:modeProvider:speechSynthesizer:synthesisResultConverter:speakableTextExtractor:afUtilitiesWrapper:](self, "initWithModule:instrumentationUtils:modeProvider:speechSynthesizer:synthesisResultConverter:speakableTextExtractor:afUtilitiesWrapper:", v16, v15, v14, v13, v12, v17, v18);

  return v19;
}

- (SVXAceViewHandler)initWithModule:(id)a3 instrumentationUtils:(id)a4 modeProvider:(id)a5 speechSynthesizer:(id)a6 synthesisResultConverter:(id)a7 speakableTextExtractor:(id)a8 afUtilitiesWrapper:(id)a9
{
  id v16;
  id v17;
  SVXAceViewHandler *v18;
  SVXAceViewHandler *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)SVXAceViewHandler;
  v18 = -[SVXAceViewHandler init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_speakableTextExtractor, a8);
    objc_storeStrong((id *)&v19->_module, a3);
    objc_storeStrong((id *)&v19->_instrumentationUtils, a4);
    objc_storeStrong((id *)&v19->_modeProvider, a5);
    objc_storeStrong((id *)&v19->_synthesisResultConverter, a7);
    objc_storeStrong((id *)&v19->_speechSynthesizer, a6);
    objc_storeStrong((id *)&v19->_afUtilitiesWrapper, a9);
  }

  return v19;
}

- (void)handleAceView:(id)a3 isExpository:(BOOL)a4 taskTracker:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  char isKindOfClass;
  os_log_t *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  const __CFString **v21;
  const __CFString **v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  __CFString *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  os_log_t *v32;
  NSObject *v33;
  SVXInstrumentationUtilities *instrumentationUtils;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  SVXSpeechSynthesisRequest *v42;
  uint64_t v43;
  void *v44;
  SVXSpeechSynthesisRequest *v45;
  SVXSpeechSynthesizer *speechSynthesizer;
  uint64_t v47;
  id v48;
  id v49;
  SVXSpeechSynthesisRequest *v50;
  void *v51;
  os_log_t v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  id v60;
  _QWORD v61[4];
  SVXSpeechSynthesisRequest *v62;
  id v63;
  SVXAceViewHandler *v64;
  id v65;
  _QWORD v66[4];
  SVXSpeechSynthesisRequest *v67;
  id v68;
  _QWORD v69[4];
  __CFString *v70;
  id v71;
  SVXAceViewHandler *v72;
  uint64_t v73;
  const __CFString *v74;
  const __CFString *v75;
  _QWORD v76[2];
  _QWORD v77[2];
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v59 = a4;
  v82 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v60 = a6;
  v11 = mach_absolute_time();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v13 = (os_log_t *)MEMORY[0x24BE08FB0];
  if ((isKindOfClass & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v9, "dialogIdentifier");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "dialog");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      v52 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEBUG))
      {
        v54 = v52;
        objc_msgSend(v9, "dialog");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "dialogIdentifier");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v79 = "-[SVXAceViewHandler handleAceView:isExpository:taskTracker:completion:]";
        v80 = 2112;
        v81 = v56;
        _os_log_debug_impl(&dword_214934000, v54, OS_LOG_TYPE_DEBUG, "%s AceView has an SADialog...using the identifier for that: %@", buf, 0x16u);

      }
      objc_msgSend(v9, "dialog");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "dialogIdentifier");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
  }
  if (-[SVXAFUtilitiesWrapper af_IsInternalInstall](self->_afUtilitiesWrapper, "af_IsInternalInstall"))
  {
    v76[0] = CFSTR("dialogPhase");
    objc_msgSend(v10, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dialogPhase");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = &stru_24D24F378;
    if (v16)
      v19 = (const __CFString *)v16;
    else
      v19 = &stru_24D24F378;
    v76[1] = CFSTR("dialogIdentifier");
    v77[0] = v19;
    if (v14)
      v18 = v14;
    v77[1] = v18;
    v20 = (void *)MEMORY[0x24BDBCE70];
    v21 = (const __CFString **)v77;
    v22 = (const __CFString **)v76;
    v23 = 2;
  }
  else
  {
    v74 = CFSTR("dialogPhase");
    objc_msgSend(v10, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dialogPhase");
    v24 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v24;
    v25 = &stru_24D24F378;
    if (v24)
      v25 = (const __CFString *)v24;
    v75 = v25;
    v20 = (void *)MEMORY[0x24BDBCE70];
    v21 = &v75;
    v22 = &v74;
    v23 = 1;
  }
  objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, v23);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = __71__SVXAceViewHandler_handleAceView_isExpository_taskTracker_completion___block_invoke;
  v69[3] = &unk_24D24D890;
  v73 = v11;
  v27 = v14;
  v70 = v27;
  v28 = v9;
  v71 = v28;
  v72 = self;
  objc_msgSend(v26, "mutatedCopyWithMutator:", v69);
  v29 = objc_claimAutoreleasedReturnValue();

  v57 = (void *)v29;
  objc_msgSend(v10, "beginChildWithContext:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVXAceViewSpeakableTextExtractor extractWithAceView:](self->_speakableTextExtractor, "extractWithAceView:", v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v13;
  v33 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v79 = "-[SVXAceViewHandler handleAceView:isExpository:taskTracker:completion:]";
    v80 = 2112;
    v81 = v31;
    _os_log_impl(&dword_214934000, v33, OS_LOG_TYPE_INFO, "%s speakableText = %@", buf, 0x16u);
  }
  instrumentationUtils = self->_instrumentationUtils;
  objc_msgSend(v10, "instrumentationContext");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dialogPhase");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVXInstrumentationUtilities emitUUFRSaidWithModeSupport:dialogIdentifier:dialogPhase:speakableText:currentMode:](instrumentationUtils, "emitUUFRSaidWithModeSupport:dialogIdentifier:dialogPhase:speakableText:currentMode:", v35, v27, v36, v31, -[MDModeProviding currentMode](self->_modeProvider, "currentMode"));

  if (objc_msgSend(v28, "disableDeviceRacing"))
  {
    v37 = *v32;
    if (os_log_type_enabled(*v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v79 = "-[SVXAceViewHandler handleAceView:isExpository:taskTracker:completion:]";
      _os_log_impl(&dword_214934000, v37, OS_LOG_TYPE_DEFAULT, "%s disableDeviceRacing found to prefer server side TTS synthesis for music domain. minimizeDeviceUsage in SVXSpeechSynthesisOptions will be set", buf, 0xCu);
    }
  }
  v38 = objc_msgSend(v28, "canUseServerTTS");
  v39 = objc_msgSend(v28, "disableDeviceRacing");
  v40 = 2;
  if (!v39)
    v40 = 0;
  v41 = v40 | v38;
  v42 = [SVXSpeechSynthesisRequest alloc];
  if (v59)
    v43 = 1;
  else
    v43 = 2;
  objc_msgSend(v28, "speakableContextInfo");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[SVXSpeechSynthesisRequest initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:](v42, "initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:", v43, v41, v31, v44, 0, 0, 0);

  speechSynthesizer = self->_speechSynthesizer;
  v47 = MEMORY[0x24BDAC760];
  v66[0] = MEMORY[0x24BDAC760];
  v66[1] = 3221225472;
  v66[2] = __71__SVXAceViewHandler_handleAceView_isExpository_taskTracker_completion___block_invoke_11;
  v66[3] = &unk_24D24F018;
  v67 = v45;
  v68 = v28;
  v61[0] = v47;
  v61[1] = 3221225472;
  v61[2] = __71__SVXAceViewHandler_handleAceView_isExpository_taskTracker_completion___block_invoke_13;
  v61[3] = &unk_24D24D8B8;
  v62 = v67;
  v63 = v68;
  v64 = self;
  v65 = v60;
  v48 = v60;
  v49 = v68;
  v50 = v67;
  -[SVXSpeechSynthesizer enqueueRequest:languageCode:voiceName:gender:audioSessionID:preparation:finalization:taskTracker:analyticsContext:](speechSynthesizer, "enqueueRequest:languageCode:voiceName:gender:audioSessionID:preparation:finalization:taskTracker:analyticsContext:", v50, 0, 0, 0, 0, v66, v61, v30, v58);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesisResultConverter, 0);
  objc_storeStrong((id *)&self->_afUtilitiesWrapper, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_modeProvider, 0);
  objc_storeStrong((id *)&self->_instrumentationUtils, 0);
  objc_storeStrong((id *)&self->_module, 0);
  objc_storeStrong((id *)&self->_speakableTextExtractor, 0);
}

void __71__SVXAceViewHandler_handleAceView_isExpository_taskTracker_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "setTimestamp:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "setDialogIdentifier:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "aceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAceId:", v4);

  objc_msgSend(*(id *)(a1 + 40), "refId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRefId:", v5);

  objc_msgSend(*(id *)(a1 + 40), "listenAfterSpeaking");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (!v7)
    goto LABEL_5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "preferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "listenAfterSpeakingDisabled");

  if (!v9)
  {
    v12 = 1;
    goto LABEL_7;
  }
  v10 = *MEMORY[0x24BE08FB0];
  v11 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  v12 = 0;
  if (v11)
  {
    v14 = 136315138;
    v15 = "-[SVXAceViewHandler handleAceView:isExpository:taskTracker:completion:]_block_invoke";
    _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_DEFAULT, "%s Overriding listenAfterSpeaking due to defaults", (uint8_t *)&v14, 0xCu);
LABEL_5:
    v12 = 0;
  }
LABEL_7:
  objc_msgSend(v3, "setListensAfterSpeaking:", v12);
  objc_msgSend(*(id *)(a1 + 40), "listenAfterSpeakingBehavior");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setListenAfterSpeakingBehavior:", v13);

}

void __71__SVXAceViewHandler_handleAceView_isExpository_taskTracker_completion___block_invoke_11(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 136315650;
    v6 = "-[SVXAceViewHandler handleAceView:isExpository:taskTracker:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_214934000, v2, OS_LOG_TYPE_INFO, "%s Begin TTS request %@ for %@.", (uint8_t *)&v5, 0x20u);
  }
}

void __71__SVXAceViewHandler_handleAceView_isExpository_taskTracker_completion___block_invoke_13(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    v6 = a1[5];
    v9 = 136315906;
    v10 = "-[SVXAceViewHandler handleAceView:isExpository:taskTracker:completion:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s End TTS request %@ for %@ with result %@.", (uint8_t *)&v9, 0x2Au);
  }
  v7 = a1[7];
  if (v7)
  {
    objc_msgSend(*(id *)(a1[6] + 56), "toServiceCommandResult:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

@end
