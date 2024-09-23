@implementation LTCombinedEngine

void __50___LTCombinedEngine_speak_withContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = _LTOSLogTTS();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __50___LTCombinedEngine_speak_withContext_completion___block_invoke_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
      objc_msgSend(WeakRetained[3], "speak:withContext:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }

}

uint64_t __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_6(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v7 = a2;
  v8 = a3;
  if (!a4)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_2;
    v10[3] = &unk_251A11370;
    v16 = *(_QWORD *)(a1 + 64);
    v9 = *(NSObject **)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v12 = v8;
    v15 = *(id *)(a1 + 56);
    v13 = v7;
    v14 = *(id *)(a1 + 48);
    dispatch_async(v9, v10);

  }
}

void __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a1[5];
  if (*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40))
  {
    v3 = (void *)a1[4];
    objc_msgSend((id)a1[5], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", v4);

    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    v5 = (void *)a1[7];
    objc_msgSend((id)a1[5], "identifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v2, v6);

  }
}

void __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_5;
  block[3] = &unk_251A113E8;
  v16 = v9;
  v10 = *(NSObject **)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v18 = v8;
  v11 = *(id *)(a1 + 48);
  v19 = v7;
  v20 = v11;
  v12 = v7;
  v13 = v8;
  v14 = v9;
  dispatch_async(v10, block);

}

uint64_t __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_5(uint64_t result)
{
  uint64_t v1;
  void *v2;
  void *v3;

  if (!*(_QWORD *)(result + 32))
  {
    v1 = result;
    v2 = *(void **)(result + 40);
    objc_msgSend(*(id *)(result + 48), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObject:", v3);

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 64) + 16))();
  }
  return result;
}

void __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_7(uint64_t a1)
{
  uint64_t (*v2)(void);
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v2 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    return v2();
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    v2 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    return v2();
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __62___LTCombinedEngine_translateSentence_withContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __62___LTCombinedEngine_translateSentence_withContext_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

_QWORD *__62___LTCombinedEngine_translateSentence_withContext_completion___block_invoke_3(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  if (!*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40);
    v2 = result[4];
    if (v1)
      return (_QWORD *)(*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(result[4], v1, 0);
    else
      return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v2 + 16))(result[4], 0, *(_QWORD *)(*(_QWORD *)(result[7] + 8) + 40));
  }
  return result;
}

void __50___LTCombinedEngine_speak_withContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Failed online TTS, will fallback to offline: %@", a5, a6, a7, a8, 2u);
}

@end
