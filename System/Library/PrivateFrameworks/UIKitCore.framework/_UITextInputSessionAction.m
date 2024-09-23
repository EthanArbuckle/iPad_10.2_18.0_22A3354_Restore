@implementation _UITextInputSessionAction

- (int64_t)source
{
  return self->_source;
}

- (_UITextInputSessionInsertionAction)asInsertion
{
  _UITextInputSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UITextInputSessionInsertionAction *)v3;
}

- (_UITextInputSessionSelectionAction)asSelection
{
  _UITextInputSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UITextInputSessionSelectionAction *)v3;
}

- (_UITextInputSessionDictationBeganAction)asDictationBegan
{
  _UITextInputSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UITextInputSessionDictationBeganAction *)v3;
}

- (_UITextInputSessionReplaceWithCandidateAction)asReplaceWithCandidate
{
  _UITextInputSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UITextInputSessionReplaceWithCandidateAction *)v3;
}

- (_UITextInputSessionUndoAction)asUndo
{
  _UITextInputSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UITextInputSessionUndoAction *)v3;
}

- (_UITextInputSessionRedoAction)asRedo
{
  _UITextInputSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UITextInputSessionRedoAction *)v3;
}

- (_UITextInputSessionDeletionAction)asDeletion
{
  _UITextInputSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UITextInputSessionDeletionAction *)v3;
}

- (_UITextInputSessionReplaceTextAction)asReplaceText
{
  _UITextInputSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UITextInputSessionReplaceTextAction *)v3;
}

- (int64_t)mergeActionIfPossible:(id)a3
{
  return 0;
}

- (_UITextInputSessionBeganAction)asBegan
{
  _UITextInputSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UITextInputSessionBeganAction *)v3;
}

- (void)setTextInputActionsType:(int64_t)a3
{
  self->_textInputActionsType = a3;
}

- (void)setSource:(int64_t)a3
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (self->_source != a3)
    self->_source = a3;
  v4 = a3 - 1;
  v5 = 2;
  v6 = 1;
  v7 = 4;
  switch(v4)
  {
    case 0:
      goto LABEL_7;
    case 1:
      goto LABEL_10;
    case 2:
      v6 = 6;
      goto LABEL_10;
    case 3:
      v7 = 3;
LABEL_7:
      v5 = 1;
      break;
    case 4:
      v6 = 5;
      goto LABEL_10;
    case 5:
      break;
    case 6:
      v6 = 2;
LABEL_10:
      v5 = 5;
      v7 = v6;
      break;
    case 7:
      v5 = 16;
      v7 = 4;
      break;
    default:
      v7 = 0;
      v5 = 0;
      break;
  }
  -[_UITextInputSessionAction setTextInputActionsSource:](self, "setTextInputActionsSource:", v7);
  -[_UITextInputSessionAction setTextInputActionsType:](self, "setTextInputActionsType:", v5);
}

- (void)setTextInputActionsSource:(int64_t)a3
{
  self->_textInputActionsSource = a3;
}

- (void)setAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setKeyboardVariant:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setKeyboardLayout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (_UITextInputSessionKeyboardDockItemButtonPressAction)asKeyboardDockItemButtonPress
{
  _UITextInputSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UITextInputSessionKeyboardDockItemButtonPressAction *)v3;
}

- (int64_t)netCharacterCount
{
  unint64_t v3;

  v3 = -[_UITextInputSessionAction insertedTextLength](self, "insertedTextLength");
  return v3 - -[_UITextInputSessionAction removedTextLength](self, "removedTextLength");
}

- (int64_t)flagOptions
{
  return self->_flagOptions;
}

- (int64_t)textInputActionsSource
{
  return self->_textInputActionsSource;
}

- (unint64_t)removedEmojiCount
{
  return self->_removedEmojiCount;
}

- (NSString)language
{
  return self->_language;
}

- (unint64_t)removedTextLength
{
  return self->_removedTextLength;
}

- (int64_t)textInputActionsType
{
  return self->_textInputActionsType;
}

- (NSString)region
{
  return self->_region;
}

- (unint64_t)largestSingleInsertionLength
{
  return self->_largestSingleInsertionLength;
}

- (unint64_t)largestSingleDeletionLength
{
  return self->_largestSingleDeletionLength;
}

- (NSString)keyboardVariant
{
  return self->_keyboardVariant;
}

- (NSString)keyboardType
{
  return self->_keyboardType;
}

- (NSString)keyboardLayout
{
  return self->_keyboardLayout;
}

- (BOOL)isCapableOfTextInsertion
{
  return 0;
}

- (unint64_t)insertedTextLength
{
  return self->_insertedTextLength;
}

- (id)inputModeUniqueString
{
  const __CFString *keyboardType;
  const __CFString *language;
  const __CFString *region;
  const __CFString *keyboardVariant;
  const __CFString *keyboardLayout;

  keyboardType = CFSTR("None");
  language = (const __CFString *)self->_language;
  region = (const __CFString *)self->_region;
  if (!language)
    language = CFSTR("None");
  if (!region)
    region = CFSTR("None");
  keyboardVariant = (const __CFString *)self->_keyboardVariant;
  keyboardLayout = (const __CFString *)self->_keyboardLayout;
  if (!keyboardVariant)
    keyboardVariant = CFSTR("None");
  if (!keyboardLayout)
    keyboardLayout = CFSTR("None");
  if (self->_keyboardType)
    keyboardType = (const __CFString *)self->_keyboardType;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@%@%@%@%@"), language, CFSTR("|"), region, CFSTR("|"), keyboardVariant, CFSTR("|"), keyboardLayout, CFSTR("|"), keyboardType);
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_keyboardType, 0);
  objc_storeStrong((id *)&self->_keyboardLayout, 0);
  objc_storeStrong((id *)&self->_keyboardVariant, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

- (_UITextInputSessionEndAction)asEnd
{
  _UITextInputSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UITextInputSessionEndAction *)v3;
}

- (_UITextInputSessionDictationEndedAction)asDictationEnded
{
  _UITextInputSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UITextInputSessionDictationEndedAction *)v3;
}

- (_UITextInputSessionCopyAction)asCopy
{
  _UITextInputSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UITextInputSessionCopyAction *)v3;
}

- (_UITextInputSessionCutAction)asCut
{
  _UITextInputSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UITextInputSessionCutAction *)v3;
}

- (_UITextInputSessionPasteAction)asPaste
{
  _UITextInputSessionAction *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (_UITextInputSessionPasteAction *)v3;
}

- (BOOL)changedContent
{
  return 0;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  NSRange v40;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[_UITextInputSessionAction appBundleId](self, "appBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("appBundleId=%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  +[UITextInputSessionActionAnalytics stringValueForSource:](UITextInputSessionActionAnalytics, "stringValueForSource:", -[_UITextInputSessionAction source](self, "source"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("source=%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  v12 = (void *)MEMORY[0x1E0CB3940];
  _UITextInputActionsSourceString(-[_UITextInputSessionAction textInputActionsSource](self, "textInputActionsSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("textInputActionsSource=%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v14);

  v15 = (void *)MEMORY[0x1E0CB3940];
  _UITextInputActionsTypeString(-[_UITextInputSessionAction textInputActionsType](self, "textInputActionsType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("textInputActionsType=%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v17);

  if (-[_UITextInputSessionAction changedContent](self, "changedContent"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("removedTextLength=%lu"), -[_UITextInputSessionAction removedTextLength](self, "removedTextLength"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v18);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("insertedTextLength=%lu"), -[_UITextInputSessionAction insertedTextLength](self, "insertedTextLength"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v19);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("removedEmojiCount=%lu"), -[_UITextInputSessionAction removedEmojiCount](self, "removedEmojiCount"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v20);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("insertedEmojiCount=%lu"), -[_UITextInputSessionAction insertedEmojiCount](self, "insertedEmojiCount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v21);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("removedPunctuationCount=%lu"), -[_UITextInputSessionAction removedPunctuationCount](self, "removedPunctuationCount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v22);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("insertedPunctuationCount=%lu"), -[_UITextInputSessionAction insertedPunctuationCount](self, "insertedPunctuationCount"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v23);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("largestSingleDeletionLength=%lu"), -[_UITextInputSessionAction largestSingleDeletionLength](self, "largestSingleDeletionLength"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v24);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("largestSingleInsertionLength=%lu"), -[_UITextInputSessionAction largestSingleInsertionLength](self, "largestSingleInsertionLength"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v25);

  }
  -[_UITextInputSessionAction language](self, "language");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26
    || (-[_UITextInputSessionAction region](self, "region"), (v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[_UITextInputSessionAction keyboardVariant](self, "keyboardVariant"),
        (v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (-[_UITextInputSessionAction keyboardLayout](self, "keyboardLayout"),
        (v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_8:
    v27 = (void *)MEMORY[0x1E0CB3940];
    -[_UITextInputSessionAction inputModeUniqueString](self, "inputModeUniqueString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("inputMode=%@"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v29);

    goto LABEL_9;
  }
  -[_UITextInputSessionAction keyboardType](self, "keyboardType");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
    goto LABEL_8;
LABEL_9:
  if (-[_UITextInputSessionAction flagOptions](self, "flagOptions"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("flagOptions=%lu"), -[_UITextInputSessionAction flagOptions](self, "flagOptions"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v30);

  }
  if (-[_UITextInputSessionAction inputActionCount](self, "inputActionCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inputActionCount=%lu"), -[_UITextInputSessionAction inputActionCount](self, "inputActionCount"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v31);

  }
  if (-[_UITextInputSessionAction relativeRangeBefore](self, "relativeRangeBefore")
    || (-[_UITextInputSessionAction relativeRangeBefore](self, "relativeRangeBefore"), v32))
  {
    v33 = (void *)MEMORY[0x1E0CB3940];
    v40.location = -[_UITextInputSessionAction relativeRangeBefore](self, "relativeRangeBefore");
    NSStringFromRange(v40);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("relativeRangeBefore=%@"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v35);

  }
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(": %@"), v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (int64_t)inputActionCount
{
  return -[_UITextInputSessionAction inputActionCountFromMergedActions](self, "inputActionCountFromMergedActions") + 1;
}

- (void)setInsertedTextLength:(unint64_t)a3
{
  int64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;

  if (a3 && !-[_UITextInputSessionAction changedContent](self, "changedContent"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextInputSessionAction.m"), 150, CFSTR("Attempted to set insertedTextLength on an action of class %@, which does not support changing content"), v9);

  }
  self->_insertedTextLength = a3;
  v6 = a3 - -[_UITextInputSessionAction removedTextLength](self, "removedTextLength");
  -[_UITextInputSessionAction setLargestSingleInsertionLength:](self, "setLargestSingleInsertionLength:", 0);
  -[_UITextInputSessionAction setLargestSingleDeletionLength:](self, "setLargestSingleDeletionLength:", 0);
  if (v6 < 1)
  {
    if (v6 < 0)
      -[_UITextInputSessionAction setLargestSingleDeletionLength:](self, "setLargestSingleDeletionLength:", -v6);
  }
  else
  {
    -[_UITextInputSessionAction setLargestSingleInsertionLength:](self, "setLargestSingleInsertionLength:", v6);
  }
}

- (void)setRemovedTextLength:(unint64_t)a3
{
  int64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;

  if (a3 && !-[_UITextInputSessionAction changedContent](self, "changedContent"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextInputSessionAction.m"), 171, CFSTR("Attempted to set removedTextLength on an action of class %@, which does not support changing content"), v9);

  }
  self->_removedTextLength = a3;
  v6 = -[_UITextInputSessionAction insertedTextLength](self, "insertedTextLength") - a3;
  -[_UITextInputSessionAction setLargestSingleInsertionLength:](self, "setLargestSingleInsertionLength:", 0);
  -[_UITextInputSessionAction setLargestSingleDeletionLength:](self, "setLargestSingleDeletionLength:", 0);
  if (v6 < 1)
  {
    if (v6 < 0)
      -[_UITextInputSessionAction setLargestSingleDeletionLength:](self, "setLargestSingleDeletionLength:", -v6);
  }
  else
  {
    -[_UITextInputSessionAction setLargestSingleInsertionLength:](self, "setLargestSingleInsertionLength:", v6);
  }
}

- (void)setInsertedTextLengthWithoutTracking:(unint64_t)a3
{
  void *v6;
  objc_class *v7;
  void *v8;

  if (a3 && !-[_UITextInputSessionAction changedContent](self, "changedContent"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextInputSessionAction.m"), 190, CFSTR("Attempted to set insertedTextLength on an action of class %@, which does not support changing content"), v8);

  }
  self->_insertedTextLength = a3;
}

- (void)setRemovedTextLengthWithoutTracking:(unint64_t)a3
{
  void *v6;
  objc_class *v7;
  void *v8;

  if (a3 && !-[_UITextInputSessionAction changedContent](self, "changedContent"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextInputSessionAction.m"), 198, CFSTR("Attempted to set removedTextLength on an action of class %@, which does not support changing content"), v8);

  }
  self->_removedTextLength = a3;
}

- (void)setInsertedEmojiCount:(unint64_t)a3
{
  void *v6;
  objc_class *v7;
  void *v8;

  if (a3 && !-[_UITextInputSessionAction changedContent](self, "changedContent"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextInputSessionAction.m"), 206, CFSTR("Attempted to set insertedEmojiCount on an action of class %@, which does not support changing content"), v8);

  }
  self->_insertedEmojiCount = a3;
}

- (void)setRemovedEmojiCount:(unint64_t)a3
{
  void *v6;
  objc_class *v7;
  void *v8;

  if (a3 && !-[_UITextInputSessionAction changedContent](self, "changedContent"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextInputSessionAction.m"), 214, CFSTR("Attempted to set removedEmojiCount on an action of class %@, which does not support changing content"), v8);

  }
  self->_removedEmojiCount = a3;
}

- (void)setInsertedPunctuationCount:(unint64_t)a3
{
  void *v6;
  objc_class *v7;
  void *v8;

  if (a3 && !-[_UITextInputSessionAction changedContent](self, "changedContent"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextInputSessionAction.m"), 222, CFSTR("Attempted to set insertedPunctuationCount on an action of class %@, which does not support changing content"), v8);

  }
  self->_insertedPunctuationCount = a3;
}

- (void)setRemovedPunctuationCount:(unint64_t)a3
{
  void *v6;
  objc_class *v7;
  void *v8;

  if (a3 && !-[_UITextInputSessionAction changedContent](self, "changedContent"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextInputSessionAction.m"), 230, CFSTR("Attempted to set removedPunctuationCount on an action of class %@, which does not support changing content"), v8);

  }
  self->_removedPunctuationCount = a3;
}

- (BOOL)isMergeableWith:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  v5 = -[_UITextInputSessionAction source](self, "source");
  if (v5 == objc_msgSend(v4, "source")
    && (v6 = -[_UITextInputSessionAction flagOptions](self, "flagOptions"), v6 == objc_msgSend(v4, "flagOptions"))
    && (v7 = -[_UITextInputSessionAction textInputActionsSource](self, "textInputActionsSource"),
        v7 == objc_msgSend(v4, "textInputActionsSource"))
    && (v8 = -[_UITextInputSessionAction textInputActionsType](self, "textInputActionsType"),
        v8 == objc_msgSend(v4, "textInputActionsType")))
  {
    -[_UITextInputSessionAction inputModeUniqueString](self, "inputModeUniqueString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputModeUniqueString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", v10))
    {
      -[_UITextInputSessionAction appBundleId](self, "appBundleId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appBundleId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (_NSRange)relativeRangeBefore
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_relativeRangeBefore.length;
  location = self->_relativeRangeBefore.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRelativeRangeBefore:(_NSRange)a3
{
  self->_relativeRangeBefore = a3;
}

- (unint64_t)insertedEmojiCount
{
  return self->_insertedEmojiCount;
}

- (unint64_t)insertedPunctuationCount
{
  return self->_insertedPunctuationCount;
}

- (unint64_t)removedPunctuationCount
{
  return self->_removedPunctuationCount;
}

- (int64_t)inputActionCountFromMergedActions
{
  return self->_inputActionCountFromMergedActions;
}

- (void)setInputActionCountFromMergedActions:(int64_t)a3
{
  self->_inputActionCountFromMergedActions = a3;
}

- (void)setLargestSingleInsertionLength:(unint64_t)a3
{
  self->_largestSingleInsertionLength = a3;
}

- (void)setLargestSingleDeletionLength:(unint64_t)a3
{
  self->_largestSingleDeletionLength = a3;
}

- (void)setKeyboardType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setFlagOptions:(int64_t)a3
{
  self->_flagOptions = a3;
}

@end
