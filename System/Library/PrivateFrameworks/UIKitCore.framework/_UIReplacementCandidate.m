@implementation _UIReplacementCandidate

- (_UIReplacementCandidate)initWithText:(id)a3
{
  id v5;
  _UIReplacementCandidate *v6;
  _UIReplacementCandidate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIReplacementCandidate;
  v6 = -[_UIReplacementCandidate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_documentTextToReplace, a3);

  return v7;
}

+ (id)candidateForAutocorrectionCandidate:(id)a3 range:(id)a4
{
  id v5;
  id v6;
  _UIReplacementCandidate *v7;
  void *v8;
  _UIReplacementCandidate *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = [_UIReplacementCandidate alloc];
  objc_msgSend(v6, "candidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_UIReplacementCandidate initWithText:](v7, "initWithText:", v8);

  objc_msgSend(v6, "input");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIReplacementCandidate setRevertText:](v9, "setRevertText:", v10);
  -[_UIReplacementCandidate setRangeInDocument:](v9, "setRangeInDocument:", v5);

  -[_UIReplacementCandidate setUnderlineStyle:](v9, "setUnderlineStyle:", 1);
  -[_UIReplacementCandidate setPreferredPromptStyle:](v9, "setPreferredPromptStyle:", 2);
  -[_UIReplacementCandidate setPreferredPromptButton:](v9, "setPreferredPromptButton:", 2);
  return v9;
}

+ (id)candidateForAutocorrection:(id)a3 range:(id)a4 underlineStyle:(int64_t)a5 promptStyle:(int64_t)a6 promptButton:(int64_t)a7
{
  id v11;
  id v12;
  _UIReplacementCandidate *v13;
  void *v14;
  _UIReplacementCandidate *v15;
  void *v16;

  v11 = a4;
  v12 = a3;
  v13 = [_UIReplacementCandidate alloc];
  objc_msgSend(v12, "candidate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_UIReplacementCandidate initWithText:](v13, "initWithText:", v14);

  objc_msgSend(v12, "input");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIReplacementCandidate setRevertText:](v15, "setRevertText:", v16);
  -[_UIReplacementCandidate setRangeInDocument:](v15, "setRangeInDocument:", v11);

  -[_UIReplacementCandidate setUnderlineStyle:](v15, "setUnderlineStyle:", a5);
  -[_UIReplacementCandidate setPreferredPromptStyle:](v15, "setPreferredPromptStyle:", a6);
  -[_UIReplacementCandidate setPreferredPromptButton:](v15, "setPreferredPromptButton:", a7);
  return v15;
}

+ (id)candidateForDocumentText:(id)a3 revertText:(id)a4 textChoices:(id)a5 range:(id)a6 underlineStyle:(int64_t)a7 promptStyle:(int64_t)a8 promptButton:(int64_t)a9
{
  return (id)objc_msgSend(a1, "candidateForDocumentText:revertText:textChoices:range:underlineStyle:promptStyle:promptButton:voiceCommandDisambiguationSelectedIndex:voiceCommandDisambiguationTargetCount:", a3, a4, a5, a6, a7, a8, a9, 0, 0);
}

+ (id)candidateForDocumentText:(id)a3 revertText:(id)a4 textChoices:(id)a5 range:(id)a6 underlineStyle:(int64_t)a7 promptStyle:(int64_t)a8 promptButton:(int64_t)a9 voiceCommandDisambiguationSelectedIndex:(id)a10 voiceCommandDisambiguationTargetCount:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _UIReplacementCandidate *v22;
  void *v23;

  v16 = a11;
  v17 = a10;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = -[_UIReplacementCandidate initWithText:]([_UIReplacementCandidate alloc], "initWithText:", v21);
  -[_UIReplacementCandidate setRevertText:](v22, "setRevertText:", v20);

  _candidatesChoicesFromTextChoices(v19, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIReplacementCandidate setCandidateChoices:](v22, "setCandidateChoices:", v23);
  -[_UIReplacementCandidate setRangeInDocument:](v22, "setRangeInDocument:", v18);

  -[_UIReplacementCandidate setUnderlineStyle:](v22, "setUnderlineStyle:", a7);
  -[_UIReplacementCandidate setPreferredPromptStyle:](v22, "setPreferredPromptStyle:", a8);
  -[_UIReplacementCandidate setPreferredPromptButton:](v22, "setPreferredPromptButton:", a9);
  -[_UIReplacementCandidate setVoiceCommandDisambiguationSelectedIndex:](v22, "setVoiceCommandDisambiguationSelectedIndex:", v17);

  -[_UIReplacementCandidate setVoiceCommandDisambiguationTargetCount:](v22, "setVoiceCommandDisambiguationTargetCount:", v16);
  return v22;
}

+ (id)candidateForDocumentText:(id)a3 revertText:(id)a4 candidateChoices:(id)a5 range:(id)a6 underlineStyle:(int64_t)a7 promptStyle:(int64_t)a8 promptButton:(int64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  _UIReplacementCandidate *v18;

  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = -[_UIReplacementCandidate initWithText:]([_UIReplacementCandidate alloc], "initWithText:", v17);

  -[_UIReplacementCandidate setRevertText:](v18, "setRevertText:", v16);
  -[_UIReplacementCandidate setCandidateChoices:](v18, "setCandidateChoices:", v15);

  -[_UIReplacementCandidate setRangeInDocument:](v18, "setRangeInDocument:", v14);
  -[_UIReplacementCandidate setUnderlineStyle:](v18, "setUnderlineStyle:", a7);
  -[_UIReplacementCandidate setPreferredPromptStyle:](v18, "setPreferredPromptStyle:", a8);
  -[_UIReplacementCandidate setPreferredPromptButton:](v18, "setPreferredPromptButton:", a9);
  return v18;
}

- (NSArray)textChoices
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[_UIReplacementCandidate candidateChoices](self, "candidateChoices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_UIReplacementCandidate candidateChoices](self, "candidateChoices", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "label");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v5, "addObject:", v12);
        }
        else
        {
          objc_msgSend(v11, "candidate");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v13;
          if (v13)
            v15 = (const __CFString *)v13;
          else
            v15 = &stru_1E16EDF20;
          objc_msgSend(v5, "addObject:", v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v16 = (void *)objc_msgSend(v5, "copy");
  return (NSArray *)v16;
}

- (void)setTextChoices:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UIReplacementCandidate documentTextToReplace](self, "documentTextToReplace");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  _candidatesChoicesFromTextChoices(v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIReplacementCandidate setCandidateChoices:](self, "setCandidateChoices:", v5);
}

- (NSString)documentTextToReplace
{
  return self->_documentTextToReplace;
}

- (void)setDocumentTextToReplace:(id)a3
{
  objc_storeStrong((id *)&self->_documentTextToReplace, a3);
}

- (NSString)revertText
{
  return self->_revertText;
}

- (void)setRevertText:(id)a3
{
  objc_storeStrong((id *)&self->_revertText, a3);
}

- (NSArray)alternativeRevertTexts
{
  return self->_alternativeRevertTexts;
}

- (void)setAlternativeRevertTexts:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeRevertTexts, a3);
}

- (NSArray)candidateChoices
{
  return self->_candidateChoices;
}

- (void)setCandidateChoices:(id)a3
{
  objc_storeStrong((id *)&self->_candidateChoices, a3);
}

- (NSArray)underlines
{
  return self->_underlines;
}

- (void)setUnderlines:(id)a3
{
  objc_storeStrong((id *)&self->_underlines, a3);
}

- (UITextRange)rangeInDocument
{
  return self->_rangeInDocument;
}

- (void)setRangeInDocument:(id)a3
{
  objc_storeStrong((id *)&self->_rangeInDocument, a3);
}

- (int64_t)underlineStyle
{
  return self->_underlineStyle;
}

- (void)setUnderlineStyle:(int64_t)a3
{
  self->_underlineStyle = a3;
}

- (int64_t)preferredPromptStyle
{
  return self->_preferredPromptStyle;
}

- (void)setPreferredPromptStyle:(int64_t)a3
{
  self->_preferredPromptStyle = a3;
}

- (int64_t)preferredPromptButton
{
  return self->_preferredPromptButton;
}

- (void)setPreferredPromptButton:(int64_t)a3
{
  self->_preferredPromptButton = a3;
}

- (NSNumber)voiceCommandDisambiguationSelectedIndex
{
  return self->_voiceCommandDisambiguationSelectedIndex;
}

- (void)setVoiceCommandDisambiguationSelectedIndex:(id)a3
{
  objc_storeStrong((id *)&self->_voiceCommandDisambiguationSelectedIndex, a3);
}

- (NSUUID)voiceCommandTrackingUUID
{
  return self->_voiceCommandTrackingUUID;
}

- (void)setVoiceCommandTrackingUUID:(id)a3
{
  objc_storeStrong((id *)&self->_voiceCommandTrackingUUID, a3);
}

- (NSNumber)voiceCommandDisambiguationTargetCount
{
  return self->_voiceCommandDisambiguationTargetCount;
}

- (void)setVoiceCommandDisambiguationTargetCount:(id)a3
{
  objc_storeStrong((id *)&self->_voiceCommandDisambiguationTargetCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceCommandDisambiguationTargetCount, 0);
  objc_storeStrong((id *)&self->_voiceCommandTrackingUUID, 0);
  objc_storeStrong((id *)&self->_voiceCommandDisambiguationSelectedIndex, 0);
  objc_storeStrong((id *)&self->_rangeInDocument, 0);
  objc_storeStrong((id *)&self->_underlines, 0);
  objc_storeStrong((id *)&self->_candidateChoices, 0);
  objc_storeStrong((id *)&self->_alternativeRevertTexts, 0);
  objc_storeStrong((id *)&self->_revertText, 0);
  objc_storeStrong((id *)&self->_documentTextToReplace, 0);
}

@end
