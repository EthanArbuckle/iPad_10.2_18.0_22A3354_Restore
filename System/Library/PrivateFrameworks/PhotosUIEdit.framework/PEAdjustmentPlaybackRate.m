@implementation PEAdjustmentPlaybackRate

- (PEAdjustmentPlaybackRate)initWithPlaybackRate:(float)a3
{
  PEAdjustmentPlaybackRate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PEAdjustmentPlaybackRate;
  result = -[PEAdjustmentPlaybackRate init](&v5, sel_init);
  if (result)
    result->_playbackRate = a3;
  return result;
}

- (int64_t)category
{
  return 11;
}

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, uint64_t, _QWORD);
  uint64_t v17;
  float v18;
  float v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  float v31;
  float v32;
  id v33;
  float v34;
  float v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  float v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, uint64_t, _QWORD))a7;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v44 = v15;
    objc_msgSend(v13, "editSource");
    v17 = objc_claimAutoreleasedReturnValue();
    -[PEAdjustmentPlaybackRate playbackRate](self, "playbackRate");
    v19 = v18;
    v45 = (void *)v17;
    +[PEPlaybackRateOption playbackRateOptionsForEditSource:](PEPlaybackRateOption, "playbackRateOptionsForEditSource:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "playbackRate");
    v23 = v22;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v24 = v20;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v25)
    {
      v26 = v25;
      v27 = vabds_f32(v19, v23);
      v28 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v50 != v28)
            objc_enumerationMutation(v24);
          v30 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v30, "playbackRate");
          v32 = vabds_f32(v31, v19);
          if (v32 < v27)
          {
            v33 = v30;

            v27 = v32;
            v21 = v33;
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v26);
    }

    if (v21)
    {
      objc_msgSend(v21, "playbackRate");
      v35 = v34;
      v36 = objc_msgSend(v14, "isMediaSubtype:", 0x20000);
      v37 = v45;
      if (v35 != 1.0 || (v36 & 1) != 0)
      {
        v39 = (void *)MEMORY[0x24BDB2378];
        objc_msgSend(v45, "videoURL");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "assetWithURL:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = *MEMORY[0x24BE71F10];
        v46[0] = MEMORY[0x24BDAC760];
        v46[1] = 3221225472;
        v46[2] = __127__PEAdjustmentPlaybackRate_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
        v46[3] = &unk_24C619030;
        v48 = v35;
        v47 = v41;
        v43 = v41;
        objc_msgSend(v12, "modifyAdjustmentWithKey:modificationBlock:", v42, v46);

      }
      else
      {
        objc_msgSend(v12, "removeAdjustmentWithKey:", *MEMORY[0x24BE71F10]);
      }
      v15 = v44;
      v16[2](v16, 1, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PEAdjustmentPlaybackRateErrorDomain"), 1, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v16)[2](v16, 0, v38);

      v15 = v44;
      v37 = v45;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PEAdjustmentPlaybackRateErrorDomain"), 0, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v16)[2](v16, 0, v37);
  }

}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (void)setPlaybackRate:(float)a3
{
  self->_playbackRate = a3;
}

void __127__PEAdjustmentPlaybackRate_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(uint64_t a1, void *a2)
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
