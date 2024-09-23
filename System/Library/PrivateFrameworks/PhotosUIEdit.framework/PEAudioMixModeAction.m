@implementation PEAudioMixModeAction

- (void)applyToLoadResult:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  PLPhotoEditGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v10;
    _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_INFO, "PEAudioMixModeAction: applyToLoadResult on asset: %{public}@", buf, 0xCu);

  }
  objc_msgSend(v6, "compositionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentEditingInput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "audiovisualAsset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x24BE6C438], "assetIsCinematicAudio:", v13) & 1) != 0)
  {
    v14 = objc_msgSend(MEMORY[0x24BE71C38], "assetIsCinematicVideo:", v13);
    -[PEAudioMixModeAction audioMixMode](self, "audioMixMode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BE71D88]);
    v17 = *MEMORY[0x24BE71D70];
    if (!v16 || (v14 & 1) != 0)
    {
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __53__PEAudioMixModeAction_applyToLoadResult_completion___block_invoke;
      v21[3] = &unk_24C6186B8;
      v21[4] = self;
      objc_msgSend(v11, "modifyAdjustmentWithKey:modificationBlock:", v17, v21);
    }
    else
    {
      objc_msgSend(v11, "removeAdjustmentWithKey:", v17);
    }
    v7[2](v7, 1);

  }
  else
  {
    PLPhotoEditGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "asset");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v20;
      _os_log_impl(&dword_20D13D000, v18, OS_LOG_TYPE_ERROR, "PEAudioMixModeAction: audio mix modes not supported on asset: %{public}@", buf, 0xCu);

    }
    v7[2](v7, 0);
  }

}

- (int64_t)actionType
{
  return 8;
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
}

void __53__PEAudioMixModeAction_applyToLoadResult_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "audioMixMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRenderingStyle:", v3);

  objc_msgSend(v4, "setDialogMixBias:", 1.0);
}

@end
