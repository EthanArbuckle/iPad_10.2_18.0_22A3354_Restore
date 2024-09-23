@implementation VUIVideoAdvisoryLogoImageDownloader

- (void)downloadImageWithURL:(id)a3 imageInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "length"))
  {
    v11 = (double)(unint64_t)objc_msgSend(v9, "width");
    v12 = (double)(unint64_t)objc_msgSend(v9, "height");
    v13 = objc_alloc(MEMORY[0x1E0DB1890]);
    objc_msgSend(v9, "format");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:", v8, 0, v14, v11, v12, 0.0);

    objc_msgSend(MEMORY[0x1E0DB18A0], "imageURLWithDescription:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x1E0DB1870]);
    objc_msgSend(MEMORY[0x1E0DB1898], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithObject:imageLoader:groupType:", v16, v18, 0);

    if (v19)
    {
      -[VUIVideoAdvisoryLogoImageDownloader ratingImageProxy](self, "ratingImageProxy");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[VUIVideoAdvisoryLogoImageDownloader ratingImageProxy](self, "ratingImageProxy");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v21, "isEqual:", v19) & 1) != 0)
        {
          -[VUIVideoAdvisoryLogoImageDownloader ratingImageProxy](self, "ratingImageProxy");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isLoading");

          if ((v23 & 1) != 0)
            goto LABEL_10;
        }
        else
        {

        }
        -[VUIVideoAdvisoryLogoImageDownloader ratingImageProxy](self, "ratingImageProxy");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "cancel");

        -[VUIVideoAdvisoryLogoImageDownloader ratingImageProxy](self, "ratingImageProxy");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setCompletionHandler:", 0);

        -[VUIVideoAdvisoryLogoImageDownloader setRatingImageProxy:](self, "setRatingImageProxy:", 0);
      }
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __81__VUIVideoAdvisoryLogoImageDownloader_downloadImageWithURL_imageInfo_completion___block_invoke;
      v26[3] = &unk_1E9F9EFD8;
      v27 = v10;
      objc_msgSend(v19, "setCompletionHandler:", v26);
      -[VUIVideoAdvisoryLogoImageDownloader setRatingImageProxy:](self, "setRatingImageProxy:", v19);
      objc_msgSend(v19, "load");

    }
LABEL_10:

  }
}

void __81__VUIVideoAdvisoryLogoImageDownloader_downloadImageWithURL_imageInfo_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v6;
  void *v7;
  _QWORD v8[2];
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;

  v6 = a2;
  objc_msgSend(v6, "uiImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && a4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v9 = __81__VUIVideoAdvisoryLogoImageDownloader_downloadImageWithURL_imageInfo_completion___block_invoke_2;
    v10 = &unk_1E9F99420;
    v12 = *(id *)(a1 + 32);
    v11 = v6;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v8[0], 3221225472))
      v9((uint64_t)v8);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

void __81__VUIVideoAdvisoryLogoImageDownloader_downloadImageWithURL_imageInfo_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "uiImage");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (void)downloadImagesWithAdvisoryImageInfo:(id)a3 photoSensitivityImageInfo:(id)a4 highMotionWarningImageInfo:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  dispatch_group_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  NSObject *v32;
  id v33;
  id v34;
  _QWORD block[4];
  id v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  id v40;
  id location;
  _QWORD v42[4];
  NSObject *v43;
  _QWORD *v44;
  _QWORD v45[4];
  NSObject *v46;
  _QWORD *v47;
  _QWORD v48[4];
  NSObject *v49;
  _QWORD *v50;
  _QWORD v51[5];
  id v52;
  _QWORD v53[5];
  id v54;
  _QWORD v55[5];
  id v56;

  v10 = a3;
  v11 = a4;
  v34 = a5;
  v33 = a6;
  v12 = dispatch_group_create();
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = __Block_byref_object_copy__13;
  v55[4] = __Block_byref_object_dispose__13;
  v56 = 0;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__13;
  v53[4] = __Block_byref_object_dispose__13;
  v54 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__13;
  v51[4] = __Block_byref_object_dispose__13;
  v52 = 0;
  __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke((uint64_t)v12, v10);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
  {
    -[VUIVideoAdvisoryLogoImageDownloader ratingImageProxy](self, "ratingImageProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[VUIVideoAdvisoryLogoImageDownloader ratingImageProxy](self, "ratingImageProxy");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isEqual:", v14) & 1) != 0)
      {
        -[VUIVideoAdvisoryLogoImageDownloader ratingImageProxy](self, "ratingImageProxy");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isLoading");

        if ((v18 & 1) != 0)
          goto LABEL_25;
      }
      else
      {

      }
    }
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke_32;
    v48[3] = &unk_1E9F9F3A0;
    v19 = v12;
    v49 = v19;
    v50 = v55;
    objc_msgSend(v14, "setCompletionHandler:", v48);
    -[VUIVideoAdvisoryLogoImageDownloader setRatingImageProxy:](self, "setRatingImageProxy:", v14);
    dispatch_group_enter(v19);
    objc_msgSend(v14, "load");

  }
  __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke(v13, v11);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
  {
    -[VUIVideoAdvisoryLogoImageDownloader photoSensitivityImageProxy](self, "photoSensitivityImageProxy");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[VUIVideoAdvisoryLogoImageDownloader photoSensitivityImageProxy](self, "photoSensitivityImageProxy");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v23, "isEqual:", v21) & 1) != 0)
      {
        -[VUIVideoAdvisoryLogoImageDownloader photoSensitivityImageProxy](self, "photoSensitivityImageProxy");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isLoading");

        if ((v25 & 1) != 0)
          goto LABEL_24;
      }
      else
      {

      }
    }
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke_2;
    v45[3] = &unk_1E9F9F3A0;
    v26 = v12;
    v46 = v26;
    v47 = v53;
    objc_msgSend(v21, "setCompletionHandler:", v45);
    -[VUIVideoAdvisoryLogoImageDownloader setPhotoSensitivityImageProxy:](self, "setPhotoSensitivityImageProxy:", v21);
    dispatch_group_enter(v26);
    objc_msgSend(v21, "load");

  }
  __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke(v20, v34);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[VUIVideoAdvisoryLogoImageDownloader highMotionWarningImageProxy](self, "highMotionWarningImageProxy");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[VUIVideoAdvisoryLogoImageDownloader highMotionWarningImageProxy](self, "highMotionWarningImageProxy");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v29, "isEqual:", v21) & 1) != 0)
      {
        -[VUIVideoAdvisoryLogoImageDownloader highMotionWarningImageProxy](self, "highMotionWarningImageProxy");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isLoading");

        if ((v31 & 1) != 0)
          goto LABEL_23;
      }
      else
      {

      }
    }
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke_3;
    v42[3] = &unk_1E9F9F3A0;
    v32 = v12;
    v43 = v32;
    v44 = v51;
    objc_msgSend(v27, "setCompletionHandler:", v42);
    -[VUIVideoAdvisoryLogoImageDownloader setHighMotionWarningImageProxy:](self, "setHighMotionWarningImageProxy:", v27);
    dispatch_group_enter(v32);
    objc_msgSend(v27, "load");

  }
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke_4;
  block[3] = &unk_1E9F9F3C8;
  objc_copyWeak(&v40, &location);
  v36 = v33;
  v37 = v55;
  v38 = v53;
  v39 = v51;
  dispatch_group_notify(v12, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
LABEL_23:

LABEL_24:
LABEL_25:

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v53, 8);

  _Block_object_dispose(v55, 8);
}

id __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v2 = a2;
  objc_msgSend(v2, "imageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = (double)(unint64_t)objc_msgSend(v2, "width");
    v5 = (double)(unint64_t)objc_msgSend(v2, "height");
    v6 = objc_alloc(MEMORY[0x1E0DB1890]);
    objc_msgSend(v2, "format");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:", v3, 0, v7, v4, v5, 0.0);

    objc_msgSend(MEMORY[0x1E0DB18A0], "imageURLWithDescription:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0DB1870]);
    objc_msgSend(MEMORY[0x1E0DB1898], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithObject:imageLoader:groupType:", v9, v11, 0);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke_32(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  void *v7;
  id v8;

  v8 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(v8, "uiImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && a4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

void __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  void *v7;
  id v8;

  v8 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(v8, "uiImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && a4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

void __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  void *v7;
  id v8;

  v8 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(v8, "uiImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && a4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

void __139__VUIVideoAdvisoryLogoImageDownloader_downloadImagesWithAdvisoryImageInfo_photoSensitivityImageInfo_highMotionWarningImageInfo_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "cleanupImageProxies");
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "uiImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "uiImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "uiImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, void *))(v2 + 16))(v2, v3, v4, v5);

  }
}

- (void)cleanupImageProxies
{
  -[VUIVideoAdvisoryLogoImageDownloader setRatingImageProxy:](self, "setRatingImageProxy:", 0);
  -[VUIVideoAdvisoryLogoImageDownloader setPhotoSensitivityImageProxy:](self, "setPhotoSensitivityImageProxy:", 0);
  -[VUIVideoAdvisoryLogoImageDownloader setHighMotionWarningImageProxy:](self, "setHighMotionWarningImageProxy:", 0);
}

- (TVImageProxy)ratingImageProxy
{
  return self->_ratingImageProxy;
}

- (void)setRatingImageProxy:(id)a3
{
  objc_storeStrong((id *)&self->_ratingImageProxy, a3);
}

- (TVImageProxy)photoSensitivityImageProxy
{
  return self->_photoSensitivityImageProxy;
}

- (void)setPhotoSensitivityImageProxy:(id)a3
{
  objc_storeStrong((id *)&self->_photoSensitivityImageProxy, a3);
}

- (TVImageProxy)highMotionWarningImageProxy
{
  return self->_highMotionWarningImageProxy;
}

- (void)setHighMotionWarningImageProxy:(id)a3
{
  objc_storeStrong((id *)&self->_highMotionWarningImageProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highMotionWarningImageProxy, 0);
  objc_storeStrong((id *)&self->_photoSensitivityImageProxy, 0);
  objc_storeStrong((id *)&self->_ratingImageProxy, 0);
}

@end
