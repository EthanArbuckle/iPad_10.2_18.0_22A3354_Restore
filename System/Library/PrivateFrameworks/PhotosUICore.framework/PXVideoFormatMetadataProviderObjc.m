@implementation PXVideoFormatMetadataProviderObjc

- (PXVideoFormatMetadataProviderObjc)initWithImageManager:(id)a3
{
  id v4;
  PXVideoFormatMetadataProviderObjc *v5;
  _TtC12PhotosUICore29PXVideoFormatMetadataProvider *v6;
  _TtC12PhotosUICore29PXVideoFormatMetadataProvider *metadataProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXVideoFormatMetadataProviderObjc;
  v5 = -[PXVideoFormatMetadataProviderObjc init](&v9, sel_init);
  if (v5)
  {
    v6 = -[PXVideoFormatMetadataProvider initWithImageManager:]([_TtC12PhotosUICore29PXVideoFormatMetadataProvider alloc], "initWithImageManager:", v4);
    metadataProvider = v5->_metadataProvider;
    v5->_metadataProvider = v6;

  }
  return v5;
}

- (void)cancelActiveRequest
{
  id v2;

  -[PXVideoFormatMetadataProviderObjc metadataProvider](self, "metadataProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelActiveRequest");

}

- (void)requestVideoMetadataForItem:(id)a3 processingQueue:(id)a4 callbackQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[PXVideoFormatMetadataProviderObjc metadataProvider](self, "metadataProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __106__PXVideoFormatMetadataProviderObjc_requestVideoMetadataForItem_processingQueue_callbackQueue_completion___block_invoke;
  v16[3] = &unk_1E511BF40;
  v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "requestVideoMetadataFor:processingQueue:callbackQueue:completion:", v13, v12, v11, v16);

}

- (_TtC12PhotosUICore29PXVideoFormatMetadataProvider)metadataProvider
{
  return self->_metadataProvider;
}

- (void)setMetadataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_metadataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataProvider, 0);
}

void __106__PXVideoFormatMetadataProviderObjc_requestVideoMetadataForItem_processingQueue_callbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PXVideoFormatMetadataObjc *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else if (v7)
  {
    v6 = -[PXVideoFormatMetadataObjc initWithMetadata:]([PXVideoFormatMetadataObjc alloc], "initWithMetadata:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

@end
