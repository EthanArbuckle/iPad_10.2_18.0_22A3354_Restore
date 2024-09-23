@implementation ICQDetailFollowupSpecification

void __89___ICQDetailFollowupSpecification_postFollowupWithController_replaceExisting_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  objc_super v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleWithKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wordsToReplace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ICQHelperFunctions replaceWordsIn:with:](_ICQHelperFunctions, "replaceWordsIn:with:", v6, v7);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v4, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subTitleWithKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wordsToReplace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ICQHelperFunctions replaceWordsIn:with:](_ICQHelperFunctions, "replaceWordsIn:with:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(void **)(a1 + 32);
  objc_msgSend(v4, "key");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mesgWithKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wordsToReplace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ICQHelperFunctions replaceWordsIn:with:](_ICQHelperFunctions, "replaceWordsIn:with:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "followupTitleTemplates");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ICQHelperFunctions stringFromTemplates:key:](_ICQHelperFunctions, "stringFromTemplates:key:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wordsToReplace");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ICQHelperFunctions replaceWordsIn:with:](_ICQHelperFunctions, "replaceWordsIn:with:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "followupMesgTemplates");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ICQHelperFunctions stringFromTemplates:key:](_ICQHelperFunctions, "stringFromTemplates:key:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wordsToReplace");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  +[_ICQHelperFunctions replaceWordsIn:with:](_ICQHelperFunctions, "replaceWordsIn:with:", v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v41, "length"))
    objc_msgSend(*(id *)(a1 + 32), "setNoteTitle:", v41);
  if (objc_msgSend(v12, "length"))
    objc_msgSend(*(id *)(a1 + 32), "setNoteSubTitle:", v12);
  if (objc_msgSend(v17, "length"))
    objc_msgSend(*(id *)(a1 + 32), "setNoteMessage:", v17);
  if (objc_msgSend(v22, "length"))
    objc_msgSend(*(id *)(a1 + 32), "setTitle:", v22);
  if (objc_msgSend(v27, "length"))
    objc_msgSend(*(id *)(a1 + 32), "setMessage:", v27);
  _ICQGetLogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "noteTitle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v44 = v29;
    _os_log_impl(&dword_1CDEBD000, v28, OS_LOG_TYPE_DEFAULT, "lockScreenTitle = %@", buf, 0xCu);

  }
  _ICQGetLogSystem();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "noteSubTitle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v44 = v31;
    _os_log_impl(&dword_1CDEBD000, v30, OS_LOG_TYPE_DEFAULT, "lockScreenSubTitle = %@", buf, 0xCu);

  }
  _ICQGetLogSystem();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "noteMessage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v44 = v33;
    _os_log_impl(&dword_1CDEBD000, v32, OS_LOG_TYPE_DEFAULT, "lockScreenMessage = %@", buf, 0xCu);

  }
  _ICQGetLogSystem();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "title");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v44 = v35;
    _os_log_impl(&dword_1CDEBD000, v34, OS_LOG_TYPE_DEFAULT, "followupTitle = %@", buf, 0xCu);

  }
  _ICQGetLogSystem();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "message");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v44 = v37;
    _os_log_impl(&dword_1CDEBD000, v36, OS_LOG_TYPE_DEFAULT, "followupMessage = %@", buf, 0xCu);

  }
  v38 = *(_QWORD *)(a1 + 40);
  v39 = *(unsigned __int8 *)(a1 + 56);
  v40 = *(_QWORD *)(a1 + 48);
  v42.receiver = *(id *)(a1 + 32);
  v42.super_class = (Class)_ICQDetailFollowupSpecification;
  objc_msgSendSuper2(&v42, sel_postFollowupWithController_replaceExisting_completion_, v38, v39, v40);

}

@end
