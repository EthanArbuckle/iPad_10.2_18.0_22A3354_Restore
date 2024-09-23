@implementation PXPersonImageRequest

- (PXPersonImageRequest)initWithPerson:(id)a3
{
  id v5;
  PXPersonImageRequest *v6;
  PXPersonImageRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPersonImageRequest;
  v6 = -[PXPersonImageRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_person, a3);
    v7->_imageRequestTag = 0;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PXPersonImageRequest imageLoadInvalidationTimer](self, "imageLoadInvalidationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)PXPersonImageRequest;
  -[PXPersonImageRequest dealloc](&v4, sel_dealloc);
}

- (void)requestFaceCropWithOptions:(id)a3 timeout:(double)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  id v22[2];
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  id v26[2];
  id location;
  _QWORD v28[3];
  char v29;

  v8 = a3;
  v9 = a5;
  -[PXPersonImageRequest imageLoadInvalidationTimer](self, "imageLoadInvalidationTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    -[PXPersonImageRequest cancel](self, "cancel");
  v11 = -[PXPersonImageRequest imageRequestTag](self, "imageRequestTag");
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  objc_initWeak(&location, self);
  v12 = (void *)MEMORY[0x1E0C99E88];
  v13 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __73__PXPersonImageRequest_requestFaceCropWithOptions_timeout_resultHandler___block_invoke;
  v23[3] = &unk_1E511B5E8;
  objc_copyWeak(v26, &location);
  v25 = v28;
  v14 = v9;
  v24 = v14;
  v26[1] = v11;
  objc_msgSend(v12, "timerWithTimeInterval:repeats:block:", 0, v23, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPersonImageRequest setImageLoadInvalidationTimer:](self, "setImageLoadInvalidationTimer:", v15);
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addTimer:forMode:", v15, *MEMORY[0x1E0C99748]);

  +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __73__PXPersonImageRequest_requestFaceCropWithOptions_timeout_resultHandler___block_invoke_2;
  v19[3] = &unk_1E511B610;
  objc_copyWeak(v22, &location);
  v21 = v28;
  v18 = v14;
  v20 = v18;
  v22[1] = v11;
  objc_msgSend(v17, "requestFaceCropForOptions:resultHandler:", v8, v19);

  objc_destroyWeak(v22);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(v28, 8);

}

- (void)cancel
{
  void *v2;
  PXPersonImageRequest *obj;

  obj = self;
  objc_sync_enter(obj);
  -[PXPersonImageRequest imageLoadInvalidationTimer](obj, "imageLoadInvalidationTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  -[PXPersonImageRequest setImageLoadInvalidationTimer:](obj, "setImageLoadInvalidationTimer:", 0);
  -[PXPersonImageRequest setImageRequestTag:](obj, "setImageRequestTag:", -[PXPersonImageRequest imageRequestTag](obj, "imageRequestTag") + 1);
  objc_sync_exit(obj);

}

- (PXPerson)person
{
  return self->_person;
}

- (NSTimer)imageLoadInvalidationTimer
{
  return self->_imageLoadInvalidationTimer;
}

- (void)setImageLoadInvalidationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_imageLoadInvalidationTimer, a3);
}

- (unint64_t)imageRequestTag
{
  return self->_imageRequestTag;
}

- (void)setImageRequestTag:(unint64_t)a3
{
  self->_imageRequestTag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLoadInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

void __73__PXPersonImageRequest_requestFaceCropWithOptions_timeout_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_sync_enter(v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_BYTE *)(v4 + 24))
  {
    *(_BYTE *)(v4 + 24) = 1;
    if (*(_QWORD *)(a1 + 32))
    {
      v5 = *(_QWORD *)(a1 + 56);
      if (v5 == objc_msgSend(v3, "imageRequestTag"))
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    objc_msgSend(v3, "cancel");
  }
  objc_sync_exit(v3);

}

void __73__PXPersonImageRequest_requestFaceCropWithOptions_timeout_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_sync_enter(v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PXPeopleErrorKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 || objc_msgSend(v8, "code") || (v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), *(_BYTE *)(v10 + 24)))
  {
    objc_msgSend(v7, "imageLoadInvalidationTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    objc_msgSend(v7, "setImageLoadInvalidationTimer:", 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    if (*(_QWORD *)(a1 + 32))
    {
      v12 = *(_QWORD *)(a1 + 56);
      if (v12 == objc_msgSend(v7, "imageRequestTag"))
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }
  else
  {
    *(_BYTE *)(v10 + 24) = 1;
    if (*(_QWORD *)(a1 + 32))
    {
      v13 = *(_QWORD *)(a1 + 56);
      if (v13 == objc_msgSend(v7, "imageRequestTag"))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v16 = CFSTR("PXPeopleErrorKey");
        v17[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

      }
    }
    objc_msgSend(v7, "cancel");
  }

  objc_sync_exit(v7);
}

@end
