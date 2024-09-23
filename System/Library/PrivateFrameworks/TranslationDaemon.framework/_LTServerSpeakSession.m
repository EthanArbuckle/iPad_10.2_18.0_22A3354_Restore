@implementation _LTServerSpeakSession

- (_LTServerSpeakSession)initWithEngine:(id)a3
{
  id v5;
  _LTServerSpeakSession *v6;
  _LTServerSpeakSession *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  _LTServerSpeakSession *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LTServerSpeakSession;
  v6 = -[_LTServerSpeakSession init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_engine, a3);
    v8 = dispatch_queue_create("com.apple.translationd.playback", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
    v10 = v7;
  }

  return v7;
}

- (id)_createTemporaryOutputFileWithURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v3 = a3;
    NSTemporaryDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v3, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "fileURLWithPath:relativeToURL:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)_playback:(id)a3 context:(id)a4 completion:(id)a5 audioStartHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, id);
  id v13;
  BOOL v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _LTAudioDecoder *v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  double v45;
  NSObject *v46;
  _LTPlaybackService *v47;
  _LTPlaybackService *v48;
  _LTPlaybackService *player;
  _LTPlaybackService *v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  BOOL v60;
  NSObject *v61;
  NSObject *v62;
  id v63;
  NSObject *v64;
  __int128 v65;
  __int128 v66;
  id v67;
  void *v68;
  void (**v69)(id, void *, id);
  void *v70;
  _QWORD block[4];
  id v72;
  id v73;
  double v74;
  id v75;
  _OWORD v76[2];
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  uint8_t buf[16];
  __int128 v84;
  uint64_t v85;
  _BYTE v86[32];
  uint64_t v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *, id))a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v14 = -[_LTServerSpeakSession _hasCachedCompletion](self, "_hasCachedCompletion");
  v15 = _LTOSLogTTS();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2491B9000, v15, OS_LOG_TYPE_INFO, "Prepping playback for audio data of request", buf, 2u);
    }
    objc_msgSend(v11, "outputFileURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTServerSpeakSession _createTemporaryOutputFileWithURL:](self, "_createTemporaryOutputFileWithURL:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "writeToURL:", v18);
    v85 = 0;
    *(_OWORD *)buf = 0u;
    v84 = 0u;
    if (v10)
    {
      objc_msgSend(v10, "asbd");
      objc_msgSend(v10, "asbd");
      if (DWORD2(v80) == 1819304813)
      {
        objc_msgSend(v10, "packetDescriptions");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "rawData");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
    }
    else
    {
      v82 = 0;
      v80 = 0uLL;
      v81 = 0uLL;
    }
    v70 = v18;
    v67 = v13;
    objc_msgSend(v10, "rawData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v78 = 0;
    v79 = 0;
    if (objc_msgSend(v10, "packetCount") < 1)
    {
      v24 = 0;
    }
    else
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      do
      {
        objc_msgSend(v10, "packetDescriptions");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "getBytes:range:", &v78, v22, 16);

        v26 = (void *)MEMORY[0x24BDBCE50];
        v27 = objc_msgSend(objc_retainAutorelease(v20), "bytes");
        objc_msgSend(v26, "dataWithBytes:length:", v27 + v78, HIDWORD(v79));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v28);
        v24 += objc_msgSend(v28, "length");

        ++v23;
        v22 += 16;
      }
      while (objc_msgSend(v10, "packetCount") > v23);
    }
    v29 = objc_alloc_init(_LTAudioDecoder);
    v69 = v12;
    if (v10)
    {
      objc_msgSend(v10, "asbd");
    }
    else
    {
      v77 = 0;
      memset(v76, 0, sizeof(v76));
    }
    v75 = 0;
    *(_OWORD *)v86 = _LTAudioFormat48khzPCM;
    *(_OWORD *)&v86[16] = *(_OWORD *)&qword_249338790;
    v87 = 16;
    -[_LTAudioDecoder decodeChunks:from:to:outError:](v29, "decodeChunks:from:to:outError:", v21, v76, v86, &v75, 0x100000002, unk_249338798, _LTAudioFormat48khzPCM);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v75;
    v32 = _LTOSLogTTS();
    v33 = v32;
    if (v31)
    {
      v13 = v67;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[_LTServerSpeakSession _playback:context:completion:audioStartHandler:].cold.5((uint64_t)v31, v33, v34, v35, v36, v37, v38, v39);
      v69[2](v69, v70, v31);
    }
    else
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v40 = v33;
        v41 = objc_msgSend(v30, "length");
        *(_DWORD *)v86 = 134218240;
        *(_QWORD *)&v86[4] = v24;
        *(_WORD *)&v86[12] = 2048;
        *(_QWORD *)&v86[14] = v41;
        _os_log_impl(&dword_2491B9000, v40, OS_LOG_TYPE_INFO, "Converted %ld bytes to %ld bytes", v86, 0x16u);

      }
      *(_OWORD *)buf = v66;
      v84 = v65;
      v85 = 16;
      v13 = v67;
    }

    if (v31)
    {
      v42 = v30;
      v12 = v69;
      v18 = v70;
LABEL_40:

      goto LABEL_41;
    }
    v68 = 0;
    v19 = v30;
    v12 = v69;
    v18 = v70;
LABEL_29:
    v42 = v19;
    v43 = objc_msgSend(v19, "length");
    v44 = v43 / DWORD2(v84);
    v45 = (double)v44 / *(double *)buf;
    v46 = _LTOSLogTTS();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      -[_LTServerSpeakSession _playback:context:completion:audioStartHandler:].cold.4(v44, v46, v45);
    v47 = [_LTPlaybackService alloc];
    *(_OWORD *)v86 = *(_OWORD *)buf;
    *(_OWORD *)&v86[16] = v84;
    v87 = v85;
    v48 = -[_LTPlaybackService initWithContext:ASBD:](v47, "initWithContext:ASBD:", v11, v86);
    player = self->_player;
    self->_player = v48;

    v50 = self->_player;
    if (v50)
    {
      -[_LTPlaybackService start](v50, "start");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v51)
      {
        v60 = -[_LTServerSpeakSession _hasCachedCompletion](self, "_hasCachedCompletion");
        v61 = _LTOSLogTTS();
        v62 = v61;
        if (v60)
        {
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
            -[_LTServerSpeakSession _playback:context:completion:audioStartHandler:].cold.2();
          v63 = -[_LTPlaybackService enqueue:packetCount:packetDescriptions:](self->_player, "enqueue:packetCount:packetDescriptions:", v42, 0, 0);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __72___LTServerSpeakSession__playback_context_completion_audioStartHandler___block_invoke;
          block[3] = &unk_251A13850;
          v73 = v13;
          v72 = v10;
          v74 = v45;
          dispatch_async(MEMORY[0x24BDAC9B8], block);
          -[_LTPlaybackService flushAndStop](self->_player, "flushAndStop");
          -[_LTPlaybackService reset](self->_player, "reset");
          v64 = _LTOSLogTTS();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v86 = 0;
            _os_log_impl(&dword_2491B9000, v64, OS_LOG_TYPE_INFO, "Finished TTS playback", v86, 2u);
          }
          v12[2](v12, v18, 0);

        }
        else
        {
          if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v86 = 0;
            _os_log_impl(&dword_2491B9000, v62, OS_LOG_TYPE_INFO, "Not playing back audio for server speak session because it was previously cancelled since this request started", v86, 2u);
          }
          v12[2](v12, 0, 0);
        }
        goto LABEL_39;
      }
      v52 = _LTOSLogTTS();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        -[_LTServerSpeakSession _playback:context:completion:audioStartHandler:].cold.3((uint64_t)v51, v52, v53, v54, v55, v56, v57, v58);
    }
    else
    {
      v59 = _LTOSLogTTS();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        -[_LTServerSpeakSession _playback:context:completion:audioStartHandler:].cold.1();
      objc_msgSend(MEMORY[0x24BDD1540], "lt_internalTTSCreationError");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12[2](v12, v18, v51);
LABEL_39:

    goto LABEL_40;
  }
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2491B9000, v15, OS_LOG_TYPE_INFO, "Not playing back audio for server speak session because it was previously cancelled", buf, 2u);
  }
  v12[2](v12, 0, 0);
LABEL_41:

}

- (void)speak:(id)a3 context:(id)a4 completion:(id)a5 audioStartHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OS_dispatch_queue *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  OS_dispatch_queue *v23;
  id v24;
  id v25;
  id v26;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self->_queue;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke;
  block[3] = &unk_251A138F0;
  objc_copyWeak(&v26, &location);
  v21 = v10;
  v22 = v11;
  v23 = v14;
  v24 = v12;
  v25 = v13;
  v15 = v13;
  v16 = v14;
  v17 = v11;
  v18 = v10;
  v19 = v12;
  dispatch_async(v16, block);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

- (void)cancel
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = _LTOSLogTTS();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2491B9000, v3, OS_LOG_TYPE_INFO, "Asked to cancel speak session", v4, 2u);
  }
  -[_LTTranslationEngine endAudio](self->_engine, "endAudio");
  -[_LTPlaybackService stop](self->_player, "stop");
  -[_LTServerSpeakSession _callCompletionAndClearIfNeeded:error:](self, "_callCompletionAndClearIfNeeded:error:", 0, 0);
}

- (BOOL)_hasCachedCompletion
{
  os_unfair_lock_s *p_lock;
  _QWORD *v3;
  _QWORD v5[2];
  uint64_t (*v6)(uint64_t);
  void *v7;
  _LTServerSpeakSession *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v6 = __45___LTServerSpeakSession__hasCachedCompletion__block_invoke;
  v7 = &unk_251A13918;
  v8 = self;
  v9 = &v10;
  v3 = v5;
  os_unfair_lock_lock(p_lock);
  v6((uint64_t)v3);

  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_lock;
}

- (void)_callCompletionAndClearIfNeeded:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v11[2];
  void (*v12)(uint64_t);
  void *v13;
  _LTServerSpeakSession *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__9;
  v20 = __Block_byref_object_dispose__9;
  v21 = 0;
  p_lock = &self->_lock;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v12 = __63___LTServerSpeakSession__callCompletionAndClearIfNeeded_error___block_invoke;
  v13 = &unk_251A13940;
  v14 = self;
  v15 = &v16;
  v9 = v11;
  os_unfair_lock_lock(p_lock);
  v12((uint64_t)v9);

  os_unfair_lock_unlock(p_lock);
  v10 = v17[5];
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v6, v7);
  _Block_object_dispose(&v16, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cachedCompletionHandler, 0);
  objc_storeStrong((id *)&self->_converter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

- (void)_playback:context:completion:audioStartHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Failed to create playback service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_playback:context:completion:audioStartHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Enqueueing TTS data for playback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_playback:(uint64_t)a3 context:(uint64_t)a4 completion:(uint64_t)a5 audioStartHandler:(uint64_t)a6 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Failed to start TTS playback: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_2();
}

- (void)_playback:(double)a3 context:completion:audioStartHandler:.cold.4(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a3;
  v5 = 2048;
  v6 = a1;
  _os_log_debug_impl(&dword_2491B9000, a2, OS_LOG_TYPE_DEBUG, "Duration: %f. Total number of frames: %ld", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_2();
}

- (void)_playback:(uint64_t)a3 context:(uint64_t)a4 completion:(uint64_t)a5 audioStartHandler:(uint64_t)a6 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Decoding to PCM 48kHz failed: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_2();
}

@end
