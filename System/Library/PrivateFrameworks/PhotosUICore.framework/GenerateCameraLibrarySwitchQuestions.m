@implementation GenerateCameraLibrarySwitchQuestions

uint64_t ___GenerateCameraLibrarySwitchQuestions_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0D721A8];
  v16[0] = *MEMORY[0x1E0D721E0];
  v16[1] = v4;
  v17[0] = &unk_1E53EDAA0;
  v17[1] = &unk_1E53EDAB8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoAnalysisClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = ___GenerateCameraLibrarySwitchQuestions_block_invoke_366;
  v14 = &unk_1E512C8E8;
  v15 = v3;
  v8 = v3;
  objc_msgSend(v7, "requestGenerateQuestionsWithOptions:reply:", v5, &v11);

  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSurveyQuestionsHideDate:", 0);

  return 1;
}

void ___GenerateCameraLibrarySwitchQuestions_block_invoke_366(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __CFString *v14;
  _QWORD block[4];
  __CFString *v16;
  __CFString *v17;
  id v18;

  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D721D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) != 0)
  {
    v8 = CFSTR("Generated new Photos Challenges questions, available in the For You tab.");
  }
  else
  {
    objc_msgSend(v5, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v5, "description");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    if (objc_msgSend(v13, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to generate questions: %@"), v13);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("Failed to generate questions.");
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___GenerateCameraLibrarySwitchQuestions_block_invoke_2;
  block[3] = &unk_1E51457C8;
  v16 = CFSTR("Camera Library Switch Questions");
  v17 = v8;
  v18 = *(id *)(a1 + 32);
  v14 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void ___GenerateCameraLibrarySwitchQuestions_block_invoke_2(uint64_t a1)
{
  _PresentAlert(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
}

@end
