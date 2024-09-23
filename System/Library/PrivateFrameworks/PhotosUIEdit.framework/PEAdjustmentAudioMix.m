@implementation PEAdjustmentAudioMix

- (PEAdjustmentAudioMix)initWithAudioMix:(id)a3
{
  id v5;
  PEAdjustmentAudioMix *v6;
  PEAdjustmentAudioMix *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PEAdjustmentAudioMix;
  v6 = -[PEAdjustmentAudioMix init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_audioMix, a3);

  return v7;
}

- (int64_t)category
{
  return 12;
}

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  _QWORD v24[5];

  v23 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a7;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = 0;
LABEL_10:
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("PEAdjustmentAudioMixErrorDomain"), v21, 0, v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v12);
    goto LABEL_16;
  }
  if ((PICinematicAudioIsRenderSupported() & 1) == 0)
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = 2;
    goto LABEL_10;
  }
  objc_msgSend(v10, "editSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = (void *)MEMORY[0x24BDB2378];
    objc_msgSend(v12, "videoURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assetWithURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(MEMORY[0x24BE6C438], "assetIsCinematicAudio:", v15) & 1) != 0)
    {
      v16 = objc_msgSend(MEMORY[0x24BE71C38], "assetIsCinematicVideo:", v15);
      -[PEAdjustmentAudioMix audioMix](self, "audioMix");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BE71D88]);

      v19 = *MEMORY[0x24BE71D70];
      if (!v18 || (v16 & 1) != 0)
      {
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __123__PEAdjustmentAudioMix_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
        v24[3] = &unk_24C6186B8;
        v24[4] = self;
        objc_msgSend(v23, "modifyAdjustmentWithKey:modificationBlock:", v19, v24, v23);
      }
      else
      {
        objc_msgSend(v23, "removeAdjustmentWithKey:", v19);
      }
      v11[2](v11, 1, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PEAdjustmentAudioMixErrorDomain"), 1, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, 0, v22);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PEAdjustmentAudioMixErrorDomain"), 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v15);
  }

LABEL_16:
}

- (NSString)audioMix
{
  return self->_audioMix;
}

- (void)setAudioMix:(id)a3
{
  objc_storeStrong((id *)&self->_audioMix, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioMix, 0);
}

void __123__PEAdjustmentAudioMix_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reset");

  objc_msgSend(v3, "setEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "audioMix");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRenderingStyle:", v5);

}

@end
