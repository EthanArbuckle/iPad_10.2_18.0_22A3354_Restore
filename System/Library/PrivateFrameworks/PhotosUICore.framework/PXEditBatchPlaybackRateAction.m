@implementation PXEditBatchPlaybackRateAction

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
  int v14;
  int v15;
  void *v16;
  double v17;
  _QWORD v18[4];
  void (**v19)(id, _QWORD, void *);
  id v20;
  id buf;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
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
      v22 = *MEMORY[0x1E0CB2938];
      v23 = CFSTR("Could not complete PXEditBatchPlaybackRateAction: Edit manager is busy.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("PXEditBatchActionErrorDomain"), 1, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      PLUIGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchPlaybackRateAction: Edit manager is busy.", (uint8_t *)&buf, 2u);
      }

      v4[2](v4, 0, v9);
    }
    else
    {
      -[PXEditBatchAction syncAssets](self, "syncAssets");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXEditBatchAction willBeginActionIsAsync:itemCount:](self, "willBeginActionIsAsync:itemCount:", 0, objc_msgSend(v9, "count"));
      objc_initWeak(&buf, self);
      -[PXEditBatchPlaybackRateAction playbackRate](self, "playbackRate");
      v15 = v14;
      -[PXEditBatchAction syncProgress](self, "syncProgress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __47__PXEditBatchPlaybackRateAction_performAction___block_invoke;
      v18[3] = &unk_1E513A660;
      objc_copyWeak(&v20, &buf);
      v19 = v4;
      LODWORD(v17) = v15;
      objc_msgSend(v6, "setPlaybackRateOnAssets:playbackRate:async:progress:completion:", v9, 0, v16, v18, v17);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&buf);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2938];
    v25[0] = CFSTR("Could not complete PXEditBatchPlaybackRateAction: No asset found");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PXEditBatchActionErrorDomain"), 2, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Could not complete PXEditBatchPlaybackRateAction: No asset found", (uint8_t *)&buf, 2u);
    }

    v4[2](v4, 0, v6);
  }

}

- (void)_syncSetPlaybackRateDidFinishWithResults:(id)a3 didCancel:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  double v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
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
    -[PXEditBatchPlaybackRateAction playbackRate](self, "playbackRate");
    v14 = v13;
    -[PXEditBatchAction asyncProgress](self, "asyncProgress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __102__PXEditBatchPlaybackRateAction__syncSetPlaybackRateDidFinishWithResults_didCancel_completionHandler___block_invoke;
    v17[3] = &unk_1E513A688;
    v18 = v8;
    objc_copyWeak(&v20, &location);
    v19 = v9;
    LODWORD(v16) = v14;
    objc_msgSend(v12, "setPlaybackRateOnAssets:playbackRate:async:progress:completion:", v11, 1, v15, v17, v16);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

}

- (id)_playbackRateTitle
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v3, "setNumberStyle:", 3);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[PXEditBatchPlaybackRateAction playbackRate](self, "playbackRate");
  objc_msgSend(v4, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedActionName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PXEditBatchPlaybackRateAction _playbackRateTitle](self, "_playbackRateTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Playback Rate %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedProgressToastOngoingTitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PXEditBatchPlaybackRateAction _playbackRateTitle](self, "_playbackRateTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Setting Playback Rate to %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedProgressToastSuccessTitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PXEditBatchPlaybackRateAction _playbackRateTitle](self, "_playbackRateTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Playback Rate %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedProgressToastUndoTitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PXEditBatchPlaybackRateAction _playbackRateTitle](self, "_playbackRateTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Undoing Playback Rate %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedProgressToastRedoTitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PXEditBatchPlaybackRateAction _playbackRateTitle](self, "_playbackRateTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Redoing Playback Rate %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (void)setPlaybackRate:(float)a3
{
  self->_playbackRate = a3;
}

void __102__PXEditBatchPlaybackRateAction__syncSetPlaybackRateDidFinishWithResults_didCancel_completionHandler___block_invoke(uint64_t a1, void *a2)
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

void __47__PXEditBatchPlaybackRateAction_performAction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_syncSetPlaybackRateDidFinishWithResults:didCancel:completionHandler:", v6, a3, *(_QWORD *)(a1 + 32));

}

@end
