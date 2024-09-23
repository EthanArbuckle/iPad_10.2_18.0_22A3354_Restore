@implementation LTServerSpeakSession

uint64_t __72___LTServerSpeakSession__playback_context_completion_audioStartHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, double))(result + 16))(result, *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));
  return result;
}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke(uint64_t a1)
{
  id *v2;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v2 = (id *)(a1 + 72);
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 72));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (-[os_unfair_lock_s _hasCachedCompletion](WeakRetained, "_hasCachedCompletion"))
    {
      v5 = _LTOSLogTTS();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_cold_2();
      -[os_unfair_lock_s _callCompletionAndClearIfNeeded:error:](v4, "_callCompletionAndClearIfNeeded:error:", 0, 0);
    }
    v6 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_8;
    v16[3] = &unk_251A12770;
    v16[4] = v4;
    v17 = *(id *)(a1 + 56);
    os_unfair_lock_lock(v4 + 10);
    __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_8((uint64_t)v16);
    os_unfair_lock_unlock(v4 + 10);
    v7 = _LTOSLogTTS();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_cold_1();
    v8 = *(void **)&v4[2]._os_unfair_lock_opaque;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_9;
    v11[3] = &unk_251A138C8;
    v12 = *(id *)(a1 + 48);
    objc_copyWeak(&v15, v2);
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 64);
    objc_msgSend(v8, "speak:withContext:completion:", v9, v10, v11);

    objc_destroyWeak(&v15);
  }

}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x2495AE9CC](*(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_9(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_2;
  v10[3] = &unk_251A138A0;
  objc_copyWeak(&v16, a1 + 7);
  v11 = v6;
  v12 = v5;
  v13 = a1[5];
  v14 = a1[4];
  v15 = a1[6];
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v16);
}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v4 = (_QWORD *)(a1 + 32);
    if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
    {
      v5 = _LTOSLogTTS();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_2_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
      objc_msgSend(WeakRetained, "_callCompletionAndClearIfNeeded:error:", 0, *v4);
    }
    else
    {
      v12 = _LTOSLogTTS();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_2_cold_2();
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_10;
      v15[3] = &unk_251A13878;
      v16 = *(id *)(a1 + 56);
      objc_copyWeak(&v17, v2);
      objc_msgSend(WeakRetained, "_playback:context:completion:audioStartHandler:", v13, v14, v15, *(_QWORD *)(a1 + 64));
      objc_destroyWeak(&v17);

    }
  }

}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_2_11;
  block[3] = &unk_251A128B0;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v13);
}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_2_11(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = _LTOSLogTTS();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2491B9000, v3, OS_LOG_TYPE_INFO, "Finished speaking", v4, 2u);
    }
    objc_msgSend(WeakRetained, "_callCompletionAndClearIfNeeded:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

uint64_t __45___LTServerSpeakSession__hasCachedCompletion__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 48) != 0;
  return result;
}

void __63___LTServerSpeakSession__callCompletionAndClearIfNeeded_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    v2 = MEMORY[0x2495AE9CC]();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = 0;

  }
}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Asking engine to generate audio data for TTS request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Speak session already has cached completion handler, but now asked to speak a new one", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Engine failed to generate audio data for TTS request: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_2();
}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Engine has generated audio data, prepping playback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
