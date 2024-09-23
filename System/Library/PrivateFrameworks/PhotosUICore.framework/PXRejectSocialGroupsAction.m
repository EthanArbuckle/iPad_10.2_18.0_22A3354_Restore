@implementation PXRejectSocialGroupsAction

- (PXRejectSocialGroupsAction)initWithSocialGroups:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXRejectSocialGroupsAction *v8;
  uint64_t v9;
  PXFastEnumeration *collections;
  PXRejectSocialGroupsAction *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13.receiver = self;
    v13.super_class = (Class)PXRejectSocialGroupsAction;
    v8 = -[PXPhotosAction initWithPhotoLibrary:](&v13, sel_initWithPhotoLibrary_, v7);

    if (v8)
    {
      v9 = objc_msgSend(v4, "copy");
      collections = v8->_collections;
      v8->_collections = (PXFastEnumeration *)v9;

    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)actionIdentifier
{
  return CFSTR("RejectSocialGroups");
}

- (void)performAction:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__PXRejectSocialGroupsAction_performAction___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v3, a3);
}

- (void)performUndo:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__PXRejectSocialGroupsAction_performUndo___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v3, a3);
}

- (id)collections
{
  return self->_collections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collections, 0);
}

void __42__PXRejectSocialGroupsAction_performUndo___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "collections", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CD17C8], "changeRequestForSocialGroup:userAction:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "unrejectSocialGroup");

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __44__PXRejectSocialGroupsAction_performAction___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "collections", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CD17C8], "changeRequestForSocialGroup:userAction:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "rejectSocialGroup");

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

@end
