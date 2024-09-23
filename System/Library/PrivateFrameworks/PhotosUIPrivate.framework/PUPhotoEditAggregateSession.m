@implementation PUPhotoEditAggregateSession

- (__CFString)_keyForSessionEnd:(int64_t)a3
{
  __CFString *result;
  __CFString **v5;
  _BOOL4 v6;

  result = 0;
  switch(a3)
  {
    case 0:
      v5 = (__CFString **)MEMORY[0x1E0D728A8];
      goto LABEL_9;
    case 1:
      v6 = -[PUPhotoEditAggregateSession shouldUseVideoKeys](self, "shouldUseVideoKeys");
      v5 = (__CFString **)MEMORY[0x1E0D72A40];
      if (!v6)
        v5 = (__CFString **)MEMORY[0x1E0D72890];
      goto LABEL_9;
    case 3:
      v5 = (__CFString **)MEMORY[0x1E0D72838];
      goto LABEL_9;
    case 4:
      v5 = (__CFString **)MEMORY[0x1E0D72840];
      goto LABEL_9;
    case 5:
      v5 = (__CFString **)MEMORY[0x1E0D72820];
LABEL_9:
      result = *v5;
      break;
    default:
      return result;
  }
  return result;
}

- (void)notifyDidApplyAutoCrop
{
  -[PUPhotoEditAggregateSession _setHasCropSuggestion:](self, "_setHasCropSuggestion:", 1);
  -[PUPhotoEditAggregateSession _setAutoCropAdjusted:](self, "_setAutoCropAdjusted:", 0);
  -[PUPhotoEditAggregateSession _setAutoCropReset:](self, "_setAutoCropReset:", 0);
}

- (void)notifyDidApplyPerspectiveAutoCrop
{
  -[PUPhotoEditAggregateSession _setHasPerspectiveCropSuggestion:](self, "_setHasPerspectiveCropSuggestion:", 1);
}

- (void)notifyDidResetCrop
{
  if (-[PUPhotoEditAggregateSession _hasCropSuggestion](self, "_hasCropSuggestion"))
  {
    -[PUPhotoEditAggregateSession _setAutoCropReset:](self, "_setAutoCropReset:", 1);
    -[PUPhotoEditAggregateSession _setAutoCropAdjusted:](self, "_setAutoCropAdjusted:", 0);
  }
}

- (void)notifyDidAdjustCrop
{
  if (-[PUPhotoEditAggregateSession _hasCropSuggestion](self, "_hasCropSuggestion"))
  {
    if (!-[PUPhotoEditAggregateSession _autoCropReset](self, "_autoCropReset"))
      -[PUPhotoEditAggregateSession _setAutoCropAdjusted:](self, "_setAutoCropAdjusted:", 1);
  }
}

- (NSArray)_autoCropKeys
{
  void *v3;
  _QWORD *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUPhotoEditAggregateSession _hasCropSuggestion](self, "_hasCropSuggestion"))
    objc_msgSend(v3, "pu_addCFString:", *MEMORY[0x1E0D727F8]);
  if (-[PUPhotoEditAggregateSession _hasPerspectiveCropSuggestion](self, "_hasPerspectiveCropSuggestion"))
    objc_msgSend(v3, "pu_addCFString:", *MEMORY[0x1E0D727E8]);
  if (-[PUPhotoEditAggregateSession _autoCropAdjusted](self, "_autoCropAdjusted"))
  {
    v4 = (_QWORD *)MEMORY[0x1E0D727E0];
LABEL_9:
    objc_msgSend(v3, "pu_addCFString:", *v4);
    return (NSArray *)v3;
  }
  if (-[PUPhotoEditAggregateSession _autoCropReset](self, "_autoCropReset"))
  {
    v4 = (_QWORD *)MEMORY[0x1E0D727F0];
    goto LABEL_9;
  }
  return (NSArray *)v3;
}

- (id)_sessionKeysWithEnd:(int64_t)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  _QWORD *v8;
  _BOOL4 v9;
  _QWORD *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pu_addCFString:", *MEMORY[0x1E0D728E0]);
  objc_msgSend(v5, "pu_addCFString:", -[PUPhotoEditAggregateSession _keyForSessionEnd:](self, "_keyForSessionEnd:", a3));
  if (!a3)
  {
    -[PUPhotoEditAggregateSession _autoCropKeys](self, "_autoCropKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

  }
  if (-[PUPhotoEditAggregateSession toggledOriginal](self, "toggledOriginal"))
    objc_msgSend(v5, "pu_addCFString:", *MEMORY[0x1E0D728F8]);
  if (-[PUPhotoEditAggregateSession pluginStarted](self, "pluginStarted"))
  {
    v7 = -[PUPhotoEditAggregateSession shouldUseVideoKeys](self, "shouldUseVideoKeys");
    v8 = (_QWORD *)MEMORY[0x1E0D72A38];
    if (!v7)
      v8 = (_QWORD *)MEMORY[0x1E0D72880];
    objc_msgSend(v5, "pu_addCFString:", *v8);
  }
  if (-[PUPhotoEditAggregateSession pluginSaved](self, "pluginSaved"))
  {
    v9 = -[PUPhotoEditAggregateSession shouldUseVideoKeys](self, "shouldUseVideoKeys");
    v10 = (_QWORD *)MEMORY[0x1E0D72A30];
    if (!v9)
      v10 = (_QWORD *)MEMORY[0x1E0D72878];
    objc_msgSend(v5, "pu_addCFString:", *v10);
  }
  return v5;
}

- (void)_recordKeys:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    v7 = MEMORY[0x1E0C9AA70];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), v7);
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)finishSessionWithEnd:(int64_t)a3 newCompositionController:(id)a4 oldCompositionController:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  CMTime v26;
  CMTime time;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[PUPhotoEditAggregateSession _sessionKeysWithEnd:](self, "_sessionKeysWithEnd:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  if (v8 && v9)
  {
    objc_msgSend(MEMORY[0x1E0D71660], "compositionController:aggregateKeysForPreviousComposition:", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v12);
    if (!a3)
    {
      objc_msgSend(v9, "composition");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = *MEMORY[0x1E0D71470];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v8, "isEqual:forKeys:visualChangesOnly:", v13, v14, 0);

      if ((v15 & 1) == 0)
      {
        objc_msgSend(v8, "trimAdjustmentController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v8, "trimAdjustmentController");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
            objc_msgSend(v17, "endTime");
          else
            memset(&time, 0, sizeof(time));
          CMTimeGetSeconds(&time);
          objc_msgSend(v8, "trimAdjustmentController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
            objc_msgSend(v19, "startTime");
          else
            memset(&v26, 0, sizeof(v26));
          CMTimeGetSeconds(&v26);

          -[PUPhotoEditAggregateSession originalDuration](self, "originalDuration");
          objc_msgSend(v11, "pu_addCFString:", PLSAggregateDictionaryKeyForVideoEditOriginalTrimDuration());
          objc_msgSend(v11, "pu_addCFString:", PLSAggregateDictionaryKeyForVideoEditFinalTrimDuration());
        }
      }
      objc_msgSend(v9, "composition");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *MEMORY[0x1E0D71450];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v8, "isEqual:forKeys:visualChangesOnly:", v21, v22, 0);

      if ((v23 & 1) == 0)
      {
        objc_msgSend(v8, "slomoAdjustmentController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
          objc_msgSend(v11, "pu_addCFString:", *MEMORY[0x1E0D72A48]);
      }
    }

  }
  -[PUPhotoEditAggregateSession _recordKeys:](self, "_recordKeys:", v11);

  return v11;
}

- (void)finishSessionWithEnd:(int64_t)a3
{
  id v3;

  v3 = -[PUPhotoEditAggregateSession finishSessionWithEnd:newCompositionController:oldCompositionController:](self, "finishSessionWithEnd:newCompositionController:oldCompositionController:", a3, 0, 0);
}

- (BOOL)toggledOriginal
{
  return self->_toggledOriginal;
}

- (void)setToggledOriginal:(BOOL)a3
{
  self->_toggledOriginal = a3;
}

- (BOOL)pluginStarted
{
  return self->_pluginStarted;
}

- (void)setPluginStarted:(BOOL)a3
{
  self->_pluginStarted = a3;
}

- (BOOL)pluginSaved
{
  return self->_pluginSaved;
}

- (void)setPluginSaved:(BOOL)a3
{
  self->_pluginSaved = a3;
}

- (NSString)pluginIdentifier
{
  return self->_pluginIdentifier;
}

- (void)setPluginIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pluginIdentifier, a3);
}

- (BOOL)shouldUseVideoKeys
{
  return self->_shouldUseVideoKeys;
}

- (void)setShouldUseVideoKeys:(BOOL)a3
{
  self->_shouldUseVideoKeys = a3;
}

- (double)originalDuration
{
  return self->_originalDuration;
}

- (void)setOriginalDuration:(double)a3
{
  self->_originalDuration = a3;
}

- (BOOL)_hasCropSuggestion
{
  return self->__hasCropSuggestion;
}

- (void)_setHasCropSuggestion:(BOOL)a3
{
  self->__hasCropSuggestion = a3;
}

- (BOOL)_hasPerspectiveCropSuggestion
{
  return self->__hasPerspectiveCropSuggestion;
}

- (void)_setHasPerspectiveCropSuggestion:(BOOL)a3
{
  self->__hasPerspectiveCropSuggestion = a3;
}

- (BOOL)_autoCropAdjusted
{
  return self->__autoCropAdjusted;
}

- (void)_setAutoCropAdjusted:(BOOL)a3
{
  self->__autoCropAdjusted = a3;
}

- (BOOL)_autoCropReset
{
  return self->__autoCropReset;
}

- (void)_setAutoCropReset:(BOOL)a3
{
  self->__autoCropReset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginIdentifier, 0);
}

@end
