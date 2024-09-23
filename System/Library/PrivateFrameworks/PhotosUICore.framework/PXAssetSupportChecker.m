@implementation PXAssetSupportChecker

+ (void)_alertTitleAndMessageForAsset:(id)a3 type:(int64_t)a4 title:(id *)a5 message:(id *)a6
{
  id v11;
  uint64_t v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v11 = a3;
  v19 = v11;
  if (a5)
  {
    if (a6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetSupportChecker.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

    v11 = v19;
    if (a6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetSupportChecker.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

  v11 = v19;
LABEL_3:
  v12 = objc_msgSend(v11, "mediaType");
  if (v12 == 1)
  {
    v13 = 1;
  }
  else
  {
    if (v12 != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetSupportChecker.m"), 46, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v13 = 0;
  }
  if (a4 == 1)
  {
    PXLocalizedStringFromTable(CFSTR("PXAssetSupportChecker_UnsupportedFormat_Playback_Video_Title"), CFSTR("PhotosUICore"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("PXAssetSupportChecker_UnsupportedFormat_Playback_Video_Message");
LABEL_17:
    PXLocalizedStringFromTable(v15, CFSTR("PhotosUICore"));
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (!a4)
  {
    if (v13)
      v14 = CFSTR("PXAssetSupportChecker_UnsupportedFormat_Edit_Photo_Title");
    else
      v14 = CFSTR("PXAssetSupportChecker_UnsupportedFormat_Edit_Video_Title");
    if (v13)
      v15 = CFSTR("PXAssetSupportChecker_UnsupportedFormat_Edit_Photo_Message");
    else
      v15 = CFSTR("PXAssetSupportChecker_UnsupportedFormat_Edit_Video_Message");
    PXLocalizedStringFromTable(v14, CFSTR("PhotosUICore"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
LABEL_18:

}

+ (void)_presentAlertWithTitle:(id)a3 message:(id)a4 knowledgeBaseURL:(id)a5 alertControllerPresenter:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  uint64_t (**v16)(id, void *);
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD);
  void *v28;
  char v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (uint64_t (**)(id, void *))a6;
  v17 = a7;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetSupportChecker.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("knowledgeBaseURL"));

  }
  v31 = v13;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v13, v14, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXAssetSupportChecker_UnsupportedFormat_Alert_MoreInfoButton"), CFSTR("PhotosUICore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __116__PXAssetSupportChecker__presentAlertWithTitle_message_knowledgeBaseURL_alertControllerPresenter_completionHandler___block_invoke;
  v34[3] = &unk_1E5138AE0;
  v22 = v15;
  v35 = v22;
  v23 = v17;
  v36 = v23;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, v34);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v24);

  v25 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXAssetSupportChecker_UnsupportedFormat_Alert_OkButton"), CFSTR("PhotosUICore"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v21;
  v32[1] = 3221225472;
  v32[2] = __116__PXAssetSupportChecker__presentAlertWithTitle_message_knowledgeBaseURL_alertControllerPresenter_completionHandler___block_invoke_3;
  v32[3] = &unk_1E5142658;
  v27 = (void (**)(_QWORD))v23;
  v33 = v27;
  objc_msgSend(v25, "actionWithTitle:style:handler:", v26, 0, v32);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v28);

  v29 = v16[2](v16, v18);
  if (v27 && (v29 & 1) == 0)
    v27[2](v27);

}

+ (BOOL)isSupportedAsset:(id)a3 type:(int64_t)a4
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  char v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__PXAssetSupportChecker_isSupportedAsset_type___block_invoke;
  v9[3] = &unk_1E511C450;
  v11 = &v12;
  v6 = v5;
  v10 = v6;
  +[PXAssetSupportChecker checkIsSupportedAsset:type:completionHandler:](PXAssetSupportChecker, "checkIsSupportedAsset:type:completionHandler:", v4, 0, v9);
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (void)checkIsSupportedAsset:(id)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandler___block_invoke;
  v10[3] = &unk_1E511C478;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "checkIsSupportedAsset:type:completionHandlerWithReason:", a3, a4, v10);

}

+ (void)checkIsSupportedAsset:(id)a3 type:(int64_t)a4 completionHandlerWithReason:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v12;
  uint64_t v13;
  id v14;
  void (**v15)(void *, uint64_t, _QWORD);
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  void (**v24)(void *, uint64_t, _QWORD);
  _QWORD aBlock[4];
  id v26;
  void (**v27)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);

  v9 = a3;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetSupportChecker.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayAsset"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetSupportChecker.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  v12 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandlerWithReason___block_invoke;
    aBlock[3] = &unk_1E511C4A0;
    v14 = v12;
    v26 = v14;
    v27 = v11;
    v15 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
    if (a4 || (objc_msgSend(v14, "isVideo") & 1) == 0)
    {
      v15[2](v15, 1, 0);
    }
    else
    {
      v16 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
      objc_msgSend(v16, "setSynchronous:", 1);
      objc_msgSend(v16, "setVersion:", 2);
      objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v13;
      v21[1] = 3221225472;
      v21[2] = __80__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandlerWithReason___block_invoke_2;
      v21[3] = &unk_1E511C518;
      v24 = v15;
      v22 = v16;
      v23 = v14;
      v18 = v16;
      objc_msgSend(v17, "requestAVProxyForAsset:options:resultHandler:", v23, v18, v21);

    }
  }
  else
  {
    v11[2](v11, 1, 0, 0, 0);
  }

}

+ (void)presentAlertWithTitle:(id)a3 message:(id)a4 uti:(id)a5 codecName:(id)a6 alertControllerPresenter:(id)a7 completionHandler:(id)a8
{
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  id v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v15 = a3;
  v16 = a4;
  v17 = (unint64_t)a5;
  v18 = (unint64_t)a6;
  v19 = a7;
  v20 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetSupportChecker.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

    if (v19)
      goto LABEL_4;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetSupportChecker.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  if (!v16)
    goto LABEL_9;
LABEL_3:
  if (v19)
    goto LABEL_4;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetSupportChecker.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alertControllerPresenter"));

LABEL_4:
  if (v17 | v18)
  {
    +[PXMediaTypeInfoManager sharedManager](PXMediaTypeInfoManager, "sharedManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(double *)&PXMediaTypeInfoManagerDefaultTimeout;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __112__PXAssetSupportChecker_presentAlertWithTitle_message_uti_codecName_alertControllerPresenter_completionHandler___block_invoke;
    v27[3] = &unk_1E511C540;
    v32 = a1;
    v28 = v15;
    v29 = v16;
    v30 = v19;
    v31 = v20;
    objc_msgSend(v21, "mediaTypeInfoURLForUTI:codecName:timeout:completionHandler:", v17, v18, v27, v22);

  }
  else
  {
    +[PXMediaTypeInfoManager knowledgeBaseFallbackURL](PXMediaTypeInfoManager, "knowledgeBaseFallbackURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_presentAlertWithTitle:message:knowledgeBaseURL:alertControllerPresenter:completionHandler:", v15, v16, v23, v19, v20);

  }
}

+ (void)presentAlertForAsset:(id)a3 type:(int64_t)a4 alertControllerPresenter:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetSupportChecker.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayAsset"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetSupportChecker.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alertControllerPresenter"));

LABEL_3:
  v22 = 0;
  v23 = 0;
  objc_msgSend(a1, "_alertTitleAndMessageForAsset:type:title:message:", v11, a4, &v23, &v22);
  v14 = v23;
  v15 = v22;
  v16 = v15;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetSupportChecker.m"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

    if (v16)
      goto LABEL_5;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetSupportChecker.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

    goto LABEL_5;
  }
  if (!v15)
    goto LABEL_9;
LABEL_5:
  +[PXMediaTypeInfoManager knowledgeBaseFallbackURL](PXMediaTypeInfoManager, "knowledgeBaseFallbackURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_presentAlertWithTitle:message:knowledgeBaseURL:alertControllerPresenter:completionHandler:", v14, v16, v17, v12, v13);

}

+ (void)checkIsSupportedAndPresentAlertForAsset:(id)a3 type:(int64_t)a4 alertControllerPresenter:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  int64_t v25;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetSupportChecker.m"), 211, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alertControllerPresenter"));

    if (v13)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetSupportChecker.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXAssetSupportChecker.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayAsset"));

  if (!v12)
    goto LABEL_6;
LABEL_3:
  if (!v13)
    goto LABEL_7;
LABEL_4:
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __113__PXAssetSupportChecker_checkIsSupportedAndPresentAlertForAsset_type_alertControllerPresenter_completionHandler___block_invoke;
  v20[3] = &unk_1E511C568;
  v24 = a1;
  v25 = a4;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  objc_msgSend(a1, "checkIsSupportedAsset:type:completionHandlerWithReason:", v16, a4, v20);

}

void __113__PXAssetSupportChecker_checkIsSupportedAndPresentAlertForAsset_type_alertControllerPresenter_completionHandler___block_invoke(uint64_t a1, char a2, void *a3, void *a4, uint64_t a5)
{
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v9 = a3;
  v10 = a4;
  if ((a2 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 64);
    v22 = 0;
    v23 = 0;
    objc_msgSend(v12, "_alertTitleAndMessageForAsset:type:title:message:", v11, v13, &v23, &v22);
    v14 = v23;
    v15 = v22;
    if (PFOSVariantHasInternalDiagnostics())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n[INTERNAL ONLY]"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 | v10)
      {
        objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(" uti:%@ codecName:%@"), v9, v10);
        v17 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v17;
      }
      if ((unint64_t)(a5 - 2) > 7)
      {
        v15 = v16;
      }
      else
      {
        objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("\n%@"), off_1E511C588[a5 - 2]);
        v15 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __113__PXAssetSupportChecker_checkIsSupportedAndPresentAlertForAsset_type_alertControllerPresenter_completionHandler___block_invoke_2;
    v20[3] = &unk_1E5148A40;
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(void **)(a1 + 56);
    v21 = *(id *)(a1 + 48);
    objc_msgSend(v19, "presentAlertWithTitle:message:uti:codecName:alertControllerPresenter:completionHandler:", v14, v15, v9, v10, v18, v20);

  }
}

uint64_t __113__PXAssetSupportChecker_checkIsSupportedAndPresentAlertForAsset_type_alertControllerPresenter_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __112__PXAssetSupportChecker_presentAlertWithTitle_message_uti_codecName_alertControllerPresenter_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 64), "_presentAlertWithTitle:message:knowledgeBaseURL:alertControllerPresenter:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __80__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandlerWithReason___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (!a2)
  {
    v5 = 0;
    goto LABEL_5;
  }
  v3 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  v4 = objc_msgSend(MEMORY[0x1E0CD1390], "isOriginalKnownUnsupportedFormatForAsset:failureInfo:", v3, &v8);
  v5 = v8;
  if (v4)
  {
LABEL_5:
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD18C8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD18C0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    goto LABEL_6;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_6:

}

void __80__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandlerWithReason___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  if (a2)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0D71260], "isAVAssetEditable:reason:", a2, &v12);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    return;
  }
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD1D80]))
  {

    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 != 3164)
  {
LABEL_7:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "setNetworkAccessAllowed:", 1);
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandlerWithReason___block_invoke_3;
  v10[3] = &unk_1E511C4F0;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v7, "requestAVProxyForAsset:options:resultHandler:", v8, v9, v10);

LABEL_8:
}

void __80__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandlerWithReason___block_invoke_3(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = 0;
  if (a2)
  {
    v3 = objc_msgSend(MEMORY[0x1E0D71260], "isAVAssetEditable:reason:", a2, &v10);
    v4 = v10;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandlerWithReason___block_invoke_4;
  v6[3] = &unk_1E511C4C8;
  v5 = *(id *)(a1 + 32);
  v9 = v3;
  v7 = v5;
  v8 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __80__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandlerWithReason___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __70__PXAssetSupportChecker_checkIsSupportedAsset_type_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__PXAssetSupportChecker_isSupportedAsset_type___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __116__PXAssetSupportChecker__presentAlertWithTitle_message_knowledgeBaseURL_alertControllerPresenter_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __116__PXAssetSupportChecker__presentAlertWithTitle_message_knowledgeBaseURL_alertControllerPresenter_completionHandler___block_invoke_2;
  v4[3] = &unk_1E513FE10;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "openURL:withCompletionHandler:", v3, v4);

}

uint64_t __116__PXAssetSupportChecker__presentAlertWithTitle_message_knowledgeBaseURL_alertControllerPresenter_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __116__PXAssetSupportChecker__presentAlertWithTitle_message_knowledgeBaseURL_alertControllerPresenter_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
