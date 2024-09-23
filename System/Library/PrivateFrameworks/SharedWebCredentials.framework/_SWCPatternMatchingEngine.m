@implementation _SWCPatternMatchingEngine

+ (id)new
{
  abort();
}

- (_SWCPatternMatchingEngine)init
{
  abort();
}

- (_SWCPatternMatchingEngine)initWithPatternDictionaries:(id)a3
{
  return -[_SWCPatternMatchingEngine initWithPatternDictionaries:substitutionVariables:](self, "initWithPatternDictionaries:substitutionVariables:", a3, 0);
}

- (_SWCPatternMatchingEngine)initWithPatternDictionaries:(id)a3 substitutionVariables:(id)a4
{
  id v6;
  id v7;
  _SWCPatternMatchingEngine *v8;
  void *v9;
  uint64_t v10;
  _SWCPatternList *patternList;
  void *v12;
  uint64_t v13;
  _SWCSubstitutionVariableList *subVarList;
  objc_super v16;
  const __CFString *v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_SWCPatternMatchingEngine;
  v8 = -[_SWCPatternMatchingEngine init](&v16, sel_init);
  if (v8)
  {
    v19 = CFSTR("components");
    v20[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_SWCPatternList patternListWithDetailsDictionary:](_SWCPatternList, "patternListWithDetailsDictionary:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    patternList = v8->_patternList;
    v8->_patternList = (_SWCPatternList *)v10;

    if (v7)
    {
      v17 = CFSTR("substitutionVariables");
      v18 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[_SWCSubstitutionVariableList substitutionVariableListWithDictionary:](_SWCSubstitutionVariableList, "substitutionVariableListWithDictionary:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      subVarList = v8->_subVarList;
      v8->_subVarList = (_SWCSubstitutionVariableList *)v13;

    }
  }

  return v8;
}

- (id)_evaluateURLComponents:(id)a3 auditToken:(id *)a4
{
  id v6;
  id v7;
  _SWCPatternMatchingResult *v8;
  uint64_t v10;

  v6 = a3;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  v7 = -[_SWCPatternList evaluateWithURLComponents:substitutionVariables:auditToken:matchingPattern:index:](self->_patternList, "evaluateWithURLComponents:substitutionVariables:auditToken:matchingPattern:index:", v6, self->_subVarList, a4, 0, &v10);
  if (v7)
  {
    v8 = [_SWCPatternMatchingResult alloc];
    v7 = -[_SWCPatternMatchingResult _initWithIndex:excluded:](v8, "_initWithIndex:excluded:", v10, v7 == (id)100);
  }

  return v7;
}

- (id)evaluateURLComponents:(id)a3
{
  -[_SWCPatternMatchingEngine _evaluateURLComponents:auditToken:](self, "_evaluateURLComponents:auditToken:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)evaluateURLComponents:(id)a3 auditToken:(id *)a4
{
  -[_SWCPatternMatchingEngine _evaluateURLComponents:auditToken:](self, "_evaluateURLComponents:auditToken:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subVarList, 0);
  objc_storeStrong((id *)&self->_patternList, 0);
}

@end
