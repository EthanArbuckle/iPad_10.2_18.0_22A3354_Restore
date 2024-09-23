@implementation WBSParsecDictionarySchema

void __93___WBSParsecDictionarySchema__validateChild_ofParent_withParentAssociatedError_errorHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;

  v5 = a2;
  v6 = (void *)a1[4];
  v7 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "_validateChild:ofParent:withParentAssociatedError:errorHandler:", v8, a1[4], a1[5], a1[6]);

  if ((v9 & 1) == 0)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __93___WBSParsecDictionarySchema__validateChild_ofParent_withParentAssociatedError_errorHandler___block_invoke_cold_1((uint64_t)v5, a1 + 4, v10);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
  }

}

void __93___WBSParsecDictionarySchema__validateChild_ofParent_withParentAssociatedError_errorHandler___block_invoke_cold_1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2048;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_0_14(&dword_1A3D90000, (uint64_t)a2, a3, "Dictionary schema validation failed for key \"%{public}@\" of dictionary %p", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

@end
