@implementation SiriTTSOspreyStreamingPartialResponse

- (SiriTTSOspreyStreamingPartialResponse)initWithOspreyPartialResponse:(id)a3
{
  id v4;
  SiriTTSOspreyStreamingPartialResponse *v5;
  uint64_t v6;
  NSData *audioData;
  NSArray *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  SiriTTSOspreyWordTimingInfo *v15;
  float v16;
  NSArray *timingInfos;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SiriTTSOspreyStreamingPartialResponse;
  v5 = -[SiriTTSOspreyStreamingPartialResponse init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "audio");
    v6 = objc_claimAutoreleasedReturnValue();
    audioData = v5->_audioData;
    v5->_audioData = (NSData *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = v4;
    objc_msgSend(v4, "word_timing_info");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
          v15 = objc_alloc_init(SiriTTSOspreyWordTimingInfo);
          -[SiriTTSOspreyWordTimingInfo setTextRange:](v15, "setTextRange:", objc_msgSend(v14, "offset"), objc_msgSend(v14, "length"));
          objc_msgSend(v14, "timestamp");
          -[SiriTTSOspreyWordTimingInfo setTimestamp:](v15, "setTimestamp:", v16);
          -[NSArray addObject:](v8, "addObject:", v15);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v11);
    }

    timingInfos = v5->_timingInfos;
    v5->_timingInfos = v8;

    v4 = v19;
  }

  return v5;
}

- (AudioStreamBasicDescription)asbd
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].mSampleRate;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mBytesPerFrame;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(_QWORD *)&retstr->mBitsPerChannel = *(_QWORD *)&self[1].mBytesPerPacket;
  return self;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->mSampleRate;
  v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_QWORD *)&self->_asbd.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
  *(_OWORD *)&self->_asbd.mSampleRate = v3;
}

- (NSData)audioData
{
  return self->_audioData;
}

- (NSArray)timingInfos
{
  return self->_timingInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingInfos, 0);
  objc_storeStrong((id *)&self->_audioData, 0);
}

+ (void)processServerLogs:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t ii;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id obj;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint8_t v85[128];
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  void *v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "feature");
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "replacement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v78 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        TTSGetServiceLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "original");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "replacement");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v87 = v10;
          v88 = 2112;
          v89 = v11;

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
    }
    while (v5);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  objc_msgSend(v54, "prompts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v74 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
        objc_msgSend(v17, "prompts");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v19)
        {
          TTSGetServiceLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v17, "prompts");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "componentsJoinedByString:", CFSTR(" "));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v87 = v22;
            _os_log_impl(&dword_19AD45000, v20, OS_LOG_TYPE_INFO, "Prompt: \"%@\", buf, 0xCu);

          }
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
    }
    while (v14);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(v54, "phoneme_sequence");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
  if (v23)
  {
    v24 = v23;
    v56 = *(_QWORD *)v70;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v70 != v56)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        objc_msgSend(v26, "word_phonemes");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v65, v83, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v66;
          do
          {
            for (m = 0; m != v30; ++m)
            {
              if (*(_QWORD *)v66 != v31)
                objc_enumerationMutation(v28);
              objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * m), "phonemes");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "componentsJoinedByString:", CFSTR(" "));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "addObject:", v34);

            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v65, v83, 16);
          }
          while (v30);
        }

        TTSGetServiceLog();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v27, "componentsJoinedByString:", CFSTR(" _ "));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v87 = v36;
          _os_log_impl(&dword_19AD45000, v35, OS_LOG_TYPE_INFO, "Phonemes: %@", buf, 0xCu);

        }
      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
    }
    while (v24);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(v54, "normalized_text");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v61, v82, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v62;
    do
    {
      for (n = 0; n != v39; ++n)
      {
        if (*(_QWORD *)v62 != v40)
          objc_enumerationMutation(v37);
        v42 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * n);
        TTSGetServiceLog();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v42, "text");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v87 = v44;

        }
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v61, v82, 16);
    }
    while (v39);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v54, "neural_phoneme_sequence");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v57, v81, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v58;
    do
    {
      for (ii = 0; ii != v47; ++ii)
      {
        if (*(_QWORD *)v58 != v48)
          objc_enumerationMutation(v45);
        v50 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * ii);
        TTSGetServiceLog();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v50, "phonemes");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "componentsJoinedByString:", CFSTR(" "));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v87 = v53;
          _os_log_impl(&dword_19AD45000, v51, OS_LOG_TYPE_INFO, "Neural Phonemes: %@", buf, 0xCu);

        }
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v57, v81, 16);
    }
    while (v47);
  }

}

@end
