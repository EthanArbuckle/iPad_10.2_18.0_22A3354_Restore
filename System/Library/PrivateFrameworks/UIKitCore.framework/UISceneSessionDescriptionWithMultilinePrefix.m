@implementation UISceneSessionDescriptionWithMultilinePrefix

void ___UISceneSessionDescriptionWithMultilinePrefix_block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "succinctDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v1, "appendObject:withName:", v2, CFSTR("configuration"));

}

void ___UISceneSessionDescriptionWithMultilinePrefix_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___UISceneSessionDescriptionWithMultilinePrefix_block_invoke_2;
  v4[3] = &unk_1E16B1B50;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v4);

}

@end
