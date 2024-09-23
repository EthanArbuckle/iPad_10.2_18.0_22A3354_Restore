@implementation WLVideosMigrator

- (void)enable
{
  WLFeaturePayload **p_featurePayload;
  id WeakRetained;
  id v4;

  p_featurePayload = &self->_featurePayload;
  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setEnabled:", 1);

  v4 = objc_loadWeakRetained((id *)p_featurePayload);
  objc_msgSend(v4, "setState:", CFSTR("enabled"));

}

- (void)setState:(id)a3
{
  WLFeaturePayload **p_featurePayload;
  id v4;
  id WeakRetained;

  p_featurePayload = &self->_featurePayload;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_featurePayload);
  objc_msgSend(WeakRetained, "setState:", v4);

}

- (void)setEstimatedDataSize:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setSize:", a3);

}

- (void)addWorkingTime:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setElapsedTime:", objc_msgSend(WeakRetained, "elapsedTime") + a3);

}

- (BOOL)accountBased
{
  return 0;
}

+ (id)contentType
{
  return CFSTR("files/video");
}

- (id)contentType
{
  return +[WLVideosMigrator contentType](WLVideosMigrator, "contentType");
}

- (id)dataType
{
  return CFSTR("cameraroll");
}

- (BOOL)storeRecordDataInDatabase
{
  return 0;
}

- (BOOL)wantsSegmentedDownloads
{
  return 1;
}

- (id)importWillBegin
{
  id WeakRetained;
  WLPhotoLibrary *v4;
  WLPhotoLibrary *photoLibrary;

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setSize:", 0);

  v4 = -[WLPhotoLibrary initWithContentType:]([WLPhotoLibrary alloc], "initWithContentType:", 1);
  photoLibrary = self->_photoLibrary;
  self->_photoLibrary = v4;

  return 0;
}

- (id)importDidEnd
{
  unint64_t v3;
  WLPhotoLibrary *photoLibrary;

  v3 = -[WLPhotoLibrary errorCount](self->_photoLibrary, "errorCount");
  photoLibrary = self->_photoLibrary;
  self->_importErrorCount = v3;
  self->_photoLibrary = 0;

  return 0;
}

- (unint64_t)importErrorCount
{
  return self->_importErrorCount;
}

- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  id v16;
  WLPhotoLibrary *photoLibrary;
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a6;
  v9 = a4;
  v10 = objc_msgSend(v9, "itemSize");
  objc_msgSend(v9, "dataFilePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "bucket");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setCount:", objc_msgSend(WeakRetained, "count") + 1);

  v16 = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(v16, "setSize:", objc_msgSend(v16, "size") + v10);

  photoLibrary = self->_photoLibrary;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __64__WLVideosMigrator_importRecordData_summary_account_completion___block_invoke;
  v19[3] = &unk_24E375C80;
  v20 = v8;
  v18 = v8;
  -[WLPhotoLibrary addAsset:filename:size:collection:completion:](photoLibrary, "addAsset:filename:size:collection:completion:", v11, v13, v10, v14, v19);

}

uint64_t __64__WLVideosMigrator_importRecordData_summary_account_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (WLFeaturePayload)featurePayload
{
  return (WLFeaturePayload *)objc_loadWeakRetained((id *)&self->_featurePayload);
}

- (void)setFeaturePayload:(id)a3
{
  objc_storeWeak((id *)&self->_featurePayload, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_featurePayload);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
