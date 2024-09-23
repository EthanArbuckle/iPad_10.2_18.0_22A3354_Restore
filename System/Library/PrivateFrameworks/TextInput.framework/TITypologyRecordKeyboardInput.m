@implementation TITypologyRecordKeyboardInput

- (TITypologyRecordKeyboardInput)initWithCoder:(id)a3
{
  id v4;
  TITypologyRecordKeyboardInput *v5;
  uint64_t v6;
  TIKeyboardInput *input;
  uint64_t v8;
  TIKeyboardState *keyboardState;
  uint64_t v10;
  TIKeyboardOutput *output;
  uint64_t v12;
  TIKeyboardConfiguration *keyboardConfig;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TITypologyRecordKeyboardInput;
  v5 = -[TITypologyRecord initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("input"));
    v6 = objc_claimAutoreleasedReturnValue();
    input = v5->_input;
    v5->_input = (TIKeyboardInput *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardState"));
    v8 = objc_claimAutoreleasedReturnValue();
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("output"));
    v10 = objc_claimAutoreleasedReturnValue();
    output = v5->_output;
    v5->_output = (TIKeyboardOutput *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardConfig"));
    v12 = objc_claimAutoreleasedReturnValue();
    keyboardConfig = v5->_keyboardConfig;
    v5->_keyboardConfig = (TIKeyboardConfiguration *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordKeyboardInput;
  v4 = a3;
  -[TITypologyRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_input, CFSTR("input"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardState, CFSTR("keyboardState"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_output, CFSTR("output"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardConfig, CFSTR("keyboardConfig"));

}

- (void)removeContextFromKeyboardState
{
  void *v3;
  id v4;

  -[TITypologyRecordKeyboardInput keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "copy");

  objc_msgSend(v4, "setInputContextHistory:", 0);
  -[TITypologyRecordKeyboardInput setKeyboardState:](self, "setKeyboardState:", v4);

}

- (id)textSummary
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[TITypologyRecordKeyboardInput input](self, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "acceptedCandidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAutocorrection");

  if (v6)
  {
    -[TITypologyRecordKeyboardInput input](self, "input");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "acceptedCandidate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypologyRecord textSummaryForAutocorrection:](self, "textSummaryForAutocorrection:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v9);

  }
  -[TITypologyRecordKeyboardInput output](self, "output");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "deletionCount");

  if (v11)
  {
    v12 = 0;
    do
    {
      objc_msgSend(v3, "appendString:", CFSTR("\\b"));
      ++v12;
      -[TITypologyRecordKeyboardInput output](self, "output");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "deletionCount");

    }
    while (v12 < v14);
  }
  -[TITypologyRecordKeyboardInput output](self, "output");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "insertionText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[TITypologyRecordKeyboardInput output](self, "output");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertionText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\"), CFSTR("\\\\"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "appendString:", v20);
  }
  return v3;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
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
  int v21;
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
  void *v32;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("INPUT "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITypologyRecordKeyboardInput input](self, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TITypologyRecordKeyboardInput input](self, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\"%@\"), v8);
LABEL_3:

    goto LABEL_10;
  }
  v9 = objc_msgSend(v6, "isBackspace");

  if (v9)
  {
    v10 = CFSTR("delete");
  }
  else
  {
    -[TITypologyRecordKeyboardInput input](self, "input");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "object");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[TITypologyRecordKeyboardInput input](self, "input");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "object");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v13);

      goto LABEL_3;
    }
    v10 = CFSTR("none");
  }
  objc_msgSend(v3, "appendString:", v10);
LABEL_10:
  -[TITypologyRecordKeyboardInput output](self, "output");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" -> OUTPUT \"%@\"), v14);

  -[TITypologyRecordKeyboardInput input](self, "input");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "acceptedCandidate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[TITypologyRecordKeyboardInput input](self, "input");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "acceptedCandidate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "candidate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; accepted \"%@\"), v19);

  }
  -[TITypologyRecordKeyboardInput input](self, "input");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isSynthesizedByAcceptingCandidate");

  if (v21)
    objc_msgSend(v3, "appendFormat:", CFSTR("; synth"));
  -[TITypologyRecordKeyboardInput input](self, "input");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "touchEvent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[TITypologyRecordKeyboardInput input](self, "input");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "touchEvent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "shortDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; touch %@"), v26);

  }
  -[TITypologyRecordKeyboardInput keyboardConfig](self, "keyboardConfig");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "intermediateText");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[TITypologyRecordKeyboardInput keyboardConfig](self, "keyboardConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "intermediateText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; %@"), v30);

  }
  -[TITypologyRecordKeyboardInput keyboardState](self, "keyboardState");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "documentState");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" (doc=%@)"), v32);

  return v3;
}

- (id)changedText
{
  void *v3;
  uint64_t v4;
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
  char v19;
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
  char v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  -[TITypologyRecordKeyboardInput output](self, "output");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deletionCount");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[TITypologyRecordKeyboardInput output](self, "output");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("-%li"), objc_msgSend(v6, "deletionCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

    return v7;
  }
  -[TITypologyRecordKeyboardInput input](self, "input");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TITypologyRecordKeyboardInput input](self, "input");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "acceptedCandidate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TITypologyRecordKeyboardInput input](self, "input");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v7)
    {
      objc_msgSend(v12, "acceptedCandidate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "input");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITypologyRecordKeyboardInput input](self, "input");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "acceptedCandidate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "candidate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v15, "isEqualToString:", v18);

      v20 = (void *)MEMORY[0x1E0CB3940];
      -[TITypologyRecordKeyboardInput input](self, "input");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v21;
      if ((v19 & 1) != 0)
      {
        objc_msgSend(v21, "string");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[TITypologyRecordKeyboardInput input](self, "input");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "acceptedCandidate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "candidate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("|%@->%@"), v22, v25);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v21, "acceptedCandidate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "input");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[TITypologyRecordKeyboardInput input](self, "input");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "acceptedCandidate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "candidate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[TITypologyRecordKeyboardInput input](self, "input");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "string");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@->%@|%@"), v23, v34, v36);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      objc_msgSend(v12, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[TITypologyRecordKeyboardInput input](self, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypologyRecordKeyboardInput output](self, "output");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "insertionText");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v37, "isEqualToString:", v39) & 1) != 0)
    {

      goto LABEL_18;
    }
    -[TITypologyRecordKeyboardInput output](self, "output");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "insertionText");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "length");

    if (v42)
    {
      v43 = (void *)MEMORY[0x1E0CB3940];
      -[TITypologyRecordKeyboardInput output](self, "output");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "insertionText");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stringWithFormat:", CFSTR("%@->%@|"), v7, v44);
      v45 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v45;
      goto LABEL_19;
    }
  }
  else if (v7)
  {
    -[TITypologyRecordKeyboardInput input](self, "input");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "acceptedCandidate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "input");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypologyRecordKeyboardInput input](self, "input");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "acceptedCandidate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "candidate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v28, "isEqualToString:", v31);

    if ((v32 & 1) != 0)
    {
      -[TITypologyRecordKeyboardInput input](self, "input");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "acceptedCandidate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "candidate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
    v46 = (void *)MEMORY[0x1E0CB3940];
    -[TITypologyRecordKeyboardInput input](self, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "acceptedCandidate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "input");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypologyRecordKeyboardInput input](self, "input");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "acceptedCandidate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "candidate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "stringWithFormat:", CFSTR("%@->%@"), v38, v49);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
    goto LABEL_19;
  }
  return v7;
}

- (void)replaceDocumentState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TITypologyRecordKeyboardInput keyboardState](self, "keyboardState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDocumentState:", v4);

}

- (TIKeyboardInput)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_storeStrong((id *)&self->_input, a3);
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setKeyboardState:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardState, a3);
}

- (TIKeyboardOutput)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong((id *)&self->_output, a3);
}

- (TIKeyboardConfiguration)keyboardConfig
{
  return self->_keyboardConfig;
}

- (void)setKeyboardConfig:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardConfig, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
  objc_msgSend(a3, "visitRecordKeyboardInput:", self);
}

@end
