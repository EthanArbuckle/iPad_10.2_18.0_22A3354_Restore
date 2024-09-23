@implementation PUPhotoKitMediaProviderPlayerItemDownloadSimulation

- (PUPhotoKitMediaProviderPlayerItemDownloadSimulation)init
{
  PUPhotoKitMediaProviderPlayerItemDownloadSimulation *v2;
  PUPhotoKitMediaProviderPlayerItemDownloadSimulation *v3;
  double v4;
  PUPhotoKitMediaProviderPlayerItemDownloadSimulation *v5;
  uint64_t v6;
  id internalResultHandler;
  _QWORD v9[4];
  PUPhotoKitMediaProviderPlayerItemDownloadSimulation *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUPhotoKitMediaProviderPlayerItemDownloadSimulation;
  v2 = -[PUPhotoKitMediaProviderDownloadSimulation init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PUPhotoKitMediaProviderDownloadSimulation downloadDuration](v2, "downloadDuration");
    -[PUPhotoKitMediaProviderDownloadSimulation setDownloadDuration:](v3, "setDownloadDuration:", v4 * 2.5);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__PUPhotoKitMediaProviderPlayerItemDownloadSimulation_init__block_invoke;
    v9[3] = &unk_1E58A55E8;
    v5 = v3;
    v10 = v5;
    v6 = objc_msgSend(v9, "copy");
    internalResultHandler = v5->_internalResultHandler;
    v5->_internalResultHandler = (id)v6;

  }
  return v3;
}

- (void)_handleResultPlayerItem:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PUPhotoKitMediaProviderPlayerItemDownloadSimulation__handleResultPlayerItem_info___block_invoke;
  block[3] = &unk_1E58AB790;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)updateSimulationWithProgress:(double)a3
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD, double);
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUPhotoKitMediaProviderPlayerItemDownloadSimulation;
  -[PUPhotoKitMediaProviderDownloadSimulation updateSimulationWithProgress:](&v8, sel_updateSimulationWithProgress_);
  -[PUPhotoKitMediaProviderPlayerItemDownloadSimulation externalProgressHandler](self, "externalProgressHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7 = 0;
    -[PUPhotoKitMediaProviderPlayerItemDownloadSimulation externalProgressHandler](self, "externalProgressHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, char *, _QWORD, double))v6)[2](v6, 0, &v7, 0, a3);

  }
}

- (void)endSimulationWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id internalResultHandler;
  objc_super v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUPhotoKitMediaProviderPlayerItemDownloadSimulation;
  -[PUPhotoKitMediaProviderDownloadSimulation endSimulationWithError:](&v10, sel_endSimulationWithError_, v4);
  -[PUPhotoKitMediaProviderPlayerItemDownloadSimulation _resultPlayerItem](self, "_resultPlayerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoKitMediaProviderPlayerItemDownloadSimulation _resultInfo](self, "_resultInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    v11 = *MEMORY[0x1E0CD1BE8];
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = 0;
    v6 = (void *)v7;
  }
  -[PUPhotoKitMediaProviderPlayerItemDownloadSimulation externalResultHandler](self, "externalResultHandler");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *))v8)[2](v8, v5, v6);

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

- (AVPlayerItem)_resultPlayerItem
{
  return self->__resultPlayerItem;
}

- (void)_setResultPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->__resultPlayerItem, a3);
}

- (NSDictionary)_resultInfo
{
  return self->__resultInfo;
}

- (void)_setResultInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__resultInfo, 0);
  objc_storeStrong((id *)&self->__resultPlayerItem, 0);
  objc_storeStrong(&self->_internalResultHandler, 0);
  objc_storeStrong(&self->_externalResultHandler, 0);
  objc_storeStrong(&self->_internalProgressHandler, 0);
  objc_storeStrong(&self->_externalProgressHandler, 0);
}

uint64_t __84__PUPhotoKitMediaProviderPlayerItemDownloadSimulation__handleResultPlayerItem_info___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setResultPlayerItem:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setResultInfo:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "beginSimulation");
}

uint64_t __59__PUPhotoKitMediaProviderPlayerItemDownloadSimulation_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleResultPlayerItem:info:", a2, a3);
}

@end
