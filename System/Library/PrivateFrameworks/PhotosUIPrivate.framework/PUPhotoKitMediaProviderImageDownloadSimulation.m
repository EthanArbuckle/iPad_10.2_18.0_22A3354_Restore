@implementation PUPhotoKitMediaProviderImageDownloadSimulation

- (PUPhotoKitMediaProviderImageDownloadSimulation)init
{
  PUPhotoKitMediaProviderImageDownloadSimulation *v2;
  PUPhotoKitMediaProviderImageDownloadSimulation *v3;
  PUPhotoKitMediaProviderImageDownloadSimulation *v4;
  uint64_t v5;
  id internalResultHandler;
  _QWORD v8[4];
  PUPhotoKitMediaProviderImageDownloadSimulation *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUPhotoKitMediaProviderImageDownloadSimulation;
  v2 = -[PUPhotoKitMediaProviderDownloadSimulation init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__PUPhotoKitMediaProviderImageDownloadSimulation_init__block_invoke;
    v8[3] = &unk_1E58A5598;
    v4 = v2;
    v9 = v4;
    v5 = objc_msgSend(v8, "copy");
    internalResultHandler = v4->_internalResultHandler;
    v4->_internalResultHandler = (id)v5;

  }
  return v3;
}

- (void)_handleResultImage:(id)a3 info:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = (void *)MEMORY[0x1E0D73238];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C38]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "formatWithID:", (unsigned __int16)objc_msgSend(v10, "integerValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "isThumbnail");
  if ((v8 & 1) != 0 || v12)
  {
    -[PUPhotoKitMediaProviderImageDownloadSimulation externalResultHandler](self, "externalResultHandler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v13)[2](v13, v14, v6);

  }
  else
  {
    -[PUPhotoKitMediaProviderImageDownloadSimulation _setResultImage:](self, "_setResultImage:", v14);
    -[PUPhotoKitMediaProviderImageDownloadSimulation _setResultInfo:](self, "_setResultInfo:", v6);
    -[PUPhotoKitMediaProviderDownloadSimulation beginSimulation](self, "beginSimulation");
  }

}

- (void)updateSimulationWithProgress:(double)a3
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD, double);
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUPhotoKitMediaProviderImageDownloadSimulation;
  -[PUPhotoKitMediaProviderDownloadSimulation updateSimulationWithProgress:](&v8, sel_updateSimulationWithProgress_);
  -[PUPhotoKitMediaProviderImageDownloadSimulation externalProgressHandler](self, "externalProgressHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7 = 0;
    -[PUPhotoKitMediaProviderImageDownloadSimulation externalProgressHandler](self, "externalProgressHandler");
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
  v10.super_class = (Class)PUPhotoKitMediaProviderImageDownloadSimulation;
  -[PUPhotoKitMediaProviderDownloadSimulation endSimulationWithError:](&v10, sel_endSimulationWithError_, v4);
  -[PUPhotoKitMediaProviderImageDownloadSimulation _resultImage](self, "_resultImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoKitMediaProviderImageDownloadSimulation _resultInfo](self, "_resultInfo");
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
  -[PUPhotoKitMediaProviderImageDownloadSimulation externalResultHandler](self, "externalResultHandler");
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

- (UIImage)_resultImage
{
  return self->__resultImage;
}

- (void)_setResultImage:(id)a3
{
  objc_storeStrong((id *)&self->__resultImage, a3);
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
  objc_storeStrong((id *)&self->__resultImage, 0);
  objc_storeStrong(&self->_internalResultHandler, 0);
  objc_storeStrong(&self->_externalResultHandler, 0);
  objc_storeStrong(&self->_internalProgressHandler, 0);
  objc_storeStrong(&self->_externalProgressHandler, 0);
}

uint64_t __54__PUPhotoKitMediaProviderImageDownloadSimulation_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleResultImage:info:", a2, a3);
}

@end
