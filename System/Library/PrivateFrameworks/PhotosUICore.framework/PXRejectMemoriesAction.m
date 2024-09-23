@implementation PXRejectMemoriesAction

- (void)setFeatureType:(unint64_t)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PXRejectMemoriesAction *v24;
  id obj;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (-[PXAction executionStarted](self, "executionStarted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRejectMemoriesAction.m"), 34, CFSTR("%s cannot be called after the receiver has started executing."), "-[PXRejectMemoriesAction setFeatureType:]");

  }
  if (self->_featureType != a3)
  {
    self->_featureType = a3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v24 = self;
    -[PXMemoriesAction collections](self, "collections");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          objc_msgSend(v10, "blockableFeatures");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v30;
            while (2)
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v30 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
                if ((objc_msgSend(v16, "type") & a3) != 0)
                {
                  objc_msgSend(v10, "localIdentifier");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "setObject:forKeyedSubscript:", v16, v17);

                  objc_msgSend(v10, "fetchPropertySetsIfNeeded");
                  objc_msgSend(v10, "userFeedbackProperties");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "userFeedback");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x1E0CD17F0], "negativeUserFeedbackForMemoryFeature:existingFeedback:", v16, v19);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "localIdentifier");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "setObject:forKeyedSubscript:", v20, v21);

                  objc_msgSend(v10, "localIdentifier");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "setObject:forKeyedSubscript:", v19, v22);

                  goto LABEL_19;
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              if (v13)
                continue;
              break;
            }
          }
LABEL_19:

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v7);
    }

    -[PXRejectMemoriesAction setRedoMemoryFeatures:](v24, "setRedoMemoryFeatures:", v28);
    -[PXRejectMemoriesAction setRedoUserFeedbacks:](v24, "setRedoUserFeedbacks:", v27);
    -[PXRejectMemoriesAction setUndoUserFeedbacks:](v24, "setUndoUserFeedbacks:", v26);

  }
}

- (void)setRejectReason:(unint64_t)a3
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PXRejectMemoriesAction *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[PXAction executionStarted](self, "executionStarted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRejectMemoriesAction.m"), 59, CFSTR("%s cannot be called after the receiver has started executing."), "-[PXRejectMemoriesAction setRejectReason:]");

  }
  if (self->_rejectReason != a3)
  {
    self->_rejectReason = a3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v20 = self;
    -[PXMemoriesAction collections](self, "collections");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v12, "px_mutatedPhotosGraphPropertiesWithRejectReason:", a3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v14);

          v15 = (void *)MEMORY[0x1E0CD1630];
          objc_msgSend(v12, "photosGraphProperties");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "px_photosGraphDataFromProperties:error:", v16, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v18);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    -[PXRejectMemoriesAction setRedoPhotosGraphDataValues:](v20, "setRedoPhotosGraphDataValues:", v6);
    -[PXRejectMemoriesAction setUndoPhotosGraphDataValues:](v20, "setUndoPhotosGraphDataValues:", v7);

  }
}

- (id)actionIdentifier
{
  return CFSTR("RejectMemories");
}

- (id)localizedActionName
{
  return PXLocalizedStringFromTable(CFSTR("PXMemoriesFeedMultiDeleteActionTitle"), CFSTR("PhotosUICore"));
}

- (id)actionSystemImageName
{
  return CFSTR("trash");
}

- (void)performAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v4 = a3;
  -[PXRejectMemoriesAction redoMemoryFeatures](self, "redoMemoryFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRejectMemoriesAction redoUserFeedbacks](self, "redoUserFeedbacks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRejectMemoriesAction redoPhotosGraphDataValues](self, "redoPhotosGraphDataValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__PXRejectMemoriesAction_performAction___block_invoke;
  v11[3] = &unk_1E5128B60;
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = v5;
  -[PXMemoriesAction performMemoryChanges:completionHandler:](self, "performMemoryChanges:completionHandler:", v11, v4);

}

- (void)performUndo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[PXRejectMemoriesAction undoUserFeedbacks](self, "undoUserFeedbacks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRejectMemoriesAction undoPhotosGraphDataValues](self, "undoPhotosGraphDataValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__PXRejectMemoriesAction_performUndo___block_invoke;
  v9[3] = &unk_1E5128B88;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  -[PXMemoriesAction performMemoryChanges:completionHandler:](self, "performMemoryChanges:completionHandler:", v9, v4);

}

- (unint64_t)featureType
{
  return self->_featureType;
}

- (unint64_t)rejectReason
{
  return self->_rejectReason;
}

- (NSDictionary)redoMemoryFeatures
{
  return self->_redoMemoryFeatures;
}

- (void)setRedoMemoryFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDictionary)redoUserFeedbacks
{
  return self->_redoUserFeedbacks;
}

- (void)setRedoUserFeedbacks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDictionary)undoUserFeedbacks
{
  return self->_undoUserFeedbacks;
}

- (void)setUndoUserFeedbacks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDictionary)redoPhotosGraphDataValues
{
  return self->_redoPhotosGraphDataValues;
}

- (void)setRedoPhotosGraphDataValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDictionary)undoPhotosGraphDataValues
{
  return self->_undoPhotosGraphDataValues;
}

- (void)setUndoPhotosGraphDataValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoPhotosGraphDataValues, 0);
  objc_storeStrong((id *)&self->_redoPhotosGraphDataValues, 0);
  objc_storeStrong((id *)&self->_undoUserFeedbacks, 0);
  objc_storeStrong((id *)&self->_redoUserFeedbacks, 0);
  objc_storeStrong((id *)&self->_redoMemoryFeatures, 0);
}

void __38__PXRejectMemoriesAction_performUndo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(v8, "setRejected:", 0);
  objc_msgSend(v8, "setBlacklistedFeature:", 0);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v8, "setUserFeedback:", v6);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v8, "setPhotosGraphData:", v7);

}

void __40__PXRejectMemoriesAction_performAction___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v9, "setRejected:", 1);
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v9, "setBlacklistedFeature:", v6);
  objc_msgSend(a1[5], "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v9, "setUserFeedback:", v7);
  objc_msgSend(a1[6], "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v9, "setPhotosGraphData:", v8);

}

@end
