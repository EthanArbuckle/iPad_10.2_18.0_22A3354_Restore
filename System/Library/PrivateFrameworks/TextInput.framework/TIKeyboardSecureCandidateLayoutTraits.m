@implementation TIKeyboardSecureCandidateLayoutTraits

- (id)copyWithZone:(_NSZone *)a3
{
  TIKeyboardSecureCandidateLayoutTraits *v5;
  TIKeyboardSecureCandidateLayoutTraits *v6;
  TIKeyboardSecureCandidateTextTraits *v7;
  TIKeyboardSecureCandidateTextTraits *headerTraitsInOnlyLine;
  TIKeyboardSecureCandidateTextTraits *v9;
  TIKeyboardSecureCandidateTextTraits *headerTraitsInFirstLine;
  TIKeyboardSecureCandidateTextTraits *v11;
  TIKeyboardSecureCandidateTextTraits *inputTraitsInOnlyLine;
  TIKeyboardSecureCandidateTextTraits *v13;
  TIKeyboardSecureCandidateTextTraits *inputTraitsInFirstAndSecondLines;
  TIKeyboardSecureCandidateTextTraits *v15;
  TIKeyboardSecureCandidateTextTraits *inputTraitsInSecondLine;

  v5 = objc_alloc_init(TIKeyboardSecureCandidateLayoutTraits);
  v6 = v5;
  if (v5)
  {
    v5->_forceSingleLineLayout = self->_forceSingleLineLayout;
    v5->_headerInliningBehavior = self->_headerInliningBehavior;
    v7 = -[TIKeyboardSecureCandidateTextTraits copyWithZone:](self->_headerTraitsInOnlyLine, "copyWithZone:", a3);
    headerTraitsInOnlyLine = v6->_headerTraitsInOnlyLine;
    v6->_headerTraitsInOnlyLine = v7;

    v9 = -[TIKeyboardSecureCandidateTextTraits copyWithZone:](self->_headerTraitsInFirstLine, "copyWithZone:", a3);
    headerTraitsInFirstLine = v6->_headerTraitsInFirstLine;
    v6->_headerTraitsInFirstLine = v9;

    v11 = -[TIKeyboardSecureCandidateTextTraits copyWithZone:](self->_inputTraitsInOnlyLine, "copyWithZone:", a3);
    inputTraitsInOnlyLine = v6->_inputTraitsInOnlyLine;
    v6->_inputTraitsInOnlyLine = v11;

    v13 = -[TIKeyboardSecureCandidateTextTraits copyWithZone:](self->_inputTraitsInFirstAndSecondLines, "copyWithZone:", a3);
    inputTraitsInFirstAndSecondLines = v6->_inputTraitsInFirstAndSecondLines;
    v6->_inputTraitsInFirstAndSecondLines = v13;

    v15 = -[TIKeyboardSecureCandidateTextTraits copyWithZone:](self->_inputTraitsInSecondLine, "copyWithZone:", a3);
    inputTraitsInSecondLine = v6->_inputTraitsInSecondLine;
    v6->_inputTraitsInSecondLine = v15;

  }
  return v6;
}

- (TIKeyboardSecureCandidateLayoutTraits)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardSecureCandidateLayoutTraits *v5;
  uint64_t v6;
  uint64_t v7;
  TIKeyboardSecureCandidateTextTraits *headerTraitsInOnlyLine;
  uint64_t v9;
  TIKeyboardSecureCandidateTextTraits *headerTraitsInFirstLine;
  uint64_t v11;
  TIKeyboardSecureCandidateTextTraits *inputTraitsInOnlyLine;
  uint64_t v13;
  TIKeyboardSecureCandidateTextTraits *inputTraitsInFirstAndSecondLines;
  uint64_t v15;
  TIKeyboardSecureCandidateTextTraits *inputTraitsInSecondLine;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TIKeyboardSecureCandidateLayoutTraits;
  v5 = -[TIKeyboardSecureCandidateLayoutTraits init](&v18, sel_init);
  if (v5)
  {
    v5->_forceSingleLineLayout = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceSingleLineLayout"));
    v5->_headerInliningBehavior = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("headerInliningBehavior"));
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("headerTraitsInOnlyLine"));
    v7 = objc_claimAutoreleasedReturnValue();
    headerTraitsInOnlyLine = v5->_headerTraitsInOnlyLine;
    v5->_headerTraitsInOnlyLine = (TIKeyboardSecureCandidateTextTraits *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("headerTraitsInFirstLine"));
    v9 = objc_claimAutoreleasedReturnValue();
    headerTraitsInFirstLine = v5->_headerTraitsInFirstLine;
    v5->_headerTraitsInFirstLine = (TIKeyboardSecureCandidateTextTraits *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("inputTraitsInOnlyLine"));
    v11 = objc_claimAutoreleasedReturnValue();
    inputTraitsInOnlyLine = v5->_inputTraitsInOnlyLine;
    v5->_inputTraitsInOnlyLine = (TIKeyboardSecureCandidateTextTraits *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("inputTraitsInFirstAndSecondLines"));
    v13 = objc_claimAutoreleasedReturnValue();
    inputTraitsInFirstAndSecondLines = v5->_inputTraitsInFirstAndSecondLines;
    v5->_inputTraitsInFirstAndSecondLines = (TIKeyboardSecureCandidateTextTraits *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("inputTraitsInSecondLine"));
    v15 = objc_claimAutoreleasedReturnValue();
    inputTraitsInSecondLine = v5->_inputTraitsInSecondLine;
    v5->_inputTraitsInSecondLine = (TIKeyboardSecureCandidateTextTraits *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  TIKeyboardSecureCandidateTextTraits *headerTraitsInOnlyLine;
  TIKeyboardSecureCandidateTextTraits *headerTraitsInFirstLine;
  TIKeyboardSecureCandidateTextTraits *inputTraitsInOnlyLine;
  void *v7;
  TIKeyboardSecureCandidateTextTraits *inputTraitsInFirstAndSecondLines;
  TIKeyboardSecureCandidateTextTraits *inputTraitsInSecondLine;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeBool:forKey:", self->_forceSingleLineLayout, CFSTR("forceSingleLineLayout"));
  objc_msgSend(v10, "encodeInt32:forKey:", self->_headerInliningBehavior, CFSTR("headerInliningBehavior"));
  headerTraitsInOnlyLine = self->_headerTraitsInOnlyLine;
  if (headerTraitsInOnlyLine)
    objc_msgSend(v10, "encodeObject:forKey:", headerTraitsInOnlyLine, CFSTR("headerTraitsInOnlyLine"));
  headerTraitsInFirstLine = self->_headerTraitsInFirstLine;
  if (headerTraitsInFirstLine)
    objc_msgSend(v10, "encodeObject:forKey:", headerTraitsInFirstLine, CFSTR("headerTraitsInFirstLine"));
  inputTraitsInOnlyLine = self->_inputTraitsInOnlyLine;
  v7 = v10;
  if (inputTraitsInOnlyLine)
  {
    objc_msgSend(v10, "encodeObject:forKey:", inputTraitsInOnlyLine, CFSTR("inputTraitsInOnlyLine"));
    v7 = v10;
  }
  inputTraitsInFirstAndSecondLines = self->_inputTraitsInFirstAndSecondLines;
  if (inputTraitsInFirstAndSecondLines)
  {
    objc_msgSend(v10, "encodeObject:forKey:", inputTraitsInFirstAndSecondLines, CFSTR("inputTraitsInFirstAndSecondLines"));
    v7 = v10;
  }
  inputTraitsInSecondLine = self->_inputTraitsInSecondLine;
  if (inputTraitsInSecondLine)
  {
    objc_msgSend(v10, "encodeObject:forKey:", inputTraitsInSecondLine, CFSTR("inputTraitsInSecondLine"));
    v7 = v10;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  unsigned int v6;
  __CFString *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v4 = v3;
  if (self->_forceSingleLineLayout)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("; forceSingleLineLayout = %@"), v5);
  v6 = self->_headerInliningBehavior - 1;
  if (v6 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i [unknown enum value]"), self->_headerInliningBehavior);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E243B240[v6];
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("; headerInliningBehavior = %@"), v7);
  if (self->_headerTraitsInOnlyLine)
    objc_msgSend(v4, "appendFormat:", CFSTR("; headerTraitsInOnlyLine = %@"), self->_headerTraitsInOnlyLine);
  if (self->_headerTraitsInFirstLine)
    objc_msgSend(v4, "appendFormat:", CFSTR("; headerTraitsInFirstLine = %@"), self->_headerTraitsInFirstLine);
  if (self->_inputTraitsInOnlyLine)
    objc_msgSend(v4, "appendFormat:", CFSTR("; inputTraitsInOnlyLine = %@"), self->_inputTraitsInOnlyLine);
  if (self->_inputTraitsInFirstAndSecondLines)
    objc_msgSend(v4, "appendFormat:", CFSTR("; inputTraitsInFirstAndSecondLine = %@"),
      self->_inputTraitsInFirstAndSecondLines);
  if (self->_inputTraitsInSecondLine)
    objc_msgSend(v4, "appendFormat:", CFSTR("; inputTraitsInSecondLine = %@"), self->_inputTraitsInSecondLine);
  objc_msgSend(v4, "appendString:", CFSTR(">"));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  unsigned int v7;
  BOOL v8;
  unint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[TIKeyboardSecureCandidateLayoutTraits forceSingleLineLayout](self, "forceSingleLineLayout");
    if (v6 == objc_msgSend(v5, "forceSingleLineLayout")
      && (v7 = -[TIKeyboardSecureCandidateLayoutTraits headerInliningBehavior](self, "headerInliningBehavior"),
          v7 == objc_msgSend(v5, "headerInliningBehavior")))
    {
      v8 = 0;
      v9 = 0;
      v14 = sel_headerTraitsInOnlyLine;
      v15 = sel_headerTraitsInFirstLine;
      v16 = sel_inputTraitsInOnlyLine;
      v17 = sel_inputTraitsInFirstAndSecondLines;
      v18 = sel_inputTraitsInSecondLine;
      while (1)
      {
        v10 = (&v14)[v9];
        objc_msgSend(self, v10, v14, v15, v16, v17, v18, v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 != v12 && !objc_msgSend(v11, "isEqual:", v12))
          break;

        v8 = v9++ > 3;
        if (v9 == 5)
        {
          v8 = 1;
          goto LABEL_11;
        }
      }

    }
    else
    {
      v8 = 0;
    }
LABEL_11:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)forceSingleLineLayout
{
  return self->_forceSingleLineLayout;
}

- (void)setForceSingleLineLayout:(BOOL)a3
{
  self->_forceSingleLineLayout = a3;
}

- (unsigned)headerInliningBehavior
{
  return self->_headerInliningBehavior;
}

- (void)setHeaderInliningBehavior:(unsigned int)a3
{
  self->_headerInliningBehavior = a3;
}

- (TIKeyboardSecureCandidateTextTraits)headerTraitsInOnlyLine
{
  return self->_headerTraitsInOnlyLine;
}

- (void)setHeaderTraitsInOnlyLine:(id)a3
{
  objc_storeStrong((id *)&self->_headerTraitsInOnlyLine, a3);
}

- (TIKeyboardSecureCandidateTextTraits)headerTraitsInFirstLine
{
  return self->_headerTraitsInFirstLine;
}

- (void)setHeaderTraitsInFirstLine:(id)a3
{
  objc_storeStrong((id *)&self->_headerTraitsInFirstLine, a3);
}

- (TIKeyboardSecureCandidateTextTraits)inputTraitsInOnlyLine
{
  return self->_inputTraitsInOnlyLine;
}

- (void)setInputTraitsInOnlyLine:(id)a3
{
  objc_storeStrong((id *)&self->_inputTraitsInOnlyLine, a3);
}

- (TIKeyboardSecureCandidateTextTraits)inputTraitsInFirstAndSecondLines
{
  return self->_inputTraitsInFirstAndSecondLines;
}

- (void)setInputTraitsInFirstAndSecondLines:(id)a3
{
  objc_storeStrong((id *)&self->_inputTraitsInFirstAndSecondLines, a3);
}

- (TIKeyboardSecureCandidateTextTraits)inputTraitsInSecondLine
{
  return self->_inputTraitsInSecondLine;
}

- (void)setInputTraitsInSecondLine:(id)a3
{
  objc_storeStrong((id *)&self->_inputTraitsInSecondLine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputTraitsInSecondLine, 0);
  objc_storeStrong((id *)&self->_inputTraitsInFirstAndSecondLines, 0);
  objc_storeStrong((id *)&self->_inputTraitsInOnlyLine, 0);
  objc_storeStrong((id *)&self->_headerTraitsInFirstLine, 0);
  objc_storeStrong((id *)&self->_headerTraitsInOnlyLine, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
