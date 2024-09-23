@implementation PXPeopleUserFeedbackAction

- (PXPeopleUserFeedbackAction)initWithPeople:(id)a3 feedbackType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PXPeopleUserFeedbackAction *v10;
  uint64_t v11;
  PXFastEnumeration *collections;
  uint64_t v13;
  PHUserFeedback *userFeedback;
  PXPeopleUserFeedbackAction *v15;
  objc_super v17;

  v6 = a3;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17.receiver = self;
    v17.super_class = (Class)PXPeopleUserFeedbackAction;
    v10 = -[PXPhotosAction initWithPhotoLibrary:](&v17, sel_initWithPhotoLibrary_, v9);

    if (v10)
    {
      v11 = objc_msgSend(v6, "copy");
      collections = v10->_collections;
      v10->_collections = (PXFastEnumeration *)v11;

      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD17F0]), "initWithType:feature:context:", a4, 0, 0);
      userFeedback = v10->_userFeedback;
      v10->_userFeedback = (PHUserFeedback *)v13;

    }
    self = v10;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)actionIdentifier
{
  return CFSTR("PeopleUserFeedback");
}

- (id)actionNameLocalizationKey
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;

  -[PXPeopleUserFeedbackAction userFeedback](self, "userFeedback");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  v4 = CFSTR("PXNeverFeatureActionName");
  if (v3 != 2)
    v4 = 0;
  if (v3 == 3)
    return CFSTR("PXFeatureLessActionName");
  else
    return (id)v4;
}

- (void)performAction:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__PXPeopleUserFeedbackAction_performAction___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v3, a3);
}

- (void)performUndo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PXPeopleUserFeedbackAction undoUserFeedbacks](self, "undoUserFeedbacks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__PXPeopleUserFeedbackAction_performUndo___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v7, v4);

}

- (void)performRedo:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__PXPeopleUserFeedbackAction_performRedo___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v3, a3);
}

- (id)collections
{
  return self->_collections;
}

- (PHUserFeedback)userFeedback
{
  return self->_userFeedback;
}

- (NSDictionary)undoUserFeedbacks
{
  return self->_undoUserFeedbacks;
}

- (void)setUndoUserFeedbacks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoUserFeedbacks, 0);
  objc_storeStrong((id *)&self->_userFeedback, 0);
  objc_storeStrong((id *)&self->_collections, 0);
}

void __42__PXPeopleUserFeedbackAction_performRedo___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "collections", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "userFeedback");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setUserFeedback:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __42__PXPeopleUserFeedbackAction_performUndo___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "collections", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);
        objc_msgSend(v7, "localIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setUserFeedback:", v11);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

void __44__PXPeopleUserFeedbackAction_performAction___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "collections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "fetchPropertySetsIfNeeded");
        objc_msgSend(v7, "userFeedbackProperties");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "userFeedback");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, v10);

        objc_msgSend(*(id *)(a1 + 32), "userFeedback");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setUserFeedback:", v11);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "setUndoUserFeedbacks:", v2);
}

@end
