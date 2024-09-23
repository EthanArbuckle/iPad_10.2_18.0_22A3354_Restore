@implementation PUPhotoKitMediaProviderAVAssetDownloadSimulation

- (PUPhotoKitMediaProviderAVAssetDownloadSimulation)init
{
  PUPhotoKitMediaProviderAVAssetDownloadSimulation *v2;
  PUPhotoKitMediaProviderAVAssetDownloadSimulation *v3;
  double v4;
  PUPhotoKitMediaProviderAVAssetDownloadSimulation *v5;
  uint64_t v6;
  id internalResultHandler;
  _QWORD v9[4];
  PUPhotoKitMediaProviderAVAssetDownloadSimulation *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUPhotoKitMediaProviderAVAssetDownloadSimulation;
  v2 = -[PUPhotoKitMediaProviderDownloadSimulation init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PUPhotoKitMediaProviderDownloadSimulation downloadDuration](v2, "downloadDuration");
    -[PUPhotoKitMediaProviderDownloadSimulation setDownloadDuration:](v3, "setDownloadDuration:", v4 * 2.5);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__PUPhotoKitMediaProviderAVAssetDownloadSimulation_init__block_invoke;
    v9[3] = &unk_1E58A5610;
    v5 = v3;
    v10 = v5;
    v6 = objc_msgSend(v9, "copy");
    internalResultHandler = v5->_internalResultHandler;
    v5->_internalResultHandler = (id)v6;

  }
  return v3;
}

- (void)_handleResultAVAsset:(id)a3 audioMix:(id)a4 info:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__PUPhotoKitMediaProviderAVAssetDownloadSimulation__handleResultAVAsset_audioMix_info___block_invoke;
  v14[3] = &unk_1E58A9AE0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

- (void)updateSimulationWithProgress:(double)a3
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD, double);
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUPhotoKitMediaProviderAVAssetDownloadSimulation;
  -[PUPhotoKitMediaProviderDownloadSimulation updateSimulationWithProgress:](&v8, sel_updateSimulationWithProgress_);
  -[PUPhotoKitMediaProviderAVAssetDownloadSimulation externalProgressHandler](self, "externalProgressHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7 = 0;
    -[PUPhotoKitMediaProviderAVAssetDownloadSimulation externalProgressHandler](self, "externalProgressHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, char *, _QWORD, double))v6)[2](v6, 0, &v7, 0, a3);

  }
}

- (void)endSimulationWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  id internalResultHandler;
  objc_super v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUPhotoKitMediaProviderAVAssetDownloadSimulation;
  -[PUPhotoKitMediaProviderDownloadSimulation endSimulationWithError:](&v11, sel_endSimulationWithError_, v4);
  -[PUPhotoKitMediaProviderAVAssetDownloadSimulation _resultAVAsset](self, "_resultAVAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoKitMediaProviderAVAssetDownloadSimulation _resultAudioMix](self, "_resultAudioMix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoKitMediaProviderAVAssetDownloadSimulation _resultInfo](self, "_resultInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    v12 = *MEMORY[0x1E0CD1BE8];
    v13[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = 0;
    v6 = 0;
    v7 = (void *)v8;
  }
  -[PUPhotoKitMediaProviderAVAssetDownloadSimulation externalResultHandler](self, "externalResultHandler");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, void *))v9)[2](v9, v5, v6, v7);

  internalResultHandler = self->_internalResultHandler;
  self->_internalResultHandler = 0;

}

- (id)externalProgressHandler
{
  return self->_externalProgressHandler;
}

- (void)setExternalProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)internalProgressHandler
{
  return self->_internalProgressHandler;
}

- (id)externalResultHandler
{
  return self->_externalResultHandler;
}

- (void)setExternalResultHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)internalResultHandler
{
  return self->_internalResultHandler;
}

- (AVAsset)_resultAVAsset
{
  return self->__resultAVAsset;
}

- (void)_setResultAVAsset:(id)a3
{
  objc_storeStrong((id *)&self->__resultAVAsset, a3);
}

- (AVAudioMix)_resultAudioMix
{
  return self->__resultAudioMix;
}

- (void)_setResultAudioMix:(id)a3
{
  objc_storeStrong((id *)&self->__resultAudioMix, a3);
}

- (NSDictionary)_resultInfo
{
  return self->__resultInfo;
}

- (void)_setResultInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__resultInfo, 0);
  objc_storeStrong((id *)&self->__resultAudioMix, 0);
  objc_storeStrong((id *)&self->__resultAVAsset, 0);
  objc_storeStrong(&self->_internalResultHandler, 0);
  objc_storeStrong(&self->_externalResultHandler, 0);
  objc_storeStrong(&self->_internalProgressHandler, 0);
  objc_storeStrong(&self->_externalProgressHandler, 0);
}

uint64_t __87__PUPhotoKitMediaProviderAVAssetDownloadSimulation__handleResultAVAsset_audioMix_info___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setResultAVAsset:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setResultAudioMix:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_setResultInfo:", *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "beginSimulation");
}

uint64_t __56__PUPhotoKitMediaProviderAVAssetDownloadSimulation_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleResultAVAsset:audioMix:info:", a2, a3, a4);
}

@end
