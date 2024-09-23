@implementation PEPlaybackRateAction

- (void)applyToLoadResult:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  void *v9;
  double v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  char v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  float v34;
  uint64_t v35;
  uint64_t v36;
  BOOL (*v37)(uint64_t, void *);
  void *v38;
  float v39;
  uint8_t buf[4];
  double v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  PLPhotoEditGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138543362;
    v41 = v10;
    _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_INFO, "PEPlaybackRateAction: applyToLoadResult on asset: %{public}@", buf, 0xCu);

  }
  objc_msgSend(v6, "compositionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEPlaybackRateAction playbackRate](self, "playbackRate");
  v13 = v12;
  objc_msgSend(v6, "editSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PEPlaybackRateOption playbackRateOptionsForEditSource:](PEPlaybackRateOption, "playbackRateOptionsForEditSource:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x24BDAC760];
  v35 = MEMORY[0x24BDAC760];
  v36 = 3221225472;
  v37 = __53__PEPlaybackRateAction_applyToLoadResult_completion___block_invoke;
  v38 = &__block_descriptor_36_e30_B16__0__PEPlaybackRateOption_8l;
  v39 = v13;
  if ((PFExists() & 1) != 0)
  {
    objc_msgSend(v6, "originalComposition");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BE71F10];
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x24BE71F10]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 != 0;

    objc_msgSend(v6, "asset");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "asset");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isMediaSubtype:", 0x20000);
      if (v19)
        v20 = 1;
      else
        v20 = v24;

    }
    if (v13 != 1.0 || v20)
    {
      objc_msgSend(v6, "contentEditingInput");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "audiovisualAsset");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v32[0] = v16;
      v32[1] = 3221225472;
      v32[2] = __53__PEPlaybackRateAction_applyToLoadResult_completion___block_invoke_299;
      v32[3] = &unk_24C619030;
      v34 = v13;
      v33 = v30;
      v31 = v30;
      objc_msgSend(v11, "modifyAdjustmentWithKey:modificationBlock:", v18, v32);

    }
    else
    {
      objc_msgSend(v11, "removeAdjustmentWithKey:", v18);
    }
    v28 = 1;
  }
  else
  {
    PLPhotoEditGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "asset");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v41 = v13;
      v42 = 2114;
      v43 = v27;
      _os_log_impl(&dword_20D13D000, v25, OS_LOG_TYPE_ERROR, "PEPlaybackRateAction: playback rate: %f is not supported on asset: %{public}@", buf, 0x16u);

    }
    v28 = 0;
  }
  v7[2](v7, v28);

}

- (int64_t)actionType
{
  return 7;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (void)setPlaybackRate:(float)a3
{
  self->_playbackRate = a3;
}

BOOL __53__PEPlaybackRateAction_applyToLoadResult_completion___block_invoke(uint64_t a1, void *a2)
{
  float v3;

  objc_msgSend(a2, "playbackRate");
  return v3 == *(float *)(a1 + 32);
}

void __53__PEPlaybackRateAction_applyToLoadResult_completion___block_invoke_299(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  CMTime v6;
  CMTimeRange range;
  CMTime v8;
  __int128 v9;
  CMTimeEpoch epoch;
  CMTimeRange v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(v3, "setRate:", *(float *)(a1 + 40));
  if (v3)
  {
    objc_msgSend(v3, "startTime");
    if ((v14 & 0x100000000) != 0)
    {
      objc_msgSend(v3, "endTime");
      if ((v12 & 1) != 0)
        goto LABEL_9;
    }
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
  }
  objc_msgSend(MEMORY[0x24BE72470], "defaultSlowMotionAdjustmentsForAsset:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  memset(&v11, 0, sizeof(v11));
  if (v4)
    objc_msgSend(v4, "slowMotionTimeRange");
  v9 = *(_OWORD *)&v11.start.value;
  epoch = v11.start.epoch;
  objc_msgSend(v3, "setStartTime:", &v9);
  range = v11;
  CMTimeRangeGetEnd(&v8, &range);
  v6 = v8;
  objc_msgSend(v3, "setEndTime:", &v6);

LABEL_9:
}

@end
