@implementation TIAlignedTyping

- (BOOL)isAutocompleteTriggerForPreviousEntry
{
  void *v2;
  void *v3;
  char v4;

  -[TIAlignedTyping touched](self, "touched");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("<Autocorrect>"));

  return v4;
}

- (BOOL)isRevisedAutocompleteEntry
{
  void *v3;
  _BOOL4 v4;

  -[TIAlignedTyping touched](self, "touched");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsObject:", CFSTR("<Autocorrect>")))
    v4 = !-[TIAlignedTyping isAutocompleteTriggerForPreviousEntry](self, "isAutocompleteTriggerForPreviousEntry");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (NSArray)touched
{
  return self->_touched;
}

- (void)setTouched:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)predicted
{
  return self->_predicted;
}

- (void)setPredicted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)inlineCompletions
{
  return self->_inlineCompletions;
}

- (void)setInlineCompletions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)inserted
{
  return self->_inserted;
}

- (void)setInserted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)documentStates
{
  return self->_documentStates;
}

- (void)setDocumentStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (TIContinuousPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_documentStates, 0);
  objc_storeStrong((id *)&self->_inserted, 0);
  objc_storeStrong((id *)&self->_inlineCompletions, 0);
  objc_storeStrong((id *)&self->_predicted, 0);
  objc_storeStrong((id *)&self->_touched, 0);
}

@end
