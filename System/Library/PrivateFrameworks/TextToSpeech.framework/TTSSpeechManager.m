@implementation TTSSpeechManager

+ (id)currentLanguageCode
{
  return TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences();
}

- (TTSSpeechManager)init
{
  TTSSpeechManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *propertyQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *audioOperationQueue;
  NSMutableArray *v7;
  NSMutableArray *speechQueue;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  AXDispatchTimer *audioDeactivatorTimer;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSLock *speechThreadQueueLock;
  TTSSpeechThread *v27;
  TTSSpeechThread *runThread;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  TTSSpeechManager *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)TTSSpeechManager;
  v2 = -[TTSSpeechManager init](&v36, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("speech-manager-properties", 0);
    propertyQueue = v2->_propertyQueue;
    v2->_propertyQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("speech-manager-audio", 0);
    audioOperationQueue = v2->_audioOperationQueue;
    v2->_audioOperationQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    speechQueue = v2->_speechQueue;
    v2->_speechQueue = v7;

    v2->_speechEnabled = 1;
    objc_msgSend_setShouldHandleAudioInterruptions_(v2, v9, 1, v10, v11);
    v12 = objc_alloc(MEMORY[0x1E0CF3978]);
    v16 = objc_msgSend_initWithTargetSerialQueue_(v12, v13, MEMORY[0x1E0C80D38], v14, v15);
    audioDeactivatorTimer = v2->_audioDeactivatorTimer;
    v2->_audioDeactivatorTimer = (AXDispatchTimer *)v16;

    objc_msgSend_setAutomaticallyCancelPendingBlockUponSchedulingNewBlock_(v2->_audioDeactivatorTimer, v18, 1, v19, v20);
    objc_msgSend_setAudioSessionInactiveTimeout_(v2, v21, v22, v23, v24, 2.0);
    v25 = objc_opt_new();
    speechThreadQueueLock = v2->_speechThreadQueueLock;
    v2->_speechThreadQueueLock = (NSLock *)v25;

    v27 = objc_alloc_init(TTSSpeechThread);
    runThread = v2->_runThread;
    v2->_runThread = v27;

    objc_msgSend_start(v2->_runThread, v29, v30, v31, v32);
    objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(v2, v33, (uint64_t)sel__initialize, (uint64_t)v2->_runThread, 0, 0);
    v34 = v2;
  }

  return v2;
}

- (void)setSpeechSource:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_storeStrong((id *)&self->_speechSource, a3);
  v8 = a3;
  objc_msgSend_setSpeechSource_(self->_synthesizer, v5, (uint64_t)v8, v6, v7);

}

- (void)setUsesAuxiliarySession:(BOOL)a3
{
  if (self->_usesAuxiliarySession != a3)
  {
    self->_usesAuxiliarySession = a3;
    objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(self, a2, (uint64_t)sel__updateAuxiliarySession, (uint64_t)self->_runThread, 0, 0);
  }
}

- (void)_updateAuxiliarySession
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  TTSSpeechThread *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  char isEqual;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  char v78;
  id v79;
  NSObject *v80;
  NSObject *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  id v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  char v109;
  NSObject *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  NSObject *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  NSObject *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  char v127;
  NSObject *v128;
  TTSSpeechSynthesizer *synthesizer;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  NSObject *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  const char *v152;
  void *v153;
  const char *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  id v167;
  id v168;
  id v169;
  uint8_t buf[4];
  id v171;
  uint64_t v172;

  v172 = *MEMORY[0x1E0C80C00];
  objc_msgSend_currentThread(MEMORY[0x1E0CB3978], a2, v2, v3, v4);
  v6 = (TTSSpeechThread *)objc_claimAutoreleasedReturnValue();
  if (v6 != self->_runThread)
    sub_1A3AB2D70();

  objc_msgSend_handleAudioSessionObservers_(self, v7, 0, v8, v9);
  if (self->_synthesizer)
  {
    objc_msgSend_audioSession(self, v10, v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_audioSessionCategory(self, v15, v16, v17, v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_audioSessionCategoryOptions(self, v20, v21, v22, v23);
    if (self->_usesAuxiliarySession)
    {
      v29 = v24;
      AXLogSpeechSynthesis();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3940000, v30, OS_LOG_TYPE_INFO, "Requesting use of aux session", buf, 2u);
      }

      objc_msgSend_audioSession(self, v31, v32, v33, v34);
      v35 = objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        v40 = (void *)v35;
        objc_msgSend_audioSession(self, v36, v37, v38, v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sharedInstance(MEMORY[0x1E0C89AF0], v42, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v41, v47, (uint64_t)v46, v48, v49);

        if ((isEqual & 1) == 0)
        {
          if (!v19)
            v19 = (id)*MEMORY[0x1E0C896C8];
          AXLogSpeechSynthesis();
          v119 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v171 = v19;
            _os_log_impl(&dword_1A3940000, v119, OS_LOG_TYPE_INFO, "Aux session exists. Updating with category: %@", buf, 0xCu);
          }

          objc_msgSend_audioSession(self, v120, v121, v122, v123);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          v169 = 0;
          v127 = objc_msgSend_setCategory_error_(v124, v125, (uint64_t)v19, (uint64_t)&v169, v126);
          v88 = v169;

          if (!v88 && (v127 & 1) != 0)
            goto LABEL_49;
          AXLogSpeechSynthesis();
          v128 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
            sub_1A3AB2CB0();
          goto LABEL_48;
        }
      }
      objc_msgSend_audioSession(self, v36, v37, v38, v39);
      v51 = objc_claimAutoreleasedReturnValue();
      if (v51)
      {
        v56 = (void *)v51;
        objc_msgSend_audioSession(self, v52, v53, v54, v55);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sharedInstance(MEMORY[0x1E0C89AF0], v58, v59, v60, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend_isEqual_(v57, v63, (uint64_t)v62, v64, v65);

        if (!v66)
          goto LABEL_49;
      }
      if (!v29)
        v29 = 3;
      if (!v19)
        v19 = (id)*MEMORY[0x1E0C896C8];
      objc_msgSend_auxiliarySession(MEMORY[0x1E0C89AF0], v52, v53, v54, v55);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAudioSession_(self, v68, (uint64_t)v67, v69, v70);

      objc_msgSend_audioSession(self, v71, v72, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v168 = 0;
      v78 = objc_msgSend_setParticipatesInNowPlayingAppPolicy_error_(v75, v76, 0, (uint64_t)&v168, v77);
      v79 = v168;

      if (v79 || (v78 & 1) == 0)
      {
        AXLogSpeechSynthesis();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
          sub_1A3AB2D10();

      }
      AXLogSpeechSynthesis();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v171 = v19;
        _os_log_impl(&dword_1A3940000, v81, OS_LOG_TYPE_INFO, "Aux session does not exist. Creating and updating with category: %@", buf, 0xCu);
      }

      objc_msgSend_audioSession(self, v82, v83, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v167 = v79;
      objc_msgSend_setCategory_withOptions_error_(v86, v87, (uint64_t)v19, v29, (uint64_t)&v167);
      v88 = v167;

      if (v88)
        v93 = 0;
      else
        v93 = v78;
      if ((v93 & 1) != 0)
      {
        v88 = 0;
LABEL_44:
        synthesizer = self->_synthesizer;
        objc_msgSend_audioSession(self, v89, v90, v91, v92);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = objc_msgSend_opaqueSessionID(v130, v131, v132, v133, v134);
        objc_msgSend_useSpecificAudioSession_(synthesizer, v136, v135, v137, v138);

        objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v139, v140, v141, v142);
        v143 = objc_claimAutoreleasedReturnValue();
        v128 = v143;
        v148 = *MEMORY[0x1E0C896F8];
        if (v14)
        {
          objc_msgSend_removeObserver_name_object_(v143, v144, (uint64_t)self, *MEMORY[0x1E0C896F8], (uint64_t)v14);
          v149 = *MEMORY[0x1E0C89728];
          objc_msgSend_removeObserver_name_object_(v128, v150, (uint64_t)self, *MEMORY[0x1E0C89728], (uint64_t)v14);
          v151 = *MEMORY[0x1E0C89740];
          objc_msgSend_removeObserver_name_object_(v128, v152, (uint64_t)self, *MEMORY[0x1E0C89740], (uint64_t)v14);
        }
        else
        {
          v149 = *MEMORY[0x1E0C89728];
          v151 = *MEMORY[0x1E0C89740];
        }
        objc_msgSend_audioSession(self, v144, v145, v146, v147);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObserver_selector_name_object_(v128, v154, (uint64_t)self, (uint64_t)sel_handleAudioInterruption_, v148, v153);

        objc_msgSend_audioSession(self, v155, v156, v157, v158);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObserver_selector_name_object_(v128, v160, (uint64_t)self, (uint64_t)sel_handleMediaServicesWereLost_, v149, v159);

        objc_msgSend_audioSession(self, v161, v162, v163, v164);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObserver_selector_name_object_(v128, v166, (uint64_t)self, (uint64_t)sel_handleMediaServicesWereReset_, v151, v165);

LABEL_48:
LABEL_49:
        objc_msgSend_handleAudioSessionObservers_(self, v52, 1, v54, v55);

        goto LABEL_50;
      }
      AXLogSpeechSynthesis();
      v115 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        sub_1A3AB2CB0();
    }
    else
    {
      objc_msgSend_audioSession(self, v25, v26, v27, v28);
      v94 = objc_claimAutoreleasedReturnValue();
      if (v94)
      {
        v99 = (void *)v94;
        objc_msgSend_audioSession(self, v95, v96, v97, v98);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sharedInstance(MEMORY[0x1E0C89AF0], v101, v102, v103, v104);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = objc_msgSend_isEqual_(v100, v106, (uint64_t)v105, v107, v108);

        if ((v109 & 1) != 0)
          goto LABEL_49;
      }
      AXLogSpeechSynthesis();
      v110 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3940000, v110, OS_LOG_TYPE_INFO, "Reverting back to shared audio session", buf, 2u);
      }

      objc_msgSend_sharedInstance(MEMORY[0x1E0C89AF0], v111, v112, v113, v114);
      v115 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAudioSession_(self, v116, (uint64_t)v115, v117, v118);
      v88 = 0;
    }

    goto LABEL_44;
  }
  AXLogSpeechSynthesis();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_1A3AB2C70(v14);
LABEL_50:

}

- (void)handleAudioSessionObservers:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  TTSSpeechThread *v7;
  const char *v8;
  const char *v9;
  const char *v10;

  v5 = a3;
  objc_msgSend_currentThread(MEMORY[0x1E0CB3978], a2, a3, v3, v4);
  v7 = (TTSSpeechThread *)objc_claimAutoreleasedReturnValue();
  if (v7 != self->_runThread)
    sub_1A3AB2D98();

  if (v5)
  {
    if (!self->_audioSessionObserversEnabled)
    {
      objc_msgSend_addObserver_forKeyPath_options_context_(self, v8, (uint64_t)self, (uint64_t)CFSTR("audioSessionCategory"), 0, 0);
      objc_msgSend_addObserver_forKeyPath_options_context_(self, v9, (uint64_t)self, (uint64_t)CFSTR("audioSessionCategoryOptions"), 0, 0);
    }
  }
  else if (self->_audioSessionObserversEnabled)
  {
    objc_msgSend_removeObserver_forKeyPath_context_(self, v8, (uint64_t)self, (uint64_t)CFSTR("audioSessionCategory"), 0);
    objc_msgSend_removeObserver_forKeyPath_context_(self, v10, (uint64_t)self, (uint64_t)CFSTR("audioSessionCategoryOptions"), 0);
  }
  self->_audioSessionObserversEnabled = v5;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  if (self->_audioSessionObserversEnabled)
  {
    AXLogSpeechSynthesis();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_1A3AB2DC0(v6);

  }
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v7, v8, (uint64_t)self, v9, v10);

  v11.receiver = self;
  v11.super_class = (Class)TTSSpeechManager;
  -[TTSSpeechManager dealloc](&v11, sel_dealloc);
}

- (BOOL)_enqueueSelectorOnSpeechThread:(SEL)a3 object:(id)a4 waitUntilDone:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
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
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 speechThreadFinished;

  v5 = a5;
  v8 = a4;
  objc_msgSend_currentThread(MEMORY[0x1E0CB3978], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqual_(v13, v14, (uint64_t)self->_runThread, v15, v16))
    sub_1A3AB2E00();

  objc_msgSend_lock(self->_speechThreadQueueLock, v17, v18, v19, v20);
  speechThreadFinished = self->_speechThreadFinished;
  if (!self->_speechThreadFinished)
    objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(self, v21, (uint64_t)a3, (uint64_t)self->_runThread, (uint64_t)v8, v5);
  objc_msgSend_unlock(self->_speechThreadQueueLock, v21, v22, v23, v24);

  return !speechThreadFinished;
}

- (void)tearDown
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend_lock(self->_speechThreadQueueLock, a2, v2, v3, v4);
  self->_speechThreadFinished = 1;
  CFRetain(self);
  objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(self, v6, (uint64_t)sel__tearDown, (uint64_t)self->_runThread, 0, 0);
  objc_msgSend_unlock(self->_speechThreadQueueLock, v7, v8, v9, v10);
}

- (void)_tearDown
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;

  if (self->_usesAuxiliarySession)
  {
    objc_msgSend_audioDeactivatorTimer(self, a2, v2, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancel(v6, v7, v8, v9, v10);

    objc_msgSend_audioSession(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActive_withOptions_error_(v15, v16, 0, 0, 0);

  }
  objc_msgSend_setAudioSession_(self, a2, 0, v3, v4);
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v17, v18, v19, v20);
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x1E0C896F8];
  objc_msgSend_audioSession(self, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v49, v27, (uint64_t)self, v21, (uint64_t)v26);

  v28 = *MEMORY[0x1E0C89728];
  objc_msgSend_audioSession(self, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v49, v34, (uint64_t)self, v28, (uint64_t)v33);

  v35 = *MEMORY[0x1E0C89740];
  objc_msgSend_audioSession(self, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v49, v41, (uint64_t)self, v35, (uint64_t)v40);

  objc_msgSend_handleAudioSessionObservers_(self, v42, 0, v43, v44);
  objc_msgSend_stop(self->_runThread, v45, v46, v47, v48);
  CFRelease(self);

}

- (void)handleMediaServicesWereLost:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  objc_msgSend_audioOperationQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1A398CFA4;
  v11[3] = &unk_1E4A9FB48;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)_handleMediaServicesWereLost:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *propertyQueue;
  const char *v11;
  _QWORD block[5];

  if (objc_msgSend_shouldHandleAudioInterruptions(self, a2, (uint64_t)a3, v3, v4))
    objc_msgSend__didBeginInterruption(self, v6, v7, v8, v9);
  if (self->_usesAuxiliarySession)
  {
    propertyQueue = self->_propertyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A398D05C;
    block[3] = &unk_1E4A9FAD0;
    block[4] = self;
    dispatch_sync(propertyQueue, block);
    objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(self, v11, (uint64_t)sel__updateAuxiliarySession, (uint64_t)self->_runThread, 0, 0);
  }
  objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(self, v6, (uint64_t)sel__updateAudioSessionProperties, (uint64_t)self->_runThread, 0, 0);
}

- (void)handleMediaServicesWereReset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  objc_msgSend_audioOperationQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1A398D100;
  v11[3] = &unk_1E4A9FB48;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)_handleMediaServicesWereReset:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (objc_msgSend_shouldHandleAudioInterruptions(self, a2, (uint64_t)a3, v3, v4))
    objc_msgSend__didEndInterruption(self, v6, v7, v8, v9);
  objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(self, v6, (uint64_t)sel__updateAudioSessionProperties, (uint64_t)self->_runThread, 0, 0);
}

- (void)_resetInterruptionTracking
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend_setAudioInterruptionStartedTime_(self, a2, v2, v3, v4, 0.0);
  objc_msgSend_setWasSpeakingBeforeAudioInterruption_(self, v6, 0, v7, v8);
  objc_msgSend_setDidRequestStartSpeakingDuringAudioInterruption_(self, v9, 0, v10, v11);
  objc_msgSend_setDidRequestPauseSpeakingDuringAudioInterruption_(self, v12, 0, v13, v14);
  objc_msgSend_setDidRequestResumeSpeakingDuringAudioInterruption_(self, v15, 0, v16, v17);
  objc_msgSend_setRequestedActionDuringAudioInterruption_(self, v18, 0, v19, v20);
}

- (void)_didEndInterruption
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;

  objc_msgSend_setIsInAudioInterruption_(self, a2, 0, v2, v3);
  if (objc_msgSend_didRequestStartSpeakingDuringAudioInterruption(self, v5, v6, v7, v8))
  {
    objc_msgSend_requestedActionDuringAudioInterruption(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dispatchSpeechAction_(self, v14, (uint64_t)v13, v15, v16);

  }
  else if (objc_msgSend_wasSpeakingBeforeAudioInterruption(self, v9, v10, v11, v12)
         && !objc_msgSend_didRequestPauseSpeakingDuringAudioInterruption(self, v20, v17, v18, v19)
         || objc_msgSend_didRequestResumeSpeakingDuringAudioInterruption(self, v20, v17, v18, v19))
  {
    objc_msgSend_continueSpeaking(self, v20, v17, v18, v19);
  }
  MEMORY[0x1E0DE7D20](self, sel__resetInterruptionTracking, v17, v18, v19);
}

- (void)_didBeginInterruption
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CFAbsoluteTime Current;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isSpeaking(self, a2, v2, v3, v4)
    && (objc_msgSend_isPaused(self, v6, v7, v8, v9) & 1) == 0)
  {
    objc_msgSend_setWasSpeakingBeforeAudioInterruption_(self, v10, 1, v11, v12);
    objc_msgSend_pauseSpeaking_(self, v13, 0, v14, v15);
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v16, (uint64_t)CFSTR("Speech interrupted, pausing"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v20, (uint64_t)CFSTR("%s:%d %@"), v21, v22, "-[TTSSpeechManager _didBeginInterruption]", 642, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED1B5680 != -1)
      dispatch_once(&qword_1ED1B5680, &unk_1E4AA1318);
    v24 = (void *)qword_1ED1B5688;
    if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_retainAutorelease(v23);
      v26 = v24;
      *(_DWORD *)buf = 136446210;
      v40 = objc_msgSend_UTF8String(v25, v27, v28, v29, v30);
      _os_log_impl(&dword_1A3940000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend_setAudioInterruptionStartedTime_(self, v32, v33, v34, v35, Current);
  objc_msgSend_setIsInAudioInterruption_(self, v36, 1, v37, v38);
}

- (void)handleAudioInterruption:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  objc_msgSend_audioOperationQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1A398D480;
  v11[3] = &unk_1E4A9FB48;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)_handleAudioInterruption:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t buf[4];
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_shouldHandleAudioInterruptions(self, v5, v6, v7, v8))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_userInfo(v4, v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v13, v15, (uint64_t)CFSTR("AVSpeechSynthesizer Audio interruption notification: %@"), v16, v17, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v19, (uint64_t)CFSTR("%s:%d %@"), v20, v21, "-[TTSSpeechManager _handleAudioInterruption:]", 660, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED1B5680 != -1)
      dispatch_once(&qword_1ED1B5680, &unk_1E4AA1338);
    v23 = (void *)qword_1ED1B5688;
    if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_retainAutorelease(v22);
      v25 = v23;
      *(_DWORD *)buf = 136446210;
      v49 = objc_msgSend_UTF8String(v24, v26, v27, v28, v29);
      _os_log_impl(&dword_1A3940000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend_userInfo(v4, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v34, v35, *MEMORY[0x1E0C89710], v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend_integerValue(v38, v39, v40, v41, v42);

    if (v43)
    {
      if (v43 == 1)
        objc_msgSend__didBeginInterruption(self, v44, v45, v46, v47);
    }
    else
    {
      objc_msgSend__didEndInterruption(self, v44, v45, v46, v47);
    }
  }

}

- (void)_updateAudioSessionProperties
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend_currentThread(MEMORY[0x1E0CB3978], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqual_(v6, v7, (uint64_t)self->_runThread, v8, v9) & 1) == 0)
    sub_1A3AB2E28();

  objc_msgSend_audioSessionCategory(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_audioSessionCategoryOptions(self, v15, v16, v17, v18);
  if (v14)
  {
    v24 = v19;
    objc_msgSend_audioSession(self, v20, v21, v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    objc_msgSend_setCategory_withOptions_error_(v25, v26, (uint64_t)v14, v24, (uint64_t)&v44);
    v27 = v44;

    if (v27)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v28, (uint64_t)CFSTR("Error setting category: %@"), v29, v30, v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v32, (uint64_t)CFSTR("%s:%d %@"), v33, v34, "-[TTSSpeechManager _updateAudioSessionProperties]", 687, v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (qword_1ED1B5680 != -1)
        dispatch_once(&qword_1ED1B5680, &unk_1E4AA1358);
      v36 = (void *)qword_1ED1B5688;
      if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEFAULT))
      {
        v37 = objc_retainAutorelease(v35);
        v38 = v36;
        v43 = objc_msgSend_UTF8String(v37, v39, v40, v41, v42);
        *(_DWORD *)buf = 136446210;
        v46 = v43;
        _os_log_impl(&dword_1A3940000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
    }

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend_isEqualToString_(v10, v13, (uint64_t)CFSTR("audioSessionCategory"), v14, v15) & 1) != 0
    || objc_msgSend_isEqualToString_(v10, v16, (uint64_t)CFSTR("audioSessionCategoryOptions"), v17, v18))
  {
    objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v16, (uint64_t)sel__updateAudioSessionProperties, 0, 0);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)TTSSpeechManager;
    -[TTSSpeechManager observeValueForKeyPath:ofObject:change:context:](&v19, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_initialize
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  TTSSpeechSynthesizer *v14;
  TTSSpeechSynthesizer *synthesizer;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  id v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD v75[4];
  id v76;
  id location;
  uint8_t buf[4];
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  objc_msgSend_handleAudioSessionObservers_(self, a2, 1, v2, v3);
  objc_msgSend__updateAudioSessionProperties(self, v5, v6, v7, v8);
  objc_initWeak(&location, self);
  v9 = objc_allocWithZone((Class)TTSSpeechSynthesizer);
  v14 = (TTSSpeechSynthesizer *)objc_msgSend_init(v9, v10, v11, v12, v13);
  synthesizer = self->_synthesizer;
  self->_synthesizer = v14;

  objc_msgSend_speechSource(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSpeechSource_(self->_synthesizer, v21, (uint64_t)v20, v22, v23);

  objc_msgSend_setDelegate_(self->_synthesizer, v24, (uint64_t)self, v25, v26);
  objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifier(v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBundleIdentifier_(self->_synthesizer, v37, (uint64_t)v36, v38, v39);

  v45 = sub_1A398DC0C(v40, v41, v42, v43, v44);
  objc_msgSend_sharedInstance(v45, v46, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = sub_1A398DCC4;
  v75[3] = &unk_1E4AA1380;
  objc_copyWeak(&v76, &location);
  objc_msgSend_registerUpdateBlock_forRetrieveSelector_withListener_(v50, v51, (uint64_t)v75, (uint64_t)sel_customPronunciationSubstitutions, (uint64_t)self);

  objc_msgSend__updateUserSubstitutions(self, v52, v53, v54, v55);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v56, (uint64_t)CFSTR("Synthesizer created: %@"), v57, v58, self->_synthesizer);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v60, (uint64_t)CFSTR("%s:%d %@"), v61, v62, "-[TTSSpeechManager _initialize]", 729, v59);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ED1B5680 != -1)
    dispatch_once(&qword_1ED1B5680, &unk_1E4A9D428);
  v64 = (id)qword_1ED1B5688;
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    v65 = objc_retainAutorelease(v63);
    v70 = objc_msgSend_UTF8String(v65, v66, v67, v68, v69);
    *(_DWORD *)buf = 136446210;
    v79 = v70;
    _os_log_impl(&dword_1A3940000, v64, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);
  }

  objc_msgSend__updateAuxiliarySession(self, v71, v72, v73, v74);
  objc_destroyWeak(&v76);
  objc_destroyWeak(&location);
}

- (unint64_t)setActiveOptions
{
  NSObject *propertyQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A398DDB0;
  v5[3] = &unk_1E4AA0AF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setSetActiveOptions:(unint64_t)a3
{
  NSObject *propertyQueue;
  _QWORD v4[6];

  propertyQueue = self->_propertyQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1A398DE1C;
  v4[3] = &unk_1E4AA13A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(propertyQueue, v4);
}

- (void)setAudioSessionCategory:(id)a3
{
  id v4;
  NSObject *propertyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  propertyQueue = self->_propertyQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A398DEA4;
  v7[3] = &unk_1E4A9FB48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(propertyQueue, v7);

}

- (NSString)audioSessionCategory
{
  NSObject *propertyQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1A398DF64;
  v10 = sub_1A398DF74;
  v11 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A398DF7C;
  v5[3] = &unk_1E4AA0AF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)setAudioSessionCategoryOptions:(unint64_t)a3
{
  NSObject *propertyQueue;
  _QWORD v4[6];

  propertyQueue = self->_propertyQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1A398DFE8;
  v4[3] = &unk_1E4AA13A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(propertyQueue, v4);
}

- (unint64_t)audioSessionCategoryOptions
{
  NSObject *propertyQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A398E084;
  v5[3] = &unk_1E4AA0AF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isInAudioInterruption
{
  NSObject *propertyQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A398E128;
  v5[3] = &unk_1E4AA0AF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsInAudioInterruption:(BOOL)a3
{
  NSObject *propertyQueue;
  _QWORD v4[5];
  BOOL v5;

  propertyQueue = self->_propertyQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1A398E198;
  v4[3] = &unk_1E4AA13D0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(propertyQueue, v4);
}

- (AVAudioSession)audioSession
{
  NSObject *propertyQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1A398DF64;
  v10 = sub_1A398DF74;
  v11 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A398E25C;
  v5[3] = &unk_1E4AA0AF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVAudioSession *)v3;
}

- (void)setAudioSession:(id)a3
{
  id v4;
  NSObject *propertyQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  propertyQueue = self->_propertyQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1A398E2EC;
  v7[3] = &unk_1E4A9FB48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(propertyQueue, v7);

}

- (BOOL)isPaused
{
  NSObject *propertyQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A398E388;
  v5[3] = &unk_1E4AA0AF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsPaused:(BOOL)a3
{
  NSObject *propertyQueue;
  _QWORD v4[5];
  BOOL v5;

  propertyQueue = self->_propertyQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1A398E3F8;
  v4[3] = &unk_1E4AA13D0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(propertyQueue, v4);
}

- (void)_updateUserSubstitutions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v6 = sub_1A398DC0C((uint64_t)self, a2, v2, v3, v4);
  objc_msgSend_sharedInstance(v6, v7, v8, v9, v10);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_customPronunciationSubstitutions(v19, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserSubstitutions_(self->_synthesizer, v16, (uint64_t)v15, v17, v18);

}

+ (id)spellOutMarkupString:(id)a3 string:(id)a4
{
  return (id)objc_msgSend_speechMarkupStringForType_forIdentifier_string_(TTSSpeechSynthesizer, a2, 1, (uint64_t)a3, (uint64_t)a4);
}

+ (id)spellOutLetterCaseMarkupString:(id)a3 string:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend_length(v6, v7, v8, v9, v10) == 1)
  {
    objc_msgSend_uppercaseLetterCharacterSet(MEMORY[0x1E0CB3500], v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_characterAtIndex_(v6, v16, 0, v17, v18);
    if (objc_msgSend_characterIsMember_(v15, v20, v19, v21, v22))
      v23 = 3;
    else
      v23 = 2;

  }
  else
  {
    v23 = 2;
  }
  objc_msgSend_speechMarkupStringForType_forIdentifier_string_(TTSSpeechSynthesizer, v11, v23, (uint64_t)v5, (uint64_t)v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)languageCodeForVoiceIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_voiceForIdentifier_(TTSSpeechSynthesizer, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_language(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)_isCharacterNativelySpeakable:(unsigned __int16)a3 languageCode:(id)a4
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
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
  char IsMember;
  BOOL v35;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v4 = a3;
  v9 = a4;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v10 = (void *)qword_1EE6D57A8;
  v41 = qword_1EE6D57A8;
  if (!qword_1EE6D57A8)
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = sub_1A3993C3C;
    v37[3] = &unk_1E4A9FC10;
    v37[4] = &v38;
    sub_1A3993C3C((uint64_t)v37, v5, v6, v7, v8);
    v10 = (void *)v39[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v38, 8);
  objc_msgSend_sharedInstance(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dialectForLanguageID_(v16, v17, (uint64_t)v9, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_locale(v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exemplarCharacterSet(v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
    IsMember = objc_msgSend_characterIsMember_(v30, v31, v4, v32, v33);
  else
    IsMember = 1;
  if ((_DWORD)v4 == 12540)
    v35 = 0;
  else
    v35 = IsMember;

  return v35;
}

+ (id)literalStringMarkup:(id)a3 string:(id)a4 speakCap:(BOOL)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  char isCharacterNativelySpeakable_languageCode;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  id v85;
  id v86;
  uint64_t v87;
  id v88;
  void *v89;
  void *v90;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  void *v97;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend_length(v8, v9, v10, v11, v12))
  {
    objc_msgSend_languageCodeForVoiceIdentifier_(TTSSpeechManager, v13, (uint64_t)v7, v14, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      objc_msgSend_currentLanguageCode(TTSSpeechManager, v16, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_spellOutLetterCaseMarkupString_string_(TTSSpeechManager, v16, (uint64_t)v7, (uint64_t)v8, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_length(v8, v22, v23, v24, v25);
    if (v26 != 1)
      goto LABEL_22;
    v31 = objc_msgSend_characterAtIndex_(v8, v27, 0, v29, v30);
    objc_msgSend_uppercaseLetterCharacterSet(MEMORY[0x1E0CB3500], v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_characterIsMember_(v36, v37, v31, v38, v39);

    isCharacterNativelySpeakable_languageCode = objc_msgSend__isCharacterNativelySpeakable_languageCode_(a1, v40, v31, (uint64_t)v20, v41);
    v43 = v20;
    v48 = v43;
    v94 = 0;
    v95 = &v94;
    v96 = 0x2020000000;
    v49 = off_1EE6D57B0;
    v97 = off_1EE6D57B0;
    if (!off_1EE6D57B0)
    {
      v50 = (void *)sub_1A3993B94((uint64_t)v43, v44, v45, v46, v47);
      v49 = dlsym(v50, "AXVOLocalizedStringForCharacter");
      v95[3] = (uint64_t)v49;
      off_1EE6D57B0 = v49;
    }
    _Block_object_dispose(&v94, 8);
    if (!v49)
      sub_1A3AB2E50(v51, v52, v53, v54, v55);
    ((void (*)(uint64_t, void *))v49)(v31, v48);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
      v60 = isCharacterNativelySpeakable_languageCode;
    else
      v60 = 1;
    if ((v60 & 1) != 0 || (objc_msgSend_isEqualToString_(v56, v57, (uint64_t)v8, v58, v59) & 1) != 0)
    {
LABEL_21:

LABEL_22:
      VOTBundle(v26, v27, v28, v29, v30);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      AXNSLocalizedStringForLocale();
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      AXCFormattedString();
      v86 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_23;
    }
    objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v61, (uint64_t)CFSTR("]\\-^"), v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend_characterAtIndex_(v8, v65, 0, v66, v67);
    objc_msgSend_characterIsMember_(v64, v69, v68, v70, v71);
    AXCFormattedString();
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend_rangeOfString_options_(v56, v73, (uint64_t)v72, 1024, v74, v8);
    v93 = v76;

    if (v75 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_stringByApplyingTransform_reverse_(v8, v77, *MEMORY[0x1E0C99880], 0, v78);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      AXCFormattedString();
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend_rangeOfString_options_(v56, v80, (uint64_t)v79, 1024, v81, v92);
      v93 = v82;

      if (v75 == 0x7FFFFFFFFFFFFFFFLL)
      {

        v85 = v56;
LABEL_20:
        v88 = v85;

        v21 = v88;
        goto LABEL_21;
      }
      objc_msgSend_spellOutLetterCaseMarkupString_string_(TTSSpeechManager, v83, (uint64_t)v7, (uint64_t)v92, v84);
      v87 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v87;
    }
    objc_msgSend_stringByReplacingCharactersInRange_withString_(v56, v77, v75, v93, (uint64_t)v21);
    v85 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v86 = v8;
LABEL_23:

  return v86;
}

+ (id)pauseMarkupString:(id)a3
{
  return (id)objc_msgSend_speechMarkupStringForType_forIdentifier_string_(TTSSpeechSynthesizer, a2, 0, (uint64_t)a3, 0);
}

+ (id)availableLanguageCodes
{
  return (id)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(TTSSpeechSynthesizer, sel_availableLanguageCodes);
}

+ (id)availableVoices
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = objc_msgSend_currentProcessAllowedToSaveVoiceInfo(a1, a2, v2, v3, v4);
  return (id)MEMORY[0x1E0DE7D20](a1, sel_availableVoices_, v6, v7, v8);
}

+ (id)availableSuperCompactVoices
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  objc_msgSend_sharedInstance(TTSAXResourceManager, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resourcesWithType_subType_(v5, v6, 4, 2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_ax_filteredArrayUsingBlock_(v8, v9, (uint64_t)&unk_1E4A9D448, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_ax_flatMappedArrayUsingBlock_(v12, v13, (uint64_t)&unk_1E4A9D9D0, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)availableVoices:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  if (byte_1EE6D5798)
    v5 = qword_1EE6D5790 == 0;
  else
    v5 = 1;
  if (v5)
  {
    if (qword_1ED1B5B78 != -1)
      dispatch_once(&qword_1ED1B5B78, &unk_1E4AA13F0);
    objc_msgSend_sharedInstance(TTSAXResourceManager, a2, a3, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allVoices_(v6, v7, 1, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_ax_flatMappedArrayUsingBlock_(v10, v11, (uint64_t)&unk_1E4AA1430, v12, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (id)qword_1EE6D5790;
  }
  return v14;
}

+ (id)avSpeechVoicesForTTSAXResources:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_ax_flatMappedArrayUsingBlock_(a3, a2, (uint64_t)&unk_1E4AA1470, v3, v4);
}

+ (id)_resetAvailableVoices
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = objc_msgSend_currentProcessAllowedToSaveVoiceInfo(a1, a2, v2, v3, v4);
  return (id)MEMORY[0x1E0DE7D20](a1, sel__resetAvailableVoices_, v6, v7, v8);
}

+ (BOOL)currentProcessAllowedToSaveVoiceInfo
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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char isEqualToString;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;

  objc_msgSend_processInfo(MEMORY[0x1E0CB3898], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processName(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v10, v11, (uint64_t)CFSTR("com.apple.accessibility.AccessibilityUIServer"), v12, v13) & 1) != 0)
  {
    isEqualToString = 1;
  }
  else
  {
    objc_msgSend_processInfo(MEMORY[0x1E0CB3898], v14, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_processName(v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v24, v25, (uint64_t)CFSTR("com.apple.AccessibilityUIServer"), v26, v27) & 1) != 0)
    {
      isEqualToString = 1;
    }
    else
    {
      objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bundleIdentifier(v32, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v37, v38, (uint64_t)CFSTR("com.apple.springboard"), v39, v40);

    }
  }

  return isEqualToString;
}

+ (id)_resetAvailableVoices:(BOOL)a3
{
  return 0;
}

+ (URegularExpression)createRegularExpressionFromString:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int32_t v8;
  UChar *v9;
  const char *v10;
  URegularExpression *v11;
  UParseError v13;
  UErrorCode status;

  status = U_ZERO_ERROR;
  v3 = a3;
  v8 = objc_msgSend_length(v3, v4, v5, v6, v7, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v9 = (UChar *)malloc_type_malloc(2 * v8, 0x1000040BDFB0063uLL);
  objc_msgSend_getCharacters_range_(v3, v10, (uint64_t)v9, 0, v8);

  v11 = uregex_open(v9, v8, 0, &v13, &status);
  free(v9);
  uregex_useAnchoringBounds(v11, 1, &status);
  return v11;
}

+ (id)matchedRangesForString:(id)a3 withRegularExpression:(URegularExpression *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int32_t v10;
  UChar *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int32_t v20;
  int32_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  UErrorCode status;

  v5 = a3;
  status = U_ZERO_ERROR;
  v10 = objc_msgSend_length(v5, v6, v7, v8, v9);
  v11 = (UChar *)malloc_type_malloc(2 * v10, 0x1000040BDFB0063uLL);
  objc_msgSend_getCharacters_(v5, v12, (uint64_t)v11, v13, v14);
  uregex_setText(a4, v11, v10, &status);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (uregex_find(a4, -1, &status) && status == U_ZERO_ERROR)
  {
    do
    {
      v20 = uregex_start(a4, 0, &status);
      v21 = uregex_end(a4, 0, &status);
      objc_msgSend_valueWithRange_(MEMORY[0x1E0CB3B18], v22, v20, v21 - v20, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v19, v25, (uint64_t)v24, v26, v27);

    }
    while (uregex_find(a4, v21, &status) && status == U_ZERO_ERROR);
  }
  free(v11);

  return v19;
}

+ (id)audioFileSettingsForVoice:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_audioFileSettingsForVoice_(TTSSpeechSynthesizer, a2, (uint64_t)a3, v3, v4);
}

- (void)_speechJobFinished:(BOOL)a3 action:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  id v77;
  NSObject *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  double v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  id v99;
  NSObject *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  _QWORD v115[5];
  _QWORD v116[5];
  _QWORD block[4];
  id v118;
  BOOL v119;
  uint8_t buf[4];
  uint64_t v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend_setIsPaused_(self, v7, 0, v8, v9);
  objc_msgSend_setState_(v6, v10, 2, v11, v12);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A398FB88;
  block[3] = &unk_1E4AA13D0;
  v13 = v6;
  v118 = v13;
  v119 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_firstObject(self->_speechQueue, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v14, v20, (uint64_t)CFSTR("Removing from queue: %@"), v21, v22, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v24, (uint64_t)CFSTR("%s:%d %@"), v25, v26, "-[TTSSpeechManager _speechJobFinished:action:]", 1120, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ED1B5680 != -1)
    dispatch_once(&qword_1ED1B5680, &unk_1E4A9D488);
  v28 = (void *)qword_1ED1B5688;
  if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEBUG))
  {
    v29 = objc_retainAutorelease(v27);
    v30 = v28;
    v35 = objc_msgSend_UTF8String(v29, v31, v32, v33, v34);
    *(_DWORD *)buf = 136446210;
    v121 = v35;
    _os_log_impl(&dword_1A3940000, v30, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);

  }
  objc_msgSend_removeObjectIdenticalTo_(self->_speechQueue, v36, (uint64_t)v13, v37, v38);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v39, (uint64_t)CFSTR("Remaining queue: %@"), v40, v41, self->_speechQueue);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v43, (uint64_t)CFSTR("%s:%d %@"), v44, v45, "-[TTSSpeechManager _speechJobFinished:action:]", 1123, v42);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v13;
  if (qword_1ED1B5680 != -1)
    dispatch_once(&qword_1ED1B5680, &unk_1E4A9D4A8);
  v47 = (void *)qword_1ED1B5688;
  if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEBUG))
  {
    v48 = objc_retainAutorelease(v46);
    v49 = v47;
    v54 = objc_msgSend_UTF8String(v48, v50, v51, v52, v53);
    *(_DWORD *)buf = 136446210;
    v121 = v54;
    _os_log_impl(&dword_1A3940000, v49, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);

  }
  objc_msgSend_audioOperationQueue(self, v55, v56, v57, v58);
  v59 = objc_claimAutoreleasedReturnValue();
  v116[0] = MEMORY[0x1E0C809B0];
  v116[1] = 3221225472;
  v116[2] = sub_1A398FC58;
  v116[3] = &unk_1E4A9FAD0;
  v116[4] = self;
  dispatch_sync(v59, v116);

  self->_isSpeaking = 0;
  objc_msgSend_setIsPaused_(self, v60, 0, v61, v62);
  if (objc_msgSend_count(self->_speechQueue, v63, v64, v65, v66))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v67, (uint64_t)CFSTR("Start next job"), v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v72, (uint64_t)CFSTR("%s:%d %@"), v73, v74, "-[TTSSpeechManager _speechJobFinished:action:]", 1133, v71, v13);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED1B5680 != -1)
      dispatch_once(&qword_1ED1B5680, &unk_1E4AA1490);
    v76 = (void *)qword_1ED1B5688;
    if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEBUG))
    {
      v77 = objc_retainAutorelease(v75);
      v78 = v76;
      v83 = objc_msgSend_UTF8String(v77, v79, v80, v81, v82);
      *(_DWORD *)buf = 136446210;
      v121 = v83;
      _os_log_impl(&dword_1A3940000, v78, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);

    }
    objc_msgSend__startNextSpeechJob(self, v84, v85, v86, v87);
  }
  else if (self->_usesAuxiliarySession)
  {
    objc_msgSend_audioSessionInactiveTimeout(self, v67, v68, v69, v70);
    v89 = v88;
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v90, (uint64_t)CFSTR("Scheduling audio session deactivation in: %f"), v91, v92, *(_QWORD *)&v88);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v94, (uint64_t)CFSTR("%s:%d %@"), v95, v96, "-[TTSSpeechManager _speechJobFinished:action:]", 1141, v93, v13);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED1B5680 != -1)
      dispatch_once(&qword_1ED1B5680, &unk_1E4A9D4C8);
    v98 = (void *)qword_1ED1B5688;
    if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEFAULT))
    {
      v99 = objc_retainAutorelease(v97);
      v100 = v98;
      v105 = objc_msgSend_UTF8String(v99, v101, v102, v103, v104);
      *(_DWORD *)buf = 136446210;
      v121 = v105;
      _os_log_impl(&dword_1A3940000, v100, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend_audioDeactivatorTimer(self, v106, v107, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v115[0] = MEMORY[0x1E0C809B0];
    v115[1] = 3221225472;
    v115[2] = sub_1A398FCC0;
    v115[3] = &unk_1E4A9FAD0;
    v115[4] = self;
    objc_msgSend_afterDelay_processBlock_(v110, v111, (uint64_t)v115, v112, v113, v89);

  }
}

- (id)externalVoiceIdentifierUsedForLanguage:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend__speechVoiceForIdentifier_language_footprint_(v4, v5, 0, (uint64_t)v3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_identifier(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)voiceIdentifierUsedForLanguage:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend__speechVoiceForIdentifier_language_footprint_(v4, v5, 0, (uint64_t)v3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_identifier(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_phonemeSubstitutionsForAction:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const char *v22;
  _QWORD v24[4];
  id v25;
  id v26;

  objc_msgSend_attributedString(a3, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v5, v6, v7, v8, v9))
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0C89988];
    v20 = objc_msgSend_length(v5, v16, v17, v18, v19);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1A3990034;
    v24[3] = &unk_1E4AA14D8;
    v25 = v5;
    v21 = v14;
    v26 = v21;
    objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(v25, v22, v15, 0, v20, 0, v24);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)_startNextSpeechJob
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
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
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
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
  uint64_t v78;
  void *v79;
  CFAbsoluteTime Current;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  id v90;
  NSObject *v91;
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
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  id v110;
  NSObject *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  double v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  double v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  TTSSpeechSynthesizer *synthesizer;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  double v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  _BOOL4 v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  int IsAllowedToUseBufferCallbackAPIInCurrentProcess;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  id v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  BOOL v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  void *v263;
  BOOL v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  void (**v269)(_QWORD, _QWORD);
  void *v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t active;
  const char *v285;
  id v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  void *v294;
  void *v295;
  id v296;
  NSObject *v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  void *v307;
  BOOL v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  void *v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  void *v327;
  const char *v328;
  uint64_t v329;
  TTSSpeechSynthesizer *v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  void *v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  void *v340;
  const char *v341;
  TTSSpeechRequest *v342;
  id v343;
  TTSSpeechRequest *v344;
  const char *v345;
  uint64_t v346;
  const char *v347;
  TTSSpeechSynthesizer *v348;
  const char *v349;
  const char *v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  void *v354;
  void *v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  void *v359;
  const char *v360;
  uint64_t v361;
  uint64_t v362;
  void *v363;
  void *v364;
  id v365;
  NSObject *v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  id v372;
  id v373;
  id v374;
  id v375;
  id v376;
  _QWORD v377[4];
  id v378;
  id v379;
  uint8_t buf[4];
  uint64_t v381;
  uint64_t v382;

  v382 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_count(self->_speechQueue, a2, v2, v3, v4))
  {
    objc_msgSend_objectAtIndex_(self->_speechQueue, v6, 0, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_state(v9, v10, v11, v12, v13))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v14, (uint64_t)CFSTR("Existing speech job already in flight"), v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v19, (uint64_t)CFSTR("%s:%d %@"), v20, v21, "-[TTSSpeechManager _startNextSpeechJob]", 1197, v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (qword_1ED1B5680 != -1)
        dispatch_once(&qword_1ED1B5680, &unk_1E4AA14F8);
      v23 = (void *)qword_1ED1B5688;
      if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEBUG))
      {
        v24 = objc_retainAutorelease(v22);
        v25 = v23;
        *(_DWORD *)buf = 136446210;
        v381 = objc_msgSend_UTF8String(v24, v26, v27, v28, v29);
        _os_log_impl(&dword_1A3940000, v25, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);

      }
    }
    else if (objc_msgSend_isInAudioInterruption(self, v14, v15, v16, v17)
           && (v34 = CFAbsoluteTimeGetCurrent(),
               objc_msgSend_audioInterruptionStartedTime(self, v35, v36, v37, v38),
               v34 - v39 < 1.5))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v30, (uint64_t)CFSTR("Is in audio interruption, not starting speech"), v32, v33);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v41, (uint64_t)CFSTR("%s:%d %@"), v42, v43, "-[TTSSpeechManager _startNextSpeechJob]", 1205, v40);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (qword_1ED1B5680 != -1)
        dispatch_once(&qword_1ED1B5680, &unk_1E4AA1518);
      v45 = (void *)qword_1ED1B5688;
      if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEFAULT))
      {
        v46 = objc_retainAutorelease(v44);
        v47 = v45;
        *(_DWORD *)buf = 136446210;
        v381 = objc_msgSend_UTF8String(v46, v48, v49, v50, v51);
        _os_log_impl(&dword_1A3940000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      objc_msgSend_setDidRequestStartSpeakingDuringAudioInterruption_(self, v52, 1, v53, v54);
      objc_msgSend_setDidRequestPauseSpeakingDuringAudioInterruption_(self, v55, 0, v56, v57);
      objc_msgSend_setDidRequestResumeSpeakingDuringAudioInterruption_(self, v58, 0, v59, v60);
      objc_msgSend_setRequestedActionDuringAudioInterruption_(self, v61, (uint64_t)v9, v62, v63);
    }
    else
    {
      objc_msgSend_preprocessAction(v9, v30, v31, v32, v33);
      v64 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_currentThread(MEMORY[0x1E0CB3978], v65, v66, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v69, v70, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_string(v9, v75, v76, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend_stringWithFormat_(v64, v81, (uint64_t)CFSTR("%@ Will speak: %@ %f"), v82, v83, v74, v79, *(_QWORD *)&Current);
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v85, (uint64_t)CFSTR("%s:%d %@"), v86, v87, "-[TTSSpeechManager _startNextSpeechJob]", 1215, v84);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      if (qword_1ED1B5680 != -1)
        dispatch_once(&qword_1ED1B5680, &unk_1E4AA1538);
      v89 = (void *)qword_1ED1B5688;
      if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEBUG))
      {
        v90 = objc_retainAutorelease(v88);
        v91 = v89;
        *(_DWORD *)buf = 136446210;
        v381 = objc_msgSend_UTF8String(v90, v92, v93, v94, v95);
        _os_log_impl(&dword_1A3940000, v91, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);

      }
      if (objc_msgSend_isSpeaking(self->_synthesizer, v96, v97, v98, v99))
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v100, (uint64_t)CFSTR("Stopping existing job"), v102, v103);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v105, (uint64_t)CFSTR("%s:%d %@"), v106, v107, "-[TTSSpeechManager _startNextSpeechJob]", 1219, v104);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        if (qword_1ED1B5680 != -1)
          dispatch_once(&qword_1ED1B5680, &unk_1E4AA1558);
        v109 = (void *)qword_1ED1B5688;
        if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEFAULT))
        {
          v110 = objc_retainAutorelease(v108);
          v111 = v109;
          v116 = objc_msgSend_UTF8String(v110, v112, v113, v114, v115);
          *(_DWORD *)buf = 136446210;
          v381 = v116;
          _os_log_impl(&dword_1A3940000, v111, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
        objc_msgSend_stopSpeakingAtNextBoundary_synchronously_error_(self->_synthesizer, v117, 0, 1, 0);
      }
      objc_msgSend_speakingRate(v9, v100, v101, v102, v103);
      *(float *)&v118 = v118;
      objc_msgSend_setRate_(self->_synthesizer, v119, v120, v121, v122, v118);
      objc_msgSend_volume(v9, v123, v124, v125, v126);
      *(float *)&v127 = v127;
      objc_msgSend_setVolume_(self->_synthesizer, v128, v129, v130, v131, v127);
      objc_msgSend_voiceSelection(v9, v132, v133, v134, v135);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_voiceSettings(v136, v137, v138, v139, v140);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPerVoiceSettings_(self->_synthesizer, v142, (uint64_t)v141, v143, v144);

      objc_msgSend_voiceSelection(v9, v145, v146, v147, v148);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_effects(v149, v150, v151, v152, v153);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAudioEffects_(self->_synthesizer, v155, (uint64_t)v154, v156, v157);

      synthesizer = self->_synthesizer;
      objc_msgSend_pitch(v9, v159, v160, v161, v162);
      *(float *)&v163 = v163;
      objc_msgSend_setPitch_(synthesizer, v164, v165, v166, v167, v163);
      v172 = objc_msgSend_audioQueueFlags(self, v168, v169, v170, v171);
      objc_msgSend_setAudioQueueFlags_(self->_synthesizer, v173, v172, v174, v175);
      objc_msgSend_voiceIdentifier(v9, v176, v177, v178, v179);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setVoiceIdentifier_(self->_synthesizer, v181, (uint64_t)v180, v182, v183);

      if (objc_msgSend_ignoreCustomSubstitutions(v9, v184, v185, v186, v187))
        objc_msgSend_setUserSubstitutions_(self->_synthesizer, v188, 0, v190, v191);
      v192 = objc_msgSend_synthesizeSilently(v9, v188, v189, v190, v191);
      objc_msgSend_setSynthesizeSilently_(self->_synthesizer, v193, v192, v194, v195);
      objc_msgSend__phonemeSubstitutionsForAction_(self, v196, (uint64_t)v9, v197, v198);
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPhonemeSubstitutions_(self->_synthesizer, v200, (uint64_t)v199, v201, v202);

      objc_msgSend_setSpeakingRequestClientContext_(self->_synthesizer, v203, (uint64_t)v9, v204, v205);
      objc_msgSend_audioBufferCallback(v9, v206, v207, v208, v209);
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      v211 = v210 != 0;

      objc_msgSend_voiceIdentifier(self->_synthesizer, v212, v213, v214, v215);
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      IsAllowedToUseBufferCallbackAPIInCurrentProcess = TTSVoiceWithIdentifierIsAllowedToUseBufferCallbackAPIInCurrentProcess((uint64_t)v216, v217, v218, v219, v220);

      if ((IsAllowedToUseBufferCallbackAPIInCurrentProcess & v211) == 1)
      {
        objc_initWeak((id *)buf, self);
        v377[0] = MEMORY[0x1E0C809B0];
        v377[1] = 3221225472;
        v377[2] = sub_1A3990DBC;
        v377[3] = &unk_1E4AA1580;
        objc_copyWeak(&v379, (id *)buf);
        v378 = v9;
        objc_msgSend_setAudioBufferCallback_(self->_synthesizer, v225, (uint64_t)v377, v226, v227);

        objc_destroyWeak(&v379);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        objc_msgSend_setAudioBufferCallback_(self->_synthesizer, v222, 0, v223, v224);
      }
      self->_isSpeaking = 1;
      objc_msgSend_setIsPaused_(self, v228, 0, v229, v230);
      objc_msgSend_attributedString(v9, v231, v232, v233, v234);
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_string(v235, v236, v237, v238, v239);
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      v245 = v240;
      if (v240)
      {
        v246 = v240;
      }
      else
      {
        objc_msgSend_string(v9, v241, v242, v243, v244);
        v246 = (id)objc_claimAutoreleasedReturnValue();
      }
      v247 = v246;

      objc_msgSend_processedString(v9, v248, v249, v250, v251);
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      v253 = v252 == 0;

      if (!v253)
      {
        objc_msgSend_processedString(v9, v254, v255, v256, v257);
        v258 = objc_claimAutoreleasedReturnValue();

        v247 = (void *)v258;
      }
      if (objc_msgSend_length(v247, v254, v255, v256, v257))
      {
        objc_msgSend_requestWillStart(self, v259, v260, v261, v262);
        v263 = (void *)objc_claimAutoreleasedReturnValue();
        v264 = v263 == 0;

        if (!v264)
        {
          objc_msgSend_requestWillStart(self, v265, v266, v267, v268);
          v269 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v269)[2](v269, v9);

        }
        objc_msgSend_audioDeactivatorTimer(self, v265, v266, v267, v268);
        v270 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_cancel(v270, v271, v272, v273, v274);

        objc_msgSend_audioSession(self, v275, v276, v277, v278);
        v279 = (void *)objc_claimAutoreleasedReturnValue();
        active = objc_msgSend_setActiveOptions(self, v280, v281, v282, v283);
        v376 = 0;
        objc_msgSend_setActive_withOptions_error_(v279, v285, 1, active, (uint64_t)&v376);
        v286 = v376;

        if (v286)
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v287, (uint64_t)CFSTR("Error setting active: %@"), v288, v289, v286);
          v290 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v291, (uint64_t)CFSTR("%s:%d %@"), v292, v293, "-[TTSSpeechManager _startNextSpeechJob]", 1327, v290);
          v294 = (void *)objc_claimAutoreleasedReturnValue();
          if (qword_1ED1B5680 != -1)
            dispatch_once(&qword_1ED1B5680, &unk_1E4AA15A0);
          v295 = (void *)qword_1ED1B5688;
          if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEFAULT))
          {
            v296 = objc_retainAutorelease(v294);
            v297 = v295;
            v302 = objc_msgSend_UTF8String(v296, v298, v299, v300, v301);
            *(_DWORD *)buf = 136446210;
            v381 = v302;
            _os_log_impl(&dword_1A3940000, v297, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

          }
        }
        objc_msgSend_setState_(v9, v287, 1, v288, v289);
        objc_msgSend_taggedSSML(v9, v303, v304, v305, v306);
        v307 = (void *)objc_claimAutoreleasedReturnValue();
        v308 = v307 == 0;

        if (v308)
        {
          v348 = self->_synthesizer;
          objc_msgSend_language(v9, v309, v310, v311, v312);
          v327 = (void *)objc_claimAutoreleasedReturnValue();
          v372 = v286;
          v373 = 0;
          objc_msgSend_startSpeakingString_withLanguageCode_request_error_(v348, v349, (uint64_t)v247, (uint64_t)v327, (uint64_t)&v373, &v372);
          v342 = (TTSSpeechRequest *)v373;
          v343 = v372;
          v335 = v286;
        }
        else
        {
          objc_msgSend_taggedSSML(v9, v309, v310, v311, v312);
          v313 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ssmlSnippets(v313, v314, v315, v316, v317);
          v318 = (void *)objc_claimAutoreleasedReturnValue();
          v323 = objc_msgSend_currentSSMLSnippetIndex(v9, v319, v320, v321, v322);
          objc_msgSend_objectAtIndexedSubscript_(v318, v324, v323, v325, v326);
          v327 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend__setVoiceForAction_snippet_(self, v328, (uint64_t)v9, (uint64_t)v327, v329);
          v330 = self->_synthesizer;
          objc_msgSend_ssml(v327, v331, v332, v333, v334);
          v335 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_language(v9, v336, v337, v338, v339);
          v340 = (void *)objc_claimAutoreleasedReturnValue();
          v374 = v286;
          v375 = 0;
          objc_msgSend_startSpeakingSSML_withLanguageCode_request_error_(v330, v341, (uint64_t)v335, (uint64_t)v340, (uint64_t)&v375, &v374);
          v342 = (TTSSpeechRequest *)v375;
          v343 = v374;

        }
        if (v9 && v342)
          objc_setAssociatedObject(v342, &unk_1EE6D57B8, v9, (void *)1);
        if (v343)
        {
          v354 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend_localizedDescription(v343, v350, v351, v352, v353);
          v355 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v354, v356, (uint64_t)CFSTR("Speech Error:%@"), v357, v358, v355);
          v359 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v360, (uint64_t)CFSTR("%s:%d %@"), v361, v362, "-[TTSSpeechManager _startNextSpeechJob]", 1345, v359);
          v363 = (void *)objc_claimAutoreleasedReturnValue();
          if (qword_1ED1B5680 != -1)
            dispatch_once(&qword_1ED1B5680, &unk_1E4AA15C0);
          v364 = (void *)qword_1ED1B5688;
          if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEFAULT))
          {
            v365 = objc_retainAutorelease(v363);
            v366 = v364;
            v371 = objc_msgSend_UTF8String(v365, v367, v368, v369, v370);
            *(_DWORD *)buf = 136446210;
            v381 = v371;
            _os_log_impl(&dword_1A3940000, v366, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

          }
        }
      }
      else
      {
        v344 = objc_alloc_init(TTSSpeechRequest);
        v342 = v344;
        if (v9 && v344)
          objc_setAssociatedObject(v344, &unk_1EE6D57B8, v9, (void *)1);
        objc_msgSend_speechSynthesizer_didStartSpeakingRequest_(self, v345, (uint64_t)self->_synthesizer, (uint64_t)v342, v346);
        objc_msgSend_speechSynthesizer_didFinishSpeakingRequest_successfully_withError_(self, v347, (uint64_t)self->_synthesizer, (uint64_t)v342, 1, 0);
        v343 = 0;
      }

    }
  }
}

- (void)_setVoiceForAction:(id)a3 snippet:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
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
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;

  v43 = a3;
  v6 = a4;
  objc_msgSend_voiceName(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v16 = (void *)MEMORY[0x1E0C89B80];
    objc_msgSend_voiceName(v6, v12, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__voiceFromInternalVoiceListWithIdentifier_(v16, v18, (uint64_t)v17, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_language(v6, v12, v13, v14, v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      objc_msgSend_voiceIdentifier(v43, v27, v28, v29, v30);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setVoiceIdentifier_(self->_synthesizer, v40, (uint64_t)v17, v41, v42);
      goto LABEL_6;
    }
    v31 = (void *)MEMORY[0x1E0C89B80];
    objc_msgSend_language(v6, v27, v28, v29, v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_voiceWithLanguage_(v31, v32, (uint64_t)v17, v33, v34);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35 = v21;
  objc_msgSend_identifier(v21, v22, v23, v24, v25);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setVoiceIdentifier_(self->_synthesizer, v37, (uint64_t)v36, v38, v39);

LABEL_6:
}

- (void)_processAudioBufferCallback:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;

  v3 = a3;
  if (objc_msgSend_count(v3, v4, v5, v6, v7) != 2)
  {
    AXLogSpeechSynthesis();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      sub_1A3AB2F30();

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A3991130;
  block[3] = &unk_1E4A9FAD0;
  v11 = v3;
  v9 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)setSpeechEnabled:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  self->_speechEnabled = a3;
  if (!a3)
    objc_msgSend_clearSpeechQueue(self, a2, a3, v3, v4);
}

- (void)_dispatchSpeechAction:(id)a3
{
  id v4;
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
  unsigned int shouldQueue;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  int v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  id v83;
  NSObject *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  id v99;
  NSObject *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  id v115;
  NSObject *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint8_t buf[4];
  uint64_t v127;
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_currentThread(MEMORY[0x1E0CB3978], v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_string(v4, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  shouldQueue = objc_msgSend_shouldQueue(v4, v21, v22, v23, v24);
  objc_msgSend_stringWithFormat_(v5, v26, (uint64_t)CFSTR("%@ Should queue: %@ -> %d"), v27, v28, v15, v20, shouldQueue);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v30, (uint64_t)CFSTR("%s:%d %@"), v31, v32, "-[TTSSpeechManager _dispatchSpeechAction:]", 1391, v29);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ED1B5680 != -1)
    dispatch_once(&qword_1ED1B5680, &unk_1E4A95EB8);
  v34 = (void *)qword_1ED1B5688;
  if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEBUG))
  {
    v35 = objc_retainAutorelease(v33);
    v36 = v34;
    *(_DWORD *)buf = 136446210;
    v127 = objc_msgSend_UTF8String(v35, v37, v38, v39, v40);
    _os_log_impl(&dword_1A3940000, v36, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);

  }
  if ((objc_msgSend_shouldQueue(v4, v41, v42, v43, v44) & 1) != 0
    || objc_msgSend_count(self->_speechQueue, v45, v46, v47, v48)
    && (objc_msgSend_objectAtIndex_(self->_speechQueue, v45, 0, v47, v48),
        v49 = (void *)objc_claimAutoreleasedReturnValue(),
        v54 = objc_msgSend_cannotInterrupt(v49, v50, v51, v52, v53),
        v49,
        (v54 & 1) != 0))
  {
    v55 = 1;
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v45, (uint64_t)CFSTR("Telling synthesizer to stop because this job doesn't want to queue"), v47, v48);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v57, (uint64_t)CFSTR("%s:%d %@"), v58, v59, "-[TTSSpeechManager _dispatchSpeechAction:]", 1401, v56);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED1B5680 != -1)
      dispatch_once(&qword_1ED1B5680, &unk_1E4AA15E0);
    v61 = (void *)qword_1ED1B5688;
    if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEBUG))
    {
      v62 = objc_retainAutorelease(v60);
      v63 = v61;
      v68 = objc_msgSend_UTF8String(v62, v64, v65, v66, v67);
      *(_DWORD *)buf = 136446210;
      v127 = v68;
      _os_log_impl(&dword_1A3940000, v63, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);

    }
    objc_msgSend_removeAllObjects(self->_speechQueue, v69, v70, v71, v72);
    objc_msgSend_stopSpeakingAtNextBoundary_synchronously_error_(self->_synthesizer, v73, 0, 1, 0);
    v55 = 0;
  }
  objc_msgSend_addObject_(self->_speechQueue, v45, (uint64_t)v4, v47, v48);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v74, (uint64_t)CFSTR("isSpeaking: %d"), v75, v76, self->_isSpeaking);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v78, (uint64_t)CFSTR("%s:%d %@"), v79, v80, "-[TTSSpeechManager _dispatchSpeechAction:]", 1409, v77);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ED1B5680 != -1)
    dispatch_once(&qword_1ED1B5680, &unk_1E4AA1600);
  v82 = (void *)qword_1ED1B5688;
  if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEBUG))
  {
    v83 = objc_retainAutorelease(v81);
    v84 = v82;
    v89 = objc_msgSend_UTF8String(v83, v85, v86, v87, v88);
    *(_DWORD *)buf = 136446210;
    v127 = v89;
    _os_log_impl(&dword_1A3940000, v84, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);

  }
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v90, (uint64_t)CFSTR("Speech queue items: %@"), v91, v92, self->_speechQueue);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v94, (uint64_t)CFSTR("%s:%d %@"), v95, v96, "-[TTSSpeechManager _dispatchSpeechAction:]", 1410, v93);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ED1B5680 != -1)
    dispatch_once(&qword_1ED1B5680, &unk_1E4A9D9F0);
  v98 = (void *)qword_1ED1B5688;
  if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEBUG))
  {
    v99 = objc_retainAutorelease(v97);
    v100 = v98;
    v105 = objc_msgSend_UTF8String(v99, v101, v102, v103, v104);
    *(_DWORD *)buf = 136446210;
    v127 = v105;
    _os_log_impl(&dword_1A3940000, v100, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);

  }
  if (!v55 || !self->_isSpeaking)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v106, (uint64_t)CFSTR("Starting next job"), v107, v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v110, (uint64_t)CFSTR("%s:%d %@"), v111, v112, "-[TTSSpeechManager _dispatchSpeechAction:]", 1413, v109);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED1B5680 != -1)
      dispatch_once(&qword_1ED1B5680, &unk_1E4AA1620);
    v114 = (void *)qword_1ED1B5688;
    if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEBUG))
    {
      v115 = objc_retainAutorelease(v113);
      v116 = v114;
      v121 = objc_msgSend_UTF8String(v115, v117, v118, v119, v120);
      *(_DWORD *)buf = 136446210;
      v127 = v121;
      _os_log_impl(&dword_1A3940000, v116, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);

    }
    objc_msgSend__startNextSpeechJob(self, v122, v123, v124, v125);
  }

}

- (void)_clearSpeechQueue
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_removeAllObjects(self->_speechQueue, a2, v2, v3, v4);
  self->_isSpeaking = 0;
}

- (void)clearSpeechQueue
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (_AXSInUnitTestMode() && objc_msgSend_isFinished(self->_runThread, v3, v4, v5, v6))
    sub_1A3AB2F9C();
  objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v3, (uint64_t)sel__clearSpeechQueue, 0, 0);
}

- (void)dispatchSpeechAction:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  if (objc_msgSend_speechEnabled(self, v4, v5, v6, v7))
  {
    if (_AXSInUnitTestMode() && objc_msgSend_isFinished(self->_runThread, v8, v9, v10, v11))
      sub_1A3AB2FC4();
    objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v8, (uint64_t)sel__dispatchSpeechAction_, (uint64_t)v12, 0);
  }

}

- (void)_pauseSpeaking:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  TTSSpeechSynthesizer *synthesizer;
  int v22;
  const char *v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  if (objc_msgSend_isInAudioInterruption(self, v4, v5, v6, v7)
    && objc_msgSend_wasSpeakingBeforeAudioInterruption(self, v8, v9, v10, v11))
  {
    objc_msgSend_setDidRequestPauseSpeakingDuringAudioInterruption_(self, v8, 1, v10, v11);
    objc_msgSend_setDidRequestResumeSpeakingDuringAudioInterruption_(self, v12, 0, v13, v14);
    objc_msgSend_setDidRequestStartSpeakingDuringAudioInterruption_(self, v15, 0, v16, v17);
    objc_msgSend_setRequestedActionDuringAudioInterruption_(self, v18, 0, v19, v20);
  }
  synthesizer = self->_synthesizer;
  v22 = objc_msgSend_intValue(v25, v8, v9, v10, v11);
  objc_msgSend_pauseSpeakingAtNextBoundary_error_(synthesizer, v23, v22, 0, v24);

}

- (void)pauseSpeaking:(int64_t)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  id v10;

  if (_AXSInUnitTestMode() && objc_msgSend_isFinished(self->_runThread, v5, v6, v7, v8))
    sub_1A3AB2FEC();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v5, a3, v7, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v9, (uint64_t)sel__pauseSpeaking_, (uint64_t)v10, 1);

}

- (void)_continueSpeaking
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  if (objc_msgSend_isInAudioInterruption(self, a2, v2, v3, v4))
  {
    objc_msgSend_setDidRequestResumeSpeakingDuringAudioInterruption_(self, v6, 1, v7, v8);
    objc_msgSend_setDidRequestPauseSpeakingDuringAudioInterruption_(self, v9, 0, v10, v11);
    objc_msgSend_setDidRequestStartSpeakingDuringAudioInterruption_(self, v12, 0, v13, v14);
    objc_msgSend_setRequestedActionDuringAudioInterruption_(self, v15, 0, v16, v17);
  }
  MEMORY[0x1E0DE7D20](self->_synthesizer, sel_continueSpeakingWithError_, 0, v7, v8);
}

- (void)continueSpeaking
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (_AXSInUnitTestMode() && objc_msgSend_isFinished(self->_runThread, v3, v4, v5, v6))
    sub_1A3AB3014();
  objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v3, (uint64_t)sel__continueSpeaking, 0, 0);
}

- (void)_stopSpeaking:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  TTSSpeechSynthesizer *synthesizer;
  uint64_t v6;
  const char *v7;

  synthesizer = self->_synthesizer;
  v6 = objc_msgSend_integerValue(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_stopSpeakingAtNextBoundary_synchronously_error_(synthesizer, v7, v6, 1, 0);
}

- (void)stopSpeaking:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  id v7;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v6, (uint64_t)sel__stopSpeaking_, (uint64_t)v7, 0);

}

- (void)stopSpeaking
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_stopSpeaking_(self, a2, 0, v2, v3);
}

- (void)_isSpeaking:(id)a3
{
  TTSSpeechSynthesizer *synthesizer;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  synthesizer = self->_synthesizer;
  v11 = a3;
  if (objc_msgSend_isSpeaking(synthesizer, v4, v5, v6, v7))
    objc_msgSend_setString_(v11, v8, (uint64_t)CFSTR("1"), v9, v10);
  else
    objc_msgSend_setString_(v11, v8, (uint64_t)CFSTR("0"), v9, v10);

}

- (BOOL)isSpeaking
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  if (_AXSInUnitTestMode() && objc_msgSend_isFinished(self->_runThread, v3, v4, v5, v6))
    sub_1A3AB303C();
  if ((objc_msgSend_isFinished(self->_runThread, v3, v4, v5, v6) & 1) != 0)
    return 0;
  objc_msgSend_string(MEMORY[0x1E0CB37A0], v7, v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v13, (uint64_t)sel__isSpeaking_, (uint64_t)v12, 1);
  v18 = objc_msgSend_BOOLValue(v12, v14, v15, v16, v17);

  return v18;
}

- (NSArray)outputChannels
{
  NSObject *propertyQueue;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1A398DF64;
  v13 = sub_1A398DF74;
  v14 = 0;
  propertyQueue = self->_propertyQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1A3991D40;
  v8[3] = &unk_1E4AA0AF8;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(propertyQueue, v8);
  objc_msgSend_convertChannels_(TTSAudioSessionChannel, v3, v10[5], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

- (void)setOutputChannels:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *propertyQueue;
  id v28;
  NSObject *v29;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD block[5];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7, v8))
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v14 = v4;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v32, (uint64_t)v37, 16);
    if (v16)
    {
      v20 = v16;
      v21 = *(_QWORD *)v33;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v14);
          objc_msgSend_channelWithChannel_(TTSAudioSessionChannel, v17, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v22), v18, v19);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            objc_msgSend_addObject_(v13, v23, (uint64_t)v26, v24, v25);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v32, (uint64_t)v37, 16);
      }
      while (v20);
    }

    propertyQueue = self->_propertyQueue;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1A3991F64;
    v30[3] = &unk_1E4A9FB48;
    v30[4] = self;
    v31 = v13;
    v28 = v13;
    dispatch_async(propertyQueue, v30);

  }
  else
  {
    v29 = self->_propertyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A3991F54;
    block[3] = &unk_1E4A9FAD0;
    block[4] = self;
    dispatch_async(v29, block);
  }

}

- (unsigned)audioQueueFlags
{
  NSObject *propertyQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A3992000;
  v5[3] = &unk_1E4AA0AF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setAudioQueueFlags:(unsigned int)a3
{
  NSObject *propertyQueue;
  _QWORD v4[5];
  unsigned int v5;

  propertyQueue = self->_propertyQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1A3992070;
  v4[3] = &unk_1E4AA1648;
  v4[4] = self;
  v5 = a3;
  dispatch_async(propertyQueue, v4);
}

- (void)_processDidStartCallback:(id)a3
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
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD block[4];
  id v27;

  v4 = a3;
  objc_msgSend_currentThread(MEMORY[0x1E0CB3978], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqual_(v9, v10, (uint64_t)self->_runThread, v11, v12) & 1) == 0)
    sub_1A3AB3064();

  v13 = (void *)MEMORY[0x1A8597054]();
  objc_getAssociatedObject(v4, &unk_1EE6D57B8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_taggedSSML(v14, v15, v16, v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19
    || (v24 = (void *)v19, v25 = objc_msgSend_currentSSMLSnippetIndex(v14, v20, v21, v22, v23), v24, !v25))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A3992190;
    block[3] = &unk_1E4A9FAD0;
    v27 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  objc_autoreleasePoolPop(v13);

}

- (void)speechSynthesizer:(id)a3 didStartSpeakingRequest:(id)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int isEqual;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v5 = (void *)MEMORY[0x1E0CB3978];
  v18 = a4;
  objc_msgSend_currentThread(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v10, v11, (uint64_t)self->_runThread, v12, v13);

  if (isEqual)
    objc_msgSend__processDidStartCallback_(self, v15, (uint64_t)v18, v16, v17);
  else
    objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v15, (uint64_t)sel__processDidStartCallback_, (uint64_t)v18, 1);

}

- (void)__speechJobFinished:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;

  v4 = a3;
  objc_msgSend_objectAtIndexedSubscript_(v4, v5, 0, v6, v7);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_BOOLValue(v19, v8, v9, v10, v11);
  objc_msgSend_objectAtIndexedSubscript_(v4, v13, 1, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__speechJobFinished_action_(self, v17, v12, (uint64_t)v16, v18);
}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 withError:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
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
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  TTSSpeechManager *v33;
  id v34;
  id v35;
  NSObject *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  TTSSpeechManager *v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  TTSSpeechSynthesizer *synthesizer;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  id v137;
  id v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t *v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  int isEqual;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  void *v174;
  id v175;
  id v176;
  NSObject *v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  TTSSpeechManager *v185;
  uint64_t v186;
  id v187;
  id v188;
  id v189;
  _QWORD v190[2];
  uint8_t buf[4];
  uint64_t v192;
  uint64_t v193;

  v7 = a5;
  v193 = *MEMORY[0x1E0C80C00];
  v187 = a3;
  v10 = a4;
  v11 = a6;
  v186 = MEMORY[0x1A8597054]();
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_currentThread(MEMORY[0x1E0CB3978], v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v11;
  objc_msgSend_stringWithFormat_(v12, v24, (uint64_t)CFSTR("%@ Speech finished: %d %@"), v25, v26, v22, v7, v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v28, (uint64_t)CFSTR("%s:%d %@"), v29, v30, "-[TTSSpeechManager speechSynthesizer:didFinishSpeakingRequest:successfully:withError:]", 1641, v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ED1B5680 != -1)
    dispatch_once(&qword_1ED1B5680, &unk_1E4AA1668);
  v32 = (void *)qword_1ED1B5688;
  if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEBUG))
  {
    v33 = self;
    v34 = v10;
    v35 = objc_retainAutorelease(v31);
    v36 = v32;
    v37 = v35;
    v10 = v34;
    self = v33;
    *(_DWORD *)buf = 136446210;
    v192 = objc_msgSend_UTF8String(v37, v38, v39, v40, v41);
    _os_log_impl(&dword_1A3940000, v36, OS_LOG_TYPE_DEBUG, "%{public}s", buf, 0xCu);

  }
  if ((objc_msgSend_isFinished(self->_runThread, v42, v43, v44, v45) & 1) != 0)
  {
    v47 = (void *)v186;
    v46 = v187;
  }
  else
  {
    objc_getAssociatedObject(v10, &unk_1EE6D57B8);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v48;
    if (v48)
    {
      v47 = (void *)v186;
      if (v23)
      {
        v54 = (void *)objc_msgSend_copy(v48, v49, v50, v51, v52);
        v55 = v10;
        objc_msgSend_languageCode(v10, v56, v57, v58, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__speechVoiceForIdentifier_language_footprint_(TTSSpeechSynthesizer, v61, 0, (uint64_t)v60, 1);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        VOTLogSpeech();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          sub_1A3AB308C((uint64_t)v23, v62, v63, v64, v65);

        objc_msgSend_identifier(v62, v66, v67, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setVoiceIdentifier_(v54, v71, (uint64_t)v70, v72, v73);

        objc_msgSend_dispatchSpeechAction_(self, v74, (uint64_t)v54, v75, v76);
        v10 = v55;
      }
      objc_msgSend_taggedSSML(v53, v49, v50, v51, v52);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v77)
        goto LABEL_37;
      v82 = objc_msgSend_currentSSMLSnippetIndex(v53, v78, v79, v80, v81);
      objc_msgSend_setCurrentSSMLSnippetIndex_(v53, v83, v82 + 1, v84, v85);
      v90 = objc_msgSend_currentSSMLSnippetIndex(v53, v86, v87, v88, v89);
      objc_msgSend_taggedSSML(v53, v91, v92, v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ssmlSnippets(v95, v96, v97, v98, v99);
      v100 = v10;
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = objc_msgSend_count(v101, v102, v103, v104, v105);

      v10 = v100;
      if (v90 < v106)
      {
        objc_msgSend_taggedSSML(v53, v78, v79, v80, v81);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ssmlSnippets(v107, v108, v109, v110, v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = objc_msgSend_currentSSMLSnippetIndex(v53, v113, v114, v115, v116);
        objc_msgSend_objectAtIndexedSubscript_(v112, v118, v117, v119, v120);
        v121 = self;
        v122 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend__setVoiceForAction_snippet_(v121, v123, (uint64_t)v53, (uint64_t)v122, v124);
        synthesizer = v121->_synthesizer;
        objc_msgSend_ssml(v122, v126, v127, v128, v129);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_language(v122, v131, v132, v133, v134);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v188 = v23;
        v189 = 0;
        objc_msgSend_startSpeakingSSML_withLanguageCode_request_error_(synthesizer, v136, (uint64_t)v130, (uint64_t)v135, (uint64_t)&v189, &v188);
        v137 = v189;
        v138 = v188;

        if (v137)
          objc_setAssociatedObject(v137, &unk_1EE6D57B8, v53, (void *)1);

        v23 = v138;
        v46 = v187;
        v10 = v100;
      }
      else
      {
LABEL_37:
        if (objc_msgSend_ignoreCustomSubstitutions(v53, v78, v79, v80, v81))
          objc_msgSend__updateUserSubstitutions(self, v139, v140, v141, v142);
        v143 = (uint64_t *)self;
        objc_msgSend_text(v10, v139, v140, v141, v142);
        v144 = (void *)objc_claimAutoreleasedReturnValue();

        if (v144)
        {
          objc_msgSend_text(v10, v145, v146, v147, v148);
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setFinalSpokenString_(v53, v150, (uint64_t)v149, v151, v152);

        }
        if (v23)
          objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v145, 0, v147, v148);
        else
          objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v145, v7, v147, v148);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v190[0] = v153;
        v190[1] = v53;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v154, (uint64_t)v190, 2, v155);
        v156 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_currentThread(MEMORY[0x1E0CB3978], v157, v158, v159, v160);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v161, v162, v143[3], v163, v164);

        if (isEqual)
          objc_msgSend___speechJobFinished_(v143, v166, (uint64_t)v156, v167, v168);
        else
          objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(v143, v166, (uint64_t)sel___speechJobFinished_, (uint64_t)v156, 0);
        v46 = v187;

      }
    }
    else
    {
      v185 = self;
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v49, (uint64_t)CFSTR("No action for request: %@"), v51, v52, v10);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v170, (uint64_t)CFSTR("%s:%d %@"), v171, v172, "-[TTSSpeechManager speechSynthesizer:didFinishSpeakingRequest:successfully:withError:]", 1652, v169);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      if (qword_1ED1B5680 != -1)
        dispatch_once(&qword_1ED1B5680, &unk_1E4AA1688);
      v47 = (void *)v186;
      v46 = v187;
      v174 = (void *)qword_1ED1B5688;
      if (os_log_type_enabled((os_log_t)qword_1ED1B5688, OS_LOG_TYPE_DEFAULT))
      {
        v175 = v10;
        v176 = objc_retainAutorelease(v173);
        v177 = v174;
        v178 = v176;
        v10 = v175;
        v183 = objc_msgSend_UTF8String(v178, v179, v180, v181, v182);
        *(_DWORD *)buf = 136446210;
        v192 = v183;
        _os_log_impl(&dword_1A3940000, v177, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(v185, v184, (uint64_t)sel___speechJobFinished_, 0, 0);
    }

  }
  objc_autoreleasePoolPop(v47);

}

- (void)speechSynthesizer:(id)a3 didPauseSpeakingRequest:(id)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int isEqual;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v5 = (void *)MEMORY[0x1E0CB3978];
  v18 = a4;
  objc_msgSend_currentThread(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v10, v11, (uint64_t)self->_runThread, v12, v13);

  if (isEqual)
    objc_msgSend__processDidPauseCallback_(self, v15, (uint64_t)v18, v16, v17);
  else
    objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v15, (uint64_t)sel__processDidPauseCallback_, (uint64_t)v18, 1);

}

- (void)_processDidPauseCallback:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t IsPaused;
  void *v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  IsPaused = objc_msgSend_setIsPaused_(self, v5, 1, v6, v7);
  v9 = (void *)MEMORY[0x1A8597054](IsPaused);
  objc_getAssociatedObject(v4, &unk_1EE6D57B8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A3992AE4;
  block[3] = &unk_1E4A9FAD0;
  v13 = v10;
  v11 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_autoreleasePoolPop(v9);
}

- (void)speechSynthesizer:(id)a3 didContinueSpeakingRequest:(id)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int isEqual;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v5 = (void *)MEMORY[0x1E0CB3978];
  v18 = a4;
  objc_msgSend_currentThread(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v10, v11, (uint64_t)self->_runThread, v12, v13);

  if (isEqual)
    objc_msgSend__processDidContinueCallback_(self, v15, (uint64_t)v18, v16, v17);
  else
    objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v15, (uint64_t)sel__processDidContinueCallback_, (uint64_t)v18, 1);

}

- (void)_processDidContinueCallback:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t IsPaused;
  void *v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  IsPaused = objc_msgSend_setIsPaused_(self, v5, 0, v6, v7);
  v9 = (void *)MEMORY[0x1A8597054](IsPaused);
  objc_getAssociatedObject(v4, &unk_1EE6D57B8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A3992C98;
  block[3] = &unk_1E4A9FAD0;
  v13 = v10;
  v11 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_autoreleasePoolPop(v9);
}

- (void)speechSynthesizer:(id)a3 didEncounterMarker:(id)a4 forRequest:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  int isEqual;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  _QWORD v57[2];
  _QWORD v58[3];

  v58[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v58[0] = v8;
  v58[1] = v7;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v58, 2, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_markType(v7, v12, v13, v14, v15) == 1)
  {
    v20 = v7;
    v57[0] = v8;
    v21 = (void *)MEMORY[0x1E0CB3B18];
    v26 = objc_msgSend_wordRange(v20, v22, v23, v24, v25);
    objc_msgSend_valueWithRange_(v21, v27, v26, (uint64_t)v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v29;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v30, (uint64_t)v57, 2, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_currentThread(MEMORY[0x1E0CB3978], v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v37, v38, (uint64_t)self->_runThread, v39, v40);

    if (isEqual)
    {
      objc_msgSend__processDidEncounterMarker_(self, v42, (uint64_t)v11, v43, v44);
      objc_msgSend__processWillSpeechRange_(self, v45, (uint64_t)v32, v46, v47);
    }
    else
    {
      objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v42, (uint64_t)sel__processDidEncounterMarker_, (uint64_t)v11, 1);
      objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v56, (uint64_t)sel__processWillSpeechRange_, (uint64_t)v32, 1);
    }

  }
  else
  {
    objc_msgSend_currentThread(MEMORY[0x1E0CB3978], v16, v17, v18, v19);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend_isEqual_(v48, v49, (uint64_t)self->_runThread, v50, v51);

    if (v52)
      objc_msgSend__processDidEncounterMarker_(self, v53, (uint64_t)v11, v54, v55);
    else
      objc_msgSend__enqueueSelectorOnSpeechThread_object_waitUntilDone_(self, v53, (uint64_t)sel__processDidEncounterMarker_, (uint64_t)v11, 1);
  }

}

- (void)_processDidEncounterMarker:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a3;
  objc_msgSend_objectAtIndexedSubscript_(v3, v4, 0, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v3, v8, 1, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_getAssociatedObject(v7, &unk_1EE6D57B8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1A3992FB8;
  v15[3] = &unk_1E4A9FB48;
  v16 = v12;
  v17 = v11;
  v13 = v11;
  v14 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

}

- (void)_processWillSpeechRange:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  uint64_t v24;
  uint64_t v25;

  v3 = a3;
  objc_msgSend_objectAtIndexedSubscript_(v3, v4, 0, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3010000000;
  v24 = 0;
  v25 = 0;
  v23[3] = &unk_1A3B14873;
  objc_msgSend_objectAtIndexedSubscript_(v3, v8, 1, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_rangeValue(v11, v12, v13, v14, v15);
  v25 = v16;

  v17 = (void *)MEMORY[0x1A8597054]();
  objc_getAssociatedObject(v7, &unk_1EE6D57B8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1A3993150;
  v20[3] = &unk_1E4A9FBE8;
  v21 = v18;
  v22 = v23;
  v19 = v18;
  dispatch_async(MEMORY[0x1E0C80D38], v20);

  objc_autoreleasePoolPop(v17);
  _Block_object_dispose(v23, 8);

}

+ (id)remapLanguageCode:(id)a3
{
  return (id)AXCRemapLanguageCodeToFallbackIfNeccessary();
}

+ (void)test_actionStartTap:(id)a3
{
  void *v3;
  void *v4;

  v3 = _Block_copy(a3);
  v4 = (void *)qword_1EE6D57A0;
  qword_1EE6D57A0 = (uint64_t)v3;

}

+ (void)test_setUnitTestMode:(BOOL)a3
{
  byte_1EE6D5798 = a3;
}

+ (void)test_setAvailableVoices:(id)a3
{
  objc_storeStrong((id *)&qword_1EE6D5790, a3);
}

- (BOOL)speechEnabled
{
  return self->_speechEnabled;
}

- (TTSSpeechAction)requestedActionDuringAudioInterruption
{
  return self->_requestedActionDuringAudioInterruption;
}

- (void)setRequestedActionDuringAudioInterruption:(id)a3
{
  objc_storeStrong((id *)&self->_requestedActionDuringAudioInterruption, a3);
}

- (NSString)speechSource
{
  return self->_speechSource;
}

- (BOOL)showControlCenterControls
{
  return self->_showControlCenterControls;
}

- (BOOL)usesAuxiliarySession
{
  return self->_usesAuxiliarySession;
}

- (double)audioSessionInactiveTimeout
{
  return self->_audioSessionInactiveTimeout;
}

- (void)setAudioSessionInactiveTimeout:(double)a3
{
  self->_audioSessionInactiveTimeout = a3;
}

- (id)requestWillStart
{
  return self->_requestWillStart;
}

- (void)setRequestWillStart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)originalSpeechRateForJobOverride
{
  return self->_originalSpeechRateForJobOverride;
}

- (void)setOriginalSpeechRateForJobOverride:(id)a3
{
  objc_storeStrong((id *)&self->_originalSpeechRateForJobOverride, a3);
}

- (AXDispatchTimer)audioDeactivatorTimer
{
  return self->_audioDeactivatorTimer;
}

- (void)setAudioDeactivatorTimer:(id)a3
{
  objc_storeStrong((id *)&self->_audioDeactivatorTimer, a3);
}

- (OS_dispatch_queue)audioOperationQueue
{
  return self->_audioOperationQueue;
}

- (void)setAudioOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_audioOperationQueue, a3);
}

- (BOOL)wasSpeakingBeforeAudioInterruption
{
  return self->_wasSpeakingBeforeAudioInterruption;
}

- (void)setWasSpeakingBeforeAudioInterruption:(BOOL)a3
{
  self->_wasSpeakingBeforeAudioInterruption = a3;
}

- (BOOL)didRequestStartSpeakingDuringAudioInterruption
{
  return self->_didRequestStartSpeakingDuringAudioInterruption;
}

- (void)setDidRequestStartSpeakingDuringAudioInterruption:(BOOL)a3
{
  self->_didRequestStartSpeakingDuringAudioInterruption = a3;
}

- (BOOL)didRequestPauseSpeakingDuringAudioInterruption
{
  return self->_didRequestPauseSpeakingDuringAudioInterruption;
}

- (void)setDidRequestPauseSpeakingDuringAudioInterruption:(BOOL)a3
{
  self->_didRequestPauseSpeakingDuringAudioInterruption = a3;
}

- (BOOL)didRequestResumeSpeakingDuringAudioInterruption
{
  return self->_didRequestResumeSpeakingDuringAudioInterruption;
}

- (void)setDidRequestResumeSpeakingDuringAudioInterruption:(BOOL)a3
{
  self->_didRequestResumeSpeakingDuringAudioInterruption = a3;
}

- (double)audioInterruptionStartedTime
{
  return self->_audioInterruptionStartedTime;
}

- (void)setAudioInterruptionStartedTime:(double)a3
{
  self->_audioInterruptionStartedTime = a3;
}

- (BOOL)shouldHandleAudioInterruptions
{
  return self->_shouldHandleAudioInterruptions;
}

- (void)setShouldHandleAudioInterruptions:(BOOL)a3
{
  self->_shouldHandleAudioInterruptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioOperationQueue, 0);
  objc_storeStrong((id *)&self->_audioDeactivatorTimer, 0);
  objc_storeStrong((id *)&self->_originalSpeechRateForJobOverride, 0);
  objc_storeStrong(&self->_requestWillStart, 0);
  objc_storeStrong((id *)&self->_speechSource, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_audioSessionCategory, 0);
  objc_storeStrong((id *)&self->_requestedActionDuringAudioInterruption, 0);
  objc_storeStrong((id *)&self->_speechThreadQueueLock, 0);
  objc_storeStrong((id *)&self->_propertyQueue, 0);
  objc_storeStrong((id *)&self->_runThread, 0);
  objc_storeStrong((id *)&self->_synthesizer, 0);
  objc_storeStrong((id *)&self->_speechQueue, 0);
}

@end
