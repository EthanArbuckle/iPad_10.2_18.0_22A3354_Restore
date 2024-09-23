@implementation TIKeyboardInputManagerBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputManagerLogger, 0);
  objc_storeStrong((id *)&self->_typologyPreferences, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

- (TITypologyPreferences)typologyPreferences
{
  return self->_typologyPreferences;
}

- (TIKeyboardInputManagerLogging)inputManagerLogger
{
  return self->_inputManagerLogger;
}

- (TIInputMode)inputMode
{
  return self->_inputMode;
}

- (void)setTypologyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_typologyPreferences, a3);
}

- (void)setInputManagerLogger:(id)a3
{
  objc_storeStrong((id *)&self->_inputManagerLogger, a3);
}

- (void)resume
{
  self->_hasHandledInput = 0;
}

- (TIKeyboardInputManagerBase)initWithInputMode:(id)a3 keyboardState:(id)a4
{
  id v6;
  TIKeyboardInputManagerBase *v7;
  TIKeyboardInputManagerBase *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerBase;
  v7 = -[TIKeyboardInputManagerBase init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_inputMode, a3);

  return v8;
}

- (BOOL)hasHandledInput
{
  return self->_hasHandledInput;
}

- (TIKeyboardInputManagerBase)init
{
  return -[TIKeyboardInputManagerBase initWithInputMode:keyboardState:](self, "initWithInputMode:keyboardState:", 0, 0);
}

- (NSString)currentInputModeIdentifier
{
  return -[TIInputMode normalizedIdentifier](self->_inputMode, "normalizedIdentifier");
}

- (BOOL)isHighMemoryManager
{
  return 0;
}

- (BOOL)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (id)keyboardConfiguration
{
  id v2;
  id v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DBDBF0]);
  v3 = objc_alloc_init(MEMORY[0x1E0DBDC10]);
  objc_msgSend(v2, "setInputManagerState:", v3);

  return v2;
}

- (id)handleKeyboardInput:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;

  v3 = (objc_class *)MEMORY[0x1E0DBDC40];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setInsertionText:", v7);
  }
  else
  {
    v8 = objc_msgSend(v4, "isBackspace");

    if (v8)
      objc_msgSend(v5, "setDeletionCount:", 1);
  }
  return v5;
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  id v5;
  id v6;

  if (a5)
  {
    v5 = a5;
    objc_msgSend(v5, "open");
    objc_msgSend(MEMORY[0x1E0DBDB48], "listWithAutocorrection:predictions:", 0, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushCandidates:", v6);
    objc_msgSend(v5, "close");

  }
}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  id v5;
  id v6;

  if (a5)
  {
    v5 = a5;
    objc_msgSend(v5, "open");
    objc_msgSend(MEMORY[0x1E0DBDBE0], "setWithCandidates:", 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushCandidateResultSet:", v6);
    objc_msgSend(v5, "close");

  }
}

- (id)generateInlineCompletions:(id)a3 withPrefix:(id)a4
{
  return &stru_1EA1081D0;
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  return 0;
}

- (id)generateReplacementsForString:(id)a3 keyLayout:(id)a4
{
  return 0;
}

- (id)generateRefinementsForCandidate:(id)a3
{
  return 0;
}

- (int64_t)performHitTestForTouchEvent:(id)a3 keyboardState:(id)a4
{
  return -1;
}

- (_NSRange)smartSelectionRangeForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = a4.length;
  location = a4.location;
  result.length = length;
  result.location = location;
  return result;
}

- (int64_t)deletionCountForString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length") && (v5 = objc_msgSend(v4, "length"), v5 >= 1))
  {
    v6 = v5;
    v7 = 0;
    do
    {
      objc_msgSend(v4, "_rangeOfBackwardDeletionClusterAtIndex:", v6 - 1);
      v6 -= v8;
      ++v7;
    }
    while (v6 > 0);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)humanReadableTrace
{
  return 0;
}

- (id)configurationPropertyList
{
  return 0;
}

- (BOOL)isHardwareKeyboardAutocorrectionEnabled
{
  return 0;
}

- (id)resourceInputModes
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
