@implementation UIWindowSceneDescriptionWithMultilinePrefix

void ___UIWindowSceneDescriptionWithMultilinePrefix_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  void *v21;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("sessionRole"));

  v6 = *(void **)(a1 + 32);
  _NSStringFromUISceneActivationState(objc_msgSend(*(id *)(a1 + 40), "activationState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "appendObject:withName:", v7, CFSTR("activationState"));

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_sceneIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "appendObject:withName:", v10, CFSTR("identifier"));

  objc_msgSend(*(id *)(a1 + 40), "_screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActiveMultilinePrefix:", v13);
  objc_msgSend(v14, "activeMultilinePrefix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = ___UIScreenDescriptionWithMultilinePrefix_block_invoke;
  v19[3] = &unk_1E16B1B50;
  v20 = v14;
  v21 = v12;
  v16 = v14;
  objc_msgSend(v16, "appendBodySectionWithName:multilinePrefix:block:", 0, v15, v19);

  objc_msgSend(v16, "build");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v18, CFSTR("screen"));
}

@end
