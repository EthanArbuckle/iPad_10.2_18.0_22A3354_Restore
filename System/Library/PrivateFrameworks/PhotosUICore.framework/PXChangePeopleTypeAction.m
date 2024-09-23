@implementation PXChangePeopleTypeAction

- (PXChangePeopleTypeAction)initWithPeople:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PXChangePeopleTypeAction *v10;
  uint64_t v11;
  PXFastEnumeration *collections;
  PXChangePeopleTypeAction *v13;
  objc_super v15;

  v6 = a3;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15.receiver = self;
    v15.super_class = (Class)PXChangePeopleTypeAction;
    v10 = -[PXPhotosAction initWithPhotoLibrary:](&v15, sel_initWithPhotoLibrary_, v9);

    if (v10)
    {
      v11 = objc_msgSend(v6, "copy");
      collections = v10->_collections;
      v10->_collections = (PXFastEnumeration *)v11;

      v10->_type = a4;
      v10->_firstManualOrder = 0x7FFFFFFFFFFFFFFFLL;
    }
    self = v10;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)setFirstManualOrder:(unint64_t)a3
{
  void *v6;

  if (-[PXAction executionStarted](self, "executionStarted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXChangePeopleTypeAction.m"), 46, CFSTR("%s cannot be called after the receiver has started executing."), "-[PXChangePeopleTypeAction setFirstManualOrder:]");

  }
  self->_firstManualOrder = a3;
}

- (id)actionIdentifier
{
  return CFSTR("ChangePeopleType");
}

- (id)localizedActionName
{
  void *v2;
  int64_t v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v10;

  v2 = self;
  v3 = -[PXChangePeopleTypeAction type](self, "type");
  switch(v3)
  {
    case -1:
      objc_msgSend(v2, "photoLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "px_peoplePetsHomeVisibility");

      objc_msgSend(v2, "collections");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringForPeople(v7, CFSTR("PXPeopleHomeRemovePeopleButton"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringForPeoplePetsHomeTitle(v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PXStringWithValidatedFormat();
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 0:
      v4 = CFSTR("PXRemoveFromFavoritesActionName");
      goto LABEL_7;
    case 1:
      v4 = CFSTR("PXAddToFavoritesActionName");
LABEL_7:
      PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v2;
}

- (void)performAction:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__PXChangePeopleTypeAction_performAction___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v3, a3);
}

- (void)performUndo:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__PXChangePeopleTypeAction_performUndo___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v3, a3);
}

- (id)collections
{
  return self->_collections;
}

- (unint64_t)firstManualOrder
{
  return self->_firstManualOrder;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collections, 0);
}

void __40__PXChangePeopleTypeAction_performUndo___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "collections", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setType:", objc_msgSend(v6, "type"));
        objc_msgSend(v7, "setManualOrder:verified:", objc_msgSend(v6, "manualOrder"), 0);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

void __42__PXChangePeopleTypeAction_performAction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "type");
  v3 = objc_msgSend(*(id *)(a1 + 32), "firstManualOrder");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    v3 = +[PXPeopleUtilities manualOrderForInsertingAtEndOfSectionWithType:](PXPeopleUtilities, "manualOrderForInsertingAtEndOfSectionWithType:", v2);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "collections", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setType:", v2);
        objc_msgSend(v9, "setManualOrder:verified:", v3, 1);
        v3 += v2 != -1;

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

@end
