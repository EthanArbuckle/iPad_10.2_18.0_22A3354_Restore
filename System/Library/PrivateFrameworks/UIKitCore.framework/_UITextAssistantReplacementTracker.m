@implementation _UITextAssistantReplacementTracker

- (id)newEditTracker
{
  return (id)objc_msgSend(objc_alloc((Class)&sel_convertRectFromSelectedFrameCoordinates_[24]), "initWithContextRange:", 0, self->_sessionContextRange.length);
}

- (id)initFromSessionContext:(id)a3 offsetForSessionRange:(unint64_t)a4 withProofreadingController:(id)a5
{
  id v9;
  id v10;
  _UITextAssistantReplacementTracker *v11;
  _UITextAssistantReplacementTracker *v12;
  uint64_t v13;
  NSUUID *contextUUID;
  NSUInteger v15;
  void *v16;
  uint64_t v17;
  NSAttributedString *originalText;
  uint64_t v19;
  NSAttributedString *rewrittenText;
  uint64_t v21;
  NSWritingToolsEditTracker *editTracker;
  NSMutableArray *v23;
  NSMutableArray *replacementDeliveryUUIDs;
  NSMutableDictionary *v25;
  NSMutableDictionary *replacementChunksByUUID;
  objc_super v28;

  v9 = a3;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)_UITextAssistantReplacementTracker;
  v11 = -[_UITextAssistantReplacementTracker init](&v28, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_originalContext, a3);
    objc_msgSend(v9, "uuid");
    v13 = objc_claimAutoreleasedReturnValue();
    contextUUID = v12->_contextUUID;
    v12->_contextUUID = (NSUUID *)v13;

    v12->_offsetForSessionRange = a4;
    v12->_sessionContextRange.location = objc_msgSend(v9, "range");
    v12->_sessionContextRange.length = v15;
    objc_msgSend(v9, "attributedText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attributedSubstringFromRange:", v12->_sessionContextRange.location, v12->_sessionContextRange.length);
    v17 = objc_claimAutoreleasedReturnValue();
    originalText = v12->_originalText;
    v12->_originalText = (NSAttributedString *)v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E16EDF20);
    rewrittenText = v12->_rewrittenText;
    v12->_rewrittenText = (NSAttributedString *)v19;

    objc_storeStrong((id *)&v12->_proofreadingController, a5);
    v12->_proofreading = v10 != 0;
    if (v10)
      v12->_compositionSessionState = -1;
    v21 = -[_UITextAssistantReplacementTracker newEditTracker](v12, "newEditTracker");
    editTracker = v12->_editTracker;
    v12->_editTracker = (NSWritingToolsEditTracker *)v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    replacementDeliveryUUIDs = v12->_replacementDeliveryUUIDs;
    v12->_replacementDeliveryUUIDs = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    replacementChunksByUUID = v12->_replacementChunksByUUID;
    v12->_replacementChunksByUUID = v25;

  }
  return v12;
}

- (void)setCompositionSessionState:(int64_t)a3
{
  _BOOL4 v6;
  NSWritingToolsEditTracker *v7;
  NSWritingToolsEditTracker *editTracker;
  NSAttributedString *v9;
  NSAttributedString *rewrittenText;
  NSAttributedString *processedOriginalText;
  NSAttributedString *unprocessedOriginalText;
  void *v13;

  v6 = -[_UITextAssistantReplacementTracker isProofreading](self, "isProofreading");
  if (a3 != -1 && v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantReplacementTracker.m"), 108, CFSTR("Can't set replacement tracker's compositionSessionState to anything other than Invalid when proofreading"));

  }
  if (self->_compositionSessionState != a3)
  {
    self->_compositionSessionState = a3;
    if (!a3)
    {
      v7 = -[_UITextAssistantReplacementTracker newEditTracker](self, "newEditTracker");
      editTracker = self->_editTracker;
      self->_editTracker = v7;

      self->_finished = 0;
      -[NSMutableArray removeAllObjects](self->_replacementDeliveryUUIDs, "removeAllObjects");
      -[NSMutableDictionary removeAllObjects](self->_replacementChunksByUUID, "removeAllObjects");
      -[NSMutableDictionary removeAllObjects](self->_initialReplacementChunksByUUID, "removeAllObjects");
      v9 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E16EDF20);
      rewrittenText = self->_rewrittenText;
      self->_rewrittenText = v9;

    }
    processedOriginalText = self->_processedOriginalText;
    self->_processedOriginalText = 0;

    unprocessedOriginalText = self->_unprocessedOriginalText;
    self->_unprocessedOriginalText = 0;

  }
}

- (id)recordRewrittenText:(id)a3 forRange:(_NSRange)a4 withContext:(id)a5 finished:(BOOL)a6
{
  _BOOL4 v6;
  NSUInteger length;
  NSUInteger location;
  id v12;
  void *v13;
  NSUUID *contextUUID;
  NSUUID *v15;
  NSUUID *v16;
  NSUUID *v17;
  char v18;
  WTContext *v19;
  WTContext *v20;
  WTContext *v21;
  char v22;
  NSAttributedString *rewrittenText;
  NSAttributedString **p_rewrittenText;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  NSAttributedString *processedOriginalText;
  NSAttributedString *unprocessedOriginalText;
  _BOOL4 v34;
  NSUUID *fallbackDeliveryID;
  unint64_t v36;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  NSWritingToolsEditTracker *editTracker;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  NSAttributedString *v66;
  _UIWritingToolsReplacementChunk *v67;
  void *v69;
  void *v70;
  char v71;
  unint64_t v72;
  NSObject *v73;
  const __CFString *v74;
  unint64_t v75;
  NSObject *v76;
  void *v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  int v82;
  unint64_t v83;
  NSObject *v84;
  unint64_t v85;
  NSObject *v86;
  NSMutableArray *replacementDeliveryUUIDs;
  NSObject *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  unint64_t v92;
  NSObject *v93;
  unint64_t v94;
  NSObject *v95;
  unint64_t v96;
  NSObject *v97;
  NSObject *v98;
  const __CFString *v99;
  void *v101;
  _BOOL4 v102;
  void *v103;
  NSUInteger v104;
  id v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint8_t v111[128];
  uint8_t buf[4];
  uint64_t v113;
  uint64_t v114;

  v6 = a6;
  length = a4.length;
  location = a4.location;
  v114 = *MEMORY[0x1E0C80C00];
  v105 = a3;
  v12 = a5;
  objc_msgSend(v12, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  contextUUID = self->_contextUUID;
  v15 = v13;
  v16 = contextUUID;
  if (v15 == v16)
  {

  }
  else
  {
    v17 = v16;
    if (v15 && v16)
    {
      v18 = -[NSUUID isEqual:](v15, "isEqual:", v16);

      if ((v18 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    -[NSUUID handleFailureInMethod:object:file:lineNumber:description:](v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantReplacementTracker.m"), 151, CFSTR("Mismatched composition session context"));
  }

LABEL_8:
  v19 = self->_originalContext;
  v20 = (WTContext *)v12;
  v21 = v20;
  if (v19 == v20)
  {

    goto LABEL_16;
  }
  if (v20 && v19)
  {
    v22 = -[WTContext isEqual:](v19, "isEqual:", v20);

    if ((v22 & 1) != 0)
      goto LABEL_16;
  }
  else
  {

  }
  if (os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
  {
    v75 = _MergedGlobals_1066;
    if (!_MergedGlobals_1066)
    {
      v75 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v75, (unint64_t *)&_MergedGlobals_1066);
    }
    v76 = *(NSObject **)(v75 + 8);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v76, OS_LOG_TYPE_ERROR, "Surprise request to record rewritten text with context argument's range different from the range of the context that the tracker was initialized with", buf, 2u);
    }
  }
LABEL_16:
  v104 = length;
  v106 = location;
  p_rewrittenText = &self->_rewrittenText;
  rewrittenText = self->_rewrittenText;
  self->_finished = v6;
  -[NSAttributedString string](rewrittenText, "string");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_initialReplacementChunksByUUID)
  {
    -[_UITextAssistantReplacementTracker assembledRewrittenTextToDelivery:matchingInitialDeliveries:](self, "assembledRewrittenTextToDelivery:matchingInitialDeliveries:", 0, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "string");
    v27 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v27;
  }
  v28 = v105;
  if (v6)
  {
    objc_msgSend(v105, "string");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqualToString:", v25);

    if ((v30 & 1) != 0)
    {
      v31 = 0;
      goto LABEL_57;
    }
  }
  v101 = v25;
  processedOriginalText = self->_processedOriginalText;
  self->_processedOriginalText = 0;

  unprocessedOriginalText = self->_unprocessedOriginalText;
  self->_unprocessedOriginalText = 0;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[_UITextAssistantReplacementTracker isProofreading](self, "isProofreading");
  fallbackDeliveryID = self->_fallbackDeliveryID;
  self->_fallbackDeliveryID = 0;

  v102 = v34;
  if (!v34)
  {
    v36 = objc_msgSend(v105, "length");
    if (v36 <= -[NSAttributedString length](*p_rewrittenText, "length"))
    {
      if (os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
      {
        v85 = qword_1ECD7DF90;
        if (!qword_1ECD7DF90)
        {
          v85 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v85, (unint64_t *)&qword_1ECD7DF90);
        }
        v86 = *(NSObject **)(v85 + 8);
        if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
        {
          replacementDeliveryUUIDs = self->_replacementDeliveryUUIDs;
          v88 = v86;
          v89 = -[NSMutableArray count](replacementDeliveryUUIDs, "count");
          *(_DWORD *)buf = 134217984;
          v113 = v89;
          _os_log_impl(&dword_185066000, v88, OS_LOG_TYPE_ERROR, "New delivery is no longer than the rewrite so far. Replacing all accumulated chunks with the current delivery. Number of chunks cleared = %lu", buf, 0xCu);

        }
      }
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v37 = self->_replacementDeliveryUUIDs;
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v107, v111, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v108;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v108 != v40)
              objc_enumerationMutation(v37);
            -[NSWritingToolsEditTracker removeEditForSuggestionWithUUID:](self->_editTracker, "removeEditForSuggestionWithUUID:", *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i));
          }
          v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v107, v111, 16);
        }
        while (v39);
      }

      -[NSMutableArray removeAllObjects](self->_replacementDeliveryUUIDs, "removeAllObjects");
      -[NSMutableDictionary removeAllObjects](self->_replacementChunksByUUID, "removeAllObjects");
      -[NSMutableDictionary removeAllObjects](self->_initialReplacementChunksByUUID, "removeAllObjects");
      objc_storeStrong((id *)&self->_fallbackDeliveryID, v31);
      v28 = v105;
    }
  }
  -[NSMutableArray lastObject](self->_replacementDeliveryUUIDs, "lastObject");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_replacementChunksByUUID, "objectForKeyedSubscript:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v102)
    {
      if (v43)
      {
        v45 = objc_msgSend(v43, "originalRange");
        v47 = v45 + v46;
        v48 = v106 - (v45 + v46);
        if (v48 < 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantReplacementTracker.m"), 196, CFSTR("Unexpected overlapping proofreading delivery range"));

        }
      }
      else
      {
        v48 = 0;
        v47 = 0;
      }
      goto LABEL_49;
    }
  }
  else
  {
    v44 = 0;
    v48 = 0;
    v47 = 0;
    if (v102)
    {
LABEL_49:
      if (*p_rewrittenText)
        v62 = -[NSAttributedString mutableCopy](*p_rewrittenText, "mutableCopy");
      else
        v62 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E16EDF20);
      v63 = (void *)v62;
      v103 = v44;
      if (v48)
      {
        -[NSAttributedString attributedSubstringFromRange:](self->_originalText, "attributedSubstringFromRange:", v47, v48);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "appendAttributedString:", v64);

      }
      objc_msgSend(v63, "appendAttributedString:", v28);
      v65 = objc_msgSend(v63, "copy");
      v66 = *p_rewrittenText;
      *p_rewrittenText = (NSAttributedString *)v65;

      v50 = v28;
      goto LABEL_55;
    }
  }
  objc_storeStrong((id *)&self->_rewrittenText, a3);
  v50 = v28;
  v103 = v44;
  if (v42 && v44)
  {
    v51 = v106 + v104 - objc_msgSend(v44, "originalEndIndex");
    if (v51 < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v44;
      objc_msgSend(v90, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantReplacementTracker.m"), 214, CFSTR("Negative length found for incoming replacement.\npreviousChunk: %@\ninRange={%lu, %lu}"), v44, v106, v104);

    }
    else
    {
      v52 = v44;
      if (!v51 && os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
      {
        v94 = qword_1ECD7DF98;
        if (!qword_1ECD7DF98)
        {
          v94 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v94, (unint64_t *)&qword_1ECD7DF98);
        }
        v95 = *(NSObject **)(v94 + 8);
        v28 = v105;
        v52 = v44;
        if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v95, OS_LOG_TYPE_ERROR, "Proper animation for extending rewrites TBD: rdar://127571889", buf, 2u);
        }
      }
    }
    v106 = objc_msgSend(v52, "originalEndIndex");
    editTracker = self->_editTracker;
    v54 = objc_msgSend(v52, "originalRange");
    v56 = -[NSWritingToolsEditTracker rangeOfSuggestionWithRange:UUID:applyDelta:](editTracker, "rangeOfSuggestionWithRange:UUID:applyDelta:", v54, v55, v42, 1);
    v58 = v56 + v57;
    v59 = objc_msgSend(v50, "length") - (v56 + v57);
    if (v59 < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantReplacementTracker.m"), 224, CFSTR("Error in rewrite length calculation"));

    }
    objc_msgSend(v50, "attributedSubstringFromRange:", v58, v59);
    v60 = objc_claimAutoreleasedReturnValue();

    v50 = (id)v60;
    v104 = v51;
  }
  objc_msgSend(v50, "string");
  v61 = (id)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
  {
    objc_msgSend(v61, "substringWithRange:", 0, objc_msgSend(v61, "length") != 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "isEqualToString:", CFSTR("\n"));

    if (v78 && os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
    {
      v96 = qword_1ECD7DFB8;
      if (!qword_1ECD7DFB8)
      {
        v96 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v96, (unint64_t *)&qword_1ECD7DFB8);
      }
      v97 = *(NSObject **)(v96 + 8);
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v97, OS_LOG_TYPE_ERROR, "\tfirst character is linefeed", buf, 2u);
      }
    }
    v79 = objc_msgSend(v61, "length");
    if (v79 <= 1)
      v80 = 1;
    else
      v80 = v79;
    objc_msgSend(v61, "substringWithRange:", v80 - 1, objc_msgSend(v61, "length") != 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "isEqualToString:", CFSTR("\n"));

    if (v82)
    {
      v28 = v105;
      if (os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
      {
        v83 = qword_1ECD7DFC0;
        if (!qword_1ECD7DFC0)
        {
          v83 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v83, (unint64_t *)&qword_1ECD7DFC0);
        }
        v84 = *(NSObject **)(v83 + 8);
        v28 = v105;
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v84, OS_LOG_TYPE_ERROR, "\tlast character is linefeed", buf, 2u);
        }
      }
      goto LABEL_93;
    }
    v28 = v105;
    if (v78)
    {
LABEL_93:
      if (os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
      {
        v92 = qword_1ECD7DFC8;
        if (!qword_1ECD7DFC8)
        {
          v92 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v92, (unint64_t *)&qword_1ECD7DFC8);
        }
        v93 = *(NSObject **)(v92 + 8);
        v28 = v105;
        if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v113 = (uint64_t)v61;
          _os_log_impl(&dword_185066000, v93, OS_LOG_TYPE_ERROR, "\n------------\n%@\n------------", buf, 0xCu);
        }
      }
    }
  }

LABEL_55:
  -[NSMutableArray addObject:](self->_replacementDeliveryUUIDs, "addObject:", v31);
  v67 = -[_UIWritingToolsReplacementChunk initWithReplacementChunk:originalRange:uuid:]([_UIWritingToolsReplacementChunk alloc], "initWithReplacementChunk:originalRange:uuid:", v50, v106, v104, v31);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_replacementChunksByUUID, "setObject:forKeyedSubscript:", v67, v31);
  -[NSWritingToolsEditTracker addEditForSuggestionWithRange:lengthDelta:UUID:](self->_editTracker, "addEditForSuggestionWithRange:lengthDelta:UUID:", v106, v104, -[_UIWritingToolsReplacementChunk lengthDelta](v67, "lengthDelta"), v31);
  if (os_variant_has_internal_diagnostics())
  {
    -[_UITextAssistantReplacementTracker assembledRewrittenText](self, "assembledRewrittenText");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextAssistantReplacementTracker rewrittenText](self, "rewrittenText");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v69, "isEqualToAttributedString:", v70);

    if ((v71 & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v98 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_FAULT))
        {
          v99 = CFSTR("Composition");
          if (v102)
            v99 = CFSTR("Proofreading");
          *(_DWORD *)buf = 138412290;
          v113 = (uint64_t)v99;
          _os_log_fault_impl(&dword_185066000, v98, OS_LOG_TYPE_FAULT, "%@ replacement improperly recorded", buf, 0xCu);
        }

        v28 = v105;
      }
      else
      {
        v72 = qword_1ECD7DFA0;
        if (!qword_1ECD7DFA0)
        {
          v72 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v72, (unint64_t *)&qword_1ECD7DFA0);
        }
        v73 = *(NSObject **)(v72 + 8);
        v28 = v105;
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          v74 = CFSTR("Composition");
          if (v102)
            v74 = CFSTR("Proofreading");
          *(_DWORD *)buf = 138412290;
          v113 = (uint64_t)v74;
          _os_log_impl(&dword_185066000, v73, OS_LOG_TYPE_ERROR, "%@ replacement improperly recorded", buf, 0xCu);
        }
      }
    }
  }

  v25 = v101;
LABEL_57:

  return v31;
}

- (void)updateReplacementChunkForDeliveryID:(id)a3 newText:(id)a4
{
  id v6;
  NSMutableArray *replacementDeliveryUUIDs;
  id v8;
  void *v9;
  void *v10;
  NSMutableDictionary *initialReplacementChunksByUUID;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _UIWritingToolsReplacementChunk *v17;
  NSAttributedString *v18;
  NSAttributedString *rewrittenText;
  unint64_t v20;
  NSObject *v21;
  NSMutableArray *v22;
  NSObject *v23;
  NSMutableArray *v24;
  int v25;
  id v26;
  __int16 v27;
  NSMutableArray *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  replacementDeliveryUUIDs = self->_replacementDeliveryUUIDs;
  v8 = a4;
  if ((-[NSMutableArray containsObject:](replacementDeliveryUUIDs, "containsObject:", v6) & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        v24 = self->_replacementDeliveryUUIDs;
        v25 = 138412546;
        v26 = v6;
        v27 = 2112;
        v28 = v24;
        _os_log_fault_impl(&dword_185066000, v23, OS_LOG_TYPE_FAULT, "Can't update replacement chunk for abandoned delivery, %@. It's not contained in %@", (uint8_t *)&v25, 0x16u);
      }

    }
    else
    {
      v20 = updateReplacementChunkForDeliveryID_newText____s_category;
      if (!updateReplacementChunkForDeliveryID_newText____s_category)
      {
        v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v20, (unint64_t *)&updateReplacementChunkForDeliveryID_newText____s_category);
      }
      v21 = *(NSObject **)(v20 + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = self->_replacementDeliveryUUIDs;
        v25 = 138412546;
        v26 = v6;
        v27 = 2112;
        v28 = v22;
        _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "Can't update replacement chunk for abandoned delivery, %@. It's not contained in %@", (uint8_t *)&v25, 0x16u);
      }
    }
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_replacementChunksByUUID, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSWritingToolsEditTracker removeEditForSuggestionWithUUID:](self->_editTracker, "removeEditForSuggestionWithUUID:", v6);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_initialReplacementChunksByUUID, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    initialReplacementChunksByUUID = self->_initialReplacementChunksByUUID;
    if (!initialReplacementChunksByUUID)
    {
      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v13 = self->_initialReplacementChunksByUUID;
      self->_initialReplacementChunksByUUID = v12;

      initialReplacementChunksByUUID = self->_initialReplacementChunksByUUID;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](initialReplacementChunksByUUID, "setObject:forKeyedSubscript:", v9, v6);
  }
  v14 = objc_msgSend(v9, "originalRange");
  v16 = v15;
  v17 = -[_UIWritingToolsReplacementChunk initWithReplacementChunk:originalRange:uuid:]([_UIWritingToolsReplacementChunk alloc], "initWithReplacementChunk:originalRange:uuid:", v8, v14, v15, v6);

  -[NSWritingToolsEditTracker addEditForSuggestionWithRange:lengthDelta:UUID:](self->_editTracker, "addEditForSuggestionWithRange:lengthDelta:UUID:", v14, v16, -[_UIWritingToolsReplacementChunk lengthDelta](v17, "lengthDelta"), v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_replacementChunksByUUID, "setObject:forKeyedSubscript:", v17, v6);
  -[_UITextAssistantReplacementTracker assembledRewrittenText](self, "assembledRewrittenText");
  v18 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  rewrittenText = self->_rewrittenText;
  self->_rewrittenText = v18;

}

- (int64_t)ordinalForDelivery:(id)a3
{
  int64_t v5;
  void *v7;

  v5 = -[NSMutableArray indexOfObject:](self->_replacementDeliveryUUIDs, "indexOfObject:", a3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantReplacementTracker.m"), 266, CFSTR("Unknown delivery ID for retrieving ordinal"));

  }
  return v5;
}

- (NSAttributedString)assembledRewrittenText
{
  return (NSAttributedString *)-[_UITextAssistantReplacementTracker assembledRewrittenTextToDelivery:matchingInitialDeliveries:](self, "assembledRewrittenTextToDelivery:matchingInitialDeliveries:", 0, 0);
}

- (id)assembledRewrittenTextToDelivery:(id)a3 matchingInitialDeliveries:(BOOL)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *initialReplacementChunksByUUID;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *obj;
  _BOOL4 v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v25 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_replacementDeliveryUUIDs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v28;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v10);
      if (v25 && (initialReplacementChunksByUUID = self->_initialReplacementChunksByUUID) != 0)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](initialReplacementChunksByUUID, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v10));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_replacementChunksByUUID, "objectForKeyedSubscript:", v11);
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v15;

      }
      else
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_replacementChunksByUUID, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v10));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v17 = objc_msgSend(v16, "originalRange");
      v19 = v18;
      if (v17 - v8 >= 1)
      {
        -[NSAttributedString attributedSubstringFromRange:](self->_originalText, "attributedSubstringFromRange:", v8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendAttributedString:", v20);

      }
      objc_msgSend(v16, "replacement");
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendAttributedString:", v21);

      LOBYTE(v21) = objc_msgSend(v11, "isEqual:", v26);
      if ((v21 & 1) != 0)
        break;
      v8 = v17 + v19;
      if (v7 == ++v10)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  v22 = (void *)objc_msgSend(v5, "copy");
  return v22;
}

- (NSAttributedString)processedOriginalText
{
  NSAttributedString *processedOriginalText;
  uint64_t v4;
  uint64_t v5;
  NSAttributedString *v6;
  NSAttributedString *v7;

  processedOriginalText = self->_processedOriginalText;
  if (!processedOriginalText)
  {
    v4 = -[_UITextAssistantReplacementTracker processedOriginalCharacterRange](self, "processedOriginalCharacterRange");
    -[NSAttributedString attributedSubstringFromRange:](self->_originalText, "attributedSubstringFromRange:", v4 - (self->_offsetForSessionRange + self->_sessionContextRange.location), v5);
    v6 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_processedOriginalText;
    self->_processedOriginalText = v6;

    processedOriginalText = self->_processedOriginalText;
  }
  return processedOriginalText;
}

- (NSAttributedString)unprocessedOriginalText
{
  NSAttributedString *unprocessedOriginalText;
  int64_t length;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSAttributedString *v11;
  NSAttributedString *v12;
  void *v14;

  unprocessedOriginalText = self->_unprocessedOriginalText;
  if (!unprocessedOriginalText)
  {
    length = self->_sessionContextRange.length;
    -[NSMutableArray lastObject](self->_replacementDeliveryUUIDs, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_replacementChunksByUUID, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "originalRange");
      v10 = v8 + v9;
      length -= v8 + v9;
      if (length < 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantReplacementTracker.m"), 323, CFSTR("Invalid unprocessed range length"));

      }
    }
    else
    {
      v10 = 0;
    }
    -[NSAttributedString attributedSubstringFromRange:](self->_originalText, "attributedSubstringFromRange:", v10, length);
    v11 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    v12 = self->_unprocessedOriginalText;
    self->_unprocessedOriginalText = v11;

    unprocessedOriginalText = self->_unprocessedOriginalText;
  }
  return unprocessedOriginalText;
}

- (id)rewrittenChunkTextForDelivery:(id)a3
{
  NSUUID *v5;
  NSUUID *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;

  v5 = (NSUUID *)a3;
  v6 = v5;
  if ((-[NSMutableArray containsObject:](self->_replacementDeliveryUUIDs, "containsObject:", v5) & 1) == 0)
  {
    v6 = self->_fallbackDeliveryID;

  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantReplacementTracker.m"), 338, CFSTR("Unknown delivery ID for retrieving chunk rewrite"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_replacementChunksByUUID, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "replacement");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E16EDF20);
  }
  v10 = (void *)v9;

  return v10;
}

- (id)originalChunkTextForDelivery:(id)a3
{
  NSUUID *v5;
  NSUUID *v6;
  void *v7;
  void *v8;
  NSAttributedString *originalText;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v15;

  v5 = (NSUUID *)a3;
  v6 = v5;
  if ((-[NSMutableArray containsObject:](self->_replacementDeliveryUUIDs, "containsObject:", v5) & 1) == 0)
  {
    v6 = self->_fallbackDeliveryID;

  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantReplacementTracker.m"), 349, CFSTR("Unknown delivery ID for retrieving chunk original"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_replacementChunksByUUID, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    originalText = self->_originalText;
    v10 = objc_msgSend(v7, "originalRange");
    -[NSAttributedString attributedSubstringFromRange:](originalText, "attributedSubstringFromRange:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E16EDF20);
  }
  v13 = (void *)v12;

  return v13;
}

- (NSAttributedString)activeText
{
  if (self->_compositionSessionState == 2)
    -[_UITextAssistantReplacementTracker rewrittenText](self, "rewrittenText");
  else
    -[_UITextAssistantReplacementTracker processedOriginalText](self, "processedOriginalText");
  return (NSAttributedString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasProcessedOriginalRange
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[_UITextAssistantReplacementTracker processedOriginalCharacterRange](self, "processedOriginalCharacterRange");
  v4 = v3;
  -[_UITextAssistantReplacementTracker originalCharacterRange](self, "originalCharacterRange");
  return v4 == v5;
}

- (_NSRange)originalCharacterRange
{
  unint64_t v3;
  NSUInteger length;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  NSUInteger v16;
  uint64_t v17;
  _NSRange result;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = self->_offsetForSessionRange + self->_sessionContextRange.location;
  length = self->_sessionContextRange.length;
  if (os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
  {
    v7 = originalCharacterRange___s_category;
    if (!originalCharacterRange___s_category)
    {
      v7 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&originalCharacterRange___s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v10;
      v13 = 2048;
      v14 = v3;
      v15 = 2048;
      v16 = length;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "\t%@={%lu, %lu}", (uint8_t *)&v11, 0x20u);

    }
  }
  v5 = v3;
  v6 = length;
  result.length = v6;
  result.location = v5;
  return result;
}

- (_NSRange)processedOriginalCharacterRange
{
  unint64_t offsetForSessionRange;
  NSUInteger location;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  NSUInteger v21;
  __int16 v22;
  NSUInteger v23;
  uint64_t v24;
  _NSRange result;

  v24 = *MEMORY[0x1E0C80C00];
  offsetForSessionRange = self->_offsetForSessionRange;
  location = self->_sessionContextRange.location;
  -[NSMutableArray lastObject](self->_replacementDeliveryUUIDs, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_replacementChunksByUUID, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "originalRange");
    v10 = v8 + v9;
    if (v8 + v9 < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantReplacementTracker.m"), 386, CFSTR("error in calculating length of processedOriginalCharacterRange"));

    }
  }
  else
  {
    v10 = 0;
  }
  if (os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
  {
    v13 = processedOriginalCharacterRange___s_category;
    if (!processedOriginalCharacterRange___s_category)
    {
      v13 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&processedOriginalCharacterRange___s_category);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v16;
      v20 = 2048;
      v21 = location + offsetForSessionRange;
      v22 = 2048;
      v23 = v10;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "\t%@={%lu, %lu}", (uint8_t *)&v18, 0x20u);

    }
  }

  v11 = location + offsetForSessionRange;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (uint64_t)currentChunkCharacterRangeUpdatingLength:(uint64_t)a1
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  void *v12;
  unint64_t v13;
  const __CFString *v14;

  v2 = a1;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 88) == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = *(_QWORD *)(v2 + 88) + 1;
      if (v13 > 3)
        v14 = CFSTR("Unknown");
      else
        v14 = off_1E16C8D50[v13];
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel_currentChunkCharacterRangeUpdatingLength_, v2, CFSTR("_UITextAssistantReplacementTracker.m"), 395, CFSTR("initial and final current-chunk ranges not valid for session state: %@"), v14);

    }
    objc_msgSend(*(id *)(v2 + 48), "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(v2 + 56), "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(v2 + 40);
      v7 = objc_msgSend(v5, "originalRange");
      v9 = objc_msgSend(v6, "rangeOfSuggestionWithRange:UUID:applyDelta:", v7, v8, v4, a2);

    }
    else
    {
      v9 = 0;
    }
    v2 = v9 + *(_QWORD *)(v2 + 16) + *(_QWORD *)(v2 + 8);

  }
  return v2;
}

- (_NSRange)initialCurrentChunkCharacterRange
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  NSUInteger v17;
  uint64_t v18;
  _NSRange result;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[_UITextAssistantReplacementTracker currentChunkCharacterRangeUpdatingLength:]((uint64_t)self, 0);
  v5 = v4;
  if (os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
  {
    v8 = initialCurrentChunkCharacterRange___s_category;
    if (!initialCurrentChunkCharacterRange___s_category)
    {
      v8 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&initialCurrentChunkCharacterRange___s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v11;
      v14 = 2048;
      v15 = v3;
      v16 = 2048;
      v17 = v5;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "\t%@={%lu, %lu}", (uint8_t *)&v12, 0x20u);

    }
  }
  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)finalCurrentChunkCharacterRange
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  NSUInteger v17;
  uint64_t v18;
  _NSRange result;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[_UITextAssistantReplacementTracker currentChunkCharacterRangeUpdatingLength:]((uint64_t)self, 1);
  v5 = v4;
  if (os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
  {
    v8 = finalCurrentChunkCharacterRange___s_category;
    if (!finalCurrentChunkCharacterRange___s_category)
    {
      v8 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&finalCurrentChunkCharacterRange___s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v11;
      v14 = 2048;
      v15 = v3;
      v16 = 2048;
      v17 = v5;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "\t%@={%lu, %lu}", (uint8_t *)&v12, 0x20u);

    }
  }
  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)rewrittenCharacterRange
{
  NSUInteger location;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  NSUInteger v16;
  __int16 v17;
  NSUInteger v18;
  uint64_t v19;
  _NSRange result;

  v19 = *MEMORY[0x1E0C80C00];
  location = self->_sessionContextRange.location;
  v5 = -[NSAttributedString length](self->_rewrittenText, "length");
  v6 = self->_offsetForSessionRange + location;
  if (os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
  {
    v9 = rewrittenCharacterRange___s_category;
    if (!rewrittenCharacterRange___s_category)
    {
      v9 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&rewrittenCharacterRange___s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v12;
      v15 = 2048;
      v16 = v6;
      v17 = 2048;
      v18 = v5;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "\t%@={%lu, %lu}", (uint8_t *)&v13, 0x20u);

    }
  }
  v7 = v6;
  v8 = v5;
  result.length = v8;
  result.location = v7;
  return result;
}

- (uint64_t)rangeForChunkFromDelivery:(int)a3 useOriginalLength:
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = v5;
    if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", v7) & 1) == 0)
    {
      v8 = *(id *)(a1 + 72);

      v7 = v8;
    }
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (*(_QWORD *)(a1 + 88) == 1)
      {
        if (os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
        {
          v16 = rangeForChunkFromDelivery_useOriginalLength____s_category;
          if (!rangeForChunkFromDelivery_useOriginalLength____s_category)
          {
            v16 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v16, (unint64_t *)&rangeForChunkFromDelivery_useOriginalLength____s_category);
          }
          v17 = *(NSObject **)(v16 + 8);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = 138412290;
            v19 = v7;
            _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "ALERT: unexpected request for chunk-delivery range while showing original. %@", (uint8_t *)&v18, 0xCu);
          }
        }
        v11 = objc_msgSend(v10, "originalRange");
      }
      else
      {
        v12 = *(void **)(a1 + 40);
        v13 = objc_msgSend(v9, "originalRange");
        v11 = objc_msgSend(v12, "rangeOfSuggestionWithRange:UUID:applyDelta:", v13, v14, v7, a3 ^ 1u);
      }
      a1 = v11 + *(_QWORD *)(a1 + 8) + *(_QWORD *)(a1 + 16);

    }
    else
    {
      a1 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  return a1;
}

- (_NSRange)sourceRangeForChunkFromDelivery:(id)a3
{
  id v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  NSUInteger v22;
  uint64_t v23;
  _NSRange result;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[_UITextAssistantReplacementTracker rangeForChunkFromDelivery:useOriginalLength:]((uint64_t)self, v5, 1);
  v8 = v7;
  if (os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
  {
    v11 = sourceRangeForChunkFromDelivery____s_category;
    if (!sourceRangeForChunkFromDelivery____s_category)
    {
      v11 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&sourceRangeForChunkFromDelivery____s_category);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138413058;
      v16 = v14;
      v17 = 2112;
      v18 = v5;
      v19 = 2048;
      v20 = v6;
      v21 = 2048;
      v22 = v8;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "\t%@ %@={%lu, %lu}", (uint8_t *)&v15, 0x2Au);

    }
  }

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (_NSRange)targetRangeForChunkFromDelivery:(id)a3
{
  id v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  NSUInteger v22;
  uint64_t v23;
  _NSRange result;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[_UITextAssistantReplacementTracker rangeForChunkFromDelivery:useOriginalLength:]((uint64_t)self, v5, 0);
  v8 = v7;
  if (os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
  {
    v11 = targetRangeForChunkFromDelivery____s_category;
    if (!targetRangeForChunkFromDelivery____s_category)
    {
      v11 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&targetRangeForChunkFromDelivery____s_category);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138413058;
      v16 = v14;
      v17 = 2112;
      v18 = v5;
      v19 = 2048;
      v20 = v6;
      v21 = 2048;
      v22 = v8;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "\t%@ %@={%lu, %lu}", (uint8_t *)&v15, 0x2Au);

    }
  }

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)nextDeliveryForDelivery:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v8;
  NSObject *v9;
  NSMutableArray *replacementDeliveryUUIDs;
  NSObject *v11;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = -[NSMutableArray indexOfObject:](self->_replacementDeliveryUUIDs, "indexOfObject:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL
    || (v5 = v4, v4 >= -[NSMutableArray count](self->_replacementDeliveryUUIDs, "count") - 1))
  {
    v6 = 0;
  }
  else
  {
    if (os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
    {
      v8 = nextDeliveryForDelivery____s_category;
      if (!nextDeliveryForDelivery____s_category)
      {
        v8 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&nextDeliveryForDelivery____s_category);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        replacementDeliveryUUIDs = self->_replacementDeliveryUUIDs;
        v11 = v9;
        v12[0] = 67109376;
        v12[1] = v5 + 1;
        v13 = 1024;
        v14 = -[NSMutableArray count](replacementDeliveryUUIDs, "count");
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "next delivery index = %u of %u", (uint8_t *)v12, 0xEu);

      }
    }
    -[NSMutableArray objectAtIndexedSubscript:](self->_replacementDeliveryUUIDs, "objectAtIndexedSubscript:", v5 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (_NSRange)activeFullCharacterRange
{
  int64_t compositionSessionState;
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  NSUInteger v20;
  __int16 v21;
  NSUInteger v22;
  uint64_t v23;
  _NSRange result;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[_UITextAssistantReplacementTracker isProofreading](self, "isProofreading")
    || (compositionSessionState = self->_compositionSessionState, compositionSessionState == 2))
  {
    v7 = -[NSWritingToolsEditTracker currentContextRange](self->_editTracker, "currentContextRange");
    length = v8;
    location = v7 + self->_sessionContextRange.location;
  }
  else if (compositionSessionState == 1)
  {
    location = self->_sessionContextRange.location;
    length = self->_sessionContextRange.length;
  }
  else if (compositionSessionState)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITextAssistantReplacementTracker.m"), 508, CFSTR("Unknown composition session state"));

    length = 0;
    location = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    length = 0;
    location = self->_sessionContextRange.location;
  }
  v9 = self->_offsetForSessionRange + location;
  if (os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
  {
    v13 = activeFullCharacterRange___s_category;
    if (!activeFullCharacterRange___s_category)
    {
      v13 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&activeFullCharacterRange___s_category);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v16;
      v19 = 2048;
      v20 = v9;
      v21 = 2048;
      v22 = length;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "\t%@={%lu, %lu}", (uint8_t *)&v17, 0x20u);

    }
  }
  v10 = v9;
  v11 = length;
  result.length = v11;
  result.location = v10;
  return result;
}

- (_NSRange)activeCharacterRange
{
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  NSUInteger v17;
  __int16 v18;
  NSUInteger v19;
  uint64_t v20;
  _NSRange result;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[_UITextAssistantReplacementTracker isProofreading](self, "isProofreading")
    || self->_compositionSessionState == 2)
  {
    v4 = -[_UITextAssistantReplacementTracker rewrittenCharacterRange](self, "rewrittenCharacterRange");
  }
  else
  {
    v4 = -[_UITextAssistantReplacementTracker processedOriginalCharacterRange](self, "processedOriginalCharacterRange");
  }
  v6 = v4;
  v7 = v5;
  if (os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
  {
    v10 = activeCharacterRange___s_category;
    if (!activeCharacterRange___s_category)
    {
      v10 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&activeCharacterRange___s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v13;
      v16 = 2048;
      v17 = v6;
      v18 = 2048;
      v19 = v7;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "\t%@={%lu, %lu}", (uint8_t *)&v14, 0x20u);

    }
  }
  v8 = v6;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (_NSRange)activeUnprocessedCharacterRange
{
  NSUInteger length;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t compositionSessionState;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  void *v23;
  __int16 v24;
  NSUInteger v25;
  __int16 v26;
  NSUInteger v27;
  uint64_t v28;
  _NSRange result;

  v28 = *MEMORY[0x1E0C80C00];
  length = self->_sessionContextRange.length;
  v6 = -[_UITextAssistantReplacementTracker processedOriginalCharacterRange](self, "processedOriginalCharacterRange");
  v7 = v5;
  compositionSessionState = self->_compositionSessionState;
  if ((uint64_t)(length - v5) < 0)
  {
    if (compositionSessionState)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v22) = 0;
          _os_log_fault_impl(&dword_185066000, v21, OS_LOG_TYPE_FAULT, "overshot processed length when calculating unprocessed range", (uint8_t *)&v22, 2u);
        }

      }
      else
      {
        v19 = qword_1ECD7DFA8;
        if (!qword_1ECD7DFA8)
        {
          v19 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v19, (unint64_t *)&qword_1ECD7DFA8);
        }
        v20 = *(NSObject **)(v19 + 8);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v22) = 0;
          _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "overshot processed length when calculating unprocessed range", (uint8_t *)&v22, 2u);
        }
      }
    }
    v9 = 0;
  }
  else if (compositionSessionState)
  {
    v9 = length - v5;
  }
  else
  {
    v9 = 0;
  }
  if (-[_UITextAssistantReplacementTracker isProofreading](self, "isProofreading")
    || self->_compositionSessionState == 2)
  {
    v10 = -[_UITextAssistantReplacementTracker rewrittenCharacterRange](self, "rewrittenCharacterRange");
    v12 = v10 + v11;
  }
  else
  {
    v12 = v6 + v7;
  }
  if (os_variant_has_internal_diagnostics() && _UIGetUITextAssistantRewriteLogging())
  {
    v15 = qword_1ECD7DFB0;
    if (!qword_1ECD7DFB0)
    {
      v15 = __UILogCategoryGetNode("TextAssistantComposition", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&qword_1ECD7DFB0);
    }
    v16 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = v16;
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412802;
      v23 = v18;
      v24 = 2048;
      v25 = v12;
      v26 = 2048;
      v27 = v9;
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "\t%@={%lu, %lu}", (uint8_t *)&v22, 0x20u);

    }
  }
  v13 = v12;
  v14 = v9;
  result.length = v14;
  result.location = v13;
  return result;
}

- (id)description
{
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t offsetForSessionRange;
  NSAttributedString *originalText;
  NSAttributedString *rewrittenText;
  void *v11;
  void *v12;
  NSMutableDictionary *replacementChunksByUUID;
  __CFString *v14;
  NSWritingToolsEditTracker *editTracker;
  NSWritingToolsProofreadingController *proofreadingController;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  NSUInteger length;
  NSUInteger location;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)_UITextAssistantReplacementTracker;
  -[_UITextAssistantReplacementTracker description](&v28, sel_description);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = self->_compositionSessionState + 1;
  v27 = (void *)v3;
  if (v4 > 3)
    v5 = CFSTR("Unknown");
  else
    v5 = off_1E16C8D50[v4];
  v23 = v5;
  location = self->_sessionContextRange.location;
  length = self->_sessionContextRange.length;
  v24 = -[NSWritingToolsEditTracker currentContextRange](self->_editTracker, "currentContextRange");
  -[NSWritingToolsEditTracker currentContextRange](self->_editTracker, "currentContextRange");
  v7 = v6;
  offsetForSessionRange = self->_offsetForSessionRange;
  originalText = self->_originalText;
  rewrittenText = self->_rewrittenText;
  -[NSMutableArray lastObject](self->_replacementDeliveryUUIDs, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    replacementChunksByUUID = self->_replacementChunksByUUID;
    -[NSMutableArray lastObject](self->_replacementDeliveryUUIDs, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](replacementChunksByUUID, "objectForKeyedSubscript:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR(" lastChunk=%p"), v21);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = &stru_1E16EDF20;
  }
  editTracker = self->_editTracker;
  proofreadingController = self->_proofreadingController;
  if (proofreadingController)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("proofreadingController=%p"), self->_proofreadingController);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = &stru_1E16EDF20;
  }
  if (self->_finished)
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  objc_msgSend(v27, "stringByAppendingFormat:", CFSTR(" state=%@ originalRange={%lu, %lu} currentRange={%lu, %lu} offset=(%ld} original=%p rewrite=%p%@ editTracker=%p%@ finished=%@"), v23, location, length, v24, v7, offsetForSessionRange, originalText, rewrittenText, v14, editTracker, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (proofreadingController)

  if (v11)
  {

  }
  return v19;
}

- (int64_t)compositionSessionState
{
  return self->_compositionSessionState;
}

- (NSUUID)contextUUID
{
  return self->_contextUUID;
}

- (NSWritingToolsProofreadingController)proofreadingController
{
  return self->_proofreadingController;
}

- (BOOL)isProofreading
{
  return self->_proofreading;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (NSAttributedString)originalText
{
  return self->_originalText;
}

- (NSAttributedString)rewrittenText
{
  return self->_rewrittenText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrittenText, 0);
  objc_storeStrong((id *)&self->_originalText, 0);
  objc_storeStrong((id *)&self->_proofreadingController, 0);
  objc_storeStrong((id *)&self->_contextUUID, 0);
  objc_storeStrong((id *)&self->_unprocessedOriginalText, 0);
  objc_storeStrong((id *)&self->_processedOriginalText, 0);
  objc_storeStrong((id *)&self->_fallbackDeliveryID, 0);
  objc_storeStrong((id *)&self->_initialReplacementChunksByUUID, 0);
  objc_storeStrong((id *)&self->_replacementChunksByUUID, 0);
  objc_storeStrong((id *)&self->_replacementDeliveryUUIDs, 0);
  objc_storeStrong((id *)&self->_editTracker, 0);
  objc_storeStrong((id *)&self->_originalContext, 0);
}

@end
