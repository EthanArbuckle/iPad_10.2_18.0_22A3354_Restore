@implementation SIRINLUDelegatedUserDialogAct

- (SIRINLUDelegatedUserDialogAct)initWithAsrHypothesisIndex:(int)a3 rewrittenUtterace:(id)a4 externalParserId:(id)a5
{
  id v9;
  id v10;
  SIRINLUDelegatedUserDialogAct *v11;
  SIRINLUDelegatedUserDialogAct *v12;
  NSArray *spans;
  NSArray *v14;
  NSArray *rewrites;
  SIRINLURewriteMessage *rewrite;
  SIRINLUReferenceContext *referenceContext;
  objc_super v19;

  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SIRINLUDelegatedUserDialogAct;
  v11 = -[SIRINLUDelegatedUserDialogAct init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_asrHypothesisIndex = a3;
    objc_storeStrong((id *)&v11->_rewrittenUtterance, a4);
    objc_storeStrong((id *)&v12->_externalParserId, a5);
    spans = v12->_spans;
    v14 = (NSArray *)MEMORY[0x1E0C9AA60];
    v12->_spans = (NSArray *)MEMORY[0x1E0C9AA60];

    rewrites = v12->_rewrites;
    v12->_rewrites = v14;

    rewrite = v12->_rewrite;
    v12->_rewrite = 0;

    referenceContext = v12->_referenceContext;
    v12->_referenceContext = 0;

  }
  return v12;
}

- (SIRINLUDelegatedUserDialogAct)initWithAsrHypothesisIndex:(int)a3 rewrittenUtterace:(id)a4 externalParserId:(id)a5 spans:(id)a6
{
  id v11;
  id v12;
  id v13;
  SIRINLUDelegatedUserDialogAct *v14;
  SIRINLUDelegatedUserDialogAct *v15;
  NSArray *rewrites;
  SIRINLURewriteMessage *rewrite;
  SIRINLUReferenceContext *referenceContext;
  objc_super v20;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SIRINLUDelegatedUserDialogAct;
  v14 = -[SIRINLUDelegatedUserDialogAct init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_asrHypothesisIndex = a3;
    objc_storeStrong((id *)&v14->_rewrittenUtterance, a4);
    objc_storeStrong((id *)&v15->_externalParserId, a5);
    objc_storeStrong((id *)&v15->_spans, a6);
    rewrites = v15->_rewrites;
    v15->_rewrites = (NSArray *)MEMORY[0x1E0C9AA60];

    rewrite = v15->_rewrite;
    v15->_rewrite = 0;

    referenceContext = v15->_referenceContext;
    v15->_referenceContext = 0;

  }
  return v15;
}

- (SIRINLUDelegatedUserDialogAct)initWithAsrHypothesisIndex:(int)a3 rewrittenUtterace:(id)a4 externalParserId:(id)a5 spans:(id)a6 rewriteMessages:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SIRINLUDelegatedUserDialogAct *v17;
  SIRINLUDelegatedUserDialogAct *v18;
  SIRINLURewriteMessage *rewrite;
  SIRINLUReferenceContext *referenceContext;
  objc_super v22;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SIRINLUDelegatedUserDialogAct;
  v17 = -[SIRINLUDelegatedUserDialogAct init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_asrHypothesisIndex = a3;
    objc_storeStrong((id *)&v17->_rewrittenUtterance, a4);
    objc_storeStrong((id *)&v18->_externalParserId, a5);
    objc_storeStrong((id *)&v18->_spans, a6);
    objc_storeStrong((id *)&v18->_rewrites, a7);
    rewrite = v18->_rewrite;
    v18->_rewrite = 0;

    referenceContext = v18->_referenceContext;
    v18->_referenceContext = 0;

  }
  return v18;
}

- (SIRINLUDelegatedUserDialogAct)initWithAsrHypothesisIndex:(int)a3 rewrittenUtterace:(id)a4 externalParserId:(id)a5 spans:(id)a6 rewriteMessage:(id)a7 referenceContext:(id)a8
{
  id v15;
  id v16;
  id v17;
  SIRINLUDelegatedUserDialogAct *v18;
  SIRINLUDelegatedUserDialogAct *v19;
  NSArray *rewrites;
  uint64_t v21;
  NSArray *v22;
  id v24;
  id v25;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v25 = a4;
  v24 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)SIRINLUDelegatedUserDialogAct;
  v18 = -[SIRINLUDelegatedUserDialogAct init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_asrHypothesisIndex = a3;
    objc_storeStrong((id *)&v18->_rewrittenUtterance, a4);
    objc_storeStrong((id *)&v19->_externalParserId, a5);
    objc_storeStrong((id *)&v19->_spans, a6);
    rewrites = v19->_rewrites;
    v19->_rewrites = (NSArray *)MEMORY[0x1E0C9AA60];

    if (v16)
    {
      v27[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1, v24, v25);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v19->_rewrites;
      v19->_rewrites = (NSArray *)v21;

    }
    objc_storeStrong((id *)&v19->_rewrite, a7);
    objc_storeStrong((id *)&v19->_referenceContext, a8);
  }

  return v19;
}

- (SIRINLUDelegatedUserDialogAct)initWithAsrHypothesisIndex:(int)a3 rewrittenUtterace:(id)a4 externalParserId:(id)a5 spans:(id)a6 rewriteMessage:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SIRINLUDelegatedUserDialogAct *v17;
  SIRINLUDelegatedUserDialogAct *v18;
  NSArray *rewrites;
  uint64_t v20;
  NSArray *v21;
  SIRINLUReferenceContext *referenceContext;
  objc_super v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SIRINLUDelegatedUserDialogAct;
  v17 = -[SIRINLUDelegatedUserDialogAct init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_asrHypothesisIndex = a3;
    objc_storeStrong((id *)&v17->_rewrittenUtterance, a4);
    objc_storeStrong((id *)&v18->_externalParserId, a5);
    objc_storeStrong((id *)&v18->_spans, a6);
    rewrites = v18->_rewrites;
    v18->_rewrites = (NSArray *)MEMORY[0x1E0C9AA60];

    if (v16)
    {
      v25[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v18->_rewrites;
      v18->_rewrites = (NSArray *)v20;

    }
    objc_storeStrong((id *)&v18->_rewrite, a7);
    referenceContext = v18->_referenceContext;
    v18->_referenceContext = 0;

  }
  return v18;
}

- (SIRINLUDelegatedUserDialogAct)initWithCoder:(id)a3
{
  id v4;
  SIRINLUDelegatedUserDialogAct *v5;
  void *v6;
  uint64_t v7;
  NSString *rewrittenUtterance;
  uint64_t v9;
  NSString *externalParserId;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *spans;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *rewrites;
  uint64_t v21;
  SIRINLURewriteMessage *rewrite;
  uint64_t v23;
  SIRINLUReferenceContext *referenceContext;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SIRINLUDelegatedUserDialogAct;
  v5 = -[SIRINLUDelegatedUserDialogAct init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asrHypothesisIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_asrHypothesisIndex = objc_msgSend(v6, "intValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewrittenUtterance"));
    v7 = objc_claimAutoreleasedReturnValue();
    rewrittenUtterance = v5->_rewrittenUtterance;
    v5->_rewrittenUtterance = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalParserId"));
    v9 = objc_claimAutoreleasedReturnValue();
    externalParserId = v5->_externalParserId;
    v5->_externalParserId = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("spans"));
    v14 = objc_claimAutoreleasedReturnValue();
    spans = v5->_spans;
    v5->_spans = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("rewrites"));
    v19 = objc_claimAutoreleasedReturnValue();
    rewrites = v5->_rewrites;
    v5->_rewrites = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewrite"));
    v21 = objc_claimAutoreleasedReturnValue();
    rewrite = v5->_rewrite;
    v5->_rewrite = (SIRINLURewriteMessage *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceContext"));
    v23 = objc_claimAutoreleasedReturnValue();
    referenceContext = v5->_referenceContext;
    v5->_referenceContext = (SIRINLUReferenceContext *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t asrHypothesisIndex;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  asrHypothesisIndex = self->_asrHypothesisIndex;
  v6 = a3;
  objc_msgSend(v4, "numberWithInt:", asrHypothesisIndex);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v13, CFSTR("asrHypothesisIndex"));
  -[SIRINLUDelegatedUserDialogAct rewrittenUtterance](self, "rewrittenUtterance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("rewrittenUtterance"));

  -[SIRINLUDelegatedUserDialogAct externalParserId](self, "externalParserId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("externalParserId"));

  -[SIRINLUDelegatedUserDialogAct spans](self, "spans");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("spans"));

  -[SIRINLUDelegatedUserDialogAct rewrites](self, "rewrites");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("rewrites"));

  -[SIRINLUDelegatedUserDialogAct rewrite](self, "rewrite");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("rewrite"));

  -[SIRINLUDelegatedUserDialogAct referenceContext](self, "referenceContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("referenceContext"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  void *v16;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v14 = -[SIRINLUDelegatedUserDialogAct asrHypothesisIndex](self, "asrHypothesisIndex");
  -[SIRINLUDelegatedUserDialogAct rewrittenUtterance](self, "rewrittenUtterance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUDelegatedUserDialogAct rewrite](self, "rewrite");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUDelegatedUserDialogAct externalParserId](self, "externalParserId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUDelegatedUserDialogAct spans](self, "spans");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v6, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUDelegatedUserDialogAct rewrites](self, "rewrites");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentArray:numSpaces:](SIRINLUPrintUtils, "indentArray:numSpaces:", v8, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUDelegatedUserDialogAct referenceContext](self, "referenceContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("{DelegatedUserDialogAct:\n  asrHypothesisIndex: %d\n  rewrittenUtterance: %@\n  rewrite: %@\n  externalParserId: %@\n  spans: %@\n  rewrites: %@\n  referenceContext: %@\n}"), v14, v3, v4, v5, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int)asrHypothesisIndex
{
  return self->_asrHypothesisIndex;
}

- (void)setAsrHypothesisIndex:(int)a3
{
  self->_asrHypothesisIndex = a3;
}

- (NSString)externalParserId
{
  return self->_externalParserId;
}

- (void)setExternalParserId:(id)a3
{
  objc_storeStrong((id *)&self->_externalParserId, a3);
}

- (SIRINLURewriteMessage)rewrite
{
  return self->_rewrite;
}

- (void)setRewrite:(id)a3
{
  objc_storeStrong((id *)&self->_rewrite, a3);
}

- (NSString)rewrittenUtterance
{
  return self->_rewrittenUtterance;
}

- (void)setRewrittenUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_rewrittenUtterance, a3);
}

- (NSArray)rewrites
{
  return self->_rewrites;
}

- (void)setRewrites:(id)a3
{
  objc_storeStrong((id *)&self->_rewrites, a3);
}

- (NSArray)spans
{
  return self->_spans;
}

- (void)setSpans:(id)a3
{
  objc_storeStrong((id *)&self->_spans, a3);
}

- (SIRINLUReferenceContext)referenceContext
{
  return self->_referenceContext;
}

- (void)setReferenceContext:(id)a3
{
  objc_storeStrong((id *)&self->_referenceContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceContext, 0);
  objc_storeStrong((id *)&self->_spans, 0);
  objc_storeStrong((id *)&self->_rewrites, 0);
  objc_storeStrong((id *)&self->_rewrittenUtterance, 0);
  objc_storeStrong((id *)&self->_rewrite, 0);
  objc_storeStrong((id *)&self->_externalParserId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
