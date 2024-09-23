@implementation TUITypedStringCandidate

+ (id)typedStringCandidateWithLocale:(id)a3 candidateString:(id)a4 inputString:(id)a5 rawInputString:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCandidate:forInput:rawInput:", v12, v11, v10);

  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0C99810]);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = CFSTR("“");
  if (v15)
    v17 = (__CFString *)v15;
  v18 = v17;

  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0C99818]);
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v20 = CFSTR("”");
  if (v19)
    v20 = v19;
  v21 = v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v18, v12, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setDisplayLabel:", v22);
  return v14;
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (void)setDisplayLabel:(id)a3
{
  objc_storeStrong((id *)&self->_displayLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLabel, 0);
}

@end
