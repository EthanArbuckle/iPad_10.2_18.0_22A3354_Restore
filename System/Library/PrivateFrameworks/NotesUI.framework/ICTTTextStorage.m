@implementation ICTTTextStorage

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  void *v12;
  objc_super v14;

  length = a6.length;
  location = a6.location;
  v11 = a3;
  if (-[ICTTTextStorage validateIndex:effectiveRange:](self, "validateIndex:effectiveRange:", a4, a5))
  {
    v14.receiver = self;
    v14.super_class = (Class)ICTTTextStorage;
    -[ICTTTextStorage attribute:atIndex:longestEffectiveRange:inRange:](&v14, sel_attribute_atIndex_longestEffectiveRange_inRange_, v11, a4, a5, location, length);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  void *v7;

  if (-[ICTTTextStorage validateIndex:effectiveRange:](self, "validateIndex:effectiveRange:"))
  {
    -[NSMutableAttributedString attributesAtIndex:effectiveRange:](self->_attributedString, "attributesAtIndex:effectiveRange:", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v7;
}

- (id)string
{
  void *v2;
  void *v3;
  void *v4;

  -[ICTTMergeableStringVersionedDocument mergeableString](self->_document, "mergeableString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)attributedSubstringFromRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  NSRange v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSRange v13;
  NSRange v14;

  length = a3.length;
  location = a3.location;
  -[ICTTTextStorage attributedString](self, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13.location = objc_msgSend(v6, "ic_range");
  v14.location = location;
  v14.length = length;
  v7 = NSIntersectionRange(v13, v14);

  if (-[ICTTTextStorage filterSubstringAttributes](self, "filterSubstringAttributes"))
  {
    -[ICTTTextStorage filteredAttributedSubstringFromRange:](self, "filteredAttributedSubstringFromRange:", v7.location, v7.length);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
LABEL_6:
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", &stru_1E5C2F8C0, 0);
  }
  else
  {
    -[ICTTTextStorage attributedString](self, "attributedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_6;
    -[ICTTTextStorage attributedString](self, "attributedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributedSubstringFromRange:", v7.location, v7.length);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_6;
  }
  return v8;
}

- (unint64_t)length
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[ICTTMergeableStringVersionedDocument mergeableString](self->_document, "mergeableString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  return v4;
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  if (-[ICTTTextStorage validateIndex:effectiveRange:](self, "validateIndex:effectiveRange:", a4, a5))
  {
    -[NSMutableAttributedString attribute:atIndex:effectiveRange:](self->_attributedString, "attribute:atIndex:effectiveRange:", v8, a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)validateIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  unint64_t v6;

  v6 = -[NSMutableAttributedString length](self->_attributedString, "length");
  if (a4 && v6 <= a3)
    *a4 = (_NSRange)xmmword_1ACA582A0;
  return v6 > a3;
}

- (NSMutableAttributedString)attributedString
{
  return self->_attributedString;
}

- (BOOL)filterSubstringAttributes
{
  return self->_filterSubstringAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTimestamp, 0);
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_textLayoutManagerReferences, 0);
  objc_storeStrong((id *)&self->_coalescingUndoGroup, 0);
  objc_storeStrong((id *)&self->_undoCommands, 0);
  objc_storeStrong((id *)&self->_pasteboardTypes, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_deletedRanges, 0);
  objc_storeStrong((id *)&self->_styler, 0);
  objc_destroyWeak((id *)&self->_overrideUndoTarget);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_destroyWeak((id *)&self->_outlineController);
  objc_storeStrong((id *)&self->_highlightsAttributedString, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v10;
  objc_super v12;

  length = a5.length;
  location = a5.location;
  if (-[ICTTTextStorage validateIndex:effectiveRange:](self, "validateIndex:effectiveRange:"))
  {
    v12.receiver = self;
    v12.super_class = (Class)ICTTTextStorage;
    -[ICTTTextStorage attributesAtIndex:longestEffectiveRange:inRange:](&v12, sel_attributesAtIndex_longestEffectiveRange_inRange_, a3, a4, location, length);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA70];
  }
  return v10;
}

- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  int v11;
  objc_super v12;

  length = a5.length;
  location = a5.location;
  v9 = a3;
  v10 = a4;
  if (addAttribute_value_range__onceToken != -1)
    dispatch_once(&addAttribute_value_range__onceToken, &__block_literal_global_134);
  if (-[ICTTTextStorage isEditingTemporaryAttributes](self, "isEditingTemporaryAttributes")
    || !objc_msgSend(MEMORY[0x1E0CB3778], "dd_isTransientAttribute:", v9))
  {
    v11 = 0;
    if (!v10)
      goto LABEL_9;
    goto LABEL_8;
  }
  -[ICTTTextStorage beginTemporaryAttributes](self, "beginTemporaryAttributes");
  v11 = 1;
  if (v10)
  {
LABEL_8:
    v12.receiver = self;
    v12.super_class = (Class)ICTTTextStorage;
    -[ICTTTextStorage addAttribute:value:range:](&v12, sel_addAttribute_value_range_, v9, v10, location, length);
  }
LABEL_9:
  if (v11)
    -[ICTTTextStorage endTemporaryAttributes](self, "endTemporaryAttributes");

}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableAttributedString *highlightsAttributedString;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  ICTTTextStorage *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  ICTTTextStorage *v34;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  if (length)
  {
    v26 = v7;
    if (!-[ICTTTextStorage isResettingBaseWritingDirection](self, "isResettingBaseWritingDirection")
      && !-[ICTTTextStorage isTypingOrMarkingText](self, "isTypingOrMarkingText")
      && !-[ICTTTextStorage isSelectingText](self, "isSelectingText")
      && !-[ICTTTextStorage isPausingUndoActions](self, "isPausingUndoActions")
      && !-[ICTTTextStorage isEditingTemporaryAttributes](self, "isEditingTemporaryAttributes")
      && !-[ICTTTextStorage isEndingEditing](self, "isEndingEditing")
      && (location != -[ICTTTextStorage lastUndoEditRange](self, "lastUndoEditRange") || length != v8))
    {
      -[ICTTTextStorage breakUndoCoalescing](self, "breakUndoCoalescing");
    }
    -[ICTTTextStorage beginEditing](self, "beginEditing");
    self->_directlyEditing = 1;
    v9 = -[ICTTTextStorage isEditingTemporaryAttributes](self, "isEditingTemporaryAttributes");
    v10 = MEMORY[0x1E0C809B0];
    if (!v9)
    {
      v26 = v26;
      v11 = v26;
      if (-[ICTTTextStorage convertAttributes](self, "convertAttributes"))
      {
        -[ICTTTextStorage styler](self, "styler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "modelForStyleAttributes:filterAttributes:", v26, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[ICTTMergeableStringVersionedDocument mergeableString](self->_document, "mergeableString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "attributedString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x1E0D63940];
      v32[0] = v10;
      v32[1] = 3221225472;
      v32[2] = __39__ICTTTextStorage_setAttributes_range___block_invoke;
      v32[3] = &unk_1E5C20998;
      v16 = v11;
      v33 = v16;
      v34 = self;
      objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v15, location, length, 0, v32);

      if (-[ICTTTextStorage convertAttributes](self, "convertAttributes"))
      {
        -[ICTTTextStorage styler](self, "styler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "styleForModelAttributes:", v16);
        v18 = objc_claimAutoreleasedReturnValue();

        v26 = (id)v18;
      }

    }
    -[NSMutableAttributedString setAttributes:range:](self->_attributedString, "setAttributes:range:", v26, location, length, v26);
    objc_opt_class();
    objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0D63908]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    highlightsAttributedString = self->_highlightsAttributedString;
    v28[0] = v10;
    v28[1] = 3221225472;
    v28[2] = __39__ICTTTextStorage_setAttributes_range___block_invoke_2;
    v28[3] = &unk_1E5C209C0;
    v29 = v20;
    v30 = self;
    v31 = v22;
    v24 = v22;
    v25 = v20;
    -[NSMutableAttributedString enumerateAttributesInRange:options:usingBlock:](highlightsAttributedString, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v28);
    -[ICTTTextStorage edited:range:changeInLength:](self, "edited:range:changeInLength:", 1, location, length, 0);
    -[ICTTTextStorage endEditing](self, "endEditing");
    self->_directlyEditing = 0;

    v7 = v27;
  }

}

- (BOOL)isEditingTemporaryAttributes
{
  return self->_temporaryAttributeEditing != 0;
}

- (ICTTTextStorageStyler)styler
{
  return self->_styler;
}

- (void)beginEditing
{
  objc_super v3;

  -[ICTTTextStorage setEditingCount:](self, "setEditingCount:", -[ICTTTextStorage editingCount](self, "editingCount") + 1);
  v3.receiver = self;
  v3.super_class = (Class)ICTTTextStorage;
  -[ICTTTextStorage beginEditing](&v3, sel_beginEditing);
}

- (void)setEditingCount:(unint64_t)a3
{
  self->_editingCount = a3;
}

- (void)endEditing
{
  int64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  _NSRange *p_ttEditedRange;
  NSUInteger location;
  NSUInteger v10;
  NSUInteger v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = -[ICTTTextStorage changeInLength](self, "changeInLength");
  v4 = -[ICTTTextStorage editedRange](self, "editedRange");
  v6 = v5;
  v7 = -[ICTTTextStorage editedMask](self, "editedMask");
  -[ICTTTextStorage setBeforeEndEditedRange:](self, "setBeforeEndEditedRange:", v4, v6);
  if (-[ICTTTextStorage isEndingEditing](self, "isEndingEditing"))
  {
    -[ICTTTextStorage beginSkippingTimestampUpdates](self, "beginSkippingTimestampUpdates");
    v36.receiver = self;
    v36.super_class = (Class)ICTTTextStorage;
    -[ICTTTextStorage endEditing](&v36, sel_endEditing);
    -[ICTTTextStorage endSkippingTimestampUpdates](self, "endSkippingTimestampUpdates");
  }
  else
  {
    -[ICTTTextStorage setIsEndingEditing:](self, "setIsEndingEditing:", 1);
    -[ICTTTextStorage beginSkippingTimestampUpdates](self, "beginSkippingTimestampUpdates");
    v36.receiver = self;
    v36.super_class = (Class)ICTTTextStorage;
    -[ICTTTextStorage endEditing](&v36, sel_endEditing);
    -[ICTTTextStorage endSkippingTimestampUpdates](self, "endSkippingTimestampUpdates");
    -[ICTTTextStorage setIsEndingEditing:](self, "setIsEndingEditing:", 0);
  }
  if (-[ICTTTextStorage editingCount](self, "editingCount"))
    -[ICTTTextStorage setEditingCount:](self, "setEditingCount:", -[ICTTTextStorage editingCount](self, "editingCount") - 1);
  if (!-[ICTTTextStorage editingCount](self, "editingCount"))
  {
    if (!-[ICTTTextStorage isFixing](self, "isFixing") && v7)
    {
      p_ttEditedRange = &self->_ttEditedRange;
      location = self->_ttEditedRange.location;
      if (location == 0x7FFFFFFFFFFFFFFFLL)
      {
        p_ttEditedRange->location = v4;
        self->_ttEditedRange.length = v6;
      }
      else
      {
        if (v4 >= location)
          v10 = self->_ttEditedRange.location;
        else
          v10 = v4;
        v11 = self->_ttEditedRange.length + location;
        if (v6 - v3 + v4 > v11)
          v11 = v6 - v3 + v4;
        p_ttEditedRange->location = v10;
        self->_ttEditedRange.length = v3 - v10 + v11;
        v3 += self->_ttChangeInLength;
      }
      self->_ttChangeInLength = v3;
      -[ICTTTextStorage setTtEditedMask:](self, "setTtEditedMask:", -[ICTTTextStorage ttEditedMask](self, "ttEditedMask") | v7);
      if (!-[ICTTTextStorage isApplyingUndoCommand](self, "isApplyingUndoCommand")
        && !-[ICTTTextStorage isEditingTemporaryAttributes](self, "isEditingTemporaryAttributes"))
      {
        -[ICTTTextStorage fixupAfterEditingDelayedToEndOfRunLoop](self, "fixupAfterEditingDelayedToEndOfRunLoop");
      }
    }
    -[NSMutableArray removeAllObjects](self->_deletedRanges, "removeAllObjects");
    -[ICTTTextStorage undoCommands](self, "undoCommands");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      -[ICTTTextStorage coalescingUndoGroup](self, "coalescingUndoGroup");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        -[ICTTTextStorage undoTarget](self, "undoTarget");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "newCoalescingUndoGroup");
        -[ICTTTextStorage setCoalescingUndoGroup:](self, "setCoalescingUndoGroup:", v16);

        -[ICTTTextStorage undoManager](self, "undoManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTTTextStorage coalescingUndoGroup](self, "coalescingUndoGroup");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "registerUndoWithTarget:selector:object:", v15, sel_applyUndoGroup_, v18);

        -[ICTTTextStorage undoManager](self, "undoManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "undoActionName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "length");

        if (!v21)
        {
          -[ICTTTextStorage undoManager](self, "undoManager");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Typing"), CFSTR("Typing"), 0, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setActionName:", v23);

        }
      }
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      -[ICTTTextStorage undoCommands](self, "undoCommands", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v33 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            -[ICTTTextStorage coalescingUndoGroup](self, "coalescingUndoGroup");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addCommand:", v29);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v26);
      }

      -[ICTTTextStorage undoCommands](self, "undoCommands");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "removeAllObjects");

    }
  }
}

- (unint64_t)editingCount
{
  return self->_editingCount;
}

- (void)setIsEndingEditing:(BOOL)a3
{
  self->_isEndingEditing = a3;
}

- (void)setBeforeEndEditedRange:(_NSRange)a3
{
  self->_beforeEndEditedRange = a3;
}

- (BOOL)isEndingEditing
{
  return self->_isEndingEditing;
}

- (void)endSkippingTimestampUpdates
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_7(&dword_1AC7A1000, a1, a3, "Ending skipping timestamp updates without corresponding begin", v3);
}

- (int64_t)skipTimestampUpdatesCount
{
  return self->_skipTimestampUpdatesCount;
}

- (void)setSkipTimestampUpdatesCount:(int64_t)a3
{
  self->_skipTimestampUpdatesCount = a3;
}

- (void)beginSkippingTimestampUpdates
{
  -[ICTTTextStorage setSkipTimestampUpdatesCount:](self, "setSkipTimestampUpdatesCount:", -[ICTTTextStorage skipTimestampUpdatesCount](self, "skipTimestampUpdatesCount") + 1);
}

- (BOOL)isTypingOrMarkingText
{
  return self->_isTypingOrMarkingText;
}

- (BOOL)isSelectingText
{
  return self->_isSelectingText;
}

- (BOOL)isResettingBaseWritingDirection
{
  return self->_isResettingBaseWritingDirection;
}

- (void)edited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  char v8;
  void *v11;
  void *v12;
  NSUInteger v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableAttributedString *highlightsAttributedString;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  objc_super v25;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ICTTTextStorage;
  -[ICTTTextStorage edited:range:changeInLength:](&v25, sel_edited_range_changeInLength_);
  if (!self->_directlyEditing && location != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ICTTMergeableStringVersionedDocument mergeableString](self->_document, "mergeableString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = length + a5;
    -[NSMutableAttributedString attributedSubstringFromRange:](self->_attributedString, "attributedSubstringFromRange:", location, length);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attributedSubstringFromRange:", location, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    v17 = *MEMORY[0x1E0D63940];
    v18 = objc_msgSend(v16, "ic_range");
    objc_msgSend(v16, "removeAttribute:range:", v17, v18, v19);
    -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](self->_attributedString, "replaceCharactersInRange:withAttributedString:", location, length, v16);
    highlightsAttributedString = self->_highlightsAttributedString;
    objc_msgSend(v16, "string");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableAttributedString replaceCharactersInRange:withString:](highlightsAttributedString, "replaceCharactersInRange:withString:", location, length, v21);

    if ((v8 & 2) != 0)
    {
      -[ICTTTextStorage delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_respondsToSelector();

      if ((v23 & 1) != 0)
      {
        -[ICTTTextStorage delegate](self, "delegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "textStorage:didReplace:with:", self, v14, v16);

      }
    }

  }
}

- (ICTTMergeableStringVersionedDocument)document
{
  return self->_document;
}

- (void)setIsZombie:(BOOL)a3
{
  self->_isZombie = a3;
}

- (NSSet)textViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[ICTTTextStorage isForTextKit2](self, "isForTextKit2"))
  {
    -[ICTTTextStorage textLayoutManagers](self, "textLayoutManagers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_compactMap:", &__block_literal_global_107);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    -[ICTTTextStorage layoutManagers](self, "layoutManagers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_flatMap:", &__block_literal_global_111);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSSet *)v4;
}

- (BOOL)isForTextKit2
{
  char v2;

  if (ICInternalSettingsIsTextKit2Enabled() && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    v2 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    v2 = 0;
  }
  return v2 & 1;
}

- (ICTTTextStorage)initWithDocument:(id)a3
{
  id v5;
  ICTTTextStorage *v6;
  ICTTTextStorage *v7;
  id *p_document;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableAttributedString *attributedString;
  NSMutableAttributedString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUndoManager *v18;
  NSUndoManager *undoManager;
  NSMutableArray *v20;
  NSMutableArray *undoCommands;
  NSMutableArray *v22;
  NSMutableArray *deletedRanges;
  uint64_t v24;
  NSMutableSet *textLayoutManagerReferences;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ICTTTextStorage;
  v6 = -[ICTTTextStorage init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    p_document = (id *)&v6->_document;
    objc_storeStrong((id *)&v6->_document, a3);
    objc_msgSend(*p_document, "mergeableString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", v7);

    objc_msgSend(*p_document, "mergeableString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "mutableCopy");
    attributedString = v7->_attributedString;
    v7->_attributedString = (NSMutableAttributedString *)v12;

    v14 = v7->_attributedString;
    v15 = *MEMORY[0x1E0D63940];
    v16 = -[NSMutableAttributedString ic_range](v14, "ic_range");
    -[NSMutableAttributedString removeAttribute:range:](v14, "removeAttribute:range:", v15, v16, v17);
    v18 = (NSUndoManager *)objc_alloc_init(MEMORY[0x1E0CB3A48]);
    undoManager = v7->_undoManager;
    v7->_undoManager = v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    undoCommands = v7->_undoCommands;
    v7->_undoCommands = v20;

    v7->_wantsUndoCommands = 1;
    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletedRanges = v7->_deletedRanges;
    v7->_deletedRanges = v22;

    v7->_previouslyHadMarkedText = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v24 = objc_claimAutoreleasedReturnValue();
    textLayoutManagerReferences = v7->_textLayoutManagerReferences;
    v7->_textLayoutManagerReferences = (NSMutableSet *)v24;

    -[ICTTTextStorage resetHighlightsAttributedString](v7, "resetHighlightsAttributedString");
    -[ICTTTextStorage resetTTEdits](v7, "resetTTEdits");
  }

  return v7;
}

- (NSSet)textLayoutManagers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[ICTTTextStorage textLayoutManagerReferences](self, "textLayoutManagerReferences", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "object");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "object");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);
        }
        else
        {
          -[ICTTTextStorage textLayoutManagerReferences](self, "textLayoutManagerReferences");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeObject:", v10);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v13;
}

- (NSMutableSet)textLayoutManagerReferences
{
  return self->_textLayoutManagerReferences;
}

- (void)resetTTEdits
{
  self->_ttEditedRange = (_NSRange)xmmword_1ACA582A0;
  self->_ttEditedMask = 0;
  self->_ttChangeInLength = 0;
}

- (ICTTTextStorage)initWithData:(id)a3 replicaID:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  ICTTTextStorage *v10;

  v6 = (objc_class *)MEMORY[0x1E0D63C88];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithData:replicaID:", v8, v7);

  v10 = -[ICTTTextStorage initWithDocument:](self, "initWithDocument:", v9);
  return v10;
}

id __28__ICTTTextStorage_textViews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  objc_msgSend(v2, "textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSAttributedString)highlightsAttributedString
{
  return &self->_highlightsAttributedString->super;
}

void __82__ICTTTextStorage_UI__bulletTextAttributesWithTextFont_paragraphStyle_zoomFactor___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D641C0]);
  v1 = (void *)bulletTextAttributesWithTextFont_paragraphStyle_zoomFactor__cache;
  bulletTextAttributesWithTextFont_paragraphStyle_zoomFactor__cache = (uint64_t)v0;

}

uint64_t __51__ICTTTextStorage_hasAnyTextViewWithDarkAppearance__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_isDark");

  return v3;
}

void __50__ICTTTextStorage_executeDelayedFixupAfterEditing__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EED6F5B0))
    objc_msgSend(v2, "didEndPostLayoutFixupAfterEditing");

}

void __50__ICTTTextStorage_executeDelayedFixupAfterEditing__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EED6F5B0))
    objc_msgSend(v2, "willBeginPostLayoutFixupAfterEditing");

}

void __44__ICTTTextStorage_addAttribute_value_range___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;

  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) == 0
    && !dlopen("/System/Library/PrivateFrameworks/DataDetectorsUI.framework/DataDetectorsUI", 1))
  {
    v0 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      __44__ICTTTextStorage_addAttribute_value_range___block_invoke_cold_1(v0, v1, v2);

  }
}

void __36__ICTTTextStorage_restoreSelection___block_invoke(id *a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t location;
  NSUInteger v11;
  NSUInteger length;
  void *v13;
  uint64_t v14;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  NSRange v19;
  NSRange v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  uint8_t v28;
  _BYTE v29[15];
  uint8_t v30[4];
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;
  NSRange v37;
  NSRange v38;
  NSRange v39;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1[4], "count");
  if (v2)
  {
    v4 = v2;
    v5 = 0;
    *(_QWORD *)&v3 = 138412546;
    v27 = v3;
    do
    {
      objc_msgSend(*((id *)a1[5] + 24), "mergeableString", v27);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "characterRangesForSelection:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      location = objc_msgSend(v9, "rangeValue");
      length = v11;

      objc_msgSend(a1[4], "objectAtIndexedSubscript:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "selectedRange") != location || v14 != length)
      {
        if (location + length > objc_msgSend(a1[5], "length"))
        {
          v16 = os_log_create("com.apple.notes", "Topotext");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            __36__ICTTTextStorage_restoreSelection___block_invoke_cold_2(&v28, v29, v16);

          v17 = os_log_create("com.apple.notes", "Topotext");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v37.location = location;
            v37.length = length;
            NSStringFromRange(v37);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(a1[5], "length");
            *(_DWORD *)buf = v27;
            v33 = v25;
            v34 = 2048;
            v35 = v26;
            _os_log_error_impl(&dword_1AC7A1000, v17, OS_LOG_TYPE_ERROR, "original selRange: %@, self.length = %lu", buf, 0x16u);

          }
          v18 = objc_msgSend(a1[5], "length");
          v19.location = objc_msgSend(a1[5], "length");
          v19.length = v19.location;
          if (location >= v18)
          {
            length = 0;
            location = v19.location;
          }
          else
          {
            v19.location = 0;
            v39.location = location;
            v39.length = length;
            v20 = NSIntersectionRange(v19, v39);
            location = v20.location;
            length = v20.length;
          }
          v21 = os_log_create("com.apple.notes", "Topotext");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v38.location = location;
            v38.length = length;
            __36__ICTTTextStorage_restoreSelection___block_invoke_cold_1(v30, v38, &v31, v21);
          }

        }
        objc_msgSend(v13, "setSelectedRange:", location, length);
      }
      objc_msgSend(*((id *)a1[5] + 24), "mergeableString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectsNeedingUpdatedRanges");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "objectAtIndexedSubscript:", v5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeObject:", v24);

      ++v5;
    }
    while (v4 != v5);
  }
}

void __36__ICTTTextStorage_fixupAfterEditing__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSRange v17;
  void *v18;
  void *v19;
  id v20;
  NSRange v21;
  NSRange v22;

  objc_msgSend(*(id *)(a1 + 32), "styler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "styler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(v5, "ttEditedMask");
    v7 = objc_msgSend(*(id *)(a1 + 32), "ttEditedRange");
    objc_msgSend(v4, "fixTextStorage:afterProcessingEditing:range:changeInLength:", v5, v6, v7, v8, objc_msgSend(*(id *)(a1 + 32), "ttChangeInLength"));

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "directlyEditing") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "isEditingTemporaryAttributes") & 1) == 0)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 32), "ttEditedRange");
    v13 = objc_msgSend(v9, "ic_enclosingRangeContainingCharactersInSet:forRange:", v10, v11, v12);
    v15 = v14;

    v22.location = objc_msgSend(*(id *)(a1 + 32), "ic_range");
    v22.length = v16;
    v21.location = v13;
    v21.length = v15;
    v17 = NSIntersectionRange(v21, v22);
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "styler");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "authorHighlightsController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "performHighlightUpdatesForRange:inTextStorage:updates:", v17.location, v17.length, *(_QWORD *)(a1 + 32), 0);

  }
}

- (BOOL)wantsUndoCommands
{
  return self->_wantsUndoCommands;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (NSMutableArray)undoCommands
{
  return self->_undoCommands;
}

- (_NSRange)ttEditedRange
{
  _NSRange *p_ttEditedRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_ttEditedRange = &self->_ttEditedRange;
  location = self->_ttEditedRange.location;
  length = p_ttEditedRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)ttEditedMask
{
  return self->_ttEditedMask;
}

- (int64_t)ttChangeInLength
{
  return self->_ttChangeInLength;
}

- (void)suppressingShiftStateUpdatesIfNecessaryWithSelection:(void *)a3 perform:
{
  void *v5;
  void (**v6)(void);

  v6 = a3;
  if (a1)
  {
    objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(a1, "isFixing") & 1) != 0 || !objc_msgSend(v5, "count"))
      v6[2]();
    else
      objc_msgSend(MEMORY[0x1E0DC3938], "ic_suppressingShiftStateUpdates:", v6);

  }
}

- (void)styleTextInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;

  if (a3.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    length = a3.length;
    location = a3.location;
    if (!-[ICTTTextStorage isEditingTemporaryAttributes](self, "isEditingTemporaryAttributes"))
    {
      -[ICTTTextStorage styler](self, "styler");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "styleText:inRange:fixModelAttributes:", self, location, length, 1);

    }
  }
}

- (void)setWantsUndoCommands:(BOOL)a3
{
  self->_wantsUndoCommands = a3;
}

- (void)setTtEditedMask:(unint64_t)a3
{
  self->_ttEditedMask = a3;
}

- (void)setStyler:(id)a3
{
  objc_storeStrong((id *)&self->_styler, a3);
}

- (void)setPendingFixupAfterEditing:(BOOL)a3
{
  self->_pendingFixupAfterEditing = a3;
}

- (void)setIsFixing:(BOOL)a3
{
  self->_isFixing = a3;
}

- (void)setDisableUndoCoalesceBreaking:(BOOL)a3
{
  self->_disableUndoCoalesceBreaking = a3;
}

- (void)setDelayedFixupAfterEditingWantsUndoCommand:(BOOL)a3
{
  self->_delayedFixupAfterEditingWantsUndoCommand = a3;
}

- (id)savedSelectionWithSelectionAffinity:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[ICTTTextStorage textViews](self, "textViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(obj);
        v12 = (void *)MEMORY[0x1E0CB3B18];
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "selectedRange");
        objc_msgSend(v12, "valueWithRange:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICTTMergeableStringVersionedDocument mergeableString](self->_document, "mergeableString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "selectionForCharacterRanges:selectionAffinity:", v16, a3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v18);
        -[ICTTMergeableStringVersionedDocument mergeableString](self->_document, "mergeableString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectsNeedingUpdatedRanges");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v18);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v9);
  }

  v28[0] = obj;
  v28[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)saveSelectionDuringBlock:(id)a3 affinity:(unint64_t)a4
{
  void (**v6)(_QWORD);
  id v7;

  v6 = (void (**)(_QWORD))a3;
  -[ICTTTextStorage savedSelectionWithSelectionAffinity:](self, "savedSelectionWithSelectionAffinity:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6);

  -[ICTTTextStorage restoreSelection:](self, "restoreSelection:", v7);
}

- (void)saveSelectionDuringBlock:(id)a3
{
  -[ICTTTextStorage saveSelectionDuringBlock:affinity:](self, "saveSelectionDuringBlock:affinity:", a3, 0);
}

- (void)restoreSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  ICTTTextStorage *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__ICTTTextStorage_restoreSelection___block_invoke;
  v9[3] = &unk_1E5C1D7C0;
  v10 = v5;
  v11 = self;
  v12 = v6;
  v7 = v6;
  v8 = v5;
  -[ICTTTextStorage suppressingShiftStateUpdatesIfNecessaryWithSelection:perform:](self, v4, v9);

}

- (void)resetHighlightsAttributedString
{
  id v3;
  void *v4;
  NSMutableAttributedString *v5;
  NSMutableAttributedString *highlightsAttributedString;
  NSMutableAttributedString *attributedString;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableAttributedString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v3 = objc_alloc(MEMORY[0x1E0CB3778]);
  -[NSMutableAttributedString string](self->_attributedString, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSMutableAttributedString *)objc_msgSend(v3, "initWithString:", v4);
  highlightsAttributedString = self->_highlightsAttributedString;
  self->_highlightsAttributedString = v5;

  attributedString = self->_attributedString;
  v8 = *MEMORY[0x1E0DC1140];
  v9 = -[NSMutableAttributedString ic_range](attributedString, "ic_range");
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__ICTTTextStorage_resetHighlightsAttributedString__block_invoke;
  v17[3] = &unk_1E5C1E120;
  v17[4] = self;
  -[NSMutableAttributedString enumerateAttribute:inRange:options:usingBlock:](attributedString, "enumerateAttribute:inRange:options:usingBlock:", v8, v9, v11, 0, v17);
  v12 = self->_attributedString;
  v13 = *MEMORY[0x1E0D63908];
  v14 = -[NSMutableAttributedString ic_range](v12, "ic_range");
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __50__ICTTTextStorage_resetHighlightsAttributedString__block_invoke_2;
  v16[3] = &unk_1E5C1E120;
  v16[4] = self;
  -[NSMutableAttributedString enumerateAttribute:inRange:options:usingBlock:](v12, "enumerateAttribute:inRange:options:usingBlock:", v13, v14, v15, 0, v16);
}

- (BOOL)pendingFixupAfterEditing
{
  return self->_pendingFixupAfterEditing;
}

- (ICTTMergeableAttributedString)mergeableString
{
  return (ICTTMergeableAttributedString *)-[ICTTMergeableStringVersionedDocument mergeableString](self->_document, "mergeableString");
}

- (BOOL)isZombie
{
  return self->_isZombie;
}

- (BOOL)isFixing
{
  return self->_isFixing;
}

- (BOOL)isDropping
{
  return self->_isDropping;
}

- (BOOL)isApplyingUndoCommand
{
  return self->_isApplyingUndoCommand;
}

- (BOOL)hasAnyTextViewWithDarkAppearance
{
  void *v2;
  char v3;

  -[ICTTTextStorage textViews](self, "textViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ic_containsObjectPassingTest:", &__block_literal_global_41);

  return v3;
}

- (void)forceFixupAfterEditingIfDelayed
{
  _BOOL8 v3;

  if (-[ICTTTextStorage pendingFixupAfterEditing](self, "pendingFixupAfterEditing"))
  {
    v3 = -[ICTTTextStorage wantsUndoCommands](self, "wantsUndoCommands");
    -[ICTTTextStorage setWantsUndoCommands:](self, "setWantsUndoCommands:", -[ICTTTextStorage delayedFixupAfterEditingWantsUndoCommand](self, "delayedFixupAfterEditingWantsUndoCommand"));
    -[ICTTTextStorage fixupAfterEditing](self, "fixupAfterEditing");
    -[ICTTTextStorage setWantsUndoCommands:](self, "setWantsUndoCommands:", v3);
  }
}

- (void)fixupAfterEditing
{
  _BOOL4 v3;
  void *v4;
  _QWORD v5[5];

  v3 = -[ICTTTextStorage pendingFixupAfterEditing](self, "pendingFixupAfterEditing");
  -[ICTTTextStorage setPendingFixupAfterEditing:](self, "setPendingFixupAfterEditing:", 0);
  if (!-[ICTTTextStorage isFixing](self, "isFixing")
    && -[ICTTTextStorage ttEditedRange](self, "ttEditedRange") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ICTTTextStorage setIsFixing:](self, "setIsFixing:", 1);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __36__ICTTTextStorage_fixupAfterEditing__block_invoke;
    v5[3] = &unk_1E5C1D540;
    v5[4] = self;
    -[ICTTTextStorage saveSelectionDuringBlock:](self, "saveSelectionDuringBlock:", v5);
    -[ICTTTextStorage resetTTEdits](self, "resetTTEdits");
    -[ICTTTextStorage setIsFixing:](self, "setIsFixing:", 0);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "postNotificationName:object:", CFSTR("ICTTTextStorageDidProcessEndEditingNotification"), self);

    }
  }
}

- (void)fixupAfterEditingDelayedToEndOfRunLoop
{
  -[ICTTTextStorage setDelayedFixupAfterEditingWantsUndoCommand:](self, "setDelayedFixupAfterEditingWantsUndoCommand:", -[ICTTTextStorage wantsUndoCommands](self, "wantsUndoCommands"));
  if (!-[ICTTTextStorage pendingFixupAfterEditing](self, "pendingFixupAfterEditing"))
  {
    -[ICTTTextStorage setPendingFixupAfterEditing:](self, "setPendingFixupAfterEditing:", 1);
    -[ICTTTextStorage performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_executeDelayedFixupAfterEditing, 0, 0.0);
  }
}

- (void)executeDelayedFixupAfterEditing
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  if (!-[ICTTTextStorage isZombie](self, "isZombie"))
  {
    if (-[ICTTTextStorage pendingFixupAfterEditing](self, "pendingFixupAfterEditing"))
    {
      v3 = -[ICTTTextStorage wantsUndoCommands](self, "wantsUndoCommands");
      -[ICTTTextStorage setWantsUndoCommands:](self, "setWantsUndoCommands:", -[ICTTTextStorage delayedFixupAfterEditingWantsUndoCommand](self, "delayedFixupAfterEditingWantsUndoCommand"));
      -[ICTTTextStorage textViews](self, "textViews");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_45);

      -[ICTTTextStorage fixupAfterEditing](self, "fixupAfterEditing");
      -[ICTTTextStorage textViews](self, "textViews");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_92);

      -[ICTTTextStorage setWantsUndoCommands:](self, "setWantsUndoCommands:", v3);
    }
  }
}

- (void)endTemporaryAttributes
{
  unint64_t temporaryAttributeEditing;
  unint64_t v3;

  temporaryAttributeEditing = self->_temporaryAttributeEditing;
  if (temporaryAttributeEditing)
  {
    v3 = temporaryAttributeEditing - 1;
    self->_temporaryAttributeEditing = v3;
    self->_isEditingTemporaryAttributes = v3 != 0;
  }
}

- (void)endTemporaryAttributeEditing
{
  -[ICTTTextStorage endEditing](self, "endEditing");
  -[ICTTTextStorage endTemporaryAttributes](self, "endTemporaryAttributes");
}

- (BOOL)directlyEditing
{
  return self->_directlyEditing;
}

- (BOOL)delayedFixupAfterEditingWantsUndoCommand
{
  return self->_delayedFixupAfterEditingWantsUndoCommand;
}

- (void)dd_makeLinksForResultsInAttributesOfType:(unint64_t)a3 context:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  ICTTTextStorage *v21;
  unint64_t v22;

  length = a5.length;
  location = a5.location;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", location, length);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[ICTTTextStorage delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v11, "calculateDocumentController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "expressionsIndexSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeIndexes:", v14);

  }
  -[ICTTTextStorage beginTemporaryAttributes](self, "beginTemporaryAttributes", v17);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__ICTTTextStorage_dd_makeLinksForResultsInAttributesOfType_context_range___block_invoke;
  v19[3] = &unk_1E5C20970;
  v21 = self;
  v22 = a3;
  v20 = v9;
  v15 = v9;
  objc_msgSend(v18, "enumerateRangesUsingBlock:", v19);
  -[ICTTTextStorage endTemporaryAttributes](self, "endTemporaryAttributes");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:", CFSTR("ICTTTextStorageDidUpdateDataDetectionResultsNotification"), self);

}

- (void)coordinateReading:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!-[ICTTTextStorage isTypingOrMarkingText](self, "isTypingOrMarkingText")
    && !-[ICTTTextStorage isSelectingText](self, "isSelectingText")
    && !-[ICTTTextStorage isDropping](self, "isDropping"))
  {
    -[ICTTTextStorage forceFixupAfterEditingIfDelayed](self, "forceFixupAfterEditingIfDelayed");
  }
  v5.receiver = self;
  v5.super_class = (Class)ICTTTextStorage;
  -[ICTTTextStorage coordinateReading:](&v5, sel_coordinateReading_, v4);

}

- (void)coordinateAccess:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!-[ICTTTextStorage isTypingOrMarkingText](self, "isTypingOrMarkingText")
    && !-[ICTTTextStorage isSelectingText](self, "isSelectingText")
    && !-[ICTTTextStorage isDropping](self, "isDropping"))
  {
    -[ICTTTextStorage forceFixupAfterEditingIfDelayed](self, "forceFixupAfterEditingIfDelayed");
  }
  v5.receiver = self;
  v5.super_class = (Class)ICTTTextStorage;
  -[ICTTTextStorage coordinateAccess:](&v5, sel_coordinateAccess_, v4);

}

- (void)beginTemporaryAttributes
{
  ++self->_temporaryAttributeEditing;
}

- (void)beginTemporaryAttributeEditing
{
  -[ICTTTextStorage beginTemporaryAttributes](self, "beginTemporaryAttributes");
  -[ICTTTextStorage beginEditing](self, "beginEditing");
}

- (_NSRange)beforeEndEditedRange
{
  _NSRange *p_beforeEndEditedRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_beforeEndEditedRange = &self->_beforeEndEditedRange;
  location = self->_beforeEndEditedRange.location;
  length = p_beforeEndEditedRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)addTextLayoutManager:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0D64298];
  v5 = a3;
  v7 = (id)objc_msgSend([v4 alloc], "initWithObject:", v5);

  -[ICTTTextStorage textLayoutManagerReferences](self, "textLayoutManagerReferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

+ (double)listItemGlyphPointSizeForUnorderedListStyle:(unsigned int)a3 zoomFactor:(double)a4
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  if (a3 == 100)
  {
    v4 = 12.0;
    v5 = 26.0;
  }
  else if (a3 == 101)
  {
    v4 = 17.0;
    v5 = 32.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICTTTextStorage(UI) listItemGlyphPointSizeForUnorderedListStyle:zoomFactor:]", 1, 0, CFSTR("Expected bulleted or dashed list style"), a4);
    v5 = 0.0;
    v4 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForTextStyle:adjustedForDefaultSize:maxSize:", *MEMORY[0x1E0DC4A88], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointSize");
  v8 = v7;

  return ceil(v8);
}

+ (id)bulletTextAttributesWithTextFont:(id)a3 paragraphStyle:(id)a4 zoomFactor:(double)a5
{
  id v8;
  id v9;
  TTBulletTextAttributesCacheKey *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (bulletTextAttributesWithTextFont_paragraphStyle_zoomFactor__onceToken != -1)
    dispatch_once(&bulletTextAttributesWithTextFont_paragraphStyle_zoomFactor__onceToken, &__block_literal_global_22);
  v10 = -[TTBulletTextAttributesCacheKey initWithTextFont:paragraphStyle:zoomFactor:]([TTBulletTextAttributesCacheKey alloc], "initWithTextFont:paragraphStyle:zoomFactor:", v8, v9, a5);
  objc_msgSend((id)bulletTextAttributesWithTextFont_paragraphStyle_zoomFactor__cache, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if (objc_msgSend(v9, "style") == 100)
    {
      objc_msgSend(a1, "listItemGlyphPointSizeForUnorderedListStyle:zoomFactor:", 100, a5);
      objc_msgSend(MEMORY[0x1E0DC1350], "fontWithName:size:", CFSTR("Menlo-Regular"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForBodyText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "style") == 101)
      {
        objc_msgSend(a1, "listItemGlyphPointSizeForUnorderedListStyle:zoomFactor:", 101, a5);
        objc_msgSend(v13, "ic_fontWithSize:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v8, "pointSize");
        objc_msgSend(v13, "ic_fontWithSize:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "ic_fontWithTabularNumbers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(MEMORY[0x1E0DC1290], "ic_mutableDefaultParagraphStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBaseWritingDirection:", objc_msgSend(v9, "layoutWritingDirection"));
    v16 = *MEMORY[0x1E0DC1178];
    v19[0] = *MEMORY[0x1E0DC1138];
    v19[1] = v16;
    v20[0] = v12;
    v20[1] = v15;
    v19[2] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)bulletTextAttributesWithTextFont_paragraphStyle_zoomFactor__cache, "setObject:forKey:", v11, v10);
  }

  return v11;
}

- (ICTTTextStorage)initWithAttributedString:(id)a3 replicaID:(id)a4
{
  id v6;
  ICTTTextStorage *v7;
  ICTTTextStorage *v8;
  _BOOL4 v9;
  __objc2_class **v10;
  id v11;

  v6 = a3;
  v7 = -[ICTTTextStorage initWithData:replicaID:](self, "initWithData:replicaID:", 0, a4);
  v8 = v7;
  if (v7)
  {
    v9 = -[ICTTTextStorage isForTextKit2](v7, "isForTextKit2");
    v10 = off_1E5C1BD68;
    if (!v9)
      v10 = off_1E5C1BEA8;
    v11 = objc_alloc_init(*v10);
    -[ICTTTextStorage setStyler:](v8, "setStyler:", v11);

    -[ICTTTextStorage setConvertAttributes:](v8, "setConvertAttributes:", 1);
    -[ICTTTextStorage setWantsUndoCommands:](v8, "setWantsUndoCommands:", 0);
    -[ICTTTextStorage replaceCharactersInRange:withAttributedString:](v8, "replaceCharactersInRange:withAttributedString:", 0, -[ICTTTextStorage length](v8, "length"), v6);
    -[ICTTTextStorage fixupAfterEditing](v8, "fixupAfterEditing");
    -[ICTTTextStorage setConvertAttributes:](v8, "setConvertAttributes:", 0);
  }

  return v8;
}

- (ICTTTextStorage)initWithAttributedString:(id)a3 replicaID:(id)a4 sourceZoomController:(id)a5 keepSourceZoomController:(BOOL)a6 existingStyler:(id)a7
{
  id v12;
  id v13;
  id v14;
  ICTTTextStorage *v15;
  ICTTTextStorage *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  __objc2_class *v26;
  id v27;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = -[ICTTTextStorage initWithData:replicaID:](self, "initWithData:replicaID:", 0, a4);
  v16 = v15;
  if (!v15)
    goto LABEL_8;
  if (!v14)
  {
    if (-[ICTTTextStorage isForTextKit2](v15, "isForTextKit2"))
      v26 = ICTK2TextController;
    else
      v26 = ICTextController;
    v27 = objc_alloc_init(v26);
    -[ICTTTextStorage setStyler:](v16, "setStyler:", v27);

    if (!v13)
      goto LABEL_5;
    goto LABEL_4;
  }
  -[ICTTTextStorage setStyler:](v15, "setStyler:", v14);
  if (v13)
  {
LABEL_4:
    objc_opt_class();
    -[ICTTTextStorage styler](v16, "styler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setZoomController:", v13);

  }
LABEL_5:
  -[ICTTTextStorage setConvertAttributes:](v16, "setConvertAttributes:", 1);
  -[ICTTTextStorage setWantsUndoCommands:](v16, "setWantsUndoCommands:", 0);
  -[ICTTTextStorage replaceCharactersInRange:withAttributedString:](v16, "replaceCharactersInRange:withAttributedString:", 0, -[ICTTTextStorage length](v16, "length"), v12);
  -[ICTTTextStorage styler](v16, "styler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[ICTTTextStorage editedRange](v16, "editedRange");
  objc_msgSend(v19, "styleText:inRange:fixModelAttributes:", v16, v20, v21, 1);

  -[ICTTTextStorage fixupAfterEditing](v16, "fixupAfterEditing");
  -[ICTTTextStorage setConvertAttributes:](v16, "setConvertAttributes:", 0);
  if (v13 && !a6)
  {
    objc_opt_class();
    -[ICTTTextStorage styler](v16, "styler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_alloc_init((Class)objc_opt_class());
    objc_msgSend(v23, "setZoomController:", v24);

    objc_msgSend(v23, "refreshTextStylingForTextStorage:withTextController:", v16, v23);
  }
LABEL_8:

  return v16;
}

- (void)preReplaceCharactersInRange:(_NSRange)a3 withStringLength:(unint64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  length = a3.length;
  location = a3.location;
  v15[2] = *MEMORY[0x1E0C80C00];
  v8 = -[ICTTTextStorage isDeletingDictationAttachmentWithReplacementRange:replacementLength:](self, "isDeletingDictationAttachmentWithReplacementRange:replacementLength:");
  v9 = -[ICTTTextStorage shouldBreakUndoCoalescingWithReplacementRange:replacementLength:](self, "shouldBreakUndoCoalescingWithReplacementRange:replacementLength:", location, length, a4);
  if (-[ICTTTextStorage isPerformingAccessibilityUndoableTextInsertion](self, "isPerformingAccessibilityUndoableTextInsertion")|| !-[ICTTTextStorage isDragging](self, "isDragging")&& !-[ICTTTextStorage isPausingUndoActions](self, "isPausingUndoActions")&& !v8&& v9)
  {
    -[ICTTTextStorage breakUndoCoalescing](self, "breakUndoCoalescing");
  }
  if (length)
  {
    if (!a4)
    {
      -[ICTTTextStorage deletedRanges](self, "deletedRanges");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v11;
      -[ICTTTextStorage attributedString](self, "attributedString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "attributedSubstringFromRange:", location, length);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v14);

    }
  }
}

- (BOOL)isDeletingDictationAttachmentWithReplacementRange:(_NSRange)a3 replacementLength:(unint64_t)a4
{
  _BOOL4 v4;
  void *v5;

  LOBYTE(v4) = 0;
  if (a3.length && !a4)
  {
    -[ICTTTextStorage attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], a3.location);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = !+[ICTextAttachment textAttachmentIsContent:](ICTextAttachment, "textAttachmentIsContent:", v5);

  }
  return v4;
}

- (BOOL)isEditingOrConvertingMarkedText:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[ICTTTextStorage textViews](self, "textViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__ICTTTextStorage_UI__isEditingOrConvertingMarkedText___block_invoke;
  v8[3] = &unk_1E5C1EEA0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  v6 = *((unsigned __int8 *)v10 + 24);
  if (v3)
    -[ICTTTextStorage setPreviouslyHadMarkedText:](self, "setPreviouslyHadMarkedText:", v6 != 0);
  _Block_object_dispose(&v9, 8);
  return v6 != 0;
}

uint64_t __55__ICTTTextStorage_UI__isEditingOrConvertingMarkedText___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "textViewHasMarkedText:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (BOOL)textViewHasMarkedText:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "markedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isDeletingContentAttachmentWithReplacementRange:(_NSRange)a3 replacementLength:(unint64_t)a4
{
  NSUInteger length;
  BOOL v5;
  NSUInteger location;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  length = a3.length;
  v5 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (a3.length && !a4)
  {
    location = a3.location;
    v7 = *MEMORY[0x1E0DC10F8];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __89__ICTTTextStorage_UI__isDeletingContentAttachmentWithReplacementRange_replacementLength___block_invoke;
    v9[3] = &unk_1E5C1EEC8;
    v9[4] = &v10;
    -[ICTTTextStorage enumerateAttribute:inRange:options:usingBlock:](self, "enumerateAttribute:inRange:options:usingBlock:", v7, location, length, 0, v9);
    v5 = *((_BYTE *)v11 + 24) != 0;
  }
  _Block_object_dispose(&v10, 8);
  return v5;
}

void __89__ICTTTextStorage_UI__isDeletingContentAttachmentWithReplacementRange_replacementLength___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  _BOOL4 v8;
  id v9;

  v7 = a2;
  if (v7)
  {
    v9 = v7;
    v8 = +[ICTextAttachment textAttachmentIsContent:](ICTextAttachment, "textAttachmentIsContent:", v7);
    v7 = v9;
    if (v8)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a5 = 1;
    }
  }

}

- (BOOL)shouldBreakUndoCoalescingWithReplacementRange:(_NSRange)a3 replacementLength:(unint64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  _BOOL4 v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;

  length = a3.length;
  location = a3.location;
  v8 = -[ICTTTextStorage isEditingOrConvertingMarkedText:](self, "isEditingOrConvertingMarkedText:", 1);
  v9 = -[ICTTTextStorage lastUndoEditRange](self, "lastUndoEditRange");
  v11 = location != v9 + v10 && location + length != -[ICTTTextStorage lastUndoEditRange](self, "lastUndoEditRange");
  if (location >= -[ICTTTextStorage length](self, "length"))
  {
    v14 = 0;
  }
  else
  {
    -[ICTTTextStorage string](self, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rangeOfComposedCharacterSequenceAtIndex:", location);
    v14 = v13;

  }
  v15 = length == v14 && a4 == 0;
  v16 = -[ICTTTextStorage isDeletingContentAttachmentWithReplacementRange:replacementLength:](self, "isDeletingContentAttachmentWithReplacementRange:replacementLength:", location, length, a4);
  if (a4)
    v17 = length == 0;
  else
    v17 = 0;
  if (v17 || v15)
  {
    v21 = v11 || v16;
    v20 = !v8;
  }
  else
  {
    v18 = a4 == 0;
    if (a4)
      v19 = length != 0;
    else
      v19 = 0;
    if (length <= v14)
      v18 = 0;
    v20 = v19 || v18;
    v21 = !v8;
  }
  if (!-[ICTTTextStorage isHandlingTextCheckingResults](self, "isHandlingTextCheckingResults"))
    -[ICTTTextStorage setLastUndoEditRange:](self, "setLastUndoEditRange:", location, a4);
  return v20 && v21;
}

- (void)convertNSTablesToTabs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  __int128 v14;

  v3 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3010000000;
  v13[3] = "";
  v14 = xmmword_1ACA582A0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__18;
  v11[4] = __Block_byref_object_dispose__18;
  v12 = 0;
  v4 = objc_msgSend(v3, "length");
  v5 = *MEMORY[0x1E0DC1178];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__ICTTTextStorage_UI__convertNSTablesToTabs___block_invoke;
  v7[3] = &unk_1E5C1EEF0;
  v9 = v13;
  v10 = v11;
  v6 = v3;
  v8 = v6;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v4, 0, v7);

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);

}

void __45__ICTTTextStorage_UI__convertNSTablesToTabs___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;

  v7 = a2;
  if (v7)
  {
    v20 = v7;
    objc_msgSend(v7, "textBlocks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    v7 = v20;
    if (v9)
    {
      objc_msgSend(v20, "textBlocks");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "startingRow");
        if (v12 == objc_msgSend(v11, "startingRow"))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "table");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "table");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 == v14)
          {
            objc_msgSend(&stru_1E5C2F8C0, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "columnSpan"), CFSTR("\t"), 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32)+ *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)- 1, 1, v15);

          }
        }
      }
      if (a4)
      {
        objc_msgSend(*(id *)(a1 + 32), "string");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "characterAtIndex:", a4 + a3 - 1);

        if (v17 == 10)
        {
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          *(_QWORD *)(v18 + 32) = a3;
          *(_QWORD *)(v18 + 40) = a4;
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v11);
        }
      }
      v19 = (void *)objc_msgSend(v20, "mutableCopy");
      objc_msgSend(v19, "setAlignment:", 4);
      objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v19, a3, a4);

      v7 = v20;
    }
  }

}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL8 v25;
  id v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  char v84;
  void *v85;
  void *v86;
  char v87;
  void *v88;
  NSUInteger v89;
  void *v90;
  void *v91;
  NSObject *v92;
  NSObject *v93;
  NSObject *v94;
  _QWORD v95[4];
  id v96;
  _QWORD v97[4];
  id v98;
  _QWORD v99[5];
  NSObject *v100;
  id v101;
  id v102;
  id v103;
  _QWORD *v104;
  BOOL v105;
  _QWORD v106[5];
  _QWORD v107[3];
  char v108;
  _QWORD v109[5];
  _QWORD v110[3];
  char v111;
  NSRange v112;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  if (location + length <= -[ICTTTextStorage length](self, "length")
    && (-[ICTTTextStorage attributedString](self, "attributedString"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "length"),
        v8,
        location + length <= v9))
  {
    if (-[ICTTTextStorage shouldRemoveLeadingWhitespaceForChecklistDrop](self, "shouldRemoveLeadingWhitespaceForChecklistDrop"))
    {
      -[ICTTTextStorage setShouldRemoveLeadingWhitespaceForChecklistDrop:](self, "setShouldRemoveLeadingWhitespaceForChecklistDrop:", 0);
      if (!length)
      {
        -[ICTTTextStorage string](self, "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "lineRangeForRange:", location, 0);
        objc_msgSend(v12, "ic_substringWithRange:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ic_leadingTrimmedString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "length");
        length = v17 - objc_msgSend(v16, "length");
        if (length)
          location = v13;

      }
    }
    -[ICTTTextStorage correctParagraphStyleReuseForRange:withNewAttributedString:](self, "correctParagraphStyleReuseForRange:withNewAttributedString:", location, length, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTTTextStorage preReplaceCharactersInRange:withStringLength:](self, "preReplaceCharactersInRange:withStringLength:", location, length, objc_msgSend(v18, "length"));
    v93 = objc_msgSend(v18, "copy");
    v19 = (void *)objc_msgSend(v18, "mutableCopy");
    v20 = (uint64_t *)MEMORY[0x1E0D63940];
    v21 = *MEMORY[0x1E0D63940];
    v22 = objc_msgSend(v19, "ic_range");
    objc_msgSend(v19, "removeAttribute:range:", v21, v22, v23);
    v24 = v19;

    v25 = -[ICTTTextStorage filterPastedAttributes](self, "filterPastedAttributes");
    if (-[ICTTTextStorage convertAttributes](self, "convertAttributes")
      || -[ICTTTextStorage isEditingViaWritingTools](self, "isEditingViaWritingTools"))
    {
      v26 = -[NSObject mutableCopy](v24, "mutableCopy");
      if (-[ICTTTextStorage shouldConvertTablesToTabs](self, "shouldConvertTablesToTabs"))
      {
        -[ICTTTextStorage convertNSTablesToTabs:](self, "convertNSTablesToTabs:", v26);
      }
      else
      {
        -[ICTTTextStorage styler](self, "styler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_opt_respondsToSelector();

        if ((v28 & 1) != 0)
        {
          -[ICTTTextStorage styler](self, "styler");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICTTTextStorage pasteboardTypes](self, "pasteboardTypes");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "convertNSTablesToICTables:pasteboardTypes:filterPastedAttributes:isReadingSelectionFromPasteboard:", v26, v30, v25, -[ICTTTextStorage isReadingSelectionFromPasteboard](self, "isReadingSelectionFromPasteboard"));

        }
      }
      v91 = (void *)objc_msgSend(v26, "mutableCopy");
      if (v25)
      {
        -[ICTTTextStorage styler](self, "styler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "guessFontSizeThresholdsForTTStylesInAttributedString:", v26);

      }
      v110[0] = 0;
      v110[1] = v110;
      v110[2] = 0x2020000000;
      v111 = 0;
      v32 = objc_msgSend(v26, "ic_range");
      v109[0] = MEMORY[0x1E0C809B0];
      v109[1] = 3221225472;
      v109[2] = __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke;
      v109[3] = &unk_1E5C1EF18;
      v109[4] = v110;
      objc_msgSend(v26, "enumerateAttributesInRange:options:usingBlock:", v32, v33, 0, v109);
      objc_opt_class();
      v34 = (uint64_t *)MEMORY[0x1E0D63928];
      -[ICTTTextStorage attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], location, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v107[0] = 0;
      v107[1] = v107;
      v107[2] = 0x2020000000;
      v108 = 0;
      v37 = *v34;
      v38 = -[NSObject ic_range](v24, "ic_range");
      v106[0] = MEMORY[0x1E0C809B0];
      v106[1] = 3221225472;
      v106[2] = __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke_2;
      v106[3] = &unk_1E5C1EEC8;
      v106[4] = v107;
      -[NSObject enumerateAttribute:inRange:options:usingBlock:](v24, "enumerateAttribute:inRange:options:usingBlock:", v37, v38, v39, 0, v106);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v40 = 0;
      else
        v40 = v24;
      v41 = objc_msgSend(v26, "ic_range");
      v43 = v42;
      v99[0] = MEMORY[0x1E0C809B0];
      v99[1] = 3221225472;
      v99[2] = __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke_3;
      v99[3] = &unk_1E5C1EF40;
      v99[4] = self;
      v105 = v25;
      v44 = v40;
      v100 = v44;
      v45 = v36;
      v101 = v45;
      v104 = v110;
      v46 = v91;
      v102 = v46;
      v47 = v26;
      v103 = v47;
      objc_msgSend(v47, "enumerateAttributesInRange:options:usingBlock:", v41, v43, 0, v99);
      -[ICTTTextStorage styler](self, "styler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "resetGuessedFontSizes");

      v7 = objc_msgSend(v47, "copy");
      v49 = objc_msgSend(v46, "copy");

      _Block_object_dispose(v107, 8);
      _Block_object_dispose(v110, 8);

      v50 = v49;
      v20 = (uint64_t *)MEMORY[0x1E0D63940];
    }
    else
    {
      v7 = v24;
      v50 = v93;
    }
    if (-[ICTTTextStorage wantsTimestampUpdates](self, "wantsTimestampUpdates"))
    {
      v51 = -[NSObject mutableCopy](v50, "mutableCopy");
      v52 = *v20;
      -[ICTTTextStorage currentTimestamp](self, "currentTimestamp");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v51, "ic_range");
      objc_msgSend(v51, "addAttribute:value:range:", v52, v53, v54, v55);

      v56 = objc_msgSend(v51, "copy");
      v50 = v56;
    }
    v92 = v24;
    v94 = v50;
    -[ICTTTextStorage document](self, "document");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "mergeableString");
    v58 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v58, "attributedString");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "attributedSubstringFromRange:", location, length);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTTTextStorage delegate](self, "delegate");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v58) = objc_opt_respondsToSelector();

    if ((v58 & 1) != 0)
    {
      -[ICTTTextStorage delegate](self, "delegate");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "textStorageWillChange:", self);

    }
    -[ICTTTextStorage setDirectlyEditing:](self, "setDirectlyEditing:", 1);
    objc_opt_class();
    -[ICTTTextStorage attributedString](self, "attributedString");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "replaceCharactersInRange:withAttributedString:", location, length, v7);

    v64 = objc_alloc(MEMORY[0x1E0CB3778]);
    -[NSObject string](v7, "string");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)objc_msgSend(v64, "initWithString:", v65);

    v67 = *MEMORY[0x1E0DC1140];
    v68 = -[NSObject ic_range](v7, "ic_range");
    v70 = v69;
    v71 = MEMORY[0x1E0C809B0];
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v89 = length;
    v97[2] = __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke_4;
    v97[3] = &unk_1E5C1E120;
    v72 = v66;
    v98 = v72;
    -[NSObject enumerateAttribute:inRange:options:usingBlock:](v7, "enumerateAttribute:inRange:options:usingBlock:", v67, v68, v70, 0, v97);
    v73 = *MEMORY[0x1E0D63908];
    v74 = -[NSObject ic_range](v7, "ic_range");
    v76 = v75;
    v95[0] = v71;
    v95[1] = 3221225472;
    v95[2] = __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke_5;
    v95[3] = &unk_1E5C1E120;
    v77 = v72;
    v96 = v77;
    -[NSObject enumerateAttribute:inRange:options:usingBlock:](v7, "enumerateAttribute:inRange:options:usingBlock:", v73, v74, v76, 0, v95);
    objc_opt_class();
    -[ICTTTextStorage highlightsAttributedString](self, "highlightsAttributedString");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)objc_msgSend(v77, "copy");
    objc_msgSend(v79, "replaceCharactersInRange:withAttributedString:", location, length, v80);

    -[ICTTTextStorage document](self, "document");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "mergeableString");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v94;
    objc_msgSend(v82, "replaceCharactersInRange:withAttributedString:", location, length, v94);

    -[ICTTTextStorage setDirectlyEditing:](self, "setDirectlyEditing:", 0);
    -[ICTTTextStorage delegate](self, "delegate");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_opt_respondsToSelector();

    if ((v84 & 1) != 0)
    {
      -[ICTTTextStorage delegate](self, "delegate");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "textStorage:didReplace:with:", self, v90, v7);

    }
    -[ICTTTextStorage delegate](self, "delegate", v89);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_opt_respondsToSelector();

    v10 = v92;
    if ((v87 & 1) != 0)
    {
      -[ICTTTextStorage delegate](self, "delegate");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "textStorageDidChange:", self);

    }
    -[ICTTTextStorage setHasEditedCharactersAfterTextSelection:](self, "setHasEditedCharactersAfterTextSelection:", 1);

  }
  else
  {
    v10 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v112.location = location;
      v112.length = length;
      -[ICTTTextStorage(UI) replaceCharactersInRange:withAttributedString:].cold.1(v112, self);
    }
    v11 = v10;
  }

}

void __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= v5 != 0;

  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D63958]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (objc_msgSend(v7, "count") | *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) != 0;

}

void __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  id v8;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isBlockQuote"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }

}

void __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "styler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelForStyleAttributes:filterAttributes:pasteboardAttributedString:", v8, *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (id)objc_msgSend(v10, "mutableCopy");
  if (*(_QWORD *)(a1 + 48) && *(_BYTE *)(a1 + 80) && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_opt_class();
    v11 = (_QWORD *)MEMORY[0x1E0D63928];
    objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    v15 = v14;
    if (v14)
      v16 = v14;
    else
      v16 = objc_alloc_init(MEMORY[0x1E0D63C90]);
    v17 = v16;

    objc_msgSend(v17, "setStyle:", objc_msgSend(*(id *)(a1 + 48), "style"));
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v18, *v11);

  }
  objc_msgSend(*(id *)(a1 + 56), "setAttributes:range:", v21, a3, a4);
  objc_msgSend(*(id *)(a1 + 32), "styler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "styleForModelAttributes:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 64), "setAttributes:range:", v20, a3, a4);
}

uint64_t __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke_4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", *MEMORY[0x1E0D63D50], a2, a3, a4);
  return result;
}

uint64_t __69__ICTTTextStorage_UI__replaceCharactersInRange_withAttributedString___block_invoke_5(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addAttribute:value:range:", *MEMORY[0x1E0D63908], a2, a3, a4);
  return result;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  NSRange v32;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  if (location + length <= -[ICTTTextStorage length](self, "length")
    && (-[ICTTTextStorage attributedString](self, "attributedString"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "length"),
        v8,
        location + length <= v9))
  {
    -[ICTTTextStorage preReplaceCharactersInRange:withStringLength:](self, "preReplaceCharactersInRange:withStringLength:", location, length, objc_msgSend(v7, "length"));
    -[ICTTTextStorage document](self, "document");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mergeableString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attributedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "attributedSubstringFromRange:", location, length);
    v10 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v7);
    -[ICTTTextStorage setDirectlyEditing:](self, "setDirectlyEditing:", 1);
    objc_opt_class();
    -[ICTTTextStorage attributedString](self, "attributedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "replaceCharactersInRange:withString:", location, length, v7);

    objc_opt_class();
    -[ICTTTextStorage highlightsAttributedString](self, "highlightsAttributedString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "replaceCharactersInRange:withString:", location, length, v7);

    -[ICTTTextStorage document](self, "document");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "mergeableString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "replaceCharactersInRange:withString:", location, length, v7);

    if (objc_msgSend(v7, "length") && -[ICTTTextStorage wantsTimestampUpdates](self, "wantsTimestampUpdates"))
    {
      -[ICTTTextStorage document](self, "document");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "mergeableString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "attributesAtIndex:effectiveRange:", location, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "mutableCopy");

      -[ICTTTextStorage currentTimestamp](self, "currentTimestamp");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D63940]);

      -[ICTTTextStorage document](self, "document");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "mergeableString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v24, "copy");
      objc_msgSend(v27, "setAttributes:range:", v28, location, objc_msgSend(v7, "length"));

    }
    -[ICTTTextStorage setDirectlyEditing:](self, "setDirectlyEditing:", 0);
    -[ICTTTextStorage delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_opt_respondsToSelector();

    if ((v30 & 1) != 0)
    {
      -[ICTTTextStorage delegate](self, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "textStorage:didReplace:with:", self, v10, v14);

    }
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v32.location = location;
      v32.length = length;
      -[ICTTTextStorage(UI) replaceCharactersInRange:withString:].cold.1(v32, self);
    }

  }
}

+ (id)standardizedAttributedStringFromAttributedString:(id)a3 withStyler:(id)a4 fixAttachments:(BOOL)a5 translateICTTFont:(BOOL)a6 context:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;

  v8 = a6;
  v9 = a5;
  v11 = a3;
  v12 = a7;
  v13 = a4;
  objc_opt_class();
  ICDynamicCast();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(v11, "mutableCopy");
  if (v14)
  {
    objc_msgSend(v14, "styleFontInAttributedString:inRange:contentSizeCategory:", v15, 0, objc_msgSend(v11, "length"), *MEMORY[0x1E0DC4918]);
    objc_msgSend(v14, "styleListsAndIndentsInAttributedString:inRange:", v15, 0, objc_msgSend(v15, "length"));
    v16 = (void *)objc_msgSend(v15, "copy");

    objc_msgSend(v14, "zoomController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "zoomFactor");
    if (v18 != 1.0)
    {
      objc_msgSend(v17, "unzoomAttributedString:", v16);
      v19 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v19;
    }

    v11 = v16;
  }
  LOBYTE(v25) = 1;
  +[ICTTTextStorage filteredAttributedSubstring:fromRange:forPlainText:forStandardizedText:fixAttachments:insertListMarkers:](ICTTTextStorage, "filteredAttributedSubstring:fromRange:forPlainText:forStandardizedText:fixAttachments:insertListMarkers:", v11, 0, objc_msgSend(v11, "length"), 0, 1, v9, v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICTTTextStorage removeTextAttachmentsForAttributedString:translateICTTFont:](ICTTTextStorage, "removeTextAttachmentsForAttributedString:translateICTTFont:", v21, v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICTTTextStorage removeDataDetectorLinksForAttributedString:](ICTTTextStorage, "removeDataDetectorLinksForAttributedString:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)standardizedAttributedStringFixingTextAttachmentsInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ICTTTextStorage attributedString](self, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextStorage standardizedAttributedStringFixingTextAttachmentsForRange:context:](self, "standardizedAttributedStringFixingTextAttachmentsForRange:context:", 0, objc_msgSend(v5, "length"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)standardizedAttributedStringFixingTextAttachmentsForRange:(_NSRange)a3 context:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[ICTTTextStorage styler](self, "styler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextStorage standardizedAttributedStringFixingTextAttachmentsForRange:styler:context:](self, "standardizedAttributedStringFixingTextAttachmentsForRange:styler:context:", location, length, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)standardizedAttributedStringFixingTextAttachmentsForRange:(_NSRange)a3 styler:(id)a4 context:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  length = a3.length;
  location = a3.location;
  v9 = a5;
  v10 = a4;
  -[ICTTTextStorage attributedString](self, "attributedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedSubstringFromRange:", location, length);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICTTTextStorage standardizedAttributedStringFromAttributedString:withStyler:fixAttachments:translateICTTFont:context:](ICTTTextStorage, "standardizedAttributedStringFromAttributedString:withStyler:fixAttachments:translateICTTFont:context:", v12, v10, 1, 1, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)dataFromRange:(_NSRange)a3 documentAttributes:(id)a4 error:(id *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  if (-[ICTTTextStorage filterSubstringAttributes](self, "filterSubstringAttributes"))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1120]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTTTextStorage filteredAttributedSubstringFromRange:insertListMarkers:](self, "filteredAttributedSubstringFromRange:insertListMarkers:", location, length, v10 != (void *)*MEMORY[0x1E0DC1148]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataFromRange:documentAttributes:error:", 0, objc_msgSend(v11, "length"), v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICTTTextStorage;
    -[ICTTTextStorage dataFromRange:documentAttributes:error:](&v14, sel_dataFromRange_documentAttributes_error_, location, length, v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)filteredAttributedSubstringFromRange:(_NSRange)a3 insertListMarkers:(BOOL)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  void *v9;
  uint64_t v11;

  length = a3.length;
  location = a3.location;
  -[ICTTTextStorage attributedString](self, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = a4;
  +[ICTTTextStorage filteredAttributedSubstring:fromRange:forPlainText:forStandardizedText:fixAttachments:insertListMarkers:](ICTTTextStorage, "filteredAttributedSubstring:fromRange:forPlainText:forStandardizedText:fixAttachments:insertListMarkers:", v8, location, length, -[ICTTTextStorage filterSubstringAttributesForPlainText](self, "filterSubstringAttributesForPlainText"), 0, 1, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)filteredAttributedSubstringFromRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  uint64_t v9;

  length = a3.length;
  location = a3.location;
  -[ICTTTextStorage attributedString](self, "attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 1;
  +[ICTTTextStorage filteredAttributedSubstring:fromRange:forPlainText:forStandardizedText:fixAttachments:insertListMarkers:](ICTTTextStorage, "filteredAttributedSubstring:fromRange:forPlainText:forStandardizedText:fixAttachments:insertListMarkers:", v6, location, length, -[ICTTTextStorage filterSubstringAttributesForPlainText](self, "filterSubstringAttributesForPlainText"), 0, 1, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)removeDataDetectorLinksForAttributedString:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  v4 = *MEMORY[0x1E0DC1160];
  v5 = objc_msgSend(v3, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__ICTTTextStorage_UI__removeDataDetectorLinksForAttributedString___block_invoke;
  v8[3] = &unk_1E5C1E120;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v6, "ic_enumerateClampedAttribute:inRange:options:usingBlock:", v4, 0, v5, 0x100000, v8);
  objc_msgSend(v6, "removeAttribute:range:", *MEMORY[0x1E0D1CC00], 0, objc_msgSend(v6, "length"));

  return v6;
}

void __66__ICTTTextStorage_UI__removeDataDetectorLinksForAttributedString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E0D1CC00], a3, 0, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E0DC1160], a3, a4);
    v8 = *MEMORY[0x1E0DC1140];
    if (!a3
      || (objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1140], a3 - 1, 0),
          (v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (id)v9;
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v8, v9, a3, a4);

  }
}

+ (id)removeTextAttachmentsForAttributedString:(id)a3 translateICTTFont:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a4;
  v5 = (void *)objc_msgSend(a3, "mutableCopy");
  v6 = *MEMORY[0x1E0DC10F8];
  v7 = objc_msgSend(v5, "length");
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__ICTTTextStorage_UI__removeTextAttachmentsForAttributedString_translateICTTFont___block_invoke;
  v15[3] = &unk_1E5C1EF88;
  v9 = v5;
  v16 = v9;
  objc_msgSend(v9, "ic_enumerateClampedAttribute:inRange:options:usingBlock:", v6, 0, v7, 0x100000, v15);
  if (v4)
  {
    v10 = *MEMORY[0x1E0D63910];
    v11 = objc_msgSend(v9, "length");
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __82__ICTTTextStorage_UI__removeTextAttachmentsForAttributedString_translateICTTFont___block_invoke_2;
    v13[3] = &unk_1E5C1EFB0;
    v14 = v9;
    objc_msgSend(v14, "ic_enumerateClampedAttribute:inRange:options:usingBlock:", v10, 0, v11, 0x100000, v13);

  }
  return v9;
}

void __82__ICTTTextStorage_UI__removeTextAttachmentsForAttributedString_translateICTTFont___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char isKindOfClass;

  v7 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E0DC10F8], a3, a4);
}

void __82__ICTTTextStorage_UI__removeTextAttachmentsForAttributedString_translateICTTFont___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v7 = a2;
  objc_opt_class();
  ICCheckedDynamicCast();
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E0D63910], a3, a4);
    v8 = *(void **)(a1 + 32);
    v9 = *MEMORY[0x1E0DC1138];
    objc_msgSend(v11, "nativeFontForStyle:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAttribute:value:range:", v9, v10, a3, a4);

  }
}

+ (void)fixAttachmentsForRenderingInAttributedString:(id)a3 forPlainText:(BOOL)a4 forStandardizedText:(BOOL)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;
  BOOL v14;

  v7 = a3;
  v8 = *MEMORY[0x1E0DC10F8];
  v9 = objc_msgSend(v7, "length");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __101__ICTTTextStorage_UI__fixAttachmentsForRenderingInAttributedString_forPlainText_forStandardizedText___block_invoke;
  v11[3] = &unk_1E5C1EFD8;
  v12 = v7;
  v13 = a4;
  v14 = a5;
  v10 = v7;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v9, 0, v11);

}

void __101__ICTTTextStorage_UI__fixAttachmentsForRenderingInAttributedString_forPlainText_forStandardizedText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "fixAttachmentForAttributedString:range:forPlainText:forStandardizedText:", *(_QWORD *)(a1 + 32), a3, a4, *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
  }

}

+ (id)filteredAttributedSubstring:(id)a3 fromRange:(_NSRange)a4 forPlainText:(BOOL)a5 forStandardizedText:(BOOL)a6 fixAttachments:(BOOL)a7 insertListMarkers:(BOOL)a8
{
  NSUInteger length;
  NSUInteger location;
  void *v10;
  id v11;
  const __CFString *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  double v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  _BOOL4 v66;
  _BOOL4 v67;
  id v68;
  const __CFString *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  _BOOL4 v74;
  uint64_t v75;
  _BOOL4 v76;
  void *v77;
  void *v78;
  _QWORD v79[4];
  id v80;
  uint64_t *v81;
  _QWORD v82[5];
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  _QWORD v91[4];
  _QWORD v92[4];
  _QWORD v93[4];
  _QWORD v94[6];

  v66 = a6;
  v67 = a7;
  v76 = a5;
  length = a4.length;
  location = a4.location;
  v94[4] = *MEMORY[0x1E0C80C00];
  v85 = 0;
  v86 = &v85;
  v87 = 0x3032000000;
  v88 = __Block_byref_object_copy__18;
  v89 = __Block_byref_object_dispose__18;
  v68 = a3;
  objc_msgSend(v68, "attributedSubstringFromRange:", location, length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (id)objc_msgSend(v10, "mutableCopy");

  v74 = +[ICTextController shouldRetainFirstListStyleForFilteredAttributedSubstring:fromRange:](ICTextController, "shouldRetainFirstListStyleForFilteredAttributedSubstring:fromRange:", v68, location, length);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v76)
  {
    v93[0] = &unk_1E5C71CE8;
    v93[1] = &unk_1E5C71D00;
    v94[0] = CFSTR("*");
    v94[1] = CFSTR("-");
    v93[2] = &unk_1E5C71D18;
    v93[3] = &unk_1E5C71D30;
    v94[2] = CFSTR("- [ ]");
    v94[3] = CFSTR("{decimal}.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 4);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("- [x]");
  }
  else
  {
    v91[0] = &unk_1E5C71CE8;
    v91[1] = &unk_1E5C71D00;
    v92[0] = CFSTR("{disc}");
    v92[1] = CFSTR("{hyphen}");
    v91[2] = &unk_1E5C71D18;
    v91[3] = &unk_1E5C71D30;
    v92[2] = CFSTR("{circle}");
    v92[3] = CFSTR("{decimal}.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 4);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("{check}");
  }
  v69 = v12;
  if (!filteredAttributedSubstring_fromRange_forPlainText_forStandardizedText_fixAttachments_insertListMarkers__NSTextListClass)
    filteredAttributedSubstring_fromRange_forPlainText_forStandardizedText_fixAttachments_insertListMarkers__NSTextListClass = (uint64_t)NSClassFromString(CFSTR("NSTextList"));
  v13 = 0;
  v75 = *MEMORY[0x1E0DC1138];
  v70 = *MEMORY[0x1E0DC1178];
  while (v13 < objc_msgSend((id)v86[5], "length"))
  {
    v83 = 0;
    v84 = 0;
    objc_msgSend((id)v86[5], "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E0D63928], v13, &v83, 0, objc_msgSend((id)v86[5], "length"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isList"))
    {
      while (1)
      {
        v15 = objc_msgSend(v14, "indent");
        if (v15 + 1 <= (unint64_t)objc_msgSend(v11, "count"))
          break;
        v16 = objc_alloc((Class)filteredAttributedSubstring_fromRange_forPlainText_forStandardizedText_fixAttachments_insertListMarkers__NSTextListClass);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v14, "style"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v16, "initWithMarkerFormat:options:", v18, 0);

        if (objc_msgSend(v14, "startingItemNumber"))
          objc_msgSend(v19, "setStartingItemNumber:", objc_msgSend(v14, "startingItemNumber"));
        objc_msgSend(v11, "addObject:", v19);

      }
      v20 = objc_msgSend(v14, "indent");
      if (v20 + 1 < (unint64_t)objc_msgSend(v11, "count"))
        objc_msgSend(v11, "removeObjectsInRange:", objc_msgSend(v14, "indent") + 1, objc_msgSend(v11, "count") + ~objc_msgSend(v14, "indent"));
      objc_msgSend(v11, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "todo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(v14, "todo");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = (void *)v69;
        if ((objc_msgSend(v71, "done") & 1) != 0)
          goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v14, "style"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "objectForKeyedSubscript:", v23);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
LABEL_19:

      objc_msgSend(v21, "markerFormat");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", v72);

      if ((v25 & 1) != 0)
      {
        v77 = v21;
      }
      else
      {
        v77 = (void *)objc_msgSend(objc_alloc((Class)filteredAttributedSubstring_fromRange_forPlainText_forStandardizedText_fixAttachments_insertListMarkers__NSTextListClass), "initWithMarkerFormat:options:", v72, 0);

        if (objc_msgSend(v14, "startingItemNumber"))
          objc_msgSend(v77, "setStartingItemNumber:", objc_msgSend(v14, "startingItemNumber"));
        objc_msgSend(v11, "replaceObjectAtIndex:withObject:", objc_msgSend(v11, "count") - 1, v77);
      }
      objc_msgSend(MEMORY[0x1E0DC1290], "ic_mutableDefaultParagraphStyle");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "tabStops");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "mutableCopy");

      v28 = objc_msgSend(v27, "count");
      if (v28)
      {
        for (i = 0; i != v28; ++i)
        {
          objc_msgSend(v27, "objectAtIndexedSubscript:", i);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_alloc(MEMORY[0x1E0DC1328]);
          v32 = objc_msgSend(v30, "alignment");
          v33 = objc_msgSend(v14, "indent");
          objc_msgSend(v30, "options");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (i)
            v35 = 0.0;
          else
            v35 = 11.0;
          v36 = (void *)objc_msgSend(v31, "initWithTextAlignment:location:options:", v32, v34, v35 + (double)(unint64_t)(i + v33) * 36.0);

          objc_msgSend(v27, "replaceObjectAtIndex:withObject:", i, v36);
        }
      }
      objc_msgSend(v73, "setTabStops:", v27);
      objc_msgSend(v73, "setTextLists:", v11);
      v38 = v83;
      v37 = v84;
      if (a8 && v83 < v84 + v83)
      {
        do
        {
          objc_msgSend((id)v86[5], "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63D40], v38, 0, v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "unsignedIntegerValue");

          v41 = (void *)MEMORY[0x1E0CB3940];
          if (v76)
          {
            objc_msgSend(&stru_1E5C2F8C0, "stringByPaddingToLength:withString:startingAtIndex:", 4 * objc_msgSend(v14, "indent"), CFSTR(" "), 0);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "markerForItemNumber:", v40);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "stringWithFormat:", CFSTR("%@%@ "), v42, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v77, "markerForItemNumber:", v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "stringWithFormat:", CFSTR("\t%@\t"), v42);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_msgSend((id)v86[5], "attribute:atIndex:effectiveRange:", v75, v38, 0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          +[ICTTTextStorage bulletTextAttributesWithTextFont:paragraphStyle:zoomFactor:](ICTTTextStorage, "bulletTextAttributesWithTextFont:paragraphStyle:zoomFactor:", v45, v14, 1.0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v44, v46);
          objc_msgSend((id)v86[5], "string");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "paragraphRangeForRange:", v38, 0);
          v38 = v50;

          v51 = v74;
          if (v49)
            v51 = 1;
          if (v51 == 1)
          {
            objc_msgSend((id)v86[5], "replaceCharactersInRange:withAttributedString:", v49, 0, v47);
            v52 = objc_msgSend(v44, "length");
            v84 += v52;
            v38 += v49 + objc_msgSend(v44, "length");
          }
          else
          {
            v53 = v83 - v38 + v84;
            v83 = v38;
            v84 = v53;
          }

          v37 = v84;
        }
        while (v38 < v84 + v83);
        v38 = v83;
      }
      objc_msgSend((id)v86[5], "addAttribute:value:range:", v70, v73, v38, v37);

    }
    else
    {
      objc_msgSend(v11, "removeAllObjects");
    }
    v54 = v83;
    v55 = v84;

    v13 = v55 + v54;
  }
  v56 = (void *)v86[5];
  v57 = *MEMORY[0x1E0D63920];
  v58 = objc_msgSend(v56, "length");
  v59 = MEMORY[0x1E0C809B0];
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __127__ICTTTextStorage_UI__filteredAttributedSubstring_fromRange_forPlainText_forStandardizedText_fixAttachments_insertListMarkers___block_invoke;
  v82[3] = &unk_1E5C1EEC8;
  v82[4] = &v85;
  objc_msgSend(v56, "enumerateAttribute:inRange:options:usingBlock:", v57, 0, v58, 0, v82);
  if (v67)
  {
    objc_msgSend(a1, "fixAttachmentsForRenderingInAttributedString:forPlainText:forStandardizedText:", v86[5], v76, v66);
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "workerManagedObjectContext");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v79[0] = v59;
    v79[1] = 3221225472;
    v79[2] = __127__ICTTTextStorage_UI__filteredAttributedSubstring_fromRange_forPlainText_forStandardizedText_fixAttachments_insertListMarkers___block_invoke_2;
    v79[3] = &unk_1E5C1D9D0;
    v81 = &v85;
    v62 = v61;
    v80 = v62;
    objc_msgSend(v62, "performBlockAndWait:", v79);

  }
  v63 = (id)v86[5];

  _Block_object_dispose(&v85, 8);
  return v63;
}

uint64_t __127__ICTTTextStorage_UI__filteredAttributedSubstring_fromRange_forPlainText_forStandardizedText_fixAttachments_insertListMarkers___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40), "removeAttribute:range:", *MEMORY[0x1E0DC1140], a3, a4);
  return result;
}

void __127__ICTTTextStorage_UI__filteredAttributedSubstring_fromRange_forPlainText_forStandardizedText_fixAttachments_insertListMarkers___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "ic_attributedStringByFlatteningInlineAttachmentsWithContext:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "mutableCopy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (_NSRange)safeCharacterRangeForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v5;
  NSUInteger v6;
  NSRange v7;
  NSUInteger v8;
  NSRange v9;
  NSRange v10;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v5 = -[ICTTTextStorage length](self, "length");
  if (v5 == location)
  {
    v6 = 0;
  }
  else
  {
    v7.length = v5;
    if (v5 >= location)
    {
      v10.location = location;
      v10.length = length;
      v7.location = 0;
      v9 = NSIntersectionRange(v10, v7);
      v6 = v9.length;
      v8 = v9.location;
      goto LABEL_7;
    }
    v6 = 0;
    location = 0x7FFFFFFFFFFFFFFFLL;
  }
  v8 = location;
LABEL_7:
  result.length = v6;
  result.location = v8;
  return result;
}

- (unint64_t)attributeOptions
{
  unint64_t v3;

  v3 = -[ICTTTextStorage convertAttributes](self, "convertAttributes");
  if (-[ICTTTextStorage filterPastedAttributes](self, "filterPastedAttributes"))
    return v3 | 2;
  else
    return v3;
}

- (void)setAttributeOptions:(unint64_t)a3
{
  -[ICTTTextStorage setConvertAttributes:](self, "setConvertAttributes:", a3 & 1);
  -[ICTTTextStorage setFilterPastedAttributes:](self, "setFilterPastedAttributes:", (a3 >> 1) & 1);
}

- (void)editWithAttributeOptions:(unint64_t)a3 usingBlock:(id)a4
{
  void (**v6)(_QWORD);
  unint64_t v7;

  v6 = (void (**)(_QWORD))a4;
  v7 = -[ICTTTextStorage attributeOptions](self, "attributeOptions");
  -[ICTTTextStorage beginEditing](self, "beginEditing");
  -[ICTTTextStorage setAttributeOptions:](self, "setAttributeOptions:", a3);
  v6[2](v6);

  -[ICTTTextStorage endEditing](self, "endEditing");
  -[ICTTTextStorage setAttributeOptions:](self, "setAttributeOptions:", v7);
}

- (id)itemProviderForRange:(_NSRange)a3 andNote:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  ICTTTextStorageWithRange *v8;
  void *v9;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = -[ICTTTextStorageWithRange initWithTextStorage:range:note:]([ICTTTextStorageWithRange alloc], "initWithTextStorage:range:note:", self, location, length, v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v8);
  -[ICTTTextStorageWithRange prepareTextStorage](v8, "prepareTextStorage");

  return v9;
}

- (NSUUID)replicaID
{
  void *v2;
  void *v3;

  -[ICTTTextStorage document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replicaID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)restoreAttributedString:(id)a3
{
  NSMutableAttributedString **p_attributedString;
  id v6;
  NSMutableAttributedString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  p_attributedString = &self->_attributedString;
  objc_storeStrong((id *)&self->_attributedString, a3);
  v6 = a3;
  v7 = *p_attributedString;
  v8 = *MEMORY[0x1E0D63940];
  v9 = -[NSMutableAttributedString ic_range](v7, "ic_range");
  -[NSMutableAttributedString removeAttribute:range:](v7, "removeAttribute:range:", v8, v9, v10);

  -[ICTTTextStorage resetHighlightsAttributedString](self, "resetHighlightsAttributedString");
}

- (void)editedRange:(_NSRange)a3 changeInLength:(int64_t)a4
{
  -[ICTTTextStorage edited:range:changeInLength:](self, "edited:range:changeInLength:", 2, a3.location, a3.length, a4);
}

- (void)editedAttributeRange:(_NSRange)a3
{
  -[ICTTTextStorage edited:range:changeInLength:](self, "edited:range:changeInLength:", 1, a3.location, a3.length, 0);
}

- (_NSRange)logicalRangeForLocation:(unint64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[ICTTTextStorage length](self, "length", a3);
  v4 = 0;
  result.length = v3;
  result.location = v4;
  return result;
}

- (ICTTTextUndoTarget)undoTarget
{
  void *v3;
  void *v4;
  ICTTTextUndoTarget *v5;

  -[ICTTTextStorage overrideUndoTarget](self, "overrideUndoTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  v5 = v3;

  return v5;
}

- (void)addUndoCommand:(id)a3
{
  id v4;

  v4 = a3;
  -[ICTTTextStorage beginEditing](self, "beginEditing");
  -[NSMutableArray addObject:](self->_undoCommands, "addObject:", v4);

  -[ICTTTextStorage endEditing](self, "endEditing");
}

- (void)applyUndoGroup:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__ICTTTextStorage_applyUndoGroup___block_invoke;
  v6[3] = &unk_1E5C1D9A8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICTTTextStorage applyUndoWithBlock:](self, "applyUndoWithBlock:", v6);

}

void __34__ICTTTextStorage_applyUndoGroup___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "mergeableString");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applyUndoCommand:", *(_QWORD *)(a1 + 40));

}

- (void)applyUndoWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[7];

  v4 = (void (**)(_QWORD))a3;
  -[ICTTTextStorage styler](self, "styler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[ICTTTextStorage styler](self, "styler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisableAddingExtraLinesIfNeeded:", 1);

  }
  -[ICTTTextStorage setIsApplyingUndoCommand:](self, "setIsApplyingUndoCommand:", 1);
  -[ICTTTextStorage breakUndoCoalescing](self, "breakUndoCoalescing");
  -[ICTTTextStorage beginEditing](self, "beginEditing");
  v4[2](v4);

  -[ICTTTextStorage endEditing](self, "endEditing");
  v8 = -[ICTTTextStorage ttEditedRange](self, "ttEditedRange");
  v10 = v9;
  -[ICTTTextStorage setPendingFixupAfterEditing:](self, "setPendingFixupAfterEditing:", 1);
  -[ICTTTextStorage fixupAfterEditing](self, "fixupAfterEditing");
  -[ICTTTextStorage breakUndoCoalescing](self, "breakUndoCoalescing");
  -[ICTTTextStorage textViews](self, "textViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __38__ICTTTextStorage_applyUndoWithBlock___block_invoke;
  v19[3] = &unk_1E5C207E0;
  v19[4] = self;
  v19[5] = v8;
  v19[6] = v10;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v19);

  -[ICTTTextStorage setIsApplyingUndoCommand:](self, "setIsApplyingUndoCommand:", 0);
  -[ICTTTextStorage delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "textStorageDidPerformUndo:", self);
  -[ICTTTextStorage styler](self, "styler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[ICTTTextStorage styler](self, "styler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDisableAddingExtraLinesIfNeeded:", 0);

  }
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0 && v8 + v10 <= -[ICTTTextStorage length](self, "length"))
  {
    v17 = *MEMORY[0x1E0DC10F8];
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __38__ICTTTextStorage_applyUndoWithBlock___block_invoke_2;
    v18[3] = &unk_1E5C1E120;
    v18[4] = self;
    -[ICTTTextStorage enumerateAttribute:inRange:options:usingBlock:](self, "enumerateAttribute:inRange:options:usingBlock:", v17, v8, v10, 0, v18);
  }

}

void __38__ICTTTextStorage_applyUndoWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isFirstResponder") & 1) == 0
    && objc_msgSend(v5, "canBecomeFirstResponder")
    && objc_msgSend(v5, "isEditable"))
  {
    objc_msgSend(v5, "becomeFirstResponder");
  }
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "styler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshTypingAttributesForTextView:textStorage:", v5, *(_QWORD *)(a1 + 32));

  objc_msgSend(v5, "setSelectedRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __38__ICTTTextStorage_applyUndoWithBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "layoutManagers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "invalidateLayoutForCharacterRange:actualCharacterRange:", a3, a4, 0);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)newCoalescingUndoGroup
{
  return objc_alloc_init(MEMORY[0x1E0D63C80]);
}

- (void)breakUndoCoalescing
{
  void *v3;

  if (!-[ICTTTextStorage disableUndoCoalesceBreaking](self, "disableUndoCoalesceBreaking"))
  {
    -[ICTTTextStorage coalescingUndoGroup](self, "coalescingUndoGroup");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "closeGroup");

    -[ICTTTextStorage setCoalescingUndoGroup:](self, "setCoalescingUndoGroup:", 0);
  }
}

- (void)resetUndoManager
{
  void *v3;
  void *v4;

  if (-[ICTTTextStorage disableUndoCoalesceBreaking](self, "disableUndoCoalesceBreaking"))
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.disableUndoCoalesceBreaking == __objc_no", "-[ICTTTextStorage resetUndoManager]", 1, 0, CFSTR("We shouldn't get here when disableUndoCoalesceBreaking == YES"));
  -[ICTTTextStorage undoManager](self, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllActions");

  -[ICTTTextStorage coalescingUndoGroup](self, "coalescingUndoGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closeGroup");

  -[ICTTTextStorage setCoalescingUndoGroup:](self, "setCoalescingUndoGroup:", 0);
  -[ICTTTextStorage setIsPerformingAccessibilityUndoableTextInsertion:](self, "setIsPerformingAccessibilityUndoableTextInsertion:", 0);
}

- (BOOL)mergeableStringIsEqualAfterSerialization:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  int v42;
  char v43;
  char v44;
  ICTTTextStorage *v46;
  char v47;
  void *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v4 = a3;
  -[ICTTTextStorage mergeableString](self, "mergeableString");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v44 = 1;
  }
  else
  {
    -[ICTTTextStorage mergeableString](self, "mergeableString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (v11)
    {
      v48 = v4;
      v46 = self;
      -[ICTTTextStorage mergeableString](self, "mergeableString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "attributedString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v13, "length");

      v14 = 0;
      v15 = 0;
      v16 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v17 = *MEMORY[0x1E0DC10F8];
      v47 = 1;
      v18 = (_QWORD *)MEMORY[0x1E0D63928];
      do
      {
        if (v16 >= v49)
          break;
        if (v16 >= v52 + v53)
        {
          -[ICTTTextStorage mergeableString](v46, "mergeableString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "attributedString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "attributesAtIndex:effectiveRange:", v16, &v52);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "mutableCopy");

          v15 = (void *)v22;
        }
        if (v16 >= v50 + v51)
        {
          objc_msgSend(v48, "attributedString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "attributesAtIndex:effectiveRange:", v16, &v50);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "mutableCopy");

          v14 = (void *)v25;
        }
        objc_msgSend(v15, "objectForKeyedSubscript:", *v18);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v26, "mutableCopy");

        objc_msgSend(v14, "objectForKeyedSubscript:", *v18);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v28, "mutableCopy");

        objc_msgSend(v27, "setNeedsParagraphCleanup:", 0);
        objc_msgSend(v27, "setNeedsListCleanup:", 0);
        objc_msgSend(v29, "setNeedsParagraphCleanup:", 0);
        objc_msgSend(v29, "setNeedsListCleanup:", 0);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "todo");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v32 = objc_alloc(MEMORY[0x1E0D63CC0]);
          objc_msgSend(v27, "todo");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)objc_msgSend(v32, "initWithIdentifier:done:", v30, objc_msgSend(v33, "done"));
          objc_msgSend(v27, "setTodo:", v34);

        }
        objc_msgSend(v29, "todo");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          v36 = objc_alloc(MEMORY[0x1E0D63CC0]);
          objc_msgSend(v29, "todo");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_msgSend(v36, "initWithIdentifier:done:", v30, objc_msgSend(v37, "done"));
          objc_msgSend(v29, "setTodo:", v38);

        }
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v27, *v18);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v29, *v18);
        v39 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
        objc_msgSend(v15, "objectForKeyedSubscript:", v17);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v39, v17);
        objc_msgSend(v14, "objectForKeyedSubscript:", v17);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v39, v17);
        v42 = objc_msgSend(v15, "isEqualToDictionary:", v14);
        v43 = v42;
        if (v42)
          v16 = v50 + v51 >= (unint64_t)(v52 + v53) ? v52 + v53 : v50 + v51;
        else
          v47 = 0;

      }
      while ((v43 & 1) != 0);

      v4 = v48;
      v44 = v47;
    }
    else
    {
      v44 = 0;
    }
  }

  return v44 & 1;
}

- (void)removeTextLayoutManager:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0D64298];
  v5 = a3;
  v7 = (id)objc_msgSend([v4 alloc], "initWithObject:", v5);

  -[ICTTTextStorage textLayoutManagerReferences](self, "textLayoutManagerReferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v7);

}

id __28__ICTTTextStorage_textViews__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "textContainers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_compactMap:", &__block_literal_global_113);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __28__ICTTTextStorage_textViews__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  objc_msgSend(v2, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)editAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[ICTTTextStorage mergeableString](self, "mergeableString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enumerateEditsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[ICTTTextStorage mergeableString](self, "mergeableString");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateEditsInRange:usingBlock:", location, length, v7);

}

- (void)redactAuthorAttributionsToCurrentUser
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  -[ICTTTextStorage setWantsUndoCommands:](self, "setWantsUndoCommands:", 0);
  v9 = (id)-[ICTTTextStorage mutableCopy](self, "mutableCopy");
  v3 = *MEMORY[0x1E0D63940];
  -[ICTTTextStorage currentTimestamp](self, "currentTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v9, "ic_range");
  objc_msgSend(v9, "addAttribute:value:range:", v3, v4, v5, v6);

  v7 = objc_msgSend(v9, "ic_range");
  -[ICTTTextStorage replaceCharactersInRange:withAttributedString:](self, "replaceCharactersInRange:withAttributedString:", v7, v8, v9);
  -[ICTTTextStorage setWantsUndoCommands:](self, "setWantsUndoCommands:", 1);

}

- (void)coordinateEditing:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!-[ICTTTextStorage isTypingOrMarkingText](self, "isTypingOrMarkingText")
    && !-[ICTTTextStorage isSelectingText](self, "isSelectingText")
    && !-[ICTTTextStorage isDropping](self, "isDropping"))
  {
    -[ICTTTextStorage forceFixupAfterEditingIfDelayed](self, "forceFixupAfterEditingIfDelayed");
  }
  v5.receiver = self;
  v5.super_class = (Class)ICTTTextStorage;
  -[ICTTTextStorage coordinateEditing:](&v5, sel_coordinateEditing_, v4);

}

- (unint64_t)mergeWithDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[ICTTTextStorage savedSelectionWithSelectionAffinity:](self, "savedSelectionWithSelectionAffinity:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextStorage document](self, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mergeWithStringVersionedDocument:", v4);

  -[ICTTTextStorage restoreSelection:](self, "restoreSelection:", v5);
  return v7;
}

- (void)replaceWithDocument:(id)a3
{
  ICTTMergeableStringVersionedDocument *v4;
  uint64_t v5;
  void *v6;
  ICTTMergeableStringVersionedDocument *document;
  ICTTMergeableStringVersionedDocument *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableAttributedString *v12;
  NSMutableAttributedString *attributedString;
  NSMutableAttributedString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v4 = (ICTTMergeableStringVersionedDocument *)a3;
  v5 = -[NSMutableAttributedString length](self->_attributedString, "length");
  -[ICTTMergeableStringVersionedDocument mergeableString](self->_document, "mergeableString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  document = self->_document;
  self->_document = v4;
  v8 = v4;

  -[ICTTMergeableStringVersionedDocument mergeableString](self->_document, "mergeableString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[ICTTMergeableStringVersionedDocument mergeableString](self->_document, "mergeableString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (NSMutableAttributedString *)objc_msgSend(v11, "mutableCopy");
  attributedString = self->_attributedString;
  self->_attributedString = v12;

  v14 = self->_attributedString;
  v15 = *MEMORY[0x1E0D63940];
  v16 = -[NSMutableAttributedString ic_range](v14, "ic_range");
  -[NSMutableAttributedString removeAttribute:range:](v14, "removeAttribute:range:", v15, v16, v17);
  -[ICTTTextStorage resetHighlightsAttributedString](self, "resetHighlightsAttributedString");
  v18 = -[NSMutableAttributedString length](self->_attributedString, "length");
  v19.receiver = self;
  v19.super_class = (Class)ICTTTextStorage;
  -[ICTTTextStorage edited:range:changeInLength:](&v19, sel_edited_range_changeInLength_, 3, 0, v5, v18 - v5);

}

- (void)setAttributedString:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICTTTextStorage setAttributedString:]", 1, 0, CFSTR("Cannot set attributed string directly"));
}

- (id)correctParagraphStyleReuseForRange:(_NSRange)a3 withNewAttributedString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = !-[ICTTTextStorage hasEditedCharactersAfterTextSelection](self, "hasEditedCharactersAfterTextSelection")
    && -[ICTTTextStorage isTypingOrMarkingText](self, "isTypingOrMarkingText");
  -[ICTTTextStorage string](self, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "paragraphRangeForRange:", location, length);
  v12 = v11;

  v13 = v10 + v12;
  if (v10 + v12)
    v14 = v8;
  else
    v14 = 0;
  if (v12 && v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTTTextStorage string](self, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "characterIsMember:", objc_msgSend(v16, "characterAtIndex:", v13 - 1));

    if (!v17 || v12 != 1)
      return v7;
  }
  else if (!v14)
  {
    return v7;
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__35;
  v28 = __Block_byref_object_dispose__35;
  v29 = 0;
  -[ICTTTextStorage textViews](self, "textViews");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __78__ICTTTextStorage_correctParagraphStyleReuseForRange_withNewAttributedString___block_invoke;
  v23[3] = &unk_1E5C20928;
  v23[4] = &v24;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v23);

  if (v25[5])
  {
    v19 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v7, "string");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "initWithString:attributes:", v20, v25[5]);

    v7 = (id)v21;
  }
  _Block_object_dispose(&v24, 8);

  return v7;
}

void __78__ICTTTextStorage_correctParagraphStyleReuseForRange_withNewAttributedString___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;

  objc_msgSend(a2, "typingAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v5);
    v5 = v6;
    *a3 = 1;
  }

}

- (BOOL)_shouldSetOriginalFontAttribute
{
  return 1;
}

id __74__ICTTTextStorage_dd_makeLinksForResultsInAttributesOfType_context_range___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)ICTTTextStorage;
  return objc_msgSendSuper2(&v7, sel_dd_makeLinksForResultsInAttributesOfType_context_range_, v4, v5, a2, a3);
}

- (void)dd_resetResults
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;
  _QWORD v10[5];

  -[ICTTTextStorage beginTemporaryAttributes](self, "beginTemporaryAttributes");
  v3 = *MEMORY[0x1E0D1CC00];
  v4 = -[ICTTTextStorage length](self, "length");
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__ICTTTextStorage_dd_resetResults__block_invoke;
  v10[3] = &unk_1E5C1E120;
  v10[4] = self;
  -[ICTTTextStorage enumerateAttribute:inRange:options:usingBlock:](self, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v4, 0, v10);
  v9.receiver = self;
  v9.super_class = (Class)ICTTTextStorage;
  -[ICTTTextStorage dd_resetResults](&v9, sel_dd_resetResults);
  v6 = *MEMORY[0x1E0DC1140];
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __34__ICTTTextStorage_dd_resetResults__block_invoke_2;
  v8[3] = &unk_1E5C1DF70;
  v8[4] = self;
  -[ICTTTextStorage enumerateAttribute:inRange:options:usingBlock:](self, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, -[ICTTTextStorage length](self, "length"), 0, v8);
  -[ICTTTextStorage endTemporaryAttributes](self, "endTemporaryAttributes");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICTTTextStorageDidUpdateDataDetectionResultsNotification"), self);

}

uint64_t __34__ICTTTextStorage_dd_resetResults__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  if (a2)
  {
    v6 = result;
    v7 = *(void **)(result + 32);
    v8 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAttribute:value:range:", v8, v9, a3, a4);

    v10 = *(void **)(v6 + 32);
    v11 = *MEMORY[0x1E0D63D50];
    objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAttribute:value:range:", v11, v12, a3, a4);

    return objc_msgSend(*(id *)(v6 + 32), "removeAttribute:range:", *MEMORY[0x1E0DC1240], a3, a4);
  }
  return result;
}

void __34__ICTTTextStorage_dd_resetResults__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  if (!a2)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAttribute:value:range:", v8, v9, a3, a4);

    v10 = *(void **)(a1 + 32);
    v11 = *MEMORY[0x1E0D63D50];
    objc_msgSend(MEMORY[0x1E0DC3658], "preferredDefaultFontColor");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAttribute:value:range:", v11, v12, a3, a4);

  }
}

- (void)removeAttribute:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  objc_super v8;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D63DB0]))
  {
    if (-[ICTTTextStorage ic_containsAttribute:inRange:](self, "ic_containsAttribute:inRange:", v7, location, length))
    {
      -[ICTTTextStorage beginTemporaryAttributes](self, "beginTemporaryAttributes");
      v8.receiver = self;
      v8.super_class = (Class)ICTTTextStorage;
      -[ICTTTextStorage removeAttribute:range:](&v8, sel_removeAttribute_range_, v7, location, length);
      -[ICTTTextStorage endTemporaryAttributes](self, "endTemporaryAttributes");
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICTTTextStorage;
    -[ICTTTextStorage removeAttribute:range:](&v8, sel_removeAttribute_range_, v7, location, length);
  }

}

void __39__ICTTTextStorage_setAttributes_range___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  v11 = (id)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D63940]);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "mergeableString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v9, "setAttributes:range:", v10, a3, a4);

}

void __39__ICTTTextStorage_setAttributes_range___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  BOOL v17;
  char v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  BOOL v32;
  char v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  char v38;
  void *v39;
  id v40;

  v40 = a2;
  objc_opt_class();
  v7 = (uint64_t *)MEMORY[0x1E0D63D50];
  objc_msgSend(v40, "objectForKeyedSubscript:", *MEMORY[0x1E0D63D50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 32);
  v11 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((void *)*MEMORY[0x1E0C9B0D0] == v9)
    v12 = 0;
  else
    v12 = v9;
  v13 = v12;
  if (v11 == v10)
    v14 = 0;
  else
    v14 = v10;
  v15 = v14;
  if (!(v13 | v15))
    goto LABEL_15;
  v16 = (void *)v15;
  if (v13)
    v17 = v15 == 0;
  else
    v17 = 1;
  if (v17)
  {

  }
  else
  {
    v18 = objc_msgSend((id)v13, "isEqual:", v15);

    if ((v18 & 1) != 0)
    {
LABEL_15:
      v19 = 0;
      goto LABEL_20;
    }
  }
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(*(_QWORD *)(a1 + 40) + 104);
  v22 = *v7;
  if (v20)
    objc_msgSend(v21, "addAttribute:value:range:", v22, v20, a3, a4);
  else
    objc_msgSend(v21, "removeAttribute:range:", v22, a3, a4);
  v19 = 1;
LABEL_20:
  objc_opt_class();
  v23 = (uint64_t *)MEMORY[0x1E0D63908];
  objc_msgSend(v40, "objectForKeyedSubscript:", *MEMORY[0x1E0D63908]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = *(void **)(a1 + 48);
  if (v11 == v25)
    v27 = 0;
  else
    v27 = v25;
  v28 = v27;
  if (v11 == v26)
    v29 = 0;
  else
    v29 = v26;
  v30 = v29;
  if (!(v28 | v30))
  {
    if ((v19 & 1) == 0)
      goto LABEL_43;
    goto LABEL_41;
  }
  v31 = (void *)v30;
  if (v28)
    v32 = v30 == 0;
  else
    v32 = 1;
  if (v32)
  {

  }
  else
  {
    v33 = objc_msgSend((id)v28, "isEqual:", v30);

    if ((v33 & 1) != 0)
    {
      if (!v19)
        goto LABEL_43;
      goto LABEL_41;
    }
  }
  v34 = *(_QWORD *)(a1 + 48);
  v35 = *(void **)(*(_QWORD *)(a1 + 40) + 104);
  v36 = *v23;
  if (v34)
    objc_msgSend(v35, "addAttribute:value:range:", v36, v34, a3, a4);
  else
    objc_msgSend(v35, "removeAttribute:range:", v36, a3, a4);
LABEL_41:
  objc_msgSend(*(id *)(a1 + 40), "styler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_opt_respondsToSelector();

  if ((v38 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "styler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "updateHighlightsInRange:inTextStorage:", a3, a4, *(_QWORD *)(a1 + 40));

  }
LABEL_43:

}

- (BOOL)isEditing
{
  return -[ICTTTextStorage editingCount](self, "editingCount") != 0;
}

- (BOOL)hasNamedStyle:(unsigned int)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  int v9;
  uint64_t v10;
  char v11;
  _QWORD v13[5];
  unsigned int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  length = a4.length;
  location = a4.location;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[ICTTTextStorage string](self, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ic_rangeIsValid:", location, length);

  if (v9)
  {
    v10 = *MEMORY[0x1E0D63928];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __41__ICTTTextStorage_hasNamedStyle_inRange___block_invoke;
    v13[3] = &unk_1E5C209E8;
    v14 = a3;
    v13[4] = &v15;
    -[ICTTTextStorage enumerateAttribute:inRange:options:usingBlock:](self, "enumerateAttribute:inRange:options:usingBlock:", v10, location, length, 0, v13);
  }
  v11 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v11;
}

void __41__ICTTTextStorage_hasNamedStyle_inRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  id v8;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "style") == *(_DWORD *)(a1 + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }

}

- (BOOL)isRightToLeftAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;
  char v5;

  -[ICTTTextStorage attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63928], a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRTL");

  return v5;
}

uint64_t __50__ICTTTextStorage_resetHighlightsAttributedString__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 104), "addAttribute:value:range:", *MEMORY[0x1E0D63D50], a2, a3, a4);
  return result;
}

uint64_t __50__ICTTTextStorage_resetHighlightsAttributedString__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 104), "addAttribute:value:range:", *MEMORY[0x1E0D63908], a2, a3, a4);
  return result;
}

- (BOOL)wantsTimestampUpdates
{
  _BOOL4 v3;

  v3 = -[ICTTTextStorage wantsUndoCommands](self, "wantsUndoCommands");
  if (v3)
  {
    if (-[ICTTTextStorage isSkippingTimestampUpdates](self, "isSkippingTimestampUpdates")
      || -[ICTTTextStorage isEditingTemporaryAttributes](self, "isEditingTemporaryAttributes")
      || -[ICTTTextStorage disableUndoCoalesceBreaking](self, "disableUndoCoalesceBreaking"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = !-[ICTTTextStorage isFixing](self, "isFixing");
    }
  }
  return v3;
}

- (BOOL)isSkippingTimestampUpdates
{
  return -[ICTTTextStorage skipTimestampUpdatesCount](self, "skipTimestampUpdatesCount") > 0;
}

- (NSNumber)currentTimestamp
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICTTTextStorage now](self, "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "ic_truncated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v8;
}

- (void)setTimestamp:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSRange v7;
  void *v8;
  id v9;
  NSRange v10;
  NSRange v11;

  length = a4.length;
  location = a4.location;
  objc_msgSend(a3, "ic_truncated");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10.location = -[NSMutableAttributedString ic_range](self->_attributedString, "ic_range");
  v11.location = location;
  v11.length = length;
  v7 = NSIntersectionRange(v10, v11);
  if (v7.length)
  {
    self->_directlyEditing = 1;
    -[ICTTTextStorage beginSkippingTimestampUpdates](self, "beginSkippingTimestampUpdates");
    -[ICTTTextStorage beginEditing](self, "beginEditing");
    -[ICTTMergeableStringVersionedDocument mergeableString](self->_document, "mergeableString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimestamp:range:", v9, v7.location, v7.length);

    -[ICTTTextStorage edited:range:changeInLength:](self, "edited:range:changeInLength:", 1, v7.location, v7.length, 0);
    -[ICTTTextStorage endEditing](self, "endEditing");
    -[ICTTTextStorage endSkippingTimestampUpdates](self, "endSkippingTimestampUpdates");
    self->_directlyEditing = 0;
  }

}

- (ICOutlineController)outlineController
{
  return (ICOutlineController *)objc_loadWeakRetained((id *)&self->_outlineController);
}

- (void)setOutlineController:(id)a3
{
  objc_storeWeak((id *)&self->_outlineController, a3);
}

- (void)setUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_undoManager, a3);
}

- (ICTTTextUndoTarget)overrideUndoTarget
{
  return (ICTTTextUndoTarget *)objc_loadWeakRetained((id *)&self->_overrideUndoTarget);
}

- (void)setOverrideUndoTarget:(id)a3
{
  objc_storeWeak((id *)&self->_overrideUndoTarget, a3);
}

- (BOOL)shouldInhibitAddingExtraNewlinesAtEndDuringFixup
{
  return self->_shouldInhibitAddingExtraNewlinesAtEndDuringFixup;
}

- (void)setShouldInhibitAddingExtraNewlinesAtEndDuringFixup:(BOOL)a3
{
  self->_shouldInhibitAddingExtraNewlinesAtEndDuringFixup = a3;
}

- (BOOL)alwaysEnumerateTrailingParagraph
{
  return self->_alwaysEnumerateTrailingParagraph;
}

- (void)setAlwaysEnumerateTrailingParagraph:(BOOL)a3
{
  self->_alwaysEnumerateTrailingParagraph = a3;
}

- (NSMutableArray)deletedRanges
{
  return self->_deletedRanges;
}

- (BOOL)convertAttributes
{
  return self->_convertAttributes;
}

- (void)setConvertAttributes:(BOOL)a3
{
  self->_convertAttributes = a3;
}

- (BOOL)shouldConvertTablesToTabs
{
  return self->_shouldConvertTablesToTabs;
}

- (void)setShouldConvertTablesToTabs:(BOOL)a3
{
  self->_shouldConvertTablesToTabs = a3;
}

- (NSArray)pasteboardTypes
{
  return self->_pasteboardTypes;
}

- (void)setPasteboardTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (BOOL)retainOriginalFormatting
{
  return self->_retainOriginalFormatting;
}

- (void)setRetainOriginalFormatting:(BOOL)a3
{
  self->_retainOriginalFormatting = a3;
}

- (void)setFilterSubstringAttributes:(BOOL)a3
{
  self->_filterSubstringAttributes = a3;
}

- (BOOL)filterPastedAttributes
{
  return self->_filterPastedAttributes;
}

- (void)setFilterPastedAttributes:(BOOL)a3
{
  self->_filterPastedAttributes = a3;
}

- (BOOL)filterSubstringAttributesForPlainText
{
  return self->_filterSubstringAttributesForPlainText;
}

- (void)setFilterSubstringAttributesForPlainText:(BOOL)a3
{
  self->_filterSubstringAttributesForPlainText = a3;
}

- (void)setIsEditingTemporaryAttributes:(BOOL)a3
{
  self->_isEditingTemporaryAttributes = a3;
}

- (BOOL)disableUndoCoalesceBreaking
{
  return self->_disableUndoCoalesceBreaking;
}

- (BOOL)isPausingUndoActions
{
  return self->_isPausingUndoActions;
}

- (void)setIsPausingUndoActions:(BOOL)a3
{
  self->_isPausingUndoActions = a3;
}

- (BOOL)isPerformingAccessibilityUndoableTextInsertion
{
  return self->_isPerformingAccessibilityUndoableTextInsertion;
}

- (void)setIsPerformingAccessibilityUndoableTextInsertion:(BOOL)a3
{
  self->_isPerformingAccessibilityUndoableTextInsertion = a3;
}

- (BOOL)isHandlingTextCheckingResults
{
  return self->_isHandlingTextCheckingResults;
}

- (void)setIsHandlingTextCheckingResults:(BOOL)a3
{
  self->_isHandlingTextCheckingResults = a3;
}

- (void)setIsTypingOrMarkingText:(BOOL)a3
{
  self->_isTypingOrMarkingText = a3;
}

- (void)setIsSelectingText:(BOOL)a3
{
  self->_isSelectingText = a3;
}

- (BOOL)hasEditedCharactersAfterTextSelection
{
  return self->_hasEditedCharactersAfterTextSelection;
}

- (void)setHasEditedCharactersAfterTextSelection:(BOOL)a3
{
  self->_hasEditedCharactersAfterTextSelection = a3;
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (void)setIsDragging:(BOOL)a3
{
  self->_isDragging = a3;
}

- (void)setIsDropping:(BOOL)a3
{
  self->_isDropping = a3;
}

- (void)setIsResettingBaseWritingDirection:(BOOL)a3
{
  self->_isResettingBaseWritingDirection = a3;
}

- (BOOL)isReadingSelectionFromPasteboard
{
  return self->_isReadingSelectionFromPasteboard;
}

- (void)setIsReadingSelectionFromPasteboard:(BOOL)a3
{
  self->_isReadingSelectionFromPasteboard = a3;
}

- (BOOL)isEditingViaWritingTools
{
  return self->_isEditingViaWritingTools;
}

- (void)setIsEditingViaWritingTools:(BOOL)a3
{
  self->_isEditingViaWritingTools = a3;
}

- (BOOL)isMarkingTextForHeadingRename
{
  return self->_isMarkingTextForHeadingRename;
}

- (void)setIsMarkingTextForHeadingRename:(BOOL)a3
{
  self->_isMarkingTextForHeadingRename = a3;
}

- (BOOL)shouldRemoveLeadingWhitespaceForChecklistDrop
{
  return self->_shouldRemoveLeadingWhitespaceForChecklistDrop;
}

- (void)setShouldRemoveLeadingWhitespaceForChecklistDrop:(BOOL)a3
{
  self->_shouldRemoveLeadingWhitespaceForChecklistDrop = a3;
}

- (void)setIsApplyingUndoCommand:(BOOL)a3
{
  self->_isApplyingUndoCommand = a3;
}

- (void)setUndoCommands:(id)a3
{
  objc_storeStrong((id *)&self->_undoCommands, a3);
}

- (ICTTMergeableStringUndoGroup)coalescingUndoGroup
{
  return self->_coalescingUndoGroup;
}

- (void)setCoalescingUndoGroup:(id)a3
{
  objc_storeStrong((id *)&self->_coalescingUndoGroup, a3);
}

- (void)setTtEditedRange:(_NSRange)a3
{
  self->_ttEditedRange = a3;
}

- (void)setTtChangeInLength:(int64_t)a3
{
  self->_ttChangeInLength = a3;
}

- (void)setTextLayoutManagerReferences:(id)a3
{
  objc_storeStrong((id *)&self->_textLayoutManagerReferences, a3);
}

- (NSDate)now
{
  return self->_now;
}

- (void)setNow:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setDirectlyEditing:(BOOL)a3
{
  self->_directlyEditing = a3;
}

- (BOOL)previouslyHadMarkedText
{
  return self->_previouslyHadMarkedText;
}

- (void)setPreviouslyHadMarkedText:(BOOL)a3
{
  self->_previouslyHadMarkedText = a3;
}

- (_NSRange)lastUndoEditRange
{
  _NSRange *p_lastUndoEditRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_lastUndoEditRange = &self->_lastUndoEditRange;
  location = self->_lastUndoEditRange.location;
  length = p_lastUndoEditRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setLastUndoEditRange:(_NSRange)a3
{
  self->_lastUndoEditRange = a3;
}

- (void)setCurrentTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (id)customPasteboardDataFromRange:(_NSRange)a3 persistenceHelper:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  -[ICTTTextStorage attributedString](self, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributedSubstringFromRange:", location, length);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICTextController removeBeginningListStyleIfNecessaryForAttributedString:fromTextStorage:andRange:](ICTextController, "removeBeginningListStyleIfNecessaryForAttributedString:fromTextStorage:andRange:", v9, self, location, length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "ic_attributedStringByRefreshingParagraphStyleUUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v12 = objc_alloc(MEMORY[0x1E0D63AC8]);
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithObjectIdentifier:forPasteboard:", v13, 1);

  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v7, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ic_serializeWithFlags:dataPersister:managedObjectContext:error:", 1, v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63BD8]), "initWithAttributedStringData:dataPersister:", v16, v14);
  else
    v17 = 0;

  return v17;
}

- (id)copyDataForUTI:(id)a3 range:(_NSRange)a4 persistenceHelper:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __CFString **v16;
  uint64_t *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __CFString *v39;
  uint64_t v40;
  _QWORD v41[2];

  length = a4.length;
  location = a4.location;
  v41[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D637F0]))
  {
    -[ICTTTextStorage setFilterSubstringAttributes:](self, "setFilterSubstringAttributes:", 1);
    objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "isEqualToString:", v13);

    if (v14)
    {
      v40 = *MEMORY[0x1E0DC1120];
      v41[0] = *MEMORY[0x1E0DC1148];
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = (__CFString **)v41;
      v17 = &v40;
    }
    else
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC658], "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v9, "isEqualToString:", v18);

      if (v19)
      {
        v38 = *MEMORY[0x1E0DC1120];
        v39 = ICWebArchiveTextDocumentType;
        v15 = (void *)MEMORY[0x1E0C99D80];
        v16 = &v39;
        v17 = &v38;
      }
      else
      {
        objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v9, "isEqualToString:", v20);

        if (v21)
        {
          v36 = *MEMORY[0x1E0DC1120];
          v37 = *MEMORY[0x1E0DC1190];
          v15 = (void *)MEMORY[0x1E0C99D80];
          v16 = (__CFString **)&v37;
          v17 = &v36;
        }
        else
        {
          objc_msgSend((id)*MEMORY[0x1E0CEC4E8], "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v9, "isEqualToString:", v22);

          if (!v23)
          {
            objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v9, "isEqualToString:", v26);

            if (v27)
            {
              -[ICTTTextStorage setFilterSubstringAttributesForPlainText:](self, "setFilterSubstringAttributesForPlainText:", 1);
              v28 = *MEMORY[0x1E0DC1180];
              v29 = *MEMORY[0x1E0DC1110];
              v32[0] = *MEMORY[0x1E0DC1120];
              v32[1] = v29;
              v33[0] = v28;
              v33[1] = &unk_1E5C720C0;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICTTTextStorage dataFromRange:documentAttributes:error:](self, "dataFromRange:documentAttributes:error:", location, length, v30, 0);
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              -[ICTTTextStorage setFilterSubstringAttributesForPlainText:](self, "setFilterSubstringAttributesForPlainText:", 0);
            }
            else
            {
              -[ICTTTextStorage filteredAttributedSubstringFromRange:](self, "filteredAttributedSubstringFromRange:", location, length);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "ic_itemProviderDataForUTI:", v9);
              v12 = (void *)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_12;
          }
          v34 = *MEMORY[0x1E0DC1120];
          v35 = *MEMORY[0x1E0DC1188];
          v15 = (void *)MEMORY[0x1E0C99D80];
          v16 = (__CFString **)&v35;
          v17 = &v34;
        }
      }
    }
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTTTextStorage dataFromRange:documentAttributes:error:](self, "dataFromRange:documentAttributes:error:", location, length, v24, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
    -[ICTTTextStorage setFilterSubstringAttributes:](self, "setFilterSubstringAttributes:", 0);
    goto LABEL_13;
  }
  -[ICTTTextStorage customPasteboardDataFromRange:persistenceHelper:](self, "customPasteboardDataFromRange:persistenceHelper:", location, length, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "persistenceData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v12;
}

- (id)filteredAttributedStringForUTI:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  length = a4.length;
  location = a4.location;
  v7 = (void *)*MEMORY[0x1E0CEC630];
  v8 = a3;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  -[ICTTTextStorage setFilterSubstringAttributesForPlainText:](self, "setFilterSubstringAttributesForPlainText:", v10);
  -[ICTTTextStorage filteredAttributedSubstringFromRange:](self, "filteredAttributedSubstringFromRange:", location, length);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextStorage setFilterSubstringAttributesForPlainText:](self, "setFilterSubstringAttributesForPlainText:", 0);
  return v11;
}

void __36__ICTTTextStorage_restoreSelection___block_invoke_cold_1(uint8_t *a1, NSRange range, _QWORD *a3, NSObject *a4)
{
  void *v7;

  NSStringFromRange(range);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1AC7A1000, a4, OS_LOG_TYPE_ERROR, "corrected selRange: %@", a1, 0xCu);

}

void __36__ICTTTextStorage_restoreSelection___block_invoke_cold_2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_7(&dword_1AC7A1000, a3, (uint64_t)a3, "ICTTTextStorage selection restoration error: selRange out of bounds of ICTTTextStorage. Clipping to the length of ICTTTextStorage", a1);
}

void __44__ICTTTextStorage_addAttribute_value_range___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_7(&dword_1AC7A1000, a1, a3, "Unable to lazy load DataDetectorsUI framework", v3);
}

@end
