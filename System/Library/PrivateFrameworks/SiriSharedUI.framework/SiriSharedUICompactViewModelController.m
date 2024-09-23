@implementation SiriSharedUICompactViewModelController

- (SiriSharedUICompactViewModelController)initWithConversation:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  SiriSharedUICompactViewModelController *v9;
  SiriSharedUICompactViewModel *v10;
  SiriSharedUICompactViewModel *viewModel;
  NSMutableDictionary *v12;
  NSMutableDictionary *serverUtteranceConversationIds;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SiriSharedUICompactViewModelController;
  v9 = -[SiriSharedUICompactViewModelController init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(SiriSharedUICompactViewModel);
    viewModel = v9->_viewModel;
    v9->_viewModel = v10;

    objc_storeStrong((id *)&v9->_conversation, a3);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    serverUtteranceConversationIds = v9->_serverUtteranceConversationIds;
    v9->_serverUtteranceConversationIds = v12;

    v9->_immersiveExperienceOn = 0;
    objc_storeWeak((id *)&v9->_delegate, v8);
    -[SiriSharedUICompactViewModelController inputTypeDidChange](v9, "inputTypeDidChange");
    -[SiriSharedUICompactViewModelController _processInitialConversationItemsForConversation:](v9, "_processInitialConversationItemsForConversation:", v7);
  }

  return v9;
}

- (void)setPreviousConversation:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  objc_storeStrong((id *)&self->_previousConversation, a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__SiriSharedUICompactViewModelController_setPreviousConversation___block_invoke;
  v7[3] = &unk_1EA89CFA0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __66__SiriSharedUICompactViewModelController_setPreviousConversation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processInitialConversationItemsForConversation:", *(_QWORD *)(a1 + 40));
}

- (void)setViewModelChangeObserver:(id)a3
{
  SiriSharedUICompactViewModel *v4;

  objc_storeWeak((id *)&self->_viewModelChangeObserver, a3);
  v4 = objc_alloc_init(SiriSharedUICompactViewModel);
  -[SiriSharedUICompactViewModelController _notifyObserverOfViewModelChangeWithDiff:](self, "_notifyObserverOfViewModelChangeWithDiff:", -[SiriSharedUICompactViewModelController _generateDiffFromViewModel:toViewModel:](self, "_generateDiffFromViewModel:toViewModel:", v4, self->_viewModel));

}

- (void)_notifyObserverOfViewModelChangeWithDiff:(unint64_t)a3
{
  void *v5;
  id v6;

  if (a3)
  {
    -[SiriSharedUICompactViewModelController viewModelChangeObserver](self, "viewModelChangeObserver");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUICompactViewModelController viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "compactViewModelDidChange:withDiff:", v5, a3);

  }
}

- (unint64_t)_generateDiffFromViewModel:(id)a3 toViewModel:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  unint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  _BOOL4 v42;
  const char *v43;
  NSObject *v44;
  uint32_t v45;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  id v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultTranscriptItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultTranscriptItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToArray:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v7, "addObject:", CFSTR("resultTranscriptItems"));
    v11 = 1;
  }
  objc_msgSend(v6, "conversationTranscriptItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conversationTranscriptItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToArray:", v13);

  if ((v14 & 1) == 0)
  {
    v11 |= 2uLL;
    objc_msgSend(v7, "addObject:", CFSTR("conversationTranscriptItems"));
  }
  objc_msgSend(v6, "additionalPlatterTranscriptItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionalPlatterTranscriptItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v53 != v21)
          objc_enumerationMutation(v17);
        v20 += objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "count");
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }
  v47 = v7;

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v23 = v16;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
  if (v24)
  {
    v25 = v24;
    v26 = 0;
    v27 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v49 != v27)
          objc_enumerationMutation(v23);
        v26 += objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "count");
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
    }
    while (v25);
    v29 = v26 == 0;
  }
  else
  {
    v29 = 1;
  }

  if (!v20 && v29 || (objc_msgSend(v17, "isEqualToArray:", v23) & 1) != 0)
  {
    v30 = v47;
  }
  else
  {
    v11 |= 0x20uLL;
    v30 = v47;
    objc_msgSend(v47, "addObject:", CFSTR("additionalPlatterTranscriptItems"));
  }
  objc_msgSend(v6, "serverUtterances");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverUtterances");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v31, "isEqualToArray:", v32);

  if ((v33 & 1) == 0)
  {
    v11 |= 4uLL;
    objc_msgSend(v30, "addObject:", CFSTR("serverUtterances"));
  }
  objc_msgSend(v6, "speechRecognitionHypothesis");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "speechRecognitionHypothesis");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34 != v35)
  {
    v11 |= 8uLL;
    objc_msgSend(v30, "addObject:", CFSTR("speechRecognitionHypothesis"));
  }
  objc_msgSend(v6, "latencyViewModel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latencyViewModel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v36, "viewShouldUpdateFromOldModel:", v37);

  if (v38)
  {
    v11 |= 0x40uLL;
    objc_msgSend(v30, "addObject:", CFSTR("latencyViewModel"));
  }
  v39 = objc_msgSend(v6, "inputType");
  if (v39 != objc_msgSend(v5, "inputType"))
  {
    v11 |= 0x10uLL;
    objc_msgSend(v30, "addObject:", CFSTR("inputType"));
  }
  v40 = objc_msgSend(v30, "count");
  v41 = *MEMORY[0x1E0CFE6A0];
  v42 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT);
  if (v40)
  {
    if (v42)
    {
      *(_DWORD *)buf = 136315906;
      v57 = "-[SiriSharedUICompactViewModelController _generateDiffFromViewModel:toViewModel:]";
      v58 = 2112;
      v59 = v30;
      v60 = 2112;
      v61 = v5;
      v62 = 2112;
      v63 = v6;
      v43 = "%s #viewModelDiff %@ differs between original %@ and updated %@";
      v44 = v41;
      v45 = 42;
LABEL_42:
      _os_log_impl(&dword_1DE0BF000, v44, OS_LOG_TYPE_DEFAULT, v43, buf, v45);
    }
  }
  else if (v42)
  {
    *(_DWORD *)buf = 136315138;
    v57 = "-[SiriSharedUICompactViewModelController _generateDiffFromViewModel:toViewModel:]";
    v43 = "%s #viewModelDiff no difference between viewModels";
    v44 = v41;
    v45 = 12;
    goto LABEL_42;
  }

  return v11;
}

- (void)setViewModel:(id)a3
{
  SiriSharedUICompactViewModel *viewModel;
  id v5;
  unint64_t v6;
  SiriSharedUICompactViewModel *v7;
  SiriSharedUICompactViewModel *v8;

  viewModel = self->_viewModel;
  v5 = a3;
  v6 = -[SiriSharedUICompactViewModelController _generateDiffFromViewModel:toViewModel:](self, "_generateDiffFromViewModel:toViewModel:", viewModel, v5);
  v7 = (SiriSharedUICompactViewModel *)objc_msgSend(v5, "copy");

  v8 = self->_viewModel;
  self->_viewModel = v7;

  -[SiriSharedUICompactViewModelController _notifyObserverOfViewModelChangeWithDiff:](self, "_notifyObserverOfViewModelChangeWithDiff:", v6);
}

- (void)_processInitialConversationItemsForConversation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "numberOfChildrenForItemWithIdentifier:", 0) >= 1)
  {
    objc_msgSend(v7, "lastItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sruif_itemsRelatedToIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SiriSharedUICompactViewModelController _processInsertedConversationItems:forConversation:](self, "_processInsertedConversationItems:forConversation:", v6, v7);
  }

}

- (void)conversationDidChangeWithTransaction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  char v26;
  SiriSharedUICompactViewModelController *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  id v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint8_t v56[128];
  uint8_t buf[4];
  const char *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "updatedItemIndexPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  v7 = v6;

  objc_msgSend(v3, "insertedItemIndexPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  v11 = v10;

  -[SiriSharedUICompactViewModelController conversation](self, "conversation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  v45 = v13;
  v42 = v11;
  v43 = v3;
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v52;
    v44 = *(_QWORD *)v52;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v52 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v12, "itemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "type") == 3)
        {
          objc_msgSend(v18, "aceObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_20;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[SiriSharedUICompactViewModelController serverUtteranceConversationIds](self, "serverUtteranceConversationIds");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKey:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "identifier");
            v23 = v15;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v22, "containsObject:", v24);

            v15 = v23;
            v16 = v44;

            v13 = v45;
            if (!v25)
            {
LABEL_20:

              v26 = 1;
              goto LABEL_21;
            }
          }

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      if (v15)
        continue;
      break;
    }
    v26 = 0;
LABEL_21:
    v11 = v42;
    v3 = v43;
  }
  else
  {
    v26 = 0;
  }

  if (!objc_msgSend(v11, "count") && (v26 & 1) == 0)
  {
    v27 = self;
    v28 = v13;
LABEL_31:
    -[SiriSharedUICompactViewModelController _processUpdatedConversationItemsAtIndexPaths:](v27, "_processUpdatedConversationItemsAtIndexPaths:", v28);
    goto LABEL_45;
  }
  if (objc_msgSend(v11, "count") == 1)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "itemAtIndexPath:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "type");

    if (v31 == 1)
    {
      v32 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v58 = "-[SiriSharedUICompactViewModelController conversationDidChangeWithTransaction:]";
        _os_log_impl(&dword_1DE0BF000, v32, OS_LOG_TYPE_DEFAULT, "%s The only item added to the conversation is an SASSpeechRecognized. Treating as an update", buf, 0xCu);
      }
      v27 = self;
      v28 = v11;
      goto LABEL_31;
    }
  }
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v11);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v48 != v37)
          objc_enumerationMutation(v34);
        v39 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
        objc_msgSend(v12, "itemAtIndexPath:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v40, "type") == 2)
        {
          v55 = v39;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[SiriSharedUICompactViewModelController _processUpdatedConversationItemsAtIndexPaths:](self, "_processUpdatedConversationItemsAtIndexPaths:", v41);

        }
        else
        {
          objc_msgSend(v33, "addObject:", v40);
        }

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v36);
  }

  if (objc_msgSend(v33, "count"))
    -[SiriSharedUICompactViewModelController _processInsertedConversationItems:forConversation:](self, "_processInsertedConversationItems:forConversation:", v33, v12);

  v11 = v42;
  v3 = v43;
  v13 = v45;
LABEL_45:

}

- (void)_processUpdatedConversationItemsAtIndexPaths:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  char v41;
  id obj;
  char v43;
  SiriSharedUICompactViewModelController *v44;
  id v45;
  uint64_t v46;
  _BOOL4 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  const __CFString *v55;
  uint8_t v56[4];
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SiriSharedUICompactViewModelController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[SiriSharedUICompactViewModelController alwaysShowRecognizedSpeech](self, "alwaysShowRecognizedSpeech");
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v7)
  {
    v8 = v7;
    v43 = 0;
    v41 = 0;
    v9 = 0;
    v45 = v6;
    v46 = *(_QWORD *)v49;
    v40 = 0;
    v44 = self;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v49 != v46)
          objc_enumerationMutation(obj);
        objc_msgSend(v5, "itemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "type") == 1 || objc_msgSend(v11, "type") == 2)
        {
          if (v9)
          {
            v12 = *MEMORY[0x1E0CFE6A0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_FAULT))
              -[SiriSharedUICompactViewModelController _processUpdatedConversationItemsAtIndexPaths:].cold.1(v56, &v57, v12);
          }
          if (AFDeviceSupportsSystemAssistantExperience())
            v13 = objc_msgSend(v11, "type") == 1;
          else
            v13 = 0;
          if (v47 || v13)
          {
            v14 = objc_alloc(MEMORY[0x1E0DA7A50]);
            -[SiriSharedUICompactViewModelController _userUtteranceForConversationItem:](self, "_userUtteranceForConversationItem:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "aceObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v14, "initWithUserUtterance:backingAceObject:isFinal:", v15, v16, objc_msgSend(v11, "type") == 1);

            self = v44;
            -[SiriSharedUICompactViewModelController viewModel](v44, "viewModel");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "speechRecognitionHypothesis");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v19, "isFinal") & 1) != 0)
            {
              v20 = 1;
            }
            else
            {
              -[SiriSharedUICompactViewModelController viewModel](v44, "viewModel");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "speechRecognitionHypothesis");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = v28 == 0;

            }
            v43 = v20;
            v6 = v45;
            if (v20 && !v47)
              v43 = AFDeviceSupportsSystemAssistantExperience();
          }
          else
          {
            v17 = v9;
          }
          if (AFDeviceSupportsSystemAssistantExperience() && objc_msgSend(v11, "type") == 1)
          {
            -[SiriSharedUICompactViewModelController _userUtteranceForConversationItem:](self, "_userUtteranceForConversationItem:", v11);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "bestTextInterpretation");
            v30 = objc_claimAutoreleasedReturnValue();

            v40 = v30;
            v6 = v45;
          }
          v9 = v17;
        }
        else
        {
          -[SiriSharedUICompactViewModelController serverUtteranceConversationIds](self, "serverUtteranceConversationIds");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKey:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v5;
          v26 = objc_msgSend(v23, "containsObject:", v24);

          v6 = v45;
          v41 |= v26;
          v5 = v25;
          self = v44;
        }
        objc_msgSend(v11, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v31);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    }
    while (v8);
  }
  else
  {
    v43 = 0;
    v41 = 0;
    v40 = 0;
    v9 = 0;
  }

  if (objc_msgSend(v6, "count"))
  {
    -[SiriSharedUICompactViewModelController delegate](self, "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "compactViewModelController:didProcessConversationItemsWithIdentifiers:", self, v6);

  }
  if (((v9 | v40) != 0) | v41 & 1)
  {
    v33 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v34 = CFSTR("updating existing viewModel with new hypothesis.");
      if ((v43 & 1) != 0)
        v34 = CFSTR("clearing previous content from viewModel since this hypothesis .");
      *(_DWORD *)buf = 136315394;
      v53 = "-[SiriSharedUICompactViewModelController _processUpdatedConversationItemsAtIndexPaths:]";
      v54 = 2112;
      v55 = v34;
      _os_log_impl(&dword_1DE0BF000, v33, OS_LOG_TYPE_DEFAULT, "%s #compact speechRecognitionHypothesis updated, %@", buf, 0x16u);
    }
    -[SiriSharedUICompactViewModelController viewModel](self, "viewModel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if ((v43 & 1) != 0)
    {
      v37 = (void *)objc_msgSend(v35, "copyWithConversationTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewUtterance:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v9, v40);

      -[SiriSharedUICompactViewModelController serverUtteranceConversationIds](self, "serverUtteranceConversationIds");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKey:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "removeAllObjects");

    }
    else
    {
      -[SiriSharedUICompactViewModelController _serverUtterancesToDisplayForConversation:](self, "_serverUtterancesToDisplayForConversation:", v5);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v36, "copyWithServerUtterances:speechRecognitionHypothesis:latencyViewUtterance:", v38, v9, v40);
    }

    -[SiriSharedUICompactViewModelController setViewModel:](self, "setViewModel:", v37);
  }

}

- (void)_processInsertedConversationItems:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  id *p_isa;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t m;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  SiriSharedUICompactViewModelController *v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t n;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  unint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  NSArray *v110;
  NSArray *v111;
  NSArray *v112;
  uint64_t v113;
  NSArray *storedTranscriptItems;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  SiriSharedUICompactViewModel *v118;
  SiriSharedUICompactViewModelController *v119;
  void *v120;
  SiriSharedUICompactViewModel *v121;
  int *v122;
  int v123;
  int v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  id obj;
  SiriSharedUICompactViewModelController *v130;
  uint64_t v131;
  void *v132;
  id v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _BYTE v158[21];
  _BYTE v159[128];
  uint8_t v160[4];
  int v161;
  uint8_t buf[4];
  const char *v163;
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  uint64_t v168;

  v168 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v125 = a4;
  -[SiriSharedUICompactViewModelController _clearAdditionalContentTranscriptItems](self, "_clearAdditionalContentTranscriptItems");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  v157 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v154, v167, 16);
  v130 = self;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v155;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v155 != v10)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v154 + 1) + 8 * i), "isSupplemental") & 1) != 0)
        {
          v124 = 1;
          v12 = v7;
          v13 = v125;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v154, v167, 16);
      if (v9)
        continue;
      break;
    }
  }

  -[SiriSharedUICompactViewModelController serverUtteranceConversationIds](self, "serverUtteranceConversationIds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v125;
  objc_msgSend(v125, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllObjects");

  v124 = 0;
LABEL_11:

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  v153 = 0u;
  v16 = v7;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v150, v166, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v151;
    v20 = *MEMORY[0x1E0D88630];
    while (2)
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v151 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v150 + 1) + 8 * j), "aceObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "propertyForKey:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23 && objc_msgSend(v23, "BOOLValue"))
        {

          v123 = 1;
          goto LABEL_22;
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v150, v166, 16);
      if (v18)
        continue;
      break;
    }
    v123 = 0;
LABEL_22:
    v13 = v125;
  }
  else
  {
    v123 = 0;
  }

  p_isa = (id *)&v130->super.isa;
  if (!SiriSharedUIDeviceIsPad()
    && (SiriSharedUIDeviceIsMac() & 1) == 0
    && !-[SiriSharedUICompactViewModelController immersiveExperienceOn](v130, "immersiveExperienceOn"))
  {
    v148 = 0u;
    v149 = 0u;
    v146 = 0u;
    v147 = 0u;
    v25 = v16;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v146, v165, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v147;
      while (2)
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v147 != v28)
            objc_enumerationMutation(v25);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v146 + 1) + 8 * k), "isImmersiveExperience") & 1) != 0)
          {

            p_isa = (id *)&v130->super.isa;
            -[SiriSharedUICompactViewModelController delegate](v130, "delegate");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "immersiveExperienceRequestedForViewModelController:", v130);

            -[SiriSharedUICompactViewModelController setImmersiveExperienceOn:](v130, "setImmersiveExperienceOn:", 1);
            v13 = v125;
            goto LABEL_37;
          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v146, v165, 16);
        v13 = v125;
        if (v27)
          continue;
        break;
      }
    }

    p_isa = (id *)&v130->super.isa;
  }
LABEL_37:
  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  obj = v16;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v164, 16);
  if (!v31)
  {
    v128 = 0;
    goto LABEL_71;
  }
  v32 = v31;
  v128 = 0;
  v131 = *(_QWORD *)v143;
  v122 = &v161;
  while (2)
  {
    v33 = 0;
    do
    {
      if (*(_QWORD *)v143 != v131)
        objc_enumerationMutation(obj);
      v34 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * v33);
      objc_msgSend(v34, "aceObject", v122);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(p_isa, "delegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "siriDeviceLockedForViewModelController:", p_isa);

        if (v37)
        {
          v57 = *MEMORY[0x1E0CFE6A0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v163 = "-[SiriSharedUICompactViewModelController _processInsertedConversationItems:forConversation:]";
            _os_log_impl(&dword_1DE0BF000, v57, OS_LOG_TYPE_DEFAULT, "%s Not displaying SAABPersonPicker since device is passcode locked", buf, 0xCu);
          }

          goto LABEL_71;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(p_isa, "serverUtteranceConversationIds");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKey:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v40)
        {
          objc_msgSend(p_isa, "serverUtteranceConversationIds");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v13, "identifier");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setObject:forKey:", v42, v43);

        }
        objc_msgSend(p_isa, "serverUtteranceConversationIds");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKey:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "identifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObject:", v47);
        goto LABEL_48;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v34, "presentationState") != 3)
      {
        objc_msgSend(p_isa, "delegate");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "compactViewModelController:requestsTranscriptItemForAceObject:", p_isa, v35);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v44, "viewController");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setAceObject:", v35);

        objc_msgSend(v44, "viewController");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "wasAddedToTranscript");

        objc_msgSend(v127, "addObject:", v44);
        objc_msgSend(v126, "addObject:", v44);
        objc_msgSend(v44, "viewController");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v45, "configureForConversationStorable:", v34);
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_50;
        objc_msgSend(p_isa, "_instrumentationManager");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "currentInstrumentationTurnContext");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "turnIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setInstrumentationTurnIdentifier:", v55);

        v13 = v125;
LABEL_48:

        p_isa = (id *)&v130->super.isa;
        goto LABEL_49;
      }
      if (objc_msgSend(v34, "type") == 1)
      {
        if (v128)
        {
          v48 = *MEMORY[0x1E0CFE6A0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_FAULT))
            -[SiriSharedUICompactViewModelController _processInsertedConversationItems:forConversation:].cold.1(v160, v122, v48);
        }
        if (objc_msgSend(p_isa, "alwaysShowRecognizedSpeech"))
        {
          v49 = objc_alloc(MEMORY[0x1E0DA7A50]);
          objc_msgSend(p_isa, "_userUtteranceForConversationItem:", v34);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "aceObject");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "initWithUserUtterance:backingAceObject:isFinal:", v44, v45, 1);
          v46 = v128;
          v128 = (void *)v50;
LABEL_49:

LABEL_50:
        }
      }
      objc_msgSend(v34, "identifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "addObject:", v51);

      ++v33;
    }
    while (v32 != v33);
    v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v164, 16);
    v32 = v56;
    if (v56)
      continue;
    break;
  }
LABEL_71:

  if (objc_msgSend(v126, "count"))
    objc_storeStrong(p_isa + 8, v126);
  if (objc_msgSend(v133, "count"))
  {
    objc_msgSend(p_isa, "delegate");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "compactViewModelController:didProcessConversationItemsWithIdentifiers:", p_isa, v133);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v127, "count"))
    goto LABEL_77;
  -[SiriSharedUICompactViewModelController serverUtteranceConversationIds](v130, "serverUtteranceConversationIds");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "identifier");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "objectForKey:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "count");

  if (v63)
  {
LABEL_77:
    v140 = 0u;
    v141 = 0u;
    v138 = 0u;
    v139 = 0u;
    v64 = v127;
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v138, v159, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v139;
      do
      {
        for (m = 0; m != v66; ++m)
        {
          if (*(_QWORD *)v139 != v67)
            objc_enumerationMutation(v64);
          v69 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * m);
          v70 = objc_msgSend(v69, "platterCategory");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectForKey:", v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v72)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "setObject:forKey:", v73, v71);

          }
          objc_msgSend(v59, "objectForKeyedSubscript:", v71);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "addObject:", v69);

        }
        v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v138, v159, 16);
      }
      while (v66);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "objectForKeyedSubscript:", &unk_1EA8ADA28);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77)
  {
    objc_msgSend(v59, "objectForKeyedSubscript:", &unk_1EA8ADA28);
    v78 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v59, "removeObjectForKey:", &unk_1EA8ADA28);
    v76 = (void *)v78;
  }
  objc_msgSend(v59, "objectForKeyedSubscript:", &unk_1EA8ADA40);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    objc_msgSend(v59, "objectForKeyedSubscript:", &unk_1EA8ADA40);
    v80 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v59, "removeObjectForKey:", &unk_1EA8ADA40);
    v75 = (void *)v80;
  }
  v81 = v130;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v83 = v59;
  v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v134, v158, 16);
  if (v84)
  {
    v85 = v84;
    v86 = *(_QWORD *)v135;
    do
    {
      for (n = 0; n != v85; ++n)
      {
        if (*(_QWORD *)v135 != v86)
          objc_enumerationMutation(v83);
        objc_msgSend(v83, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * n));
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "addObject:", v88);

      }
      v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v134, v158, 16);
    }
    while (v85);
  }

  if (!v128)
  {
    -[SiriSharedUICompactViewModelController viewModel](v130, "viewModel");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "speechRecognitionHypothesis");
    v128 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v124)
  {
    -[SiriSharedUICompactViewModelController viewModel](v130, "viewModel");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "resultTranscriptItems");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "arrayByAddingObjectsFromArray:", v75);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "mutableCopy");

    -[SiriSharedUICompactViewModelController viewModel](v130, "viewModel");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "conversationTranscriptItems");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "arrayByAddingObjectsFromArray:", v76);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "mutableCopy");

    v98 = objc_msgSend(v82, "count");
    -[SiriSharedUICompactViewModelController viewModel](v130, "viewModel");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "additionalPlatterTranscriptItems");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v100, "count");

    if (v98 == v101 && objc_msgSend(v82, "count"))
    {
      v132 = (void *)v97;
      v102 = 0;
      v81 = v130;
      do
      {
        -[SiriSharedUICompactViewModelController viewModel](v81, "viewModel");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "additionalPlatterTranscriptItems");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "objectAtIndexedSubscript:", v102);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "objectAtIndexedSubscript:", v102);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = (void *)objc_msgSend(v106, "mutableCopy");
        objc_msgSend(v105, "arrayByAddingObjectsFromArray:", v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "setObject:atIndexedSubscript:", v108, v102);

        v81 = v130;
        ++v102;
      }
      while (objc_msgSend(v82, "count") > v102);
      v75 = (void *)v93;
      v76 = v132;
    }
    else
    {
      v75 = (void *)v93;
      v76 = (void *)v97;
      v81 = v130;
    }
  }
  else if (v123 && !objc_msgSend(v75, "count"))
  {
    v109 = AFDeviceSupportsSystemAssistantExperience();
    -[SiriSharedUICompactViewModelController viewModel](v130, "viewModel");
    v110 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v111 = v110;
    if (v109)
    {
      -[NSArray conversationTranscriptItems](v110, "conversationTranscriptItems");
      v112 = (NSArray *)objc_claimAutoreleasedReturnValue();

      v113 = -[NSArray count](v112, "count");
      storedTranscriptItems = v112;
      if (!v113)
        storedTranscriptItems = v130->_storedTranscriptItems;
      v115 = v76;
      v76 = (void *)-[NSArray mutableCopy](storedTranscriptItems, "mutableCopy");
    }
    else
    {
      -[NSArray resultTranscriptItems](v110, "resultTranscriptItems");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = objc_msgSend(v115, "mutableCopy");

      v112 = v111;
      v75 = (void *)v116;
    }

  }
  v117 = -[SiriSharedUICompactViewModelController inputType](v81, "inputType");
  v118 = [SiriSharedUICompactViewModel alloc];
  -[SiriSharedUICompactViewModelController _serverUtterancesToDisplayForConversation:](v81, "_serverUtterancesToDisplayForConversation:", v125);
  v119 = v81;
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = -[SiriSharedUICompactViewModel initWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:](v118, "initWithInputType:resultTranscriptItems:conversationTranscriptItems:additionalPlatterTranscriptItems:serverUtterances:speechRecognitionHypothesis:", v117, v75, v76, v82, v120, v128);

  -[SiriSharedUICompactViewModelController setViewModel:](v119, "setViewModel:", v121);
}

- (id)_userUtteranceForConversationItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 1)
  {
    objc_msgSend(v3, "aceObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recognition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "refId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "af_userUtteranceValueWithRefId:sessionId:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v3, "type") != 2)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "aceObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "af_userUtteranceValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v8;
}

- (id)_serverUtterancesToDisplayForConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  os_log_t *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  os_log_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  os_log_t *v26;
  os_log_t v27;
  NSObject *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v35;
  id v36;
  uint64_t v37;
  id obj;
  SiriSharedUICompactViewModelController *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v39 = self;
  -[SiriSharedUICompactViewModelController serverUtteranceConversationIds](self, "serverUtteranceConversationIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v41;
    v13 = (os_log_t *)MEMORY[0x1E0CFE6A0];
    *(_QWORD *)&v10 = 136315650;
    v35 = v10;
    do
    {
      v14 = 0;
      v37 = v11;
      do
      {
        if (*(_QWORD *)v41 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v14);
        objc_msgSend(v4, "itemWithIdentifier:", v15, v35);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "aceObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = v18;
            objc_msgSend(v19, "text");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
              objc_msgSend(v36, "addObject:", v19);
            v18 = v19;
          }
          else
          {
            v25 = v12;
            v26 = v13;
            v27 = *v13;
            if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
            {
              v28 = v27;
              objc_msgSend(v15, "UUIDString");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = (objc_class *)objc_opt_class();
              NSStringFromClass(v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v35;
              v45 = "-[SiriSharedUICompactViewModelController _serverUtterancesToDisplayForConversation:]";
              v46 = 2112;
              v47 = v29;
              v48 = 2112;
              v49 = v31;
              _os_log_impl(&dword_1DE0BF000, v28, OS_LOG_TYPE_DEFAULT, "%s #compact Removing %@ because it is no longer an SAUIAssistantUtteranceView. New type: %@", buf, 0x20u);

            }
            -[SiriSharedUICompactViewModelController serverUtteranceConversationIds](v39, "serverUtteranceConversationIds");
            v19 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "identifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKey:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "removeObject:", v15);

            v13 = v26;
            v12 = v25;
            v11 = v37;
          }
        }
        else
        {
          v21 = *v13;
          if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
          {
            v22 = v21;
            objc_msgSend(v15, "UUIDString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v45 = "-[SiriSharedUICompactViewModelController _serverUtterancesToDisplayForConversation:]";
            v46 = 2112;
            v47 = v23;
            _os_log_impl(&dword_1DE0BF000, v22, OS_LOG_TYPE_DEFAULT, "%s #compact Removing %@ because it is no longer in the conversation", buf, 0x16u);

          }
          -[SiriSharedUICompactViewModelController serverUtteranceConversationIds](v39, "serverUtteranceConversationIds");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "identifier");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeObject:", v15);

        }
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v11);
  }

  return v36;
}

- (void)_clearAdditionalContentTranscriptItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[SiriSharedUITranscriptItem additionalContentViewPlatterCategories](SiriSharedUITranscriptItem, "additionalContentViewPlatterCategories", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v4);
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v8);

      if (!--v6)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (!v6)
          break;
      }
    }
  }

  v9 = (void *)objc_msgSend(v3, "copy");
  -[SiriSharedUICompactViewModelController viewModel](self, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithAdditionalPlatterTranscriptItems:", v9);

  -[SiriSharedUICompactViewModelController setViewModel:](self, "setViewModel:", v11);
}

- (int64_t)inputType
{
  void *v3;
  int64_t v4;

  -[SiriSharedUICompactViewModelController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "inputTypeForCompactViewModelController:", self);

  return v4;
}

- (void)inputTypeDidChange
{
  int64_t v3;
  void *v4;
  id v5;

  v3 = -[SiriSharedUICompactViewModelController inputType](self, "inputType");
  -[SiriSharedUICompactViewModelController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "copyWithInputType:", v3);

  -[SiriSharedUICompactViewModelController setViewModel:](self, "setViewModel:", v5);
}

- (void)revealUserUtterance:(id)a3 backingAceObject:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (objc_class *)MEMORY[0x1E0DA7A50];
  v7 = a4;
  v8 = a3;
  v11 = (id)objc_msgSend([v6 alloc], "initWithUserUtterance:backingAceObject:isFinal:", v8, v7, 1);

  -[SiriSharedUICompactViewModelController viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithSpeechRecognitionHypothesis:", v11);
  -[SiriSharedUICompactViewModelController setViewModel:](self, "setViewModel:", v10);

}

- (void)resetViewsAndClearASR:(BOOL)a3
{
  NSObject *v5;
  SiriSharedUICompactViewModel *v6;
  void *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[SiriSharedUICompactViewModelController resetViewsAndClearASR:]";
    _os_log_impl(&dword_1DE0BF000, v5, OS_LOG_TYPE_DEFAULT, "%s #suppressSnippet: Reset previous view except for ASR.", (uint8_t *)&v9, 0xCu);
  }
  v6 = objc_alloc_init(SiriSharedUICompactViewModel);
  if (!a3)
  {
    -[SiriSharedUICompactViewModel speechRecognitionHypothesis](self->_viewModel, "speechRecognitionHypothesis");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SiriSharedUICompactViewModel copyWithSpeechRecognitionHypothesis:](v6, "copyWithSpeechRecognitionHypothesis:", v7);

    v6 = (SiriSharedUICompactViewModel *)v8;
  }
  -[SiriSharedUICompactViewModelController setViewModel:](self, "setViewModel:", v6);

}

- (void)revealLatencyView
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[SiriSharedUICompactViewModelController revealLatencyView]";
  _os_log_debug_impl(&dword_1DE0BF000, log, OS_LOG_TYPE_DEBUG, "%s Attempting to display latency view", (uint8_t *)&v1, 0xCu);
}

- (void)updateLatencySummary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEBUG))
    -[SiriSharedUICompactViewModelController updateLatencySummary:].cold.1((uint64_t)v4, v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEA88]), "initWithString:correctionIdentifier:", v4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA7A50]), "initWithUserUtterance:backingAceObject:isFinal:", v6, 0, 0);
  -[SiriSharedUICompactViewModelController viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithSpeechRecognitionHypothesis:", v7);
  -[SiriSharedUICompactViewModelController setViewModel:](self, "setViewModel:", v9);

}

- (void)updateCurrentRequestText:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (objc_class *)MEMORY[0x1E0CFEA88];
  v5 = a3;
  v13 = (id)objc_msgSend([v4 alloc], "initWithString:correctionIdentifier:", v5, 0);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA7A50]), "initWithUserUtterance:backingAceObject:isFinal:", v13, 0, 1);
  -[SiriSharedUICompactViewModelController viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithConversationTranscriptItems:serverUtterances:speechRecognitionHypothesis:latencyViewUtterance:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v6, 0);

  -[SiriSharedUICompactViewModelController serverUtteranceConversationIds](self, "serverUtteranceConversationIds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriSharedUICompactViewModelController conversation](self, "conversation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[SiriSharedUICompactViewModelController setViewModel:](self, "setViewModel:", v8);
}

- (BOOL)alwaysShowRecognizedSpeech
{
  SiriSharedUICompactViewModelController *v2;
  void *v3;

  v2 = self;
  -[SiriSharedUICompactViewModelController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "compactViewModelControllerShouldAlwaysShowRecognizedSpeech:", v2);

  return (char)v2;
}

- (id)_instrumentationManager
{
  return (id)objc_msgSend(MEMORY[0x1E0DA7A48], "sharedManager");
}

- (SiriSharedUICompactViewModelChangeObserving)viewModelChangeObserver
{
  return (SiriSharedUICompactViewModelChangeObserving *)objc_loadWeakRetained((id *)&self->_viewModelChangeObserver);
}

- (SiriSharedUICompactViewModelControllerDelegate)delegate
{
  return (SiriSharedUICompactViewModelControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AFConversation)previousConversation
{
  return self->_previousConversation;
}

- (SiriSharedUICompactViewModel)viewModel
{
  return self->_viewModel;
}

- (AFConversation)conversation
{
  return self->_conversation;
}

- (BOOL)immersiveExperienceOn
{
  return self->_immersiveExperienceOn;
}

- (void)setImmersiveExperienceOn:(BOOL)a3
{
  self->_immersiveExperienceOn = a3;
}

- (NSMutableDictionary)serverUtteranceConversationIds
{
  return self->_serverUtteranceConversationIds;
}

- (NSArray)storedTranscriptItems
{
  return self->_storedTranscriptItems;
}

- (void)setStoredTranscriptItems:(id)a3
{
  objc_storeStrong((id *)&self->_storedTranscriptItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedTranscriptItems, 0);
  objc_storeStrong((id *)&self->_serverUtteranceConversationIds, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_previousConversation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_viewModelChangeObserver);
}

- (void)_processUpdatedConversationItemsAtIndexPaths:(NSObject *)a3 .cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[SiriSharedUICompactViewModelController _processUpdatedConversationItemsAtIndexPaths:]";
  OUTLINED_FUNCTION_0_0(&dword_1DE0BF000, (int)a2, a3, "%s #compact The conversation updated multiple speech conversation items, but the compact presentation can only show one at a time. The user will only see the last recognition in the list of presented items.", a1);
}

- (void)_processInsertedConversationItems:(NSObject *)a3 forConversation:.cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[SiriSharedUICompactViewModelController _processInsertedConversationItems:forConversation:]";
  OUTLINED_FUNCTION_0_0(&dword_1DE0BF000, (int)a2, a3, "%s #compact Conversation inserted multiple recognized speech conversation items, but the compact presentation can only show one at a time. The user will only see the last recognition in the list of presented items.", a1);
}

- (void)updateLatencySummary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[SiriSharedUICompactViewModelController updateLatencySummary:]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_1DE0BF000, a2, OS_LOG_TYPE_DEBUG, "%s Updating latency summary to %@", (uint8_t *)&v2, 0x16u);
}

@end
