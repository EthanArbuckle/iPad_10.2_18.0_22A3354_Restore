@implementation TTSWrappedAudioQueue

- (TTSWrappedAudioQueue)init
{
  TTSWrappedAudioQueue *v2;
  TTSWrappedAudioQueue *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  AVAudioFormat *outputFormat;
  id v8;
  const char *v9;
  uint64_t v10;
  AVAudioFormat *queueFormat;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableOrderedSet *inflightBuffers;
  AVAudioConverter *cachedAudioConverter;
  AVAudioSession *audioSession;
  NSArray *channels;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *callbackQueue;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)TTSWrappedAudioQueue;
  v2 = -[TTSWrappedAudioQueue init](&v31, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_bufferLock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc(MEMORY[0x1E0C89AA0]);
    v6 = objc_msgSend_initWithCommonFormat_sampleRate_channels_interleaved_(v4, v5, 1, 1, 0, 22050.0);
    outputFormat = v3->_outputFormat;
    v3->_outputFormat = (AVAudioFormat *)v6;

    v8 = objc_alloc(MEMORY[0x1E0C89AA0]);
    v10 = objc_msgSend_initWithCommonFormat_sampleRate_channels_interleaved_(v8, v9, 1, 1, 1, 22050.0);
    queueFormat = v3->_queueFormat;
    v3->_queueFormat = (AVAudioFormat *)v10;

    objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], v12, v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    inflightBuffers = v3->_inflightBuffers;
    v3->_inflightBuffers = (NSMutableOrderedSet *)v16;

    cachedAudioConverter = v3->_cachedAudioConverter;
    v3->_cachedAudioConverter = 0;

    v3->_audioQueueFlags = 0;
    audioSession = v3->_audioSession;
    v3->_audioSession = 0;

    channels = v3->_channels;
    v3->_channels = (NSArray *)MEMORY[0x1E0C9AA60];

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("TTSAQ.callback", v21);
    callbackQueue = v3->_callbackQueue;
    v3->_callbackQueue = (OS_dispatch_queue *)v22;

    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v28, v29, (uint64_t)v3, (uint64_t)sel_handleMediaServicesReset, *MEMORY[0x1E0C89740], 0);

  }
  return v3;
}

- (void)dealloc
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
  objc_super v14;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v6, v7, (uint64_t)self, v8, v9);

  objc_msgSend__tearDownAudioQueue(self, v10, v11, v12, v13);
  v14.receiver = self;
  v14.super_class = (Class)TTSWrappedAudioQueue;
  -[TTSWrappedAudioQueue dealloc](&v14, sel_dealloc);
}

- (id)convertBufferIfNecessary:(id)a3
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
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int isEqual;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  double v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  double v117;
  id v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unsigned int v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  id v137;
  _QWORD v139[4];
  id v140;
  _QWORD *v141;
  id v142;
  _QWORD v143[3];
  char v144;

  v4 = a3;
  objc_msgSend_queueFormat(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_format(v4, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v9, v15, (uint64_t)v14, v16, v17);

  if (!isEqual)
  {
    objc_msgSend_cachedAudioConverter(self, v19, v20, v21, v22);
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v29 = (void *)v24;
      objc_msgSend_cachedAudioConverter(self, v25, v26, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_inputFormat(v30, v31, v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_format(v4, v36, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqual_(v35, v41, (uint64_t)v40, v42, v43))
      {
        objc_msgSend_cachedAudioConverter(self, v44, v45, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_outputFormat(v48, v49, v50, v51, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_queueFormat(self, v54, v55, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend_isEqual_(v53, v59, (uint64_t)v58, v60, v61);

        if ((v62 & 1) != 0)
          goto LABEL_9;
      }
      else
      {

      }
    }
    v67 = objc_alloc(MEMORY[0x1E0C89A78]);
    objc_msgSend_format(v4, v68, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_queueFormat(self, v73, v74, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)objc_msgSend_initFromFormat_toFormat_(v67, v78, (uint64_t)v72, (uint64_t)v77, v79);
    objc_msgSend_setCachedAudioConverter_(self, v81, (uint64_t)v80, v82, v83);

    objc_msgSend_channels(self, v84, v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ax_mappedArrayUsingBlock_(v88, v89, (uint64_t)&unk_1E4A9F288, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cachedAudioConverter(self, v93, v94, v95, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setChannelMap_(v97, v98, (uint64_t)v92, v99, v100);

LABEL_9:
    objc_msgSend_queueFormat(self, v63, v64, v65, v66);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sampleRate(v101, v102, v103, v104, v105);
    v107 = v106;
    objc_msgSend_format(v4, v108, v109, v110, v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sampleRate(v112, v113, v114, v115, v116);
    *(float *)&v107 = v107 / v117;

    v118 = objc_alloc(MEMORY[0x1E0C89AB8]);
    objc_msgSend_queueFormat(self, v119, v120, v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = objc_msgSend_frameLength(v4, v124, v125, v126, v127);
    v23 = (id)objc_msgSend_initWithPCMFormat_frameCapacity_(v118, v129, (uint64_t)v123, (float)(*(float *)&v107 * (float)v128), v130);

    v143[0] = 0;
    v143[1] = v143;
    v143[2] = 0x2020000000;
    v144 = 0;
    objc_msgSend_cachedAudioConverter(self, v131, v132, v133, v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = v143;
    v142 = 0;
    v139[0] = MEMORY[0x1E0C809B0];
    v139[1] = 3221225472;
    v139[2] = sub_1A39501FC;
    v139[3] = &unk_1E4A9FAA8;
    v140 = v4;
    objc_msgSend_convertToBuffer_error_withInputFromBlock_(v135, v136, (uint64_t)v23, (uint64_t)&v142, (uint64_t)v139);
    v137 = v142;

    _Block_object_dispose(v143, 8);
    goto LABEL_10;
  }
  v23 = v4;
LABEL_10:

  return v23;
}

- (void)scheduleBuffer:(id)a3 completionHandler:(id)a4 lastBuffer:(BOOL)a5
{
  _BOOL4 v5;

  v5 = a5;
  objc_msgSend_scheduleBuffer_completionHandler_(self, a2, (uint64_t)a3, (uint64_t)a4, a5);
  if (v5)
    AX_PERFORM_WITH_LOCK();
}

- (void)scheduleBuffer:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;

  v6 = a3;
  v7 = a4;
  v10 = v7;
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A3950374;
    aBlock[3] = &unk_1E4A9FAF8;
    v13 = v7;
    v11 = _Block_copy(aBlock);

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend_playBuffer_completionHandler_(self, v8, (uint64_t)v6, (uint64_t)v11, v9);

}

- (void)playBuffer:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  OpaqueAudioQueue *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  UInt32 v40;
  uint64_t v41;
  TTSWrappedAudioQueueBuffer *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  id *v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  size_t v70;
  const char *v71;
  uint64_t v72;
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
  int v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _DWORD *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  size_t v94;
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
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  TTSWrappedAudioQueueBuffer *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  NSObject *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v133;
  _QWORD v134[4];
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t (*v138)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  void *v139;
  TTSWrappedAudioQueue *v140;
  uint64_t v141;
  uint64_t v142;
  void (*v143)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  void *v144;
  TTSWrappedAudioQueue *v145;
  TTSWrappedAudioQueueBuffer *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t (*v149)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  void *v150;
  TTSWrappedAudioQueue *v151;
  TTSWrappedAudioQueueBuffer *v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t *v155;
  uint64_t v156;
  int v157;
  uint64_t v158;
  uint64_t v159;
  void (*v160)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  void *v161;
  TTSWrappedAudioQueue *v162;
  TTSWrappedAudioQueueBuffer *v163;
  _QWORD block[4];
  _QWORD v165[6];
  AudioQueueBufferRef outBuffer;
  _QWORD v167[4];
  id v168;
  uint8_t buf[16];
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend_state(self, v8, v9, v10, v11))
  {
    objc_msgSend_convertBufferIfNecessary_(self, v12, (uint64_t)v6, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend_frameLength(v15, v16, v17, v18, v19);
    objc_msgSend_format(v15, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *(_DWORD *)(objc_msgSend_streamDescription(v25, v26, v27, v28, v29) + 24);

    outBuffer = 0;
    v35 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v31, v32, v33, v34);
    v40 = objc_msgSend__minimumBufferByteSize(self, v36, v37, v38, v39);
    v41 = AudioQueueAllocateBuffer(v35, v40, &outBuffer);
    v42 = objc_alloc_init(TTSWrappedAudioQueueBuffer);
    objc_msgSend_setAqBuffer_(v42, v43, (uint64_t)outBuffer, v44, v45);
    if ((_DWORD)v41)
    {
      AXTTSLogCommon();
      v49 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_ERROR))
        sub_1A3AAF5E4(v41, v49, v50, v51, v52);

      v53 = MEMORY[0x1E0C809B0];
      v165[1] = MEMORY[0x1E0C809B0];
      v165[2] = 3221225472;
      v165[3] = sub_1A3950944;
      v165[4] = &unk_1E4A9FAD0;
      v165[5] = self;
      AX_PERFORM_WITH_LOCK();
      if (!v7)
        goto LABEL_33;
      objc_msgSend_callbackQueue(self, v54, v55, v56, v57);
      v58 = objc_claimAutoreleasedReturnValue();
      block[0] = v53;
      block[1] = 3221225472;
      block[2] = sub_1A395096C;
      block[3] = &unk_1E4A9FB20;
      v165[0] = v7;
      dispatch_async(v58, block);

      v59 = (id *)v165;
    }
    else
    {
      objc_msgSend_setCompletionHandler_(v42, v46, (uint64_t)v7, v47, v48);
      v70 = (v30 * v20);
      *(_DWORD *)(objc_msgSend_aqBuffer(v42, v66, v67, v68, v69) + 16) = v70;
      if (objc_msgSend_frameLength(v15, v71, v72, v73, v74) == 1)
      {
        objc_msgSend_queueFormat(self, v75, v76, v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = *(_DWORD *)(objc_msgSend_streamDescription(v79, v80, v81, v82, v83) + 24);

        v89 = (_DWORD *)objc_msgSend_aqBuffer(v42, v85, v86, v87, v88);
        if ((v84 << 8) >= *v89)
          v94 = *v89;
        else
          v94 = (v84 << 8);
        v95 = objc_msgSend_aqBuffer(v42, v90, v91, v92, v93);
        bzero(*(void **)(v95 + 8), v94);
        *(_DWORD *)(objc_msgSend_aqBuffer(v42, v96, v97, v98, v99) + 16) = v94;
      }
      else
      {
        v104 = *(void **)(objc_msgSend_aqBuffer(v42, v75, v76, v77, v78) + 8);
        v109 = objc_msgSend_audioBufferList(v15, v105, v106, v107, v108);
        memcpy(v104, *(const void **)(v109 + 16), v70);
      }
      *(_QWORD *)(objc_msgSend_aqBuffer(v42, v100, v101, v102, v103) + 24) = v42;
      v110 = MEMORY[0x1E0C809B0];
      v158 = MEMORY[0x1E0C809B0];
      v159 = 3221225472;
      v160 = sub_1A395097C;
      v161 = &unk_1E4A9FB48;
      v162 = self;
      v163 = v42;
      AX_PERFORM_WITH_LOCK();
      v154 = 0;
      v155 = &v154;
      v156 = 0x2020000000;
      v157 = 0;
      v147 = v110;
      v148 = 3221225472;
      v149 = sub_1A39509BC;
      v150 = &unk_1E4A9FB70;
      v151 = self;
      v111 = v163;
      v152 = v111;
      v153 = &v154;
      AX_PERFORM_WITH_LOCK();
      if (*((_DWORD *)v155 + 6))
      {
        v141 = v110;
        v142 = 3221225472;
        v143 = sub_1A3950A80;
        v144 = &unk_1E4A9FB48;
        v145 = self;
        v146 = v111;
        AX_PERFORM_WITH_LOCK();
        if (*((_DWORD *)v155 + 6) == -66671)
        {
          v136 = v110;
          v137 = 3221225472;
          v138 = sub_1A3950AC0;
          v139 = &unk_1E4A9FAD0;
          v140 = self;
          AX_PERFORM_WITH_LOCK();
          AXTTSLogCommon();
          v116 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
            sub_1A3AAF564();
        }
        else
        {
          AXTTSLogCommon();
          v116 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v125, *((unsigned int *)v155 + 6), v126, v127);
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1A3AAF590(v128, buf, v116);
          }
        }

        if (v7)
        {
          objc_msgSend_callbackQueue(self, v129, v130, v131, v132);
          v133 = objc_claimAutoreleasedReturnValue();
          v134[0] = v110;
          v134[1] = 3221225472;
          v134[2] = sub_1A3950AE8;
          v134[3] = &unk_1E4A9FB20;
          v135 = v7;
          dispatch_async(v133, v134);

        }
      }
      else if (objc_msgSend_state(self, v112, v113, v114, v115) == 2
             || !objc_msgSend_state(self, v117, v118, v119, v120))
      {
        AX_PERFORM_WITH_LOCK();
      }
      else
      {
        objc_msgSend__attemptQueueStart(self, v121, v122, v123, v124);
      }

      v59 = (id *)&v163;
      _Block_object_dispose(&v154, 8);
    }

LABEL_33:
    v6 = v15;
    goto LABEL_34;
  }
  AXTTSLogCommon();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    sub_1A3AAF538();

  if (v7)
  {
    objc_msgSend_callbackQueue(self, v61, v62, v63, v64);
    v65 = objc_claimAutoreleasedReturnValue();
    v167[0] = MEMORY[0x1E0C809B0];
    v167[1] = 3221225472;
    v167[2] = sub_1A3950934;
    v167[3] = &unk_1E4A9FB20;
    v168 = v7;
    dispatch_async(v65, v167);

  }
LABEL_34:

}

- (BOOL)play
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
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;

  if (objc_msgSend_shouldRebuildAudioQueue(self, a2, v2, v3, v4))
  {
    objc_msgSend__tearDownAudioQueue(self, v6, v7, v8, v9);
    objc_msgSend_setShouldRebuildAudioQueue_(self, v10, 0, v11, v12);
  }
  objc_msgSend__buildAudioQueue(self, v6, v7, v8, v9);
  if (objc_msgSend_state(self, v13, v14, v15, v16) == 2
    && !objc_msgSend__startQueueWithRetry(self, v17, v18, v19, v20))
  {
    return 0;
  }
  v21 = 1;
  objc_msgSend_setState_(self, v17, 1, v19, v20);
  return v21;
}

- (void)pause
{
  AX_PERFORM_WITH_LOCK();
}

- (void)stop
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  AXTTSLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1A3AAF66C();

  if (objc_msgSend_state(self, v4, v5, v6, v7) || objc_msgSend_audioQueueActive(self, v8, v9, v10, v11))
  {
    objc_msgSend_setState_(self, v8, 0, v10, v11);
    AX_PERFORM_WITH_LOCK();
  }
  objc_msgSend_setState_(self, v8, 0, v10, v11);
}

- (void)setAudioSession:(id)a3
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
  uint64_t v14;
  int v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL8 v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t v43[16];

  v5 = a3;
  objc_msgSend_audioSession(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_opaqueSessionID(v10, v11, v12, v13, v14);

  objc_storeStrong((id *)&self->_audioSession, a3);
  if (v15 != objc_msgSend_opaqueSessionID(v5, v16, v17, v18, v19))
  {
    AXTTSLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_1A3940000, v20, OS_LOG_TYPE_INFO, "TTSAQ: Audio session changed, rebuilding audio queue.", v43, 2u);
    }

    objc_msgSend__tearDownAudioQueue(self, v21, v22, v23, v24);
    v29 = objc_msgSend_opaqueSessionID(v5, v25, v26, v27, v28);
    objc_msgSend_sharedInstance(MEMORY[0x1E0C89AF0], v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v29 == objc_msgSend_opaqueSessionID(v34, v35, v36, v37, v38);
    objc_msgSend_setUsingSharedSession_(self, v40, v39, v41, v42);

  }
}

- (void)setChannels:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[16];

  v5 = a3;
  if ((objc_msgSend_isEqualToArray_(v5, v6, (uint64_t)self->_channels, v7, v8) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_channels, a3);
    objc_msgSend__reconfigureQueueFormatForMultiChannelOutputIfNecessary(self, v9, v10, v11, v12);
    AXTTSLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1A3940000, v13, OS_LOG_TYPE_INFO, "TTSAQ: Audio channels changed, rebuilding audio queue.", v17, 2u);
    }

    objc_msgSend_setShouldRebuildAudioQueue_(self, v14, 1, v15, v16);
  }

}

- (void)setOutputFormat:(id)a3
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
  char isEqual;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t v23[16];

  v5 = a3;
  objc_msgSend_outputFormat(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v5, v11, (uint64_t)v10, v12, v13);

  if ((isEqual & 1) == 0)
  {
    AXTTSLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1A3940000, v19, OS_LOG_TYPE_INFO, "TTSAQ: Audio format changed, rebuilding audio queue.", v23, 2u);
    }

    objc_storeStrong((id *)&self->_outputFormat, a3);
    objc_msgSend_setShouldRebuildAudioQueue_(self, v20, 1, v21, v22);
  }
  objc_msgSend__reconfigureQueueFormatForMultiChannelOutputIfNecessary(self, v15, v16, v17, v18);

}

- (void)setAudioQueueFlags:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_audioQueueFlags != a3)
  {
    v3 = *(_QWORD *)&a3;
    AXTTSLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v6, v3, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1A3940000, v5, OS_LOG_TYPE_INFO, "TTSAQ: Audio queue flags changed to %@, rebuilding audio queue.", (uint8_t *)&v13, 0xCu);

    }
    self->_audioQueueFlags = v3;
    objc_msgSend_setShouldRebuildAudioQueue_(self, v10, 1, v11, v12);
  }
}

- (void)handleMediaServicesReset
{
  NSObject *v2;
  uint8_t buf[16];

  AXTTSLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3940000, v2, OS_LOG_TYPE_INFO, "TTSAQ: Media services reset", buf, 2u);
  }

  AX_PERFORM_WITH_LOCK();
}

- (BOOL)isRunning
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_state(self, a2, v2, v3, v4) == 1;
}

- (BOOL)audioQueueActive
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  OpaqueAudioQueue *v11;
  BOOL v12;
  UInt32 ioDataSize;
  int outData;

  v6 = objc_msgSend_aqRef(self, a2, v2, v3, v4);
  if (v6)
  {
    ioDataSize = 4;
    outData = 0;
    v11 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v7, v8, v9, v10);
    if (AudioQueueGetProperty(v11, 0x6171726Eu, &outData, &ioDataSize))
      v12 = 1;
    else
      v12 = outData == 0;
    LOBYTE(v6) = !v12;
  }
  return v6;
}

- (void)bufferCallback:(AudioQueueBuffer *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
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
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  OpaqueAudioQueue *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  int v38;
  UInt32 v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  OpaqueAudioQueue *v44;
  AudioQueueBufferRef v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  OpaqueAudioQueue *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  float v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int isActive;
  int v71;
  char v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  OpaqueAudioQueue *v81;
  OpaqueAudioQueue *v82;
  NSObject *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  OpaqueAudioQueue *v94;
  _QWORD v95[5];
  BOOL v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v100;
  id v101;
  TTSWrappedAudioQueue *v102;
  uint64_t *v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  char v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  void *(*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;
  AudioQueueBufferRef outBuffer[4];

  outBuffer[3] = *(AudioQueueBufferRef *)MEMORY[0x1E0C80C00];
  v115 = 0;
  v116 = &v115;
  v117 = 0x3032000000;
  v118 = sub_1A3951618;
  v119 = sub_1A3951640;
  v120 = 0;
  v5 = a3->mUserData;
  v109 = 0;
  v110 = &v109;
  v111 = 0x3032000000;
  v112 = sub_1A3951648;
  v113 = sub_1A3951658;
  v114 = 0;
  v105 = 0;
  v106 = &v105;
  v107 = 0x2020000000;
  v108 = 0;
  v10 = objc_msgSend_audioQueueActive(self, v6, v7, v8, v9);
  v11 = MEMORY[0x1E0C809B0];
  v97 = MEMORY[0x1E0C809B0];
  v98 = 3221225472;
  v99 = sub_1A3951660;
  v100 = &unk_1E4A9FB98;
  v12 = v5;
  v101 = v12;
  v102 = self;
  v103 = &v109;
  v104 = &v105;
  AX_PERFORM_WITH_LOCK();
  if (v12)
  {
    objc_msgSend_completionHandler((void *)v110[5], v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend_completionHandler((void *)v110[5], v18, v19, v20, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v116[5];
      v116[5] = v22;

      objc_msgSend_setCompletionHandler_((void *)v110[5], v24, 0, v25, v26);
    }
    v27 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v18, v19, v20, v21);
    AudioQueueFreeBuffer(v27, a3);
    if (v116[5])
    {
      v32 = objc_msgSend_state(self, v28, v29, v30, v31);
      objc_msgSend_callbackQueue(self, v33, v34, v35, v36);
      v37 = objc_claimAutoreleasedReturnValue();
      v95[0] = v11;
      v95[1] = 3221225472;
      v95[2] = sub_1A39516E4;
      v95[3] = &unk_1E4A9FBC0;
      v95[4] = &v115;
      v96 = v32 == 0;
      dispatch_async(v37, v95);

    }
    if (*((_BYTE *)v106 + 24))
      v38 = v10;
    else
      v38 = 0;
    if (v38 == 1)
    {
      v39 = objc_msgSend__minimumBufferByteSize(self, v28, v29, v30, v31);
      outBuffer[0] = 0;
      v44 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v40, v41, v42, v43);
      AudioQueueAllocateBuffer(v44, v39, outBuffer);
      v45 = outBuffer[0];
      outBuffer[0]->mUserData = 0;
      v45->mAudioDataByteSize = v39;
      bzero(v45->mAudioData, v39);
      objc_msgSend_setCurrentSilenceBufferCount_(self, v46, (uint64_t)&unk_1E4ABC738, v47, v48);
      v53 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v49, v50, v51, v52);
      AudioQueueEnqueueBuffer(v53, outBuffer[0], 0, 0);
    }
  }
  else
  {
    objc_msgSend_currentSilenceBufferCount(self, v13, v14, v15, v16);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend_unsignedIntValue(v54, v55, v56, v57, v58);

    v64 = (float)v59 * 0.1;
    if (v64 > 0.5)
    {
      v71 = 1;
    }
    else
    {
      objc_msgSend_audioSession(self, v60, v61, v62, v63);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      isActive = objc_msgSend_isActive(v65, v66, v67, v68, v69);

      v71 = isActive ^ 1;
      if (*((_BYTE *)v106 + 24))
        v72 = isActive ^ 1;
      else
        v72 = 1;
      if ((v72 & 1) == 0 && ((v10 ^ 1) & 1) == 0)
      {
        objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v60, v59 + 1, v62, v63);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setCurrentSilenceBufferCount_(self, v74, (uint64_t)v73, v75, v76);

        v81 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v77, v78, v79, v80);
        AudioQueueEnqueueBuffer(v81, a3, 0, 0);
        goto LABEL_24;
      }
    }
    v82 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v60, v61, v62, v63);
    AudioQueueFreeBuffer(v82, a3);
    if (v71 && *((_BYTE *)v106 + 24))
    {
      AXTTSLogCommon();
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
      {
        *(float *)&v88 = (float)v59 * 0.1;
        objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v84, v85, v86, v87, v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1A3AAF728(v89, (uint8_t *)outBuffer, v83);
      }

      v94 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v90, v91, v92, v93);
      AudioQueueStop(v94, 1u);
    }
  }
LABEL_24:

  _Block_object_dispose(&v105, 8);
  _Block_object_dispose(&v109, 8);

  _Block_object_dispose(&v115, 8);
}

- (BOOL)_startQueueWithRetry
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint8_t v28[4];
  _DWORD v29[7];

  *(_QWORD *)&v29[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend__buildAudioQueue(self, a2, v2, v3, v4);
  if ((objc_msgSend__attemptQueueStart(self, v6, v7, v8, v9) & 1) != 0)
    return 1;
  v11 = 0;
  do
  {
    v12 = v11;
    AXTTSLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1A3AAF77C(v28, (const char *)(v12 + 1), v29, v13, v14);

    objc_msgSend__tearDownAudioQueue(self, v15, v16, v17, v18);
    if (v12)
      objc_msgSend_sleepForTimeInterval_(MEMORY[0x1E0CB3978], v19, v20, v21, v22, 0.1);
    if (v12 == 2)
      break;
    objc_msgSend__buildAudioQueue(self, v19, v20, v21, v22);
    v27 = objc_msgSend__attemptQueueStart(self, v23, v24, v25, v26);
    v11 = v12 + 1;
  }
  while ((v27 & 1) == 0);
  return v12 < 2;
}

- (BOOL)_attemptQueueStart
{
  _QWORD v3[3];
  int v4;

  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x2020000000;
  v4 = 0;
  AX_PERFORM_WITH_LOCK();
  _Block_object_dispose(v3, 8);
  return 1;
}

- (void)_buildAudioQueue
{
  AX_PERFORM_WITH_LOCK();
}

- (unint64_t)_minimumBufferByteSize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  unsigned int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  objc_msgSend_outputFormat(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sampleRate(v6, v7, v8, v9, v10);
  v12 = (v11 * 0.1);
  objc_msgSend_outputFormat(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(_DWORD *)(objc_msgSend_streamDescription(v17, v18, v19, v20, v21) + 24) * v12;

  return v22;
}

- (void)_tearDownAudioQueue
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  OpaqueAudioQueue *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  OpaqueAudioQueue *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  OpaqueAudioQueue *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  _QWORD block[11];
  _QWORD v46[5];
  id v47;

  if (objc_msgSend_aqRef(self, a2, v2, v3, v4))
  {
    AXTTSLogCommon();
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEBUG))
      sub_1A3AAF7F8(self, v6, v7, v8, v9);

    v14 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v10, v11, v12, v13);
    AudioQueueRemovePropertyListener(v14, 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_1A3951BAC, self);
    v19 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v15, v16, v17, v18);
    AudioQueueStop(v19, 1u);
    objc_msgSend_procNodeRef(self, v20, v21, v22, v23);
    ATAudioProcessingNodeDispose();
    v28 = (OpaqueAudioQueue *)objc_msgSend_aqRef(self, v24, v25, v26, v27);
    AudioQueueDispose(v28, 1u);
    objc_msgSend_setState_(self, v29, 0, v30, v31);
    objc_msgSend_setAqRef_(self, v32, 0, v33, v34);
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x3032000000;
    v46[3] = sub_1A3951648;
    v46[4] = sub_1A3951658;
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v35, v36, v37, v38);
    v47 = (id)objc_claimAutoreleasedReturnValue();
    v39 = MEMORY[0x1E0C809B0];
    block[5] = MEMORY[0x1E0C809B0];
    block[6] = 3221225472;
    block[7] = sub_1A3951C44;
    block[8] = &unk_1E4A9FBE8;
    block[9] = self;
    block[10] = v46;
    AX_PERFORM_WITH_LOCK();
    objc_msgSend_callbackQueue(self, v40, v41, v42, v43);
    v44 = objc_claimAutoreleasedReturnValue();
    block[0] = v39;
    block[1] = 3221225472;
    block[2] = sub_1A3951DA8;
    block[3] = &unk_1E4A9FC10;
    block[4] = v46;
    dispatch_async(v44, block);

    _Block_object_dispose(v46, 8);
  }
}

- (void)_rebuildAudioQueue
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  if ((objc_msgSend_usingSharedSession(self, a2, v2, v3, v4) & 1) != 0)
    objc_msgSend_sharedInstance(MEMORY[0x1E0C89AF0], v6, v7, v8, v9);
  else
    objc_msgSend_audioSession(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_opaqueSessionID(v10, v11, v12, v13, v14);

  objc_msgSend_streamDescription(self->_queueFormat, v15, v16, v17, v18);
  objc_msgSend_audioQueueFlags(self, v19, v20, v21, v22);
  AudioQueueNewOutputWithAudioSession();
  objc_msgSend_audioSession(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreferredIOBufferDuration_error_(v27, v28, 0, v29, v30, 0.003);

  objc_msgSend__selectChannels_(self, v31, 0, v32, v33);
  self->_aqRef = 0;
  objc_msgSend__configureEffects(self, v34, v35, v36, v37);
  AudioQueueAddPropertyListener(self->_aqRef, 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_1A3951BAC, self);
  AXTTSLogCommon();
  v38 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEBUG))
    sub_1A3AAF990(self, v38, v39, v40, v41);

}

- (void)_reconfigureQueueFormatForMultiChannelOutputIfNecessary
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  AVAudioFormat *v29;
  AVAudioFormat *queueFormat;
  id v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  AVAudioFormat *v39;
  AVAudioFormat *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  objc_msgSend_outputFormat(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_outputFormat(self, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_streamDescription(v11, v12, v13, v14, v15);
    v17 = *(_QWORD *)(v16 + 32);
    v18 = *(_OWORD *)(v16 + 16);
    v45 = *(_OWORD *)v16;
    v46 = v18;
    v47 = v17;

    if (objc_msgSend_count(self->_channels, v19, v20, v21, v22))
      v27 = objc_msgSend_count(self->_channels, v23, v24, v25, v26);
    else
      v27 = 1;
    if (HIDWORD(v46) == v27)
    {
      objc_msgSend_outputFormat(self, v23, v24, v25, v26);
      v29 = (AVAudioFormat *)objc_claimAutoreleasedReturnValue();
      queueFormat = self->_queueFormat;
      self->_queueFormat = v29;

    }
    else
    {
      DWORD2(v46) *= v27;
      HIDWORD(v46) = v27;
      HIDWORD(v45) &= ~0x20u;
      LODWORD(v46) = v46 * v27;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      LODWORD(v41) = v27 | 0x930000;
      HIDWORD(v41) = 15;
      v31 = objc_alloc(MEMORY[0x1E0C89AA0]);
      v32 = objc_alloc(MEMORY[0x1E0C89A60]);
      v36 = (void *)objc_msgSend_initWithLayout_(v32, v33, (uint64_t)&v41, v34, v35);
      v39 = (AVAudioFormat *)objc_msgSend_initWithStreamDescription_channelLayout_(v31, v37, (uint64_t)&v45, (uint64_t)v36, v38, v41, v42, v43, v44);
      v40 = self->_queueFormat;
      self->_queueFormat = v39;

    }
  }
  else
  {
    AXTTSLogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_1A3AAFA1C();

  }
}

- (void)_selectChannels:(OpaqueAudioQueue *)a3
{
  NSObject *v5;
  NSArray *channels;
  NSArray **p_channels;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
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
  uint64_t v29;
  uint64_t v30;
  int v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  size_t v38;
  NSArray *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  OSStatus v58;
  __int16 v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  unint64_t v66;
  _DWORD *v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  size_t v79;
  __int128 v80;
  uint64_t *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  _BYTE v87[10];
  __int16 v88;
  uint64_t v89;
  _BYTE v90[120];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  AXTTSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    channels = self->_channels;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v87 = channels;
    _os_log_impl(&dword_1A3940000, v5, OS_LOG_TYPE_INFO, "TTSAQ: Selecting channels %@", buf, 0xCu);
  }

  p_channels = &self->_channels;
  if (objc_msgSend_count(self->_channels, v8, v9, v10, v11))
  {
    objc_msgSend_queueFormat(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(unsigned int *)(objc_msgSend_streamDescription(v16, v17, v18, v19, v20) + 28);

    objc_msgSend_queueFormat(self, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend_channelCount(v26, v27, v28, v29, v30);
    v36 = objc_msgSend_count(self->_channels, v32, v33, v34, v35);

    if (v36 == v31)
    {
      v37 = &v78 - 2 * v21;
      v38 = 16 * v21;
      bzero(v37, v38);
      v85 = 0u;
      v84 = 0u;
      v83 = 0u;
      v82 = 0u;
      v39 = *p_channels;
      v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v82, (uint64_t)v90, 16);
      if (v41)
      {
        v46 = v41;
        v79 = v38;
        *(_QWORD *)&v80 = a3;
        v81 = &v78;
        v47 = 0;
        v48 = *(_QWORD *)v83;
        do
        {
          v49 = 0;
          v50 = v47;
          v51 = &v37[2 * v47 + 1];
          do
          {
            if (*(_QWORD *)v83 != v48)
              objc_enumerationMutation(v39);
            v52 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v49);
            *(_DWORD *)v51 = objc_msgSend_channelNumber(v52, v42, v43, v44, v45);
            objc_msgSend_owningPortUID(v52, v53, v54, v55, v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(v51 - 1) = (uint64_t)v57;

            ++v49;
            v51 += 2;
          }
          while (v46 != v49);
          v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v42, (uint64_t)&v82, (uint64_t)v90, 16);
          v47 = v50 + v49;
        }
        while (v46);

        v58 = AudioQueueSetProperty((AudioQueueRef)v80, 0x61716361u, v37, v79);
        if (v58 << 16)
        {
          v59 = v58;
          AXTTSLogCommon();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            sub_1A3AAFA54(v59, v60);

          if (objc_msgSend_count(*p_channels, v61, v62, v63, v64))
          {
            v66 = 0;
            v67 = v37 + 1;
            *(_QWORD *)&v65 = 67109634;
            v80 = v65;
            do
            {
              AXTTSLogCommon();
              v68 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                v73 = *v67;
                v74 = *((_QWORD *)v67 - 1);
                *(_DWORD *)buf = v80;
                *(_DWORD *)v87 = v66;
                *(_WORD *)&v87[4] = 1024;
                *(_DWORD *)&v87[6] = v73;
                v88 = 2112;
                v89 = v74;
                _os_log_error_impl(&dword_1A3940000, v68, OS_LOG_TYPE_ERROR, "TTSAQ: Channel layout error: [%d], channel number: %d, deviceUID: %@", buf, 0x18u);
              }

              ++v66;
              v67 += 4;
            }
            while (objc_msgSend_count(*p_channels, v69, v70, v71, v72) > v66);
          }
        }
      }
      else
      {

      }
    }
    else
    {
      AXTTSLogCommon();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        sub_1A3AAFADC(v21, (const char *)p_channels, v75, v76, v77);

    }
  }
}

- (void)_initializeDSPGraphAU
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend_aqRef(self, a2, v2, v3, v4);
  v6 = ATAudioProcessingNodeInstantiate();
  objc_msgSend_setProcNodeRef_(self, v7, 0, v8, v9);
  if ((_DWORD)v6)
  {
    AXTTSLogCommon();
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      sub_1A3AAFB94(v6, v10, v11, v12, v13);

  }
}

- (void)_tearDownDSPGraphAU
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

  if (objc_msgSend_procNodeRef(self, a2, v2, v3, v4))
  {
    objc_msgSend_procNodeRef(self, v6, v7, v8, v9);
    ATAudioProcessingNodeDispose();
    objc_msgSend_setProcNodeRef_(self, v10, 0, v11, v12);
  }
}

- (void)setDspGraph:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a3;
  if ((objc_msgSend_isEqualToString_(self->_dspGraph, v6, (uint64_t)v5, v7, v8) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dspGraph, a3);
    AX_PERFORM_WITH_LOCK();
  }

}

- (void)setGraphProperties:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a3;
  if ((objc_msgSend_isEqualToDictionary_(self->_graphProperties, v6, (uint64_t)v5, v7, v8) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_graphProperties, a3);
    AX_PERFORM_WITH_LOCK();
  }

}

- (void)setGraphParameters:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a3;
  if ((objc_msgSend_isEqualToDictionary_(self->_graphParameters, v6, (uint64_t)v5, v7, v8) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_graphParameters, a3);
    AX_PERFORM_WITH_LOCK();
  }

}

- (void)_syncGraphParameters
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
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
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
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
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_aqRef(self, a2, v2, v3, v4)
    && objc_msgSend_procNodeRef(self, v6, v7, v8, v9)
    && objc_msgSend_needsParameterSync(self, v6, v10, v8, v9))
  {
    objc_msgSend_setNeedsParameterSync_(self, v6, 0, v8, v9);
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend_graphParameters(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v53, (uint64_t)v61, 16);
    if (v17)
    {
      v23 = v17;
      v24 = *(_QWORD *)v54;
      *(_QWORD *)&v22 = 138412546;
      v51 = v22;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v54 != v24)
            objc_enumerationMutation(v15);
          v26 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          LODWORD(v52) = 0;
          objc_msgSend_unsignedIntValue(v26, v18, v19, v20, v21, v51, 0, v52);
          objc_msgSend_graphParameters(self, v27, v28, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v31, v32, (uint64_t)v26, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_floatValue(v35, v36, v37, v38, v39);

          objc_msgSend_procNodeRef(self, v40, v41, v42, v43);
          v44 = ATAudioProcessingNodeSetParameter();
          if ((_DWORD)v44)
          {
            v45 = v44;
            AXTTSLogCommon();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v47, v45, v48, v49);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v51;
              v58 = v26;
              v59 = 2112;
              v60 = v50;
              _os_log_error_impl(&dword_1A3940000, v46, OS_LOG_TYPE_ERROR, "TTSAQ: Could not set AUDSPGraph parameter [%@] with error: %@", buf, 0x16u);

            }
          }
        }
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v53, (uint64_t)v61, 16);
      }
      while (v23);
    }

  }
  else
  {
    objc_msgSend_setNeedsParameterSync_(self, v6, 1, v8, v9);
  }
}

- (void)_syncGraphProperties
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;

  v11 = !objc_msgSend_aqRef(self, a2, v2, v3, v4)
     || !objc_msgSend_procNodeRef(self, v6, v7, v8, v9)
     || (objc_msgSend_needsPropertySync(self, v6, v10, v8, v9) & 1) == 0;
  objc_msgSend_setNeedsPropertySync_(self, v6, v11, v8, v9);
}

- (void)_configureEffects
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  objc_msgSend__tearDownDSPGraphAU(self, a2, v2, v3, v4);
  objc_msgSend_dspGraph(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (!objc_msgSend_procNodeRef(self, v11, v12, v13, v14))
      objc_msgSend__initializeDSPGraphAU(self, v15, v16, v17, v18);
    objc_msgSend_dspGraph(self, v15, v16, v17, v18);

    objc_msgSend_procNodeRef(self, v19, v20, v21, v22);
    v23 = ATAudioProcessingNodeSetProperty();
    objc_msgSend_setNeedsPropertySync_(self, v24, 1, v25, v26);
    objc_msgSend_setNeedsParameterSync_(self, v27, 1, v28, v29);
    if ((_DWORD)v23)
    {
      AXTTSLogCommon();
      v30 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
        sub_1A3AAFC18(v23, v30, v31, v32, v33);

    }
  }
}

- (NSString)dspGraph
{
  return self->_dspGraph;
}

- (NSDictionary)graphParameters
{
  return self->_graphParameters;
}

- (NSDictionary)graphProperties
{
  return self->_graphProperties;
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (NSArray)channels
{
  return self->_channels;
}

- (AVAudioFormat)outputFormat
{
  return self->_outputFormat;
}

- (unsigned)audioQueueFlags
{
  return self->_audioQueueFlags;
}

- (OpaqueAudioQueue)aqRef
{
  return self->_aqRef;
}

- (void)setAqRef:(OpaqueAudioQueue *)a3
{
  self->_aqRef = a3;
}

- (OpaqueATAudioProcessingNode)procNodeRef
{
  return self->_procNodeRef;
}

- (void)setProcNodeRef:(OpaqueATAudioProcessingNode *)a3
{
  self->_procNodeRef = a3;
}

- (AVAudioFormat)queueFormat
{
  return self->_queueFormat;
}

- (void)setQueueFormat:(id)a3
{
  objc_storeStrong((id *)&self->_queueFormat, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)shouldRebuildAudioQueue
{
  return self->_shouldRebuildAudioQueue;
}

- (void)setShouldRebuildAudioQueue:(BOOL)a3
{
  self->_shouldRebuildAudioQueue = a3;
}

- (NSMutableOrderedSet)inflightBuffers
{
  return self->_inflightBuffers;
}

- (void)setInflightBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_inflightBuffers, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (BOOL)usingSharedSession
{
  return self->_usingSharedSession;
}

- (void)setUsingSharedSession:(BOOL)a3
{
  self->_usingSharedSession = a3;
}

- (AVAudioConverter)cachedAudioConverter
{
  return self->_cachedAudioConverter;
}

- (void)setCachedAudioConverter:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAudioConverter, a3);
}

- (NSNumber)currentSilenceBufferCount
{
  return self->_currentSilenceBufferCount;
}

- (void)setCurrentSilenceBufferCount:(id)a3
{
  objc_storeStrong((id *)&self->_currentSilenceBufferCount, a3);
}

- (BOOL)needsParameterSync
{
  return self->_needsParameterSync;
}

- (void)setNeedsParameterSync:(BOOL)a3
{
  self->_needsParameterSync = a3;
}

- (BOOL)needsPropertySync
{
  return self->_needsPropertySync;
}

- (void)setNeedsPropertySync:(BOOL)a3
{
  self->_needsPropertySync = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSilenceBufferCount, 0);
  objc_storeStrong((id *)&self->_cachedAudioConverter, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_inflightBuffers, 0);
  objc_storeStrong((id *)&self->_queueFormat, 0);
  objc_storeStrong((id *)&self->_outputFormat, 0);
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_graphProperties, 0);
  objc_storeStrong((id *)&self->_graphParameters, 0);
  objc_storeStrong((id *)&self->_dspGraph, 0);
}

@end
