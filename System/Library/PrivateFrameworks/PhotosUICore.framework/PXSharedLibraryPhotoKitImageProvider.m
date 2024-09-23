@implementation PXSharedLibraryPhotoKitImageProvider

- (PXSharedLibraryPhotoKitImageProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitImageProvider.m"), 30, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryPhotoKitImageProvider init]");

  abort();
}

- (PXSharedLibraryPhotoKitImageProvider)initWithPerson:(id)a3
{
  id v6;
  PXSharedLibraryPhotoKitImageProvider *v7;
  PXSharedLibraryPhotoKitImageProvider *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitImageProvider.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryPhotoKitImageProvider;
  v7 = -[PXSharedLibraryPhotoKitImageProvider init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_identifier = 0;
    objc_storeStrong((id *)&v7->_person, a3);
  }

  return v8;
}

- (PXSharedLibraryPhotoKitImageProvider)initWithParticipant:(id)a3
{
  id v6;
  PXSharedLibraryPhotoKitImageProvider *v7;
  PXSharedLibraryPhotoKitImageProvider *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitImageProvider.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryPhotoKitImageProvider;
  v7 = -[PXSharedLibraryPhotoKitImageProvider init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_identifier = 0;
    objc_storeStrong((id *)&v7->_participant, a3);
  }

  return v8;
}

- (int64_t)requestImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  double height;
  double width;
  id v12;
  PHPerson *person;
  void *v14;
  PHPerson *v15;
  PHShareParticipant *participant;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int64_t identifier;
  NSObject *v26;
  PHShareParticipant *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38[2];
  id location[4];

  v6 = a5;
  height = a3.height;
  width = a3.width;
  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v12 = a6;
  if (PXSizeIsEmpty())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitImageProvider.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!PXSizeIsEmpty(targetSize)"));

  }
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitImageProvider.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayScale > 0"));

    if (v12)
      goto LABEL_5;
  }
  else if (v12)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitImageProvider.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_5:
  person = self->_person;
  v14 = (void *)(self->_identifier + 1);
  self->_identifier = (int64_t)v14;
  if (person)
  {
    objc_initWeak(location, self);
    v15 = self->_person;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __104__PXSharedLibraryPhotoKitImageProvider_requestImageWithTargetSize_displayScale_isRTL_completionHandler___block_invoke;
    v36[3] = &unk_1E5125510;
    objc_copyWeak(v38, location);
    v38[1] = v14;
    v37 = v12;
    +[PXActivityUtilities requestImageFromPeopleAlbumForPerson:targetSize:displayScale:highQualityFormat:completion:](PXActivityUtilities, "requestImageFromPeopleAlbumForPerson:targetSize:displayScale:highQualityFormat:completion:", v15, 1, v36, width, height, a4);

    objc_destroyWeak(v38);
    objc_destroyWeak(location);
  }
  else
  {
    participant = self->_participant;
    if (!participant)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitImageProvider.m"), 103, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    PXSharedLibraryContactForParticipant(participant);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __104__PXSharedLibraryPhotoKitImageProvider_requestImageWithTargetSize_displayScale_isRTL_completionHandler___block_invoke_2;
      v34[3] = &unk_1E5147A90;
      v35 = v12;
      +[PXActivityUtilities requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:](PXActivityUtilities, "requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:", v17, v6, 0, v34, width, height, a4);
      v18 = v35;
    }
    else
    {
      -[PHShareParticipant nameComponents](self->_participant, "nameComponents");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "givenName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[PHShareParticipant nameComponents](self->_participant, "nameComponents");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "familyName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v18, "length") && !objc_msgSend(v21, "length"))
      {
        -[PHShareParticipant emailAddress](self->_participant, "emailAddress");
        v22 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v22;
      }
      if (objc_msgSend(v18, "length") || objc_msgSend(v21, "length"))
      {
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __104__PXSharedLibraryPhotoKitImageProvider_requestImageWithTargetSize_displayScale_isRTL_completionHandler___block_invoke_3;
        v32[3] = &unk_1E5147A90;
        v33 = v12;
        +[PXActivityUtilities requestMonogramForGivenName:familyName:targetSize:displayScale:isRTL:completion:](PXActivityUtilities, "requestMonogramForGivenName:familyName:targetSize:displayScale:isRTL:completion:", v18, v21, v6, v32, width, height, a4);
        v23 = v33;
      }
      else
      {
        PLSharedLibraryGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = self->_participant;
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v27;
          _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_ERROR, "Getting contact for image for participant failed: %@", (uint8_t *)location, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("No name or email address available to generate a monogram."));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, v23);
      }

    }
  }
  identifier = self->_identifier;

  return identifier;
}

- (void)cancelRequestWithIdentifier:(int64_t)a3
{
  void *v6;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitImageProvider.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != PXSharedLibraryImageProviderRequestIdentifierInvalid"));

  }
  if (self->_identifier == a3)
    self->_identifier = a3 + 1;
}

- (void)_handleResultForRequestWithIdentifier:(int64_t)a3 image:(id)a4 isDegraded:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(_QWORD);
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;

  v18 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(_QWORD))a7;
  if (self->_identifier != a3)
  {

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryImageProviderErrorDomain"), -1000, CFSTR("Request was cancelled"));
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v16 = (void *)v17;
    v15 = 0;
    goto LABEL_8;
  }
  v15 = v18;
  if (!v18 || v13)
  {

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("PXSharedLibraryImageProviderErrorDomain"), -1001, v13, CFSTR("Request failed"));
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v16 = 0;
LABEL_8:
  v19 = v15;
  v14[2](v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participant, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

void __104__PXSharedLibraryPhotoKitImageProvider_requestImageWithTargetSize_displayScale_isRTL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  v7 = (id *)(a1 + 40);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "_handleResultForRequestWithIdentifier:image:isDegraded:error:completionHandler:", *(_QWORD *)(a1 + 48), v10, v9, v8, *(_QWORD *)(a1 + 32));

}

void __104__PXSharedLibraryPhotoKitImageProvider_requestImageWithTargetSize_displayScale_isRTL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v10 = *MEMORY[0x1E0CB2D68];
    v11[0] = CFSTR("Image was nil from image request for participant.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("PXSharedLibraryErrorDomain"), -1000, v9);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __104__PXSharedLibraryPhotoKitImageProvider_requestImageWithTargetSize_displayScale_isRTL_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Monogram was nil from image request for participant."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
