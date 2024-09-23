@implementation NSWritingToolsProofreadingController

- (NSWritingToolsProofreadingController)init
{
  -[NSWritingToolsProofreadingController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (NSWritingToolsProofreadingController)initWithContextString:(id)a3 contextRange:(_NSRange)a4 delegate:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  NSWritingToolsProofreadingController *v9;
  NSWritingToolsProofreadingController *v10;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v12.receiver = self;
  v12.super_class = (Class)NSWritingToolsProofreadingController;
  v9 = -[NSWritingToolsProofreadingController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[NSWritingToolsProofreadingController setContextString:](v9, "setContextString:", a3);
    -[NSWritingToolsProofreadingController setDelegate:](v10, "setDelegate:", a5);
    -[NSWritingToolsProofreadingController setFinished:](v10, "setFinished:", 1);
    -[NSWritingToolsProofreadingController setEditTracker:](v10, "setEditTracker:", -[NSWritingToolsEditTracker initWithContextRange:]([NSWritingToolsEditTracker alloc], "initWithContextRange:", location, length));
    -[NSWritingToolsProofreadingController setSuggestionsByUUID:](v10, "setSuggestionsByUUID:", objc_alloc_init(MEMORY[0x1E0C99E08]));
    -[NSWritingToolsProofreadingController setSuggestionsByRange:](v10, "setSuggestionsByRange:", objc_alloc_init(MEMORY[0x1E0C99DE8]));
    v10->_acceptOpenSuggestionsInFinish = 1;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v4;

  if (!-[NSWritingToolsProofreadingController finished](self, "finished"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSWritingToolsProofreadingController.m"), 75, CFSTR("proofreading controller was deallocated without calling finish."));

  v4.receiver = self;
  v4.super_class = (Class)NSWritingToolsProofreadingController;
  -[NSWritingToolsProofreadingController dealloc](&v4, sel_dealloc);
}

- (NSArray)suggestions
{
  return (NSArray *)(id)-[NSMutableArray copy](-[NSWritingToolsProofreadingController suggestionsByRange](self, "suggestionsByRange"), "copy");
}

- (void)addSuggestionWithUUID:(id)a3 originalRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  NSWritingToolsProofreadingSuggestion *v17;
  NSWritingToolsProofreadingSuggestion *v18;
  NSWritingToolsEditTracker *editTracker;
  uint64_t v20;
  uint64_t v21;
  id v22;

  length = a4.length;
  location = a4.location;
  v22 = a5;
  if (-[NSMutableArray lastObject](self->_suggestionsByRange, "lastObject"))
  {
    v10 = objc_msgSend((id)-[NSMutableArray lastObject](self->_suggestionsByRange, "lastObject"), "originalRange");
    if (v10 + v11 > location)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSWritingToolsProofreadingController.m"), 90, CFSTR("suggestion received out of sequential order."));
  }
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_suggestionsByUUID, "objectForKeyedSubscript:", a3))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSWritingToolsProofreadingController.m"), 91, CFSTR("suggestion with uuid already exists."));
  v12 = -[NSWritingToolsEditTracker rangeOfSuggestionWithRange:UUID:applyDelta:](self->_editTracker, "rangeOfSuggestionWithRange:UUID:applyDelta:", location, length, a3, 0);
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = v12;
    v15 = v13;
    objc_loadWeak((id *)&self->_delegate);
    v16 = objc_opt_respondsToSelector();
    if ((v16 & 1) == 0
      || objc_msgSend(objc_loadWeak((id *)&self->_delegate), "proofreadingController:replaceCharactersInRange:state:replacementAttributedString:", self, v14, v15, 0, &v22))
    {
      v17 = [NSWritingToolsProofreadingSuggestion alloc];
      v18 = -[NSWritingToolsProofreadingSuggestion initWithUUID:originalRange:replacementString:state:](v17, "initWithUUID:originalRange:replacementString:state:", a3, location, length, v22, 0);
      if ((v16 & 1) == 0)
        objc_msgSend(objc_loadWeak((id *)&self->_delegate), "proofreadingController:replaceCharactersInRange:withSuggestion:state:", self, v14, v15, v18, 0);
      editTracker = self->_editTracker;
      v20 = -[NSWritingToolsProofreadingSuggestion originalRange](v18, "originalRange");
      -[NSWritingToolsEditTracker addEditForSuggestionWithRange:lengthDelta:UUID:](editTracker, "addEditForSuggestionWithRange:lengthDelta:UUID:", v20, v21, -[NSWritingToolsProofreadingSuggestion lengthDelta](v18, "lengthDelta"), -[NSWritingToolsProofreadingSuggestion uuid](v18, "uuid"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_suggestionsByUUID, "setObject:forKeyedSubscript:", v18, -[NSWritingToolsProofreadingSuggestion uuid](v18, "uuid"));
      -[NSMutableArray addObject:](self->_suggestionsByRange, "addObject:", v18);
      -[NSWritingToolsProofreadingController setFinished:](self, "setFinished:", 0);

    }
  }
}

- (void)updateSuggestionWithUUID:(id)a3 state:(int64_t)a4
{
  void *v8;
  _BOOL8 v9;
  NSWritingToolsEditTracker *editTracker;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSWritingToolsEditTracker *v15;
  uint64_t v16;
  uint64_t v17;

  if (!-[NSMutableDictionary objectForKeyedSubscript:](self->_suggestionsByUUID, "objectForKeyedSubscript:"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSWritingToolsProofreadingController.m"), 128, CFSTR("suggestion updated before being added."));
  v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_suggestionsByUUID, "objectForKeyedSubscript:", a3);
  v9 = !objc_msgSend(v8, "state") || objc_msgSend(v8, "state") == 1 || objc_msgSend(v8, "state") == 2;
  editTracker = self->_editTracker;
  v11 = objc_msgSend(v8, "originalRange");
  v13 = -[NSWritingToolsEditTracker rangeOfSuggestionWithRange:UUID:applyDelta:](editTracker, "rangeOfSuggestionWithRange:UUID:applyDelta:", v11, v12, objc_msgSend(v8, "uuid"), v9);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    a4 = 4;
  }
  else if (objc_msgSend(objc_loadWeak((id *)&self->_delegate), "proofreadingController:replaceCharactersInRange:withSuggestion:state:", self, v13, v14, v8, a4))
  {
    -[NSWritingToolsEditTracker removeEditForSuggestionWithUUID:](self->_editTracker, "removeEditForSuggestionWithUUID:", objc_msgSend(v8, "uuid"));
    if (a4 != 3)
    {
      v15 = self->_editTracker;
      v16 = objc_msgSend(v8, "originalRange");
      -[NSWritingToolsEditTracker addEditForSuggestionWithRange:lengthDelta:UUID:](v15, "addEditForSuggestionWithRange:lengthDelta:UUID:", v16, v17, objc_msgSend(v8, "lengthDelta"), objc_msgSend(v8, "uuid"));
    }
  }
  objc_msgSend(v8, "setState:", a4);
}

- (void)finish:(BOOL)a3
{
  NSMutableArray *suggestionsByRange;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSWritingToolsEditTracker *editTracker;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v17 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  if (!-[NSWritingToolsProofreadingController finished](self, "finished"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    suggestionsByRange = self->_suggestionsByRange;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](suggestionsByRange, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      if (v17)
        v8 = 2;
      else
        v8 = 3;
      v16 = v8;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(suggestionsByRange);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (!objc_msgSend(v10, "state") || objc_msgSend(v10, "state") == 1)
          {
            editTracker = self->_editTracker;
            v12 = objc_msgSend(v10, "originalRange");
            v14 = -[NSWritingToolsEditTracker rangeOfSuggestionWithRange:UUID:applyDelta:](editTracker, "rangeOfSuggestionWithRange:UUID:applyDelta:", v12, v13, objc_msgSend(v10, "uuid"), 1);
            if (v14 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(objc_loadWeak((id *)&self->_delegate), "proofreadingController:replaceCharactersInRange:withSuggestion:state:", self, v14, v15, v10, v16);
              if (!v17)
                -[NSWritingToolsEditTracker removeEditForSuggestionWithUUID:](self->_editTracker, "removeEditForSuggestionWithUUID:", objc_msgSend(v10, "uuid"));
            }
          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](suggestionsByRange, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }
    -[NSMutableArray removeAllObjects](self->_suggestionsByRange, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_suggestionsByUUID, "removeAllObjects");
    -[NSWritingToolsProofreadingController setFinished:](self, "setFinished:", 1);
  }
}

- (void)finish
{
  -[NSWritingToolsProofreadingController finish:](self, "finish:", -[NSWritingToolsProofreadingController acceptOpenSuggestionsInFinish](self, "acceptOpenSuggestionsInFinish"));
}

- (id)suggestionWithUUID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_suggestionsByUUID, "objectForKeyedSubscript:", a3);
}

- (NSAttributedString)contextString
{
  return self->_contextString;
}

- (void)setContextString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSWritingToolsProofreadingControllerDelegate)delegate
{
  return (NSWritingToolsProofreadingControllerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSWritingToolsEditTracker)editTracker
{
  return self->_editTracker;
}

- (void)setEditTracker:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)acceptOpenSuggestionsInFinish
{
  return self->_acceptOpenSuggestionsInFinish;
}

- (void)setAcceptOpenSuggestionsInFinish:(BOOL)a3
{
  self->_acceptOpenSuggestionsInFinish = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSMutableDictionary)suggestionsByUUID
{
  return self->_suggestionsByUUID;
}

- (void)setSuggestionsByUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableArray)suggestionsByRange
{
  return self->_suggestionsByRange;
}

- (void)setSuggestionsByRange:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
