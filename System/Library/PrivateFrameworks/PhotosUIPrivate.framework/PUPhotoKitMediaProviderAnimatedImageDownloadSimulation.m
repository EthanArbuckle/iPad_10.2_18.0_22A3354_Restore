@implementation PUPhotoKitMediaProviderAnimatedImageDownloadSimulation

- (PUPhotoKitMediaProviderAnimatedImageDownloadSimulation)init
{
  PUPhotoKitMediaProviderAnimatedImageDownloadSimulation *v2;
  PUPhotoKitMediaProviderAnimatedImageDownloadSimulation *v3;
  PUPhotoKitMediaProviderAnimatedImageDownloadSimulation *v4;
  uint64_t v5;
  id internalResultHandler;
  _QWORD v8[4];
  PUPhotoKitMediaProviderAnimatedImageDownloadSimulation *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUPhotoKitMediaProviderAnimatedImageDownloadSimulation;
  v2 = -[PUPhotoKitMediaProviderDownloadSimulation init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__PUPhotoKitMediaProviderAnimatedImageDownloadSimulation_init__block_invoke;
    v8[3] = &unk_1E58A5660;
    v4 = v2;
    v9 = v4;
    v5 = objc_msgSend(v8, "copy");
    internalResultHandler = v4->_internalResultHandler;
    v4->_internalResultHandler = (id)v5;

  }
  return v3;
}

- (void)_handleResultAnimatedImage:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  PUPhotoKitMediaProviderAnimatedImageDownloadSimulation *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PUPhotoKitMediaProviderAnimatedImageDownloadSimulation__handleResultAnimatedImage_info___block_invoke;
  block[3] = &unk_1E58AB790;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)updateSimulationWithProgress:(double)a3
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD, double);
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUPhotoKitMediaProviderAnimatedImageDownloadSimulation;
  -[PUPhotoKitMediaProviderDownloadSimulation updateSimulationWithProgress:](&v8, sel_updateSimulationWithProgress_);
  -[PUPhotoKitMediaProviderAnimatedImageDownloadSimulation externalProgressHandler](self, "externalProgressHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7 = 0;
    -[PUPhotoKitMediaProviderAnimatedImageDownloadSimulation externalProgressHandler](self, "externalProgressHandler");
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
  v10.super_class = (Class)PUPhotoKitMediaProviderAnimatedImageDownloadSimulation;
  -[PUPhotoKitMediaProviderDownloadSimulation endSimulationWithError:](&v10, sel_endSimulationWithError_, v4);
  -[PUPhotoKitMediaProviderAnimatedImageDownloadSimulation _resultAnimatedImage](self, "_resultAnimatedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoKitMediaProviderAnimatedImageDownloadSimulation _resultInfo](self, "_resultInfo");
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
  -[PUPhotoKitMediaProviderAnimatedImageDownloadSimulation externalResultHandler](self, "externalResultHandler");
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

- (PHAnimatedImage)_resultAnimatedImage
{
  return self->__resultAnimatedImage;
}

- (void)_setResultAnimatedImage:(id)a3
{
  objc_storeStrong((id *)&self->__resultAnimatedImage, a3);
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
  objc_storeStrong((id *)&self->__resultAnimatedImage, 0);
  objc_storeStrong(&self->_internalResultHandler, 0);
  objc_storeStrong(&self->_externalResultHandler, 0);
  objc_storeStrong(&self->_internalProgressHandler, 0);
  objc_storeStrong(&self->_externalProgressHandler, 0);
}

void __90__PUPhotoKitMediaProviderAnimatedImageDownloadSimulation__handleResultAnimatedImage_info___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  unsigned __int16 v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C38]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) != 0 || objc_msgSend(v7, "isThumbnail"))
  {
    objc_msgSend(*(id *)(a1 + 40), "externalResultHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_setResultAnimatedImage:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_setResultInfo:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "beginSimulation");
  }

}

uint64_t __62__PUPhotoKitMediaProviderAnimatedImageDownloadSimulation_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleResultAnimatedImage:info:", a2, a3);
}

@end
