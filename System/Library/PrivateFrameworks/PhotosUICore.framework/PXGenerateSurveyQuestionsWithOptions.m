@implementation PXGenerateSurveyQuestionsWithOptions

void __PXGenerateSurveyQuestionsWithOptions_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v7 + 16))(v7, 1, 0);
  }
  else
  {
    v8 = objc_msgSend(v5, "code") - 27;
    PXLocalizedStringFromTable(CFSTR("PXForYouPhotosChallengePlaceholderFailureAlertTitle"), CFSTR("PhotosUICore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 >= 0xA)
    {
      PXLocalizedStringFromTable(CFSTR("PXForYouPhotosChallengePlaceholderFailureAlertMessage"), CFSTR("PhotosUICore"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __PXGenerateSurveyQuestionsWithOptions_block_invoke_2;
      v28[3] = &unk_1E5148CE0;
      v22 = *(void **)(a1 + 32);
      v30 = *(id *)(a1 + 40);
      v29 = v6;
      PXPresentFailureWithLocalizedTitle(v9, v17, 0, v29, v22, v28);

      v21 = v30;
    }
    else
    {
      PXLocalizedStringFromTable(CFSTR("PXForYouPhotosChallengePlaceholderFailureAlertMessageGraph"), CFSTR("PhotosUICore"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "canShowInternalUI");

      if (v12)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "localizedDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@\n\nINTERNAL ONLY:\n%@"), v10, v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v15;
      }
      v16 = *(void **)(a1 + 32);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __PXGenerateSurveyQuestionsWithOptions_block_invoke_3;
      v23[3] = &unk_1E51462E0;
      v24 = v9;
      v17 = v10;
      v25 = v17;
      v27 = *(id *)(a1 + 40);
      v18 = v6;
      v26 = v18;
      objc_msgSend(v16, "presentAlertWithConfigurationHandler:", v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        v20 = *(_QWORD *)(a1 + 40);
        if (v20)
          (*(void (**)(uint64_t, _QWORD, id))(v20 + 16))(v20, 0, v18);
      }

      v21 = v24;
    }

  }
}

uint64_t __PXGenerateSurveyQuestionsWithOptions_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void __PXGenerateSurveyQuestionsWithOptions_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setMessage:", *(_QWORD *)(a1 + 40));
  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __PXGenerateSurveyQuestionsWithOptions_block_invoke_4;
  v6[3] = &unk_1E5148CE0;
  v8 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "addActionWithTitle:style:action:", v5, 0, v6);

}

uint64_t __PXGenerateSurveyQuestionsWithOptions_block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

@end
