@implementation UIPhysicalButtonBSAction

void __67___UIPhysicalButtonBSAction_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
{
  void *v2;
  void *v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;

  v2 = (void *)a1[2].i64[0];
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67___UIPhysicalButtonBSAction_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v5 = a1[2];
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __67___UIPhysicalButtonBSAction_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  _NSStringFromUIPhysicalButtonActionSetting(0);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  _NSStringFromUIPhysicalButton(objc_msgSend(*(id *)(a1 + 32), "button"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", v2, v15);
  _NSStringFromUIPhysicalButtonActionSetting(1uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _NSStringFromUIPhysicalButtonBehavior(objc_msgSend(*(id *)(a1 + 32), "behavior"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", v4, v3);
  _NSStringFromUIPhysicalButtonActionSetting(3uLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _NSStringFromUIPhysicalButtonState(objc_msgSend(*(id *)(a1 + 32), "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", v6, v5);
  v7 = *(void **)(a1 + 40);
  v8 = objc_msgSend(*(id *)(a1 + 32), "generation");
  _NSStringFromUIPhysicalButtonActionSetting(2uLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "appendUInt64:withName:", v8, v9);

  v11 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "info");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "succinctDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v11, "appendObject:withName:", v13, CFSTR("settings"));

}

@end
