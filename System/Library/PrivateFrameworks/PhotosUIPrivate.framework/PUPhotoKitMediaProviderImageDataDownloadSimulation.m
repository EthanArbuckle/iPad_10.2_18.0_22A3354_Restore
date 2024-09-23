@implementation PUPhotoKitMediaProviderImageDataDownloadSimulation

- (PUPhotoKitMediaProviderImageDataDownloadSimulation)init
{
  PUPhotoKitMediaProviderImageDataDownloadSimulation *v2;
  PUPhotoKitMediaProviderImageDataDownloadSimulation *v3;
  PUPhotoKitMediaProviderImageDataDownloadSimulation *v4;
  uint64_t v5;
  id internalResultHandler;
  _QWORD v8[4];
  PUPhotoKitMediaProviderImageDataDownloadSimulation *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUPhotoKitMediaProviderImageDataDownloadSimulation;
  v2 = -[PUPhotoKitMediaProviderDownloadSimulation init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__PUPhotoKitMediaProviderImageDataDownloadSimulation_init__block_invoke;
    v8[3] = &unk_1E58A55C0;
    v4 = v2;
    v9 = v4;
    v5 = objc_msgSend(v8, "copy");
    internalResultHandler = v4->_internalResultHandler;
    v4->_internalResultHandler = (id)v5;

  }
  return v3;
}

- (void)_handleResultImageData:(id)a3 dataUTI:(id)a4 orientation:(int64_t)a5 info:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  v11 = a4;
  -[PUPhotoKitMediaProviderImageDataDownloadSimulation _setResultImageData:](self, "_setResultImageData:", a3);
  -[PUPhotoKitMediaProviderImageDataDownloadSimulation _setResultDataUTI:](self, "_setResultDataUTI:", v11);

  -[PUPhotoKitMediaProviderImageDataDownloadSimulation _setResultOrientation:](self, "_setResultOrientation:", a5);
  -[PUPhotoKitMediaProviderImageDataDownloadSimulation _setResultInfo:](self, "_setResultInfo:", v10);

  -[PUPhotoKitMediaProviderDownloadSimulation beginSimulation](self, "beginSimulation");
}

- (void)updateSimulationWithProgress:(double)a3
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD, double);
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUPhotoKitMediaProviderImageDataDownloadSimulation;
  -[PUPhotoKitMediaProviderDownloadSimulation updateSimulationWithProgress:](&v8, sel_updateSimulationWithProgress_);
  -[PUPhotoKitMediaProviderImageDataDownloadSimulation externalProgressHandler](self, "externalProgressHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7 = 0;
    -[PUPhotoKitMediaProviderImageDataDownloadSimulation externalProgressHandler](self, "externalProgressHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, char *, _QWORD, double))v6)[2](v6, 0, &v7, 0, a3);

  }
}

- (void)endSimulationWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id internalResultHandler;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUPhotoKitMediaProviderImageDataDownloadSimulation;
  -[PUPhotoKitMediaProviderDownloadSimulation endSimulationWithError:](&v12, sel_endSimulationWithError_, v4);
  -[PUPhotoKitMediaProviderImageDataDownloadSimulation _resultImageData](self, "_resultImageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoKitMediaProviderImageDataDownloadSimulation _resultDataUTI](self, "_resultDataUTI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUPhotoKitMediaProviderImageDataDownloadSimulation _resultOrientaton](self, "_resultOrientaton");
  -[PUPhotoKitMediaProviderImageDataDownloadSimulation _resultInfo](self, "_resultInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    v13 = *MEMORY[0x1E0CD1BE8];
    v14[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = 0;
    v8 = (void *)v9;
  }
  -[PUPhotoKitMediaProviderImageDataDownloadSimulation externalResultHandler](self, "externalResultHandler");
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, int64_t, void *))v10)[2](v10, v5, v6, v7, v8);

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

- (NSData)_resultImageData
{
  return self->__resultImageData;
}

- (void)_setResultImageData:(id)a3
{
  objc_storeStrong((id *)&self->__resultImageData, a3);
}

- (NSString)_resultDataUTI
{
  return self->__resultDataUTI;
}

- (void)_setResultDataUTI:(id)a3
{
  objc_storeStrong((id *)&self->__resultDataUTI, a3);
}

- (int64_t)_resultOrientaton
{
  return self->__resultOrientaton;
}

- (void)_setResultOrientation:(int64_t)a3
{
  self->__resultOrientaton = a3;
}

- (NSDictionary)_resultInfo
{
  return self->__resultInfo;
}

- (void)_setResultInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__resultInfo, 0);
  objc_storeStrong((id *)&self->__resultDataUTI, 0);
  objc_storeStrong((id *)&self->__resultImageData, 0);
  objc_storeStrong(&self->_internalResultHandler, 0);
  objc_storeStrong(&self->_externalResultHandler, 0);
  objc_storeStrong(&self->_internalProgressHandler, 0);
  objc_storeStrong(&self->_externalProgressHandler, 0);
}

uint64_t __58__PUPhotoKitMediaProviderImageDataDownloadSimulation_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleResultImageData:dataUTI:orientation:info:", a2, a3, a4, a5);
}

@end
