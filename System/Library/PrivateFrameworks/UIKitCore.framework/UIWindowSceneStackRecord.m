@implementation UIWindowSceneStackRecord

void __67___UIWindowSceneStackRecord_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v2 = *(void **)(a1 + 32);
  _NSStringFromUIKeyWindowEvaluationStrategy(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("evaluationStrategy"));

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUInt64:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("lastPushedTime"));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActiveMultilinePrefix:", v7);
  objc_msgSend(v8, "activeMultilinePrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ___UIWindowSceneDescriptionWithMultilinePrefix_block_invoke;
  v13[3] = &unk_1E16B1B50;
  v14 = v8;
  v15 = v6;
  v10 = v8;
  objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", 0, v9, v13);

  objc_msgSend(v10, "build");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v12, CFSTR("windowScene"));
}

void __67___UIWindowSceneStackRecord_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67___UIWindowSceneStackRecord_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

@end
