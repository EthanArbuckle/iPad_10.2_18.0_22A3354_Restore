@implementation PXRenamePersonAction

- (PXRenamePersonAction)initWithPerson:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXRenamePersonAction *v10;
  void *v11;
  uint64_t v12;
  NSString *originalName;
  void *v14;
  uint64_t v15;
  NSString *originalUri;
  uint64_t v17;
  NSString *name;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)PXRenamePersonAction;
  v10 = -[PXPhotosAction initWithPhotoLibrary:](&v20, sel_initWithPhotoLibrary_, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_person, a3);
    objc_msgSend(v7, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    originalName = v10->_originalName;
    v10->_originalName = (NSString *)v12;

    objc_msgSend(v7, "personUri");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    originalUri = v10->_originalUri;
    v10->_originalUri = (NSString *)v15;

    v17 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v17;

  }
  return v10;
}

- (id)actionIdentifier
{
  return CFSTR("RenamePerson");
}

- (id)localizedActionName
{
  return PXLocalizedStringFromTable(CFSTR("PXRenamePersonAction"), CFSTR("PhotosUICore"));
}

- (void)performAction:(id)a3
{
  -[PXRenamePersonAction _performChangeForUndo:completion:](self, "_performChangeForUndo:completion:", 0, a3);
}

- (void)performUndo:(id)a3
{
  -[PXRenamePersonAction _performChangeForUndo:completion:](self, "_performChangeForUndo:completion:", 1, a3);
}

- (void)_performChangeForUndo:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PXPeopleNameSelection *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v4 = a3;
  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PXRenamePersonAction person](self, "person");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PXRenamePersonAction originalName](self, "originalName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXRenamePersonAction originalUri](self, "originalUri");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[PXRenamePersonAction originalUri](self, "originalUri");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        +[PXPeopleUtilities sharedContactStore](PXPeopleUtilities, "sharedContactStore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXRenamePersonAction originalUri](self, "originalUri");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        objc_msgSend(v15, "unifiedContactWithIdentifier:keysToFetch:error:", v16, v14, &v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = -[PXPeopleNameSelection initWithContact:]([PXPeopleNameSelection alloc], "initWithContact:", v17);
        goto LABEL_7;
      }
    }
  }
  else
  {
    -[PXRenamePersonAction name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = -[PXPeopleNameSelection initWithName:]([PXPeopleNameSelection alloc], "initWithName:", v8);
LABEL_7:
  +[PXPeopleBootstrapContext contextWithPerson:type:](PXPeopleBootstrapContext, "contextWithPerson:type:", v7, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setNameSelection:", v18);
  objc_msgSend(v19, "setWantsMergeCandidateSuggestions:", 0);
  objc_msgSend(v19, "setWantsPostNaming:", 0);
  if (objc_msgSend(v7, "type") == -1)
    objc_msgSend(v19, "setWantsToBeAddedToPeopleAlbum:", 1);
  v20 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "processName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/Photos_UI/workspaces/photosshared/PhotosUICore/PhotosUICore/ActionsCore/PXRenamePersonAction.m"), "lastPathComponent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@:%@:%s:%d"), v22, v23, "-[PXRenamePersonAction _performChangeForUndo:completion:]", 95);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCallerInfo:", v24);

  +[PXPeopleBootstrap performBootstrapWithSourcePerson:context:synchronous:completion:](PXPeopleBootstrap, "performBootstrapWithSourcePerson:context:synchronous:completion:", v7, v19, 0, v6);
}

- (PHPerson)person
{
  return self->_person;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)originalName
{
  return self->_originalName;
}

- (NSString)originalUri
{
  return self->_originalUri;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalUri, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end
