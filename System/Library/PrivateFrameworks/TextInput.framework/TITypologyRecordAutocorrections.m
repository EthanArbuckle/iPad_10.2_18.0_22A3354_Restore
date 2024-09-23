@implementation TITypologyRecordAutocorrections

- (TITypologyRecordAutocorrections)initWithCoder:(id)a3
{
  id v4;
  TITypologyRecordAutocorrections *v5;
  uint64_t v6;
  TIKeyboardState *keyboardState;
  uint64_t v8;
  TICandidateRequestToken *requestToken;
  uint64_t v10;
  TIAutocorrectionList *autocorrections;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TITypologyRecordAutocorrections;
  v5 = -[TITypologyRecord initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardState"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    requestToken = v5->_requestToken;
    v5->_requestToken = (TICandidateRequestToken *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autocorrections"));
    v10 = objc_claimAutoreleasedReturnValue();
    autocorrections = v5->_autocorrections;
    v5->_autocorrections = (TIAutocorrectionList *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordAutocorrections;
  v4 = a3;
  -[TITypologyRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardState, CFSTR("keyboardState"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_requestToken, CFSTR("requestToken"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_autocorrections, CFSTR("autocorrections"));

}

- (void)removeContextFromKeyboardState
{
  void *v3;
  id v4;

  -[TITypologyRecordAutocorrections keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "copy");

  objc_msgSend(v4, "setInputContextHistory:", 0);
  -[TITypologyRecordAutocorrections setKeyboardState:](self, "setKeyboardState:", v4);

}

- (id)shortDescription
{
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  const __CFString *v43;
  void *v44;
  TITypologyRecordAutocorrections *v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[TITypologyRecordAutocorrections autocorrections](self, "autocorrections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inlineCompletions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v46 = self;
  if (v6)
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[TITypologyRecordAutocorrections autocorrections](self, "autocorrections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inlineCompletions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v53 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v13, "input");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "candidate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("-[\"%@\"->\"%@\"]- "), v14, v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v10);
    }

    self = v46;
  }
  -[TITypologyRecordAutocorrections autocorrections](self, "autocorrections");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "corrections");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "autocorrection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[TITypologyRecordAutocorrections autocorrections](self, "autocorrections");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "corrections");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "autocorrection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "input");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypologyRecordAutocorrections autocorrections](self, "autocorrections");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "corrections");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "autocorrection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "candidate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("[\"%@\"->\"%@\"]"), v22, v26);

  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[TITypologyRecordAutocorrections autocorrections](self, "autocorrections");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "predictions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v28;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v49 != v31)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        if (-[__CFString length](v3, "length"))
          v34 = CFSTR(", ");
        else
          v34 = &stru_1E243B990;
        objc_msgSend(v33, "input");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "candidate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("%@\"%@\"->\"%@\"), v34, v35, v36);

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v30);
  }

  v37 = (void *)MEMORY[0x1E0CB3940];
  -[TITypologyRecordAutocorrections requestToken](v46, "requestToken");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "shortIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypologyRecordAutocorrections keyboardState](v46, "keyboardState");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "documentState");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[__CFString length](v3, "length");
  v43 = CFSTR("(none)");
  if (v42)
    v43 = v3;
  objc_msgSend(v37, "stringWithFormat:", CFSTR("AUTOCORRECTIONS (req=%@; doc=%@) %@"), v39, v41, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

- (void)replaceDocumentState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TITypologyRecordAutocorrections keyboardState](self, "keyboardState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDocumentState:", v4);

}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setKeyboardState:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardState, a3);
}

- (TICandidateRequestToken)requestToken
{
  return self->_requestToken;
}

- (void)setRequestToken:(id)a3
{
  objc_storeStrong((id *)&self->_requestToken, a3);
}

- (TIAutocorrectionList)autocorrections
{
  return self->_autocorrections;
}

- (void)setAutocorrections:(id)a3
{
  objc_storeStrong((id *)&self->_autocorrections, a3);
}

- (BOOL)listUIDisplayed
{
  return self->_listUIDisplayed;
}

- (void)setListUIDisplayed:(BOOL)a3
{
  self->_listUIDisplayed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autocorrections, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
  objc_msgSend(a3, "visitRecordAutocorrections:", self);
}

@end
