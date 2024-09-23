@implementation PXChangePersonKeyFaceAction

- (PXChangePersonKeyFaceAction)initWithPerson:(id)a3 keyFace:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXChangePersonKeyFaceAction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)PXChangePersonKeyFaceAction;
  v10 = -[PXPhotosAction initWithPhotoLibrary:](&v12, sel_initWithPhotoLibrary_, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_person, a3);
    objc_storeStrong((id *)&v10->_keyFace, a4);
  }

  return v10;
}

- (PXChangePersonKeyFaceAction)initWithPerson:(id)a3 asset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXChangePersonKeyFaceAction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)PXChangePersonKeyFaceAction;
  v10 = -[PXPhotosAction initWithPhotoLibrary:](&v12, sel_initWithPhotoLibrary_, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_person, a3);
    objc_storeStrong((id *)&v10->_asset, a4);
  }

  return v10;
}

- (PHFace)keyFace
{
  PHFace *keyFace;
  void *v4;
  void *v5;
  void *v6;
  PHFace *v7;
  PHFace *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  keyFace = self->_keyFace;
  if (!keyFace)
  {
    if (self->_asset)
    {
      -[PXChangePersonKeyFaceAction person](self, "person");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = self->_asset;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXPeopleUtilities facesForPerson:inAssets:](PXPeopleUtilities, "facesForPerson:inAssets:", v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (PHFace *)objc_claimAutoreleasedReturnValue();
      v8 = self->_keyFace;
      self->_keyFace = v7;

      return self->_keyFace;
    }
    keyFace = 0;
  }
  return keyFace;
}

- (void)_invalidateCache
{
  void *v3;
  id v4;

  +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXChangePersonKeyFaceAction person](self, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateCacheForPerson:", v3);

}

- (void)_fetchKeyFaceForUndoIfNeeded
{
  PHFace *v3;
  PHFace *keyFaceForUndo;
  id v5;

  if (!self->_keyFaceForUndo)
  {
    -[PXChangePersonKeyFaceAction person](self, "person");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    +[PXPeopleUtilities keyFaceForPerson:](PXPeopleUtilities, "keyFaceForPerson:", v5);
    v3 = (PHFace *)objc_claimAutoreleasedReturnValue();
    keyFaceForUndo = self->_keyFaceForUndo;
    self->_keyFaceForUndo = v3;

  }
}

- (id)actionIdentifier
{
  return CFSTR("ChangePersonKeyFace");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXPeopleMakeKeyPhoto");
}

- (id)analyticsEventName
{
  return CFSTR("com.apple.photos.CPAnalytics.people.detailView.keyPhotoChanged");
}

- (void)performAction:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[5];

  v6 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__PXChangePersonKeyFaceAction_performAction___block_invoke;
  v7[3] = &unk_1E5149198;
  v7[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PXChangePersonKeyFaceAction_performAction___block_invoke_2;
  v5[3] = &unk_1E5148348;
  v5[4] = self;
  v4 = v6;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v7, v5);

}

- (void)performUndo:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;
  _QWORD v7[5];

  v6 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__PXChangePersonKeyFaceAction_performUndo___block_invoke;
  v7[3] = &unk_1E5149198;
  v7[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PXChangePersonKeyFaceAction_performUndo___block_invoke_2;
  v5[3] = &unk_1E5148348;
  v5[4] = self;
  v4 = v6;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v7, v5);

}

- (PHPerson)person
{
  return self->_person;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_keyFaceForUndo, 0);
  objc_storeStrong((id *)&self->_keyFace, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

void __43__PXChangePersonKeyFaceAction_performUndo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0CD16D8];
  objc_msgSend(*(id *)(a1 + 32), "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeRequestForPerson:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setKeyFace:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
}

uint64_t __43__PXChangePersonKeyFaceAction_performUndo___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_invalidateCache");
  return result;
}

void __45__PXChangePersonKeyFaceAction_performAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_fetchKeyFaceForUndoIfNeeded");
  v2 = (void *)MEMORY[0x1E0CD16D8];
  objc_msgSend(*(id *)(a1 + 32), "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeRequestForPerson:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "keyFace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyFace:", v4);

}

uint64_t __45__PXChangePersonKeyFaceAction_performAction___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_invalidateCache");
  return result;
}

@end
