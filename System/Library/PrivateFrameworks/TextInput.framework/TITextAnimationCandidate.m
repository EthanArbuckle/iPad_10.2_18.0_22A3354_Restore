@implementation TITextAnimationCandidate

- (TITextAnimationCandidate)initWithCandidateWithCandidate:(id)a3 forInput:(id)a4 forTextEffectName:(id)a5
{
  id v9;
  TITextAnimationCandidate *v10;
  TITextAnimationCandidate *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TITextAnimationCandidate;
  v10 = -[TIKeyboardCandidateSingle initWithCandidate:forInput:](&v13, sel_initWithCandidate_forInput_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_textEffectName, a5);

  return v11;
}

- (unint64_t)candidateProperty
{
  return 4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TITextAnimationCandidate;
  v5 = -[TIKeyboardCandidateSingle copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_textEffectName, "copyWithZone:", a3);
    v7 = (void *)v5[28];
    v5[28] = v6;

  }
  return v5;
}

- (TITextAnimationCandidate)initWithCoder:(id)a3
{
  id v4;
  TITextAnimationCandidate *v5;
  uint64_t v6;
  NSString *textEffectName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TITextAnimationCandidate;
  v5 = -[TIKeyboardCandidateSingle initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textEffectName"));
    v6 = objc_claimAutoreleasedReturnValue();
    textEffectName = v5->_textEffectName;
    v5->_textEffectName = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *textEffectName;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TITextAnimationCandidate;
  -[TIKeyboardCandidateSingle encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  textEffectName = self->_textEffectName;
  if (textEffectName)
    objc_msgSend(v4, "encodeObject:forKey:", textEffectName, CFSTR("textEffectName"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *textEffectName;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (textEffectName = self->_textEffectName,
        objc_msgSend(v4, "textEffectName"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(textEffectName) = -[NSString isEqualToString:](textEffectName, "isEqualToString:", v6),
        v6,
        (_DWORD)textEffectName))
  {
    v9.receiver = self;
    v9.super_class = (Class)TITextAnimationCandidate;
    v7 = -[TIKeyboardCandidate isEqual:](&v9, sel_isEqual_, v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (TITextAnimationCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4;
  TITextAnimationCandidate *v5;
  void *v6;
  uint64_t v7;
  NSString *textEffectName;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TITextAnimationCandidate;
  v5 = -[TIKeyboardCandidateSingle initWithCandidateResultSetCoder:](&v10, sel_initWithCandidateResultSetCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    textEffectName = v5->_textEffectName;
    v5->_textEffectName = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TITextAnimationCandidate;
  v4 = a3;
  -[TIKeyboardCandidateSingle encodeWithCandidateResultSetCoder:](&v6, sel_encodeWithCandidateResultSetCoder_, v4);
  -[TITextAnimationCandidate textEffectName](self, "textEffectName", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeString:", v5);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TIKeyboardCandidateSingle candidate](self, "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardCandidateSingle input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITextAnimationCandidate textEffectName](self, "textEffectName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<TITextAnimationCandidate: candidate %@, input %@, textEffectName %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)textEffectName
{
  return self->_textEffectName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEffectName, 0);
}

+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4 forTextEffectName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCandidateWithCandidate:forInput:forTextEffectName:", v10, v9, v8);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int)type
{
  return 9;
}

@end
