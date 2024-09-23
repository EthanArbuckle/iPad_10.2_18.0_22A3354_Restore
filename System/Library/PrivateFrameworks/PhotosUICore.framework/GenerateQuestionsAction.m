@implementation GenerateQuestionsAction

void ___GenerateQuestionsAction_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D721D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "BOOLValue");

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
