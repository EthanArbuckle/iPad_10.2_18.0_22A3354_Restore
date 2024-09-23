@implementation PXCreatePRSService

void __PXCreatePRSService_block_invoke()
{
  void *v0;
  void *v1;
  objc_class *v2;
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v0 = &unk_1EEBE9A78;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v1 = (void *)getPRSPosterDescriptorClass_softClass;
  v28 = getPRSPosterDescriptorClass_softClass;
  if (!getPRSPosterDescriptorClass_softClass)
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __getPRSPosterDescriptorClass_block_invoke;
    v23 = &unk_1E51482E0;
    v24 = &v25;
    __getPRSPosterDescriptorClass_block_invoke((uint64_t)&v20);
    v1 = (void *)v26[3];
  }
  v2 = objc_retainAutorelease(v1);
  _Block_object_dispose(&v25, 8);
  if (!class_addProtocol(v2, (Protocol *)v0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<PXPRSService>  _Nonnull PXCreatePRSService(void)_block_invoke");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXPosterRuntimeAdditions.m"), 65, CFSTR("Could not add protocol %s to class %@"), protocol_getName((Protocol *)v0), v2);

  }
  v3 = &unk_1EEBE9B98;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v4 = (void *)getATXFaceGalleryConfigurationClass_softClass;
  v28 = getATXFaceGalleryConfigurationClass_softClass;
  if (!getATXFaceGalleryConfigurationClass_softClass)
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __getATXFaceGalleryConfigurationClass_block_invoke;
    v23 = &unk_1E51482E0;
    v24 = &v25;
    __getATXFaceGalleryConfigurationClass_block_invoke((uint64_t)&v20);
    v4 = (void *)v26[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v25, 8);
  if (!class_addProtocol(v5, (Protocol *)v3))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<PXPRSService>  _Nonnull PXCreatePRSService(void)_block_invoke");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXPosterRuntimeAdditions.m"), 66, CFSTR("Could not add protocol %s to class %@"), protocol_getName((Protocol *)v3), v5);

  }
  v6 = &unk_1EEBE9AD8;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v7 = (void *)getATXFaceGallerySectionClass_softClass;
  v28 = getATXFaceGallerySectionClass_softClass;
  if (!getATXFaceGallerySectionClass_softClass)
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __getATXFaceGallerySectionClass_block_invoke;
    v23 = &unk_1E51482E0;
    v24 = &v25;
    __getATXFaceGallerySectionClass_block_invoke((uint64_t)&v20);
    v7 = (void *)v26[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v25, 8);
  if (!class_addProtocol(v8, (Protocol *)v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<PXPRSService>  _Nonnull PXCreatePRSService(void)_block_invoke");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXPosterRuntimeAdditions.m"), 67, CFSTR("Could not add protocol %s to class %@"), protocol_getName((Protocol *)v6), v8);

  }
  v9 = &unk_1EEBE9B38;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v10 = (void *)getATXFaceGalleryItemClass_softClass;
  v28 = getATXFaceGalleryItemClass_softClass;
  if (!getATXFaceGalleryItemClass_softClass)
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __getATXFaceGalleryItemClass_block_invoke;
    v23 = &unk_1E51482E0;
    v24 = &v25;
    __getATXFaceGalleryItemClass_block_invoke((uint64_t)&v20);
    v10 = (void *)v26[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v25, 8);
  if (!class_addProtocol(v11, (Protocol *)v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id<PXPRSService>  _Nonnull PXCreatePRSService(void)_block_invoke");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PXPosterRuntimeAdditions.m"), 68, CFSTR("Could not add protocol %s to class %@"), protocol_getName((Protocol *)v9), v11);

  }
}

@end
