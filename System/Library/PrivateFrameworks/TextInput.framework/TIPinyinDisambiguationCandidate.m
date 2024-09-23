@implementation TIPinyinDisambiguationCandidate

- (TIPinyinDisambiguationCandidate)initWithPinyinSyllable:(id)a3
{
  id v4;
  TIPinyinDisambiguationCandidate *v5;
  uint64_t v6;
  NSString *label;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIPinyinDisambiguationCandidate;
  v5 = -[TIKeyboardCandidateSingle initWithCandidate:forInput:](&v9, sel_initWithCandidate_forInput_, &stru_1E243B990, &stru_1E243B990);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TIPinyinDisambiguationCandidate;
  v5 = -[TIKeyboardCandidateSingle copyWithZone:](&v10, sel_copyWithZone_);
  if (v5)
  {
    -[TIPinyinDisambiguationCandidate label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = (void *)v5[29];
    v5[29] = v7;

    *((_BYTE *)v5 + 224) = self->_generatedByChoosePinyin;
  }
  return v5;
}

- (TIPinyinDisambiguationCandidate)initWithCoder:(id)a3
{
  id v4;
  TIPinyinDisambiguationCandidate *v5;
  void *v6;
  uint64_t v7;
  NSString *label;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIPinyinDisambiguationCandidate;
  v5 = -[TIKeyboardCandidateSingle initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v7;

    v5->_generatedByChoosePinyin = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("generatedByChoosePinyin"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *label;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TIPinyinDisambiguationCandidate;
  -[TIKeyboardCandidateSingle encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  label = self->_label;
  if (label)
    objc_msgSend(v4, "encodeObject:forKey:", label, CFSTR("label"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_generatedByChoosePinyin, CFSTR("generatedByChoosePinyin"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  int v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[TIPinyinDisambiguationCandidate label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      v8 = -[TIPinyinDisambiguationCandidate isGeneratedByChoosePinyin](self, "isGeneratedByChoosePinyin");
      v9 = v8 ^ objc_msgSend(v5, "isGeneratedByChoosePinyin") ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TIPinyinDisambiguationCandidate label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (TIPinyinDisambiguationCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4;
  TIPinyinDisambiguationCandidate *v5;
  void *v6;
  uint64_t v7;
  NSString *label;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIPinyinDisambiguationCandidate;
  v5 = -[TIKeyboardCandidateSingle initWithCandidateResultSetCoder:](&v10, sel_initWithCandidateResultSetCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIPinyinDisambiguationCandidate;
  v4 = a3;
  -[TIKeyboardCandidateSingle encodeWithCandidateResultSetCoder:](&v6, sel_encodeWithCandidateResultSetCoder_, v4);
  -[TIPinyinDisambiguationCandidate label](self, "label", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeString:", v5);

}

- (id)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)isGeneratedByChoosePinyin
{
  return self->_generatedByChoosePinyin;
}

- (void)setGeneratedByChoosePinyin:(BOOL)a3
{
  self->_generatedByChoosePinyin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)candidateWithPinyinSyllable:(id)a3
{
  id v3;
  TIPinyinDisambiguationCandidate *v4;

  v3 = a3;
  v4 = -[TIPinyinDisambiguationCandidate initWithPinyinSyllable:]([TIPinyinDisambiguationCandidate alloc], "initWithPinyinSyllable:", v3);

  return v4;
}

+ (int)type
{
  return 3;
}

@end
