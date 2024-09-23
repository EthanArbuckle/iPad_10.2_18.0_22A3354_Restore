@implementation PXNotThisPersonAction

- (PXNotThisPersonAction)initWithPerson:(id)a3 faces:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXNotThisPersonAction *v10;
  uint64_t v11;
  PXFastEnumeration *faces;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)PXNotThisPersonAction;
  v10 = -[PXPhotosAction initWithPhotoLibrary:](&v14, sel_initWithPhotoLibrary_, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_person, a3);
    v11 = objc_msgSend(v8, "copy");
    faces = v10->_faces;
    v10->_faces = (PXFastEnumeration *)v11;

  }
  return v10;
}

- (PXNotThisPersonAction)initWithPerson:(id)a3 assets:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXNotThisPersonAction *v10;
  uint64_t v11;
  PXFastEnumeration *assets;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)PXNotThisPersonAction;
  v10 = -[PXPhotosAction initWithPhotoLibrary:](&v14, sel_initWithPhotoLibrary_, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_person, a3);
    v11 = objc_msgSend(v8, "copy");
    assets = v10->_assets;
    v10->_assets = (PXFastEnumeration *)v11;

  }
  return v10;
}

- (PXFastEnumeration)faces
{
  PXFastEnumeration *faces;
  void *v4;
  void *v5;
  PXFastEnumeration *v6;
  PXFastEnumeration *v7;

  faces = self->_faces;
  if (!faces)
  {
    -[PXNotThisPersonAction person](self, "person");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXNotThisPersonAction assets](self, "assets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleUtilities facesForPerson:inAssets:](PXPeopleUtilities, "facesForPerson:inAssets:", v4, v5);
    v6 = (PXFastEnumeration *)objc_claimAutoreleasedReturnValue();
    v7 = self->_faces;
    self->_faces = v6;

    faces = self->_faces;
  }
  return faces;
}

- (id)assets
{
  return self->_assets;
}

- (id)actionIdentifier
{
  return CFSTR("NotThisPerson");
}

- (id)actionNameLocalizationKey
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  -[PXNotThisPersonAction faces](self, "faces");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[PXNotThisPersonAction person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == 1)
    v6 = CFSTR("PXPersonRejectFaceActionName");
  else
    v6 = CFSTR("PXPersonRejectFacesActionName");
  +[PXPeopleUtilities locKeyForPersonOrPet:withVisibility:key:](PXPeopleUtilities, "locKeyForPersonOrPet:withVisibility:key:", v5, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)analyticsEventName
{
  return CFSTR("com.apple.photos.CPAnalytics.people.detailView.notThisPerson");
}

- (void)performAction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PXNotThisPersonAction *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  -[PXNotThisPersonAction person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __39__PXNotThisPersonAction_performAction___block_invoke;
  v13[3] = &unk_1E5148D08;
  v13[4] = self;
  v14 = v5;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __39__PXNotThisPersonAction_performAction___block_invoke_2;
  v9[3] = &unk_1E5146918;
  v10 = v14;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v14;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v13, v9);

}

- (void)performUndo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PXNotThisPersonAction *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  -[PXNotThisPersonAction person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __37__PXNotThisPersonAction_performUndo___block_invoke;
  v13[3] = &unk_1E5148D08;
  v13[4] = self;
  v14 = v5;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __37__PXNotThisPersonAction_performUndo___block_invoke_2;
  v9[3] = &unk_1E5146918;
  v10 = v14;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v14;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v13, v9);

}

- (id)_facesForLogging
{
  id v2;
  id v3;
  id v4;

  -[PXNotThisPersonAction faces](self, "faces");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  v3 = v2;

  if (!v3)
  {
LABEL_6:
    v4 = v2;
    v3 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v3, "fetchedObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v4;
}

- (id)_assetsForLogging
{
  id v2;
  id v3;
  id v4;

  -[PXNotThisPersonAction assets](self, "assets");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  v3 = v2;

  if (!v3)
  {
LABEL_6:
    v4 = v2;
    v3 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v3, "fetchedObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v4;
}

- (PHPerson)person
{
  return self->_person;
}

- (BOOL)didSetPersonAsVerified
{
  return self->_didSetPersonAsVerified;
}

- (void)setDidSetPersonAsVerified:(BOOL)a3
{
  self->_didSetPersonAsVerified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_faces, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

void __37__PXNotThisPersonAction_performUndo___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "faces");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "didSetPersonAsVerified"))
    objc_msgSend(v2, "setVerified:", 0);
  objc_msgSend(v2, "removeRejectedFaces:", v3);
  objc_msgSend(v2, "addFaces:", v3);

}

void __37__PXNotThisPersonAction_performUndo___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  int v14;
  __CFString *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = CFSTR("NO");
      if (a2)
        v7 = CFSTR("YES");
      v8 = v7;
      v10 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(a1 + 40);
      v11 = v8;
      objc_msgSend(v9, "_facesForLogging");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_assetsForLogging");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = 138413314;
      v15 = v8;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Not this person performUndo succeeded: %@ with error: %@. Person %@, faces: %@, assets: %@", (uint8_t *)&v14, 0x34u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __39__PXNotThisPersonAction_performAction___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "faces");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "isVerified") & 1) == 0)
  {
    objc_msgSend(v2, "setVerified:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setDidSetPersonAsVerified:", 1);
  }
  objc_msgSend(v2, "removeFaces:", v3);
  objc_msgSend(v2, "addRejectedFaces:forCluster:", v3, 0);

}

void __39__PXNotThisPersonAction_performAction___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  int v14;
  __CFString *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = CFSTR("NO");
      if (a2)
        v7 = CFSTR("YES");
      v8 = v7;
      v10 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(a1 + 40);
      v11 = v8;
      objc_msgSend(v9, "_facesForLogging");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_assetsForLogging");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = 138413314;
      v15 = v8;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Not this person performAction succeeded: %@ with error: %@. Person %@, faces: %@, assets: %@", (uint8_t *)&v14, 0x34u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
