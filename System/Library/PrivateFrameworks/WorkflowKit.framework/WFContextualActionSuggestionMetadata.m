@implementation WFContextualActionSuggestionMetadata

- (WFContextualActionSuggestionMetadata)initWithSuggestionUUID:(id)a3 sessionUUID:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFContextualActionSuggestionMetadata *v11;
  WFContextualActionSuggestionMetadata *v12;
  WFContextualActionSuggestionMetadata *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionSuggester.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestionUUID"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionSuggester.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionUUID"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFContextualActionSuggestionMetadata;
  v11 = -[WFContextualActionSuggestionMetadata init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_suggestionUUID, a3);
    objc_storeStrong((id *)&v12->_sessionUUID, a4);
    v13 = v12;
  }

  return v12;
}

- (NSUUID)suggestionUUID
{
  return self->_suggestionUUID;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_suggestionUUID, 0);
}

@end
