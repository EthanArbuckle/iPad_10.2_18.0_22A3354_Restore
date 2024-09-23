@implementation PXEditBatchAudioMixModeAction

- (void)performAction:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(id, _QWORD, void *);
  id v18;
  id buf;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  -[PXEditBatchAction assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[PXEditBatchAction manager](self, "manager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isBusyWithBatchAction"))
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2938];
      v21 = CFSTR("Could not complete PXEditBatchAudioMixModeAction: Edit manager is busy.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("PXEditBatchActionErrorDomain"), 1, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      PLUIGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchAudioMixModeAction: Edit manager is busy.", (uint8_t *)&buf, 2u);
      }

      v4[2](v4, 0, v9);
    }
    else
    {
      -[PXEditBatchAction syncAssets](self, "syncAssets");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXEditBatchAction willBeginActionIsAsync:itemCount:](self, "willBeginActionIsAsync:itemCount:", 0, objc_msgSend(v9, "count"));
      objc_initWeak(&buf, self);
      -[PXEditBatchAudioMixModeAction audioMixMode](self, "audioMixMode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXEditBatchAction syncProgress](self, "syncProgress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __47__PXEditBatchAudioMixModeAction_performAction___block_invoke;
      v16[3] = &unk_1E513A660;
      objc_copyWeak(&v18, &buf);
      v17 = v4;
      objc_msgSend(v6, "setAudioMixModeOnAssets:audioMixMode:async:progress:completion:", v9, v14, 0, v15, v16);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&buf);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2938];
    v23[0] = CFSTR("Could not complete PXEditBatchAudioMixModeAction: No asset found");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PXEditBatchActionErrorDomain"), 2, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchAudioMixModeAction: No asset found", (uint8_t *)&buf, 2u);
    }

    v4[2](v4, 0, v6);
  }

}

- (void)_syncSetAudioMixModeDidFinishWithResults:(id)a3 didCancel:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a5;
  -[PXEditBatchAction asyncAssets](self, "asyncAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a4 || !objc_msgSend(v10, "count"))
  {
    -[PXEditBatchAction saveResults:completion:](self, "saveResults:completion:", v8, v9);
  }
  else
  {
    objc_initWeak(&location, self);
    -[PXEditBatchAction willBeginActionIsAsync:itemCount:](self, "willBeginActionIsAsync:itemCount:", 1, objc_msgSend(v11, "count"));
    -[PXEditBatchAction manager](self, "manager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXEditBatchAudioMixModeAction audioMixMode](self, "audioMixMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXEditBatchAction asyncProgress](self, "asyncProgress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __102__PXEditBatchAudioMixModeAction__syncSetAudioMixModeDidFinishWithResults_didCancel_completionHandler___block_invoke;
    v15[3] = &unk_1E513A688;
    v16 = v8;
    objc_copyWeak(&v18, &location);
    v17 = v9;
    objc_msgSend(v12, "setAudioMixModeOnAssets:audioMixMode:async:progress:completion:", v11, v13, 1, v14, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

- (id)audioMixModeTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D7CB50];
  -[PXEditBatchAudioMixModeAction audioMixMode](self, "audioMixMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioMixModeForRenderingStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedActionName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  PXLocalizedStringFromTable(CFSTR("PhotoEditAudioMixActionName"), CFSTR("SpatialAudio"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[PXEditBatchAudioMixModeAction audioMixModeTitle](self, "audioMixModeTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedProgressToastOngoingTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  PXLocalizedStringFromTable(CFSTR("PhotoEditAudioMixProgressTitle"), CFSTR("SpatialAudio"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[PXEditBatchAudioMixModeAction audioMixModeTitle](self, "audioMixModeTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedProgressToastSuccessTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  PXLocalizedStringFromTable(CFSTR("PhotoEditAudioMixSuccessTitle"), CFSTR("SpatialAudio"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[PXEditBatchAudioMixModeAction audioMixModeTitle](self, "audioMixModeTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedProgressToastUndoTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  PXLocalizedStringFromTable(CFSTR("PhotoEditAudioMixUndoTitle"), CFSTR("SpatialAudio"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[PXEditBatchAudioMixModeAction audioMixModeTitle](self, "audioMixModeTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedProgressToastRedoTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  PXLocalizedStringFromTable(CFSTR("PhotoEditAudioMixRedoTitle"), CFSTR("SpatialAudio"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[PXEditBatchAudioMixModeAction audioMixModeTitle](self, "audioMixModeTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)audioMixMode
{
  return self->_audioMixMode;
}

- (void)setAudioMixMode:(id)a3
{
  objc_storeStrong((id *)&self->_audioMixMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioMixMode, 0);
  objc_storeStrong((id *)&self->_audioMixModeTitle, 0);
}

void __102__PXEditBatchAudioMixModeAction__syncSetAudioMixModeDidFinishWithResults_didCancel_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id WeakRetained;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v6 = (id)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v6, "addObjectsFromArray:", v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "saveResults:completion:", v6, *(_QWORD *)(a1 + 40));

}

void __47__PXEditBatchAudioMixModeAction_performAction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_syncSetAudioMixModeDidFinishWithResults:didCancel:completionHandler:", v6, a3, *(_QWORD *)(a1 + 32));

}

@end
