@implementation ICLinkSnapshotGenerator

- (ICLinkSnapshotGenerator)initWithAttachment:(id)a3
{
  id v5;
  ICLinkSnapshotGenerator *v6;
  LPLinkSnapshotGenerator *v7;
  LPLinkSnapshotGenerator *generator;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICLinkSnapshotGenerator;
  v6 = -[ICLinkSnapshotGenerator init](&v10, sel_init);
  if (v6)
  {
    v7 = (LPLinkSnapshotGenerator *)objc_alloc_init(MEMORY[0x1E0CC11C0]);
    generator = v6->_generator;
    v6->_generator = v7;

    objc_storeStrong((id *)&v6->_attachment, a3);
  }

  return v6;
}

- (LPLinkMetadata)metadata
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  LPLinkMetadata *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  LPLinkMetadata *v21;
  void *v22;
  void *v23;
  LPLinkMetadata *v24;
  void *metadata;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  LPLinkMetadata *v31;
  LPLinkMetadata *v32;
  int v33;
  void *v34;
  LPLinkMetadata *v35;
  LPLinkMetadata *v36;
  int v37;
  void *v38;
  LPLinkMetadata *v39;
  LPLinkMetadata *v40;

  if (!self->_metadata)
  {
    -[ICLinkSnapshotGenerator attachment](self, "attachment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasSynapseLink");

    -[ICLinkSnapshotGenerator attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      objc_msgSend(v5, "synapseBasedMetadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        -[ICLinkSnapshotGenerator attachment](self, "attachment");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "plainURLMetadata");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          v24 = v22;
          metadata = self->_metadata;
          self->_metadata = v24;
        }
        else
        {
          -[ICLinkSnapshotGenerator attachment](self, "attachment");
          metadata = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(metadata, "fileMetadata");
          v35 = (LPLinkMetadata *)objc_claimAutoreleasedReturnValue();
          v36 = self->_metadata;
          self->_metadata = v35;

        }
        goto LABEL_24;
      }
      goto LABEL_4;
    }
    objc_msgSend(v5, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "ic_isWebURL");

    -[ICLinkSnapshotGenerator attachment](self, "attachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v12, "retrieveLinkMetadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v6 = v14;
      }
      else
      {
        -[ICLinkSnapshotGenerator attachment](self, "attachment");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "fallbackRemoteAttachmentMetadata");
        v6 = (id)objc_claimAutoreleasedReturnValue();

      }
      -[ICLinkSnapshotGenerator attachment](self, "attachment");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addPreviewImageToMetadata:", v6);

      if (!v6)
      {
        -[ICLinkSnapshotGenerator attachment](self, "attachment");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "fileMetadata");
        v31 = (LPLinkMetadata *)objc_claimAutoreleasedReturnValue();
        v32 = self->_metadata;
        self->_metadata = v31;

LABEL_30:
        return self->_metadata;
      }
      v21 = (LPLinkMetadata *)v6;
      v6 = v21;
    }
    else
    {
      objc_msgSend(v12, "URL");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[ICLinkSnapshotGenerator attachment](self, "attachment");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "URL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "ic_isWebURL");

        if ((v20 & 1) == 0)
        {
          -[ICLinkSnapshotGenerator attachment](self, "attachment");
          v6 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "plainURLMetadata");
          v21 = (LPLinkMetadata *)objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
      }
      else
      {

      }
      -[ICLinkSnapshotGenerator attachment](self, "attachment");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isLoadingFromCloud");

      -[ICLinkSnapshotGenerator attachment](self, "attachment");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v30;
      if (v29)
      {
        objc_msgSend(v30, "loadingAttachmentsMetadata");
        v21 = (LPLinkMetadata *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = objc_msgSend(v30, "attachmentType");

        -[ICLinkSnapshotGenerator attachment](self, "attachment");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v34;
        if (v33 == 11)
        {
          objc_msgSend(v34, "scannedDocumentsMetadata");
          v21 = (LPLinkMetadata *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v37 = objc_msgSend(v34, "metadataExists");

          -[ICLinkSnapshotGenerator attachment](self, "attachment");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v38;
          if (v37)
          {
            objc_msgSend(v38, "retrieveLinkMetadata");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v7)
            {
              -[ICLinkSnapshotGenerator attachment](self, "attachment");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "fileMetadata");
              v39 = (LPLinkMetadata *)objc_claimAutoreleasedReturnValue();
              v40 = self->_metadata;
              self->_metadata = v39;

              goto LABEL_24;
            }
LABEL_4:
            v8 = v7;
            v9 = self->_metadata;
            self->_metadata = v8;
LABEL_24:

            goto LABEL_30;
          }
          objc_msgSend(v38, "fileMetadata");
          v21 = (LPLinkMetadata *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
LABEL_29:
    v7 = self->_metadata;
    self->_metadata = v21;
    goto LABEL_30;
  }
  return self->_metadata;
}

- (LPLinkSnapshotConfiguration)configuration
{
  LPLinkSnapshotConfiguration *configuration;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  id v10;
  void *v11;
  double v12;
  LPLinkSnapshotConfiguration *v13;
  LPLinkSnapshotConfiguration *v14;

  configuration = self->_configuration;
  if (!configuration)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ICLinkSnapshotGenerator forcesLightMode](self, "forcesLightMode"))
    {
      objc_msgSend(v4, "traitCollectionByModifyingTraits:", &__block_literal_global);
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    -[ICLinkSnapshotGenerator attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLinkSnapshotGenerator metadata](self, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[ICAttachmentBrickView usesSmallSizeForAttachment:withMetadata:type:insideSystemPaper:](ICAttachmentBrickView, "usesSmallSizeForAttachment:withMetadata:type:insideSystemPaper:", v6, v7, 2, -[ICLinkSnapshotGenerator isInsideSystemPaper](self, "isInsideSystemPaper"));

    if (-[ICLinkSnapshotGenerator forcesSmallSize](self, "forcesSmallSize") || v8)
      v9 = 8;
    else
      v9 = 9;
    v10 = objc_alloc(MEMORY[0x1E0CC11B8]);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v13 = (LPLinkSnapshotConfiguration *)objc_msgSend(v10, "initWithTraitCollection:preferredSizeClass:maximumSize:scale:", v4, v9, 327.0, 800.0, v12);
    v14 = self->_configuration;
    self->_configuration = v13;

    configuration = self->_configuration;
  }
  return configuration;
}

uint64_t __40__ICLinkSnapshotGenerator_configuration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserInterfaceStyle:", 1);
}

- (void)invalidate
{
  LPLinkMetadata *metadata;
  LPLinkSnapshotConfiguration *configuration;

  metadata = self->_metadata;
  self->_metadata = 0;

  configuration = self->_configuration;
  self->_configuration = 0;

}

- (id)snapshot
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  id v15;
  id location;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[ICLinkSnapshotGenerator invalidate](self, "invalidate");
  -[ICLinkSnapshotGenerator metadata](self, "metadata");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22 = 0;
    v4 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    -[ICLinkSnapshotGenerator generator](self, "generator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLinkSnapshotGenerator metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLinkSnapshotGenerator configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __35__ICLinkSnapshotGenerator_snapshot__block_invoke;
    v12[3] = &unk_1E5C1D5D0;
    objc_copyWeak(&v15, &location);
    v14 = &v17;
    v9 = v4;
    v13 = v9;
    objc_msgSend(v5, "snapshotForMetadata:configurations:completionHandler:", v6, v8, v12);

    v10 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v9, v10);
    v3 = (id)v18[5];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    _Block_object_dispose(&v17, 8);
  }
  return v3;
}

void __35__ICLinkSnapshotGenerator_snapshot__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    if (v5 || !objc_msgSend(v6, "count"))
    {
      v8 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __35__ICLinkSnapshotGenerator_snapshot__block_invoke_cold_1((uint64_t)v5, v8);

    }
    else
    {
      v9 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v6, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v11, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scale");
      objc_msgSend(v9, "imageWithData:scale:", v10);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
  }

}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (BOOL)forcesSmallSize
{
  return self->_forcesSmallSize;
}

- (void)setForcesSmallSize:(BOOL)a3
{
  self->_forcesSmallSize = a3;
}

- (BOOL)forcesLightMode
{
  return self->_forcesLightMode;
}

- (void)setForcesLightMode:(BOOL)a3
{
  self->_forcesLightMode = a3;
}

- (BOOL)isInsideSystemPaper
{
  return self->_insideSystemPaper;
}

- (void)setInsideSystemPaper:(BOOL)a3
{
  self->_insideSystemPaper = a3;
}

- (LPLinkSnapshotGenerator)generator
{
  return self->_generator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

void __35__ICLinkSnapshotGenerator_snapshot__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Cannot create Link Presentation snapshot {error: %@}", (uint8_t *)&v2, 0xCu);
}

@end
